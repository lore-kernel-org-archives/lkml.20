Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793787336;
	b=VZ/PeEfqgkmNWxiYjTd0Gw83KFcv7ZvYklFemlndiTmiYibOh95r+GE9RBcUOrEKeHRG
	 MNnIJ5kxP4M4F/itL8l323zYtuj484r5WZa0JTHUX7cuU/obg7A1CUzGk3iVxleHgroY3
	 iqvfcjWWveZGYEhbPW1GnU/Dr2hV4M6EMgUTC2sstVCXA8rX4zO+WlfzpRW/NZePmMkXf
	 dxVF9CX52cJjEg9zOLa6wZ3asBBHjN8XUbG3iU7N19KM9ISsIqZTExAdxndzzqk1txGnZ
	 VaXaS+H346T/wOeYpHBRJKTJg2qbigW/efM5SS+5KaQYJKgf0yEEwmnd9e/y7Uxz21g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=GeAVtba64Qwv71o9CiCo+TFgxn75Fuo5tCC+2rZXz+U=;
	b=fc4KZVYOrQMw6qpGJRieuS2apXZDQDqdxin3vp2Rw0GCE/Efo51ljsR9Bf5PPf6hj8du
	 LAPz3vWRi064hEZgqXgBmPYfo19NOZowBRepa6NomnTERPJYZ+nbDGPG7C3/PiGYxWuqz
	 XtLBjDW7EG3KRvTvsmGdhMGhSRcRJlhLb9VllkLHiApdYYCsENZInVqWUynBd/jTMtmXC
	 gwc9k1DJ59B/vQ/9vY7CabH3uV/y5YpPs2bC1Jv8KdLXGcUKUddtPiKxU3VzIeb/aVReP
	 p5GKlwXxqBrSxQReD4i3RrjM7UTVj/6+e6z7/lt+5ZcvzFaCEiPmoaM8bqNh8FsbXYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CsW3eM3q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64C5606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D64C5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CsW3eM3q
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67921b515a7so504610d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:15:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793787335; cv=none;
        d=google.com; s=arc-20260327;
        b=DCHMfXG0L3aW2Yr2tzttR+Cv6FxRr92drZeNdb02XxW3Id2H9cU9kiS37H2XuFZcoW
         SZrHqg4I+683nmGXDrkZLsnYfeYE3CokwQxu7cmXXNv5FIO4NBByUagmySLruozNr49s
         /XR3fdgF4h6MFVapnQUIh1I/DXsqOQlaweeyISBCrcUSItfjetaMkj9nrf1d0/uAfFXq
         5Wnchie2eQjLbRNgx0HlvYhOXEK3Bm4E3l44wt5aPi97lB4+afuqqyoC6c1hT3YI35gn
         zm3ucEsVbN3RaMiHT30vSKGoDIiUQ0/YJI4G/YubqX6CTkiaUQ3vWcek0zaDLdkegq6A
         iF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GeAVtba64Qwv71o9CiCo+TFgxn75Fuo5tCC+2rZXz+U=;
        fh=boMairG18kc6Xv3vo+/wzJBaZpJhfyumrAMRR0R2HOI=;
        b=DgNHDaGYjB8sSdxg0ZopUoRrVLfF5zrOJDOHIskc429tK28WtGE1ED2UCARgoJWd/N
         bw5zL3/GfHyM9nbkYGTm86DoF+jG1nureAnQ4lT6T1qnaLR31wUNUul7ZDLM1WtvLodh
         Odmzn/OWvqs7qf1WNp9bDjSkE83YfIUVILrp45Osg1hZ1vSm7norlinz7//3RDiBH6az
         RxcnTCdKR2CPAkbtQegf4nHpn2WwgmKnK/SxzzYhH3R5tLdT+pa6NiRstqm2qGVRQoCH
         /kPd4Awoc4WauOo/cUmJmv4xcVkKFG5kPXJxkwfreA2As/H86HLoU5g+d2gHTSDhN2n4
         EDVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793787335; x=1794392135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GeAVtba64Qwv71o9CiCo+TFgxn75Fuo5tCC+2rZXz+U=;
        b=CsW3eM3q+zrDVPeiuScolojFCOCYBWgyo4clxbjKxraJ46mUtejaySprZYxuQFfDiK
         BWIHUXQxMEXycsc0m29HMmGfjhzeSwHbsZ9ul0adZrdff4Jua8v/NQ+ILnzPDu0hgAuA
         oVpQR+rgVMvln+aBlcXumRF6WMOEyHlEtHmG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787335; x=1794392135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GeAVtba64Qwv71o9CiCo+TFgxn75Fuo5tCC+2rZXz+U=;
        b=vURZug+O6bsuszD+H1n0j4xFNmpj/8tavRhYt+4yeckSgylLWeF0PDE9Ii7am2Y3pW
         TAQep1U34I9Ds/53QdWXySWFdwizFhgvF2T2QftHnV9NUB+d/0o2UWAEzWdKJDt4Rdk3
         P7ZRv0PY0JV5YnzHmF4C2UfEAbdVCH2bDPL7/rdduhv8bNDwYYQyVEZMFe3IY/x9wbNj
         /9jmGho8+xAjcs9evvawx2xRQy/fjpto47HYMInuEo7L+08ok3NdXTrASqurdWA4gggF
         wgmDhQK60qrx2hVJFSCVtOpGh6mra51biwDJ4D5YJ/CxYo3vf9kbEs7JnqNdB7itUtsN
         Jp3Q==
X-Gm-Message-State: APuU4Z+ez4UFqod9TsxPR7O8ICd6fMj3Uop48BndI9ICxhxNiWxYyZxZ
	GJd/ZXUDEkaesuQTn/nr+gz13dqxv5tJPC4vA6jMvwl1zkXzptx9o/iarLEfc/2pdwBWwNOTigb
	xu4jxLjgB7f8WQU7gacUIfRg/pFcqWQmnpkRGACuBEA==
