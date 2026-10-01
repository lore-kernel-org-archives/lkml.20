Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA17F4A64D8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843396; cv=pass; b=VMRy0HFFvsRzl01mmpearOa1S0MybM0xROsTi0TE5COMtOM9axGcIRjspCDaKirdLbF20bwDY/nX7CvpaQcRpaOhg26unE49Sv9+naBFlDRWhQKngXEQWr0fhSuqtZTyf6WVBx/brVtn0SkBxlQtCdOqIjvzz0coGcpjeImlvts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843396; c=relaxed/simple;
	bh=PwiJW/mknYG0ic3ENBo9sMH0ccET9ToWoZjPUMCumBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpDbyS78MgSv3HOjhT4ZAuyO5gZ8K2N921WCvNSFS15rkfjj5GZ3CXx23w5CPCzZIVHmrim0nQsp38W97XuKDNrx71lE6njqnknAgRKILyZLT2dFWM94McExuhLgwSSjY98nhC1bEOFVTOuvvavDqLB2TjBgXX1rHnF9I6TCGEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afZM7Q2k; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afZM7Q2k"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b09f6bbe8so235821f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790843387; cv=none;
        d=google.com; s=arc-20260327;
        b=qsUaMwxYeLBXCvd16HPwvbzSsWEutCKjql40/5G8Ixsa9mwFDiBlcFgS+tUOVZO7RG
         9/zeczTxdK5Mz5BgvEg56s0+NAkEktx47OIcoDDW9s6wPe7g23N1o0Elza6TH5Qr9xQU
         TUkLtnA/FHarbYmgtEq/fmZE2wweLPrcg6Q7YB/1JyPDgvd1PZhNACCmb0Mta4NeAo0f
         sqOfxR5Erydh1XY/qlNJo4zJQeuCGuA4hJaIgNiMps/lU571KRYKW9wZZ2QuG0hSGa60
         EJOVreSsCyntRgdntx0aeM60g5mj+OHpfSZ8t1pgtkKlOoMD4vWfl2eDODC3OseoRYvX
         2VRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KdOx0gTEKpUZsHoYWW+nnd+IvZKeex/gkJLuhvb4cno=;
        fh=RCqKxgPuCwC7iChxLafeH9eg3yhZ2L6gDFJ4DLd7vNk=;
        b=gqkb+r6AMGKiedF8dS/TH9E7KI2G5JjtW6bpno91CGsQzly8iUtbOAw/ohYI+patsI
         Rqz2ANJgNq3VgIeaLEptVpbZT88ChhqYYgDAJ6/+HZvd5oq2NqSMEpfhCuB4Coe11MOM
         ClW0nxjgtfX803AEVhNKkJXhVxUzcr5ZV3Ep/xNZRj3GfpbwpyKjEuGrO0VnDhTr2mVw
         nt+Ip+BvlBvmZh2YyP8OndDPPcMhWVNX3xfMwQSEMsvpDj9cj05WXLKSuw59LEi9BCfj
         SVFC9VL1m4C4XuIA59jaIEeXiQ4m/KijSRxbpAAr/LMep/cFa4AGjU7xWRpwrWgMeI49
         ufNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790843387; x=1791448187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KdOx0gTEKpUZsHoYWW+nnd+IvZKeex/gkJLuhvb4cno=;
        b=afZM7Q2kQFs/le+qlP0tIYfs1NVRH/ZszIJFFdmjd3Tx1Q27Yt+tsTF/gVmyulOljD
         PPzaG3f2iqzWI9uRJEU12U6DWuVoDp5JgEjiUNrrZGyeMNys1J4UzIbVMlsKqfg24DXl
         c6RvuFy9zswUKgQtTotgXk9c9PK/2EhDXp9HOF7vzaKM9VXz71c8lhhApuYwwc5GypU+
         l/ORj+ulyjMOQ+0g/1Qua8HpHX0yO8bPnVG2OvzKStXDDP6zVyvkpskWl5cMnJbKlAqo
         0OiEdhG9eCDMWX3Qn2Xhfbca5U25TChpdLB/7C/3Epw+UdRBkRwr1Oc0DSJ8u4Ii0uml
         so0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843387; x=1791448187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdOx0gTEKpUZsHoYWW+nnd+IvZKeex/gkJLuhvb4cno=;
        b=P889NWypev2DIcONDwzHOzD6zhWR1g/l+JcG1kq2wZ3vXghrIgTjs+L1913UrxfrF1
         M+Kp2kSEsO73OgthaNTX6QnB3bECA78tLgL4Z0GVD5/XCKDsDneYdLsg0c+4mp9PbjRY
         6yYGDfaEWoZbbW1+y9FlssZXt1+8R5R5eNF4T/L8gsjGAGM8G6LgUO+/dw0GnpvkJeOY
         AvCjgLI/fsv5nwSRUJOgcKasd8Htxs9PuxBaP1WT96lARYyI/GBWZl0PIAHzQqxBt75v
         09vyZBFl489ei+H9mH1emyNUNC+wUTbhQu02h1kbqjHPtAYV1cqSJgfBsiEXjzrwMHzz
         OpKg==
