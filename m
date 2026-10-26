Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027949;
	b=txPqrZoAeM6qRRxl2kLScWpXlCEQ+oF9hG+LnryaPAWiYsSdGcf8ZZ20AP3NiAIBg4Q6
	 iPCZjWvL+pO0Qyky/LcyWMyK7LiYKj1/+nLZsx5RlOPURJ9cdcO2FLDDlHD3L7Ns0fFiW
	 I+A0zwvsiBDEnsYmKrggOriN0oTrB+ecT3D+HhUR7HE3E7ZkjvKZK9IDME8k7PyCztt7y
	 xS2F7+8CWCEg0D+GNKbowDssG8xeJsNyqtQWUQ7Y63Gba6y5PDU+3gg07BdAa8t0hRemt
	 vzdyg1/E6SWmqWxH6n4c06VM1RIJoV9836nbpuKbK5qiiFUlM3aOxwvRl9hcSwq5U2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027949;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=f9cbJ1Zb6DjFnYHAT7yLFvbVSqoznPWlK4ODWL5CHR4=;
	b=mJpEWAATNgVXuQIeRZNQP8vAFogQpecs5OhR6DddqyKyjzxm/a7vA1AT0rpROXicXR/t
	 U1z7hF5+p9lBmKBc6hwxSEXzja9p00ggtzVJxLb+ZI4NH0z4M5o0CmSnrG7kYZEzJTfgB
	 mf/khQdUKDZpzfnPVRNlW0kfG8URjQXiTGV+0XFQkiKb2n/PDvyEGkH/h6tSbYIj/sAeD
	 T6cgnWfrjcrhk7wMQXXZatETwNKbz38Ajv5yq+vzXCMM9H72ZVrtkFK/4e4uZk3azg5CZ
	 R/uMe3AsE/vV+QniWai2dQ2qDma6Ez1PJibzOVc8LQSfq8S+/NbBhakNwktiekdo3AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uag3AGXk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F233606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uag3AGXk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A021F01825;
	Mon, 26 Oct 2026 15:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793027948;
	bh=f9cbJ1Zb6DjFnYHAT7yLFvbVSqoznPWlK4ODWL5CHR4=;
	h=Date:From:To:Cc:Subject;
	b=Uag3AGXkK3ZAKyOwVmGewCJKzlsqhEb3XnNMaDwIjMPyVTmCEsTm6UFnQ0SFI5Mhr
	 YMfvM2LyH1SD7qIy7NcFJr8v+tFQwky2ftWub6WFHx0vfitSFGT4MFiCdXFCbVkpyq
	 4ZhkO9u4qDDS20OJhEtfMZf2hPY9w736MX56kd8x4TZBST1hcY1B5DQqiDEP8tr4+w
	 N6iJYXyTv6RGNQTFetLjr0wuRNlAJ6Sdo6jTkGw+IhzS9J0Pi0WQal+zwwirxpX7zB
	 8Eigt+VwIuJA7qILbYNTXvxZKfmXzdCFRjIhcrqxlMqKz+RBz00ejqoxoL8Bwr9g7Q
	 U/jm8CHF20byg==
Date: Mon, 26 Oct 2026 15:19:04 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] MFD for v7.4
Message-ID: <20261026151904.GC2195460@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Good afternoon Linus,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git mfd-next-7.4

for you to fetch changes up to c8132247fe4df52e9982d74c986bb199d792b85b:

  dt-bindings: mfd: db8500-prcmu: Deprecate EPOD regulators (2026-10-19 17:19:49 +0100)

----------------------------------------------------------------
MFD for v7.4

- New Support & Features
  - Cirrus Logic CS42L43: Add support for the CS42L44 variant
  - Khadas MCU: Add support for the VIM4 MCU variant along with per-variant fan duty-cycle
    levels and optional fan supply regulator support
  - Maxim MAX77705: Add support for the PASS2 hardware revision
  - MediaTek MT6397: Add AUXADC sub-device support for MT6397
  - Motorola CPCAP: Support per-board sub-device compositions and add the Tegra20 Mot
    composition
  - ROHM BD73800: Add support for the BD73800 PMIC core, regulator, RTC, clock gate, and
    GPIO sub-devices
  - TI LM3533: Add VIN regulator supply support, configure initial backlight mapping mode
    from Device Tree, and implement the `backlight_scale` property
  - X-Powers AC200: Add support for the AC200 I2C mixed-signal companion IC

