//
//  ContentView.swift
//  toDoList
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var task = 0 // count the task
    @State var action = "" // the user input
    @State private var empty = false // check if user types in anything
    @State var input : [String] = [] // an array to store user input
    var body: some View {
        NavigationView {
            VStack {
                Text("Number of tasks: \(task)") // show the number of tasks
                    .frame(maxWidth: .infinity, alignment: .leading) // expand the invisible box and move the text to the left
                    .padding() // create some space
                TextField("Enter a new task", text: $action) // create input field
                    .textFieldStyle(.roundedBorder) // style the box field
                    .padding() // create space
                HStack {
                    Button("Add Task", action: addTask) // create a button and add action
                        .padding() // create space
                        .background(action.isEmpty ? .gray : .blue) // if the user hasn't typed in anything, the button is gray. If yes, button becomes blue
                        .foregroundColor(.white) // the text on the button is white
                        .cornerRadius(10) // round off the corner
                        .alert("You can't add an empty task!", isPresented: $empty){ // add an alert and work if user press add task without type in anything
                            Button("OK", role: .cancel){} // user press OK then keep typing for task
                        }
                    Button("Remove All Tasks", action: removeAll) // button for remove all task
                        .padding() // create space
                        .background(input.isEmpty ? .gray : .blue) // if there isn't any task yet, the button is gray. If yes, button becomes blue
                        .foregroundColor(.white) // the text on the button is white
                        .cornerRadius(10) // round off the corner
                        .disabled(input.isEmpty) // if there isn't any task yet, user can't press the removeAll button
                }
                List { // create a list
                    ForEach(input, id: \.self) { // for each input and treat each item as unique
                        item in Text(item) // create a text for each item
                    }
                    .onDelete(perform: removeItem) // to delete one time
                }
                Spacer() // move the whole VStack up on top
            }
            .navigationTitle("To-Do List") // create a title
        }
    }
    func addTask(){ // function for adding task
        if action.isEmpty { // if the user hasn't typed in anything and press add task
            empty = true // empty will become true for aler to work
        } else { // else
            input.append(action) // add the task to the input array
            task += 1 // add 1 task
            action = "" // reset the text field back
        }
    }
    func removeItem(offset: IndexSet){ // function for removing task
        input.remove(atOffsets: offset) // remove an item in the input array
        task -= 1 // minus 1 task
    }
    func removeAll(){ // function for adding task
        input.removeAll() // remove all the data in the input array
        task = 0 // reset the task to 0
    }
}

#Preview {
    ContentView()
}
