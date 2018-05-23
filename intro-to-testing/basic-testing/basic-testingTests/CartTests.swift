//
//  ShopTests.swift
//  basic-testingTests
//
//  Created by Eliel Gordon on 5/23/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import XCTest
@testable import basic_testing

class CartTests: XCTestCase {
  var cart: Cart!

  override func setUp() {
    super.setUp()

    cart = Cart()
  }

  override func tearDown() {
    super.tearDown()
  }

  // Test creating empty shopping cart.
  func testCreateEmptyShoppingCartHasNoItems() {
    XCTAssertTrue(cart.isEmpty)
  }

  // Test Creating line items have the correct total from price and quantity.
  func testLineItemTotal() {
    var lineItems = [LineItem]()
    // Create items to test.
    for id in 0...5 {
      lineItems.append(LineItem(id: id, quantity: id, price: Double(id), name: "\(id)"))
    }
    // Test totals
    for (id, item) in lineItems.enumerated() {
      let price = Double(id)
      let quantity = id
      let total = price * Double(quantity)

      XCTAssertEqual(item.total(), total)
    }
  }

  // TODO:
  // Test Adding items to cart works
  // Test that the number of items in cart equal the number of line items inserted
  func testCartAddingItemsToCart() {

  }

  // TODO: Create line items and tests that total is equal to the number of lineitems multiplied by their respective quantities
  func testCartTotalWithItems() {

  }

  // TODO: Test cart total will be equal to line items * quantity + tax - coupon code
  func testCartTotalWithCouponAndTax() {

  }

  // TODO: Test cart total will be equal to line items * quantity + tax
  func testCartTotalWithJustTax() {

  }
}
