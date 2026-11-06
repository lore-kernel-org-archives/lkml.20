Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970024;
	b=p2NBmYB1/JMmPOgbhH7XESnAQMrf3RJJwKiXgc16N64w76aUHY9fH5rH4PysDEUOiau9
	 ZODoZ5t43E9xReuZj01fox01dUdc20pZl1GwXoYrdtkMqMQ/vlR1Io7FRbxljAGOdZNCS
	 7/WaKbUrWZKFMJfU/ohfFwTCZ8264gOU0cGdptIRqmrMg9pZpPt/2FRYlDPwaHZfuNxtk
	 dCW8mjI8C8bzNxgbgGm9VSyvA6Z9L9mQL3bK3C8f0v3JM6dRhkIJH299p/zWGpn66KM9D
	 0bNNyj6ZoP15IceeNl1mDsSF9oYqCXbv3inB8oXc/CpAPphXkYNxsZxpJaarChlbZ7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=NTm2q5CE9vxYpIg+R5qLU7TfFksBO/ab0fXIHYsQ1No=;
	b=SGNRarycpXsPWTNBwBl9TYhWQ0328abEGgUV4ggwkKK8HKc6sJ8jMN/mbiT4s9ZstWNb
	 dh89ClCOuuf6/fRRa3vWf7KEvmcjfZNw0S+gekakdA64w/YpkUgBNGLxX765ooG/Ybnp4
	 yKho0y0VmXP82OuqUJlCDp1tZ6YU+1mW/yR9qAgmdsyGBIxRV2Ys9li3M/ZwKdzwN8aP3
	 LjHVyO0hp7hOBLfaSeSzoRWJAi0YSFDucO/xhK5w+jGlLpZ/5Kbm+rYcGLHlkqKno5Cbt
	 om73Q55aRWtJXi4WnRJ51W6g5PDpEOveY8Qo8fQwfhkBKzLGsevoKDrU4cdkeanj3PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="GNAFOmh/";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4BF606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D4BF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GNAFOmh/
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491846221ffso514291f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793970022; x=1794574822; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NTm2q5CE9vxYpIg+R5qLU7TfFksBO/ab0fXIHYsQ1No=;
        b=GNAFOmh/7Pf05cwFoAcVDzfcF8nIQZHu9dkjjmPS4so9Tgmve8dPKXlH+z4T05Ohk4
         29Fqxev172bvEhUp6Uf02vOi0r/gvDGCQKDkwbkfKkiqGkD5kpZhkAgC5Cnuhnk4BWrw
         NoX0FC+F2X12R49dC14iz1JzeVqnAg1ThowP0i2ser2umg96tfmdSRzN+Tv1Fx+tUc1C
         HY+SpTMsWWMXyzy3LD0abXnVpFEFLfFhJcEOQpCY3HBJNh9pf7Wx0vmUqdHeNzkJjuCM
         2rCxWrIGPz+oN/yM9ve0zufr/fHPTYJhXF+6kNXn3DpR19EdGX11bYfcd7ZLKHJ1TGes
         N7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793970022; x=1794574822;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NTm2q5CE9vxYpIg+R5qLU7TfFksBO/ab0fXIHYsQ1No=;
        b=memM4AGcOdGtEAcmhFhGtNDrKUpGaWJboNhwDjqe2tNg5MUSDCFvskfYuJC+zgXw/C
         AGCKzZvDlrGPp1fN738f7dsMx5rp32eYpuxuchr4Aq71FOcC4cI0z5qbrfWDkcHwkE2g
         SsiUVHSMTwDqgWtH4aWvILhTWh4GqOwDM5+InlQf9zHALzrJHKMjgvf07aB9bbKPuiUb
         YMNJSRagfI1Fl/kNCQKN8Nk59RzhMqlgqeU60IVs/0LApInUDPZiGOPXSVusublu2Qhf
         27HNDy667fNHLo+L82EGEcq4AHxjF1QMEucUmH3WTS2/Xl92X+pHFZfirABOfUgEmdrn
         09jQ==
X-Forwarded-Encrypted: i=1; AL+hErGFT7u1apkapKN9+HtWYYBUDGbLCdB+emwp60FKxa4WH1RUao4W6yFr+cY1Xi5KqvEBMCHh4LDxJ1Aa+7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dpSDBewdSq+WCOS5PL/FMwxNdE74kv6I+AqMZ+tr3OviNZ8pS
	8Mnc7o1zlvixPHiKv7foqucNg/C7tHT78N3VLfb96x/Aq9+IiMs8bWgA6Enm/keoLRR40SiS3y0
	V5BoEAgo=
