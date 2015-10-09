//
//  MainViewController.swift
//  PixelManiac
//
//  Created by Pablo Surfate on 10/8/15.
//  Copyright © 2015 Pablo Paciello. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var imageView: PMImageView!
    @IBOutlet weak var applyFilterButton: UIButton!
        
    @IBAction func addImage(sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func applyFilter() {
        imageView.applyPixelManiacFilter()
        //Deactivate Apply Filter Button
        applyFilterButton.enabled = false
    }

}

extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: UIImagePicker Delegates
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        var newImage: UIImage?
        
        newImage = info["UIImagePickerControllerEditedImage"] as? UIImage
        
        if newImage == nil {
            newImage = info["UIImagePickerControllerOriginalImage"] as? UIImage
        }
        
        //Assign Picker image to imageView
        imageView.image = newImage
        //Activate ApplyFilter Button
        applyFilterButton.enabled = true
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}