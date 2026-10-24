Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792860664;
	b=KVHrcL7vrefmGLlYqVwZ52Pjtf48KYnChBXQ63+3OlbH86SOgs5zLRWZ+yMPjXtAJq+h
	 Ujv7Es0Swvv14y/mbb/lu1WSqJWSnIYbbRopChmjEf3eVaD1TTZJj0QS1wdAyqqMu6/wg
	 HQ68XESsBlZ4ORi0+JYp395BFF1fTUIl1DtCq4d8wDWezHaSsv2BpYznRU/UyArGRh3Sl
	 eWn3DX19kxdLd83ySgiFTdgae4e5DMY5vcP/hk1dxGtEmJZ5DubZrUP173Rib9jG70PNn
	 tnCPP7HoT7pQire8tDrfIic1adWnpveOSZKSPrhZYDF3Hm12LlnrwPFtXpO3AwabD0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792860664;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HvvXSbrUlD+JKev9Kk5MqO9krcHhKOZOsV4Ff96ONUI=;
	b=vnaoCuGbtTyJqhTZjSvjLyD6cPSsFRurNb9CaUdjy3bQ1DZkk5y68bL2q7ZoucAQBgCW
	 Nlo93TmJb4QMlmJ1Gd2ak9iWavVd/POj83bA/Zn2cnbHnW/V3t6H4fsxRPAIJZp0d6kyD
	 RiYB+3YwZkkaOkp3uQ1KoTV0Y0MnyJ5MCMqrcz69J2Kp1hGr8DO0vB1++IoXIkMDL+xOE
	 i/1lEtIMs+6iQ/aacfurzqrrlDEnoN54WGevApVnTpd2IsBtVf0m9fAGx0uuICdtTG9Og
	 JwYPT4wh+F7zRdf02WmIGn4BtA7VxHfsAFkUpgEcBY2ENevHdkgYLZlMPuokcq9mzAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbFqCINW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133A3606A321;
	Sat, 24 Oct 2026 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EbFqCINW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3414D1F01828;
	Sat, 24 Oct 2026 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792860662;
	bh=HvvXSbrUlD+JKev9Kk5MqO9krcHhKOZOsV4Ff96ONUI=;
	h=Date:From:To:Cc:Subject;
	b=EbFqCINW6WYvALe2xEmXF5aP1xg+TiUtHbNXb5k2rexFf5Wz0+zPs9JHLONsMWN9m
	 5AhboAe2Cdn93cPj3RpX1rvl/CiGtq0HWXuWLtmIPy75vH03nxJZJnD5eWQ4k5dm08
	 mq/or6+XTEGTxcAtc9/u5X8CcbNr8puOOe4zGaVPuB0A65LPga9EEMmhkYGv9x1Eng
	 FyMyVWR53AQp0HucuDIQeOqcabxOYzuZOSHRPW+bM/cSxRfdTGbNoh9s0Baknc2kZn
	 8kmOgBbchLkF4dtDx6UlEOxpusO1FhnjpQnrMo1NEV9hJ+FeTCreccd0Zgdk5LANXJ
	 4OAEOH0610uQQ==
Date: Sat, 24 Oct 2026 18:50:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v7.4] media updates
Message-ID: <20261024185058.20410953@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git medi=
a/v7.4-1

For:

- v4l2 core: improve subdev and pixformat kAPI;
- v4l2 core: fix P010 format info and add Y12 format info;
- v4l2 core: add fwnode_graph_for_each_endpoint_scoped();
- New sensor drivers: Sony IMX576; OmniVision OS02G10, OV05C10 and OG0VA1B;
  Samsung S5KJN5; Himax HM1246;
- Maxim GMSL2/3: add support for MAX9296A, MAX96717, and MAX96724;
- Intel IPU6: add support for IPU7, IPU7.5 and IPU8;
- NXP: add support for i.MX95 CSI pixel formatter driver;
- ITE: add driver for IT6625/IT6626 HDMI bridge;
- Qualcomm: add CSI2 3ph DPHY driver;
- Rockchip: add rk3576 MIPI capture vicap driver;
- STM32 DCMIPP: Add STM32MP25 subdevices;
- Lots of driver fixes and cleanups.

   =20
Regards,
Mauro

---

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tag=
s/media/v7.4-1

for you to fetch changes up to d7e7bca7169873b46e857c025c10f3336c1258d8:

  media: i2c: imx576: Fix line length register (2026-10-09 12:34:05 +0200)

----------------------------------------------------------------
[GIT PULL for v7.4] media updates

----------------------------------------------------------------
Adrian Barna=C5=9B (1):
      staging: media: atomisp: Remove unnecessary forward declaration in gd=
c.c

Alain Volmat (15):
      media: stm32: dcmipp: share struct dcmipp_device among subdevs
      media: stm32: dcmipp: make dcmipp_state & cmsr2 read common
      media: stm32: dcmipp: bytecap: protect CMIER register access
      media: stm32: dcmipp: move common structures in dcmipp-common.h
      media: stm32: dcmipp: correct swap in YUYV data with parallel input
      media: stm32: dcmipp: configure csi input of all pipes on stm32mp25
      media: stm32: dcmipp: introduce a dcmipp global media_pipeline
      media: stm32: dcmipp: add pixel pipes helper functions
      media: stm32: dcmipp: addition of a dcmipp-isp subdev
      media: uapi: Add controls for ST DCMIPP Driver
      media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev
      media: stm32: dcmipp: add pixel-pipe support in bytecap
      media: stm32: dcmipp: rename bytecap into capture
      media: stm32: dcmipp: instantiate & link stm32mp25 subdevs
      media: stm32: csi: correct remote pad retrieval

Alberto Pimpo (1):
      media: vidtv: validate the frequency module parameters

Aleksandr Chubuchnyi (1):
      MAINTAINERS: add Tegra CSI bindings to TEGRA VIDEO DRIVER

Aleksandr Nogikh (1):
      media: usbtv: fix null-pointer dereference on disconnect

Alexander Shiyan (1):
      media: synopsys: hdmirx: use request_any_context_irq() for 5V detecti=
on IRQ

Amin Gattout (6):
      media: synopsys: hdmirx: Remove redundant dev_err_probe()
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3576 compatible
      media: dt-bindings: add rockchip rk3576 vicap
      media: rockchip: rkcif: add a register index for the MIPI capture size
      media: rockchip: rkcif: add a callback for the MIPI ID_CTRL1 register
      media: rockchip: rkcif: add support for rk3576 vicap mipi capture

Andi Shyti (1):
      media: cx231xx: Fix cleanup path on failure

Andy Shevchenko (2):
      media: tda18250: Use %*ph to print small buffer
      media: Consolidate AtomISP v2 PCI IDs in the pci_ids.h

Antti Laakso (53):
      media: i2c: cvs: Add sensor node in bound callback
      media: ipu6: Add helpers for IPU runtime variation
      media: ipu6: Rename pointer to firmware context
      media: ipu6: Rename buttress_ipc pointer
      media: ipu6: Remove duplicate warnings in cpd validation
      media: ipu6: Remove unused ipu6 firmware struct
      media: ipu6: Cleanup ipu6_mmu_init()
      media: ipu6: Simplify firmware com arguments
      media: ipu6: Add helper to identify ipu7
      media: ipu6: Prepare buttress for ipu7 support
      media: ipu6: Use single struct for registers
      media: ipu6: Rename IPU subsys ID
      media: ipu6: Add ipu7 buttress support
      media: ipu6: Prepare mmu driver for hw variation
      media: ipu6: Add ipu7 mmu support
      media: ipu6: Add ipu7 cpd handling
      media: ipu6: Add check for pkg_dir before freeing
      media: ipu6: Rename isys fw msg union
      media: ipu6: Move isys isr handlers to fw file
      media: ipu6: Move hw specific buffer handling down
      media: ipu6: Isolate hw specific buffer handling
      media: ipu6: Add isys firmware ops
      media: ipu6: Add ipu7 fw start/stop functionality
      media: ipu6: Add ipu7 fw com methods
      media: ipu6: Add ipu7 fw isys ops
      media: ipu6: Add ipu7 csi2 register definitions
      media: ipu6: Add ipu7 isr handler
      media: ipu6: Add ipu7 csi phy driver
      media: ipu6: Split ipu6 csi2 stream enable/disable
      media: ipu6: Add support for ipu7 csi2 receiver
      media: ipu6: Parse bus type for ipu7
      media: ipu6: Enable ipu7 isys interrupts
      media: ipu6: Skip watermark configuration for ipu7
      media: ipu6: The SPC init is valid only for ipu6
      media: ipu6: The VC arbitration mechanism is ipu6 only
      media: ipu6: Move buttress mem alloc out from probe
      media: ipu6: Read correct SKU ID for ipu7
      media: ipu6: Add support for fixed iova region
      media: ipu6: Make fw mapping function reusable
      media: ipu6: Move isys fw mapping to pci_probe
      media: ipu6: Map ipu7 firmware
      media: ipu6: Set model name for ipu7
      media: ipu6: Add ipu7.5 buttress support
      media: ipu6: Add ipu7.5 mmu initialization data
      media: ipu6: Enable support for IPU 7 and IPU 7.5
      media: ipu6: Fix media entity names for different ipu versions
      media: ipu6: Forward declare struct ipu6_mmu
      media: ipu6: Pass the fw context to the ipu7 boot helpers
      media: ipu6: Make ipu7 fw config subsystem agnostic
      media: ipu6: Export the ipu7 firmware boot state
      media: ipu6: Add the ipu7 psys buttress support
      media: ipu6: Move ipu7 fw logger and watchdog configuration
      media: ipu6: Fix bus device use-after-free

Anuj Bolewar (1):
      media: hackrf: fix use-after-free in hackrf_alloc_urbs() error path

Arash Golgol (3):
      media: sun6i-mipi-csi2: Use V4L2 subdev active state
      media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
      media: sun6i-csi: bridge: Use V4L2 subdev active state

Arnd Bergmann (2):
      media: i2c: it6625: select CONFIG_HDMI
      media: mali-c55: add padding to mali_c55_params_ccm structure

Ashmit Kumar (1):
      staging: media: av7110: remove unnecessary parentheses from return

Balakrishnan Sambath (11):
      media: microchip-isc: fix awb_mutex and lock lifecycle
      media: microchip-isc: take a reference on the parsed endpoints
      media: microchip-isc: synchronize the IRQ before disabling clocks on =
stop
      media: microchip-isc: disable histogram and flush AWB work on teardown
      media: microchip-isc: do not touch WB registers when not streaming
      media: microchip-isc: store the unshifted PFE_CFG0 BPS value
      media: microchip-isc: fix ISC_PFG_CFG0_BPS macro name typo
      media: microchip-isc: fix PM runtime leak in AWB work handler
      media: microchip-isc: fix SBGGR10 Bayer pattern
      media: microchip-isc: fix WB offset and gain register field masking
      media: microchip-isc: don't sleep in the clk .is_enabled callback

