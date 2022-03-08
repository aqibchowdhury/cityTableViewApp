//
//  ViewController.swift
//  lab4
//
//  Created by Aqib Chowdhury on 2/24/22.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //model
    var myCityList:cities =  cities()

    
    @IBOutlet weak var cityTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // calling the model to get the city count
        return myCityList.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
        cell.layer.borderWidth = 1.0
        
        // calling the model to get the city object each row
        let cityItem = myCityList.getCityObject(item:indexPath.row)
        
        cell.cityTitle.text = cityItem.cityName;
        cell.cityImage.image = UIImage(named: cityItem.cityImageName!)
        
        
        return cell
        
    }
    
    // delete table entry
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell.EditingStyle { return UITableViewCell.EditingStyle.delete }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
      // delete the data from the city table,  Do this first, then use method 1 or method 2
        myCityList.removeCityObject(item: indexPath.row)
        
        //Method 1
        self.cityTable.beginUpdates()
        self.cityTable.deleteRows(at: [indexPath], with: .automatic)
        self.cityTable.endUpdates()
    
    }

    // add a new city to the city table
    @IBAction func refresh(_ sender: AnyObject) {
      
        
        let alert = UIAlertController(title: "Add City", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter Name of the City Here"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

            if let name = alert.textFields?.first?.text {
                print("city name: \(name)")
                
                self.myCityList.addCityObject(name: name, desc: "Another beautiful city for the list!", image: "newyork.png")
                
               
                let indexPath = IndexPath (row: self.myCityList.getCount() - 1, section: 0)
                self.cityTable.beginUpdates()
                self.cityTable.insertRows(at: [indexPath], with: .automatic)
                self.cityTable.endUpdates()
                
            }
        }))
        
        self.present(alert, animated: true)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndex: IndexPath = self.cityTable.indexPath(for: sender as! UITableViewCell)!
        
        let city = myCityList.getCityObject(item: selectedIndex.row)
        
        
        
        if(segue.identifier == "detailView"){
            if let viewController: DetailViewController = segue.destination as? DetailViewController {
                viewController.selectedTitle = city.cityName
                viewController.selectedDescription = city.cityDescription
                viewController.selectedImage = city.cityImageName
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

