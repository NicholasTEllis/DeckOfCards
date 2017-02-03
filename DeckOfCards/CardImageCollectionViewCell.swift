//
//  CardImageCollectionViewCell.swift
//  DeckOfCards
//
//  Created by Nicholas Ellis on 2/3/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class CardImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImage: UIImageView!
    
    func updateWith(card: Card) {
    
        ImageController.image(forUrl: card.imageEndPoint) { (image) in
            self.cardImage.image = image
        }
    }
    
}
