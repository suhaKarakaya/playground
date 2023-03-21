//
//  ViewController.swift
//  semanur
//
//  Created by Süha Karakaya on 21.03.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewlist: [Country]?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
        AF.request("https://ezanvakti.herokuapp.com/vakitler/9541", method: .get, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            
            guard let data = responseData.data else { return }
            
            do{
                let data = try JSONDecoder().decode([Country].self, from: data)
                self.tableViewlist = data
                self.tableView.reloadData()
            } catch {
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sg_toDetail" {
            guard let mySender = sender as? String, let dvc = segue.destination as? DetailViewController  else { return }
            dvc.text = mySender
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let list = tableViewlist?.count else { return 0 }
        return list
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.lbl1.text = tableViewlist?[indexPath.row].Aksam
        cell.lbl2.text = tableViewlist?[indexPath.row].Ikindi
        cell.lbl3.text = tableViewlist?[indexPath.row].Yatsi
        cell.lbl4.text = tableViewlist?[indexPath.row].Ogle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = tableViewlist?[indexPath.row].Aksam
        performSegue(withIdentifier: "sg_toDetail", sender: data)
    }
    
    
}