X-Gm-Gg: AYBFou0QYKLVhlH40IIs9xK0/q3jOArZH0FWpLqzzLXBFwAFKowA6wWYAuBKtT3k+J3
	8mOiJKyNTDILtmRubqHtnUfXqna94fR5SONcf55ySJrmRo1Ci3b5yCHfT0JlKrgG/3Lj5i4mzxr
	g1rPiHYiznyyY85EYarf1IbrfodpATcqFlb8j9BeKW6LcenJV6MLSYYDWKx6GCBQU5B5srJL0vp
	p5XHT2l3BLiq5xseCjVvXniHWrIbu3IZtd7WUmq42v0DC63Ohv8QtKuq5Op0+iWYg+sRJ9jd5CZ
	k6ugRSIpngtbz+wVN4Fs9zg1P+xrYJ7gH3zivZSn84DiRRgRnEATjf58UnM6+gjWar67VHTQDyG
	b+ooVtt+DZc9foVD0ex8Ramj35+d9gSsY4PCFGzeAdF4St7Oi31tWgiO0mKGpOQDu7WfrPru3Mw
	9k7bG3ycsWLo4/tq09VDve8o5HHKSoWdQHszFfyERgrsnKaDWkip6JzemjgwngxmqPh3IDAZdxE
	JUPVEPxws1dhKhWO8LnHvvDDFPSdpdplE2apzWE6SOGUQKFA4+3x/winSFwPPynFZ1iN5oQ6YPi
	gn/GZXSrzAy1FawgDy3ZwfA=
X-Received: by 2002:a05:6000:288c:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-492777dbf93mr5033387f8f.40.1793970021373;
        Fri, 06 Nov 2026 05:00:21 -0800 (PST)
Received: from [192.168.1.123] ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm3434259f8f.23.2026.11.06.05.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:00:20 -0800 (PST)
From: Daniel Drake <ddrake@baylibre.com>
Date: Fri, 06 Nov 2026 12:59:59 +0000
Subject: [PATCH] arm64: dts: imx93-11x11-frdm: add HDMI support
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
Message-Id: <20261106-imx93-frdm-hdmi-v1-1-5b05a83ed208@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDMBAF0KsMf+1AYjRirlK6CGZiZhFbEiiCe
 PeC7wDvQpem0hHoQpOfdv0cCGQHwlbisQtrQiCMZvTWGs9az9VxbqlySVV5cdlHt05RZouB8G2
 S9XzG1/u+/3DTfBdhAAAA
X-Change-ID: 20261106-imx93-frdm-hdmi-73f6a394ae51
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Drake <ddrake@baylibre.com>
X-Mailer: b4 0.14.3

The FRDM i.MX93 board has HDMI output display path:

  LCDIF -> LDB (LVDS channel 0) -> IT6263 -> type-A HDMI connector

The product schematic shows that the reset line is on the PCAL6524 GPIO
expander port 2 pin 5 (which gpio-pca953x regards as offset 21), all of
the 3.3V supplies come from PMIC BUCK4, and all of the 1.8V supplies
from BUCK5.

Describe the bridge and the connector, link it to the LDB and enable
the LCDIF, LDB and media block control.

PLL and LCDIF clocks are initially set to support a fixed 74.25 MHz
pixel clock, which supports some common HDMI resolutions, similar to
the imx8mp.dtsi setup with its HDMI overlays. In future, we could allow
for dynamic PLL adjustment based on selected display mode, however this
first needs clock framework improvements to support coordination of
sibling clocks from different drivers.

Signed-off-by: Daniel Drake <ddrake@baylibre.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index 6e8351d12016..6dd0977b8305 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -9,6 +9,18 @@ / {
 	compatible = "fsl,imx93-11x11-frdm", "fsl,imx93";
 	model = "NXP i.MX93 11X11 FRDM board";
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+
 	reg_usdhc3_vmmc: regulator-usdhc3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VPCIe_3V3";
@@ -38,6 +50,14 @@ &bluetooth {
 	vcc-supply = <&reg_usdhc3_vmmc>;
 };
 
+&lcdif {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&it6263_lvds_in>;
+};
+
 &lpi2c1 {
 	pcal6408: gpio@20 {
 		compatible = "nxp,pcal6408";
@@ -47,6 +67,67 @@ pcal6408: gpio@20 {
 		reset-gpios = <&pcal6524 20 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&buck5>;
 	};
+
+	hdmi@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "jeida-24";
+		reset-gpios = <&pcal6524 21 GPIO_ACTIVE_LOW>;
+		ivdd-supply = <&buck5>;
+		ovdd-supply = <&buck4>;
+		txavcc18-supply = <&buck5>;
+		txavcc33-supply = <&buck4>;
+		pvcc1-supply = <&buck5>;
+		pvcc2-supply = <&buck5>;
+		avcc-supply = <&buck4>;
+		anvdd-supply = <&buck5>;
+		apvdd-supply = <&buck5>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				it6263_lvds_in: endpoint {
+					remote-endpoint = <&ldb_lvds_ch0>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				it6263_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&media_blk_ctrl {
+	assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
+			  <&clk IMX93_CLK_MEDIA_APB>,
+			  <&clk IMX93_CLK_VIDEO_PLL>,
+			  <&clk IMX93_CLK_MEDIA_DISP_PIX>;
+	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+				 <0>,
+				 <&clk IMX93_CLK_VIDEO_PLL>;
+	/*
+	 * Set IMX93_CLK_MEDIA_DISP_PIX rate to 74250000Hz to accommodate
+	 * IMX93_CLK_VIDEO_PLL rate at 519750000Hz in a rate table.
+	 * The resultant 74.25MHz pixel clock supports some common HDMI
+	 * resolutions including 1280x720@60 and 1920x1080@30.
+	 */
+	assigned-clock-rates = <400000000>, <133333333>,
+			       <519750000>, <74250000>;
+	status = "okay";
 };
 
 &mqs1 {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261106-imx93-frdm-hdmi-73f6a394ae51

Best regards,
-- 
Daniel Drake <ddrake@baylibre.com>

