//
//  ViewController.swift
//  CoreDataSaveNumber
//
//  Created by Vu Ngoc Cong on 5/2/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var numberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let number = try? AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] {
            numberTextField.text = "\(number!.last!.number)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        numberTextField.resignFirstResponder()
        return true
    }
    @IBAction func saveCoreData(_ sender: UIBarButtonItem) {
        let context = Entity(context: AppDelegate.context)
        guard let editNumber = toInt(from: numberTextField.text) else { return }
        context.number  = Int32(Int(editNumber))
        AppDelegate.saveContext()
    }
    
    func toInt(from string: String?) -> Int?{
        if string != nil && string != "" {
            return Int(string!)
        }else{
            return nil
        }
    }

}
//// convert String to Int
//extension String {
//    var toInt: Int? {
//        get {
//            return self != "" ? Int(self) : nil
//        }
//    }
//}

