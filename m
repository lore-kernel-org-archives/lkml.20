Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509335;
	b=OcoHc/mbFeHD9rPJdG5j0UAQl0Xcq1SbJTD8+J8z8zPKCvJLI7Ls+EpWPO8XVeRO3LUH
	 7gWWsbhbmymAMBa52YGooYO0QIxM4G0OItietm1kvIgX+rLt0zre4F3zxVAxJDcLW7nmU
	 8kiyx1HzBUU2DqhTyBVNsFmPSyiaik1eSZTl2ecYoUp1GKA84tD9isLLkZBhUaT2EPHa9
	 iEryU9vc5m1ANBf7IMZX3LIznIsqgQYg668MeyftpZ0sIyVYXGcmkA+tPCT8EO0LYopI1
	 O1iWwl5rPKdGMS+x67qOuTDiwxyEK4mpea0PziKbUwJstjuD63lM2i6IGqilJsvj2KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vjlWWs+KcyOeO7XpSDuLwu1o3oqtWnNYmJvM3RacTds=;
	b=eVkXCKr4TZ674WGUvWdqCWMAjtfTB2nsclyri36dYKPUyj6UIy3R0QqJ/osqp+i175xC
	 Y26BLAB1reTN7+B6fKR11bOiXEIyQ2CLXFdLmHAmFy3Va5YVkjHW8jS2Kd/Jeielcu7zw
	 DnVAkxqqwgGYDNwZ6VJF6AdjpWHL86Avzaj4WjF/fVIoDay1Y4ct0Pv6ziC7wJsSZCv5W
	 brNfzBLnPcRTp/r08iliipPoS5oFTcW0MB8hKI0CAS6alJRyGE165FVwhzeLrZp1SNf+7
	 URgX2M74lS47pRkJ8SmOOL0z/opUIrGNoTZI72F1fK/s3ycgRVAgWoM8+v3DIPB0s3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTv2ZWea;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5170606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5170606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTv2ZWea
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4910b863b84so793593f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509333; x=1795114133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjlWWs+KcyOeO7XpSDuLwu1o3oqtWnNYmJvM3RacTds=;
        b=CTv2ZWeamqlfTEJOsrDWkdx8wgR/BtLbSUyuwga4i8KOFpLkMWDSB03fVb6iG0Unlp
         ysUtbYMoLxapPKKdG8K9XjpI7Zob4IXra3921Wc/uMhPHKuOXrcw1f05ZqW/f8sygQ+T
         KLVBcG+PClO1Vyl+FR2c4Ez8lPzVY+cqEfitsqMq+AR5lWiwXQHMpENiTjapgBpiwzG9
         hRuvy+1HVzek5v6bfEj9U6KRhxIp5KzFmvBb02lknzsj1XIJ+87PcKuGWKMJn2U15u+C
         SqZrBjDa4ImRUF1I9EYRkjBIZu678RR78d5zv5Rn5EUYE4lNsQnXiBJ7bpoODhnW3Qgy
         bj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509333; x=1795114133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjlWWs+KcyOeO7XpSDuLwu1o3oqtWnNYmJvM3RacTds=;
        b=xEHZQxO2UABBySMW5s01JL1gFUJAMb79kagHIT0SpYPD7FBfRH/QT9fnMDOlgycxg5
         W49Ru15/1AgApUC4zOr/54A1A4Ytr0KH3nQgsa+4Tr9icHkRaxdw7Gs7EUaxCrepOaH0
         OXwCD7LZ/jkZjKPWoJMC/3LJN6uvUI3/MP6OC77Ah0WmUgeeEVDwqCaqx2ZWvO5s2aPp
         vAAT33UrKw4MeKMexk5QWmtWbsfZwafk+SOEUTWleH/v24mNWPJ5aXaEMT61KYosRyXf
         EdGqrfO8eYKnifRj8urxC3ifmB/NlK1dMr1d6/4HIMcRWF7MdVadWp6N4dcztKBMZ3To
         PgdA==
X-Forwarded-Encrypted: i=1; AL+hErEPA3OO500UKyLF/PYlAiNXKpxBIom3s1cM0k8hY08Sw13ZdJ27nqEzUC4EiopbEuxQwxM4cLYBN1K18jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oTwvnzlmvLUBOvEznMPpfSuVdP1Pbs/wgP784FmKXtIR2PdZA
	nrP44MgIIpGt8urhsySJWIs2l045bWrqo+UiAyCxkdvSdY5kPGG7Veum
X-Gm-Gg: AYBFou1+S6cRspJnDxnior0RATEdE+P3tpFM10UNSFP6almGCrDLUgNgrCYSielMViR
	mv7G6NNgF9YbOQu7hyF7gW8oKiojGJ3jLha69USpiTss0bYsp0rAxVmOoRP73z0PANzeALhNoZp
	NYGJL0CjhE4dLNHIzV0P0x9zeoez4isN07fa1MKPADWYA4YCcKZ2rp9yjrcqBD7FeJqNp4cMXYU
	Cd4bzpP8VPOYJnPQsGG5gCa2Mi0kYWRxUfvnh1+hTBzJ2H7OMsg3jPv4hUNnY5t/VDp/mzgirce
	0YLHI5wpI17zdTAXTiV55hW7+emJkEDP53/p8EDW95Naew0Li3RHE0TBw/lPTfKQmhUi4ixyjci
	j36q2RkoyiSEo7MFgeoafGSBi8T/qCvo3dQn45QAl/Ag/vXb6qObB4z+GQx/HdoI2T5rGMkWUhh
	983ElkdixQ0Il++shTcWwoblRqWbjY6Lznj20s1uDAtzMkfeMtX7ttNgo49VGcBkYMUsBGO3CPy
	YG2HmKAX44it2UGeWx4VexTGa/XyVDMdmoMnQn/WRqYkd+mRKnZHz8Qh5XVmkX0T94hdmUfLIaw
	2/+138Bo+F78LOQJLbmAECWAonfrNV5YM401hUfaNr+ca2ndhx21FsUvWY4GRbPqLQ==
