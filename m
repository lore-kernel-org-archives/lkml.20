Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBD8342515
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827266; cv=none; b=mPF8VbgFCZhXgO1oxm1iV/47cOachbnJM/KjbLsRrQ1mVOlO6cZnrt5ywMPEAjSQerQRxWm2Wmw9nRwSKRod/m6Gk9Va+Qap317Qd80JgGJH6LOVJX/bfxzCS8CH6FvW8BKoUl/eTSMxtBbqCadfYLX3LKcKKXqQ0DAgERHS4RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827266; c=relaxed/simple;
	bh=WRSgkDBY5tNM3yui/Kxcf6xHhw9r2/E8S3QTsi7mNCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kSGeld5v3nRe8kZ8G8aucrIjQ0LkjkX1iOyZ4Wj9t7QOXXJLNLyvo6bSCmdDkPsh4rn5nk94r3J3F2GqqHYgdhhRc+gZ/MYoi6hA7r61jsv1JB/J3RBmRU//14yd5OJhpFvYVsO3fNdxMk0l5veTWUcG7/BReCy6neaRO3K6VLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=N3aLYUGW; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="N3aLYUGW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so920252f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827262; x=1790432062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJXc10uVHArrgWQfirQzw4xfu+i+JBRRlfN/XUL1Ils=;
        b=N3aLYUGWG+ZBzslmo9NV7uQrfldnC5ieq+ODz2/aLQjkbybklidpv0eJFxQu5CAkLK
         WsrfTF3owFQXuHDHvPdzpaGgSemo+MGalvYy+o9/EMlU7QRz6Os8JANmP0oivVVF+Uav
         /flOaO8pyVrC0HCKDZMXMPNGHFFRaRYeQMAa1LlEueLiCXqSGCKnqLShyqahmH1OYbMi
         +SAWFLWHEiYvdAhO31IsfvCRx4wIPX1N7qgAKZvrNmQTddby0bEtiJ1UPmXgL8kDkO+d
         WYa45q2Yrb5wYbjQ1mY7mV2Q68V/4kbZ/3AJQltk4xrp3TgSa53iRGQeOnuw+FqqiaTJ
         r43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827262; x=1790432062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJXc10uVHArrgWQfirQzw4xfu+i+JBRRlfN/XUL1Ils=;
        b=Ek+KF6mlcHg6Gd0clnmGC/LQTGAoGDe4dyJfeOBvyVHuPtPd9ZChENx1UDk5lbBawR
         UjbkAloiPRaZzLL3MtddcLrb4JHKKBYD2PsTh5FcNZjk/AL7hOHzZhAYybamposS7uIn
         bgLzAPPiqdSbp8dfvnCOS/egDMaW5EqD5PsghEOAFODZsMltNVB/p1oUtErP+rwGRh0X
         izQoyUhJkKOlUTjEuXFvEU4y64Yx/5flQQqItna8eoj7GvjXWklKeqRycIJjueVgbIy8
         /xYN+J2sKeTEt0k1ozwdJz4iSdDHed7ytc91dCNirF2JebRrj+Ag7y78CFoEpVDbwNx7
         Zj6A==
X-Forwarded-Encrypted: i=1; AKwUvBwwROTQI0zI1p8kBjLlSUg7RaxW7OnyHPBD/e5jzeMLtB0i5uWAErcH1FH2spECWkWSE8YpwbE5wC+2u9k=@vger.kernel.org
X-Gm-Message-State: AFuF++k9WuXEA5o7m+V0gBph6FsNiDpnoo/R25E7oihNH/IrSvHXrkUP
	xkvaZqxddO1yx6pgTwdpqb/Yt0VTIdPj2P+1Fw91qxWXkcA5UHjmOnsEzAJ/fDyjwGY=
