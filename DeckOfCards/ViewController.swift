//
//  ViewController.swift
//  DeckOfCards
//
//  Created by Nicholas Ellis on 2/3/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cards: [Card] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardImageCollectionViewCell else { return UICollectionViewCell() }
        let card = cards[indexPath.row]
        cell.updateWith(card: card)
        return cell
    }
    
    @IBAction func showCardsButtonTapped(_ sender: Any) {
        CardController.displayCards { (cards) in
            self.cards = cards
        }
    }
}

