Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794754326;
	b=sSI1zx7kyvZHyxxXMd0G6TboW4TwOyggm+ilgLhAXm5PFyIZ2vlxNUA4r0tHF7KZfJ04
	 1iEmAlHIUvzLdizo6yB2MjkkkIN2FhzyyKKVvauGCPQJ1JBPx91WXeEDiDFi7q8TwszYc
	 Izx21/SQn9r7aXEcVrUhlP17vKShIV6RRWpp+L9+Ma8xKk+ibYAY9O3TdygqGJKdbBUQ4
	 XcLFPv9MaZ4x0cJvAmrZap73TNqGBj8YFxnSeDiryOuKAE3jGZ5MAvvdkj6FzY/91XvNZ
	 Vp375Jg1ci4+AoI9IWbDnsTS/DxqM+u8Z96iz8UWQie4gyC4Ao5Z5drrR/+M2meEbsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754326;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lMoHIuDGeBYbm95jv2X9pK5hAUAsdszbYLukExBu7bs=;
	b=cIF6OkglXpn756zMX511S7yeXK4KSUj8RdTrjBJmDPdIqNZKNlTH0kPZCrx5IWrZ2IpN
	 B1wmo68Kr/dd49R+LSmqkncerrFEn00WDm69VQJJqi+TSV1W+7Pq8Zd0gv3gmWRCqPIQq
	 uW9jQzm7jULuwH38BtYWEexH0yG8OEQnfPhs4LbldPiWkSK5T2AJZfuuyk8Oucy+w9w0F
	 6il8KDflLfhKxwKwWA+CSisis0KTRpl5ENPF7TGoIAXbvos6KMp8Tmerw43+wCQEBu5eG
	 vfeZOJUMA1PMrV5Z80a0Y6WgpLO9uO4/uV2M66u8nmR6GGHpitNtpASwci/OgLTSqZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Li9higuZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AD2606A31A;
	Sun, 15 Nov 2026 14:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Li9higuZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF7E1F000C4;
	Sun, 15 Nov 2026 14:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794754326;
	bh=lMoHIuDGeBYbm95jv2X9pK5hAUAsdszbYLukExBu7bs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Li9higuZRHWSG490oa42d1zrCcZBOYB3YvISXH6iSVcr3axoYntPIDmqsP20aZYAT
	 5EGKn/xvwOyIarpE84lZ4vODVE9ryGcs09g2m9+lo+wveJwgViFSmRXVY1/VscQDB9
	 poCcmeYpMyYKzKYqJZdBhcCviu3c0H3xnJI1SzJni/k5Kp/wMgh+STifpnM4m3jBn0
	 i1oR4+eZZ8CkpksDdkz91KPilRWm8/roktLEflR3PvfsDKi5UNBQM3Z30Hw37jU14w
	 NxbKxrN20KqlLGEMUb4e2FQ+u2g3Etqspe3PJ1MP51elZZb09nUaJ2bVAbf0e8iVsb
	 3otdDfOBzk1qA==
Subject: Re: [PATCH] net: stmmac: program the FSM timeout timer
From: netdev-bot+sashiko@kernel.org
To: zxyan0222@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, Jose.Abreu@synopsys.com
Date: Sun, 15 Nov 2026 14:52:04 +0000
Message-ID: <179475432482.2199510.1145189790252763539@kernel.org>
In-Reply-To: <20261111143322.2234321-1-zxyan0222@gmail.com>
References: <20261111143322.2234321-1-zxyan0222@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 2 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] On every in-tree XGMAC platform, the XGMAC half of this fix
  never runs.
- [High] The new code takes the CSR clock rate only from
  priv->plat->stmmac_clk (stmmac_safety_feat_configuration(),…
- [Medium] dwmac5_safety_feat_config() (dwmac5.c:261-263) and
  dwxgmac3_safety_feat_config() (dwxgmac2_core.c, around lines 887-889)…

--

net: stmmac: program the FSM timeout timer

This commit programs MAC_FSM_ACT_Timer right after TMOUTEN is enabled, in
both dwmac5_safety_feat_config() and dwxgmac3_safety_feat_config(). TMR is
derived from the CSR clock rate and NTMRMD defaults to a 1s timeout. A new
ntmrmd field in stmmac_safety_feature_cfg lets a platform override that
default, and csr_clk_mhz is passed through the safety_feat_config callback.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> index f1bb981cab7cd..4ab7a3df98c6d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c

[ ... ]

> @@ -245,6 +247,22 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
>  		value |= TMOUTEN; /* FSM Timeout Feature */
>  	writel(value, ioaddr + MAC_FSM_CONTROL);
>  
> +	/* Program the FSM active timer so the timeout checker actually fires.
> +	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
> +	 * Default to a 1s timeout when the platform did not select one.
> +	 */
> +	if (safety_feat_cfg->tmouten && csr_clk_mhz) {
> +		u32 ntmrmd = safety_feat_cfg->ntmrmd;
> +
> +		ntmrmd = (ntmrmd >= STMMAC_NTMRMD_1US &&
> +			  ntmrmd <= STMMAC_NTMRMD_64SEC) ?
> +			 ntmrmd : STMMAC_NTMRMD_1SEC;
> +
> +		writel(FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
> +		       FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz),
> +		       ioaddr + MAC_FSM_ACT_TIMER);

[Severity: Medium]
This writel() replaces the whole MAC_FSM_ACT_Timer register with only the
NTMRMD and TMR fields set. Every other bit becomes zero. Is that intended?

In the Synopsys EQoS/XGMAC layout, this register also has a large-mode
timeout field (LTMRMD, bits 23:20) for FSMs that need longer timeouts. The
patch doesn't define or program it.

The commit message says a zero mode field disables the timer. If that also
applies to LTMRMD, would the large-mode FSMs stay unmonitored after this
write? And if reset or boot firmware had set LTMRMD, would this write turn
that monitoring off?

Should this be a read-modify-write, or should LTMRMD be programmed too? The
same whole-register write is in dwxgmac3_safety_feat_config().

> +	}
> +

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 1a88cbaed70ca..76c850ea13a5c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c

