Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B0733D4EC
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789313695; cv=none; b=eXeOah+xcIePY41dHxFEdM0X3BFjimRx8hJBfSlG5f3WvErYL6/7lxUgqyECiYSDsgWRozFWbUzP7nkoHcQK8mYwfprZJSdrd4ZYnB7zuBdUm38qf3W1/xQ5BB9/eYeiJqyOArVufxGnVv535sz5l1P7ZxQjPs18MPuCpvK1+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789313695; c=relaxed/simple;
	bh=uF85sYIhqfytUAQBIc5IwhHlftpSgH991C9lA79k7bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4U7WjsUp8RTAwTOZDW+GYY77b9EcggnPVEapV2SdWl4+aYzUDteckd02pnl1oQFVE/w2eKkbUHGSG/OVCDWLwPgUTqGPZjgZ9eJXfkv52RumukisrKzq537169/7CDdL02ht1yujECVoIOniFegOI1VsqHQPO9anL7S0H+WleY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mlrkr8zo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mlrkr8zo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24871F00893
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789313693;
	bh=c4qdfBJ6UveLbwa6/KJRUVQLf97e1x27O9rDy1pzdRY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Mlrkr8zo5dIwRxXI6nOXilS845cdd5Zo3KLn0XtWUYn4p/47RUOzgXWibisguofeC
	 FUuBtOcFzPwk44MwrXwNQM05B9qBqsKbsCKIdeMTRaVfj2DVAmhyTLpBW0IKnQbVnw
	 087KnYbDuBqPOnhQvYdI2zoJ33FW3chquPc7Gt/sxZDuJauWYisqWEJXx04xpCHHsK
	 JcDlgpriVwXL/Y17KcBUjRJIFQQuHceMGaYqAqWOuDnCO9Gm5AvSn6EvVbsRhboX2I
	 vxbLMPdbq8ZJH9nuU4UVfG171vUq4DHfO7Ge9nOnaw7Ag9W9Rck8cGb+gtw+IpWyrZ
	 l5oZ31wtTrgzA==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so12025521fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzcvX44dPQTfLBya7os3IKkjFoV0lFVsXFyViaXsC4g4A/yepHgcYh+0h/CdBDCqk0zA0RNcgtjgYnN8tI=@vger.kernel.org
X-Gm-Message-State: AFuF++lofvpA7P1DrY/xqCCJG0H9nd9g0UIhjrz+Pog7ENz6wRuGsI2c
	ChyzsxHPRSb+k53rPL9WJtrHTTdVJ73exDyGefvisDoleYilBiNpJKC7Jh7gGhAIjMYcMSHuNEl
	ukBmeONIPcQJPTxiS1uYcIkuSfMV8x90=
X-Received: by 2002:a05:651c:a147:b0:3a3:35fb:11e with SMTP id
 38308e7fff4ca-3a5a5064976mr35081661fa.7.1789313691317; Sun, 13 Sep 2026
 08:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721223956.13665-1-andre.przywara@arm.com>
 <CAGb2v64E29Tq3vSsVPM1qHgieyZHaNpfwWveYh9ss_Bg212N-A@mail.gmail.com> <20260910221349.19d86f1a@ryzen.lan>
In-Reply-To: <20260910221349.19d86f1a@ryzen.lan>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 13 Sep 2026 23:34:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v67TW_E7S9Mt1RyGJdw8NbV0D0PzM8Sw0Vhx9PzMe6CVwg@mail.gmail.com>
X-Gm-Features: AcwNN1VyMDzj0AftLULQr9ZHuu7pyYoxqSXKJ_6he6tuE7Sh0wYQwNYahEuc8jc
Message-ID: <CAGb2v67TW_E7S9Mt1RyGJdw8NbV0D0PzM8Sw0Vhx9PzMe6CVwg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 4:14=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Thu, 23 Jul 2026 01:26:38 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> Hi,
>
> > On Wed, Jul 22, 2026 at 6:43=E2=80=AFAM Andre Przywara <andre.przywara@=
arm.com> wrote:
> > >
> > > The Allwinner A523 uses the same GPIO voltage "withstand" programming
> > > (setting the input level voltage thresholds) as the previous SoCs, bu=
t
> > > for some odd reason inverts the encoding of 1.8V vs. 3.3V.
> > >
> > > Add a new bias voltage type to note this difference, and select it fo=
r
> > > the A523. At the same time also use the newer "CTL" version, which in
> > > addition allows to turn off the withstand programming for I/O voltage=
s
> > > other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used f=
or
> > > Ethernet PHYs). The A523 has that enable register, but didn't use it
> > > so far.
> > >
> > > This fixes eMMC and reportedly Ethernet operation on some A523 boards=
.
> > >
> > > Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner A=
523")
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >
> >
> > Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> > Tested-by: Chen-Yu Tsai <wens@kernel.org> # Fixes eMMC on Orange Pi 4A
>
> so what happens to this fix? Is it good to be merged? And who is going
> to take this? Linus? Or does it go through sunxi?

