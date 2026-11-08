Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.242
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794107724;
	b=X60KVirWz/FUDR4DV462JTHBT6gylY1khz3IM08R5odtx3dqu0Dj6/mPnNZk0JMJneQL
	 uGaL9G2Wxl5LNeH6IrW/a6VmgpJwBXqxYmE6dYhENYCEAzSv3c7cNQk+c4WflE+0GszDZ
	 0NB/ENHlP9tZov95gRHyXsadlMsxRidWItDp5aCTdiSDx8hHuPoMvPFKUTVxo3irK7kvx
	 wI/AkEnig2Xdjvm8plRRYYYyatEughap8qQ5K6/YaWE+oMVUSYCqDxLbBq98Ern2RArtx
	 dsZupPZHXA2xyuAZtznTNLaZnk/jTDR+qewk+LzilThjJkqZU65y8Jized3KyGDR1oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107724;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=lM3R06lN5RqvDRl/k2tH4ahMeiHYdM12iCHEJrgC6wk=;
	b=UDbzZer9dx4KUvDckxL0I0+KA71tW758VW8JF47fxAMObRBjJPdNEa7rdqcvJoaznQ+N
	 spLK/RhfRVgCCbGqO5rHO81YqzTnfxYGEhAk2XFM5Pc4apSxXvLwOSYlfjCJJFRxfwKkB
	 PrgWLFtjndLt7PaBMDyPXQW2PGuODJJ8tCEVxMDizxtdhdCuEmOQrU1U2wRNt89sVTFk6
	 IK+f157KuV00xmJbWRqnJ65qXlXDJ037euKM7fHOMpZKgi0FniL3GAeyplxa+gnpCHf8C
	 26U7t2PthEDn1TwD/JW12GQaFs0CZKdMV5H7ITxJybMv+pZu6qBLFgA8FHC39vpUiTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=P8WiBGr9;
	arc=none smtp.remote-ip=103.209.128.242
Received: from mail-m128242.netease.com (mail-m128242.netease.com [103.209.128.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7177E606A31A;
	Sun,  8 Nov 2026 03:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7177E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=P8WiBGr9
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53e05798d;
	Sun, 8 Nov 2026 11:15:11 +0800 (GMT+08:00)
Message-ID: <f066ac3f-1720-479b-a2e9-198a96d03dd6@rock-chips.com>
Date: Sun, 8 Nov 2026 11:15:09 +0800
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
Subject: Re: [PATCH 4/5] arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
 <20261106-rk3588-evb1-dt-updates-v1-4-bdbe16223589@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-4-bdbe16223589@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1b9271f9d03a7kunm71851a523ae3dc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCS0kYVh9OTxlIH0sYQh9PQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=P8WiBGr9wnTcvHB2H8l9sl8SKmN0k54UNOfHgSTjHwSZ13FvJWN3ot57OepT4gft0OATr3R288gLEOJE989yutl2wuvTLvA/8KHdc8pKGoQAx1kCBPrutFigfI0NXpdxjVjHQ9W/6CAj1AxtbWZIuYDnRia5x6m/+/Ghp15zQxk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=lM3R06lN5RqvDRl/k2tH4ahMeiHYdM12iCHEJrgC6wk=;
	h=date:mime-version:subject:message-id:from;

Hi Sebastian,

On 11/7/2026 5:57 AM, Sebastian Reichel wrote:
> The RK3588 EVB1 comes with a W552793DBA-V10 Touchscreen/Display
> combination. It contains a Wanchanglong W552793BAA panel and a
> Goodix GT1158 touchscreen. This adds the DT description of it.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 90 ++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> index 6a95a8bb6fb8..327ca13b60f0 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
> @@ -204,6 +204,15 @@ vcc12v_dcin: regulator-vcc12v-dcin {
>  		regulator-max-microvolt = <12000000>;
>  	};
>  

I seem unable to apply the patch to the latest linux-next tree.

So I tried to resolve the conflict manually, but the actual
test screen did not display. I will look into this further.


> +	vcc3v3_lcd_mipi: regulator-vcc3v3-lcd-mipi {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_lcd_mipi";
> +		regulator-boot-on;
> +		enable-active-high;
> +		gpio = <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&vcc_3v3_s0>;
> +	};
> +
>  	vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc3v3_pcie30";
> @@ -338,6 +347,43 @@ &cpu_l3 {
>  	cpu-supply = <&vdd_cpu_lit_s0>;
>  };
>  
> +&dsi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "wanchanglong,w552793baa", "raydium,rm67200";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lcd_rst_gpio>;
> +		vdd-supply = <&vcc3v3_lcd_mipi>;
> +		iovcc-supply = <&vcc3v3_lcd_mipi>;
> +		vsp-supply = <&vcc5v0_sys>;
> +		vsn-supply = <&vcc5v0_sys>;
> +		reset-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			mipi_panel_in: endpoint {
> +				remote-endpoint = <&dsi0_out_panel>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi0_in {
> +	dsi0_in_vp3: endpoint {
> +		remote-endpoint = <&vp3_out_dsi0>;
> +	};
> +};
> +
> +&dsi0_out {
> +	dsi0_out_panel: endpoint {
> +		remote-endpoint = <&mipi_panel_in>;
> +	};
> +};
> +
>  &gmac0 {
>  	clock_in_out = "output";
>  	phy-handle = <&rgmii_phy>;
> @@ -495,6 +541,22 @@ hym8563: rtc@51 {
>  	};
>  };
>  
> +&i2c6 {
> +	status = "okay";
> +
> +	gt1x: touchscreen@14 {
> +		compatible = "goodix,gt1158";
> +		reg = <0x14>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&touchscreen_pins>;
> +		reset-gpios = <&gpio0 RK_PD2 GPIO_ACTIVE_HIGH>;
> +		AVDD28-supply = <&vcc3v3_lcd_mipi>;
> +		VDDIO-supply = <&vcc3v3_lcd_mipi>;
> +	};
> +};
> +
>  &i2c7 {
>  	status = "okay";
>  
> @@ -543,6 +605,10 @@ rgmii_phy: ethernet-phy@1 {
>  	};
>  };
>  
> +&mipidcphy0 {
> +	status = "okay";
> +};
> +
>  &pcie2x1l0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pcie2_0_rst>, <&pcie2_0_wake>, <&pcie2_0_clkreq>, <&wifi_host_wake_irq>;
> @@ -664,6 +730,12 @@ hym8563_int: hym8563-int {
>  		};
>  	};
>  
> +	mipi_dsi {
> +		lcd_rst_gpio: lcd-rst {
> +			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
>  	pcie2 {
>  		pcie2_0_rst: pcie2-0-rst {
>  			rockchip,pins = <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
> @@ -692,6 +764,14 @@ vcc3v3_pcie30_en: vcc3v3-pcie30-en {
>  		};
>  	};
>  
> +	touchscreen {
> +		touchscreen_pins: touchscreen-pins {
> +			rockchip,pins =
> +				<0 RK_PD2 RK_FUNC_GPIO &pcfg_pull_up>,
> +				<0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
>  	usb {
>  		vcc5v0_host_en: vcc5v0-host-en {
>  			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> @@ -1534,3 +1614,13 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
>  		remote-endpoint = <&hdmi1_in_vp1>;
>  	};
>  };
> +
> +&vp3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	vp3_out_dsi0: endpoint@ROCKCHIP_VOP2_EP_MIPI0 {
> +		reg = <ROCKCHIP_VOP2_EP_MIPI0>;
> +		remote-endpoint = <&dsi0_in_vp3>;
> +	};
> +};
> 

-- 
Best, 
Chaoyi

