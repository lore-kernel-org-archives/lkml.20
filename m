Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B414FD7B6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488436; cv=none; b=My4OrcoIMYvjxSHPutGx10m+Y24ielN6Kt22OkMYyByoBOtdoSAIAjKSTgQaDy4OInq+Fhj4yG6uEuXpCUmTkCk5xSAYdDaNCUSYeREknVzeh24ycsuOzdeR/YIsWCx7hvhp7zpCJLI+znfDsE7t7NYdlv198TIfgW2zRm2ZW9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488436; c=relaxed/simple;
	bh=KfcasrbZmaY4ku1laa0lgdgwnCqFs0D10dVAeaUD1O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=niR/HewYco4nv6SeTQbYJGM8scJc2TkBk/Z3399ZhpjBFXBxSVSublCqj6n8fI5RaU8GRDkwraJWoRXttdRb4YEUl6kBvtAM6vi5UPr3nqMsJkPDPbVGzlaRQbmr0r8EeKgCxAYE9nFqNDAGkS0c1n3tT5FB3Ef0YNED7FvmkBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gM1ktyi7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gM1ktyi7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so29083015e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488431; x=1792093231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7r58eWhnxb36f5IWqMmeMUupG9AcY1T9urpC6Vs/Zs=;
        b=gM1ktyi7iTbJOn4CzSirrijvEQS7ydOIH1r1936m2+fTLL2hCSInKvMdzBJOlSyQNZ
         0eN00qOuVK9ExNOMSYpz0w/XNwoFFtTPKb0nD7THtVMeyhKmj1TwKLU5jjq4xbprTphq
         sfAA0CkZpWelfIx3LOHtTTPZ2MdnKT3MYPdS/PbNCQfyKLNLIfnxQcWZJEEyYlKV53cH
         J/+NsMSMoYmZFL/0sPdM9dMLJeTDNQK0MmVnLhld9oZsRTEh05W2ZzcRdFGCB7TQagNm
         6oLIcNPmlWeX2biT5AbRSV/ZtHPNkaHbnGMXf+QhGQZ/hieJ5CQnUux51HROVQOSxG+J
         Aq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488431; x=1792093231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K7r58eWhnxb36f5IWqMmeMUupG9AcY1T9urpC6Vs/Zs=;
        b=JhErmTPHiRjMZDBIZNMQYo4tKh7ZK0Cnf4soMyGhLWQx+LfCA0OWofDDtWUcTrzCDf
         w9CAh08F7lNwyIDpdmJ14ytTJHcDuzCDfcv32WOqShhCh0Jjkv6gpjc5bCvsKDD1b4cc
         qTiIYm41migPVvmA+Y1n4Jkj1MrcJ2Qg1S75rW5ZF0P0WkpB9K3Ir1bUYGwY2avk3yNg
         v+U8ck491XMYxZtBqAf4AVo3wXI9hm3INC49b7HEYQp/Vj7BUQl6a4otgoJyGz6rQ8Dd
         c2OUu/6PQroekclZrVJkT5KGHyKKvuYDbrf5TS7jW8jEXJ5CQbHRh/6kM3If8v6kSxes
         Siww==
X-Forwarded-Encrypted: i=1; AKwUvBy5LHz6QPFCscdL1w7jcs74Cv4G/yU09ebB8QQunao2XgSdDzAt5hEQ5BYcowaQRdR+1PLNkaOm21wjABU=@vger.kernel.org
X-Gm-Message-State: AFuF++n1OgdMhHZV27Jpr+FPAAdNqcOPy230N7vqAZsWdTiaYNCXYLeu
	HSrXnVrYehUWffxyvmApDQv+s86KTxC4IhLcXy35dgpPo+VXMyVxHvue
