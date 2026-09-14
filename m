Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9997F424D57
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379204; cv=none; b=P3N+iGeAVG8W0mMAvS9XROflWROJkCTwPARmjfih5nd04zcwN2Bp+jBd4eVEqVcqa81RDLENjW2PTLxtxPIdqr0eqcc6AdoA8+m1bTnM1q487N+AMlHuQRDwQOYkZ/Z9jNwCYw1Mqo+0+9DtwE+itcdZXbxxJ6Y6SQOmVNoPPTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379204; c=relaxed/simple;
	bh=nXbOP/4mMXUyKJ7QpGLqKgglcZMvE01VhV6d4/ztRRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJ90wufiTx8h6Qs5vmT+OF9sz/6NPX9V8kv7ViSyuuWQN8nRhS0hOD6zRu+HrQRbsqToWQnloZ6eBFr51bDmF37y8TX02CtO6Ft6ICzYoUnloBgZ0buggUulGZZZGazxvCegHrPL3Jn3qO8cEBpeP31kKvQdhWZbsEXdb1MA98g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=UcXLKyd/; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="UcXLKyd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1789379200;
 bh=W1U/BBBtVf3N1qfQmcjwgxjBVHkUfhadLlBtORLZQtU=;
 b=UcXLKyd/busfK9ggXBRe7fB/Ms7/3DQjuKNAtcTkK+a0Ozt97A/eHJHv8rxDYBF+1r63agWho
 gJG/GvYcjEhz0pEKN3qESwpCrqQyCuz5wHybJXxGairvSqrgD1ChinIfTSbZiSRk8YmT4EMxadP
 0ISOWtQLuLv7zCkN0K6mLb6xnDiKeXE/Ilr1FzuE5QuitQjZjh9Lpwara/sncH6tucl/8rjxcgK
 LxOhWTfja1lE5bouVtGdKBcsB5wZOxVpYEtzkWvRHh/ic7jeFWEAMhZW1+C77oIM+m+SH0plxEz
 Hgu1B7QAsT1jPp4Vx+IMtiWDrag6hnGJKqMl+5dBRiRw==
X-Forward-Email-ID: 6aa7c27b469f56687e0fd9e3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <dcaf96df-4a51-446a-a92d-6bb4e21af618@kwiboo.se>
Date: Mon, 14 Sep 2026 11:46:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: rockchip: Add devicetree for the
 FriendlyElec NanoPi R28S
To: HystericalDragons@proton.me
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>,
 Andrey Korshunov <razor1702@gmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260914-r28s-upstream-v5-0-7409c498e8dc@proton.me>
 <20260914-r28s-upstream-v5-3-7409c498e8dc@proton.me>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260914-r28s-upstream-v5-3-7409c498e8dc@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/14/2026 10:24 AM, 安容 via B4 Relay wrote:
