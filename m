Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1783CEB9A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488419; cv=none; b=o3vGTVe+GOMO/ugS2SiTi96oCvINEAjeZojtB4IRukmw5qHUEqc0JCoGE3kP9h6NFQ6PMIGRL8imW19nIPKupmZlreQQ43z2JGFjzoJ/t/jWnsyHKKIsS3ka1gWnYgvWSklnsahc0zgHwBWHtlTxKpbaNnDMv/jlBh4CULidjRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488419; c=relaxed/simple;
	bh=0HFFrqRbwfK7HkUxzr89XIm72WWQMqt3zCOjR1SIXvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CaqlIlDOBioLoAeTtrEhrMaYWWdQ359AN4lB4Ng5fbKsrgfepM1aNBJ45v3N7HqmaJgy+dfd57wzM3CHhX93gBu8IrN5pOkB3cVFFrn4sNNYvrNRC3VJQUuPCE62jLtnqIx7hilSzQ+rDSxN22kwwWmTgJqCaUdlx02RnVhL3pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=At197tKh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="At197tKh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so47684115e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488415; x=1792093215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fU3eKDw5HrigqKS3lfMy85hLViyXx2yevkh3+N1gsQY=;
        b=At197tKhNtJKJu8nHHImtdIhm76+Po9V8tBojMBADewwQIjnnLPHCFbq/jRa8EsDsE
         1kuO1jUAmg1kme/Z02/Kr2zi/R6IYbv1Bft/6166KRQ2t/k5uq6O5SCt+LRCLabgC10D
         aX+hBGcqeZRbwtU96xw662Mgsn0IwhKJIetjpyo+pMhlPesWcIIv/0ROi1WRdLEX4AJY
         iLXJdr+dkxJPqRaBhRUPhrjCGQgUAiQNWjdulZh512ZFJTXrNugNipdrAS3iJo0ecbSx
         jBjxE44YFYSHQD9az8fzIDHtagAUOkZbCiK0h45xxDPnusASApoK5ypnvKMEE4pytARz
         XnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488415; x=1792093215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fU3eKDw5HrigqKS3lfMy85hLViyXx2yevkh3+N1gsQY=;
        b=JzngbHL1MzfspVbNLtUbZ1VJuqI/eAeJBwN0CFyJheh/blk8PACOiZNgJVJPFJOPSg
         KqCv9iwfRMLG6YcZ2ir5gv+sKKo6zNIhQOTYGZJO5GOZsvXQFSssGFrnOHP2jXv3OFqt
         wsTJws6stGrNjp5u64zcYT6jI3qAwIdEVVzTWFNdd8ZbaBBv2eQ08Mzp0tb9GWTNfURR
         Dcsn5Wb1zJeNoxOLm5guWnCXaEdlhWggEowPhqJ5h0msShjXLmwJNVvuj9mCxvW5qHcZ
         /5yGM1j9uEAPLYzbFnDqNhDLiBdVZac7pH3oA2awQUzDgAXSFqJbvabpXUrJ/rqPLy5D
         PpuQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5qWSiIra44u/oOxDXVyDgUmsPyoqYDTbLlGIiPJTd0BzjKrG/eOvQmqDMmL1SSFTbn+YtXbA/qbEIJsc=@vger.kernel.org
X-Gm-Message-State: AFuF++kOZj8swrvuK4A2NOSXmjaJUlo2PeU8xOJ7bmSzMJMGiG/rL5GJ
	3l5QzCxEgJKYKxSPKD86O5KSIdf3oBLrm2XvkndjN5Ve/AMn8KHvMAxv