X-Gm-Gg: AYBFou0qXftgDBDetVI2ZybJlwGXbWbQp3h5e+yEkjRUKvSu2ut0uFeJR8/HJJ7sisI
	XQittMjR9Glqtb/DhxQ9lXqkGaXhBIBSgdVzjJlg4avzbkWd5ZH688egJ+rpH2hqkvSFkud0+al
	RV/GvMqKuDQvVzTPvZrtczVAIc3JzCVEoYMEwArnOcVEMWid+RGdOnlyLsa4kwwpi/lTc/sWjru
	US162OyOyTdSsRhe6W6kdZbF3oD+W76iKu5Obt8+ff1iRyi6R1yDzVNJOXYOP0T1p/tLty4LPef
	FUKn7z+BozB/Jd3zu/u4w7YMHREJPC8skz6Hte7PYjTwOigCuczq1v8gswrcvVpekyCIk+jlNOe
	XoGotgT0USJKgHbMBuryJ9v/U3tjP1QkrO46hUNAxReQrgTMCuT4WNNl2l1F9CIp/H4IHI5jtO/
	m8gT3iQiji5VONNm5VcM9/L9NwT95RTDz9YTWIaevgv45hEnZHeKekcw70nmKk0S6nZ6wxk8BR2
	K0XRzXbsIcjQCq2S22Bvb4E6oAQC2YKogd/UhKTejukBhGX1K0E5relhilTteudc+zZ7wzgkd5B
	vDLcpyC6ewgML/OVWX16bg==
X-Received: by 2002:a05:600c:6095:b0:4a0:2835:6fd3 with SMTP id 5b1f17b1804b1-4a18041c519mr119113515e9.17.1791488430810;
        Thu, 08 Oct 2026 12:40:30 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:30 -0700 (PDT)
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
Subject: [PATCH v5 08/13] ARM: dts: imx6ul: Add Variscite storage and wireless options
Date: Thu,  8 Oct 2026 21:37:48 +0200
Message-ID: <cfcd21519e92c74761875912dab36762ae304e2f.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Extract usdhc2 and its pinctrl groups from the VAR-SOM-6UL common
file into imx6ul-imx6ull-var-emmc.dtsi. Update all four existing
Concerto boards to include it in the same patch, so NAND variants
can use the module common file without enabling eMMC.

Add shared NAND and IW61x descriptions for VAR-SOM-6UL and DART-6UL,
and describe the fixed 3.3 V supply in the existing SD card option.

Rename imx6ul-var-som-wifi.dtsi to imx6ul-var-som-wifi-brcm.dtsi
and update both existing users to distinguish Broadcom from IW61x.
Add keep-power-in-suspend to advertise the Broadcom SDIO host's
ability to retain power during suspend.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Extract the existing eMMC controller and all three pinctrl states
   from the module common file, updating the four Concerto users in
   this patch.
 - Reuse imx6ul-var-som-sd.dtsi and add its fixed 3.3 V supply here.
 - Rename the existing Broadcom file to imx6ul-var-som-wifi-brcm.dtsi
   instead of introducing a replacement. Retain its regulator GPIO,
   MMC power sequence, Bluetooth node, non-removable and no-1-8-v.
 - Update the existing Broadcom users alongside the rename and add
   keep-power-in-suspend.

v2->v3:
 - Share identical eMMC, NAND, Broadcom Wi-Fi and IW61x DTSI files
   between the two modules.
 - Drop address and size cells from the IW61x SDIO host, which has no
   child node.

 .../dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi  | 64 +++++++++++++++++++
 .../dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi  | 63 ++++++++++++++++++
 .../imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi    | 43 +++++++++++++
 .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 58 -----------------
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |  3 +-
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |  1 +
 .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   | 10 +++
 ...ifi.dtsi => imx6ul-var-som-wifi-brcm.dtsi} |  1 +
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |  3 +-
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  1 +
 10 files changed, 187 insertions(+), 60 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
 rename arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-wifi.dtsi => imx6ul-var-som-wifi-brcm.dtsi} (98%)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
