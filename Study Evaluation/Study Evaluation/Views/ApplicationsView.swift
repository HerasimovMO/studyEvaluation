//
//  ApplicationsView.swift
//  Study Evaluation
//
//  Created by Mykhailo Herasimov on 2020-03-07.
//  Copyright © 2020 Mykhailo Herasimov. All rights reserved.
//

import SwiftUI

struct ApplicationsView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Application.getAllApplications()) var applications: FetchedResults<Application>
    
    @State private var showNewApplication: Bool = false
    
    var body: some View {
        NavigationView {
            List(applications) { app in
                Text(app.name)
            }
            .navigationBarTitle("Applications")
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.showNewApplication = true
                    }) {
                        Image(systemName: "plus")
                    }.sheet(isPresented: self.$showNewApplication) {
                        NewApplicationView().environment(\.managedObjectContext, self.managedObjectContext)
                    }
                })
        }
    }
}

struct ApplicationsView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationsView()
    }
}
