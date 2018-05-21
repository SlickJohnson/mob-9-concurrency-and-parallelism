//
//  ConcurrentMapTests.swift
//  ConcurrentMapTests
//
//  Created by Willie Johnson on 5/14/18.
//  Copyright © 2018 Willie Johnson. All rights reserved.
//

import XCTest
@testable import ConcurrentMap

class ConcurrentMapTests: XCTestCase {
  var arrayToMap: [Int]!
  var expectedResult: [Double]!
  override func setUp() {
    super.setUp()
    arrayToMap = {
      var ints = [Int]()
      for i in 1...10 {
        ints.append(i)
      }
      return ints
    }()
    expectedResult = {
      var doubles = [Double]()
      for i in 1...10 {
        doubles.append(Double(i) * 2.0)
      }
      return doubles
    }()
  }

  func testConcurrentMap() {
    let testResult = arrayToMap.parallelMap { (num) -> Double in
      return Double(num) * 2.0
    }
    XCTAssertEqual(testResult, expectedResult)
  }
}
