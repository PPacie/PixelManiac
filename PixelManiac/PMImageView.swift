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
        static let PixelScaleKey = 5
    }
    
    // MARK: Core Image Filter Variables
    private let contextFilter: CIContext? = CIContext(options:nil)
    private let currentFilter = CIFilter(name: Constants.CIFilterName)
    
    func applyPixelManiacFilter() {
        guard self.image != nil else { return }
        
        // Apply GPUImage Filter (Cartoon)
        let inputImage = self.image
        
        let cartoonFilter = GPUImageToonFilter()
        cartoonFilter.threshold = 0.3
        
        let outputImage = cartoonFilter.imageByFilteringImage(inputImage)
        
        // Apply Core Image Filter (Pixellate)
        guard let currentImage = outputImage else { return }
        
        let beginImage = CIImage(image: currentImage)
        
        currentFilter?.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter?.setValue(Constants.PixelScaleKey, forKey: kCIInputScaleKey)
        
        guard let newCGImage = contextFilter?.createCGImage(currentFilter!.outputImage!, fromRect: currentFilter!.outputImage!.extent) else { return }
        
        let newImage = UIImage(CGImage: newCGImage)
        
        // Update PMImageView with the filtered image.
        self.image = newImage
    }

}
