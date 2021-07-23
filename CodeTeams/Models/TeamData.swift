//
//  TeamData.swift
//  CodeTeams
//
//  Created by Ahmed Gaber on 7/21/21.
//

import Foundation
import Combine

final class Team: ObservableObject {
    @Published var teammates = [Teammate]()
    
    init() {
        getTeammates(team: self)
    }
    
    func add(teammate: Teammate) {
        teammates.append(teammate)
    }
    
    func remove(teammate: Teammate) {
        if let index = teammates.firstIndex(of: teammate) {
            teammates.remove(at: index)
        }
    }
}

func getTeammates(team: Team) {
    let urlString = "https://763ftt2q4l.execute-api.us-east-2.amazonaws.com/getPlayers"
    guard let url = URL(string: urlString) else { return }

    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            let decoder = JSONDecoder()
            if let decodedResponse = try? decoder.decode([Teammate].self, from: data) {
                DispatchQueue.main.async {
                    team.teammates = decodedResponse
                }

                return
            }
        }

        print("Request failed \(error?.localizedDescription ?? "Unknown error")")
    }.resume()
}
