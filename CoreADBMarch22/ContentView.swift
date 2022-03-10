//
//  ContentView.swift
//  CoreADBMarch22
//
//  Created by A Bridge on 3/6/22.
//
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [])
    private var items: FetchedResults<Singer>
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                NavigationLink(destination: AddItemView())
                {
                    Text("New Item")
                }
                }
                
               // Divider()
                Section {
                NavigationLink(destination: ShowItemsView())
                {
                    Text("Show \(items.count) Items")
                    //Text("Show \(moc.Singer.count)")
                    Text("Show Items")                }
                }
            }.navigationBarTitle("StuffCost")
            //.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
