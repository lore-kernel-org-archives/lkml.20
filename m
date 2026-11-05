Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890182;
	b=Z7uWn+OpbFZecHXepxOwyWoGDfzpNt4iArk7DjLCZTuHxMiOmyidVBsG+BLWOqswetvm
	 0Mtw4Oy9XO4rmiyqKei+kshZbj8RmzV/Z6HL3g4i2RRnh6ceqqTf7yiuUykBI3sXYynj2
	 1Uta9h/C3IntsjpRLzrPKS3nbDtjxiCzrxxEam8hhSKJaJYlkrpS6hocnlvH3LdD9fjax
	 Ukh0brOM2vAS8lyZ105wSFeUpRVoIiXiwMBSfovMgf8qA+/KQaI5yqQaRpPUc05x9CGmf
	 9Nxyx6UO0Oj+WECo7AQOEGkqDSUGPBQVqx+VEHrWyvkuirELbyfTSQywie6E0kQAR2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890182;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QpwPqOLAugA67x75tYz1g7ohdoIGIFAO4TwGyxZEzGk=;
	b=X6IMpmJtMMKv+h5FtJScqB61fVo48eMVC64SsJBP57yxD3dJ3doZ/w0ScPVR+wWX1ukf
	 5cbJMBfIx88r73+rAFZ8bLd9HhNTn+ow4yp5TnmbIoSa/OV32uuPPGUzOWYLnGXV5/dio
	 LkNgwOZPLYBKZNQaXhCrtBiPYvwZUEXjK1p//S0uhk1UGLCD55mmNQibbWuWj8ll8GsJf
	 rrLaeygFNMMUvejICf+a4l0pQQoi/ODkBAp798KNpumY/LefaSrw99vBhesPZh0h/SfmZ
	 6v268c9SqoFqO/fEkokXY4DJ70bl6dSNmx3BttTIgok9Quyfn5UjGNdyd6jEIpO6tOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5018D606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5018D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eaa5e03c47so701925e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890181; x=1794494981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpwPqOLAugA67x75tYz1g7ohdoIGIFAO4TwGyxZEzGk=;
        b=oWDRtgAh9y41my0qYqtT/B0cdkiZ7DaBHzemLOXQVIWPQgSPgkZkPqTYLm0qK39usv
         gv6eiCjcll8IJ/mO0PoYh62Ttly3v1XeyjEP0ka4rrNT/ht/lUDJZebn13OGR7MSy8Al
         mq3E2OxV+VSgL46UFyVTUC76rL/wJuI3OEa/+uWMxxFKt8L0sU72Et4j1oOzGsKasCGy
         f1WqMuI/uGu+kRqG1dZLj4Lw3+V+8GrsoOHjMEUYzUcFsAZU+cnpx5bS1ijrprtJe+UA
         t8+3Nsp3CV5ZQNkU3B8BqEz9faDdaXLWPdUH8XqFVxVoa6SK8IRlOQ1POJnLRB2CRkDS
         bBmw==
X-Forwarded-Encrypted: i=1; AKwUvBzVbI/dyyInmFdFO2AB21uXImPlxh4NsqqmWgxSAp80DnUS4b3PwyOr2/oiLphnFQq9xlxg2Ept9n3srWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z++qqFaoGTFqxviVY5Wf5YAol3qHYkKi9yupouSUp4Ex4+3XJtn
	20k/+r+RiTLkws9tyqFXkxrxrka+DG59iIB9quTr8TTZyvYO/q34OYLr+MEAypLmnNg=
X-Gm-Gg: AYBFou0+4j49Nr0cXmnZ0XhvAPzL4xokeI6e2xj78n4FhuI9nKLI2A2V3V04DhbeT2n
	jLxwv8htFCGLg1jsN4FE8rmsMBwPVGgb2J7AjtyK8EPZiEAcyZKUA0fcRxBAqem2+t6O2o3KCmM
	FACHUcvmTewRF4I7fx57PP6I0sNlo4uMKOvA1Es4gqE/hghQ8H+NXo/R2VCWfz/H/X4ooXgprLp
	zHXtKrNLAiShmepcJoe7WRt7IKWPb5r2rlmQtQKBm3omXpMnPMmYoU4fS8cH4OUGT1ZIB4r7jNt
	9szXmkHlTxIA2i801nawfXmEaB2kUmlYO/a1rJ+6N3XBqR9U2/rwofoYD8benqTVaosIlHiTluH
	df38rOBuyHXj30pZcbcr4enp+3VgZT0rXaFR/b7DZIA0JiXJVxawcif8JxyCru3Y5WmEs7mv7gd
	Y7Agp4NE8rQPwglaT/MsFei3Yb0yEhmNNN1xaTLbzuS33CaPfkddvAQLwSgJrgMXMoKiFai7gzX
	WGTYgIAmlpsbAsj+v78uPAm+9WWNzIve3CZmAQdDJzsUj1NDO8aCjgl9dGSUNwlZM1Z+SCIfPTn
	vjOQrmMaqYW7EecKRKq0QzWSEYVshnnn5g0B8CMYfq/AKJr4Gqk2r0QhfYX70hlvT30GzFtRZ0V
	BbNzfoWOiHYU=
