# TWRP Device configuration for Motorola Moto G9 Power

## Device specification

Basic   | Spec Sheet
-------:|:------------------------
CPU     | Octa-core (4x2.0 GHz Kryo 260 Gold & 4x1.8 GHz Kryo 260 Silver)
CHIPSET | Qualcomm SDM662 (SM6115 "Bengal") Snapdragon 662
GPU     | Adreno 610
Memory  | 4GB
Shipped Android Version | 10.0
Storage | 64GB
Battery | 6000 mAh
Dimensions | 172.1 x 76.8 x 9.7 mm
Display | 720 x 1640 pixels, 20.5:9 ratio
Rear Camera  | 64 MP, f/1.8, 26mm (wide), 1/1.97", 0.7µm, PDAF + 2 MP, f/2.4, (macro), AF + 2 MP, f/2.4, (depth)
Front Camera | 16 MP, 1.0µm

![Device Picture](https://fdn2.gsmarena.com/vv/bigpic/motorola-moto-g9-power.jpg)

### How to compile

```
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch omni_cebu-eng
mka clean && mka recoveryimage
```

### Test build

```
cd out/target/product/cebu
fastboot boot recovery.img
```
NOTE: TWRP can also be installed!