> From: 安容 <HystericalDragons@proton.me>
> 
> The NanoPi R28S is a dual gigabit Ethernet router board based on the
> Rockchip RK3528 SoC, designed and developed by FriendlyElec. It shares
> most of its design with the NanoPi Zero2, so it builds on the common
> rk3528-nanopi.dtsi.
> 
> Specification:
> - Rockchip RK3528
> - 1GB RAM
> - eMMC socket (optional)
> - MicroSD slot
> - 1x 1000Base-T (GMAC1, Realtek RTL8211F)
> - 1x 1000Base-T (PCIe, Realtek RTL8111H)
> - AICSemi AIC8800D80 SDIO WiFi
> - 3x LEDs (SYS, LAN, WAN)
> - 1x USB 2.0 Type-C, peripheral only, shared with the 5V power input
> - User and MaskROM buttons
> - Haoyu HYM8563 RTC
> - 1x USB Type-C debug UART (onboard WCH CH340E)
> 
> Assisted-by: LLM
> Signed-off-by: 安容 <HystericalDragons@proton.me>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 127 +++++++++++++++++++++
>  2 files changed, 128 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index b677914cd3..51a9889088 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -94,6 +94,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-vicharak-vaaman.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-hinlink-h28k.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-r28s.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2a.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
> new file mode 100644
> index 0000000000..0b7bbc0122
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
> @@ -0,0 +1,127 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
> + * Copyright (c) 2026 FriendlyElec Computer Tech. Co., Ltd.
> + * Copyright (c) 2026 安容 <HystericalDragons@proton.me>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include "rk3528-nanopi.dtsi"
> +
> +/ {
> +	model = "FriendlyElec NanoPi R28S";
> +	compatible = "friendlyarm,nanopi-r28s", "rockchip,rk3528";
> +
> +	aliases {
> +		mmc2 = &sdio0;

This looks to be missing an serial2 alias:

	serial2 = &uart2;

> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usr_btn>;

This is named gpio4_b2_usr_btn in the schematics.

> +
> +		button-user {
> +			debounce-interval = <50>;
> +			gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
> +			label = "USER";
> +			linux,code = <BTN_1>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwr_wf>;
> +		post-power-on-delay-ms = <100>;
> +		reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&combphy {
> +	status = "okay";
> +};
> +
> +&leds {
> +	pinctrl-0 = <&led1>, <&led2>, <&led_sys>;
> +
> +	led-1 {
> +		color = <LED_COLOR_ID_GREEN>;
> +		default-state = "off";
> +		function = LED_FUNCTION_WAN;
> +		gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
> +		linux,default-trigger = "netdev";
> +	};
> +
> +	led-2 {
> +		color = <LED_COLOR_ID_GREEN>;
> +		default-state = "off";
> +		function = LED_FUNCTION_LAN;
> +		gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
> +		linux,default-trigger = "netdev";
> +	};
> +};
> +
> +&pcie {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie_eth_perstb>;
> +	reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_HIGH>;
> +	vpcie3v3-supply = <&vcc_3v3>;
> +
> +	status = "okay";
> +};
> +
> +&pinctrl {

This is missing nodes for bluetooth:

	bluetooth {
		bt_wake_host: bt-wake-host {
			rockchip,pins = <1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_down>;
		};

		host_wake_bt: host-wake-bt {
			rockchip,pins = <1 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
		};
	};

> +	gpio-keys {
> +		usr_btn: usr-btn {

Label should be named gpio4_b2_usr_btn to match schematics.

> +			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	leds {
> +		led2: led2 {
> +			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pcie {
> +		pcie_eth_perstb: pcie-eth-perstb {
> +			rockchip,pins = <4 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	wifi {

Suggest you also add host_wake_wl:

		host_wake_wl: host-wake-wl {
			rockchip,pins = <1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
		};

> +		pwr_wf: pwr-wf {
> +			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};

and wl_wake_host:

		wl_wake_host: wl-wake-host {
			rockchip,pins = <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>;
		};

> +	};
> +};
> +
> +&sdio0 {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&sdio_pwrseq>;

We can likely be explicit and declare:

	no-mmc;
	no-sd;

> +	non-removable;
> +	sd-uhs-sdr104;

This is missing the vmmc-supply used.

	vmmc-supply = <&vcc_3v3>;

> +	vqmmc-supply = <&vcc_1v8>;
> +
> +	status = "okay";
> +};
> +
> +&uart2 {

We can likely declare dma-names here:

	dma-names = "tx", "rx";

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart2m1_xfer>, <&uart2m1_ctsn>, <&uart2m1_rtsn>;
> +	uart-has-rtscts;
> +
> +	status = "okay";
> +};
> +
> +&usb_host0_xhci {
> +	/* Type-C port, shared with the 5V power input */
> +	dr_mode = "peripheral";

Why do you disable dual role here? Is it not possible to have it work in
host mode? E.g. using a USB hub with power pass-thru?

> +};
> 

Other than above this closely matches what I played around with in
U-Boot [1] a few weeks ago. Main objective was to add NEO3 Plus support,
and only added the R28S DT based on schematics. My R28S should arrive
any day now :-)

[1] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commit/40382468ba7ce9aa2e7dcde0e59003fd0d220b43

Regards,
Jonas

