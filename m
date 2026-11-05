Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793886203;
	b=nwNA4u2WD6AVoJZjrXfr1MZaB5Sw1z7dYXNGT9d582HQaDcV982To2JnUyaC4KEdRQNV
	 1XPUkTJcBjNcLBQINl5xjNq6xkzE1xSEGHZuCmC6VJXXE+cgtAkAylDAgIshGTjzS6l8j
	 zKqNigk6cFdMzqmDbiFoqsN7dAE405dIIb6H087la7/3oGXb3eH6YclxPVoKEc99dtllq
	 hhbcC3dxKAC0VpMZUemqB6M60iBK+cbZC1ff9WYqR9eq9IavEdsKX2TpV5CEi5eGz/yq9
	 3faRs8OjFiUYU9/6QZ5T3fPDtNLt+EiW5aMEsjt9ior9VhEzRxs+vpvKkyf2YMzUZaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5InNLlTBW1+FHMMXtqNCm652eEhZdNBTTArid9tphss=;
	b=Asbdwhu6TdZTU3isBHy+1rPvFgbrFbNcs1XQz+WwivNJeBtAZISZAd3stMUe//FmnFqd
	 l5J4ldbfc1kT84hW8RZZhAep+CKMYDKJrAsp2exgu7UZjXAmTe3oeUyaCCStA887UdDx4
	 HKtL7g6KdkCtznPvJOVBj4sBOw8WuSeNRsDeE8nLn63SQXR50oegQEvxrn+lX5v3vJm1M
	 EsZJXwoWMMmQ+V+N1VS26wQZbGeMUw+WLBtY8O6Cxeb8gOB0FgeFc32r9aELFHinDFBBc
	 E5+e75bQX0NyV5YywG4M4QZb+M7Fx4v2f3UlCTnLX//8qfBG/DLHS23u+gzolvMetaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmurvqvT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0E1606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D0E1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmurvqvT
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso16907005e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793886201; cv=none;
        d=google.com; s=arc-20260327;
        b=L4TjTNu1t0mKYuaOMIwb8J4VQWGRJnwIMoTQV/ayWGHGuvhZ7/SDEv/hWen9EysDHl
         9EsLjswVhmCSpZODtzbmnRC6y0ZkSp7TAUrk1VxicL1SkZ99MItGQe2V9BG3CVCz5o6l
         It9Qgw4qCw0/Jc4uK9WtsH0hwRCJZ68abqul9lvrY0bY2t0G5a7TwR8p7bp3+JAMb2/B
         pMts4vOag5zJmusQjc98qPbEYjcJp2vX8Ywmomk91+6pqmcpiHze23S3xdN6X6Rt7NFk
         IAZU5boCTpOW0nhBkc+tzDTQt8SNzzuhcK/YMeS58hp3fIkjIZAv6dK3I2jw9Vh9a4bn
         22eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5InNLlTBW1+FHMMXtqNCm652eEhZdNBTTArid9tphss=;
        fh=wzkIQh4NMkZK96ZF30v3oiaXlh+be3hVQamk7+rT4u8=;
        b=VlwB4qhI5DWxpqc8kQ2KD5t/IZg5i8pLzwG28YdOiOMbCJZgjjcU7mgjrGNHKTKjiA
         2QXZrYY1FIZ0OF1z2gY3HNpbt2jDD/A4XxLBgnBLG9bXGOQ3+vX5EtoJS+Wf+KAAVd0b
         u3ZylOr71FUlNLLvVq83Itwc1m3bjMVfguqhI+oXXx+udbcWmbiF9D/Dg/O/z1tJRNks
         yOuuMka7c1wvYrfvt4Eu5eJz5hujHErssbbKNixtWECdmGJMWaOfGgqAHE80kXndq9Ko
         VA9aanOoSgvq24f3hODblq0mISRUUWFM4ckypu8ckcUZLrKV7RYMcrbIp9CYA2b17D3w
         Xv3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886201; x=1794491001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5InNLlTBW1+FHMMXtqNCm652eEhZdNBTTArid9tphss=;
        b=mmurvqvT+z3WqxIrFi6mIwXiICJd076DFKfZ9ie+T9w7n+pCZ6rvIwh7bplFf3ytGe
         +NawPJ/F4zbKYPTahV/wRXW2lQCTq8P/Omu2hRB15SavqkKWNxPtxTdwgfUiMLwSN8Ay
         ClkO17wxr2uYAqnLmC5k+hfbdq0fyUVVSxuRCd8zwZqWrdoG3xg2lzG2OOdHvZXc/3HT
         W7U/Ue7LRBeuV4gLSiHju4akKZStC6q2uAnKHD88lbWrE50csXiL3JRC8NaL7W0Ap75H
         A9gSDo8S1ywxIfdHde0Ojb/RXbwWkhYNJ2z1H/H+Ky7XvnzfmwQtrGs+RbYufT0hJodT
         ASCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886201; x=1794491001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5InNLlTBW1+FHMMXtqNCm652eEhZdNBTTArid9tphss=;
        b=HaxyxPyY22M1wNdmpk2O5Eg32B0WiWvItGMB1ibeyqHKRAEYeYVF0F/M0C38NOI8df
         DQPHqLRBdqatASXBXtGAA9CQg3565jRcmtnuRgFFbxKqXkhzuI+4z7DgsPhQo8RyKGhj
         142iJLHg/Pt7T4CyP4GQE3kbQh9OPusGPnMs6NGsXcCsn0UAQOPXvRlakUcMcpSb9g0C
         68Z2v3NORZHciBeZIaSwMPL7RQEVY8aIIHnBpp34olTHli7ogpw79J+U0Qzxvh6ZkMnT
         dnBpl0KMz+i1TzZq9w3FvkZTtquQl3Q01ugmFYqOmKvT5NteJ7LsspwlyPrwZtG4jV0V
         i7fw==
