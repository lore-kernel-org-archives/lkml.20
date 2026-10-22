Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677191;
	b=sJNx001EgQnAZE40drY3xHVQusMuuP0zysjLGPgLfEH/r/hGgL3dzO1JnrN3oIDYd01A
	 bxTqzuZSfOcENxvY+exJzBbYiGlfxzdzx9Y3sf/duzlG5ejGAG6xFyA67jRFk+DmFygVr
	 s0pHZbOKeb+ZLqTVdBPnDzuKHqxdCrPBuUNansJIQ023sIRNp15N6u7YumVrZZ1fsE46d
	 lSm6orB4FY9YFGSh+co/SepXp0p+1VaxV5OxJyDFK8wHZgz4W8rCQaW3g1sVwZYQuiOvD
	 /RZaHB4Z/YFrH+E4NzYvcTkVAJu0AU3Fw7wwcc8GuStKKdDX9T7sGn1HiZ7FGFBSjIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677191;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=5tsA+oHDrGsC1Zp+CMBUjPHbQsYoCYJU78uUv6SAS4Y=;
	b=EViJ6IDo7hCAr2D4Kc9hVoNf0nR37C/rj5k4ErCUT2NNxIvvNMQmrSml79eDgPlT5Oz7
	 0pG4EcxkXJtQMyWO5uykyh5CjWos1Q/KbHJwu9pdJsHnL7/v/3yYm9E8X0bSGMrmcInIv
	 MYdDn88s3ig403Om+gWN0jffNT6nWb4Pr1o4QW5l5Rsy4/844VEGE3tTpRo4A6G1sOzuG
	 3jlvKnCn5rFIh4hgSEyCwRRCPgX6LHKpI7Rk1k4cJ5op9T3xsen72ryAl0AekuFM09H5I
	 MXi3Acnc/Ihv6Vzxg5I8IqDDJy6+uq3Amms4GZs0apviF2kTlcu5u+RRGa/LTdO7Lrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0KF8menA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170A606A31F;
	Thu, 22 Oct 2026 13:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0KF8menA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D9B1F000C6;
	Thu, 22 Oct 2026 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792677190;
	bh=5tsA+oHDrGsC1Zp+CMBUjPHbQsYoCYJU78uUv6SAS4Y=;
	h=Date:From:To:Cc:Subject;
	b=0KF8menAMkA2wtV0GB5FxJgfQ2tDG9th0cvCpmAl9+pXvzaaOBCch57btrIUzeOR0
	 qRoWAYBYgLOt4uBTESzfBUSyKw+RM1QwsT+zgD4OrZhPKt9FoSnLCm2s99EG4baDOV
	 Am5bXPbcWE8AYY9SJbmvToYpo7KgAXXeo/YSeTcE=
Date: Thu, 22 Oct 2026 15:50:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB/Thunderbolt driver updates for 7.4-rc1
Message-ID: <atoUqhA4O6NAoZ7T@kroah.com>
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

The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf78a:

  Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.4-rc1

for you to fetch changes up to bdf12cde30830d46a8ef1ba93986356f1164b4f1:

  usb: gadget: dummy_hcd: prevent unbind via sysfs (2026-10-18 10:19:23 +0200)

----------------------------------------------------------------
USB / Thunderbolt changes for 7.4-rc1

Here is the big set of USB and Thunderbolt changes for 7.4-rc1.
Included in here are:
  - thunderbolt driver updates and fixes
  - lots of dt schema conversions
  - usb gadget driver fixes (and a new maintainer!)
  - usb core fixups with some interactions with the driver core
  - usb serial updates and fixes for scan-found "issues"
  - xhci driver updates
  - typec driver updates
  - dwc3 driver updates
  - lots of usb gadget driver fixes for syzbot found "problems"
  - lots of other small USB driver fixes for randomly reported problems.

All of these have been in linux-next with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Adrian Ng Ho Yin (1):
      usb: dwc2: handle OTG HNP SetFeature requests

