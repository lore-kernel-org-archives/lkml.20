Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200777;
	b=kSiqeDexYbJ/pv0yLq4jgQZsGeHGQXA3bZQJYrUPuNqV2mVTyK7/QKxti91K/OkNkXDo
	 VxcEtccSK9HH65m56E0DAFPyLnJyyxyIGp7OdNUU4IgmZ9th2jM6Fhz/dhJUb4Dkb12PC
	 b/A+7rO5iWdHxB3549CA5ZYU9fcoq+gtNtwMUubguld0woeMQsr0iz5s+4NOT1KC5Xz6g
	 LY+Zc/CFifknT2SDCdF5nDnISe+yB6jWZbBSvRbHrCnk+QUs8X3THjepEk2P1rxKr9WH2
	 B1eYxwB/G9jsB7n23dHJySxN0iYYOnv67yTqVMIJeRGTSBhC4g9GKOf7HKi6Huv7zkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200777;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=dgpEW0wPOtHm0L0Vn/xpNnFniJWemMnyI17DQIXJ7oU=;
	b=uongS2xVhGqMzDzz2VOXOoFCdygLOI0w0ZLgDnHwZ90O4IVE0aPrH70xtMIZJptOYjhF
	 +AKHeKCjNtRb9WT2b8j0OgTlI5OnjYLja/XDrdHu3x/RQTvC2ODiUw5tVXhkQ85zZV33t
	 Dgja5hkuRiiBKk3C8qQwbiad0lkh85UsqvGhALXW3AsJubA5LuIi1kXW+ZW1YA6MqobwX
	 6gGFQ4A0kYO9fST7XX/LoE6oMjfXpcFgklZ+FjqLsW4cSU3mGpW4O8TcV670qqjSs8p6Q
	 6n9u0ao5X0R3L6kkp+FuKXdKCQhYsu2py9O5bdhsgIiZUI7hIdMHkSV/V1r00l9BsnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOHhdQ13;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC65606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOHhdQ13
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872931F01828;
	Wed, 28 Oct 2026 15:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793200776;
	bh=dgpEW0wPOtHm0L0Vn/xpNnFniJWemMnyI17DQIXJ7oU=;
	h=Date:From:To:Cc:Subject;
	b=NOHhdQ13h0io4oK+jbG9fSN6vLOc4BIYFfz5xgi/iVBTVzTrB7O5vKPjoQuszFbp0
	 EsEU8SR065Uvk1Xjd6ZJaVZfLr86Q49MZzdNIwlSWIkOUNAwgxyc92Ez1JTcjbQExM
	 gDDVsD0ichbpAjZtMHmCIIbtQroHg2tjzRTM45/v1fySetEHLn0LTfjsafBt7hWSoI
	 V8hOYjrw+28ME3QcER6xKMDA/dKP9yHpBA1K9bR1ZK15exu+YJi2znk56iOT3upnWo
	 l/kM1KBROOTUrIqJdUEccnnyFP7ypsJMd8Z2DPa+ohozedJbMS0QMo52Avjtwk/gpD
	 mPH1aWV+wkv3A==
Date: Wed, 28 Oct 2026 20:49:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: Dmaengine subsytem updates for v7.4
Message-ID: <auIShJbyRMki5-bY@parshuram>
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
	protocol="application/pgp-signature"; boundary="S8n8mTrlKbAIlwyJ"
Content-Disposition: inline


--S8n8mTrlKbAIlwyJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Linus,

Please consider pull to receive the updates for this cycle. This
consists of start of work for hiding dmaengine internals and adding new
APIs for dmaengine calls. Also couple of drivers and device and lot of
updates esp AI-assisted improvements to drivers.

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dm=
aengine-7.4-rc1

for you to fetch changes up to aff5e6a77fc69a7c490246465940d18422d7c631:

  dmaengine: amlogic: Fix regmap error check issue (2026-10-17 10:46:26 +01=
00)

----------------------------------------------------------------
dmaengine updates for v7.4

 Core:
  - Better document descriptor flags and clarify ordering rules around
    cookie completion
  - New APIs to start hiding dmaengine guts so that we can start making
    them internal

 New Support:
  - Nord and Maili GPI DMAengine support
  - DW axi dma updates and support for UltraRISC DP1000 controller
  - Apple M3 generation ADMACs support
  - Amlogic A9 SoC DMA controller driver
  - Sun6i refactoring and support for Allwinner A733 DMA controller

 Updates:
  - Freescale device_prep_peripheral_dma_vec support and dynamic
    scatter/gather chaining
  - TI crossbar and cppi DT schema conversion
  - zynqmp driver updates for error patch handling
  - Link list handling improvements for DW edma driver
  - ST dma40 improvements and corner case handling

