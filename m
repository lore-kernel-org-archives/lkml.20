Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285928;
	b=EoYecL1f2U2zaaLsqwvSgkaz+c4UQaRM5SU4qrIrs8XhTOhTeDdf0zHKKr/tCEoobF7N
	 Y3AjNgYWV7iS/ZtOUfGrUTywcYSX1Q1YopDVu7szEe16BvNnzrtT7wAfwyn8+XrJCYzWl
	 nmYxiDmHoRI9/lbgK9qRrrrcb0Wsv90ZDBC+FcmV3yET2Wlvs17V4CyHKhKcb6UfOeLXr
	 8rgV+bKuWs/NvTPeGWcD13xaDJSC/3G4wGlMDXPxkF/cB4nVXCi450wc1+S8s/X43T0FG
	 AkKPn84NEubxzmxjwsrSnvTL812htwnmljM1UCsdIKvnDSPGYcVGPsYD6zpjWp15TtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WI5auzUgMsI7bnDaCKGTvoflozZvYIXMyJqprDk664I=;
	b=TpDQm+605Y8oh+h5stKEFKPc9NiOWq+FZEZXFhMaLpJ4X3+kKSOcl2LUHmZwINLZ65wU
	 0pcybnLVPdMQz1t/mSgdEQZEBDeZcxweAS4edZaTCAcE9Pmplv+UuXVx9N6RipjGnAJI0
	 HKIPSBikza/XHMH5fWzqBQEVKKMdGXrZEKdfSfDjYT0M8qqQctQ/m1OVQUQbtzvMwYgg0
	 Z7Gy8UFm0Dw4g/DsOQWCkEYiLXV7kER7mHAWtm4HCco61+z5eRYNFSUb8T7V2aGtbwJU+
	 faBj5I0MblcNkO9qt5AFRip6DfWBMIVmFDkWR5lTwNfyOMlA9xeEru7drtBScN9MiWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNG9tPvU;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875160A261E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9875160A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNG9tPvU
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-43bf9548df4so1756363fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285926; x=1794890726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WI5auzUgMsI7bnDaCKGTvoflozZvYIXMyJqprDk664I=;
        b=nNG9tPvUxLtyBo5JXF2SpEOGOJur3gKCIPfZx5/vaIQkv5fB1NG9oHct3On0Ac24fz
         ZvFTbkVJsaVuh5IGv16bEPfqz2/X/+w0s6V1tlXEBBXPvxx/pJqsfOtbEQsfsaKf/Mbh
         XmKtNXNX32QxgtJKZbBwbhrHVjpbw6UqBGfaVpxDkHzWfK20CHeWlaeiAyKfoviEDlNc
         NGu4k0iZpZBfYlbr9ESkx1ZJIY4T3Sy5UohOsdLmOd4l9dMg3wZV9A1VTfXC+BRRpQry
         wFAvoSzR5g0JiTpvUWODd4B38xxPNM7KoBvir7tN4+plteDP1ujg0DlO4WAZzZrKl4Hm
         zK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285926; x=1794890726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WI5auzUgMsI7bnDaCKGTvoflozZvYIXMyJqprDk664I=;
        b=rYBmhxxIUiL1TipfHRLRp/t3p3PvBDpt/flXpYDc5qlU7C/enXejeGZ0uNhkZrLjV+
         6iG9Xupk1H/TljYK47QbZL6vipj1ecaljN4oNEgXdDKKDc2J7gQkf3nUUbyiH8li1bGe
         s+5+v8/BWG3crGHqib74t3J+9CoDDmfqz9DNtn6xv91DSDU5bGD7Mi6ues168JqYFPbs
         Sv1llyzjTDTH0f3Pg2QKsCMQkvaMPP1q7ABNdCA/FQWgej5Dg4mpSg5BWragbjy4LgHv
         i4kAdyBcYhAxdUaALncxX9swwwVzHVzRkE1UeM/0DWS1X4MnnzfoK6JNNgBtq6cxikaO
         b0QA==
