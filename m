Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509334;
	b=3ylMx8HrUgZ7dm/5UgE96Pq1G+GxXoOo4+XJur/8SUGgdJRH/io+kPOXsXgcRt24ao0J
	 Q5GDchUN9+E+oApos+YjtHlW1JSc7MRO3o6aU8S4XkZePlUbC+1B/L8ceSrYEOZVI648P
	 JxMDjOmUA/D1T/L2pqBvz8rB/q40kstVeAbFE/CwnxFi080H1obV58C0L99d/nsqSkJwF
	 2fdF9+31TZNuE59Zig31tjlnhrW5hM8mYnDWRLAGh66gA+q9/c+VXcoGs3EPM5U+eYtM2
	 nC8kVXrREQInyX9l+kD7/taJH83Xd5U2hehQJ7iG0QLJkEIUm5JZTI8fi75uVUJQUJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hJHTn6g0mPNKGGagv6KGkwERwVl2+3Gp2YG4+afMNK0=;
	b=hfSIm+RNxOgxYaAK7ciTsq9qBI/0QS3qls4xbQ/9ReoqFygKntBPGy6etiMINcKQIR+3
	 KGgGmGOH/pp8dc8w2uIPe/iTZWMiwOenFsDedEQslMqDlBfgshgMt5PMZLlC3zV6ZGWdJ
	 yfiqZ8UZsS0SDRy8gBqhSgekc1lGSiqH95zh6eR7JxQyicLd/f244R3SmL3uefhPFeMet
	 DK5HPFFgj8aoqfXlEptM/u9SuqnVN1LFdD9zj4VM0lIwAnQmE9h/uBOWPRZKt7QBr5A9+
	 RQUdurSg7aLv0G6iR1EuZzzEjLa2ReKzMX7uITH+Iprn+vKXlMz0fCMDWFTb9pitXJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e3Eh0pHj;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BE1606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13BE1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e3Eh0pHj
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa5103so36541f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509332; x=1795114132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJHTn6g0mPNKGGagv6KGkwERwVl2+3Gp2YG4+afMNK0=;
        b=e3Eh0pHjR3JIZVevcIkgWKTuYil21CbD+sOydYw/A5voLDZhzSEcU+/831i/UaOf/a
         AlG3if6ivtCAXu0MNOFlIwXj4mv27DJgDmyCAFwcpiN+KA4EE8zLX1rxMeEDMMZqqS2I
         L6KAo2oogtZ1YLopAaurIUei0Z1OtpCU5wrNkcQHdHy9luFhSthnRA8yFaNOhjqhjZdn
         Q67taKAgm00DbR9ZeLku85x+g0maUw7Mk/3B7PyZQy5GFLtLOLZi+vfOBP9kE5FLfgwt
         lcNokoLN/Lgp0W2OV1mqrxcPfKZkTXT+1kBwWCwoDywt5C3aLuf7/M0D6r/2QP71sgLJ
         a6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509332; x=1795114132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJHTn6g0mPNKGGagv6KGkwERwVl2+3Gp2YG4+afMNK0=;
        b=NRfyJC54RkfIMnx+QyVJ2+19N720sHnNdnplaqwPe2DUT1z6gS1NXvtJbv215XYR8y
         fR+hwJ4ZV8qj0dp73zRsq7c6m9EIqOimyehtqhYTXOLCnDuvYVwf6oKCqj65NwDYf/oa
         Mbb8HvSBhxe4nL99CJHAkoWBjL6m6CoL01KYsn71NJF/vNzO3PtPIg4evPVu06PKG2KW
         5GooyFwL1HUwKnKLT48i5gJMtA/Yxd5YinKaC54FjebWhb3QNEb+cXpAhKfNtyZW0BCo
         w2JzSFenBMxc2nZMu4VpWniGzMjSnfhckozg3JnKqoM8yQG8s8SHI2Mcuqc34yYjVCOM
         ZRkA==
X-Forwarded-Encrypted: i=1; AL+hErFP7gTAkVQzJb63+oqhFgfHPHKdw4g+3jsHJlpcqvRnCuUxbVNlfmoUrqFJ/9yP02A/d7fzZnil9XSFCCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P1TLQJnJ1PxYQdsMpLddQpNqAfBZDqMSqS0CBuirh+etsT7i1
	1KD7N4zKSMnvcO2XM62GCxhJyzCtuwjui2R0MiCLOE3y3s/QecVuKqmZ
