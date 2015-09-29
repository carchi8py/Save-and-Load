//
//  ViewController.swift
//  Save and Load
//
//  Created by Chris Archibald on 9/28/15.
//  Copyright (c) 2015 Chris Archibald. All rights reserved.
//

import UIKit

//Documents Directory
func documentsDirectory() -> String {
    let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
    return documentsFolderPath
}

// File in Documents Directory
func fileInDocumentsDirectory(filename: String) -> String {
    return documentsDirectory().stringByAppendingPathComponent(filename)
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let documents = documentsDirectory()
        println("Documents: \(documents)")
        
        let imagePath = fileInDocumentsDirectory("Photo.jpg")
        println("PhotoPath:\(imagePath)")
        
        // Load image from Resouce Bundle (read only)
        var image = UIImage(named: "IMG_0344_10.jpg")
        if image != nil {
            // Save it to our documents folder
            println(image)
            saveImage(image!, path: imagePath)
        }
    }
    
    func saveImage(image: UIImage, path: String) -> Bool {
        let jpgImageData = UIImageJPEGRepresentation(image, 1.0)
        let result = jpgImageData.writeToFile(path, atomically: true)
        return result
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

