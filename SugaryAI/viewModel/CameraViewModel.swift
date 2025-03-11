//
//  CameraViewModel.swift
//  SugaryAI
//
//  Created by Shatha Almukhaild on 04/09/1446 AH.
//


import Foundation
import CoreImage
import Observation
import UIKit

// To create a connection between CameraManger and CameraView
// it publishes the changes to CameraView using the Observation framework it allows us to publish the current frame in real-time
@Observable
class CameraViewModel: ObservableObject {
    // to track flash state if you want UI feedback
    var isFlashOn: Bool = false
    var currentFrame: CGImage?
    var selectedImage: UIImage?
    var capturedImage: UIImage?
    private let cameraManager = CameraManager()
    
    
    init(){
        Task {
            await handleCameraPreview()
        }
    }
    
    // Handle the update of AsyncStream and move the updates of the published variables to the MainActor updating the UI
    func handleCameraPreview() async {
        for await image in cameraManager.previewStream {
            Task { @MainActor in
                currentFrame = image
            }
        }
        
    }
    
    // Expose the toggle flash functionality to the view
       func toggleFlash() {
           cameraManager.toggleFlash()
           // Optionally update the flash state here for UI feedback
           isFlashOn.toggle()
       }
    
    
    
    func capturePhoto() { // Capture Photo Method
        cameraManager.capturePhoto { image in
            DispatchQueue.main.async {
                self.capturedImage = image
            }
        }
    }
    
    
    
}// end of CameraViewModel class
