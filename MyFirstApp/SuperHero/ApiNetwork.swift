//
//  ApiNetwork.swift
//  MyFirstApp
//
//  Created by Raul Remedios Rosado on 12/27/24.
//

import Foundation

class ApiNetwork {
    
    struct Wrapper:Codable{
        let response:String
        let results:[Hero]
    }
    
    struct Hero:Codable,Identifiable{
        let id:String
        let name:String
        let image:ImageHero
    }
    
    struct ImageHero:Codable{
        let url:String
    }
    
 //*********************************
    struct HeroInfo:Codable{
        let id:String
        let name:String
        let image:ImageHero
        let powerstats:Powerstats
        let biography:Biography
        let work:Work
    }
    
    struct Biography:Codable{
          let alignment:String
          let publisher:String
          let aliases:[String]
          let fullName:String
          
          enum CodingKeys:String, CodingKey{
              case fullName = "full-name"
              case alignment = "alignment"
              case publisher = "publisher"
              case aliases = "aliases"
          }
      }
                                
    struct Powerstats:Codable{
           let intelligence:String
           let strength:String
           let speed:String
           let durability:String
           let power:String
           let combat:String
       }
    
    struct Work:Codable{
        let occupation: String
        let base: String
    }
    
    func getHeroByQuery(query: String) async throws -> Wrapper {
        let url = URL(string:"https://www.superheroapi.com/api/a22c06fc06478ca9e0cb07e7f79b6b4e/search/\(query)")!
        let (data,_) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Wrapper.self, from: data)
        
    }
    
    func getHeroById(id: String) async throws -> HeroInfo {
        let urlInfo = URL(string:"https://superheroapi.com/api/a22c06fc06478ca9e0cb07e7f79b6b4e/\(id)")!
        let (dataInfo,_) = try await URLSession.shared.data(from: urlInfo)
        return try JSONDecoder().decode(HeroInfo.self, from: dataInfo)
        
    }
}
