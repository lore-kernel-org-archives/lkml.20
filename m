Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870651;
	b=ZVnO1zr2ZgIzyAmLWDBNwSfCDUvbFgCc/AOAtRioBfrcZ4amsNePXf/iXveedwF1/M4H
	 qfRZVjGEQ9E+wPo3A+kb4G5e5DBls6en4NQ2HX3R1Ykhq4i+VwCR6+A+/VNZyy4Cfjq8h
	 e+uysjtmGUzdy+fKT7oWH2SJFNWq8NsDOS/6V2AswzZczosAkTYuSFJWv92gohJUfs7MH
	 MzwoLZQuMUQA1gt8c01uvVBKdyWjAf0dfTLymk0kz4hMqI0OYDH58/ppxGjirJ9gUBEsS
	 u+j3OG5S2yD5uYffAF0E6ENaImTS4dB9JflM5T3v6/5YtIdE/89etSDUNbNsKkT/oZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870651;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=pdLSFARJtZZaOSy89wvFfnir+tkCHpND5r/hzAKJUn0=;
	b=B1Xx/zF8CvO1CvQL83jp4y/Fy3qzBEp0i52ZnXtLEcIlj9hEx+xCvO/mpeWs8zyCImVT
	 UMYmZuABOr/xltbNct0E9eFi4LZl/nSRQppjiV2WN67znddBXHVKoK5tvQ9WaGpUrQjEB
	 mwFcr3l6ojYl3BYYkacbxUjD/4zJHq+m3gcHptx+G6Q0nEegFOzNwYyWXp89PvC+Xv0mI
	 YvZ0kcqvxCNu4ezsnxKF4JZNOgBfSRe8kLb2rZGo/MDb2eKSqieqc17/81rXebaxs8LYT
	 OzgBoey3IWpgZ4jac5LSELAJc0SgiO2B63luqW3/809BYh3GSDMsgJpU0MH45tRE6dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABD0606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ABD0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso889045a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870651; x=1794475451;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pdLSFARJtZZaOSy89wvFfnir+tkCHpND5r/hzAKJUn0=;
        b=JBa7ugWwLksPmMz6rmBsiXSDJLsqzE+rZc9yv5xR7in73WD/mbV++DsATYzZpwEmhY
         eAGPFtMMMo3MZ4cU53/YeU54UlNfaoYpGhZGaijshR2JAIoIO+50AEXaCG8/IfGH46Na
         K1E84G+QNjcNPfjXNaYta9MS3ZgDy62jgtZ97XyfhMDhgJ0SF1UFNXUTvU6FDLzJ/xEA
         s2DWvXFRjB9439WKxXRFC1wmdcleLoyoNNB8mTBRFASiLNv6DLBlaHEeLwyPw8Jeg4g2
         WgY+9ZEmhyR0WwND5ZDVdv00Fz8LGGIvI88I02da+Cu3Jyv2nERegNGf04KHC3Td4/K5
         1wtw==
X-Forwarded-Encrypted: i=1; AKwUvBzq1tzV37KA/zskn9UjK7ZfaKVobRc6vSiphEHLVm2fRCvGwHd4LbshE19J+nFge++0PngDjiZEAjDk0EY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+V7rYJVIffRkTUZyfqrLwPlpOHOx1wigdrDfpI814W4PtBCX1u
	yhCdki9PAGuxBizowhYrIzgx0SFlWpJjsp//R1KIvvLKcSeSvEbman/ln/1p6PSu2Os=
X-Gm-Gg: AYBFou0puoskcmDQJB1UipzqCYP4D69v1KuRELn4myU6R0Nz4kEgIHSEhifSd78Jv0+
	kQNWSP0xF7a+lpXswUB7I95ZFIGvwH1lwG45YIGS+O6cPnSVDDMCJugY7fW57bOgOLU5ZJIfvnm
	FV8X8k3y3gnr8mtWW4g9EW8HXbvpDIrvDdiPdhilrT3LTjUrBRxnwdcIhMzisweTN2Zx8lfJWqa
	Bi9piql1AwClL2DyN+cpKnUpdOYkEEZCIrzGhLBtA2kOHTAPPId00OSWowpOTd+g2z4fMiHcoUg
	ufPWUjJTPwVVQabrM8bgI92QvNQj/wrBO90jMOuFqQG2YbMJoBGFM1TcNQkkzbCN+H39Pxe3GPx
	ygrPl8tnA3kUs/D5BmGawmQ9XINWSsXtwEgegiwg2GdpcXEXcIvAPUKNKVJxnauiKeV7lANRQ6Y
	48apuqAVjbidJGapPaHes5pOsPgnwqiReFo+MQNC14994jbwrRraJxhW2LcQP4gtlHo3Dq8cbJW
	DwBo5n/+iPtzwuOAzkbAhaDFjnngChtalpz0ulAopQlKSiSk1JcEFyzolssG3g4g2QT7HKe5F2G
	cm8HUh6IVshD8ayL+RgCzm7pBI44uCv0Mngk01e+saR8tXbWn0PVAfD6Fl0nFCTu