X-Forwarded-Encrypted: i=1; AKwUvBx1OpCnjwsv4vWvePtT5fwBKlsuXNNa15LG7ErhuivoaovTY/d6vRiWsft2476/JtGBj4qy4piljQkeaoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m8MUMrFjhEfV643x90jDX2zUUjX8sQN6JyRvFFhVWIvHT9ULpW
	+gsVIZnLSfHD1wmZo1YUDSZ9aDb7pyMivtaAjT7HYwIrWlZL1UWrQZKLnt4w/xIVlW5yr8vOD6o
	83bcJ24QE2sPkGE2ZZlRuR4WYb8rjxGw=
X-Gm-Gg: AYBFou1gOmvllmmkqXc4j4WLTK/HvL/QGz1DXHFnH9NyTPRi088gcpOgS09Heh+Xj26
	G9gZ3/2gNRP3dQMsor60eBTzrQFJeNfws/XCsZRgK+Up97o+37FyUq6geYZOM0x1v4P239QcLXj
	UU+PTnCQOfBpCoe3fAilYXYHf6N8GOP5QtIl59LQrIbrwcoruz/BPFay/F265ADzka2CkRLjEiB
	/7hYAAIHRoy2yC7sCwFgHh7ie+cJfgj/VFJ0y8XE2pI0rWly1uuYoTD+LQFhrl1CTkxz8QY9Jr+
	TuRYZZPRR0+t2ZISEt85vfO3s8gsE6HTgC/gjwKXp/xdAJTXqro4N0b+QHznCAjmv2ncehRYoZo
	bPVqSrDRug+GcN9UYulSjQsK1FPc9cTX+mE09LdBBqQ==
X-Received: by 2002:a05:600c:4fd5:b0:49f:fed0:fc47 with SMTP id
 5b1f17b1804b1-4a01ad90a51mr66571105e9.1.1790843386944; Thu, 01 Oct 2026
 01:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
 <20260930133257.23210-5-biju.das.jz@bp.renesas.com> <CA+V-a8tQZONUkeZYFBTvO+L+FTnrq6AE_aJQsm7MFX9CBnA-8w@mail.gmail.com>
 <TY3PR01MB1134680E91884A191791DEC4D868A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134680E91884A191791DEC4D868A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 Oct 2026 09:29:20 +0100
