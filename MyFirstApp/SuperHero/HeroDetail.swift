//
//  HeroDetail.swift
//  MyFirstApp
//
//  Created by Raul Remedios Rosado on 12/27/24.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct HeroDetail: View {
    let id:String
    @State var loading: Bool = true
    @State var errorC: Bool = true
    @State var responseApi: ApiNetwork.HeroInfo? = nil
    
    var body: some View {
        VStack{
            if(errorC){
                HStack{
                    Image(systemName: "personalhotspot.slash")
                        .frame(height: 20)
                        .foregroundStyle(.orange)
                    Text("ERROR: Coneccion fallida")
                }
            }
            if(loading){
                ProgressView().tint(.panelSelected)
            }else if let responseApi = responseApi{
                VStack{
                    ZStack{
                        WebImage(url:URL(string: responseApi.image.url))
                            .resizable()
                            .indicator(.activity)
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                    }.frame(height: 200)
                }.frame(maxWidth: .infinity,maxHeight:200)
                    .background(.panelApp)
                    .cornerRadius(16)
                
                VStack{
                    Text(responseApi.name).font(.title)
                    Text("Ocupacion:\(responseApi.work.occupation)")
                }
                .frame(maxWidth: .infinity, maxHeight:150)
                .padding(.horizontal,20)
                .background(.gray.opacity(0.1))
                .cornerRadius(16)
                
                VStack{
                    SuperheroStats(stats:responseApi.powerstats)
                }
                .frame(maxWidth: .infinity, maxHeight:150)
                .padding(20)
                .background(.gray.opacity(0.1))
                .cornerRadius(16)
            }
           
        }.frame(maxWidth: .infinity, maxHeight: .infinity).padding(20)
            .onAppear{
                Task {
                    do{
                        print(id)
                        responseApi = try await ApiNetwork().getHeroById(id: id)
                        loading = false
                        errorC = false
                    }catch{
                        responseApi = nil
                        errorC = true
                        print("ERROR")
                    }
                }
            }
    }
    
    struct SuperheroStats:View {
        let stats:ApiNetwork.Powerstats
        var body: some View {
            Chart{
                SectorMark(angle: .value("Count", Int(stats.combat) ?? 0),innerRadius: 0.5, angularInset:2)
                    .foregroundStyle(by: .value("Category", "Combate"))
                SectorMark(angle: .value("Count", Int(stats.durability) ?? 0),innerRadius: 0.5, angularInset:2)
                    .foregroundStyle(by: .value("Category", "Durabilidad"))
                SectorMark(angle: .value("Count", Int(stats.intelligence) ?? 0),innerRadius: 0.5, angularInset:2)
                    .foregroundStyle(by: .value("Category", "Inteligencia"))
                SectorMark(angle: .value("Count", Int(stats.power) ?? 0),innerRadius: 0.5, angularInset:2)
                    .foregroundStyle(by: .value("Category", "Poder"))
                SectorMark(angle: .value("Count", Int(stats.speed) ?? 0),innerRadius: 0.5, angularInset:2)
                    .foregroundStyle(by: .value("Category", "Speed"))
                SectorMark(angle: .value("Count", Int(stats.strength) ?? 0),innerRadius: 0.5, angularInset:2)
                    .foregroundStyle(by: .value("Category", "Fuerza"))
                    
            }
        }
    }
}
