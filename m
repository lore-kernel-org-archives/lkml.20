Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7E1496D59;
	Thu, 10 Sep 2026 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071252; cv=none; b=o2GUc6+QpbzvT0HkSQsAim95M7wU/Q9NGLLZHdiadWFyKtIaWSKqzUBtZ3oIZWQxDOp6rGXggtEl1gRL23MFlsRfUeY0WNkzoLVaC9VH1UrhOcTJ7486DY4axzjh46DOnDQlP147EOoIc23y8outZaFXjUarEFIOESHd2mqG2Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071252; c=relaxed/simple;
	bh=gfXhe7PvSLgUM9JlQ2R7pV874oO92+8H9AqxCKCruk8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qw7CvHbF2HNOQc0pQtsP2Q3Gj3UjiVNK1YWRj2QjLcATamBkBket8mh1tQZxvrVReRN5uxuq/dM1xNN5FGOE1JNXbvzTgDAmgvniktwu6ChcYGWeReWTWlMrjYHM+Fu/840SZvfUPZOo1tc6MH4pqvOVfMOetonto255QLRB8EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MkugrDu3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MkugrDu3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 432C4237B;
	Thu, 10 Sep 2026 13:14:03 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C0863F7B4;
	Thu, 10 Sep 2026 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789071246; bh=gfXhe7PvSLgUM9JlQ2R7pV874oO92+8H9AqxCKCruk8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MkugrDu3RzksLLH5p7+S9kX0xUdGuKYdCUm8XrKKuBDQtULluoXboTuCwe6RO/6T2
	 utkWNgoCeYz/cV7lI1ji+MfLq1bqC2MM9ZpF6Ey1f5/++vRqUqCqjLnWsUyHK9MndU
	 K6Rt9K48HNFHYc1pTCAR9G4ASSbJWHvrXjTR46AE=
Date: Thu, 10 Sep 2026 22:13:49 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Message-ID: <20260910221349.19d86f1a@ryzen.lan>
In-Reply-To: <CAGb2v64E29Tq3vSsVPM1qHgieyZHaNpfwWveYh9ss_Bg212N-A@mail.gmail.com>
References: <20260721223956.13665-1-andre.przywara@arm.com>
	<CAGb2v64E29Tq3vSsVPM1qHgieyZHaNpfwWveYh9ss_Bg212N-A@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jul 2026 01:26:38 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> On Wed, Jul 22, 2026 at 6:43=E2=80=AFAM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > The Allwinner A523 uses the same GPIO voltage "withstand" programming
> > (setting the input level voltage thresholds) as the previous SoCs, but
> > for some odd reason inverts the encoding of 1.8V vs. 3.3V.
> >
> > Add a new bias voltage type to note this difference, and select it for
> > the A523. At the same time also use the newer "CTL" version, which in
> > addition allows to turn off the withstand programming for I/O voltages
> > other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used for
> > Ethernet PHYs). The A523 has that enable register, but didn't use it
> > so far.
> >
> > This fixes eMMC and reportedly Ethernet operation on some A523 boards.
> >
> > Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner A52=
3")
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>=20
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Tested-by: Chen-Yu Tsai <wens@kernel.org> # Fixes eMMC on Orange Pi 4A

so what happens to this fix? Is it good to be merged? And who is going
to take this? Linus? Or does it go through sunxi?

Cheers,
Andre

> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
> >  drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 6 ++++++
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 ++
> >  4 files changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pi=
nctrl/sunxi/pinctrl-sun55i-a523-r.c
> > index dfdcfa740ecc9..cffc1e53eef14 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
> > @@ -26,7 +26,7 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_M=
AX_BANKS] =3D
> >  static struct sunxi_pinctrl_desc a523_r_pinctrl_data =3D {
> >         .irq_banks =3D ARRAY_SIZE(a523_r_irq_bank_map),
> >         .irq_bank_map =3D a523_r_irq_bank_map,
> > -       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> > +       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> >         .pin_base =3D PL_BASE,
> >  };
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinc=
trl/sunxi/pinctrl-sun55i-a523.c
> > index 801f62abc93df..001bd42afa3ef 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
> > @@ -26,7 +26,7 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX=
_BANKS] =3D
> >  static struct sunxi_pinctrl_desc a523_pinctrl_data =3D {
> >         .irq_banks =3D ARRAY_SIZE(a523_irq_bank_map),
> >         .irq_bank_map =3D a523_irq_bank_map,
> > -       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> > +       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> >  };
> >
> >  static int a523_pinctrl_probe(struct platform_device *pdev)
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index cabcb8b6f38e5..634d9f1f23947 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -718,6 +718,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sun=
xi_pinctrl *pctl,
> >  {
> >         unsigned short bank;
> >         unsigned long flags;
> > +       bool inverted =3D false;
> >         u32 val, reg;
> >         int uV;
> >
> > @@ -757,6 +758,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sun=
xi_pinctrl *pctl,
> >                 writel(reg | val, pctl->membase +
> >                        sunxi_grp_config_reg(pctl, pin));
> >                 return 0;
> > +       case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
> > +               inverted =3D true;
> > +               fallthrough;
> >         case BIAS_VOLTAGE_PIO_POW_MODE_CTL:
> >                 val =3D uV > 1800000 && uV <=3D 2500000 ? BIT(bank) : 0;
> >
> > @@ -771,6 +775,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sun=
xi_pinctrl *pctl,
> >                 fallthrough;
> >         case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
> >                 val =3D uV <=3D 1800000 ? 1 : 0;
> > +               if (inverted)
> > +                       val =3D !val;
> >
> >                 raw_spin_lock_irqsave(&pctl->lock, flags);
> >                 reg =3D readl(pctl->membase + pctl->pow_mod_sel_offset);
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.h
> > index d0936a32123ba..2c8648c3301b6 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -128,8 +128,10 @@ enum sunxi_desc_bias_voltage {
> >          * Bias voltage is set through PIO_POW_MOD_SEL_REG
> >          * and PIO_POW_MOD_CTL_REG register, as seen on
> >          * A100 and D1 SoC, for example.
> > +        * Some SoCs invert the encoding for 1.8V vs. 3.3V.
> >          */
> >         BIAS_VOLTAGE_PIO_POW_MODE_CTL,
> > +       BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
> >  };
> >
> >  struct sunxi_desc_function {
> > --
> > 2.46.4
> >
>=20

