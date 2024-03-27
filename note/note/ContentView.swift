//
//  ContentView.swift
//  note
//
//  Created by StudentAM on 3/25/24.
//

import SwiftUI

struct Note{
    var title : String
    var content : String
}
struct ContentView: View {
    @State private var notes : [Note] = []
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                NavigationLink(destination: NewNoteView(notes: $notes), label: {
                    Text("Add Task")
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