X-Gm-Gg: AYBFou3y/feOzs03cSexBj79zRVWVNAbEeK8b3Chy/KPzjU81aP8CSXfDmi2Nd4F4I7
	9C8A7kh44Ekj2mbe2eHgg+vpiYzLx/AEYOCJdzu/gQdkD1ZmkbVmTH31q2LTwXIIDLV87t8HVFr
	/KJn21hQQVdMXfRibPuUbO5AGDlizgF7AqPqPs1zuk8g3RCsSJCcka6SpZTuqKMV7bmhiHqqzh/
	VVQIetinq0dMLGUmO3ImUHWBo32TIy5+cg2NFnm0TUCztrnDcsudIQddTKrNglvVEpZfuqkPY11
	VybGqE44HW/GIRus4hZOdCo+dMXL3wxR/wXS78kMUjt3OUsyJLJkjcB8K7fcJZwufaH6t7g6Tek
	/Q/WxgB7wjJpoHF0Kp3DCfVRhenmWuoHheWsguzq8OaTmEwykJIlQzkNcbg14PDeIAUuZBtwYkB
	ZuFRCGQ6LPnMo9swsQn3LDjrMzJeDQdodSyMeSMXEh/XzQKFKeWRO62mUNa3OW48BHd7nrixOU9
	Lcu3EM/GT7nZzgtCMKJs4QXuTw/ggzXKcJwKpx4hru+DIJBFuy+c5Dp+4hT19XQqE2p8ITLKW+g
	gQzhMwmPYJPbNek/sB5Gn+y+Woy+IzcLjmHSlOwCA7JSlCYgp4aKdvHrhJh8qnUjYg==
X-Received: by 2002:a05:6000:490a:b0:48e:353b:9f28 with SMTP id ffacd0b85a97d-49c6dc01369mr631766f8f.1.1794509332386;
        Thu, 12 Nov 2026 10:48:52 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:72c6:df48:8225:6701])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm712972f8f.49.2026.11.12.10.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:48:52 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Thu, 12 Nov 2026 18:48:50 +0000
Subject: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
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
Message-Id: <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509330; l=6783;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=ZBUpEdCwH2Lq7V3xolPsCub9daf52igHcZEGlvTYJ6Y=;
 b=7WMJWEQSNnocGbbay4QEY+IEeGTlvK6hlX+vPtCx0DyHbsB3EHNinz9agnAziVYawnOddE2S7
 GXKV1fXEHQjArHUCyHb7aumveuRNA7oCEmcb04GdhqMl71PIpQ8v2a8
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree nodes for the three SDHI controllers (SDHI{0,1,2})
on the RZ/G3L SoC (r9a08g046) and enable SDHI1 on the RZ/G3L SMARC
EVK platform with pincontrol and GPIO-based voltage switching
regulator support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 73 +++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 88 ++++++++++++++++++++++
 2 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 7e379f6ab837..29ce1ab2a57f 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1062,9 +1062,80 @@ dmac: dma-controller@11820000 {
 			dma-channels = <16>;
 		};
 
