//
//  CardController.swift
//  DeckOfCards
//
//  Created by Nicholas Ellis on 2/3/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import Foundation

class CardController {
    static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/")
    static var deckID: String?

    static func displayCards(completion: @escaping ([Card]) -> Void) {
        let urlParameter = ["count" : "52"]
        guard let url = baseURL else {
            NSLog("url is broke broski")
            completion([])
            return
        }
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameter, body: nil) { (data, error) in
            guard let data = data, let response = String(data: data, encoding: .utf8) else {
                NSLog("Data came back nil")
                completion([])
                return
            }
            
            print(response)
            
            guard let responseDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : Any] else {
                NSLog("couldn't parse")
                completion([])
                return
            }
            
            guard let cardDictionary = responseDictionary["cards"] as? [[String : Any]] else {
                NSLog("couldn't parse")
                completion([])
                return
            }
            
            let cardsResponse = cardDictionary.flatMap { Card(dictionary: $0) }
            completion(cardsResponse)
        }
    }
}
