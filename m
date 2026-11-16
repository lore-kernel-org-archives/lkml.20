Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837267;
	b=18fpASd2BSWELj/TsaXZ380Lm3svXd1+uusDbrqLnyCXjR4n/7+orE4awMGKoz1ET2HL
	 vGC7B1nX37UL9jPTcHE+kiURUx7uN6834PdtIWBex8kqgvW/+gVYNteyZEwboXkylQY3H
	 x1WkljSqgnIyZ9IXnqu60x5WSNcEm0uX+8kYv2KSzvtVIs/u7SBOZAwSbrcf3M720KlFh
	 tyZ9r4L1Sb7OX6fEod5Xk9mso9VfndVZ3kMAcLp3zKMx0Wf2i25SvLLj1dbwlwNihwXL1
	 ulROhtnhYoZmB25BfcXJ8QYylkdQlxyokbooauygOs3AgSZGzATzCkdBXi40kukNTxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837267;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=r132SAdA06PRgqTYVS2JcCR63njeCiFKuORU3KC+nDs=;
	b=msWyjGhuPXeD/UYkIRHjhk6MYY1XcAE4PknwEV7P0Jl6ahl0bhp+smGklgTGpKfxmAA1
	 ZriyZmaxnshpn4bKUpvOlLPj8HjhzzRekSMC1RO8bygoUMPVGN3MCWb62H4u1BqyOAxmk
	 JX7mWi+CwULBq/FG5KVIbvBj26suHiHCsGKQEKZRi1UsXPQQ/lLbyxb+vFkKUlPM4PcO7
	 2O/BLM1Lwq+X4EcKkK+iI61V6hwnLUfU0+4Vbtgx5R9XxbP/lGppg59Ck9hWcSOvD4ELP
	 y/k1Wzdr7Qzw189+7Q2VEZ90wXLAc4bZpqo+o43mvBQ2bIQsliFsW/1w14O5xuJmuKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jsG1lsIw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831FD606A8AD;
	Mon, 16 Nov 2026 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jsG1lsIw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8A31F00939;
	Mon, 16 Nov 2026 13:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837267;
	bh=r132SAdA06PRgqTYVS2JcCR63njeCiFKuORU3KC+nDs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jsG1lsIwomGEJPRulw+J9IOMIPhSEI/1L3q7SbqlvCsL+Jh/xsOVnDRT60s8cJdnU
	 ET+U8E1zh5FKiqrW/6V80mUSz0od/cb3Ah7dG1xmNxrF288O9fWj4YnRgkUeRd/OVk
	 RGI+g0ho4SEDBzVI0SUoUDHkiSsRvqz45K5wBNbJOV0tqYo52QSU9mCwZjQ2viv+3y
	 fXws0v9H6L4+kaMBX/gzGEiJVIrp2uWQrQAKJ7UwTB5ieTpQk2SVmThCOz5qqKuV/i
	 nEfTNJnbUEawV1krTs/YV+veN7EKw+ED/k1eKzAygGv+RgYxMKqY5drqKe42kD7cn2
	 98nipByPKcaoQ==
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-sun8i: Enable jumbo
 frames up to MTU 2018
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 clabbe.montjoie@gmail.com
Date: Mon, 16 Nov 2026 13:54:25 +0000
Message-ID: <179483726554.3136.14444857396156719322@kernel.org>
In-Reply-To: <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
References: <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com>
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

- [Medium] The commit message says "A device tree max-frame-size can
  still lower it", but for this driver that is false.
- [Low] The max_mtu clamp fixes a real, user-visible bug, but the commit
  is framed as a feature ("Enable jumbo frames") and has no Fixes: tag.

--

net: stmmac: dwmac-sun8i: Enable jumbo frames up to MTU 2018

This patch sets the JUMBO_FRM_EN bit in EMAC_RX_CTL0 from
sun8i_dwmac_core_init(), so the sun8i EMAC accepts frames longer than 1518
bytes. It also clamps plat_dat->maxmtu to 2018 in sun8i_dwmac_probe(). With
that limit, a frame with two VLAN tags and the FCS fits in a single 2044
byte descriptor buffer.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 0c82662fbe6ea..a18d3daf6a3ff 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c

[ ... ]

