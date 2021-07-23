//
//  CodeTeamsApp.swift
//  CodeTeams
//
//  Created by Ahmed Gaber on 7/21/21.
//

import SwiftUI

@main
struct CodeTeamsApp: App {
    @StateObject private var team = Team()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(team)
        }
    }
}
