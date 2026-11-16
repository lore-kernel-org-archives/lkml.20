Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794818607;
	b=UEEAO5Q3XlxVx3R34fyt9QY4uxTfVmcgTwjVrwmZ0AChilPQ8lOUMpUfDzoiAM2HjlOa
	 LqXdmqKXgMUocbJOQJ51HbI5hj/jm1L6dPW1NpztH1JWKsZ7qXxus3GJHKcITdXHocIZS
	 inl/oNcs3Z3GXbC/W1ER0eznDEWAS412Cxqma9/NhH1WzAdJLppDhPHU+1w5PCbdEYdBj
	 x+odHBvU/mFTnZDOTo/RMxE/mbhEP1YWlY1INQ3EZTloTPZ4FR39ySx+uWzUgfcDWhATY
	 QdSjQTahP4Cu/WOp+QCDZM0yqsWXN1Gc4sL6UYUKvk+bIw5Mj2fZQciL2+B+HmYcSQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
	b=zOh5Ne10eWsmOT20yW342Gi3dCFnzakfNW7ZNAQB7yEtqeoSxJSOl6gmsVpevrEgF/pJ
	 eiBFYCyOLN5CQmsgE8SOHrOSJw9/8wmDAzUjjUFml18GY5+7k48BaCktdvAeW6jwCRFM3
	 4HJbsfaFz+tv02zEVI0iiHB1GlI4CTqa5QUiXEl0DwoVfFnUM6Bt2UIDS+EIv3VivCyyU
	 fZvxlIfh5W2gzKyemDM4tQSLcuvBJ4oO33PERVK3hfAS+OxNgEXH6qz+BA6Ii+qVLnaxU
	 AQFbpzWRmSVyD3Hok8otyAJh5wTenVuir6SehBue++WWFe8jvj22h2Nppi0/qK/SmJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFoLXRey;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED464606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED464606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFoLXRey
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so8672583eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794818606; cv=none;
        d=google.com; s=arc-20260327;
        b=jqgs9MH+s2sv6jUp4I1MalKaek8W8/21a2PfiHr8RKGKnY57TpB8Lcmxd4BV2fjyEL
         6K8/bwdLSZew2E5uIqzpLbwrGPfYRFQ81wOsDyweWB2qQpYFDszPvUwtWsuO8MWen8fP
         8FnIWyVStCost7XiDx99p0BWWS0uzVSyExAMaUnBv1LQlPDF6NO4Hlzq72dB1N89lpO3
         kPrR+gLXIUkgUZ0i95w5rYvpm+Dv6Rpa7jfAHfFX5WrUeO4AJY+87dPq8yDucrmKTyDH
         Q61UOMUBrtPu3M1vskaecQelSpJkkCVh+Ep1vV3wTSIZ11XsXPihQuYfLsxJ+TlEqxj3
         1D8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
        fh=l/+sB91vQSEkjCnQhcFBcf277b5z1GHB+pEUST5aBG4=;
        b=fBXFwHz9pLFMNr53MYdVR3Px1HEKIUcS3ntcGmYSk8iY1+wcdXy2UTG2rWPQLiQ/km
         JYtJK0t85iu1idWQ4ykgC8rjGo4DbGlG79Kcbs4gluDe358JJtFmu4mw8rhdueT8V1bE
         NeWip6vMk5+CwBwsLA8BN8Ytrb8r1gwigUydk7eYhrj0YcBeyX5MP+QeBhOby8vqh34J
         eywmyNqzvuUmO+OKQJRFOx88gG2g+buPlLimVEQgo7XubnsGCT0TPHs97CEX5vOksbTg
         HitFVVPRtx0+OxfsYkhB4YMjW3E0XdIWbAFrlztHt5D86uL7kMPEKHhvXzPDOy3L3Cv1
         b+8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818606; x=1795423406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
        b=aFoLXReyupk43dXE0Bd8Ij6BK2NiknSHpzjU1u40qyGksAAyb1bLMBlYS0s6NFh1AY
         dPupndtPEV5CcQ8zlesWggleFHSp6R7olXSiJO/2jaHX6dNXjIL/Nctv8liWpvh4lo14
         8aKPlNa22PYGuYtosrzw7gWAVoaVV9tiAIydtZySFSBvKhuIWR2RZKnknmWx95H6ADSQ
         DDUwPCOZGSB9bbc4bNTzxEDs+Gmtb0YnMyaqE2WmqcTLu2vdEjquvLLrjkp21BNAJ0ek
         fAYPIAfEfLo0z3CcBiFhWbmJwgnSrNENJLZ0ieUXzsWh1NwQ2KgwqBnU/Vc/zfqSGHa2
         2NoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818606; x=1795423406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nY+h2b3wsrKb5mJ3LIlCYXVGjCOvqpxj3QbUvlrfjKE=;
        b=VndMDFVJV4/wGn8vYIUBFD+pN2lBBzgOaUm5hG/FIo6LTPZBvznhmfg+QJ4oY+cRPm
         Z/2nTxE1PRMnuwGo4k2ytQe5Io2xAp6qTELEen0gvBx/7fY1USUFwK+PZVu2EUhwpD31
         R9Lg/Gj+tMiP43XXmyQPh0knhTSobcz8j83mZix91AqbLuM4ugNa1TuobYDkW/n6GWcE
         mdIMyRqliCjjaFnZ12Zl27WCdalQCENKR/q+gaJjXIfL7BywuVzwo0i2bSR+htLgk0iA
         RGNE0hFm77hWQHhossmp36yFBpatkr4hY9n/CEPFOCeeNuUaCqoGVfOfFa+m7LxbQv6W
         36YQ==