Alan Stern (5):
      USB: gadget: core: Improve documentation for usb_ep_disable()
      USB: gadgetfs: Fix races and locking in asynchronous I/O
      USB: gadgetfs: Fix test for copying data in asynchronous I/O
      USB: gadgetfs: Wait for work routines before unloading
      USB: Documentation: Update description of completion callback context

Aleksandr Nogikh (1):
      usb: gadget: dummy_hcd: prevent unbind via sysfs

Alexey Charkov (2):
      dt-bindings: usb: ti,hd3ss3220: Add support for supply regulators
      usb: typec: hd3ss3220: Add support for supply regulators

Ali Resool Tuama (1):
      USB: quirks: add USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE for GameSir G7 SE

Amit Sunil Dhamne (1):
      usb: typec: tcpm: Support native battery energy properties in battery AMS

Anurag (3):
      thunderbolt: Make software margining error counter configurable
      thunderbolt: Fix sideband register access in usb4_port_sw_margin_errors()
      thunderbolt: Extract per-lane extended error counters in software margining

Arka Mondal (3):
      usb-storage: alauda: do not do DMA from the stack
      usb-storage: alauda: check the return value of alauda_read_map()
      usb-storage: alauda: fix out-of-bounds zone index

Arnd Bergmann (1):
      usb: fotg210: fix USB_EHCI_HCD dependency

Atharva Tiwari (3):
      thunderbolt: Move tb_apple_add_links() to pci.c
      thunderbolt: Add device links for Apple machines with Titan Ridge
      thunderbolt: Add device links for Apple systems with Ice Lake

Bartosz Golaszewski (1):
      dt-bindings: usb: qcom,snps-dwc3: Document the Nord DWC3 controller

Bhargav Joshi (7):
      dt-bindings: usb: ti,da830-ohci: Convert to DT schema
      dt-bindings: dma: ti,cppi41: Convert to DT schema
      dt-bindings: phy: ti,am335x-usb-phy: Convert to DT schema
      dt-bindings: usb: ti,musb-am33xx: Convert to DT schema
      dt-bindings: usb: ti,am335x-usb-ctrl-module: Convert to DT schema
      dt-bindings: usb: ti,am33xx-usb: Convert to DT schema
      dt-bindings: usb: ti,da830-musb: Convert to DT schema

Crescent Hsieh (6):
      USB: serial: mxuport: clean up product ID definitions and device table
      USB: serial: mxuport: clean up firmware version handling
      USB: serial: mxuport: add MUX50U-based device support
      USB: serial: add generic write control callbacks
      USB: serial: mxuport: handle SEND_NEXT transmit flow control
      USB: serial: mxuport: support RS485 mode configuration

Danilo Krummrich (1):
      usb: core: don't set drvdata to NULL in usb_unbind_interface()

Diego Fernando Mancera Gomez (1):
      usb: image: microtek: stop SG processing after transfer errors

Dmitry Antipov (1):
      usb: dwc3: simplify dwc3_lsp_write()

Dmitry Baryshkov (1):
      dt-bindings: usb: qcom,snps-dwc3: document the MSM8974 controller

Drobyshev Vladimir (1):
      USB: cdc-acm: add VeriFone VX820 device ID

Fabio Estevam (1):
      usb: xhci-pci: Add TUSB73x0 definitions

Fabrice Gasnier (2):
      dt-bindings: usb: gpio-sbu-mux: Add compatible for FUSB340
      usb: typec: mux: gpio-sbu: enable when only used for orientation

Fan Ye (1):
      thunderbolt: Stop waiting on a path pending bit that never clears

Greg Kroah-Hartman (6):
      Merge patch series "usb: gpio-sbu-mux: add FUSB340 and enable option for orientation"
      Merge 7.3-rc2 into usb-next
      Merge 7.3-rc6 into usb-next
      Merge tag 'thunderbolt-for-v7.4-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next
      Merge tag 'thunderbolt-for-v7.3-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next
      Merge tag 'usb-serial-7.4-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

Gris Ge (1):
      usb: typec: ucsi: Skip CAM query when partner has no alt modes