X-Received: by 2002:a05:6102:2c81:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d286744eddmr1849622137.3.1793890181034;
        Thu, 05 Nov 2026 06:49:41 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8df2a38sm4212614e0c.16.2026.11.05.06.49.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 06:49:40 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7c33cc572e6so580905137.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:49:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz+NGXQfArZdZhMCEDiKi07S3/dpmgM/8nR3rTxvyDJzhb93/2ZLULzLcs6N1zQF/Qt7FW74o8UYnbVzWE=@vger.kernel.org
X-Received: by 2002:a05:6102:3590:b0:7cb:91a5:7cb1 with SMTP id
 ada2fe7eead31-7d286b9063fmr1558321137.39.1793890179880; Thu, 05 Nov 2026
 06:49:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com> <CA+V-a8tbWcODg8E1qDwXU63ohfSgdeMm6GuEkrg=vyrNLQpbgQ@mail.gmail.com>
In-Reply-To: <CA+V-a8tbWcODg8E1qDwXU63ohfSgdeMm6GuEkrg=vyrNLQpbgQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 15:49:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1j6G+Kd80-6s5PEVkOfG_tS2U8p47929G9kHvD1S-eQ@mail.gmail.com>
X-Gm-Features: AclHuK8-DY11fAp-Ju55qxGdxFOla992yKCcExdnlJgG4bXumg-5poK1WA750QA
Message-ID: <CAMuHMdX1j6G+Kd80-6s5PEVkOfG_tS2U8p47929G9kHvD1S-eQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, 5 Nov 2026 at 15:03, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Wed, Nov 4, 2026 at 4:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add clocks and reset entries for the ADC controller.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > Similar comments as for "[PATCH 1/2] clk: renesas: r9a09g057: Add ADC
> > clocks and reset".
> >
> Ok, I will apply the same fixes here.
>
> > > --- a/drivers/clk/renesas/r9a09g056-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g056-cpg.c
> >
> > > @@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_=
clks[] __initconst =3D {
> > >                                                 BUS_MSTOP(3, BIT(4)))=
,
> > >         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV2,=
 15, 2, 7, 18,
> > >                                                 BUS_MSTOP(3, BIT(4)))=
,
> > > +       DEF_MOD("adc_0_pclk",                   CLK_PLLCM33_ADC_PCLK_=
DIV2, 16, 7, 8, 7,
> > > +                                               BUS_MSTOP(3, BIT(9)))=
,
> > > +       DEF_MOD("adc_0_adclk",                  CLK_PLLCM33_ADC_ADCLK=
_GEAR, 16, 8, 8, 8,
> > > +                                               BUS_MSTOP(3, BIT(9)))=
,
> Shall I also rename this adc_0 to adc_?

OK, let's match the docs.

>
> > >         DEF_MOD("tsu_0_pclk",                   CLK_QEXTAL, 16, 9, 8,=
 9,
> > >                                                 BUS_MSTOP(5, BIT(2)))=
,
> > >         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8=
, 10,
> > > @@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_resets[=
] __initconst =3D {
> > >         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
> > >         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
> > >         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> > > +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
> ADC_0/1/2_ADRST_N?
>
> > >         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
> > >         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> > >  };
> >
> > The lists of clock and reset signals (tables 4.4-2 and 4.4-3) claim
> > there are 3 sets of clocks and resets, one for each ADC instance,
> > but this does not seem to be reflected in the register bits?
> >
> The clock tree in r01uh1072ej0130-rzv2n (additional document).pdf
> shows single clock is shared by all the three instances.

I take your word on that (I only have the additional doc for RZ/V2H).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
