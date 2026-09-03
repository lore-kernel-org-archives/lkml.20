Received: from hqu.edu.cn (hqu.edu.cn [210.34.240.11])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67684326927;
	Thu,  3 Sep 2026 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.34.240.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430745; cv=none; b=nqlxYzJ9Dj+TJqlaIepVzTbeVu840CuY+7wLAkL+qMFa1JMewmG91wvv0jIFO5kMFdYvdbmkrGG/M5e5/owSGSoMHTbD9utjP3qmRKXinkFVfGuhVwdLvFGUAL48qstte0+VsUEPqeKqqE6xbO8pCuEFC3uBD5h+7zWVasDyyzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430745; c=relaxed/simple;
	bh=LnzK8gFs/Iazf1bdID7yRRgNAasKpTbjzZbyQSH29AI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/qP2w8bw+T83rRzlLdgMac/7FZzW4HJQRSgooreyQl8tXNq0i5+Tcn2OgMKTd2OfbDp9aeBZn8h0EnD8UMsyL1ZJw0sW9f6bNLL8R3bcN8xvcXus3xxkv4ecPTc4M7b4biahtrjc6MW+bUIwdodBmzUKzlIqgapE4i3L3QE0Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn; spf=pass smtp.mailfrom=stu.hqu.edu.cn; arc=none smtp.client-ip=210.34.240.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stu.hqu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.hqu.edu.cn
Received: from [127.0.1.1] (unknown [27.42.228.181])
	by cmweb (Coremail) with SMTP id C_Ai0gAXe9qFSZlqyEUHAA--.14896S4;
	Thu, 03 Sep 2026 18:18:49 +0800 (CST)