new file mode 100644
index 000000000000..8e2133fa8330
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
+	bus-width = <8>;
+	no-1-8-v;
+	non-removable;
+	keep-power-in-suspend;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x17059
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x17059
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x17059
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x17059
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x17059
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x17059
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x17059
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x17059
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x17059
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100b9
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170b9
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170b9
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170b9
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170b9
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170b9
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170b9
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170b9
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170b9
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170b9
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100f9
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170f9
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170f9
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170f9
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170f9
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170f9
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170f9
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170f9
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170f9
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170f9
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
new file mode 100644
index 000000000000..1522b5d7e092
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand_1>;
+	status = "okay";
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "spl";
+			reg = <0x00000000 0x00200000>;
+		};
+
+		partition@200000 {
+			label = "uboot";
+			reg = <0x00200000 0x00200000>;
+		};
+
+		partition@400000 {
+			label = "uboot-env";
+			reg = <0x00400000 0x00100000>;
+		};
+
+		partition@500000 {
+			label = "kernel";
+			reg = <0x00500000 0x00c00000>;
+		};
+
+		partition@1100000 {
+			label = "rootfs";
+			reg = <0x01100000 0x3ef00000>;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_gpmi_nand_1: gpmi-nand-1-grp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0xb0b1
+			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0xb0b1
+			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0xb0b1
+			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0xb000
+			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0xb0b1
+			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0xb0b1
+			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0xb0b1
+			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0xb0b1
+			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0xb0b1
+			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0xb0b1
+			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0xb0b1
+			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0xb0b1
+			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0xb0b1
+			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0xb0b1
+			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0xb0b1
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
new file mode 100644
index 000000000000..d2f116bc8d70
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	reg_sd1_vmmc: regulator-sd1-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	iw61x_pwrseq: mmc-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio5 2 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&tsc {
+	status = "disabled";
+};
+
+&uart2 {
+	bluetooth_iw61x: bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
+	keep-power-in-suspend;
+	non-removable;
+	vmmc-supply = <&reg_sd1_vmmc>;
+	mmc-pwrseq = <&iw61x_pwrseq>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
index 9aab7c402f2c..0a1a23bca0c7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
@@ -140,51 +140,6 @@ MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
 			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
 		>;
 	};
-
-	pinctrl_usdhc2: usdhc2grp {
-		fsl,pins = <
-			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
-			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x17059
-			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x17059
-			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x17059
-			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x17059
-			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x17059
-			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x17059
-			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x17059
-			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x17059
-			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x17059
-		>;
-	};
-
-	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-		fsl,pins = <
-			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100b9
-			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170b9
-			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170b9
-			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170b9
-			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170b9
-			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170b9
-			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170b9
-			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170b9
-			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170b9
-			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170b9
-		>;
-	};
-
-	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-		fsl,pins = <
-			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100f9
-			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170f9
-			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170f9
-			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170f9
-			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170f9
-			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170f9
-			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170f9
-			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170f9
-			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170f9
-			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170f9
-		>;
-	};
 };
 
 &pxp {
@@ -210,16 +165,3 @@ &uart2 {
 	uart-has-rtscts;
 	status = "okay";
 };
-
-&usdhc2 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz";
-	pinctrl-0 = <&pinctrl_usdhc2>;
-	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
-	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
-	bus-width = <8>;
-	no-1-8-v;
-	non-removable;
-	keep-power-in-suspend;
-	wakeup-source;
-	status = "okay";
-};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
index 66c9deaea083..bd39138b67dd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
@@ -9,8 +9,9 @@
 /dts-v1/;
 
 #include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
 #include "imx6ul-var-som-concerto-common.dtsi"
-#include "imx6ul-var-som-wifi.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
 #include "imx6ul-imx6ull-var-wm8904.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
index 4905abf5aa08..82920ebd812b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
@@ -10,6 +10,7 @@
 /dts-v1/;
 
 #include "imx6ul-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
 #include "imx6ul-var-som-concerto-common.dtsi"
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
index 0e6d9b945eb4..bef0a60abfa9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
@@ -4,8 +4,18 @@
  *
  * Copyright 2019-2024 Variscite Ltd.
  * Copyright 2026 Dimonoff
+ * Copyright (C) 2026 Variscite Ltd.
  */
 
+/ {
+	reg_sd1_vmmc: regulator-sd1-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
 &iomuxc {
 	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
 		fsl,pins = <
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi-brcm.dtsi
similarity index 98%
rename from arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
rename to arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi-brcm.dtsi
index 6d16ff7909da..36db8b87e806 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi-brcm.dtsi
@@ -64,6 +64,7 @@ &usdhc1 {
 	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>;
 	no-1-8-v;
 	non-removable;
+	keep-power-in-suspend;
 	mmc-pwrseq = <&usdhc1_pwrseq>;
 	vmmc-supply = <&reg_sd1_vmmc>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
index 880b72833091..2a3c75ce8dfa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
@@ -9,8 +9,9 @@
 /dts-v1/;
 
 #include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
 #include "imx6ul-var-som-concerto-common.dtsi"
-#include "imx6ul-var-som-wifi.dtsi"
+#include "imx6ul-var-som-wifi-brcm.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
 #include "imx6ul-imx6ull-var-wm8904.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
index c481839a98a5..3a527e7de682 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
@@ -9,6 +9,7 @@
 /dts-v1/;
 
 #include "imx6ull-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
 #include "imx6ul-var-som-concerto-common.dtsi"
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
-- 
2.47.3

