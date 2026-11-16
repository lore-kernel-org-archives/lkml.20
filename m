Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794822442;
	b=WnPTWIjpHChyBUPbbOPD4cwG7fvEwyOyviDTDLHHif7H2Hyi9V34q4aXKZmNYXixuNFQ
	 a122yN4DGwX1RMCi3nUGMjnS7T8PpS7MjXJ48G857238ZZRArMxKcc4zYJ0ur6L/rcdDQ
	 4eBHi9Mys7Z7FIxV0TrYxKkyEV4gcwpXDwxpngGRihVAaj7NidDW08uyfLA93QETv9fRm
	 dQt4UjwXI/O7U4XY009aiy7FxInYMRP3r9vZATrPvtheXBe1IGTDCbUegdmfrNqfdBE80
	 GT6GhF6JSqnM2g4DbgzEOMSayfi6bBLp6GMFaV1BIfBK7HvphoixbdJ2ZkCDN9p7big==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=E06BVf3jX1KLr6IyFH4QZl+untonFT3iXLQzubinz1g=;
	b=LXQRyENAVg4cRfNIHo8xRxjWN22rRi5K1yA3fyxrQQcLbd7Ifq/mGFA6p2pDW7QEGGJ5
	 tFWtahWBYdS78jPzUUqX0c32hx/qUThvNrkzRfV1omUrg2pKWd8HPV8maOuZDzbLOIQh0
	 As3+otKXx/nG2wuKPxZet5YNY8wQku21px8+SAUb1FyRTOLzu4bs86FoicgERGcLn979k
	 +U+wu89hcnVXSty8XM/2slMSaz9emTjpt7pAEP1Ez1xGfBYg8GBAta+lYkN8RQwxT4gau
	 YYYeIY0OlmTtUewlDfFM+Tlon07iRKfN0E0Vc2rIkerGtrvvBp8OUdT1Y3rE9NpX6kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fXsHLEui;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D677606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D677606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fXsHLEui
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55c5b6584ceso14648131cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:47:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794822441; cv=none;
        d=google.com; s=arc-20260327;
        b=sm4lNLPUMh6SnVp6iwQILtfPJ2jZPNaXTGlvWMz3g/vMKhQlcwyrX2aCpCdAb1RMII
         z9qCmqLv9MbW1s96RwxtRhMmroRYKRuz9MGabn8tUt9iXwV+tYpsdAIBTQ1YPh40ktye
         7tkLWRlULoyPSkyhj8iILHxWeysDuybXkdThF5+CY9FHDmwkcOTz/RrXViRvZd5YBgSP
         ANr+q/ThwkzYnekQt38i/qJyUkn8/QNBJexdAJPb+4lu5RZRftxx4FGCWDoh31aS8XtC
         XVwZElVBZSf4MvDGSb5aqOl+KKf45cNqDaro2NX8GbT6JEPLh38JJZBEbGBTJ691O8+M
         oN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E06BVf3jX1KLr6IyFH4QZl+untonFT3iXLQzubinz1g=;
        fh=SsmkpO3SbrLXaccKjtjFWy9ATKJHBo0O2LGZ4ZaK8A0=;
        b=FSxRmyv7OP85UXV620cnP+iqmKjdp0VHN0Ivw9YjlMwusvrxURU6tcIv0lyNibjc/7
         DdUfIRNw6SQ7AQGbxQtcjozMDMf9DQ8En7BHVe7bupGd5TeBfXGCHOAxrfxk+rsRpTWF
         OPLOktd9n86XAODVW8MMQQU9Ox7VkcNXI+8ZUxDwa5aqB+eAxwmnbM9x7rDfF9yaelO+
         r5Zak6U63SrV6awNMzd98eBti9CMlSc4aWUuf7A5pZcr0vEP1CUIHeaOkkEzfmaRxulf
         Oy36Cw+fzvgxsZc+k5f28x3rKcRUgPvEnp+cdJ/yc/n6K75AoGqWb2TZfeqkBeTRso7w
         tiHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822441; x=1795427241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E06BVf3jX1KLr6IyFH4QZl+untonFT3iXLQzubinz1g=;
        b=fXsHLEuiuGImSC4AaQHo6v6vna0Y0nG9DxYuAjTjnyEGPgWsdd9h3YwVzRpcnsaL5s
         mlxmuL+IHvd73RDgKQqA0VWQO9ee8ZgoDgchHpw7jv+TaLfblyxa0rvQxU7b0vCA9mf+
         1mu72+JaG7GA07LiOMGa9B6mx3YQsE3rDmDb6n0Ga2vKmLOcfoDWtxoFRNCepIxXXilw
         GIQ7oBbGdXeOBdz386K8kdKdWunkCyOeDO5ysL893V/BLDMMqQGWuIkN2Ud6UDgP/4Vp
         qmDvvhRGeSytKRESUJI5xn3htgDkfdG1CG/qn6Gd7th9fs2bGSnq5PgotNNwU7zpPHiR
         dvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822441; x=1795427241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E06BVf3jX1KLr6IyFH4QZl+untonFT3iXLQzubinz1g=;
        b=jvxFPOylM0jH0SXg59ynjuVXeAZqRtwAWLpsLiLUkNFuWAKidcHhIcm51KOQ1EnJ2Q
         SYY277jAic4f3kG7QpGhwmr47oF6PjtOt3aIax3+gDe5GzJQoUbT8bErSvKvpVzRtuJK
         fNuYPgn08KanVsnkp4FO82sRYZt3kyYb0kxeAqjsx7mSVHrXq92Land7fP6VSGwIS3dC
         7KiRLGqIJIGbVXiGGmDFronW8P+I179wRQKf3ovhEE7Y6aY3kZFeB0+jgHwK5QQp35l9
         NYdXA/cFgpUchkZtzlzNIhV1ugpaV13YHWFxZuSw/2CXbtcrNc1MlVtDEcjhm/4PVD4Q
         3Ztg==
