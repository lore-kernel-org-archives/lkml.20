Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EE253D9F1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079070; cv=pass; b=TCzcJs5k2MOUFY9epaSXONTnrFUh3BrEl5oePLFIIQF+ypASe6vHTwm0pcdiips2328o4XDtF/wew+aPUJTQ/1AELS2SXJ4IZtP/LJG29OP6Oy5Q2e99X1gZhqNsHzXEo+0RgX9cIsGBa1KSQa9yBAkG8ld4XRjfatX1v3ZRdic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079070; c=relaxed/simple;
	bh=zhBckJjh/b6ySecVNrr/N3Lq/I8up4/vhbYGdysm7dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQLk7DDc7jtleBjBkdFPs9kPeVewqNDmIs80m2dSA4Qz7WhGE1in3ranFL+yKse3S8DRfwSWIjx1sql3G7vNwHZiLWuhjoxLQNwXr6ZddZCCZXkYGO0Fv9/z6bOOs7Ay8+GwElYeOf9E6JA/q2G0UhkiaqtrTQqP4Nt+ybNTtRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Dxr2mX87; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Dxr2mX87"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b35611so2635298b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790079068; cv=none;
        d=google.com; s=arc-20260327;
        b=Gc48YwAmatNbXC58kkdpRinTF0kY7JbwAhlNAwQ2J5HlcrtvW+L0G+srUzjiojX3lH
         ni4rkcvgyHflBZUl3rgDra4rwlzleuwHIDPMKkT6V73RnaibfdCWJfj0+7K0MWnuE1v7
         SgEosGWh0vncSUSRQZnJHcDUiyzNUb634LGF6JzuTDvkIYUJVTViKQPetxZ/k+UIowhq
         qClt9Ka7wiqDmIiHWB/JXW2kfpvx+euH1WarXiYh/8sBtptCoB/LZ5jAGK79V+FjBV3l
         pSMJpShqBTg1nbO4ApiYuCnXQ5ap82bTjBwWkswaXeX+mhpb1J/wgGJfZFZ+2UhdUHL+
         8Hbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kOhmSbQRDqCEb/A2sqYTkgFarvxluyIQ+deEPZ6m+b4=;
        fh=OiMdYsXit1ZnxSBQ/5itRZKyTonTMn6sztiFGJz56kg=;
        b=Fw9HgrjRVRx2UxkrAfc969Zc0cZ/MY4N2Jyg6MUjAHA0M0xJ6DydEjUZgF53C7OW5H
         raOwrmerfVAjYCr2OK+7+4GI963Mnw3i7dJe3p7Jf7EJo/KPYT9w3UDHsm7h5wLn4MLZ
         ds/SityWdAitCXirg+n1kmde8lyffKu6YstzKVS+Hd3/ySUQTlJ6p+/An5WYZk/xEpCb
         lzwJGSajrkJRuJ/vk7fpfATpppO/80i01x+ZNYvYUGAljFYHuALTDb1L1XIV0veviIbd
         vFRSvV/2w7+v4xc09ZhTrZ9K3UbOsYv0mDi99xfiJmfVTyVGpaCdzNNWu5gs5+xBN48U
         +i1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790079068; x=1790683868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOhmSbQRDqCEb/A2sqYTkgFarvxluyIQ+deEPZ6m+b4=;
        b=Dxr2mX87yxynDuULYMGX9kELpTyWfuMZdLF0uolA5jtqempl8q+uBiPhhT8bnd6hBK
         dZglHnqRpHksb2hM59E9+6zwFAfXPOChDMurd3VU4br5Hwe5IBrrnN1N5ghzaouGToJy
         xe+nAPJ1ynbWi+5MGu0hAt2eL8QHBJL0Z9gj4X1JL9tXvfYTqbm7iNMGTyr4isG8zntq
         jDSPpyuc0tYGPPb69A8f5XDRPo4eiDXenrEO0CByEpvtOCTQklUCjcj9AKSlBLFc+YHj
         YkU52d/x9Vh0+wcZrj6UjSWXcBFBtQDdygqpz56dnM4N8qsOYP9MfIa+MjKe9YEYxtd5
         IcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790079068; x=1790683868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOhmSbQRDqCEb/A2sqYTkgFarvxluyIQ+deEPZ6m+b4=;
        b=249VEyv3eo8R1mYfpsxZe8iX6VQbG1WFszwqxzsNdBlbjqTjH8q75Xm3Slrm6IIl6q
         QkscjGeCOQZKp7oRPJv+38ImRZ/cXgnPw9NZ6A7ixSAuiLQMfs32tdwnriAvHZhCMlUA
         c1WJjsE9SyVuwzF84Kfg9H8bEmQSsc8Br5LTyyaQaF2/izhOizxHRPBuFiatd6SsIbuO
         aCP7Jbeq8wG3PGvwKS9Xo9mPGDSKzb+8R1Ybcge7eKd8BYPZv6VJpCTLubVuAH1ZXmiP
         J5wwga7L7uLWCbeU/8cllxbdav7QW5R52yZJ+ELF+zh78nXJT4Jt3bRRTb9kvadO4JI5
         MvoQ==
