//
//  ViewController.swift
//  Mercari
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet private weak var collectionView: UICollectionView!
    fileprivate var contents: [Item] = []
    
    
    let reuseIdentifier = "CollectionViewCellIdentifier"
    
    let dataManager = DataManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fetchAndLoadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchAndLoadData()
    {
        let queue = DispatchQueue(label: "com.mercari.itemQueue")
        queue.async { [weak self] in
            
            self?.contents = (self?.dataManager.fetchItems())!
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
            
        }
    }
    //MARK collection view data source methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as! CollectionViewCell
        let item : Item = contents[indexPath.row]
        cell.configureCell(item:item)
        return cell
    }
    
}
