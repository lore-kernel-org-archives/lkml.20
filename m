Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404986;
	b=QRzgepWM/JuG3djlxjU8vyRXzE6B08ImC2Q4ljGkpxCdjR1mhl2M07UKDBWoA9+6Ifog
	 LFF9LTDBkcLfaLvx8fd8MOb941p6MvjPS8beeEDZNfx0uRubZj6+byDUJ4mAYLJhlsZtH
	 expgN9MqsFQ1U4b6yP1GqeY/cKqZFOBuupZaa0LwnW2ViTtrs8m453/fgWzafSWOH+HYH
	 vidL0xBxTdfsUUea4ZNbNZjyU/Lxs8HKfdGWieHGQtDGJ3+RTTQ6sMgc2jLIeV5p+lwQr
	 Jox14aljPmW7eHxvjx9ixSG5l2GkciRsGCaCUcqXhnrDFOVA+DWXzZ7Wdgi9U5Anrxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7fnh/1KmjFjEPtr//fod/I5Z9kbTxg0SKyfXY+qNzcY=;
	b=AjzMZ29MaiwrtgisfgpwtC6q8tn7SwU2pdNtmyqvW6CI/ycILHNeaKkjNpZmuqGXRdUV
	 0FrLnM5NOoANd+QL8GxrKlmNavdaKR8iyuiFczPogxNBJt55dXYPcVjPJLduTVluWC+h4
	 Exm7VCi10Lpk6LJyw6T43ejLBoquevpcuoIwY12ZbsteF60N4G178J8iCcHOCHXNCVT51
	 6BrQW83421Bb7eL1iEBogjV6Ne+Q7t82Qa3I9WAllybA1+5FlWPJmPEeS+MFnMYC1gowJ
	 /tL7vZh5wF1EjdUrWZrMxFoCpIxZUumYWwNLu8SQf8QXHS7kmCGLDTKA5JjyX/Yanjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMuwALak;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4A9606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D4A9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMuwALak
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b3b57a31f7so2743257b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404986; x=1795009786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fnh/1KmjFjEPtr//fod/I5Z9kbTxg0SKyfXY+qNzcY=;
        b=AMuwALakgFQr4Bh2iu/sTYk18MVWkV41260B2XT02sGtHnJkMHbu8iQjNUp+r+w3g1
         CahMg7u0IH6/XboTxVxxjwwamGQNkloTcqX146aUR62tgoFZwLNRgqTb69+RUvgLAL3R
         gR4qLUVczeMmlMfcdFsysoF3RmiZxJEFATO9MKz6fVC3C7AjoD7DWDfwTc1NLSuweAr8
         YEFqD2Qi7p0ylecQ94c5Y9PlP4/2lDnWe7e8H/N3yro4X2FGMP+uNHRq4mEUcmRGYFdb
         s9ukfvZFQOLNgIatCzxOEHzMCUsP5BFVyTD31+I8YW5VsAyNJmJVxAzZQorkc0Gkj+m4
         Sb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404986; x=1795009786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fnh/1KmjFjEPtr//fod/I5Z9kbTxg0SKyfXY+qNzcY=;
        b=gTvzMzL6hgpW2zvdfoyK4TcjI9y4UvFNTfxDsYEj70FB3iuKszJiNn+Ka7/MzsahXG
         fhGIsCAqVr0jIRg1ngoWkkXrDG6GbcH+1/ruUmITuZJDPSYKlpD3e80lCTGxB0hTgHn1
         G5BeNbmuRZ4BeKR3ClvDpR7/4yPa2zsue/LkiZvyPbkfjz9dBo8DYcNhlsXZvYu3KPSq
         AiJpMDSrrKGwUFJRfe2iiS/9iVP+PgOOVMXDBvnuMvPLqJT1JWpgDIEvuhyNELA5vogi
         R31a3R8769Ye6xa8/gn0misu+BwBpVvN8cI1wUTw5+0pgwmIUTNEjcVIx0eL65q8Y/m2
         BlJA==
