//
//  FilteredList.swift
//  CoreADBMarch22DF
//
//  Created by A Bridge on 3/6/22.
//
import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    var body: some View {
        List {
            ForEach(fetchRequest, id: \.self) {item in
                self.content(item)
            }.onDelete(perform: zapIt)
        }
    }
    init(sortDescriptors: [SortDescriptor<T>] = [], @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: nil)
        self.content = content
    }
    
    func zapIt(at offsets: IndexSet) {
        for index in offsets {
            let item = fetchRequest[index]
            moc.delete(item)
        }
        do {
            try moc.save()
        }
        catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not
            // use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")        }
    }
}
