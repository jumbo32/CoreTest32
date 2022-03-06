//
//  FilteredList.swift
//  CoreADBMarch22DF
//
//  Created by A Bridge on 3/6/22.
//

import SwiftUI

struct FilteredList: View {
    
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    
    var body: some View {
        List(fetchRequest, id: \.self) {singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLasstName)")
        }
    }
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}
