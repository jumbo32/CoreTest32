//
//  ContentView.swift
//  CoreADBMarch22
//
//  Created by A Bridge on 3/6/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var sortDescriptors = [SortDescriptor<Singer>]()
    @State private var sortme: SortOrder = .reverse
    
    var body: some View {
        VStack {
            FilteredList(sortDescriptors: sortDescriptors) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            
            Button("SortIt") {
                toggleSortOrder()
                sortDescriptors = [SortDescriptor(\.firstName, order: sortme )]
                
            }
            
            Button("Sort A-Z") {
                sortDescriptors = [SortDescriptor(\.firstName)]
            }
            
            Button("Sort Z-A") {
                sortDescriptors = [SortDescriptor(\.firstName, order: .reverse)]
            }
            
            Button("Sort Reset") {
                sortDescriptors = [SortDescriptor<Singer>]()
                print("toggleSortOrder: Sort Reset")
            }
        }
    }
    
    private func toggleSortOrder() {
        sortme = (sortme == .reverse ? .forward : .reverse)
        print("toggleSortOrder: order = \(sortme)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
