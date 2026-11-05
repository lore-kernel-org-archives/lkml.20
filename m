Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868401;
	b=mf3wzHV8AqCA+k7cNNIjrwn5DqdyD/yM4qp5/GdPGTLJ8IaeM/REofjJkHNO6zfYbnKB
	 jFwe40Zx0rW7pgaEIpzMeQzCGREt6WqSuDx9Q0OL5p1sTcG748r+ZEFliiAvh8Mp22vSy
	 dji+4tzQmU1e4Tq7g/jGdO2dVCNwblmro1tP8zeztaqyeFUZLwxkX19Dz/KFV6tWy0uuO
	 xneTF/hdAvvgW64mE+INU5QWo8VUCTkKEhBi03yP6HI2vUc7+KBZn4rKtjNPenEumPRig
	 p4qVUghCof9DfTn3HvFCHuctLFZ5aZVhd7Yhv6z7UFY/06sMXk6hpScEg/05JrYLmQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868401;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/dEMCZlIPKSp6FJQ3llvVNF8Yw2vzkM3XYknJS08GWI=;
	b=PdpvCQzo7xDllXYTaOzrcioP6jBveLaMNk4NcIUHLD11fFXe4ekLx6+5dkc5p/aDhzR0
	 Xkj3GTFQ2SOhix/CvRbwQxPZyz6GyvRlPYNEUB4WbKmxoF54gCP7sQ/2/4cB9zmu5/+1j
	 8BKBDYMboCqZ8Ne0breR41VtwKOgIJT+HGDuJB2NSZ++1GFYffwDta4P2vgTI7LW2wAEX
	 Ao2ACREPBO+JgZthV1PKWOzc78JwuRgGiDs5v4Ge63jS9vkGu7n/qFA1BrBF/9J8cDE4u
	 kKnuNsyinRsyGBTIn3H+ZhbvE42ry1xD3r3wEaLgZJ4YKwjY2ZdOhgjrom41QTnGfsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1ZMAeBQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A435B606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1ZMAeBQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827431F00A1B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868401;
	bh=/dEMCZlIPKSp6FJQ3llvVNF8Yw2vzkM3XYknJS08GWI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D1ZMAeBQg6kCKHbuLmKMILx1ALCaS8Y0+Zqv0lRRgMedLGAqlsZG4uMez8fFtNAiU
	 /9iZK3348TAcStbdMMj1Ha4SogTv7sAy/TwkXNmql/LXQnCO2u/Ek83dq2QJ1uxHPp
	 ZNqM+jjFbnWdJSPFseY3diiIKuduVtFL3hLqr6tfc+5FAIE7yN98EP5SwFiuiU2M5C
	 qlU1+awYIYsBjDa3qpAIpH2kn/c0b+grnMmEnFrxfnC54FsN8lUy9XSfFe8EE/w0/O
	 epZ2aGNmdGBgQVlox4t1PiX0DOxfXhIZpb9sRP7vE+kEY3yzX7P5YKrga9+ReXyTgn
	 nMWxOLx1lZ3hA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bff8fc7cf2so757056e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:46:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBymmtRmW9qx+jQ6TRbvfkNr0iswCypgHM4gK9MQoe1MdjTrIJOiaD4iD+7jT4txQDDAtOZu514OWpMPcZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W2MAA8DdcGIyilJ8Z0RjBxvl4t67P02dl38LrYp5WSRtV3MN7
	CAIkrAd9otYbtIFmsRci516vuY/pGkoB0nT6l8dzOtL+nZ7DcZt0RP98I+xs0n/V7H2lH3xWY9H
	uYcEIsZ9/KB7akiQLtS/BYh8do1HVeNM=
X-Received: by 2002:a05:6512:6082:b0:5bf:fd1e:1677 with SMTP id
 2adb3069b0e04-5bffd1e17d2mr318092e87.63.1793868400125; Thu, 05 Nov 2026
 00:46:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-0-0a61a9837744@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-4-0a61a9837744@free.fr>
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-4-0a61a9837744@free.fr>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:46:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLkFN_pm8qUzgr9jXJwgZaytERwF0eLGiJwGfsqR_2ySQQ@mail.gmail.com>
X-Gm-Features: AclHuK8ETflp150o6Y4D_MC0oBw9nE3K4Lvwb5z2qXB53rv4YdppYnKd_3n9_hE
Message-ID: <CAD++jLkFN_pm8qUzgr9jXJwgZaytERwF0eLGiJwGfsqR_2ySQQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux driver
To: vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:52=E2=80=AFAM Vincent Jardin via B4 Relay
<devnull+vjardin.free.fr@kernel.org> wrote:

> From: Vincent Jardin <vjardin@free.fr>
>
> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
> fields of the RCW, read-only in RCWSR12..14 of DCFG and changed at
> runtime through the same fields of the override registers in its DCSR
> view, which read 0 until written.
>
> Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
> gpio to support bus recovery") Linux drives them with pinctrl-single on
> the override registers, so its first pin state clears every other field
> of the word: a board whose RCW programs a non-zero pad mux loses those
> pads at the first I2C probe.
>
> Add a driver for the pad mux as a child of the DCFG node: the fields
> of RCWSR12..14 and their encoding.
> Then pin states select them with the generic function and groups
> properties, and every change goes through the RCW override
> of fsl-guts, which reads the status register, writes the override and
> waits for the status register to follow.
>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Does this have compile-time dependencies on the other patches or
can it be applied separately to the pinctrl tree once the
maintainers are happy?

Yours,
Linus Walleij
