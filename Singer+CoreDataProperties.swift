//
//  Singer+CoreDataProperties.swift
//  CoreADBMarch22DF
//
//  Created by A Bridge on 3/6/22.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?
    
    var wrappedFirstName: String {
        firstName ?? "Unknown"
    }
    
    var wrappedLasstName: String {
        lastName ?? "Unknown"
    }

}

extension Singer : Identifiable {

}
