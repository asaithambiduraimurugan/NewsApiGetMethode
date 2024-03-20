//
//  ViewController.swift
//  NewsApiGetMethode
//
//  Created by Asaithambi on 01/09/2023.
//

import UIKit
import SDWebImage

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let apiResponse = ApiIntegration()
    
    @IBOutlet weak var tableveiw: UITableView!
    var jsonValue : ArticleS?
    var html : String?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        apiCall()
    }
    func apiCall() {
        apiResponse.getdate(urlString: urlString.url, oncompletion: { (result) in
            self.jsonValue = result
            DispatchQueue.main.async {
                self.tableveiw.reloadData()
                print(self.jsonValue as Any)
            }
        }, onerror: {
            (error) in
            self.apiCall()
        })
    }


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jsonValue?.articles?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myTableViewCell
       
        
        let valueDate = dateFromISOString(jsonValue?.articles?[indexPath.row].publishedAt ?? "")
        print("before converted : \(String(describing: valueDate))")
        let valeDate1 = formatDate(valueDate!)
        print("conerted date \(valeDate1)")
        cell.DateLabel.text = valeDate1
        cell.TitleLabel.text = jsonValue?.articles?[indexPath.row].title
        cell.DescrptionLabel.text = jsonValue?.articles?[indexPath.row].description
        if let imageURLString = jsonValue?.articles?[indexPath.row].urlToImage,
                   let imageURL = URL(string: imageURLString) {
                    cell.NewsImage.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder.png")) { (image, error, cacheType, imageUrl) in
                        if let error = error {
                            print("Error loading image: \(error.localizedDescription)")
                            
                            
                }
            }
            
        }
            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       

        
    html = jsonValue?.articles?[indexPath.row].url
       
        self.performSegue(withIdentifier: "one", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destinationVC = segue.destination as? secViewController {
                // Pass the html value to secViewController
                destinationVC.getmethode = html
            }
        }
    override func viewDidAppear(_ animated: Bool) {
        let loader = self.loader()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            
            self.stoploader(loader: loader)
        }
    }
    // Helper function to convert ISO8601 date string to Date
       func dateFromISOString(_ dateString: String) -> Date? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Adjust the format as needed
           return dateFormatter.date(from: dateString)
       }

      // Helper function to format Date to a desired output date format with day of the week
       func formatDate(_ date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "E, MMM d, yyyy h:mm a" // 
           return dateFormatter.string(from: date)
       }
        
        
}
    

extension UIViewController {
    
    func loader() -> UIAlertController{
        
        let alert = UIAlertController.init(title: nil, message: "Processing...", preferredStyle: UIAlertController.Style.alert)
        let LoadingIndicater = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        LoadingIndicater.hidesWhenStopped = true
        LoadingIndicater.style = .large
        LoadingIndicater.startAnimating()
        alert.view.addSubview(LoadingIndicater)
        present(alert, animated: true,completion: nil)
        return alert
    }
   
    func stoploader(loader:UIAlertController){
        
        DispatchQueue.main.async {
            loader.dismiss(animated: true,completion: nil)
        }
      
    }
    
    
}
       




    
    
    


