//
//  Restaurant.swift
//  FoodPin
//
//  Created by Simon Ng on 19/8/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

import Foundation
import CoreData

class Restaurantz:NSManagedObject {
    @NSManaged var name : String!
    @NSManaged var type : String!
    @NSManaged var location : String!
    @NSManaged var isVisies : NSNumber!
    @NSManaged var image:NSData!
    
    
    init(name:String, type:String, location:String, image:String, isVisited:Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}