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
    @State private var cupsOfCoffee = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wakeup?")
                    .font(.headline)
                    .padding()
                
                DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
//                    .datePickerStyle(WheelDatePickerStyle())
                    .padding()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                    .padding()
                
                Stepper(value: $sleepHours, in: 4...12, step: 0.25 ){
                    Text("\(sleepHours, specifier: "%g") hours")
                        .padding()
                }.padding()
                
                Text("Daily Coffee Intake")
                    .font(.headline)
                    .padding()
                
                Stepper(value: $cupsOfCoffee, in: 1...20) {
                    Text(cupsOfCoffee > 1 ? "\(cupsOfCoffee) cups" : "\(cupsOfCoffee) cup")
                        .padding()
                }.padding()
                
                Button(action: calculateBedTime, label: {
                    Text("Calculate")
                }).padding()
                
                Spacer()
                
            }.navigationBarTitle("Count My Coffee")
//            .navigationBarItems(trailing:
//                Button(action: calculateBedTime, label: {
//                    Text("Calculate")
//                })
//            )
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func calculateBedTime() {
        
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView()
//                    .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
//                    .previewDisplayName("iPhone 12")
    }
}
