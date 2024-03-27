//
//  NewNoteView.swift
//  note
//
//  Created by StudentAM on 3/25/24.
//

import SwiftUI

struct NewNoteView: View {
    @State var title : String = ""
    @State var note : String = ""
    @State var showToast : Bool = false
    @Binding var notes : [Note]
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                TextField("Title", text: $title)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                
                TextEditor(text: $note)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                
                NavigationLink(destination: ContentView(), label: {
                    Button(action: {
                        if title.isEmpty && notes.isEmpty{
                            showToast = true
                        }
                    }, label: {
                        Text("Add Task")
                            .frame(maxWidth: 100, maxHeight: 50)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(8)
                            .padding()
                    })
                })
            }
//            DetailedNoteView(titleNote: title, detailNotes: notes)
            .padding()
            .navigationTitle("Notes")
            .alert(isPresented: $showToast){
                Alert(
                    title: Text("No task has added"),
                    message: Text("Please enter a task")
                )
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NewNoteView(notes: .constant([]))
}
