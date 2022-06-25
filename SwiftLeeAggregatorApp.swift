//
//  SwiftLeeAggregatorApp.swift
//  SwiftLeeAggregator
//
//  Created by Peter van den Hamer on 04/06/2022.
//

import SwiftUI

@main
struct SwiftLeeAggregatorApp: App {
    // https://www.hackingwithswift.com/quick-start/swiftui/how-to-configure-core-data-to-work-with-swiftui

    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    @State var searchText: String = ""

    var body: some Scene {
        WindowGroup {
            PostListView(testString: nil /*PostListView_Previews.hardcodedJsonString*/,
                         predicate: NSPredicate.all,
                         searchText: $searchText)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save() // when app moves to background
        }
    }
}