- Improvements & Fixes
  - Cirrus Logic CS42L43: Synchronize SoundWire enumeration work in `remove()` before
    devres cleanup begins
  - Dialog DA903x: Manage IRQ work cancellation and sub-device removal via devres to
    prevent use-after-free during teardown
  - Dialog DA9150: Balance `enable_irq_wake()` with `disable_irq_wake()` during probe
    failure and driver removal
  - Intel LPSS: Add DMI quirks for Dell Latitude 5285 and 7275 to ignore ACPI resource
    conflicts on the I2C4 controller
  - Intel Quark I2C/GPIO: Manage the fixed-rate clock and its clkdev lookup with devres to
    fix a resource leak on unbind
  - Maxim MAX77705: Select `REGMAP_I2C` and `REGMAP_IRQ` in Kconfig to fix build errors
  - Qualcomm WCD934x: Initialize the parent DMA mask to suppress "DMA mask not set"
    warnings on child devices
  - Qualcomm WCD934x: Pass the valid device pointer to `dev_err_probe()` on IRQ lookup
    failure to avoid a NULL pointer dereference
  - Rockchip RK8xx: Register the poweroff handler in the atomic `SYS_OFF_MODE_POWER_OFF`
    phase so polling I2C transfers complete during shutdown
  - ST-Ericsson AB8500: Use `devm_mfd_add_devices()` to prevent leaking child devices on
    probe failure
  - TI BQ257xx: Mark self-modifying BQ25792 configuration registers as volatile
  - TI LM3533: Set `coherent_dma_mask` to zero to suppress "DMA mask not set" warnings
  - TI TPS65217: Check for errors during IRQ initialization and masking, and manage IRQ
    domain and wake teardown with devres
  - TI TWL: Unregister the auxiliary platform device via a devres action on probe failure
    and driver unbind

- Cleanups & Refactoring
  - Core: Convert drivers from deprecated `SIMPLE_DEV_PM_OPS()` to
    `DEFINE_SIMPLE_DEV_PM_OPS()` and `pm_sleep_ptr()`
  - Core: Fix spelling mistakes in comments across various MFD drivers and headers
  - Maintainers: Add ROHM BD73800 PMIC files under the ROHM PMIC entry
  - Maintainers: Specify the `for-mfd-next` branch for the MFD and Syscon git trees
  - Dialog DA9062: Use `DEFINE_RES_IRQ_NAMED()` for IRQ resource definitions
  - Intel LPSS: Simplify DebugFS handling by dropping redundant error checks and
    intermediate dentry variables, using octal permissions, and switching to
    `debugfs_remove()`
  - Khadas MCU: Convert MFD cell arrays to `const` and use `MFD_CELL_NAME()`
  - ST-Ericsson AB8500: Fix a spelling typo in a comment
  - TI LM3533: Convert from platform data to Device Tree bindings and pass only regmap and
    light sensor presence to child devices
  - TI LM3533: Remove driver-specific regmap wrappers, redundant pdata helpers, and
    unnecessary `extern` qualifiers, and use `dev_groups` for sysfs attributes
  - Wolfson WM831x: Fix a spelling typo in a comment