X-Forwarded-Encrypted: i=1; AL+hErE8WpLcuqBvv2n0sSbmT4qAFglA14z6TXmyppQdR5YfBy5AYi3YBh1R4mReC8aWVDKk0N1sMZj3iAshYSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sdquQeQhqUVwN6kH704DFpWm+RaXucn12yP4BNL2+Oj0C6+UP
	WOscPDJKIGEmaw3dkquXrLqo3XnXyTnfqz/Ja5q7I7pjGUVsyamx0Ejl
X-Gm-Gg: AYBFou1mQU3AIynILVOJ+loqTUzDPBQvF0ODr6RvP5IJQ+iIPzyEUqsYXfJfWGGPqM9
	9HdONLNp0nWwqkCY1EVJyo7CvKvl/YfR4VjkPsTxTjwMvxTUkV49BnLCLpvCO5yUXpa2fhGABlT
	uELr0lfHdfj1D+4DBEaaEVFz87aM8OT8kRX7FT/3LkDCErT/twul/W9y63Wj7AAom2bpGRkK+fP
	zMYOfX2+bWXw89G8lzjXdlSdF7+wpKrD16lcWqhJPgi8+7m7x7NGJ3fve3kBDd+fDCDbWEHI7XN
	M3jskh5ppg6aqRGVEnmB3rAaIpd4cEUyJAv+M3kqKUpi8TDpwTyvM+1M3GAeK75EbAYD2cJsW62
	UBUirMj+J5hWUiLRWpQQN+njvMYwpg3cFDjEZxpfWrcWBe25vQZgZ/CLvtsm1j+59cfRsShE87J
	UiN+0+xwfxsp2Nf2tWFz1zkJGrDwF9UPEa3i+htsDBcs1bUIK6ag6scNuJLJxjBFWz1aM6CYb/8
	hnzs+G7Q1dM27Qm8pec0VlsehzVVGuJ1HO6o26260hgjn2WVL3kQwDdEb572NuchlPsSmBb1gvW
	+QwzH+nRoG0xXJjgcwkTogjL8n3+8WtrQl/4kG1xDyu7tT+Spv5/DtH90CV8DYnqU/d0vaeo1w6
	TfEYluw==
X-Received: by 2002:a05:6808:1206:b0:53a:ad3c:17aa with SMTP id 5614622812f47-5683cd9c0e2mr1116024b6e.55.1794285926367;
        Mon, 09 Nov 2026 20:45:26 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-568f083d000sm1258723b6e.0.2026.11.09.20.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:45:25 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v3 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Mon,  9 Nov 2026 23:45:23 -0500
Message-ID: <0fe5938e04cc8a5af3825a0e01bd07b626a15b46.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
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

Enable the Cubie A7S serial console, PMIC and microSD slot to provide
an initial usable board configuration. Supply the 26 MHz crystal and
32768 Hz RTC input, enable UART0 and the AXP318W on R-I2C0, and describe
the PMIC input/output and CPU supply connections from the Radxa Cubie
A7S schematic v1.10. Preserve firmware settings on rails whose working
voltage is not established. BLDO2 has no programmed voltage constraint:
its software 3.3 V selector does not establish its physical output with
the schematic's nominal 2.4 V input.

Describe the card's SWOUT2 supply and PF6 active-high detect with an
internal pull-down. Enable MMC0 at up to 50 MHz using 3.3 V signaling
only. Its high-voltage path uses VCCIO; CLDO5 also feeds PC and the PF
1.8 V input and must not be raised for SD signaling. Firmware must
select the 3.3 V PF path; dynamic voltage switching is not provided.
Keep other storage off.

Connect the documented bank supplies. PL's self-supply phandle is
omitted to avoid the PMIC/I2C/pinctrl bootstrap cycle, as on the
upstream Cubie A5E; ALDO1 is retained always-on. The separate pinctrl
voltage-mode fix is required for these bank-supply connections.

These board DTS bytes were RAM-booted on a Cubie A7S with vendor
firmware on November 4: UART0, PMIC registration and MMC0 read-only
transfers worked. Card writes, physical hotplug, 1.8 V signaling and
physical BLDO2 voltage were not tested.

Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 284 ++++++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d1f768dd6461..792152525b43 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -68,3 +68,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
new file mode 100644
index 000000000000..341c24360ce2
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
