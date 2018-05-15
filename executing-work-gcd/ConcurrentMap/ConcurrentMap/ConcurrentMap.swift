//
//  ConcurrentMap.swift
//  ConcurrentMap
//
//  Created by Willie Johnson on 5/14/18.
//  Copyright © 2018 Willie Johnson. All rights reserved.
//

import Foundation

extension Array {
  func parallelMap<T>(_ transform: (Element) -> T)  -> [T?] {
    // Concurrently perform operations of map
    var resultArray = Array<T?>.init(repeating: nil, count: self.count)
    DispatchQueue.concurrentPerform(iterations: self.count) { (i: Int) in
      resultArray[i] = transform(self[i])
    }
    return resultArray
  }
}

