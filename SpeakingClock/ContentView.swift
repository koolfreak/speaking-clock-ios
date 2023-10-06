//
//  ContentView.swift
//  SpeakingClock
//
//  Created by Eman on 9/20/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var currentTime: Date = Date.now
       let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
       let timeFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "h:mm"
           return formatter
       }()
    private let currentDate: Date = Date.now
    private let speakViewModel: SpeakViewModel = SpeakViewModel()
    
    init() {
        // application should always on
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                
                Text("\(currentTime, formatter: timeFormatter)")
                    .font(.custom("Montserrat-Regular", size: 250))
                    .lineSpacing(1.5)
                    .foregroundColor(.mint)
                
                //. styling
                Text(currentDate, style: .date).foregroundColor(.white)
            }
            
            .padding()
            .onReceive(timer) { input in
                currentTime = input
                speakViewModel.speakTime(currentDate: currentTime)
            }
            .onAppear {
                //speakViewModel.availLanguage()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}


