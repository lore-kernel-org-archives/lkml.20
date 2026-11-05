Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793887424;
	b=V5ytii3zhCTKWHDLjbvCZupPMSXPzm6gpsK5pQNdomsgW2PU6TykBjuOV9apuT4QE4o2
	 QFmxhP2LJ9DIVhrgm45ozQYXQFU7i6EpfxUm/ZgLeR5vcZFKogUl5rYLFbyhpa1cal1Yb
	 Kgr+NahggE9C37n4VKBU1ukFb8Kf24cnzQAlloFWMUZY899uX2Y3SF7zRfmSay+L7yKeZ
	 0qKwwp/hk1KHGj7giGjddEUqbIZP5u9UL+QrSheiim48jAG6WFE/C/AzteHIiq7vVvD1j
	 Ma2bt+hp7m5RNLTvjAqk18HfTDcNix/LtsiMiH1zLw3KHmd59ltTsBLqoEXJBgNdASg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ggl1f/cyRla/UR8ICBsxDNfgZEO9pIEnMQLKQjRy/No=;
	b=vTc5BAjxrcAmwI1YYoWC92Wrh5NE7Es2xoqTxlzQRgHYeJ9NSvX/xyZRPi6ZrRaCT3ks
	 x1GXwlNxz0V9xQH/zbyaIdwq2upc40jMhUFmNjfg6PY5ZOJ3jtMgddiD9gebkdpcIocV6
	 573mOqrELIM7Eyfxd6+pDs7mAiBGNb+rHxUpKPoxkONYBcQNY5oDR8s5dKhe9m75x0Jjx
	 vp2NRwZlkDouKhv72C7ACSCbnuh+d2HhfMmRANsxsO1Qm8cT5F9mMqbG7CwUyerIZqY+q
	 k92S0BOX+JgWAl87JClYN0L1QGTATrzHMhuqE3GGGZjqCLL7A1/JWdyK4xO4XcD7RmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0l0ZNbQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BFB606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BFB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0l0ZNbQ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso11447615e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:03:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793887423; cv=none;
        d=google.com; s=arc-20260327;
        b=YumCOpassnHHX+WjBSigxtYVaMAMzOZmlMow4HJwLdeYhJvTfg0GHOY12tmx8LSRgc
         S/apZd3RAYKvNzuet1ZYfktmHdsXgrwZn/8eevOHKtY+uf+x7lt4l+/+twvyuapE6rlo
         HThITjHV5A+WYU0WW//JOkfx8Te/0OOSuiSvoDB6/ekhJ06MVNJQwrcfaiskheH6dkXk
         hyuQ8piSTycezJ2AQMsB58GLKO8PU403qD4Yn3yYAK7CtWfA+me2p/nQRa0KDh6MC0uN
         eJOHOd9QJHpbYS6dyBdLE/Q5U93pY6pHLdNdaEuRHmK37DeAkH91rqvn/x0kikup1m26
         voKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ggl1f/cyRla/UR8ICBsxDNfgZEO9pIEnMQLKQjRy/No=;
        fh=0Sop6lPCcsyyKEK+oZkslRpZDRLbrzbW2L103zeHGa0=;
        b=BKFLbefYtvJlkrBRBXi493GsDlgAold8auKUJcToOyiWRTDz6gEil7gncTUkJFme6E
         tQVGbWKPgfyLzSdXGNR1IN3v8SvpAp0TQjHAhcW/5zDrh2a+3ZiQQ4rUUQTbF95rm5bI
         xuh7qAZwTqKmCur3IU1d054eDnt69OweyjCBMlgA0Bj7D5f+vEVZo7DPZSJ/8ZqK0+2G
         0/fComCVcKownYsNC0Sb9mK7ctUkshMP/CfRoJd3WQJtgyOWKoaZnYWDAUqipcc6OltB
         NCXYA7criNe0J+y7T/+yoUgwryldc4kEIonKf7GjWqj4Pkb8S372o+EDQ1ItfxClCbdB
         2fZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887423; x=1794492223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ggl1f/cyRla/UR8ICBsxDNfgZEO9pIEnMQLKQjRy/No=;
        b=W0l0ZNbQJdLMoD4eiZMmnkoN54pHEVybxhqzG0UpQGAVs+252K87jW/1q3ylhKmNhW
         ozZzwwRgKor1DX8p5OJFXGyvNHYlhHlvUsffaORzXhMRKPsI9hRZOBwSfT02nLH9/z/K
         momGFCm5/qMjX6u942cqwrTYC1kf47c+qDtmEhIUn1tU0kozUxXn45TgCpBZg2+fgLVf
         k4Lsxucl8yhcnDs1uN3TFQMFPP31uyN51jN+HWDqdVtGBEiVjtwZwrxuICCFoizafgGO
         jTV3CV/77YwAcqDcO9KdWxKFZVcsq9gkc4cY7kQ3fznVeR9h3cCGkBl8Hyu/Cl5bG3LV
         ugfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887423; x=1794492223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ggl1f/cyRla/UR8ICBsxDNfgZEO9pIEnMQLKQjRy/No=;
        b=RTco73fBEcGnVXrCS6bP+enAYhBjVOyRciwlJ/MknDtObdYUUqomJHcJYyA87lA6uT
         71jb3LQj9PjYCfrJk6Nx96SkagujJDwhsnCxOTq2fI8NkKNDd2C/qZUWilfZLqg3Zz5k
         t7hzH+F/usPs7prUZtLwIoO+1Fn6BeNSyjVkqZfdL1lskl8tiyvfVqZHyyoWpXX2dRN7
         qY6Ta4HFFa3x1AaVmXoVSyoLWy79lCntIjFiloSZPpVUhKH5+tI9JyOQ7rONH05dN3iL
         VR4RnFYwoD1rgDBs8gw4VRVYAXVJlBUDGWqg1cXRrkQBhKHxYV8ptH9J3IYdC17/zYgS
         t+0Q==
