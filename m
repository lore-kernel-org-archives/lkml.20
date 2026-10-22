Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699063;
	b=A6lfWOUIiv+23TxL3axtgi4mOggG07O1hlnvzw9O7KLmMHUtz4JIySLXWPUJbSZnMzXF
	 ZcuAlmTOh/C3C3ZD8S1OC9qdxwYIDsHDc7KJYsbiCD9i5E+lxfJqGfxd/hMoJ5GO4OlBe
	 Bq/WOoGiLVLH9yf1E8Eaa/SIMujHgeqm2buVBZc22VdVPDJMR8DmZrT4eTCZ4Dm5AI3wA
	 y2mZDI/UuoXXx0ge3MZWRSXUnHLRriGMFhUi81eByKtbHgz9wJ0gkO6tLLRc+eUFjDQ2u
	 AQlgjz4+E+hC9Vu2ot8nxZKkEOTktjeNdeywki4FKAeHeSiujRYfP2Z3Or396YeB6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699063;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Z7bkg+7eewHqh3zV5wrmPtrIxCgsH6oKpK/iMAi0XHc=;
	b=zs5zT3RrOuHtu/55gmfRGjv7nEMVjVFX1vlP8CYQPzNBqapuFbQJ2Z8aas1odkpOGu4h
	 FYTfnzTSd/kyZbVg23iWsP02OQPQOTRG8X0iratoG50d0h1w/u6QLRb1Q2/nNkXQsifBe
	 t9xUohgUAkiRT1MbciMZfpSoeifmY/Yr6Ab6OcDmWZo+6KrwrM1cdatmcRhZGaz+dGllm
	 p7GCvy4mwKjdZkNGNpbv8OkQKwtikw/ORuHa/wU9ePLa0CbqErzXjFAggSoxtF5sJEQeK
	 OjJmwn6cCgRBYpLMETWMQ0H9tVo7e/xYUZrURT/hefOLVlRnCJNgyw1/g0GvE3QQfng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J+ZGHmor;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E0B606A31A;
	Thu, 22 Oct 2026 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J+ZGHmor
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BA61F01825;
	Thu, 22 Oct 2026 19:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792699062;
	bh=Z7bkg+7eewHqh3zV5wrmPtrIxCgsH6oKpK/iMAi0XHc=;
	h=Date:From:To:Cc:Subject;
	b=J+ZGHmorlBDuZJcRd1Q/QDcaBpwXs7i1cbkaG11H/J+19S1Jzawmfbv9p20AFj6k/
	 jqd6pMuo2ouxS736MyN4oDsxpBSkM59SG1safGNCqx+yzAGCG7BB3gEPejuS5AEMf0
	 DpJYupXguUFiBNr+Qa2yg86g4KboJaNORdqBYyxKKGLsEoEOFzJFhf1uNZPLbsEzSW
	 yv1VCesHFfIowxvawH+HkRKotnvdIxwd+z3wb61oNnwkDLsjZbPrSJfX0TylE47D2y
	 zBVY286aIjMOBUoqeEtpcmYFy9i4x2JpvzCMZFEHgXwmxxdOB8gP3O3/dYyKNhO7wD
	 1Q+zqesH8Z1jw==
Date: Thu, 22 Oct 2026 14:57:41 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree updates for v7.4
Message-ID: <20261022195741.GA3409202-robh@kernel.org>
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

Linus,

Please pull DT updates for v7.4. There's one merge conflict with 
mailbox tree and the mailbox.txt removal. Take the deleted files.

Rob


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-for-7.4

for you to fetch changes up to e8ff9af18e80279b80cf7063244db91b12f5e27e:

  dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller (2026-10-22 10:30:06 -0500)

----------------------------------------------------------------
Devicetree updates for v7.4:

- A bunch of improvements in dt-check-style. Fix various bindings based
  on these additional checks.

- Convert hisilicon,hix5hd2-ir, hisilicon,hi6220-ade,
  hisilicon,hi6220-dsi, hisilicon,hip05-sas-v1, MediaTek RT5650 codecs,
  mediatek,g3dsys, mediatek,mt2701-scpsys, ti,omap-mpu,
  and ti,omap-ocp2scp to DT schema format

