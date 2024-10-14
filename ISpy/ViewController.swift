//
//  ViewController.swift
//  ISpy
//
//  Created by Gwen Thelin on 10/14/24.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
	@IBOutlet weak var gwenDrawingImage: UIImageView!
	@IBOutlet weak var scrollView: UIScrollView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		scrollView.delegate = self
	}

	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return gwenDrawingImage
	}
	
	func updateZoomFor(size: CGSize) {
		let widthScale: CGFloat = size.width / gwenDrawingImage.bounds.width
		let heightScale: CGFloat = size.height / gwenDrawingImage.bounds.height
		let scale: CGFloat = min(widthScale, heightScale)
		
		scrollView.minimumZoomScale = scale
		scrollView.zoomScale = scale
	}
	
	override func viewDidAppear(_ animated: Bool) {
		updateZoomFor(size: view.bounds.size)
	}

}