X-Forwarded-Encrypted: i=1; AKwUvByIaI9fKdVUfil+vON5sLUB00qgJwNFfEOKeW0pi93yCP7KmoKJr0VfPPnt1ptdqE3EqAQMaS5u4lXWhAg=@vger.kernel.org
X-Gm-Message-State: AFuF++myCYwQaajKkYtU8HGhK8Pum/KdFIXDsUsNq1PGC8uSsZjU9Pdz
	IpTPDfI0NlMDWcVUrfsQFyvco9bIeyIuYxhTtY3ycMwkvm/5EtNs9jBhb7mupoI1spH1RiaggOj
	ccoSOlF+uSjKXALiqZFVAquUXkAOFl3exS+dmB149Hg==
X-Gm-Gg: AYBFou020mh3MlDzVxyIT3j00PsCp3y8HB+dDJ/0Ml2Y7xjPNNw/+1HCfEarbvcc9LI
	RNjo02e+BIMx6Vh+LQ1S0UzVDBbjZsUCCvHuYoZQ1uvzZbqRO4Afcf6r9gdmsDTA5T4aNAjMdHc
	t/eM04wu4S4nP7PGlYsqmGAfMhPl0Y9qs70YqQZefLdqqbZKPy3QVTNuu1kj/M5EVGGUE7In/RF
	ip110BjamOnNCBUXMWHblbVpR3x8VZ4eoR5hjlaws8h5knOIsw+MIOADdpAQPELS+qczc4NnWUR
	d2gVO5X5LIcHfaP5emsrUiUfm1uiKA6QWS0JYtY0j6Nw4CYcDHAF8kgmb7yNvZWprayHVb8np+T
	bSqmNCpQwNIq/kjYjMrZBnbA9FXHJoijxsmg=
X-Received: by 2002:a05:6a00:1815:b0:86f:68:4427 with SMTP id
 d2e1a72fcca58-87c82992710mr961428b3a.25.1790079067649; Tue, 22 Sep 2026
 05:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
 <20260907132617.1198548-3-robert.marko@sartura.hr> <bfcd57f8-ffca-4a44-a84f-12c46cb9fe76@microchip.com>
 <CA+HBbNFQH-hTnqBOEAau2dP1+zKNsHDBcQA9dC5ofx2U5cbFDw@mail.gmail.com> <ab5b83a9-7ac3-4a0e-bb81-491e3c509b85@microchip.com>
In-Reply-To: <ab5b83a9-7ac3-4a0e-bb81-491e3c509b85@microchip.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 22 Sep 2026 14:10:56 +0200
X-Gm-Features: AcwNN1X72TJGsn5G-Pd9YhQCT1YVTB77NSdqUoPxnMzfce7-XLlntiULjrzyflA
Message-ID: <CA+HBbNGRtcQ97TW4APKnK7dhq88BpbocZyc4yd4nLDw3W6n37w@mail.gmail.com>
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

