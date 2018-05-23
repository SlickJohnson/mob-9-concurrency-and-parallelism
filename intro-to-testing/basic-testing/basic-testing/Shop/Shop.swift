//
//  Shop.swift
//  basic-testing
//
//  Created by Eliel Gordon on 5/23/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation

protocol ShopType {
  associatedtype Merchandise
  var products: [Merchandise] {get set}
  var cart: Cart {get set}

  func checkout()
}

enum CouponCode {
  case basic(discount: Int)
  case silver(discount: Int)
  case gold(discount: Int)
}

protocol Cartable {
  associatedtype Item
  var taxPercent: Int {get set}
  var discountPercent: Int {get set}
  var couponCode: CouponCode {get set}

  func checkout()
  // Total line items without tax and coupon
  func subTotal() -> Double
  // Total line items with tax minus discount
  func total() -> Double
  func add(items: Item...)
  func numberOfItems() -> Int
  func addCoupon(code: CouponCode) -> Bool
}

struct LineItem {
  var id: Int
  var quantity: Int
  var price: Double
  var name: String

  func total() -> Double {
    return price * Double(quantity)
  }
}

struct Product {
  var id: Int
  var name: String
  var price: Double
}

// TODO: Fill in implementation
struct Cart {
  var items: [LineItem]
  var isEmpty: Bool {
    return items.isEmpty
  }
  
  init(_ items: [LineItem]) {
    self.items = items
  }

  init() {
    self.items = []
  }
}
struct Shop {
  var products: [Product]
}

