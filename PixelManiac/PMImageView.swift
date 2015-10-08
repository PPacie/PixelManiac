//
//  PMImageView.swift
//  PixelManiac
//
//  Created by Pablo Surfate on 10/8/15.
//  Copyright © 2015 Pablo Paciello. All rights reserved.
//

import UIKit
import GPUImage

class PMImageView: UIImageView {
    
    // MARK: Constants 
    private struct Constants {
        static let CIFilterName = "CIPixellate"
        static let PixelScaleKey = 10
    }
    
    // MARK: Core Image Filter Variables
    private var currentImage: UIImage!
    private let contextFilter: CIContext? = CIContext(options:nil)
    private let currentFilter = CIFilter(name: Constants.CIFilterName)
    
    func applyPixelManiacFilter() {
        guard self.image != nil else { return }
        currentImage = self.image
        
        let beginImage = CIImage(image: currentImage)
        
        currentFilter?.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter?.setValue(Constants.PixelScaleKey, forKey: kCIInputScaleKey)
        
        guard let newCGImage = contextFilter?.createCGImage(currentFilter!.outputImage!, fromRect: currentFilter!.outputImage!.extent) else { return }
        
        let newImage = UIImage(CGImage: newCGImage)
        
        //Apply filter to imageView
        self.image = newImage
    }

}