X-Forwarded-Encrypted: i=1; AKwUvByWCCPxKYuWOxdt07ida5xkNafkO31O0y0eSCPvu9qpxlPPrZmbc2SzLvvNZoScsJrfmv/gX59OsuNl99M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dq1np1s9hAtdyGmujiKAzpE6skHbxY5gzqt26slmPM0YJQDe9
	RdcyiM1HOmS0bin9UIndV2wUoi7F1CTAaHBhkv+EUKHoPJvDRAS6EBHemqzx7Vc1ynak6HcInza
	WgIh0ZILKbV88Iyu+2u6MWX07/XNUL64=
X-Gm-Gg: AYBFou2sIDL+DbT9BxD2M9GQs6FBw4wPrMsUkghl5m8y5ZjxlrTFiJoM/D8WculE+6+
	xW65CYZ8FcLnxUb0552QIVFrPtqKxrdpFqYr31qcULxGO5iR9aNtJtnyv3kwhjqPjMkv4MEIPfY
	7Oa9f4uE9g1Afpj6wzN6v1XGJSiVmh3GoBFhlI5zABXl1XqOW9FCwjweIAsz7cLLWAbM/Rztml3
	NUfbeyRRN8nzHvDYGJqFe5Knj5ZLSDScLl+tiR0fKGrGt9hAybVQRF0iEwgaoVa+GD96FH0hYiO
	Vi0XmX6qGjkSWBtuslvUfakU7lOJ0uNwyfSCj6kvOrhNnB7BleiZc/YtS/XU4cpFwvE3f6fCLba
	8jDi6Wg1bnwO/G+y2blDPzyPTWtAZ4/uYfv9c4faVDtxrjT8zcVbi1qMVMWqS8H0XcwwE4iCkSf
	TIojCzwsmLTGYkQQphY0R4avpz4vqIv3caS04UIjhvvvJw
X-Received: by 2002:a05:600c:3554:b0:4a4:7a8d:c436 with SMTP id
 5b1f17b1804b1-4ac17470fdbmr429355085e9.11.1793887422595; Thu, 05 Nov 2026
 06:03:42 -0800 (PST)
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
 <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
In-Reply-To: <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Nov 2026 14:03:15 +0000
X-Gm-Features: AclHuK-GdqKV4-tANS8vahs3lcw_PvOtgyZxhigPFnTBJ5wOeikqaIi4MNhd1_M
Message-ID: <CA+V-a8tbWcODg8E1qDwXU63ohfSgdeMm6GuEkrg=vyrNLQpbgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Nov 4, 2026 at 4:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clocks and reset entries for the ADC controller.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> Similar comments as for "[PATCH 1/2] clk: renesas: r9a09g057: Add ADC
> clocks and reset".
>
Ok, I will apply the same fixes here.

> > --- a/drivers/clk/renesas/r9a09g056-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g056-cpg.c
>
> > @@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mod_cl=
ks[] __initconst =3D {
> >                                                 BUS_MSTOP(3, BIT(4))),
> >         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV2, 1=
5, 2, 7, 18,
> >                                                 BUS_MSTOP(3, BIT(4))),
> > +       DEF_MOD("adc_0_pclk",                   CLK_PLLCM33_ADC_PCLK_DI=
V2, 16, 7, 8, 7,
> > +                                               BUS_MSTOP(3, BIT(9))),
> > +       DEF_MOD("adc_0_adclk",                  CLK_PLLCM33_ADC_ADCLK_G=
EAR, 16, 8, 8, 8,
> > +                                               BUS_MSTOP(3, BIT(9))),
Shall I also rename this adc_0 to adc_?

> >         DEF_MOD("tsu_0_pclk",                   CLK_QEXTAL, 16, 9, 8, 9=
,
> >                                                 BUS_MSTOP(5, BIT(2))),
> >         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, =
10,
> > @@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_resets[] =
__initconst =3D {
> >         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
> >         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
> >         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> > +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
ADC_0/1/2_ADRST_N?

> >         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
> >         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> >  };
>
> The lists of clock and reset signals (tables 4.4-2 and 4.4-3) claim
> there are 3 sets of clocks and resets, one for each ADC instance,
> but this does not seem to be reflected in the register bits?
>
The clock tree in r01uh1072ej0130-rzv2n (additional document).pdf
shows single clock is shared by all the three instances.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
