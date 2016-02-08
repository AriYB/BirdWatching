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

    // In a storyboard-based application, you will often want to zdo a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "saveBirdDetail" {
            //Save the contents of the text field into Core Data to be placed in the Master Table View.
            saveContents(birdTypeField.text!, location: locationField.text!)
        }
        // Pass the selected object to the new view controller.
    }
    
    // MARK: Functions
    
    func saveContents(birdType: String, location: String) {
        // 1. Create a managedObject to save it
        let bird = Sighting(entity: coreDataWrapper.entity, insertIntoManagedObjectContext: coreDataWrapper.managedObjectContext)
        
        // 2. Assign values
        bird.birdType = birdType
        bird.location = location
       // bird.date = NSDate()
        
        // 3. Save it to CoreData
        coreDataWrapper.save()
        
        // 4. Append it to the array of the managedObject
        Events.append(bird)
        
    }
    


}
