//
//  AddTeammateForm.swift
//  CodeTeams
//
//  Created by Ahmed Gaber on 7/21/21.
//

import SwiftUI

struct AddTeammateForm: View {
    @Binding var showModal: Bool
    @State private var showAlert = false
    var wholeTeam: Team
    
    @State private var name = ""
    @State private var number = ""
    @State private var team = ""
    
    var disableForm: Bool {
        name.isEmpty || number.isEmpty || team.isEmpty
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Number", text: $number)
                        .keyboardType(.numberPad)
                    TextField("Team", text: $team)
                }
                
                Section {
                    Button("Submit", action: {
                        if let userNumber = Int(number) {
                            let newTeammate = Teammate(
                                name: name,
                                number: userNumber,
                                team: team
                            )
                            wholeTeam.add(teammate: newTeammate)
                            self.showModal.toggle()
                        } else {
                            showAlert.toggle()
                        }
                    })
                        .disabled(disableForm)
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Number"), message: Text("must be a number"), dismissButton: .default(Text("ok")))
                        }
                }
                
                Section {
                    Button("Dismiss") {
                        self.showModal.toggle()
                    }
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct AddTeammateForm_Previews: PreviewProvider {
    static var previews: some View {
        AddTeammateForm(
            showModal: .constant(true),
            wholeTeam: Team()
        )
    }
}
