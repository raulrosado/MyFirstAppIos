//
//  IMCResult.swift
//  MyFirstApp
//
//  Created by Raul Remedios Rosado on 12/26/24.
//

import SwiftUI

struct IMCResult: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        VStack {
            Text("Tu Resultado").font(.title).bold().foregroundStyle(.white)
            let result = calculateIMC(weight: userWeight, height:userHeight)
            InformationView(result: result)
        }.frame(maxWidth: .infinity, maxHeight:.infinity)
            .background(.backgroundApp)
    }
}

func calculateIMC(weight:Double, height:Double)->Double{
    print(weight,height)
    let result = height/((weight/100)*(weight/100))
    return result
}

func getImcResult(result:Double)->(String,String,Color){
    let title:String
    let text:String
    let color:Color
    
    switch result{
    case 0...19.9:
        title = "BAJO PESO"
        text = "Peso bajo, necesitas más alimentación."
        color = .yellow
        
    case 20...24.9:
        title = "NORMAL"
        text = "Peso normal."
        color = .green
        
    case 25...29.9:
        title = "Sobrepeso"
        text = "Sobrepeso, necesitas menos alimentación."
        color = .orange
        
    case 30...100:
        title = "Obecidad"
        text = "Estas muy por encima del peso ideal, necesitas menos alimentación."
        color = .yellow
    default :
        title = "ERROR"
        text = "Ha ocurrido un error."
        color = .gray
    }
    
    return (title, text, color)
}

struct InformationView:View {
    let result:Double
    var body: some View {
        let information = getImcResult(result: result)
        
        VStack{
            Text(information.0).foregroundStyle(information.2).font(.title).bold()
            Text("\(result, specifier: "%.2f")").font(.system(size: 80))
            Text(information.1).foregroundStyle(.white).font(.title2).padding(.horizontal, 16)
        }.frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(.panelApp).cornerRadius(16).padding(20)
    }
}

#Preview {
    IMCResult(userWeight: 80, userHeight: 190)
}
