Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807360;
	b=1ecZV/+IyGSWKyl5BOFr6fVZy4bSx3h+sNJBiNq0IPdO0oduNklNru0L8pS9n9Uvm0lY
	 vbESifEdluDTbgZWIQLi3oKYBCT6bLaGbPw8JAHZlXP3UxrTlxL32uL7j1EuF36gTkApf
	 fTEwGWcoB49NUIrqkXtmgKN/Xt76yVyvE6aNFFrptXOVl7P9dccZDtp1o2F5HEao20nkQ
	 zxdsrM3ZI6zqusVHrw0bJ/LV7ILOugnKzNmnlBHEhDyS6sWGHVa6JvHd1lUB8lyS5b/eu
	 vl4D2gzenVa/7qcIEJ+ZCur820lafte/iIru640E/Rc3ytPGvWd2aZZSzVxAQmfsY0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807360;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=iPNxmcTFhK9j4aZx7hyhd59o51LBMiI0vffqSiyZdR4=;
	b=zy0HwJaU89+YoP189z3+gfnGp5IP38SzolYysikGFJuuhS7u0ty1M6IM5r3W3s89xYwT
	 ZSr29RBDNpLs1HX5Nb3rIRkMIjuSW7Agi3DNKTyH1V42wIBQI0AuuyCWXPaXSacOHJUvC
	 wUAoD6T8EunA7mD7xrf/c4W+zX1qNA0yO9QrUSF+PQ/vX4eER4NbZUfhUWEKeY5S573ty
	 fmjIfv4iL5bazH7N90TtZvId/UyvwcAqRw+GCshwigUQqOMSrG1zAE4wuiJLsYAEyABfh
	 NahvnPjfEkVd7CmlS/3tAosf4AQ9pJ9t8TwXvKULQA2j+C8syv0LyM4tHf7S879bg8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JApRfL4Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844BC606A31C;
	Mon, 16 Nov 2026 05:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JApRfL4Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488CC1F000C4;
	Mon, 16 Nov 2026 05:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794807360;
	bh=iPNxmcTFhK9j4aZx7hyhd59o51LBMiI0vffqSiyZdR4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JApRfL4QW2IjvdLHIo0bHet6ApVYK2RiwucsfPwFG4QkxjZ2gQ51iffFlktJlA5pv
	 /7FD13lul5yGd6ATdlDwLDbVCrvbVAnN81O+W6xaWuiDNghLfreGs377Iq/dI7QCkA
	 AyCFWEXwjRLl+GCsWBRx6bFS7P1LeXGsG6aw47wdyD5LjH8je+vTXAXFQw7NGt4TEa
	 wojcoxYC6EtjaU7PTCFU27rf8qMbiGcpcxsUFoPmD7x+4HCgNoVx1K2yG4YW8HuiXW
	 F6Ack7Dy9h5LFrY7A1b1bwyr9+4h0IbxE3wsNkcHFvmrsBCoKDCfPlnm5fIx0P4iNH
	 DnPjScQXvsjpw==
