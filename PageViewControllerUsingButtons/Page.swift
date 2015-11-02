
import UIKit

class Page: UIViewController {
    
    let num : Int
    let total : Int
    @IBOutlet var lab : UILabel!
    @IBOutlet var next : UIButton!
    @IBOutlet var prev : UIButton!

    
    init(num:Int, total:Int) {
        self.num = num
        self.total = total
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.next.hidden = num == total
        self.prev.hidden = num == 1
        
        self.lab.text = "This is Page \(self.num)"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // just proving that we could have used this for direct communication:
        // print(self.parentViewController!.parentViewController!)
    }


}
