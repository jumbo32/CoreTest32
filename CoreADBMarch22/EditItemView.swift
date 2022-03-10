//
//  EditItemView.swift
//  CoreTest32
//
//  Created by A Bridge on 3/10/22.
//

import SwiftUI

struct EditItemView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) private var presentationMode
    var singer: Singer
    init(singer: Singer) {
        self.singer = singer
        self._firstname = State(initialValue: singer.wrappedFirstName)
    }
    @State private var firstname = ""
    @State private var lastname = ""
    var body: some View {
        VStack {
        HStack(spacing: 10){
            VStack{
                Text("First Name").fontWeight(.bold)
                TextField("IFirst Name", text: $firstname).modifier(CellFormat())
            }
            VStack {
                Text("Last Name").fontWeight(.bold)
                TextField("Last Name", text: $lastname).modifier(CellFormat())
            }
        }
            
            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
                Text("Save")
            }
            
        }
    }
    
    private func addItem() {
        
    //    withAnimation {
        moc.delete(singer)
        let newItem = Singer(context: moc)
        newItem.firstName = firstname
        newItem.lastName = lastname
        if moc.hasChanges {
            do {
                try moc.save()
                presentationMode.wrappedValue.dismiss()
                
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
    //    }
    }
        
    }
}

//struct EditItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditItemView()
//    }
//}