From: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Date: Thu, 03 Sep 2026 18:18:46 +0800
Subject: [PATCH v3 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-mibox4-dt-v3-2-1a8e395d923c@stu.hqu.edu.cn>
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
In-Reply-To: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8548;
 i=raspberrykan@stu.hqu.edu.cn; h=from:subject:message-id;
 bh=LnzK8gFs/Iazf1bdID7yRRgNAasKpTbjzZbyQSH29AI=;
 b=owEBbQKS/ZANAwAKAZoNcluxItUHAcsmYgBqmUmGypy5D9yCWC93pMRJ4UjBpMwzSNiysRXPv
 V9XlGYVs9uJAjMEAAEKAB0WIQTDd02egjFwFlgfDD2aDXJbsSLVBwUCaplJhgAKCRCaDXJbsSLV
 B5W9D/4jPftTnYI7mJ0nKhjgQwDASUiM9mb+hUiQOr3K+kMrWdzNOPJB/XgdQTk9/kAemnWLgqK
 sgDxsd6hXeRzyRbUg5nlFZ+Eqz/UL7b+gGpjcBCa3PWIVakqp/zBRSIXFcyDZ3NwXy+LmC5jZnb
 THxsB+vvMMsC6VsZqvwqIrXmdHaaTREn2t8Jy4rTxxTDptztwkXCYREAjvZ6ykL1UiIgxk6EYcJ
 iBta0G03ZEYKZRwPiA7idzGyoXBr68ORri+skhA/SQJLeFYJsZ9Y8Jf02xdttdByoLyu8KQa0c8
 azhvq4IU6T4RuB8MzKZk/j7K0bI+WUVhbXnPmi3Y9ZEEkMK1zGZHyrl98jB8bsRm/IMLxQoAFMG
 Q5xdH8WHffgkDTjRMUMmpxeppN9ffwIeTUaYSixXa5RzzetBikONiAH7V1qnSgFxQePxlyTr/i7
 J26+cq84Aoa7Jts8pK2G0YYdKtExIhEvLly9ulG0bh4lj+L9N3xX1C9ahzS1XhHENazATHazh19
 1/opn8xuIGuoQieywYTd0JGWG/5A4WLElJwJIEcHba/lXZI447iN761F6xjuR5sK5Td1vt2TVQb
 qgntU6QSz+wWg5htvF2eqlgoVTRrqL127oB0bTG7ZEM1BIou54xMifv4nejnloBb0rb5wR62sIC
 Tf08b1egC3e8X0g==
X-Developer-Key: i=raspberrykan@stu.hqu.edu.cn; a=openpgp;
 fpr=C3774D9E82317016581F0C3D9A0D725BB122D507
X-CM-TRANSID:C_Ai0gAXe9qFSZlqyEUHAA--.14896S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtw1DGr4DtF47Kry8uw1kAFb_yoW3tFWfpF
	n7Crs5GFWfZryjk3y5Z3yIyFs5Gw1kCFZ7Cr1DWFWrCrWv9FyDK34xtr93ZFn5Wrs7Xw43
	JrWDAry7tF1ag3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mx
	kF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
	MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
	AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
	80aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU
	0xZFpf9x07b2739UUUUU=
X-CM-SenderInfo: ysvskiyqsqlko6vw3hxktxhvlgxou0/1tbiAQASBGqYO2MCOAALsM

Add initial device tree support for the Xiaomi Mi Box 4
(MDZ-21-AA), based on the Amlogic S905L SoC.

Enable the main on-board peripherals including eMMC, Wi-Fi,
HDMI, CEC, USB, audio, power LED, GPU and video decoder.

Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
---
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../dts/amlogic/meson-gxlx-s905l-xiaomi-mibox4.dts | 333 +++++++++++++++++++++
 2 files changed, 334 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa55c..ad6ab4216083 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-vero4k.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-s905l-p271.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-s905l-xiaomi-mibox4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-gt1-ultimate.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-xiaomi-mibox4.dts b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-xiaomi-mibox4.dts
new file mode 100644
index 000000000000..3b293dc31086
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-xiaomi-mibox4.dts
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2026 YuChia-Kan <mail@raspberrykan.dev>
+
+/dts-v1/;
+
+#include "meson-gxl-s905x.dtsi"
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-aiu.h>
+
+/ {
+	compatible = "xiaomi,mibox4", "amlogic,s905l", "amlogic,meson-gxlx";
+	model = "Xiaomi Mi Box 4 (MDZ-21-AA)";
+
+	aliases {
+		serial0 = &uart_AO;
+		mmc0 = &sd_emmc_c;
+		mmc1 = &sd_emmc_a;
+		/delete-property/ mmc2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	av_mute: analog-audio-mute {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AV";
+		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_tmds_out>;
+			};
+		};
+	};
+
+	cvbs_connector: cvbs-connector {
+		compatible = "composite-video-connector";
+
+		port {
+			cvbs_connector_in: endpoint {
+				remote-endpoint = <&cvbs_vdac_out>;
+			};
+		};
+	};
+
+	hdmi_usb_5v: regulator-hdmi-usb-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "HDMI_USB_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddio_boot: regulator-vddio-boot {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vddao_3v3: regulator-vddao-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vddio_ao18: regulator-vddio-ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vcc_3v3: regulator-vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_9 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+		post-power-on-delay-ms = <200>;
+	};
+
+	leds: leds {
+		compatible = "gpio-leds";
+
+		power_led: power-led {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio GPIOX_6 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "Xiaomi-Mi-Box-4";
+		audio-aux-devs = <&av_mute>;
+		audio-widgets = "Line", "Lineout";
+		audio-routing = "AV INL", "ACODEC LOLN",
+				"AV INR", "ACODEC LORN",
+				"Lineout", "AV OUTL",
+				"Lineout", "AV OUTR";
+
+		clocks = <&clkc CLKID_MPLL0>,
+			 <&clkc CLKID_MPLL1>,
+			 <&clkc CLKID_MPLL2>;
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-rates = <294912000>, <270950400>, <393216000>;
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&acodec>;
+			};
+		};
+	};
+};
+
+&acodec {
+	AVDD-supply = <&vddio_ao18>;
+	status = "okay";
+};
+
+&aiu {
+	status = "okay";
+};
+
+&cec_AO {
+	status = "okay";
+	pinctrl-0 = <&ao_cec_pins>;
+	pinctrl-names = "default";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&cvbs_vdac_port {
+	cvbs_vdac_out: endpoint {
+		remote-endpoint = <&cvbs_connector_in>;
+	};
+};
+
+/*
+ * The Mi Box 4 uses a custom efuse layout extracted from the
+ * original firmware.
+ */
+
+/delete-node/ &eth_mac;
+/delete-node/ &sn;
+/delete-node/ &bid;
+
+&efuse {
+	eth_mac: mac-address@0 {
+		reg = <0x00 0x06>;
+	};
+
+	bt_mac: mac-address@6 {
+		reg = <0x06 0x06>;
+	};
+
+	wifi_mac: mac-address@c {
+		reg = <0x0c 0x06>;
+	};
+
+	usid: serial-number@12 {
+		reg = <0x12 0x10>;
+	};
+};
+
+&ethmac {
+	status = "disabled";
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
+	pinctrl-names = "default";
+	hdmi-supply = <&hdmi_usb_5v>;
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+};
+
+&saradc {
+	compatible = "amlogic,meson-gxlx-saradc", "amlogic,meson-saradc";
+	status = "okay";
+	vref-supply = <&vddio_ao18>;
+};
+
+&sd_emmc_a {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	max-frequency = <50000000>;
+	non-removable;
+	no-mmc;
+	no-sd;
+	disable-wp;
+	keep-power-in-suspend;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+
+	rtl8723ds: wifi@1 {
+		reg = <1>;
+		nvmem-cells = <&wifi_mac>;
+		nvmem-cell-names = "mac-address";
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOX_7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+	};
+};
+
+&sd_emmc_b {
+	status = "disabled";
+};
+
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <100000000>;
+	non-removable;
+	disable-wp;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&usb2_phy0 {
+	phy-supply = <&hdmi_usb_5v>;
+};
+
+&vdec {
+	compatible = "amlogic,gxlx-vdec", "amlogic,gx-vdec";
+};

-- 
2.53.0

