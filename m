Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793973658;
	b=C6mbUy2VYy77ptdRghd3xPx+sz1lgNQfnxSQLTfsBRloSFbKUyI+Mx1l5zKodSKf4Lnz
	 hdLKky5vOtFpshI9ufeemg4LWHqJJ8If8ZVABjhXpzlvq4YY3PJm301HcDy1LCuh+e0cL
	 577be9xj069zmK8CCZJW08mcCsXuPYkSzmqjtOyw8ufJVrhHnjFlULLBvy+P5DbD3AUHy
	 12ylGnmX0Wyf4vGVSgK2+wC1NzrzfgkbdHYwWDXruMLWo4n6GulFdTxp8/xBZGPUoofXg
	 cJeeZmEHYb8Lh1K+i+uNyDsO2NpP3QYR4iWTwjgYxkaI7Ko2yQ5qOV62bjdKuuDZK5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N4ROuVU9vfjyHzDgItD3nKZQjrXj2RH+3oWdZlQA3tg=;
	b=yd63Hf0rbe/A8jvJyYZM6rgQSE1zOPbqJJsrusLG7nW0D003g/GOMj2XaqwjyeM8eN0i
	 tT6lb6thbO2a51c87NmwDmoyjxIig/4vkld36maAoIsarr5Jg3XKX/xjQE39IN3SIsBUJ
	 HRK0Yo/BL38Ud3rc0+bA6ba6AzIw0CMQ5FEziSbxw/aNJ05Ib1DVtNX/iF0v58uuo0wAG
	 OI1c+iBLbEM7Qi32XoffpIq8s/cRjEESYILJKpEghN5JkjH5p8I9TYvDJ2cG9AyuYByLS
	 81DcaJkTq66fQFPuTNefrgYaWZBQteBHOJnjj2u6Rf7FNlFkb2RTZUbTDdTao1eblfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6KMw97z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD2D606EE82
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD2D606EE82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X6KMw97z
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535a54bed9so981624eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793973657; cv=none;
        d=google.com; s=arc-20260327;
        b=DaecDDD94Tp0JtqBoUw05FhrfGbHPfAnoafF/ZjL8Kbc1sLXAIljIhLVWR8a1NKkWr
         8a4hae7l9q1q66iUurtFpZefGtHMeUHiSvF6HvKSdxcKXwizaCBuEa5q/QqNd8LE+5Ih
         w0PMfXU4HaWwtqvM4I/cbzRGoVIW8qeJmuQB7LGjx+Kqs89yFXrAVGGo5FnZ7PXwBA3D
         a0GIgdNYCorSlWIfVXbJciM1FOe/dfLZP8vxDzIK5X5bYYMU79K8WARfcdFqGoUJbtv5
         0L4o8X+56GUSs4BrxzJ11QJWylh0TgDkSm060cYLZ/Kn3qdYjTyBqrQz+AN4cXq8Uney
         cqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N4ROuVU9vfjyHzDgItD3nKZQjrXj2RH+3oWdZlQA3tg=;
        fh=w69g+XL2eeTXoFBy3v5t9eHhtAgMj4PbnUxGow8oI2w=;
        b=K4puOJ7WmZBR8QPxMTS5SPoSBkbb3ebsk1bJXkTeVxeqjtIR71VoA0MW9VDK7bCFDp
         wwoR3WJiiK2dwT4NHzuTX6wYwTCtT8fKaJr1LQ/W7VLo1J5z+lTNvOjszIvoMpBE0/Dl
         6do9PWRbZ39VEvmdOwbdKduoBVw/IWLpiylchV07jzLm0U/MqopJyFRqIjrUc67uVAXD
         ZmNnvrYIzyid+m5uYNQlALAusalb/SjxvVWZ7pa2teSyKy2/k5Wagk5qwZiTnv5IyGYw
         EnXeolhxfCmyByMsuNk1wfo1OPJneyo/77q8/1BmuI6GcOTEZqoBsjIam76cHJ/HFg4G
         DhfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973657; x=1794578457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N4ROuVU9vfjyHzDgItD3nKZQjrXj2RH+3oWdZlQA3tg=;
        b=X6KMw97zBJaLw9npQYgU+zPk0K55Bo5Binv+n7TNlrFsT2AIDpjJCw0Bs3eZJWBmZE
         AuDXQ9oIz5ILpGb5NnE+alzi7Cm0hhxrj0ujTu4uJRW9Cc9ZkwRw6Z0lgpkedPsfaU14
         JiiMFe4lRA7aKQWZIeaohEye7HoPjWY2m4Sk2TwQl+/anOOx3q7if9Pue4V/qcxQIZhc
         4wxHg6qZK9E39Nc6aqtzlsU7PqE2EC8I5wgAiQOm8etFopaFn1F1q3XOPTGMFYvf287y
         Jpym/YDs0EnBCTTjIBfIyKN9Js/qzq0oqqfI7k2I6Ivk5MG+erpAZCbmSdNdBRRPWOnr
         buFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973657; x=1794578457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4ROuVU9vfjyHzDgItD3nKZQjrXj2RH+3oWdZlQA3tg=;
        b=h/ZTOJ5YqhKvtSaciJ1a1J63TG2t9Zy2/xpmYpceKmUPPABxDLRiTH/wBCSoyTH59Q
         xy1hLOQlCO+fHSsT/cuPUSFjzFW3qv3fW6y5FaGWSNUQXVT3Pz3cNPV4fxcy1+20uvW5
         hQC0LBY1zrJ3t6Zh5GwVRnp92Ov0FKCCrjKhigdu5VAgE1eZXzp8BdyuJ/z8Vr6kR0aF
         WW1i94x622VJJSAVnptpfyBcbUucuxRvrVa1BkrrQUEdfETvfXQdvuPHoXAX4mzilGxL
         dLduINWjEAjIkNT3A7c/5dxAqeFE77SmSH/ekeaWBfS74IpvQ1nHnCl8DzaLAT5yikNv
         KkVQ==
