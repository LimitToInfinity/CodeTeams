//
//  TeammateRow.swift
//  CodeTeams
//
//  Created by Ahmed Gaber on 7/22/21.
//

import SwiftUI

struct TeammateRow: View {
    var teammate: Teammate
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if teammate.team.lowercased() == "red" {
                    Text(teammate.name)
                        .foregroundColor(.red)
                } else {
                    Text(teammate.name)
                        .foregroundColor(.green)
                }
                
                Text(String(teammate.number))
                Text(teammate.team)
            }
            .padding([.top, .bottom])
        }
        
        Spacer()
        
        Image(systemName: "person.crop.rectangle")
            .resizable()
            .frame(width: 45, height: 35)
            .padding(.trailing, 20)
            
    }
}

struct TeammateRow_Previews: PreviewProvider {
    static let team = Team()
    
    static var previews: some View {
        TeammateRow(teammate: team.teammates[0])
            .environmentObject(team)
    }
}
