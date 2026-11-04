Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793802640;
	b=inAnfe77YrBUxPH+hYvYyhAwICnJhdnyKjRkeEwdHvxz7/8sMc46dcgKvieShmqTk+ep
	 qryhfUkMuox1gHPi1gddUlipDjWgP5Kn00sAuETNLEhXqHoJnDDCPQMTRou1mcZ+AwhBt
	 gLxLJagx5FaOOy+k+5KxGPmHrKQ1inSDaXzXC5t20eemfwTEtVJYuhk9gDovbeFHmxryb
	 1EIqVUqGC1rdfbHxLvhljgVr3pY3JuE3caZ7BIJA81bk8I8wyqSrsEYfj/RClue9JP+Ek
	 B60lgYYr3TXb063jMsOOtqZ1TQ0lcleht4buxgeml3XwEe12veUq3mq5ISzh/sEjIGA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Rn0itiYWQq4UoXD7WO2n0E3/GBUM2A+vN4SJN/HSKdo=;
	b=uOjkhDH/tW0XbvWuYuNr7y0DAtLQj3KAPo3Ipgnc4ZfkK3wA+SvHOUttbhEx2cdXx9sW
	 QaFgCJYn+wZRTHbPNVA7Ii7nfIgY2EZa3k1M5UK/BRzKrt57QyhZAWoq/Ec8cIilGchpE
	 Zwwe3msAVxIVgI4uDyyNMB6nBGAmR6+ZLL0YjMrmHg/GsMcbmUVNkj8FZ3iiYDgVZFBLd
	 i4M7VE+g/4tnihSkztFPfWADq9pIBqhz9QJe8JznInwR9e1Xfi4nlxaEfVax+SVUOwvbi
	 cclxsHBUtfc2GIBxk764/ijSmD3+jhp3DjfrShx1ejO4yLx1O9Qcm/T9Pf6jlzXd0hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=IM3V1nfM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BC2606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13BC2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=IM3V1nfM
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67be6030c9fso686591d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:30:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793802639; cv=none;
        d=google.com; s=arc-20260327;
        b=f/M5wA86167NhArcpzkXpg2W6bLCkOxXOJtLSGCzE/U1ONVEcXZJ34ZMEgzWoYoOiy
         x/i6zOajfoHP46rj1vqp3QIkvm2k1O1DdK7uYLcPMDlGgROgSi6+kAsbhGGVBTRB1S9L
         isqimYF+9kb8otC/bUv5BH69D4ek/f95pr3Zfg7wcwRF3+wIh2qrnJi1kbP6R1SHTqhG
         4jHXePL88YzCLjXPMEqW92n2dxKkV10K1XoZvw+l4G85/bwPxzlf3fjeLaX6FZIHREy5
         MBZLfdjWtOxuRhCsiS7WDKwiy4Y7gidkpWnLchOiiBZtSzj0OOEf4daldC6w73nvWGD0
         pnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rn0itiYWQq4UoXD7WO2n0E3/GBUM2A+vN4SJN/HSKdo=;
        fh=HHki2ZECUrw6soHKwOegJCdNwjwtw+V6R31/VH439hE=;
        b=SLPeNh9Q50S6eTIoR/T3br5feEhe6AJIbUYZ2MTS//3NdhWaxIGfhze1lwLV+9aD8b
         90DUPCfRx7XO/0JAMvAer/q0QKjOgkK4ucO2SrZ1GpEqnGX6aEvuRiIRcv77w785yHyj
         04XTqMd32ehdr1v2JcYGhslJVCJ9bAbp+0ZL9YJU12wZ7/5aGMD7tvTx3olns0nLCx7u
         NJgZfiiPY7ykZcxqQkxI3oJJbFNL+rr/8+w5ooKObWtxjdvURSlj4Ae5aFmdL/zLTiNw
         QG4YmxgRbAOQBejpRoQUZ+KpyTM62SG3bnl/lmxSzkeyR2SqlClMyfrpSAxDM9xq1Go2
         gf1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793802639; x=1794407439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rn0itiYWQq4UoXD7WO2n0E3/GBUM2A+vN4SJN/HSKdo=;
        b=IM3V1nfMdyfBycwTSOze4fkQR/dg2hzQheXiDA/HdcVRW7u5PaXH4iiRmPSzQyq3N5
         9AgNhr6sPE+C9QuZ/rDUmdBQk2/+RHPs2597wMbl3+eKt1ZBk1L58dCoizsAHMiosLCd
         ThYZ1r8MnmKabThNKeZDx2x9lFITOSH9R1/BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802639; x=1794407439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rn0itiYWQq4UoXD7WO2n0E3/GBUM2A+vN4SJN/HSKdo=;
        b=pnSbjnTZsLOb1O05XuZQUoBCaqAKHLu9tePrTDMRgrksXPrBaqv9iIZnWFD6RRBprN
         dH9c4ZUVf7XJ+b8UfRwJp1N5XCgzLiJA94f4ODLMS1dH10fvfZ0SMLcVh4s5zYgoolE9
         Zrx1lhuXLClzqruWr4PP89JMgVRDKOU27e7V95MWGAGESQUH9wROXvF7CXU8z0yMAY/5
         KZhJeouMqhCWu69mM8OrZOX+HYmD2K0kZaGDApascSKFP9FbMhF3Tn1Zh1gZfyIUTcoU
         zDER88iYtebVfUcO5BFCnQ5EwRNce+oq7X+ybp/S0rBHXqTpPzNlp2MULoYJq0KKzZd3
         rGdg==