X-Forwarded-Encrypted: i=1; AL+hErHqJ+wmxndGYo7Sf4NF0AFYS4J2IwKTbEN+Tm3/dzWtdztcH/qgOpjeWkgBDth31lICYDlv4N1pqhNMzzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a+11CUI5ph4ylRqYdUbBmeMjZ/aXraKjWnmApms7FczJcM852
	PXcgSkvBoZWyfXj06ldobtMJoUeQ+MX1FZSyY7oeg0QE2AhZwFAumDFAtc5UwpjjxhF8QzECJEZ
	THmfGiz6KHxkhnrxv1MCwGTZGNj+ui8Q=
X-Gm-Gg: AYBFou1iB4m0+fZcpfehuNlCciuAYKaJ2leOGSApsrd0CFa22EAumu8p88NTCKI1IEw
	rqDAPhnQVxm92q+Nmhf6HtW0avgB/wVXHQjlEYHgJ0Jk1dwwFUejYY7fCHbeedafM+5dwr49IV4
	DSsQd3m1yPdhD2kVMTAIEyD9AachwKF8iQdKvepK2io+Lhoy3d2oqFuKCgJb1w4+SH4y1LDcEsg
	bO5alV3Rhyrd9gqm2q5wNWqs2O8CFixQ+E+BVcqk3oZj4QAM1vnCHrqFb5KcLxj3wyWblT1GI55
	gNOLIuGhYAx0bZH3yRDGOvHEzWVSUVn2AAcPVnCmRIkKxU6Kmjx1DAAHPSKLlMErDy8Tea3l8fi
	ioW7Te3wA9E3xvzoWwF8qVggH+B+SBHDVILDN
X-Received: by 2002:ac8:5fc5:0:b0:536:6946:748c with SMTP id
 d75a77b69052e-55ac8d8fd12mr161719691cf.53.1794822440742; Mon, 16 Nov 2026
 01:47:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112053321.1103678-1-zxyan0222@gmail.com> <179480735876.3136.11399412047883475554@kernel.org>
