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
    
    @IBOutlet weak var imageView: UIImageView!
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
            let result = saveImage(image!, path: imagePath)
            println("saveImage: \(result)")
            
            var loadedImage = loadImageFromPath(imagePath)
            if loadedImage != nil {
                println("Image Loaded: \(loadedImage!)")
            }
            imageView.image = loadedImage
        }
        let textPath = fileInDocumentsDirectory("help.txt")
        let status = saveText("Save Me!", path: textPath)
        println("Saved text: \(status)")
        
        //Text loading and Saving
        
        let loadedText = loadTextFromPath(textPath)
        if loadedText != nil {
            println("Loaded Text: \(loadedText)")
        }
        
    }
    
    //Save text
    func saveText(text: String, path: String) -> Bool {
        var error: NSError? = nil
        
        let status = text.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding, error: &error)
        if !status {
            println("Error saving file at path: \(path) with error: \(error?.localizedDescription)")
        }
        return status
    }
    
    //load Text
    func loadTextFromPath(path: String) -> String? {
        var error: NSError? = nil
        let text = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: &error)
        if text == nil {
            println("Error loading text from path \(path) error: \(error)")
        }
        
        return text
    }
    
    func loadImageFromPath(path: String) -> UIImage? {
        let image = UIImage(contentsOfFile: path)
        if image == nil {
            println("Missing Image at path: \(path)")
        }
        return image
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

