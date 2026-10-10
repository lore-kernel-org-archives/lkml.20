Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792E44AE102
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637256; cv=none; b=IqaeJRztyROASM+84zh6Kg/WcUKPxZtE++9Ro539jwgE3Qy00X1cQ+LE1BkGHtxdI9EIpFHJOomZmV3DdZ8h7s6+u7NPbqovx3TS6c2bTWCo9qcWRaq5uTgKjDegFvZluT2ALlv71khsUdHSruEsNmlDMxvVIV0uw8DvtIv5Lf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637256; c=relaxed/simple;
	bh=vwroORZWA80nBqah1SRlRZ184NcJWA1fObTO5mSv3yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3oXGw9hIFXjH9uifOJixL52cNhn0nyQbBjUxVoytiqDDnyGaU+Ul1zY0Iw7zZeJwW2h0mWbWTLbtouJ1s9GYsxuQI+Wwpebw7Oj/KHRMV7/wkb3eBAKJW0YV6iFNEyyTf95bswWBQNTZGP0FcLLDLf0yyKmJrfqXXDrzf84RiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3ZZO3S/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3ZZO3S/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso5559355e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637251; x=1792242051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wpfQOuDtH7gZxxcWfSzMbnOTC1GGhHnCAd7pLDi/1kk=;
        b=F3ZZO3S/XHov9rXXfKTQuW4Plfp4h/nFwHb4zjTVal7nMEP9ZxJsnSgHQkBpICxge5
         ntyku8fPuqDHTa9KNOI9yHBKinY6rMo2mltqA3Qucm5Gu2oN35Z4wdWkHYpOWAhKxjKU
         /e/VFn7oh9pkmMddxY8bsuTcYRySojyuFbilRzdpNT0hJu9SMpCyfzrH55cTBUpLVL3G
         lPeZ0IGBkoV4r+FBNOZru3AVUeb2nPQWiV+CpQiVsbVefvp2Cmkua0Laf1TTSvxDXAMZ
         iunIz7x41rhtwusMSAY68NvsPsVhP9clYChMNn8OgyfklcOobuq18YFm0oudgxbQU790
         8zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637251; x=1792242051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wpfQOuDtH7gZxxcWfSzMbnOTC1GGhHnCAd7pLDi/1kk=;
        b=WYEapXWxsNQszrwQw4zpDwAQUu0yJbH+qBWuTKdoYxVxRy9Hvx0TwJOYBDgQgnENr8
         9fAH2VARwqAU04TIGssW1nV8gRbDEoUEMeHHHNEv0eH4lnPWqh9yokoXHB1g/w6HAKjk
         MknBqTuzgBCuJg0KMKjUAhDgWMYej9Ogsx3y8iRSmiO/g/axqa5ADz3TPG0QOn69pNY2
         kxPnUWlg3rPHNTtmqdPA54ssZXW5GvrSgeaKgFC2pUjbW4SUzI25IvldO85BrsiFrl1l
         DERqCV+FxdDF/jUoAtRDpwpDXdpCNRYeVw0PVMaKvh4IPS+CJBENPREjBT8UY7Qoww+U
         gx/A==
X-Forwarded-Encrypted: i=1; AKwUvBwGqiCjlEecqFNewiA644cqUhBnI9byFdzlTVHfFN6XRoVGZ+w1muyvSVNhc1gLi3FQvxX5uMsF+QcfWWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLROdTaphITR11MIckl2etw+YJ2xsxBbSLl5dLKFyvyfFthW53o
	DOzz6PwmibNNslmJ/cKsyKiOx46uHEjiGlADDb9eFe/vTouBEVGEKyQU