Linus needs to take this. It seems you didn't send it to him, nor the
linux-gpio mailing list?

Can you resend?

> Cheers,
> Andre
>
> > > ---
> > >  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
> > >  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
> > >  drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 6 ++++++
> > >  drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 ++
> > >  4 files changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/=
pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > > index dfdcfa740ecc9..cffc1e53eef14 100644
> > > --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > > @@ -26,7 +26,7 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL=
_MAX_BANKS] =3D
> > >  static struct sunxi_pinctrl_desc a523_r_pinctrl_data =3D {
> > >         .irq_banks =3D ARRAY_SIZE(a523_r_irq_bank_map),
> > >         .irq_bank_map =3D a523_r_irq_bank_map,
> > > -       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> > > +       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> > >         .pin_base =3D PL_BASE,
> > >  };
> > >
> > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pi=
nctrl/sunxi/pinctrl-sun55i-a523.c
> > > index 801f62abc93df..001bd42afa3ef 100644
> > > --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> > > @@ -26,7 +26,7 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_M=
AX_BANKS] =3D
> > >  static struct sunxi_pinctrl_desc a523_pinctrl_data =3D {
> > >         .irq_banks =3D ARRAY_SIZE(a523_irq_bank_map),
> > >         .irq_bank_map =3D a523_irq_bank_map,
> > > -       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> > > +       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> > >  };
> > >
> > >  static int a523_pinctrl_probe(struct platform_device *pdev)
> > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/=
sunxi/pinctrl-sunxi.c
> > > index cabcb8b6f38e5..634d9f1f23947 100644
> > > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > > @@ -718,6 +718,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct s=
unxi_pinctrl *pctl,
> > >  {
> > >         unsigned short bank;
> > >         unsigned long flags;
> > > +       bool inverted =3D false;
> > >         u32 val, reg;
> > >         int uV;
> > >
> > > @@ -757,6 +758,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct s=
unxi_pinctrl *pctl,
> > >                 writel(reg | val, pctl->membase +
> > >                        sunxi_grp_config_reg(pctl, pin));
> > >                 return 0;
> > > +       case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
> > > +               inverted =3D true;
> > > +               fallthrough;
> > >         case BIAS_VOLTAGE_PIO_POW_MODE_CTL:
> > >                 val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) :=
 0;
> > >
> > > @@ -771,6 +775,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct s=
unxi_pinctrl *pctl,
> > >                 fallthrough;
> > >         case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
> > >                 val =3D uV <=3D 1800000 ? 1 : 0;
> > > +               if (inverted)
> > > +                       val =3D !val;
> > >
> > >                 raw_spin_lock_irqsave(&pctl->lock, flags);
> > >                 reg =3D readl(pctl->membase + pctl->pow_mod_sel_offse=
t);
> > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/=
sunxi/pinctrl-sunxi.h
> > > index d0936a32123ba..2c8648c3301b6 100644
> > > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > > @@ -128,8 +128,10 @@ enum sunxi_desc_bias_voltage {
> > >          * Bias voltage is set through PIO_POW_MOD_SEL_REG
> > >          * and PIO_POW_MOD_CTL_REG register, as seen on
> > >          * A100 and D1 SoC, for example.
> > > +        * Some SoCs invert the encoding for 1.8V vs. 3.3V.
> > >          */
> > >         BIAS_VOLTAGE_PIO_POW_MODE_CTL,
> > > +       BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> > >  };
> > >
> > >  struct sunxi_desc_function {
> > > --
> > > 2.46.4
> > >
> >
>
