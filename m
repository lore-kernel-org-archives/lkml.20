Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794921611;
	b=eknV1P79HKfv96q7L7als0VyeZ68QOrlQRvPfmOl8xwUOr8CoHidRiNJHQmmxx8nn4D7
	 7QNLh/1C82Rmefq71Ku8GPOvIANBEFrq0FEDZn4JCjYcdEhli+zjPY5+I/zBjfHNlFLds
	 17BEXk6s8+Vj6met6hUYBmxXAeEbYNo0/Olj7gTLuEPVOEhKT9k+RZ1erjpxV4oSajojR
	 0+w96f8Wqlf7nbGTDANTUdVH1jqc8/Zpo70iyLqhXzy9MJunLAetKkcYJAHkEBDmu5ohH
	 2vLpVcflyPqaNhUGTXjtnWbbWvh3lQSJkticXZGnnTRbjy7onM9OITsqxrnW4HHpkaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rQRyos+8rpsshZOWM7GC/VB17dJmJXzE29VCNIThb18=;
	b=J0Kuij+nOLhyE5YAEJnINuSu5lL+s0+uVKs6mansGdoDdB7AgZLKzpt1qZu/q0scYVgZ
	 ks5fjOfOoZW/KvLSEYp68zlXg9Q2EFrNddb8litwokUtYlIwWkWb5bG8gsTC0ZAfgdmLJ
	 jU62t1DR+7Lpy2LANPITPo0MWw/FSl32Neo3ouUbyUdTIByvbdNhcI9aEAoYrvOOjMlrL
	 QdSn0K/TD1FnCTQ0+KwQcuA1LdK7tfi5ASS2w1WWUyyFsSNQcfMh3EJkQ3DmXojvDVT1c
	 fUB7SOxlieGBTy77DpJS4qy6lRG+dSoiwde9VH186t6KR0AgGQv3V7ulPuH9NX0lcaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NBW9+Lzg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272DC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 272DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NBW9+Lzg
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-930c0f9c1b1so552306085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:20:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794921609; cv=none;
        d=google.com; s=arc-20260327;
        b=fqvnPRxvi+nWbzybMWjcOT2p8DW+IMcjzdvuLY2cuE0PO3foZJaSlHABSc6EyBdfUh
         XxpGmhq7id8tXZImljO13WmE+DWUBNmowQQnVOcQjC2Q91tGge/+m//GXt3lQvEs8DcU
         nSqUvXVIO/JmEoPpDpmVWuACqky/7Gi0vuzu3pRq6jfYxmWT7QYlV8kZuh0OH+9FfhqL
         zoEBwwidsoZJDFOKUdy8h6aY1P+0D7GhkFTotITyZwr8JcFOXgRWkvGioMB861Vr7wQz
         GCxoyHbG2W5Vb5yrQoD86E2EBqQLslk7CnIwGumpcSn4FGJYCPEGDqtkUCY9qeJy0Npf
         V9tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rQRyos+8rpsshZOWM7GC/VB17dJmJXzE29VCNIThb18=;
        fh=aPI/27XkvG86u2CmTgINmKBmbSKyCecCdg3IAui13Xo=;
        b=ZiSqz1btO4SHsaJ6a1n5Zq5WkpzM1BPMtPuYg85Uzui8thqrMMw64DXFVI3avBQdAm
         kZ4RPQVne+ktYaislMPJhld/o7mJsTnRtll84nKmUWQOve8qsk+oOepRrhDL4VMdFZgK
         oQogQO6F+FQuktWMWSAGR30XFCRsoAsjg8M3gKeb5Ub3mxMddyUQKUUEEomzGPrPKZFO
         pnkZPRubwSJ07yp1kYDOKdrG32AHRVypOPQzrIhqN9BBA4qQuSnZokfEN77TdrzSGtW0
         /KtPRuiUL3VcsBn0qNdnfTjZp2LtP1UbZT0/N6FcrBJWwDl5VTOaIaFdeqVjOmWYZM1N
         tMHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794921609; x=1795526409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rQRyos+8rpsshZOWM7GC/VB17dJmJXzE29VCNIThb18=;
        b=NBW9+LzgBj9iRivtL2XvWf38mNoUlu/Zql3LVCvvPmlOLTccC2kUho8LQ+PYHvPPoe
         q/pdaf0RORqvPINsAyzc+gO53oddLi/DZL/RN+3C7J0h4ehDB9lKvNlW0MHzKJrqPAqf
         Nx/2qrxt0hQw2rJkdO1VCsJf8zejJrGdGx+sG38HFZqrbAt7X/0eOfSfs8W9g8ZWB92k
         Qv0hPkv4oHxI3UFM7mKi39ctbjCUUD9nm0YCRSe9+B7tdkDfvyrd4+HTo0luWPIjatwU
         BLPiBw4ol7/6JiilXnZrXiBPf4necXEr5S/NdTMEW0l90PFmlfi4t/tIQIDCfEwCGN8j
         GgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921609; x=1795526409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQRyos+8rpsshZOWM7GC/VB17dJmJXzE29VCNIThb18=;
        b=KXVo0a9Ap4hIz2laF6enSe506RhJYS0wriTdB4jkYHsm10AjWxUZA/qeoaQ4BZwCSu
         FHfkrPnIEh2VGeHvnpC+zGfWpOeIPMHg3gCgiMHkQCW7r34dhLO6tvaNmk73QwcIKD8s
         Iaciq37++zlCsRukVrbtbNScbSYvsw8NmPbswAhCtokam1b1dk+WI4RJHn33DByFAqw+
         6zhn92o/bGGGNlt9ZdEwuDgjsSpVrhZBv7iNMlkJf30cAWT5AC2URMlLpfvirFMT0a4J
         hkTPXJ9jwmhGecWHzzhmJVSqv04bwsVz3HZdL6DSgbGpFaEy5qXk67/mTXxt3YHflxmu
         kPzQ==
