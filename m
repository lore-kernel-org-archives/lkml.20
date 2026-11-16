Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794800577;
	b=LTXQfFf6QHgqufeTDk/m9ZRjg0GrHjmH57+nNJNgZOgj6Au3xec9iVjfOdtFAaM4w+HA
	 f1p46X0uvupJqdGov3QrqpHUcIOP0v1l8qSeihTL0ajoI+GxUgCo3iUjBDxtrzAPKOBsr
	 x0nBZo/HNma1CbgbyD0Hb+buu3fHIO0Q0kaWBWrBeq9A+R0b8opCUrYCTvVY03m6RWlFl
	 Rx/cNrG2Eqloqh2n1qxgSumoRzY76l40zV7EkYAzjB+Ln6Kr0n320Gdmqrg8pNm2NcgSY
	 feP+6TqGppSn2SQGOOVF0qYAbnRocyTXyqgFanWQZxWJwCjX5i6gs+Rhv6kqvoZy0Fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dOlZAyE9vs/lqE824HqTB6ln1BIOlH2oNMzzigLgNRA=;
	b=FpgAp/Gkm9Zd806VGPVDPIi+AZp6HYN0iHhzhihJH4taRljqib8pXl7ulKtuWe6UahpI
	 9IGaARJRr6CrFbl6nexnX2+Je/bZBu7BkhNQ4+VfQb8mQEGvQyI5DHjjNZ1Pu2RatSSns
	 8Yl9wmG7rwGSxlsXOtwAAFiBknvASkDscnxDri7I9KG4S8XE8GxXbi199YP0ao6M0LQ/U
	 55H17JlcCg8htfmRHGu9x4CPUrtcNZhFIqj2fA8L5wket/PhmI0U4BG/iyPAsfO53KyoV
	 o+HZdfYleNuTTLh+6frOrsPIxsx/VlmEVzxrdjKZIAGG/IHYgYEsMpn5a5QDNeRC+4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywZegp49;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A068606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A068606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ywZegp49
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91ea16d8072so31741336d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:42:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794800576; cv=none;
        d=google.com; s=arc-20260327;
        b=rx7TD9ueUuAAbgf8GaJ8JHq8SddyFIGJ2zFSbHQjO38d0MFkxTjmht6P2169GxSheY
         AkO1oA8yJLmozbz8PDlU9n/0FQ+saeBIOX0y4x87DTrEKA8Be+RFuhWwUluWPfySRE+f
         5Z2aceYDJdFDFWINIcwDrUOy6XJDNXsk0yqpqplbwvrzccbI7anOej/fByYmDl/Xlh6e
         k6OGi7hn4AcLPeNoJAn90lVMrQNmX0Ai/KEXYJ7Na5NRq9gqb8/vAVrgnv7AH2fIs7gL
         MHYu4J220Vt6HJzYfTv+KR5tg69iEcXFLHNdV4LojpFXKgfdf/n0i/IQ/qmC9Soseqa0
         eFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dOlZAyE9vs/lqE824HqTB6ln1BIOlH2oNMzzigLgNRA=;
        fh=NJRUZOc/CJ/cGgD3caaiUknYUXPJoYwkKtuQWNL/zqM=;
        b=ReBnRjvKaAthPiWpvODohmh4xTq42gppNmIypkeRpqh6mieskZX9g2wBTFpPGtK7hS
         ihMKpaYaWBb5P79jcDCDzD9+8W5lwBWPzBYXKnLdV3M2SIawHIWQKi7mE4fMmc+tD+kq
         xbpNyACBOrB0atbNA6ztPlaBtUylAUko3g2g1vryCfpbQuuFBPU9YGSKxy+A38pA6AxS
         7fsK5I9J5OSelurgiAaMuWmWTBSnsEgNSiOfTqE6GACeCGjRo8PttAj5j0KpGK4Tg4K8
         JwSG1u/KJzMX6OnGRRQ80RY/TYHVZt2x6qHUd5ZiWqCBYYOSHE75Xhu7f8aNmni49v3a
         SM0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794800576; x=1795405376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dOlZAyE9vs/lqE824HqTB6ln1BIOlH2oNMzzigLgNRA=;
        b=ywZegp49Ix8to0uRlNyrPXTvCB1HuL09juRdlVb1s4IYeQz1h0S6xdylZTG0C5ZaCj
         7xcWqmD5cNuxWypu+sb46wX4qCLDw0IbU8sKhYxX3/qpd2sH5XVk/mjBqYnOhUOH2JES
         RyHIOTE40mGJZflcjC9RqScpmhVI+v1cz8qnDrjHG9RFsRSfbWxYK3XOFbSlf96KvAlJ
         bpp9bu3qgwyQ2+S3/3yOC91FxVJUthTQO3eDCdFCDzjq6yjeDrN4vJqhhqLzDgX4OqkW
         1EXpkUHf4Ru4dmvqSVx2wXJh4EvGwPw0kfVZm5BZC85cVPzr6LI6Yqvd48JUp+WIDkSA
         vsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800576; x=1795405376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOlZAyE9vs/lqE824HqTB6ln1BIOlH2oNMzzigLgNRA=;
        b=fNRPcgeUjR9ZQAf/yUt6lWQHlnKJDWR0yvDBT8M40X1YEPzaLwI4rRhdMF1ucf3JcE
         stNUTp95PRaWIAPYhhH6lYnuhjMGOafsdJlhCAK+lVz+0lSUr2UGWXpzTBpi2//WJeh5
         BEubZeOL/H7aoGT/USdWUon3e08z4OJJWTTDBPZgsQAkvnXomTFdubOBuQtXAeOj749q
         8vLBzAFg2Qv14Jxv0jsMcBzvXT8yKbelINomPFfuzd9WubtjTb/ZO/0EupdIsuRjKFg7
         nxuREM/YF2fi1K9Q1l7a7gzaeCu9bBWYOfdaYABlMcpD1Iq47T7vbU6WbNcFj9bZ37eT
         cUUA==
