//
//  ContentView.swift
//  Study Evaluation
//
//  Created by Mykhailo Herasimov on 2020-03-07.
//  Copyright © 2020 Mykhailo Herasimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            EvaluationIterationView().tabItem {
                Image(systemName: "pencil.and.outline")
                Text("Evaluation")
            }
            ApplicationsView().tabItem {
                Image(systemName: "app.fill")
                Text("Applications")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
