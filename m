Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002248;
	b=dNy3VBBU/xnX6uJ74jNDpwlRu5FsT5iLbrgQae+KiMz5VRLGzwg9iGW5H/ILK/VVywbV
	 PjKdvDtra7O5QCSrW97l1Bx/L2kG59dM4YWnyCjMyI84n1CHriu2frj9KWf0l4fy6wjFu
	 MXk20IxZO5Sr5DV2asheAiJBj7gm+tDeg6i1H15/fYGxZm7HnWul8kRmkeYvRYzhUyg5x
	 47nguCsggv1IRjBBbVNkmNhKX2AtmSvtKojxMKkJAHryAlpkH6aGGbsqOvonOtEe05BfD
	 4NHGbhewOS0xMVS1Go/o/dXKLW1O0ZDEBIJ3Nd57IrhVh9+Ge3nTFbiprJlZKVVKNeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002248;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=LOpRR3SM0gOpsUi1esldJeDTln8WrcBJiq5/+cZZX3s=;
	b=aSS4/6cJz69C3AonyEqUR6lzX7X8hBpm/rKAOk3c0zpZp0hvsC3n3U8zv6+g3CwzTZTY
	 XcISfxzFq6wk+ACo9uq4q8JXDBJ7U2TWykyHOebNGEK1/ea04p1ICK1REYrqgHaj8JSzx
	 M7Eg/wh6Oa3jelRG9sA8OM2REniWRptFvamV/jN/zv/JMQpssXiPuDibX3rzmpk5V9DNI
	 16uy/sR1lkR3Dnmg+nQHUagy7QkDgQ2j0hQB19txE0vbrjWxjElNFhHlBcA+W69RbqU38
	 XCWFbn6uImvzAM3Sm7EYyXuCGCByOBiWNZ6uCO3LYavAbKXyO9nNiUJOd77+s8HWujQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=j66VxG5p;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57573606D803;
	Fri,  6 Nov 2026 21:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57573606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=j66VxG5p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794002240;
	bh=e/xBfo+fiNINWUlXj13cPgRnznqBSzqTdZXHzg5SYV4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j66VxG5pNKXr4HAG0pU+jMFrkDj3VqmNuXZYErJB+HvjBUZMiUa1gYIW0Hqp23kCg
	 jpOfZblExs1zvjSZaSueaj8Ebch2H72M3XVR5hMJlodiObxuhpF12e1c3m5WqctTEG
	 ZtKyVYkiEy1QjPhMF81GmFgGRMwyuWerywd2aiKBDYIKA3vyezr/Nzh+Furpn3COPg
	 pD2tKlhmX1eyhFaoSFaZeUQWW1pcAqXh3YDnyMs1usJu2g5dFKNvPB7z2g11hsAwRV
	 4y+TLZjiT7A4NqqXXvDp4lju7HNlWrW3yAu4pfO+zjQopwZ0dO+6wyNAUH5L0o9HKX
	 LmVOUR0WPVLHQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F04317E09FA;
	Fri, 06 Nov 2026 22:57:20 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 17794480031; Fri, 06 Nov 2026 22:57:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 06 Nov 2026 22:57:09 +0100
Subject: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-rk3588-evb1-dt-updates-v1-4-bdbe16223589@collabora.com>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3770;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=e/xBfo+fiNINWUlXj13cPgRnznqBSzqTdZXHzg5SYV4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGruTT+exGRRuRDMIgsWZ1FSOXAbWHue0ck1t
 FQpv1U5xPgG+YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7k0/AAoJENju1/PI
 O/qainQQAJvg/Sj27GTzm9Dpix8sk0RKE12I4rGRqKfEtzM/DKs8dbSdF+O8VZJjERT4q3r/j0b
 s8yu7o3cEx1rIxnD8V1RdAt3eQTzUVXYUSDFjpa3148K6XSOhnkhVs9KQsJa2EQGj+3nvvCgEmw
 AfegsR+NpqXCDp180WTfrMu/d3rZ+CSssJ3Og3P+oUK+tkYSwFcnMapGgHrHDmxRylUbib926wa
 1v1sTZktU/2BR10nyThK2GMAFxN534Kas2RN8cjqfRjrFt8C/oOQMCqNZhDntyF7SEPUvluIWQ7
 wHSzD8BheG02Me9g4YeguhJ54ujgiG1EzRX7aeGTYm1LxxojO7Pyj6ahivQ2L3o/sEwcWjncuKr
 EkDPbzOqFDlHFciRFMPrILq5c8AksGQWD4E4HyiNP0SxOerGTP0dajnZfDnNaCyGTM3YT+BfPxQ
 s83DDFXiQx+9CFNWRinKWkujVU+i4tfDM3qeUC6xQPLrIIORkohmHNBBq/Vw8bouwUuH2Kf6n0z
 AMNh7JwRqUVoOnd0+4OIyQ2WzKxRbRo97Hk2uWbiEwoISHVzr+s/yckf/9R5tVT743102M+px4C
 sAzTIoXQipxZIU/Z8Glga2ZegoU8oCOblwvcE6pXhurIWu05tcDtb6iMuGh9P3GnHhuimbqJwkz
 ddPyISLQ6gfy2mSgDP0cpXg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The RK3588 EVB1 comes with a W552793DBA-V10 Touchscreen/Display
