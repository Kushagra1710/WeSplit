//
//  ContentView.swift
//  WeSplit
//
//  Created by Kushagra sharma on 28/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.00
    @State private var percentageTip = 20
    @State private var peoples = 2
    @FocusState private var amountIsFocused : Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var TotalPerPerson : Double{
        
        let peopleCount = Double(peoples + 2)
        let PercentageValue = Double(percentageTip)
        let TipValue = checkAmount/100 * PercentageValue
        let TotalAmount = checkAmount + TipValue
        let AmountPerPerson = TotalAmount/peopleCount
        
        return AmountPerPerson
    }
    var body : some View {
        NavigationView{
            Form {
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("No. of People👥", selection: $peoples){
                        ForEach(2..<100){
                            Text("\($0) People")
                        }
                     }
                 }
                Section{
                    Picker("Tip Percentage", selection: $percentageTip){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                          }
                       }
                     .pickerStyle(.segmented)
                     }   header: {
                    Text("How much tip do you leave🤷🏼‍♂️?")
                }
                Section{
                    
                    Text(TotalPerPerson,format:.currency(code: Locale.current.currency?.identifier ?? "USD"))
                }  header: {
                    Text("amount per person🤝🏻")
                }
                
            }
                .navigationTitle("WeSplit")
    //before navigation view because nevigationview contains many views so new topic replace old topic
                .toolbar{
                    ToolbarItemGroup(placement : .keyboard ){
                        
                        Spacer()
                        
                        Button("Done"){
                            amountIsFocused = false
                            
                            
                    }
                }
            }
        }
    }
}
    


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
