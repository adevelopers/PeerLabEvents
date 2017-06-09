//
//  Event+CoreDataProperties.swift
//  PeerLabEvents
//
//  Created by adeveloper on 09.06.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var extId: Int64
    @NSManaged public var isOpen: Bool
    @NSManaged public var dateStart: NSDate?
    @NSManaged public var title: String
    @NSManaged public var type: Int64

}
