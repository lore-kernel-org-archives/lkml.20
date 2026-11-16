Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830133;
	b=lrzmsHEfCekTi4/w8vKvwGYNnRjd38O9iIcXys2j1kWFuhx7sEJeg6bxoAaK5tqt3imV
	 TIdjDWJiaF+aoGysN0rie3a9SiVtfA3CXOfnohdVE545a9GTwX5hNfpZmBGbaBJx8K+AX
	 XoSXRA9q+RMU6efoJW7j5vBbsjqMqvFfDvauy/GHGTn9rmUeVjgI2RnSCRd15Kl2FbatX
	 C5ZkFh7phXNtFqcYL1PEQZWATTP6M6eq/Hm5BGRp88EQ2qiT+fvYfj8hRP19rn36kcPQO
	 SKpQJps2886G6rjt25nzDOfbQvRKaFQONgFzT+Wpapa2Nh4gkDLsl9AFlGYBsjUlXRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830133;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MqMWWxFU02V8tEh0sCye8Sx8z8SSh9kfAyIwnHZlbe8=;
	b=cIcQ3z5dkgVTiSQ9ywzhK18RUBF/LdsLYOKyJTiJKo2MNb2OWOrzvffWr5tZa2uFH4bL
	 NjiQeC8gLrhEWpLK8Xhv0QGXFkigQI0q6Aohk3MEcE5pSvg6ObC9nnSIYlYk3t+Zf/Ly/
	 3GqEAra2RwRjnVYuNwdzi4aEuBK5rxkTIDXJnDc6930lVMwLibuGRMTdWNyd4Oo19sWaX
	 ueSjSFdZYl1QPXii/xe2TypGu7Xsnx2cWE22iIDr4UljjkQyK1qha3rauhekLDrIPg3Mf
	 v3TxqyLFpSILnkokPkgy9luNW0zxBEmCWlkbtwvCNgENJdGGTQRpg68o6LEtpnnllMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTd2usiH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA999606A899;
	Mon, 16 Nov 2026 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bTd2usiH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830133;
	b=pFHJM4pg7yXzy5RAJqo2bP406ebUEB6mj4uWJRB4gsXWCNRzrqWLF3SQ92ai1L1lAZD4
	 /BUFNb/5rT1L9KWfOsxlJWVrb7IcUVMCNPLKri8lHtuTVd69eAma/jZRIQ7DAFPb/x6pc
	 btSvmAODWgY2bSrZeVdQ2l/vI5iJEc6Q12WnTrkPKzFkpjEt4f1XdF84aJpjpQpZq919/
	 6vY7FhHxGpGIHWwf9jU/4FHo+5zwptbBaAyLArgc1uXIpGcWGVHgyd5FKdZcW1ul5ffDh
	 2MCM9aVyntnMNDp6AYDBaU51D/ls2zEYUfuqLPR9TeqvorlwBHIHEVfg/+AOIgvdh/Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830133;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MqMWWxFU02V8tEh0sCye8Sx8z8SSh9kfAyIwnHZlbe8=;
	b=xeTLOtcuFZ5fTnfAlfOo88JyL7sRYg5cqW7PMfMzibNsnfclxqBpN27a5DVhqaduybvO
	 1bU8LDhwkYHd52U/BuAVQ+yKJDUPeVeej33WKXuxlBSVHWkJqryVP8efQvzxcW939/oMP
	 TDvjwvbWI1T9K6ghRp4ULdM0xcWToXKn/N0Ggatqx3JCu/mtN6LQGgNljN1VkYw6Zv3kH
	 iQia/nVh7ExQVBEyBGjlnmQku8G120LXZ3tV4YWmezESmiWe8wv4m75/HwvQPq7rAsC3v
	 8qP+n96WsELxsGX+QWQxnK13cuE5putfHAo11lT4km2vh0iTQemwnEYpVkueRNp4QzA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B7E51F000D1;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830133;
	bh=MqMWWxFU02V8tEh0sCye8Sx8z8SSh9kfAyIwnHZlbe8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bTd2usiH5oRFt46tnMIjDD+VIllkd2Ipe/GKPSYkMUqz8e0a3XpOKPwtZWdballvw
	 PwFx2tHVVwTqGPWy/sbuobDSvi2ygGzlSGUKE76G8t/P6zD3LrRyPZWx+b0ERmpDDN
	 rIYyek5H7NJb67aTbgl13bPl4fuZZrEDCI7bPzWipwHnopcioR7bF6iuznSOZZrPvx
	 HP7YIOw0GaFMHSD/dudWLL2XflXhQYT9xpuq2K58eeKOBMIiFTbE2QO5Wb6C8lyW56
	 CPy+IeiRojA7WEnYeFPYZXTW5rUY9lj+75C50SD3SI9JkMprR+G9GxlieC8M4123HA
	 NZ541awOy5a8Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4455E4A462;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:13 +0100
