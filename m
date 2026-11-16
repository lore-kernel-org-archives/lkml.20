Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794824642;
	b=TxLnJtUP4cJ6+bmctT/zxbP+Z+sR7jlY/jw815hf0wppUsn6X4iAr89H+qIaoXGW2pT+
	 /AiLJ4eyzOKSOmfT/CLVhyv3QHbzd0etlEt7vZmi8mys372ppyr5hRQDf9HEEWVwUCGcQ
	 fo+bqjLyH1RTv/xwvG0eA1CQ4d8c8RNodMofeMQkXrWnWoxUgA55u3gXIET+9trhvVQe3
	 z6kboboqmauZ4rsFGfd/+wQoOo6X8zR9OLoyHoku/0JtMytubowE5gGw3oEQA9hVkT5Hr
	 M5XUPtiLcrFsyH573K/ZoRL0wGaLK2GFbUlc2tEs5P2cMBQJV+WNgO3rdt3ayxo65zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
	b=ERPyfFMGZZAE5shYDwYfjQ95WFS+wjDIcGLTqgt/e6LHhfv6cJuo4P0HswcVymzEoAjR
	 KnrYOCh5co+vDMPjDHOEfuGKC8IJ4gUj8lYAFYKqEK378QcSzPq29mWWrNeQENAcjeuPU
	 UVjWhW6Hi8+buQzh7C6AFlTlMEWp+vIwY11Fm15X1YaoqnufB0KwUp1Bma8hxqFDKbBIW
	 8wzjo7tONat4tYdTB3YRORnOjGc0BwlZRk8GwYQi3bY3oVl5R8S940qMbZTt5YEdjy73d
	 wCaYRHY3KDvPcfaj84A25CZ7pG6BLuHeumiu5l3tjuL0O2/yetzWIQ564TCHlV6cGaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX435Zha;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8534F606A337
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8534F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZX435Zha
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so9323953eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:24:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794824642; cv=none;
        d=google.com; s=arc-20260327;
        b=MpERW/KHN2Yur8IjuiYA3bIuBZ+THs6uB9gTB6NO7L7r6cEeEai/BEfmUyBEzsAwkH
         TDpzty74CB1dlfDuCE6ZD5Ft6QUlkYd7Q//M35UfEW9nvNLVvj9vH7oxGc3CkNlaV2jL
         udEVY0Zu1ZSGNDkUDxEgC5IymNay0jrHnZqFhEBl0X6rW+VmToU0gMGFoeIsWVi6mMNh
         zptSll5u7EN7OGLZ1NEUKE+ZdMksEntPw57RvinUGRNIEH4ahfkjyEvw7jsMpFxFdEtX
         yGzyinjGbh4j+thTlkGisooVW4EiHG3RXIBtux3lJbN6Ejd34aFnFs3FpLqM+h87UrGQ
         NgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
        fh=Tblibxf3iBYrJnERFnpIVpQftwvkzddiP2FZpJ3QC8U=;
        b=ezxTBq9zsPBbNfz/bQ8DiCAerLTLUkiTaJlBSB/ivlCfKYt706iCIY6c1QUGt0yRre
         swycbyy4z2TcCTCjCiSS18eueQ42hoOS8jK2CvY1iZiwz0SVUBMidFX4/MpOzAIkR97Q
         1lR/BK7zfB6To1H62eIugQX1dS3cwbvjv+2I1yHP+/jkeY2MbJWRDTGbjuY9cg0onCCU
         FZrkswqEndsDNn3xLtIeju5v4N2qAAPWMUOgpHVZqY4siMe+o+Y0OyfyCLkRT1rkph71
         RlZ5UJbfnC6oMGjg78U3OZzUUTGZt9XjinOiR4AyV08v9G7anw4ZnyvMecgglK702haA
         blKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794824642; x=1795429442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
        b=ZX435ZhasskBrHhsjUgMP8cj896c1igrqorRzLaGT99+Rk0Gxy0oLjQgxiD+VMpKvH
         D4U/tJpsIbzYFrDIoGSW3/RDIYkG+0LbH1+2de59HTrHz6bH8aGzM0nu9Ry7YWcuqrQX
         jjFe3WyoteY5ZsEsJQclpDK/18FEkpjdJ/PgBADOljyIGLYUou7waKJYgwxlHtzQLAQQ
         gaOQMidMuDB/sBsRSiJN5PrLFAYv8GN9IL3MJGgEP+PWSlUy0COJMLIsK27tZtPdkOOQ
         aU2ELLzPlC+ajDK/grAFwSF0Bwf/yHKHGmDd4g5/1GIh/bDbZl2gpu9Jv9a4O3g8+sYV
         Gv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794824642; x=1795429442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbqGOOCkMK2aUyWlzLwbx028m+dzfMAfr1ojena/7dQ=;
        b=jlBmamHPZScWYmdKPDR4BrJy+V5j33gbr7n7gn/7ObifWRy6OUgZ/CyxqvQ2uAq3GB
         2iTii5jPHXvLyFxtoXhvdHNcnvpzy1j0osSo9c+6aOBRb5byzg9bN52C5Wfid+HvrdU8
         OgDem2n+a8Nf+WoGzBuTPCVcu1u8as7KrIMLoMSbVP4TYOXkbQY1jKFmo5L2exD9Luho
         RJpGJ2V1RlLJMsenIxM4ZTp+SYmGl4e5Zrs4PcLGG5vf0NXpnoI/UMvReQb3kFxs6R4k
         q52ujT7ck/GaPtXdSYQxAC+mZRb1kwteXVugpb33seaEG8SepH03IQkUBnWP1Z1YoGjg
         WSpA==
