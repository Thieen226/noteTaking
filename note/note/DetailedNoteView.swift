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
        VStack{
            Text(notes.content)
            Spacer()  //let the Text takes all the space vertically
        }
        .navigationTitle(notes.title)
        
        .padding()
        .frame(maxWidth: 360, maxHeight: 650, alignment: .leading)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

#Preview {
    DetailedNoteView(notes: Note(title: "", content: ""))
}
