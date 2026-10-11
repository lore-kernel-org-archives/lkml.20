Received: from mail-m19731113.qiye.163.com (mail-m19731113.qiye.163.com [220.197.31.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD53F42AA9;
	Sun, 11 Oct 2026 04:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791691938; cv=none; b=SusCtKv17FnuD3TMmRUEbPsUiOkE/d5U3g98WfOb/fNUXDZMAOzr0j0MnTEmeGDhkt7nTRjuA9K6ZPbQeCNazUTzPXhwWlYjSlBznVbi+FQrBn3F/6Ng/qsbIpdkyjdFSTQouvD1BaSVdA51kwffuGbZlcDFjQMpTrp7VAqQ6ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791691938; c=relaxed/simple;
	bh=BIhnSRkxnjByp6jgM7SyUOrR35QovMQeGgQXrQdcA+s=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D0drNSFgTPvTGC55DTngpphZ8xDXKOHOotow7LweSa8R3l5F6iNmKqSfO5kSWqww0sjReXqYQ3/aVdQ5EIg16DUqBZpI/D+FWeaRq+cTMpiFITdoV5H5ijIxXZrI2jwAUUBbm6827uQkoPEzvHIIq0XOGmVfRe7673oY4RkTPmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=DunVzkjc; arc=none smtp.client-ip=220.197.31.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="DunVzkjc"
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5097b761b;
	Sun, 11 Oct 2026 09:49:39 +0800 (GMT+08:00)
Message-ID: <8bf7a001-8b65-4129-8b41-a2986bb78643@rock-chips.com>
Date: Sun, 11 Oct 2026 09:49:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HS400 enhanced strobe on
 Kobol Helios64 eMMC
To: iav@iav.lv, Heiko Stuebner <heiko@sntech.de>
References: <20261011-b4-helios64-emmc-hs400-v1-1-36951d319229@iav.lv>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261011-b4-helios64-emmc-hs400-v1-1-36951d319229@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa128a6c25703a4kunm693df481f314c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0JPVkoZQ0lJTE0YTh5PSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=DunVzkjct1HK2gDhGF78vAGWOTvXmbTFQCh7jdOS9zME+63fNyXovf246jrlLtHymCuh7IhBhE6hXj7e22ZxFXxNQRR65irjZ3/7IU3Y41SWAfKeJWwf5C0gppNIqzSez7L2SkUBt7yRgAX2XFZGGv4ZhPowE9pEnx+s9w7iurY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1i8L10GRky4bG22WnSj3l/2lPWD2x42vP1059qe6SY4=;
	h=date:mime-version:subject:message-id:from;

在 2026/10/11 星期日 5:52, Igor Velkov via B4 Relay 写道:
> From: Igor Velkov <iav@iav.lv>
> 
> The eMMC of Helios64 runs in HS200. Run it in HS400 enhanced strobe at
> 150 MHz, as on Gru. The strobe line goes straight from the SoC to the
> DS pin of the eMMC with no pull-down on the board, so enable the one
> in the eMMC PHY.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Schematic, sheet 14:
> https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
> 
> Tested on mainline with three 2 GiB write and read-back passes, no
> errors. Raw reads go from 180 MB/s in HS200 to 247 MB/s. Without the
> pull-down, writes dropped to about 1 MB/s with repeated
> "mmc1: running CQE recovery".
> ---
>   arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> index 63ad79b4c8ac..f78482c4c285 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> @@ -320,6 +320,7 @@ &cpu_l3 {
>   };
>   
>   &emmc_phy {
> +	rockchip,enable-strobe-pulldown;
>   	status = "okay";
>   };
>   
> @@ -586,8 +587,11 @@ &saradc {
>   };
>   
>   &sdhci {
> +	assigned-clock-rates = <150000000>;
>   	bus-width = <8>;
>   	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
>   	non-removable;
>   	vqmmc-supply = <&vcc1v8_sys_s0>;
>   	status = "okay";
> 
> ---
> base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
> change-id: 20261011-b4-helios64-emmc-hs400-9c784f35d8dd
> 
> Best regards,

