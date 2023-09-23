//
//  ContentView.swift
//  SpeakingClock
//
//  Created by Eman on 9/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentDate: Date = Date.now
       let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
       let timeFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "hh:mm"
           //formatter.dateStyle = .none
           //formatter.timeStyle = .short
           return formatter
       }()
    private let speakViewModel: SpeakViewModel = SpeakViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                
                Text("\(currentDate, formatter: timeFormatter)")
                    .font(.custom("Montserrat-Regular", size: 250))
                    .lineSpacing(1.5)
                    .foregroundColor(.mint)
                
                //. styling
                Text(currentDate, style: .date).foregroundColor(.white)
            }
            
            .padding()
            .onReceive(timer) { input in
                currentDate = input
                speakViewModel.speakTime(currentDate: currentDate)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
