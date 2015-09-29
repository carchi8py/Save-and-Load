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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