X-Forwarded-Encrypted: i=1; AKwUvBw/qdLWQThrdiBCwynLWnu28KEFH8YNXOw0V55zy7vmv5ciA8TTNoE1qfO6Q8M9DLTYAUW/W3RJb4Jx/gY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TxInuVsBH/uIDTWDY8XZfjazuLuMS+Umo65QBvVYwtk3Yw9zP
	V9B4a71et5gHrlNLe4yEqfWKiYvyJsZTu/iIttS2cTspYyq4+NzcAAmpzPpzD0DlExX5nDXENcF
	ZRH+jVA7n0GXUNS1ifkLnIQ0ZCBEdcHduKtZMWmM2ug==
X-Gm-Gg: AYBFou1+Y8E0pJRANcSEu/xLoGfgmZ7Bj78EQ48ubQ15oFmxzGmZPKm/cdncsnSHabH
	nwLiAWRFB93MUMVfajEZCcr1E/gRQiJ+RyoWxDxjHt8xh3/IOTdx0tylP8p3P0e5QDWFx7k2Fs0
	M44Y5tsnCJ6tXL0pqMTCNXw1xXH3kf0tDOU/96ujmeVoqejtHnA4Zun4+oHXv4KzlQ2R9tGHS+t
	yJnpJLJKJ+svnV8QbIQMePEN0/Yndj4qt/PbvfiPutofW+N5v6DmMZDGYWslBTyYLLpeEGYc6K7
	wXMhm2yWMbUkbyHbXPHwxyilM6MqgeT/8lbmkzA4KecSumyIaed6TdooAxxE0EiydvK7s64mfeP
	5LSLuHksBuymS2w7JeY5PjLVg4kp90mIV+wYULnzw3MvNT3rX85lPRYJFEVKcKC0SoeFI
X-Received: by 2002:a05:690e:128d:b0:67b:f2b4:7ea3 with SMTP id
 956f58d0204a3-67bf2b48061mr1185261d50.18.1793802638944; Wed, 04 Nov 2026
 06:30:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com> <8c8908f1-ed6b-478a-ad00-c67448b25acb@foss.st.com>
In-Reply-To: <8c8908f1-ed6b-478a-ad00-c67448b25acb@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 4 Nov 2026 15:30:27 +0100
X-Gm-Features: AclHuK-2YVD6MLpocItLoy0Jf9YnF4dS8B-jCRxYLxfAIe0sapLG1UQibi0oIPQ
Message-ID: <CABGWkvoVrA7vaE6mKdp=2KNajREtgEi2RRV4qFcJmFqqWwQDoQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Select the STM32MP25 LTDC pixel clock source for
 the RGB output
To: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Vasut <marex@nabladev.com>, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Brian Masney <bmasney+clk@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gabriel,

Thanks for your review.

On Wed, Nov 4, 2026 at 11:42=E2=80=AFAM Gabriel FERNANDEZ
<gabriel.fernandez@foss.st.com> wrote:
>
> Hi Dario,
>
> Thanks for working on this and for testing it on the Engicam board.
>
> First, a small remark about patch 2/4: this driver is based on the one
> we deliver to our customers in the ST kernel on GitHub [1]. Please keep
> the original copyright and the Signed-off-by of the authors when you
> reuse such code, and add your own on top of them (e.g. with
> Co-developed-by).

You are right, I used your downstream driver as a reference and I should
have kept your copyright and authorship. Sorry about that.

