//
//  ShowItemsView.swift
//  CoreTest32
//
//  Created by A Bridge on 3/9/22.
//

import SwiftUI

struct ShowItemsView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var sortDescriptors = [SortDescriptor<Singer>]()
    @State private var sortme: SortOrder = .reverse
    
    var body: some View {
        VStack {

            HStack {
            Button("First") {
                toggleSortOrder()
                sortDescriptors = [SortDescriptor(\.firstName, order: sortme )]
            }.modifier(CellFormatLight())
            Button("Last") {
                toggleSortOrder()
                sortDescriptors = [SortDescriptor(\.lastName, order: sortme )]
                
            }.modifier(CellFormatLight())
                
            }.padding(10)

                FilteredList(sortDescriptors: sortDescriptors) { (singer: Singer) in
                        
                    //Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
                    NavigationLink(destination: EditItemView(singer: singer)) {
            
            HStack {
                Text(singer.firstName ?? "nil").modifier(CellFormatLight())
                Text(singer.lastName ?? "nil").modifier(CellFormatLight())
            }
                    
                }.listStyle(PlainListStyle())
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
