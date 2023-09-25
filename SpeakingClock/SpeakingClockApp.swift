//
//  SpeakingClockApp.swift
//  SpeakingClock
//
//  Created by Eman on 9/20/23.
//

import SwiftUI

@main
struct SpeakingClockApp: App {
    
    init() {
        // application should always on
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
