Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.129.254.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793675821;
	b=nevDiKxGgVQ0XrLcFi3qJEpQFoAC47uDLDnOuWooMQ0zd+LI9S3TTb5KJK1yFS36YpZF
	 rigP3AAojqkxp4p3fKVQfiW2h7OdWvttyFZ06ku9gJgTTlH8VwcOnGU46awhaPLhas5Ak
	 7HQCJ4SF+AdKQBJhAH0Crqs0uVzyG+E2WKNjtCUqhSuKkLMZUyFz88hH0GSiTwEtzetWV
	 i+qYvMSC9ioDdxg13Nl/gj6Ash5t9WJMxSZcCcKG6fqmymcUZrA5d6tIzwZVsdUaV2fXK
	 8tui4bG3marP23ChztIDAYD2+M3z+7Cm1fA/ZO8DG08Ba4zFkCO58V1THwxRoSo/KXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675821;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=LEpal+P6ZHLKvKuKIsrpsC1CN7IbicAe3JsrzSw/RAw=;
	b=D2yQTJ5oWFwphvwEGQXd9x4TvFVu49SmTnk91Zhdz/p2z9i7MMRN+qHsS+IAXgX7sb9n
	 WSOVU4YNhMt0WcSQa4Z/y7Al0LHVSnobrWpXFDpM+sSJ1yjMF+FNVrTUEdyDEoQRYCJLO
	 5ZywfWbvNML2Mdu+lxCzs/NPAeK1roS2qpfSrexrCLhu/FD8CKgsO0Uhy+p3NarFPwN9s
	 oqBpjXy/o4mfR1mc7Hde59rHO6W405K1rDJQuEGdKFTxtfEMImUp7bgfcaCHAPGfb0K2H
	 nNIXOAuuzOC3ql2hE0gTG6HLcLTH/q7LdgcaTTt+XRJK86x4Qf6MguqKI8BBT/hHt/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=CHPFAsKX;
	arc=none smtp.remote-ip=103.129.254.97
