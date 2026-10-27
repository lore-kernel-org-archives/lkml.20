Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793062595;
	b=y88sa6emqNPRo+pwNwXe35JtQgKHIgHJ3JTsgS1wpWBioQ/rhHW/iN1VabVOkzLtDviK
	 aYnqQUaHmtsaEng1BrLqXubDRt7mtiR7x1YhIpL+wJ6PD3tGjhPuFYs9wKC7JPK9kSgMq
	 4onRhMKYyO/vKgfDnlFIwL3ZlNfMhHuXSxzcTW4dySI0nNMllLRXQcdJ6T80EWyncJ+io
	 teHUJ90aVdbGqSVMj2Ea6Fm/oiSkmpBO0uvTuPISKDBiLwwWfp5EfBNmqPFSUHUx49HOV
	 3AqZjYVrkcFBkkWXbpB+XuLPKQXSslsRKolW5nOE3ZR5l1p7PbT/AdOeSX7Q+MGXwOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793062595;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=FSAxfmic52ND3G8dQDz0tc2KBUjw/SYV9wPYI5DUcGg=;
	b=ObDeZUgLL5PXacUoY/ROrV5HcghY8XTWbQqRGR6AEfBh0UfsOYOzVEQGJS+bE2+o3vdY
	 pF+dxF73Va5vlqqea1a+NTcSGYd+96YjUAXJ1nXnxfiVk4jPq8V5UJwBmeJ+SjVx12pMn
	 VkWdRNHu4nqcVws0NKLuvLWSDVhA1sCa5kGqCG0pFjlV0WT+5wNg+GuVNp/xydbE0bMQQ
	 wRvhT+dn1V/76w4g14zKwP0clty8mp0NioMBqOesvr/VjWgkjSvTY9Z9hSKajXAcCJB1o
	 TKI6TmysXPX48Q2ly22Z93o399j8kJo4W0OEKxXBRsMaudPaZntkjMv6FniRODKzAxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PWL363Gd;
	arc=none smtp.remote-ip=103.209.128.35
Received: from mail-m12835.netease.com (mail-m12835.netease.com [103.209.128.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5560606A326;
	Tue, 27 Oct 2026 00:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5560606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PWL363Gd
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 526ea9e6d;
	Tue, 27 Oct 2026 08:56:23 +0800 (GMT+08:00)
Message-ID: <edacd4f1-1124-4439-9eda-633c7a4a6f8c@rock-chips.com>
Date: Tue, 27 Oct 2026 08:56:19 +0800
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
Cc: shawn.lin@rock-chips.com, Artem Shimko <a.shimko.dev@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Simon Xue <xxm@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add the watchdog reset to RK3399
To: iav@iav.lv, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261027-rk3399-wdt-reset-v1-1-de9615abb0ec@iav.lv>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261027-rk3399-wdt-reset-v1-1-de9615abb0ec@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17adbbbac03a4kunma90a6e004743a1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTktOVkJNSR8ZHR9PSx9LGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PWL363GdUjW1784OfG7j+YKI7o/gFsCMvKUsjaCHhA2WFslocJsNLRvCL1YreVxr+O45uyPM7Kq0juXgChueXnqPDFWX1pVeiw6ZNVXF4zq/pSJ9+Ny2sH198XWu9XqoxmnM6JNY43W0p0Djo4vSlFTdq3AGMa3oQifoaCUsM9c=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=FSAxfmic52ND3G8dQDz0tc2KBUjw/SYV9wPYI5DUcGg=;
	h=date:mime-version:subject:message-id:from;

Cc: Simon

在 2026/10/27 星期二 8:20, Igor Velkov via B4 Relay 写道:
> From: Igor Velkov <iav@iav.lv>
> 
> The RK3399 watchdog at 0xff848000 is reset by SRST_P_WDT0 (bit 5 of
> CRU_SOFTRST_CON20), but its node has no resets property. Its clock is
> gated from SECURE_GRF_SOC_CON3[8], out of reach for Linux, so without
> the reset dw_wdt_stop() can only set WDOG_HW_RUNNING and the watchdog
> keeps counting through s2idle: on a Kobol Helios64 and a ROCK Pi 4A,
> s2idle longer than the watchdog timeout ends in a watchdog reset.
> 
> With the reset line dw_wdt_stop() can stop the watchdog, and with
> "watchdog: dw_wdt: manage reset line during system suspend/resume" the
> driver holds it in reset while the system sleeps.
> 
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> The dw_wdt side is applied in the watchdog tree:
> https://lore.kernel.org/r/20261024140854.25664-3-a.shimko.dev@gmail.com
> ---
>   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
> index c46e58d4af0d..7b71b24c1f51 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
> @@ -1748,6 +1748,7 @@ watchdog@ff848000 {
>   		reg = <0x0 0xff848000 0x0 0x100>;
>   		clocks = <&cru PCLK_WDT>;
>   		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH 0>;
> +		resets = <&cru SRST_P_WDT0>;
>   	};
>   
>   	rktimer: rktimer@ff850000 {
> 
> ---
> base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
> change-id: 20261027-rk3399-wdt-reset-c58d2111609d
> 
> Best regards,