X-Forwarded-Encrypted: i=1; AKwUvBzPYtgNeo9/KSNCZGFEKxZSmgRxOBd3HCtQFysei3u221rD4RIfzKKZGZxFVLro3Rv5N3EZIzY+3Pruz1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Sn3DAqkFI8ArnxDneGTUfjsXZx0SdEr61vD5tlX5IoHTYukzb
	QsB7MR5TZfSkR+w9SEGLUO/wtatpE2JaJdClR5YKX9luluZsZ2ya48fYwspxfUFhbzlgek0i0oN
	X3o7t+Nls5OBuNSAhC60UHsBThrnYAZ4=
X-Gm-Gg: AYBFou2oms/iFMUq13JjZVN4a91Fe0+6WwU8ZE8TmP2vrACzTzM5l9hg/ZOrdW9tQ0+
	jP1w2CI/BsWzELykI0wEyhvn+4Ajh3rUhLkG371qWmwdVLFhcvZhPWXQd2Vcr2yNIvzYvX+wnH4
	OyfHRqfJ10z5MmujG7xP0/Y+a8BLM/LoZYFFoDDfsJHLs01PO+K2Fd8C5FRg9BIzY8m2eVObHJZ
	NhDjrothqpUzH1BZ3xW7vrm06H9tAanFppcip0NLkCzZbouZ12LcmNa+nWSpuOub6D9jBfUoBCq
	mCsy4wNzBrcbqIMeWt27+HANaBIWVjNXoScZigbvYNxcf7ArON5KmsHZM9jArMxArhkvb3UVibl
	KHNMMASk+I+3taOX6AOyaFPcwjZ/6n25olnuK7SFoQ5yDUGPWh7tZ+umBnVdNXcphKro+Jlelsc
	kNI0p7CKDTc+o9asHpP3ins2Lu
X-Received: by 2002:a05:600c:3554:b0:4a4:7a8d:c436 with SMTP id
 5b1f17b1804b1-4ac17470fdbmr428347465e9.11.1793886201331; Thu, 05 Nov 2026
 05:43:21 -0800 (PST)
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
 <20260929113921.119489-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV5Sn9FaMNEaxQKF7_rm5hvM-pfC2-KU14=96DFGp85jg@mail.gmail.com>
In-Reply-To: <CAMuHMdV5Sn9FaMNEaxQKF7_rm5hvM-pfC2-KU14=96DFGp85jg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Nov 2026 13:42:55 +0000
X-Gm-Features: AclHuK_NJQNESWK0guGnOVGqynMZyFihFGeP8KPEUxdd-p_NokaiWz_ftQoKZDo
Message-ID: <CA+V-a8u=W+74U-+=k6MdhQsS8wZYkbuvueun15M3AiiA1=T58Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g057: Add ADC clocks and reset
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

On Wed, Nov 4, 2026 at 4:42=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
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
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
>
> > @@ -173,11 +183,18 @@ static const struct cpg_core_clk r9a09g057_core_c=
lks[] __initconst =3D {
> >         DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
> >
> >         /* Internal Core Clocks */
> > +       DEF_FIXED(".pllcm33_div2", CLK_PLLCM33_DIV2, CLK_PLLCM33, 1, 2)=
,
> >         DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3)=
,
> >         DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4)=
,
> >         DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5)=
,
> >         DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, =
16),
> >         DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, C=
DDIV0_DIVCTL1, dtable_2_64),
> > +       DEF_CSDIV(".adc_pclk_gear", CLK_PLLCM33_ADC_PCLK_GEAR, CLK_PLLC=
M33_DIV2,
>
> ".pllcm33_adc_pclk_gear"?
>
> > +                 CSDIV1_DIVCTL0, dtable_8_10),
> > +       DEF_FIXED(".adc_pclk_gear_div2", CLK_PLLCM33_ADC_PCLK_DIV2,
>
> ".pllcm33_adc_pclk_gear_div2"?
>
> > +                 CLK_PLLCM33_ADC_PCLK_GEAR, 1, 2),
> > +       DEF_CSDIV(".adc_adclk_gear", CLK_PLLCM33_ADC_ADCLK_GEAR, CLK_PL=
LCM33_ADC_PCLK_GEAR,
>
> ".pllcm33_adc_adclk_gear"?
>
> > +                 CSDIV1_DIVCTL1, dtable_2_16),
>
> >         DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2=
, smux2_xspi_clk0),
> >         DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3=
, smux2_xspi_clk1),
> >         DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK=
1, CSDIV0_DIVCTL3,
>
> > @@ -669,6 +690,7 @@ static const struct rzv2h_reset r9a09g057_resets[] =
__initconst =3D {
> >         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
> >         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
> >         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> > +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
>
> ADC_0_ADRST_N?
>
Ok, I'll rename this (and all the above).

Cheers,
Prabhakar

> >         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
> >         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> >  };
>
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
