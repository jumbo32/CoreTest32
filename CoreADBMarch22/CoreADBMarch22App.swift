//
//  CoreADBMarch22App.swift
//  CoreADBMarch22
//
//  Created by A Bridge on 3/6/22.
//

import SwiftUI

@main
struct CoreADBMarch22App: App {
    @StateObject private var dataControler = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataControler.container.viewContext)
        }
    }
}
