Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200607;
	b=2d8LUM7CSb5Rp8yGNvScmA+L4HIwWef2YwOQa6aCXfe8x+QwX98Mg21YndsGjxlB5eiq
	 aSJQeQmrbuKqmL/bptjvCehEq09IdolwJw/Sc2Sbs8nvLNT94W0T7FNbKiVzDJ6s++pT0
	 Bs1nenANFbD+TYzHon41f53QH0KbJX1cA/4XYg2jFMfkcEeQMMbpRPlvswvg7yK2iW8jF
	 Udocv/HJG3IKjU+eL9kmNNEKEJ4/Jwyd4iuc/F6YW18HFNNOWlI4nwI6JfV8aCnj2uEDI
	 yp9+N6Tks1BEWZDvHBjVIZAOG5p0N5IfAVkvzDtqNcK7tdLmUqoxphP3YiYI5u09qzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200607;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=7EQbMnCuzcMZOQOEeE0kdmPMwIC+wpFjoGWdg8ksMJk=;
	b=nKCgbXAjWCrGdbD7uEHDpGpw1PRrg9h0133jQ5sAPDT4ZMFltt1qBR2ks7LpehvjHpoE
	 Iwwvqrl7ijs3f8IJCQYa/hO67VThVut7yusl6S1SVdirD9SOLSTag7L8imGK6yV7I63PZ
	 chw7wIQw4ouiqmgnuh9LzYiNdxPrroGC910zY5OqdYK8cg+tvP6Ae/aZOeOMHbOmCOYI+
	 IhepR+Ah0ijApAvOZsxxdb82O4dbuNK245K9rOxFRaPJdfXxiEYYbQ3WhNgVeIOomKwhG
	 dv6Fl9Gm7IOlzDAxeX3oW6tF3/YpQFxOKcJm1zJzSpvDbItophGvrBjG5e/JG+XULAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckzoiGyp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F6C606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckzoiGyp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689811F01825;
	Wed, 28 Oct 2026 15:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793200606;
	bh=7EQbMnCuzcMZOQOEeE0kdmPMwIC+wpFjoGWdg8ksMJk=;
	h=Date:From:To:Cc:Subject;
	b=ckzoiGypeI8djJHiobmuaN3zmMAPl9j3yoU3Ns4Xb9FkoTSSJUGLpFlrGj1XHCwI+
	 JqsxXUDDlzIwceAHpbnARXhNlo2DevdUTAAnJgsE8CU2oJcxfkHWEB9UMG67gyTSay
	 wCW+TL43QTpi5adlpGshhUw6biT3Y3mHuQPTHmRwFxprm1VMomWmzg+qkp+3iYzxbU
	 iiMxAbTLlxGTPdfJoZdbJw1hMOk4W6T+SYAzWHYGYtt7GxUNiZD2yfX+JT8TfDWlyB
	 RlOfMdlxVqjyrtHJLNZA+LJVomQNBF56wM4NCptwshX4ss6E7DiBwjM5tzl5uKeala
	 JOQC+al3WTH2w==
Date: Wed, 28 Oct 2026 20:46:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: Generic phy subsystem updates for v7.4
Message-ID: <auIR2sNcKC0VsaRS@parshuram>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rko4Z4Z1WVth8DE+"
Content-Disposition: inline


--rko4Z4Z1WVth8DE+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull to receive Generic phy subsystem updates for v7.4. This
includes as usual bunch of new device and driver support and quite a few
updates to drivers.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-=
for-7.4

for you to fetch changes up to 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7:

  phy: tegra: Add support for Tegra238 XUSB pad controller (2026-10-09 10:0=
6:50 +0200)

----------------------------------------------------------------
phy updates for 7.4

As usual bunch of new device and driver support and updates to existing
drivers

 - New Support
  - Rockchip rk3576 csi dphy support,
  - Mediatek MT8195, MT8196 DisplayPort PHYs. MT8196 PCI-Express Gen4 S-PHY,
    MT8189 tphy support
  - Qualcomm Nord eUSB2, QMP USB PHY, QMP PCIe and Gen5x16 PHY support, M31
    eUSB2 PHY, Maili QMP UFS & PCIe PHY, Shikra PCIe phy.
  - New driver for Qualcomm CSI2 C-PHY/DPHY support and new APIs in core to
    parse phy nodes.
  - Nvidia Tegra238 XUSB pad controller support, Tegra264 MPHY driver,
    Tegra264 xusb support.
  - Thunderbolt phy support in core and Qualcomm driver support for USB4 for
    X1E platforms
  - Google Tensor SoC USB PHY driver
  - ASPEED AST2700 USB3 PHY driver
  - Microchip MCP2542 can phy support

