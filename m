Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793898185;
	b=EMeD5H1CppeVVYN5HeL7AMS9Ejf9rOUaB7Mr2ELtn+yeWuIh1TyHVoBklC3EuIPP2q7f
	 jF4tSkWobB3KLJNQvv5FktIOSzLcozhWmHqzt0NheTMzRR6aoLYQ33A9+2QvQWVqhyaQ/
	 +spvYUPxYDvhEOGgTfcnaFAXjEYismKOuyalHfdcGPvMfLD5PAln6jtDyyce0kNpxOBmh
	 1uNfHIZbJq8Bq8W7li9OBCFZR1zyL0UxWGBMtc5S4Hohir2xEDLJW+JK384ZKC9bk20eS
	 +VMT6V/SDVuaccuhk6KxvNyT6BE9Uia0wAKpxiMdt46rGTpflR8vstTmPLWthDMiNQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=myxHuKBMV+4xfHAoPcmps6Jo0+mw1I0xl2wkI4iMH50=;
	b=Sc6MfZOdjKLQEaa3zwoKo8/+gZZTWcujOi9yIkXN7mxJUR/c4x/ZxXI7MvAaTlQMdsia
	 3qwtLKEsz3u+OAFiVO7hnuVQPI9LJcY18VnNcSL6nZSDzoiGt/k8O5Rayis2Yk2ba+Xyv
	 pVM8g9AOE/QVjfvbHujBmVNqsF6dPaK4rHmUuy3HkyT/kdSebCASLMBI3LH7Sd8Ws6Xcj
	 ocVktdIwRBBmnks9cVR18VzMEWsJkSs4o0/yQTggGD4yvi/n9o1++4ltx6LBVPA0zI9p1
	 EQF5aAObrd0PvbTZVnoL7bbVm8B7UZ4uqltxVziQWCdmTMqpvElQnWxGQu6T784+Ymw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Yie/T8br";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B4606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 985B4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yie/T8br
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1956921f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793898183; cv=none;
        d=google.com; s=arc-20260327;
        b=glV/eEeofKmg/dQogppn/eS5N+nT8LDKY++qAjP9KIKHL0XbDNNHUxLKenJjTbp8BN
         9S382BqB+I6rN7khJx3gLB3v+/8XbbfbGgfdbi1QVhzQFIYpBuRJz9N2hrQfYSHu73H+
         V+qOyii9203gWbMIA34hliejAknh872AQaINAMlkC8kjf1OGGTJVJ1U9QTbIZ+acvSHY
         e1Ej6j2YlHawlWHrg70sOuckCQ1za/Sp2zttTE1br4eAkFjkPBc5yqb1OEORpkAPMQ1T
         s4mk60b5Fy6jz0vbBIpDIWaMKoakxR928ddolAH0jRauZme0Ocyd+zVSXXzc09uPkGPf
         CEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=myxHuKBMV+4xfHAoPcmps6Jo0+mw1I0xl2wkI4iMH50=;
        fh=eXykZNZNsFkfR26Cz039QnlqpRG5z8mbrBupcsip/40=;
        b=nHaHSNV7epMlWOprHv/yASHUFnVteu5/VHc8xm4il/RP87OqznV7ktPfzWcOew+Qhk
         6MI1+6TtCElCby6tknlKO4dutpCqB3TuPRvBNhj/exwc6Ynnpv0cFRS5rKikTbGUWC7S
         bUaUgigZzK/Od+QzCOkmsY7mzVygOBhlb/EyvKN8jSBL4KtU75vWv0UtwhV+rG/Qz+PB
         wEv+fUqbMzcWaVdEZx5ohZTwzA1QeBrV2/78cMX3ehmqF8qjK7y4ItUQbYxV5JpAXmVy
         JJtgI/Rmp2g64Gxh7yFnx6v2p5GU5XoK12y8qbmv+MIWpoIrQPjYNvrOrl5EiWFodjhx
         7i0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898183; x=1794502983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=myxHuKBMV+4xfHAoPcmps6Jo0+mw1I0xl2wkI4iMH50=;
        b=Yie/T8brMNwD9XMtoCRe4KocbowOal4KvpE8BrlwXg+74uPYL2na7XdS71r0etDevo
         jSuftvcY6zXZMcR3usSsir+uCR+ND9Q1w46SkNB78+f+N7+KcdKzJuhi8+WzqJpqASSD
         SB6VXbUx2EGWa0XiAHI1sFZ9AKfFC9IWFjzOQplInLIKCD8/r7b7x7UQj4S8JO4lVRCM
         ydZXZeoz2/d4hBHQTZerbPRE1YccCiLk7u/+Pm9ywXZRuncEFx0X1PL9zxUFSebD1b8x
         FciIG7UqaMvwQH+NAO6vdLr08VcCyBYh/am2KOMbdoiyIifCKX/+j/u170FM+Rqfr6HG
         NUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898183; x=1794502983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myxHuKBMV+4xfHAoPcmps6Jo0+mw1I0xl2wkI4iMH50=;
        b=lyM4mHehaFmsIX4f+frwiMsYp3esKkvrWnIPdHCW9qKB0KRXISx/3X9SGvXYFWVBQB
         KZ6jatfIbKwusyTbf8Pm54BsvAau0Y+FaellkSnCSsZooToNEqryP9LZF+LSR8cpuTXf
         8twpGDz1XEuPzLJfkS1EkVl/19SA+1LzqBoxGTCRu90MBSXVGEykCQ0Nx6IZ6Z09nkVg
         WL3kZJkEAwKmgbxr7JHQBRnpbHdPsIA/kFIF4rfl7e4LOpbD7CZDyPzEWqsO1yKuFDz5
         g8YNd06LLxTNJYaULPGCyKwaZAPXICR/3ofkfGCW0GIkBYERt0YHU6QLk656JbpXIpyB
         M9nA==