On Fri, Sep 18, 2026 at 6:02=E2=80=AFPM Aubin Constans
<aubin.constans@microchip.com> wrote:
>
> On 15/09/2026 13:31, Robert Marko wrote:
> > On Mon, Sep 14, 2026 at 3:46=E2=80=AFPM Aubin Constans
> > <aubin.constans@microchip.com> wrote:
> >>
> >> Hi Robert,
> >>
> >> On 07/09/2026 15:25, Robert Marko wrote:
> >>> sdhci_at91_set_clks_presets() both enables the controller clocks and
> >>> programs its capabilities and preset registers. This prevents callers=
 from
> >>> restoring the registers without changing the clock enable counts.
> >>>
> >>> Move clock enablement to callers and add a SoC data flag for controll=
ers
> >>> that must keep their clocks enabled. Use it in the runtime PM paths w=
hile
> >>> keeping register restoration separate from clock enablement.
> >>
> >> This change has been required for the SAMA7G54 MPU already, and implem=
ented by
> >> two complementary commits:
> >>
> >> https://github.com/linux4microchip/linux/commit/763a3c05c8f9d0feb279c6=
f308fa5d48d14e07d3
> >> https://github.com/linux4microchip/linux/commit/b5bbc888fb39471d46fe0a=
4ff28f69533c265dd0
> >>
> >> At least they have been validated by test campaigns.
> >> If that existing work seemed OK for you and the LAN969x, then I could =
squash
> >> these two commits and submit the result.
> >
> > Hi Aubin,
> > Yeah, I originally used those in our tree as well before trying to
> > simplify things for upstreaming.
> >
> > Regards,
> > Robert
> >
>
> To follow up on that patch, I have just submitted the original work,
> ported to tag next-20260917:
>
> https://lore.kernel.org/linux-mmc/20260918153414.909333-1-aubin.constans@=
microchip.com/
>
> Hope it will make easier to support the LAN969x, notably.

Hi Aubin,
As long as that is merged, then LAN969x support is really simple.
I tested it locally and it works, so I am waiting on that getting
merged before sending v3 for LAN969x.

Regards,
Robert

