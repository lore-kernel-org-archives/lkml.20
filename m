Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58677397E9A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521963; cv=none; b=nQeF1gf5R/iPPI31IKfmVG/XVsfjWk8mwkZzjTK52fhXc9OmPzorNHTeuxjn6281kPDiocHSY98qs+YoWGDCm2jkWyg8R7b9kPSsDUh6B/dKb9HA6+HAcIKYDDKHVbGvGSess01veu+0xROpgZlQ8RwtYas909gx501Ci1Edi88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521963; c=relaxed/simple;
	bh=8EOWWwnuhjdj2NBdmDHi2y9qj8C4h6LlxK00gi7W808=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SV/502qD+VLMGRe641UcLFVof/WH3SqOQ86Ia6rqQydogqVzVkXas+IbJ7mRLRSGrlcF+EmnS7W+3racgXQw50f9Q1yBx+d0nG9MCl9eMzvbRWEzbmWU8iCIza/B1SOWOPpuf1J1lE7ZpDR7FvVGCvKx0LNIHIJ66zgFp9XIUsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvM+ysyP; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvM+ysyP"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b926f0so1140582f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521958; x=1791126758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kp1PQqGUGWpZxUys5pByJrwoE69ft+7LJPagJSESpNs=;
        b=nvM+ysyP5fqUiN3Z6rZbGhv7YjUSPSfAVOW4r2ZwyD7AcQYsTev7dwO3LqyCHkcepG
         bqF7uPdsRCuotshlhdfFyFWuicZf6cb50yVPFN277HCHkPZNcyz6PHZ5d+mEp5JrHNGw
         haj0NINkOcGpFY3ORS6ZNDzGHJNu7In/oCRsRQvpGYxWfAeXBHpFQjZHCZu7+HorscBV
         fFb4VmdYMiTYdP8anbAa8gzlz9t1474ZJWjxvncfTvYdDN7zN5p5rGb2cjqFHTKobQTp
         bb4qWygCOXFbm55x6uqfXQn/EvWBZFlDCXbDYtiaq4BRYOshvbCg1GkDYHT/e3Nmj79j
         n9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521958; x=1791126758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kp1PQqGUGWpZxUys5pByJrwoE69ft+7LJPagJSESpNs=;
        b=rzvmC51fgrCN6vOi14LMyiEvZ1vDnWdzRd6mKgUMrYdnoJohRb8Ev2jmb9AB/K197J
         vRVNK1aF9ul+oLg3kHD9xThAJGtYhYHcErMCsKkLxT4X8pWUcMJtZSKRAy3Rkh5BVdbh
         bBV/cr1R/NvRA0jY8KWOWr1UyFnh1ocnuVW8gaWNedDYdK/Psbmwl2kOjvnWnmQiY5Xm
         7WxALcfVnt0JmxlG41gtNd7tBvG24Wxbpj4zmDsTNxfBqw9qAUFfRF+BUSGPeMQbGfM/
         hVuBMmYcqM3i9XDtI5PkmWxgO+h0UxS2xHmTqFGyHTnc5ca71uEJEDxtoXu2NG/JGNGr
         o5iA==
X-Forwarded-Encrypted: i=1; AKwUvBzNa6okKapIjn33zSdVxlUoc+M8hSOi/8YsmgUxQfesJs9pMzCLxXgyq6KOKumSY/5DwlZ16lfwkBiucpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhzCBUFdXf52g1N12SepTQ3j83VQ1x3RrRZ1Eps7QLxYbADSCY
	T1jMZDWdXYUnPuhX8jZvfX5HDREISuNVyYRQQ6rvjykUS3U5hSxOwxQ3
X-Gm-Gg: AYBFou3mvkFbnHkS15QiqmLxHL0M7n1ZIJYQq/xIkhjCOJPTQNrBCwcxyrqb/1eqjNm
	fDiGGXg3C2fcV4EUToGR0V+83kgoBH2gxyLm9qFx0LQ8h/Ycbz2Xog87CiEwC5lQQRyo/lomP0i
	sgeUuDjMZM3RjTYIXiDVcdSyD27kUe56UBnEFsM1wc0TaaWs9/OhbrEvTmxjlqEqhlJ5Mh6GQas
	NXi+JTDopnadGiEpzZuhMDF/H/wCVcF1bDW6crhseGOLx3Yh73NXu/AWKCNiMGSKVoI+4LIESy6
	McthzVTRrSNlQd46oDT+ud95J1xszkWGhzUdIiOjNPXgrqkPuGIGWTLQu4g0C8hicbHYnuKNDQk
	vFaRDjhcsPtpqr84VAQFscG7W8He3RHi5ZRh6PeVwCqKZ/tYZCgBaEzofAFdY1hPiMFzFWfZFXQ
	BdOm/+6aXsFZ0KsFPf7Ku997RlKDyGipWXjzBedHBlLV7e0qN4qFEHYUEt8zmImx/DqUix7y7Jg
	i2veyfznZAaQwsJfcOiPopYQ4ibW8Rdl3s7lhyp2Dw=
