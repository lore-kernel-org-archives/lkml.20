Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718702;
	b=QT0Tyr040Rkz86krzaFzcG2nEaenZzIgVDmznzrVA5kgI0nABsrI85xhd1257iHbxc6s
	 SO6yeaZ1WlEN3ivoHyuBKulwbrm1Jwfpi//uYTp8DBDZaIJqH0236Aplu24LwDM253keQ
	 Ryna6ERrDXOdbrGQmAQpdYFQDSMotKmxpRKkZuleLRK6y4NEIjtn1gjrM42IrZyoo5GzR
	 jMEdj83FuQhALdLNdT9ZCKcZfXi8hj0d1Mo1X5DB14Ueo0UF0HOhGMV6NZuXKpfcbFscY
	 S9w4+ULXwDnAtaERYnkdyvJG6h18cMLzTkUhht7gcFpyz2ChMOp8tM0NPBc6oSUYGRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718702;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TLg297peuEBB58Y5tvTjnTFa2DKta42IsgA4ABS+2MM=;
	b=0dy4OP4WptfYezh1Jm6c1AJEIJp0RnKU96bOhMfvhTAalTYUiDTas9nxtOZDMFf/o0H7
	 yPwaX4uXJjSw8bv6fwSow4Fa6MIWpj6WCoJT22n4/zJ8vH49X3EUQml9iKJlOwe83iR/O
	 VuKhoS9gBa6tI9rFR5+Dlz1QEV4zlRZXJnFSxdVgb2SvAjUINKO0Tz37UHWHM+JdVQZNF
	 kEp9bzGDUAstBdp2r5EQi0dV3WDSNZQq6DVrLlCaDDAoAx6vCwb2oJv79F64usKodulLH
	 hOfVBmYhpY/8rwwUd+9gmX5DRNqqEQmgO0kyKyn6QRGaoHR0qWn9TklmA2XUXWagXjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q16sIfHh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC06606EEA5;
	Tue,  3 Nov 2026 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q16sIfHh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793718702;
	b=rjJcRhVrsOooNDXALsdibKQPkOkDayicSN5ljvdbumNUV9oxNWYmj1dL0NpiwJGnkVJE
	 GfaoKNPm2qHNOkcpyR14QkPnEqQj32FYnF0Qwwn46C7prakDxxkfOwtDyivICHAj6TvQF
	 2l+UwtZMN+TFfUm+79FIwrx2McQHUfWBZ35eAYOQg9I+Ghp37sJRxmZko9LrSB0TQsit/
	 1qWfL6Q33pqVSQlhI4m0KK6zEqruWytDnASWtBlyTr5hceoUTmwPzjVRvHj+yk8aZiQr6
	 TNPG37DZceIea60QgfZIOGc5IwEACNZko/S3rXup/2H0wAkiJzvgTR9ZsmTBJwFdtQQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793718702;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TLg297peuEBB58Y5tvTjnTFa2DKta42IsgA4ABS+2MM=;
	b=tu0MBYa69t/4JbpFX7af3GQDCBNWCco4BIU5YD5SGqme27hkXK+a+CuHk2UiscTShQQX
	 2aw+Noid4TJYMEDpxfAc81o7dTjpd7qL3jSJrYXsC5EeuZhV1pOL7YxZRbQ9DinEa8x63
	 QCMqHR2qhUkUHvpSTmCRH44HIpH0hYNFkkqKfTcKRZrWy5KX3UrnIWsYUo/uMJRuTCr3t
	 WXPUVKSXJmZQAHg+M8B5hMUY7jNHG/U5q0rUpa7NlK1UWgblsuvzwAPzW2nhUBwGAHHWJ
	 53s4tfq+3PapdnhZeC/q91iBUTBpdaDx3c8Mh4/Wg7VwHekFaC6hmROulV/5Rg+hNNg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0D591F00919;
	Tue,  3 Nov 2026 15:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718702;
	bh=TLg297peuEBB58Y5tvTjnTFa2DKta42IsgA4ABS+2MM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Q16sIfHhELycCjSuLevaW6EEUq0CHvOt3IlBMj9OEfMnnFEGh6tYMzbEUYrtK1DWO
	 9kfeGA+9ahEtnniNkNpDKK3eewX1hxSxQG5csLAAgntpa6eTz+IaIPqT/4hOwdTtOn
	 KKIOqBWIke1Uq1VbsQ3XPVSPBDYhTndETqwyaVyy5NIZah+YKKZdpCukR3gKK3R1aE
	 UKPfO7M6aY1HMt2ekHBcNwkphjbBLLrGv3ZO2qi3gDERrzl6ZPnUKNNyAO69JJoDX7
	 6Xa0yKLg9x3iNf1rZr4s3OkjT+YfD+5aXQy3F30v3zLK/U4CvRDSX/7Sx303yOWf+w
	 wboqAPJQeyYwg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 32692469DE;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 03 Nov 2026 16:11:31 +0100
