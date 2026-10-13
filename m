Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041B71A7264
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894827; cv=pass; b=aIKAh7u7BhJgC3pdoecDZUA2PWOZFK7Ur8I2pn5nQ90XJVoV0ECt2zLWk7Dz9lnQNRGWIdxN7xkzJ+u4U5SguKQAA5eAXPDTCKVlk7wje5bmNxVaXxCCt/RfTjZ71VCGYrGCEZgNpozGIOXGMGWCnNz6OKnBL9ru3vF2YZ5c6w4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894827; c=relaxed/simple;
	bh=malNc4Z8Q/D3ZpIXlgQO3mA291yVDUA9+s/OmI4RFs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNiEY+XNQm5VsEuoPKMCLnV4fkZLYLTLeYVH7anWHLqZmg3n41FRuMLgpVGOgdQhhVdTB1eVAmpxgcqgLqEErfz/kvlIuiTKuLx5LSfciNUwDblFPOksqxbF712EIqjn/ENE1qvVPTQ2pEkAQ5nZ2vegTgssLBBNHl+M+Llu1gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=gIBKfAmP; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="gIBKfAmP"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so2322279a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791894825; cv=none;
        d=google.com; s=arc-20260327;
        b=PhmrHQOO9H6MuVNQy1wvL+6Oykp4U38lzWcD6UAT4fSPc52S80Rz6yhRc938OA+IDG
         DjuxejEcUIEUsIrF9boo5EPmAsSA01Oi4ZTehaTV+QlgTqpzq+90XFBBVMxv/h2u7xda
         ttmBfnLRsrUwI8C1ctIWGGtKfGo/wmE2+tm0zgtYY8nOUtjxPUIeTf94z05FGFxC931W
         qjGtP+MFjmNWv8oxoHXj0InqNCWHxpGPbx8E2DeBV72GE8ie057Smu3aqWc9TdrYamp2
         PVzyx43qSuxBYgtX/PVpv6lFynqyBT1YedZFGygt7dWxQHXB4zZ9lCYCT18XVEvE7wCN
         Ve+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0BcRktes/U5lVo22Fcl1qWv50r+fNV+F5WhzGJEWnCY=;
        fh=uXekyMuNDqhz4q97agT0jT4n9QgeWOjRiXBxry621qA=;
        b=C7eFbXhe9R2B/hJYVzFvoVF1gP1hOCmdKAhs1eem2VYF9DWAYDfCEuZPwjEIP+q1Zd
         SXN5fdbZrA0M+ifdDbCfuVOktCWmczuYcfm6mxg+bDYKIail+VD7aJcYmd/wolMqrdK0
         OlsZu+lDg7Up8eEQdK39FUKEb9JbLCq/UxRTGfKkgpqhP4qd2ULPDg9HTzpiNTfueWDH
         f2BMn9+R9BNhb3FKgDmUd+olVywSzJeyaeiuP3sDNWwIIlNuMStVpwIeyRs9/bsFQ1Tt
         ZPFEtbme6jKQN4IW7NhA1Stl4GgG7Ql5XipkWrwKqCiSkFVpcg6jGMm+LSraAcn/blCf
         QBlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791894825; x=1792499625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BcRktes/U5lVo22Fcl1qWv50r+fNV+F5WhzGJEWnCY=;
        b=gIBKfAmP56mxPQIp8PGfxnufePCCVaHJhdXFJvsP731MWa26QaAKUKgTRM6ww03p93
         4myXV0bby8j7/vsbHfJK+5LKj7ubcHjmZfU4jZBf74vacA+rID7yhxfv3j/tkr7oTteX
         wJ+wSUuGwkFmYVD7CDDgvbX2Zcd12/P3L0TZDMZlaaXY3mv0rcYmHa8cS93WlRqv/Cwx
         xLIQhawdwzbIZCt0JqCGbAgXpnuBTXctz8fGU1zBD708KlX4Tj6JFVuykx1/bwkhUK6u
         8ASQVb8MMsyxthH826ejYaOQNwuaROL/EfP9Uxmc4fou3Fyk9CbW/dbloqkHmqpUk2xx
         9eBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894825; x=1792499625;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BcRktes/U5lVo22Fcl1qWv50r+fNV+F5WhzGJEWnCY=;
        b=THy3JhUYmJju/E7P43PUkWmpjoZNciSmii48ebBPAlXmJD3viq+j8FPe+auJ2XzLLY
         ow1tn7AZ4z1FHfLam8gd7DGn+ebUOkliIFU77BU1SxGm8kQbikkKSeQx3OYIStOFnV9N
         mNAZ38g2NAnPXZStimKje83Oyp5haGMCd9thfwgSkcdM9UeNsTMTZwWE63WTsAvFedj3
         XIhz/qyzq2OkCo27YVV8xgANs780rGlGseFDbVSsbhsEseYTIy20JiTWG5RRKHpQMZ5b
         SnLbui+KRm55uFI1h8yXgcCI4ZJSun2H4g/BU1ryPmQ37qU2+t2kv5uGu5RjrflBIuX3
         0WiQ==
