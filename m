Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BBA4779A1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327660; cv=none; b=VcJ9XnNcJ+w+WO7EWT13g8sl/QC1uBfZV1KQqs9UoPpE2fApb6y37FFm9FeGkmakCy7VRboW0AvCFXvmnflJgAfiOdtxrLY8rFHSwXPd68hTY12HcMkizoYNWlD5YNvh/PigiGcN8gS8egZnsfVqPVGpsfrZcn2w95Pe1uiRZBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327660; c=relaxed/simple;
	bh=VQgjHcUGv3AS+aRshySRXB9Na6W07JFD8/rafiGks80=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dzi8U3DReN6PUXHhtKwmnFlL8Fw8inqnOI17dI43w4uyBfHHBo3KOLlLaQrkAlLN33XtXaQtHJ1AAoMWPIQKYlJR1Y6sKV6r1NJ3DB8/iWsDI8efjtt2EXiOBjjyiyR2MsI3GcgLJHjiL0ii964vtjHt5mYDnG/Wt+HUIW1tcu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=h5GLm2dN; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="h5GLm2dN"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so390117f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790327657; x=1790932457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUy9AG7lIgjavOAkd4pUReRQm+p1laq2n2IXc5r/9Fk=;
        b=h5GLm2dN0wA9GvipNGEoUGMf9pENNFcm+GMuT6HhQdqMzvy1qdx1O+1LjaPNB5Ipt0
         siYbLHYKRYRSNa+ZTfnN/I5yeVCRkFlVgQ0vyY6ryj2NrQBqvjW8IMJ+2WdyOGwM+4Es
         v9C2wQVzu2RmyNeHwFgVuXiKaVucM9ECvvYOYxzztsbUr5sANVLDQmH//vMmLPBiWs9b
         2s8ivlCJYWgHSXy49RmiGDJweIQYgt0Mxvpawf2+BOn6Iwd5lX6OKCwEb3JmSDFSE9ji
         OiNcD4HIO39xFqr1hkcoC2m/aBWbNbFt+OqB4jZWa/zE7o5d+SqlxECONmFOZLDCmiDq
         b1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327657; x=1790932457;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUy9AG7lIgjavOAkd4pUReRQm+p1laq2n2IXc5r/9Fk=;
        b=V/p56OcPrDsDauFOoqpSFQhfjwq3dhop7hnF2KXtsnlyPnW+RMyPpLxBQJitRHzHZV
         aPxMcDLxg5p5s5WBYhLbjviGM+fsgSbtRoRxGwXaph3Dq3Pubfz9AFKFfc24A/NEbF5h
         zGqwOHB060UPlXrN1m+lW+yMuwO3Vch3QxbUCWAhk0xhWwDg1GH4Xnb+C2xVWYUfjV+R
         SHui27r/8ZpeogEcq42oA999GoSlEr88L6WXOCL1Lpv/B4tLJX6MhBSfIkyKWw07LWgX
         BBso7KyOdlyAc0/smBj2KvqJWBBdN3hE1Oi1DHaR+OwI9A/M5NIapGbu+Leh7jRgPuoe
         BBMA==
X-Forwarded-Encrypted: i=1; AKwUvByjyvVkip5bNOqW2au/EkvtyA6a/UOxh9qiLQmWmQ7Hi7LMRmzTIFx3rsglK0aLJ7QyHatpA33Msz6i4cc=@vger.kernel.org
X-Gm-Message-State: AFuF++nqiTiJWB7lYcleX1cLGcwd+ANONoL1ihWJrosquaJLXQC/PUXy
	sebC7rpINpuAHeGUeIptBBdV7rDloZ3RmjNj1rWpKxQtuKsf+cylg7dndp4mOMup5VucWYRgFLZ
	0Guyv
X-Gm-Gg: AYBFou00Aas2EpL/AIIBNDJphbYA5b8sPyqThhNTf3VXMl1NCF/8dNrPKQMnQY00FH7
	5RrlL+g2NVBRtx4KwycdrKI8YS4L1NpOARKL5LSd5WvSsFmj6oEcGGmJxNC+hYks+X488kh5Eac
	qPpz9dgoMZExSezpQpMWKtH/Tcwbh5odlM60qjBpmEdh/XAyBZrcmw3EPjDnmLpTL8YDTFcxI/D
	3A+QI1lSNlKCEaQd6hd9V1L6YkEFzfTBFaFdbFuZn8GsffTMBswKVDHT1D+LRU13hfd9yFYw+Lv
	ClhfcOp2xoJPYevKgl94Bqvc5HtQBvCbaGshH2QipADd2AGS9AyubTM7bdtqny0uzTvylqTNYTW
	rPRZu5vfdbEB8FrcHyW5xG8i3yiPQ0CzdbvqraxulN+8D044rASUUBO5QTq8LRoNaCT77kbPvUb
	PwFOGME1BOmjDG/sOh1ynCKd0NIz6rZA+9J3s9NE5iZCd/HTLdfzSpz8ufBtlOgy5kqjBYeb917
	dP8D1c+4ybsmOYiCc5r7zNcz8y+
