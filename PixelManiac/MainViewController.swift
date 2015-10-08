//
//  MainViewController.swift
//  PixelManiac
//
//  Created by Pablo Surfate on 10/8/15.
//  Copyright © 2015 Pablo Paciello. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var applyFilterButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addImage(sender: UIBarButtonItem) {
    }
    
    @IBAction func applyFilter() {
    }

}

extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
}