X-Forwarded-Encrypted: i=1; AL+hErHdpAgieHn5x7TuvkzKD6eBfGyQxr/zVAvjwnTNyXjYhA20avNSKpg2CbbISrBJ8L6Ih74kPa5VJr8PXX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l2X60s0JXcEZ1upI5Vq5ereXsU/W3r/F6vBHV6BbBPwGkCdXP
	W0XxFPiL1BswG4JB4DTyv2ROCfFTU68i/gNKn6bZx5HhgIkVYAQECuzVdoMsWRx2g3cg67fHXXH
	R9aBfnuGgZ3nAQH5vkaTv/N7+NJ6OlAc=
X-Gm-Gg: AYBFou2+1cPnsmcfJkPdk2z9THKK/ua7vkDXjPZV1oSAQ1NuGE2p0E8CGAK3BKaBrXp
	3/OJJbHmw3uOg8qpq/GBVXvvVjFGp7XsaYSJFbHL6+UxlwgJHJQ3Fn3yq24bQGGIWC0Kn6KAAI4
	izBB0m+0+3qilds5OG42ZXlEEADGj+9hbIL/6N7nbHLyfwnGrtZ2jwIxT9Gr/qyGLg7C+HRS8Ww
	d7ftRWAQWpVRO7xiKy7emwNDyx0ffT7gHSS7rm/iOccb5RiACXL5AcQNi/Z+JljKcdzBAQgYNEq
	MyEmhau/tZFWS2BbHL5Izs5jl50UnvsBzok00NinOdys7erXTgzAelk1vT9oT/jkEdnJXa64QtH
	2hJ457d7jcf09cx2ensQ6/7dan2AhKHrjVR9Mfx+k/ZOROcnjfBh3TkxEQPXlxDEAPrX813wpuq
	YeIGu0SINkVt2LgTMb+BawnbK5CHTmPA==
X-Received: by 2002:a05:7301:c88:b0:36e:1fbe:357a with SMTP id
 5a478bee46e88-36f75443c1cmr3326733eec.13.1793973656931; Fri, 06 Nov 2026
 06:00:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-3-clamor95@gmail.com>
 <au3TcHXFt5Yhs_V8@orome>
