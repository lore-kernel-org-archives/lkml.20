Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793326174;
	b=Jn49QT1JOb0JAURru49k0yIPnx6YrpO0XeJIPQ8rRDgg//NBKEW1eixm7QfbWN5DO66r
	 fPDsXHCQndCUr0LbAy/Nm2k1X0MPskc0wUdHQhsTb3Xak5+CsDeR3/qRguI67EPV9HiGf
	 xam+MJRkkAvy2Hr8m31/awa5k+gzJTd6U2FypPzkmxYVVYXJBFPy+qyaueJVhFlolxWas
	 NW2195QWpNcDturQYftRrG32z5spTdLPMIxhIuIIKOqrJPzyiQP/XU5GKVHeeL6E5oZZ6
	 ESrdtgheIBZW7hgWlrGTbtDL9wlE5KwyVJ/Ixpk0Tu7Yd0GVpHEZkGaKkD1nJG9f2Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3f8Alqi33WDsSDA97+17FwHsG2CjFesCRiSUJANPSrA=;
	b=ZMJYPV4umakEe+wb81NiTWiEt/D2Bl8hmu6wqmnBNRjs6RxgrmzQbCJonbFI/Cpy9ikQ
	 nRBF/S0vL/52rr4aT0rITMg+ZQ6z+QrJBx4ZqhXN/AjoDopiJVToy14hotBgbfddLUs0C
	 TISuSnei+eS/c1HPiJnLjOorSgTT691j4oPlDMNLuRzeWfhOemQCZ3reda7pO/0C77H6n
	 ZVKAkm8gtnStUtOLcflI0+1Bj592Bd3R6/llU+QdqJghcVe3LUklqqlDUBUvlguCpqOGY
	 VnZe0AnOjzEaJhJSQ/F/z1c6A1rInswNnSvH4DVf9Ka7bzu+A2mhjdzW4fRVd1kGc3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="aInasCI/";
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F43606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F43606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aInasCI/
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so240774a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793326172; x=1793930972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3f8Alqi33WDsSDA97+17FwHsG2CjFesCRiSUJANPSrA=;
        b=aInasCI/p5WI8GihGhrfb2duGO6S8cuFDXr77uIMZeQGwtuxIE+vOIjGEU1NpufX0u
         cHZlCkg0McClEZhNrwmMUVIFc5WwKjUd975ePqWINW/3oKtlmIvr21vddIU3625onmUN
         wqAonPfx4ahhnQkDm0pyhqop11zrHsZ1e2hic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793326172; x=1793930972;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3f8Alqi33WDsSDA97+17FwHsG2CjFesCRiSUJANPSrA=;
        b=DXpHbWoaSvGum1Y7G8CtRwof00hayN9JrKiBqfb0NdWaL9j+syBhkQrb3knd5T7Mqz
         BSFIiKb4fkztyYuyy/eQli3Q1aX7jNJpgs6HbMWb4RIkllj6tCRM9LTwPomfnZL35+7M
         rVqDat5LXsuGK5UhDTOmVDdV5QL+7GP25lWI/LykcaVNsDbyIhRjV9L6MnPU6Y0idZsI
         sOe9tBlcCRhU6blTANylc3tI/DWJw+gL46qI2xWzhHdixrJ0JKbMq3cqA54XimsmBG29
         8iBLF33CQrRe3Rvbhpbz0+8Af6HFicBNCDgf5jETnhvMslhPpS3iNXu4PBc8XczFRjlx
         InDg==
X-Forwarded-Encrypted: i=1; AKwUvBxrLTlehx48UF48PG8zqrVbrwe8hQJpiHjclAWG+wsY01cd1u+RlEFjl07R0f/Bn2veuzZRiC7u5GmtvFk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP2sYaWaIC2Kt8jJdS0olX5wDHC0ClHs7pHLBVnwuOZ5UA6iSr
	6Vwa2MnP88Ks7c+xasIBcgPJHGGDLczYp7/g2oK0jMtJ7CeCKpCxgSejFmENCOTlDsaQOHuKvYG
	QPje9AA2A