Subject: [PATCH v2 7/8] riscv: dts: gf: Initial support for the P8700
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
Message-Id: <20261103-p8700-dts-v2-7-3ac5d49f2c37@htecgroup.com>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
In-Reply-To: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
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
 Palmer Dabbelt <palmer@sifive.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793718695; l=7636;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=f42ogFldrAY6V5zk7onoriZ675nkh5c0zDACtB02ZpQ=;
 b=2gclt1lG541J1WI60CVX3RJhe0MxyCXtcXkscE6Se0z1MYMf1pqSEn3U8EJH/e8eKTgGxp/Xc
 MGZjtZnSVdMAw1vqjW558N7hTcsp4qUihLu9VD1eSowo8uRyBk9EEkQ
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
 arch/riscv/Kconfig.socs                 |   6 ++
 arch/riscv/boot/dts/Makefile            |   1 +
 arch/riscv/boot/dts/gf/Makefile         |   2 +
 arch/riscv/boot/dts/gf/p8700-boston.dts | 135 ++++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/gf/p8700.dtsi       |  82 +++++++++++++++++++
 5 files changed, 226 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 429e0758930687c742c4dd09603e71e90dc096a2..78b0a0076feb14ebdafc4b7f0fa1be3aa416d415 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -18,6 +18,12 @@ config ARCH_ESWIN
 	  This enables support for ESWIN SoC platform hardware,
 	  including the ESWIN EIC7700 SoC.
 
+config ARCH_GF
+	bool "GlobalFoundries SoCs"
+	help
+	  This enables support for GlobalFoundries SoC platform hardware,
+	  including the MIPS P8700.
+
 config ARCH_MICROCHIP_POLARFIRE
 	def_bool ARCH_MICROCHIP
 
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb17c803f0efb8003e111ee24144c222b..5d8d55c4cf9d0b17f2a8744aa17526819e6c277a 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -4,6 +4,7 @@ subdir-y += andes
 subdir-y += anlogic
 subdir-y += canaan
 subdir-y += eswin
+subdir-y += gf
 subdir-y += microchip
 subdir-y += renesas
 subdir-y += sifive
diff --git a/arch/riscv/boot/dts/gf/Makefile b/arch/riscv/boot/dts/gf/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..180d7cc7f5cf87e48e2219f9ac9882828ca62016
--- /dev/null
+++ b/arch/riscv/boot/dts/gf/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_GF) += p8700-boston.dtb
diff --git a/arch/riscv/boot/dts/gf/p8700-boston.dts b/arch/riscv/boot/dts/gf/p8700-boston.dts
new file mode 100644
index 0000000000000000000000000000000000000000..635658e4398a123ad00917e392977045b524f976
--- /dev/null
+++ b/arch/riscv/boot/dts/gf/p8700-boston.dts
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
+	compatible = "gf,mips-p8700-boston-rtl-5057225-202410011144",
+		     "gf,mips-p8700-boston";
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
diff --git a/arch/riscv/boot/dts/gf/p8700.dtsi b/arch/riscv/boot/dts/gf/p8700.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..c73fb26075e978c7f80c6741a4ff0c21b7af66c9
--- /dev/null
+++ b/arch/riscv/boot/dts/gf/p8700.dtsi
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
+			compatible = "gf,mips-p8700", "riscv";
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
+		aplic_m0: interrupt-controller@16140000 {
+			compatible = "gf,mips-p8700-aplic", "riscv,aplic";
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
+			compatible = "gf,mips-p8700-aclint-mswi";
+			reg = <0x16150000 0x4000>;
+			interrupts-extended = <&cpu0_intc 3>;
+		};
+
+		mtimer0: timer@16154000 {
+			compatible = "gf,mips-p8700-aclint-mtimer";
+			reg = <0x16154000 0x7ff8>,
+			      <0x16108050 0x8>;
+			reg-names = "mtimecmp", "mtime";
+			interrupts-extended = <&cpu0_intc 7>;
+		};
+
+		aplic_s0: interrupt-controller@16160000 {
+			compatible = "gf,mips-p8700-aplic", "riscv,aplic";
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