Subject: [PATCH v3 6/8] riscv: dts: mips: Initial support for the P8700
 Boston board
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
Message-Id: <20261116-p8700-dts-v3-6-ec5d4b7de39f@htecgroup.com>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
In-Reply-To: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=7586;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=4CsrRToKq+o/OvJBSajhF/y42tUgQSwfIpqwDOD+dQY=;
 b=8zAxDEYYnCXOnaY5QwMbgKpMoMBag/5oq4m0o/zWSK+LcnDvpq58mIfRTh/sNfynC8iDICqDl
 LFLjYxucD+zDqRZhKkG8uh2bLE+V7x6J6dVCAYS4/vxUcN0Ey7yCv8a
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Add initial device tree for the MIPS P8700 and the device tree
for the Boston FPGA development board with a MIPS P8700 bitfile.

Add related Makefile and KCONFIG changes.

Co-developed-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 arch/riscv/Kconfig.socs                   |   6 ++
 arch/riscv/boot/dts/Makefile              |   1 +
 arch/riscv/boot/dts/mips/Makefile         |   2 +
 arch/riscv/boot/dts/mips/p8700-boston.dts | 135 ++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/mips/p8700.dtsi       |  82 ++++++++++++++++++
 5 files changed, 226 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 429e0758930687c742c4dd09603e71e90dc096a2..2562b74f85969b52a7e22679322951f5fd8884a9 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -26,6 +26,12 @@ config ARCH_MICROCHIP
 	help
 	  This enables support for Microchip SoC platforms.
 
+config ARCH_MIPS
+	bool "MIPS SoCs"
+	help
+	  This enables support for MIPS SoC platform hardware,
+	  including the P8700.
+
 config ARCH_RENESAS
 	bool "Renesas RISC-V SoCs"
 	help
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb17c803f0efb8003e111ee24144c222b..6669ddd10f1ec3a2b0323cd0b460d48ae56edd2e 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -5,6 +5,7 @@ subdir-y += anlogic
 subdir-y += canaan
 subdir-y += eswin
 subdir-y += microchip
+subdir-y += mips
 subdir-y += renesas
 subdir-y += sifive
 subdir-y += sophgo
