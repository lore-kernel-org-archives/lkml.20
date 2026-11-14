Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667935;
	b=eRbNoBqECmgYvwrh7Fajs+GlqJjndMMhag744G01TE9tDii6nPnXfENAz12bmwjYxbSZ
	 AE2wGoxcL0rGmx4d1CniBnmztn8NBCxV8Hop/KHg7Fa0jKGGX2RG7SzY4f6nmBps7KVES
	 jY1RcuKXGf7QDCJzwFwXJnIp6gK0ZzJTd9NP93aJTA3amsHLkFQbwa7T1f9t1a5PQaRAn
	 LPbktKRg46QpPjUGoySl0SAAlW8loGlmBdNx6Qm2Zraw+mYMwmCcyvHdcnDY0K9zYR7TF
	 DF12lgZfh7NXzPRAZGxte6SRzc1QS5Cf39ByjvCyqlCnOrdiIlM4B35TpmQBSnTvcgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667935;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SYDvBU/GQ48jNvHkRHhAIzLBWWJbMEQRccqd3pTnQ8M=;
	b=Ib4MEblHEW3Hk9aQf6GU8EhfMBhAuh/wzmzc4N80aca6rPOqoRL4O43W1w/hipTmGBWe
	 60fUAep9VrBFK+w6vkf/IFXWOWT+ecg36+MhAgxAXC8AZJQKY1XJ+XX6q8MS3rVJFSo3w
	 rCKuc1u4cr1KEE86xTyLOYjcJ+f3hh0xKXRBrCY9CSx960MwgCzQr8ZmAVvjxyM2HdeA6
	 n4hSjUq9IvmE0wTXRS19CKHsU8J1FwEYvTO/+5OQGBhjTf+omFPuPTMbF6gEaj6je5QV+
	 kQyEBelyxf1eqeF1/SAowalcnHGt3/Ohh+3BlqVrCMAggQZT/psQE891cFJq4d5oMBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPBhkz0a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5D0606A89A;
	Sat, 14 Nov 2026 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPBhkz0a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2040F1F000CA;
	Sat, 14 Nov 2026 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794667935;
	bh=SYDvBU/GQ48jNvHkRHhAIzLBWWJbMEQRccqd3pTnQ8M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OPBhkz0aXuXfPSKPkXNDi4hg5YWVwkO8HSzqJUVUY6CABzzu/8SOdAT1uJ32VtnNb
	 RCyvjWzkX79BAXIy56lApzBBuMUxwMHrGpjB+1ksgXVcwmu8rTAapRfP/EEHaAuza4
	 aWaB4M8rgkzB3vwPcLZ8fm5vi98hgUtb4IVpifFdoDfrs5fh0leXGrco2GgQvG02fx
	 mOSE0j7hJHoLphU35ofVOBFDYGcy6YSHramsdR6ggPCsjQj9jc2ddmz1OIk+YNv4V8
	 vvlIavdiobfqDvuv/RnDgGbhQK8ZguBvAaX6XLlbsbQvr7uuB3epkTfa4VcyTk5dLm
	 ylHpIOdmiNmNw==
Subject: Re: [PATCH net-next v5 06/10] net: stmmac: mediatek: use standard
 internal delay properties
From: netdev-bot+sashiko@kernel.org
To: louisalexis.eyraud@collabora.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, biao.huang@mediatek.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, edumazet@kernel.org, kernel@collabora.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Sat, 14 Nov 2026 14:52:13 +0000
Message-ID: <179466793371.2199510.16550815274021036547@kernel.org>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-6-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-6-7d99d6292962@collabora.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In mediatek_dwmac_config_dt(), the new RGMII fallback caps the
  vendor value with min(vendor, rgmii_delay_max).
- [Low] The DT binding and the driver disagree.
- [Low] In mediatek_dwmac_config_dt(), the new 'Invalid RGMII TX/RX clock
  delay' messages, and the moved 'Invalid TX/RX clock delay' messages,…

--

net: stmmac: mediatek: use standard internal delay properties

This commit makes the mediatek-dwmac driver keep separate MII/RMII and
RGMII delay values. The RGMII delays now come from the standard
rx/tx-internal-delay-ps properties. If those are absent, the driver falls
back to the mediatek,rx/tx-delay-ps vendor properties.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index cda3f3edde39f..ee43d694099bd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c

[ ... ]

