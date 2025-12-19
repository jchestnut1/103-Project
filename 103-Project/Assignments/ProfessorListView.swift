//
//  ProfessorListView.swift
//  103-Project
//
//  Created by Jay Chestnut on 12/19/25.
//

import SwiftUI

struct ProfessorListView: View {
    @State private var professors: [Professor] = [
        Professor(name: "James", lastName: "Johnson", phone: "813-444-5555"),
        Professor(name: "Caleb", lastName: "Williams", phone: "813-555-6666")
    ]
    @State private var newName: String = ""
    @State private var newLastName: String = ""
    @State private var newPhone: String = ""
    
    var body: some View {
        VStack{
            Text("🎓 Professors")
                .font(.largeTitle)
            
            List(professors) { professor in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(professor.name) \(professor.lastName)")
                            .font(.headline)
                        Text(professor.phone)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }//End of VStack
                    Spacer()
                }//End of HStack
                .padding(.vertical, 4)
            }//End of List
            
            // Inputs and button
            VStack(spacing: 12){
                TextField("First Name", text: $newName)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                TextField("Last Name", text: $newLastName)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                TextField("Phone Number", text: $newPhone)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius:12)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                Button(action: {
                    let trimmedFirst = newName.trimmingCharacters(in: .whitespacesAndNewlines)
                    let trimmedLast = newLastName.trimmingCharacters(in: .whitespacesAndNewlines)
                    let trimmedPhone = newPhone.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !trimmedFirst.isEmpty, !trimmedLast.isEmpty, !trimmedPhone.isEmpty else { return }
                    
                    professors.append(
                        Professor(name: trimmedFirst, lastName: trimmedLast, phone: trimmedPhone)
                    )
                    
                    // Clear inputs
                    newName = ""
                    newLastName = ""
                    newPhone = ""
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Professor")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(12)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }//End of parent VStack
    }//End of Body View
}

#Preview {
    ProfessorListView()
}
