//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Christopher Lora on 12/19/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //landmark book data
        
        landmarkNames.append("Great Wall")
        landmarkNames.append("Taj Mahal")
        landmarkNames.append("Mount Ljen")
        landmarkNames.append("Hirado Castle")
                
        landmarkImages.append(UIImage(named: "greatwall")!)
        landmarkImages.append(UIImage(named: "tajmahal")!)
        landmarkImages.append(UIImage(named: "mountljen")!)
        landmarkImages.append(UIImage(named: "hiradocastle")!)
        
        navigationItem.title = "Landmark Book"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
}

