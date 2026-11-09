Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239999;
	b=smMgjikrGlS6NDOPdBjsdj+pwj7bhnROIWMN7n9qq+rYk5BlBttvwVET6EtyDTqKD5rG
	 zR1c8iPsSep7yfHKCAIavY2tJOo7bWXZLX3djpi26fM4UOq8t6T7ckeIR0YNHkdZvtPXp
	 Dgk3MsM5rv9uN8jgMvFNJAlTpswj0tzEOiJ5ZOorRS83M3b7nu+frlSHMNe3SH1hpGSqq
	 iHLu5h0yCUtpJJQa69Fx5kO/pOdj6WRolPeB/Ja/cNPenAUOF+Ca2rLVwT/AyUttO+gY+
	 eeTsj1wSfRVEnbo6YqGHW1/LtBUvl4yOmcfoPH6EsDKFgf73Dj66j3QWd8WjY87I7oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239999;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x8+hwW/5zTCinXQlt6chk8M/+naLfTi9oCAtj9giEx8=;
	b=eOxqoMTSkcNFy20KLJksSLtbPMrNUp3grTX4ant7o6V3X1f/rnwu2hVBEXU29JmFyxTL
	 f1u92Zd6RePfOJrtHYG6tzZydk1T8mZl3SKYVul0fAKjfFgH30VvucrIVAHe50E19I7Bn
	 EbiMwPF0pCAxy4xhge513V2VyETkP0ntIFJWbPpH8vAydagyJs7gp48T40zNj/V4rLAT2
	 UTK+Cac+JpkHjI4XDo46iYKeNtKbaWZC3EvoIxw7bJmgWj2pNow/IYyXJBfBSpSdOQV88
	 C0VqrDh72NLAp1Uaw2iE/gUFwov3JRQyq4kRrgoYRDFvALvyjk2FX0+TqWhlyPeLW6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KyOdeZkA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693DD606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KyOdeZkA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFDA1F008A4
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794239999;
	bh=x8+hwW/5zTCinXQlt6chk8M/+naLfTi9oCAtj9giEx8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=KyOdeZkA0xw/oDMdNjVIUrd6YB1WGQgFRJrMI1zKTl34GQK3Iz5RjyJdnt6RSHcYP
	 ckkpWeijwjC5d9JGTcKCPKFBdFq1DmsHPGfMGuJdJMG2TMVEKo4AYkfZeB0p6nPhpm
	 3JD3YyzU39scsGUV7/GoNmyp/X7wDiwsZ30O223vVfkFFacqyni8pWrhXYLuIeDQmR
	 Hesn6xvv3NhELHTDK84pS/P+1EWlWGNeSrEExs/qZv05asTkUqX7d61S9Mi+A7VoZu
	 Yk2/dr/6lGMgp95FFUhBKzbyQ1548YaTuhz3MmafJm5bpP60/Wa9bgELEnzWSjtGcz
	 qREr+Mt3dKmQg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3adfc004920so8985421fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:59:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHAOopnRJb3yeC5zXRDXgkvZWjnxi1unFU2yJv5FRA0p9w4T3T1D1xC5HZcQ8/Zeg2TBRM7wQqK7Bli/vw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RbK9w+I2B84G0Gz0eqTiA1bgV6U6E5cVcshFmEDNU5f9QRoix
	TW4xq5etRnBMozu/nk9UleqWd8Cx6aJJ4MuSGJ7rK0HcqJCoe56vqifqxKhXafdxdMoSTf5Htqb
	tzaURLxIIR39tMjK/mSpxDl3nS8t3/Jg=
X-Received: by 2002:a05:651c:e17:b0:3a8:7b84:be96 with SMTP id
 38308e7fff4ca-3adfa482a5cmr11743561fa.27.1794239997190; Mon, 09 Nov 2026
 07:59:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-5-ae8178fce7e8@pigmoral.tech>
In-Reply-To: <20261009-a733-clk-v6-5-ae8178fce7e8@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 00:59:44 +0900
X-Gmail-Original-Message-ID: <CAGb2v66PV8nKSoU+4qA6Z6AS62V0xkuPBjKSy=jUf7Oh0=bv6w@mail.gmail.com>
X-Gm-Features: AclHuK9QXxwYcsEJa5-pvHGGLGfB5fBZTAKpVeZDXOjgDPABVDtQI4CTaoQK7OI
Message-ID: <CAGb2v66PV8nKSoU+4qA6Z6AS62V0xkuPBjKSy=jUf7Oh0=bv6w@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] clk: sunxi-ng: a733: Add bus clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 12:54=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.te=
ch> wrote:
>
> Add the essential bus clocks in the Allwinner A733 CCU, including AHB,
> APB0, APB1, APB_UART, and MBUS. These buses are necessary for many other
> functional modules. Additional clocks such as trace and gic are also
> added as they fall within the register address range of the bus clocks,
> even though they are not strictly bus clocks.
>
> The MBUS clock is marked as critical to ensure the memory bus remains
> operational at all times. And the hardware requires an update bit
> (bit 27) to be set so that the configuration takes effect and the
> updated parameters can be correctly read back for the MBUS clock.
>
> The GIC clock is also marked as critical. The bootloader may leave the
> GIC running on a PLL parent, and disabling that PLL during
> clk_disable_unused would hang the interrupt controller and the system.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 108 +++++++++++++++++++++++++++=
++++++
>  1 file changed, 108 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 3368801053ec..371c4297c3ab 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[...]

> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(gic_clk, "gic", gic_parents, 0x560=
,
> +                                     0, 5,     /* M */
> +                                     24, 3,    /* mux */
> +                                     BIT(31),  /* gate */
> +                                     CLK_IS_CRITICAL);
> +
> +static const struct clk_parent_data mbus_parents[] =3D {
> +       { .hw =3D &sys_24M_clk.hw },
> +       { .hw =3D &pll_periph1_600M_clk.hw },
> +       { .hw =3D &pll_ddr_clk.common.hw },
> +       { .hw =3D &pll_periph1_480M_clk.common.hw },
> +       { .hw =3D &pll_periph1_400M_clk.hw },
> +       { .hw =3D &pll_npu_clk.common.hw },
> +};

Don't know why I didn't see this earlier, but my LLM agent flagged this.

Based on the manual (1.0) and BSP sources, the periph PLL sources are
from periph0, not periph1.

Once fixed, my review stands.