X-Gm-Gg: AYBFou1IXIph56kSDhhdr9Hc1KcjwwMJAL1LOi2JGr3EAL2iZlGBlPafCEeLXN3Ycse
	C2cJHd65Ik3sedn+X/srTYIVuT5x/md78M0LN6ArygIpeUiiF+XdCK05GJpPcknYLsl8A9wMgHT
	dH1ragio6MLEdRbdiVhAkeiX4CC5L2g8sIWjhACKgcYUGJ7XeFUohFsc+QsJXdw1F/WusooTfot
	W8LbpQNO2JPzEXzE8GW6i21XHff8ldXVh1PgROy71aobUAtRpSMZn0t9UkOPRQoBYp+8R3dQRoh
	Ut42RK5ODyCE9RXVb9imYCqDlZ22JOdVcBbL7Z2tJrcDrYahEQEpxPSh6q1PEITyFb7GoxwX0pW
	g8dGq1NmhVT7ypKmdDd2mrJ5CEma9lu3bGgB8gqlLCXywKzmafd1BvmfTUwNjmqMlo7UoK67r5Y
	KYXdr/wafSKTqEkf0IuoxwDCnBVQ3uw44C14iLBkvVw9CTWLfEf0ytUwj+q3ht4TaapGqfmrY6C
	vspNnhfYOq02jAkgkqYeSN38mVzw4y449yX3CyyAY/iE1DJ/L51lQyWJVOQs6d8YFZM+1zKKjvk
	p/BZk2QQ+9ZkUZ6EsZklPw==
X-Received: by 2002:a05:600c:8b8b:b0:4a0:1c10:12ee with SMTP id 5b1f17b1804b1-4a1800d41c1mr107383655e9.3.1791488414203;
        Thu, 08 Oct 2026 12:40:14 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:13 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 00/13] ARM: dts: imx6ul: Extend VAR-SOM-6UL and add DART-6UL support
Date: Thu,  8 Oct 2026 21:37:40 +0200
Message-ID: <cover.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VAR-SOM-6UL already has mainline support on the Concerto-Board with
i.MX6UL and i.MX6ULL. This series extends that support with additional
module configurations, the Symphony-Board carrier and i.MX6ULZ variants.
It also adds support for DART-6UL on VAR-6ULCustomBoard with i.MX6UL,
i.MX6ULL and i.MX6ULZ.

The 90 new DTBs describe reference configurations with alternative
storage, wireless and audio assemblies. These choices change the devices
connected to the same SoM interfaces and require different controller,
pin or device-node descriptions: eMMC versus NAND, SD card versus SDIO
wireless, and the available wireless modules and audio codecs. They do
not enumerate every possible combination of fitted and unfitted optional
peripherals. The four existing Concerto DTBs remain available with their
original names and compatible strings.

Reuse and extend the existing modular VAR-SOM-6UL DTSI files, including
the separate Ethernet, SD card, SAI2, Broadcom and LVDS descriptions.
Retain kernel-managed Broadcom power/reset sequencing and Bluetooth,
and preserve the existing LVDS graph and panel timings. A small DART
wrapper selects its PWM1 backlight connection. The display files are
not included by i.MX6ULZ boards, which lack a display controller.

The existing Concerto boards gain a 3.3 V ADC reference, I2C GPIO bus
recovery, an external touchscreen description and an explicit WM8904
codec and sound card. SoC-specific wrappers place the SNVS pins under
the appropriate IOMUX controller.
Extract the eMMC description without changing its pinctrl states, and
update its consumers in the same patch. The shared Ethernet files use
the PHY reset timing validated by Variscite: 10 ms asserted and a
100 ms wait after deassertion, for existing and new Concerto variants.

The Micrel binding change in patch 5 is needed by the Ethernet PHY
descriptions in this series. The existing boolean definition of
micrel,rmii-reference-clock-select-25-mhz conflicts with the dt-schema
unit check for properties ending in -mhz. The binding now accepts <1>
for 25 MHz selection and limits the property to the applicable PHYs.
Patch 4 changes the Micrel driver to test for property presence without
warning about the numeric value. This preserves its runtime behavior.

