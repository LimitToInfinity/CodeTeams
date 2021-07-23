//
//  TeamList.swift
//  CodeTeams
//
//  Created by Ahmed Gaber on 7/22/21.
//

import SwiftUI

struct TeamList: View {
    @EnvironmentObject var team: Team
    @State private var showAddTeammate = false

    var body: some View {
        NavigationView {
            VStack {
                Button("Add teammate") {
                    self.showAddTeammate.toggle()
                }
                    .font(.title2)
                    .sheet(isPresented: $showAddTeammate) {
                        AddTeammateForm(showModal: $showAddTeammate, wholeTeam: team)
                    }
                
                List {
                    ForEach(team.teammates, id: \.name) { teammate in
                        NavigationLink(destination: TeammateDetail(teammate: teammate)) {
                            TeammateRow(teammate: teammate)
                        }
                    }
                }
                    .border(Color.blue, width: 3)
                    .padding(1)
            }
            .navigationBarTitle("Teams")
        }
    }
}

struct TeamList_Previews: PreviewProvider {
    static var previews: some View {
        TeamList()
            .environmentObject(Team())
    }
}
