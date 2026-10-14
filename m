Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB8949CF27
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962607; cv=none; b=BFGcNck+WK8frOt4g8P1dnZPtAm+7dGgIsdzvhHIlvieh1YAHcs3PE4490p4Hn8q9qI/a4s0IaKcAGD+zuaDcD2h+16q5ZkvTYbG3A9IIZay1tp/pc43p8oKPQG5Q219aMHG2IC7pHQmffzjQielkihtuUy+GQK/RUStWjGvt9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962607; c=relaxed/simple;
	bh=IIYhiUmZqdRiAhQTgEW9kA9/gg2iFsZpmkKtuSuG6Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mR1SOaN+sK5x6UjNPxFB78yJ4h8oGoZ0/kEZQrz3B+BLeT2bShCxMtK7f7CUqGtGoe8TL2FgfGgS5frMioMciVsguM/P+tQ7N211FZ0lCJ+hIrOX5Nv0bGjOU3+NUNxNcWcDkscRaySbLaJMbN6nY/I/YXsEkVuGzbjDj8ENwxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXUej/Qc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXUej/Qc"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso34873545e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962598; x=1792567398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8x9KsBewSFYSs1uygWN9H4G3vWtytmr+Iw9MGOEX/xM=;
        b=aXUej/Qch6B1GllJpPV7WUHusvzwCjfKp4QyXD3/uYD1evcGFB8nrjqqn2toHpZ3cH
         T6P4mdMepE99mhLKV+14VH1Q3sGPvTgiQ7+69VRyGRet1r17Pxyns+iCzymlzSEeFY7k
         K9phven/x/EraXCdayHnMQ7kFJ/LHBmUuRRu+OaR4fXY5k/BbiLHyx79v+Foo5veHaOi
         rQgdeAFn1zgAWl5jdG/MY7obHNgb6Ul2dnC+7awh4096gLDmLED/1OvuQh2fzzM7D34q
         zw9vag1MqcHtU4vBOk0J2wOjkG6BUXjsPr4JsdLFI4q6zUB9O7/GtixXE6fV8C9OLMeG
         XZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962598; x=1792567398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8x9KsBewSFYSs1uygWN9H4G3vWtytmr+Iw9MGOEX/xM=;
        b=rbHI0PVVjzi/qg62kZ22I30XmnEZnZVQxzlMyKfLaYhRwWegf/zGxOTQ6XdGwYpIwF
         a9TPHD7Fv1heDLJyem7YAj9NAHA3R4EHfHLSUfdW5ld6/lQch4ikgVoYvy25Cv4K6rxw
         4tvCaGMqQiYYzDFDnHaj6d2Q0Tyzn7cgQynK2q+dNfIN/cQq/2m+XvQiLJYf+SWA/f5n
         jGJi5gZ3mPyMHjZ3Xjju7E4pPlY59XTpjAYJJOviIM9xfOEbidUGLUKiEMMfquAf3D+I
         eSSSjBa5V6lWrh/DEV7hbBil6dTcQLJlz+MkKqG9duv7jwbfQNuLbSHSIeutCi+LJ8yr
         wkZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx13Kjw/r0wvdmqzgEO7c4vuCDEYJOJRlX0k7YMxWHVeKS/wTL+Bv20GaoX4z/g8R64vdttmd+ekBV3WrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0zm6GmLSwh9UlwZXq+a2SsmqOj2JEMN1zknfHtdyEjKOh7b5b
	3KcesABeC1FbpR+INCZA842mQ60n+O7vH0lfdMZs8s31feckhTa40WSi
X-Gm-Gg: AYBFou0X0ENUYikyjECc4gAH4ZURssumKwfboDXmsWKsgZwcIVI+TCQ7RrLw/2JcUZK
	mSjjK7wT40x1w5usDfocb8AqJv2d4984wEJ0w6wpT5g3KOc8T/gJf7RUH5t4K8q2nrxdz9X2coR
	p8Q31+c4OIpSGP990E225DT39I9bLRDT4RNmVZk3s2RCLD7tAN2KaerItpGM8Ytyk/N1peRWyMe
	WUskYyW9GbjbrfAQzYhhk17zfqqE+G0lgUgxJ8kEOuSXdqA2D4G7yUuWkxr4so3RikAA8Ie8H+u
	zdnuuUY7kjYdpR+vkXVTqCxTNHbpJnACqFAhe1WOZqCNAszIZOyMSq9JJ5xkqvImhzQvU0AqHiN
	uX+g/ajsKTMklN8v6d9R8bziT0uLRFOu2eBz0KsL0HLeRbZANupOsTlqu3pxp/gSTWHX/NmoM4p
	cotbksd+WCMGRZIz6cX8RsCofS6Km9l23TRfrbwGd0ZE5/M7TtfMCZOxLbcauB5NhTpc3HDm9lU
	0VURxwCS2Tt0Aq15BuWRHGMuuqmvpIFJVYr7SiYj737nv+UDRaQCpdfzQWM8DRAKxpQjW1d+R/O
	E4eLoBWwFC7ghtVdTKd/artLkX7OxrvGM0OD971XwqbRL8yKoTPS3BB2qebMxQ==
