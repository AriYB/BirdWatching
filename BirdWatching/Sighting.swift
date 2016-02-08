//
//  Sighting.swift
//  BirdWatching
//
//  Created by Ari Budiono on 2/6/16.
//  Copyright © 2016 Self. All rights reserved.
//

import Foundation
import CoreData

class Sighting: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    
    @NSManaged var date: NSDate?
    @NSManaged var location: String?
    @NSManaged var birdType: String?
    
    
}
