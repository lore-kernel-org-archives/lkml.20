Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3CA369D53;
	Thu,  1 Oct 2026 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840680; cv=none; b=THDvLfRb4EfTsv6N/kYI9PVD6lxx2b2/OveKJvlckklHju22HvhZR5mv2KC6kz6qmMQ3a9VdEb+FPg/2ZQx4Cl3B0N8Nh9203LFpNtgoueuuwvakeUUk0Hmhv9Wl+1wwlleT8p06mgynFeMgWt9u6Wo1BnR35zkGa3DcdNdcDJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840680; c=relaxed/simple;
	bh=YHQwgDaDbYgtQ/KtFxf7XQFKm4rI2XjVSKSAzKcN1bM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pa0MPEpOx37XJIPJo5uGH4Qo3rFo8zNauxp0nI5Vu6dPaivD2UP4WN6h+qnTV7dk9AvZ1uu66SPYNYlqEQjqunyj+hhHkbl1eEpzZieouZ2/Mn/1rsI5km2Kwg3jRQyLh53jKxT4rn0JMWz41S+Bh6GxGKMefEamqbC0cMVeTPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-05 (Coremail) with SMTP id zQCowAD3J0JPD75qjtLZCQ--.7172S4;
	Thu, 01 Oct 2026 15:44:19 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 01 Oct 2026 15:44:11 +0800
Subject: [PATCH v2 2/4] riscv: dts: thead: add Milk-V Meles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-rv-meles-v2-2-c61052262f84@iscas.ac.cn>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
In-Reply-To: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID:zQCowAD3J0JPD75qjtLZCQ--.7172S4
X-Coremail-Antispam: 1UD129KBjvJXoW3GF4DCr18Xw4ktr45Wr1DAwb_yoW7CrWkpa
	yxC3ySgFWkWF4fK34ayrW0vF15Kan5CFykKrnrWFyxXFsFg3ykC34SqrZ7ZF4qqrW5Ww1f
	Xrs8WryIkr10k3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUQXo7UUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBwcHDGq9sM65JAAAs-

Add the Milk-V Meles board with UART0, eMMC, SD, Ethernet and the PWM2
fan. Describe the board pin assignments and the PHY on the GMAC0 MDIO
bus. Give GPIO banks aliases and name the exposed 40-pin header lines.

The eMMC I/O supply is fixed at 1.8 V. Enable DDR52 at that voltage and
retain the 52 MHz board limit. Describe 8 GiB as the default memory
size; firmware updates it to match the detected RAM capacity.

Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/Makefile               |   1 +
 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 227 +++++++++++++++++++++++
 2 files changed, 228 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/Makefile b/arch/riscv/boot/dts/thead/Makefile
index b55a17127c2bc06cbfb06d5f7c92dc7296e98437..25f7fe068368c97df2490bedc3eae70276a2e442 100644
--- a/arch/riscv/boot/dts/thead/Makefile
+++ b/arch/riscv/boot/dts/thead/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_THEAD) += th1520-lichee-pi-4a.dtb th1520-beaglev-ahead.dtb
+dtb-$(CONFIG_ARCH_THEAD) += th1520-milkv-meles.dtb
diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
new file mode 100644
index 0000000000000000000000000000000000000000..3714047190789bfccd8ff6810342d7ff865e74e4
--- /dev/null
+++ b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021-2022 Alibaba Group Holding Limited.
+ * Copyright (C) 2026 Han Gao <gaohan@iscas.ac.cn>
+ */
+
+/dts-v1/;
+
+#include "th1520.dtsi"
+
+/ {
+	model = "Milk-V Meles";
+	compatible = "milkv,meles", "thead,th1520";
+
+	aliases {
+		ethernet0 = &gmac0;
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		gpio4 = &gpio4;
+		gpio5 = &aogpio;
+		mmc0 = &emmc;
+		mmc1 = &sdio0;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x2 0x0>;
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&fan_pins>;
+		pwms = <&pwm 2 10000000 0>;
+		cooling-levels = <0 64 192 255>;
+		#cooling-cells = <2>;
+	};
+};
+
+/* Names follow the 40-pin header signal labels. */
+&aogpio {
+	gpio-line-names = "", "", "", "", "", "", "", "AOGPIO_7",
+			  "AOGPIO_8", "", "AOGPIO_10", "AOGPIO_11";
+};
+
+&emmc {
+	bus-width = <8>;
+	max-frequency = <52000000>;
+	cap-mmc-highspeed;
+	mmc-ddr-1_8v;
+	non-removable;
+	no-sdio;
+	no-sd;
+
+	status = "okay";
+};
+
+&gmac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_pins>, <&mdio0_pins>;
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+&gpio0 {
+	gpio-line-names = "", "", "", "", "", "", "", "", "GPIO0_8",
+			  "GPIO0_9", "GPIO0_10", "GPIO0_11", "", "", "",
+			  "", "GPIO0_16", "GPIO0_17";
+};
+
+&gpio2 {
+	gpio-line-names = "GPIO2_0", "GPIO2_1", "", "", "", "", "", "",
+			  "", "", "", "GPIO2_11", "GPIO2_12", "",
+			  "GPIO2_14", "GPIO2_15", "GPIO2_16", "GPIO2_17",
+			  "", "", "", "", "GPIO2_22", "GPIO2_23",
+			  "GPIO2_24", "GPIO2_25", "", "", "", "", "",
+			  "GPIO2_31";
+};
+
+&gpio3 {
+	gpio-line-names = "GPIO3_0", "GPIO3_1", "GPIO3_2", "GPIO3_3";
+};
+
+&mdio0 {
+	phy0: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
+
+&osc {
+	clock-frequency = <24000000>;
+};
+
+&osc_32k {
+	clock-frequency = <32768>;
+};
+
+&padctrl0_apsys {
+	fan_pins: fan-0 {
+		pwm2-pins {
+			pins = "QSPI0_CSN1";
+			function = "pwm";
+			bias-disable;
+			drive-strength = <25>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	gmac0_pins: gmac0-0 {
+		tx-pins {
+			pins = "GMAC0_TX_CLK",
+			       "GMAC0_TXEN",
+			       "GMAC0_TXD0",
+			       "GMAC0_TXD1",
+			       "GMAC0_TXD2",
+			       "GMAC0_TXD3";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <25>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "GMAC0_RX_CLK",
+			       "GMAC0_RXDV",
+			       "GMAC0_RXD0",
+			       "GMAC0_RXD1",
+			       "GMAC0_RXD2",
+			       "GMAC0_RXD3";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	mdio0_pins: mdio0-0 {
+		mdc-pins {
+			pins = "GMAC0_MDC";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <13>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		mdio-pins {
+			pins = "GMAC0_MDIO";
+			function = "gmac0";
+			bias-disable;
+			drive-strength = <13>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	sdio0_pins: sdio0-0 {
+		detn-pins {
+			pins = "SDIO0_DETN";
+			function = "sdio";
+			bias-disable; /* external pull-up */
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pins = "UART0_RXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
+&sdio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio0_pins>;
+	bus-width = <4>;
+	max-frequency = <50000000>;
+	cap-sd-highspeed;
+	no-1-8-v;
+	disable-wp;
+	no-sdio;
+
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+
+	status = "okay";
+};

-- 
2.47.3

