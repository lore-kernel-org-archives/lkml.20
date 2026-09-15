Received: from mail-pz2-f21.google.com (mail-pz2-f21.google.com [74.125.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809803B27E9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471921; cv=pass; b=ItyhkouSglcEZsDqgbsI55u2DZDllT63XKfRCaf3fs24j6ztlgDZLnTgKBFdxS9m0aluKU9qXgfU3mT/wkicLeFcP5DaYUV0f2fTQ+MKCew7I2eMGH5h/Lawr2Cn8MS5m1k2pklC99ucNit9I7+pthZfmOMpwBsymUl8CGZf9tE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471921; c=relaxed/simple;
	bh=7NSvUJb+Kkse49Pbvizg9LMzUde+FsfN4VtU0EWT8Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGVUrc+WiyLVJ3YjdE7kpQTlVVcMreNuu0rRAQbRgNG2WenahjSJNvQ5ggwjSqM+TV1+2pc5N4HF5bAi16+I6YjZq5//QomhCm5n8RdZSory7wu6R8EgBzcxf0JDPOPYvgc6RH7owZBO3hb3R+tc8WjxLEZBwMFAhwKQFcd9yFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=UbMUTwnA; arc=pass smtp.client-ip=74.125.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="UbMUTwnA"
Received: by mail-pz2-f21.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so133439a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789471918; cv=none;
        d=google.com; s=arc-20260327;
        b=i5Kli7I8mSznK/dhJPM8o6gCrVH5nje3f9rpeBThZD8qHDYnGeTW/jHfUTYg9ZOrQh
         HayZoCLYFOzu9YPM0nRnvJol8lyGMUBpSFIrIRHfv265A3SNGq7CHx7gLZdCENGVv/N5
         YN0zkPdD6355HNOAMb0anMZo1OJt39K7YRCQZZuUILWQb4Eq9sVmuy5VLF5D/OIZmP1i
         r+ICeUUadp5NDbhVsd/ZufLZaFBiveyJqWkpQf+IYUpwUGqKp5Om3Ljt1KyjquL0+jXu
         JLzpSVDMp9dEP/HolXQ3VaXM2u5rnx+zktESTA841YzfHfXG4utaq1BtCbrYP/TTu/R8
         Y+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZWWxIYlBWABZ3GjM6t1BqbZ6aeOgozwkp5h4xrnqvNE=;
        fh=SHLTudxkqJXvfwfG/meTTd9SNdO/6ay7QCMN36FxmvM=;
        b=X0TyG0Eq1wif97sf2LECcVCNlakcxCbI0PXZ++TJvNVk79/WXw2tSnmisKMwp+WRpt
         1f5Fhl//HhKWjrebHGfOXz2dvpdwaHQ71kJpjfE5HJkDnTrSlBLFplDM+2EC/+XhS9Xh
         TB+YTdTbKMWLLEq2tKXoxeEfV5+llr72LyGaL9Jr3teq7MRKA8MVPP62X59ciIqsFfwm
         4JUzp/ZvDgHbL8Dvsz7OyPy7cPE9MmnAUBhCZOy/VZtdAodTLum4OKBus6IhfFqzg/ZO
         +CtYuwZdRy+vfnquw0pTkcN4IX24tbekj97eaWTNkVyY1/+PW+JZs06qo8sXmJkNFxJQ
         M1fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1789471918; x=1790076718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZWWxIYlBWABZ3GjM6t1BqbZ6aeOgozwkp5h4xrnqvNE=;
        b=UbMUTwnAjvW63PekRfDe+YrHlOXG/WpHXBH9RsoXyln8a/cr65Ni1KUnKejMtD5kNq
         QDSQ9meR8Blg7pOhoGk/l020BbHFjjtLJZnbrmV8tZFLnzyjrlPe0OKESm1mHrdkV+tn
         Cw1EjT9LoNC1DbDJznoWPm9I4M45u4o1afWjx+LFpx+m8IvxHIoEtcc9PIOaSx7TXJRv
         5B0v+WNJrvEzfcoWP3YpCIP36N7xVGpPi9J+VwFlhIJaqTlJwXgFzY+sHnH6V38aZEKa
         fouJYkI7p2m18RSCb2x+D9qYS40Zt0FAQdQWN7FEy1nIuCHvoKPhhB3OZC9nTtdxyEOv
         3a4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471918; x=1790076718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWWxIYlBWABZ3GjM6t1BqbZ6aeOgozwkp5h4xrnqvNE=;
        b=oLmJLBHkTdhhVQEJv2wvIpGnBieOjSPLlPyaoSbDgQiyhqAFm981ABxbgbi2JLV+WG
         yLeOi7O+naImHf/OsFYqj2oaaZRgRrxRadZ3BSQ6q6FvWAQbtQ8m/rkKGztW2CmIHMTm
         AfypMfHDBFe3/0DjMkc4Q0Jpr7PbzfwooYYS5wCdO1iqG6zuv4HFhMg/13FSEIXz2Bv4
         iV5kb3bDVVulo7DEsfPg9+xhqTb1cFLlNzheSFSkPXlcFAe5hih3nDyAYRCkzk8sP99i
         TxaIIguL7/WuFn72o4vA1U9dFSjMLBHUAgQS3z9P+6KcY0KbCuJ/jF0udbYrzTvuYJck
         gYIQ==
X-Forwarded-Encrypted: i=1; AKwUvBx66n9eGIguawmyYmlqUMZwth1rV08YDJ4K7vXA2D5S2TaIwRJqxG6KOZ7ksCPsRIfffotb7vK2WndJTBY=@vger.kernel.org
X-Gm-Message-State: AFuF++mi3DrYmC8opxrKmh8Q8kr0+ZjglI3yB96aDL2ZRYdoxFvHLIyG
	mewsDzCMRnl879OfKze9+x9IVvKHbV8bO9LGhJnrTUi1EJLxolLoZfWZXXoB5/UHdvjwI0/5tba
	QmgByJdohTe64mzQIztUidkW9qVE1Gj7Zc4vkQJYhQw==
X-Gm-Gg: AYBFou17eAqU4JDUsFCwEfJ69H7BdCHtQ/z4Dv+ALXLe3Q25oG4wIgbONLkGhQx4cfw
	/uIJ6LEiIyXwWwjo8vjyDxTOGgegal91rHEOsKTwMLqdCsIy5PZ52Mor6MilGe3k+XhIjwsWo5D
	84j8I5iJxdLJnWH5ShXBH5SatMalb4N8zVREiuskNDFgqblh/BwGSCM3kq3msHRJ+jgmuW7qXLX
	cERHnP+EXbIkfOwKCYI75siM8qETnHcVJxx6Vyl60dbLzXbyK3ioxuJtdwJ0TPfS8V8h1HtWhhI
	EFcXtx3crLxNLwcEiu/FtUq6+lccMnRWVFU5kdHVdagMfIToaA57dLgzotV8axxQl7/G4G2bzQ1
	gW+TIZE7AndthqTgDw++rSjGnWa/d696/Y7U=
X-Received: by 2002:a17:903:238b:b0:2d8:d4cc:5bb1 with SMTP id
 d9443c01a7336-2dd83867c8amr12011995ad.17.1789471917503; Tue, 15 Sep 2026
 04:31:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-3-robert.marko@sartura.hr> <bfcd57f8-ffca-4a44-a84f-12c46cb9fe76@microchip.com>
In-Reply-To: <bfcd57f8-ffca-4a44-a84f-12c46cb9fe76@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 15 Sep 2026 13:31:46 +0200
X-Gm-Features: AcwNN1UJvA458C1rRtNt9ddKHsmuV8Z1-WqiLjsIfnIGDe3K05sCIbO51uVztps
Message-ID: <CA+HBbNFQH-hTnqBOEAau2dP1+zKNsHDBcQA9dC5ofx2U5cbFDw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] mmc: sdhci-of-at91: add option to keep clocks enabled
To: Aubin Constans <aubin.constans@microchip.com>
Cc: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, adrian.hunter@intel.com, ehristev@kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 3:46=E2=80=AFPM Aubin Constans
<aubin.constans@microchip.com> wrote:
>
> Hi Robert,
>
> On 07/09/2026 15:25, Robert Marko wrote:
> > sdhci_at91_set_clks_presets() both enables the controller clocks and
> > programs its capabilities and preset registers. This prevents callers f=
rom
> > restoring the registers without changing the clock enable counts.
> >
> > Move clock enablement to callers and add a SoC data flag for controller=
s
> > that must keep their clocks enabled. Use it in the runtime PM paths whi=
le
> > keeping register restoration separate from clock enablement.
>
> This change has been required for the SAMA7G54 MPU already, and implement=
ed by
> two complementary commits:
>
> https://github.com/linux4microchip/linux/commit/763a3c05c8f9d0feb279c6f30=
8fa5d48d14e07d3
> https://github.com/linux4microchip/linux/commit/b5bbc888fb39471d46fe0a4ff=
28f69533c265dd0
>
> At least they have been validated by test campaigns.
> If that existing work seemed OK for you and the LAN969x, then I could squ=
ash
> these two commits and submit the result.

Hi Aubin,
Yeah, I originally used those in our tree as well before trying to
simplify things for upstreaming.

Regards,
Robert

> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> >
> >   drivers/mmc/host/sdhci-of-at91.c | 39 +++++++++++++++++++------------=
-
> >   1 file changed, 23 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-=
of-at91.c
> > index 7c4ac65f247d..b7e2a89da348 100644
> > --- a/drivers/mmc/host/sdhci-of-at91.c
> > +++ b/drivers/mmc/host/sdhci-of-at91.c
> > @@ -38,6 +38,7 @@
> >   struct sdhci_at91_soc_data {
> >          const struct sdhci_pltfm_data *pdata;
> >          bool baseclk_is_generated_internally;
> > +       bool keep_clks_on;
> >          unsigned int divider_for_baseclk;
> >   };
> >
> > @@ -164,7 +165,7 @@ static const struct of_device_id sdhci_at91_dt_matc=
h[] =3D {
> >   };
> >   MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
> >
> > -static int sdhci_at91_set_clks_presets(struct device *dev)
> > +static void sdhci_at91_set_clks_presets(struct device *dev)
> >   {
> >          struct sdhci_host *host =3D dev_get_drvdata(dev);
> >          struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> > @@ -174,7 +175,6 @@ static int sdhci_at91_set_clks_presets(struct devic=
e *dev)
> >          unsigned int                    gck_rate, clk_base_rate;
> >          unsigned int                    preset_div;
> >
> > -       clk_prepare_enable(priv->hclock);
> >          caps0 =3D readl(host->ioaddr + SDHCI_CAPABILITIES);
> >          caps1 =3D readl(host->ioaddr + SDHCI_CAPABILITIES_1);
> >
> > @@ -222,11 +222,6 @@ static int sdhci_at91_set_clks_presets(struct devi=
ce *dev)
> >          preset_div =3D DIV_ROUND_UP(gck_rate, 50000000) - 1;
> >          writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
> >                 host->ioaddr + SDHCI_PRESET_FOR_DDR50);
> > -
> > -       clk_prepare_enable(priv->mainck);
> > -       clk_prepare_enable(priv->gck);
> > -
> > -       return 0;
> >   }
> >
> >   static int sdhci_at91_suspend(struct device *dev)
> > @@ -254,9 +249,11 @@ static int sdhci_at91_runtime_suspend(struct devic=
e *dev)
> >          if (host->tuning_mode !=3D SDHCI_TUNING_MODE_3)
> >                  mmc_retune_needed(host->mmc);
> >
> > -       clk_disable_unprepare(priv->gck);
> > -       clk_disable_unprepare(priv->hclock);
> > -       clk_disable_unprepare(priv->mainck);
> > +       if (!priv->soc_data->keep_clks_on) {
> > +               clk_disable_unprepare(priv->gck);
> > +               clk_disable_unprepare(priv->hclock);
> > +               clk_disable_unprepare(priv->mainck);
> > +       }
> >
> >          return 0;
> >   }
> > @@ -269,14 +266,23 @@ static int sdhci_at91_runtime_resume(struct devic=
e *dev)
> >          int ret;
> >
> >          if (priv->restore_needed) {
> > -               ret =3D sdhci_at91_set_clks_presets(dev);
> > -               if (ret)
> > -                       return ret;
> > +               if (!priv->soc_data->keep_clks_on)
> > +                       clk_prepare_enable(priv->hclock);
> > +
> > +               sdhci_at91_set_clks_presets(dev);
> > +
> > +               if (!priv->soc_data->keep_clks_on) {
> > +                       clk_prepare_enable(priv->mainck);
> > +                       clk_prepare_enable(priv->gck);
> > +               }
> >
> >                  priv->restore_needed =3D false;
> >                  goto out;
> >          }
> >
> > +       if (priv->soc_data->keep_clks_on)
> > +               goto out;
> > +
> >          ret =3D clk_prepare_enable(priv->mainck);
> >          if (ret) {
> >                  dev_err(dev, "can't enable mainck\n");
> > @@ -344,9 +350,10 @@ static int sdhci_at91_probe(struct platform_device=
 *pdev)
> >                  return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck),
> >                                       "failed to get multclk\n");
> >
> > -       ret =3D sdhci_at91_set_clks_presets(&pdev->dev);
> > -       if (ret)
> > -               return ret;
> > +       clk_prepare_enable(priv->hclock);
> > +       sdhci_at91_set_clks_presets(&pdev->dev);
> > +       clk_prepare_enable(priv->mainck);
> > +       clk_prepare_enable(priv->gck);
> >
> >          priv->restore_needed =3D false;
> >
> > --
> > 2.55.0
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
