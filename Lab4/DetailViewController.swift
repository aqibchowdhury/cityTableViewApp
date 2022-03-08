//
//  DetailViewController.swift
//  lab4
//
//  Created by Aqib Chowdhury on 2/24/22.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedTitle:String?
    var selectedDescription:String?
    var selectedImage:String?
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedTitle = selectedTitle {
            detailTitle.text = selectedTitle
            detailDescription.text = selectedDescription
            detailImage.image = UIImage(named: selectedImage!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
