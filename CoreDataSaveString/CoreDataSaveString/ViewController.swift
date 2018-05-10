//
//  ViewController.swift
//  CoreDataSaveString
//
//  Created by Vu Ngoc Cong on 5/2/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var inputTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let person = try? AppDelegate.context.fetch(Person.fetchRequest()) as? [Person] {
            inputTextField.text = person?.last?.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextField.resignFirstResponder()
        return true
    }
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        let context = Person(context: AppDelegate.context)
        context.name = inputTextField.text
        AppDelegate.saveContext()
    }
    

}

