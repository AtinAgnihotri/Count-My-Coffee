//
//  ContentView.swift
//  Count My Coffee
//
//  Created by Atin Agnihotri on 05/06/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepHours = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var cupsOfCoffee = 0
    
    @State private var alertTitle = ""
    @State private var alertMsg = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("When do you want to wakeup?")
                            .font(.headline)
                            .padding()) {
                    
                    DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                    
                }
                
                Section (header: Text("Desired amount of sleep")
                            .font(.headline)
                            .padding()) {
                    
                    Stepper(value: $sleepHours, in: 4...12, step: 0.25 ){
                        Text("\(sleepHours, specifier: "%g") hours")
                    }.padding()
                    
                }
                
                Section (header: Text("Daily Coffee Intake")
                            .font(.headline)
                            .padding()) {
                    
                    Picker("Daily Coffee Intake", selection: $cupsOfCoffee) {
                        ForEach(1..<21) {
                            Text("\($0)")
                        }
                    }.labelsHidden()
                    .pickerStyle(WheelPickerStyle())
                    
                }
                
                
            }.navigationBarTitle("Count My Coffee")
            .navigationBarItems(trailing:
                Button(action: calculateBedTime, label: {
                    Text("Calculate")
                })
            )
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMsg).font(.headline), dismissButton: .default(Text("OK")))
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func getTotalSleepTime() -> Double {
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        
        let hours = (components.hour ?? 0) * 60 * 60
        let minutes = (components.minute ?? 0) * 60
        
        return Double(hours + minutes)
    }
    
    func makePrediction(totalTime: Double) {
        let model = CoffeeCalculatorModel()
        
        do {
            let prediction = try model.prediction(wake: totalTime, estimatedSleep: sleepHours, coffee: Double(cupsOfCoffee + 1))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            alertTitle = "Your ideal bedtime is . . . "
            alertMsg = formatter.string(from: sleepTime)
        } catch {
            alertTitle = "Error"
            alertMsg = "Sorry, there was a problem calculating the bedtime"
        }
    }
    
    func calculateBedTime() {
        let totalTime = getTotalSleepTime()
        makePrediction(totalTime: totalTime)
        showAlert = true
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
