//
//  NewApplicationView.swift
//  Study Evaluation
//
//  Created by Mykhailo Herasimov on 2020-03-07.
//  Copyright © 2020 Mykhailo Herasimov. All rights reserved.
//

import SwiftUI

struct NewApplicationView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var appName: String = String()
    
    var body: some View {
        GeometryReader { metric in
            VStack(spacing: 16) {
                TextField("Enter app name", text: self.$appName)
                Button(action: {
                    let newApplication = Application(context: self.managedObjectContext)
                    newApplication.name = self.appName
                    
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

struct NewApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        NewApplicationView()
    }
}
