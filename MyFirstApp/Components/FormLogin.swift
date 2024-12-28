//
//  FormLogin.swift
//  MyFirstApp
//
//  Created by Raul Remedios Rosado on 12/26/24.
//

import SwiftUI

struct FormLogin: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack{
            TextField(
                "User name (email address)",
                text: $username
            ).keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.1))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: username, { oldvalue, newValue in
                    print("nuevo valor de name: \(newValue)")
                })
            SecureField(
                "Password",
                text: $password
            )
            .padding(16)
            .background(.gray.opacity(0.1))
            .cornerRadius(16)
            .padding(.horizontal, 32)
            .onChange(of: password, { oldvalue, newValue in
                print("nueva contraseña: \(newValue)")
            })
            
            HStack(alignment: .center) {
                Button(action: {
                    print("olvide contraseña")
                }) {
                    Text("Recordar contraseña")
                }
            }.padding()
            
            NavigationLink(destination: ListAplications(), label: {
//                Button(action: {
//                    print("login")
//                }) {
                    Text(" Iniciar seccion ")
                        .frame(width: 200,height: 50)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(16)
                        .padding(.horizontal,32)
//                }
            })
        }
    }
}

#Preview {
    FormLogin()
}
