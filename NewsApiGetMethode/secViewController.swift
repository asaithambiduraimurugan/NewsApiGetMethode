//
//  secViewController.swift
//  NewsApiGetMethode
//
//  Created by Asaithambi on 04/09/2023.
//

import UIKit
import WebKit
class secViewController: UIViewController {
    
    @IBOutlet weak var WebKite: WKWebView!
    
    var getmethode: String?
    override func viewDidLoad() {
        super.viewDidLoad()
       

        if let url = getmethode{
           
            WebKite.load(URLRequest (url: URL(string: url)! as URL) as URLRequest)
            }
            
            else{
                
                print("error")
            }
        
        
        }
    override func viewDidAppear(_ animated: Bool) {
        let loader = self.loader()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            
            self.stoploader(loader: loader)
        }
    }
        
        
}




// 1. MVVM Pattern
// 2.Select - Gray remove
// 3.Data formatter Change
// 4.Add loader when Api loads
// 5.Synchronous URL loading of https://imgd.aeplcdn.com/642x336/n/cw/ec/156593/tata-nexon-facelift-right-front-three-quarter0.jpeg?isig=0&art=1&q=80 should not occur on this application's main thread as it may lead to UI unresponsiveness. Please switch to an asynchronous networking API such as URLSession. // Warning needs to fix

    


