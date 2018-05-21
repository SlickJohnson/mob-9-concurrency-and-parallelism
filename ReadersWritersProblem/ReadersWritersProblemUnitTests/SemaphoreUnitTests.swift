//
//  SemaphoreUnitTests.swift
//  ReadersWritersProblem
//
//  Created by Chase Wang on 2/23/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import XCTest
@testable import ReadersWritersProblem

class SemaphoreUnitTests: XCTestCase {

  let iterations = 200_000

  var user: SUser!

  override func setUp() {
    super.setUp()
    user = SUser.current
  }

  func testSemaphoreReadersWritersProblem() {
    // solve with semaphores
    let expectation = self.expectation(description: "com.makeschool.expectation")
    let semaphore = DispatchSemaphore(value: 1)
    let dispatchGroup = DispatchGroup()
    for _ in 0..<self.iterations {
      DispatchQueue.global().async(group: dispatchGroup) {
        print("read: \(self.user.age)")
        semaphore.wait()
        self.user.age += 1
        DispatchQueue.main.async {
          semaphore.signal()
        }
      }
    }
    dispatchGroup.notify(queue: .main) {
      expectation.fulfill()
      XCTAssertEqual(self.iterations, self.user.age)
    }
    waitForExpectations(timeout: 15, handler: nil)
  }
}
