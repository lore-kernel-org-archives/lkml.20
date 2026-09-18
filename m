Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CC742885A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764835; cv=pass; b=gdYkntXOic/QQabTj7OXXFj0tt71XKeCr5qXZQVf/REshHXXgcSq3Q5A5rKraJGcch7BUgt9IGxQenbBdjrDgW3N1ifTEfAaGVzddYgpOMufqvBUKFl5czOxQiyVSKBPxJeQbwh9DE+otTXf9EkIgYPgf1V5rNVA9bgJhlQ8We4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764835; c=relaxed/simple;
	bh=luig+1o1M/fsF9vaNIsARo6CqC/xBHmV9/YvD0slYb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4X1P6atVBNCvgwLq23YclEyvW9Xgl3Xcc98UKCoXcYlwBUDeSPt8zC1WwyWtTGOe3ZNZGpdRokIANqyrc0rLnvLVu3KnxHQdxrPkRlN0AO+VisGa/XLFJJMN3XxMxTsn1SlKjIfZEwwqSSw5BwDNyPTDLlvnmPaNhngiWj5plA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXDO4rBQ; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXDO4rBQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48435bcf9d9so135994f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789764832; cv=none;
        d=google.com; s=arc-20260327;
        b=YZMnnK7mNPZzdEnBN5Mp7qmt0DaGyAhRXNEcdbvw07zeFGuedAHcE1fmqbXxs7QoEf
         Jy9xDJPkc+lFZl2XiVeVyKGYQDUANeSXUkVc+kqOZEHR0uCn/X6wxorvahph47Q/lVZh
         n0Zncc9LoI/3vO963cE26UCry0NuwJUbfSXzBF5/u03gUb6nLiWtc/pgVv3TMJRnVYyA
         oMYczq8pC+tO4oZUxtv6ZuG2dkMrJR9dP8pizRXWEcCssbKwP4PqbG3pE6wJXgv31BPi
         mFd3cHhk6zlD5/u0tMtbAjg60E4C0t4kPN9uMMxyJtCUB+fxLigoAaAnaWcR7PVtxTZ3
         EOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sgTcRorf9vWGoUo+DaV05plknDxMZzVIVIvRR476748=;
        fh=pGXFNvCr9Rnlw8g4MvNk/8+hcGJ9g7VU/NWqAojJ+W4=;
        b=e+1P8hbI0hD2aBYNX9A1l8+07WouGZqV6GtX6ncvnoBZTXxHiwYE9/JgGPChwKTBYk
         aWe26vv1xQGp9ftzF4eb4+Cr2a5gkunecwPCeSXAgZFi/gg/72XZ7Kb5G01TBP0tNXw4
         Q6Efn/81N8OVaPZxKbCR4yl2NvDFmYIz5X/6fiQgR3Yhdx3yzJlTWDlBP6kUO6EZVZI+
         HBzlVx4zfcDJWqW7m39qsV9RhI3W6OFSCRiGNVNW+pElwkKte27dInSoNtd+y+htoCeV
         n8LBrR4/Tv881kGwQn/yk8TmctW8OQKW95mdPDYSlMGUvUf/ucD5sxk6CeovKRH3SS6I
         oMmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789764832; x=1790369632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sgTcRorf9vWGoUo+DaV05plknDxMZzVIVIvRR476748=;
        b=PXDO4rBQJMr9cbk6hImuvWv/9Bq/nxAly5i0+QGRDqJMYpeAwlAvdZeggOh7lkoorw
         WLOzWcA74qaGedulevhxtCesVFQfQsITl6cHP+Y+9ZVu8I/R5qz+xAOmHAXWnV0MRuEg
         cyxHUmrI74CbWUoewOJvs0bA4sK9nAgpBy7kEkk1AVqGBlFYuDh8RXMDeiWD980J7j3R
         4bp7Xt1gVl/0kbnOEDa581zVADfg77W9vSgSRvWRPujqnNiDIYMQfCq/MAVdgH8YL0mX
         GBB5VMsW+YSCpjXdRLL0y+HFbVXaXBtxV6AC+tpU5XvyZM235b/x92GLifwxc9W8JYUW
         Iy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789764832; x=1790369632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgTcRorf9vWGoUo+DaV05plknDxMZzVIVIvRR476748=;
        b=gW4h9moG9ORRgWkcZHnWeg+UNNNnQbkzQ1xV3ZzubU0WJgMJ6aouu9+ujyZ1JsdtAn
         wR8aOO2w+YpAZ+5xm6T55pLhdy7smqzx53qC0lVLNGTktbiIZFYzswEOgUnBYvagQbaz
         +5OPp3iLFA9PhYR2jnIwPcEvY6NQRM0Ee2ePFOs5XVVuWDFTt+L8nmId/S/skBC73uM6
         f9jlb/kDEeyerx2P/D1qEMYF2yaRSIoDGYc9kw79dk3fPt4PWJrND3erypekIDmV2JK5
         n8wN2QW2WcfvZFe/63PPAn34PVzjEVc6izWG0ikJrWWwntaTNFdSbW0qmSsKsuhwNYQZ
         ET8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxor+jdBquMEuX2xld2WYg3S39i9+yYL4wTN+oWf+va3b8yt+HvIApphVdlINEBub9m0gvhatYqhl6OKQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++myq8HF3NginFpaRuFxNU3QBXT++k3y33ZBQ/+2sFGAcyPaa5cg
	JHfTUR3vWnAFhj5O6Lz12RMxgHrtJAtART/16/bfOcLLz/9MkY3bisXy96TtkVhBM4QErX30wZt
	DyiFq9KKCoumhnQjmvLlH+2LcWN5tUm/PUM6U