- Add schemas for ST STM32MP2 DWC3 xHCI USB, ST STM32MP25 USB2-FEMTO
  PHY, spacemit,k1-gpu and spacemit,k3-gpu, HiSilicon local bus,
  HiSilicon HIP05 CPLD, SDMC DM2016, and QCom SM7250 and Kuno PDC

- Various binding updates to fix schema warnings in .dts files

- Drop obsolete .txt bindings for STM32(MP1) RCC, VExpress hwmon and
  regulator, and mailbox.txt

- Remove the unused of_overlay_remove_all() function

- Fixes for of_check_msi_parent()

- Add "i2c-parent" tracking to fw_devlink

----------------------------------------------------------------
Abdurrahman Hussain (2):
      of: property: add i2c-parent to fw_devlink supplier bindings
      of: overlay: remove unused of_overlay_remove_all()

Ariel D'Alessandro (1):
      dt-bindings: ASoC: Convert MediaTek RT5650 codecs bindings to DT schema

Baihui Liang (1):
      dt-bindings: gpu: img,powervr-rogue: add spacemit,k1-gpu and spacemit,k3-gpu

Bhargav Joshi (2):
      dt-bindings: bus: ti,omap-ocp2scp: Convert to DT schema
      dt-bindings: arm: ti,omap-mpu: Convert to DT schema

Douglas Anderson (1):
      dt-bindings: mailbox: Delete old 'mailbox.txt' bindings file

Frank Li (1):
      dt-bindings: trivial-devices: Add SDMC DM2016

Fuad Tabba (2):
      of/irq: Fix device node refcount leak in of_check_msi_parent()
      of/irq: Stop the MSI walk at the first msi-parent

Geert Uytterhoeven (3):
      of: property: Drop superfluous !!
      dt-bindings: interrupt-controller: chrp,open-pic: Typo s/pci/pic/
      dt-bindings: interrupt-controller: chrp,open-pic: Fix dangling reference

Genevieve Chan (1):
      dt-bindings: clock: agilex: mark mpu_l2ram_clk deprecated

Hardeep Sharma (1):
      dt-bindings: interrupt-controller: qcom,pdc: Add Kuno compatible string

Hemanth Selam (1):
      of: fdt: fix "Cound" typo in fdt_translate_address()

Karl Mehltretter (1):
      docs: dt: unittest: Use unittest_data_add()

Krzysztof Kozlowski (31):
      dtc: dt-check-style: Handle sorting of top-level nodes and properties
      dtc: dt-check-style: Drop stray backslash before quote for continuation-alignment
      dtc: dt-check-style: Fix alignment of values in continued property lines
      dtc: dt-check-style: Consistently call 'kind' as 'file_type'
      dtc: dt-check-style: Introduce 'stricter' mode
      dtc: dt-check-style: Replace Test User email with Rob Herring
      dtc: dt-check-style: Call _strip_strings_and_comments() only once
      dtc: dt-check-style: Add test for trailing white-space in DTS
      dtc: dt-check-style: Add warning for redundant white-spaces
      dtc: dt-check-style: Sort rule directory by name
      dtc: dt-check-style: Sort rule functions by name
      dtc: dt-check-style: Process property names with a question mark
      dtc: dt-check-style: Add test for node and property name styles
      dtc: dt-check-style: Check for indentation also in continued lines of DTS
      dtc: dt-check-style: Check for indentation also in continued lines of bindings example
      MAINTAINERS: dt-bindings: Include dt-check-style in DT binding entry
      dt-bindings: Drop redundant white-space around values in <>
      dtc: dt-check-style: Handle continued lines in check_hex_case()
      dtc: dt-check-style: Handle continued lines in check_line_length()
      dtc: dt-check-style: Handle continued lines in check_trailing_whitespace()
      dtc: dt-check-style: Unduplicate checks in check_mixed_indent_chars()
      dtc: dt-check-style: Right strip whitespaces, leftovers before comments
      dtc: dt-check-style: Properly detect comments in multi-line properties
      dtc: dt-check-style: Relax property ordering rules (drop alphabetical)
      dtc: dt-check-style: Re-work classifying property continuations
      dtc: dt-check-style: Handle multiple blank lines in continued properties
      media: dt-bindings: Correct white-space style
      media: dt-bindings: Use consistent indentation in the example
      dt-bindings: display: Use consistent indentation in the example
      dt-bindings: display/msm: Use consistent indentation in the example
      dt-bindings: arm: keystone: ti,sci: Correct reg and mboxes constraints