X-Forwarded-Encrypted: i=1; AL+hErHTKXtoE7Cm5tGSVsLKX85xup6YLawYtXvuKodTRaGFGrBdaJ6wVe6hoNftRncgQ9zigvecXbH+sEqqaQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GniNnvxttW3qK9NCzWOQnJCWQVOqpwurG1wZxhV/9xYisPjTu
	/qWv4MSQqMo2tROKjT/wbVrhwJb16qFOECD32nlPes6q2LyUlusPc14F4Yy87R4T6dpSgLydDWh
	NndOpZM5Ez98Bs8jjncc0D4T3PkS5hfc=
X-Gm-Gg: AYBFou3YnmafDFW5sezFKX4RS5oqVDhvdSYe4BhklaYO+B6D7oS9i/gyZhboMPZQCli
	qnh+Zq9CPlplLryTleY+SO0LDMXsOW7lrJOK6DmcswlanwspaE8SGNIXO7tbDL7uYr67ra7wwOK
	06g5YOyIeKJOsb2VCJZNxo8SIOvIYgVS6AjpyCE2iySL7wt80mzM/PxWuPf/h8vafo66mFxtPK/
	a4UpvHZgarnw9p+PyQRKGeSRX+yjuRbQPCJwHn6R7G6tnavhtbBbjfgYCVrw3jg6rQzqwzmg3Ow
	KwV1i5bjLhNxH4VLPikl/6zVOV7nIplcI5n/lFhLoPeN98fOhxAb1TzNY/xm+As2i4p+0EUVbyW
	moHjY47eRT9lVMBSoRdBngIJiFwrleYyAQX0cv8BKJZUCsJiDK/xmg0HzvVRFrKRedCgPXXfl6x
	cwxHLJHGfkL3IQJuxnL3WxUbXBybi/3A==
X-Received: by 2002:a05:7300:b0a5:b0:375:f846:5b50 with SMTP id
 5a478bee46e88-37967316379mr9974671eec.26.1794824641398; Mon, 16 Nov 2026
 02:24:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113145708.261530-1-clamor95@gmail.com> <20261113145708.261530-3-clamor95@gmail.com>
 <179474058020.3790083.7531788945003507652.b4-review@b4> <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
 <179478265643.13037.17097457582246933781.b4-reply@b4> <CAPVz0n21-_+G3cEVg98MwcYqhcaGi9nBa42YebNWiqUdo+vqjg@mail.gmail.com>
 <179482363653.13037.14387881069650442772.b4-reply@b4>