Barnab=C3=A1s P=C5=91cze (2):
      media: rcar-isp: ispcore: Fix inconsistent step sizes
      media: rcar-vin: Implement `VIDIOC_ENUM_FRMSIZES`

Ben Hoff (2):
      media: hws: fix device info register field masks
      media: hws: report measured colorimetry

Bhoomika Hardwani (1):
      media: radio: si4713: replace msleep() with usleep_range() for delays=
 less than 20ms

Bradford Love (1):
      media: em28xx: Fix PAL analog TV colours

Bryan O'Donoghue (12):
      MAINTAINERS: media: imx: imx8mq-mipi-csi2: Add myself as reviewer to =
imx8mq-mipi-csi2
      MAINTAINERS: media: rockchip: dw-mipi-csi2rx: Add myself to the revie=
wers list
      dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
      phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
      phy: core: Fix race-condition between _of_phy_get() and try_module_ge=
t()
      phy: core: Add phy_get_by_of_node()
      phy: core: Add devm_phy_get_by_of_node()
      phy: core: Add missing kerneldoc colon in two locations
      dt-bindings: media: qcom,x1e80100-camss: Describe iommu entries
      dt-bindings: media: qcom,x1e80100-camss: Make vdd-csiphy supplies opt=
ional
      media: qcom: camss: Add support for PHY API devices
      media: qcom: camss: Use data-lanes starting at 1 for new CSIPHY mode

Chen-Yu Tsai (4):
      dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count for H6
      dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count for H6
      dt-bindings: media: sun4i-a10-video-engine: Add H616 compatible
      staging: media: sunxi: cedrus: add H616 variant

Christopher Snowhill (2):
      media: em28xx: fix inverted tuner capability check for VBI device
      media: em28xx: hold the vb2 queue lock when releasing the queue on cl=
ose

Cong Nguyen (3):
      media: microchip-csi2dc: fix async notifier leak on probe error path
      staging: media: imx: csc-scaler: fix ipu_image_convert_run leak on qu=
eue error
      staging: media: tegra-video: fix syncpoint leak in tegra20 channel in=
it

Cosmin Tanislav (20):
      dt-bindings: media: i2c: max96717: add support for I2C ATR
      dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
      dt-bindings: media: i2c: max96717: add support for MAX9295A
      dt-bindings: media: i2c: max96717: add support for MAX96793
      dt-bindings: media: i2c: max96712: use pattern properties for ports
      dt-bindings: media: i2c: max96712: add support for I2C ATR
      dt-bindings: media: i2c: max96712: add support for POC supplies
      dt-bindings: media: i2c: max96712: add support for MAX96724F/R
      dt-bindings: media: i2c: max96714: add support for MAX96714R
      dt-bindings: media: i2c: add MAX9296A, MAX96716A, MAX96792A
      media: i2c: add Maxim GMSL2/3 serializer and deserializer framework
      media: i2c: add Maxim GMSL2/3 serializer framework
      media: i2c: add Maxim GMSL2/3 deserializer framework
      media: i2c: remove MAX96717 driver
      media: i2c: maxim-serdes: add MAX96717 driver
      arm64: defconfig: disable deprecated MAX96712 driver
      staging: media: remove MAX96712 driver
      media: i2c: maxim-serdes: add MAX96724 driver
      media: i2c: remove MAX96714 driver
      media: i2c: maxim-serdes: add MAX9296A driver

D. Manresa (1):
      platform/x86: int3472: map the ov7251 power enable GPIO to "vdda"

Dan Carpenter (1):
      media: ti: cal: remove unnecessary error check

David Carlier (8):
      media: v4l2-isp: reject zero-sized parameter blocks
      media: mali-c55: Free the ISP control handler on unregister
      media: mali-c55: Check the parameters buffer address before copying
      media: mali-c55: Check the statistics buffer address before filling
      media: ipu6: Fix ipu7 firmware context leak on stream start
      media: ipu6: Fix firmware config leak on stream start
      media: ipu6: Check the ipu7 output pin queue before completing a buff=
er
      media: i2c: imx576: Fix line length register

David Wood (2):
      media: em28xx: add StarTech.com SVID2USB23 with working audio capture
      media: em28xx: complete frames from non-interlaced sources

Deepanshu Kartikey (1):
      media: imon: fix use-after-free in display_close via dev_dbg

Diederik de Haas (3):
      media: rkvdec: Remove redundant dev_err()
      media: rkvdec: Switch to modern PM_OPS
      media: rockchip: rga: Switch to modern PM_OPS

Dikshita Agarwal (11):
      media: iris: Add Gen2 firmware autodetect and fallback
      media: iris: Skip UBWC configuration when not supported
      media: iris: Filter UBWC raw formats based on hardware capabilities
      media: iris: Introduce set_preset_register as a vpu_op
      media: iris: Introduce interrupt_init as a vpu_op
      media: iris: add vpu op hook to disable ARP buffer
      media: iris: Add platform data field for watchdog interrupt mask
      media: iris: Add platform flag for instantaneous bandwidth voting
      media: iris: Add framework support for AR50_LITE video core
      media: iris: Introduce buffer size calculations for AR50LT
      media: iris: add Gen2 firmware support on the Agatti platform

Divyamani Tripathi (7):
      media: ipu6: Update ipu7 InSys ABI to 1.2.1.20251215_224531
      media: ipu6: Add IS_IPU8() macro
      media: ipu6: Add IPU8 InSys ABI 1.0.14 support
      media: ipu6: Make ipu7 gpreg stride configurable as per IPU version
      media: ipu6: Add IPU8 isys chip/MMU enablement
      media: ipu6: Add IPU8 psys MMU table and PLL power sequencing
      media: ipu6: Add PCI ID for IPU8

Dmitry Antipov (2):
      media: imon: use sysfs_emit() in associate_remote_show()
      media: em28xx: setup queues before registering V4L2 device

Dmitry Baryshkov (13):
      Revert "media: iris: Add Gen2 firmware autodetect and fallback"
      media: iris: drop IRIS_FMT_foo enumeration
      media: iris: skip PIPE if it is not supported by the platform
      media: iris: add minimal GET_PROPERTY implementation
      media: iris: update buffer requirements based on received info
      media: iris: implement support for the Agatti platform
      media: venus: skip QCM2290 if Iris driver is enabled
      media: iris: constify inst_fw_cap_sm8250_dec
      media: iris: fail firmware boot on invalid uc_region
      media: iris: take core lock when scanning the instance list
      media: iris: guard against a NULL hfi_sys_ops in the interrupt handler
      media: iris: reject open() when the session limit is reached
      media: iris: reference count video instances

Dumitru Ceclan (2):
      dt-bindings: media: i2c: max96712: add control-channel-port property
      i2c: atr: serialize attach/detach against bus transfers

Elgin Perumbilly (2):
      dt-bindings: media: i2c: Add os02g10 sensor
      media: i2c: add os02g10 image sensor driver

Ethan Nelson-Moore (1):
      media: i2c: replace some GPL headers with SPDX-License-Identifier

Faizel K B (1):
      media: vimc: sensor: fix pixel_rate type to resolve do_div() warning

Fan Wu (10):
      media: imx-jpeg: cancel timeout worker when streaming stops
      media: imx-jpeg: finish the job on device_run() error paths
      media: cx231xx-audio: drain wq_trigger before audio fini
      media: au0828: fix use-after-free in bulk_timeout timer on disconnect
      media: marvell: mcam: stop DMA and cancel s_bh_work before freeing DM=
A buffers
      media: nuvoton: npcm-video: quiesce VCD IRQ before teardown
      media: vivid: cancel svid ctrl work on release
      media: rockchip: rga: quiesce IRQ before releasing m2m state
      media: mediatek: vpu: free IRQ before destroying watchdog workqueue
      media: s5p-mfc: use timer_shutdown_sync() for the self-rearming watch=
dog

Felipe Calliari (2):
      media: ipu-bridge: Add upside-down sensor DMI quirk for Samsung Galax=
y Book3 Ultra
      media: ipu-bridge: Add upside-down sensor DMI quirk for Samsung Galax=
y Book3 Pro

Fernando Rimoli (9):
      media: i2c: ov5693: Add OVTI5693 ACPI HID
      media: ipu-bridge: Add OVTI5693 to the list of supported sensors
      dt-bindings: media: ov5693: Add clock-noncontinuous
      media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
      media: ipu-bridge: Assign endpoint property indices dynamically
      media: ipu-bridge: Match sensor configs per IPU and add config flags
      media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6
      media: ipu-bridge: Keep the clock-noncontinuous property name out of =
rodata
      media: ipu-bridge: Add upside-down sensor quirks for the Surface Pro 9

Frank Li (6):
      media: dt-bindings: tc358743: Convert to YAML
      device property: Introduce fwnode_graph_for_each_endpoint_scoped()
      media: mc: use fwnode_graph_for_each_endpoint_scoped() to simpilfy co=
de
      media: rkisp1: use fwnode_graph_for_each_endpoint_scoped() to simplif=
y code
      media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to si=
mplify code
      media: m2m-deinterlace: replace direct ->device_prep*() calls with st=
andard DMA engine API

GUO Ren (XuanTie) (1):
      media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX

Geert Uytterhoeven (1):
      media: cec: meson: ao-cec-g12a: Make sure clk_init_data is fully init=
ialized

Gerald Loacker (1):
      media: synopsys: hdmirx: add input status reporting to VIDIOC_ENUMINP=
UT

Ginger Li (2):
      media: i2c: ov5648: Fix a data race on state->streaming
      media: exynos4-is: Fix a race between s_stream(0) and the interrupt h=
andler

Greg Kroah-Hartman (3):
      media: adv7604: avoid negative array index in log_status when cp_read=
 fails
      media: stv090x: bound DiSEqC reply length to msg[] size
      media: stv0900: bound DiSEqC reply length to msg[] size

Guangshuo Li (14):
      media: i2c: alvium-csi2: balance runtime PM usage count on remove
      media: i2c: ar0521: remove duplicate media entity cleanup
      media: i2c: og01a1b: power off sensor on remove
      media: i2c: ov2735: fix power cleanup on remove
      media: i2c: t4ka3: drop unmatched runtime PM put
      media: staging/ipu7: release ISYS firmware resources on remove
      media: i2c: ov5647: fix power cleanup on remove
      media: atmel-isi: release unregistered video device on remove
      media: tw686x: fix V4L2 device lifetime on probe failure
      media: rtl28xxu: fix SDR platform device leak
      media: chips-media: wave5: Check decoder qbuf runtime resume
      media: rkvdec: do not destroy borrowed SRAM pool
      media: mediatek: vcodec: destroy core workqueue on remove
      media: mediatek: vpu: release reserved memory on remove

Guo Zihao (2):
      media: saa7146: bound the page table build against its size
      media: cx18: clamp bytesused in the single buffer MDL path

Guoniu Zhou (3):
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      dt-bindings: clock: imx95-blk-ctl: Define formatter child node schema
      media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

Hans Verkuil (4):
      media: usb: em28xx: check if vbi is supported before calling vb2_queu=
