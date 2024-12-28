//
//  ListAplications.swift
//  MyFirstApp
//
//  Created by Raul Remedios Rosado on 12/27/24.
//

import SwiftUI

struct ListAplications: View {
    var body: some View {
        NavigationStack {
            List{
                NavigationLink(destination: MainPage(), label: {
                    Text("IMC Calculator")
                })
                NavigationLink(destination: ListExample(), label: {
                    Text("ListExample")
                })
                NavigationLink(destination: SuperHeroSearcher(), label: {
                    Text("SuperHeroSearcher")
                })
            }
        }
    }
}

#Preview {
    ListAplications()
}
