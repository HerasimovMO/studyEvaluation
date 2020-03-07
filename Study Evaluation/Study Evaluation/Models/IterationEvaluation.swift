//
//  IterationEvaluation.swift
//  Study Evaluation
//
//  Created by Mykhailo Herasimov on 2020-03-07.
//  Copyright © 2020 Mykhailo Herasimov. All rights reserved.
//

import CoreData

public class IterationEvaluation: NSManagedObject, Identifiable {
    
    @NSManaged public var name: String
}

extension IterationEvaluation {
    static func getAllIteration() -> NSFetchRequest<IterationEvaluation> {
        let request = IterationEvaluation.fetchRequest() as! NSFetchRequest<IterationEvaluation>
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
