Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D4A45DF5B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759335; cv=pass; b=mTAabHsqGKiFOJdBI16PG6VoQgIu+/jJ41TFGXDbPsIqE6Vu/zWnW+ONp+9yYwI98e/lZl9Xti8ORUZtLh83AnPV6qls0KqR3sfmGGPJgj0VP72ylHeonYhY98/0E2n7Qn1M/Dw9+yPK3ofFn0YON3WwdifJD1k9S711Vsl5SvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759335; c=relaxed/simple;
	bh=K5OhWACTMzhR2anM039XHIir0uVqO+wNNsG17y8h6SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGfzexICnLJWSCWF0kTtnDOMZNePrY4UVLGbF5B6x5ynnJBmh0HxaYFFQQYUGogYEhYdfKrWTk5bPUxX4+PQfVMgLVcRqmcygxko2qC3LXOe7RhN78uU+McWDuEPws3WCsWnZbX14uY0xVvxJHJohxoDiUwK7YxM//OtIWlL8vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R86uMiQs; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R86uMiQs"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-3468ec309afso2292416eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790759333; cv=none;
        d=google.com; s=arc-20260327;
        b=AEMX3exqiROw/5hJk9cFq3Z5PC38iyX0nLaNa17xQOHUbh+xzLHGrdMlygPxTVyJa6
         cY7WHhjwi+QvwqiR4cnn6UnZGs99/92xT2GMSHV4ITqb6ogol4rU9atemrCowpqUCzBL
         zB2FSOM7ad0QJHGW+KI6Ab+Jy+Nzdlq+Nw1kudPpDtkfMr9T91S6P3v2h1MJFD2qWmx4
         niA7iLS9M185hhWH2gLnxx7EW068c3JwOiauaz7YbaoUORr/i+QywCcJt731GCMuunio
         EQYJzKiIUVhKGMNZP0JEwzISMMoktKUECXXhsG56lD2pL8hMcq1vX2EVMX4iYw4QuFBU
         sV4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V7p6Z4nnBygY3IGhowKUKWBqT1Jl8ZZYivkVdoMSSWE=;
        fh=Yask7l+TPjlkjtsdIT0dkZGGHzK+xDoSNQkznTBzUlQ=;
        b=Xv5CZ5MWjURixzjzL7T3WohZbfgVf8bIrgOO81Cfzq+ITPGDMGuP1WMQJyJ7K0tZjf
         f4B1z1aNzDmD0abasd916/Ll8jqQ4BT1U82kjBtcXWeHAK+9Trrt6THBa0WeeLg1XSWO
         biWIocJQLk0enKuWfEwWkoaIM0b1Bk1gyxqbdo4w4CUBzKcotYOkt96VI+5R6O5hApIz
         5O7TXMbRw0jHhc93meCR8ksC0ewhPn/vAEY1Mluyjmx+3Q/Mm7O+gPHsXGKk+SuxuPu1
         vSBD39jk7c8D0xvqKEFVtkBXgmkOWYkogFuF158+tV/0w2bfu65MsIMUMeiu3BsGh+g4
         +pYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759333; x=1791364133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V7p6Z4nnBygY3IGhowKUKWBqT1Jl8ZZYivkVdoMSSWE=;
        b=R86uMiQsOTDuvLYaGHCaMW3eJXOvD5j3DU00FIZtW36Ks/W6LgLNfS+wSQ7Rawlt1J
         GINX7hVqpdPSVCbkABBbnbvWvMY4XLxRAIFYrhlNnYfOaiObbGuUzfYu/8nDQMrveawi
         /yuU+Z4YdITgmic0LfznezZTnwF9iVtOLbIWmEtVp90KmVHgLEwkomAEZt3W0OfhXBwc
         EeDmf9vzFIphZ+FB/lALjYs51Zzas/v66PEytcz9klmK2pyCuQjiSQ/3D2t9vYO5p750
         6qvUsBmescVzYlgrJ40vp+XX88Yr7Fb5Q+37Mufd0rUN96d6IDfyXIAUpg+Rg+pmmSBm
         cP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759333; x=1791364133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7p6Z4nnBygY3IGhowKUKWBqT1Jl8ZZYivkVdoMSSWE=;
        b=gTW2kqs4fi20ZGaX0+oL30IG6O4mJJ67cYUqS4ONiwy7/707t43yv0eN5OvJHd70uS
         iIjJVxJVhU05prnv5iZPOxU5gbDImMCoidwBrHfFLJLj3VA8IwFnOkXyS40vnfEs9NZa
         Fl0Wbpicponp+U/jaqoKoHWRTZTCg3MEmJ49ruI6z/KDZLK72UPkk2qCtaqJLGvzzO4o
         Tiim49/c5YxMpQ0knQJTS+8EJXoBMPsr/EiIC4TZ1C6cuzv8/xWhuaHPjE04eH14pHx7
         OSRVSpQkTpNw2bY7zFNYXdwTGPlcXOG4eTrV7k9VDEK8//eSJ2e8KYs2fme5NqxqLL5k
         xzuw==