e_init
      media: vim2m: give vim2m a proper control ID range
      media: i2c/platform: add V4L2_SET_EDID_HPD_LOW_JIFFIES define
      media: vivid: drop unused 'j' variable

Hans de Goede (4):
      platform/x86: int3472: Increase handshake GPIO delay to 200 ms
      media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE lite clock lists
      media: qcom: camss: Drop icc_res_qcs8300 resource table
      media: qcom: camss: Drop csiphy_res_8300 phy resource table

Hao Yao (1):
      media: i2c: Add Omnivision ov05c10 sensor driver

Hao-Qun Huang (2):
      media: hws: Wait for IRQ handler before returning buffers
      staging: media: tegra-video: vi: move port parsing into a subfunction

Hardevsinh Palaniya (1):
      dt-bindings: media: i2c: Add imx576 sensor

Hemanth Selam (4):
      media: fix typos in comments
      media: fix repeated words in comments
      media: saa7164: fix repeated word in log message
      media: dvb-usb-v2/mxl111sf-i2c: fix typo "initilize" in comments

Hermes Wu (22):
      dt-bindings: media: add ITE IT6625/IT6626 HDMI bridge
      media: i2c: add driver for ITE IT6625/IT6626
      dt-bindings: media: ite,it6625: document the default CSI-2 bus type
      media: i2c: it6625: propagate initial-setup and control-update errors
      media: i2c: it6625: default the debug module parameter to 0
      media: i2c: it6625: drop unused bus field from struct it6625
      media: i2c: it6625: use unsigned int loop indices in table lookups
      media: i2c: it6625: drop redundant parentheses in status helpers
      media: i2c: it6625: make the audio sampling-rate table static const
      media: i2c: it6625: tidy CEC buffer init and a continuation line
      media: i2c: it6625: clean up it6625_wait_for_status()
      media: i2c: it6625: use unsigned int indices in EDID read/write
      media: i2c: it6625: use unaligned/units helpers to decode pixel clock
      media: i2c: it6625: decode detected timings via typed register structs
      media: i2c: it6625: fix link-frequency reporting for one-/two-trio C-=
PHY
      media: i2c: it6625: use early returns in it6625_update_timings_if_cha=
nged()
      media: i2c: it6625: drop the private CSI-format name table
      media: i2c: it6625: require a DT endpoint and simplify endpoint parsi=
ng
      media: i2c: it6625: finish reverse fir-tree declaration order
      media: i2c: it6625: fold subdev initialization into probe
      media: i2c: it6625: use centrally managed active state
      media: i2c: it6625: use enable_streams and disable_streams

Himanshu Bhavani (1):
      media: i2c: add imx576 image sensor driver

Hitesh Patel (3):
      media: qcom: camss: vfe-17x: Fix write master buffer done being dropp=
ed
      media: qcom: camss: vfe-17x: Fix write master selection for RDI lines
      media: qcom: camss: vfe: Fix VFE reset while another line is streaming

Hungyu Lin (1):
      media: iris: cancel sys error work on driver removal

Hyeonjun Hong (1):
      media: Documentation: vivid.rst: Remove stale capture overlay mentions

Igor Paunovic (2):
      dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
      media: synopsys: hdmirx: add HDMI audio capture support

Jai Luthra (2):
      media: ti: j721e-csi2rx: Support RAW12 bayer formats
      media: cadence: csi2rx: Support RAW12 bayer formats

Jakob Berg Jespersen (1):
      platform/x86: int3472: support the POWER1 GPIO type

Jeffin Philip (1):
      media: vidtv: fix uaf in vidtv_bridge_on_new_pkts_avail

Jianhua Lin (3):
      dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible stri=
ng
      dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible stri=
ng
      media: mediatek: jpeg: add compatible for MT8189 SoC

Jiawen Liu (1):
      media: amphion: fix runtime PM imbalance on probe failure

John Keeping (1):
      media: rockchip: rga: fix rotation on rev0 hardware

Joyeta Modak (1):
      staging: media: av7110: remove commented out macro

Juan Perdomo (1):
      media: cx231xx: preserve I2C transfer length

Julia Lawall (1):
      media: marvell: cafe: drop unneeded semicolon

Julian Braha (1):
      media: marvell-cam: fix unmet dependency for VIDEO_MMP_CAMERA

Junjie Cao (1):
      media: i2c: cvs: Get the wake IRQ without claiming the GPIO

Junrui Luo (4):
      media: vicodec: fix out-of-bounds write on under-rounded coded dimens=
ions
      media: vicodec: make encoder CAPTURE dimensions read-only
      media: vicodec: zero-initialize stateful decoder heap buffers
      media: vicodec: fix NULL deref on oversized frame

Kaho Jiang (1):
      media: em28xx: fix double free in em28xx_alloc_urbs

Kartik Panesar (1):
      staging: media: ipu3: remove unnecessary dev_dbg function trace

Kate Hsuan (4):
      media: i2c: imx471: Set max analog gain to 960
      media: i2c: cvs: Add Lattice device quirk for VID:0x2ac1 PID:0x20d1
      media: ipu-bridge: Add sensor rotation quirk for Dell XPS 14 (Dell 14=
 Premium) DA14250
      media: i2c: imx471: Fix register size for IMX471_REG_DPGA_USE_GLOBAL_=
GAIN

Kazuki Hanai (1):
      media: mediatek: jpeg: Avoid context access after job finish

Kean Ren (1):
      media: uvcvideo: Add quirk for Luxvisions RGB Camera (30c9:0122)

Keith Harvey (1):
      media: ipu-bridge: Add DMI quirk for Dell 14 Premium DA14250

Kieran Bingham (8):
      dt-bindings: media: Add macros for video interface devices
      dt-bindings: media: i2c: Utilise video-interface-devices enums
      arm64: dts: freescale: Convert to new media orientation definitions
      arm64: dts: qcom: Convert to new media orientation definitions
      arm64: dts: renesas: Convert to new media orientation definitions
      arm64: dts: rockchip: Convert to new media orientation definitions
      ARM: tegra: Convert to new media orientation definitions
      dt-bindings: media: i2c: himax,hm1246: Use video-interface-devices

Lalit Shankar Chowdhury (1):
      staging: media: atomisp: Use C99 initializers for ACPI IDs

Laurent Pinchart (1):
      media: ti: cal: Deprecate non-MC API usage

Linkai Gong (2):
      media: pci: hws: only init channels the device actually has
      media: i2c: tc358743: add missing color-space strings

Linmao Li (2):
      media: chips-media: wave5: Handle polling IRQ thread failure
      media: chips-media: wave5: Balance runtime PM on encoder close errors

Linus Walleij (1):
      media: mali-c55: Ignore disconnected queues when checking readiness

Loic Poulain (4):
      media: qcom: camss: Add PM clock support and integrate with runtime PM
      media: qcom: camss: Add PM clock definitions for QCM2290
      media: qcom: camss: Drop top_ahb/ahb/axi from QCM2290 subdevice clocks
      media: qcom: camss: Report hardware version via media controller

Lucas Sinn (1):
      media: synopsys: hdmirx: fetch colordepth before calculating pixelclo=
ck

Mark Brown (1):
      media: ipu6: Fix up missing IWYU issue

Matthew Zvolsky (1):
      staging: media: atomisp: remove unnecessary void function return

Matthias Fend (2):
      media: dt-bindings: i2c: add Himax HM1246 image sensor
      media: i2c: add Himax HM1246 image sensor driver

Maxim Skokov (1):
      media: vivid: round the height down to the vertical subsampling factor

Michael Freidkin (1):
      media: meson: vdec: size capture planes from the aligned canvas

Michael Jordan (3):
      media: uvcvideo: Generalise the XU flags fixup to all controls
      media: uvcvideo: Fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
      media: uvcvideo: Fix up missing AUTO_UPDATE on the OBSBOT Tail 2

Michail Tatas (1):
      media: verisilicon: rockchip: Fix leaks in init

Muhammad Haris Awan (1):
      media: cx25840: return -EOPNOTSUPP instead of WARN_ON in cx25840_init

Mukesh Ojha (4):
      media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
      media: aspeed: Use devm_of_reserved_mem_device_init()
      media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
      media: arm: mali-c55: Use devm_of_reserved_mem_device_init()

Myeonghun Pak (10):
      media: stm32: csi: unregister async notifier on cleanup
      media: marvell: manage the MMP camera clock provider
      media: cx23885: unregister DVB bus when SP2 CI setup fails
      media: go7007: unregister the I2C adapter on USB probe failure
      media: cx18: Disable PCI device on probe failure
      media: cx88: Disable PCI device on MPEG initialization failure
      media: tw68: balance PCI enable on cleanup
      media: renesas: rzv2h-ivc: manage runtime PM with devres
      media: amphion: drain message work before releasing core state
      media: amphion: prevent unbind while video instances are open

Nas Chung (1):
      media: v4l2-common: Fix P010 format info

Nguyen Quang Le Kien (1):
      media: pvrusb2: fix URB pending flag leak on invalid endpoint

Nihal Kumar Gupta (3):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Glymur compatible
      dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS
      media: qcom: camss: Add Glymur compatible

Pan Chuang (1):
      media: atomisp: Remove redundant dev_err()

Pei Xiao (1):
      media: cx23885: Fix use-after-free in cx23885_finidev due to race con=
dition

Pengpeng Hou (4):
      media: require two-byte Cypress type 04 records
      media: cec: extron: clear response tail before dispatch
      media: mali-c55: fail power-on when safe stop times out
      media: mediatek: jpeg: retry HW selection after successful wait

Pierre Pinon (1):
      media: ipu-bridge: Add upside-down quirk for Dell Pro 14 Premium PA14=
260

Piyush Patle (1):
      media: vidtv: fix frontend reference leak on unbind

Punnay Sharma (2):
      staging: media: av7110: fix corrupted BER reporting in sp8870
      staging: media: av7110: fix sp8870 initialization failure state

Rajveer Chaudhari (1):
      staging: media: imx: remove unused header includes

Randy Dunlap (1):
      media: i2c: imx576: select VIDEO_CCS_PLL to repair build error

Raushan Kumar (1):
      staging: media: atomisp: make pmic_name array const

Ricardo Ribalda (6):
      media: uvcvideo: Remove unused active field
      media: uvcvideo: Add autosuspend quirk for AVerMedia Live Gamer HD 2
      media: uvcvideo: uvc_warn should warn not info
      media: uvcvideo: Use uvc_warn_once when it make sense
      media: uvcvideo: Bound uvc_parse_*_control to the control size
      media: uvcvideo: Force UVC version for Avermedia GC515

Rik van Riel (1):
      media: redrat3: fix UAF in probe error path leaving rc device registe=
red

Rishab Madhugiri (1):
      staging: media: atomisp: Use ARRAY_SIZE macro

Robby Cai (1):
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example endpoint label =
typo

Rohinthan P (1):
      media: v4l2-ctrls: do nothing if controls[0] =3D=3D NULL in cluster f=
unctions

