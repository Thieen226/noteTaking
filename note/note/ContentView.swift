//
//  ContentView.swift
//  note
//
//  Created by StudentAM on 3/25/24.
//

import SwiftUI

struct Note: Hashable{
    var title : String
    var content : String
}
struct ContentView: View {
    @State private var notes : [Note] = []
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(notes, id: \.self){note in
                        NavigationLink(destination: DetailedNoteView(notes: note), label: {
                            VStack(alignment: .leading){
                                Text(note.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                Text(note.content)
                            }
                            
                        })
                    }
                }
                NavigationLink(destination: NewNoteView(notes: $notes), label: {
                    Text("Add Note")
                        .padding(.top, 30)
                        .frame(maxWidth: .infinity, maxHeight: 70, alignment: .center)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .background(Color.blue)
                        
                })
                
            }
           
            .navigationTitle("Notes")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
