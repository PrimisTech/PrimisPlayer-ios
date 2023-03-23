//
//  SingleViewVC.swift
//  iosSampleApplication
//
//  Created by Roei Rosental on 16/03/2023.
//

import UIKit
import PrimisPlayerSdk

class ScrollViewSampleViewController: UIViewController {

    @IBOutlet weak var topTextView: UITextView!
    @IBOutlet weak var bottomTextView: UITextView!
    @IBOutlet weak var playerContainer: UIView!
    
    private var player: PrimisPlayer?
    
    deinit {
        player?.remove()
        player = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if player == nil {
            player = PrimisPlayer()
            player?.configure([
                .placementId: "113298",
                .containerView: playerContainer,
                .flowParentView: self.view
            ])
            player?.add(to: self)
        }
    }
}