X-Forwarded-Encrypted: i=1; AL+hErEmFk5lUU86RWH4uJ283CqfcnGWoC7uq9o720YOuNxidet04Ge6Wt4cxt59HIL12w/+0cZFkC6BCAXJWMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cg0SHVNpL6K1s0aMQzdofN5+m4UejwNqF9569jVX9yid/jmvD
	suuQfm9tHm+bs9D9zlMPGFB75nFMlHnPPlrrYgdxcXj6OqK5STB9Q+o6
X-Gm-Gg: AYBFou0pPCGtnyP/6UE5Js6f0D7LMGoufHtUV1XugW0uiK4Goy9JuovKGQaZnrl9RwM
	WfZ8YGOc13wmWgyqQW5899+5u++BhNSGg8EpWVymmPhWleaK41iND/OvRxzceM3EY0mrmXs6rFE
	838ws44gxhdHbRJ1fhsWcqofEzw5EvycKL+DgIoHFOTCENggBImRkCy5c3XGinEq1xPkAAn7rrS
	1bxUJIEazcyi0KTc8jsqGKZZ8srsidnrYmNaQqvZPP5If7GyQQkD7tDvl5U1nyZ1ZUH2XsgrIHZ
	mEo5aVa+/JPsaoxfP84J9BipfgJDP+/G0Sx90GgNv04AxIRacGl1L56oMeV6NtcqGKUFa0lfuUB
	WguqOOurZUwjEKXQBR3nY6Zl+VToL6PDbOX1U3by3dLQFjz61DuSXasuWBs4PA5thI5NpinOTGs
	cF/aVmlBVEw2fqGN5WmvyNLzvQR9msTbuIOPBPqJxQCQWLGhPrnfrBaqLPuOZb728wFkGQTLaxt
	6KaUL96mMtxTESlKxuDbdciCt2jDHIHp3uu3aLctfqiV/xqvuZ573AdMvOyweW7hD8XFDF1LJg4
	P27sty8yQfT0+jXYKQHPLVFhN9ocHrtZLSRerXqdnCMlHvyWac9vPnEAyC0p6BRS5EmUAqQ3pTF
	AICSuKnouP+SmOY/CQoFUuEcZX7Ff4pFeww1f+/Pd58MSqkshMxYWOpGRvsbyY16Gy5dnz5glJy
	A=
X-Received: by 2002:a05:690c:86:b0:8b3:2445:889b with SMTP id 00721157ae682-8b3a81d8df2mr17180577b3.91.1794404985437;
        Wed, 11 Nov 2026 05:49:45 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm44519817b3.34.2026.11.11.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:49:45 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: allwinner: add Radxa Cubie A7Z board
Date: Wed, 11 Nov 2026 10:49:16 -0300
Message-ID: <20261111134919.90264-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree for the Radxa Cubie A7Z. Describe UART0, the AXP318W
PMIC over R-I2C0, MMC0, RTC and the bank supplies. It is based on the
Cubie A7S DT.

Unlike the A7S, this board uses BLDO5 for PG and a SY8089 regulator for
the PMIC's BLDO and CLDO inputs, and the microSD card-detect line has an
external pull-up, so no internal pull-down is used. ELDO1 only supplies
VDD2L for LPDDR5 and this board uses LPDDR4, so it is not described.
SWOUT1 only feeds ports D and J on the 40-pin header, so it is not kept
always-on.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7z.dts   | 286 ++++++++++++++++++
 2 files changed, 287 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 792152525b43..2eee91dcbd77 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -69,3 +69,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