X-Forwarded-Encrypted: i=1; AL+hErHyOuoVlKmMhO+dPmG7gV1ZELgEgK70K4Lbv82pn0+Xc0WxVrQVGHwQpv6/HxZiC4SEKCHyD8kMB+GaKZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jcz8uBDnpqs0XtsSO+VymCTmbKZk0xbn/o4Hgkwb9c6BUbZLz
	ltYSgBGipMXyAKJtOZKvh4+l6dP+YD/cZ5pEPnfV/QhT0iJg7scbp6lCpTpJQpQuSEOXsY2hNuu
	dbC5ZzRyav1D9/exPfwPrfcMRanz/DT0=
X-Gm-Gg: AZFdTZcPKvyF8UVx/B9boNWIPfnVZr4ls8pBlnGeCKMm6Mw4KKKlf+b05e5fkXQm0jn
	nxn8S7X+6Fz9p+CPvpqMWB3wt45OaJ8FMCCLdq7MgWO7RSI2uX3Z1qDPg6aRIGnJtfczR6Ao7DQ
	2PLyvLSwOMjKyM3oJdPCgW59qgZkEZjszmQG90Wt9PCgBvozmUi6WSZ4TyQ+Px1zWT8j7SS30n7
	DvwikM7R5lpLEXaGJbbbmCbvtVF3s0UBF+zGl8QBFNDk7NTGZtKq7i4Lvc7JaGpH4legby67mE7
	YyEyB0b/5E4LahHF9Q27dRl90+R1TfEn5YPAE98E0pV43jCgDAQHE5g94/e77JGxkPAMGMfHI1h
	23Og2yru3jSdwk3hHR96SucJu61LfQCHBMVUNoGPCmTZNxTMT/ci6hwu2qU2MlyNIBtTOfCf0Zp
	Oa7Tp5aBdF/Rg2edzuIr7IdLNsYT55K05Q4WIPhurv1c+Sw6DNUFU=
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id
 5a478bee46e88-37967314a08mr9190579eec.24.1794818606016; Mon, 16 Nov 2026
 00:43:26 -0800 (PST)
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
 <179478265643.13037.17097457582246933781.b4-reply@b4>
In-Reply-To: <179478265643.13037.17097457582246933781.b4-reply@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 16 Nov 2026 10:43:14 +0200
X-Gm-Features: Aa3M54pMEr9UjE1zw6W6dd5jtUGbWeQ0qW9zBZkFj9pK7Jh0wgW3qgyddXi81sY
Message-ID: <CAPVz0n21-_+G3cEVg98MwcYqhcaGi9nBa42YebNWiqUdo+vqjg@mail.gmail.com>
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

=D0=BF=D0=BD, 16 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:4=
4 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2026-11-15 13:54 +0200, Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 15 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
13:03 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are re=
quired
> > > > for the correct work of the CSI block. Add CSI pad A and pad B cloc=
k gates
> > > > with PLLD/PLLD2 parents, respectively.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/c=
lk-tegra114.c
> > > > index ec537efac692..08e425365469 100644
> > > > --- a/drivers/clk/tegra/clk-tegra114.c
> > > > +++ b/drivers/clk/tegra/clk-tegra114.c
> > > > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(=
void __iomem *clk_base,
> > > >                                            0, 82, periph_clk_enb_re=
fcnt);
> > > >       clks[TEGRA114_CLK_DSIB] =3D clk;
> > > >
> > > > +     /* csia_pad */
> > > > +     clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_=
RATE_PARENT,
> > > > +                             clk_base + PLLD_BASE, 26, 0, &pll_d_l=
ock);
> > > > +     clks[TEGRA114_CLK_CSIA_PAD] =3D clk;
> > > > +
> > > > +     /* csib_pad */
> > > > +     clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET=
_RATE_PARENT,
> > > > +                             clk_base + PLLD2_BASE, 26, 0, &pll_d2=
_lock);
> > > > +     clks[TEGRA114_CLK_CSIB_PAD] =3D clk;
> > > > +
> > >
> > > Change seems ok in itself, just a couple of things I'd like to check =
with you.
> > >
> > > Seems both the CSI and DSI can use the PLL D and D2. Can they be used=
 concurrently ?
> > > If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
> > > DSI counter part does not have ?
> > >
> >
> > CSI pad clocks are used only by CSI and CSI does not change rate of
> > pad clocks. Saying "DSI counter part" would not be correct, DSI mux
> > switched DSI clock parent while csi pad clocks do not touch clock
> > layout of CSI nor DSI.
>
> Ok but they end up possibly using the same PLL from what I can see here.
>
> So if the consumer of csiX_pad calls clk_set_rate() on it, while the DSI
> is using it, it won't go well. The rate of the underlying PLL may change
> since you have set CLK_SET_RATE_PARENT. Taken alone, there is no problem
> with this but can't CSI and DSI be active at the same time ?
>

The clk_set_rate() call for csi pad and csi cil clocks for dynamic
adjustments is not possible. These clocks are used only by CSI block
and among 6 clocks CSI uses it can change clock rate only for its own
clock (TEGRA114_CLK_CSI) PAD and CIL clocks must remain fixed  by CSI
design and are not touched by any other driver.

This layout is used by Tegra30 for quite some time and I did not
observe any regressions of DSI/CSI caused by this configuration.

> >
> > Same layout is used in Tegra30 and Tegra114 inherits it.
> >
> > > Also the DSI get the PLL through a fixed factor 'out0' but not the CS=
I ? is it something
> > > you have checked ? it just seems a little odd.
> > >
> >
> > Yes, out0 is a fixed div2 of DSI clocks and that is code reflection of
> > hardware. CSI pad clocks do not have this setup in the hardware.
> >
>
> Ok
>
> --
> Jerome
>
