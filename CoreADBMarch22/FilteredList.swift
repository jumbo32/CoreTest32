//
//  FilteredList.swift
//  CoreADBMarch22DF
//
//  Created by A Bridge on 3/6/22.
//
import CoreData
import SwiftUI

//  Example of hard coded filter list
//struct FilteredList: View {
//    @FetchRequest var fetchRequest: FetchedResults<Singer>
//
//    var body: some View {
//        List(fetchRequest, id: \.self) {singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLasstName)")
//        }
//    }
//
//    init(filter: String) {
//        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
//    }
// Example of generic filter list <T>

enum FilterType: String {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS[c]"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    var body: some View {
        List {
//        List(fetchRequest, id: \.self) {item in
//            self.content(item)
        ForEach(fetchRequest, id: \.self) {item in
                self.content(item)
        }.onDelete(perform: zapIt)
    }
    }
    
//    init(type: FilterType = .contains, filterKey: String, filterValue: String,sortDescriptors: [SortDescriptor<T>] = [], @ViewBuilder content: @escaping (T) -> Content) {
//        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors,
//                predicate: NSPredicate(format: "%K \(type.rawValue) %@", filterKey, filterValue))
        
        init(sortDescriptors: [SortDescriptor<T>] = [], @ViewBuilder content: @escaping (T) -> Content) {
            _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors,
                    predicate: nil)
        
        self.content = content
    }
//    func zapIt(indexSet: IndexSet) {
//        items.remove(atOffsets: indexSet)
//        do {
//            try moc.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }
    
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
    
    
//    private func delete(offsets: IndexSet) {
//        withAnimation { offsets.map { fetchRequest.wrappedValue[$0] }.forEach(moc.delete)
//
//            do {
//                try moc.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}