Linus Walleij (1):
      dt-bindings: display: faraday,tve200: Use a level-high interrupt

Long Zhao (1):
      dt-bindings: vendor-prefixes: add Ambarella

Luca Leonardo Scorcia (1):
      dt-bindings: mediatek: hdmi-ddc: Correct the compatibles for mt7623-mt8167

Marek Vasut (1):
      dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller

Pankaj Dev (1):
      dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY

Quchaosheng (1):
      dt-bindings: arm: vexpress: drop the obsolete hwmon and regulator text files

Rob Herring (Arm) (15):
      dt-bindings: mux: reg-mux: Allow zero-cell controls
      dt-bindings: soc: hisilicon: Add HIP05 CPLD
      dt-bindings: arm: cci: Allow syscon fallback
      dt-bindings: arm: mediatek: Fix MT6779 audsys compatible
      dt-bindings: gpu: Allow Hi6220 Mali resets
      dt-bindings: soc: nuvoton: Fix NPCM845 GCR compatibles
      dt-bindings: scsi: Convert hisilicon,hip05-sas-v1 to DT schema
      dt-bindings: reset: Drop obsolete STM32(MP1) RCC bindings
      dt-bindings: bus: Add HiSilicon local bus
      dt-bindings: power: Convert mediatek,mt2701-scpsys to DT schema
      dt-bindings: display: Convert hisilicon,hi6220-dsi to DT schema
      dt-bindings: display: Convert hisilicon,hi6220-ade to DT schema
      dt-bindings: media: Convert hisilicon,hix5hd2-ir to DT schema
      dt-bindings: clock: mediatek: Add MT8516 fallbacks
      dt-bindings: iommu: Describe MT8195 infra IRQs

Sreeshankar K (1):
      dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC

Udaya Kiran Challa (1):
      dt-bindings: arm: mediatek: mediatek,g3dsys: Convert to DT schema

