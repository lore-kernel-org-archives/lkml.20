Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=88.99.92.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337067;
	b=rabWrliVpwxpuLiz/nDl/n2YJi+e9v6LvzmreKpkDW9eDMUE1ogWZ89ViWude1+6y5GW
	 9ulC/E23g0riVVrh8ydBPuBcgJ8aIvg0zZwmmxrc1NOyeRVU+Z1UcQiyttRQz+zAxOfsk
	 YEDI5ALrrc3ZLwnmwDKtwKXEzOI6wSKMmT3U+eMGG3AtdsiyJlXWW/8K4yhCXNR7xLCUe
	 ZbTlPiP9ai7pr8TciB1i+zPYJdNaYoixlIEdPCrlfc5Lbw+HML7BkSjl85CwhHlyQPJtd
	 eZqEe7KIM41WdpmOspUEe56r4Fvan4nvh+teYEwVA9z6tPjiXj1OXj0pkb0R/utAd8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337067;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Tt+WmpAkUFOgrfzi7btk/x8M0AYBTyuSqOIMJxNpD+0=;
	b=NzKu1VsMwm5A754bZswd5XlnfDLI9hnmBo2YZWIVh8lV8EQBMzAPFlF1QwOIBKXwLFgU
	 cZY6Gu8hwj5rfSCB9tUSwRNOMi92r4eoAcqF0ff7TBgbHyFEIsqpE+WnwqqtNB4a0MFN/
	 srFASHiMtVZIUn7BZ46zmZqV17s7eeRmss48hxSQ1VFImwNt72Sa3RGJMj+nPxHsul88w
	 GYGWjMwlJ8KClQ+dRkUzoMpHfKZdUmO9M4MLbh424w+BAaD9Zfc0Ofp0N3KOGSPpR7Ch8
	 ogmh2hQaZNDN9REfhWkFyTz7tnWiQL1doTG4HWRwtH5kxsuFlYKD2Zvio4cK9cdNcTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rojer.me;
	spf=pass smtp.mailfrom=rojer.me;
	dkim=pass header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=O9a8UIa7;
	arc=none smtp.remote-ip=88.99.92.76
