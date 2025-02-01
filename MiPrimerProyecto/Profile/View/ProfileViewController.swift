//
//  ProfileViewController.swift
//  MiPrimerProyecto
//
//  Created by Kevinho Morales on 22/1/25.
//

import UIKit

final class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private var tableView: UITableView!
    
    let socialMediaNetworks = ["Facebook", "Instagram", "X", "YouTube", "Bluesky", "Twitch", "TikTok", "Threeds"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        setUpCell()
    }
    
    private func setUpCell() {
        let cell = UINib(nibName: String(describing: PostTableViewCell.self), bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: PostTableViewCell.CELL_ID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        socialMediaNetworks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.CELL_ID, for: indexPath) as! PostTableViewCell
        let socialMediaNetwork = socialMediaNetworks[indexPath.row]
        cell.setUpCell(socialMediaNetwork: socialMediaNetwork)
        return cell
    }
}

