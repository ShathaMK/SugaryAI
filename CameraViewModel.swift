//
//  CameraViewModel.swift
//  SugaryAI
//
//  Created by Shatha Almukhaild on 04/09/1446 AH.
//


import Foundation
import CoreImage
import Observation

// To create a connection between CameraManger and CameraView
// it publishes the changes to CameraView using the Observation framework it allows us to publish the current frame in real-time
@Observable
class CameraViewModel {
    
    var currentFrame: CGImage?
    private let cameraManger = CameraManager()
    init(){
        Task {
            await handleCameraPreview()
        }
    }
    
    // Handle the update of AsyncStream and move the updates of the published variables to the MainActor updating the UI
    func handleCameraPreview() async {
        for await image in cameraManger.previewStream {
            Task { @MainActor in
                currentFrame = image
            }
        }
        
    }
}