>
> Now about your two questions:
>
> On 10/28/26 14:59, Dario Binacchi wrote:
>  > - the mux parents are referenced by their global names. Should they
>  >   rather be described by clocks/clock-names in the SYSCFG binding?
>  >   Moreover, no driver registers "txbyteclk" yet.
>
> Yes, I would also prefer to describe them in DT. I'm working on a
> version where the mux is described by a clock-controller sub-node of
> the SYSCFG node. This sub-node is populated by the STM32MP2 SYSCFG
> driver, so no auxiliary device is needed (patch 3/4 can be dropped):
>
>      syscfg: syscon@44230000 {
>          compatible =3D "st,stm32mp25-syscfg", "syscon";
>          ...
>          syscfg_clk: clock-controller {
>              compatible =3D "st,stm32mp25-syscfg-clk";
>              #clock-cells =3D <1>;
>              clocks =3D <&rcc CK_KER_LTDC>, <&lvds>, <&clk_dsi_txbyte>;
>              clock-names =3D "ltdc", "lvds", "dsi";
>          };
>      };
>
>      &ltdc {
>          clocks =3D ..., <&syscfg_clk CK_SYSCFG_PIX_LTDC>, ...;
>      };
>
> The driver takes the parents from the "clocks" property
> (clk_parent_data), so the inputs which don't exist on a given SoC (no
> LVDS/DSI on STM32MP231/251) are simply omitted. For "txbyteclk", we keep
> the existing clk_dsi_txbyte placeholder until the DSI driver provides
> this clock.
>
> I also want to keep "#clock-cells =3D <1>" with a onecell provider: the
> SYSCFG has other clock selections, and I would like to be able to add
> them later in the same driver without changing the binding again.
>
>  > - the pixel clock source is selected in the board devicetree by
>  >   assigned-clock-parents. Should the LTDC driver rather select it
>  >   according to its output (RGB, LVDS or DSI)?
>
> I think the LTDC driver should select it: the source depends on the
> output used, not on the board. This is what we do in our downstream
> LTDC driver: it gets the mux as "ref" clock and calls clk_set_parent()
> according to the encoder type (LVDS PHY clock for LVDS, LTDC kernel
> clock otherwise) before setting the pixel clock rate. The board
> overlays then don't need assigned-clock-parents. Yannick and Raphael
> (in Cc) can comment on the LTDC side.
>
> Since I have already reworked the clock driver this way (binding,
> driver and SoC DT), would you be OK if I take over the
> clk-stm32mp25-syscfg patch? I would send it in a series, keeping you as
> Co-developed-by, and you could then rebase your Engicam patches on top
> of it.

Yes, please go ahead. Please Cc me on your series, I will test it on
the Engicam
MicroGEA-STM32MP257D-RMM with both the RGB and the LVDS displays.

About patch 1/4: in your SoC DT rework, will the LTDC "lcd" clock become
CK_KER_LTDC on STM32MP255/257, as in your downstream kernel?
In that case I will drop it, otherwise I will resend it on its own.

Thanks and regards,
Dario

>
> [1]
> https://github.com/STMicroelectronics/linux/blob/v6.6-stm32mp/drivers/clk=
/stm32/clk-stm32mp25-syscfg.c
>
> Best regards,
> Gabriel
>
>
> On 10/28/26 14:59, Dario Binacchi wrote:
> > On STM32MP25 the LTDC pixel clock is selected in the SYSCFG
> > DISPLAYCLKCR register among the DSI byte lane clock, the LVDS PHY pixel
> > clock (reset value) and the LTDC kernel clock. The SYSCFG node is
> > already described as provider of this clock, which the LTDC references
> > as "ref" clock, but no driver registers it, so the RGB (DPI) output
> > can't work.
> >
> > This series adds a driver for this mux, probed as an auxiliary device
> > of the STM32MP2 SYSCFG driver, and selects the pixel clock source on th=
e
> > Engicam MicroGEA-STM32MP257D-RMM display overlays. Patch 1 is an
> > independent fix for the RGB display overlay.
> >
> > Tested on the Engicam MicroGEA-STM32MP257D-RMM board with both the RGB
> > (Rocktech RK050HR345-CT106A) and the LVDS (Ampire AM-1280800W8TZQW-T00H=
)
> > displays.
> >
> > I am sending it as RFC since I am not sure about:
> >
> > - the mux parents are referenced by their global names. Should they
> >    rather be described by clocks/clock-names in the SYSCFG binding?
> >    Moreover, no driver registers "txbyteclk" yet.
> >
> > - the pixel clock source is selected in the board devicetree by
> >    assigned-clock-parents. Should the LTDC driver rather select it
> >    according to its output (RGB, LVDS or DSI)?
> >
> >
> > Dario Binacchi (4):
> >    arm64: dts: st: fix the Engicam RMM RGB display pixel clock
> >    clk: stm32: add STM32MP25 SYSCFG clock driver
> >    soc: st: stm32mp2-syscfg: register the STM32MP25 clock device
> >    arm64: dts: st: select the Engicam RMM display pixel clock source
> >
> >   ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso |   3 +
> >   ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso |   5 +
> >   drivers/clk/stm32/Kconfig                     |  12 ++
> >   drivers/clk/stm32/Makefile                    |   1 +
> >   drivers/clk/stm32/clk-stm32mp25-syscfg.c      | 111 +++++++++++++++++=
+
> >   drivers/soc/st/Kconfig                        |   1 +
> >   drivers/soc/st/stm32mp2-syscfg.c              |  28 ++++-
> >   7 files changed, 159 insertions(+), 2 deletions(-)
> >   create mode 100644 drivers/clk/stm32/clk-stm32mp25-syscfg.c
> >
> > ---
> > base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> > branch: stm32mp25-ltdc-pixclk
> >



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
