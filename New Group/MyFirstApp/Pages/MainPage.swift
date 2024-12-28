//
//  MainPage.swift
//  MyFirstApp
//
//  Created by Raul Remedios Rosado on 12/26/24.
//

import SwiftUI

struct MainPage: View {
    @State var gender:Int = 0
    @State var slider:Double = 150
    @State var edad:Int = 18
    @State var peso:Int = 80
    
    var body: some View {
        NavigationStack{
            HStack{
                ToggleButtom(text: "Raul Remedios Rosado", imageName:"heart.fill", gender:0, selectedGender: $gender)
                ToggleButtom(text: "Virgen Hernandez", imageName:"heart.fill", gender:1,selectedGender: $gender)
            }
            HeightCalculator(selectedValue: $slider)
                .frame(maxWidth: .infinity, maxHeight:.infinity)
                .background(.backgroundApp)
                .toolbar {
                    ToolbarItem(placement: .principal){
                        Text("IMC Calculator").bold().foregroundColor(.white)
                    }
                }
            HStack{
                CounterButtom(counter: $edad, number: edad, title:"Edad")
                CounterButtom(counter: $peso, number: peso, title:"Peso")
            }
            IMCCalculatorApp(userWeight: slider, userHeight: Double(peso))
        }
    }
}

struct IMCCalculatorApp: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        
            NavigationLink(destination: {
                IMCResult(userWeight: userWeight, userHeight: userHeight)
            }){
                Text("Calcular IMC")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.purple)
                    .frame(maxWidth:.infinity,maxHeight: .infinity)
                    .background(.panelApp)
            }
        }
    
}

struct ToggleButtom:View {
    let text:String
    let imageName:String
    let gender:Int
    @Binding var selectedGender:Int
    
    var body: some View {
        let color = if(gender == selectedGender){
            Color.panelSelected
        }else{
            Color.panelApp
        }
        
        Button(action: {
            selectedGender = gender
        }){
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundStyle(.white)
                    
                InformationText(text:text)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(color)
        }
    }
}

struct InformationText:View{
    let text:String
    var body: some View{
        Text(text)
            .font(.largeTitle)
            .foregroundColor(.white)
            .bold()
    }
}
struct TitleText:View{
    let text:String
    var body: some View{
        Text(text)
            .font(.title2)
            .foregroundColor(.gray)
            .bold()
    }
}

struct HeightCalculator:View {
    @Binding var selectedValue:Double
    
    var body: some View {
        VStack{
            TitleText(text:"Altura")
            InformationText(text:"\(Int(selectedValue)) cm")
            Slider(value: $selectedValue, in: 100...200 , step: 1)
                .accentColor(.purple)
                .padding(.horizontal,16)
        }.frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(.panelApp)
    }
}

struct CounterButtom:View {
    @Binding var counter:Int
    let number:Int
    let title:String
    
    var body: some View {
        VStack{
            TitleText(text: title)
            InformationText(text: String(number))
            HStack{
                Button(action: {
                    if(number > 10){
                        counter -= 1
                    }
                }){
                    ZStack{
                        Circle().frame(width: 70,height: 70).foregroundStyle(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25,height: 25)
                    }
                }
                Button(action: {
                    if(number < 100 ){
                        counter += 1
                    }
                }){
                    ZStack{
                        Circle().frame(width: 70,height: 70).foregroundStyle(.purple)
                        Image(systemName: "plus").resizable().foregroundColor(.white).frame(width: 25,height: 25)
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight:.infinity)
        .background(.panelApp)
    }
}

#Preview {
    MainPage()
}
