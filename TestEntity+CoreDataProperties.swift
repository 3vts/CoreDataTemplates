//
//  TestEntity+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Alvaro Santiesteban on 9/17/17.
//  Copyright © 2017 3vts. All rights reserved.
//

import Foundation
import CoreData


extension TestEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TestEntity> {
        return NSFetchRequest<TestEntity>(entityName: "TestEntity")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: NSData?
    @NSManaged public var subtitle: String?

}
