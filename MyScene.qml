import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12

Entity {
id: root
Camera {
    id: camera
    projectionType: CameraLens.PerspectiveProjection
    fieldOfView: 45
    aspectRatio: 16/9
    nearPlane : 0.1
    farPlane : 1000.0
    position: Qt.vector3d(0.0, 0.0, 40.0)
    upVector: Qt.vector3d(0.0, 1.0, 0.0)
    viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
}

OrbitCameraController {
    camera: camera
}

components: [
    RenderSettings {
        activeFrameGraph: ForwardRenderer {
            clearColor: Qt.rgba(0, 0, 0, 1)
            camera: camera
        }
    },
    InputSettings {}
]

PhongMaterial {
    id: material
    ambient: Qt.rgba(1, 1, 1, 1)
    diffuse: Qt.rgba(1, 1, 1, 1)
}

SphereMesh {
    id: mesh
    radius: 5
}

Transform {
    id: transform
    translation: Qt.vector3d(0, 0, 0)
}

Entity {
    components: [mesh, material, transform]
}
}