In-Reply-To: <au3TcHXFt5Yhs_V8@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:00:45 +0200
X-Gm-Features: AclHuK_Yq17ZZfT-X8-aPL0HIpgqp80MKKwHsNn8Kpc_N4CDrvvxE70OSsxRMSo
Message-ID: <CAPVz0n0ngn4nf9uTOsM6OKB9jgTnJN1FrPp0UyeHwuAwoL5_tA@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] drm/panel: Convert Hitachi TX10D07VM0BAA to use
 MIPI DBI bus
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:19=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:02PM +0200, Svyatoslav Ryhel wrote:
> > Switch from a generic platform driver to a dedicated MIPI DBI driver.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 167 ++++++++----------
> >  1 file changed, 78 insertions(+), 89 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/driv=
ers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > index 83c2af1be9755..d5d7ba2096608 100644
> > --- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > @@ -14,6 +14,7 @@
> >  #include <video/mipi_display.h>
> >
> >  #include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_mipi_dbi_bus.h>
> >  #include <drm/drm_modes.h>
> >  #include <drm/drm_of.h>
> >  #include <drm/drm_panel.h>
> > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_tx10d=
07vm0baa_supplies[] =3D {
> >
> >  struct hitachi_tx10d07vm0baa {
> >       struct drm_panel panel;
> > -     struct mipi_dbi *dbi;
> > +     struct mipi_dbi_device *dbi;
>
> It's somewhat difficult to exactly see the difference between mipi_dbi
> and mipi_dbi_device. Maybe that should be explained better in the cover
> letter of patch 1? Or the documentation added in patch1.
>

It is already documented in detail in the drm_mipi_dbi.h

> >
> >       struct regulator_bulk_data *supplies;
> >       struct gpio_desc *reset_gpio;
> > @@ -36,13 +37,12 @@ static inline struct hitachi_tx10d07vm0baa *to_hita=
chi_tx10d07vm0baa(struct drm_
> >       return container_of(panel, struct hitachi_tx10d07vm0baa, panel);
> >  }
> >
> > -#define panel_dbi_command(priv, cmd, seq...) \
> > +#define panel_dbi_command(dbidev, cmd, seq...) \
> >  ({ \
> >       const u8 d[] =3D { seq }; \
> > -     struct drm_panel *panel =3D &(priv)->panel; \
> > -     struct device *dev =3D panel->dev; \
> > +     struct device *dev =3D &(dbidev)->dev; \
> >       int ret; \
> > -     ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE=
(d)); \
> > +     ret =3D mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SI=
ZE(d)); \
> >       if (ret) \
> >               dev_err_ratelimited(dev, "error %d when sending command %=
#02x\n", ret, cmd); \
> >       ret; \
> > @@ -54,10 +54,6 @@ static int hitachi_tx10d07vm0baa_prepare(struct drm_=
panel *panel)
> >       struct device *dev =3D panel->dev;
> >       int ret;
> >
> > -     priv->dbi =3D dev_get_drvdata(dev->parent);
> > -     if (!priv->dbi)
> > -             return -ENODEV;
> > -
> >       gpiod_set_value_cansleep(priv->reset_gpio, 1);
> >
> >       ret =3D regulator_bulk_enable(ARRAY_SIZE(hitachi_tx10d07vm0baa_su=
pplies), priv->supplies);
> > @@ -79,123 +75,116 @@ static int hitachi_tx10d07vm0baa_enable(struct dr=
m_panel *panel)
> >  {
> >       struct hitachi_tx10d07vm0baa *priv =3D to_hitachi_tx10d07vm0baa(p=
anel);
> >
> > -     panel_dbi_command(priv, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x00, 0x=
03, 0x1f);
> > -     panel_dbi_command(priv, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00, 0x0=
3, 0x20,
> > +     panel_dbi_command(priv->dbi, MIPI_DCS_SET_PARTIAL_ROWS, 0x00, 0x0=
0, 0x03, 0x1f);
> > +     panel_dbi_command(priv->dbi, MIPI_DCS_SET_SCROLL_AREA, 0x00, 0x00=
, 0x03, 0x20,
> >                         0x00, 0x00);
>
> The majority of the changes in this file are s/priv/priv->dbi/, so maybe
> just make it so that priv =3D priv->db and keep the changes to a minimum?
>

I will consider this.

> Thierry