Runyu Xiao (3):
      media: saa7146: Initialize interrupt lock before requesting IRQ
      media: adv7180: Initialize mutex before ancillary clients
      media: sti: delta: use unaligned accessors for MJPEG SOF fields

Ruoyu Wang (3):
      media: au0828: Free URBs when starting DVB streaming fails
      media: adv748x: Fix endpoint reference leaks on probe failure
      media: venus: Drop session events without an instance

Ruslan Koreev (4):
      platform/x86: int3472: Map the VD55G1 power enable GPIO to "vana"
      media: ipu-bridge: Add the ST VD55G1 (TBE20A1)
      media: i2c: vd55g1: Return the endpoint parser's error code
      media: i2c: vd55g1: Add ACPI support

Sachin Kumar Garg (3):
      media: iris: cache work mode after computing it in iris_set_stage
      media: iris: force stage 1 work mode for CBR RC on encoder
      media: iris: add support for multi_slice in iris encoder

Sakari Ailus (60):
      MAINTAINERS: Update Intel cvs and ipu6 driver entries
      MAINTAINERS: media: ipu-bridge: Add entry
      MAINTAINERS: Add L: linux-media for int3472
      platform/x86: int3472: Address Coccinelle warning on an error print
      platform/x86: int3472: Fix uninitialised variable warning
      platform/x86: int3472: Clean up GPIO parsing
      media: ipu-bridge: Print more debug information on connected devices
      staging: media: ipu7: Update TODO file
      media: ipu-bridge: Add ipu_bridge_get_ipu6()
      media: cvs: Use ipu_bridge_get_ipu6()
      media: ivsc: Use ipu_bridge_get_ipu6()
      media: Documentation: Improve pixel rate calculation documentation
      media: imx219: Account rate_factor in setting upper exposure limit
      media: imx219: Account for rate_factor in control steps
      media: imx219: The horizontal blanking step is 8
      media: imx219: Rename "binning" as "bin_hv" in imx219_set_pad_format
      media: Improve enable_streams and disable_streams documentation
      media: v4l2-subdev: Move subdev client capabilities into a new struct
      media: v4l2-subdev: Move op check to sub-device op wrappers
      media: v4l2-subdev: Always call get_fmt() if set_fmt() is unavailable
      media: v4l2-subdev: Don't assign set_fmt where it's equivalent to get=
_fmt
      media: mt9m001: Pass sub-device state to set_selection() callback
      media: cvs: Drop comments on sub-device operations
      media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad=
 ops
      media: Don't hide I=C2=B2C or SPI drivers by default
      media: cvs: Default selection to VIDEO_INTEL_IPU6
      media: ipu6: Fix releasing resources at failing streamon
      media: ipu6: Move streaming control to CSI-2 receiver driver
      media: ipu6: Stream number on CSI-2 receiver source pads is always 0
      media: ipu6: Rename misnamed out_free_watermark label in video init
      media: ipu6: Always request a capture ack
      media: ipu6: Clean up link frequency calculation
      media: ipu6: Get watermark configuration directly from ipdata
      media: ipu6: Collect IPU streams into CSI-2 receiver sub-device conte=
xt
      media: ipu6: Start streaming once all streams have started, stop when=
 not
      media: ipu6: Add lockdep checks for CSI-2 streaming enable and disable
      media: ipu6: Remove nr_queues and nr_streaming fields in ipu6_isys_st=
ream
      media: ipu6: Collect enabled stream IDs
      media: ipu6: Avoid accessing av->streams before streaming
      media: ipu6: Rework watermark calculation
      media: ipu6: Rework watermark setting
      media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
      media: ipu6: Drop {get,put}_streams_opened()
      media: ipu6: Serialise access to stream pointers by isys stream_lock
      media: ipu6: Move firmware init/cleanup to RPM callbacks
      media: ipu6: Don't track power status, rely on runtime PM
      media: ipu6: Support upstream sub-devices without get_frame_desc()
      media: ipu6: Reset need_reset in ISYS suspend
      media: ipu6: Warn if the active list isn't empty when returning buffe=
rs
      MAINTAINERS: Add more reviewers for the Intel IPU6 driver
      media: ipu6: Take IPU8 support into account in Kconfig
      staging: media: atomisp: Update TODO file
      media: mc: Add INTERNAL pad flag
      media: Documentation: mc: Fix Stream reference
      media: mc: Keep INTERNAL pad flags just for the kernel, for now
      media: maxim-serdes: Disable test pattern generator for now
      media: ov05c10: Small cleanups
      media: ov05c10: Set reset GPIO high when acquiring it
      media: ov05c10: Power management fixes
      media: ov05c10: Remove duplicated writes to analogue gain register

Sascha Hauer (1):
      media: synopsys: hdmirx: stop logging a missing signal at error level

Sasha Levin (1):
      media: iris: fix 64-bit division in iris_set_slice_count()

Sean Young (35):
      media: streamzap: Add missing rc_unregister_device()
      media: redrat3: Ensure we don't read beyond the end of the packet
      media: redrat3: Ensure all urbs are suspended
      media: redrat3: Error path leaves device in transmitting state
      media: sunxi-cir: Ensure no more interrupts can occur before free
      media: meson-ir-tx: Ensure clock is disabled on unbind
      media: meson-ir-tx: Ensure rc_free_device() is called on unbind
      media: meson-ir-tx: Ensure probe error is propagated
      media: ir-hix5hd2: Ensure rdev is setup before interrupts are enabled
      media: cx88: Specify rc type at rc_allocate_type()
      media: saa7134: Specify rc type at rc_allocate_type()
      media: rc: Fix race condition during rc_register_device()
      media: rc: Use after free in ir_raw_event_handle()
      media: rc: Fix use after free in bpf progs
      media: rc: Ensure registered is cleared in error path
      media: rc: Ensure that rc_unregister_device() does not free input dev=
ice
      media: rc: Fix ABBA deadlock by making locks more fine grained
      media: rc: Replace open coded krealloc() for keymap
      media: rc: Add missing locking for keymap
      media: rc: Fix race between bpf(BPG_PROG_ATTACH) and device unregister
      media: rc: mce_kbd: Fix inconsistent locking of keylock
      media: ene_ir: Ensure teardown is done in the correct order
      media: rc: Use binary search for adding or updating a scancode
      media: rc: imon: Bind both interfaces via usb_driver_claim_interface()
      media: ir_toy: Remove unused struct field
      media: nuvoton-cir: Remove unused struct field
      media: ite-cir: Removed unused struct field
      media: fintek-cir: Remove unused fields
      media: mceusb: Remove unused field
      media: serial_ir: Fix race condition where timer can be re-armed
      media: rc: After rc_unregister_device() timers can be re-armed
      media: rc: Validate carrier range in LIRC_SET_REC_CARRIER ioctl
      media: ir_toy: Validate the maximum tx carrier
      media: meson-ir-tx: Prevent divide by zero in meson_irtx_prepare_puls=
e()
      media: rc: Fix build failure with CONFIG_LIRC disabled

Sergey Lebedev (3):
      media: ipu-bridge: Add upside-down quirk for Surface Pro 11
      media: ipu-bridge: Add OV13858 sensor config
      media: i2c: ov13858: add horizontal and vertical flip controls

Sergey Zagursky (1):
      media: ipu-bridge: do not use the CVS device lookup for IVSC

Serin Yeh (3):
      media: i2c: ov8856 : remove ACPI node bypass mechanism
      media: i2c: ov8856: fix debug message to report actual CSI-2 lane cou=
nt
      media: ipu-bridge: Add support additional link frequency

Shengzhuo Wei (1):
      media: go7007: bound EZ-USB I2C transfers to the usb_buf size

Shravan Chippa (1):
      media: i2c: imx334: add new link frequency configuration

Shuangpeng Bai (1):
      media: gspca: use vb2_video_unregister_device() on disconnect

Steve Kaznak (1):
      media: ipu-bridge: Add OV01A1B sensor config

Syed Ali (1):
      media: airspy: replace deprecated V4L2_TUNER_ADC

Tharit Tangkijwanichakul (5):
      media: v4l2-ctrls: default HEVC SPS chroma format to 4:2:0
      media: hantro: Harden MPEG-2 control access against NULL
      media: hantro: release runtime resources when device_run fails
      media: hantro: use DEFINE_RUNTIME_DEV_PM_OPS
      media: hantro: disable runtime PM before hardware teardown

Thierry Chatard (7):
      platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loo=
p counters
      platform/x86: int3472: tps68470: move Windows MFD setup below the dev=
ice-type switch
      platform/x86: int3472: tps68470: add static clock consumer support
      platform/x86: int3472: tps68470: use a common always-on VIO regulator=
 init_data
      platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
      media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
      media: ov8858: add ACPI device ID INT3477

Thorsten Blum (1):
      media: imagination: Fix value clamping in calculate_qp_tables

Tomas Chimenti (1):
      media: atomisp: Remove useless return statement

Tomasz Unger (1):
      staging: media: atomisp: fix typo in refcount.c comment

Tomi Valkeinen (12):
      media: rcar-vin: Fix comment related to stride handling
      media: rcar-vin: Link VINs on Gen3 to a single channel on each CSI-2
      media: rcar-isp: Move {enable|disable}_streams() calls
      media: rcar-csi2: Move {enable|disable}_streams() calls
      media: rcar-csi2: Switch to Streams API
      media: rcar-isp: Switch to Streams API
      media: rcar-csi2: Add .get_frame_desc op
      media: rcar-isp: Call get_frame_desc to find out VC & DT
      media: rcar-csi2: Call get_frame_desc to find out VC & DT (Gen3)
      media: rcar-csi2: Add full streams support
      media: rcar-isp: Add full streams support
      media: v4l2-common: add Y12 to v4l2_format_info()

Tommaso Merciai (5):
      media: v4l2-common: Convert v4l2_fill_pixfmt_mp() to static inline wr=
apper
      media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
      media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
      media: rzg2l-cru: Use v4l2_fill_pixfmt_aligned() for stride alignment
      media: rzg2l-cru: Replace has_stride with stride_align field

Triet Hoang (4):
      media: bttv: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      media: cx88: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      media: saa7134: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      media: tw68: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Vikash Garodia (3):
      media: iris: reset AHB bridge before enabling HW mode
      dt-bindings: media: qcom,venus-common: Add IOMMU IOVA reservation reg=
ion
      dt-bindings: media: qcom,qcm2290-venus: document shikra venus compati=
ble

Vishnu Reddy (6):
      media: venus: Fix iova allocation from restrict region
      media: iris: avoid bit depth validation for capture formats
      media: iris: Fix iova allocation from restrict region
      media: iris: Fix bus_info prefix in VIDIOC_QUERYCAP
      media: iris: Fix power-off ordering to disable power domain after clo=
cks
      media: iris: Fix frame interval enumeration for non-divisor framerates

Vladimir Zapolskiy (1):
      media: i2c: ov02c10: Narrow chip id check down to match ov02c chips o=
nly