Patches 1-3 document the board compatibles for each SoC. Patches 4-5
update the Micrel driver and binding. Patches 6-9 extend the module,
audio, storage/wireless and carrier descriptions, updating existing
Concerto users alongside the corresponding changes. Patch 10 shares
the PHY reference clock and updates the PHY properties. Patches 11-13
add the new board DTS files together with their Makefile targets.

v4->v5:
 - Rebase onto 31f9ec9f3873.
 - Clarify that VAR-SOM-6UL support is extended, while DART-6UL support
   is new, and explain the scope of the 90 additional DTBs.
 - Reuse the existing modular VAR-SOM-6UL files instead of replacing
   them. Update existing consumers in the same patches as the changes
   to their shared descriptions, rather than in a later conversion patch.
 - Retain the kernel-managed Broadcom regulator, MMC power sequence
   and Bluetooth node. Rename the Wi-Fi file to identify Broadcom and
   add keep-power-in-suspend.
 - Preserve the original LVDS graph and panel timings. Move the panel
   node into its existing option file, add the DART PWM1 wrapper and
   omit display files on i.MX6ULZ.
 - Reuse the original SAI2 file for both codec options. Extract eMMC
   with its default, 100 MHz and 200 MHz pinctrl states intact, and
   reuse the existing SD card option.
 - Correct IW61x pinctrl to match GPIO5_IO02 and GPIO5_IO06, and use
   SoC-specific SNVS pinctrl locations for the existing Concerto boards.
 - Keep Ethernet options separate. Share the PHY reference clock for
   Symphony and apply the validated reset timing to all Concerto variants.
 - Order the new i.MX6ULZ fallback compatibles as fsl,imx6ulz followed
   by fsl,imx6ull; leave the existing EVK and BSH entries unchanged.
 - Collect Reviewed-by tags for the i.MX6UL and i.MX6ULL board bindings
   and an Acked-by tag for the Micrel binding.

v3->v4:
 - Split the board binding by SoC, keep the existing Concerto compatibles
   while adding new variants, and use the binding's items/enum style.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles; keep the SoM options before the carrier name.
 - Add each SoC's sorted DTB Makefile targets alongside its board DTS
   files, replacing the separate Makefile patch.

v2->v3:
 - Add a Micrel driver fix before the binding change so the numeric
   RMII clock select property does not cause a warning at PHY probe.
 - Specify the 3.3 V ADC reference supply voltage on both modules.
 - Share identical storage and wireless option DTSI files between the
   VAR-SOM-6UL and DART-6UL, and drop unused address and size cells from
   the IW61x SDIO host.
 - Move the Symphony Type-C interrupt pinctrl to the SoC-appropriate
   IOMUX controller, specify falling-edge interrupts for the Type-C
   controller and touchscreens, and disable the actual backlight node
   on the i.MX6ULZ Concerto-Board.
 - Update board includes for the shared option files and sort the
   Variscite DTB targets in the Makefile.

v1->v2:
 - Share the WM8904 codec description between VAR-SOM-6UL and DART-6UL,
   keeping the DART-specific microphone routing in a small wrapper.
 - Consolidate the identical WM8731 descriptions into one shared DTSI
   and update the board includes.

