//
//  AssociatedWarp.swift
//  LopWiftExample
//
//  Created by GinVan on 16/3/22.
//  Copyright © 2016年 antinomy. All rights reserved.
//

import UIKit

/// A container class make Associated support weak point
class WeakContainerClass: NSObject {
  
  weak var object: AnyObject?
  
  convenience init?(aObject: AnyObject?) {
    
    if aObject == nil {
      return nil
    }
    
    self.init()
    self.object = aObject
  }
}

/// A NSValue operation make Associated support optional value
public final class Associated<T>: NSObject, NSCopying {
  public typealias `Type` = T
  public let value: Type
  
  public init(_ value: Type) { self.value = value }
  
  public func copy(with zone: NSZone?) -> Any {
    return type(of: self).init(value)
  }
}

extension Associated where T: NSCopying {
  public func copyWithZone(_ zone: NSZone?) -> AnyObject {
    return type(of: self).init(value.copy(with: zone) as! Type)
  }
}