X-Received: by 2002:a05:6000:18a3:b0:487:732:9964 with SMTP id ffacd0b85a97d-488716befa6mr10307474f8f.13.1790327656987;
        Fri, 25 Sep 2026 02:14:16 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5295892f8f.9.2026.09.25.02.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:14:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "sboyd@kernel.org" <sboyd@kernel.org>, "bmasney+clk@redhat.com"
 <bmasney+clk@redhat.com>, "jbrunet+clk@baylibre.com"
 <jbrunet+clk@baylibre.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
 "afaerber@suse.com"
 <afaerber@suse.com>, =?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?=
 <jyanchou@realtek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>, =?utf-8?B?SmFtZXMgVGFpIFvmiLQ=?=
 =?utf-8?B?5b+X5bOwXQ==?=
 <james.tai@realtek.com>, =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
 <cy.huang@realtek.com>, =?utf-8?Q?Stanley_Chang=5B=E6=98=8C=E8=82=B2?=
 =?utf-8?Q?=E5=BE=B7=5D?= <stanley_chang@realtek.com>, Brian Masney
 <bmasney@redhat.com>
Subject: RE: [PATCH v14 09/11] clk: realtek: Add RTD1625-CRT clock
 controller driver
In-Reply-To: <b9d5a1a82df34aadaee2390af871f7c8@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-10-eleanor.lin@realtek.com>
 <178947735404.448573.10061486937030065064.b4-reply@b4>
 <b9d5a1a82df34aadaee2390af871f7c8@realtek.com>
Date: Fri, 25 Sep 2026 11:14:15 +0200
Message-ID: <1jjyo98zh4.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 23 sept. 2026 at 05:43, Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=9B] <=
eleanor.lin@realtek.com> wrote:

> Hi Jerome,
>
>> > +
>> > +static const char * const clk_gpu_parents[] =3D {"pll_gpu", "clk_sys"=
};
>> > +static RTK_CLK_REGMAP_MUX(clk_gpu, clk_gpu_parents,
>> CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>> > +                       0x28, 12, 0x1); static const char * const
>> > +clk_ve_parents[] =3D {"pll_vo", "clk_sysh", "pll_ve1", "pll_ve2"};
>> > +static RTK_CLK_REGMAP_MUX(clk_ve1, clk_ve_parents,
>> CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>> > +                       0x4c, 0, 0x3); static
>> > +RTK_CLK_REGMAP_MUX(clk_ve2, clk_ve_parents, CLK_SET_RATE_PARENT |
>> CLK_SET_RATE_NO_REPARENT,
>> > +                       0x4c, 3, 0x3); static
>> > +RTK_CLK_REGMAP_MUX(clk_ve4, clk_ve_parents, CLK_SET_RATE_PARENT |
>> CLK_SET_RATE_NO_REPARENT,
>> > +                       0x4c, 6, 0x3); static
>> > +RTK_CLK_REGMAP_GATE_NO_PARENT(clk_en_misc, CLK_IS_CRITICAL, 0x50,
>> 0,
>> > +1); clk_en_pcie0, 0, 0x50, 2,
>> > +1); clk_en_gspi, 0, 0x50, 6, 1);
>> > +clk_en_iso_misc, 0, 0x50, 10,
>> > +1); clk_en_sds, 0, 0x50, 12, 1);
>> > +clk_en_hdmi, 0, 0x50, 14, 1);
>>=20
>> This is a lot of clock with no parents which is a bit suspicious especia=
lly for
>> gates.
>> What is really feeding those ?
>>=20
>
> In v15, we will do our best to reduce the number of gate clocks without a=
 parent.
>
> However, after discussing with our colleague, we confirmed that for some =
of
> these NO_PARENT gate clocks, their actual upstream clocks (like PLLs and
> Muxes) are located in separate, independent hardware subsystems. The regi=
sters
> controlling those upstream clocks are physically inaccessible from the Li=
nux
> CPU domain.

Control and input are different things. It feels like your DT (binding)
description is not complete as it stands which will eventually be a problem.

A clock with no input is something that does generate the clock by
itself, like an osciallator. Pretending it has no parent because you
don't know how describe it yet is wrong.

>
> Best Regards,
> Yu-Chun

--=20
Jerome