>
> Regards,
> Aubin
>
> >>>
> >>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> >>>
> >>>    drivers/mmc/host/sdhci-of-at91.c | 39 +++++++++++++++++++---------=
----
> >>>    1 file changed, 23 insertions(+), 16 deletions(-)
> >>>
> >>> diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhc=
i-of-at91.c
> >>> index 7c4ac65f247d..b7e2a89da348 100644
> >>> --- a/drivers/mmc/host/sdhci-of-at91.c
> >>> +++ b/drivers/mmc/host/sdhci-of-at91.c
> >>> @@ -38,6 +38,7 @@
> >>>    struct sdhci_at91_soc_data {
> >>>           const struct sdhci_pltfm_data *pdata;
> >>>           bool baseclk_is_generated_internally;
> >>> +       bool keep_clks_on;
> >>>           unsigned int divider_for_baseclk;
> >>>    };
> >>>
> >>> @@ -164,7 +165,7 @@ static const struct of_device_id sdhci_at91_dt_ma=
tch[] =3D {
> >>>    };
> >>>    MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
> >>>
> >>> -static int sdhci_at91_set_clks_presets(struct device *dev)
> >>> +static void sdhci_at91_set_clks_presets(struct device *dev)
> >>>    {
> >>>           struct sdhci_host *host =3D dev_get_drvdata(dev);
> >>>           struct sdhci_pltfm_host *pltfm_host =3D sdhci_priv(host);
> >>> @@ -174,7 +175,6 @@ static int sdhci_at91_set_clks_presets(struct dev=
ice *dev)
> >>>           unsigned int                    gck_rate, clk_base_rate;
> >>>           unsigned int                    preset_div;
> >>>
> >>> -       clk_prepare_enable(priv->hclock);
> >>>           caps0 =3D readl(host->ioaddr + SDHCI_CAPABILITIES);
> >>>           caps1 =3D readl(host->ioaddr + SDHCI_CAPABILITIES_1);
> >>>
> >>> @@ -222,11 +222,6 @@ static int sdhci_at91_set_clks_presets(struct de=
vice *dev)
> >>>           preset_div =3D DIV_ROUND_UP(gck_rate, 50000000) - 1;
> >>>           writew(SDHCI_AT91_PRESET_COMMON_CONF | preset_div,
> >>>                  host->ioaddr + SDHCI_PRESET_FOR_DDR50);
> >>> -
> >>> -       clk_prepare_enable(priv->mainck);
> >>> -       clk_prepare_enable(priv->gck);
> >>> -
> >>> -       return 0;
> >>>    }
> >>>
> >>>    static int sdhci_at91_suspend(struct device *dev)
> >>> @@ -254,9 +249,11 @@ static int sdhci_at91_runtime_suspend(struct dev=
ice *dev)
> >>>           if (host->tuning_mode !=3D SDHCI_TUNING_MODE_3)
> >>>                   mmc_retune_needed(host->mmc);
> >>>
> >>> -       clk_disable_unprepare(priv->gck);
> >>> -       clk_disable_unprepare(priv->hclock);
> >>> -       clk_disable_unprepare(priv->mainck);
> >>> +       if (!priv->soc_data->keep_clks_on) {
> >>> +               clk_disable_unprepare(priv->gck);
> >>> +               clk_disable_unprepare(priv->hclock);
> >>> +               clk_disable_unprepare(priv->mainck);
> >>> +       }
> >>>
> >>>           return 0;
> >>>    }
> >>> @@ -269,14 +266,23 @@ static int sdhci_at91_runtime_resume(struct dev=
ice *dev)
> >>>           int ret;
> >>>
> >>>           if (priv->restore_needed) {
> >>> -               ret =3D sdhci_at91_set_clks_presets(dev);
> >>> -               if (ret)
> >>> -                       return ret;
> >>> +               if (!priv->soc_data->keep_clks_on)
> >>> +                       clk_prepare_enable(priv->hclock);
> >>> +
> >>> +               sdhci_at91_set_clks_presets(dev);
> >>> +
> >>> +               if (!priv->soc_data->keep_clks_on) {
> >>> +                       clk_prepare_enable(priv->mainck);
> >>> +                       clk_prepare_enable(priv->gck);
> >>> +               }
> >>>
> >>>                   priv->restore_needed =3D false;
> >>>                   goto out;
> >>>           }
> >>>
> >>> +       if (priv->soc_data->keep_clks_on)
> >>> +               goto out;
> >>> +
> >>>           ret =3D clk_prepare_enable(priv->mainck);
> >>>           if (ret) {
> >>>                   dev_err(dev, "can't enable mainck\n");
> >>> @@ -344,9 +350,10 @@ static int sdhci_at91_probe(struct platform_devi=
ce *pdev)
> >>>                   return dev_err_probe(&pdev->dev, PTR_ERR(priv->gck)=
,
> >>>                                        "failed to get multclk\n");
> >>>
> >>> -       ret =3D sdhci_at91_set_clks_presets(&pdev->dev);
> >>> -       if (ret)
> >>> -               return ret;
> >>> +       clk_prepare_enable(priv->hclock);
> >>> +       sdhci_at91_set_clks_presets(&pdev->dev);
> >>> +       clk_prepare_enable(priv->mainck);
> >>> +       clk_prepare_enable(priv->gck);
> >>>
> >>>           priv->restore_needed =3D false;
> >>>
> >>> --
> >>> 2.55.0
> >>
> >
> >
> > --
> > Robert Marko
> > Staff Embedded Linux Engineer
> > Sartura d.d.
> > Lendavska ulica 16a
> > 10000 Zagreb, Croatia
> > Email: robert.marko@sartura.hr
> > Web: www.sartura.hr
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