X-Forwarded-Encrypted: i=1; AKwUvBxnFqcs54iG7vCHg91tTHBs+l3oyIAe+38RGHrz/dGTIfj+s3fdQvY8mbxBj8cyoWDjYrgcIy0zqO721PY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPQmbuy/cPauYUnSii9PaO4oZq/2RS4sbxl3tYial79mk7/VZN
	Nhmd5Dt5uE+Ia44RD+o4pIIZuojZWzg5I/txaeQuGrz5D7lsvUBVOOWKygdbYjFMbDOShptoePW
	40Q9wkVdXVVvQPdyRsnIBGu5dyRvrp9c=
X-Gm-Gg: AYBFou3oxTIQRY42+F6aSjyXO8W1ivuWW1McbIyJtEhnak9XkRPOsOF+Rq74+TgFdeC
	PS6dsnmxAXynIEnfEtc5zl6opTogfpHtR+DQIcYDW+bNvvgpT3wf4bGQjxkq+m4t0Y1cNziHqlK
	f9vX+NbjNO2jIXp1AvEQmA4ENlrLVWpc1fwfXeD5tdUaFGFAxvgvuXcHTVcFhXGggQbgmFTgDGH
	2Q5Pa3ir4WR6BFXBpJED4YLeRBYkdIcaGgJ8mbagHBvL9HiiIqx+0s58ceZPaSBFhicqHAFwXSl
	1qMmGn86qd2ryJauYnv2yR6UxVv5KeBHANu498cwB9xWCFOl0CSe7hgR3qv9RMVZIOmEX3JwmCU
	cR6d7DN1/5n/5
X-Received: by 2002:a05:7301:9a93:b0:341:fd68:89ce with SMTP id
 5a478bee46e88-34cdc6bd821mr1056387eec.23.1790759332923; Wed, 30 Sep 2026
 02:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-7-clamor95@gmail.com>
 <arzNgbx465QIKYdX@orome>
