//
//  CoreDataManager.swift
//  SkillCoreData
//
//  Created by adeveloper on 21.05.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import UIKit
import CoreData


protocol CoreDataAnyModel {
    static var modelAnyType: NSManagedObject.Type { get }
    func setupAny(model: NSManagedObject)
}

protocol CoreDataModel: CoreDataAnyModel {
    associatedtype ModelType: NSManagedObject
    func setup(model: ModelType)
}



class CoreDataManager {
    static var shared: CoreDataManager {
        return CoreDataManager()
    }
    
    var container: NSPersistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer as NSPersistentContainer
    
    lazy var context: NSManagedObjectContext = {
        [unowned self] in
        return self.container.viewContext
        }()
    
}



