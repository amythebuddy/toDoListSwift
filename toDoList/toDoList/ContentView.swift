//
//  ContentView.swift
//  toDoList
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var task = 0
    @State var action = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Number of tasks: \(task)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                TextField("Enter a new task", text: $action)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                HStack {
                    if !action.isEmpty{
                        
                    }
                    Button("Add Task", action: addTask)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    Button("Remove All Tasks", action: removeAll)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .navigationTitle("To-Do List")
        }
    }
    @State var input = ""
    func addTask(){
        
    }
    func removeAll(){
        
    }
}

#Preview {
    ContentView()
}