X-Forwarded-Encrypted: i=1; AL+hErFS+h3h4wA740OGQs1ra2tJN50149qSLnxVER+Uooab4R/KErbSnDtckUFCuruPNjywELJGZSjbE31GNN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N7FPt7eOzjELZxx+Jae+o0V5A5JnOoMSkQnCnZcnYcLoYTive
	CSocqPUl7lhS3gxnoGYh/g4I7TEvc5Kcg7N4BEglmNkVbtlIM/lb0WiSWF+0wJPyUNnp4cU/qPd
	dffU+V4srGylgmvcpGVrgw5RCSRrwRRM=
X-Gm-Gg: AYBFou3TMyuD2kBDww5jVhsME8EVC0KVdZPQnyqF87aaXQEe7PnXLGVBCDKsHnDdQuW
	91jfSMKUav/u34s14lGb4V16GIE6+eo2FbYt1IHTRktqOJlFm2xzHBR+wWLaIHBiJtnpJC3his1
	K+K4VKP1FRApO+D6bfq5944yn+UvoYLzT1W6RfXaQ/KavDfgBj3rD5cyk0e1zUzc4vq19wxy/Gf
	jo2GWc1YbdR7I3N+B2KxADsbzY33jH3K1ODgEtECzSSFvj4cBYdUklrwW8NKN/gI8PbIOo7pfxq
	i6zCqh27unUBqyXf6wJqi1qcUVwLLhvSmYfOj+NYo0mIixFzAyQVuRDlf3Qfvwcuzz3UNEZG2dE
	Gf0IDMr13RkqwkPD0aT481LnG5xUOqZvA7FZ8atJ97zkHRFVo2nY7Crm4Yw==
