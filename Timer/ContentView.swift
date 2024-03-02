//
//  ContentView.swift
//  Timer
//
//  Created by Purna Chandra Mansingh on 02/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var enlarge = false
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @State private var timer: Timer? = nil
    @State private var currentTime = 0
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                UnitTime(currentTime: (self.currentTime / 3600))
                UnitTime(currentTime: (((self.currentTime) / 60) % 60))
                UnitTime(currentTime: (self.currentTime) % 60)
            }
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    // Play the timer
                    if self.timer == nil {
                            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in self.currentTime += 1}
                        }

                }) {
                    Image(systemName: "play.circle")
                        .font(.system(size: 100))
                }
                Spacer()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    // Pause the timer
                    self.timer?.invalidate()
                    self.timer = nil
                }) {
                    Image(systemName: "pause.circle")
                        .font(.system(size: 100))
                }
                Spacer()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Button(action: {
                    // Stop the timer
                    self.timer?.invalidate()
                    self.timer = nil
                    self.currentTime = 0
                }) {
                    Image(systemName: "stop.circle")
                        .font(.system(size: 100))
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct UnitTime: View {
    let currentTime: Int
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
                    .frame(width: 200, height: 200)
                    .overlay(
                        Text("\(currentTime)").font(.system(size: 100))
                    )
    }
}

#Preview(windowStyle: .volumetric) {
    ContentView()
}