+		sdhi0: mmc@11c00000 {
+			compatible = "renesas,sdhi-r9a08g046";
+			reg = <0x0 0x11c00000 0 0x10000>;
+			interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
+				 <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
+			clock-names = "core", "clkh", "cd", "aclkm", "aclks";
+			max-frequency = <150000000>;
+			resets = <&cpg R9A08G046_SDHI0_IXRST>,
+				 <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
+				 <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
+			reset-names = "rst", "axim", "axis";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		sdhi1: mmc@11c10000 {
+			compatible = "renesas,sdhi-r9a08g046";
 			reg = <0x0 0x11c10000 0 0x10000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>,
+				 <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>;
+			clock-names = "core", "clkh", "cd", "aclkm", "aclks";
+			max-frequency = <150000000>;
+			resets = <&cpg R9A08G046_SDHI1_IXRST>,
+				 <&cpg R9A08G046_SDHI1_IXRSTAXIM>,
+				 <&cpg R9A08G046_SDHI1_IXRSTAXIS>;
+			reset-names = "rst", "axim", "axis";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi1_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI1-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <1200>;
+				status = "disabled";
+			};
+		};
+
+		sdhi2: mmc@11c20000 {
+			compatible = "renesas,sdhi-r9a08g046";
+			reg = <0x0 0x11c20000 0 0x10000>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_CLK_HS>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK2>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>,
+				 <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>;
+			clock-names = "core", "clkh", "cd", "aclkm", "aclks";
+			max-frequency = <150000000>;
+			resets = <&cpg R9A08G046_SDHI2_IXRST>,
+				 <&cpg R9A08G046_SDHI2_IXRSTAXIM>,
+				 <&cpg R9A08G046_SDHI2_IXRSTAXIS>;
+			reset-names = "rst", "axim", "axis";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi2_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI2-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <1200>;
+				status = "disabled";
+			};
 		};
 
 		eth0: ethernet@11c30000 {
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 9ffaead2c6be..2f3266129733 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -14,6 +14,7 @@
 #define SW_GPIO4		1
 #define SW_I3C_EN		0
 #define SW_SER0_PMOD		1
+#define SW_SDIO_M2E		0
 
 #define PMOD_GPIO4		0
 #define PMOD_GPIO6		0
@@ -38,6 +39,7 @@ / {
 	aliases {
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		mmc1 = &sdhi1;
 		serial0 = &rsci2;
 		serial1 = &rsci3;
 		serial2 = &rsci1;
@@ -69,6 +71,19 @@ codec_dai: codec {
 		};
 	};
 #endif
+
+#if RZ_BOOT_MODE3
+	vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
+		compatible = "regulator-gpio";
+		regulator-name = "SD1_PVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&pinctrl RZG3L_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+		regulator-ramp-delay = <1200>;
+	};
+#endif
 };
 
 &i2c2 {
@@ -195,6 +210,68 @@ scif0_pins: scif0 {
 		power-source = <1800>;
 	};
 
+#if RZ_BOOT_MODE3
+	sd1-pwr-en-hog {
+		gpio-hog;
+		gpios = <RZG3L_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd1_pwr_en";
+	};
+#endif
+
+	sdhi1_pins: sd1 {
+		sd1-cd {
+			pinmux = <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_CD */
+		};
+
+		sd1-clk {
+			pinmux = <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_CLK */
+			power-source = <3300>;
+		};
+
+		sd1-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_CMD */
+			input-enable;
+			power-source = <3300>;
+			bias-pull-up;
+		};
+
+		sd1-data {
+			pinmux = <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_DAT0 */
+				 <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT1 */
+				 <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT2 */
+				 <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT3 */
+			input-enable;
+			power-source = <3300>;
+		};
+	};
+
+	sdhi1_uhs_pins: sd1-uhs {
+		sd1-cd {
+			pinmux = <RZG3L_PORT_PINMUX(J, 0, 8)>; /* SD1_CD */
+		};
+
+		sd1-clk {
+			pinmux = <RZG3L_PORT_PINMUX(G, 0, 1)>; /* SD1_CLK */
+			power-source = <1800>;
+		};
+
+		sd1-cmd {
+			pinmux = <RZG3L_PORT_PINMUX(G, 1, 1)>; /* SD1_CMD */
+			input-enable;
+			power-source = <1800>;
+		};
+
+		sd1-data {
+			pinmux = <RZG3L_PORT_PINMUX(G, 2, 1)>, /* SD1_DAT0 */
+				 <RZG3L_PORT_PINMUX(G, 3, 1)>, /* SD1_DAT1 */
+				 <RZG3L_PORT_PINMUX(G, 4, 1)>, /* SD1_DAT2 */
+				 <RZG3L_PORT_PINMUX(G, 5, 1)>; /* SD1_DAT3 */
+			input-enable;
+			power-source = <1800>;
+		};
+	};
+
 	ssi0_pins: ssi0 {
 		pinmux = <RZG3L_PORT_PINMUX(H, 0, 9)>, /* SSIF0_RXD */
 			 <RZG3L_PORT_PINMUX(H, 1, 9)>, /* SSIF0_BCK */
@@ -255,6 +332,17 @@ &scif0 {
 	pinctrl-names = "default";
 };
 
+#if RZ_BOOT_MODE3
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-1 = <&sdhi1_uhs_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sd1_pvdd>;
+};
+#endif
+
 #if !SW_SD2_EN
 &ssi0 {
 	clocks = <&cpg CPG_MOD R9A08G046_SSI0_PCLK2>,

-- 
2.43.0

