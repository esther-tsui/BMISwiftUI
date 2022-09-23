//
//  ContentView.swift
//  BMISwiftUI
//
//  Created by Wing Hei Tsui on 20/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var weightText: String = ""
    @State private var heightText: String = ""
    @State private var bmi: Double = 0
    @State private var classification: String = ""
    
    var body: some View {
        VStack{
            Text("BMI Calculator").font(.largeTitle)
        TextField("Enter Weight (in kilograms)", text: $weightText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
        TextField("Enter Height (in meters)", text: $heightText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .border(Color.black)
            
            Button{
                //let weight = Double(self.weightText)!
                //let height = Double(self.heightText)!
                
                var weight: Double = 0
                var height: Double = 0
                
                if let weightDouble = Double(self.weightText) {
                    weight = weightDouble
                }
                if let heightDouble = Double(self.heightText) {
                    height = heightDouble
                }
                self.bmi = weight/(height * height)
                
                if self.bmi < 18.5{
                    self.classification = "Underweight"
                }
                else if self.bmi < 24.9{
                    self.classification = "Healthy weight"
                }
                else if self.bmi < 29.9{
                    self.classification = "Overly weight"
                }
                else{
                    self.classification = "Obese"
                }
            } label:{
                Text("Calculate BMI")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
            }
            
            Text("BMI: \(bmi, specifier: "%.2f"), \(classification)").font(.title).padding()
        }.padding(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color(.black)
        
        ContentView().environment(\.colorScheme, .dark)
        }
    }
}
