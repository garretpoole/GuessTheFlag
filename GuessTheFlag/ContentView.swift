//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Garret Poole on 2/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert"){
            showingAlert = true
        }
        .alert("Important", isPresented: $showingAlert){
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Please Read")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
