//
//  TodoList1App.swift
//  TodoList1
//
//  Created by Ujjwal Arora on 21/08/24.
//

import SwiftUI

@main
struct TodoList1App: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}