X-Forwarded-Encrypted: i=1; AKwUvBywsE+36+LGDXe4vlfLhb4/tzJXhfgJFVy8aU0m++q7QAyKEN1IYIA/z42ZiYEOGCJDVXeygaFJB1wYtgs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgwai13Jcrgz/nk2gaLWG9XN3XZDO+fjbkCVVerQGYyl6aaN16
	YA+uzJrUQltyA36ObrQmDvrfKYrHEcdYrTHz9e3kfYWpMzqjbFNVPuK7ZXxAyLDE2mi8gZvrQ2c
	tJisCD9m6JOgrbkbcBvCNGM2y67f/85MapicjBbU7WNqVOk3SEJI8
X-Gm-Gg: AYBFou07ViLSMIIsbsJyHS3hh0WcV+0CduS7fJWIy42lhqkAEua1EesdsIJrV9pHl7u
	loi6nXEusFyAGK8oVm9jJCbTQw04m2byNNZSqux7mgizTmYosszdsinAtPlh0txAFyW/jrDkf4Y
	m9l5q6cGB35b3T2qE8xYlvw5uFooFg6n4M3ApJGym8g1HPXzE8+/8gvakDdlwzBjtRFfdZRhVov
	pFhtC5YDuZber84fwXz+/V5HRP1QmA+1IH0OsR7+nm8wO000Kqp2snX3PGCoNBD0pl262nFx6XC
	34C2KWNnx9stbAnQqgMZY7yeVRhcQMBUMsi/e33IwPn252RiHxxMd7Vt+L+fdNPzmPNqtM2c+C5
	5qlRuP6umTtV3i8lDicOxJotJQ0sOtXK4kpWgAMKP1bpKCQ==
X-Received: by 2002:a17:90b:2688:b0:3a4:adea:50ad with SMTP id
 98e67ed59e1d1-3ab3a775938mr10437579a91.27.1791894825280; Tue, 13 Oct 2026
 05:33:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918153414.909333-1-aubin.constans@microchip.com> <e75041b4-8450-43f6-bf6d-35a31812f8e1@intel.com>
In-Reply-To: <e75041b4-8450-43f6-bf6d-35a31812f8e1@intel.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 13 Oct 2026 14:33:34 +0200
X-Gm-Features: AclHuK-ahRr2oJBzP7-hAKuKrqD2xh13uJApDX2EwOd8IrbrNAm5T9Br4ypdnAk
Message-ID: <CA+HBbNF59tx+FhWke_Q8ie9O5_4RrPPPJm=iALiBKQb0Tp8ChQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-at91: disable selectively clocks on pm runtime
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, Ulf Hansson <ulfh@kernel.org>, 
	Eugen Hristev <ehristev@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Romain Sioen <romain.sioen@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Wanner <ryan.wanner@microchip.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:35=E2=80=AFPM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> On 18/09/2026 18:34, Aubin Constans wrote:
> > From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> >
> > SAMA7G5's SDMMC run-time clock disabling is not supported.
> > Add support to avoid this scenario for SAMA7G5.
> >
> > [Amended with a fix from Romain Sioen below this line]
> >
> > Sama7 boards are impacted by an unbalanced prepare/unprepare
> > and enable/disable clock management in sdhci driver due to
> > the lack of support for SDMMC clock runtime disabling,
> > managed instead by the PMC driver.
> >
> > Add conditions in the preset function to manage clock
> > depending on if the board support runtime clock disabling
> > and if we come from the probing or restoring procedure.
> >
> > Add boolean start_clks variable to manage condition
> > in preset function.
>
> The commit message is a little confusing.  There is no functional
> change yet - this is just preparation, right?  But it reads like
> it is making it work for SAMA7G5.  Please make that clearer in
> the commit message.

Its just preparation, I posted the series for LAN969x which requires the sa=
me so
Aubin posted the Microchip tested commit that SAMA7G5 will also use.

I am waiting on this to post the v3 of LAN969x support.

Regards,
Robert

