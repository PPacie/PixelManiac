//
//  PMImageView.swift
//  PixelManiac
//
//  Created by Pablo Surfate on 10/8/15.
//  Copyright © 2015 Pablo Paciello. All rights reserved.
//

import UIKit

class PMImageView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    // MARK: Core Image Filter Variables
    var currentImage: UIImage!
    var context: CIContext!
    var currentFilter: CIFilter!

}
