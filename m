Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D06251A15E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750505; cv=none; b=c7xMqGbzA/oLlAMredj+kyn9KG18O9uuL/d1+6MGNSqkVs8tUDXe2sBof3uMMqOnA3X13+RWleX7I9rt+U7TlohK0TIh6OFSUDNU1/HqcciWIg0YHlsSmAZ8fgvZW+j3VVt4P1bz6FQwtU0eHU+b6tSwldT3dPsEjLpmVsXoDrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750505; c=relaxed/simple;
	bh=Tux15efZ2YcNvW9ry8usvdg2zR/J+JAW9ljaXl5e2lE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X3yX30T6sGxf4pZ1AIiF2yPI9wvXEkQ+eBqjFNJKNPp1ZBQwQ6YwlO2RGKPUxF71DdtwtuSyt+qpqmaOFNzswTsgoVHCfa/ZqtALpGyYSGBDjNCviy9aBYMw76VIT0sjJu/S82Djz5RUQ0YCzYEjZWQP/oZxCN6bk98Tmh31z8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLj6eYRK; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLj6eYRK"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so739587a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750502; x=1790355302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro54w7H8jC6p+K00CHwfdPRGov797nGcof5Jb8mK1zs=;
        b=CLj6eYRK02szPdK2HmHVMZAiZw/Wsqj/131QLkf6OZ1aPtUNzQdRnC+5CsgemfjCb5
         QOcK4UPRCMyJ1fCgzJdEnoWZtOKaNlgiqtZXfNZAUt9/pHTW37N7D0H75ND0pDGjrq4Q
         xHONXZ6MAIyBVyK/P6sB4KaCsTRmYHb2kuc6SkI6jzveU8qz93e6aOAPvWRB3Y+tciPl
         KbWR/nJ0gx/ylgdZApdccZSur5hrCHRHTa4UHfzwm2LgsEhdzn5beIMmD7494AkvpB9w
         822bJOJLbsDNzavpcZFOUOUBmeQAqGODlxtO7ZydL6391VfaR0jI2vYZhcr4uxcrSmte
         uEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750502; x=1790355302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ro54w7H8jC6p+K00CHwfdPRGov797nGcof5Jb8mK1zs=;
        b=Ft9D76xjrTpHSpp6c3D0QYZv9BTSc/uV3j5IXhX+jGMDkUfqEXqzeBkpFYO6nbKnAl
         Iy8k90xtqPbLR3HW8eWAEPf/l4lBErCGzY6rlMxylIgfqw6ZS9hehQ4nBixlpusYFV7a
         9jozb+GS3vc3l+87l/H6+ECRuW8hLgfox9/0ciQQjgOyy10KgKk3hS+pfbXD4UA+sV3y
         SCrmFC+FuO3wCa3c58yELujOA+PLxJYxPUOFUsuCxul90wWCQ2C7g/CN1B92oyNbv+NV
         OQLf7ECqmYOrTDV8AUuGsFOrE/vi8ObeEqKucAHFd9zhh/yInDL7p2nS5bsmN3g95J3N
         wS1A==
X-Forwarded-Encrypted: i=1; AKwUvBy1YKH+RHo9sqt0gLoMvn1H52rWQFocpyTM0IG3yXfKWXrg5cvV7rDFSpJRx/AvEBvUfwkiecrO5uChdss=@vger.kernel.org
X-Gm-Message-State: AFuF++lAXM3o9iCwkl++wGDIQUEPwrbxAZGX+oFFjHTrSdrf+y3y68OZ
	+S7Jp4wBo84mCiS72arC7V0Y2AtcVNmtMCh7pflgK8cCeZ0Th3OlOWYz
X-Gm-Gg: AYBFou2lUMjx/ML1ouhesRm+mPIn9l/oMaLnKcAR9Y/p6hJ5esJWFV7ndgQQtCNQCKZ
	GYnNrwRHEi7hTXgHdki0JhZjhOUiO1ZJ0c9CLVsWE6JcEsGV4iig2raB3kKM/rN+hcgi6bkaM3c
	mjGI7fgbg24nGVUiRyEu8xV71OfcW+akQTnyjNujP6qlGA1n/29gW8+QPv/gL70U/MNJzr08V/Q
	/JFRwxboXRH5GeLgQtF55zajwwULMfdn1VhNaHjM+kFqwodF6jCFwUFyh1xlF145506hZYgTiG0
	Rzt9M+i2nLrweP0/Y2A3sZxaPrOv/z01uEG8WR4JpBYZNGBcWFoFH2amFUWQMxbmcU+4J9+eEvD
	JEgyKwP1xsPIScIVJzyvHY963dxgacPhVPpYoLN5HFaUJm4RxxU9X9de71DDWPd9N6cvycpyZI1
	iQUnfrdLZKr6Le8jhPQLuUiKHLTeLaSnrA+oZKvITql03gGl8PeOd/Yjag4QWATE8=