- Updates
  - FRL TxFFE config support and Samsumg driver support and runtime PM for
    dcphy driver
  - Mediatek optional repeater support for USB2 ports
  - Refactoring and improvements on rockchip usbdp driver
  - Apple USB4 pipehandler state support
  - Rockchip single-lane DP support

----------------------------------------------------------------
Akash Sukhavasi (1):
      phy: HiSilicon: Fix error handling in hi3670_pcie_allclk_ctrl()

Amin Gattout (2):
      dt-bindings: phy: rockchip-inno-csi-dphy: add rk3576 variant
      phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3576 vari=
ant

AngeloGioacchino Del Regno (14):
      dt-bindings: phy: Document MT8195 and MT8196 DisplayPort PHYs
      phy: phy-mtk-dp: Rename regs to regmap in struct mtk_dp_phy
      phy: phy-mtk-dp: Allow probing with devicetree match
      phy: phy-mtk-dp: Migrate register offsets to SoC specific pdata
      phy: phy-mtk-dp: Implement power_on and power_off PHY callbacks
      phy: phy-mtk-dp: Support set_lanes in configure and properly cleanup
      phy: phy-mtk-dp: Support setting volt swing and preemphasis values
      phy: phy-mtk-dp: Add support for digital and analog calibration
      phy: phy-mtk-dp: Rewrite and document default driving param macros
      phy: phy-mtk-dp: Add bitrate register val definitions to SoC data
      phy: phy-mtk-dp: Add PHYD Lane EN register mask to SoC data
      phy: phy-mtk-dp: Add support for MT8196 eDP PHY
      dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
      phy: mediatek: Add support for PCI-Express Gen4 S-PHY

Aristo Chen (1):
      phy: freescale: fsl-samsung-hdmi: initialize default rate

Bartosz Golaszewski (3):
      dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QM=
P PHY
      phy: qcom: qmp-combo: Add USB3+DP PHY support for Nord

Bruno Banelli (2):
      phy: spacemit: fix K1 USB 2.0 PHY Kconfig dependencies
      phy: spacemit: enable K1 USB 2.0 PHY by default on ARCH_SPACEMIT

Bryan O'Donoghue (6):
      dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
      phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
      phy: core: Fix race-condition between _of_phy_get() and try_module_ge=
t()
      phy: core: Add phy_get_by_of_node()
      phy: core: Add devm_phy_get_by_of_node()
      phy: core: Add missing kerneldoc colon in two locations

Cristian Ciocaltea (3):
      phy: hdmi: Add optional FRL TxFFE config options
      phy: rockchip: samsung-hdptx: Handle PHY config after module reload
      phy: rockchip: samsung-hdptx: Add support for FRL TxFFE level control

David Carlier (2):
      phy: qcom: qmp-pcie: Select MFD_SYSCON for the multi-PHY driver
      phy: qcom: qmp-pcie: Check clock-output-names count in the multi-PHY =
driver

Frank Wang (1):
      phy: rockchip: usbdp: Amend SSC modulation deviation

Geert Uytterhoeven (2):
      phy: freescale: fsl-samsung-hdmi: Make sure clk_init_data is fully in=
itialized
      phy: rockchip: Make sure clk_init_data is fully initialized

Gregory CLEMENT (1):
      phy: cadence: Sierra: Do not modify register when getting parent clock

Haotian Zhang (1):
      phy: hisilicon: hi3670: Fix OF node and device reference leaks

Hemanth Selam (1):
      phy: fix typos in comments

Jason Yang (1):
      phy: rockchip-samsung-dcphy: Enable runtime PM at PHY core level

Jon Hunter (3):
      dt-bindings: phy: tegra194: Add compatible for Tegra238
      phy: tegra: xusb: Use dev_err_probe()
      phy: tegra: Add support for Tegra238 XUSB pad controller