> @@ -645,6 +659,15 @@ static void sun8i_dwmac_core_init(struct mac_device_info *hw,
>  
>  	v = (8 << EMAC_BURSTLEN_SHIFT); /* burst len */
>  	writel(v, ioaddr + EMAC_BASIC_CTL1);
> +
> +	/* Without JUMBO_FRM_EN the receiver flags every frame longer than
> +	 * 1518 bytes (1522 with a VLAN tag) as a length error, so any MTU
> +	 * above 1500 is unusable. Frames are still bounded by the RX
> +	 * descriptor buffer size, see EMAC_MAX_MTU.
> +	 */
> +	v = readl(ioaddr + EMAC_RX_CTL0);
> +	v |= EMAC_RX_JUMBO_FRM_EN;
> +	writel(v, ioaddr + EMAC_RX_CTL0);
>  }

[Severity: Low]

JUMBO_FRM_EN is now set unconditionally. A peer can therefore send oversized
frames that reach the RX DMA even at the default MTU of 1500, and those
frames span several descriptors.

Dropping them correctly depends on commit 834ec9530832 ("net: stmmac: drop
split frames on AF_XDP zero-copy RX"). That commit made
ndesc_get_rx_status() return discard_frame | rx_not_ls for non-last
descriptors, and made stmmac_rx() test status & discard_frame and drain the
split frame.

On a tree without that commit, wouldn't stmmac_rx() treat the last fragment
of such a frame as a new packet? The commit message cites 834ec9530832 only
as background. Could it be listed as a prerequisite for backporters?

Related to this, the max_mtu clamp in sun8i_dwmac_probe() also fixes an
existing problem, but the patch has no Fixes: tag. Before this patch, the
driver advertised a max_mtu of 3712 and was in this state:

- stmmac_hw_init() forces chain mode for STMMAC_FLAG_HAS_SUN8I.
- stmmac_xmit() calls stmmac_is_jumbo_frm() only for enh_desc.
- norm_set_tx_desc_len_on_chain() masks the length to 11 bits:

    p->des1 |= cpu_to_le32(len & TDES1_BUFFER1_SIZE_MASK);

So with an MTU between 2048 and 3712, a linear TX frame longer than 2047
bytes was silently truncated. Would a Fixes: tag make sense for that part?

[ ... ]

> @@ -1209,6 +1232,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
>  	plat_dat->mac_setup = sun8i_dwmac_setup;
>  	plat_dat->tx_fifo_size = 4096;
>  	plat_dat->rx_fifo_size = 16384;
> +	plat_dat->maxmtu = min(plat_dat->maxmtu, EMAC_MAX_MTU);

[Severity: Medium]

The commit message says:

    A device tree max-frame-size can still lower it.

Is that true for this driver? stmmac_probe_config_dt() reads the property
only for a few compatibles:

stmmac_platform.c:stmmac_probe_config_dt() {
    ...
	if (of_device_is_compatible(np, "st,spear600-gmac") ||
		of_device_is_compatible(np, "snps,dwmac-3.50a") ||
		of_device_is_compatible(np, "snps,dwmac-3.70a") ||
		of_device_is_compatible(np, "snps,dwmac-3.72a") ||
		of_device_is_compatible(np, "snps,dwmac")) {
		...
		of_property_read_u32(np, "max-frame-size", &plat->maxmtu);
    ...
}

None of the compatibles in sun8i_dwmac_match[] can carry an snps,dwmac
fallback under allwinner,sun8i-a83t-emac.yaml. So plat_dat->maxmtu always
holds the JUMBO_LEN default (9000) when this min() runs, and the line always
sets it to 2018.

The binding does accept max-frame-size on these nodes, because it includes
snps,dwmac.yaml through allOf, and that pulls in ethernet-controller.yaml.
If a board sets max-frame-size to cap the MTU for a PHY or switch limit, the
driver ignores it without a warning.

Should the commit message be corrected, or should the driver parse
max-frame-size itself?

If the property is ever parsed for these nodes, the min() has a second
problem. plat->maxmtu is an int filled by of_property_read_u32(). A value
below min_mtu, or one that is negative as an int, passes straight through
min(). stmmac_dvr_probe() then only warns:

	if (priv->plat->maxmtu < ndev->min_mtu)
		dev_warn(priv->device,
			 "%s: warning: maxmtu having invalid value (%d)\n",
			 __func__, priv->plat->maxmtu);
	else if (priv->plat->maxmtu < ndev->max_mtu)
		ndev->max_mtu = priv->plat->maxmtu;

In that case ndev->max_mtu stays at SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN).
Wouldn't that bring back the TX truncation and the RX split-frame drops that
this patch is meant to prevent?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17%40gmail.com
