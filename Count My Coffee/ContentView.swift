//
//  ContentView.swift
//  Count My Coffee
//
//  Created by Atin Agnihotri on 05/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepHours = 8.0
    @State private var wakeUp = Date()
    
    var body: some View {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? Date()
        
//        let someDate = Date()
//        let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
//        let hours = components.hour ?? 0
//        let minutes = components.minute ?? 0
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        
//        let now = Date()
//        let tomorrow = Date().addingTimeInterval(86400)
//        let range  = now ... tomorrow
        // Swift lets us form one-sided ranges – ranges where we specify either the start or end but not both, leaving Swift to infer the other side.
        
        return Form {
//            Text("Count My Coffee")
//                .padding()
//
//            Stepper (value: $sleepHours, in: 4...12, step: 0.25) {
//                Text("\(sleepHours, specifier: "%g") hours")
//            }
//                .padding()
            
            DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
//                       displayedComponents: .hourAndMinute )
                .datePickerStyle(WheelDatePickerStyle())
//                .padding()
//                .labelsHidden()

        }
//        VStack {
//
//            DatePicker("Please enter a date", selection: $wakeUp)
//                .padding()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
        ContentView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                    .previewDisplayName("iPhone 12")
    }
}