Haofeng Li (2):
      usb: storage: sddr09: fix OOB access in sddr09_read_map
      usb: dwc2: truncate PIO RX FIFO reads to the request's remaining space

Haotian Zhang (1):
      thunderbolt: dma_test: Tear down DMA paths before stopping the rings

Hemanth Selam (3):
      thunderbolt: Fix typo "forwared" in comment
      usb: chipidea: fix typo "binded" in comments
      usb: dwc2: fix typos in comments

Henry Tseng (1):
      usb: xhci: return an error if the host is not halted

Hongyu Xie (1):
      xhci: check device notification type before forwarding wake event

Huang Wei (1):
      usb: dwc2: debugfs: fix memory leak of hsotg->regset

Igor Skalkin (2):
      usb: gadget: dummy_hcd: fix SuperSpeed ep0 maxpacket
      usb: gadget: dummy_hcd: set no_sg_constraint only on the SuperSpeed bus

Jacob Riff (1):
      usb: typec: ucsi: retry init when the PPM answers early commands incorrectly

Jameson Thies (1):
      usb: typec: ucsi: allow retries of ucsi_resume_work

Jens Glathe (3):
      usb: typec: mux: ps883x: support TYPEC_DP_STATE_F
      usb: typec: mux: ps883x: add a delay after writing config regs
      usb: typec: mux: ps883x: disable USB4 on incomplete USB4 platforms

Jiangong.Han (1):
      USB: usbmon: fix null-ptr-deref in mon_bus_remove() when mon_bus_init() fails

Johan Hovold (6):
      USB: gadget: stop propagating controller OF nodes
      USB: core: amend usb_get_from_anchor() kernel-doc
      USB: cdc-acm: fix urb leak on disconnect
      USB: serial: usb_wwan: fix urb leak on disconnect
      USB: serial: sierra: fix urb leak on write completion
      USB: core: document purpose of interface parent reference

Jonathan Gopel (1):
      thunderbolt: Do not RPM complete unrelated subtrees on unplug

Julia Lawall (1):
      USB: OHCI: drop unneeded semicolon

Karl Mehltretter (1):
      docs: usbmon: Fix a typo in the example

Keisuke Tsukuda (2):
      usb: gadget: composite: avoid warning on aborted delayed status
      usb: gadget: f_mass_storage: ignore class requests while inactive

Krishna Kurapati (2):
      usb: dwc3: qcom: Add support to skip phy management by USB core
      Revert "usb: dwc3: qcom: Add support to skip phy management by USB core"

Linus Walleij (7):
      usb: ehci: support non-standard port status registers
      usb: ehci: add port reset hooks
      usb: ehci: add port speed hook
      usb: ehci: support additional controller quirks
      usb: fotg210: use the common EHCI core
      usb: fotg210-udc: fix endpoint and resource handling
      usb: fotg210: guard host shutdown in gadget-only builds

Liu Chao (1):
      usb: fotg210: validate endpoint index in ep0 handlers

Lucas Martins Alves (1):
      usb: musb: dsps: implement vbus_status and set_vbus platform ops

Marek Vasut (9):
      dt-bindings: usb: generic-ehci: Document ST STM32MP1 SoC compatibles
      ARM: dts: stm32: Use STM32MP13xx compatible string for EHCI USB controller
      ARM: dts: stm32: Use STM32MP15xx compatible string for EHCI USB controller
      dt-bindings: usb: generic-ohci: Document ST STM32MP1 SoC compatibles
      ARM: dts: stm32: Use STM32MP13xx compatible string for OHCI USB controller
      ARM: dts: stm32: Use STM32MP15xx compatible string for OHCI USB controller
      dt-bindings: usb: generic-ohci: Document ST STM32MP2 SoC compatibles
      dt-bindings: usb: generic-ehci: Document ST STM32MP2 SoC compatibles
      arm64: dts: st: Add USB nodes on stm32mp231

Martin Rys (1):
      USB: Improve "New device found" printout message