X-Received: by 2002:a05:620a:6290:b0:93b:d79a:c45f with SMTP id
 af79cd13be357-9494bc2f497mr2165071085a.55.1794921608734; Tue, 17 Nov 2026
 05:20:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116114923.1157920-1-zxyan0222@gmail.com> <6c323fca-5d38-40f4-a923-26bdf43cea7c@bootlin.com>
In-Reply-To: <6c323fca-5d38-40f4-a923-26bdf43cea7c@bootlin.com>
From: zhu xin <zxyan0222@gmail.com>
Date: Tue, 17 Nov 2026 21:19:57 +0800
X-Gm-Features: AclHuK_1Q0pkQCEzadIleCMZEaVMj74iy9pgAWyfWX8GfF-z1IJNpNrRlfthzWA
Message-ID: <CAP7veT+3eNY82uka0-x5MzburF_x7tyvvSdGnhQP9_EYs-Os2w@mail.gmail.com>
Subject: Re: [PATCH net-next v3] net: stmmac: program the FSM timeout timer
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rmk+kernel@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Tue, Nov 17, 2026 at 6:23=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi,
>
> On 11/16/26 12:49, Zxyan Zhu wrote:
> > stmmac enables the FSM timeout checker (TMOUTEN) but never programs the
> > MAC_FSM_ACT_Timer register.  Per the databook the checker only fires on=
ce
> > NTMRMD is programmed with a non-zero duration; NTMRMD =3D=3D 0 disables=
 the
