//
//  DetailViewController.swift
//  DemoFetchResultControllerCoreData
//
//  Created by Vu Ngoc Cong on 5/7/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate {
    
    var person: Person?
    var chooseAge: Int?
    var arrayAge: [Int] = [Int](0...100)
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        configurePerson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

    @IBAction func selectPhoto(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let masterController = segue.destination as? MasterTableViewController {
            let context = masterController.fetchedResults.managedObjectContext
            if masterController.tableView.indexPathForSelectedRow == nil {
                person = Person(context: context)
            }
            person?.name = nameTextField.text
            person?.age = Int32(arrayAge[agePicker.selectedRow(inComponent: 0)])
            person?.photo = imageView.image
            DataServices.shared.saveContext()
        }
    }
    
    func configurePerson() {
        if let choosePerson = person {
            nameTextField.text = choosePerson.name
            agePicker.selectRow(Int(choosePerson.age), inComponent: 0, animated: true)
            imageView.image = choosePerson.photo as? UIImage
        }
    }
    
}

extension DetailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayAge.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        nameTextField.resignFirstResponder()
        return String(arrayAge[row])
    }
}