Stefano Radaelli (13):
  dt-bindings: arm: fsl: Add Variscite i.MX6UL board variants
  dt-bindings: arm: fsl: Add Variscite i.MX6ULL board variants
  dt-bindings: arm: fsl: Add Variscite i.MX6ULZ board variants
  net: phy: micrel: Check RMII clock select property presence
  dt-bindings: net: micrel: Fix RMII clock select property type
  ARM: dts: imx6ul: Extend VAR-SOM-6UL and add DART-6UL files
  ARM: dts: imx6ul: Add Variscite WM8904 and WM8731 support
  ARM: dts: imx6ul: Add Variscite storage and wireless options
  ARM: dts: imx6ul: Extend Variscite carrier board descriptions
  ARM: dts: imx6ul: Share Variscite PHY clock and update PHY options
  ARM: dts: imx6ul: Add Variscite i.MX6UL board variants
  ARM: dts: imx6ull: Add Variscite i.MX6ULL board variants
  ARM: dts: imx6ulz: Add Variscite i.MX6ULZ board variants

 .../devicetree/bindings/arm/fsl.yaml          | 122 +++++++-
 .../devicetree/bindings/net/micrel.yaml       |  27 +-
 arch/arm/boot/dts/nxp/imx/Makefile            |  92 +++++-
 ...x6ull-var-dart-6ulcustomboard-sd-card.dtsi |  31 ++
 ...mx6ul-imx6ull-var-dart-6ulcustomboard.dtsi | 240 +++++++++++++++
 .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   |  17 ++
 .../dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi  | 207 +++++++++++++
 .../dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi  |  64 ++++
 .../dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi  |  63 ++++
 ...imx6ul-imx6ull-var-som-symphony-board.dtsi | 275 ++++++++++++++++++
 .../imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi    |  43 +++
 .../nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi    |  50 ++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi    |  68 +++++
 .../imx/imx6ul-var-dart-6ulcustomboard.dtsi   |  18 ++
 ...l-var-dart-emmc-sd-card-6ulcustomboard.dts |  21 ++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts |  21 ++
 .../nxp/imx/imx6ul-var-dart-lvds-panel.dtsi   |  30 ++
 ...l-var-dart-nand-sd-card-6ulcustomboard.dts |  21 ++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts |  21 ++
 .../arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi |  44 +++
 .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 103 +++----
 .../imx/imx6ul-var-som-concerto-board.dtsi    |  38 +++
 .../imx/imx6ul-var-som-concerto-common.dtsi   |  67 ++---
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |   7 +-
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |   7 +-
 ...ul-var-som-emmc-sd-card-concerto-board.dts |  22 ++
 ...ul-var-som-emmc-sd-card-symphony-board.dts |  20 ++
 ...som-emmc-sd-card-wm8731-concerto-board.dts |  22 ++
 ...som-emmc-sd-card-wm8731-symphony-board.dts |  20 ++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts |  22 ++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts |  20 ++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts |  22 ++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts |  20 ++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts |  22 ++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts |  20 ++
 .../dts/nxp/imx/imx6ul-var-som-enet1.dtsi     |   6 +-
 .../dts/nxp/imx/imx6ul-var-som-enet2.dtsi     |  26 +-
 .../nxp/imx/imx6ul-var-som-lvds-panel.dtsi    |  24 ++
 ...ul-var-som-nand-sd-card-concerto-board.dts |  22 ++
 ...ul-var-som-nand-sd-card-symphony-board.dts |  20 ++
 ...som-nand-sd-card-wm8731-concerto-board.dts |  22 ++
 ...som-nand-sd-card-wm8731-symphony-board.dts |  20 ++
 ...-var-som-nand-wifi-brcm-concerto-board.dts |  22 ++
 ...-var-som-nand-wifi-brcm-symphony-board.dts |  20 ++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts |  22 ++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts |  20 ++
 ...var-som-nand-wifi-iw61x-concerto-board.dts |  22 ++
 ...var-som-nand-wifi-iw61x-symphony-board.dts |  20 ++
 .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   |  10 +
 .../imx/imx6ul-var-som-symphony-board.dtsi    |  96 ++++++
 ...ifi.dtsi => imx6ul-var-som-wifi-brcm.dtsi} |   1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi |  13 +
 .../imx/imx6ull-var-dart-6ulcustomboard.dtsi  |  18 ++
 ...l-var-dart-emmc-sd-card-6ulcustomboard.dts |  21 ++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts |  21 ++
 ...l-var-dart-nand-sd-card-6ulcustomboard.dts |  21 ++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts |  21 ++
 .../boot/dts/nxp/imx/imx6ull-var-dart.dtsi    |  44 +++
 .../imx/imx6ull-var-som-concerto-board.dtsi   |  38 +++
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |   7 +-
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |   7 +-
 ...ll-var-som-emmc-sd-card-concerto-board.dts |  22 ++
 ...ll-var-som-emmc-sd-card-symphony-board.dts |  20 ++
 ...som-emmc-sd-card-wm8731-concerto-board.dts |  22 ++
 ...som-emmc-sd-card-wm8731-symphony-board.dts |  20 ++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts |  22 ++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts |  20 ++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts |  22 ++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts |  20 ++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts |  22 ++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts |  20 ++
 ...ll-var-som-nand-sd-card-concerto-board.dts |  22 ++
 ...ll-var-som-nand-sd-card-symphony-board.dts |  20 ++
 ...som-nand-sd-card-wm8731-concerto-board.dts |  22 ++
 ...som-nand-sd-card-wm8731-symphony-board.dts |  20 ++
 ...-var-som-nand-wifi-brcm-concerto-board.dts |  22 ++
 ...-var-som-nand-wifi-brcm-symphony-board.dts |  20 ++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts |  22 ++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts |  20 ++
 ...var-som-nand-wifi-iw61x-concerto-board.dts |  22 ++
 ...var-som-nand-wifi-iw61x-symphony-board.dts |  20 ++
 .../imx/imx6ull-var-som-symphony-board.dtsi   |  96 ++++++
 .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi |  15 +-
 .../imx/imx6ulz-var-dart-6ulcustomboard.dtsi  |  18 ++
 ...z-var-dart-emmc-sd-card-6ulcustomboard.dts |  21 ++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts |  21 ++
 ...z-var-dart-nand-sd-card-6ulcustomboard.dts |  21 ++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts |  21 ++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts |  21 ++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts |  21 ++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts |  21 ++
 .../boot/dts/nxp/imx/imx6ulz-var-dart.dtsi    |  51 ++++
 .../imx/imx6ulz-var-som-concerto-board.dtsi   |  38 +++
 ...lz-var-som-emmc-sd-card-concerto-board.dts |  21 ++
 ...lz-var-som-emmc-sd-card-symphony-board.dts |  21 ++
 ...som-emmc-sd-card-wm8731-concerto-board.dts |  21 ++
 ...som-emmc-sd-card-wm8731-symphony-board.dts |  21 ++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts |  21 ++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts |  21 ++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts |  21 ++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts |  21 ++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts |  21 ++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts |  21 ++
 ...lz-var-som-nand-sd-card-concerto-board.dts |  21 ++
 ...lz-var-som-nand-sd-card-symphony-board.dts |  21 ++
 ...som-nand-sd-card-wm8731-concerto-board.dts |  21 ++
 ...som-nand-sd-card-wm8731-symphony-board.dts |  21 ++
 ...-var-som-nand-wifi-brcm-concerto-board.dts |  21 ++
 ...-var-som-nand-wifi-brcm-symphony-board.dts |  21 ++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts |  21 ++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts |  21 ++
 ...var-som-nand-wifi-iw61x-concerto-board.dts |  21 ++
 ...var-som-nand-wifi-iw61x-symphony-board.dts |  21 ++
 .../imx/imx6ulz-var-som-symphony-board.dtsi   |  30 ++
 .../arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi |  51 ++++
 drivers/net/phy/micrel.c                      |   2 +-
 131 files changed, 3952 insertions(+), 142 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-6ulcustomboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-symphony-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-6ulcustomboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-lvds-panel.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-nand-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-symphony-board.dtsi
 rename arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-wifi.dtsi => imx6ul-var-som-wifi-brcm.dtsi} (98%)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-6ulcustomboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-nand-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-symphony-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-6ulcustomboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-concerto-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-symphony-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som.dtsi


base-commit: 31f9ec9f38735f42e1f0ba57347c420e56b99824
-- 
2.47.3

