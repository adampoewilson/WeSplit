//
//  ContentView.swift
//  WeSplit
//
//  Created by Adam Wilson on 2/17/24.

// OPTION COMMAND P to refresh content view!!!

// Form gives a scrollable list of data

// Section breaks up text into sections

import SwiftUI

struct ContentView: View {
    // @State constantly checks to see what's changed in app and updates the 2nd text box in real time
    
    @State private var checkAmount = 0.0
    
    @State private var numPeople = 2
    
    @State private var tipPercent = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        
            Form {
                
                Section {
                    
                    TextField("Amount:", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                }
                
                Section {
                    
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    
                }
                
            }
            
       
    }
    
    
}
    
    
    
    
    
    
    
    
    
    
    #Preview { // this preview code renders the preview over here in Xcode ---->
        ContentView()
    }
    