----------------------------------------------------------------
Aniket Randive (1):
      dmaengine: qcom: gpi: Fix resource leaks as part of channel clean up

Bartosz Golaszewski (2):
      dt-bindings: dma: qcom,gpi: Document the Nord GPI DMA engine
      dmaengine: qcom: bam_dma: free interrupt before the clock in error pa=
th

Beno=EEt Monin (2):
      dmaengine: fsl-edma: Implement device_prep_peripheral_dma_vec
      dmaengine: fsl-edma: Support dynamic scatter/gather chaining

Bhargav Joshi (2):
      dt-bindings: dma: ti,dma-crossbar: Convert to DT schema
      dt-bindings: dma: ti,cppi41: Convert to DT schema

Binbin Zhou (1):
      dmaengine: loongson: loongson2-apb-cmc: Fix signedness bug in irq han=
dling

Bogdan Mahomet (1):
      docs: dmaengine: document ownership of the descriptor flags field

Chaithanya Lagisetty (2):
      dmaengine: dw-axi-dmac: convert clock handling to clk_bulk API
      dmaengine: sprd: use clk_bulk API to fix clock imbalance

Devendra K Verma (2):
      dmaengine: dw-edma: Enable Chan Separation via VSEC
      dmaengine: dw-edma: Add changes to support Channel Separation

Diego Fernando Mancera Gomez (1):
      dmaengine: loongson2-apb-cmc: fix descriptor leak in prep_slave_sg()

Frank Li (15):
      dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL e=
ntry index
      dmaengine: dw-edma: Make DMA link list work as a circular buffer
      dmaengine: dw-edma: Move callback result helper before LL helpers
      dmaengine: vchan: add vchan_chan_name() to get channel device name
      dmaengine: use dma_chan_name() helper to get per-channel device name
      dmaengine: add (dmaengine|vchan)_chan_dev() helper
      dmaengine: add union chan_dev for dma_chan::dev for clarity
      dmaengine: add dmaengine_prep_dma_(pq|pq_val|interrupt|xor)() API
      dmaengine: add dmaengine_is_*_aligned() helpers for DMA consumers
      dmaengine: add dmaengine_get_copy_align() and related alignment gette=
r helpers
      dmaengine: add dmaengine_get_cap_mask() and dmaengine_has_cap() helpe=
rs
      dmaengine: add dmaengine_get_max_xor() helper
      dmaengine: add dmaengine_get_provider_device() API
      dmaengine: add dmaengine_desc_set_callback() helper
      dmaengine: move driver-private helpers out of include/linux/dmaengine=
=2Eh

Golla Nagendra (8):
      dmaengine: zynqmp_dma: Fix PM rollback on sw_desc_pool alloc failure
      dmaengine: zynqmp_dma: Free sw_desc_pool on desc_pool_v alloc failure
      dmaengine: zynqmp_dma: Fix chan probe/remove error handling
      dmaengine: zynqmp_dma: Fix stale kerneldoc comments
      dmaengine: zynqmp_dma: Fix minor whitespace
      dmaengine: zynqmp_dma: Use of_dma_is_coherent for dma-coherent
      dmaengine: zynqmp_dma: Reject zero-length memcpy transfers
      dmaengine: zynqmp_dma: Remove unused define and duplicate IRQ bit

Hemanth Selam (1):
      dmaengine: ppc4xx: fix typo "contoller" in comment

Hongling Zeng (3):
      dmaengine: sun6i-dma: Fix use-after-free in error handling paths
      dmaengine: at_hdmac: Fix use-after-free by proper tasklet cleanup
      dmaengine: at_hdmac: Use stored IRQ in error path

Jia Wang (5):
      dt-bindings: dma: snps,dw-axi-dmac: Add UltraRISC DP1000 compatible
      dmaengine: dw-axi-dmac: Fix AXI burst length encoding
      dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds access
      dmaengine: dw-axi-dmac: Fix CH_CFG2 channel priority position
      dmaengine: dw-axi-dmac: Use bitfield helpers for registers

