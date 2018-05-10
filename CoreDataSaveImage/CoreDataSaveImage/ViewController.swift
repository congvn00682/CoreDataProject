//
//  ViewController.swift
//  CoreDataSaveImage
//
//  Created by Vu Ngoc Cong on 5/2/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let avatar = try? AppDelegate.context.fetch(Avatar.fetchRequest()) as? [Avatar] {
            imageView.image = avatar?.last?.avatar as! UIImage
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveImage(_ sender: UIBarButtonItem) {
        imageView.image = #imageLiteral(resourceName: "NT")
        let context = Avatar(context: AppDelegate.context)
        context.avatar = imageView.image
        AppDelegate.saveContext()
    }
    

}

