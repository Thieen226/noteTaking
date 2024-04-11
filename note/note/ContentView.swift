//
//  ContentView.swift
//  note
//
//  Created by StudentAM on 3/25/24.
//

import SwiftUI

//create variables
struct Note: Hashable{ //using Hashable to pass elements in the struct as normal elements
    var title : String
    var content : String
}

struct ContentView: View {
    @State private var notes : [Note] = []  //declare an array of type array Note
    
    var body: some View {
        NavigationView{
            VStack{
                List{ //using List to display different added notes
                    ForEach(notes, id: \.self){note in
                        
                        NavigationLink(destination: DetailedNoteView(notes: note), label: { //when click to the added note, it will navigate to detailed note page
                            VStack(alignment: .leading){ //align text to the left
                                Text(note.title) //access the title from the note
                                    .fontWeight(.bold)
                                Text(note.content) //access the content from the note
                            }
                            
                        })
                    }
                }
                NavigationLink(destination: NewNoteView(notes: $notes), label: { //when Add Note is clicked, it navigates to new note page
                    Text("Add Note")
                        .padding(.top, 30)
                        .frame(maxWidth: .infinity, maxHeight: 70, alignment: .center)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .background(Color.blue)
                        
                })
                
            }
            .navigationTitle("Notes") //name the navigation bar titleT
        }
    }
}

#Preview {
    ContentView()
}
