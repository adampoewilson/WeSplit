//
//  ContentView.swift
//  WeSplit
//
//  Created by Adam Wilson on 2/17/24.

// OPTION COMMAND P to refresh content view!!!

// OPTION COMMAND ENTER to show content view!!

// Form gives a scrollable list of data

// Section breaks up text into sections

// ATTACH NAVIGATION TITLES TO FORMS, NOT NAVIGATION STACKS!!!!

// EDITED JUST TO CALCULATE THE TIP EACH PERSON GIVES FOR COST OF FOOD!!!

import SwiftUI

struct ContentView: View {
    
    // @State constantly checks to see what's changed in app and updates the 2nd text box in real time
    
    @State private var checkAmount = 0.0
    
    @State private var numPeople = 2
    
    @State private var tipPercent = 20
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {

           // calc total per person

           let peopleCount = Double(numPeople + 2)

           let tipSelection = Double(tipPercent)

           let tipValue = checkAmount / 100 * tipSelection
        
           let amountPerPerson = tipValue / peopleCount

           return amountPerPerson
    }
    
    var body: some View {
        
        NavigationStack {
        
            Form {
                
                Section {
                    
                    TextField("Amount:", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numPeople) {
                        
                        ForEach(2..<100) {
                            
                            Text("\($0) people")
                            
                        }
                        
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much do you want to tip?") {
                    
                    Picker("Tip percentage", selection: $tipPercent) {
                        
                        ForEach(tipPercentages, id: \.self) {
                            
                            Text($0, format: .percent)
                            
                        }
                        
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                }
                
            }
            .navigationTitle("We Split")
            .toolbar {
                
                if amountIsFocused {
                    
                    Button("Done") {
                        
                        amountIsFocused = false
                        
                    }
                    
                }
                
            }
        
        }
    
            
       
    }
    
    
}
    
    
    #Preview { // this preview code renders the preview over here in Xcode ---->
        ContentView()
    }
    