>
> >
> > Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> > Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
> > Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> > Signed-off-by: Aubin Constans <aubin.constans@microchip.com>
> > ---
> >  drivers/mmc/host/sdhci-of-at91.c | 36 ++++++++++++++++++++++++--------
> >  1 file changed, 27 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-=
of-at91.c
> > index 7c4ac65f247d..399856643e57 100644
> > --- a/drivers/mmc/host/sdhci-of-at91.c
> > +++ b/drivers/mmc/host/sdhci-of-at91.c
> > @@ -39,6 +39,7 @@ struct sdhci_at91_soc_data {
> >       const struct sdhci_pltfm_data *pdata;
> >       bool baseclk_is_generated_internally;
> >       unsigned int divider_for_baseclk;
> > +     bool pm_runtime_disable_clks;
> >  };
> >
> >  struct sdhci_at91_priv {
> > @@ -149,12 +150,14 @@ static const struct sdhci_pltfm_data sdhci_sama5d=
2_pdata =3D {
> >  static const struct sdhci_at91_soc_data soc_data_sama5d2 =3D {
> >       .pdata =3D &sdhci_sama5d2_pdata,
> >       .baseclk_is_generated_internally =3D false,
> > +     .pm_runtime_disable_clks =3D true,
> >  };
> >
> >  static const struct sdhci_at91_soc_data soc_data_sam9x60 =3D {
> >       .pdata =3D &sdhci_sama5d2_pdata,
> >       .baseclk_is_generated_internally =3D true,
> >       .divider_for_baseclk =3D 2,
> > +     .pm_runtime_disable_clks =3D true,
> >  };
> >
> >  static const struct of_device_id sdhci_at91_dt_match[] =3D {
> > @@ -164,7 +167,7 @@ static const struct of_device_id sdhci_at91_dt_matc=
h[] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
> >
> > -static int sdhci_at91_set_clks_presets(struct device *dev)
> > +static int sdhci_at91_set_clks_presets(struct device *dev, bool start_=
clks)
> >  {
> >       struct sdhci_host *host =3D dev_get_drvdata(dev);
> >       struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> > @@ -174,7 +177,14 @@ static int sdhci_at91_set_clks_presets(struct devi=
ce *dev)
> >       unsigned int                    gck_rate, clk_base_rate;
> >       unsigned int                    preset_div;
> >
> > -     clk_prepare_enable(priv->hclock);
> > +     /*
> > +      * Manage clock prepare/enable procedure depending on if the boar=
d
> > +      * support runtime clock disabling and if we come from the probin=
g
> > +      * or restoring procedure (for backup+self refresh).
> > +      */
> > +     if (start_clks)
> > +             clk_prepare_enable(priv->hclock);
> > +
> >       caps0 =3D readl(host->ioaddr + SDHCI_CAPABILITIES);
> >       caps1 =3D readl(host->ioaddr + SDHCI_CAPABILITIES_1);
> >
> > @@ -223,8 +233,11 @@ static int sdhci_at91_set_clks_presets(struct devi=
ce *dev)
> >       writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
> >              host->ioaddr + SDHCI_PRESET_FOR_DDR50);
> >
> > -     clk_prepare_enable(priv->mainck);
> > -     clk_prepare_enable(priv->gck);
> > +     /* Same clock management as for hclock */
> > +     if (start_clks) {
> > +             clk_prepare_enable(priv->mainck);
> > +             clk_prepare_enable(priv->gck);
> > +     }
> >
> >       return 0;
> >  }
> > @@ -254,9 +267,11 @@ static int sdhci_at91_runtime_suspend(struct devic=
e *dev)
> >       if (host->tuning_mode !=3D SDHCI_TUNING_MODE_3)
> >               mmc_retune_needed(host->mmc);
> >
> > -     clk_disable_unprepare(priv->gck);
> > -     clk_disable_unprepare(priv->hclock);
> > -     clk_disable_unprepare(priv->mainck);
> > +     if (priv->soc_data->pm_runtime_disable_clks) {
> > +             clk_disable_unprepare(priv->gck);
> > +             clk_disable_unprepare(priv->hclock);
> > +             clk_disable_unprepare(priv->mainck);
> > +     }
> >
> >       return 0;
> >  }
> > @@ -269,7 +284,7 @@ static int sdhci_at91_runtime_resume(struct device =
*dev)
> >       int ret;
> >
> >       if (priv->restore_needed) {
> > -             ret =3D sdhci_at91_set_clks_presets(dev);
> > +             ret =3D sdhci_at91_set_clks_presets(dev, priv->soc_data->=
pm_runtime_disable_clks);
> >               if (ret)
> >                       return ret;
> >
> > @@ -277,6 +292,9 @@ static int sdhci_at91_runtime_resume(struct device =
*dev)
> >               goto out;
> >       }
> >
> > +     if (!priv->soc_data->pm_runtime_disable_clks)
> > +             goto out;
> > +
> >       ret =3D clk_prepare_enable(priv->mainck);
> >       if (ret) {
> >               dev_err(dev, "can't enable mainck\n");
> > @@ -344,7 +362,7 @@ static int sdhci_at91_probe(struct platform_device =
*pdev)
> >               return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
> >                                    "failed to get multclk\n");
> >
> > -     ret =3D sdhci_at91_set_clks_presets(&pdev->dev);
> > +     ret =3D sdhci_at91_set_clks_presets(&pdev->dev, true);
> >       if (ret)
> >               return ret;
> >
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
