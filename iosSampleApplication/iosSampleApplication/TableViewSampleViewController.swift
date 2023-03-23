//
//  SampleTableViewController.swift
//  iosSampleApplication
//
//  Created by Roei Rosental on 16/03/2023.
//

import UIKit
import PrimisPlayerSdk

class TableViewSampleViewController: UITableViewController {
    
    private var player: PrimisPlayer?
    
    private let PLAYER_INDEX = 1
    
    deinit {
        player?.remove()
        player = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        
        if player == nil {
            player = PrimisPlayer()
            
            player?.configure([.placementId: "113298", .containerView: tableView, .debugLogActive: true])
            
            player?.add(to: self)
        }
    }
    
    

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == PLAYER_INDEX {
            
            let size = player?.getPlayerSize() ?? .zero

            return size.height
        }
        
        return 100

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == PLAYER_INDEX {
            let playerCell =
                tableView.dequeueReusableCell(withIdentifier: "playerCell",for: indexPath) as! PlayerTableViewCell
            
            player?.displayInCell(playerCell, container: playerCell.playerContainer)
            
            return playerCell
        }
       
        return tableView.dequeueReusableCell(withIdentifier: "mockCell", for: indexPath)
    }

}
