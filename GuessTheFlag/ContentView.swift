//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Garret Poole on 2/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Button("Delete Selection", role: .destructive, action: executeDelete)
//
//        VStack{
//            Button("Button 1") {}
//            .buttonStyle(.bordered)
//            Button("Button 2", role: .destructive) {}
//            .buttonStyle(.bordered)
//            Button("Button 3") {}
//            .buttonStyle(.borderedProminent)
//            .tint(.green)
//            Button("Button 4", role: .destructive) {}
//            .buttonStyle(.borderedProminent)
//        }
//
        Button{
            print("Button tapped")
        } label: {
//            Text("Tap Me")
//                .padding()
//                .foregroundColor(.white)
//                .background(.purple)
//            Image(systemName: "pencil")
//              //makes image show with original colors not recolored
//              .renderingMode(.original)
            Label("Edit", systemImage: "pencil")
        }
        
        
        
    }
    
    func executeDelete(){
        print("Now Deleting")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
