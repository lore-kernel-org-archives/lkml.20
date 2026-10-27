Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109337;
	b=2ot7M1Gwo1l9VBL8sDdsu4YXWCgJmIadcHs9Fa5HD1y5NeBz+8I/5B6b8q8s5vWc81K1
	 aUaWdrIChldTSKt/sYT3/UDSX7sZgUGbFJQI+xy40Upf6FAJgKryhqQcMdOeW1qjq5pNp
	 KEIKivleFz1ArtFKGNZ/s+Bbc3q16CYCWV+/Ev71L/17e+ypoXLVzBeVbZ5/+nOH33CQu
	 cw1HUamrlHs32FVnCEot/YPanq065RhcwEMavgGnmYqtPg0i/VWtDrCqkuKsDChzXohrF
	 PGSuv8plxjY9pJzRQ9QQvk5qwzLrhq17M/yvVVhIIhOC4EUNlrEUzyEYpCBdI7uNndA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109337;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=sKuXSxiqi1dS1S7ydoFnufGpBsXCwFdivhOS6O9PI0Q=;
	b=qXLnNYYb7fceAj14mNy/BN5KuP8IpgJJrKCcRdeQOgJ8czB7lq7igLiifKZg4Nsx0mik
	 7Yty/9zGV2T7weu0BbyBosIxjozstCTKM3D+XLJ1JudlRI6JaVzFZ4TTVwjO+Lusbe7RH
	 uZP9xVgghL9c2+ZbNRZHOHnt/E+R3KLWxuLvm6LK75+Pc6BOQn84ulHVgIdUmTeMG1l/Q
	 9M7SmdoteR9bQyaX5U3vePgcLLd3L4zSjBBna9N0P1uvA196WbVOxblRoAFhqr8gMZp6g
	 pR/yzUEYABfPKcO5+EwrIzTl7ZZ4omT9dBNk8Vr3TAHrlERfqXLU4l9z5NozO9T7/Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=LlERGqcA;
	arc=none smtp.remote-ip=154.81.10.221
Received: from mail-m10221.netease.com (mail-m10221.netease.com [154.81.10.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680D2606A321;
	Tue, 27 Oct 2026 13:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 680D2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=LlERGqcA
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5287e03cc;
	Tue, 27 Oct 2026 21:55:24 +0800 (GMT+08:00)
Message-ID: <e028ba53-0c69-4ba6-9b16-8648b8a787b2@rock-chips.com>
Date: Tue, 27 Oct 2026 21:55:22 +0800
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
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable Wi-Fi on the NanoPi M5
To: Leonard Lausen <leonard@lausen.nl>, Heiko Stuebner <heiko@sntech.de>
References: <20261025205339.14539-2-leonard@lausen.nl>
 <4b7bd146-93fd-41f8-ad3c-88333adc73b4@rock-chips.com>
 <20261026070821.324094-1-leonard@lausen.nl>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261026070821.324094-1-leonard@lausen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17da4f44003a4kunm3406670ee05a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTU9DVk4YTBhKTkhJGU5NTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=LlERGqcAe2bas/HHj75UcJ6kYuXtp/j0l7/rh2iyqk7G2g1/8yVarOz7tD22gByc7xjkOtWLDDS+4EMGxkNI73csTgnliUtpV013dicn+DZ32rh6yHSS/g7GVzF9sGqKu77sBdOlG6MLZg6pxtcinaB3yD27pEXwyMmei+TYBBk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=sKuXSxiqi1dS1S7ydoFnufGpBsXCwFdivhOS6O9PI0Q=;
	h=date:mime-version:subject:message-id:from;

Hi Leonard,

在 2026/10/26 星期一 15:06, Leonard Lausen 写道:
> The NanoPi M5 has an M.2 E-key slot for SDIO Wi-Fi modules such as the
> RTL8822CS-based AC200. The SDIO controller is disabled and the module's
> power sequence is not described, preventing the card from enumerating.
> 

I suspect RTL8822CS doesn't work as-is, unless you need to apply it[1].
Please double check it.

[1] 
https://lore.kernel.org/linux-mmc/20261027122417.954133-1-rojer@rojer.me/T/#t

> Enable the controller in four-bit SDR104 mode and connect its 3.3 V card
> and 1.8 V I/O supplies. Describe the active-low reset on GPIO1_C2, the
> 200 ms power-on delay used by the vendor device tree, and the external
> 32.768 kHz clock from the HYM8563 RTC. Keep the card powered during
> suspend as required by the rtw88 SDIO driver.
> 
> The SDIO wiring and reset timing are based on FriendlyElec's NanoPi M5
> vendor device tree by jensen <jensenhuang@friendlyarm.com>.
> 
> Link: https://github.com/friendlyarm/kernel-rockchip/commit/6f07f3e0b7ec54be90ae30f097d2a9d5aea80974
> Assisted-by: LLM
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> ---
> Hi Shawn,
> 
>> disable-wp is for sd cards, please drop it.
> 
> Thank you. Dropped it from the SDIO controller in v2.
> This was mistakenly copied from vendor source.
> 
> Changes in v2:
> - Drop disable-wp from the SDIO controller (Shawn Lin).
> - Credit the original vendor source and document AI assistance.
> 
> AI assistance was used to inspect the vendor DTS and schematics, draft
> the DTS changes and commit message, and run build/style checks.
> 
>   .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 33 +++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> index 3a305408fa16c..baf1dea2cfa98 100644
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
> @@ -890,6 +907,22 @@ &saradc {
>   	status = "okay";
>   };
>   
> +&sdio {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
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
> 
> base-commit: ae965b9856f033145e292b0c29082a26bcc45efd

