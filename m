Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674733;
	b=Bk5b1HBstZ1btnvd8EceoPIq+RVttCbZvQIvw8oLuqQXZ4q0PYm3gVcGDQrqwcwBG07K
	 1aw4R8lsiUUbp9cV16KIpB3l8VM9B4AIfq1elT/wEJ90Gdigx9d8DMynmEy6eNHFvqtcu
	 wLNvA0JU+Gh6x130TBlELbyptE3oH6+2W9q+G2UICW0lntjsbavGPAqHSud2jJ0TlCWn7
	 u0H+d/hYX67iZq0r+vf72YesJewCOa7amJyf7jmRWDWKyOGu0QvCYA+AZNQt0ch+mH4ob
	 FUDwq/Cfs2RMrbzCcf+iC2M3Dc6R9EY7xnMjijgP66HQp35nOBEVnc/Cl4thBBXUzNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674733;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=HWjhff4U2bfbc71lpan6VjQI381x45+6j+0ZgY5DOCA=;
	b=KFaCv6T97iMxG0ZxlK2tftFijWzxxRO14Ar5VhVls6rUguIpTccwno1f+rr3pWc1byCO
	 3nvZI1N9JqJPJZDynl9t+PmmL4T/N0j+dIUVdMfJmTx48vN7IPX80JSbxAXNLMoNktddX
	 td8HQVcgH++vM9QkQ6YFbhF9GrBlNp+rGDuhPOnlQZq7/ytZiTCBW+XFMap86uuts6cr4
	 bNSwnlyzOkQU1OTIjb3DQcN07YwcRLU5Mv8p6VBCRqc8jFX0VYZ/drao6vCSeG88kdZg3
	 DWWnPvXbVFa2zjB0M+BIygd6KlFMqlTXfALYW/1yMUSADdMoJIJsAJRiGvrTt++e4qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Z1jg6YDn;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60149606A327;
	Sat, 14 Nov 2026 16:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60149606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Z1jg6YDn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CF21AC5845B;
	Sat, 14 Nov 2026 16:45:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D504601F0;
	Sat, 14 Nov 2026 16:45:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B413211BC0620;
	Sat, 14 Nov 2026 17:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794674722; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HWjhff4U2bfbc71lpan6VjQI381x45+6j+0ZgY5DOCA=;
	b=Z1jg6YDnUBA7PClXCcfYhR7Uf9hJgkLnLFMB21wsFkQhpM70Rlejx/ZOAbvYYdnxaWkBPh
	Ee0mhP7Cx8pmPI0bZn+XIHUhDfVJheuDyvgueA1ppsONBX0SlcIpyHaZ5sy6RBsKJKRM1Z
	oB34W/wB8rPoJye4hQgp/cqavMxw+hs9QeQewuE/YFLq+ahRll0CoH4HMQmU+Eo8nQwGYo
	Sxdc3m/QN1nkN/RAV5uL8gbcepKXhRHL8v/ddK7jozmgn1X59ZJasNvR09lYQpPHe6b8gU
	JpwDw1q0Bie6dhMYqvaVBcwkmgZT1BabnuKtsXleYLftkzHU+wKk0CU40tEH6w==
Message-ID: <ebea9af3-5edc-403e-bcd1-de875137d68a@bootlin.com>
Date: Sat, 14 Nov 2026 17:45:10 +0100
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
Subject: Re: [PATCH net-next v5 10/10] net: stmmac: mediatek: add support for
 MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
 <20261110-dwmac-mediatek-mt8189-v5-10-7d99d6292962@collabora.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-10-7d99d6292962@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/10/26 13:08, Louis-Alexis Eyraud wrote:
> Like MT8195 SoC, MT8189 SoC uses the Ethernet control registers from
> the peripheral configuration (pericfg) but at a different offset.
> It also has different RX and TX internal delay stage dividers (290ps
> for MT8195, 180ps for MT8189), and by consequence a reduced value range
> for these delays. It finally needs additional feature such as the
> TX clock output enable one.
> 
> Thus, add compatible, clock definitions and specific platform data to
> support the MT8189 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 1a0ab95dfbf0..ce232313014d 100644
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
> +
>  /* Peri Configuration register for mt8195 */
>  #define MT8195_PERI_ETH_CTRL_OFFSET	0xFD0
>  
> @@ -124,6 +131,10 @@ static const char * const mt2712_dwmac_clk_l[] = {
>  	"axi", "apb", "mac_main", "ptp_ref"
>  };
>  
> +static const char * const mt8189_dwmac_clk_l[] = {
> +	"axi", "apb", "mac_main", "ptp_ref"
> +};
> +
>  static const char * const mt8195_dwmac_clk_l[] = {
>  	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
>  };
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
> +};
> +
>  static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
>  	.dwmac_set_phy_interface = mt8195_set_interface,
>  	.dwmac_set_delay = mt8195_set_delay,
> @@ -729,6 +754,8 @@ static void mediatek_dwmac_remove(struct platform_device *pdev)
>  static const struct of_device_id mediatek_dwmac_match[] = {
>  	{ .compatible = "mediatek,mt2712-gmac",
>  	  .data = &mt2712_gmac_variant },
> +	{ .compatible = "mediatek,mt8189-gmac",
> +	  .data = &mt8189_gmac_variant },
>  	{ .compatible = "mediatek,mt8195-gmac",
>  	  .data = &mt8195_gmac_variant },
>  	{ }
> 

