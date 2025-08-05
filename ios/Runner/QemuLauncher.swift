import Foundation

class QemuLauncher {
    static func launch(useGUI: Bool) {
        guard let qemuPath = Bundle.main.path(forResource: "qemu-system-i386", ofType: nil),
              let isoPath = Bundle.main.path(forResource: "tinycore", ofType: "iso") else {
            print("Required files not found.")
            return
        }

        let task = Process()
        task.executableURL = URL(fileURLWithPath: qemuPath)
        var args = ["-m", "128", "-cdrom", isoPath, "-nographic"]
        if useGUI {
            args += ["-vga", "std", "-display", "vnc=127.0.0.1:0"]
        }
        task.arguments = args

        do {
            try task.run()
        } catch {
            print("Failed to launch QEMU: \(error)")
        }
    }
}