Jyothi Kumar Seerapu (1):
      dt-bindings: dma: qcom,gpi: Document GPI DMA engine for Maili

Koichiro Den (10):
      dmaengine: dw-edma: Add dw_edma_core_ll_clear() to clear LL control-w=
ord
      dmaengine: dw-edma: Factor out linked-list transfer start
      dmaengine: dw-edma: Dispatch DONE interrupts by channel request
      dmaengine: dw-edma: Centralize LL doorbell decisions
      dmaengine: dw-edma: Prepare LL progress event handling
      dmaengine: dw-edma: Prepare deferred IRQ reporting for LL events
      dmaengine: dw-edma: Prepare LL kicks for event serialization
      dmaengine: Allow drivers to assign static channel IDs
      dmaengine: dw-edma: Configure remote interrupt routing
      dmaengine: dw-edma: Account for the MSI vector offset

Linus Walleij (26):
      dmaengine: ste_dma40: Fix physical cyclic capability
      dmaengine: ste_dma40: Fix cyclic transfer residue
      dmaengine: ste_dma40: Recover coalesced cyclic callbacks
      dmaengine: ste_dma40: Fix failed start cleanup
      dmaengine: ste_dma40: Fix probe runtime PM disable
      dmaengine: ste_dma40: Check runtime PM in IRQ
      dmaengine: ste_dma40: Handle runtime PM resume errors
      dmaengine: ste_dma40: Return IRQ_NONE when no interrupt is pending
      dmaengine: ste_dma40: Init hardware before registration
      dmaengine: ste_dma40: Fix probe IRQ leak
      dmaengine: ste_dma40: Fix DMA registration unwind
      dmaengine: ste_dma40: Fix LCLA allocation order
      dmaengine: ste_dma40: Fix probe LCLA free
      dmaengine: ste_dma40: Put the LCPA SRAM node
      dmaengine: ste_dma40: Fix memcpy channel parsing
      dmaengine: ste_dma40: Validate disabled channel indexes
      dmaengine: ste_dma40: Validate DMA specifier length
      dmaengine: ste_dma40: Reject direction changes after allocation
      dmaengine: ste_dma40: Fix logical channel bounds check
      dmaengine: ste_dma40: Fix event group bounds
      dmaengine: ste_dma40: Fix V4B event group mapping
      dmaengine: ste_dma40: Validate fixed physical channel indexes
      dmaengine: ste_dma40: Validate memcpy configuration
      dt-bindings: dma: dma40: Restore disabled-channels
      dmaengine: ste_dma40: Search all blocks for fixed logical channels
      dmaengine: ste_dma40: Preserve the LCPA I/O address space

Logan Gunthorpe (10):
      dmaengine: switchtec-dma: fix double-free in switchtec_dma_free_desc()
      dmaengine: switchtec-dma: fix resource leak in alloc_chan_resources
      dmaengine: switchtec-dma: fix channel leak on registration failure
      dmaengine: switchtec-dma: make switchtec_dma_chans_release() void
      dmaengine: switchtec-dma: fix chan_status_irq cleanup on create() err=
or
      dmaengine: switchtec-dma: disable channels before freeing on registra=
tion failure
      dmaengine: switchtec-dma: fix use-after-free of swdma_dev in remove()
      dmaengine: ioat: disable relaxed ordering before registering the devi=
ce
      dmaengine: ioat: use sysfs_emit() in per-channel sysfs show()
      dmaengine: plx_dma: fix NULL pointer deref in plx_dma_isr()

Manuel Ebner (1):
      docs: dmaengine: Fix bracket

Myeonghun Pak (1):
      dmaengine: mediatek: hsdma: fix runtime PM leak on init failure

Pawel Zalewski (4):
      dmaengine: dw: use designated initializers for acpi_device_id
      dmaengine: loongson: use named initializers for acpi_device_id
      dmaengine: qcom: use named initializers for acpi_device_id
      dmaengine: xgene-dma: use named initializers for acpi_device_id

Rob Herring (Arm) (1):
      dt-bindings: dma: Convert hisilicon,k3-dma-1.0 to DT schema

Roman Vivchar (1):
      dt-bindings: dma: mediatek,uart-dma: add mt6572

Rosen Penev (20):
      dmaengine: txx9dmac: use devm_platform_ioremap_resource()
      dmaengine: fsl_raid: don't invoke client callback under desc_lock
      dmaengine: fsl_raid: avoid free_q underflow in free_chan_resources
      dmaengine: at_hdmac: fix sparse '__iomem' cast warning in memset help=
