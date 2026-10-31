Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413621;
	b=FYWYAi8frvzLWhx8OoHrW3nkTim/CIS3+llHaxR/HxBwVOe2WzusgoxVrhIyry6+ANJh
	 rFkHcTHok0N2xYtjzZM2njEz4xpJlui39zUsfUd9stHlFg9fZZZIPIg7QHxlODfVNYSur
	 e2FONXgLDL6oTsPC4rc0q9SUGoo+Q1kDEb3BhVV8J8oeL2jBMhb3QGbRtlK8+X9igDgP2
	 NQ2T8pJwXu4VcwAZyfU5T47SDK1QZ5PZJeDiX33JnsSqjg54qf1Uc63PLLKav5RQoZMAM
	 jJ6ezPKq3u8GLsUgs4Yd9NpfKM6jTOzwAH6FgyA1j6GiV+aDsOn7qPtR5FF+vPmutVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gupym1n+xeYfXlKxr4mVV1r8LeK87CtMgPULEvE3iVc=;
	b=0viVVxEbG1m5usuxKBq8e4mrv7fcR/gNu2BMDR2/+QNE7q/q4KFRAN6eyrN6wBe69r6m
	 5Sb6/4cFRQflhpP609lRsus2yfY1L3+QNa2Ign/Ln4nrIQMgEqJ1M/KlZflZXcQBcV+s/
	 FN266Ee/N/ed24JpZ0Lf40qXMGrv674fz11aM0yObK8HzXDUuyOLgu0AoukucB9xRsKyL
	 NAsS8NX7A1M0gzijLMMlowUA9xoYU9SW2AY/31oPmW39xndkBCbnrNKnKTf/04uIz/vwc
	 Lvb0lYbsrkIsfHTTUlv3wfpB2JU6AnQOupEcQsfd2WMjVryIPfIweBWdFhUgypxc/Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVxOmS9O;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF01606A329
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF01606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVxOmS9O
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6aa9606ddadso1047414eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413619; x=1794018419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gupym1n+xeYfXlKxr4mVV1r8LeK87CtMgPULEvE3iVc=;
        b=XVxOmS9OdonU/MYcK+/aI70tR+rw8NSM9QLWa9a+f5NUja5ORZb2x54RN7lUY0p6sA
         s0WctjX2akC11IgSWYpJ3T3CxqvnlfLWeZ/hvBZUT2vj6slFW8ZE6Is5cwb79QhM3B9i
         r66W8MEXRktgyZozPRkxAlJdGVv1M4SdIHrEDErG/OXhNtThhPo087sfpXO+hp6uMwX+
         YYnUG/quz14XH8pRO221mxx9A5w1P20ym3IZExCrgoHYj0eoKGc0fdhKQNRhazAg769+
         WmhzyJ9g0MXQt+Mz7H7KKNHjGFeZ/dP3Em5GLkI0fwgBeTNaVldC1zW5OtuZYgOnU8jg
         lCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413619; x=1794018419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gupym1n+xeYfXlKxr4mVV1r8LeK87CtMgPULEvE3iVc=;
        b=bGsRqNarMcGQllBahourvSDvDHEsHnWMvoEC3HhHUHkYAEq/7fyNhQQ7aTcuFeBwUm
         OrZ8GaKnJc3OCsO/Kg0merhQXbaOqQIsmrMn3ZWPoghu7pM9Ok4B0RLmoVvoLsUXBHNG
         j8Kb9bwI1HGK5AJR0fJ8P9FWySg6NZeu7vO7VvLRsMtjNxmyAtgDEf/1pXaC82Ta+Tbb
         JFvrY37WebUpvDuWhM8oOxoWiY92fABfBCNPMCk024zLXO/urJcCv66jkEqutek4CZCb
         V+YI/O9JidrQXRkKIIqSCqfO+ZGSWa/K+u3NYH/0kzWgi2HZX9aRfalPubMMspxAyPAo
         3zww==
X-Forwarded-Encrypted: i=1; AKwUvBzlZZkak9J3RfaGPm5izCZISttukg/vTdSXfhnOUtox/wYh4BzSAfwizBb/2VlUtoRLDGreKha+yBE5B6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5Q4WJxYOUnCjDQAUDA6KGQSAhmWigLPFghcwSO0NPluZ2qU/G
	1LYlWfw5rHK5aBQ8dC1ChJbNzGnLh15oeofMdLoOE+30/OjiTc/jkQRG
