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
    @State var noteAdded : Bool = false
    @Binding var notes : [Note]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                TextField("Title", text: $title)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                
                TextEditor(text: $content)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                
                NavigationLink(destination: ContentView(), label: {
                    Text("Add Note")
                        .frame(maxWidth: 100, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .padding()
                        .onTapGesture {
                            createNote()
                        }
                    })

            }
            .padding()
            .navigationTitle("Notes")
            .alert(isPresented: $showToast){
                Alert(
                    title: Text("No note has added"),
                    message: Text("Please enter a title or content")
                )
            }
        }
        .navigationBarBackButtonHidden(false)
    }
    
    func createNote(){
        if title.isEmpty || content.isEmpty{
            showToast = true
        }
        else{
            print("HI")
            showToast = false
            let newNote = Note(title: title, content: content)
            notes.append(newNote)   
            presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    NewNoteView(notes: .constant([]))
}