- Device Tree Binding Updates
  - HiSilicon Hi6421 SPMI: Fix the compatible string to match `hisilicon,hi6421-spmi`
  - MediaTek MT6357: Allow an `adc` child node
  - MediaTek MT6360: Allow two-cell interrupt specifiers with trigger flags
  - MediaTek MT6397: Document the `#sound-dai-cells` property
  - MediaTek MT6397: Document the battery-backed NVMEM layout under the RTC child node
  - MediaTek MT6397: Document the MT6323 PMIC EFUSE child node
  - Motorola CPCAP: Convert MFD and power button bindings to DT schema and document the
    Mapphone and Mot compositions
  - Qualcomm SPMI PMIC: Document the PM4125 audio codec compatible
  - Qualcomm SPMI PMIC: Document the PMAU0102 PMIC compatible
  - Qualcomm TCSR: Document the MSM8952 TCSR compatible
  - Rockchip RK805: Fold the pin controller binding into the RK805 PMIC DT schema
  - ROHM BD73800: Document the BD73800 PMIC and its regulators
  - ROHM PMIC: Factor out common pin properties into `rohm,pmic-pins.yaml` and reference
    them across BD71815, BD71828, and BD72720 bindings
  - ST-Ericsson AB8500: Document AB8500 and AB8505 buck converter regulators
  - ST-Ericsson AB8500: Document codec audio graph ports, sound DAI cells, and analog
    microphone wiring properties
  - ST-Ericsson DB8500 PRCMU: Deprecate the `db8500-prcmu-regulators` child node and make
    it optional
  - Syscon: Document the Ambarella CV75 secure scratchpad compatible
  - TI BQ25703A: Add the BQ25798 compatible with fallback to BQ25792
  - TI Keystone: Convert Device State Control bindings to DT schema
  - TI LM3533: Document the LM3533 LED controller, backlight, and indicator LED bindings
  - TI LP3943: Convert MFD and PWM bindings to DT schema
  - TI TPS61050: Convert bindings to DT schema
  - TI TPS65086: Make the `regulators` child node optional
  - TI TPS65910: Document `wakeup-source` and GPIO hog child nodes
  - TI TWL6040: Convert bindings to DT schema and align property names with the driver
  - X-Powers AC200: Document the AC200 mixed-signal companion IC

----------------------------------------------------------------
Alexey Charkov (2):
      dt-bindings: mfd: ti,bq25703a: Expand to include BQ25798
      mfd: bq257xx: Mark self-modifying BQ25792 registers volatile

Bhargav Joshi (2):
      dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
      dt-bindings: mfd: ti,tps65910: Add wakeup-source and GPIO hogs

Chaosheng Qu (1):
      dt-bindings: mfd: Convert lp3943 to DT schema

Charles Keepax (2):
      mfd: cs42l43: Add support for new cs42l44 variant
      mfd: cs42l43: Move cancel_work_sync() into remove

D. Manresa (1):
      mfd: intel-lpss: Add Dell Latitude 7275 to the resource conflict quirk

David Heidelberg (3):
      mfd: Fix MAX77705 dependency on regmap
      mfd: wcd934x: set DMA mask on parent to silence "DMA mask not set"
      mfd: wcd934x: Fix NULL pointer dereference on IRQ probe deferral

Denys Romaniuk (1):
      mfd: max77705: Mark PASS2 revision as supported

Dhruvin Rajpura (1):
      dt-bindings: mfd: qcom,spmi-pmic: Document PMAU0102

Eduard Bostina (2):
      dt-bindings: mfd: Convert TPS61050 to DT schema
      dt-bindings: mfd: Convert TI TWL6040 to DT schema

Eric Anderson (1):
      mfd: rk8xx: Register poweroff handler in atomic phase

Guangshuo Li (1):
      mfd: ab8500: Fix child device leaks on probe failure

Hemanth Selam (3):
      mfd: wm831x: Fix typo "convertor" in comment
      mfd: ab8500: Fix typo "interupts" in comment
      mfd: Fix a bunch of typos in comments

Hiroki Nakajima (1):
      mfd: da9062: Use DEFINE_RES_IRQ_NAMED()

Hongyan Xu (1):
      mfd: da903x: Cancel IRQ work during teardown

James Hilliard (2):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: ac200: Add X-Powers AC200 support

Lee Jones (1):
      Merge branches 'ib-mfd-thermal-7.4', 'ib-mfd-clk-gpio-regulator-rtc-7.4' and 'ib-mfd-backlight-iio-leds-7.4' into ibs-for-mfd-merged