In-Reply-To: <179482363653.13037.14387881069650442772.b4-reply@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Nov 2026 12:23:50 +0200
X-Gm-Features: Aa3M54omU2sMa-s9Lr8odEO1dEUj9Cu5RuZQ3PyJtArCZqRb5bI6Ga-XTy7PHCQ
Message-ID: <CAPVz0n2OamOweoLJLBvyt2KD+Zuino1ViYTFsSjL3mTA2V3F1Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 16 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:0=
7 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2026-11-16 10:43 +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 16 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
00:44 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On 2026-11-15 13:54 +0200, Svyatoslav Ryhel wrote:
> > > > =D0=BD=D0=B4, 15 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 13:03 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that ar=
e required
> > > > > > for the correct work of the CSI block. Add CSI pad A and pad B =
clock gates
> > > > > > with PLLD/PLLD2 parents, respectively.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> > > > > >  1 file changed, 10 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/teg=
ra/clk-tegra114.c
> > > > > > index ec537efac692..08e425365469 100644
> > > > > > --- a/drivers/clk/tegra/clk-tegra114.c
> > > > > > +++ b/drivers/clk/tegra/clk-tegra114.c
> > > > > > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_i=
nit(void __iomem *clk_base,
> > > > > >                                            0, 82, periph_clk_en=
b_refcnt);
> > > > > >       clks[TEGRA114_CLK_DSIB] =3D clk;
> > > > > >
> > > > > > +     /* csia_pad */
> > > > > > +     clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_=
SET_RATE_PARENT,
> > > > > > +                             clk_base + PLLD_BASE, 26, 0, &pll=
_d_lock);
> > > > > > +     clks[TEGRA114_CLK_CSIA_PAD] =3D clk;
> > > > > > +
> > > > > > +     /* csib_pad */
> > > > > > +     clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK=
_SET_RATE_PARENT,
> > > > > > +                             clk_base + PLLD2_BASE, 26, 0, &pl=
l_d2_lock);
> > > > > > +     clks[TEGRA114_CLK_CSIB_PAD] =3D clk;
> > > > > > +
> > > > >
> > > > > Change seems ok in itself, just a couple of things I'd like to ch=
eck with you.
> > > > >
> > > > > Seems both the CSI and DSI can use the PLL D and D2. Can they be =
used concurrently ?
> > > > > If yes, are you sure you want to add CLK_SET_RATE_PARENT which th=
e
> > > > > DSI counter part does not have ?
> > > > >
> > > >
> > > > CSI pad clocks are used only by CSI and CSI does not change rate of
> > > > pad clocks. Saying "DSI counter part" would not be correct, DSI mux
> > > > switched DSI clock parent while csi pad clocks do not touch clock
> > > > layout of CSI nor DSI.
> > >
> > > Ok but they end up possibly using the same PLL from what I can see he=
re.
> > >
> > > So if the consumer of csiX_pad calls clk_set_rate() on it, while the =
DSI
> > > is using it, it won't go well. The rate of the underlying PLL may cha=
nge
> > > since you have set CLK_SET_RATE_PARENT. Taken alone, there is no prob=
lem
> > > with this but can't CSI and DSI be active at the same time ?
> > >
> >
> > The clk_set_rate() call for csi pad and csi cil clocks for dynamic
> > adjustments is not possible. These clocks are used only by CSI block
> > and among 6 clocks CSI uses it can change clock rate only for its own
> > clock (TEGRA114_CLK_CSI) PAD and CIL clocks must remain fixed  by CSI
> > design and are not touched by any other driver.
>
> This is not my point, and you are not really answering my question AFAICT=
.
>
> Right now you have 2 CSIs clock each linked to a PLL, with CLK_SET_RATE_P=
ARENT.
> So a call to clk_set_rate() may change the PLL rate.
>
> At the same time, I'm seeing 2 DSI clocks linked to the same PLL, without
> CLK_SET_RATE_PARENT, so those clock will use the PLL as it is.
>
> The difference in the model used is odd. If it needs to stay that way, it=
 requires
> an explanation. If adjustements "are not possible", then why set CLK_SET_=
RATE_PARENT ?
>
> If the PLL is fixed by design, then you should not set CLK_SET_RATE_PAREN=
T here,
> and possibly use assigned-rate to setup the PLL, as designed.
>

ok

> --
> Jerome
>