diff --git a/arch/riscv/boot/dts/mips/Makefile b/arch/riscv/boot/dts/mips/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..a1f3a8ed427342042a3ec176d3cb41c8dbb8926a
--- /dev/null
+++ b/arch/riscv/boot/dts/mips/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_MIPS) += p8700-boston.dtb
diff --git a/arch/riscv/boot/dts/mips/p8700-boston.dts b/arch/riscv/boot/dts/mips/p8700-boston.dts
new file mode 100644
index 0000000000000000000000000000000000000000..4383ef7cec152a6d43aaf24fea9fdf266ee288d8
--- /dev/null
+++ b/arch/riscv/boot/dts/mips/p8700-boston.dts
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2025 MIPS
+ *
+ * Boston FPGA development board with a MIPS P8700 bitfile.
+ */
+
+/dts-v1/;
+
+#include "p8700.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/* Clock frequency (in Hz) of the FPGA bitfile */
+#define BITFILE_FREQ	25000000
+
+/ {
+	model = "MIPS P8700 Boston";
+	compatible = "mips,p8700-boston-rtl-5057225-202410011144",
+		     "mips,p8700-boston";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	cpus {
+		timebase-frequency = <BITFILE_FREQ>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	pci2: pci@14000000 {
+		compatible = "xlnx,axi-pcie-host-1.00.a";
+		device_type = "pci";
+		reg = <0x14000000 0x2000000>;
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&aplic_s0>;
+		interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
+
+		ranges = <0x02000000 0 0x16000000
+			  0x16000000 0 0x100000>;
+
+		bus-range = <0x00 0xff>;
+
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pci2_intc 1>,
+				<0 0 0 2 &pci2_intc 2>,
+				<0 0 0 3 &pci2_intc 3>,
+				<0 0 0 4 &pci2_intc 4>;
+
+		pci2_intc: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+		};
+
+		pci2_root@0,0 {
+			compatible = "pci10ee,7021";
+			reg = <0x00000000 0 0 0 0>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			eg20t_bridge@1,0,0 {
+				compatible = "pci8086,8800";
+				reg = <0x00010000 0 0 0 0>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+
+				eg20t_mac@2,0,1 {
+					compatible = "pci8086,8802";
+					reg = <0x00020100 0 0 0 0>;
+					phy-reset-gpios = <&eg20t_gpio 6 GPIO_ACTIVE_LOW>;
+				};
+
+				eg20t_gpio: eg20t_gpio@2,0,2 {
+					compatible = "pci8086,8803";
+					reg = <0x00020200 0 0 0 0>;
+
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+
+				eg20t_i2c@2,12,2 {
+					compatible = "pci8086,8817";
+					reg = <0x00026200 0 0 0 0>;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					rtc@68 {
+						compatible = "st,m41t81s";
+						reg = <0x68>;
+					};
+				};
+			};
+		};
+	};
+
+	uart0: serial@17ffe000 {
+		compatible = "ns16550a";
+		reg = <0x17ffe000 0x1000>;
+		reg-shift = <2>;
+		reg-io-width = <4>;
+
+		interrupt-parent = <&aplic_s0>;
+		interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+
+		clock-frequency = <BITFILE_FREQ>;
+	};
+
+	lcd: lcd@17fff000 {
+		compatible = "img,boston-lcd";
+		reg = <0x17fff000 0x8>;
+	};
+
+	flash@18000000 {
+		compatible = "cfi-flash";
+		reg = <0x18000000 0x8000000>;
+		bank-width = <2>;
+	};
+};
diff --git a/arch/riscv/boot/dts/mips/p8700.dtsi b/arch/riscv/boot/dts/mips/p8700.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..94536e7e6e87998486f919a2962ee1da4d2c596b
--- /dev/null
+++ b/arch/riscv/boot/dts/mips/p8700.dtsi
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2025 MIPS
+ */
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "mips,p8700", "riscv";
+			reg = <0x0>;
+			mmu-type = "riscv,sv39";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "zicntr", "zicsr", "zifencei",
+					       "zihpm", "zba", "zbb",
+					       "xmipsexectl";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mtimer0: timer@16108050 {
+			compatible = "mips,p8700-aclint-mtimer";
+			reg = <0x16108050 0x8>,
+			      <0x16154000 0x7ff8>;
+			reg-names = "mtime", "mtimecmp";
+			interrupts-extended = <&cpu0_intc 7>;
+		};
+
+		aplic_m0: interrupt-controller@16140000 {
+			compatible = "mips,p8700-aplic", "riscv,aplic";
+			reg = <0x16140000 0x8000>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts-extended = <&cpu0_intc 11>;
+			riscv,num-sources = <53>;
+			riscv,children = <&aplic_s0>;
+			riscv,delegation = <&aplic_s0 1 53>;
+		};
+
+		mswi0: mswi@16150000 {
+			compatible = "mips,p8700-aclint-mswi";
+			reg = <0x16150000 0x4000>;
+			interrupts-extended = <&cpu0_intc 3>;
+		};
+
+		aplic_s0: interrupt-controller@16160000 {
+			compatible = "mips,p8700-aplic", "riscv,aplic";
+			reg = <0x16160000 0x8000>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts-extended = <&cpu0_intc 9>;
+			riscv,num-sources = <53>;
+		};
+
+		sswi0: interrupt-controller@1616c000 {
+			compatible = "mips,p8700-aclint-sswi";
+			reg = <0x1616c000 0x4000>;
+			interrupt-controller;
+			#interrupt-cells = <0>;
+			interrupts-extended = <&cpu0_intc 1>;
+			riscv,hart-indexes = <0x0>;
+		};
+	};
+};

-- 
2.43.0