X-Gm-Gg: AYBFou0KpOfmXrC1pBXHREcucyeVOwK8GyynfhPEjgv3Swrb0EEkIgo1/jL2+nI87/o
	uz/bl3O6X+iWmFW2NgRz8PEUPCzvgVJBnkRsF5bp8MilvN6f+CyoNagpAk6kG7yxQt6RpM3dvAn
	tsOd230SbXHDm4YiCghyCy8sK0EoQ05C6YBy1sw7vtZ/h4g2G/a8B8Qer7L5Q43qHLlqu+pDerS
	KtwX0Xpj//zOxx8goZ0J4SbQTD9CvR7j5QXNaeP9tlWjTW02htyik7CMSa1t5r2T94PaEFjKgyL
	oFgyYUZ2o/Z9W5ZvdmIvc4TYsWU8R2HNyEubXxoFSzP6Epw1O6lx2KgevrzKPcTVNjqn9KoF18W
	DnI2q1uMGvtNRpcUz4Gi3oSucKqFmxgXfMBH7Hd7VpcipQPbS20454j7IMawcwGi11c+UEqDikA
	96fudJvpgl/+rKFma7bgCfDWZhWOM2z6I063ZHx5sbPlZK9O3l+pdsNDxwXQ1VjMza5DExti0H/
	kHVxC0e4ijIHysySGSj88lWY9Coy4DZ0OMGHl0MSjiFAt9ACWmuH/4L1b/1ULiyk4/QjlYfS2J8
	XG7DxmzDh40FluYiOSilBt4C3p7C3JVHwU/JZKSXmYB/xNc5U/18QepuJ3QiEag=
X-Received: by 2002:a05:600c:1e0f:b0:4a1:7b87:8d34 with SMTP id 5b1f17b1804b1-4a18e4b46e1mr81553045e9.21.1791637251398;
        Sat, 10 Oct 2026 06:00:51 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:50 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 23/24] ARM: dts: zte: Add ZX279128S SoC description
Date: Sat, 10 Oct 2026 14:00:01 +0100
Message-ID: <20261010130024.177503-24-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the CPUs, SRAM, timers, interrupt controller, cache, clocks,
pin mux and peripheral controllers.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 arch/arm/boot/dts/zte/zx279128s.dtsi | 397 +++++++++++++++++++++++++++
 1 file changed, 397 insertions(+)
 create mode 100644 arch/arm/boot/dts/zte/zx279128s.dtsi

diff --git a/arch/arm/boot/dts/zte/zx279128s.dtsi b/arch/arm/boot/dts/zte/zx279128s.dtsi
new file mode 100644
index 0000000000..e2bbc70de3
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx279128s.dtsi
@@ -0,0 +1,397 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * ZTE zx279128s SoC: dual Cortex-A9 with an L2C-310 cache controller, a
+ * five-port gigabit switch, two PCIe controllers and a SPI NAND controller.
+ *
+ * Copyright (C) 2026 Navid Ghahremani <ghahramani.navid@gmail.com>
+ */
+
+#include <dt-bindings/clock/zte,zx279128s-crm.h>
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
+	/* The boot loader's "reset" command writes 1 to CRM 1 + 0x44 */
+	reboot {
+		compatible = "syscon-reboot";
+		regmap = <&topcrm>;
+		offset = <0x44>;
+		mask = <0x1>;
+		value = <0x1>;
+	};
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
+			interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
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
+			/*
+			 * A PCIe read that is still outstanding while an L2
+			 * maintenance or sync operation runs hangs this SoC.
+			 */
+			zte,l2c-io-read-lock;
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
+			resets = <&topcrm ZX279128S_TOP_RST_USB_B11>,
+				 <&topcrm ZX279128S_TOP_RST_USB_B14>,
+				 <&topcrm ZX279128S_TOP_RST_USB_B9>,
+				 <&topcrm ZX279128S_TOP_RST_USB_B10>;
+			dr_mode = "host";
+			/* the 20 MHz reference clock */
+			snps,ref-clock-period-ns = <50>;
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
+			zte,crm = <&topcrm>, <&crm2>;
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
+			zte,crm = <&topcrm>, <&crm2>;
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
+			compatible = "zte,zx279128s-topcrm", "syscon";
+			reg = <0x94000000 0x1000>;
+			clocks = <&osc>;
+			clock-names = "osc";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		crm2: syscon@94100000 {
+			compatible = "zte,zx279128s-crm2", "syscon";
+			reg = <0x94100000 0x1000>;
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