Mathias Nyman (1):
      xhci: Prevent invalid vdev dereference during sideband unregister

Michael Wyraz (1):
      USB: serial: option: add support for ASR 1286:4e3c modem

Michal Pecio (6):
      usb: xhci: Unlock for command abort polling
      usb: xhci: Guarantee URB giveback on Ring Underrun/Overrun
      usb: xhci: Don't set the skip flag on non-isoc endpoints
      usb: xhci: Shorten the TD skipping loop
      usb: xhci: Rework and improve the TD matching and skipping logic
      usb: xhci: Fix bounce buffer overflow

Mika Westerberg (12):
      thunderbolt: Allow batching of descriptors
      net: thunderbolt: Update ring indices only after all frames are queued
      thunderbolt: Do not WARN about already disabled interrupt on polled rings
      thunderbolt: Clean up ring interrupt register indexing
      thunderbolt: Use shadow copy for ring interrupt mask
      thunderbolt: stream: Use polling with RX ring
      thunderbolt: Write descriptors in tb_ring_poll()
      thunderbolt: Add tb_ring_poll_pending()
      thunderbolt: stream: Do not hold the lock while busy polling
      thunderbolt: stream: Check the Rx ring before task starts sleeping
      thunderbolt: stream: Improve CLOSE handling on write side
      thunderbolt: stream: Make read return framing error to the userspace

Mike Rapoport (Microsoft) (1):
      USB: serial: usb_wwan: replace __get_free_page() with kmalloc()

Mikhail Zubenko (1):
      usb: gadget: dummy_hcd: add tick_us module parameter for timer-rate tuning

Neill Kapron (1):
      MAINTAINERS: add Neill Kapron as USB Gadget maintainer

Nguyen Ngoc Thang (1):
      usb: storage: ene_ub6250: set transport_reset to avoid NULL deref

Nguyen Quang Le Kien (1):
      usb: gadget: fix refcount underflow in gadgetfs_bind() error path

Orgad Shaneh (2):
      usb: octeon-hcd: release the USB block when initialization fails
      usb: octeon-hcd: keep SOF interrupts while a pipe needs them

Pan Chuang (11):
      usb: cdns3: Remove redundant dev_err()
      usb: common: usb-conn-gpio: Remove redundant dev_err()
      usb: dwc2: gadget: Remove redundant dev_err()
      usb: dwc3: Remove redundant dev_err()/dev_err_probe()
      usb: gadget: Remove redundant dev_err()
      usb: host: xhci-tegra: Remove redundant dev_err()
      usb: misc: Remove redundant dev_err()/dev_err_probe()
      usb: mtu3: Remove redundant dev_err()
      usb: phy: Remove redundant dev_err()/dev_err_probe()
      usb: renesas_usbhs: Remove redundant dev_err()
      usb: typec: Remove redundant dev_err()/dev_err_probe()

Pankaj Dev (1):
      arm64: dts: st: Add USB nodes on stm32mp251

Pengpeng Hou (3):
      thunderbolt: Require complete DROM entry headers
      usb: musb: da8xx: depopulate OF children on remove
      usb: musb: da8xx: depopulate OF children on probe failure

Reinhard Speyerer (1):
      USB: serial: option: add Rolling Wireless RN947R

Rene Sapiens (2):
      thunderbolt: Define number of dwords for hardware margining results
      thunderbolt: Add extended error counter support for software lane margining

Rosen Penev (2):
      usb: ehci-ppc-of: use platform for irq and ioremap
      usb: ohci-ppc-of: use platform for irq and ioremap

Sang-Hoon Choi (1):
      xhci: dbc: lock the minor IDR on registration failure

Seungjin Bae (1):
      usb: typec: ucsi: ccg: Validate altmode index in GET_CURRENT_CAM response

Shashank Balaji (4):
      usb: core: pass THIS_MODULE implicitly through a macro
      usb: core: set mod_name in driver registration
      usb: typec: set mod_name in driver registration
      usb: ulpi: set mod_name in driver registration

