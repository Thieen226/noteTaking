//
//  ContentView.swift
//  note
//
//  Created by StudentAM on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                NavigationLink(destination: NewNoteView(), label: {
                    Text("Add Task")
                        .background(.blue)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 30))
                })
            }
            .navigationTitle("Notes")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