[ ... ]

> @@ -871,6 +873,22 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
>  	value |= XGMAC_TMOUTEN; /* FSM Timeout Feature */
>  	writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);
>  
> +	/* Program the FSM active timer so the timeout checker actually fires.
> +	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
> +	 * Default to a 1s timeout when the platform did not select one.
> +	 */
> +	if (safety_cfg && safety_cfg->tmouten && csr_clk_mhz) {

[Severity: High]
Can this block run on any in-tree XGMAC platform?

When safety_cfg is NULL, dwmac5_safety_feat_config() substitutes a default
config, but dwxgmac3_safety_feat_config() does not:

dwmac5_safety_feat_config() {
    ...
	if (!safety_feat_cfg)
		safety_feat_cfg = &all_safety_feats;
    ...
}

stmmac_safety_feat_configuration() passes priv->plat->safety_feat_cfg
through unchanged. The only in-tree platforms that allocate it appear to be
dwmac-intel.c, dwmac-mediatek.c and stmmac_pci.c, and all of them are
GMAC/GMAC4 cores.

The XGMAC users leave it NULL: dwmac-socfpga.c, dwmac-tegra.c and generic
"snps,dwxgmac" DT through stmmac_platform.c. Both dwxgmac210_ops and
dwxlgmac2_ops use this function.

On those platforms, XGMAC_TMOUTEN is still set unconditionally above, but
the timer write is skipped. The hardware stays in the state the commit
message describes as the bug, even though the patch carries:

    Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC core")

This also contradicts the new comment "Default to a 1s timeout when the
platform did not select one".

There is a related mismatch when a cfg is passed with tmouten = 0: TMOUTEN
is still set, but the timer is not programmed.

Should TMOUTEN and the timer write be gated on the same condition? And
should a NULL cfg be handled the same way dwmac5 handles it?

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f8dceafdda2d2..52f63f624d67c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3639,10 +3639,16 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
>  
>  static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
>  {
> +	unsigned int csr_clk_mhz = 0;
> +
>  	if (priv->dma_cap.asp) {
>  		netdev_info(priv->dev, "Enabling Safety Features\n");
> +		if (priv->plat->stmmac_clk)
> +			csr_clk_mhz = clk_get_rate(priv->plat->stmmac_clk) /
> +				      1000000;

[Severity: High]
What happens when priv->plat->stmmac_clk is NULL here? csr_clk_mhz stays 0.
By the time dwmac5_safety_feat_config() reaches the timer block it has
already set TMOUTEN, and it then skips the MAC_FSM_ACT_Timer write without
any message:

	if (safety_feat_cfg->tmouten && csr_clk_mhz) {

Both in-tree platforms that explicitly set safety_feat_cfg->tmouten = 1
appear to have no stmmac_clk.

In stmmac_pci.c, stmmac_pci_probe() sets tmouten = 1 for snps_gmac5. The
only CSR clock information is plat->clk_csr = STMMAC_CSR_250_300M in
snps_gmac5_default_data(), and nothing in stmmac_pci.c assigns stmmac_clk.

In dwmac-mediatek.c, mediatek_dwmac_common_data() sets tmouten = 1. The
mediatek binding and dtsi files have no "stmmaceth" clock-name. As a result,
devm_clk_get() fails in stmmac_probe_config_dt(), which prints "Cannot get
CSR clock" and sets plat->stmmac_clk = NULL.

On both platforms the timer is never programmed and nothing is logged. That
doesn't match the new comment on stmmac_safety_feature_cfg.ntmrmd, which
says TMR "is derived from the CSR clock by stmmac" and that "0 selects the
default 1s timeout".

Could this fall back to plat->clk_csr, use a different clock source, or at
least warn when the timer can't be programmed?

>  		stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_cap.asp,
> -					  priv->plat->safety_feat_cfg);
> +					  priv->plat->safety_feat_cfg,
> +					  csr_clk_mhz);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111143322.2234321-1-zxyan0222%40gmail.com
