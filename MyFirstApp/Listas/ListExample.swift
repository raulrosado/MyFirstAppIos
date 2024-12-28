//
//  ListExample.swift
//  MyFirstApp
//
//  Created by Raul Remedios Rosado on 12/27/24.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Bulbasaur"),
    Pokemon(name: "Squirtle"),
    Pokemon(name: "Mew"),
    Pokemon(name: "Pikachu")
]

var digimons = [
    Digimons(name: "Digimon"),
    Digimons(name: "Digidmon"),
    Digimons(name: "Digismon"),
    Digimons(name: "Digifmon"),
    Digimons(name: "Digimson"),
    Digimons(name: "Digimon")
    ]

struct ListExample: View {
    var body: some View {
        List{
            Section(header: Text("Pokemon")) {
                ForEach(pokemons, id:\.name){ pokemon in
                    Text(pokemon.name)
                }
            }
            
            Section(header: Text("Digimons")){
                ForEach(digimons){ digimons in
                    Text(digimons.name)
                }
            }
        }
    }
}

struct Pokemon{
    let name: String
}

struct Digimons:Identifiable{
    var id = UUID()
    let name:String
}

#Preview {
    ListExample()
}