ers
      dmaengine: bestcomm: set bcom_eng to NULL on probe failure
      dmaengine: bestcomm: gen_bd: split struct bcom_psc_params from array =
definition
      dmaengine: fsl_raid: zero CF descriptor pool allocations
      dmaengine: at_hdmac: use devm_clk_get_enabled()
      dmaengine: bestcomm: ata: drop unused local variable 'inc'
      dmaengine: mv_xor: return descriptor to free pool on io_win failure
      dmaengine: mv_xor: kill tasklet on channel add error path
      dmaengine: fsl_raid: byte-swap cdb32 when programming CDBs
      dmaengine: fsldma: fix kernel-doc param names to match function signa=
tures
      dmaengine: fsldma: kill tasklet before removing channel
      dmaengine: fsldma: convert to platform_get_irq_optional()
      dmaengine: bestcomm: make gen_bd init helpers static
      dmaengine: bestcomm: gen_bd: fix out-of-bounds access in PSC paramete=
r lookup
      dmaengine: bestcomm: use devm_platform_get_and_ioremap_resource() to =
simplify code
      dmaengine: ppc4xx: change to %zu format specifiers for size_t argumen=
ts
      dmaengine: bestcomm: Enable compile testing

Runyu Xiao (1):
      dmaengine: altera-msgdma: initialize state before requesting IRQ

Ruoyu Wang (1):
      dmaengine: img-mdc: Fix runtime PM usage counter leak

Sasha Finkelstein (2):
      dt-bindings: dma: apple,admac: Add M3 generation ADMACs
      dmaengine: apple-admac: Add M3 generation ADMACs

Slavin Liu (1):
      dmaengine: fsl-edma: check channel acquisition before use

Srinivas Neeli (2):
      dmaengine: xilinx_dma: Fix MCDMA descriptor fields based on DMA direc=
tion
      dmaengine: xilinx_dma: Move descriptors to done list based on complet=
ion bit

Suraj Gupta (1):
      dmaengine: xilinx_dma: Extend metadata handling for AXI DMA and MCDMA

Tommaso Merciai (1):
      dmaengine: sh: rz-dmac: Fix off-by-one in residue lmdesc lookup

Vinod Koul (2):
      dmaengine: zynqmp_dma: drop redundant label
      docs: dmaengine: clarify ordering rules around cookie completion

Vishnu Santhosh (1):
      dmaengine: qcom: bam_dma: Defer IRQ trigger type to device tree

Vladimir Zapolskiy (3):
      dmaengine: pl08x: Create debugfs stats file under device folder
      dmaengine: pl330: Move device specific debugfs file to its directory
      dmaengine: imx-sdma: Remove unused imx_dma_is_ipu() inline function

Wolfram Sang (4):
      dmaengine: sh: rcar-dmac: fix style in struct initialization
      dmaengine: sh: rcar-dmac: SMMU doesn't need IPMMU workaround
      dt-bindings: renesas,rcar-dmac: Add support for R-Car X5H SoC
      dmaengine: sh: rcar-dmac: Add support for R-Car Gen5 SoCs

Xianwei Zhao (4):
      dt-bindings: dma: Add Amlogic A9 SoC DMA
      dmaengine: amlogic: Add general DMA driver for A9
      MAINTAINERS: Add an entry for Amlogic DMA driver
      dmaengine: amlogic: Fix regmap error check issue

Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register=
 handling
      dmaengine: sun6i-dma: Support variable address widths using masks
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt=
 mapping
      dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma=
 compatible string
      dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA contro=