> @@ -427,24 +432,58 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
>  		return PTR_ERR(plat->peri_regmap);
>  	}
>  
> -	if (!of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps)) {
> -		if (tx_delay_ps < plat->variant->tx_delay_max) {
> -			mac_delay->tx_delay = tx_delay_ps;
> -		} else {
> -			dev_err(plat->dev, "Invalid TX clock delay: %dps\n", tx_delay_ps);
> +	of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps);

[Severity: Low]
This one is about the binding change in the same series, not this hunk
directly. The commit "dt-bindings: net: mediatek-dwmac: deprecate rx/tx
delay vendor properties" adds "deprecated: true" to both
mediatek,tx-delay-ps and mediatek,rx-delay-ps with no condition. Its
commit message also says they "duplicate standard properties".

In this patch, though, mediatek_dwmac_config_dt() still uses these vendor
properties as the only source for the MII/RMII delays in
mac_delay->tx_delay and mac_delay->rx_delay. This commit message also
says:

    There is no equivalent standard properties for RMII and MII case at the
    moment.

ethernet-controller.yaml only defines rx/tx-internal-delay-ps inside an
if/then on rgmii phy-modes. That leaves an MII/RMII node with no
non-deprecated way to describe these delays.

Should the schema limit the deprecation to RGMII, the way the description
text already does?

The binding example also still uses the deprecated property on an RGMII
node:

    phy-mode = "rgmii-rxid";
    ...
    mediatek,tx-delay-ps = <1530>;

Also, the stage granularity and ranges are documented only for the
deprecated properties, not for the standard ones. The driver now checks
those standard properties against rgmii_delay_max.

> +	if (tx_delay_ps >= plat->variant->mii_delay_max) {
> +		dev_err(plat->dev, "Invalid TX clock delay: %dps\n",
> +			tx_delay_ps);
> +		return -EINVAL;
> +	}
> +
> +	/* Read RGMII TX internal delay standard property */
> +	if (!of_property_read_u32(plat->np, "tx-internal-delay-ps",
> +				  &rgmii_tx_delay_ps)) {
> +		if (rgmii_tx_delay_ps >= plat->variant->rgmii_delay_max) {
> +			dev_err(plat->dev, "Invalid RGMII TX clock delay: %dps\n",
> +				rgmii_tx_delay_ps);

[Severity: Low]
This isn't a bug, but rgmii_tx_delay_ps is a u32 printed with %d. A
malformed DT value above INT_MAX, such as 0xffffffff, would be logged as
"-1ps". Should this be %u?

The same applies to the "Invalid RGMII RX clock delay" message. It also
applies to the moved "Invalid TX/RX clock delay" messages for tx_delay_ps
and rx_delay_ps.

> +			return -EINVAL;
>  		}
> +	} else {
> +		/*
> +		 * standard property value not available, fallback on vendor
> +		 * value instead and cap it to max RGMII delay value
> +		 */
> +		rgmii_tx_delay_ps = min(tx_delay_ps,
> +					plat->variant->rgmii_delay_max);
>  	}

[Severity: Medium]
Can this cap produce a value that the stage field can't hold?
rgmii_delay_max is used as an exclusive bound elsewhere, including in the
standard-property branch just above:

    if (rgmii_tx_delay_ps >= plat->variant->rgmii_delay_max) {

It is also defined as one stage past the largest value that can be
programmed:

    #define MT2712_RGMII_DELAY_MAX		5440 /* 32 x 170ps */

On MT2712, mii_delay_max is 17600. A mediatek,tx-delay-ps value in
[5440, 17600) therefore passes the earlier check. If the node has no
tx-internal-delay-ps, min() caps the value to exactly 5440.

Then the RGMII case in mt2712_set_delay() does:

    tx_delay_stage_val = mac_delay->rgmii_tx_delay
                         / MT2712_RGMII_DLY_STAGE_DIV;

That gives 5440 / 170 = 32. For a non-constant value, FIELD_PREP() masks
32 down to 0 in the 5-bit ETH_DLY_GTXC_STAGES and ETH_DLY_RXC_STAGES
fields. ETH_DLY_GTXC_ENABLE and ETH_DLY_RXC_ENABLE are still set from
!!32.

So the RGMII delay is programmed to zero stages with the enable bit set,
not to the maximum the comment describes, and nothing is logged. The
binding documents the MT2712 RGMII range as 0~31*170, which matches an
exclusive bound. The commit message only says "fallback to vendor
values" and doesn't mention any capping.

Should the cap be rgmii_delay_max - 1? Or should the fallback return
-EINVAL, like the standard-property branch does?

The rgmii_rx_delay_ps fallback below has the same problem. MT8195 and
MT8189 aren't affected, because mii_delay_max equals rgmii_delay_max
there. The behavior seems unchanged later in the series, where
get_delay_stage() divides by rgmii_delay_stage_div (170 on MT2712).

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962%40collabora.com