X-Gm-Gg: AYBFou1TTWUQ5poksL1p6dBDH/PSdLTfk/X3fHjxOipcD1Dq2cIHHuA+2ZT0tBF+SDL
	7fWrIsMlMe/C3qPnLUpztTbRGI5JZQBtEl2eA/ie6+KCO/wwpuQNL0H4xtDvvbiLXyr5IBNX68Y
	tWPouIQUGVbBzr32ymFYvJufSbrR1aNPf/3PEq7aLKg2QUHMNEWpuziAEryXiVv9rxAaLUGKfBT
	DihmbqB+RaSnKJ557sgMk2Cw6FAU1st0xoyvq7Zh56UMjkfOwMGJOG+vogCFt7ImrvTyZ9wFI59
	JNl9azfbE/SB3Ivswc4a8z8qDuG/luhp7dmhiPIuO8Zrxvcn7H/hf9NfpAnpJLNCjNyYsCvnbJW
	a4oqiO3r2w7amEhs0O4QUELUU5JLNgzFgrlwWWNRb4HrbDwOuDYZYCfKkD0jb1i6IU47hWRLPwK
	hiflXbYVmm2vIOWBCR/HLnMjJr2+jhUqQsCHcRszdh0LfDAtmDsO9oIVJzmyf4Uk9z/nkYh1map
	CCErzjS499frP77xmbfXQ9dqZbcZSL0cSclCA8Y5ymPgDNRr2qb68bT
X-Received: by 2002:a05:600c:19c8:b0:49f:ce78:3565 with SMTP id 5b1f17b1804b1-49fce7835f7mr20772865e9.22.1789827262336;
        Sat, 19 Sep 2026 07:14:22 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd090f0csm106078635e9.15.2026.09.19.07.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:14:21 -0700 (PDT)
Message-ID: <09c057fe-bcaa-4e57-bedc-40dc1fcc770c@tuxon.dev>
Date: Sat, 19 Sep 2026 17:14:18 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: microchip: lan969x: add SDMMC nodes
To: Robert Marko <robert.marko@sartura.hr>, ulfh@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, adrian.hunter@intel.com,
 aubin.constans@microchip.com, ehristev@kernel.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-5-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260907132617.1198548-5-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Roberto,

On 9/7/26 16:25, Robert Marko wrote:
> Add nodes for both SDMMC controllers. Connect their bus interface clock to
> the fabric clock and their core clock to the corresponding generated clock.
> 
> Configure SDMMC0 with a 100 MHz generated clock for 50 MHz eMMC DDR
> operation. Configure SDMMC1 with an exact 50 MHz generated clock so the
> integer base clock encoded in the SDHCI capabilities remains accurate and
> the identification clock does not exceed 400 kHz.
> 
> Keep both nodes ordered by unit address.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> * Use the fabric clock for the SDMMC bus interface clock.
> * Configure SDMMC1 with an exact 50 MHz generated clock.
> * Move the SDMMC1 node to preserve unit-address ordering.
> * Explain the selected clock rates in the commit description.
> 
>   arch/arm64/boot/dts/microchip/lan9691.dtsi | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> index a8541c6a098d..5e330d5fab50 100644
> --- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
> +++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
> @@ -414,6 +414,18 @@ qspi0: spi@e0804000 {
>   			status = "disabled";
>   		};
>   
> +		sdmmc0: mmc@e0830000 {
> +			compatible = "microchip,lan9691-sdhci",
> +				     "microchip,sam9x60-sdhci";
> +			reg = <0xe0830000 0x00000300>;

s/0x00000300/0x300
> +			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&fabric_clk>, <&clks GCK_ID_SDMMC0>;
> +			clock-names = "hclock", "multclk";
> +			assigned-clocks = <&clks GCK_ID_SDMMC0>;
> +			assigned-clock-rates = <100000000>;
> +			status = "disabled";
> +		};
> +
>   		qspi2: spi@e0834000 {
>   			compatible = "microchip,lan9691-qspi";
>   			reg = <0xe0834000 0x00000100>,
> @@ -429,6 +441,18 @@ qspi2: spi@e0834000 {
>   			status = "disabled";
>   		};
>   
> +		sdmmc1: mmc@e0838000 {
> +			compatible = "microchip,lan9691-sdhci",
> +				     "microchip,sam9x60-sdhci";
> +			reg = <0xe0838000 0x00000300>;

Same here. I can adjust it while applying.

With that addressed:
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

