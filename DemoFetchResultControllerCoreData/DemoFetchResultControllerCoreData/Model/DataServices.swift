//
//  DataServices.swift
//  DemoFetchResultControllerCoreData
//
//  Created by Vu Ngoc Cong on 5/7/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit
import CoreData

class DataServices {
    
    static let shared: DataServices = DataServices()
    
    var fetchedResultsController: NSFetchedResultsController<Person> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        fetchRequest.fetchBatchSize = 20
        
        let namePerson = NSSortDescriptor(key: "name", ascending: false)
        fetchRequest.sortDescriptors = [namePerson]
        
        
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: AppDelegate.context, sectionNameKeyPath: nil, cacheName: "Master")
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    private var _fetchedResultsController: NSFetchedResultsController<Person>?
    
    func saveContext() {
        guard let context = _fetchedResultsController?.managedObjectContext else { return }
        do {
            try context.save()
        } catch {
            
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}
