Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794743666;
	b=plPR8tQ7B9lB259E7CXhzs+B3AEUn+ljHXREdv+nsbCWB2sbUsg7h0A7PKkZ2++0NnSF
	 noUdd9xGnCXcZfrrMNts6GFp9pthEbNBkpOOL79y/UODAYHIUnyZx1NXRQvSDUmrA+7iF
	 Qu1rLvIcho9knJ5eWRDHvHyq2MEYQTqEJsQ21fPpfD1G+fmaW3SIYxzMInvQUsDYCzgKj
	 sg1HMHpov8RUzDIlPxMO82z9nystnSWouF5UgOijMy9QBXDZpVr43GzbJtv5wX6BoXmRY
	 OHprg0S78fIEWmb3cOPITlCcKAXFby5mt3nVZcbAniuWa5z9O6C57ZCj+JzL2Hiv1/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
	b=XyO/jUutSo7zhUw7Lh4IR2cv7FFjYeEl51FPJfvJ+xpiD6O/l3FXlmZTHhRHJZcsPYfN
	 RwsEpIHUyem9KuBrAxuRYpKvm0gzHGoB+6CmCJD5E7u/TAjLa/HEOp1WROIWnj8F2hoav
	 SlM2bvcZJZHOz4nk08SYBT++0hcUXF974M6KpHVL+K4HsysP2XrOpEMwmATei+/W69U0Q
	 U05GAkFqXbkg5KMGFz7CHpyuxmMblDhvtFrEKQxzDGidalKtZhQTGyrAJ2TF8p/WbnfOr
	 SG/Kji61YBlPvN9xTYTT3KKVp8MOHrT1ALwhrKHGZAEt9eWuEmbahdohhMte44ToyaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTrBdHJA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82027606A33E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82027606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTrBdHJA
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so7235179eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794743666; cv=none;
        d=google.com; s=arc-20260327;
        b=oHdIySaY2KUIjw3UBXp42aUhXFmQnKqjH1n9c7NMh+p6aFnmivbOtpBsnOLA5P84d0
         ml7SrmK6BhZL7GIyv8XIQyNp4nNZEZOHAwZIdNxeyxBzEo0vLV+/NINJ25X3llSvAFIi
         3a2fmW5eMC2QBMUAFN9rGTGo8h3Bk6hVtZpp42OLrDjp5Yn73hq+u2cmgM/Pxe4MP5zS
         P6QjrjBnPmRk37v5A4hbRIWS3XPWCoat6DMVFaQHpfltQPjBb+TIgVwnASZRaQwyuJGq
         n+zaUPoIqPAsxyI/Oyah0evL4yLqx9Uv4IcXpAaW8Vz7TLFjV+WP2eWgufsguPye7O+b
         bhYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
        fh=oRdSyUIIsctwWftauVzeuZBAI0y2kUxlYNNbA6aBhho=;
        b=CbF1UjNO1OpxqFK1kXwIp2ECKrAqrECACkLH0zJGpoavPVASff/hNZtlsHSkdjLgjz
         qQzOgmqOQLXf34ZkTX8785vh6tK9pL91GkDnYlMgjeNcP2rJh3JlznN2q8WNh2QBRg8R
         U/MXXicy10vZIKEfMUfseTgKDueIKnP4ppIP1U4ee0dY5klpO3Q09eQFzTGAzossClNi
         Ujm0vorlIXXh1l1K7teM9F6eBVWzeXhtwqjWVy52Nky6JyyhvD2o6jLZKdkYsyIKmg6w
         sBUYMXuSCuu4VH2/gX+gux+Mrbqs6TwM3/mk90Jib/K62qkYznCc8phBBlQZk/Dow/U+
         YpYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743666; x=1795348466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
        b=tTrBdHJA3EGwmoZUxQrkbZUVwQBHP3AVn2M7YykEYWfQzkdbVbo06Dt08bxI7pef9n
         2s5g3e6ZjDuUdLINOz/16cOa2/67Qga+pbtgDTbQFxvCV7/wYiN2HvnbTM9v2KHTKMDn
         lXhXKg70kdruDYacOcw3OrnPpwE9x3GVwE1cjyM4WQkTet3p2ruaVtk4iuD0Vg5W+40t
         KP2+dPxFKTHI5qnPljVlljIzh7r9ZubPmJpP/c23PhesDSTedONJirXt706HnDYtn2+I
         UuhxxKVd9i/wMgFDGMAuCSok9bEAJUAMXM1t5xxd2EobaTIgnXd0jaE5l5G9qIC9Zxxb
         fIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743666; x=1795348466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqFc1dkJ0uhI3kAkP/ntcsru7jDDN6wYlX8lnvW2kQA=;
        b=Ll/ua0Gi7YSnQJMg8EkKF8q0NXErYE6/s0uIKnqn1E3OrPoxyDez4nN9CbS4rUr3me
         pX3h51H2D3zSk1tkBAbMGpzZiWJ+pFcCzRfa3M8cM04rVxN/UUhCaEJRdig09nM4vGSU
         hWJhoM1J9SkOZ+VStDnsvSqPvzElXH1/1C8/+WSiYbFEpXs9A0RpO8mF/J6vl1IFEqmR
         emzYLjcCyQ1PTFrEoeJt3q/hAeNTjUDGePpIwBKYd3Z34DpO7DREGe/I8iDZFfHh/lEB
         0TnmN1woy5hvEKmNJxVFGu3Ra6atulN9tIcMA0z+dO97tHhIurXOC4lftQNhvh6vcL25
         NPWA==
