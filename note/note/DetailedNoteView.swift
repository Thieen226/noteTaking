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
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .background(Color.gray.ignoresSafeArea())
                    .multilineTextAlignment(.leading)
            }
            .navigationTitle(notes.title)
        }
    }
}

#Preview {
    DetailedNoteView(notes: Note(title: "HI", content: "D"))
}