Julien Massot (2):
      dt-bindings: phy: mediatek,xsphy: add optional repeater phys property
      phy: mediatek: xsphy: add optional repeater support for USB2 ports

Kartik Rajput (2):
      dt-bindings: phy: Add nvidia,tegra264-mphy
      phy: tegra: Add Tegra264 MPHY driver

Kees Cook (1):
      phy: realtek: usb: Remove const from phy_cfg allocation type

Konrad Dybcio (3):
      dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E description for USB4
      phy: core: Define TBT phy_mode
      phy: qualcomm: qmp-combo: Add preliminary USB4 support

Krishna Chaitanya Chundru (4):
      dt-bindings: phy: qcom: add Nord QMP PCIe PHY binding
      phy: qcom: qmp: Move qphy_setbits/clrbits/checkbits to common header
      phy: qcom: qmp-pcie: Refactor common multiphy handling
      phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe multi-PHY support

Krishna Kurapati (2):
      dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Maili
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Maili QMP Phy

Louis-Alexis Eyraud (1):
      dt-bindings: phy: mediatek,tphy: Add support for MT8189 SoC

Matthias Goergens (1):
      MAINTAINERS: name the phy/linux-phy next branch

Nikolai Burov (1):
      phy: mediatek: xsphy: clear U2 DTM0 force bits during init

Nitin Rawat (1):
      dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP UFS PHY compatib=
le for Maili

Pengpeng Hou (3):
      phy: broadcom: brcm-usb: unwind late probe failures
      phy: samsung: usbdrd: propagate GS101 PIPE3 lock failures
      phy: starfive: jh7110-dphy: fail init when the PLL does not lock

RD Babiera (1):
      phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver

Rosen Penev (2):
      phy: uniphier-usb3: no devm for nvmem_cell_get
      phy: apple: atc: remove stale kernel-doc for removed struct members

Ryan Chen (3):
      dt-bindings: phy: aspeed: Document AST2700 USB3.2 PHY
      phy: aspeed: Add AST2700 USB3.2 PHY driver
      MAINTAINERS: Add ASPEED USB3 PHY driver

Sasha Levin (1):
      phy: phy-mtk-dp: Fix pdata array members initialized as pointers

Sebastian Reichel (24):
      dt-bindings: phy: rockchip-usbdp: add improved ports scheme
      phy: rockchip: usbdp: Update mode_change after error handling
      phy: rockchip: usbdp: Do not lose USB3 PHY status
      phy: rockchip: usbdp: Fix devm_clk_bulk_get_all check
      phy: rockchip: usbdp: Handle missing clock-names DT property graceful=
ly
      phy: rockchip: usbdp: Drop seamless DP takeover
      phy: rockchip: usbdp: Keep clocks running on PHY re-init
      phy: rockchip: usbdp: Add missing mode_change update
      phy: rockchip: usbdp: Limit DP lane count to muxed lanes
      phy: rockchip: usbdp: Rename DP lane functions
      phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
      phy: rockchip: usbdp: Cleanup DP lane selection function
      phy: rockchip: usbdp: Register DP aux bridge
      phy: rockchip: usbdp: Drop DP HPD handling
      phy: rockchip: usbdp: Rename mode_change to phy_needs_reinit
      phy: rockchip: usbdp: Re-init the PHY on orientation change
      phy: rockchip: usbdp: Factor out lane_mux_sel setup
      phy: rockchip: usbdp: Properly handle TYPEC_STATE_SAFE and TYPEC_STAT=
E_USB
      phy: rockchip: usbdp: Use guard functions for mutex
      phy: rockchip: usbdp: Hold mutex in DP PHY configure
      phy: rockchip: usbdp: Add some extra debug messages
      phy: rockchip: usbdp: Avoid xHCI SErrors
      phy: rockchip: usbdp: Handle rk_udphy_reset_deassert errors
      phy: rockchip: usbdp: Only enable USB3 when not in high-speed mode

Shawn Guo (1):
      phy: qcom: qmp: Fix alignment in pcs-v8_50 register header

Shawn Lin (1):
      phy: rockchip: naneng-combphy: Fix TX detect RX termination errata

Sing-Han Chen (1):
      phy: tegra: xusb: Use devm_clk_get_optional to fetch USB2 tracking cl=
ock