X-Forwarded-Encrypted: i=1; AL+hErFv0vkXf2exovBm8lBU9lIGwCmICBU1fYg4ixuYeIfmN++xIoQcyTY9/kkbk6ILFEanw+3BVXXw8chS54I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1x5VfrWhaoZP7nSx4AWI2W1Onw2o5FoSlTRnDn/cRIdnLL7/e
	buJrgSpZCK0ZJsK7wiChTlzi962iUs539tJlKaMXu+KN/NIaD6JoAtmLnvIR02s9s6ec6yFyzLA
	QK1laySPtxeAnyTx7Ad8WfnhfOipGMVw=
X-Gm-Gg: AYBFou0s1GUfBLXeYhsQ+rFeR6myoD/VCvc6PZYL+2rqKkpxVVqHza/jjK1QyVGnXPY
	uuY8jnEA2Q0/toYcianVjfawdFR6bkj360Xvy/9E+MZxKWlSx7k+R/VUvj8iv7aP2fXsOkIHZxM
	LQlnEQegVdgETBcMBjR598rmfCzMyeSsGTDow3EAJgWUSQ40FOdJiQc/pr+bReuicaEOmq4Iang
	MA+ScQEsjiA7Uy4H6TtpelHdpeVgssER/Tlo+4Czjkq49vcm+PRBBPc3xXGU25H+XPlQIBezY9q
	Z5zgUQSF/MW7geups4adh59MuxGavgP5d+qwAy5j034OdN2DQmO1oiKfDz/2u4mGhyCwmjJp9kr
	nxDuUrtPz0IigKXwrnEQ0W3PYt7ELhA+NeWM12kOFacWgaTDKLwgVq/PeAtMQBRP7h10T9q3B/W
	B6fYrxzh2G+DzB5BzwSQ4KgivuXv6yaw==
X-Received: by 2002:a05:7301:52c5:b0:36c:a281:1bc with SMTP id
 5a478bee46e88-37966a5ba74mr7873015eec.16.1794743665605; Sun, 15 Nov 2026
 03:54:25 -0800 (PST)
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
 <179474058020.3790083.7531788945003507652.b4-review@b4>
In-Reply-To: <179474058020.3790083.7531788945003507652.b4-review@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 15 Nov 2026 13:54:13 +0200
X-Gm-Features: AclHuK-EzmuYPh1U1Wrw3n2IgQZOy9QQQk19QQZyaFRGFCYZ5HQfcbePna83mwQ
Message-ID: <CAPVz0n154OuYUG2RObrdh4TmASjRhKF9svF0Z=4iCrPyyNt0pA@mail.gmail.com>
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

=D0=BD=D0=B4, 15 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
3 Jerome Brunet <jbrunet@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are requir=
ed
> > for the correct work of the CSI block. Add CSI pad A and pad B clock ga=
tes
> > with PLLD/PLLD2 parents, respectively.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-t=
egra114.c
> > index ec537efac692..08e425365469 100644
> > --- a/drivers/clk/tegra/clk-tegra114.c
> > +++ b/drivers/clk/tegra/clk-tegra114.c
> > @@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void=
 __iomem *clk_base,
> >                                            0, 82, periph_clk_enb_refcnt=
);
> >       clks[TEGRA114_CLK_DSIB] =3D clk;
> >
> > +     /* csia_pad */
> > +     clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE=
_PARENT,
> > +                             clk_base + PLLD_BASE, 26, 0, &pll_d_lock)=
;
> > +     clks[TEGRA114_CLK_CSIA_PAD] =3D clk;
> > +
> > +     /* csib_pad */
> > +     clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RAT=
E_PARENT,
> > +                             clk_base + PLLD2_BASE, 26, 0, &pll_d2_loc=
k);
> > +     clks[TEGRA114_CLK_CSIB_PAD] =3D clk;
> > +
>
> Change seems ok in itself, just a couple of things I'd like to check with=
 you.
>
> Seems both the CSI and DSI can use the PLL D and D2. Can they be used con=
currently ?
> If yes, are you sure you want to add CLK_SET_RATE_PARENT which the
> DSI counter part does not have ?
>

CSI pad clocks are used only by CSI and CSI does not change rate of
pad clocks. Saying "DSI counter part" would not be correct, DSI mux
switched DSI clock parent while csi pad clocks do not touch clock
layout of CSI nor DSI.

Same layout is used in Tegra30 and Tegra114 inherits it.

> Also the DSI get the PLL through a fixed factor 'out0' but not the CSI ? =
is it something
> you have checked ? it just seems a little odd.
>

Yes, out0 is a fixed div2 of DSI clocks and that is code reflection of
hardware. CSI pad clocks do not have this setup in the hardware.

> --
> Jerome
>
