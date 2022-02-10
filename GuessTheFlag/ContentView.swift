//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Garret Poole on 2/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            //changes based on user settings (light, dark)
            //Color.primary
            //Color.secondary
            //Color(red: 1, green: 0.8, blue: 0)
                //.frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            VStack(spacing: 0){
                Color.red
                Color.blue
            }
            Text("Your Content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        //.ignoresSafeArea()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
