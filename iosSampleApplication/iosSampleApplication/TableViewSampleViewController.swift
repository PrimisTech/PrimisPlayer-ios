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
    private let playerRows = [1, 40, 80]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
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
                .containerView: tableView,
                .debugLogActive: true ])
            player?.add(to: self)
        }
    }
    
    deinit {
        player?.remove()
        player = nil
    }
    

    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if playerRows.contains(indexPath.row) {
            let size = player?.getPlayerSize() ?? .zero
            return size.height
        }
        
        return tableView.rowHeight
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if  playerRows.contains(indexPath.row) {
            let playerCell = tableView.dequeueReusableCell(withIdentifier: "playerCell",for: indexPath) as! PlayerTableViewCell
            player?.displayInCell(playerCell, container: playerCell.playerContainer)
            return playerCell
        }
       
        return tableView.dequeueReusableCell(withIdentifier: "mockCell", for: indexPath)
    }

}
