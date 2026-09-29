Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B0254281F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695096; cv=none; b=r50M0/SEJN4r4gFE2cCBrOpWlPrwYk2R4+d8XfxWCW8HUKJpymMk8D6EUxbeFn2qmdUwoZvE0fjq0rztc9BWl12HjDcqaL2AYPH+KiiRC7YJeMrwIAC1EY4fgp080Z3UmDi8tkxRyj641qw++VpldGu/lc43cuDIpKi+fVi7Evg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695096; c=relaxed/simple;
	bh=aO0jfTeBBUtrn88kIm9oVPFxK0MaKaOchSL/DtYqXIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gE2cCyF0P+oHWRN4i3Rr5nP7u07VJ46lzf5BaluzcUkWHKITAEpAbAJyvk0y4YP8DaLd3zqel3F4U3HtzJfHaq2BiVC332/wff8FW7Zgr/r+ihbfr43XpCGF83Q0CUgkOmnH/4B66JmEWyL8witFxToz/CzHxpObCBSEyz+TQQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq77yAUN; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq77yAUN"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so32370375e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695078; x=1791299878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2qVhNq/ulYcGTI2MPiVjpYeX+WOZy3cqFCk18HRP7A=;
        b=Vq77yAUNM/pyCFDiHdJAfc3a9NORubipzmUFGjxNrwx4O2qWoFBkSnONMBUiU+8+OA
         N4d4IakaBGu9SmTQaT5g+fB3XRdEHbiEDDiHsZKQl0XaNm9uvYUwwYxt1uaPE9tXxDez
         RlU8Kz7v3AVhB1NXhGfuDxm6+sELfaipmYdTsXHkWqZ8HvDJ4crwdXczIPfzi+zemxKv
         3p8uE8xJJYFv6VecwKopDcPKAWW0uUdobMZd7gyQjVwxkbrhVNpcZSUuexRaH3yDvoAt
         2R2O7Po+h3x6Vp51G25zf75E+yyMJmI7wvNhBQ7ZL3pZyByMBabCrhdYNwBRL8RVj6dr
         NeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695078; x=1791299878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2qVhNq/ulYcGTI2MPiVjpYeX+WOZy3cqFCk18HRP7A=;
        b=OMsuLEsmxuPrVBM2/bZ31jzawzKpomVQMkbnUR/x0vDqpnG3ZQj7ryJ2BdDGGWu42S
         cMst4EGfh85XXEYrU8KW/9nDTGD4PpRmnr3n17lPwAlu6OfrdotDVZjLW+VcvrhC4JUU
         vR0pxYb0BqCLh+W95ST5E3jb+c/GM2q+BZHXueiYR1TS3Mv0D+gXcUMrZgs/3kh7GUxL
         dveXC1Av9paZOuqdtqniGc7iMpG2W/0g0XgXFZUx3g+a6a0bWOCH9VPRJOSRWP4d6ACt
         ga2UUp/3M12FK/eT/CABwI0iwPvdJ46lM3Je02QuBRFrKWXReZBNpeUkVLhjQGlcu7mb
         TNQw==
X-Forwarded-Encrypted: i=1; AKwUvBwbND8e3u150CWyXXdyWT5iMxpciCq8P6HtGSP1st1zaT8IjkmKa6Z0cz9y4xlnD8MW0g0ffSPaOBSzuJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++l88AzqhQy5M42NolX+wKZ0nrr69OcjhJtNVatJ4tN1G6L6mfW0
	MYPSBE5kmyk6kXCmA8RoyiOlI7QqfckBT5qOI8XLOaHtTIkWyPE4JcBW
X-Gm-Gg: AYBFou1P7tvWNP7Gk1OItS0QwPtwRT4kEebbKCN0kwCJ45OlQ5caj6+MYgDfjuknor3
	VK1pun+Jis7bvvwQhTNx/VckcGf+EZGsKrSPjv3ctUz6rujg/cCNoAA7+l9y3cG7GmRQ8nHk157
	fwjTHgo2Qux3OhIYcJLAcoQp9DJCGikRon9u2gQoi+qCKH9duvxfVynFooejXKahv4Z1kaz3omM
	p1UEiJ5kw5PUgPgWm+bT5cYaoJBUDciQQSee0AzApBDC1jURkkCzkz7IvzsyZP5mI/OEE+xKlz4
	iDONL/0hoZQVE1JelzWFSjrtLkQaXFd8zvdy2VXR+yhTpHxIJ4LhXkZRvDXsG7BPyjEqn60zRfG
	+Li8lBl1bNEO6/9BCJBxlpqluOg7++sbtscbOxBbjVX79vwZsE/mKmRoGB0mQfnPyYNlMejUHsw
	jXZ5geOMlyzYOA3kKR8e30v9Ph1Gr8dfGloh+YIQihKhNitGJcYWxst2KRUI5d89CWkcgIuA5m0
	OdYgonyG7yrtgc0iXSTd/6mqwXA8W8JrclxVJW7QjrNXWXgml93cEObCSoiRftlG9usXNwyOQvn
	T1r6AHQdJjyAoY5jX9y50A==
X-Received: by 2002:a05:600c:630f:b0:49f:bd3c:bc1f with SMTP id 5b1f17b1804b1-49fe66fd51dmr291415105e9.26.1790695078490;
        Tue, 29 Sep 2026 08:17:58 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:58 -0700 (PDT)
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
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 08/13] ARM: dts: imx6ul: Add Variscite storage and wireless files
Date: Tue, 29 Sep 2026 17:17:35 +0200
Message-ID: <bdca7db012bec2438645e7aaf22f827cabc624c4.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add shared DTSI files for eMMC, NAND, Broadcom Wi-Fi and NXP
IW61x options on VAR-SOM-6UL and DART-6UL. These options have the
same descriptions on both modules, so use one file for each.

Keep the module options independent of the carrier board so each
board DTS can select its assembled storage and wireless devices.
The IW61x SDIO host has no child node, so it needs no address or
size cell properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Share identical eMMC, NAND, Broadcom Wi-Fi and IW61x DTSI files
   between the two modules.
 - Drop address and size cells from the IW61x SDIO host, which has no
   child node.

 .../dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi  | 32 ++++++++++
 .../dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi  | 63 +++++++++++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi | 42 +++++++++++++
 .../imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi    | 43 +++++++++++++
 4 files changed, 180 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
new file mode 100644
index 000000000000..26c8ca8f21a0
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	bus-width = <8>;
+	no-1-8-v;
+	non-removable;
+	keep-power-in-suspend;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_usdhc2: usdhc2-grp {
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi
new file mode 100644
index 000000000000..d7952233a1ee
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	reg_sd1_vmmc: regulator-sd1-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&tsc {
+	status = "disabled";
+};
+
+&usdhc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_32k_clk>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>, <&pinctrl_wifi>;
+	keep-power-in-suspend;
+	vmmc-supply = <&reg_sd1_vmmc>;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+&iomuxc {
+	pinctrl_32k_clk: 32k-clk-grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO03__OSC32K_32K_OUT	0x03029
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
-- 
2.47.3