Received: from mail-m25497.xmail.ntesmail.com (mail-m25497.xmail.ntesmail.com [103.129.254.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C975606A327;
	Tue,  3 Nov 2026 03:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C975606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=CHPFAsKX
Received: from [192.168.61.151] (unknown [61.154.14.87])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5344818dd;
	Tue, 3 Nov 2026 11:16:48 +0800 (GMT+08:00)
Message-ID: <fd6f29f0-15ba-4f98-abbe-3ea18e930df6@rock-chips.com>
Date: Tue, 3 Nov 2026 11:16:47 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Andrew Lunn <andrew@lunn.ch>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/2] arm64: dts: rockchip: Add ALIENTEK QuarkPi-CA2
To: Bob Hui <bg9oxa@163.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261102-quarkpi-ca2-v11-0-eb246076a82f@163.com>
 <20261102-quarkpi-ca2-v11-2-eb246076a82f@163.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261102-quarkpi-ca2-v11-2-eb246076a82f@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa19f68ce2b03a4kunm5bf1e65a4745e6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHUlDVh9JTxhCQkpJGR8ZTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ0xZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=CHPFAsKXrb/jCT0hKcfpS0gt5hYgnfYdopMQZyskIzDv3h8jzjdLE9ua9haqsGCCCWfJg0kF2MEfB7rIx7x4lAqI9WZDR10HZ42ANiwh5ZxDF6VhwTQBnWHur3LEtUk1MnOCiVYVNgAS06lp/rLamgxuOjDMfgesAMWAzDygDLs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=LEpal+P6ZHLKvKuKIsrpsC1CN7IbicAe3JsrzSw/RAw=;
	h=date:mime-version:subject:message-id:from;

在 2026/11/02 星期一 23:00, Bob Hui 写道:
> Add a device tree for the ALIENTEK QuarkPi-CA2, an RK3588S based card
> computer. The board comes in 4, 8 and 16 GiB LPDDR4X variants with
> 32 GB, 64 GB or 128 GB of eMMC; this was tested on the 16 GiB/128 GB
> one.
> 
> Supported peripherals:
>    - 2x LPDDR4X SDRAM and eMMC, plus the microSD card slot
>    - RK806-1 PMIC with the full regulator tree
>    - HDMI output up to 4K60, through hdptxphy0 and VOP2
>    - Gigabit Ethernet with the YT8531 RGMII PHY on MDIO1
>    - four USB Type-A ports (1x USB 3.0, 3x USB 2.0)
>    - USB Type-C port with USB 3.0 and DP output, described through the
>      USBDP PHY and DP0, with role switch and DP altmode
>    - 3.5 mm headset jack (headphones + microphone) with the ES8388
>      codec, the headphone amplifier and jack detection
>    - three function keys (volume down, volume up and PWR_ON from the
>      PMIC) and the headset hook button
>    - IR receiver, 4-pin PWM fan connector and a work LED
>    - 3-wire debug UART (UART2)
>    - 40-pin expansion header with UART5, I2C3, I2C5, SPI0 and PWM14
>    - two 26-pin MIPI DSI and three 22-pin MIPI CSI connectors, with the
>      connector I2C buses enabled (i2c4, i2c7); panels and cameras are
>      described by overlays
>    - M.2 E-key socket for a WiFi/BT module, with the PCIe 2.0 x1 link
>      enabled (pcie2x1l2, combphy0_ps)
>    - Mali GPU and the three NPU cores
> 

Please add a link to the schematic if possible, when adding a new board
suppot, that would make folks easy to check the code.

https://github.com/openedv/card_computer_QuarkPi-CA2-RK3588S/blob/main/2_hardware/3_Peripheral_hardware_interface_diagram/QuarkPI-CA2%20V1.0%20Peripheral%20Hardware%20Interface%20Reference.pdf


Otherwise, sdmmc/sdhci/PCIe parts look good to me,
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Bob Hui <bg9oxa@163.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch> #gmac1 + mdio1
> ---
>   arch/arm64/boot/dts/rockchip/Makefile              |    1 +
>   .../boot/dts/rockchip/rk3588s-quarkpi-ca2.dts      | 1202 ++++++++++++++++++++
>   2 files changed, 1203 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index e7936a21c1185..02c2a127a9181 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -236,6 +236,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5-pro.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-cm5-base.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-quarkpi-ca2.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-radxa-cm5-io.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-roc-pc.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5a.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> new file mode 100644
> index 0000000000000..c7889f729191d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> @@ -0,0 +1,1202 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "rk3588s.dtsi"
> +
> +/ {
> +	compatible = "alientek,quarkpi-ca2", "rockchip,rk3588s";
> +	model = "Alientek QuarkPi-CA2";
> +
> +	adc_keys: adc-keys {
> +		compatible = "adc-keys";
> +		io-channels = <&saradc 1>;
> +		io-channel-names = "buttons";
> +		keyup-threshold-microvolt = <1800000>;
> +		poll-interval = <100>;
> +
> +		button-vol-down {
> +			label = "volume down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			press-threshold-microvolt = <417000>;
> +		};
> +
> +		button-vol-up {
> +			label = "volume up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			press-threshold-microvolt = <17000>;
> +		};
> +	};
> +
> +	aliases {
> +		ethernet0 = &gmac1;
> +		mmc0 = &sdhci;
> +		mmc1 = &sdmmc;
> +	};
> +	analog_sound: analog-sound {
> +		compatible = "simple-audio-card";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hp_det &hp_con>;
> +		simple-audio-card,name = "QuarkPi-CA2 ES8388";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,bitclock-master = <&sound_cpu>;
> +		simple-audio-card,frame-master = <&sound_cpu>;
> +		simple-audio-card,mclk-fs = <256>;
> +		simple-audio-card,aux-devs = <&hp_amp>;
> +		simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
> +		simple-audio-card,pin-switches = "Headphones", "Headset Mic";
> +		simple-audio-card,widgets =
> +			"Headphone", "Headphones",
> +			"Microphone", "Headset Mic";
> +		simple-audio-card,routing =
> +			"Headphones", "LOUT1",
> +			"Headphones", "ROUT1",
> +			"Headphones", "Headphone Power OUTL",
> +			"Headphones", "Headphone Power OUTR",
> +			"Headphone Power INL", "LOUT1",
> +			"Headphone Power INR", "ROUT1",
> +			"LINPUT1", "Headset Mic",
> +			"RINPUT1", "Headset Mic";
> +		sound_cpu: simple-audio-card,cpu {
> +			sound-dai = <&i2s0_8ch>;
> +		};
> +
> +		sound_codec: simple-audio-card,codec {
> +			sound-dai = <&es8388>;
> +			system-clock-frequency = <12288000>;
> +		};
> +	};
> +
> +	hp_amp: audio-amplifier {
> +		compatible = "simple-audio-amplifier";
> +		sound-name-prefix = "Headphone Power";
> +		enable-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:1500000n8";
> +	};
> +	hdmi0-con {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi0_con_in: endpoint {
> +				remote-endpoint = <&hdmi0_out_con>;
> +			};
> +		};
> +	};
> +
> +	headset_keys: headset-keys {
> +		compatible = "adc-keys";
> +		io-channels = <&saradc 3>;
> +		io-channel-names = "buttons";
> +		keyup-threshold-microvolt = <1800000>;
> +		poll-interval = <100>;
> +
> +		button-play-pause {
> +			label = "play pause";
> +			linux,code = <KEY_PLAYPAUSE>;
> +			press-threshold-microvolt = <2000>;
> +		};
> +	};
> +	ir_receiver: ir-receiver {
> +		compatible = "gpio-ir-receiver";
> +		gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ir_receiver_pin>;
> +	};
> +
> +	leds: leds {
> +		compatible = "gpio-leds";
> +
> +		work_led: led-0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			gpios = <&gpio1 RK_PD7 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&work_led_pin>;
> +		};
> +	};
> +
> +	fan: pwm-fan {
> +		compatible = "pwm-fan";
> +		#cooling-cells = <2>;
> +		pwms = <&pwm7 0 50000 0>;
> +		cooling-levels = <0 50 100 150 200 255>;
> +	};
> +
> +	combophy_avdd0v85: regulator-combophy-avdd0v85 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "combophy_avdd0v85";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <850000>;
> +		regulator-max-microvolt = <850000>;
> +		vin-supply = <&vdd_0v85_s0>;
> +	};
> +
> +	combophy_avdd1v8: regulator-combophy-avdd1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "combophy_avdd1v8";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&avcc_1v8_s0>;
> +	};
> +
> +	vbus5v0_typec: regulator-vbus5v0-typec {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		regulator-name = "vbus5v0_typec";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&vcc5v0_usb>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&typec5v_pwren>;
> +	};
> +
> +	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_1v1_nldo_s3";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
> +		compatible = "regulator-fixed";
> +		gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sd_s0_pwr>;
> +		regulator-name = "vcc_3v3_sd_s0";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_3v3_s3>;
> +	};
> +
> +	vcc12v_dcin: regulator-vcc12v-dcin {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc12v_dcin";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +	};
> +
> +	vcc3v3_pcie: regulator-vcc3v3-pcie {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_pcie";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc12v_dcin>;
> +	};
> +
> +	vcc5v0_sys: regulator-vcc5v0-sys {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc12v_dcin>;
> +	};
> +
> +	vcc5v0_usb: regulator-vcc5v0-usb {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_usb";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		ramoops: ramoops@118000 {
> +			compatible = "ramoops";
> +			reg = <0 0x118000 0 0xd8000>;
> +			console-size = <0x80000>;
> +			ftrace-size = <0x00000>;
> +			pmsg-size = <0x30000>;
> +			record-size = <0x14000>;
> +		};
> +	};
> +};
> +
> +&combphy0_ps {
> +	status = "okay";
> +};
> +
> +&combphy2_psu {
> +	status = "okay";
> +};
> +
> +&cpu_b0 {
> +	cpu-supply = <&vdd_cpu_big0_s0>;
> +	mem-supply = <&vdd_cpu_big0_s0>;
> +};
> +
> +&cpu_b1 {
> +	cpu-supply = <&vdd_cpu_big0_s0>;
> +	mem-supply = <&vdd_cpu_big0_s0>;
> +};
> +
> +&cpu_b2 {
> +	cpu-supply = <&vdd_cpu_big1_s0>;
> +	mem-supply = <&vdd_cpu_big1_s0>;
> +};
> +
> +&cpu_b3 {
> +	cpu-supply = <&vdd_cpu_big1_s0>;
> +	mem-supply = <&vdd_cpu_big1_s0>;
> +};
> +
> +&cpu_l0 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +	mem-supply = <&vdd_cpu_lit_mem_s0>;
> +};
> +
> +&cpu_l1 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +	mem-supply = <&vdd_cpu_lit_mem_s0>;
> +};
> +
> +&cpu_l2 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +	mem-supply = <&vdd_cpu_lit_mem_s0>;
> +};
> +
> +&cpu_l3 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +	mem-supply = <&vdd_cpu_lit_mem_s0>;
> +};
> +
> +&dp0 {
> +	status = "okay";
> +};
> +
> +&dp0_in {
> +	dp0_in_vp1: endpoint {
> +		remote-endpoint = <&vp1_out_dp0>;
> +	};
> +};
> +
> +&dp0_out {
> +	dp0_out_con: endpoint {
> +		remote-endpoint = <&usbdp_phy0_dp_in>;
> +	};
> +};
> +
> +&gmac1 {
> +	phy-mode = "rgmii-id";
> +	clock_in_out = "input";
> +
> +	snps,reset-gpio = <&gpio0 RK_PD5 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 20000 100000>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus
> +		     &gmac1_clkinout>;
> +
> +	phy-handle = <&rgmii_phy1>;
> +	status = "okay";
> +};
> +
> +&gpu {
> +	mali-supply = <&vdd_gpu_s0>;
> +	status = "okay";
> +};
> +
> +&hdmi0 {
> +	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
> +		     &hdmim0_tx0_scl &hdmim0_tx0_sda>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&hdmi0_in {
> +	hdmi0_in_vp0: endpoint {
> +		remote-endpoint = <&vp0_out_hdmi0>;
> +	};
> +};
> +
> +&hdmi0_out {
> +	hdmi0_out_con: endpoint {
> +		remote-endpoint = <&hdmi0_con_in>;
> +	};
> +};
> +
> +&hdmi0_sound {
> +	status = "okay";
> +};
> +
> +&hdptxphy0 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0m2_xfer>;
> +	status = "okay";
> +
> +	vdd_cpu_big0_s0: regulator@42 {
> +		compatible = "rockchip,rk8602";
> +		reg = <0x42>;
> +		fcs,suspend-voltage-selector = <1>;
> +		regulator-name = "vdd_cpu_big0_s0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <550000>;
> +		regulator-max-microvolt = <1050000>;
> +		regulator-ramp-delay = <2300>;
> +		vin-supply = <&vcc5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vdd_cpu_big1_s0: regulator@43 {
> +		compatible = "rockchip,rk8603", "rockchip,rk8602";
> +		reg = <0x43>;
> +		fcs,suspend-voltage-selector = <1>;
> +		regulator-name = "vdd_cpu_big1_s0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <550000>;
> +		regulator-max-microvolt = <1050000>;
> +		regulator-ramp-delay = <2300>;
> +		vin-supply = <&vcc5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1m4_xfer>;
> +	status = "okay";
> +
> +	es8388: audio-codec@11 {
> +		compatible = "everest,es8388", "everest,es8328";
> +		reg = <0x11>;
> +		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
> +		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&i2s0_mclk>;
> +		assigned-clock-rates = <12288000>;
> +		AVDD-supply = <&vcc_3v3_s0>;
> +		DVDD-supply = <&vcc_1v8_s0>;
> +		HPVDD-supply = <&vcc_3v3_s0>;
> +		PVDD-supply = <&vcc_3v3_s0>;
> +		#sound-dai-cells = <0>;
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2m0_xfer>;
> +	status = "okay";
> +
> +	vdd_npu_s0: vdd_npu_mem_s0: regulator@42 {
> +		compatible = "rockchip,rk8602";
> +		reg = <0x42>;
> +		fcs,suspend-voltage-selector = <1>;
> +		regulator-name = "vdd_npu_s0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <550000>;
> +		regulator-max-microvolt = <950000>;
> +		regulator-ramp-delay = <2300>;
> +		vin-supply = <&vcc5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	husb311: typec-port@4e {
> +		compatible = "hynetek,husb311", "richtek,rt1711h";
> +		reg = <0x4e>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <RK_PA4 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usbc0_int>;
> +		vbus-supply = <&vbus5v0_typec>;
> +
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
> +			op-sink-microwatt = <1000000>;
> +
> +			altmodes {
> +				displayport {
> +					svid = /bits/ 16 <0xff01>;
> +					vdo = <0xffffffff>;
> +				};
> +			};
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usbc0_orien_sw: endpoint {
> +						remote-endpoint = <&usbdp_phy0_orientation_switch>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usbc0_role_sw: endpoint {
> +						remote-endpoint = <&dwc3_0_role_switch>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					dp_altmode_mux: endpoint {
> +						remote-endpoint = <&usbdp_phy0_dp_altmode_mux>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c3m1_xfer>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c4m3_xfer>;
> +	status = "okay";
> +};
> +
> +&i2c5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c5m2_xfer>;
> +	status = "okay";
> +};
> +
> +&i2c7 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c7m0_xfer>;
> +	status = "okay";
> +};
> +
> +&i2s0_8ch {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2s0_lrck &i2s0_sclk &i2s0_sdi0 &i2s0_sdo0>;
> +	status = "okay";
> +};
> +
> +&i2s5_8ch {
> +	status = "okay";
> +};
> +
> +&mdio1 {
> +	rgmii_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +
> +		motorcomm,clk-out-frequency-hz = <125000000>;
> +		motorcomm,keep-pll-enabled;
> +	};
> +};
> +
> +&package_thermal {
> +	polling-delay = <1000>;
> +
> +	cooling-maps {
> +		map0 {
> +			trip = <&fan_trip0>;
> +			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
> +		};
> +
> +		map1 {
> +			trip = <&fan_trip1>;
> +			cooling-device = <&fan 1 2>;
> +		};
> +
> +		map2 {
> +			trip = <&fan_trip2>;
> +			cooling-device = <&fan 2 3>;
> +		};
> +
> +		map3 {
> +			trip = <&fan_trip3>;
> +			cooling-device = <&fan 3 4>;
> +		};
> +
> +		map4 {
> +			trip = <&fan_trip4>;
> +			cooling-device = <&fan 4 THERMAL_NO_LIMIT>;
> +		};
> +	};
> +
> +	trips {
> +		fan_trip0: fan-trip0 {
> +			temperature = <50000>;
> +			hysteresis = <2000>;
> +			type = "active";
> +		};
> +
> +		fan_trip1: fan-trip1 {
> +			temperature = <55000>;
> +			hysteresis = <2000>;
> +			type = "active";
> +		};
> +
> +		fan_trip2: fan-trip2 {
> +			temperature = <60000>;
> +			hysteresis = <2000>;
> +			type = "active";
> +		};
> +
> +		fan_trip3: fan-trip3 {
> +			temperature = <65000>;
> +			hysteresis = <2000>;
> +			type = "active";
> +		};
> +
> +		fan_trip4: fan-trip4 {
> +			temperature = <70000>;
> +			hysteresis = <2000>;
> +			type = "active";
> +		};
> +	};
> +};
> +
> +&pcie2x1l2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie2x1l2_perstn>;
> +	reset-gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_HIGH>;
> +	vpcie3v3-supply = <&vcc3v3_pcie>;
> +	status = "okay";
> +};
> +
> +&pd_gpu {
> +	domain-supply = <&vdd_gpu_s0>;
> +};
> +
> +&pd_npu {
> +	domain-supply = <&vdd_npu_s0>;
> +};
> +
> +&pinctrl {
> +	headphone {
> +		hp_con: hp-con {
> +			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +		hp_det: hp-det {
> +			rockchip,pins = <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +	ir {
> +		ir_receiver_pin: ir-receiver-pin {
> +			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	leds {
> +		work_led_pin: work-led-pin {
> +			rockchip,pins = <1 RK_PD7 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +
> +	pcie {
> +		pcie2x1l2_perstn: pcie2x1l2-perstn {
> +			rockchip,pins = <3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +	sdmmc {
> +		sd_s0_pwr: sd-s0-pwr {
> +			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	usb-typec {
> +		typec5v_pwren: typec5v-pwren {
> +			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		usbc0_int: usbc0-int {
> +			rockchip,pins = <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +};
> +
> +&pwm14 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm14m1_pins>;
> +	status = "okay";
> +};
> +
> +&pwm7 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm7m0_pins>;
> +	status = "okay";
> +};
> +
> +&rknn_core_0 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_mem_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_core_1 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_mem_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_core_2 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_mem_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_mmu_0 {
> +	status = "okay";
> +};
> +
> +&rknn_mmu_1 {
> +	status = "okay";
> +};
> +
> +&rknn_mmu_2 {
> +	status = "okay";
> +};
> +
> +&saradc {
> +	status = "okay";
> +	vref-supply = <&vcc_1v8_s0>;
> +};
> +
> +&sata0 {
> +	/* shares combphy0_ps with pcie2x1l2 */
> +	status = "disabled";
> +};
> +
> +&sdhci {
> +	bus-width = <8>;
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +	max-frequency = <200000000>;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	full-pwr-cycle-in-suspend;
> +	vmmc-supply = <&vcc_3v3_s3>;
> +	vqmmc-supply = <&vcc_1v8_s3>;
> +	status = "okay";
> +};
> +
> +&sdmmc {
> +	max-frequency = <150000000>;
> +	no-sdio;
> +	no-mmc;
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3_sd_s0>;
> +	vqmmc-supply = <&vccio_sd_s0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det>;
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0m3_pins>;
> +	cs-gpios = <&gpio3 RK_PD4 GPIO_ACTIVE_LOW>,
> +		<&gpio3 RK_PD5 GPIO_ACTIVE_LOW>;
> +	num-cs = <2>;
> +	status = "okay";
> +};
> +
> +&spi2 {
> +	status = "okay";
> +	assigned-clocks = <&cru CLK_SPI2>;
> +	assigned-clock-rates = <200000000>;
> +	num-cs = <1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
> +
> +	pmic@0 {
> +		compatible = "rockchip,rk806";
> +		reg = <0x0>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
> +			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
> +		spi-max-frequency = <1000000>;
> +		system-power-controller;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		vcc1-supply = <&vcc5v0_sys>;
> +		vcc2-supply = <&vcc5v0_sys>;
> +		vcc3-supply = <&vcc5v0_sys>;
> +		vcc4-supply = <&vcc5v0_sys>;
> +		vcc5-supply = <&vcc5v0_sys>;
> +		vcc6-supply = <&vcc5v0_sys>;
> +		vcc7-supply = <&vcc5v0_sys>;
> +		vcc8-supply = <&vcc5v0_sys>;
> +		vcc9-supply = <&vcc5v0_sys>;
> +		vcc10-supply = <&vcc5v0_sys>;
> +		vcc11-supply = <&vcc_2v0_pldo_s3>;
> +		vcc12-supply = <&vcc5v0_sys>;
> +		vcc13-supply = <&vcc_1v1_nldo_s3>;
> +		vcc14-supply = <&vcc_1v1_nldo_s3>;
> +		vcca-supply = <&vcc5v0_sys>;
> +
> +		rk806_dvs1_null: dvs1-null-pins {
> +			pins = "gpio_pwrctrl1";
> +			function = "pin_fun0";
> +		};
> +
> +		rk806_dvs2_null: dvs2-null-pins {
> +			pins = "gpio_pwrctrl2";
> +			function = "pin_fun0";
> +		};
> +
> +		rk806_dvs3_null: dvs3-null-pins {
> +			pins = "gpio_pwrctrl3";
> +			function = "pin_fun0";
> +		};
> +
> +		regulators {
> +			vdd_cpu_lit_s0: vdd_cpu_lit_mem_s0: dcdc-reg2 {
> +				regulator-name = "vdd_cpu_lit_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <550000>;
> +				regulator-max-microvolt = <950000>;
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_vdenc_s0: vdd_vdenc_mem_s0: dcdc-reg4 {
> +				regulator-name = "vdd_vdenc_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <550000>;
> +				regulator-max-microvolt = <950000>;
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_gpu_s0: dcdc-reg1 {
> +				regulator-name = "vdd_gpu_s0";
> +				regulator-boot-on;
> +				regulator-min-microvolt = <550000>;
> +				regulator-max-microvolt = <950000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-enable-ramp-delay = <400>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_1v8_s3: dcdc-reg10 {
> +				regulator-name = "vcc_1v8_s3";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vdd_log_s0: dcdc-reg3 {
> +				regulator-name = "vdd_log_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <675000>;
> +				regulator-max-microvolt = <750000>;
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_ddr_s0: dcdc-reg5 {
> +				regulator-name = "vdd_ddr_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <675000>;
> +				regulator-max-microvolt = <900000>;
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd2_ddr_s3: dcdc-reg6 {
> +				regulator-name = "vdd2_ddr_s3";
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vcc_2v0_pldo_s3: dcdc-reg7 {
> +				regulator-name = "vdd_2v0_pldo_s3";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <2000000>;
> +				regulator-max-microvolt = <2000000>;
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vcc_3v3_s3: dcdc-reg8 {
> +				regulator-name = "vcc_3v3_s3";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vddq_ddr_s0: dcdc-reg9 {
> +				regulator-name = "vddq_ddr_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_0v75_s3: nldo-reg1 {
> +				regulator-name = "vdd_0v75_s3";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <750000>;
> +				regulator-max-microvolt = <750000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vdd_ddr_pll_s0: nldo-reg2 {
> +				regulator-name = "vdd_ddr_pll_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <850000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			avdd_0v75_s0: nldo-reg3 {
> +				regulator-name = "avdd_0v75_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <837500>;
> +				regulator-max-microvolt = <837500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_0v85_s0: nldo-reg4 {
> +				regulator-name = "vdd_0v85_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <850000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_0v75_s0: nldo-reg5 {
> +				regulator-name = "vdd_0v75_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <750000>;
> +				regulator-max-microvolt = <750000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			avcc_1v8_s0: pldo-reg1 {
> +				regulator-name = "avcc_1v8_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_1v8_s0: pldo-reg2 {
> +				regulator-name = "vcc_1v8_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			avdd_1v2_s0: pldo-reg3 {
> +				regulator-name = "avdd_1v2_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1200000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_3v3_s0: pldo-reg4 {
> +				regulator-name = "vcc_3v3_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vccio_sd_s0: pldo-reg5 {
> +				regulator-name = "vccio_sd_s0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			pldo6_s3: pldo-reg6 {
> +				regulator-name = "pldo6_s3";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&tsadc {
> +	status = "okay";
> +};
> +
> +&u2phy0 {
> +	status = "okay";
> +};
> +
> +&u2phy0_otg {
> +	status = "okay";
> +};
> +
> +&u2phy2 {
> +	status = "okay";
> +};
> +
> +&u2phy2_host {
> +	phy-supply = <&vcc5v0_usb>;
> +	status = "okay";
> +};
> +
> +&u2phy3 {
> +	status = "okay";
> +};
> +
> +&u2phy3_host {
> +	phy-supply = <&vcc5v0_usb>;
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-0 = <&uart2m0_xfer>;
> +	status = "okay";
> +};
> +
> +&uart5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart5m1_xfer>;
> +	status = "okay";
> +};
> +
> +&usb_host0_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host0_ohci {
> +	status = "okay";
> +};
> +
> +&usb_host0_xhci {
> +	usb-role-switch;
> +	status = "okay";
> +
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dwc3_0_role_switch: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&usbc0_role_sw>;
> +		};
> +	};
> +};
> +
> +&usb_host1_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host1_ohci {
> +	status = "okay";
> +};
> +
> +&usb_host2_xhci {
> +	status = "okay";
> +};
> +
> +&usbdp_phy0 {
> +	mode-switch;
> +	orientation-switch;
> +	sbu1-dc-gpios = <&gpio1 RK_PA6 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios = <&gpio1 RK_PA7 GPIO_ACTIVE_HIGH>;
> +	rockchip,dp-lane-mux = <2 3>;
> +	status = "okay";
> +
> +	port {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		usbdp_phy0_orientation_switch: endpoint@0 {
> +			reg = <0>;
> +			remote-endpoint = <&usbc0_orien_sw>;
> +		};
> +
> +		usbdp_phy0_dp_altmode_mux: endpoint@1 {
> +			reg = <1>;
> +			remote-endpoint = <&dp_altmode_mux>;
> +		};
> +
> +		usbdp_phy0_dp_in: endpoint@2 {
> +			reg = <2>;
> +			remote-endpoint = <&dp0_out_con>;
> +		};
> +	};
> +};
> +
> +&vop {
> +	status = "okay";
> +};
> +
> +&vop_mmu {
> +	status = "okay";
> +};
> +
> +&vp0 {
> +	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
> +		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
> +		remote-endpoint = <&hdmi0_in_vp0>;
> +	};
> +};
> +
> +&vp1 {
> +	vp1_out_dp0: endpoint@a {
> +		reg = <ROCKCHIP_VOP2_EP_DP0>;
> +		remote-endpoint = <&dp0_in_vp1>;
> +	};
> +};
> 

