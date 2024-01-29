 configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    include "C:\\GameDev\\SmokLibraries\\Engine\\SmokGraphics"
    include "C:\\GameDev\\SmokLibraries\\Engine\\SmokWindow"

project "SmokTyGUI"
            kind "StaticLib"
            language "C++"
            
            targetdir ("bin/" .. outputdir .. "/%{prj.name}")
            objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")
            
            
            files 
            {
                "includes/**.h",
                "src/**.c",
                "includes/**.hpp",
                "src/**.cpp",
            }
            
            files 
            {
              "C:\\GameDev/Libraries/imgui/imgui.h",
              "C:\\GameDev/Libraries/imgui/imgui.cpp",
              "C:\\GameDev/Libraries/imgui/imgui_demo.cpp",
              "C:\\GameDev/Libraries/imgui/imgui_draw.cpp",
              "C:\\GameDev/Libraries/imgui/imgui_widgets.cpp",
              "C:\\GameDev/Libraries/imgui/imgui_tables.cpp",
              "C:\\GameDev/Libraries/imgui/backends/imgui_impl_vulkan.h",
              "C:\\GameDev/Libraries/imgui/backends/imgui_impl_vulkan.cpp",
              "C:\\GameDev/Libraries/imgui/backends/imgui_impl_glfw.h",
             "C:\\GameDev/Libraries/imgui/backends/imgui_impl_glfw.cpp",
            }
        
            includedirs
            {
                "includes",
                
                "C:\\GameDev\\SmokLibraries\\Engine\\SmokGraphics\\includes",
                "C:\\GameDev\\SmokLibraries\\Engine\\SmokWindow\\includes",
                "C:\\GameDev\\Libraries\\glm",
                "C:\\GameDev\\Libraries\\glfw\\include",
    
                "C:\\VulkanSDK\\1.3.239.0\\Include",
                "C:\\GameDev\\Libraries\\VulkanMemoryAllocator\\include",

                "C:\\GameDev\\BTDSTD/includes",
                "C:\\GameDev\\BTDSTD_C/includes",

                "C:\\GameDev/Libraries/imgui",
                "C:\\GameDev/Libraries/imgui/backends",
            }
            
            links
            {
                "SmokGraphics",
                "SmokWindow"
            }
            
            defines
            {
                "GLFW_STATIC",
                "GLFW_INCLUDE_NONE",
            }
            
            flags
            {
                --"LinkTimeOptimization",
                "NoRuntimeChecks",
                "MultiProcessorCompile"
            }

            --platforms
            filter "system:windows"
                cppdialect "C++17"
                staticruntime "On"
                systemversion "latest"
            
                defines
                {
                    "Window_Build",
                    "Desktop_Build"
                }
            
            --configs
            filter "configurations:Debug"
                defines "SMOK_DEBUG"
                symbols "On"
            
                links
                {
             
                }
            
            filter "configurations:Release"
                defines "SMOK_RELEASE"
                optimize "On"
            
                flags
                {
                    "LinkTimeOptimization"
                }
            
            filter "configurations:Dist"
                defines "SMOK_DIST"
                optimize "On"
            
                defines
                {
                    "NDEBUG"
                }
            
                flags
                {
                    "LinkTimeOptimization"
                }
            
                links
                {
                   
                }