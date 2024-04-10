//
//  DetailedNoteView.swift
//  note
//
//  Created by StudentAM on 3/25/24.
//

import SwiftUI

struct DetailedNoteView: View {
    var notes : Note
    var body: some View {
        NavigationView{
            VStack{
                Text(notes.content)
                    .multilineTextAlignment(.leading)
                Spacer()
                    
            }
            .padding()
            .frame(maxWidth: 360, maxHeight: 650, alignment: .leading)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            
            .navigationTitle(notes.title)
        }
    }
}

#Preview {
    DetailedNoteView(notes: Note(title: "HI", content: "Dkjds"))
}
