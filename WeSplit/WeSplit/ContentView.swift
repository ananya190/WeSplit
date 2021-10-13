//
//  ContentView.swift
//  WeSplit
//
//  Created by Ananya George on 7/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmt = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var grandTotal: Double {
        
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmt) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
        
    }
    
    
    var totalPerPerson: Double {
        
        let peopleCount = Double(numberOfPeople) ?? 0 + 2
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
        
    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    
                    TextField("Amount", text: $checkAmt)
                        .keyboardType(.decimalPad)
                    
                    
                    
                    TextField("Number of People", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Grand Total")) {
                    Text("$\(grandTotal, specifier: "%.2f")")
                        .foregroundColor(tipPercentage == 4 ? .red : .black)
                }
                
                Section(header: Text("Total Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("WeSplit")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
