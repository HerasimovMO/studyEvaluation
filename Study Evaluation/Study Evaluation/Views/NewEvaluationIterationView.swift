//
//  NewEvaluationIterationView.swift
//  Study Evaluation
//
//  Created by Mykhailo Herasimov on 2020-03-07.
//  Copyright © 2020 Mykhailo Herasimov. All rights reserved.
//

import SwiftUI

struct NewEvaluationIterationView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var iteration: String = String()
    
    var body: some View {
        GeometryReader { metric in
            VStack(spacing: 16) {
                TextField("Enter iteration name", text: self.$iteration)
                Button(action: {
                    let newIteration = IterationEvaluation(context: self.managedObjectContext)
                    newIteration.name = self.iteration
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print(error)
                    }

                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Submit")
                }.padding()
                 .foregroundColor(.white)
                 .background(Color.blue)
                 .cornerRadius(5)
                 
            }.frame(width: metric.size.width * 0.8)
        }
    }
}

struct NewEvaluationIterationView_Previews: PreviewProvider {
    static var previews: some View {
        NewEvaluationIterationView()
    }
}