X-Gm-Features: AclHuK8vK2trvJG7pwZyhY7YNxMxLrfAscaVvEO95lXZ7MjfGAVxGE8Vb69_9TE
Message-ID: <CA+V-a8u4E8XSSXH73YEUmGJ0GCBKjmZJtBS0bHJQangU_-Wkxg@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] drm: renesas: rzg2l_mipi_dsi: Add support for DSI PWRRDY
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Oct 1, 2026 at 9:15=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Prabhakar,
>
> Thanks for the feedback.
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 01 October 2026 09:07
> > Subject: Re: [PATCH v4 4/9] drm: renesas: rzg2l_mipi_dsi: Add support f=
or DSI PWRRDY
> >
> > Hi Biju,
> >
> > Thank you for the patch.
> >
> > On Wed, Sep 30, 2026 at 3:47=E2=80=AFPM Biju <biju.das.au@gmail.com> wr=
ote:
> > >
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > The register for controlling power to the DSI region is in the SYSC
> > > (System Controller) block. Add support for controlling the DSI PWRRDY
> > > signal so the driver can efficiently manage power to the DSI region.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v3->v4:
> > >  * Dropped pwrrdy variable from struct rzg2l_mipi_dsi_hw_info and ins=
tead
> > >    using feature flag RZ_MIPI_DSI_FEATURE_PWRRDY
> > >  * Dropped rzg2l_mipi_dsi_pwrrdy_off() as it is taken care by
> > >    devm_pwrseq_get().
> > > v2->v3:
> > >  * Updated powerseq API names.
> > > v1->v2:
> > >  * Switched to power sequence for handling pwrrdy signal.
> > >  * Dropped header file regmap.h and mfd/syscon.h
> > >  * Added header file pwrseq/consumer.h
> > > ---
> > >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++++++++=
++
> > >  1 file changed, 27 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > index d67e1230b70c..5263b2b8f1ca 100644
> > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > @@ -18,6 +18,7 @@
> > >  #include <linux/of_graph.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/pwrseq/consumer.h>
> > >  #include <linux/reset.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/units.h>
> > > @@ -38,6 +39,7 @@ MODULE_IMPORT_NS("RZV2H_CPG");
> > >  #define RZG2L_DCS_BUF_SIZE     128 /* Maximum DCS buffer size in ext=
ernal memory. */
> > >
> > >  #define RZ_MIPI_DSI_FEATURE_16BPP      BIT(0)
> > > +#define RZ_MIPI_DSI_FEATURE_PWRRDY     BIT(1)
> > >
> > >  struct rzg2l_mipi_dsi;
> > >
> > > @@ -87,6 +89,8 @@ struct rzg2l_mipi_dsi {
> > >         struct clk *vclk;
> > >         struct clk *lpclk;
> > >
> > > +       struct pwrseq_desc *pwrseq;
> > > +
> > >         enum mipi_dsi_pixel_format format;
> > >         unsigned int num_data_lanes;
> > >         unsigned int lanes;
> > > @@ -1396,6 +1400,25 @@ static const struct dev_pm_ops rzg2l_mipi_pm_o=
ps =3D {
> > >   * Probe & Remove
> > >   */
> > >
> > > +static int rzg2l_mipi_dsi_pwrrdy_init(struct rzg2l_mipi_dsi *dsi) {
> > > +       if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_PWRRDY))
> > > +               return 0;
> > > +
> > > +       dsi->pwrseq =3D devm_pwrseq_get(dsi->dev, "dsi-pwrrdy");
> > > +       if (IS_ERR(dsi->pwrseq)) {
> > > +               /*
> > > +                * This platform requires a sequencer. If we can't ge=
t it, we
> > > +                * must return the error (including -EPROBE_DEFER to =
wait for
> > > +                * the provider to appear)
> > > +                */
> > > +               return dev_err_probe(dsi->dev, PTR_ERR(dsi->pwrseq),
> > > +                                    "Failed to get required power se=
quencer\n");
> > > +       }
> > > +
> > > +       return pwrseq_enable(dsi->pwrseq);
> > Do we want to add a devm action to disable the pwrseq when the DSI driv=
er is removed?
>
> It is taken care by devm_pwrseq_put() the release handler
> that calls pwrseq_disable().
>
>         if (desc->powered_on)
>                 pwrseq_disable(desc);
>
Ahh perfect!

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar
