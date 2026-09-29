Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8016C503915;
	Tue, 29 Sep 2026 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677422; cv=none; b=aoA1q445yoqh+5dtkDPctlaTqF1AexY399Cy3ain+fBsVZRaa7C00uqPzj3ygCNydhCtQdluH03DkCP85UMCY0JtqwcNyb2FegHcQ1wR6ZiUcI8WUjWoXU6CexWyIR5DDStDEm4IdYLlqjx1pCfVaF8lsraxaTPO2J+A/CnQOfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677422; c=relaxed/simple;
	bh=RM4MAL+rYv6fqJDGjoxUizxAVdFatK1zK2WBNRTsjj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HnA6ebxymIm75FxyYBgzpdw1FTpFT/Sg3Zoeg2mU/9DGkA1G6S7ncFhXJLbArahcvwFJxnAd34BEZM3y/j78LNs/3Bl0c9MXzP3ux0dY7B+ljlzlCuqhFzx3SGt6MUp5/+6UAQl2bLbQyrXR2APRA6/dlai/na1UzrTG7N9VLwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-01 (Coremail) with SMTP id qwCowAD3kPR2kbtqxsxdCQ--.22338S5;
	Tue, 29 Sep 2026 18:23:19 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Tue, 29 Sep 2026 18:22:47 +0800
Subject: [PATCH 3/4] riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-rv-meles-v1-3-effdd14a76e8@iscas.ac.cn>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
In-Reply-To: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
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
X-CM-TRANSID:qwCowAD3kPR2kbtqxsxdCQ--.22338S5
X-Coremail-Antispam: 1UD129KBjvJXoWxAF1ftrW8Zr1UtFW5uF45ZFb_yoWrGrWfpa
	ySkrs3XF93uFWfKwsIvF4I9F15Wr48Jas2krn5Wry8uFWjgasrZr1Fkr1rZFyqgFW5Zw4a
	vrWrAry2yr12k3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUHWlkUUUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBgQFDGq7hl0qPQABsX

Connect AP6256 to SDIO1 with its fixed supplies and PMIC LPO clock.
Use GPIO0_20 for WL_REG_ON and GPIO0_21 for the host-wake interrupt.
Keep GPIO1_24 low to select the external antenna by default.

Use the existing BCM43456 binding and the 198 MHz board limit.
Keep module power during suspend and assign mmc2 to SDIO1.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 93 ++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
index 3714047190789bfccd8ff6810342d7ff865e74e4..92b44cb90f57f4830efd29145744c005afa73119 100644
--- a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
+++ b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "th1520.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Milk-V Meles";
@@ -22,6 +23,7 @@ aliases {
 		gpio5 = &aogpio;
 		mmc0 = &emmc;
 		mmc1 = &sdio0;
+		mmc2 = &sdio1;
 		serial0 = &uart0;
 	};
 
@@ -29,6 +31,13 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	wifi_32k: clock-wifi-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		/* The module LPO input is supplied by PMIC_32K_OUT. */
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x2 0x0>;
@@ -42,6 +51,30 @@ fan: pwm-fan {
 		cooling-levels = <0 64 192 255>;
 		#cooling-cells = <2>;
 	};
+
+	wifi_vbat: regulator-wifi-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "WIFI_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	wifi_vddio: regulator-wifi-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "WIFI_VDDIO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_enable_pins>;
+		reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <50>;
+	};
 };
 
 /* Names follow the 40-pin header signal labels. */
@@ -77,6 +110,16 @@ &gpio0 {
 			  "", "GPIO0_16", "GPIO0_17";
 };
 
+&gpio1 {
+	/* GPIO1_24 low selects the external antenna through U39. */
+	wifi-antenna-select-hog {
+		gpio-hog;
+		gpios = <24 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "wifi-external-antenna";
+	};
+};
+
 &gpio2 {
 	gpio-line-names = "GPIO2_0", "GPIO2_1", "", "", "", "", "", "",
 			  "", "", "", "GPIO2_11", "GPIO2_12", "",
@@ -206,6 +249,26 @@ rx-pins {
 	};
 };
 
+&padctrl1_apsys {
+	wifi_enable_pins: wifi-enable-0 {
+		gpio-pins {
+			pins = "GPIO0_20";
+			bias-disable;
+			drive-strength = <7>;
+			input-disable;
+		};
+	};
+
+	wifi_host_wake_pins: wifi-host-wake-0 {
+		gpio-pins {
+			pins = "GPIO0_21";
+			bias-disable;
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+};
+
 &sdio0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdio0_pins>;
@@ -219,6 +282,36 @@ &sdio0 {
 	status = "okay";
 };
 
+&sdio1 {
+	bus-width = <4>;
+	max-frequency = <198000000>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	non-removable;
+	no-sd;
+	no-mmc;
+	keep-power-in-suspend;
+	vmmc-supply = <&wifi_vbat>;
+	vqmmc-supply = <&wifi_vddio>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	wifi@1 {
+		compatible = "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		clocks = <&wifi_32k>;
+		clock-names = "lpo";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake_pins>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;

-- 
2.47.3