combination. It contains a Wanchanglong W552793BAA panel and a
Goodix GT1158 touchscreen. This adds the DT description of it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 90 ++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 6a95a8bb6fb8..327ca13b60f0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -204,6 +204,15 @@ vcc12v_dcin: regulator-vcc12v-dcin {
 		regulator-max-microvolt = <12000000>;
 	};
 
+	vcc3v3_lcd_mipi: regulator-vcc3v3-lcd-mipi {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_lcd_mipi";
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vcc_3v3_s0>;
+	};
+
 	vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3_pcie30";
@@ -338,6 +347,43 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "wanchanglong,w552793baa", "raydium,rm67200";
+		reg = <0>;
+		backlight = <&backlight>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_rst_gpio>;
+		vdd-supply = <&vcc3v3_lcd_mipi>;
+		iovcc-supply = <&vcc3v3_lcd_mipi>;
+		vsp-supply = <&vcc5v0_sys>;
+		vsn-supply = <&vcc5v0_sys>;
+		reset-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
+
+		port {
+			mipi_panel_in: endpoint {
+				remote-endpoint = <&dsi0_out_panel>;
+			};
+		};
+	};
+};
+
+&dsi0_in {
+	dsi0_in_vp3: endpoint {
+		remote-endpoint = <&vp3_out_dsi0>;
+	};
+};
+
+&dsi0_out {
+	dsi0_out_panel: endpoint {
+		remote-endpoint = <&mipi_panel_in>;
+	};
+};
+
 &gmac0 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
@@ -495,6 +541,22 @@ hym8563: rtc@51 {
 	};
 };
 
+&i2c6 {
+	status = "okay";
+
+	gt1x: touchscreen@14 {
+		compatible = "goodix,gt1158";
+		reg = <0x14>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		reset-gpios = <&gpio0 RK_PD2 GPIO_ACTIVE_HIGH>;
+		AVDD28-supply = <&vcc3v3_lcd_mipi>;
+		VDDIO-supply = <&vcc3v3_lcd_mipi>;
+	};
+};
+
 &i2c7 {
 	status = "okay";
 
@@ -543,6 +605,10 @@ rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+&mipidcphy0 {
+	status = "okay";
+};
+
 &pcie2x1l0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_0_rst>, <&pcie2_0_wake>, <&pcie2_0_clkreq>, <&wifi_host_wake_irq>;
@@ -664,6 +730,12 @@ hym8563_int: hym8563-int {
 		};
 	};
 
+	mipi_dsi {
+		lcd_rst_gpio: lcd-rst {
+			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	pcie2 {
 		pcie2_0_rst: pcie2-0-rst {
 			rockchip,pins = <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -692,6 +764,14 @@ vcc3v3_pcie30_en: vcc3v3-pcie30-en {
 		};
 	};
 
+	touchscreen {
+		touchscreen_pins: touchscreen-pins {
+			rockchip,pins =
+				<0 RK_PD2 RK_FUNC_GPIO &pcfg_pull_up>,
+				<0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	usb {
 		vcc5v0_host_en: vcc5v0-host-en {
 			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -1534,3 +1614,13 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
 		remote-endpoint = <&hdmi1_in_vp1>;
 	};
 };
+
+&vp3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	vp3_out_dsi0: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
+		reg = <ROCKCHIP_VOP2_EP_MIPI0>;
+		remote-endpoint = <&dsi0_in_vp3>;
+	};
+};

-- 
2.53.0