Linus Walleij (3):
      mfd: dt-bindings: ab8500: Describe codec graph and microphone wiring
      dt-bindings: mfd: ab8500: Add regulators
      dt-bindings: mfd: db8500-prcmu: Deprecate EPOD regulators

Long Zhao (1):
      dt-bindings: mfd: syscon: Add Ambarella CV75 secure scratchpad

Maria Lisina (4):
      mfd: intel-lpss: Remove redundant DebugFS error check
      mfd: intel-lpss: Use plain octal values for file permissions
      mfd: intel-lpss: Remove extra DebugFS dentry
      mfd: intel-lpss: Switch to debugfs_remove()

Matthias Goergens (1):
      MAINTAINERS: Name the lee/mfd for-mfd-next branch

Matti Vaittinen (10):
      dt-bindings: mfd: Common ROHM PMIC properties
      dt-bindings: rohm,bd*: Ref common ROHM bindings
      dt-bindings: regulator: ROHM BD73800 regulators
      dt-bindings: mfd: ROHM BD73800 PMIC
      mfd: Support for ROHM BD73800 PMIC core
      rtc: bd70528: Support RTC on ROHM BD73800
      regulator: bd71828: Support ROHM BD73800
      clk: bd718x7: Support ROHM BD73800
      gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
      MAINTAINERS: Add ROHM BD73800 PMIC files

Muzaffer Kadir (1):
      dt-bindings: mfd: qcom,tcsr: Add compatible for MSM8952

Myeonghun Pak (3):
      mfd: intel_quark_i2c_gpio: Manage the fixed-rate clock
      mfd: twl-core: Unregister the auxiliary platform device on unbind
      mfd: da9150: Balance IRQ wake on teardown

Quchaosheng (1):
      dt-bindings: mfd: rockchip,rk805: Convert pinctrl to DT schema

Radiy Zhambakiev (3):
      mfd: tps65217: Fix NULL pointer dereference on IRQ init failure
      mfd: tps65217: Check return value when masking interrupt sources
      mfd: tps65217: Use devres for IRQ domain and wake teardown

Rob Herring (Arm) (5):
      dt-bindings: mfd: ti,tps65086: Make regulators optional
      dt-bindings: mfd: mediatek: Allow MT6357 ADC
      dt-bindings: mfd: Allow MT6360 interrupt flags
      dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible
      dt-bindings: mfd: Add MT6397 sound DAI cells

Roman Vivchar (1):
      dt-bindings: mfd: mediatek: mt6397: Add mt6323 PMIC EFUSE

Ronald Claveau (4):
      mfd: khadas-mcu: Add per-variant configuration infrastructure and VIM4 support
      mfd: khadas-mcu: Use MFD_CELL_* macros for cell declarations
      mfd: khadas-mcu: Add support for VIM4 MCU variant
      thermal: khadas-mcu-fan: Add fan config from platform data Add regulator support

Ryan Brue (2):
      mfd: mt6397-core: Add mt6397 AUXADC support
      dt-bindings: mfd: mediatek: mt6397: describe the RTC's nvmem layout

Srinivas Kandagatla (1):
      dt-bindings: mfd: qcom,spmi-pmic: Add compatibles for pm4125-codec

Svyatoslav Ryhel (18):
      dt-bindings: leds: Document TI LM3533 LED controller
      mfd: lm3533: Remove driver specific regmap wrappers
      mfd: lm3533: Remove extern from shared functions in the header
      mfd: lm3533: Pass only regmap and light sensor presence to child devices
      iio: light: lm3533-als: Remove redundant pdata helpers
      mfd: lm3533-core: Remove redundant pdata helpers
      mfd: lm3533: Use dev_groups in struct device_driver
      mfd: lm3533: Convert to use OF bindings
      mfd: lm3533: Add support for VIN power supply
      mfd: lm3533: Set DMA mask
      video: backlight: lm3533_bl: Improve logic of sysfs functions
      video: backlight: lm3533_bl: Set initial mapping mode from DT
      video: backlight: lm3533_bl: Implement backlight_scale property
      dt-bindings: input: cpcap-pwrbutton: Convert to DT schema
      dt-bindings: mfd: motorola-cpcap: Convert to DT schema
      dt-bindings: mfd: motorola-cpcap: Document Mapphone and Mot CPCAP
      mfd: motorola-cpcap: Diverge configuration per-board
      mfd: motorola-cpcap: Add support for Mot CPCAP composition

