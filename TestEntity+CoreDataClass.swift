//
//  TestEntity+CoreDataClass.swift
//  CoreDataTest
//
//  Created by Alvaro Santiesteban on 9/17/17.
//  Copyright © 2017 3vts. All rights reserved.
//

import Foundation
import CoreData

@objc(TestEntity)
public class TestEntity: NSManagedObject {
    
    convenience init(title: String, subtitle: String, image: NSData, context: NSManagedObjectContext) {
        if let entity = NSEntityDescription.entity(forEntityName: "TestEntity", in: context) {
            self.init(entity: entity, insertInto: context)
            self.title = title
            self.subtitle = subtitle
            self.image = image
        } else {
            fatalError("Unable to find Entity name!")
        }
    }

}