Stefan Wahren (2):
      dt-bindings: phy: ti,tcan104x-can: Fix property constrains
      dt-bindings: phy: ti,tcan104x-can: Document Microchip MCP2542

Sushrut Shree Trivedi (2):
      dt-bindings: phy: sc8280xp-qmp-pcie: Document Shikra PCIe phy
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Shikra

Sven Peter (3):
      phy: apple: atc: Support DUMMY PIPEHANDLER state in configure_pipehan=
dler
      phy: apple: atc: Factor out the PIPE mux sequence
      phy: apple: atc: Implement the USB4 pipehandler state

Vinod Koul (3):
      phy: phy-mtk-dp: drop unused variables
      Merge branch 'topic/phy_qcom_camss' into next
      phy: qcom: qmp-pcie: drop unused reset names

Vivek Pernamitta (1):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Maili PCIe PHY comp=
atibles

Wayne Chang (3):
      dt-bindings: phy: tegra-xusb: Add support for Tegra264
      phy: tegra: xusb: Increase timeout for USB2_TRK_COMPLETED polling
      phy: tegra: xusb: Add Tegra264 support

William Wu (1):
      phy: rockchip: usbdp: Fix LFPS detect threshold control

Zhang Yubing (1):
      phy: rockchip: usbdp: Support single-lane DP

 .../bindings/phy/aspeed,ast2700-usb3-phy.yaml      |  48 +
 .../bindings/phy/mediatek,mt8195-dp-phy.yaml       |  77 ++
 .../bindings/phy/mediatek,mt8196-pcie-sphy.yaml    |  93 ++
 .../devicetree/bindings/phy/mediatek,tphy.yaml     |   1 +
 .../devicetree/bindings/phy/mediatek,xsphy.yaml    |   5 +
 .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml  |  39 +
 .../bindings/phy/nvidia,tegra264-mphy.yaml         | 108 +++
 .../bindings/phy/phy-rockchip-usbdp.yaml           |  24 +
 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |   1 +
 .../phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml        | 267 ++++++
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  93 +-
 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    |   4 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  61 +-
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          |  13 +-
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 209 +++++
 .../bindings/phy/rockchip-inno-csi-dphy.yaml       |   2 +
 .../devicetree/bindings/phy/ti,tcan104x-can.yaml   |  10 +-
 MAINTAINERS                                        |  20 +-
 drivers/phy/Kconfig                                |   3 +-
 drivers/phy/Makefile                               |   1 +
 drivers/phy/apple/atc.c                            |  93 +-
 drivers/phy/aspeed/Kconfig                         |  15 +
 drivers/phy/aspeed/Makefile                        |   2 +
 drivers/phy/aspeed/phy-aspeed-usb3.c               | 236 +++++
 drivers/phy/broadcom/phy-brcm-sata.c               |   2 +-
 drivers/phy/broadcom/phy-brcm-usb.c                |  29 +-
 drivers/phy/cadence/phy-cadence-sierra.c           |  11 +-
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c       |  61 +-
 drivers/phy/hisilicon/phy-hi3670-pcie.c            |   4 +-
 drivers/phy/mediatek/Kconfig                       |  12 +
 drivers/phy/mediatek/Makefile                      |   1 +
 drivers/phy/mediatek/phy-mtk-dp.c                  | 826 ++++++++++++++++--
 drivers/phy/mediatek/phy-mtk-pcie-sphy.c           | 561 ++++++++++++
 drivers/phy/mediatek/phy-mtk-xsphy.c               |  39 +-
 drivers/phy/phy-core.c                             | 166 +++-
 drivers/phy/phy-google-usb.c                       | 449 +++++++++-
 drivers/phy/phy-xgene.c                            |   2 +-
 drivers/phy/qualcomm/Kconfig                       |  16 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 385 ++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 463 ++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  97 +++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 506 +++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp-common.h         |  32 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c   |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c  | 963 +++++++++++++++++=
