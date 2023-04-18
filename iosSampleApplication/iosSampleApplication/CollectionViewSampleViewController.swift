//
//  CollectionViewSampleCollectionViewController.swift
//  iosSampleApplication
//
//  Created by Ram Eretz Kdosha on 17/04/2023.
//

import UIKit
import PrimisPlayerSdk


class CollectionViewSampleViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private var player: PrimisPlayer?
    private let playerRows = [1,40, 80]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundView = UIImageView(image: UIImage(named: "background"))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createPrimisPlayer()
    }
    
    func createPrimisPlayer() {
        if player == nil {
            player = PrimisPlayer()
            player?.configure([
                .placementId: "113298",
                .containerView: collectionView,
                .debugLogActive: true ])
            player?.add(to: self)
        }
    }
    
    deinit {
        player?.remove()
        player = nil
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        if playerRows.contains(indexPath.row) {
            let size = player?.getPlayerSize() ?? .zero
            return CGSize(width: flowLayout.itemSize.width, height: size.height)
        }
        
        return flowLayout.itemSize
    }
    
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if  playerRows.contains(indexPath.row) {
            let playerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCell",for: indexPath) as! PlayerCollectionViewCell
            player?.displayInCell(playerCell, container: playerCell.playerContainer)
            return playerCell
        }
        
       return collectionView.dequeueReusableCell(withReuseIdentifier: "mockCell", for: indexPath)
    }

}
