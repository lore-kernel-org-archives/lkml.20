Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.81.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974834;
	b=gPoIqpd2WwoSWImxQe36fJFezzL7BKWIaIoG8nGl08epu3NHUGkbp7KSL/sVqsmmAOw4
	 6EFvusShtZclkGQQXe1F/aRrgCbO/G+KY5FHbHGNncdE3Nz5zYXK3Ln1cfO34sFBw+DIF
	 amPZ2CxqZ+DHWTPRkE0amFSn35C0AJi8WTxnhuQICC44gcbzAmxcmQLOudNoG0aght124
	 suTRN9EYDLECR+Ut8iW3sFlitg7SDCg55TdwwsTV86Wg9SMSytALsxda0200IKa0annrY
	 5bQJvtqG1UCbFldg/+D3Uzgr8euHjg7DXIZFZQ3LtZevt4hivhvxNWJJS9y/s8RTmwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974834;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=+9VnkTVZa5ILKHrRCMZEXP+36VdKYsWK9GWspe2p5rE=;
	b=JF3Z9t4SWfT7LYCqU1giqFLVE++UBzko5p9dej9qyANJmbNPqmRlAjBEyiJ/g+qrEQ9y
	 2BnSUDRdtom04v2gHTfHepJHs6NR2alf2ApiEw89GmjYBoSlWV1sF5BvNA9HCxPuX+uun
	 rHsJS79SNIzv3xziYW0Zh2gfQ2iQyhSyS37j2064IcWHBDxr0fwyXQ0vAM3KL4qPXMhzx
	 2CH/T1GRzam/vd8h2YKNJpqq9mVGuvDIHRzPqE2LruAeWWY15Jg8rs4fmF9py8fdoLccB
	 vmFU9SGTT4+u58KFqSdQC1ObxUDBsYzlYbwQfTcygO9uY95f8dpzbE9h06iRVloJ2dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=HhLY1O7u;
	arc=none smtp.remote-ip=156.224.81.108
Received: from mail-m81108.xmail.ntesmail.com (mail-m81108.xmail.ntesmail.com [156.224.81.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF3D606A31A;
	Mon, 26 Oct 2026 00:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BF3D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=HhLY1O7u
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52470fe96;
	Mon, 26 Oct 2026 08:33:41 +0800 (GMT+08:00)
Message-ID: <4b7bd146-93fd-41f8-ad3c-88333adc73b4@rock-chips.com>
Date: Mon, 26 Oct 2026 08:33:41 +0800
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
Cc: shawn.lin@rock-chips.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, heiko@sntech.de
Subject: Re: [PATCH] arm64: dts: rockchip: Enable Wi-Fi on the NanoPi M5
To: Leonard Lausen <leonard@lausen.nl>
References: <20261025205339.14539-2-leonard@lausen.nl>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261025205339.14539-2-leonard@lausen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa175a0986703a4kunm2868e8063c52c7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTBhDVkwdSU4eGRhJQh9IHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=HhLY1O7uNKLtSMhQOf0XfdncyG4p3WeNQVKSDyPYpEqyPUruh0VpprvnPhn0gk4CXO3hcA3hJNw5rU38d0ohVwU3ZL0PS7eatueMYSoMngTL/INn+AyrJ7myT37A/c/CTUM8wcWx54/IIgwornfCtkF8mFvoqDfT1OCbAJS65DM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=+9VnkTVZa5ILKHrRCMZEXP+36VdKYsWK9GWspe2p5rE=;
	h=date:mime-version:subject:message-id:from;



在 2026/10/26 星期一 4:52, Leonard Lausen 写道:
> The NanoPi M5 has an M.2 E-key slot for SDIO Wi-Fi modules such as the
> RTL8822CS-based AC200. The SDIO controller is disabled and the module's
> power sequence is not described, preventing the card from enumerating.
> 
> Enable the controller in four-bit SDR104 mode and connect its 3.3 V card
> and 1.8 V I/O supplies. Describe the active-low reset on GPIO1_C2, the
> 200 ms power-on delay used by the vendor device tree, and the external
> 32.768 kHz clock from the HYM8563 RTC. Keep the card powered during
> suspend as required by the rtw88 SDIO driver.
> 
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> ---
>   .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> index 3a305408fa16c..bfa18de1ae1af 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> @@ -23,6 +23,7 @@ aliases {
>   		ethernet0 = &gmac0;
>   		ethernet1 = &gmac1;
>   		mmc0 = &sdmmc;
> +		mmc1 = &sdio;
>   	};
>   
>   	chosen {
> @@ -212,6 +213,16 @@ vcc_3v3_s0: regulator-vcc-3v3-s0 {
>   		vin-supply = <&vcc_3v3_s3>;
>   	};
>   
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&hym8563>;
> +		clock-names = "ext_clock";
> +		pinctrl-0 = <&wifi_reg_on_h>;
> +		pinctrl-names = "default";
> +		post-power-on-delay-ms = <200>;
> +		reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
> +	};
> +
>   	sound {
>   		compatible = "simple-audio-card";
>   		pinctrl-names = "default";
> @@ -855,6 +866,12 @@ pcie0_perstn: pcie0-perstn {
>   		};
>   	};
>   
> +	sdio-pwrseq {
> +		wifi_reg_on_h: wifi-reg-on-h {
> +			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>   	sdmmc {
>   		sdmmc0_pwren_h: sdmmc0-pwren-h {
>   			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>;
> @@ -890,6 +907,23 @@ &saradc {
>   	status = "okay";
>   };
>   
> +&sdio {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	disable-wp;

disable-wp is for sd cards, please drop it.

> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3_s3>;
> +	vqmmc-supply = <&vcc_1v8_s3>;
> +
> +	status = "okay";
> +};
> +
>   &sdmmc {
>   	bus-width = <4>;
>   	cap-sd-highspeed;

