Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667937;
	b=o7nJnfDDNll8RLSRF1eUdVAk3OxkTw2oLDr/DNXoxW6K48lW6HYOnWJ1gWCI67QQWpNh
	 Dxu/WWvJ3AL2zOuBPV4dAabJm2pcKMNxZNnE406DGC85oBpflEavNKEF6VQMdoLj3xASW
	 Qb6szwTDVu6rJR7/ZFsa+61oL/Ngysta4wehdraXYAqIHMeKekhYv+L+YFx1rb2Gm8nb1
	 O6ssyjpf3eBLrOrgE2ugXqLeJwqX8TxGLAMJL7FhgtBvYMLiO+k8u9gWxgUxNgEWRv4gX
	 Q5YJoXemRqza65tqjAFEEvgJDQhPcBd4yEFRII6oyDoA5F30Xu5l4Ae7wZbM1Azkicg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667937;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=MKGSFzhqcqIRvndmIYREC4xj4lwtCE7g0b2WesSSlo0=;
	b=1D4EWKrKBbxuS239/nKRPSe3fjDqKs49uIdngY95md05CA3JtOvXaJLuzJ4da8wvH1ku
	 /XxrqmJgvvV58CW1Ng7WJbtPVUQKiCmYdcGP+aqfKE/jZIEZCdtQavw/YR7eNDVjuM2FC
	 7yHKyW47lHAXqx3jm1HjYq+lM315Xm65aAO/5rm2XGWS89YpMBM6VvpTJFVleEm90yijw
	 LVWPivOoeA7ARv2bJbidGVJCTBH+NzkT5PrNi21JJMdj7ua5QjeOm+w6HeqPP5qw2Td8d
	 qmnSDljB/A0qAeWGrrfUlMYKrawcwsbXRHdJ4xwq4Nx0poPmgAnZ3s9VuO1UEUcwT/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HfVU3oiL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DE3606A887;
	Sat, 14 Nov 2026 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HfVU3oiL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13431F000CA;
	Sat, 14 Nov 2026 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794667937;
	bh=MKGSFzhqcqIRvndmIYREC4xj4lwtCE7g0b2WesSSlo0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HfVU3oiLY1dTmstvNjuo6NuR0qVDoBtw5TGch9e21l/FiVnm5XWHHeVUCTylzNmSj
	 dyXTjk0YYAV3C8/+WhmaCdCWYsY4XlXaZE1dGjG48FEzURlvZyP4P4i5BPXm5SgZr8
	 c844AUQ+4i2UokgoTnXfq32n9Wj/p/UGLS9pjhiWJdW2lNwQnlzgxAUDIZKCF4CeWh
	 jFU070hSZ+fcsL/d2qQsDpeE4dfJgIXW2niSMWyx7EErv8LC0zrkwWX5Vjh8d7n9nr
	 c3IViGiLvZ+xWejpLZ6zpS+qa2b+vc+lxg/XD9k8W6v//x+B+7SZD4l8FmHVOm3j3e
	 tV/Cgx39hdTPA==
Subject: Re: [PATCH net-next v5 09/10] net: stmmac: mediatek: add support for
 TX clock output enable feature
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
Date: Sat, 14 Nov 2026 14:52:15 +0000
Message-ID: <179466793541.2199510.14225975364666918696@kernel.org>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-9-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-9-7d99d6292962@collabora.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] mt8195_set_interface()
  (drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c) now sets…

--

net: stmmac: mediatek: add support for TX clock output enable feature

This commit adds a definition for the MT8189 TX clock output enable bit in
the pericfg Ethernet control 0 register. It also adds a mac_txclk_out_en
flag to the variant data and sets the bit in mt8195_set_interface() when
the flag is true.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 3f024d455cbd5..1a0ab95dfbf0e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c

[ ... ]

> @@ -307,6 +311,9 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
>  	/* MT8195 only support external PHY */
>  	intf_val |= MT8195_EXT_PHY_MODE;
>  
> +	if (plat->variant->mac_txclk_out_en)
> +		intf_val |= MT8189_CTRL0_TXC_OUT_OP_EN;
> +

[Severity: Medium]
Should this bit depend on the interface mode? As written,
MT8189_CTRL0_TXC_OUT_OP_EN is set no matter what phy_intf_sel,
plat->rmii_clk_from_mac or plat->rmii_rxc are.

Later in the series, "net: stmmac: mediatek: add support for MT8189 SoC"
sets .mac_txclk_out_en = true for mt8189_gmac_variant. That means the TX
clock output gets enabled in every mode.

The MT8189 binding forbids the MAC from sourcing the RMII reference clock:

  mediatek,rmii-clk-from-mac: false

It still allows mediatek,rmii-rxc, and it does not limit phy-mode. So with
phy-mode = "rmii" and no mediatek,rmii-rxc, the external reference clock
comes in on the TXC pin, as mt8195_set_delay() describes:

    /* the rmii reference clock from outside is connected
     * to TXC pin, the reference clock will be adjusted
     * by TXC delay macro circuit.
     */

mt8195_set_delay() also accepts PHY_INTERFACE_MODE_MII. In MII mode the
PHY drives TX_CLK.

In either of those setups, would the MAC's TXC output driver be turned on
while the PHY or an oscillator is already driving that pin?

If the hardware ignores bit 20 when TXC is used as an input, could the
commit message say so? If it doesn't, would it be safer to set the bit only
for the modes where the MAC drives TXC, such as RGMII?

>  	regmap_write(plat->peri_regmap,
>  		     reg_offset + MT8195_PERI_ETH_CTRL0,
>  		     intf_val);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962%40collabora.com