Stephen Horvath (1):
      usb: xhci-pci: Add AMD 600 series to xhci-pci-prom21

Sven Peter (1):
      usb: typec: tipd: Disable mode control for CD321x

Swark Yang (1):
      dt-bindings: usb: generic-xhci: add Axiado AX3005 xHCI variant

Wayne Chang (4):
      dt-bindings: usb: Add Tegra264 XUSB host support
      usb: host: xhci-tegra: Skip MBOX MSG_ENABLED on Tegra264
      usb: host: xhci-tegra: Add Tegra264 XHCI support
      usb: typec: ucsi_ccg: Add retry mechanism in ccg_read

Yuho Choi (1):
      USB: pci-quirks: Release EHCI device reference

Zain Aboobacker (1):
      usb: xhci: fix typos in comments

bui duc phuc (2):
      usb: chipidea: ci_hdrc_imx: Propagate errors from optional IRQ lookup
      usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name

 .../devicetree/bindings/dma/ti/ti,cppi41.yaml      |  109 +
 .../devicetree/bindings/phy/ti,am335x-usb-phy.yaml |   49 +
 .../devicetree/bindings/usb/am33xx-usb.txt         |  200 -
 .../devicetree/bindings/usb/da8xx-usb.txt          |   81 -
 .../devicetree/bindings/usb/generic-ehci.yaml      |   24 +
 .../devicetree/bindings/usb/generic-ohci.yaml      |   24 +
 .../devicetree/bindings/usb/generic-xhci.yaml      |    4 +-
 .../devicetree/bindings/usb/gpio-sbu-mux.yaml      |    1 +
 .../bindings/usb/nvidia,tegra234-xusb.yaml         |   52 +-
 .../devicetree/bindings/usb/ohci-da8xx.txt         |   23 -
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |   22 +
 .../bindings/usb/ti,am335x-usb-ctrl-module.yaml    |   38 +
 .../devicetree/bindings/usb/ti,am33xx-usb.yaml     |  103 +
 .../devicetree/bindings/usb/ti,da830-musb.yaml     |  113 +
 .../devicetree/bindings/usb/ti,da830-ohci.yaml     |   61 +
 .../devicetree/bindings/usb/ti,hd3ss3220.yaml      |   11 +
 .../devicetree/bindings/usb/ti,musb-am33xx.yaml    |  113 +
 Documentation/hwmon/prom21-xhci.rst                |    2 +-
 Documentation/usb/usbmon.rst                       |    2 +-
 MAINTAINERS                                        |   22 +
 arch/arm/boot/dts/st/stm32mp131.dtsi               |    4 +-
 arch/arm/boot/dts/st/stm32mp151.dtsi               |    4 +-
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |   64 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |   63 +
 drivers/net/thunderbolt/main.c                     |    6 +-
 drivers/net/usb/r8152.c                            |    2 +-
 drivers/thunderbolt/debugfs.c                      |  126 +-
 drivers/thunderbolt/dma_test.c                     |   10 +-
 drivers/thunderbolt/eeprom.c                       |   23 +-
 drivers/thunderbolt/icm.c                          |    6 +-
 drivers/thunderbolt/nhi.c                          |  222 +-
 drivers/thunderbolt/nhi.h                          |    2 +
 drivers/thunderbolt/path.c                         |    2 +-
 drivers/thunderbolt/pci.c                          |  113 +
 drivers/thunderbolt/quirks.c                       |   18 +
 drivers/thunderbolt/sb_regs.h                      |    2 +
 drivers/thunderbolt/stream.c                       |  287 +-
 drivers/thunderbolt/switch.c                       |    4 +
 drivers/thunderbolt/tb.c                           |   78 -
 drivers/thunderbolt/tb.h                           |    5 +-
 drivers/thunderbolt/usb4.c                         |   10 +-
 drivers/usb/cdns3/core.c                           |    4 +-
 drivers/usb/cdns3/drd.c                            |    4 +-
 drivers/usb/chipidea/ci_hdrc_imx.c                 |    8 +-
 drivers/usb/chipidea/otg_fsm.c                     |    2 +-
 drivers/usb/chipidea/udc.c                         |    2 +-
 drivers/usb/class/cdc-acm.c                        |    6 +-
 drivers/usb/common/ulpi.c                          |    4 +-
 drivers/usb/common/usb-conn-gpio.c                 |    8 +-
 drivers/usb/core/driver.c                          |   13 +-
 drivers/usb/core/hub.c                             |    2 +-
 drivers/usb/core/message.c                         |    5 +
 drivers/usb/core/quirks.c                          |    3 +
 drivers/usb/core/urb.c                             |   12 +-
 drivers/usb/core/usb.c                             |    2 +-
 drivers/usb/dwc2/core.c                            |    2 +-
 drivers/usb/dwc2/core.h                            |    2 +-
 drivers/usb/dwc2/debugfs.c                         |    6 +-
 drivers/usb/dwc2/gadget.c                          |   98 +-
 drivers/usb/dwc2/hcd.c                             |    4 +-
 drivers/usb/dwc2/hcd_ddma.c                        |    2 +-
 drivers/usb/dwc3/debugfs.c                         |    6 +-
 drivers/usb/dwc3/dwc3-google.c                     |    4 +-
 drivers/usb/dwc3/dwc3-imx.c                        |    2 +-
 drivers/usb/dwc3/dwc3-imx8mp.c                     |    4 +-
 drivers/usb/dwc3/dwc3-keystone.c                   |    5 +-
 drivers/usb/dwc3/dwc3-omap.c                       |    5 +-
 drivers/usb/fotg210/Kconfig                        |    5 +
 drivers/usb/fotg210/fotg210-core.c                 |  273 +-
 drivers/usb/fotg210/fotg210-hcd.c                  | 5666 +-------------------
 drivers/usb/fotg210/fotg210-hcd.h                  |  689 ---
 drivers/usb/fotg210/fotg210-udc.c                  |  114 +-
 drivers/usb/fotg210/fotg210-udc.h                  |    2 +-
 drivers/usb/fotg210/fotg210.h                      |   26 +-
 drivers/usb/gadget/composite.c                     |    2 +-
 drivers/usb/gadget/function/f_mass_storage.c       |    7 +-
 drivers/usb/gadget/legacy/inode.c                  |  208 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c          |    4 +-
 drivers/usb/gadget/udc/aspeed-vhub/dev.c           |    2 -
 drivers/usb/gadget/udc/aspeed_udc.c                |    5 +-
 drivers/usb/gadget/udc/at91_udc.c                  |    1 -
 drivers/usb/gadget/udc/atmel_usba_udc.c            |    5 +-
 drivers/usb/gadget/udc/bcm63xx_udc.c               |    1 -
 drivers/usb/gadget/udc/core.c                      |    9 +-
 drivers/usb/gadget/udc/dummy_hcd.c                 |   61 +-
 drivers/usb/gadget/udc/fsl_udc_core.c              |    3 -
 drivers/usb/gadget/udc/lpc32xx_udc.c               |    1 -
 drivers/usb/gadget/udc/r8a66597-udc.c              |    4 +-
 drivers/usb/gadget/udc/renesas_usbf.c              |    8 +-
 drivers/usb/gadget/udc/snps_udc_plat.c             |    4 +-
 drivers/usb/gadget/udc/tegra-xudc.c                |    5 +-
 drivers/usb/host/Kconfig                           |   13 +
 drivers/usb/host/ehci-dbg.c                        |    3 +-
 drivers/usb/host/ehci-hcd.c                        |   31 +-
 drivers/usb/host/ehci-hub.c                        |  104 +-
 drivers/usb/host/ehci-ppc-of.c                     |   47 +-
 drivers/usb/host/ehci-timer.c                      |    3 +-
 drivers/usb/host/ehci.h                            |   55 +-
 drivers/usb/host/octeon-hcd.c                      |   41 +-
 drivers/usb/host/ohci-dbg.c                        |    2 +-
 drivers/usb/host/ohci-hub.c                        |    2 +-
 drivers/usb/host/ohci-ppc-of.c                     |   44 +-
 drivers/usb/host/pci-quirks.c                      |    4 +-
 drivers/usb/host/xhci-dbgtty.c                     |    2 +
 drivers/usb/host/xhci-pci-prom21.c                 |    3 +
 drivers/usb/host/xhci-pci.c                        |   12 +-
 drivers/usb/host/xhci-pci.h                        |    3 +
 drivers/usb/host/xhci-ring.c                       |  255 +-
 drivers/usb/host/xhci-tegra.c                      |   45 +-
 drivers/usb/host/xhci.c                            |   27 +-
 drivers/usb/host/xhci.h                            |    5 +
 drivers/usb/image/microtek.c                       |    1 +
 drivers/usb/misc/apple-mfi-fastcharge.c            |    2 +-
 drivers/usb/misc/brcmstb-usb-pinmap.c              |    9 +-
 drivers/usb/misc/onboard_usb_dev.c                 |    2 +-
 drivers/usb/misc/qcom_eud.c                        |    2 +-
 drivers/usb/mon/mon_main.c                         |    3 +
 drivers/usb/mtu3/mtu3_core.c                       |    4 +-
 drivers/usb/musb/da8xx.c                           |    8 +-
 drivers/usb/musb/musb_dsps.c                       |   25 +
 drivers/usb/phy/phy-ab8500-usb.c                   |   12 +-
 drivers/usb/phy/phy-generic.c                      |    3 +-
 drivers/usb/phy/phy-gpio-vbus-usb.c                |    5 +-
 drivers/usb/renesas_usbhs/mod.c                    |    4 +-
 drivers/usb/serial/generic.c                       |   11 +-
 drivers/usb/serial/mxuport.c                       |  424 +-
 drivers/usb/serial/option.c                        |    5 +
 drivers/usb/serial/sierra.c                        |    3 +-
 drivers/usb/serial/usb_wwan.c                      |    9 +-
 drivers/usb/storage/alauda.c                       |   95 +-
 drivers/usb/storage/ene_ub6250.c                   |    2 +
 drivers/usb/storage/sddr09.c                       |    9 +
 drivers/usb/storage/usb.c                          |    6 +-
 drivers/usb/typec/anx7411.c                        |    4 +-
 drivers/usb/typec/bus.c                            |    4 +-
 drivers/usb/typec/hd3ss3220.c                      |   36 +-
 drivers/usb/typec/mux/gpio-sbu-mux.c               |   13 +-
 drivers/usb/typec/mux/it5205.c                     |    2 +-
 drivers/usb/typec/mux/ps883x.c                     |   48 +
 drivers/usb/typec/tcpm/tcpci_maxim_core.c          |    3 +-
 drivers/usb/typec/tcpm/tcpci_mt6360.c              |    1 -
 drivers/usb/typec/tcpm/tcpci_mt6370.c              |    2 +-
 drivers/usb/typec/tcpm/tcpm.c                      |   57 +-
 drivers/usb/typec/tipd/core.c                      |    3 +
 drivers/usb/typec/ucsi/ucsi.c                      |   55 +-
 drivers/usb/typec/ucsi/ucsi.h                      |    3 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |   37 +-
 drivers/usb/usbip/stub_main.c                      |    2 +-
 include/linux/pci_ids.h                            |    1 +
 include/linux/thunderbolt.h                        |   47 +-
 include/linux/ulpi/driver.h                        |    4 +-
 include/linux/usb.h                                |   13 +-
 include/linux/usb/serial.h                         |    8 +
 include/linux/usb/typec_altmode.h                  |    4 +-
 154 files changed, 3546 insertions(+), 7571 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/ti,am335x-usb-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/am33xx-usb.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/da8xx-usb.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/ohci-da8xx.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-module.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/ti,da830-musb.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
 delete mode 100644 drivers/usb/fotg210/fotg210-hcd.h
