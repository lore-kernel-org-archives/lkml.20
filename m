Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667939;
	b=lv/jbMbHfZ3yVpvUTWcpaeAxxafMPLBMpPKv7oFs8sVtH2hpNfZqDPW8mqQLcwb7RgKV
	 2JKY7YbNalVb+33uzjkP5fVPyZ0SbssarVQ+XTkFKCfqaqwXWkN2l+lrDeS7XsytjIaw9
	 Km/7QXF8MCos3Iem5dSR9cjafGv6XWpPmRYdC8GeSrPESPpmsevsG3F/JhODWH/djPZYG
	 FdIJhJoC4fOYtSTpUhWdaBUu8tiofAo0vTIVb9Rx+jZQxtWrRUM0aPIYRKm2w7HwDndPB
	 AuFtcstWXYN1GxKTzvXYZqGjssEziA7LBCgx1KcOXalAsEkpjA6sUNkLVhsEhzZecWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667939;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Stxf2y23tK03Or3qwqdcinc2HKFkBV1bom0qiF7Nr58=;
	b=aXPI+hbh1yF2s7GQwxIUMp6lSsHfgBJEpOn/IZwf0Ub26sLsfqYOiywuz6kMCjXmLO+7
	 tzQotmeUGIuSknoBTzQHeOPy9z9SLV8PDf51l/qnOTJNld3zF4S5Gjs7mbnonIvMP0/VW
	 jJR+jb5h98JlGxR4KRFKLnmuL0FlTgkkonBHftqcAy9xrjfT6kSeIK2e22GfYqWeezun7
	 NEzH03lCkgNfyFMTf80U8qVmhZcCW8TSgf+Gnt391CJWm3Bdj6X53wtWu9iDjc7yKiMKd
	 7U5YujOsqIMRJls+zgtdKHqErd/2mHs1CsFZRMiz2J10x9pWTKPsRFZRlMBZQ/kaa0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFXHjot7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF44606A893;
	Sat, 14 Nov 2026 14:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFXHjot7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86361F000C5;
	Sat, 14 Nov 2026 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794667938;
	bh=Stxf2y23tK03Or3qwqdcinc2HKFkBV1bom0qiF7Nr58=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PFXHjot7jHhbH0wVpsH/dOqFlEpConntW10wMrQxFlE6gwzevH0vEV+JaA9CM/6vE
	 VJPgqTj24yWRZ6RYDm6PqLufq0THLOtgDNxU08nkLMiJGc/v6GzpUB9tQWQwDCX/88
	 M2x8W7t0z5Oom0tQfhZCYlfScTsk+/WB3WIX0u/bUstXu+qjHIuToJ84aN1xJDOJ0+
	 b66j+lMjMVR27YP9kSPw3ye3sgpTmOuFm9Q+LYarKMojzXFUTIzV9IHHI+DePWInfM
	 5cJdzIHwIaz0ruCexbjkzuEQkX2ckKXAla0ojtZ79WnAQmWpi5WbkVJUfiSj0omxtQ
	 uuG/YAkmp6iLQ==
Subject: Re: [PATCH net-next v5 10/10] net: stmmac: mediatek: add support for
 MT8189 SoC
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
Date: Sat, 14 Nov 2026 14:52:17 +0000
Message-ID: <179466793724.2199510.14479564782627569884@kernel.org>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-10-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-10-7d99d6292962@collabora.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] For MT8189, mt8189_gmac_variant sets .mac_txclk_out_en = true
  (line 465).
- [Low] This patch makes the driver use a 180 ps step and a 5760 ps limit
  (MT8189_MII_DLY_STAGE_DIV / MT8189_MII_DELAY_MAX / MT8189_RGMII_*) for…

--

net: stmmac: mediatek: add support for MT8189 SoC

