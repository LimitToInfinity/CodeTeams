//
//  TeammateDetail.swift
//  CodeTeams
//
//  Created by Ahmed Gaber on 7/22/21.
//

import SwiftUI

struct TeammateDetail: View {
    var teammate: Teammate
    
    var body: some View {
        if teammate.team.lowercased() == "red" {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, .red]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    VStack {
                        Text(teammate.name)
                            .foregroundColor(.red)
                            .font(.largeTitle)
                            .fontWeight(.medium)
                        Text(String(teammate.number))
                            .foregroundColor(.white)
                            .font(.title)
                        Text(teammate.team)
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    
                    Spacer()
                }
            }
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.black, .green]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    VStack {
                        Text(teammate.name)
                            .foregroundColor(.green)
                            .font(.largeTitle)
                            .fontWeight(.medium)
                        Text(String(teammate.number))
                            .foregroundColor(.white)
                            .font(.title)
                        Text(teammate.team)
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct TeammateDetail_Previews: PreviewProvider {
    static let team = Team()
    
    static var previews: some View {
        TeammateDetail(teammate: team.teammates[0])
            .environmentObject(team)
    }
}