X-Forwarded-Encrypted: i=1; AKwUvBwZ+oYhG9qHJjArbrpCzeSdijZ10X0HX6fvot3CaNfPBg6SOEVfqAxUuF5+YZjYsXxukFzkwLCy03Rw8Lk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a4eNq+JJr43Rf13Q4dUvuuhMbN+f/totFHXmfnJKzLLnlx6vM
	HlRqQprZEV2h4Mken8O2XdTzupmiaejMtzWrEt5J9gOH6jniG1e4cMx+P77u7fbrGS31EKClrzy
	hMxQpX+xG7m11GskerwhVPpoQhWAbhBs=
X-Gm-Gg: AYBFou1Z2dz96XB2i76MO9KiEie2k598FStXp7gip+VqHd98peX1jOzsSzpwRiyVWXn
	c3u8OVL2gLB8Ga0FKZjOgJbzlPz0FlfRoO5vlpZgrXpau9Spqqf6HjwsX79ZIzQBeUwZs+8Ex4L
	EdvPLzLz1PYrX2xCPyMHD62q1DwZJlXAxt8PL2ZBjDkHji3UXTxpc4KIymBWWbVQNiwlCEITWEd
	3gXKyUDGMGKnc9YoakEPJj58wk0xjONx7YbGreP4zXhdhUot+itiuB92LTdMRoUuzkvUdOQ2D3u
	WY39nKdxhXK3AdTsWVGjAdvm9012bbUlx25c7/IRfTzRWegaUWhhL92g1J1PVa5Vb4e+2o6PEx8
	bnscjUQNo/0bLeZjK17jDG/W1HxCyuAX8bY55Oe65mI3LSd+rid3ehZXzvW6TeY82v5dRbW3wSA
	pZciW7QFRu88MkKc0JHSpVfA==
X-Received: by 2002:a05:6000:2501:b0:48e:5d33:da5c with SMTP id
 ffacd0b85a97d-49273f500damr506459f8f.1.1793898182689; Thu, 05 Nov 2026
 09:03:02 -0800 (PST)
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
 <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
 <CA+V-a8tbWcODg8E1qDwXU63ohfSgdeMm6GuEkrg=vyrNLQpbgQ@mail.gmail.com> <CAMuHMdX1j6G+Kd80-6s5PEVkOfG_tS2U8p47929G9kHvD1S-eQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX1j6G+Kd80-6s5PEVkOfG_tS2U8p47929G9kHvD1S-eQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Nov 2026 17:02:36 +0000
X-Gm-Features: AclHuK9B3JW76CB2qKvqEnvosxoUZui94RMsNVjlo-gO8QGB6XF8SpTGr1OOZV0
Message-ID: <CA+V-a8u6G0=wtBxEkjY3rYf-BQv23jJdc-4NE7aePEx_WkOVqA@mail.gmail.com>
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

On Thu, Nov 5, 2026 at 2:52=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 5 Nov 2026 at 15:03, Lad, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > On Wed, Nov 4, 2026 at 4:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> > > On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add clocks and reset entries for the ADC controller.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > Similar comments as for "[PATCH 1/2] clk: renesas: r9a09g057: Add ADC
> > > clocks and reset".
> > >
> > Ok, I will apply the same fixes here.
> >
> > > > --- a/drivers/clk/renesas/r9a09g056-cpg.c
> > > > +++ b/drivers/clk/renesas/r9a09g056-cpg.c
> > >
> > > > @@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mo=
d_clks[] __initconst =3D {
> > > >                                                 BUS_MSTOP(3, BIT(4)=
)),
> > > >         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV=
2, 15, 2, 7, 18,
> > > >                                                 BUS_MSTOP(3, BIT(4)=
)),
> > > > +       DEF_MOD("adc_0_pclk",                   CLK_PLLCM33_ADC_PCL=
K_DIV2, 16, 7, 8, 7,
> > > > +                                               BUS_MSTOP(3, BIT(9)=
)),
> > > > +       DEF_MOD("adc_0_adclk",                  CLK_PLLCM33_ADC_ADC=
LK_GEAR, 16, 8, 8, 8,
> > > > +                                               BUS_MSTOP(3, BIT(9)=
)),
> > Shall I also rename this adc_0 to adc_?
>
> OK, let's match the docs.
>
Ack.

> >
> > > >         DEF_MOD("tsu_0_pclk",                   CLK_QEXTAL, 16, 9, =
8, 9,
> > > >                                                 BUS_MSTOP(5, BIT(2)=
)),
> > > >         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10,=
 8, 10,
> > > > @@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_reset=
s[] __initconst =3D {
> > > >         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
> > > >         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
> > > >         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> > > > +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
> > ADC_0/1/2_ADRST_N?
> >
and this I'll keep it as is (ADC_ADRST_N)

> > > >         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
> > > >         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> > > >  };
> > >
> > > The lists of clock and reset signals (tables 4.4-2 and 4.4-3) claim
> > > there are 3 sets of clocks and resets, one for each ADC instance,
> > > but this does not seem to be reflected in the register bits?
> > >
> > The clock tree in r01uh1072ej0130-rzv2n (additional document).pdf
> > shows single clock is shared by all the three instances.
>
> I take your word on that (I only have the additional doc for RZ/V2H).
>
This has been tested on the V2N EVK connector J3.

Cheers,
Prabhakar
