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
        
        getBestsellers()

    }

    
    func getBestsellers() {
        if let url = URL(string: "https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json"){
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) {(data, request, error) in
                if error != nil{
                    print("There was an error")
                }else if data != nil {
                    if let bestsellersFromAPI = try? JSONDecoder().decode([Bestseller].self, from: data!){
                        DispatchQueue.main.async {
                            self.bestsellers = bestsellersFromAPI
                            self.tableView.reloadData()
                        }

                    }
                }
                
            }.resume()
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bestsellers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BestsellerCell", for: indexPath) as? BestsellerTableViewCell {
            let bestseller = bestsellers[indexPath.row]
            cell.authorLabel.text = bestseller.author
            cell.titleLabel.text = bestseller.title
            cell.priceLabel.text = bestseller.price
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }

   

}
