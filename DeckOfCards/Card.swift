//
//  Card.swift
//  DeckOfCards
//
//  Created by Nicholas Ellis on 2/3/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import Foundation


class Card {
    
    fileprivate static let kSuit = "suit"
    fileprivate static let kValue = "value"
    fileprivate static let kImageEndPoint = "image"
    
    let suit: String
    let value: String
    let imageEndPoint: String

    
    init(suit: String, value: String, imageEndPoint: String) {
        self.suit = suit
        self.value = value
        self.imageEndPoint = imageEndPoint
    }
    
    convenience init?(dictionary: [String : Any]) {
        guard let suit = dictionary[Card.kSuit] as? String,
            let value = dictionary[Card.kValue] as? String,
            let imageEndPoint = dictionary[Card.kImageEndPoint] as? String
            else { return nil }
        
        self.init(suit: suit, value: value, imageEndPoint: imageEndPoint)
    }
    
}
