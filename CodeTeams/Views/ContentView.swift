//
//  ContentView.swift
//  CodeTeams
//
//  Created by Ahmed Gaber on 7/21/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TeamList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Team())
    }
}
