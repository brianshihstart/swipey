//
//  collectiveSwipe.swift
//  tutorialUIPage
//
//  Created by Brian Shih on 7/15/16.
//  Copyright © 2016 BrianShih. All rights reserved.
//

import UIKit
import Foundation

class collectiveSwipe: UIPageViewController {

    
    var arrayOfColors: [shapeColorMovements] = []

    var pageControl: UIPageControl!
    
    var pageCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([tutorialStepForPage(0)], direction: .Forward, animated: false, completion: nil)

        
        dataSource = self
        
        
                let pageControlHeight: CGFloat = 50
        pageControl = UIPageControl(frame: CGRect(x: 0, y: CGRectGetHeight(view.frame) - pageControlHeight, width: CGRectGetWidth(view.frame), height: pageControlHeight))
        pageControl.numberOfPages = pageCount
        pageControl.currentPage = 0
        view.addSubview(pageControl)
//        pageControl.addTarget(self, action: "pageControlChanged:", forControlEvents: .ValueChanged)
//        delegate = self

        }
        
    
        private func tutorialStepForPage(inPage: Int) -> instructionViewController {
            let tutorialStep = storyboard!.instantiateViewControllerWithIdentifier("instruction") as! instructionViewController
            
            let page = min(max(0, inPage), pageCount - 1)
            tutorialStep.page = page
            
            print("LOL")
            print(arrayOfColors.count)
            
                if arrayOfColors.count > 0
            {
            print("triangle: \(arrayOfColors[inPage].triangle)")
            print("circle: \(arrayOfColors[inPage].circle)")
            print("square: \(arrayOfColors[inPage].square)")

            tutorialStep.triangleMoveString = arrayOfColors[inPage].triangle
            tutorialStep.circleMoveString = arrayOfColors[inPage].circle
            tutorialStep.squareMoveString = arrayOfColors[inPage].square
                
                
            }
            
            return tutorialStep
        
    }
}

    extension collectiveSwipe: UIPageViewControllerDataSource {
        func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            if let currentTutorialPage = viewController as? instructionViewController {
                if currentTutorialPage.page < pageCount - 1 {
                    return tutorialStepForPage(currentTutorialPage.page + 1)
                }
            }
            return nil
        }
        func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            if let currentTutorialPage = viewController as? instructionViewController {
                if currentTutorialPage.page > 0 {
                    return tutorialStepForPage(currentTutorialPage.page - 1)
                    
                }
            }
            return nil
        }
        
        
        
//        func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//            return pageCount
//        }
//        
//        func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//            
//            if let currentTutorialPage = pageViewController.viewControllers![0] as? tutorialPage {
//                return currentTutorialPage.page
//            }
//            return 0
//        }
//        
        
            
        }
        
        
//        
//        func presentationCountForPageViewController(pageViewController:
//            UIPageViewController) -> Int {
//            return pageCount
//        }
//        func presentationIndexForPageViewController(pageViewController:
//            UIPageViewController) -> Int {
//            if let currentTutorialPage =
//                pageViewController.viewControllers[0] as?
//                TutorialStepViewController {
//                return currentTutorialPage.page
//            }
//            return 0
//        }
        
    
    



























