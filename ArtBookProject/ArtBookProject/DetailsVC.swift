//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Christopher Lora on 12/27/21.
//

import UIKit
import CoreData

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var chosenLandmark = ""
    var chosenLandmarkId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if chosenLandmark != "" {
            
            saveButton.isHidden = true
            
            //core data
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Landmarks")
            let idString = chosenLandmarkId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", argumentArray: idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let result = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        
                        if let landmarkName = result.value(forKey: "landmarkName") as? String {
                            nameText.text = name
                        }
                        
                        if let landmarkCountry = result.value(forKey: "landmarkCountry") as? String {
                            landmarkCountry.text = landmarkCountry
                        }
                        
                        if let yearCreated = result.value(forKey: "yearCreated") as? Int {
                            yearCreated.text = String(yearCreated)
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                }
                
            } catch {
                print("error")
            }
            
        } else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
            nameText.text = ""
            locationText.text = ""
            yearText.text = ""
        }
        
        //recognizers
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
    }
    
    @objc func selectImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newLandmark = NSEntityDescription.insertNewObject(forEntityName: "Landmarks", into: context)
        
        //attributes
        
        newLandmark.setValue(nameText.text!, forKey: "landmarkName")
        newLandmark.setValue(locationText.text!, forKey: "landmarkCountry")
        
        if let year = Int(yearText.text!) {
            newLandmark.setValue(yearText, forKey: "yearCreated")
        }
        
        newLandmark.setValue(UUID(), forKey: "id")
        
        let data = imageView.image!.jpegData(compressionQuality: 0.4)
        
        newLandmark.setValue(data, forKey: "image")
        
        do {
            try context.save()
            print("success")
        } catch {
            print("error")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}