Subject: Re: [PATCH net-next v2] net: stmmac: program the FSM timeout timer
From: netdev-bot+sashiko@kernel.org
To: zxyan0222@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk
Date: Mon, 16 Nov 2026 05:35:58 +0000
Message-ID: <179480735876.3136.11399412047883475554@kernel.org>
In-Reply-To: <20261112053321.1103678-1-zxyan0222@gmail.com>
References: <20261112053321.1103678-1-zxyan0222@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 7 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 3 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The XGMAC half of the fix never runs on any in-tree platform.
- [Medium] csr_clk_mhz, which feeds the TMR field ('CSR clocks per 1us
  tic'), comes only from clk_get_rate(priv->plat->stmmac_clk) in…
- [Medium] MAC_FSM_ACT_Timer and XGMAC_MAC_FSM_ACT_TIMER are written with
  a plain writel() that contains only FIELD_PREP(NTMRMD) |…
- [Medium] The new STMMAC_NTMRMD_* encodings (0x1=1us, 0x2=4ms, 0x3=16ms,
  0x4=64ms, 0x5=256ms, 0x6=1s, 0x7=4s, 0x8=16s, 0x9=32s, 0xa=64s) and…
- [Low] The patch turns on a live FSM timeout with a 1s default on every
  dwmac4/5 platform with ASP >= 2 that passes no safety config.
- [Low] The patch adds a platform-facing knob, struct
  stmmac_safety_feature_cfg.ntmrmd, plus ten STMMAC_NTMRMD_* constants…
- [Low] The commit message describes a functional defect: TMOUTEN is
  enabled but the timer is never programmed, so 'the advertised timeout…

--

net: stmmac: program the FSM timeout timer

This patch programs MAC_FSM_ACT_Timer right after TMOUTEN is enabled in
dwmac5_safety_feat_config() and dwxgmac3_safety_feat_config(). The TMR
field comes from the stmmac_clk rate, and NTMRMD defaults to a 1s
timeout. It also adds a csr_clk_mhz argument to the safety_feat_config
callback, a new ntmrmd field and STMMAC_NTMRMD_* constants in
include/linux/stmmac.h.

> v2:
> - Rebased onto net-next.
> - Dropped the Fixes: tags (this never worked, so it's feature completion,
>   not a regression fix).

[Severity: Low]
The commit message describes a functional defect. TMOUTEN is enabled but
the timer is never programmed, so "the advertised timeout protection is
ineffective".

Documentation/process/submitting-patches.rst says "A Fixes: tag indicates
that the patch fixes a bug in a previous commit."

Would it be worth keeping the Fixes: tags, so that stable and downstream
safety users can tell which kernels lack working FSM timeout detection?
Given the net-next target, this may be the maintainers' call.

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

[Severity: Low]
This turns on a live 1s FSM timeout on every dwmac4/5 platform with
ASP >= 2 that passes no safety config. A NULL safety_feat_cfg selects
all_safety_feats with tmouten = 1. That covers all the OF glue drivers,
plus mediatek and stmmac_pci.

When the timer fires, the timeout is reported as MCSIS and handled as
uncorrectable:

dwmac5_safety_feat_irq_status() {
    ...
	err = (mtl & MCSIS) || (dma & MCSIS);
	corr = false;
	if (err) {
		dwmac5_handle_mac_err(ndev, ioaddr, corr, stats);
		ret |= !corr;
	}
    ...
}

stmmac_safety_feat_interrupt() {
    ...
	if (ret && (ret != -EINVAL)) {
		stmmac_global_err(priv);
    ...
}

The result is carrier off and a full adapter reset, which these boards
never got before this patch.

The commit message only says a stuck FSM will now be "reported". Could
it mention the reset, and explain why 1s is safe on platforms other than
the two IPs that were tested?

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
This is a plain writel() of only NTMRMD and TMR, so every other bit in
MAC_FSM_ACT_Timer is set to 0. dwxgmac3_safety_feat_config() does the
same for XGMAC_MAC_FSM_ACT_TIMER. The MAC_FSM_CONTROL update just above
uses read/modify/write instead.

The patch defines only TMR as GENMASK(9, 0) and NTMRMD as
GENMASK(19, 16). Doesn't the Synopsys EQoS/XGMAC safety register layout
also have a large-mode timeout field (LTMRMD, bits [23:20])?

If LTMRMD exists and 0 also means disabled there, would FSMs checked
against the large-mode timer stay unprotected after this patch? Any
non-zero reset value in those bits would also be cleared.

I couldn't confirm the register layout from in-tree code, so this may
need checking against the databook.

> +	}
> +

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 7ad08651675e8..dac85431e7401 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c

[ ... ]

> @@ -873,6 +875,22 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
>  	value |= XGMAC_TMOUTEN; /* FSM Timeout Feature */
>  	writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);
>  
> +	/* Program the FSM active timer so the timeout checker actually fires.
> +	 * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in MHz.
> +	 * Default to a 1s timeout when the platform did not select one.
> +	 */
> +	if (safety_cfg && safety_cfg->tmouten && csr_clk_mhz) {

[Severity: High]
Can this block ever run on an in-tree XGMAC platform?

XGMAC_TMOUTEN is set unconditionally just above, but the timer is only
written when safety_cfg is non-NULL. dwmac5_safety_feat_config() falls
back to all features when the cfg is NULL, and this function doesn't:

dwmac5_safety_feat_config() {
    ...
	if (!safety_feat_cfg)
		safety_feat_cfg = &all_safety_feats;
    ...
}

Only three drivers set plat->safety_feat_cfg: dwmac-intel,
dwmac-mediatek and stmmac_pci. None of them is XGMAC. dwmac-socfpga,
dwmac-tegra (MGBE) and generic "snps,dwxgmac" via
stmmac_probe_config_dt() all leave it NULL:

stmmac_hw_setup()
  stmmac_safety_feat_configuration()
    stmmac_safety_feat_config()       /* safety_cfg == NULL */
      dwxgmac3_safety_feat_config()

Doesn't that leave every in-tree dwxgmac with TMOUTEN = 1 and NTMRMD at
its reset value of 0? That is the state the commit message calls broken,
and the message says the fix was tested on dwxgmac.

There is also a second mismatch. A platform that supplies a cfg with
tmouten = 0 still gets XGMAC_TMOUTEN armed, but the timer is left
unprogrammed. Should the timer write follow the same condition as the
XGMAC_MAC_FSM_CONTROL write?

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 552840d29668e..1b3dd30db6dce 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3691,10 +3691,16 @@ static void stmmac_mtl_configuration(struct stmmac_priv *priv)
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

[Severity: Medium]
What happens when stmmac_clk is NULL or reports a rate of 0?

csr_clk_mhz then stays 0. Both dwmac5_safety_feat_config() and
dwxgmac3_safety_feat_config() skip the MAC_FSM_ACT_TIMER write without
any message, even though TMOUTEN has already been written to
MAC_FSM_CONTROL.

stmmac_clk can be NULL in a few cases:

- An OF platform has no "stmmaceth" clock. stmmac_probe_config_dt() only
  warns "Cannot get CSR clock" and sets the clock to NULL.
- clk_register_fixed_rate() fails in dwmac-intel.

The rate is also 0 with the !CONFIG_COMMON_CLK clk_get_rate() stub.

One in-tree case is the Synopsys GMAC5 PCI board. It never sets
stmmac_clk, only clk_csr, yet it explicitly asks for the timeout:

snps_gmac5_default_data() {
    ...
	plat->clk_csr = STMMAC_CSR_250_300M;
    ...
}

stmmac_pci_probe() {
    ...
	plat->safety_feat_cfg->tmouten = 1;
    ...
}

On that board the timer is still not programmed after this patch. Could
this fall back to plat->clk_csr or clk_ref_rate? Failing that, could it
at least warn or clear TMOUTEN when the rate is unknown?

This also ignores plat->clk_csr, which stmmac_mdio.c prefers over the
stmmac_clk rate when the platform supplies it. Is stmmac_clk always
clk_csr_i? If it runs slower, the computed tic would be short and the
timeout would fire early.

>  		stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_cap.asp,
> -					  priv->plat->safety_feat_cfg);
> +					  priv->plat->safety_feat_cfg,
> +					  csr_clk_mhz);
>  	} else {
>  		netdev_info(priv->dev, "No Safety Features support found\n");
>  	}
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 00be2df63d220..cb470a153bf81 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -168,8 +168,25 @@ struct stmmac_safety_feature_cfg {
>  	u32 edpp;
>  	u32 prtyen;
>  	u32 tmouten;
> +	/* FSM normal-mode timeout value (MAC_FSM_ACT_Timer.NTMRMD). The TMR
> +	 * field (CSR clocks per 1us) is derived from the CSR clock by stmmac.
> +	 * 0 selects the default 1s timeout.
> +	 */
> +	u32 ntmrmd;

[Severity: Low]
Is an in-tree user planned for ntmrmd and the STMMAC_NTMRMD_* constants?
Nothing in drivers/net/ethernet/stmicro/stmmac/ sets the field.
dwmac-intel, dwmac-mediatek and stmmac_pci all leave it at 0, and only
the two new consumer blocks read it.

Also, dwmac5_safety_feat_config() and dwxgmac3_safety_feat_config() both
replace an out-of-range value (0xb-0xf) with STMMAC_NTMRMD_1SEC without a
warning. Should that be reported?

>  };
>  
> +/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
> +#define STMMAC_NTMRMD_1US		0x1
> +#define STMMAC_NTMRMD_4MS		0x2
> +#define STMMAC_NTMRMD_16MS		0x3
> +#define STMMAC_NTMRMD_64MS		0x4
> +#define STMMAC_NTMRMD_256MS		0x5
> +#define STMMAC_NTMRMD_1SEC		0x6
> +#define STMMAC_NTMRMD_4SEC		0x7
> +#define STMMAC_NTMRMD_16SEC		0x8
> +#define STMMAC_NTMRMD_32SEC		0x9
> +#define STMMAC_NTMRMD_64SEC		0xa

[Severity: Medium]
Where do these encodings come from? There is no in-tree reference for
them. There is also none for TMR being the CSR clock in MHz rather than
MHz - 1. The same table is used for both EQoS 5.x and XGMAC 3.x.

The steps are also irregular: 1us jumps straight to 4ms, then the values
go up in x4 steps, then x2 steps.

Suppose the hardware encodes NTMRMD differently, for example with a
microsecond-scale normal-mode range. The default of 0x6 would then select
a much shorter timeout.

dwmac5_mac_errors treats every FSM timeout (TTES, RTES, CTES, ATES,
PTES, ...) as uncorrectable, and stmmac_safety_feat_interrupt() handles
that with stmmac_global_err().

Could a wrong encoding cause repeated full MAC resets by default on OF
dwmac4/5 boards with ASP >= 2 and a stmmaceth clock? A pointer to the
databook table these values come from would help.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112053321.1103678-1-zxyan0222%40gmail.com
