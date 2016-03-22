//
//  LWViewModelProtocol.swift
//  LopWiftExample
//
//  Created by GinVan on 16/3/22.
//  Copyright © 2016年 antinomy. All rights reserved.
//

import UIKit

/// This protocol discribe some basic property(stored & compute) and function in ViewModel layer
protocol LWViewModelProtocol {
  
  /// <Optional, Weak> A ViewModel instant contain a weak point to self view
  weak var view: UIViewController? { get set }
}

private var viewStoreKey: UInt8 = 0

extension LWViewModelProtocol where Self:UIViewController {
  
  var view: UIViewController? {
    get {
      return (objc_getAssociatedObject(self, &viewStoreKey) as? WeakContainerClass)?.object as? UIViewController
    }
    set {
      objc_setAssociatedObject(self, &viewStoreKey, WeakContainerClass(aObject: newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
}