In-Reply-To: <179480735876.3136.11399412047883475554@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Mon, 16 Nov 2026 17:47:08 +0800
X-Gm-Features: Aa3M54rwgNCScJJ2XWAePpyHY0u6TTW71j8ZErXA-iIMbxbEkP5Otp5NDL9fkfA
Message-ID: <CAP7veTKL6L2bho3pmS277kkB4BaboSVLRp8GL9fHdzcKucfoCQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: stmmac: program the FSM timeout timer
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review. Responses below.

On Mon, Nov 16, 2026 at 1:36=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 7 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 3 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The XGMAC half of the fix never runs on any in-tree platform.

This is due to dwxgmac3_safety_feat_config() not having the
all_safety_feats fallback that dwmac5_safety_feat_config() has -- a
pre-existing difference, not introduced by this patch. Fixing it
(adding the fallback and gating XGMAC_PRTYEN/XGMAC_TMOUTEN on the
config, matching dwmac5) changes the existing unconditional behavior.
Perhaps it would be more appropriate to address this part as a separate
optimization later on.

> - [Medium] csr_clk_mhz, which feeds the TMR field ('CSR clocks per 1us
>   tic'), comes only from clk_get_rate(priv->plat->stmmac_clk) in=E2=80=A6

Agreed, I'll add a netdev_warn() when the CSR clock is unavailable so
the skipped timer programming is not silent. I deliberately did not
fall back to plat->clk_csr: clk_csr selects the MDC divider (a
frequency band, e.g. 250-300M), it does not hold the exact CSR clock
rate, so it cannot derive TMR accurately.

> - [Medium] MAC_FSM_ACT_Timer and XGMAC_MAC_FSM_ACT_TIMER are written with
>   a plain writel() that contains only FIELD_PREP(NTMRMD) |=E2=80=A6

Agreed, I'll make the MAC_FSM_ACT_Timer write a read-modify-write.

> - [Medium] The new STMMAC_NTMRMD_* encodings (0x1=3D1us, 0x2=3D4ms, 0x3=
=3D16ms,
>   0x4=3D64ms, 0x5=3D256ms, 0x6=3D1s, 0x7=3D4s, 0x8=3D16s, 0x9=3D32s, 0xa=
=3D64s) and=E2=80=A6

The NTMRMD encodings come from the DesignWare Ethernet QoS Databook
(v5.40a), MAC_FSM_ACT_Timer.NTMRMD field, and the XGMAC Databook
(v3.10a), same register. TMR is documented as "number of CSR clocks
required to generate 1us tic", i.e. the CSR clock rate in MHz, not MHz - 1.

Values:
0x0 (DISABLE): Timer disabled
0x1 (M_1MICRO_SEC): 1us
0x2 (M_4MILLI_SEC): 1.024ms (~4ms)
0x3 (M_16MILLI_SEC): 16.384ms (~16ms)
0x4 (M_64MILLI_SEC): 65.536ms (~64ms)
0x5 (M_256MILLI_SEC): 262.144ms (~256ms)
0x6 (M_1SEC): 1.048sec (~1sec)
0x7 (M_4SEC): 4.194sec (~4sec)
0x8 (M_16SEC): 16.777sec (~16sec)
0x9 (M_32SEC): 33.554sec (~32sec)
0xa (M_64SEC): 67.108sec (~64sec)
0xb (RSVD): Reserved

> - [Low] The patch turns on a live FSM timeout with a 1s default on every
>   dwmac4/5 platform with ASP >=3D 2 that passes no safety config.
> - [Low] The patch adds a platform-facing knob, struct
>   stmmac_safety_feature_cfg.ntmrmd, plus ten STMMAC_NTMRMD_* constants=E2=
=80=A6
> - [Low] The commit message describes a functional defect: TMOUTEN is
>   enabled but the timer is never programmed, so 'the advertised timeout=
=E2=80=A6
>
> --
>
> net: stmmac: program the FSM timeout timer
>
> This patch programs MAC_FSM_ACT_Timer right after TMOUTEN is enabled in
> dwmac5_safety_feat_config() and dwxgmac3_safety_feat_config(). The TMR
> field comes from the stmmac_clk rate, and NTMRMD defaults to a 1s
> timeout. It also adds a csr_clk_mhz argument to the safety_feat_config
> callback, a new ntmrmd field and STMMAC_NTMRMD_* constants in
> include/linux/stmmac.h.
>
> > v2:
> > - Rebased onto net-next.
> > - Dropped the Fixes: tags (this never worked, so it's feature completio=
n,
> >   not a regression fix).
>
> [Severity: Low]
> The commit message describes a functional defect. TMOUTEN is enabled but
> the timer is never programmed, so "the advertised timeout protection is
> ineffective".
>
> Documentation/process/submitting-patches.rst says "A Fixes: tag indicates
> that the patch fixes a bug in a previous commit."
>
> Would it be worth keeping the Fixes: tags, so that stable and downstream
> safety users can tell which kernels lack working FSM timeout detection?
> Given the net-next target, this may be the maintainers' call.
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac5.c
> > index f1bb981cab7cd..4ab7a3df98c6d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
>
> [ ... ]
>
> > @@ -245,6 +247,22 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr=
, unsigned int asp,
> >               value |=3D TMOUTEN; /* FSM Timeout Feature */
> >       writel(value, ioaddr + MAC_FSM_CONTROL);
> >
> > +     /* Program the FSM active timer so the timeout checker actually f=
ires.
> > +      * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in M=
Hz.
> > +      * Default to a 1s timeout when the platform did not select one.
> > +      */
> > +     if (safety_feat_cfg->tmouten && csr_clk_mhz) {
>
> [Severity: Low]
> This turns on a live 1s FSM timeout on every dwmac4/5 platform with
> ASP >=3D 2 that passes no safety config. A NULL safety_feat_cfg selects
> all_safety_feats with tmouten =3D 1. That covers all the OF glue drivers,
> plus mediatek and stmmac_pci.
>
> When the timer fires, the timeout is reported as MCSIS and handled as
> uncorrectable:
>
> dwmac5_safety_feat_irq_status() {
>     ...
>         err =3D (mtl & MCSIS) || (dma & MCSIS);
>         corr =3D false;
>         if (err) {
>                 dwmac5_handle_mac_err(ndev, ioaddr, corr, stats);
>                 ret |=3D !corr;
>         }
>     ...
> }
>
> stmmac_safety_feat_interrupt() {
>     ...
>         if (ret && (ret !=3D -EINVAL)) {
>                 stmmac_global_err(priv);
>     ...
> }
>
> The result is carrier off and a full adapter reset, which these boards
> never got before this patch.
>
> The commit message only says a stuck FSM will now be "reported". Could
> it mention the reset, and explain why 1s is safe on platforms other than
> the two IPs that were tested?
>
> > +             u32 ntmrmd =3D safety_feat_cfg->ntmrmd;
> > +
> > +             ntmrmd =3D (ntmrmd >=3D STMMAC_NTMRMD_1US &&
> > +                       ntmrmd <=3D STMMAC_NTMRMD_64SEC) ?
> > +                      ntmrmd : STMMAC_NTMRMD_1SEC;
> > +
> > +             writel(FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
> > +                    FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz),
> > +                    ioaddr + MAC_FSM_ACT_TIMER);
>
> [Severity: Medium]
> This is a plain writel() of only NTMRMD and TMR, so every other bit in
> MAC_FSM_ACT_Timer is set to 0. dwxgmac3_safety_feat_config() does the
> same for XGMAC_MAC_FSM_ACT_TIMER. The MAC_FSM_CONTROL update just above
> uses read/modify/write instead.
>
> The patch defines only TMR as GENMASK(9, 0) and NTMRMD as
> GENMASK(19, 16). Doesn't the Synopsys EQoS/XGMAC safety register layout
> also have a large-mode timeout field (LTMRMD, bits [23:20])?
>
> If LTMRMD exists and 0 also means disabled there, would FSMs checked
> against the large-mode timer stay unprotected after this patch? Any
> non-zero reset value in those bits would also be cleared.
>
> I couldn't confirm the register layout from in-tree code, so this may
> need checking against the databook.
>
> > +     }
> > +
>
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index 7ad08651675e8..dac85431e7401 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
>
> [ ... ]
>
> > @@ -873,6 +875,22 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, =
unsigned int asp,
> >       value |=3D XGMAC_TMOUTEN; /* FSM Timeout Feature */
> >       writel(value, ioaddr + XGMAC_MAC_FSM_CONTROL);
> >
> > +     /* Program the FSM active timer so the timeout checker actually f=
ires.
> > +      * TMR is the number of CSR clocks per 1us tic, i.e. csr_clk in M=
Hz.
> > +      * Default to a 1s timeout when the platform did not select one.
> > +      */
> > +     if (safety_cfg && safety_cfg->tmouten && csr_clk_mhz) {
>
> [Severity: High]
> Can this block ever run on an in-tree XGMAC platform?
>
> XGMAC_TMOUTEN is set unconditionally just above, but the timer is only
> written when safety_cfg is non-NULL. dwmac5_safety_feat_config() falls
> back to all features when the cfg is NULL, and this function doesn't:
>
> dwmac5_safety_feat_config() {
>     ...
>         if (!safety_feat_cfg)
>                 safety_feat_cfg =3D &all_safety_feats;
>     ...
> }
>
> Only three drivers set plat->safety_feat_cfg: dwmac-intel,
> dwmac-mediatek and stmmac_pci. None of them is XGMAC. dwmac-socfpga,
> dwmac-tegra (MGBE) and generic "snps,dwxgmac" via
> stmmac_probe_config_dt() all leave it NULL:
>
> stmmac_hw_setup()
>   stmmac_safety_feat_configuration()
>     stmmac_safety_feat_config()       /* safety_cfg =3D=3D NULL */
>       dwxgmac3_safety_feat_config()
>
> Doesn't that leave every in-tree dwxgmac with TMOUTEN =3D 1 and NTMRMD at
> its reset value of 0? That is the state the commit message calls broken,
> and the message says the fix was tested on dwxgmac.
>
> There is also a second mismatch. A platform that supplies a cfg with
> tmouten =3D 0 still gets XGMAC_TMOUTEN armed, but the timer is left
> unprogrammed. Should the timer write follow the same condition as the
> XGMAC_MAC_FSM_CONTROL write?
>
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 552840d29668e..1b3dd30db6dce 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3691,10 +3691,16 @@ static void stmmac_mtl_configuration(struct stm=
mac_priv *priv)
> >
> >  static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
> >  {
> > +     unsigned int csr_clk_mhz =3D 0;
> > +
> >       if (priv->dma_cap.asp) {
> >               netdev_info(priv->dev, "Enabling Safety Features\n");
> > +             if (priv->plat->stmmac_clk)
> > +                     csr_clk_mhz =3D clk_get_rate(priv->plat->stmmac_c=
lk) /
> > +                                   1000000;
>
> [Severity: Medium]
> What happens when stmmac_clk is NULL or reports a rate of 0?
>
> csr_clk_mhz then stays 0. Both dwmac5_safety_feat_config() and
> dwxgmac3_safety_feat_config() skip the MAC_FSM_ACT_TIMER write without
> any message, even though TMOUTEN has already been written to
> MAC_FSM_CONTROL.
>
> stmmac_clk can be NULL in a few cases:
>
> - An OF platform has no "stmmaceth" clock. stmmac_probe_config_dt() only
>   warns "Cannot get CSR clock" and sets the clock to NULL.
> - clk_register_fixed_rate() fails in dwmac-intel.
>
> The rate is also 0 with the !CONFIG_COMMON_CLK clk_get_rate() stub.
>
> One in-tree case is the Synopsys GMAC5 PCI board. It never sets
> stmmac_clk, only clk_csr, yet it explicitly asks for the timeout:
>
> snps_gmac5_default_data() {
>     ...
>         plat->clk_csr =3D STMMAC_CSR_250_300M;
>     ...
> }
>
> stmmac_pci_probe() {
>     ...
>         plat->safety_feat_cfg->tmouten =3D 1;
>     ...
> }
>
> On that board the timer is still not programmed after this patch. Could
> this fall back to plat->clk_csr or clk_ref_rate? Failing that, could it
> at least warn or clear TMOUTEN when the rate is unknown?
>
> This also ignores plat->clk_csr, which stmmac_mdio.c prefers over the
> stmmac_clk rate when the platform supplies it. Is stmmac_clk always
> clk_csr_i? If it runs slower, the computed tic would be short and the
> timeout would fire early.
>
> >               stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_c=
ap.asp,
> > -                                       priv->plat->safety_feat_cfg);
> > +                                       priv->plat->safety_feat_cfg,
> > +                                       csr_clk_mhz);
> >       } else {
> >               netdev_info(priv->dev, "No Safety Features support found\=
n");
> >       }
> > diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> > index 00be2df63d220..cb470a153bf81 100644
> > --- a/include/linux/stmmac.h
> > +++ b/include/linux/stmmac.h
> > @@ -168,8 +168,25 @@ struct stmmac_safety_feature_cfg {
> >       u32 edpp;
> >       u32 prtyen;
> >       u32 tmouten;
> > +     /* FSM normal-mode timeout value (MAC_FSM_ACT_Timer.NTMRMD). The =
TMR
> > +      * field (CSR clocks per 1us) is derived from the CSR clock by st=
mmac.
> > +      * 0 selects the default 1s timeout.
> > +      */
> > +     u32 ntmrmd;
>
> [Severity: Low]
> Is an in-tree user planned for ntmrmd and the STMMAC_NTMRMD_* constants?
> Nothing in drivers/net/ethernet/stmicro/stmmac/ sets the field.
> dwmac-intel, dwmac-mediatek and stmmac_pci all leave it at 0, and only
> the two new consumer blocks read it.
>
> Also, dwmac5_safety_feat_config() and dwxgmac3_safety_feat_config() both
> replace an out-of-range value (0xb-0xf) with STMMAC_NTMRMD_1SEC without a
> warning. Should that be reported?
>
> >  };
> >
> > +/* MAC_FSM_ACT_Timer.NTMRMD timeout durations */
> > +#define STMMAC_NTMRMD_1US            0x1
> > +#define STMMAC_NTMRMD_4MS            0x2
> > +#define STMMAC_NTMRMD_16MS           0x3
> > +#define STMMAC_NTMRMD_64MS           0x4
> > +#define STMMAC_NTMRMD_256MS          0x5
> > +#define STMMAC_NTMRMD_1SEC           0x6
> > +#define STMMAC_NTMRMD_4SEC           0x7
> > +#define STMMAC_NTMRMD_16SEC          0x8
> > +#define STMMAC_NTMRMD_32SEC          0x9
> > +#define STMMAC_NTMRMD_64SEC          0xa
>
> [Severity: Medium]
> Where do these encodings come from? There is no in-tree reference for
> them. There is also none for TMR being the CSR clock in MHz rather than
> MHz - 1. The same table is used for both EQoS 5.x and XGMAC 3.x.
>
> The steps are also irregular: 1us jumps straight to 4ms, then the values
> go up in x4 steps, then x2 steps.
>
> Suppose the hardware encodes NTMRMD differently, for example with a
> microsecond-scale normal-mode range. The default of 0x6 would then select
> a much shorter timeout.
>
> dwmac5_mac_errors treats every FSM timeout (TTES, RTES, CTES, ATES,
> PTES, ...) as uncorrectable, and stmmac_safety_feat_interrupt() handles
> that with stmmac_global_err().
>
> Could a wrong encoding cause repeated full MAC resets by default on OF
> dwmac4/5 boards with ASP >=3D 2 and a stmmaceth clock? A pointer to the
> databook table these values come from would help.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261112053321.1103678-1-zxyan0222%40gmail.com

pw-bot: cr
