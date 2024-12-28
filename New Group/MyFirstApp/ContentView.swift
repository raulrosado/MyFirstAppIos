//
//  ContentView.swift
//  MyFirstApp
//
//  Created by Raul Remedios Rosado on 12/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    //@FocusState private var emailFieldIsFocused: Bool = true

    var body: some View {
        NavigationStack{
            VStack {
                Image("logo").frame(width: 20.0, height: 20.0).padding(.bottom, 66)
                FormLogin()               
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
