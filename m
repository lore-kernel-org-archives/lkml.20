Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109496;
	b=vDbPI69eSxGydl4lb9w6HAzK9TEx/fj/yok/QYa9285Cxvrdw8btkhodytB4q0kQ1wY1
	 nYH1y+WBSd5mZSUaPORAFV5VJcHOL3zq/NVV3W3Ajv50be6kfHefp7PnJpS8vUQs+HQC0
	 HSRbheaDhWsPRcI/auz86SGvctoc3PWdY88XPe/hJnPOLPpU1rZ2fhXsy13oJi7kAp//A
	 vEdJp7bU5VMnHnywbR5l92N0l/vg5T1cOqEYNHpqBzMCV46Ti9U1VM7YyvJxaUtoBmaWR
	 QSuf4Wno4dz6keqBNmxzvLZsUZgAVUmeK/ELj9m/eDAblMa3YJxnMB66CzNor1P1Asw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109496;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=kgs6DMIElefIDmmG0Lqe7pZUKcoCtWm8n8LIAs8gWNY=;
	b=PqyOhTO5RjeERYQPx98ywWah0fZtjpJSDGQeIrNsIn9pqsLgyglPioDNvkHPpfGF17Yp
	 IJ2PDoB9uqP34yPghRjSTQS8a3/WZ4UkqZqL0KqSZHLPPMKgShtfQvGkF1iwoQdgV3E2f
	 xOKhZp8i7IRITtfGDloYjqyzvDIUCcKZRADB+ZbThgQ0EtzQRvk+dLIU+QyMu0Mmj9jx6
	 WDjnO+HNAvN+ppG+0l0/XhdVscDev1434UEwclWtVmRDP4hV3pCEufbPKSd7EoZxPiAyF
	 xi7g2rzbzpaAQNjEdwpO6DbAXtMdpZFxpuR4GRy3x/nuYHxnbiG1WcQrhSapy4TFx8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ejPHUn6R;
	arc=none smtp.remote-ip=156.224.81.154
Received: from mail-m81154.xmail.ntesmail.com (mail-m81154.xmail.ntesmail.com [156.224.81.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB0F606A31A;
	Tue, 27 Oct 2026 13:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB0F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ejPHUn6R
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5287e04b6;
	Tue, 27 Oct 2026 21:58:09 +0800 (GMT+08:00)
Message-ID: <38baaf87-4d5c-48bc-a11f-a5b6c04c20a8@rock-chips.com>
Date: Tue, 27 Oct 2026 21:58:07 +0800
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
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sergey Bostandzhyan <jin@mediatomb.cc>,
 Jensen Huang <jensenhuang@friendlyarm.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S
 Plus
To: Deomid rojer Ryabkov <rojer@rojer.me>, Heiko Stuebner <heiko@sntech.de>
References: <20261023235959.2988087-1-rojer@rojer.me>
 <20261023235959.2988087-3-rojer@rojer.me>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261023235959.2988087-3-rojer@rojer.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17da7790103a4kunmcef2bd90e493
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkpCVktPHk1NTksZTUNNH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ejPHUn6RV6C6gpkCiecTD0LdymLzVdtND/i7tW+egwUwmUnVzgwg1PuoPjdEnE2WzH7LaBj1GyIIUE4DDgWf3rNIFIKLdN6tvHEb3Z+LKLFSWVwyWiCt/civ7J17a+XQ7mdCOCGie+xdPZJ8Pzv6aMTpvJfEauBvYDDLli8VQyI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=kgs6DMIElefIDmmG0Lqe7pZUKcoCtWm8n8LIAs8gWNY=;
	h=date:mime-version:subject:message-id:from;

Hi Deomid

在 2026/10/24 星期六 7:59, Deomid rojer Ryabkov 写道:
> The NanoPi R2S Plus has an M.2 E-key slot wired to the sdmmc_ext
> controller in 4-bit SDIO mode, where FriendlyElec fit an optional
> Fn-Link 6222B-SRC (Realtek RTL8822CS) module:
> 
>    - SDIO signalling at a fixed 1.8V (VCC_18)
>    - WIFI_REG_ON on GPIO3_B0, 32kHz sleep clock from the RK805 CLKOUT2
> 
> Enable the controller and add the power sequence. The SDIO pins need
> 8mA drive strength for SDR104 tuning to succeed, as in the vendor
> device tree [1]; with the SoC default of 4mA no sample phase works.
> 
> On boards without the module the controller gives up after about 0.2s
> ("mmc2: Failed to initialize a non-removable card"); nothing else is
> affected.
> 
> With the mmc core change for the module's CMD11 handling at a fixed
> 1.8V [2], the module is tuned to SDR104 at 150 MHz and works with the
> rtw88_8822cs driver; without it, it runs in high-speed mode at 50 MHz.
> 
> [1] https://github.com/friendlyarm/kernel-rockchip/blob/9238df9d21e835bba35c8ba5248784387936cb2e/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2-rev24.dts#L144-L172
> [2] https://lore.kernel.org/linux-mmc/20261023232813.2983368-1-rojer@rojer.me/
> Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>
> ---
>   .../dts/rockchip/rk3328-nanopi-r2s-plus.dts   | 56 +++++++++++++++++++
>   1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> index 6ba4a74cb1f..db19a18ae45 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> @@ -17,6 +17,15 @@ / {
>   	aliases {
>   		mmc1 = &emmc;
>   	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&rk805 1>;
> +		clock-names = "ext_clock";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_reg_on_h>;
> +		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> +	};
>   };
>   
>   &emmc {
> @@ -34,3 +43,50 @@ &io_domains {
>   	vccio4-supply = <&vcc_io_33>;
>   	vccio6-supply = <&vcc_18>;
>   };
> +
> +&pinctrl {
> +	wifi {
> +		wifi_reg_on_h: wifi-reg-on-h {
> +			rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +/*
> + * SDR104 tuning fails with the default 4mA drive strength, use 8mA like the
> + * vendor device tree.
> + */
> +&sdmmc0ext_bus4 {
> +	rockchip,pins =
> +		<3 RK_PA4 3 &pcfg_pull_up_8ma>,
> +		<3 RK_PA5 3 &pcfg_pull_up_8ma>,
> +		<3 RK_PA6 3 &pcfg_pull_up_8ma>,
> +		<3 RK_PA7 3 &pcfg_pull_up_8ma>;
> +};
> +
> +&sdmmc0ext_clk {
> +	rockchip,pins = <3 RK_PA2 3 &pcfg_pull_none_8ma>;
> +};
> +
> +&sdmmc0ext_cmd {
> +	rockchip,pins = <3 RK_PA0 3 &pcfg_pull_up_8ma>;
> +};
> +
> +/* Optional M.2 E-key SDIO Wi-Fi module (Fn-Link 6222B-SRC, RTL8822CS) */
> +&sdmmc_ext {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	disable-wp;

Drop disable-wp.

Otherwise,

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc0ext_clk &sdmmc0ext_cmd &sdmmc0ext_bus4>;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_io_33>;
> +	vqmmc-supply = <&vcc_18>;
> +	status = "okay";
> +};

