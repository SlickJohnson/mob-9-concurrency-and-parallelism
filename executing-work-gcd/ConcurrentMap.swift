extension Array {
  func parallelMap<T>(_ transform: (Element) -> T)  -> [T] {
    // Concurrently perform operations of map
    var resultArray = Array<Element?>.init(repeating: nil, count: self.count)
    DispatchQueue.concurrentPerform(iterations: self.count) { (i: Int) in
      let element = self[i]
      transform(element)
    }
  }
}
