//
//  Application.swift
//  Study Evaluation
//
//  Created by Mykhailo Herasimov on 2020-03-07.
//  Copyright © 2020 Mykhailo Herasimov. All rights reserved.
//

import CoreData

public class Application: NSManagedObject, Identifiable {
    
    @NSManaged public var name: String
    @NSManaged public var category: String?
}

extension Application {
    static func getAllApplications() -> NSFetchRequest<Application> {
        let request = Application.fetchRequest() as! NSFetchRequest<Application>
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