In-Reply-To: <arzNgbx465QIKYdX@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 12:08:41 +0300
X-Gm-Features: AclHuK_GrgB1ybpXzB5TqGoO9XwCnkq9EQsObVGEae8urTG4uQ6PfBurcWJJG5Q
Message-ID: <CAPVz0n2QdSWL8=KBXnsQQkdNEJ9m6HSQ0+6mJji_RHZ8QgXN-g@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] drm/panel: Add Hitachi TX10D07VM0BAA and LG
 LH400WV3-SD04 MIPI DBI panel driver
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:02 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 10:05:35AM +0300, Svyatoslav Ryhel wrote:
> > Add a driver for panels used in LG Optimus 2X P990. Both panels are 4"
> > WVGA MIPI DBI Type B linked to DRM encoder via RGB to DBI bridge.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/Kconfig                 |  14 +
> >  drivers/gpu/drm/panel/Makefile                |   1 +
> >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 396 ++++++++++++++++++
> >  3 files changed, 411 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> >
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index 747f47347521a..47962197a9c76 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -273,6 +273,20 @@ config DRM_PANEL_HIMAX_HX8394
> >
> >         If M is selected the module will be called panel-himax-hx8394.
> >
> > +config DRM_PANEL_HITACHI_TX10D07VM0BAA
> > +     tristate "Hitachi TX10D07VM0BAA and LG LH400WV3 MIPI DBI panels"
> > +     depends on OF
> > +     depends on BACKLIGHT_CLASS_DEVICE
> > +     select DRM_MIPI_DBI
> > +     select VIDEOMODE_HELPERS
> > +     help
> > +       Say Y here if you want to enable support for the HITACHI
> > +       TX10D07VM0BAA and LG LH400WV3 MIPI DBI panels found in the
> > +       LG Optimus 2X P990 smartphone.
> > +
> > +       To compile this driver as a module, choose M here: the module w=
ill
> > +       be called panel-hitachi-tx10d07vm0baa.
> > +
> >  config DRM_PANEL_HYDIS_HV101HD1
> >       tristate "Hydis HV101HD1 panel"
> >       depends on OF
> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Mak=
efile
> > index f2c9c80a218f0..414267a49d922 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -27,6 +27,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) +=3D panel-him=
ax-hx83112a.o
> >  obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112B) +=3D panel-himax-hx83112b.o
> >  obj-$(CONFIG_DRM_PANEL_HIMAX_HX83121A) +=3D panel-himax-hx83121a.o
> >  obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) +=3D panel-himax-hx8394.o
> > +obj-$(CONFIG_DRM_PANEL_HITACHI_TX10D07VM0BAA) +=3D panel-hitachi-tx10d=
07vm0baa.o
> >  obj-$(CONFIG_DRM_PANEL_HYDIS_HV101HD1) +=3D panel-hydis-hv101hd1.o
> >  obj-$(CONFIG_DRM_PANEL_ILITEK_ILI7807S) +=3D panel-ilitek-ili7807s.o
> >  obj-$(CONFIG_DRM_PANEL_ILITEK_ILI7836A) +=3D panel-ilitek-ili7836a.o
> > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/driv=
ers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > new file mode 100644
> > index 0000000000000..d2c3b63649288
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > @@ -0,0 +1,396 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/media-bus-format.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <video/mipi_display.h>
> > +
> > +#include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_modes.h>
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_panel.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +enum panel_dbi_id {
> > +     PANEL_DBI_NONE,
> > +     PANEL_DBI_TX10D07VM0BAA,
> > +     PANEL_DBI_LH400WV3,
> > +};
> > +
> > +static const struct regulator_bulk_data panel_dbi_supplies[] =3D {
> > +     { .supply =3D "avci" }, { .supply =3D "iovcc" },
> > +};
> > +
> > +struct panel_dbi {
> > +     struct drm_panel panel;
> > +     struct mipi_dbi *dbi;
> > +
> > +     struct regulator_bulk_data *supplies;
> > +     struct gpio_desc *reset_gpio;
> > +};
> > +
> > +static inline struct panel_dbi *to_panel_dbi(struct drm_panel *panel)
> > +{
> > +     return container_of(panel, struct panel_dbi, panel);
> > +}
> > +
> > +#define panel_dbi_command(priv, cmd, seq...) \
> > +({ \
> > +     const u8 d[] =3D { seq }; \
> > +     struct drm_panel *panel =3D &(priv)->panel; \
> > +     struct device *dev =3D panel->dev; \
> > +     int ret; \
> > +     ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE=
(d)); \
> > +     if (ret) \
> > +             dev_err_ratelimited(dev, "error %d when sending command %=
#02x\n", ret, cmd); \
> > +     ret; \
> > +})
> > +
>
> [...]
> > +static int panel_dbi_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     const struct drm_panel_funcs *panel_dbi_funcs;
> > +     struct panel_dbi *priv;
> > +     enum panel_dbi_id id;
> > +     int ret;
> > +
> > +     id =3D (uintptr_t)of_device_get_match_data(dev);
> > +
> > +     switch (id) {
> > +     case PANEL_DBI_TX10D07VM0BAA:
> > +             panel_dbi_funcs =3D &hitachi_tx10d07vm0baa_panel_funcs;
> > +             break;
> > +
> > +     case PANEL_DBI_LH400WV3:
> > +             panel_dbi_funcs =3D &lg_lh400wv3_panel_funcs;
> > +             break;
> > +
> > +     default:
> > +             return dev_err_probe(dev, -ENODEV, "Unknown device %d\n",=
 id);
> > +     }
>
> This is a bit pointless. The only reason you need that default here is
> because you have an enum that is "none" but that PANEL_DBI_NONE is never
> even used.
>
> > +
> > +     priv =3D devm_drm_panel_alloc(dev, struct panel_dbi, panel,
> > +                                 panel_dbi_funcs, DRM_MODE_CONNECTOR_D=
PI);
> > +     if (IS_ERR(priv))
> > +             return PTR_ERR(priv);
> > +
> > +     ret =3D devm_regulator_bulk_get_const(dev, ARRAY_SIZE(panel_dbi_s=
upplies),
> > +                                         panel_dbi_supplies, &priv->su=
pplies);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get supplies\n"=
);
> > +
> > +     priv->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_=
OUT_HIGH);
> > +     if (IS_ERR(priv->reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> > +                                  "Failed to get reset gpio\n");
> > +
> > +     ret =3D drm_panel_of_backlight(&priv->panel);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to get backlight\n=
");
> > +
> > +     ret =3D devm_drm_panel_add(dev, &priv->panel);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "Failed to add panel\n");
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id panel_dbi_of_match[] =3D {
> > +     { .compatible =3D "hit,tx10d07vm0baa", .data =3D (void *)PANEL_DB=
I_TX10D07VM0BAA },
> > +     { .compatible =3D "lg,lh400wv3-sd04", .data =3D (void *)PANEL_DBI=
_LH400WV3 },
>
> Why the detour through that PANEL_DB_* enum? You could just pass the
> panel funcs pointers directly via .data here.
>

Passing API/OPS via .data is discouraged.

> Also, looking at the enable/disable sequences these are in fact two
> different drivers, with the only commonality being that they happen to
> be used in the same device. Rolling them both into one driver seems a
> bit odd.

I did this to simplify maintainance. Both panels are used in the LG
Optimus 2X. My assumption is that LG switched one to another at some
point, hence they share same timings, controls and supplies, but
differ in en/disable sequence. Additionally, these are the the only
DBI Type B-only panels in the kernel, from what I can see.

> If you really want to avoid duplication, maybe they should go
> into some kind of "simple" or "generic" DBI driver.

DBI Type B is not well supported in the kernel.

>
> Thierry
