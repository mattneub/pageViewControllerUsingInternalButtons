

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    weak var pvc : UIPageViewController!
    let TOTAL = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pvc = self.childViewControllers[0] as! UIPageViewController
        self.pvc.dataSource = self
        let p = Page(num: 1, total: TOTAL)
        pvc.setViewControllers([p], direction: .Forward, animated: false, completion: nil)
    }

    func pageViewController(p: UIPageViewController, viewControllerAfterViewController vc: UIViewController) -> UIViewController? {
        let cur = vc as! Page
        let num = cur.num
        if num == TOTAL {
            return nil
        }
        return Page(num: num+1, total: TOTAL)
    }
    func pageViewController(p: UIPageViewController, viewControllerBeforeViewController vc: UIViewController) -> UIViewController? {
        let cur = vc as! Page
        let num = cur.num
        if num == 1 {
            return nil
        }
        return Page(num: num-1, total: TOTAL)
    }
    func goNextPage(_:AnyObject) {
        let cur = self.pvc.viewControllers![0]
        let p = self.pageViewController(self.pvc, viewControllerAfterViewController: cur)
        self.pvc.setViewControllers([p!], direction: .Forward, animated: true, completion: nil)
    }
    func goPrevPage(_:AnyObject) {
        let cur = self.pvc.viewControllers![0]
        let p = self.pageViewController(self.pvc, viewControllerBeforeViewController: cur)
        self.pvc.setViewControllers([p!], direction: .Reverse, animated: true, completion: nil)
    }



}