Wei Jie Law (1):
      media: uvcvideo: Fix NULL deref on events for uninitialized controls

Weigang He (1):
      media: rc: fintek-cir: process a full RX buffer instead of overflowin=
g it

Wenmeng Liu (5):
      dt-bindings: media: i2c: Add Samsung S5KJN5 image sensor
      media: i2c: Add Samsung S5KJN5 image sensor driver
      dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
      media: i2c: og0ve1b: Introduce per-sensor data structure
      media: i2c: og0ve1b: Add support for OmniVision OG0VA1B

Wentao Liang (8):
      media: ivsc: Fix csi_dev use-after-free in mei_ace_setup_dev_link()
      media: au0828: Fix media device leak in au0828_usb_probe()
      media: vpif_capture: Fix i2c adapter reference leak in vpif_probe()
      media: vpif_display: Fix i2c adapter reference leak in vpif_probe()
      media: pvrusb2: Fix USB parent device leak in class_dev_create()
      media: platform: mtk-mdp3: Fix device reference leak in mdp_comp_init=
()
      media: mtk-jpeg: Fix runtime PM leak in mtk_jpegdec_worker()
      media: mtk-jpeg: Fix runtime PM leak in mtk_jpegenc_worker()

Xiang Mei (2):
      media: go7007: only set audio_enabled if go7007_snd_init() succeeded
      media: em28xx: reject audio endpoint with zero packet size

Xu Rao (1):
      media: m2m-deinterlace: fix default capture field

Yibo Tan (1):
      media: ipu-bridge: Fix use-after-free in IVSC error path

Younho Choi (1):
      media: vim2m: keep transaction buffer count stable while streaming

Yunke Cao (1):
      media: uvcvideo: Add quirk for invalid dev_sof in Logitech C925e

Yury Norov (1):
      staging: media: tegra-video: simplify formats enumeration

Zain Aboobacker (3):
      media: saa7164: remove register dump debugging helper
      media: saa7146: remove unused dump_registers() debug helper
      media: cx231xx: remove unused cx231xx_dump_SC_reg() debug helper

=E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=E3=82=BA (1):
      media: uvcvideo: Make uvc_event_control attribute name array const

 .../admin-guide/media/em28xx-cardlist.rst          |    4 +
 Documentation/admin-guide/media/vivid.rst          |    4 +-
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |   71 +
 .../media/allwinner,sun4i-a10-video-engine.yaml    |   45 +-
 .../bindings/media/fsl,imx95-csi-formatter.yaml    |   88 +
 .../bindings/media/i2c/himax,hm1246.yaml           |  121 +
 .../devicetree/bindings/media/i2c/hynix,hi846.yaml |    3 +-
 .../devicetree/bindings/media/i2c/ite,it6625.yaml  |  177 ++
 .../bindings/media/i2c/maxim,max9296a.yaml         |  242 ++
 .../bindings/media/i2c/maxim,max96712.yaml         |   74 +-
 .../bindings/media/i2c/maxim,max96714.yaml         |    5 +-
 .../bindings/media/i2c/maxim,max96717.yaml         |  163 +-
 .../bindings/media/i2c/ovti,og0ve1b.yaml           |   15 +-
 .../bindings/media/i2c/ovti,os02g10.yaml           |   94 +
 .../bindings/media/i2c/ovti,ov08d10.yaml           |    3 +-
 .../devicetree/bindings/media/i2c/ovti,ov4689.yaml |    3 +-
 .../devicetree/bindings/media/i2c/ovti,ov5675.yaml |    3 +-
 .../devicetree/bindings/media/i2c/ovti,ov5693.yaml |    5 +-
 .../bindings/media/i2c/ovti,ov64a40.yaml           |    3 +-
 .../bindings/media/i2c/samsung,s5kjn5.yaml         |  117 +
 .../devicetree/bindings/media/i2c/sony,imx111.yaml |    3 +-
 .../devicetree/bindings/media/i2c/sony,imx355.yaml |    3 +-
 .../devicetree/bindings/media/i2c/sony,imx415.yaml |    3 +-
 .../devicetree/bindings/media/i2c/sony,imx576.yaml |  114 +
 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |    3 +-
 .../devicetree/bindings/media/i2c/st,vd56g3.yaml   |    3 +-
 .../bindings/media/i2c/thine,thp7312.yaml          |    3 +-
 .../bindings/media/i2c/toshiba,tc358743.txt        |   48 -
 .../bindings/media/i2c/toshiba,tc358743.yaml       |   93 +
 .../bindings/media/mediatek-jpeg-decoder.yaml      |   50 +-
 .../bindings/media/mediatek-jpeg-encoder.yaml      |   38 +-
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |    4 +-
 .../bindings/media/qcom,glymur-camss.yaml          |  300 ++
 .../bindings/media/qcom,qcm2290-venus.yaml         |   26 +-
 .../bindings/media/qcom,venus-common.yaml          |    5 +-
 .../bindings/media/qcom,x1e80100-camss.yaml        |   28 +-
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |    1 +
 .../bindings/media/rockchip,rk3568-vicap.yaml      |   46 +-
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml |   13 +-
 .../bindings/media/video-interface-devices.yaml    |   17 +-
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |  213 ++
 Documentation/driver-api/media/tx-rx.rst           |    6 +-
 .../userspace-api/media/drivers/dcmipp.rst         |   14 +
 .../userspace-api/media/drivers/index.rst          |    1 +
 .../userspace-api/media/mediactl/media-types.rst   |    8 +
 MAINTAINERS                                        |   95 +-
 .../nvidia/tegra30-asus-nexus7-grouper-common.dtsi |    3 +-
 .../nvidia/tegra30-asus-transformer-common.dtsi    |    3 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts       |    4 +-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi        |    3 +-
 .../imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso     |    3 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    3 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |    3 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |    3 +-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |    3 +-
 .../r8a779g3-sparrow-hawk-camera-j1-imx219.dtso    |    3 +-
 .../r8a779g3-sparrow-hawk-camera-j1-imx462.dtso    |    3 +-
 .../r8a779g3-sparrow-hawk-camera-j2-imx219.dtso    |    3 +-
 .../r8a779g3-sparrow-hawk-camera-j2-imx462.dtso    |    3 +-
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi      |    3 +-
 .../rockchip/px30-ringneck-haikou-video-demo.dtso  |    3 +-
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |    5 +-
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |    3 +-
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |    3 +-
 arch/arm64/configs/defconfig                       |    1 -
 drivers/gpu/drm/i915/display/intel_display_power.c |    6 +-
 drivers/i2c/i2c-atr.c                              |   12 +
 drivers/media/cec/platform/meson/ao-cec-g12a.c     |    2 +-
 .../extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    |    4 +-
 drivers/media/common/cypress_firmware.c            |    2 +
 drivers/media/common/saa7146/saa7146_core.c        |   23 +-
 drivers/media/common/saa7146/saa7146_video.c       |   11 +
 drivers/media/dvb-frontends/drxd_map_firm.h        |    4 +-
 drivers/media/dvb-frontends/stv0900_core.c         |    2 +
 drivers/media/dvb-frontends/stv090x.c              |    2 +
 drivers/media/i2c/Kconfig                          |  117 +-
 drivers/media/i2c/Makefile                         |   11 +-
 drivers/media/i2c/adv7170.c                        |    1 +
 drivers/media/i2c/adv7175.c                        |    3 +-
 drivers/media/i2c/adv7180.c                        |    5 +-
 drivers/media/i2c/adv7183.c                        |    3 +-
 drivers/media/i2c/adv7343.c                        |   10 +-
 drivers/media/i2c/adv7393.c                        |   10 +-
 drivers/media/i2c/adv748x/adv748x-afe.c            |    1 +
 drivers/media/i2c/adv748x/adv748x-core.c           |   13 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c           |    1 +
 drivers/media/i2c/adv748x/adv748x-hdmi.c           |    1 +
 drivers/media/i2c/adv7511-v4l2.c                   |    1 +
 drivers/media/i2c/adv7604.c                        |    7 +-
 drivers/media/i2c/adv7842.c                        |   11 +-
 drivers/media/i2c/ak881x.c                         |    2 +-
 drivers/media/i2c/alvium-csi2.c                    |    4 +
 drivers/media/i2c/ar0521.c                         |    2 +-
 drivers/media/i2c/ccs/ccs-core.c                   |   12 +-
 drivers/media/i2c/ccs/ccs-data.h                   |    4 +-
 drivers/media/i2c/cvs/Kconfig                      |    1 +
 drivers/media/i2c/cvs/core.c                       |   30 +-
 drivers/media/i2c/cvs/v4l2.c                       |   96 +-
 drivers/media/i2c/cx25840/cx25840-core.c           |   41 +-
 drivers/media/i2c/ds90ub913.c                      |    1 +
 drivers/media/i2c/ds90ub953.c                      |    1 +
 drivers/media/i2c/ds90ub960.c                      |    1 +
 drivers/media/i2c/et8ek8/et8ek8_driver.c           |    1 +
 drivers/media/i2c/gc0308.c                         |    1 +
 drivers/media/i2c/gc0310.c                         |    2 +-
 drivers/media/i2c/gc05a2.c                         |    4 +-
 drivers/media/i2c/gc08a3.c                         |    4 +-
 drivers/media/i2c/gc2145.c                         |    2 +
 drivers/media/i2c/hi556.c                          |    2 +
 drivers/media/i2c/hi846.c                          |    2 +
 drivers/media/i2c/hi847.c                          |    3 +-
 drivers/media/i2c/hm1246.c                         | 1287 ++++++++
 drivers/media/i2c/imx111.c                         |    1 +
 drivers/media/i2c/imx208.c                         |    1 +
 drivers/media/i2c/imx214.c                         |    4 +-
 drivers/media/i2c/imx219.c                         |   42 +-
 drivers/media/i2c/imx258.c                         |    2 +
 drivers/media/i2c/imx274.c                         |    3 +
 drivers/media/i2c/imx283.c                         |    2 +
 drivers/media/i2c/imx290.c                         |    4 +-
 drivers/media/i2c/imx296.c                         |    7 +-
 drivers/media/i2c/imx319.c                         |    1 +
 drivers/media/i2c/imx334.c                         |  135 +-
 drivers/media/i2c/imx335.c                         |    4 +-
 drivers/media/i2c/imx355.c                         |    4 +-
 drivers/media/i2c/imx412.c                         |    3 +-
 drivers/media/i2c/imx415.c                         |    4 +-
 drivers/media/i2c/imx471.c                         |    8 +-
 drivers/media/i2c/imx576.c                         | 1105 +++++++
 drivers/media/i2c/imx678.c                         |    2 +-
 drivers/media/i2c/isl7998x.c                       |    1 +
 drivers/media/i2c/it6625.c                         | 2459 ++++++++++++++
 drivers/media/i2c/lt6911uxe.c                      |    5 +-
 drivers/media/i2c/max9286.c                        |    1 +
 drivers/media/i2c/max96714.c                       | 1017 ------
 drivers/media/i2c/max96717.c                       | 1104 -------
 drivers/media/i2c/maxim-serdes/Kconfig             |   63 +
 drivers/media/i2c/maxim-serdes/Makefile            |    6 +
 drivers/media/i2c/maxim-serdes/max9296a.c          | 1461 +++++++++
 drivers/media/i2c/maxim-serdes/max96717.c          | 1705 ++++++++++
 drivers/media/i2c/maxim-serdes/max96724.c          | 1347 ++++++++
 drivers/media/i2c/maxim-serdes/max_des.c           | 3352 ++++++++++++++++=