X-Forwarded-Encrypted: i=1; AL+hErGK1iQvwkSPlKDQwSRqWCg44wamNPduddP8AvlHFVCLmitZ+n1au2oAGLgRjr8nDuxa470YRXp7uhjMwpo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xfmHWE2mXCps35UUHdf9O4AL8SkCJVXN2cP6VoXPI0ZL2abV9
	pjvN1/yAA98HIUgGvy0v4DohizTWQj67nlzyQ2FRi3mDeu0HlBivLpLmwIBcDu/KJaDycyqAFS5
	UtOtznKtZGAbuFFt4D9EHk2yk9UyvCy8=
X-Gm-Gg: AYBFou3DrPzc7hUmvM6+5XpO7F66/rqbgfLmv9JbQk2A34enqMwvMa+ZpplWzBBvrMF
	wkJq/2+Mq45O4P87eiarT3eWyaZO6tMi3PQ2UjP+obJASrh8poB9Q7xP/wNK5C2BrvOeIu8c1XB
	JOBJzMXoDYL1RXFMcuDGt/qQb/Z7tKhQSe0vy6NTYTh5HAz/Yz2sXeUvR3BXFAeELBalLEg2W3U
	4+cO/7dZT+1lwRcXJhr3O0pSxQZsNPzNUktDcvi0XOIgRuHI+Mcr6spvf18uNL0m7AcZj02UPnd
	TTI5AnPYzPhLvcB4WXrQHrpYVXw+ymTF20DG6lQBeiAQ6snpUSnzYFug6AneCYUmRjbvrdyK8hM
	ybIf71ReLEJwASZj6NH8meaoy42WArA72YRbpEZKoCLtcAc9YxCqPI2+7+A==
X-Received: by 2002:a05:6214:19ef:b0:91e:8ed6:896d with SMTP id
 6a1803df08f44-91f241c378dmr151744126d6.41.1794800575849; Sun, 15 Nov 2026
 19:42:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111143322.2234321-1-zxyan0222@gmail.com> <179475432482.2199510.1145189790252763539@kernel.org>
In-Reply-To: <179475432482.2199510.1145189790252763539@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Mon, 16 Nov 2026 11:42:44 +0800
X-Gm-Features: AclHuK8RWI64vYnkTEZed0w7lAVf5eQomaFuYuPxLHChMWyGtIZq8zcHC45Yt3w
Message-ID: <CAP7veT+DRYGQ79r+_1-i8bMjM1wuoNsVTDjQPLYJyAwHtxHPCw@mail.gmail.com>
Subject: Re: [PATCH] net: stmmac: program the FSM timeout timer
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk, Jose.Abreu@synopsys.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review. Responses below.

On Sun, Nov 15, 2026 at 10:52=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] On every in-tree XGMAC platform, the XGMAC half of this fix
>   never runs.
> - [High] The new code takes the CSR clock rate only from
>   priv->plat->stmmac_clk (stmmac_safety_feat_configuration(),=E2=80=A6
> - [Medium] dwmac5_safety_feat_config() (dwmac5.c:261-263) and
>   dwxgmac3_safety_feat_config() (dwxgmac2_core.c, around lines 887-889)=
=E2=80=A6
>
> --
>
> net: stmmac: program the FSM timeout timer
>
> This commit programs MAC_FSM_ACT_Timer right after TMOUTEN is enabled, in
> both dwmac5_safety_feat_config() and dwxgmac3_safety_feat_config(). TMR i=
s
> derived from the CSR clock rate and NTMRMD defaults to a 1s timeout. A ne=
w
> ntmrmd field in stmmac_safety_feature_cfg lets a platform override that
> default, and csr_clk_mhz is passed through the safety_feat_config callbac=
k.
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
> This writel() replaces the whole MAC_FSM_ACT_Timer register with only the
> NTMRMD and TMR fields set. Every other bit becomes zero. Is that intended=
?
>
> In the Synopsys EQoS/XGMAC layout, this register also has a large-mode
> timeout field (LTMRMD, bits 23:20) for FSMs that need longer timeouts. Th=
e
> patch doesn't define or program it.
>
> The commit message says a zero mode field disables the timer. If that als=
o
> applies to LTMRMD, would the large-mode FSMs stay unmonitored after this
> write? And if reset or boot firmware had set LTMRMD, would this write tur=
n
> that monitoring off?
>
> Should this be a read-modify-write, or should LTMRMD be programmed too? T=
he
> same whole-register write is in dwxgmac3_safety_feat_config().
>
> > +     }
> > +
>
Agreed, I'll make the MAC_FSM_ACT_Timer write a read-modify-write.