X-Received: by 2002:a05:6000:2999:10b0:488:7dc6:4e9 with SMTP id ffacd0b85a97d-4887dc60767mr9344511f8f.10.1790521958532;
        Sun, 27 Sep 2026 08:12:38 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:37 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 11/11] ARM: sunxi: add B288 and the PocketBook Verse board
Date: Sun, 27 Sep 2026 16:10:16 +0100
Message-ID: <20260927151016.186493-12-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm,cpu-registers-not-fw-configured is required: Allwinner's boot0 sets
neither CNTFRQ nor CNTVOFF, so the virtual timer storms. Same reason as
commit 121b96cd9d7e ("ARM: sun6i: Enable ARM arch timers").

The watchdog interrupt was measured on hardware via GICD_ISPENDR.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-b288-pocketbook-verse.dts | 122 +++++++
 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 304 ++++++++++++++++++
 arch/arm/mach-sunxi/sunxi.c                   |   1 +
 4 files changed, 428 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 75b2b6a2f7a6..2dfdc01e4825 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -227,6 +227,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a83t-bananapi-m3.dtb \
 	sun8i-a83t-cubietruck-plus.dtb \
 	sun8i-a83t-tbs-a711.dtb \
+	sun8i-b288-pocketbook-verse.dtb \
 	sun8i-h2-plus-bananapi-m2-zero.dtb \
 	sun8i-h2-plus-libretech-all-h3-cc.dtb \
 	sun8i-h2-plus-orangepi-r1.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts b/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
