//
//  SingleViewVC.swift
//  iosSampleApplication
//
//  Created by Roei Rosental on 16/03/2023.
//

import UIKit
import PrimisPlayerSdk

class ScrollViewSampleViewController: UIViewController {

    @IBOutlet weak var playerContainer: UIView!
    
    private var player: PrimisPlayer?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createPrimisPlayer()
    }
    
    func createPrimisPlayer() {
        if self.player == nil {
            player = PrimisPlayer()
            player?.configure([
                .placementId: "113298",
                .containerView: playerContainer,
                .debugLogActive: true ])
            player?.add(to: self)
        }
    }
    
    deinit {
        player?.remove()
        player = nil
    }
    
}