X-Gm-Gg: AYBFou2e6ti+5FH7LrV1AUjjwjB0QdjtA6POyBgH6VAEgF5OV4IqYCIOCJWFpkTvFac
	pa+PSZEv3iw60NPsz9dvgE0LDe7Ty5Rnn6S+xZYKaFUC9g5QOnxBcxymKHQJlIWDKuwjKy1Ypsv
	tQpoosWIR4rBaqNa6A7RIDG8ArejkSDBXrSGsBeWSMVJdIaIkUm22F6ov/JBJR0TzKQCHYdaFjP
	ZXP8L5JJHYtvu6dD/vsM19sS0hUhjMaMmitpXRxHIpR5WYn88aATYmO0l9H7tM2tEwRzIl4K770
	c4Q5llcVoia3FIAyXCKErDHyjPEccjJyLH+PngkTyA/zNKD3iylUUJv/V/Db/U9bL4HtFw2HJ74
	F/vYGsSgmbNaTmz/TTyjAkYaLq0hXU+BL0trH5SK3mPQflGmYUIH/um/tQNrbOH3aFdNe
X-Received: by 2002:a05:690e:408d:b0:679:8fa4:4661 with SMTP id
 956f58d0204a3-67ba508cacfmr13916977d50.82.1793787334695; Wed, 04 Nov 2026
 02:15:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
 <20261028074436.1958132-4-dario.binacchi@amarulasolutions.com> <179373624826.588706.3689544002135897133.b4-review@b4>
In-Reply-To: <179373624826.588706.3689544002135897133.b4-review@b4>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 4 Nov 2026 11:15:23 +0100
X-Gm-Features: AclHuK8nB_6aYSJgmHxc-dj0dbCRTwWxpOXswi7917sdDsYuWtlywfCGGeD2VAI
Message-ID: <CABGWkvqcOn5mvfe5G060ntDgzdr=kacDcEvo-e+Oyzs6F95Xzw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: ti: dpll: apply the spread spectrum
 configuration right away
To: Brian Masney <masneyb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	michael@amarulasolutions.com, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

Sorry for the noise, resending as plain text since my previous reply
was rejected by the mailing lists.

On Tue, Nov 3, 2026 at 9:04=E2=80=AFPM Brian Masney <masneyb@kernel.org> wr=
ote:
>
> Hi Dario,
>
> > The spread spectrum clocking (SSC) registers are only programmed by
> > set_rate(), which the clock core skips when the requested rate is
> > already the current one, e.g. when the bootloader has set it up.
> > As a result, the SSC configuration is not applied, as it was with the
> > vendor specific properties.
> >
> > Apply it from set_spread_spectrum() instead, reprogramming the DPLL
> > at its current rate.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> > Changes in v3:
> > - Skip reprogramming only if the configuration is already applied
> >   to the hardware
> >
> > Changes in v2:
> > - Check the DPLL lock state instead of its parent, as the reference
> >   and bypass clocks can be the same clock
> >
> >  drivers/clk/ti/dpll3xxx.c | 49 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 43 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
> > index 634fe0a1f9fd..d32d81a27bfe 100644
> > --- a/drivers/clk/ti/dpll3xxx.c
> > +++ b/drivers/clk/ti/dpll3xxx.c
> > @@ -690,17 +690,22 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw=
, unsigned long rate,
> >   * @hw: pointer to the clock to set the spread spectrum configuration =
for
> >   * @ss_conf: spread spectrum configuration
> >   *
> > - * Stores the spread spectrum clocking (SSC) configuration of the DPLL=
. The
> > - * configuration is programmed along with the DPLL multiplier and divi=
der
> > - * at the next rate change. The hardware supports center-spread and
> > - * down-spread only. Returns 0 on success, or a negative error value o=
n
> > - * failure.
> > + * Stores the spread spectrum clocking (SSC) configuration of the DPLL=
 and,
> > + * if the DPLL is locked, reprograms it at its current rate to apply i=
t.
> > + * Otherwise the configuration is applied at the next rate change. The
> > + * hardware supports center-spread and down-spread only. Returns 0 on
> > + * success, negative error value otherwise.
> >   */
> >  int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
> >                                          const struct clk_spread_spectr=
um *ss_conf)
> >  {
> >       struct clk_hw_omap *clk =3D to_clk_hw_omap(hw);
> >       struct dpll_data *dd =3D clk->dpll_data;
> > +     struct clk_spread_spectrum old_conf;
> > +     struct clk_rate_request req;
> > +     unsigned long rate;
> > +     int ret;
> > +     u32 ctrl;
> >
> >       if (!dd || !dd->ssc_enable_mask)
> >               return -EOPNOTSUPP;
> > @@ -718,9 +723,41 @@ int omap3_noncore_dpll_set_spread_spectrum(struct =
clk_hw *hw,
> >               return -EINVAL;
> >       }
> >
> > +     ctrl =3D ti_clk_ll_ops->clk_readl(&dd->control_reg);
> > +
> > +     /* Already applied */
> > +     if (!memcmp(ss_conf, &dd->ssc_conf, sizeof(*ss_conf)) &&
> > +         !!(ctrl & dd->ssc_enable_mask) =3D=3D (ss_conf->method !=3D C=
LK_SPREAD_NO))
>
> The =3D=3D on this last line has me a little confused right now. Should t=
his
> be an && instead?

The =3D=3D is intended. I agree it is not easy to read, so in v4 I will
split the check into the disabled and enabled cases.

Thanks and regards,
Dario

>
> Brian
>
> --
> Brian Masney <masneyb@kernel.org>



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