> > timer, so with TMOUTEN set but the timer left at reset a stuck FSM is
> > never reported and the advertised timeout protection is ineffective.
> >
> > Program MAC_FSM_ACT_Timer right after TMOUTEN is enabled, deriving the
> > TMR field (CSR clocks per 1us tic) from the CSR clock rate and defaulti=
ng
> > to a 1s timeout.  A platform can override the default through the new
> > ntmrmd field in stmmac_safety_feature_cfg.
> >
> > The NTMRMD field holds a power-of-two microsecond timeout per the
> > databook: 0x0 disables it, and 0x1..0xa encode 1us, 1.024ms (~1ms),
> > 16.384ms (~16ms), 65.536ms (~64ms), 262.144ms (~256ms), 1.048s (~1s),
> > 4.194s (~4s), 16.777s (~16s), 33.554s (~32s), 67.108s (~64s).
> >
> > The issue was hit in testing on dwmac4 and dwxgmac, where a stuck FSM w=
as
> > not reported through the safety interrupt despite TMOUTEN being set.
> >
> > Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
> > ---
> > v3:
> > - Make the MAC_FSM_ACT_Timer write a read-modify-write so the other
> >   fields (e.g. LTMRMD) are preserved.
> > - Warn when a valid CSR clock rate cannot be obtained.
> > - Document the NTMRMD encodings and fix 0x2 to 1ms (was 4ms).
> >
> > v2: https://lore.kernel.org/netdev/20261112053321.1103678-1-zxyan0222@g=
mail.com/
> > v1: https://lore.kernel.org/netdev/20261111143322.2234321-1-zxyan0222@g=
mail.com/
> >
> >  drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 22 +++++++++++++++++-
> >  drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  6 ++++-
> >  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 +++
> >  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 23 ++++++++++++++++++-
> >  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  3 ++-
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 11 ++++++++-
> >  include/linux/stmmac.h                        | 17 ++++++++++++++
> >  7 files changed, 80 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac5.c
> > index f1bb981cab7c..c1e3d634f153 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
> > @@ -2,6 +2,7 @@
> >  // Copyright (c) 2017 Synopsys, Inc. and/or its affiliates.
> >  // stmmac Support for 5.xx Ethernet QoS cores
> >
> > +#include <linux/bitfield.h>
> >  #include <linux/bitops.h>
> >  #include <linux/iopoll.h>
> >  #include "common.h"
> > @@ -184,7 +185,8 @@ static void dwmac5_handle_dma_err(struct net_device=
 *ndev,
> >  }
> >
> >  int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
> > -                           struct stmmac_safety_feature_cfg *safety_fe=
at_cfg)
> > +                           struct stmmac_safety_feature_cfg *safety_fe=
at_cfg,
> > +                           unsigned int csr_clk_mhz)
> >  {
> >       struct stmmac_safety_feature_cfg all_safety_feats =3D {
> >               .tsoee =3D 1,
> > @@ -245,6 +247,24 @@ int dwmac5_safety_feat_config(void __iomem *ioaddr=
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
> > +             value =3D readl(ioaddr + MAC_FSM_ACT_TIMER);
> > +             value &=3D ~(MAC_FSM_ACT_TIMER_NTMRMD | MAC_FSM_ACT_TIMER=
_TMR);
> > +             value |=3D FIELD_PREP(MAC_FSM_ACT_TIMER_NTMRMD, ntmrmd) |
> > +                      FIELD_PREP(MAC_FSM_ACT_TIMER_TMR, csr_clk_mhz);
> > +             writel(value, ioaddr + MAC_FSM_ACT_TIMER);
> > +     }
> > +
> >       /* 4. Enable Data Parity Protection */
> >       value =3D readl(ioaddr + MTL_DPP_CONTROL);
> >       if (safety_feat_cfg->edpp)
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net=
/ethernet/stmicro/stmmac/dwmac5.h
> > index 00b151b3b688..734e7630f28d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
> > @@ -8,8 +8,11 @@
> >  #define MAC_DPP_FSM_INT_STATUS               0x00000140
> >  #define MAC_AXI_SLV_DPE_ADDR_STATUS  0x00000144
> >  #define MAC_FSM_CONTROL                      0x00000148
> > +#define MAC_FSM_ACT_TIMER            0x0000014C
> >  #define PRTYEN                               BIT(1)
> >  #define TMOUTEN                              BIT(0)
> > +#define MAC_FSM_ACT_TIMER_TMR                GENMASK(9, 0)
> > +#define MAC_FSM_ACT_TIMER_NTMRMD     GENMASK(19, 16)
> >
> >  #define MAC_PPS_CONTROL                      0x00000b70
> >  #define PPS_MAXIDX(x)                        ((((x) + 1) * 8) - 1)
> > @@ -82,7 +85,8 @@
> >  #define GMAC_INT_FPE_EN                      BIT(17)
> >
> >  int dwmac5_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
> > -                           struct stmmac_safety_feature_cfg *safety_cf=
g);
> > +                           struct stmmac_safety_feature_cfg *safety_cf=
g,
> > +                           unsigned int csr_clk_mhz);
> >  int dwmac5_safety_feat_irq_status(struct net_device *ndev,
> >               void __iomem *ioaddr, unsigned int asp,
> >               struct stmmac_safety_stats *stats);
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/n=
et/ethernet/stmicro/stmmac/dwxgmac2.h
> > index f8ab347f7b5b..1fd501728b18 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > @@ -169,8 +169,11 @@
> >  #define XGMAC_HWFEAT_PCSEL           GENMASK(1, 0)
> >  #define XGMAC_MAC_DPP_FSM_INT_STATUS 0x00000150
> >  #define XGMAC_MAC_FSM_CONTROL                0x00000158
> > +#define XGMAC_MAC_FSM_ACT_TIMER              0x0000015C
> >  #define XGMAC_PRTYEN                 BIT(1)
> >  #define XGMAC_TMOUTEN                        BIT(0)
> > +#define XGMAC_MAC_FSM_ACT_TIMER_TMR          GENMASK(9, 0)
> > +#define XGMAC_MAC_FSM_ACT_TIMER_NTMRMD               GENMASK(19, 16)
> >  #define XGMAC_MDIO_ADDR                      0x00000200
> >  #define XGMAC_MDIO_DATA                      0x00000204
> >  #define XGMAC_MDIO_C22P                      0x00000220
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index 7ad08651675e..b3f99a6dfcd7 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > @@ -4,6 +4,7 @@
> >   * stmmac XGMAC support.
> >   */
> >
> > +#include <linux/bitfield.h>
> >  #include <linux/bitrev.h>
> >  #include <linux/crc32.h>
> >  #include <linux/iopoll.h>
> > @@ -837,7 +838,8 @@ static void dwxgmac3_handle_dma_err(struct net_devi=
ce *ndev,
> >
> >  static int
> >  dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
> > -                         struct stmmac_safety_feature_cfg *safety_cfg)
> > +                         struct stmmac_safety_feature_cfg *safety_cfg,
> > +                         unsigned int csr_clk_mhz)
> >  {
> >       u32 value;
> >
> > @@ -873,6 +875,25 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, =
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
> > +             u32 ntmrmd =3D safety_cfg->ntmrmd;
> > +
> > +             ntmrmd =3D (ntmrmd >=3D STMMAC_NTMRMD_1US &&
> > +                       ntmrmd <=3D STMMAC_NTMRMD_64SEC) ?
> > +                      ntmrmd : STMMAC_NTMRMD_1SEC;
> > +
> > +             value =3D readl(ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
> > +             value &=3D ~(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD |
> > +                        XGMAC_MAC_FSM_ACT_TIMER_TMR);
> > +             value |=3D FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_NTMRMD, ntm=
rmd) |
> > +                      FIELD_PREP(XGMAC_MAC_FSM_ACT_TIMER_TMR, csr_clk_=
mhz);
> > +             writel(value, ioaddr + XGMAC_MAC_FSM_ACT_TIMER);
> > +     }
> > +
> >       /* 5. Enable Data Path Parity Protection */
> >       value =3D readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
> >       /* already enabled by default, explicit enable it again */
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/e=
thernet/stmicro/stmmac/hwif.h
> > index 8ae95e91a36a..395655b01ea8 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > @@ -378,7 +378,8 @@ struct stmmac_ops {
> >                            bool srgmi_ral);
> >       /* Safety Features */
> >       int (*safety_feat_config)(void __iomem *ioaddr, unsigned int asp,
> > -                               struct stmmac_safety_feature_cfg *safet=
y_cfg);
> > +                               struct stmmac_safety_feature_cfg *safet=
y_cfg,
> > +                               unsigned int csr_clk_mhz);
> >       int (*safety_feat_irq_status)(struct net_device *ndev,
> >                       void __iomem *ioaddr, unsigned int asp,
> >                       struct stmmac_safety_stats *stats);
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 552840d29668..949ed3e5bb05 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3691,10 +3691,19 @@ static void stmmac_mtl_configuration(struct stm=
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
> > +             if (!csr_clk_mhz)
> > +                     netdev_warn(priv->dev,
> > +                                 "unable to get a valid CSR clock rate=
\n");
>
> I know it's the bot who asked for that, but I don't agree with this log h=
ere.
>
> FWIU it's legit to have ASP but no CSR clock (e.g. stmmac PCI)

Agreed, I'll drop the warning.

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
> > index 00be2df63d22..35c39cd6b630 100644
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
>
> I'd rather this comment to be with the register value definitions :)
>
> > +     u32 ntmrmd;
>
> I don't see any user for ntmrmd. If this is prep work for upcoming glue
> drivers, then this should come with the driver in question. If really
> needed, can't we just program a reasonable hardcoded default for the
> time being ?

Right, ntmrmd was indeed added for upcoming glue drivers and has no
in-tree user yet. I'll drop the field and just program a hardcoded default
for now.

What default would you prefer? The databook doesn't suggest a particular
value for NTMRMD. 1s (NTMRMD =3D 0x6) is my choice because FSM
transactions complete in microseconds, so 1s is comfortably above that
to avoid false timeouts, and it sits in the middle of the supported
range. I'm happy to use whatever you deem appropriate.

>
> Maxime

Thanks,
Zxyan