Received: from mail1.rojer.cloud (mail1.rojer.cloud [88.99.92.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5212606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5212606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rojer.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rojer.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=O9a8UIa7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1794337057; bh=Q4YkH5NtpBumyhhscsY/D/wVL7UIGd+c47iMMzSXQ9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O9a8UIa7eUHrbyVB8oBUf3riQiJbYL+R4gLsXysG3Rcr2SCIyUxXIkHTJLPCrpBXj
	 xcSnngxqF1WX410ViBiY/MB4LO3rm1+8WygkwkrlB4h5Hmzo+hYcY0quvOM+JTvlny
	 iin5qWdBHifecs15G0dyUJ6l4YhMUxfO2ybSGv5ZHtc6vd9IZJq4ashpgdM/X/6L/t
	 Ox+VTLONNOT7X1YmdeyObK9+C1yG0pn72fgi9vvBwhIZ9lzY0Antc1OGqSwmDgqVaM
	 mYt3iawuT76SvbVOZHpVkrgVjITFhwS4bQdXTiOSDzf6l6yY4VzqV0w+HTuEtrbc64
	 8obRQENWHS4+Q==
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id C45B321752
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:37 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f84a55cc06so1409549a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:57:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFig3GxLFgbBkFon3GZEcpC2OongZh9aA5lDJY2LxB60KEZKmTm0Yta/+nc/BVIJXIejjR9iVebNLNn96U=@vger.kernel.org
X-Gm-Message-State: APuU4Z88NIQ2tp7wx7fOIfAq/Itw1jC8HKUqQlfrkRJKUAFJF2CeuzmF
	ioitewpqzItVkCttv+ItQYQbyU1F4k7Vpy0emJJymePSN58R5TMyDqsKcLwr+NAsZbXllKKJ2QE
	8CCt+2dWk0EmAFGCSqsWgNCqWmqzDSA==
X-Received: by 2002:a05:6820:1c8b:b0:6f7:7a4a:9d7b with SMTP id
 006d021491bc7-718a576d5b8mr1715751eaf.41.1794337056322; Tue, 10 Nov 2026
 10:57:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031104714.3271017-1-rojer@rojer.me> <20261031104714.3271017-3-rojer@rojer.me>
In-Reply-To: <20261031104714.3271017-3-rojer@rojer.me>
From: "Deomid \"rojer\" Ryabkov" <rojer@rojer.me>
Date: Tue, 10 Nov 2026 20:57:24 +0200
X-Gmail-Original-Message-ID: <CABFmFwoAMs8upS4wtjJo3oS3r7fFfnffm2Fn5nWOCZ+Z879d+g@mail.gmail.com>
X-Gm-Features: AclHuK9MmlZCXre31qUD1WX8nPu4qqnNXxwDWOVxcYi7QO4VkRvqA9uFGpDjBG0
Message-ID: <CABFmFwoAMs8upS4wtjJo3oS3r7fFfnffm2Fn5nWOCZ+Z879d+g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi
 R2S Plus
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jin@mediatomb.cc, shawn.lin@rock-chips.com, jensenhuang@friendlyarm.com
Content-Type: text/plain; charset="UTF-8"

Hi Heiko,

gentle ping on this one. the mmc changes have been applied for 7.5[1],
it would be nice to get the DT bits in time for 7.5 as well.

[1] https://lore.kernel.org/linux-mmc/CAPx+jO8n6Y9PWDkxurwjjfGXSiGS0KWrYK0C7=5Uqic1Gn+M7w@mail.gmail.com/

On Sat, 31 Oct 2026 at 12:47, Deomid rojer Ryabkov <rojer@rojer.me> wrote:
>
> The NanoPi R2S Plus has an M.2 E-key slot wired to the sdmmc_ext
> controller in 4-bit SDIO mode, where FriendlyElec fit an optional
> Fn-Link 6222B-SRC (Realtek RTL8822CS) module:
>
>   - SDIO signalling at a fixed 1.8V (VCC_18)
>   - WIFI_REG_ON on GPIO3_B0, 32kHz sleep clock from the RK805 CLKOUT2
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
> [2] https://lore.kernel.org/linux-mmc/20261030142224.3183407-1-rojer@rojer.me/
> Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Deomid rojer Ryabkov <rojer@rojer.me>
> ---
>  .../dts/rockchip/rk3328-nanopi-r2s-plus.dts   | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> index 6ba4a74cb1f..a25421f5851 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
> @@ -17,6 +17,15 @@ / {
>         aliases {
>                 mmc1 = &emmc;
>         };
> +
> +       sdio_pwrseq: sdio-pwrseq {
> +               compatible = "mmc-pwrseq-simple";
> +               clocks = <&rk805 1>;
> +               clock-names = "ext_clock";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&wifi_reg_on_h>;
> +               reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> +       };
>  };
>
>  &emmc {
> @@ -34,3 +43,49 @@ &io_domains {
>         vccio4-supply = <&vcc_io_33>;
>         vccio6-supply = <&vcc_18>;
>  };
> +
> +&pinctrl {
> +       wifi {
> +               wifi_reg_on_h: wifi-reg-on-h {
> +                       rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +               };
> +       };
> +};
> +
> +/*
> + * SDR104 tuning fails with the default 4mA drive strength, use 8mA like the
> + * vendor device tree.
> + */
> +&sdmmc0ext_bus4 {
> +       rockchip,pins =
> +               <3 RK_PA4 3 &pcfg_pull_up_8ma>,
> +               <3 RK_PA5 3 &pcfg_pull_up_8ma>,
> +               <3 RK_PA6 3 &pcfg_pull_up_8ma>,
> +               <3 RK_PA7 3 &pcfg_pull_up_8ma>;
> +};
> +
> +&sdmmc0ext_clk {
> +       rockchip,pins = <3 RK_PA2 3 &pcfg_pull_none_8ma>;
> +};
> +
> +&sdmmc0ext_cmd {
> +       rockchip,pins = <3 RK_PA0 3 &pcfg_pull_up_8ma>;
> +};
> +
> +/* Optional M.2 E-key SDIO Wi-Fi module (Fn-Link 6222B-SRC, RTL8822CS) */
> +&sdmmc_ext {
> +       bus-width = <4>;
> +       cap-sd-highspeed;
> +       cap-sdio-irq;
> +       keep-power-in-suspend;
> +       mmc-pwrseq = <&sdio_pwrseq>;
> +       no-mmc;
> +       no-sd;
> +       non-removable;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&sdmmc0ext_clk &sdmmc0ext_cmd &sdmmc0ext_bus4>;
> +       sd-uhs-sdr104;
> +       vmmc-supply = <&vcc_io_33>;
> +       vqmmc-supply = <&vcc_18>;
> +       status = "okay";
> +};
> --
> 2.53.0
>


-- 
Deomid "rojer" Ryabkov
rojer@rojer.me