++++
 drivers/media/i2c/maxim-serdes/max_des.h           |  157 +
 drivers/media/i2c/maxim-serdes/max_ser.c           | 2218 +++++++++++++
 drivers/media/i2c/maxim-serdes/max_ser.h           |  147 +
 drivers/media/i2c/maxim-serdes/max_serdes.c        |  413 +++
 drivers/media/i2c/maxim-serdes/max_serdes.h        |  181 ++
 drivers/media/i2c/ml86v7667.c                      |    1 -
 drivers/media/i2c/mt9m001.c                        |    9 +-
 drivers/media/i2c/mt9m111.c                        |    3 +
 drivers/media/i2c/mt9m114.c                        |    6 +
 drivers/media/i2c/mt9p031.c                        |    3 +
 drivers/media/i2c/mt9t112.c                        |    3 +
 drivers/media/i2c/mt9v011.c                        |    1 +
 drivers/media/i2c/mt9v032.c                        |    3 +
 drivers/media/i2c/mt9v111.c                        |    1 +
 drivers/media/i2c/og01a1b.c                        |    8 +-
 drivers/media/i2c/og0ve1b.c                        |  455 ++-
 drivers/media/i2c/os02g10.c                        |  934 ++++++
 drivers/media/i2c/os05b10.c                        |    2 +
 drivers/media/i2c/ov01a10.c                        |    3 +
 drivers/media/i2c/ov02a10.c                        |    3 +-
 drivers/media/i2c/ov02c10.c                        |    5 +-
 drivers/media/i2c/ov02e10.c                        |    1 +
 drivers/media/i2c/ov05c10.c                        |  971 ++++++
 drivers/media/i2c/ov08d10.c                        |    1 +
 drivers/media/i2c/ov08x40.c                        |    1 +
 drivers/media/i2c/ov13858.c                        |   51 +
 drivers/media/i2c/ov13b10.c                        |    1 +
 drivers/media/i2c/ov2640.c                         |    2 +
 drivers/media/i2c/ov2659.c                         |    1 +
 drivers/media/i2c/ov2680.c                         |    3 +
 drivers/media/i2c/ov2685.c                         |    2 +
 drivers/media/i2c/ov2732.c                         |    4 +-
 drivers/media/i2c/ov2735.c                         |    5 +-
 drivers/media/i2c/ov2740.c                         |    1 +
 drivers/media/i2c/ov4689.c                         |    2 +
 drivers/media/i2c/ov5640.c                         |    2 +
 drivers/media/i2c/ov5645.c                         |    4 +-
 drivers/media/i2c/ov5647.c                         |    6 +
 drivers/media/i2c/ov5648.c                         |    5 +-
 drivers/media/i2c/ov5670.c                         |    2 +
 drivers/media/i2c/ov5675.c                         |    2 +
 drivers/media/i2c/ov5693.c                         |   28 +
 drivers/media/i2c/ov5695.c                         |    1 +
 drivers/media/i2c/ov6211.c                         |    3 +-
 drivers/media/i2c/ov64a40.c                        |    2 +
 drivers/media/i2c/ov7251.c                         |    4 +-
 drivers/media/i2c/ov7670.c                         |    1 +
 drivers/media/i2c/ov772x.c                         |    4 +-
 drivers/media/i2c/ov7740.c                         |    1 +
 drivers/media/i2c/ov8856.c                         |   33 +-
 drivers/media/i2c/ov8858.c                         |   11 +-
 drivers/media/i2c/ov8865.c                         |    2 +
 drivers/media/i2c/ov9282.c                         |    4 +-
 drivers/media/i2c/ov9640.c                         |    2 +
 drivers/media/i2c/ov9650.c                         |    1 +
 drivers/media/i2c/ov9734.c                         |    1 +
 drivers/media/i2c/rdacm20.c                        |    1 -
 drivers/media/i2c/rdacm21.c                        |    1 -
 drivers/media/i2c/rj54n1cb0c.c                     |    3 +
 drivers/media/i2c/s5c73m3/s5c73m3-core.c           |    2 +
 drivers/media/i2c/s5k3m5.c                         |    4 +-
 drivers/media/i2c/s5k5baf.c                        |    3 +
 drivers/media/i2c/s5k6a3.c                         |    1 +
 drivers/media/i2c/s5kjn1.c                         |    4 +-
 drivers/media/i2c/s5kjn5.c                         | 2897 +++++++++++++++++
 drivers/media/i2c/saa6752hs.c                      |    1 +
 drivers/media/i2c/saa7115.c                        |    1 +
 drivers/media/i2c/saa717x.c                        |    1 +
 drivers/media/i2c/st-mipid02.c                     |    1 +
 drivers/media/i2c/t4ka3.c                          |    4 +-
 drivers/media/i2c/tc358743.c                       |    6 +-
 drivers/media/i2c/tc358746.c                       |    1 +
 drivers/media/i2c/tda1997x.c                       |    3 +-
 drivers/media/i2c/thp7312.c                        |    1 +
 drivers/media/i2c/ths7303.c                        |   10 +-
 drivers/media/i2c/ths8200.c                        |   14 +-
 drivers/media/i2c/ths8200_regs.h                   |   14 +-
 drivers/media/i2c/tvp514x.c                        |    1 +
 drivers/media/i2c/tvp5150.c                        |    3 +-
 drivers/media/i2c/tvp7002.c                        |    1 +
 drivers/media/i2c/tw9900.c                         |    1 +
 drivers/media/i2c/tw9910.c                         |    2 +
 drivers/media/i2c/vd55g1.c                         |   18 +-
 drivers/media/i2c/vd56g3.c                         |    4 +-
 drivers/media/i2c/vgxy61.c                         |    4 +-
 drivers/media/i2c/wm8739.c                         |    2 +-
 drivers/media/mc/mc-entity.c                       |   15 +-
 drivers/media/pci/bt8xx/bttv-driver.c              |    8 +-
 drivers/media/pci/cobalt/cobalt-driver.c           |    8 +-
 drivers/media/pci/cobalt/cobalt-v4l2.c             |   10 +-
 drivers/media/pci/cx18/cx18-av-core.c              |    1 +
 drivers/media/pci/cx18/cx18-controls.c             |    2 +-
 drivers/media/pci/cx18/cx18-driver.c               |    9 +-
 drivers/media/pci/cx18/cx18-ioctl.c                |    2 +-
 drivers/media/pci/cx18/cx18-queue.c                |    5 +-
 drivers/media/pci/cx18/cx23418.h                   |    2 +-
 drivers/media/pci/cx23885/cx23885-core.c           |    4 +
 drivers/media/pci/cx23885/cx23885-dvb.c            |   14 +-
 drivers/media/pci/cx23885/cx23885-video.c          |    4 +-
 drivers/media/pci/cx88/cx88-input.c                |   22 +-
 drivers/media/pci/cx88/cx88-mpeg.c                 |    9 +-
 drivers/media/pci/cx88/cx88-video.c                |    8 +-
 drivers/media/pci/hws/hws.h                        |    4 +-
 drivers/media/pci/hws/hws_pci.c                    |    6 +-
 drivers/media/pci/hws/hws_reg.h                    |   10 +-
 drivers/media/pci/hws/hws_v4l2_ioctl.c             |    5 +-
 drivers/media/pci/hws/hws_video.c                  |    6 +-
 drivers/media/pci/intel/ipu-bridge.c               |  208 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |    1 +
 drivers/media/pci/intel/ipu6/Kconfig               |   20 +-
 drivers/media/pci/intel/ipu6/Makefile              |   10 +-
 drivers/media/pci/intel/ipu6/ipu6-bus.h            |    6 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |  633 +++-
 drivers/media/pci/intel/ipu6/ipu6-buttress.h       |   52 +-
 drivers/media/pci/intel/ipu6/ipu6-cpd.c            |  195 +-
 drivers/media/pci/intel/ipu6/ipu6-cpd.h            |   43 +
 drivers/media/pci/intel/ipu6/ipu6-dma.c            |   24 +-
 drivers/media/pci/intel/ipu6/ipu6-dma.h            |    2 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c        |  618 +++-
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h        |   48 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  582 +++-
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |   18 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  217 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |    6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c    |   23 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h    |    3 +
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     |  750 +----
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |   62 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |  604 ++--
 drivers/media/pci/intel/ipu6/ipu6-isys.h           |  126 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c         |  296 ++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c            |  133 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.h            |  159 +-
 .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |  121 +-
 drivers/media/pci/intel/ipu6/ipu6.c                |  590 ++--
 drivers/media/pci/intel/ipu6/ipu6.h                |  205 +-
 drivers/media/pci/intel/ipu6/ipu7-boot.c           |  400 +++
 drivers/media/pci/intel/ipu6/ipu7-boot.h           |   76 +
 drivers/media/pci/intel/ipu6/ipu7-fw-com.c         |   74 +
 drivers/media/pci/intel/ipu6/ipu7-fw-com.h         |   53 +
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c        |  874 +++++
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h        |  355 +++
 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c   | 1074 +++++++
 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.h   |   16 +
 drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h | 1191 +++++++
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c         | 1116 +++++++
 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h         |  369 +++
 drivers/media/pci/intel/ipu6/ipu7-platform-regs.h  |   44 +
 drivers/media/pci/intel/ivsc/mei_ace.c             |    4 +-
 drivers/media/pci/intel/ivsc/mei_csi.c             |    8 +-
 drivers/media/pci/ivtv/ivtv-controls.c             |    2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c                |    2 +-
 drivers/media/pci/saa7134/saa7134-core.c           |    8 +-
 drivers/media/pci/saa7134/saa7134-empress.c        |    4 +-
 drivers/media/pci/saa7134/saa7134-input.c          |    7 +-
 drivers/media/pci/saa7146/mxb.c                    |    4 +-
 drivers/media/pci/saa7164/saa7164-core.c           |   32 +-
 drivers/media/pci/saa7164/saa7164.h                |    1 -
 drivers/media/pci/tw68/tw68-core.c                 |   10 +-
 drivers/media/pci/tw686x/tw686x-core.c             |   10 +
 drivers/media/platform/amd/isp4/isp4_subdev.c      |    1 +
 drivers/media/platform/amd/isp4/isp4_video.c       |    2 +-
 .../media/platform/amlogic/c3/isp/c3-isp-core.c    |    1 +
 .../media/platform/amlogic/c3/isp/c3-isp-resizer.c |    3 +
 .../amlogic/c3/mipi-adapter/c3-mipi-adap.c         |    1 +
 .../platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c   |    1 +
 drivers/media/platform/amphion/vpu_core.c          |   19 +-
 drivers/media/platform/amphion/vpu_drv.c           |    1 +
 .../media/platform/arm/mali-c55/mali-c55-core.c    |   32 +-
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |    4 +
 .../media/platform/arm/mali-c55/mali-c55-params.c  |    3 +
 .../media/platform/arm/mali-c55/mali-c55-resizer.c |   15 +-
 .../media/platform/arm/mali-c55/mali-c55-stats.c   |   18 +-
 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c |    1 +
 drivers/media/platform/aspeed/aspeed-video.c       |   12 +-
 drivers/media/platform/atmel/atmel-isi.c           |   11 +-
 drivers/media/platform/broadcom/bcm2835-unicam.c   |    1 +
 drivers/media/platform/cadence/cdns-csi2rx.c       |    5 +
 drivers/media/platform/cadence/cdns-csi2tx.c       |    1 +
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |    8 +-
 .../media/platform/chips-media/wave5/wave5-vpu.c   |    7 +
 .../platform/chips-media/wave5/wave5-vpuapi.c      |   15 +-
 .../media/platform/imagination/e5010-jpeg-enc.c    |    4 +-
 drivers/media/platform/intel/pxa_camera.c          |    6 +-
 drivers/media/platform/m2m-deinterlace.c           |    5 +-
 drivers/media/platform/marvell/Kconfig             |    1 +
 drivers/media/platform/marvell/cafe-driver.c       |    2 +-
 drivers/media/platform/marvell/mcam-core.c         |   24 +-
 drivers/media/platform/marvell/mmp-driver.c        |    5 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   |   65 +-
 drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h  |    2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   |   14 +-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   |    2 +
 .../mediatek/vcodec/decoder/vdec_ipi_msg.h         |    4 +-
 drivers/media/platform/mediatek/vpu/mtk_vpu.c      |   14 +-
 drivers/media/platform/mediatek/vpu/mtk_vpu.h      |    4 +-
 .../media/platform/microchip/microchip-csi2dc.c    |    2 +
 .../media/platform/microchip/microchip-isc-base.c  |   82 +-
 .../media/platform/microchip/microchip-isc-clk.c   |    7 +-
 .../media/platform/microchip/microchip-isc-regs.h  |   16 +-
 .../platform/microchip/microchip-isc-scaler.c      |    2 +
 drivers/media/platform/microchip/microchip-isc.h   |    5 +-
 .../platform/microchip/microchip-sama5d2-isc.c     |   48 +-
 .../platform/microchip/microchip-sama7g5-isc.c     |   48 +-
 drivers/media/platform/nuvoton/npcm-video.c        |   18 +-
 drivers/media/platform/nxp/Kconfig                 |   16 +
 drivers/media/platform/nxp/Makefile                |    1 +
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |   23 +-
 drivers/media/platform/nxp/imx-mipi-csis.c         |    3 +-
 drivers/media/platform/nxp/imx7-media-csi.c        |    1 +
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |    1 +
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |    3 +
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |    1 +
 drivers/media/platform/nxp/imx95-csi-formatter.c   |  759 +++++
 drivers/media/platform/qcom/camss/Kconfig          |    2 +
 drivers/media/platform/qcom/camss/camss-csid.c     |    3 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  203 +-
 drivers/media/platform/qcom/camss/camss-csiphy.h   |   12 +-
 drivers/media/platform/qcom/camss/camss-ispif.c    |    3 +-
 drivers/media/platform/qcom/camss/camss-tpg.c      |    3 +-
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |   46 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   26 +-
 drivers/media/platform/qcom/camss/camss.c          |  367 ++-
 drivers/media/platform/qcom/camss/camss.h          |    3 +
 drivers/media/platform/qcom/iris/Makefile          |    2 +
 drivers/media/platform/qcom/iris/iris_core.c       |    6 +
 drivers/media/platform/qcom/iris/iris_core.h       |    6 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   96 +
 drivers/media/platform/qcom/iris/iris_ctrls.h      |    1 +
 drivers/media/platform/qcom/iris/iris_firmware.c   |  119 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.c |    7 +-
 drivers/media/platform/qcom/iris/iris_hfi_common.h |    1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c   |  406 ++-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   30 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   15 +
 .../platform/qcom/iris/iris_hfi_gen1_response.c    |   82 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  945 ++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |    2 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |    3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |    1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |   18 +-
 .../platform/qcom/iris/iris_platform_common.h      |   32 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |   13 +-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |   25 +-
 .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  |  118 +
 drivers/media/platform/qcom/iris/iris_probe.c      |   68 +-
 drivers/media/platform/qcom/iris/iris_resources.c  |    2 +
 drivers/media/platform/qcom/iris/iris_utils.c      |    6 +
 drivers/media/platform/qcom/iris/iris_utils.h      |    1 +
 drivers/media/platform/qcom/iris/iris_vb2.c        |    6 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       |   44 +-
 drivers/media/platform/qcom/iris/iris_venc.c       |   33 +-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   50 +-
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   30 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |    6 +
 drivers/media/platform/qcom/iris/iris_vpu4x.c      |    2 +
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c |  130 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  370 +++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   38 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c |   52 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |    6 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |    1 -
 drivers/media/platform/qcom/venus/core.c           |   70 +-
 drivers/media/platform/qcom/venus/core.h           |    6 +
 drivers/media/platform/qcom/venus/hfi_msgs.c       |    3 +
 drivers/media/platform/raspberrypi/rp1-cfe/csi2.c  |    1 +
 .../media/platform/raspberrypi/rp1-cfe/pisp-fe.c   |    1 +
 drivers/media/platform/renesas/rcar-csi2.c         |  377 ++-
 drivers/media/platform/renesas/rcar-isp/core-io.c  |   40 +-
 drivers/media/platform/renesas/rcar-isp/csisp.c    |  228 +-
 .../media/platform/renesas/rcar-vin/rcar-core.c    |   27 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |    2 +-
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |   70 +-
 drivers/media/platform/renesas/rcar_drif.c         |    2 +-
 drivers/media/platform/renesas/renesas-ceu.c       |    7 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |    3 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |    2 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |    3 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |    3 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c |   13 +-
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     |   11 +-
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  |    1 +
 drivers/media/platform/renesas/sh_vou.c            |    6 +-
 drivers/media/platform/renesas/vsp1/vsp1_brx.c     |    3 +
 drivers/media/platform/renesas/vsp1/vsp1_dl.c      |    2 +-
 drivers/media/platform/renesas/vsp1/vsp1_drm.c     |   18 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |    4 +-
 drivers/media/platform/renesas/vsp1/vsp1_entity.h  |    1 +
 drivers/media/platform/renesas/vsp1/vsp1_histo.c   |    3 +
 drivers/media/platform/renesas/vsp1/vsp1_hsit.c    |    1 +
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |    3 +
 drivers/media/platform/renesas/vsp1/vsp1_sru.c     |    1 +
 drivers/media/platform/renesas/vsp1/vsp1_uds.c     |    1 +
 drivers/media/platform/renesas/vsp1/vsp1_uif.c     |    2 +
 drivers/media/platform/renesas/vsp1/vsp1_vspx.c    |    3 +-
 drivers/media/platform/rockchip/rga/rga-hw.c       |    8 -
 drivers/media/platform/rockchip/rga/rga.c          |   13 +-
 drivers/media/platform/rockchip/rga/rga.h          |    1 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   |  155 +-
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |    1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |    4 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |   21 +
 .../platform/rockchip/rkcif/rkcif-interface.c      |    3 +
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h |    1 +
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |    1 +
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |    4 +-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |    3 +
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |    3 +
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   16 +-
 .../platform/samsung/exynos4-is/fimc-capture.c     |    8 +-
 .../media/platform/samsung/exynos4-is/fimc-isp.c   |    1 +
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |    6 +-
 .../media/platform/samsung/exynos4-is/mipi-csis.c  |    1 +
 .../platform/samsung/s3c-camif/camif-capture.c     |    3 +
 .../media/platform/samsung/s3c-camif/camif-core.c  |    2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |    4 +-
 .../media/platform/st/sti/delta/delta-mjpeg-hdr.c  |    7 +-
 drivers/media/platform/st/stm32/stm32-csi.c        |    6 +-
 drivers/media/platform/st/stm32/stm32-dcmi.c       |   31 +-
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |    3 +-
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |   30 +-
 .../{dcmipp-bytecap.c =3D> dcmipp-capture.c}         |  600 +++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |   99 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  124 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  |  125 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    |  493 +++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     |  181 ++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |   42 +
 .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       |  942 ++++++
 .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |    1 +
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c    |  156 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.h    |    9 -
 .../platform/sunxi/sun6i-csi/sun6i_csi_capture.c   |   27 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c        |  108 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h        |    2 -
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c    |  113 +-
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h    |    2 -
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   |    1 +
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |  423 ++-
 .../media/platform/synopsys/hdmirx/snps_hdmirx.h   |    8 +
 drivers/media/platform/ti/Kconfig                  |   11 -
 drivers/media/platform/ti/am437x/am437x-vpfe.c     |    2 +-
 drivers/media/platform/ti/cal/cal-camerarx.c       |    1 +
 drivers/media/platform/ti/cal/cal-video.c          |   19 +-
 drivers/media/platform/ti/cal/cal.c                |   10 +-
 drivers/media/platform/ti/davinci/vpif_capture.c   |    5 +-
 drivers/media/platform/ti/davinci/vpif_display.c   |    3 +
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |   25 +
 drivers/media/platform/ti/omap3isp/ispccdc.c       |    5 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c       |    3 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c       |    3 +-
 drivers/media/platform/ti/omap3isp/isppreview.c    |    5 +-
 drivers/media/platform/ti/omap3isp/ispresizer.c    |    5 +-
 drivers/media/platform/ti/omap3isp/ispvideo.c      |    4 +-
 drivers/media/platform/ti/vpe/vip.c                |    4 +-
 drivers/media/platform/verisilicon/hantro_drv.c    |   84 +-
 .../platform/verisilicon/hantro_g1_mpeg2_dec.c     |    5 +
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       |   68 +-
 drivers/media/platform/via/via-camera.c            |    4 +-
 drivers/media/platform/video-mux.c                 |    1 +
 drivers/media/platform/xilinx/xilinx-csi2rxss.c    |    1 +
 drivers/media/platform/xilinx/xilinx-tpg.c         |    1 +
 drivers/media/radio/si4713/radio-usb-si4713.c      |    4 +-
 drivers/media/radio/si4713/si4713.c                |    2 +-
 drivers/media/rc/bpf-lirc.c                        |   18 +-
 drivers/media/rc/ene_ir.c                          |    4 +-
 drivers/media/rc/fintek-cir.c                      |   17 +-
 drivers/media/rc/fintek-cir.h                      |   22 -
 drivers/media/rc/imon.c                            |  178 +-
 drivers/media/rc/ir-hix5hd2.c                      |    5 +-
 drivers/media/rc/ir-mce_kbd-decoder.c              |    5 +-
 drivers/media/rc/ir_toy.c                          |    4 +-
 drivers/media/rc/ite-cir.c                         |    1 -
 drivers/media/rc/ite-cir.h                         |    1 -
 drivers/media/rc/lirc_dev.c                        |    5 +
 drivers/media/rc/mceusb.c                          |    1 -
 drivers/media/rc/meson-ir-tx.c                     |   20 +-
 drivers/media/rc/nuvoton-cir.h                     |    3 -
 drivers/media/rc/rc-ir-raw.c                       |   86 +-
 drivers/media/rc/rc-loopback.c                     |    5 -
 drivers/media/rc/rc-main.c                         |  206 +-
 drivers/media/rc/redrat3.c                         |   32 +-
 drivers/media/rc/serial_ir.c                       |    2 +-
 drivers/media/rc/streamzap.c                       |    1 +
 drivers/media/rc/sunxi-cir.c                       |    2 +-
 drivers/media/spi/Kconfig                          |    4 -
 drivers/media/test-drivers/vicodec/codec-fwht.h    |    2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |   16 +-
 drivers/media/test-drivers/vidtv/vidtv_bridge.c    |   75 +-
 drivers/media/test-drivers/vidtv/vidtv_demod.c     |    9 -
 drivers/media/test-drivers/vim2m.c                 |   33 +-
 drivers/media/test-drivers/vimc/vimc-debayer.c     |    1 +
 drivers/media/test-drivers/vimc/vimc-scaler.c      |    3 +
 drivers/media/test-drivers/vimc/vimc-sensor.c      |    9 +-
 drivers/media/test-drivers/vivid/vivid-cec.c       |   10 +-
 drivers/media/test-drivers/vivid/vivid-core.c      |    1 +
 drivers/media/test-drivers/vivid/vivid-vid-cap.c   |   13 +
 drivers/media/tuners/tda18250.c                    |    3 +-
 drivers/media/usb/airspy/airspy.c                  |    6 +-
 drivers/media/usb/au0828/au0828-core.c             |    4 +
 drivers/media/usb/au0828/au0828-dvb.c              |   20 +-
 drivers/media/usb/cx231xx/cx231xx-417.c            |    2 +-
 drivers/media/usb/cx231xx/cx231xx-audio.c          |   15 +-
 drivers/media/usb/cx231xx/cx231xx-avcore.c         |  103 -
 drivers/media/usb/cx231xx/cx231xx-cards.c          |    2 +-
 drivers/media/usb/cx231xx/cx231xx-video.c          |    4 +-
 drivers/media/usb/cx231xx/cx231xx.h                |    2 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c        |    4 +-
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c            |   14 +-
 drivers/media/usb/dvb-usb/cxusb-analog.c           |    6 +-
 drivers/media/usb/dvb-usb/dib0700_core.c           |    2 +-
 drivers/media/usb/dvb-usb/dvb-usb-firmware.c       |    2 +
 drivers/media/usb/em28xx/em28xx-audio.c            |    7 +
 drivers/media/usb/em28xx/em28xx-camera.c           |    2 +-
 drivers/media/usb/em28xx/em28xx-cards.c            |   38 +
 drivers/media/usb/em28xx/em28xx-core.c             |    3 -
 drivers/media/usb/em28xx/em28xx-video.c            |   46 +-
 drivers/media/usb/em28xx/em28xx.h                  |    2 +
 drivers/media/usb/go7007/go7007-driver.c           |    5 +-
 drivers/media/usb/go7007/go7007-usb.c              |    8 +
 drivers/media/usb/go7007/go7007-v4l2.c             |    2 +-
 drivers/media/usb/go7007/s2250-board.c             |    1 +
 drivers/media/usb/gspca/gspca.c                    |    3 +-
 drivers/media/usb/gspca/ov519.c                    |    2 +-
 drivers/media/usb/gspca/w996Xcf.c                  |    2 +-
 drivers/media/usb/hackrf/hackrf.c                  |    7 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            |   14 +-
 drivers/media/usb/pvrusb2/pvrusb2-sysfs.c          |    1 +
 drivers/media/usb/usbtv/usbtv-core.c               |    2 -
 drivers/media/usb/usbtv/usbtv-video.c              |    4 +
 drivers/media/usb/uvc/uvc_ctrl.c                   |  117 +-
 drivers/media/usb/uvc/uvc_driver.c                 |   45 +-
 drivers/media/usb/uvc/uvc_status.c                 |    2 +-
 drivers/media/usb/uvc/uvc_video.c                  |    4 +-
 drivers/media/usb/uvc/uvcvideo.h                   |    4 +-
 drivers/media/v4l2-core/v4l2-common.c              |   23 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   19 +-
 drivers/media/v4l2-core/v4l2-isp.c                 |   15 +-
 drivers/media/v4l2-core/v4l2-mc.c                  |    5 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |  163 +-
 drivers/phy/phy-core.c                             |  166 +-
 drivers/phy/qualcomm/Kconfig                       |   15 +
 drivers/phy/qualcomm/Makefile                      |    5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c |  385 +++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  463 +++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   97 +
 drivers/platform/x86/intel/atomisp2/pm.c           |    6 +-
 drivers/platform/x86/intel/int3472/discrete.c      |   82 +-
 drivers/platform/x86/intel/int3472/tps68470.c      |  107 +-
 drivers/platform/x86/intel/int3472/tps68470.h      |    8 +
 .../x86/intel/int3472/tps68470_board_data.c        |  181 +-
 drivers/staging/media/Kconfig                      |    2 -
 drivers/staging/media/Makefile                     |    1 -
 drivers/staging/media/atomisp/TODO                 |   36 +-
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |    5 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |    5 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |   17 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |    4 +-
 drivers/staging/media/atomisp/pci/atomisp_csi2.c   |    1 +
 .../media/atomisp/pci/atomisp_gmin_platform.c      |    2 +-
 .../staging/media/atomisp/pci/atomisp_internal.h   |    2 -
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |    3 +
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |   22 +-
 .../media/atomisp/pci/base/refcount/src/refcount.c |    3 +-
 .../atomisp/pci/hive_isp_css_common/host/gdc.c     |   24 +-
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h |    4 +-
 .../atomisp/pci/runtime/inputfifo/src/inputfifo.c  |   16 -
 drivers/staging/media/av7110/av7110.c              |    2 +-
 drivers/staging/media/av7110/av7110_ir.c           |    2 -
 drivers/staging/media/av7110/sp8870.c              |    9 +-
 drivers/staging/media/imx/imx-ic-prp.c             |    2 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |    4 +-
 drivers/staging/media/imx/imx-media-capture.c      |    1 -
 drivers/staging/media/imx/imx-media-csc-scaler.c   |    3 +-
 drivers/staging/media/imx/imx-media-csi.c          |    3 +
 drivers/staging/media/imx/imx-media-dev.c          |    1 -
 drivers/staging/media/imx/imx-media-vdic.c         |    1 +
 drivers/staging/media/imx/imx6-mipi-csi2.c         |    1 +
 drivers/staging/media/ipu3/ipu3-css.c              |    1 -
 drivers/staging/media/ipu3/ipu3-v4l2.c             |    3 +
 drivers/staging/media/ipu7/TODO                    |   28 +-
 drivers/staging/media/ipu7/ipu7-isys-csi2.c        |    2 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.c      |    1 +
 drivers/staging/media/ipu7/ipu7-isys-subdev.h      |    1 +
 drivers/staging/media/ipu7/ipu7-isys.c             |    1 +
 drivers/staging/media/ipu7/ipu7.c                  |    7 +
 drivers/staging/media/max96712/Kconfig             |   13 -
 drivers/staging/media/max96712/Makefile            |    2 -
 drivers/staging/media/max96712/max96712.c          |  487 ---
 drivers/staging/media/meson/vdec/vdec.c            |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |    4 +
 .../staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c |    1 +
 drivers/staging/media/tegra-video/csi.c            |    1 +
 drivers/staging/media/tegra-video/tegra20.c        |    7 +-
 drivers/staging/media/tegra-video/vi.c             |  113 +-
 .../dt-bindings/media/video-interface-devices.h    |   13 +
 include/linux/pci_ids.h                            |    2 +
 include/linux/phy/phy.h                            |   13 +
 include/linux/platform_data/x86/int3472.h          |    2 +
 include/linux/property.h                           |    5 +
 include/media/ipu-bridge.h                         |   53 +-
 include/media/ipu6-pci-table.h                     |    6 +
 include/media/rc-map.h                             |    2 -
 include/media/v4l2-common.h                        |   75 +-
 include/media/v4l2-ctrls.h                         |    6 +
 include/media/v4l2-dv-timings.h                    |   14 +
 include/media/v4l2-subdev.h                        |   34 +-
 include/uapi/linux/it6625.h                        |   25 +
 include/uapi/linux/media.h                         |    7 +
 include/uapi/linux/media/arm/mali-c55-config.h     |    2 +
 include/uapi/linux/media/st/dcmipp_config.h        |   16 +
 include/uapi/linux/v4l2-controls.h                 |   21 +
 654 files changed, 44404 insertions(+), 7990 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx95-csi-f=