++--
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 105 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_40.h |  55 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_40.h      |  14 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8_50.h      |   4 +-
 .../qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_40.h |  94 ++
 .../phy-qcom-qmp-qserdes-txrxz-pcie-v6_40.h        | 194 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |  24 -
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           |  24 -
 drivers/phy/realtek/phy-rtk-usb2.c                 |   3 +-
 drivers/phy/realtek/phy-rtk-usb3.c                 |   3 +-
 drivers/phy/rockchip/Kconfig                       |   2 +
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   |  15 +
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      |   2 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      |   2 +-
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c |  19 +
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  |   8 +-
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c  |  80 +-
 drivers/phy/rockchip/phy-rockchip-usb.c            |   2 +-
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 443 +++++-----
 drivers/phy/samsung/phy-exynos5-usbdrd.c           |  78 +-
 drivers/phy/socionext/phy-uniphier-usb3hs.c        |   3 +-
 drivers/phy/spacemit/Kconfig                       |   3 +
 drivers/phy/starfive/phy-jh7110-dphy-tx.c          |  16 +-
 drivers/phy/tegra/Kconfig                          |  11 +
 drivers/phy/tegra/Makefile                         |   3 +
 drivers/phy/tegra/phy-tegra-mphy.c                 | 459 ++++++++++
 drivers/phy/tegra/xusb-tegra186.c                  |  56 +-
 drivers/phy/tegra/xusb.c                           |  20 +-
 drivers/phy/tegra/xusb.h                           |   6 +
 include/dt-bindings/phy/nvidia,tegra264-mphy.h     |  12 +
 include/dt-bindings/phy/phy-qcom-qmp.h             |   1 +
 include/linux/phy/omap_control_phy.h               |   2 +-
 include/linux/phy/phy-hdmi.h                       |   6 +
 include/linux/phy/phy-thunderbolt.h                |  14 +
 include/linux/phy/phy.h                            |  15 +
 82 files changed, 6991 insertions(+), 910 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/aspeed,ast2700-us=
b3-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8195-d=
p-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-p=
cie-sphy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra264-m=
phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen=
5x16-pcie-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi=
2-phy.yaml
 create mode 100644 drivers/phy/aspeed/Kconfig
 create mode 100644 drivers/phy/aspeed/Makefile
 create mode 100644 drivers/phy/aspeed/phy-aspeed-usb3.c
 create mode 100644 drivers/phy/mediatek/phy-mtk-pcie-sphy.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_40.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_40.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-pcie-v6_4=
0.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrxz-pcie-v6=
_40.h
 create mode 100644 drivers/phy/tegra/phy-tegra-mphy.c
 create mode 100644 include/dt-bindings/phy/nvidia,tegra264-mphy.h
 create mode 100644 include/linux/phy/phy-thunderbolt.h

--=20
~Vinod

--rko4Z4Z1WVth8DE+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmriEdoACgkQfBQHDyUj
g0dkVBAA1yCYJsLtcRG2a3EvED4r+9GwO+2Ncu54f1SIpsSAhqZNGZeZxmaHlJJe
wuisYO5mozyOmlwatQ19bnUyZuTdcA/vspeDpelIHWetlggVMskzWwurlo8zmFv2
SDqPyGMQ0WAtIItzVri4Dfiei6DISqpWEjk3aTzeUJK2ndW0gy1Gek8XcwVHOtnu
qmHcJx3xwnjoW5K757xSaOjPQ+o6f/PA4iQcdnUK6YJz5OHzYYI2+9nE/dFHHFlF
pcE3/HxQ6zxTU9VKVL1m8USUNqU7Z67vmipLPkR59k05lpF3UaUPt3Z7W37tJ4pi
VQ8FpOaCJc0HZyYN8V4jqfBuc1VPQOUMGNXtq1nYgWYMz0+r5ZJqNtuovLWZZdTs
Elu9+tI13KCM4doPOtTLJmv4mefg9xq/Ph5DO1o/DKjHPh0yziAUA4rA5zhx7tE3
o6cYAnmid/rPTByA5e8IhcB4DXlEd20AaXki9nFr5aCYjZBF7YGjK7Z60UhpkmOW
dcD4WMUl7PN9xN01I6yDcHkVB+zf//4z4MktkdcaVppv+KqZ9ubC24tXl1Z6d2+Y
xegtBCEiLVuLqs2Ru5fdmlCuQqcl30kbAdO+twVrXYaSKx1Tm2mNOPWDv0yovXU1
DRrJC2jY6f5OdZ1e8R/y++wCXl7cvu51bWpVv5GfFssBQ9vF9/8=
=DrM/
-----END PGP SIGNATURE-----

--rko4Z4Z1WVth8DE+--