This adds MT8189 support to dwmac-mediatek. It reuses the MT8195
interface and delay helpers, with a pericfg offset of 0x270 and 180ps
delay stages. It also enables the TX clock output feature for this SoC.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 1a0ab95dfbf0e..ce232313014d2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -42,8 +42,15 @@
>  #define MT2712_RGMII_DELAY_MAX		5440 /* 32 x 170ps */
>  
>  /* Peri Configuration register for mt8189 */
> +#define MT8189_PERI_ETH_CTRL_OFFSET	0x270
> +
>  #define MT8189_CTRL0_TXC_OUT_OP_EN	BIT(20)
>  
> +#define MT8189_MII_DLY_STAGE_DIV	180  /* 180ps per stage */
> +#define MT8189_MII_DELAY_MAX		5760 /* 32 x 180ps */
> +#define MT8189_RGMII_DLY_STAGE_DIV	180  /* 180ps per stage */
> +#define MT8189_RGMII_DELAY_MAX		5760 /* 32 x 180ps */

[Severity: Low]
This isn't a bug, but should the DT binding document these MT8189
values?

Documentation/devicetree/bindings/net/mediatek-dwmac.yaml already
accepts mediatek,mt8189-gmac. The descriptions of mediatek,tx-delay-ps
and mediatek,rx-delay-ps give a step and range only for MT2712 and
MT8188/MT8195:

      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
      or will round down. Range 0~31*290.

With this patch, mediatek_dwmac_config_dt() rejects MT8189 TX/RX
delays >= 5760ps with -EINVAL:

    if (tx_delay_ps >= plat->variant->mii_delay_max) {

Smaller values are rounded down to multiples of 180ps. The binding does
not describe either rule.

Could the binding get a matching line, for example "For MT8189
RGMII/RMII/MII interface, Allowed value need to be a multiple of 180, or
will round down. Range 0~31*180."?

> +
>  /* Peri Configuration register for mt8195 */
>  #define MT8195_PERI_ETH_CTRL_OFFSET	0xFD0
>  

[ ... ]

> @@ -440,6 +451,20 @@ static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
>  	return 0;
>  }
>  
> +static const struct mediatek_dwmac_variant mt8189_gmac_variant = {
> +	.dwmac_set_phy_interface = mt8195_set_interface,
> +	.dwmac_set_delay = mt8195_set_delay,
> +	.clk_list = mt8189_dwmac_clk_l,
> +	.num_clks = ARRAY_SIZE(mt8189_dwmac_clk_l),
> +	.dma_bit_mask = 35,
> +	.mii_delay_max = MT8189_MII_DELAY_MAX,
> +	.rgmii_delay_max = MT8189_RGMII_DELAY_MAX,
> +	.mii_delay_stage_div = MT8189_MII_DLY_STAGE_DIV,
> +	.rgmii_delay_stage_div = MT8189_RGMII_DLY_STAGE_DIV,
> +	.peri_eth_ctrl_offset = MT8189_PERI_ETH_CTRL_OFFSET,
> +	.mac_txclk_out_en = true,

[Severity: Medium]
Is it safe to enable TXC output in every interface mode?

mt8195_set_interface() sets the bit whenever mac_txclk_out_en is true.
It does not check phy_intf_sel or plat->rmii_rxc:

    if (plat->variant->mac_txclk_out_en)
        intf_val |= MT8189_CTRL0_TXC_OUT_OP_EN;

In MII mode the PHY drives TX_CLK, so TXC is an input to the MAC.

On MT8189 the binding forbids mediatek,rmii-clk-from-mac, so in RMII
mode the reference clock always comes from the PHY. Without
mediatek,rmii-rxc, that clock arrives on TXC. The driver says so in
mt8195_set_delay():

    /* the rmii reference clock from outside is connected
     * to TXC pin, the reference clock will be adjusted
     * by TXC delay macro circuit.
     */

The previous patch in the series describes this bit as enabling "the TX
clock signal output". If that means the TXC pad output driver, could
the MAC end up driving a line the PHY is already driving, in MII mode
and in RMII mode with the reference clock on TXC?

The register is rewritten on every resume through mediatek_dwmac_init(),
so the setting persists.

The bit might be gated by ETH_INTF_SEL in hardware. Without a datasheet
that can't be confirmed from the tree. Should the bit be set only in
RGMII modes, where the MAC sources TXC? Or could the commit message
explain why it is harmless in MII and RMII?

> +};
> +
>  static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
>  	.dwmac_set_phy_interface = mt8195_set_interface,
>  	.dwmac_set_delay = mt8195_set_delay,

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962%40collabora.com
