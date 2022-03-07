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
 
struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    var body: some View {
        List(fetchRequest, id: \.self) {item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}
