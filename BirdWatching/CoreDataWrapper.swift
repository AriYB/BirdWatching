//
//  CodeDataWrapper.swift
//
//  Created by Jaerock Kwon on 2/4/16.
//  Copyright © 2016 Jaerock Kwon. All rights reserved.
//

import UIKit
import CoreData

class CoreDataWrapper: NSObject {
    var appDelegate: AppDelegate
    var managedObjectContext: NSManagedObjectContext
    var entity: NSEntityDescription
    var entityName: String
    
    init(entityName: String) {
        self.appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.managedObjectContext = appDelegate.managedObjectContext
        self.entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext: managedObjectContext)!
        self.entityName = entityName
    }
    
    func save() {
        do {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func fetch() -> AnyObject? {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        
        do {
            let results = try managedObjectContext.executeFetchRequest(fetchRequest)
            return results
        } catch let error as NSError  {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return nil
    }
}