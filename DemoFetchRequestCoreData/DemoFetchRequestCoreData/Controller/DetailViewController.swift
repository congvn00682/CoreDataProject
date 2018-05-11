//
//  DetailViewController.swift
//  DemoFetchRequestCoreData
//
//  Created by Vu Ngoc Cong on 5/4/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    
    var index: Int?
    var arrayAgePicker: Array = [Int](1...99)
    var dataPicker: Int?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet weak var photoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        addressTextField.delegate = self
        agePicker.selectRow(17, inComponent: 0, animated: true)
        var person = DataServices.shared.persons
        if index != nil {
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // show Picker data
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayAgePicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        nameTextField.resignFirstResponder()
        addressTextField.resignFirstResponder()
        return String(arrayAgePicker[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dataPicker = arrayAgePicker[row]
    }

    // select image
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoView.image = selectImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageView(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        addressTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // turn off textField
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        addressTextField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let context = Person(context: AppDelegate.context)
        context.namePerson = nameTextField.text
        context.addressPerson = addressTextField.text
        if dataPicker != nil {
            context.agePerson = Int32(dataPicker!)
        }
        context.imagePerson = photoView.image
        DataServices.shared.saveData()
    }
    
    

}
