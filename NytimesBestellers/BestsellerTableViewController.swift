//
//  BestsellerTableViewController.swift
//  NytimesBestellers
//
//  Created by Nana Adwoa Odeibea Amoah on 7/9/21.
//

import UIKit

class BestsellerTableViewController: UITableViewController {
    
    var bestsellers: [Bestseller] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getBestsellers()
        
    }
    
    
    func getBestsellers() {
        
        if let url = URL(string: "https://api.chucknorris.io/jokes/random") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: url) { (data, request, error) in
                if error != nil {
                    print("Error connecting to server...")
                }else{
                    if data != nil {
                        if let bestsellersFromAPI = try? JSONDecoder().decode(Bestseller.self, from: data!){
                            DispatchQueue.main.async {
                                self.bestsellers.append(bestsellersFromAPI)
                                self.tableView.reloadData()
                            }
                        }
                    }else{
                        print("Error fetching JSON...")
                    }
                }
            }.resume()
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bestsellers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BestsellerCell", for: indexPath) as? BestsellerTableViewCell {
            let bestseller = bestsellers[indexPath.row]
            cell.authorLabel.text = bestseller.value
            cell.titleLabel.text = bestseller.value
            cell.priceLabel.text = bestseller.value
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    
}
