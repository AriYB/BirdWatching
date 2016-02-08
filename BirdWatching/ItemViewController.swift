//
//  ItemViewController.swift
//  BirdWatching
//
//  Created by Ari Budiono on 2/7/16.
//  Copyright © 2016 Self. All rights reserved.
//

import UIKit
import CoreData

class ItemViewController: UIViewController {

    @IBOutlet weak var birdTypeField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    
   // var birdname:BirdInfo?
    
    let entityName = "Event"
    
    
    var coreDataWrapper = CoreDataWrapper(entityName: "Event")
    var Events = [Sighting]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "saveBirdDetail" {
            saveContents(birdTypeField.text!, location: locationField.text!)
        }
        // Pass the selected object to the new view controller.
    }
    
    func saveContents(birdType: String, location: String) {
        // 1. Create a managedObject to save it
        let bird = Sighting(entity: coreDataWrapper.entity, insertIntoManagedObjectContext: coreDataWrapper.managedObjectContext)
        
        // 2. Assign values
        bird.birdType = birdType
        
        // 3. Save it to CoreData
        coreDataWrapper.save()
        
        // 4. Append it to the array of the managedObject
        Events.append(bird)
        
        // 1. Create a managedObject to save it
        let geo = Sighting(entity: coreDataWrapper.entity, insertIntoManagedObjectContext: coreDataWrapper.managedObjectContext)
        
        // 2. Assign values
        geo.location = location
        
        // 3. Save it to CoreData
        coreDataWrapper.save()
    }
    

    


}
