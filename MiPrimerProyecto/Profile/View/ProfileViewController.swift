//
//  ProfileViewController.swift
//  MiPrimerProyecto
//
//  Created by Kevinho Morales on 22/1/25.
//

import UIKit

final class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var loadingActivityIndicator: UIActivityIndicatorView!
    @IBOutlet private var tableView: UITableView!
    
    private let socialMediaNetworks = ["Facebook", "Instagram", "X", "YouTube", "Bluesky", "Twitch", "TikTok", "Threeds"]
    private var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        setUpCell()
        getPosts() { posts in
            print(posts.count)
            self.posts = posts
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.loadingActivityIndicator.stopAnimating()
                self.loadingActivityIndicator.isHidden = true
                self.tableView.reloadData()
            }
        }
    }
    
    private func setUpCell() {
        let cell = UINib(nibName: String(describing: PostTableViewCell.self), bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: PostTableViewCell.CELL_ID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.CELL_ID, for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.setUpCell(post: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        print(post.body)
    }
    
    private func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        loadingActivityIndicator.startAnimating()
        loadingActivityIndicator.isHidden = false
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let data = data {
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    completion(posts)
                } catch {
                    print("Error Catch")
                }
                return
            }
            
            print("No hay data")
        }
        task.resume()
    }
}