X-Gm-Gg: AYBFou0t+kpUy/zLoatsmDEPVeJhjQ8bDoT7pib5N+xrIQrBTN6KBElKHjF15e7U1MX
	BoRmwjX3f+hg/bIfZvgNGV89PPEM2xhG0IwfNwsDxv7yeTYNZP8HywDRq1cDn2JnNCBAWDrmavP
	YbaLvGxr6o1pSUJoORfJeh4P1/m/w/GB5W3onsAfgd80hI3bK228M3Dg+4kspXfCq0lCKl/UgMX
	UIvkpS86jHzGGslsqgZiqrAntK5MvXdW6dbWTFIL2LLlHW6XxAzPu+m8a5jOKUbt+s5uXVsJYDB
	q6Pn1RKAJL9lvObjw6iwYuICEEaMFGcsxBuMGd4FzHC2F97Tys+9OLMmuCafXlqR76aLSDbDhRH
	mY8/GUWinLHitfYx0/jK7S98=
X-Received: by 2002:a17:907:d02:b0:c25:3ccf:bd9c with SMTP id
 a640c23a62f3a-c2a1a8e09e8mr331776566b.2.1789764477295; Fri, 18 Sep 2026
 13:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-ti-dra7-omap-sham-fix-v2-0-4eadb60081e5@gmail.com>
 <20260916-ti-dra7-omap-sham-fix-v2-2-4eadb60081e5@gmail.com> <20260918144224.4dfb8515@kemnade.info>