X-Gm-Gg: AYBFou19k7n4Klkyc30aLJTAClmvdZ2FMonkD5IAR80BvTrfhi/lzFR13qIpFREhZz6
	ryDaKbfurVxi5pyl8LAdwxhZMMTnzSHuq+raVKOE+o6ksboCHKBN4rxMXTpnkyxtaH8qEmccdfC
	Qaeoe3itWc8QryZSotm/GNfjEOmMaNYph5aHnY2wipitjAt/EdmKZX3Z6BBA2cq90TohdRlpa9+
	AOC3vlfG8o0B2icbcFzG2ilWKZ5yVGC+HFgev4+veVUm89idQqB8yiEk1YdvS9rA8Tmanzb2Vs/
	J1TpWEF+uhcqIROhivePxWFfAoBFH6bkJJCZ5N+CucR9doveKgqxnrgw0xjUvA1lFC8DyDIt17J
	noQmSiUHUl0Nd/iGile8FuvIv/8DgAa72s9SiSbdDhWnRovlbczdu1zVtFaAyZ1gq8NpN0lklNx
	NPwiuFte8g128/s5b9uzSvdnCXlBosDCKFlR/xpmkf1txs6NT5N9kLo62Y8Bp3JchJThePcF9V9
	8IGD3Z3tXpQMxXNSoWUek5nnbCIHUt4HnI11qj53LLt4wvPLHEdIQwvyCg9Km6ExecEqKg6gBax
	eyRzi2wkXF/afMTdFtiw0qq2fVxfN78WZXMu110hZu64Ui2X7Ohw8p1+nL5Z97ObVag31A==
X-Received: by 2002:a05:6402:1ed6:b0:6b4:d7fb:affd with SMTP id 4fb4d7f45d1cf-6b4d7fbb590mr230707a12.12.1793326171918;
        Thu, 29 Oct 2026 19:09:31 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b1f836sm169748a12.29.2026.10.29.19.09.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 19:09:31 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso1424655e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:09:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzadbv4k6Xq03qWy2GIIzHwute5qtHA3v1GzKFjpZmFr7tfmjj1psOCd3FF7MH382R7fQx4H9eb1xCNckM=@vger.kernel.org
X-Received: by 2002:a05:600c:811a:b0:4a8:c6a0:c08f with SMTP id
 5b1f17b1804b1-4ac18f529cdmr13893965e9.35.1793326169533; Thu, 29 Oct 2026
 19:09:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com> <20261012-mipi-multi-series-v1-1-6a29add1ec92@gmail.com>
In-Reply-To: <20261012-mipi-multi-series-v1-1-6a29add1ec92@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2026 19:09:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UT-8tXiJ6pCDb5rNqYtjjt8O9BXSnq5_2KdcexypdGfg@mail.gmail.com>
X-Gm-Features: AclHuK9Lk8qycxKtqnsrnc0uyYp-YXlQDmL0zIXeSRUqf8YmcBt7uHhJBX5-eAg
Message-ID: <CAD=FV=UT-8tXiJ6pCDb5rNqYtjjt8O9BXSnq5_2KdcexypdGfg@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/panel: leadtek-ltk500hd1829: Use mipi_dsi_*_multi()
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 12, 2026 at 9:35=E2=80=AFPM Akash Sukhavasi
<akash.sukhavasi@gmail.com> wrote:
>
> @@ -535,27 +533,17 @@ static int ltk500hd1829_prepare(struct drm_panel *p=
anel)
>         /* tRT: >=3D 5ms */
>         usleep_range(5000, 6000);
>
> -       for (i =3D 0; i < ctx->panel_desc->num_init; i++) {
> -               ret =3D mipi_dsi_generic_write(dsi, &ctx->panel_desc->ini=
t[i],
> +       for (i =3D 0; i < ctx->panel_desc->num_init; i++)
> +               mipi_dsi_generic_write_multi(&dsi_ctx, &ctx->panel_desc->=
init[i],
>                                              sizeof(struct ltk500hd1829_c=
md));
> -               if (ret < 0) {
> -                       dev_err(panel->dev, "failed to write init cmds: %=
d\n", ret);
> -                       goto disable_iovcc;
> -               }
> -       }
> -
> -       ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> -       if (ret < 0) {
> -               dev_err(panel->dev, "failed to exit sleep mode: %d\n", re=
t);
> -               goto disable_iovcc;
> -       }
>
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>         /* 120ms to exit sleep mode */
> -       msleep(120);
> +       mipi_dsi_msleep(&dsi_ctx, 120);
> +       mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>
> -       ret =3D mipi_dsi_dcs_set_display_on(dsi);
> -       if (ret < 0) {
> -               dev_err(panel->dev, "failed to set display on: %d\n", ret=
);
> +       if (dsi_ctx.accum_err) {
> +               ret =3D dsi_ctx.accum_err;
>                 goto disable_iovcc;

nit: In the whole series, I probably would have removed the whole
"disable_iovcc" label and then changed the above to:

if (!dsi_ctx.accum_err)
  return 0;

That being said, it's a matter of style and what you have here is also fine=
.

The patch looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Everything being equal, I'd land it in ~1 week or so.