X-Received: by 2002:a17:90b:3d4b:b0:3ad:eb4c:26fb with SMTP id 98e67ed59e1d1-3ae897c87acmr16215843a91.23.1793870650555;
        Thu, 05 Nov 2026 01:24:10 -0800 (PST)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com. [74.125.82.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0969b35c7sm3572859a91.3.2026.11.05.01.24.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:24:09 -0800 (PST)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a2af4c8d00so289651c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:24:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBypyxJy3SnZe6noVXVsWIr8UOzoQeh/uSSJ5cBo06MqwCQmjPwK9khUTmSfq4meUz5W9gvpFFtdN/laPrk=@vger.kernel.org
X-Received: by 2002:a05:6102:3711:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d072695e4emr7033715137.14.1793870187629; Thu, 05 Nov 2026
 01:16:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <b656861c-a087-4087-952e-91fd15fadd52@kernel.org> <auuZHTvr5UI9Q9Q4@ashevche-desk.local>
 <fbcb650d-0f60-468d-b1cc-255ea8a93db3@kernel.org> <auxF9RT5aljXkfh7@ashevche-desk.local>
 <auxGdYgJvjq9EBu6@ashevche-desk.local>
In-Reply-To: <auxGdYgJvjq9EBu6@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:16:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkzXMsv_4KHP20qidmH1B4Ew3=VuTJ8jqfqvx4_+pm4Q@mail.gmail.com>
X-Gm-Features: AclHuK9751j09IKd6_4EIkqyFvn0FA5bsvqOYkEgIDax6KzLeXviQYPveqzIsxk
Message-ID: <CAMuHMdUkzXMsv_4KHP20qidmH1B4Ew3=VuTJ8jqfqvx4_+pm4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Konstantin Ryabitsev <mricon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 10:04, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Nov 05, 2026 at 11:01:55AM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 05, 2026 at 12:02:21AM +0100, Krzysztof Kozlowski wrote:
> > > On 04/11/2026 21:44, Andy Shevchenko wrote:
> > > >> Andy,
> > > >> These three lines look correct.
> > > >>
> > > >> LGTM:
> > > >>
> > > >> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > >
> > > > As
> > > >
> > > >   Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # atmel-quadspi
> > > >
> > > > Note, it's in your power to ask the author to split out what you maintain
> > > > to a separate change. So, it's your choice what to do, Ack the full patch,
> > > > give a partial Rb, ask for a split, ignore reviewing (often means silent
> > > > agreement when maintainer just applies that kind of a patch)
> > >
> > > The "# note" after the tag solves the problem partially, if people were
> > > actually using it. Solves people looking at the Git commit and being
> > > mislead by partial review applying to entire commit. Does not solve
> > > credits, because Rb for three lines is not the same as for 100.
> > >
> > > From v1 of this patch, four people (Alain, Lab, Troy, Kunihiko) did not
> > > use it even though reviewing only part. Only Wolfram, so 20% of partial
> > > reviews, used that syntax. Without that syntax, b4 will pick up Rb tag
> > > like it was for entire commit.
> > >
> > > So I do repeat - if one does not want to use that syntax, then just Ack,
> > > instead of creating false impression of reviewing everything.
> >
> > +Konstantin, then we need to teach `b4` not to break that or convert it to
> > something like
> >
> >   [FirstName: reviewed only ...]
> >   Reviewed-by: FirstName LastName <...>
>
> And Ack is not the same as Rb, when I *reviewed* patch, I have *reviewed* it,
> even if it was partial one.

Exactly.

Ab means I won't take it through my tree, please take it through a
different tree.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
