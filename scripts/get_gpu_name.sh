echo $(brightnessctl -l | grep amd | sed "s/.*\(amdgpu_bl.\).*/\1/")
