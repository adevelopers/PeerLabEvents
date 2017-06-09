//
//  Member+CoreDataProperties.swift
//  PeerLabEvents
//
//  Created by adeveloper on 09.06.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import Foundation
import CoreData


extension Member {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Member> {
        return NSFetchRequest<Member>(entityName: "Member")
    }

    @NSManaged public var dateCreate: NSDate?
    @NSManaged public var extId: Int64
    @NSManaged public var name: String
    @NSManaged public var position: String?
    @NSManaged public var companyName: String?

}
