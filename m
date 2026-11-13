Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580135;
	b=itPitOMHhZcnKrIpSTKYMyetBp7hTwnemnlNz+lgL4RAkGLDqPJahRhvaB6ola4xOuLi
	 Bre5LE5U5elAm8DP+yRxsrvNhSHxnTUKqhwQ1wAq5DUQ5RaIFKiOsqFBTz48dyBLCQC4U
	 GYK0q7PVnfuk9uJ3Y6qe9ltKc6xUSe5zpIRclO7rztdPoq672eKTsHO6NKZOTaYnWe807
	 t7oP++Il3fnsmg2n9jii5QtsrH1WQV+c/RkiQ7Z2ERbIHTkXweVi6D2E/TsQU42AOM+Ag
	 ZBmMKvsZ1wlIK/e6vQeD9aub1JuwVBNa5IGuk5tvZgown3yTVekScFvD82LKrRkU2Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580135;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8q1dLdGBdAfkIvfenu2Vg5xpuwfd5kL9Ag8F1LUDLpY=;
	b=bAQ6GvApHYTTHhBTrGkIMLRpZ7rSLLi48tUBEMQP0n9gnk3OJVdU+XW6DmA031KYVD58
	 99zb9QqozIHTSj6xx/0DROI4Pebodt8QjYDnd7BJUbzmLfpeTvdZziPClL/zwBjveSFOs
	 yxFsL8plM0+f31n7LCDWyDY5OUwoFYy7uEUYNKFvMCeYwUyNKQGMIzvkFeqXLstmLUadp
	 jP+o+39yuEEEljlxouZ1bMCrZhTmgk7tLzp+3z3pVLFsrCACjfbWe1SXiPJJ0K8QZwtLE
	 cYdLTAgxCua4ioWmhAE+aqraj1pBUeRHnGm1W+0Fv5qW4emAokpSo8ljoak47BGt7rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=EoPMM+vC;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D75606A895;
	Fri, 13 Nov 2026 14:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D75606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=EoPMM+vC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794580111;
	bh=8q1dLdGBdAfkIvfenu2Vg5xpuwfd5kL9Ag8F1LUDLpY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=EoPMM+vCrYwMrgMiUMeDBezIqRCLk1RCfvi7H2g9vJB4qEwuCm93rdCi0t+JIx7+N
	 CIP2hqBBc35N4+u0+6SmTRsMTYlhisI2gOMXC32Kf5yUvRkIxmbf8qNW21QDLrAhNT
	 XaYsFrYNCuG+FdYRYOeOnVZhihzgz8DbkSVdiuPY=
X-QQ-mid: zesmtpsz6t1794580110tec0edc50
X-QQ-Originating-IP: fm2reiAJdB/qKeHxN8b5HNcE21EWPuyjAf9GRpjPJT8=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 22:28:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12388474241626902925
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 13 Nov 2026 14:28:18 +0000
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Add K3 BS01DCMA RV2768
 support
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
Message-Id: <20261113-k3-bs01dcma-v2-2-3f0de4a3e1ca@linux.spacemit.com>
References: <20261113-k3-bs01dcma-v2-0-3f0de4a3e1ca@linux.spacemit.com>
In-Reply-To: <20261113-k3-bs01dcma-v2-0-3f0de4a3e1ca@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8322;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=nCCoCoekgN3BBRerDuOB9sOLgeAx7z94qOfQTO91zLc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnf5ZrFEmYmpvx+INE992XMy5jwO98dUnlidEX/htaoV
 Z49Vvezo5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCKdlxl+s11m9GYsbmNmmuNz
 UMux42vt7A+2Zk+u27xlfmpTI3wwguGv+PWSx2ue3YliKP0v8meS7K/nN0Xc/n21+b7zn/3Ce6e
 qWQE=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mo3PYuu8Roc7jnafzJxQyvm65/KJeDhMgQjhs5Qvlq69171mbzHwsXEm
	n0v6yzQAeqzSUlKVIQ5ZtBJ0AnXIf3vXK/xoT+0XY8YyXdR431+OudmONVuroCJMs+vKdsg
	KE6YbOdfJHwyxaLFClZkw90eCl8qnhcKZgjsvLy6LcnqUHiffYxq1dyG8yPyU5zuYNNRnRi
	OnBc0vqw8F/vROiN3wKErnTzZqAu6O6lzmiP+jhyQryMGp6qwOpLp7VGA2/7KEqukS5iUDZ
	arZ3KpMN34lpnNwwAszvPS8pHPF19yGm8CvS/yb0vscz+ZRuHENGiNfKhEzd/owu/9YfpkT
	/uSMA30CFbGRXFkHvh28QVGvG/xEbJ52vF3841uwdHDZRuqix/ITIbEk8QwA/5WqqLmf7mm
	hedWlioDLlfEXMCSS5xHGRlFtpF7C+6FZBExjvjSjof9QDLh2nGzIAL8X3mrs7V5LDRIlZA
	RNDp42fJFDpbcd+J6w4WlmPetxf7zMTbTLMGPTUf2nKw+fdfjPkPLCO/f+bMkDYjekruYJG
	Jju/wlegVriW1oJ2k72navSpNWr4r2gFvv8MzlbUtl0Pac0u3KVfsTcrsY1Rl8upJRxlEiW
	3D9aTtRDm5c77b+S1x29ufOoaLySzeqG4JBbPFvGuDN4NuTmXTMc5E5B0lFF9Vo42uhj/PT
	UHwlg3TzSEkPaRli2c/+s7S0bbukqlbpqLtcC6IGl/VAdUhtuuArA/Is+SvEAsZsH0pXoGu
	Oc4ZfcuL9sVXijwEcpFY2D6u/sprJpKxGnrOi9yMUonNqtQt8A0TKnXpmaRX3Hv5HqETqBM
	j22dN7vbmF8QJBPxhz3CUfuUWJxFYDD9tbtPcwE+a8GuM2DmgNBWijfzLtnG8qsdCjJ8L3L
	HZEcYLlKdLvsYPHwo9WebQEeQwI96wtcGYdV+NACwQsHpbPjL4mubU2eAfYmc8o+TRwSkVo
	0zmNY7+os5GJmt/DOH+LE9mz9npMKErAX06Ha6HaYx5vRV1fSCXxNUm30gUMl8Ryk9RYZf7
	Q+lm5UbVrO3tYaWB74guc4IzK7XoguQWWe4QCRy49CNl2dd9xdC51qOee4fq2lHCtUvXQ52
	AznS/gB+gPzxXQJYRw6s44YjRJuK8rWWC1I7YJeC0OCfHrS04i9s5Y=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

