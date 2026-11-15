Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728832;
	b=KBNrOs3bGnyu8eQ0UeHUHzCbsjf4neUp6QY6/9BYdipz54iDCO25kY7GlFL5hhIvh6Bw
	 qLNBHLcxd2NO8P9fuT2fYEjnUGPLCKDlgApwE8FfWaqKW3se0K3KD7fkdtsmOS2jY7P2i
	 nO4Fco8+x6DAZDMzI25U0VTgLLxTjv052GZFYKX65efvXybGBqXxP1daJlrcJIHri1YQk
	 Fib+aBbrwwW4eNX1p5IDRUSJpsmcbd2q+BSghC25eolK2wjIdRmwKpUsKyaGJT9/3Yk3U
	 6/5RT7ztWLjI+quGFPsDDdIYnQqgY65iPFHRZMu7Pu3IoWIRJgo3O96bIKktTmxz7eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728832;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QaisxT3Fa6hlWE5Ty6mdpOvqQQNuxHko9RuFnaPX8Uo=;
	b=Xx0Uk3H7YSuIfIwE4XiTNjjB29TPGt5mthFSaSUuEoeUA09cuTk6rzpdi0yypCI8IyIc
	 jGn/mgcOkocE+FeJyd+0ByrJAAgbGNHunj5f1W1KiJcscvb4ie5wybE2rUwG/Wd/9VfKF
	 wOwgTFtyjkebXMto/WoxOb/RDe+9RGSxXBTYW0S5YACqL6wQJsIvIU/8MFb8IY9lMWkpg
	 PVjeMejV99jamcra3Sf+hR4AOBDUBLw8ZRwZiZheIuIyqfCgkmRSILdIIE4i902S9Q3dq
	 vooGaXf6++G78Q/xT1g5mPVtYSYpyWv3V+lgCTpR0kW9ZsGVeaCnvvPbhLSXtZj7Trg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YxRcPY1r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAD3606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YxRcPY1r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53C21F000C4
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794728832;
	bh=QaisxT3Fa6hlWE5Ty6mdpOvqQQNuxHko9RuFnaPX8Uo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=YxRcPY1rW49gUfNAfsKTB7Smi931kj4k6CMZR9FdhEcYnTWoIdHqHQkqyo9FR5ggN
	 YtuYGe/GE/iN+HAKtoscrzMj4s4bRq1i1kyV5VQNneO9yuPYW4T47UhXj7hPgGYDaq
	 Z4Z5BhwEkwWPigcem8SLjMVZp/98qvAd8MEEsLLSOaQzVqr/V3S0qsj7L/1o18HPV5
	 XQCGCVqNq5kqdcyy3IySeIRyD9O5/ePgCPFDMi7qfRhk64g+mMSfOmqNkHYUclTEVs
	 ZF66ztw/L3Oiwk2/qAd6ZANfQxieVAdVy16Q1KXL6VLRDVXF+/h6rKoKh94yd8AeST
	 9mM1AHhC0R1zw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso35988461fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:47:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHVjJLKzQHQHxHS4YgPanAq56TfjTx5snk0qQefcMzFIUIYZ5w5jwQxc8FvJ2UZCp6SoQWGRXBdSWJchxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TFfSnn9nt/gSLyQhRSlpqbMXBsnK+11fKycy3Xt54BZAaNE4v
	0C+I8rKlK35rs2Kot1V9l6+FCmgFnxjXAJFIu6oBRFWYIS2Ijq69J+7UU5xMO/nQsdvkpT7G9wu
	xxJ8/bbAKHH35Qffy8TiUE8I5qN/kY4o=
X-Received: by 2002:a05:651c:e18:b0:3ab:185f:575d with SMTP id
 38308e7fff4ca-3ae2b4bada8mr16065201fa.4.1794728829847; Sat, 14 Nov 2026
 23:47:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me> <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
In-Reply-To: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 15:46:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v66t+PuaBsANs4wEuH8rGs9zyT7GpviSkoRE3jdPKE_GFw@mail.gmail.com>
X-Gm-Features: AclHuK8xqthT2mk78Qu4LiOErq4MI1hrWtnj6E-DaIslpwgy2sOPNhpmEiJiSYo
Message-ID: <CAGb2v66t+PuaBsANs4wEuH8rGs9zyT7GpviSkoRE3jdPKE_GFw@mail.gmail.com>
Subject: Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
To: gaohan@iscas.ac.cn
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:32=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne nedelja, 15. november 2026 ob 06:11:31 Srednjeevropski standardni =C4=
=8Das je Icenowy Zheng napisal(a):
> > =E5=9C=A8 2026-11-14=E5=85=AD=E7=9A=84 06:33 +0800=EF=BC=8CHan Gao via =
B4 Relay=E5=86=99=E9=81=93=EF=BC=9A
> > > From: Han Gao <gaohan@iscas.ac.cn>
> > >
> > > Add myself as maintainer for the V861 bindings, clock and pin control
> > > drivers and device trees.
> >
> > I think traditionally sunxi do not add maintainers for specific SoCs.
> >
> > Maybe you should patch the regexp of "ARM/Allwinner sunXi SoC support"
> > item instead.
>
> Usually no entries are added at all.

If you do want to help out and review, please add yourself as the
reviewer instead (since you aren't the one taking the patches).

ChenYu

> >
> > Thanks,
> > Icenowy
> >
> > >
> > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > > ---
> > >  MAINTAINERS | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 93abbb315065..dfc300dc1eb2 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -24031,6 +24031,18 @@ F: drivers/irqchip/irq-riscv-intc.c
> > >  F: include/linux/irqchip/riscv-aplic.h
> > >  F: include/linux/irqchip/riscv-imsic.h
> > >
> > > +RISC-V ALLWINNER V861 SoC SUPPORT
> > > +M: Han Gao <gaohan@iscas.ac.cn>
> > > +L: linux-riscv@lists.infradead.org
> > > +L: linux-sunxi@lists.linux.dev
> > > +S: Maintained
> > > +F: Documentation/devicetree/bindings/clock/allwinner,sun252i-
> > > v861-ccu.yaml
> > > +F: arch/riscv/boot/dts/allwinner/sun252i-v861*
> > > +F: drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> > > +F: drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> > > +F: include/dt-bindings/clock/sun252i-v861*.h
> > > +F: include/dt-bindings/reset/sun252i-v861*.h
> > > +
> > >  RISC-V ANDES SoC Support
> > >  M: Ben Zong-You Xie <ben717@andestech.com>
> > >  S: Maintained
> >
> >
>
>
>
>
>