new file mode 100644
index 000000000000..ab3d3d70f9ff
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7z.dts
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Radxa Cubie A7Z";
+	compatible = "radxa,cubie-a7z", "allwinner,sun60i-a733";
+
+	aliases {
+		mmc0 = &mmc0;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_ps: regulator-system-power {
+		compatible = "regulator-fixed";
+		regulator-name = "ps";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_ldo_input: regulator-ldo-input {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo2v5-input";
+		/* SY8089: 0.6 V * (1 + RP11 / RP6), 30k / 10k. */
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_ps>;
+	};
+
+	osc32k: osc32k-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu4 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu5 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu6 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&cpu7 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	/* PF6 has an external 10k pull-up and reads high with a card. */
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
+	disable-wp;
+	max-frequency = <50000000>;
+	no-1-8-v;
+	vmmc-supply = <&reg_swout2>;
+	/* The 3.3 V path uses VCC-IO; no Port F voltage switching yet. */
+	vqmmc-supply = <&reg_swout2>;
+	status = "okay";
+};
+
+&osc {
+	clock-frequency = <26000000>;
+};
+
+&pio {
+	vcc-pb-supply = <&reg_swout2>;
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	/* CLDO5 feeds VCC18-PF; the 3.3 V path uses VCC-IO. */
+	vcc-pf-supply = <&reg_cldo5>;
+	vcc-pg-supply = <&reg_bldo5>;
+	vcc-ph-supply = <&reg_swout2>;
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_bldo1>;
+};
+
+&r_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+
+	axp318w: pmic@36 {
+		compatible = "x-powers,axp318w";
+		reg = <0x36>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		aldo156in-supply = <&reg_ps>;
+		aldo234in-supply = <&reg_aldo1>;
+		bldoin-supply = <&reg_ldo_input>;
+		cldoin-supply = <&reg_ldo_input>;
+		dldoin-supply = <&reg_ps>;
+		eldoin-supply = <&reg_dcdc9>;
+		ips-supply = <&reg_ps>;
+		vin19-supply = <&reg_ps>;
+		vin23-supply = <&reg_ps>;
+		vin45-supply = <&reg_ps>;
+		vin678-supply = <&reg_ps>;
+
+		regulators {
+			reg_dcdc1: dcdc1 {
+				regulator-name = "vcc-3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-name = "vdd-sys";
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-name = "vdd-cpub";
+				regulator-always-on;
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-name = "vdd-gpu";
+				regulator-always-on;
+			};
+
+			reg_dcdc5: dcdc5 {
+				regulator-name = "vdd-cpul";
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				regulator-name = "vcc-draml";
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				regulator-name = "vcc-dram";
+				regulator-always-on;
+			};
+
+			reg_dcdc8: dcdc8 {
+				regulator-name = "vcc-ufs-io";
+				regulator-always-on;
+			};
+
+			reg_dcdc9: dcdc9 {
+				regulator-name = "eldo-input";
+				regulator-always-on;
+			};
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc33-lcd";
+			};
+
+			reg_swout2: swout2 {
+				regulator-name = "vcc-io-card";
+				regulator-always-on;
+			};
+
+			reg_aldo1: aldo1 {
+				regulator-name = "vcc-pl";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds0";
+				regulator-always-on;
+			};
+
+			reg_bldo4: bldo4 {
+				regulator-name = "vcc18-codec";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo5: bldo5 {
+				regulator-name = "vcc-pg";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-name = "vcc33-18-usb";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo2: cldo2 {
+				regulator-name = "vcc18-hdmi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-name = "vcc-pll-dram";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo5: cldo5 {
+				regulator-name = "vcc18-pf-pc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_dldo1: dldo1 {
+				regulator-name = "vcc-efuse";
+				regulator-always-on;
+			};
+
+			reg_dldo6: dldo6 {
+				regulator-name = "vcc-ufs";
+				regulator-always-on;
+			};
+
+			reg_eldo6: eldo6 {
+				regulator-name = "vdd-cpus";
+				regulator-always-on;
+			};
+
+			reg_rtc_ldo: rtc-ldo {
+				regulator-name = "vcc-rtc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&r_pio {
+	/* PL powers the PMIC bus itself; firmware must keep ALDO1 enabled. */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>,
+		 <&osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
-- 
2.43.0