X-Received: by 2002:a05:600c:4f89:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4a1acaa9f79mr83413695e9.25.1791962598362;
        Wed, 14 Oct 2026 00:23:18 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:17 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 23/24] ARM: dts: zte: Add ZX279128S SoC description
Date: Wed, 14 Oct 2026 08:21:03 +0100
Message-ID: <20261014072109.1759502-24-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the base device tree for the dual Cortex-A9 ZTE ZX279128S SoC,
including GIC, arch timer, CRM clock and reset controllers, GPIO,
pin control, Ethernet switch, MDIO, PCIe PHYs and controllers, SPI,
and DWC3 USB.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 arch/arm/boot/dts/zte/zx279128s.dtsi | 416 +++++++++++++++++++++++++++
 1 file changed, 416 insertions(+)
 create mode 100644 arch/arm/boot/dts/zte/zx279128s.dtsi

diff --git a/arch/arm/boot/dts/zte/zx279128s.dtsi b/arch/arm/boot/dts/zte/zx279128s.dtsi
new file mode 100644
index 0000000000..8896a8b067
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx279128s.dtsi
@@ -0,0 +1,416 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * ZTE zx279128s SoC: dual Cortex-A9 with an L2C-310 cache controller, a
+ * five-port gigabit switch, two PCIe controllers and a SPI NAND controller.
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <dt-bindings/clock/zte,zx279128s-crm.h>
+#include <dt-bindings/reset/zte,zx279128s-reset.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "zte,zx279128s";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		enable-method = "zte,zx279128s-smp";
+
+		cpu@0 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			next-level-cache = <&l2cc>;
+			reg = <0>;
+		};
+
+		cpu@1 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			next-level-cache = <&l2cc>;
+			reg = <1>;
+		};
+	};
+
+	osc: clock-25000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+	};
+
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		sram@200800 {
+			compatible = "mmio-sram";
+			reg = <0x00200800 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x00200800 0x1000>;
+
+			/* the parked second core jumps here on every wake-up */
+			smp-sram@0 {
+				compatible = "zte,zx279128s-smp-sram";
+				reg = <0x0 0x8>;
+			};
+		};
+
+		scu@800000 {
+			compatible = "arm,cortex-a9-scu";
+			reg = <0x00800000 0x100>;
+		};
+
+		timer@800200 {
+			compatible = "arm,cortex-a9-global-timer";
+			reg = <0x00800200 0x20>;
+			interrupts = <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+			clocks = <&topcrm ZX279128S_TOP_A9_PERIPH>;
+		};
+
+		timer@800600 {
+			compatible = "arm,cortex-a9-twd-timer";
+			reg = <0x00800600 0x20>;
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+			clocks = <&topcrm ZX279128S_TOP_A9_PERIPH>;
+		};
+
+		watchdog@800620 {
+			compatible = "arm,cortex-a9-twd-wdt";
+			reg = <0x00800620 0x20>;
+			interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+			clocks = <&topcrm ZX279128S_TOP_A9_PERIPH>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@801000 {
+			compatible = "arm,cortex-a9-gic";
+			#address-cells = <0>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x00801000 0x1000>,
+			      <0x00800100 0x0100>;
+		};
+
+		l2cc: cache-controller@c00000 {
+			compatible = "arm,pl310-cache";
+			reg = <0x00c00000 0x1000>;
+			cache-unified;
+			cache-level = <2>;
+			arm,data-latency = <2 2 2>;
+			arm,tag-latency = <2 2 2>;
+			/*
+			 * As the stock firmware (AUX_CTRL 0x76430001). Without
+			 * shared-override the PL310 turns normal non-cacheable
+			 * shared accesses (dma_alloc_coherent buffers) into
+			 * cacheable ones, so devices and CPUs see stale data.
+			 */
+			arm,shared-override;
+			prefetch-data = <1>;
+			prefetch-instr = <1>;
+			arm,double-linefill = <1>;
+			arm,double-linefill-incr = <0>;
+		};
+
+		usb: usb@9100000 {
+			compatible = "zte,zx279128s-dwc3";
+			reg = <0x09100000 0x100000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topcrm ZX279128S_TOP_USB_REF>,
+				 <&topcrm ZX279128S_TOP_USB_ACLK>,
+				 <&topcrm ZX279128S_TOP_USB_SUSPEND>;
+			clock-names = "ref", "bus_early", "suspend";
+			/* in the order the vendor firmware releases them */
+			resets = <&topcrm ZX279128S_RESET_USB_B11>,
+				 <&topcrm ZX279128S_RESET_USB_B14>,
+				 <&topcrm ZX279128S_RESET_USB_B9>,
+				 <&topcrm ZX279128S_RESET_USB_B10>;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		pcie0: pcie@f000000 {
+			compatible = "zte,zx279128s-pcie";
+			reg = <0x0f000000 0x4000>,
+			      <0x09500000 0x1000>,
+			      <0x1c000000 0x200000>;
+			reg-names = "dbi", "ctrl", "config";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			bus-range = <0x00 0xff>;
+			ranges = <0x82000000 0 0x10000000 0x10000000 0 0x08000000>;
+			dma-ranges = <0x43000000 0 0x40000000 0x40000000 0 0x20000000>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			linux,pci-domain = <0>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pcie0_pins>;
+			clocks = <&crm2 ZX279128S_CRM2_PCIE0_CLK>;
+			clock-names = "pcie";
+			resets = <&crm2 ZX279128S_CRM2_RESET_PCIE0>;
+			reset-names = "core";
+			phys = <&pcie0_phy>;
+			phy-names = "pcie";
+			status = "disabled";
+		};
+
+		pcie1: pcie@f100000 {
+			compatible = "zte,zx279128s-pcie";
+			reg = <0x0f100000 0x4000>,
+			      <0x09600000 0x1000>,
+			      <0x2c000000 0x200000>;
+			reg-names = "dbi", "ctrl", "config";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			bus-range = <0x00 0xff>;
+			ranges = <0x82000000 0 0x20000000 0x20000000 0 0x08000000>;
+			dma-ranges = <0x43000000 0 0x40000000 0x40000000 0 0x20000000>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &gic GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			linux,pci-domain = <1>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pcie1_pins>;
+			clocks = <&crm2 ZX279128S_CRM2_PCIE1_CLK>;
+			clock-names = "pcie";
+			resets = <&crm2 ZX279128S_CRM2_RESET_PCIE1>;
+			reset-names = "core";
+			phys = <&pcie1_phy>;
+			phy-names = "pcie";
+			status = "disabled";
+		};
+
+		gmac: ethernet@92000000 {
+			compatible = "zte,zx279128s-gmac";
+			reg = <0x92000000 0x400000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+
+			ethernet-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				gmac_port0: port@0 {
+					reg = <0>;
+					status = "disabled";
+				};
+
+				gmac_port1: port@1 {
+					reg = <1>;
+					status = "disabled";
+				};
+
+				gmac_port2: port@2 {
+					reg = <2>;
+					status = "disabled";
+				};
+
+				gmac_port3: port@3 {
+					reg = <3>;
+					status = "disabled";
+				};
+
+				gmac_port4: port@4 {
+					reg = <4>;
+					status = "disabled";
+				};
+			};
+		};
+
+		topcrm: clock-controller@94000000 {
+			compatible = "zte,zx279128s-topcrm", "syscon", "simple-mfd";
+			reg = <0x94000000 0x1000>;
+			clocks = <&osc>;
+			clock-names = "osc";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reboot {
+				compatible = "syscon-reboot";
+				offset = <0x44>;
+				mask = <0x1>;
+				value = <0x1>;
+			};
+
+			pcie0_phy: phy@0 {
+				compatible = "zte,zx279128s-pcie-phy";
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			pcie1_phy: phy@1 {
+				compatible = "zte,zx279128s-pcie-phy";
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+		};
+
+		crm2: clock-controller@94100000 {
+			compatible = "zte,zx279128s-crm2", "syscon";
+			reg = <0x94100000 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		/*
+		 * The pin mux. What most of its bits select isn't known, so each
+		 * bit is a pin of its own.
+		 */
+		pinmux: pinctrl@94200000 {
+			compatible = "zte,zx279128s-pinmux", "pinctrl-single";
+			reg = <0x94200000 0x10>;
+			#pinctrl-cells = <2>;
+			pinctrl-single,bit-per-mux;
+			pinctrl-single,register-width = <32>;
+			pinctrl-single,function-mask = <0x1>;
+
+			/* the interface to an external Ethernet PHY */
+			ext_phy_pins: ext-phy-pins {
+				pinctrl-single,bits = <0x0c 0x0 0x00180800>;
+			};
+
+			pcie0_pins: pcie0-pins {
+				pinctrl-single,bits = <0x0c 0x0 0x00004000>;
+			};
+
+			pcie1_pins: pcie1-pins {
+				pinctrl-single,bits = <0x0c 0x0 0x00000002>;
+			};
+		};
+
+		lsp0crpm: clock-controller@94400000 {
+			compatible = "zte,zx279128s-lsp0crpm";
+			reg = <0x94400000 0x1000>;
+			clocks = <&topcrm ZX279128S_TOP_LSP0_PCLK>,
+				 <&topcrm ZX279128S_TOP_LSP0_25M>,
+				 <&topcrm ZX279128S_TOP_LSP0_32K>,
+				 <&topcrm ZX279128S_TOP_LSP0_100M>;
+			clock-names = "pclk", "wclk25m", "wclk32k", "wclk100m";
+			#clock-cells = <1>;
+		};
+
+		serial0: serial@94404000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x94404000 0x1000>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lsp0crpm ZX279128S_LSP0_UART0_WCLK>,
+				 <&lsp0crpm ZX279128S_LSP0_UART0_PCLK>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		serial1: serial@94405000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x94405000 0x1000>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lsp0crpm ZX279128S_LSP0_UART1_WCLK>,
+				 <&lsp0crpm ZX279128S_LSP0_UART1_PCLK>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		spifc: spi@94406000 {
+			compatible = "zte,zx279128s-spifc";
+			reg = <0x94406000 0x1000>;
+			clocks = <&lsp0crpm ZX279128S_LSP0_SPI_WCLK>,
+				 <&lsp0crpm ZX279128S_LSP0_SPI_PCLK>;
+			clock-names = "wclk", "pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		gpio0: gpio@94407000 {
+			compatible = "zte,zx279128s-gpio";
+			reg = <0x94407000 0x40>;
+			clocks = <&lsp0crpm ZX279128S_LSP0_GPIO_PCLK>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpio1: gpio@94407040 {
+			compatible = "zte,zx279128s-gpio";
+			reg = <0x94407040 0x40>;
+			clocks = <&lsp0crpm ZX279128S_LSP0_GPIO_PCLK>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpio2: gpio@94407080 {
+			compatible = "zte,zx279128s-gpio";
+			reg = <0x94407080 0x40>;
+			clocks = <&lsp0crpm ZX279128S_LSP0_GPIO_PCLK>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpio3: gpio@944070c0 {
+			compatible = "zte,zx279128s-gpio";
+			reg = <0x944070c0 0x40>;
+			clocks = <&lsp0crpm ZX279128S_LSP0_GPIO_PCLK>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpio4: gpio@94407100 {
+			compatible = "zte,zx279128s-gpio";
+			reg = <0x94407100 0x40>;
+			clocks = <&lsp0crpm ZX279128S_LSP0_GPIO_PCLK>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpio5: gpio@94407140 {
+			compatible = "zte,zx279128s-gpio";
+			reg = <0x94407140 0x40>;
+			clocks = <&lsp0crpm ZX279128S_LSP0_GPIO_PCLK>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		lsp1crpm: clock-controller@9a100000 {
+			compatible = "zte,zx279128s-lsp1crpm";
+			reg = <0x9a100000 0x1000>;
+			clocks = <&topcrm ZX279128S_TOP_LSP1_PCLK>,
+				 <&topcrm ZX279128S_TOP_LSP1_ACLK>,
+				 <&topcrm ZX279128S_TOP_LSP1_25M>,
+				 <&topcrm ZX279128S_TOP_LSP1_49M>,
+				 <&topcrm ZX279128S_TOP_LSP1_100M>;
+			clock-names = "pclk", "aclk", "wclk25m", "wclk49m", "wclk100m";
+			#clock-cells = <1>;
+		};
+
+		mdio: mdio@9a101000 {
+			compatible = "zte,zx279128s-mdio";
+			reg = <0x9a101000 0x18>;
+			clocks = <&lsp1crpm ZX279128S_LSP1_MDIO_WCLK>,
+				 <&lsp1crpm ZX279128S_LSP1_MDIO_PCLK>;
+			clock-names = "wclk", "pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.55.0