X-Received: by 2002:a05:6000:5c5:b0:492:1c22:f08f with SMTP id ffacd0b85a97d-49c7016ba1emr700631f8f.14.1794509333116;
        Thu, 12 Nov 2026 10:48:53 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:72c6:df48:8225:6701])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm712972f8f.49.2026.11.12.10.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:48:52 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 12 Nov 2026 18:48:51 +0000
Subject: [PATCH 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC
 on SDHI0
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
Message-Id: <20261112-sdhi_rzg3l-v1-2-ca30b209615d@bp.renesas.com>
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
In-Reply-To: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509331; l=5121;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=yinJFycG9cyOq2uKC2zr7c/uH1Fqlcvk2X4MFaeiAGg=;
 b=C2QYBrQndHOI+Zcl1Dh8Ji2W4gWIoa5k3uECsVKTRh0xqgLe0trxycpjerbmUavYEIK/w3spY
 WogwWnoCm8aB+501MQuOlCayIrSx4WM21vTTue9HtdgR2Xm17K0fKcb
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for enabling SD card or eMMC on SDHI0 on the RZ/G3L SMARC
SoM. The selection between SD and eMMC is controlled by the
SW_SD0_DEV_SEL macro in the board DTS, which must match the position
of switch SYS.1 on the SoM. By default, eMMC is enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |   1 +
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 143 +++++++++++++++++++++
 2 files changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 2f3266129733..5f5441c47335 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -9,6 +9,7 @@
 
 /* Switch selection settings */
 #define RZ_BOOT_MODE3		1
+#define SW_SD0_DEV_SEL		0
 #define SW_SD2_EN		0
 #define SW_DPI_EN		0
 #define SW_GPIO4		1
diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
index 91b2d0d43104..e84840fa5086 100644
--- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -9,6 +9,10 @@
  * Please set the below switch position on the SoM and the corresponding macro
  * on the board DTS:
  *
+ * Switch position SYS.1, Macro SW_SD0_DEV_SEL:
+ *      0 - SD0 is connected to eMMC (default)
+ *      1 - SD0 is connected to uSD0 card
+ *
  * Switch position SYS.2, Macro SW_I3C_EN:
  *      0 - SMARC_I2C_GP is enabled
  *      1 - I3C is enabled
@@ -37,6 +41,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		i2c0 = &i2c0;
+		mmc0 = &sdhi0;
 	};
 
 	memory@48000000 {
@@ -78,6 +83,19 @@ reg_3p3v: regulator-3p3v {
 		regulator-always-on;
 	};
 
+#if SW_SD0_DEV_SEL
+	vqmmc_sd0_pvdd: vqmmc-sd0-pvdd {
+		compatible = "regulator-gpio";
+		regulator-name = "SD0_PVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG3L_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+		regulator-ramp-delay = <1200>;
+	};
+#endif
+
 	x2_clk: x2-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -241,7 +259,132 @@ i2c0_pins: i2c0 {
 		pinmux = <RZG3L_PORT_PINMUX(L, 2, 4)>, /* RIIC0_SCL */
 			 <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
 	};
+
+	sd0-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG3L_GPIO(5, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd0_pwr_en";
+	};
+
+	sdhi0_emmc_pins: sd0-emmc {
+		sd0-clk {
+			pins = "SD0_CLK";
+			power-source = <1800>;
+			drive-strength-microamp = <9000>;
+		};
+
+		sd0-cmd {
+			pins = "SD0_CMD";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3",
+			       "SD0_DAT4", "SD0_DAT5", "SD0_DAT6", "SD0_DAT7";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-rst {
+			pins = "SD0_RST#";
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-ds {
+			pins = "SD0_DS";
+			input-enable;
+			bias-pull-down;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+	};
+
+	sdhi0_usd_pins: sd0-usd {
+		sd0-cd {
+			pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
+		};
+
+		sd0-clk {
+			pins = "SD0_CLK";
+			drive-strength-microamp = <8000>;
+			power-source = <3300>;
+		};
+
+		sd0-cmd {
+			pins = "SD0_CMD";
+			input-enable;
+			drive-strength-microamp = <8000>;
+			power-source = <3300>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3";
+			input-enable;
+			drive-strength-microamp = <8000>;
+			power-source = <3300>;
+		};
+	};
+
+	sdhi0_usd_uhs_pins: sd0-usd-uhs {
+		sd0-cd {
+			pinmux = <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_CD */
+		};
+
+		sd0-clk {
+			pins = "SD0_CLK";
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-cmd {
+			pins = "SD0_CMD";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+
+		sd0-data {
+			pins = "SD0_DAT0", "SD0_DAT1", "SD0_DAT2", "SD0_DAT3";
+			input-enable;
+			drive-strength-microamp = <9000>;
+			power-source = <1800>;
+		};
+	};
+};
+
+#if (SW_SD0_DEV_SEL)
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_usd_pins>;
+	pinctrl-1 = <&sdhi0_usd_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sd0_pvdd>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+#else
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_emmc_pins>;
+	pinctrl-1 = <&sdhi0_emmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	non-removable;
+	fixed-emmc-driver-type = <1>;
+	status = "okay";
 };
+#endif
 
 &wdt0 {
 	timeout-sec = <60>;

-- 
2.43.0

