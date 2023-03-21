//
//  DetailViewController.swift
//  semanur
//
//  Created by Süha Karakaya on 21.03.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
        // Do any additional setup after loading the view.
    }
    

    

}
