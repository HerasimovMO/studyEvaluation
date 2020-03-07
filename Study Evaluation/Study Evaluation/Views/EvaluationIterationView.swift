//
//  EvaluationIterationView.swift
//  Study Evaluation
//
//  Created by Mykhailo Herasimov on 2020-03-07.
//  Copyright © 2020 Mykhailo Herasimov. All rights reserved.
//

import SwiftUI

struct EvaluationIterationView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: IterationEvaluation.getAllIteration()) var iterations: FetchedResults<IterationEvaluation>
    
    @State private var showNewIteration: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.iterations) { iteration in
                    NavigationLink(destination: CategoriesView()) {
                        Text(iteration.name)
                    }
                }
            }
            .navigationBarTitle("Evaluation Iteration")
            .navigationBarItems(trailing:
                    HStack {
                        Button(action: {
                            self.showNewIteration = true
                        }) {
                            Image(systemName: "plus")
                        }.sheet(isPresented: self.$showNewIteration) {
                            NewEvaluationIterationView().environment(\.managedObjectContext, self.managedObjectContext)
                        }
                    })
        }
    }
}

struct EvaluationIterationView_Previews: PreviewProvider {
    static var previews: some View {
        EvaluationIterationView()
    }
}
