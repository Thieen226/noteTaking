//
//  NewNoteView.swift
//  note
//
//  Created by StudentAM on 3/25/24.
//

import SwiftUI

struct NewNoteView: View {
    @State var title : String = ""
    @State var content : String = ""
    @State var showToast : Bool = false
    @Binding var notes : [Note] //create @Binding to modify the title and notes in the array notes from ContentView
    @Environment(\.presentationMode) var presentationMode //@Environment allows you to control the presentation mode of the current view
    
    var body: some View {
        VStack{
            TextField("Title", text: $title) //TextField will grab the text that user put
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                
            TextEditor(text: $content) //TextEditor will grab the content that user put
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                
                
            NavigationLink(destination: ContentView(), label: {
                Text("Add Note") //when the Add Note is clicked, it will navigate to ContentView
                    .frame(maxWidth: 100, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
                    .padding()
                    .onTapGesture { //when it is clicked, do the following
                        createNote()
                    }
            })
        }
            .navigationTitle("Notes")
            .padding()
            
            .alert(isPresented: $showToast){ //show toast alert
                Alert(
                    title: Text("No note has added"),
                    message: Text("Please enter a title or content")
                )
            }
    }
    
    func createNote(){
        if title.isEmpty || content.isEmpty{ //if the tile or content is empty
            showToast = true //change showToast to true and display an alert
        }
        else{
            showToast = false
            let newNote = Note(title: title, content: content) //create new variable that holds the title and content that user put
            notes.append(newNote) //append newNote to notes array
            presentationMode.wrappedValue.dismiss() //dismisses the current view
        }
    }
}

#Preview {
    NewNoteView(notes: .constant([]))
}