X-Received: by 2002:a17:90b:398c:b0:39e:1c2c:1d4b with SMTP id 98e67ed59e1d1-39e54bcd0a9mr6865180a91.11.1789750502131;
        Fri, 18 Sep 2026 09:55:02 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:55:01 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 4/4] arm64: dts: allwinner: add Teclast P85T tablet
Date: Sat, 19 Sep 2026 00:54:14 +0800
Message-ID: <20260918165414.1129076-5-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Teclast P85T is an 8-inch tablet that was announced in 2023
based on the Allwinner A523 (sun55i) SoC.

Hardware summary:
  - Allwinner A523, 8x Cortex-A55 (2 clusters)
  - 4 GiB LPDDR3 DRAM
  - 64 GiB eMMC
  - microSD card slot
  - AXP717 and AXP323 PMICs
  - USB-C port wired to the USB2 OTG controller
  - combined WiFi and Bluetooth module based on AIC8800 (SDIO+UART)
  - 800x1280 MIPI-DSI panel (not supported in mainline yet)
  - Silead GSL1680 touchscreen
  - MiraMEMS DA280 accelerometer
  - AXP717 battery/charger
  - USB-C OTG port (also for charging)
  - secure boot, but takes any key

This initial submission enables only what mainline supports today:
both PMICs, battery/charger, GPU (Panfrost), eMMC, SD card,
SDIO WiFi (can be used with out of tree driver), USB device (without
otg function), UART0 console, UART1 Bluetooth, I2C0 touchscreen, I2C1
accelerometer and the RTC with the external 32 kHz oscillator.

Display (DE/TCON/DSI), PWM backlight, audio codec, camera (CSI/VIN)
and LRADC keys are deliberately left out, as those blocks are
not supported in mainline yet.

The tablet uses secure boot, so it needs a signed TOC0 wrapped image to
boot, but it has no key hash burnt into the efuses, so it accepts an
image signed with any key. U-Boot support in progress.

Later, a tablet with an Allwinner A537 processor and 3 GB of DRAM was
released under the same name. This version is not supported by mainline.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun55i-a523-teclast-p85t.dts    | 420 ++++++++++++++++++
 2 files changed, 421 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index aa21f58a4..7025ba959 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -63,6 +63,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-h.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a523-teclast-p85t.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts b/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts
new file mode 100644
index 000000000..38a9c98ec
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2026 Mikhail Kalashnikov <iuncuim@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sun55i-a523.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Teclast P85T";
+	compatible = "teclast,p85t", "allwinner,sun55i-a523";
+	chassis-type = "tablet";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+		constant-charge-current-max-microamp = <800000>;
+		voltage-max-design-microvolt = <4400000>;
+		charge-full-design-microamp-hours = <5000000>;
+		energy-full-design-microwatt-hours = <19250000>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	ext_osc32k: ext-osc32k-clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "ext_osc32k";
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&axp717_adc 3>, /* vsys_v */
+			      <&axp717_adc 4>; /* pmic_temp */
+	};
+
+	reg_vcc5v: vcc5v {
+		/* board wide 5V supply from the USB-C connector */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_pio18: pio-18 {
+		compatible = "regulator-fixed";
+		regulator-name = "pio-18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_vmmc1: vmmc1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_aldo3>;
+		gpio = <&r_pio 0 7 GPIO_ACTIVE_HIGH>;	/* PL7 */
+		enable-active-high;
+	};
+
+	wifi_pwrseq: pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&r_pio 1 1 GPIO_ACTIVE_LOW>; /* PM1 */
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@40 {
+		compatible = "silead,gsl1680";
+		reg = <0x40>;
+		interrupt-parent = <&pio>;
+		interrupts = <7 9 IRQ_TYPE_EDGE_FALLING>; /* PH9 */
+		power-gpios = <&pio 7 10 GPIO_ACTIVE_HIGH>; /* PH10 */
+		touchscreen-size-x = <1786>;
+		touchscreen-size-y = <1128>;
+		touchscreen-inverted-y;
+		touchscreen-swapped-x-y;
+		silead,max-fingers = <5>;
+		avdd-supply = <&reg_cldo2>;
+	};
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	accelerometer@26 {
+		compatible = "miramems,da280";
+		reg = <0x26>;
+		interrupt-parent = <&pio>;
+		interrupts = <7 11 IRQ_TYPE_LEVEL_LOW>; /* PH11 */
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_cldo3>;
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_vmmc1>;
+	vqmmc-supply = <&reg_bldo1>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	wifi@1 {
+		reg = <1>;
+		interrupt-parent = <&r_pio>;
+		interrupts = <1 0 IRQ_TYPE_LEVEL_LOW>; /* PM0 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_cldo3>;
+	vqmmc-supply = <&reg_cldo1>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&pio {
+	vcc-pc-supply = <&reg_pio18>;
+	vcc-pe-supply = <&reg_pio18>;
+	vcc-pf-supply = <&reg_pio18>;
+	vcc-pg-supply = <&reg_pio18>;
+};
+
+&r_i2c0 {
+	status = "okay";
+
+	axp717: pmic@34 {
+		compatible = "x-powers,axp717";
+		reg = <0x34>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+		vin4-supply = <&reg_vcc5v>;
+		aldoin-supply = <&reg_vcc5v>;
+		bldoin-supply = <&reg_vcc5v>;
+		cldoin-supply = <&reg_vcc5v>;
+
+		axp717_adc: adc {
+			compatible = "x-powers,axp717-adc";
+			#io-channel-cells = <1>;
+		};
+
+		battery-power {
+			compatible = "x-powers,axp717-battery-power-supply";
+			monitored-battery = <&battery>;
+		};
+
+		regulators {
+			/* Supplies the "little" cluster (1.0(?) GHz cores) */
+			reg_dcdc1: dcdc1 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1160000>;
+				regulator-name = "vdd-cpul";
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-always-on;
+				regulator-min-microvolt = <920000>;
+				regulator-max-microvolt = <920000>;
+				regulator-name = "vdd-gpu-sys";
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-always-on;
+				regulator-min-microvolt = <1260000>;
+				regulator-max-microvolt = <1260000>;
+				regulator-name = "vdd-dram";
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-name = "vdd-dcdc4";
+			};
+
+			reg_aldo1: aldo1 {
+				/* camera sensor AVDD */
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-name = "avdd-csi";
+			};
+
+			reg_aldo2: aldo2 {
+				/* camera sensor IOVDD */
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "iovdd-csi";
+			};
+
+			reg_aldo3: aldo3 {
+				/* supplies the I2C pins for this PMIC and the WiFi module */
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-pl-pm";
+			};
+
+			reg_aldo4: aldo4 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-pll-dxco-avcc";
+			};
+
+			reg_bldo1: bldo1 {
+				/* WiFi module 1.8V */
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-wifi-1v8";
+			};
+
+			reg_bldo2: bldo2 {
+				/* WiFi module 1.8V */
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-wifi-1v8-b";
+			};
+
+			reg_bldo3: bldo3 {
+				/* camera sensor DVDD/cameravdd */
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-name = "vcc-csi";
+			};
+
+			reg_bldo4: bldo4 {
+				/* camera sensor DVDD */
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "dvdd-csi";
+			};
+
+			reg_cldo1: cldo1 {
+				/* codec CPVIN, SD/eMMC 1.8V IO */
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-codec-sd";
+			};
+
+			reg_cldo2: cldo2 {
+				/* touch panel supply */
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-ctp";
+			};
+
+			reg_cldo3: cldo3 {
+				/* SD/eMMC VMMC, codec VDD, UART0, g-sensor */
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-io-mmc";
+			};
+
+			reg_cldo4: cldo4 {
+				/* LCD panel supply */
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-lcd";
+			};
+
+			reg_cpusldo: cpusldo {
+				/* supplies the management core */
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdd-cpus";
+			};
+		};
+
+		usb-power {
+			compatible = "x-powers,axp717-usb-power-supply";
+			input-current-limit-microamp = <1750000>;
+		};
+	};
+
+	axp323: pmic@36 {
+		compatible = "x-powers,axp323";
+		reg = <0x36>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_aldo1_323: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-aldo1-323";
+			};
+
+			reg_dldo1_323: dldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-dldo1-323";
+			};
+
+			/* Supplies the "big" cluster (1.8 GHz cores) */
+			reg_dcdc1_323: dcdc1 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1160000>;
+				regulator-name = "vdd-cpub";
+			};
+
+			/* DCDC2 is polyphased with DCDC1 */
+
+			reg_dcdc3_323: dcdc3 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdd-dcdc3";
+			};
+		};
+	};
+};
+
+&r_pio {
+/*
+ * Specifying the supply would create a circular dependency.
+ *
+ *	vcc-pl-supply = <&reg_aldo3>;
+ */
+	vcc-pm-supply = <&reg_aldo3>;
+};
+
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc24M>,
+		 <&r_ccu CLK_R_AHB>, <&ext_osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+	assigned-clocks = <&rtc CLK_OSC32K>;
+	assigned-clock-rates = <32768>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&uart1 {
+	/* Bluetooth HCI, 4-wire with RTS/CTS */
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usb_otg {
+	/*
+	 * The USB-C port is the primary power supply; VBUS control is not
+	 * wired in mainline (AXP717 has no drivevbus), so the port can only
+	 * act as a USB device powered from the host side.
+	 */
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_vbus-supply = <&reg_vcc5v>;
+	status = "okay";
+};
-- 
2.55.0

