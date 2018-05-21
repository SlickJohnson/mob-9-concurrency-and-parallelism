//
//  ViewController.swift
//  GCDAsyncImage
//
//  Created by Chase Wang on 2/23/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let numberOfCells = 20_000

  let imageURLArray = Unsplash.defaultImageURLs

  // MARK: - VC Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfCells
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageTableViewCell

    let url = imageURLArray[indexPath.row % imageURLArray.count]
    var data: Data = Data()
    let operationQueue = OperationQueue()
    var image: UIImage = UIImage()
    let downloadOperation = BlockOperation {
      data = try! Data(contentsOf: url)
    }
    let updateUIOperation = BlockOperation {
      image = UIImage(data: data)!
      DispatchQueue.main.async {
        if cell.pictureImageView.image == nil {
          cell.pictureImageView.image = image
        }
      }
    }
    updateUIOperation.addDependency(downloadOperation)
    operationQueue.addOperations([downloadOperation, updateUIOperation], waitUntilFinished: false)
    // TODO: add sepia filter to image
    //        let inputImage = CIImage(data: UIImagePNGRepresentation(image!)!)
    //        let filter = CIFilter(name: "CISepiaTone")!
    //        filter.setValue(inputImage, forKey: kCIInputImageKey)
    //        filter.setValue(0.8, forKey: kCIInputIntensityKey)
    //        let outputCIImage = filter.outputImage
    //        let imageWithFilter = UIImage(ciImage: outputCIImage!)

    return cell
  }
}