new file mode 100644
index 000000000000..91c89d5a097e
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * PocketBook Verse (PB629), an Allwinner B288 based e-reader.
+ */
+
+/dts-v1/;
+#include "sun8i-b288.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "PocketBook Verse";
+	compatible = "pocketbook,verse", "allwinner,sun8i-b288";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x20000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_dldo2>;
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
+	status = "okay";
+};
+
+&mmc3 {
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_dldo1>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	status = "okay";
+};
+
+&pio {
+	vcc-pc-supply = <&reg_dldo1>;
+	vcc-pd-supply = <&reg_dldo1>;
+	/*
+	 * PC and PD are named in the vendor rail list; PF is not. It is not
+	 * on dldo2: with that rail off, a pull-up on PF6 still reads card
+	 * detect correctly, so the bank has its own supply. dcdc1 is the
+	 * only remaining candidate, carrying vcc-io and vcc-card. Derived
+	 * from the rail naming plus that measurement, not from a schematic.
+	 */
+	vcc-pf-supply = <&reg_dcdc1>;
+};
+
+&i2c0 {
+	status = "okay";
+
+	axp22x: pmic@34 {
+		compatible = "x-powers,axp221";
+		reg = <0x34>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+#include "axp22x.dtsi"
+
+&reg_dcdc1 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "vcc-io";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1260000>;
+	regulator-max-microvolt = <1260000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc4 {
+	regulator-always-on;
+	regulator-min-microvolt = <1100000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vdd-sys";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt = <1350000>;
+	regulator-max-microvolt = <1350000>;
+	regulator-name = "vcc-dram";
+};
+
+&reg_aldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "avcc";
+};
+
+&reg_dldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-pc";
+};
+
+&reg_dldo2 {
+	/* Powers the microSD slot (slot pin 4), switched per card scan. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-sdcv";
+};
diff --git a/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi b/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
new file mode 100644
index 000000000000..f5feec87defc
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Allwinner B288 (sun8iw10p1) SoC
+ *
+ * Addresses and interrupts come from the PocketBook Verse (PB629) vendor
+ * device tree, cross-checked against the BSP clk-sun8iw10.c.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/sun8i-b288-ccu.h>
+#include <dt-bindings/reset/sun8i-b288-ccu.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+
+	clocks {
+		osc24M: osc24M-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			clock-output-names = "osc24M";
+		};
+
+		osc32k: osc32k-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+			clock-output-names = "osc32k";
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <0>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <1>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <24000000>;
+		arm,cpu-registers-not-fw-configured;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		/*
+		 * mmc0 is a v4p1x controller, so it runs in the old timing
+		 * mode and needs the sample and output phase clocks. Do not
+		 * give it the sun50i-a64-mmc fallback: that selects the new
+		 * timing mode, which this block does not implement.
+		 */
+		nmi_intc: interrupt-controller@1c000d0 {
+			compatible = "allwinner,sun8i-b288-nmi",
+				     "allwinner,sun9i-a80-nmi";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			reg = <0x01c000d0 0x0c>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		mmc0: mmc@1c0f000 {
+			compatible = "allwinner,sun8i-b288-mmc",
+				     "allwinner,sun7i-a20-mmc";
+			reg = <0x01c0f000 0x1000>;
+			clocks = <&ccu CLK_BUS_SDMMC0_BUS>,
+				 <&ccu CLK_MMC0>,
+				 <&ccu CLK_MMC0_OUTPUT>,
+				 <&ccu CLK_MMC0_SAMPLE>;
+			clock-names = "ahb", "mmc", "output", "sample";
+			resets = <&ccu RST_BUS_MMC0>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc0_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* SDXC v4.5. The soldered eMMC; shares the PC pads with mmc2. */
+		mmc3: mmc@1c12000 {
+			compatible = "allwinner,sun8i-b288-emmc",
+				     "allwinner,sun50i-a64-emmc";
+			reg = <0x01c12000 0x1000>;
+			clocks = <&ccu CLK_BUS_SDMMC3_BUS>, <&ccu CLK_MMC3>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC3>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc3_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/*
+		 * mmc2 (0x01c11000) is an SDHCI-style controller, not SDXC, and
+		 * has no upstream binding. It loses the PC pad arbitration to
+		 * mmc3 and is unused here, so it is left undescribed rather than
+		 * given a wrong compatible.
+		 */
+
+		ccu: clock-controller@1c20000 {
+			compatible = "allwinner,sun8i-b288-ccu";
+			reg = <0x01c20000 0x400>;
+			clocks = <&osc24M>, <&osc32k>;
+			clock-names = "hosc", "losc";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		rtc: rtc@1c20400 {
+			compatible = "allwinner,sun8i-b288-rtc";
+			reg = <0x01c20400 0x400>;
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			clock-output-names = "osc32k";
+			clocks = <&osc32k>;
+			#clock-cells = <1>;
+		};
+
+		pio: pinctrl@1c20800 {
+			compatible = "allwinner,sun8i-b288-pinctrl";
+			reg = <0x01c20800 0x400>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			mmc0_pins: mmc0-pins {
+				pins = "PF0", "PF1", "PF2",
+				       "PF3", "PF4", "PF5";
+				function = "sdc0";
+				allwinner,pinmux = <2>;
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
+			i2c0_pins: i2c0-pins {
+				pins = "PB6", "PB7";
+				function = "twi0";
+				allwinner,pinmux = <2>;
+			};
+
+			mmc3_pins: mmc3-pins {
+				pins = "PC1", "PC4", "PC5", "PC6",
+				       "PC7", "PC8", "PC9", "PC10",
+				       "PC11", "PC12", "PC13", "PC14";
+				function = "sdc3";
+				allwinner,pinmux = <5>;
+				drive-strength = <40>;
+				bias-pull-up;
+			};
+
+			uart0_pb_pins: uart0-pb-pins {
+				pins = "PB4", "PB5";
+				function = "uart0";
+				allwinner,pinmux = <2>;
+			};
+		};
+
+		wdt: watchdog@1c20ca0 {
+			compatible = "allwinner,sun6i-a31-wdt";
+			reg = <0x01c20ca0 0x20>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&osc24M>;
+		};
+
+		uart0: serial@1c28000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28000 0x400>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART0>;
+			resets = <&ccu RST_BUS_UART0>;
+			status = "disabled";
+		};
+
+		uart1: serial@1c28400 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28400 0x400>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART1>;
+			resets = <&ccu RST_BUS_UART1>;
+			status = "disabled";
+		};
+
+		uart2: serial@1c28800 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28800 0x400>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART2>;
+			resets = <&ccu RST_BUS_UART2>;
+			status = "disabled";
+		};
+
+		uart3: serial@1c28c00 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c28c00 0x400>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART3>;
+			resets = <&ccu RST_BUS_UART3>;
+			status = "disabled";
+		};
+
+		uart4: serial@1c29000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x01c29000 0x400>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART4>;
+			resets = <&ccu RST_BUS_UART4>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@1c2ac00 {
+			compatible = "allwinner,sun8i-b288-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c2ac00 0x400>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TWI0>;
+			resets = <&ccu RST_BUS_I2C0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c1: i2c@1c2b000 {
+			compatible = "allwinner,sun8i-b288-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c2b000 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TWI1>;
+			resets = <&ccu RST_BUS_I2C1>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c2: i2c@1c2b400 {
+			compatible = "allwinner,sun8i-b288-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c2b400 0x400>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TWI2>;
+			resets = <&ccu RST_BUS_I2C2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		gic: interrupt-controller@1c81000 {
+			compatible = "arm,gic-400";
+			reg = <0x01c81000 0x1000>,
+			      <0x01c82000 0x2000>,
+			      <0x01c84000 0x2000>,
+			      <0x01c86000 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+	};
+};
diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
index e1b7945aac99..c5b19d0e63f9 100644
--- a/arch/arm/mach-sunxi/sunxi.c
+++ b/arch/arm/mach-sunxi/sunxi.c
@@ -61,6 +61,7 @@ MACHINE_END
 static const char * const sun8i_board_dt_compat[] = {
 	"allwinner,sun8i-a23",
 	"allwinner,sun8i-a33",
+	"allwinner,sun8i-b288",
 	"allwinner,sun8i-h2-plus",
 	"allwinner,sun8i-h3",
 	"allwinner,sun8i-r40",
-- 
2.53.0