BS01DCMA is a compute module carrying two independent K3 nodes. Each
node has a SpacemiT K3 SoC, 16 GiB of LPDDR5 memory, a P1 PMIC, an
EEPROM and QSPI NOR flash. The SpacemiT Cluster Server RV2768 hosts
several BS01DCMA modules; its carrier only connects them to PCIe
network cards.

Add a dtsi for the module with the serial console, EEPROM, PMIC and
QSPI NOR flash, and a dts for a K3 node in the RV2768.

The NOR flash is a 1.8 V part powered from the PMIC_VCC1V8_QSPI rail,
which is ALDO2 of the P1 PMIC. Its partitions follow the layout of the
SpacemiT boot firmware. U-Boot and EDK2 both go into the partition at
0x210000; EDK2 keeps its UEFI variable store at the fixed offset
0x700000, so that partition ends below it and the store is described
as a separate read-only partition.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 .../riscv/boot/dts/spacemit/k3-bs01dcma-rv2768.dts |  19 ++
 arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi      | 264 +++++++++++++++++++++
 3 files changed, 284 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 851b701e5da4..a00c31a2c3e6 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-bs01dcma-rv2768.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-bs01dcma-rv2768.dts b/arch/riscv/boot/dts/spacemit/k3-bs01dcma-rv2768.dts
new file mode 100644
index 000000000000..5b0449314d64
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-bs01dcma-rv2768.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ */
+
+#include "k3-bs01dcma.dtsi"
+
+/ {
+	model = "SpacemiT K3 RV2768 Cluster Server";
+	compatible = "spacemit,k3-bs01dcma-rv2768", "spacemit,k3-bs01dcma", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi b/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi
new file mode 100644
index 000000000000..0f9375c38e40
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ */
+
+#include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
+
+/ {
+	model = "SpacemiT K3 BS01DCMA Module";
+	compatible = "spacemit,k3-bs01dcma", "spacemit,k3";
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x4 0x00000000>;
+	};
+
+	reg_5v_sys: regulator-5v-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "P5V0_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <8>;
+		read-only;
+		size = <256>;
+		status = "okay";
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			product-name {
+			};
+
+			serial-number {
+			};
+		};
+	};
+};
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+		vin1-supply = <&reg_5v_sys>;
+		vin2-supply = <&reg_5v_sys>;
+		vin3-supply = <&reg_5v_sys>;
+		vin4-supply = <&reg_5v_sys>;
+		vin5-supply = <&reg_5v_sys>;
+		vin6-supply = <&reg_5v_sys>;
+		aldoin-supply = <&reg_5v_sys>;
+		dldoin1-supply = <&buck4>;
+		dldoin2-supply = <&buck4>;
+
+		regulators {
+			buck1: buck1 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2: buck2 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3: buck3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4: buck4 {
+				regulator-min-microvolt = <2100000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6: buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <500000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo2: aldo2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo3: aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4: aldo4 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo1: dldo1 {
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo2: dldo2 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo3: dldo3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo4: dldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo5: dldo5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo6: dldo6 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo7: dldo7 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
+};
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&aldo2>; /* PMIC_VCC1V8_QSPI */
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x20000>;
+			};
+
+			fsbl@20000 {
+				reg = <0x20000 0x80000>;
+			};
+
+			env@a0000 {
+				reg = <0xa0000 0x10000>;
+			};
+
+			esos@b0000 {
+				reg = <0xb0000 0x100000>;
+			};
+
+			opensbi@1b0000 {
+				reg = <0x1b0000 0x60000>;
+			};
+
+			uboot@210000 {
+				reg = <0x210000 0x4f0000>;
+			};
+
+			var@700000 {
+				reg = <0x700000 0xc0000>;
+				read-only;
+			};
+		};
+	};
+};
+
+&qspi_cfg {
+	qspi-pins {
+		power-source = <1800>;
+	};
+
+	qspi-cs0-pins {
+		power-source = <1800>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_0_cfg>;
+	status = "okay";
+};

-- 
2.56.0

