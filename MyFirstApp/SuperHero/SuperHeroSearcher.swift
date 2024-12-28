//
//  SuperHeroSearcher.swift
//  MyFirstApp
//
//  Created by Raul Remedios Rosado on 12/27/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperHeroSearcher: View {
    @State var searchText: String = ""
    @State var responseApi: ApiNetwork.Wrapper? = nil
    @State var loading: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Buscador de Heroes")
                    .font(.title)
                    .padding(.horizontal,16)
                TextField(
                    "Busca un pokemon",
                    text: $searchText
                ).keyboardType(.default)
                    .padding(16)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(16)
                    .padding(.horizontal, 32)
                    .onChange(of: searchText, { oldvalue, newValue in
                    })
                    .autocorrectionDisabled()
                    .onSubmit {
                        loading = true
                        //un hilo de proceso
                        Task {
                            do{
                                responseApi = try await ApiNetwork().getHeroByQuery(query:searchText)
                                loading = false
                            }catch{
                                print("ERROR")
                            }
                        }
                        
                    }
            }.padding(.bottom, 32)
            
            if(loading){
                ProgressView().tint(.panelSelected)
            }
            
            VStack{
                List(responseApi?.results ?? []){ hero in
                    ZStack{
                        HeroItem(hero:hero)
                        NavigationLink(destination: {HeroDetail(id: hero.id)}){EmptyView()}.opacity(0)
                    }
                }.listStyle(.plain)
            }.frame(maxWidth:.infinity, maxHeight:.infinity)
        }
    }
}


struct PokemonS{
    let name: String
}

struct HeroItem:View {
    let hero:ApiNetwork.Hero
    var body: some View {
        VStack{
            ZStack{
                WebImage(url:URL(string: hero.image.url))
                    .resizable()
                    .indicator(.activity)
                    .scaledToFill()
                    .frame(height: 200)
            }.frame(height: 200)
            Text(hero.name).foregroundStyle(.white).padding(10).font(.title2)
                .frame(maxWidth:.infinity)
                .background(.white.opacity(0.5))
        }.frame(maxWidth: .infinity,maxHeight:.infinity)
            .background(.panelApp)
            .cornerRadius(16)
    }
}

#Preview {
    SuperHeroSearcher()
}