In-Reply-To: <20260918144224.4dfb8515@kemnade.info>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 19 Sep 2026 02:17:44 +0530
X-Gm-Features: AcwNN1WKvA-fdN2xNZdCXGZd1cxpuLrv71RZ7MqA3wlpHyScvRfY20wc8pzPN-Q
Message-ID: <CAOWyW_5GU__FE25POrjKH=CmOHaeBRJPw4xS2cdodePm3LydhA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: ti: omap: dra7: Remove clocks from
 crypto nodes
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 6:12=E2=80=AFPM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Wed, 16 Sep 2026 02:29:39 +0530
> Bhargav Joshi <j.bhargav.u@gmail.com> wrote:
>
> > The omap-sham, omap4-des and omap2-aes crypto drivers do not use
> > "clocks" and "clock-names" properties. Clock management is handled by
> > the ti-sysc interconnect parent wrapper. The dt-bindings for
> > ti,omap-sham and ti,omap-aes don't define these clock properties. Havin=
g
> > them in the child nodes causes dtbs_check warnings.
> >
> > Remove the "clocks" and "clock-names" properties from the sham, des and
> > aes nodes.
> >
> > Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
>
> I was a bit too fast here, clocks here are different from what is
> used in the ti-sysc block. So some more thought and argumenting is needed=
.
Clocking is handled by ti-sysc parent block, furthermore other dtsi
such as omap5,
omap4, am4372 which uses the same hardware doesn't define any clock in
the child node.
parent block defines a clock with clock-name: fck
clocks =3D <&l4sec_clkctrl DRA7_L4SEC_AES2_CLKCTRL 0>;
clock-names =3D "fck";
and child main part as
clocks =3D <&l3_iclk_div>;
clock-names =3D "fck";
If child node needs this separate clock  in child node then binding
for aes and sham needs
to be updated to allow clocks and clock-names leaving des binding as it is.

Best Regards,
Bhargav
>
> Regards,
> Andreas
>
> > ---
> >  arch/arm/boot/dts/ti/omap/dra7-l4.dtsi | 2 --
> >  arch/arm/boot/dts/ti/omap/dra7.dtsi    | 8 --------
> >  2 files changed, 10 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts=
/ti/omap/dra7-l4.dtsi
> > index a595745afe59..bca035fd7e62 100644
> > --- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
> > @@ -2086,8 +2086,6 @@ des: des@0 {
> >                               interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL=
_HIGH>;
> >                               dmas =3D <&sdma_xbar 117>, <&sdma_xbar 11=
6>;
> >                               dma-names =3D "tx", "rx";
> > -                             clocks =3D <&l3_iclk_div>;
> > -                             clock-names =3D "fck";
> >                       };
> >               };
> >
> > diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti=
/omap/dra7.dtsi
> > index 711ce4c31bb1..0784c6d9cbe4 100644
> > --- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
> > @@ -1012,8 +1012,6 @@ aes1: aes@0 {
> >                               interrupts =3D <GIC_SPI 80 IRQ_TYPE_LEVEL=
_HIGH>;
> >                               dmas =3D <&edma_xbar 111 0>, <&edma_xbar =
110 0>;
> >                               dma-names =3D "tx", "rx";
> > -                             clocks =3D <&l3_iclk_div>;
> > -                             clock-names =3D "fck";
> >                       };
> >               };
> >
> > @@ -1043,8 +1041,6 @@ aes2: aes@0 {
> >                               interrupts =3D <GIC_SPI 59 IRQ_TYPE_LEVEL=
_HIGH>;
> >                               dmas =3D <&edma_xbar 114 0>, <&edma_xbar =
113 0>;
> >                               dma-names =3D "tx", "rx";
> > -                             clocks =3D <&l3_iclk_div>;
> > -                             clock-names =3D "fck";
> >                       };
> >               };
> >
> > @@ -1073,8 +1069,6 @@ sham1: sham@0 {
> >                               interrupts =3D <GIC_SPI 46 IRQ_TYPE_LEVEL=
_HIGH>;
> >                               dmas =3D <&edma_xbar 119 0>;
> >                               dma-names =3D "rx";
> > -                             clocks =3D <&l3_iclk_div>;
> > -                             clock-names =3D "fck";
> >                       };
> >               };
> >
> > @@ -1103,8 +1097,6 @@ sham2: sham@0 {
> >                               interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVE=
L_HIGH>;
> >                               dmas =3D <&edma_xbar 165 0>;
> >                               dma-names =3D "rx";
> > -                             clocks =3D <&l3_iclk_div>;
> > -                             clock-names =3D "fck";
> >                       };
> >               };
> >
> >
>
