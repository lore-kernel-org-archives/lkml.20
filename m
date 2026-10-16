Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDAE4657CD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141684; cv=none; b=TDPLSwfY3VNm48D742MusitotDhRVSFdcegZFto4/7YDQGVQyggrpq643GGtakHesKSbwC6VPOPxJZqzy60UTHKP8Tufi7jflgkeM6JTfPSNHj93mDzoo+Ane45ACi283C1lgF5y7qZ1CaZ8V4KMuU/9o9I5bWqm5brBYCj9mUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141684; c=relaxed/simple;
	bh=v6VhmAqiuQLUgRnQxS36m60xQRI7RTl+HbKGrHmYVX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSRq4i4vML+FRVSwot+Bpzpg+v8/PddtALEOQroLWzqwNUuGe/715g52PhZnW99dQQHlHy9fxkyFvjrGPk/V3VhqNUvku6nlxfc3TOIyiJ0wJYYl0O4O2xS9J2JWdhKgUdIQVRzBUe0EGXaGuIA7oZcspOsE/moWOZImjrWKdro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qz8DpAU/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qz8DpAU/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02A71F000C8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141681;
	bh=/C6fWWUSV15Z2XahiLhodLd1FusftW6HVqjIbYlKS54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qz8DpAU/W8clG9FDfnfdKXyOO7YyHNVMQ3oA8muzF6m69TBQ6/0uIrxNCw6cRaBSF
	 5d0O6jgsiscK1BO+ISB1y4hRfpV/caLpzSC62+jPk7+7FQxkWathiZ2UPKIeaf6XzT
	 i+y1/ccj+GUUkK3nqS5HApsjvCadW2f8wpKuV35mgfFOPBHDA9ss+u4nkxvq6oTdHT
	 n0UO/PlUPZhGZa+I8hvvGW6gOaX1ijyhm8prAJBQDCMtx58tZg6IDsWKgcjWnHGBBr
	 A/OmrIEb9QpjmqBjcOu2WwJudIHPlORTeu+ESYYYEmWdDyowntpwV7epI0SiM4x+7D
	 T/NFZL+4rDuQQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1387591e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:08:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzRMHwEGEjQDU2eSiJPLgJl81YIF1s4u5VxmEDkndtzKiMG9yjpyYVzgg4PefB2p0PjeOBWsY4q1QBcafM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIv+aI4EH/m6j7Wzm66PG4Hh9cYce2g2VXgKFe3ca7G2gbBDCbn
	TSJdB1Mrt6RQzTn8i84vJwj0OfS2gZgCr9ucJzK41IzAOoNFmOW/rbI+IubbRPslNBkt2zYOqDj
	8jANTHurcrijNJOiXdpDzjwIjBzep2Ew=
X-Received: by 2002:a05:6512:1054:b0:5bc:b4d0:df9b with SMTP id
 2adb3069b0e04-5bcde6c97a4mr8515990e87.25.1792141680365; Fri, 16 Oct 2026
 02:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-10-ghahramani.navid@gmail.com> <aV_PM_GzRW6aLmK6NF7ttw@gmail.com>
In-Reply-To: <aV_PM_GzRW6aLmK6NF7ttw@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 11:07:48 +0200
X-Gmail-Original-Message-ID: <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
X-Gm-Features: AclHuK_5noOpKkEBY1kNxBuxnUvrwxeiNqLeHpNvpG3o-TRMB7o13R_Nlzy6JOs
Message-ID: <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Navid Ghahremani <ghahramani.navid@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arnd@arndb.de, linux@armlinux.org.uk, 
	robh@kernel.org, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:13=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:
> Am Samstag, 10. Oktober 2026, 14:59:47 Mitteleurop=C3=A4ische Sommerzeit =
schrieben
> Sie:
> > +/*
> > + * Each bank has 16 lines, one bit per line in each register. The regi=
sters
> > + * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not
> > supported + * yet.
> > + */
> > +#define ZX279128S_GPIO_DIR   0x00    /* 1: output */
> > +#define ZX279128S_GPIO_DATA  0x14    /* line level */
> > +#define ZX279128S_GPIO_SET   0x18    /* write 1: drive high */
> > +#define ZX279128S_GPIO_CLEAR 0x1c    /* write 1: drive low */
>
> This looks identical to mine, which itself matches the old zx29 GPIO driv=
er
> with IRQ support etc that was removed in 89d4f98ae90d ("ARM: remove zte  =
zx
> platform"). This old driver had support for IRQs.
>
> My hardware has the same register layout, but no IRQ support (related
> registers are always 0). So I wasn't planning on reviving the old driver =
and
> just using regmap-gpio like you do here. If your hardware has indeed work=
ing
> GPIO IRQs it would make sense to revive the old driver.

It does sounds a bit like churn if we remove a driver from the kernel
and then add it back after some years...

However if this is using GENERIC_GPIO (regmap is something else)
this is a better base.

I think it's easy for an LLM to port over the IRQ support from the
old driver to this new one, given the code is already there and
this way keep the best of both worlds?

> My hardware has one annoyance: There is one GPIO line (not one block of 1=
6,
> just one single line) that has an inverted direction bit - and this line =
is
> necessary to run the routers on battery. I don't yet know what the nicest=
 way
> to deal with this is. If we have a good reason to have our own zx gpio dr=
iver
> then life would be easier :-)

I don't believe that the hardware block inside the SoC actually
has a single inverted direction bit. Prove it :D

This sounds much more like someone using open drain to drive
the line high when setting it to input mode and has hacked
their way around that behaviour instead of just asking the
GPIOlib core to do the right thing:

gpios =3D <&gpio 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;

Yours,
Linus Walleij