> [ ... ]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index 1a88cbaed70ca..76c850ea13a5c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
>
> [ ... ]
>
> > @@ -871,6 +873,22 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, =
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
> Can this block run on any in-tree XGMAC platform?
>
> When safety_cfg is NULL, dwmac5_safety_feat_config() substitutes a defaul=
t
> config, but dwxgmac3_safety_feat_config() does not:
>
> dwmac5_safety_feat_config() {
>     ...
>         if (!safety_feat_cfg)
>                 safety_feat_cfg =3D &all_safety_feats;
>     ...
> }
>
> stmmac_safety_feat_configuration() passes priv->plat->safety_feat_cfg
> through unchanged. The only in-tree platforms that allocate it appear to =
be
> dwmac-intel.c, dwmac-mediatek.c and stmmac_pci.c, and all of them are
> GMAC/GMAC4 cores.
>
> The XGMAC users leave it NULL: dwmac-socfpga.c, dwmac-tegra.c and generic
> "snps,dwxgmac" DT through stmmac_platform.c. Both dwxgmac210_ops and
> dwxlgmac2_ops use this function.
>
> On those platforms, XGMAC_TMOUTEN is still set unconditionally above, but
> the timer write is skipped. The hardware stays in the state the commit
> message describes as the bug, even though the patch carries:
>
>     Fixes: 56e58d6c8a56 ("net: stmmac: Implement Safety Features in XGMAC=
 core")
>
> This also contradicts the new comment "Default to a 1s timeout when the
> platform did not select one".
>
> There is a related mismatch when a cfg is passed with tmouten =3D 0: TMOU=
TEN
> is still set, but the timer is not programmed.
>
> Should TMOUTEN and the timer write be gated on the same condition? And
> should a NULL cfg be handled the same way dwmac5 handles it?
>
This is due to dwxgmac3_safety_feat_config() not having the
all_safety_feats fallback that dwmac5_safety_feat_config() has -- a
pre-existing difference, not introduced by this patch. Fixing it
(adding the fallback and gating XGMAC_PRTYEN/XGMAC_TMOUTEN on the
config, matching dwmac5) changes the existing unconditional behavior.
Perhaps it would be more appropriate to address this part as a separate
optimization later on.

> [ ... ]
>
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index f8dceafdda2d2..52f63f624d67c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3639,10 +3639,16 @@ static void stmmac_mtl_configuration(struct stm=
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
> [Severity: High]
> What happens when priv->plat->stmmac_clk is NULL here? csr_clk_mhz stays =
0.
> By the time dwmac5_safety_feat_config() reaches the timer block it has
> already set TMOUTEN, and it then skips the MAC_FSM_ACT_Timer write withou=
t
> any message:
>
>         if (safety_feat_cfg->tmouten && csr_clk_mhz) {
>
> Both in-tree platforms that explicitly set safety_feat_cfg->tmouten =3D 1
> appear to have no stmmac_clk.
>
> In stmmac_pci.c, stmmac_pci_probe() sets tmouten =3D 1 for snps_gmac5. Th=
e
> only CSR clock information is plat->clk_csr =3D STMMAC_CSR_250_300M in
> snps_gmac5_default_data(), and nothing in stmmac_pci.c assigns stmmac_clk=
.
>
> In dwmac-mediatek.c, mediatek_dwmac_common_data() sets tmouten =3D 1. The
> mediatek binding and dtsi files have no "stmmaceth" clock-name. As a resu=
lt,
> devm_clk_get() fails in stmmac_probe_config_dt(), which prints "Cannot ge=
t
> CSR clock" and sets plat->stmmac_clk =3D NULL.
>
> On both platforms the timer is never programmed and nothing is logged. Th=
at
> doesn't match the new comment on stmmac_safety_feature_cfg.ntmrmd, which
> says TMR "is derived from the CSR clock by stmmac" and that "0 selects th=
e
> default 1s timeout".
>
> Could this fall back to plat->clk_csr, use a different clock source, or a=
t
> least warn when the timer can't be programmed?
>
> >               stmmac_safety_feat_config(priv, priv->ioaddr, priv->dma_c=
ap.asp,
> > -                                       priv->plat->safety_feat_cfg);
> > +                                       priv->plat->safety_feat_cfg,
> > +                                       csr_clk_mhz);
>
Agreed, I'll add a netdev_warn() when the CSR clock is unavailable so
the skipped timer programming is not silent. I deliberately did not
fall back to plat->clk_csr: clk_csr selects the MDC divider (a
frequency band, e.g. 250-300M), it does not hold the exact CSR clock
rate, so it cannot derive TMR accurately.

> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261111143322.2234321-1-zxyan0222%40gmail.com

pw-bot: cr