ller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 .../devicetree/bindings/dma/amlogic,a9-dma.yaml    |  68 ++
 .../devicetree/bindings/dma/apple,admac.yaml       |  10 +-
 .../bindings/dma/hisilicon,k3-dma-1.0.yaml         |  87 +++
 Documentation/devicetree/bindings/dma/k3dma.txt    |  47 --
 .../devicetree/bindings/dma/mediatek,uart-dma.yaml |   1 +
 .../devicetree/bindings/dma/qcom,gpi.yaml          |   2 +
 .../devicetree/bindings/dma/renesas,rcar-dmac.yaml |   6 +
 .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml  |  22 +
 .../devicetree/bindings/dma/stericsson,dma40.yaml  |  14 +
 .../bindings/dma/ti,dra7-dma-crossbar.yaml         |  94 +++
 .../devicetree/bindings/dma/ti-dma-crossbar.txt    |  68 --
 .../devicetree/bindings/dma/ti/ti,cppi41.yaml      | 109 +++
 .../devicetree/bindings/usb/am33xx-usb.txt         |  14 -
 .../devicetree/bindings/usb/da8xx-usb.txt          |  12 -
 Documentation/driver-api/dmaengine/provider.rst    |  15 +-
 MAINTAINERS                                        |   9 +-
 drivers/dma/Kconfig                                |  10 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/altera-msgdma.c                        |  10 +-
 drivers/dma/amba-pl08x.c                           |   4 +-
 drivers/dma/amlogic-dma.c                          | 737 +++++++++++++++++=
++++
 drivers/dma/apple-admac.c                          |  24 +
 drivers/dma/arm-dma350.c                           |   2 +-
 drivers/dma/at_hdmac.c                             | 139 ++--
 drivers/dma/at_xdmac.c                             | 159 +++--
 drivers/dma/bestcomm/Kconfig                       |   2 +-
 drivers/dma/bestcomm/ata.c                         |   2 -
 drivers/dma/bestcomm/bestcomm.c                    |  46 +-
 drivers/dma/bestcomm/gen_bd.c                      |  23 +-
 drivers/dma/dma-jz4780.c                           |  10 +-
 drivers/dma/dmaengine.c                            |  47 +-
 drivers/dma/dmaengine.h                            |  32 +
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c     | 151 ++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h              |  57 +-
 drivers/dma/dw-edma/dw-edma-core.c                 | 512 +++++++++-----
 drivers/dma/dw-edma/dw-edma-core.h                 |  67 +-
 drivers/dma/dw-edma/dw-edma-pcie.c                 |  18 +
 drivers/dma/dw-edma/dw-edma-v0-core.c              |  59 +-
 drivers/dma/dw-edma/dw-hdma-v0-core.c              |  82 ++-
 drivers/dma/dw-edma/dw-hdma-v0-debugfs.c           |  17 +-
 drivers/dma/dw-edma/dw-hdma-v0-regs.h              |  10 -
 drivers/dma/dw/core.c                              |  47 +-
 drivers/dma/dw/dw.c                                |   1 +
 drivers/dma/dw/platform.c                          |  12 +-
 drivers/dma/ep93xx_dma.c                           |  37 +-
 drivers/dma/fsl-edma-common.c                      | 255 ++++++-
 drivers/dma/fsl-edma-common.h                      |  15 +-
 drivers/dma/fsl-edma-main.c                        |   7 +-
 drivers/dma/fsl-edma-trace.h                       |   5 +
 drivers/dma/fsl_raid.c                             |  38 +-
 drivers/dma/fsldma.c                               |  22 +-
 drivers/dma/idma64.c                               |  10 +-
 drivers/dma/img-mdc-dma.c                          |   2 +-
 drivers/dma/ioat/init.c                            |  18 +-
 drivers/dma/ioat/sysfs.c                           |  22 +-
 drivers/dma/loongson/loongson1-apb-dma.c           |  23 +-
 drivers/dma/loongson/loongson2-apb-cmc-dma.c       |  27 +-
 drivers/dma/loongson/loongson2-apb-dma.c           |   9 +-
 drivers/dma/mediatek/mtk-hsdma.c                   |  26 +-
 drivers/dma/mmp_pdma.c                             |   3 +-
 drivers/dma/moxart-dma.c                           |  23 +-
 drivers/dma/mv_xor.c                               |   8 +-
 drivers/dma/nbpfaxi.c                              |   2 +-
 drivers/dma/owl-dma.c                              |  21 +-
 drivers/dma/pch_dma.c                              |  41 +-
 drivers/dma/pl330.c                                |   4 +-
 drivers/dma/plx_dma.c                              |  10 +-
 drivers/dma/ppc4xx/adma.c                          |  12 +-
 drivers/dma/ppc4xx/xor.h                           |   2 +-
 drivers/dma/pxa_dma.c                              |  52 +-
 drivers/dma/qcom/bam_dma.c                         |  10 +-
 drivers/dma/qcom/gpi.c                             |   9 +-
 drivers/dma/qcom/hidma.c                           |   8 +-
 drivers/dma/sh/rcar-dmac.c                         |  26 +-
 drivers/dma/sh/rz-dmac.c                           |   6 +-
 drivers/dma/sprd-dma.c                             |  45 +-
 drivers/dma/st_fdma.c                              |   2 +-
 drivers/dma/ste_dma40.c                            | 607 +++++++++++++----
 drivers/dma/ste_dma40_ll.c                         |   8 +-
 drivers/dma/ste_dma40_ll.h                         |   4 +-
 drivers/dma/stm32/stm32-dma.c                      |  69 +-
 drivers/dma/stm32/stm32-dma3.c                     |  99 ++-
 drivers/dma/stm32/stm32-mdma.c                     |  96 ++-
 drivers/dma/sun4i-dma.c                            |  17 +-
 drivers/dma/sun6i-dma.c                            | 215 ++++--
 drivers/dma/switchtec_dma.c                        |  94 ++-
 drivers/dma/tegra186-gpc-dma.c                     |   4 +-
 drivers/dma/tegra20-apb-dma.c                      |   2 +-
 drivers/dma/ti/k3-udma.c                           |   6 +-
 drivers/dma/timb_dma.c                             |  63 +-
 drivers/dma/txx9dmac.c                             |  89 ++-
 drivers/dma/virt-dma.h                             |  16 +
 drivers/dma/xgene-dma.c                            |   4 +-
 drivers/dma/xilinx/xilinx_dma.c                    |  85 ++-
 drivers/dma/xilinx/zynqmp_dma.c                    |  74 ++-
 drivers/pci/controller/dwc/pcie-designware.c       |   1 +
 include/dt-bindings/dma/amlogic,a9-dma.h           |   8 +
 include/linux/dma/edma.h                           |  24 +-
 include/linux/dma/imx-dma.h                        |  11 +-
 include/linux/dmaengine.h                          | 402 ++++++++++-
 include/linux/fsl/bestcomm/gen_bd.h                |   8 -
 include/trace/events/tegra_apb_dma.h               |   6 +-
 103 files changed, 4067 insertions(+), 1606 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/amlogic,a9-dma.ya=
