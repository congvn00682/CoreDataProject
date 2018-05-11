//
//  DataServices.swift
//  DemoFetchRequestCoreData
//
//  Created by Vu Ngoc Cong on 5/4/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

class DataServices {
    
    static let shared: DataServices = DataServices()
    
    private var _persons: [Person]?
    
    var persons: [Person]{
        set {
            _persons = newValue
        }
        get {
            if _persons != nil {
                getDataFromCoreData()
            }
            return _persons ?? []
        }
    }
    
    func getDataFromCoreData() {
        _persons = try? AppDelegate.context.fetch(Person.fetchRequest())
    }
    
    func saveData() {
        AppDelegate.saveContext()
        getDataFromCoreData()
    }
    
    func removeData(from indexPath: IndexPath){
        if let object = _persons?[indexPath.row] {
            AppDelegate.context.delete(object)
            saveData()
        }
    }
}