Zhijian Han (1):
      dt-bindings: fix typos in various bindings

 .../devicetree/bindings/arm/arm,cci-400.yaml       |   6 +-
 .../devicetree/bindings/arm/arm,coresight-cti.yaml |   2 +-
 .../devicetree/bindings/arm/keystone/ti,sci.yaml   |   4 +-
 .../bindings/arm/mediatek/mediatek,audsys.yaml     |   2 +-
 .../bindings/arm/mediatek/mediatek,g3dsys.txt      |  30 -
 Documentation/devicetree/bindings/arm/omap/mpu.txt |  54 --
 .../devicetree/bindings/arm/ti/ti,omap-mpu.yaml    |  58 ++
 .../devicetree/bindings/arm/vexpress-config.yaml   |   4 +
 .../bindings/bus/hisilicon,hisi-localbus.yaml      |  44 +
 .../devicetree/bindings/bus/omap-ocp2scp.txt       |  29 -
 .../devicetree/bindings/bus/ti,omap-ocp2scp.yaml   |  74 ++
 .../bindings/clock/mediatek,apmixedsys.yaml        |   2 +-
 .../bindings/clock/mediatek,topckgen.yaml          |   2 +-
 .../display/allwinner,sun6i-a31-mipi-dsi.yaml      |  10 +-
 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml        |   4 +-
 .../bindings/display/bridge/lontium,lt8912b.yaml   |   8 +-
 .../bridge/megachips,stdp2690-ge-b850v3-fw.yaml    |   2 +-
 .../bindings/display/bridge/nxp,tda998x.yaml       |   2 +-
 .../bindings/display/bridge/sil,sii9022.yaml       |   2 +-
 .../bindings/display/bridge/toshiba,tc358764.yaml  |   2 +-
 .../bindings/display/bridge/toshiba,tc358775.yaml  |  12 +-
 .../bindings/display/faraday,tve200.yaml           |   2 +-
 .../devicetree/bindings/display/himax,hx8357.yaml  |   2 +-
 .../bindings/display/hisilicon/dw-dsi.txt          |  72 --
 .../bindings/display/hisilicon/hisi-ade.txt        |  64 --
 .../display/hisilicon/hisilicon,hi6220-ade.yaml    |  95 +++
 .../display/hisilicon/hisilicon,hi6220-dsi.yaml    |  68 ++
 .../bindings/display/imx/fsl,imx-lcdc.yaml         |   2 +-
 .../bindings/display/imx/fsl,imx6q-ldb.yaml        |  52 +-
 .../bindings/display/mediatek/mediatek,ethdr.yaml  |  90 +-
 .../display/mediatek/mediatek,hdmi-ddc.yaml        |  11 +-
 .../bindings/display/mediatek/mediatek,hdmi.yaml   |  24 +-
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    |   6 +-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |   4 +-
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  14 +-
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |   2 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  68 +-
 .../bindings/display/panel/samsung,ams495qa01.yaml |   2 +-
 .../bindings/display/sitronix,st7567.yaml          |   4 +-
 .../devicetree/bindings/display/st,stm32-dsi.yaml  |  52 +-
 .../devicetree/bindings/display/st,stm32-ltdc.yaml |   6 +-
 .../bindings/display/st,stm32mp25-lvds.yaml        |   4 +-
 .../devicetree/bindings/dts-coding-style.rst       |   5 +-
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    |   6 +-
 .../devicetree/bindings/gpio/delta,tn48m-gpio.yaml |   2 +-
 .../devicetree/bindings/gpu/arm,mali-utgard.yaml   |  25 +-
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |  17 +-
 .../devicetree/bindings/hwmon/adi,ltc2991.yaml     |   2 +-
 .../devicetree/bindings/hwmon/vexpress.txt         |  23 -
 .../bindings/i2c/xlnx,xps-iic-2.00.a.yaml          |   4 +-
 .../bindings/iio/light/upisemi,us5182.yaml         |   2 +-
 .../devicetree/bindings/input/matrix-keymap.yaml   |   3 +-
 .../devicetree/bindings/input/ti,tca8418.yaml      |  21 +-
 .../interrupt-controller/chrp,open-pic.yaml        |   7 +-
 .../bindings/interrupt-controller/qcom,pdc.yaml    |   2 +
 .../devicetree/bindings/iommu/mediatek,iommu.yaml  |  18 +-
 .../mailbox/allwinner,sun6i-a31-msgbox.yaml        |   3 -
 .../devicetree/bindings/mailbox/altera-mailbox.txt |  12 +-
 .../bindings/mailbox/hisilicon,hi3660-mailbox.txt  |   2 +-
 .../bindings/mailbox/hisilicon,hi6220-mailbox.txt  |   2 +-
 .../devicetree/bindings/mailbox/mailbox.txt        |  60 --
 .../bindings/mailbox/ti,omap-mailbox.yaml          |   3 +-
 .../bindings/media/amlogic,c3-mipi-csi2.yaml       |   4 +-
 .../devicetree/bindings/media/arm,mali-c55.yaml    |   2 +-
 .../devicetree/bindings/media/atmel,isc.yaml       |  14 +-
 .../bindings/media/brcm,bcm2835-unicam.yaml        |  10 +-
 .../devicetree/bindings/media/cdns,csi2rx.yaml     |  58 +-
 .../bindings/media/hisilicon,hix5hd2-ir.yaml       |  52 ++
 .../devicetree/bindings/media/hix5hd2-ir.txt       |  26 -
 .../bindings/media/i2c/galaxycore,gc05a2.yaml      |   2 +-
 .../devicetree/bindings/media/i2c/ovti,ov2680.yaml |  30 +-
 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml |   6 +-
 .../bindings/media/img,e5010-jpeg-enc.yaml         |  22 +-
 .../bindings/media/mediatek,vcodec-encoder.yaml    |   2 +-
 .../bindings/media/mediatek-jpeg-decoder.yaml      |   4 +-
 .../bindings/media/mediatek-jpeg-encoder.yaml      |   2 +-
 .../bindings/media/microchip,csi2dc.yaml           |  56 +-
 .../devicetree/bindings/media/microchip,xisc.yaml  |  14 +-
 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   |   4 +-
 .../bindings/media/qcom,msm8996-venus.yaml         |  40 +-
 .../bindings/media/qcom,x1e80100-camss.yaml        |  26 +-
 .../bindings/media/raspberrypi,pispbe.yaml         |  12 +-
 Documentation/devicetree/bindings/media/rc.txt     |   1 -
 .../devicetree/bindings/media/samsung,fimc.yaml    |  14 +-
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |  16 +-
 .../devicetree/bindings/media/st,stm32-dcmipp.yaml |  14 +-
 .../devicetree/bindings/media/ti,cal.yaml          |  52 +-
 .../devicetree/bindings/mfd/ti,tps65910.yaml       |   2 +-
 Documentation/devicetree/bindings/mux/reg-mux.yaml |   2 +-
 .../bindings/nvmem/zii,rave-sp-eeprom.yaml         |   2 +-
 .../bindings/pci/hisilicon,kirin-pcie.yaml         |   4 +-
 .../devicetree/bindings/phy/st,stm32-usb2phy.yaml  |  68 ++
 .../bindings/pinctrl/sunplus,sp7021-pinctrl.yaml   |   2 +-
 .../bindings/power/mediatek,mt2701-scpsys.yaml     | 184 ++++
 .../bindings/power/reset/xlnx,zynqmp-power.yaml    |   9 +-
 .../devicetree/bindings/regulator/vexpress.txt     |  32 -
 .../devicetree/bindings/reset/st,stm32-rcc.txt     |   6 -
 .../devicetree/bindings/reset/st,stm32mp1-rcc.txt  |   6 -
 .../bindings/scsi/hisilicon,hip05-sas-v1.yaml      | 158 ++++
 .../devicetree/bindings/scsi/hisilicon-sas.txt     |  98 ---
 .../soc/hisilicon/hisilicon,hip05-cpld.yaml        |  35 +
 .../soc/mediatek/mediatek,mt2701-g3dsys.yaml       |  58 ++
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |  79 --
 .../bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml     |  18 +-
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |   2 +-
 .../bindings/sound/mediatek,mt8173-rt5650.yaml     |  73 ++
 .../devicetree/bindings/sound/mt8173-rt5650.txt    |  31 -
 .../bindings/spi/aspeed,ast2600-fmc.yaml           |   6 +-
 .../devicetree/bindings/thermal/thermal-idle.yaml  |   2 +-
 .../devicetree/bindings/trivial-devices.yaml       |   4 +-
 .../devicetree/bindings/usb/st,stm32mp25-dwc3.yaml |  97 +++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/devicetree/of_unittest.rst           |   2 +-
 Documentation/devicetree/overlay-notes.rst         |   4 -
 .../zh_CN/devicetree/overlay-notes.rst             |   3 -
 MAINTAINERS                                        |   4 +-
 drivers/of/fdt_address.c                           |   2 +-
 drivers/of/irq.c                                   |  39 +-
 drivers/of/overlay.c                               |  23 -
 drivers/of/property.c                              |  23 +-
 include/dt-bindings/clock/agilex-clock.h           |   1 +
 include/linux/of.h                                 |   6 -
 scripts/dtc/dt-check-style                         | 948 ++++++++++++---------
 .../dtc/dt-style-selftest/bad/dts-blank-lines.dts  |  37 +
 .../bad/dts-child-name-order.dtso                  |  33 +
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   |  27 +
 .../dt-style-selftest/bad/dts-digit-node-order.dts |  40 +
 .../bad/dts-digit-node-order.dtso                  |  41 +
 .../bad/dts-extend-node-child-name-order.dtso      |  26 +
 .../bad/dts-extend-node-digit-node-order.dtso      |  34 +
 .../dtc/dt-style-selftest/bad/dts-line-length.dts  |  22 +
 .../dtc/dt-style-selftest/bad/dts-node-name.dts    |  60 ++
 .../dt-style-selftest/bad/dts-property-name.dts    |  28 +
 .../dt-style-selftest/bad/dts-property-order.dts   |  18 +
 .../dt-style-selftest/bad/dts-property-order.dtso  |  62 ++
 .../bad/dts-redundant-ws-strict.dts                |  27 +
 .../dtc/dt-style-selftest/bad/dts-redundant-ws.dts |  28 +
 .../dt-style-selftest/bad/dts-redundant-ws.dtso    |   9 +
 .../dtc/dt-style-selftest/bad/dts-trailing-ws.dts  |  16 +
 .../dtc/dt-style-selftest/bad/dts-unused-label.dts |  21 +
 .../dt-style-selftest/bad/yaml-blank-lines.yaml    |  54 ++
 .../bad/yaml-child-addr-order.yaml                 |   2 +-
 .../bad/yaml-child-name-order.yaml                 |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |   9 +-
 .../bad/yaml-digit-node-order.yaml                 |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-hex-case.yaml   |   7 +-
 .../dt-style-selftest/bad/yaml-indent-strict.yaml  |   2 +-
 .../bad/yaml-label-in-string.yaml                  |   2 +-
 .../dt-style-selftest/bad/yaml-line-length.yaml    |   5 +-
 .../dt-style-selftest/bad/yaml-mixed-indent.yaml   |   4 +-
 .../dt-style-selftest/bad/yaml-multi-close.yaml    |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-node-close.yaml |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-node-name.yaml  |  54 ++
 .../bad/yaml-prop-order-device-type.yaml           |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-prop-order.yaml |   7 +-
 .../dt-style-selftest/bad/yaml-prop-pairing.yaml   |   2 +-
 .../dt-style-selftest/bad/yaml-property-name.yaml  |  46 +
 .../bad/yaml-redundant-ws-strict.yaml              |  31 +
 .../dt-style-selftest/bad/yaml-redundant-ws.yaml   |  35 +
 .../dt-style-selftest/bad/yaml-required-blank.yaml |   2 +-
 scripts/dtc/dt-style-selftest/bad/yaml-tab.yaml    |   2 +-
 .../bad/yaml-trailing-comment.yaml                 |   2 +-
 .../dt-style-selftest/bad/yaml-trailing-ws.yaml    |   7 +-
 .../bad/yaml-unclosed-comment.yaml                 |   2 +-
 .../bad/yaml-unit-addr-prefix.yaml                 |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-unit-addr.yaml  |   2 +-
 .../dt-style-selftest/bad/yaml-unused-label.yaml   |   2 +-
 .../bad/yaml-value-ws-multiline.yaml               |   2 +-
 .../dtc/dt-style-selftest/bad/yaml-value-ws.yaml   |   2 +-
 .../expected/dts-blank-lines.dts.txt               |   6 +
 .../expected/dts-child-name-order.dts.txt          |   1 +
 .../expected/dts-child-name-order.dtso.txt         |   3 +
 .../expected/dts-cont-align.dts.txt                |  11 +
 .../expected/dts-digit-node-order.dts.txt          |   2 +
 .../expected/dts-digit-node-order.dtso.txt         |   2 +
 .../dts-extend-node-child-name-order.dtso.txt      |   2 +
 .../dts-extend-node-digit-node-order.dtso.txt      |   2 +
 .../expected/dts-line-length.dts.txt               |   3 +
 .../expected/dts-mixed-indent.dts.txt              |   1 +
 .../expected/dts-node-name.dts.txt                 |  13 +
 .../expected/dts-property-name.dts.txt             |  14 +
 .../expected/dts-property-order.dts.txt            |  16 +-
 .../expected/dts-property-order.dtso.txt           |  12 +
 .../expected/dts-redundant-ws-strict.dts.txt       |  13 +
 .../expected/dts-redundant-ws.dts.txt              |  10 +
 .../expected/dts-redundant-ws.dtso.txt             |   2 +
 .../expected/dts-trailing-ws.dts.txt               |   3 +
 .../expected/dts-unused-label.dts.txt              |   2 +
 .../expected/yaml-blank-lines.yaml.txt             |   6 +
 .../expected/yaml-cont-align.yaml.txt              |   4 +-
 .../expected/yaml-hex-case.yaml.txt                |   2 +
 .../expected/yaml-line-length.yaml.txt             |   1 +
 .../expected/yaml-mixed-indent.yaml.txt            |   1 +
 .../expected/yaml-node-name.yaml.txt               |   7 +
 .../expected/yaml-prop-order.yaml.txt              |   1 +
 .../expected/yaml-prop-pairing.yaml.txt            |   4 +-
 .../expected/yaml-property-name.yaml.txt           |  14 +
 .../expected/yaml-redundant-ws-strict.yaml.txt     |   5 +
 .../expected/yaml-redundant-ws.yaml.txt            |   4 +
 .../expected/yaml-trailing-ws.yaml.txt             |   2 +
 .../expected/yaml-value-ws-multiline.yaml.txt      |   1 +
 .../good/dts-child-name-order.dtso                 |  44 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  |  14 +-
 .../good/dts-digit-node-order.dts                  |   3 -
 .../good/dts-digit-node-order.dtso                 |  59 ++
 .../good/dts-extend-node-child-name-order.dtso     |  26 +
 .../good/dts-extend-node-digit-node-order.dtso     |  34 +
 .../dt-style-selftest/good/dts-property-order.dts  |   8 +
 .../dt-style-selftest/good/dts-property-order.dtso |  50 ++
 .../dtc/dt-style-selftest/good/yaml-4space.yaml    |   2 +-
 .../dt-style-selftest/good/yaml-cont-align.yaml    |  33 +
 .../good/yaml-tricky-parsing.yaml                  |   2 +-
 scripts/dtc/dt-style-selftest/run.sh               |   2 +-
 213 files changed, 3416 insertions(+), 1589 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/omap/mpu.txt
 create mode 100644 Documentation/devicetree/bindings/arm/ti/ti,omap-mpu.yaml
 create mode 100644 Documentation/devicetree/bindings/bus/hisilicon,hisi-localbus.yaml
 delete mode 100644 Documentation/devicetree/bindings/bus/omap-ocp2scp.txt
 create mode 100644 Documentation/devicetree/bindings/bus/ti,omap-ocp2scp.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/hisilicon/dw-dsi.txt
 delete mode 100644 Documentation/devicetree/bindings/display/hisilicon/hisi-ade.txt
 create mode 100644 Documentation/devicetree/bindings/display/hisilicon/hisilicon,hi6220-ade.yaml
 create mode 100644 Documentation/devicetree/bindings/display/hisilicon/hisilicon,hi6220-dsi.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwmon/vexpress.txt
 delete mode 100644 Documentation/devicetree/bindings/mailbox/mailbox.txt
 create mode 100644 Documentation/devicetree/bindings/media/hisilicon,hix5hd2-ir.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/hix5hd2-ir.txt
 delete mode 100644 Documentation/devicetree/bindings/media/rc.txt
 create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
 create mode 100644 Documentation/devicetree/bindings/power/mediatek,mt2701-scpsys.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/vexpress.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/st,stm32mp1-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/scsi/hisilicon,hip05-sas-v1.yaml
 delete mode 100644 Documentation/devicetree/bindings/scsi/hisilicon-sas.txt
 create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt2701-g3dsys.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
 create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-blank-lines.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dtso
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dtso
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dtso
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dtso
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-node-name.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-property-name.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-redundant-ws-strict.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dtso
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-trailing-ws.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/dts-unused-label.dts
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-blank-lines.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-node-name.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-property-name.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-blank-lines.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dtso.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dtso.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dtso.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dtso.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-node-name.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-property-name.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-redundant-ws-strict.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dtso.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-trailing-ws.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/dts-unused-label.dts.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-blank-lines.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-node-name.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-property-name.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-child-name-order.dtso
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dtso
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dtso
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dtso
 create mode 100644 scripts/dtc/dt-style-selftest/good/dts-property-order.dtso
 create mode 100644 scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
