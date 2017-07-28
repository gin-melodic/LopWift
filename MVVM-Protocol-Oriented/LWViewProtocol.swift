//
//  LWViewProtocol.swift
//  LopWiftExample
//
//  Created by GinVan on 16/3/22.
//  Copyright © 2016年 antinomy. All rights reserved.
//

import UIKit
import ObjectiveC

/// This protocol discribe some basic property(stored & compute) and function in View layer
protocol LWViewProtocol {
  
  /// <Optional> A viewModel embed in view, may be lazy load
  var viewModel: LWViewModelProtocol? { get set }
  
}

private var viewModelStoreKey: UInt8 = 0

/// Protocol extension `AIBViewProtocol` when self is a UIViewController
extension LWViewProtocol where Self:UIViewController {
  
  var viewModel: LWViewModelProtocol? {
    get {
      return (objc_getAssociatedObject(self, &viewModelStoreKey) as? Associated<LWViewModelProtocol>).map {$0.value}
    }
    set {
      objc_setAssociatedObject(self, &viewModelStoreKey, newValue.map { Associated<LWViewModelProtocol>($0) } , objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
}
