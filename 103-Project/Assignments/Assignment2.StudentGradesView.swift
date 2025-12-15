//
//  Assignment2.StudentGradesView.swift
//  103-Project
//
//  Created by Jay Chestnut on 12/15/25.
//

import SwiftUI

struct Assignment2_StudentGradesView: View {
    
    @State var studentAverages: [String:Double] = [
        "Jaylen Johnson" : 84.50,
        "Keith Smith" : 81.00,
        "Steph Curry" : 92.50
    ]
    
    // Separate inputs for new student
    @State private var newStudentName: String = ""
    @State private var newStudentGrade: String = ""
    @State private var showInvalidGradeAlert: Bool = false
    @State private var showEmptyNameAlert: Bool = false
    
    // Dynamically computed class average
    private var classAverage: Double {
        let values = Array(studentAverages.values)
        guard !values.isEmpty else { return 0 }
        let total = values.reduce(0, +)
        return total / Double(values.count)
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.blue.opacity(0.3)
                    .ignoresSafeArea()
                
                VStack{
                    Text("Student Grade Averages")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    
                    List {
                        ForEach(Array(studentAverages), id: \.key) { item in
                            // item is a (key: String, value: Double)
                            Text("\(item.key): \(item.value, specifier: "%.2f")")
                        }
                    } // End of List
                    
                    // Show dynamic class average
                    Text("Class Average: \(classAverage, specifier: "%.2f")")
                        .font(.headline)
                        .padding(.bottom, 8)
                    
                    VStack(spacing: 12) {
                        HStack {
                            TextField("Student name", text: $newStudentName)
                                .textInputAutocapitalization(.words)
                                .autocorrectionDisabled()
                                .padding(10)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(10)
                            
                            TextField("Grade (e.g. 88.5)", text: $newStudentGrade)
                                .keyboardType(.decimalPad)
                                .padding(10)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                        Button {
                            addStudent()
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("Add Student")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundStyle(Color.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                } // End VStack
            } // End ZStack
            .navigationBarTitle("Grades", displayMode: .inline)
            .toolbar {
                Menu {
                    // Sort by name (key)
                    Button("Sort by Name A → Z") {
                        sortByName(ascending: true)
                    }
                    Button("Sort by Name Z → A") {
                        sortByName(ascending: false)
                    }
                    
                    // Sort by grade (value)
                    Button("Sort by Grade Low → High") {
                        sortByGrade(ascending: true)
                    }
                    Button("Sort by Grade High → Low") {
                        sortByGrade(ascending: false)
                    }
                } label: {
                    Image(systemName: "arrow.up.arrow.down.circle")
                        .imageScale(.large)
                }
            }
        } // End NavigationView
        .alert("Invalid Grade", isPresented: $showInvalidGradeAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Please enter a valid numeric grade between 0 and 100.")
        }
        .alert("Missing Name", isPresented: $showEmptyNameAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Please enter a non-empty student name.")
        }
    }
    
    private func addStudent() {
        let name = newStudentName.trimmingCharacters(in: .whitespacesAndNewlines)
        let gradeText = newStudentGrade.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !name.isEmpty, let grade = Double(gradeText) else {
            // If input is bad, just do nothing (beginner-friendly).
            return
        }
        
        studentAverages[name] = grade
        
        // Clear inputs
        newStudentName = ""
        newStudentGrade = ""
    }
    
    // Sorting helpers rebuild the dictionary in the desired order
    private func sortByName(ascending: Bool) {
        let sorted = studentAverages.sorted { lhs, rhs in
            ascending ? lhs.key.localizedCaseInsensitiveCompare(rhs.key) == .orderedAscending
                      : lhs.key.localizedCaseInsensitiveCompare(rhs.key) == .orderedDescending
        }
        studentAverages = Dictionary(uniqueKeysWithValues: sorted)
    }
    
    private func sortByGrade(ascending: Bool) {
        let sorted = studentAverages.sorted { lhs, rhs in
            ascending ? lhs.value < rhs.value
                      : lhs.value > rhs.value
        }
        studentAverages = Dictionary(uniqueKeysWithValues: sorted)
    }
}

#Preview {
    Assignment2_StudentGradesView()
}