Thierry Chatard (1):
      mfd: intel-lpss: Add resource conflict quirk for Dell Latitude 5285

Triet Hoang (1):
      mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

 .../devicetree/bindings/input/cpcap-pwrbutton.txt  |  20 -
 .../bindings/input/motorola,cpcap-pwrbutton.yaml   |  32 ++
 .../leds/backlight/ti,lm3533-backlight.yaml        |  69 +++
 .../devicetree/bindings/leds/ti,lm3533-leds.yaml   |  67 +++
 .../devicetree/bindings/leds/ti,lm3533.yaml        | 169 +++++++
 .../bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml   |   4 +-
 Documentation/devicetree/bindings/mfd/lp3943.txt   |  33 --
 .../devicetree/bindings/mfd/mediatek,mt6357.yaml   |   7 +
 .../devicetree/bindings/mfd/mediatek,mt6360.yaml   |   5 +-
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |  33 ++
 .../devicetree/bindings/mfd/motorola,cpcap.yaml    | 408 +++++++++++++++
 .../devicetree/bindings/mfd/motorola-cpcap.txt     |  78 ---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   5 +-
 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |   1 +
 .../devicetree/bindings/mfd/rockchip,rk805.yaml    |  60 ++-
 .../devicetree/bindings/mfd/rohm,bd71815-pmic.yaml |   9 +-
 .../devicetree/bindings/mfd/rohm,bd71828-pmic.yaml |   9 +-
 .../devicetree/bindings/mfd/rohm,bd72720-pmic.yaml |  29 +-
 .../devicetree/bindings/mfd/rohm,bd73800-pmic.yaml | 218 ++++++++
 .../devicetree/bindings/mfd/rohm,pmic-pins.yaml    |  72 +++
 .../devicetree/bindings/mfd/stericsson,ab8500.yaml | 150 +++++-
 .../bindings/mfd/stericsson,db8500-prcmu.yaml      |  22 +-
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
 .../devicetree/bindings/mfd/ti,bq25703a.yaml       |  14 +-
 .../bindings/mfd/ti,keystone-devctrl.yaml          |  90 ++++
 .../devicetree/bindings/mfd/ti,lp3943.yaml         |  64 +++
 .../devicetree/bindings/mfd/ti,tps61050.yaml       |  92 ++++
 .../devicetree/bindings/mfd/ti,tps65086.yaml       |   1 -
 .../devicetree/bindings/mfd/ti,tps65910.yaml       |   8 +
 .../devicetree/bindings/mfd/ti,twl6040.yaml        | 156 ++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           |  19 -
 Documentation/devicetree/bindings/mfd/tps6105x.txt |  62 ---
 Documentation/devicetree/bindings/mfd/twl6040.txt  |  67 ---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 168 +++++++
 .../devicetree/bindings/pinctrl/pinctrl-rk805.txt  |  63 ---
 .../devicetree/bindings/pwm/pwm-lp3943.txt         |  58 ---
 .../devicetree/bindings/pwm/pwm-lp3943.yaml        |  80 +++
 .../bindings/regulator/rohm,bd73800-regulator.yaml |  99 ++++
 MAINTAINERS                                        |  14 +-
 drivers/clk/clk-bd718x7.c                          |   8 +
 drivers/gpio/Kconfig                               |  12 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-bd73800.c                        | 209 ++++++++
 drivers/iio/light/lm3533-als.c                     | 185 +++----
 drivers/leds/leds-lm3533.c                         | 121 ++---
 drivers/mfd/88pm800.c                              |   4 +-
 drivers/mfd/Kconfig                                |  31 +-
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ab8500-core.c                          |  46 +-
 drivers/mfd/ac200.c                                | 222 ++++++++
 drivers/mfd/bq257xx.c                              |  10 +
 drivers/mfd/cs42l43-i2c.c                          |  10 +
 drivers/mfd/cs42l43-sdw.c                          |   9 +
 drivers/mfd/cs42l43.c                              |  30 +-
 drivers/mfd/cs42l43.h                              |   1 +
 drivers/mfd/da903x.c                               |  34 +-
 drivers/mfd/da9062-core.c                          |  24 +-
 drivers/mfd/da9150-core.c                          |   8 +-
 drivers/mfd/intel-lpss-acpi.c                      |  38 ++
 drivers/mfd/intel-lpss.c                           |  24 +-
 drivers/mfd/intel_quark_i2c_gpio.c                 |  52 +-
 drivers/mfd/iqs62x.c                               |   8 +-
 drivers/mfd/kempld-core.c                          |   2 +-
 drivers/mfd/khadas-mcu.c                           | 104 +++-
 drivers/mfd/lm3533-core.c                          | 386 ++++++--------
 drivers/mfd/lm3533-ctrlbank.c                      |  33 +-
 drivers/mfd/max77705.c                             |   2 +-
 drivers/mfd/max77843.c                             |   8 +-
 drivers/mfd/max8998.c                              |   2 +-
 drivers/mfd/motorola-cpcap.c                       | 143 +++---
 drivers/mfd/mt6360-core.c                          |   8 +-
 drivers/mfd/mt6397-core.c                          |   3 +
 drivers/mfd/rave-sp.c                              |   6 +-
 drivers/mfd/rk8xx-core.c                           |   2 +-
 drivers/mfd/rk8xx-i2c.c                            |   4 +-
 drivers/mfd/rn5t618.c                              |   8 +-
 drivers/mfd/rohm-bd71828.c                         | 147 +++++-
 drivers/mfd/si476x-i2c.c                           |   2 +-
 drivers/mfd/ti_am335x_tscadc.c                     |   8 +-
 drivers/mfd/tps65217.c                             |  69 ++-
 drivers/mfd/tps6586x.c                             |   8 +-
 drivers/mfd/twl-core.c                             |  31 +-
 drivers/mfd/wcd934x.c                              |   8 +-
 drivers/mfd/wm831x-auxadc.c                        |   2 +-
 drivers/regulator/Kconfig                          |   4 +-
 drivers/regulator/bd71828-regulator.c              | 558 ++++++++++++++++++++-
 drivers/rtc/rtc-bd70528.c                          |   8 +
 drivers/thermal/khadas_mcu_fan.c                   | 108 +++-
 drivers/video/backlight/lm3533_bl.c                | 188 +++----
 include/linux/mfd/cs42l43-regs.h                   |   1 +
 include/linux/mfd/da9063/registers.h               |   2 +-
 include/linux/mfd/da9150/core.h                    |   1 +
 include/linux/mfd/db8500-prcmu.h                   |  32 +-
 include/linux/mfd/khadas-mcu.h                     |  19 +-
 include/linux/mfd/lm3533.h                         |  77 +--
 include/linux/mfd/lp8788.h                         |   2 +-
 include/linux/mfd/max8998.h                        |   2 +-
 include/linux/mfd/motorola-cpcap.h                 |   7 +
 include/linux/mfd/palmas.h                         |   2 +-
 include/linux/mfd/rohm-bd71828.h                   |   2 +-
 include/linux/mfd/rohm-bd73800.h                   | 306 +++++++++++
 include/linux/mfd/rohm-generic.h                   |   1 +
 include/linux/mfd/samsung/core.h                   |   2 +-
 include/linux/mfd/si476x-core.h                    |   4 +-
 include/linux/mfd/twl.h                            |   2 +-
 105 files changed, 4582 insertions(+), 1376 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backlight.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/lp3943.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd73800-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,pmic-pins.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,lp3943.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps61050.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/mfd/tps6105x.txt
 delete mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-lp3943.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-lp3943.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml
 create mode 100644 drivers/gpio/gpio-bd73800.c
 create mode 100644 drivers/mfd/ac200.c
 create mode 100644 include/linux/mfd/rohm-bd73800.h

-- 
Lee Jones