ormatter.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/himax,hm124=
6.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ite,it6625.=
yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max92=
96a.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g1=
0.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k=
jn5.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx576=
.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc3=
58743.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc3=
58743.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,glymur-cam=
ss.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi=
2-phy.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/dcmipp.rst
 create mode 100644 drivers/media/i2c/hm1246.c
 create mode 100644 drivers/media/i2c/imx576.c
 create mode 100644 drivers/media/i2c/it6625.c
 delete mode 100644 drivers/media/i2c/max96714.c
 delete mode 100644 drivers/media/i2c/max96717.c
 create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
 create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
 create mode 100644 drivers/media/i2c/maxim-serdes/max9296a.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max96717.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max96724.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_des.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_des.h
 create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.h
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h
 create mode 100644 drivers/media/i2c/os02g10.c
 create mode 100644 drivers/media/i2c/ov05c10.c
 create mode 100644 drivers/media/i2c/s5kjn5.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-boot.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-com.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi-phy.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-isys-csi2-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-mmu-hw.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu7-platform-regs.h
 create mode 100644 drivers/media/platform/nxp/imx95-csi-formatter.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_vpu_ar50=
lt.c
 create mode 100644 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
 rename drivers/media/platform/st/stm32/stm32-dcmipp/{dcmipp-bytecap.c =3D>=
 dcmipp-capture.c} (53%)
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp=
.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pix=
elcommon.c
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pix=
elcommon.h
 create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pix=
elproc.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
 delete mode 100644 drivers/staging/media/max96712/Kconfig
 delete mode 100644 drivers/staging/media/max96712/Makefile
 delete mode 100644 drivers/staging/media/max96712/max96712.c
 create mode 100644 include/dt-bindings/media/video-interface-devices.h
 create mode 100644 include/uapi/linux/it6625.h
 create mode 100644 include/uapi/linux/media/st/dcmipp_config.h