ml
 create mode 100644 Documentation/devicetree/bindings/dma/hisilicon,k3-dma-=
1.0.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/k3dma.txt
 create mode 100644 Documentation/devicetree/bindings/dma/ti,dra7-dma-cross=
bar.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/ti-dma-crossbar.t=
xt
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
 create mode 100644 drivers/dma/amlogic-dma.c
 create mode 100644 include/dt-bindings/dma/amlogic,a9-dma.h

--=20
~Vinod

--S8n8mTrlKbAIlwyJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmriEoQACgkQfBQHDyUj
g0dSAg/+N3ZbrQ+Cqu+2iMT56+cEtz5Q1vACi4GBvCWRrXH35CAuqNemYHjjK5TN
eFDoIPbDtzfdOZ8gHE82r79ua5lm5mJY4rLYLpNB9g3psiRH6/dQBt8OUe5JBwTI
DdLQu1VGGjStLL2O7kftSOxFx/OrwdYWlx+k0TpqCTdvkBWi6uQQjR0eD52TiCBX
WaflCJulIgtMCXaxeAYmbrgj12Cd3NF2QaGuahREpwh03kpOOTDIaV456+BUYCbt
tS2QIVtwxw42Iz/izWSWP9wBeR9TxY+5vqLpjUwu+Mbt2IAliHdeGh2RvCle/5vJ
W+9o+a8H/2MD5sXcVpZm2qmjOhgNMLPFl+D04nJmhfxl7um45vm8ZQ5MKLbK5pYQ
eSSy/6rFbcAfedz3hx7hCznftPtK8A1LTQT/XWDd7PFR2gPRgEhliJD7uZI/E7hI
oBT3m2aGb5xOHmBqcL8vT8UVD2ymW+P1+lUOhHBxYLqmmZN9g6aDirS0iQMfKzvc
/pOuA13oaRJUpBnfWDTEWgUm5zCN8SQ0oikuvXEX506rdtvdcM//NkH1VszCvm/4
qNpKAc+k7m7HByWd9fSFURCqqMCkrCjQDhvtakdvDLjiGWUm15KS8bImgI3ywjas
ZUeKxQqE822Ejg0V9J45nH3Km0QPKxtSXsUuJO9HOHHIsO2fmO4=
=5c5W
-----END PGP SIGNATURE-----

--S8n8mTrlKbAIlwyJ--