X-Gm-Gg: AYBFou0UZjiob+EOj0eC9YCCph+ElT7Oc52nnHxdHamsUpcfJwYwMDc+FfzKmaKGDts
	jzPc23u8TxyVHJwQnAicUYg1N0UKTb0DNUsqUkV8TMYsUmmHO2QNbiFlYRv/LvKFwgnao9Hu6E1
	e6IBjvToon7EwfOA223korfpr9x/zn6Z5vZJoZeAlrFjJdoM7bR6UzqLDzXha81GXalYprSfiGS
	AfggTME2fKgSBhWoDxoIibkQRi2pCNsYau7Y4S7Q2GUX6eF/GWMEFrOfGNS7PUFR+SOxXgmJ4/x
	vG8PndchrA0VxjJ9rL7gps1A/1QnsxDstu3dX1HhAvU5O7yMBlzbyJ8BGUE+IMhID4tyZLiNAPu
	82GQlaVniJYb8BpWf7jzK5hP8eKHoC0JQSF/aI5Sn39Jp9LupAY8q/Prg4wYgnf0POuQeaTDVjt
	D8iqHXCp0CDVyaP17cxmFpAa+/JuQWckEXTV92gnu/pPtNg6c7TxS6SjacCiTqynYKLiVyt4TQN
	AMowC808O/3eC2joyczWam0q778VEzYbwypR0oPiAmmC9yfh8g/VLWF52Ojxg997ZfhthPr2Nip
	nhtULCa788E5jAzuz/vEh1JqoS5SiGpbN9lnJQgr+aBlH8apMyPvoIM6hIYUn0ivSWliB0OoE0l
	9X3sJeRmJNAPyg2s9YaBDpxBsjVk=
X-Received: by 2002:a05:6820:1384:b0:70a:12a9:c43d with SMTP id 006d021491bc7-714f2988c22mr2274753eaf.22.1793413619538;
        Fri, 30 Oct 2026 19:26:59 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354d12f2sm3401232a34.17.2026.10.30.19.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:59 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Fri, 30 Oct 2026 22:26:57 -0400
Message-ID: <20261031020640-263f7b05-a7s-dt-v2-3@gmail.com>
In-Reply-To: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
References: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Supply the 26 MHz crystal and 32768 Hz RTC input, enable UART0 and the
AXP318W on R-I2C0, and describe the schematic's PMIC input/output and
CPU supply connections. Preserve firmware settings on rails whose
working voltage is not established. In particular, BLDO2 has no
programmed voltage constraint: its software 3.3 V selector does not
establish its physical output with the schematic's nominal 2.4 V input.

Describe the card's SWOUT2 supply and PF6 active-high detect with an
internal pull-down. Enable MMC0 at up to 50 MHz using 3.3 V signaling
only. Its high-voltage path uses VCCIO; CLDO5 also feeds PC and the PF
1.8 V input and must not be raised for SD signaling. Firmware must
select the 3.3 V PF path; dynamic voltage switching is not provided.
Keep other storage off.

Connect the documented bank supplies. PL's self-supply phandle is
omitted to avoid the PMIC/I2C/pinctrl bootstrap cycle, as on the
upstream Cubie A5E; ALDO1 is retained always-on. The separate pinctrl
fix is required so these connections do not trigger incompatible one-bit
bias programming.

AI assistance: Codex:gpt-6-astra.

Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 284 ++++++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d1f768dd6461d5a40537473fc62da6ba6a0d82c0..792152525b433b0caa5118ed2669f548835717e0 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -68,3 +68,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
new file mode 100644
index 0000000000000000000000000000000000000000..341c24360ce29e29f8fc4631924eaf48b7b1f809
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Radxa Cubie A7S";
+	compatible = "radxa,cubie-a7s", "allwinner,sun60i-a733";
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
+		regulator-name = "ldo-input";
+		/* ETA3521: 0.6 V * (1 + RP298 / RP299), 30k / 10k. */
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
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)>;
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
+	vcc-pf-supply = <&reg_cldo5>;
+	vcc-pg-supply = <&reg_aldo1>;
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
+				regulator-always-on;
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
+			reg_eldo1: eldo1 {
+				regulator-name = "vcc09-vdd2l";
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
2.53.0

