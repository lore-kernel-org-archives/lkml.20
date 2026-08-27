Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE7B533D6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848328; cv=none; b=uo16oS/w6EBPR4Ne915r5X+vX0MKQinn8irERXjuB/AjGGB9zOMzxkqUmd8WjWLuF0wNqikmc04hotR9LvjNqtQDH8l7/dPBkNUmyfbBRAgPcqXx/ZcY66AeaM0yeoScrnq3X++o3K9kneu2G/9Au73rZ0bELCxV7R6PdFIBvG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848328; c=relaxed/simple;
	bh=SiBxTrG58Gv3M0sYoaL+6q+gsY8zYTJ3C5/IBL4T8JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsPORb9PZLmMdGraebbP/ba8H4v71LyUREW4wxWy1Urru/wg+s0q7nqT5gjaSab5Ni294PgaI9d6pehl5vTkqQwuMhnKlT3fTGBvzxW1/1x2f+Rx4+ARnJlAjaHAYGuu1CilInzgYxRm0f97BxkSoxtYESjb0+3irPYHahIUrJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H0jDH/Dg; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H0jDH/Dg"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a3fda88184so3858964a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787848325; x=1788453125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzMGBct2T5j19pFzqr+r438MOOPyyfPFxEllccYYNUA=;
        b=H0jDH/DgawITHDOVpeV9AdxN9xFPi/gXeYzNMB4Ia/pQCkd9imwztu4Fxg0HxhOmaW
         O8qT8+ToWVjhnDARs0F4pG4lWuFkNjRmyva86PDn17lQ/Pjfh/ophop+G+mA6RasOpyn
         kNxwryNslj2cr0ysIA+Q/9p09DKHUhDQrLftA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848325; x=1788453125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzMGBct2T5j19pFzqr+r438MOOPyyfPFxEllccYYNUA=;
        b=mFEWIIac1erVhs4cngSAHQDOyqAMx0xehQts5JRQEXwVP7kym1/t6iX18g5bFg7wgl
         XlopZ/swu256/e9s728jx2RAq3q3fc2ZHcwrgG8jdMpuTSpWgkyjTYsB+aoe04eOyXmT
         Xg2oypLlrO8wqtllghgKNdNnKQUEoltbmFBcnPStqMIcTWGBszW2NApiWEOZjrd8EBcy
         2ahlnfHKphpyhsTq72sQ1iGCu2ddEVcUFZo0YNOZmdA2OquEYIeSXrA+z8AYKw5HWFXD
         cVzLilyOfKBTwcg1sWe+FNpV51vp3G5xlfENPLrMIwLJuqw3ZrjSd+bcq4P9giqO7/Vo
         6B0A==
X-Forwarded-Encrypted: i=1; AHgh+RpJ7kfNBiDk5+BAWtzK02cjPfeclQvdM6qwpsBWIX3U9qrvaZqwJlZBinWI27xcklMPSOZz79EbHWQ26zw=@vger.kernel.org
X-Gm-Message-State: AFuF++kywT6a247bdtHzUIv7p86wkl1IEf/SdsIPmUrc0iohVQ1RNIID
	yPVqGLDD04fwyNu7eRg/BrBGLa6R1JKm6uLFiYZzkstDZXv7TG5x+ZmfycVXPoYCp73j9ExQlmj
	+1ObxHn9n
X-Gm-Gg: AR+sD11tRGftrkL9uWkO3/u+NtExJ2KQsACpiDQWK+XSaEXlDmAlEruzXJlgXPQBgGF
	iLvksoh+JAqQy0o/3EIQVZ7jYk/S6rq/6wgcqI7VZbPtfmTtCHM2pH06//8xNHWYBlYU74dteYa
	37hmj0RgiHPV97HbkWUNIOkza6YnXPqimD7RWloG9z7zFinEGh/r3huZbFa2hLIhgkLyl6vVpb0
	xCRxHJ4CpLj1zA4Xr/T4pCPKBkmI0C0TTKyoXjcWSc9RywPqrbO+FSljTr6Ur5A8a6L4Wy2gi0u
	pM9nSgLlacnyDA2iHAKGsUttlRdNgAUuE9C36qWgij6Vj88HibydDVJXAdi0Qk78iL3JmdwnhFb
	ER9JfsgdZDK2qUWHou4vXEbP/ngAg4XlYcaj4skDlD5xvXEQhwP3KZnPYbICKCJYm7PVNavP7F2
	uyz1wAX+aL1KP9N6k0R9lcPIhJUoUtify2R/1U5MLV/RLGVx2d6FSqCu6XcHVunvMtVf0wHqLTL
	Zm8j/vRnrPw5fgKLc7+Oa5Ir2w=
X-Received: by 2002:a05:6402:190c:b0:6a1:29ca:681e with SMTP id 4fb4d7f45d1cf-6a5df5e18c6mr16001291a12.7.1787848324480;
        Thu, 27 Aug 2026 09:32:04 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deac9a21sm5376571a12.25.2026.08.27.09.32.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:32:04 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so2618188a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:32:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq2kOs+xTQCzeSZaYvKnPROtMdWgPyhf2dCI6mOgAG8ITP2P7jARigtDbbuTpMmaehAUlrUOyvvToLOgVM=@vger.kernel.org
X-Received: by 2002:a05:600c:1d8c:b0:49b:916f:1471 with SMTP id
 5b1f17b1804b1-49b91c1df21mr2431435e9.3.1787847852763; Thu, 27 Aug 2026
 09:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
 <20260825-drm-bridge-drm_panel-cleanup-v2-4-c6c88ba7ffd2@bootlin.com>
In-Reply-To: <20260825-drm-bridge-drm_panel-cleanup-v2-4-c6c88ba7ffd2@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Aug 2026 09:24:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VtDHWX5yXDE_CSMEZY9nTAd9372kkUAuti1K09zLywig@mail.gmail.com>
X-Gm-Features: AcwNN1VF3py5doozl6LD9Pr4fEpbkFlfT_OL-hoHyQ67imrOzi930oQk0T6UzBQ
Message-ID: <CAD=FV=VtDHWX5yXDE_CSMEZY9nTAd9372kkUAuti1K09zLywig@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] drm/bridge: ti-sn65dsi86: don't select unused DRM_PANEL
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Sandeep Panda <spanda@codeaurora.org>, Franz Schnyder <franz.schnyder@toradex.com>, 
	John Ripple <john.ripple@keysight.com>, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 25, 2026 at 3:11=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver does not use the drm_panel APIs at all, so no need to select
> DRM_PANEL.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sandeep Panda <spanda@codeaurora.org>
> Cc: Franz Schnyder <franz.schnyder@toradex.com>
> Cc: John Ripple <john.ripple@keysight.com>
> Cc: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 043596801a65..d46aa2eb01b5 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -474,7 +474,6 @@ config DRM_TI_SN65DSI86
>         select DRM_BRIDGE_CONNECTOR
>         select DRM_KMS_HELPER
>         select REGMAP_I2C
> -       select DRM_PANEL
>         select DRM_MIPI_DSI
>         select AUXILIARY_BUS
>         select DRM_DISPLAY_DP_AUX_BUS

Looks right to me. Ages ago it used panel APIs directly, but not today.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I assume you have a plan for landing the series. If you want me to
land this patch on its own to drm-misc-next, please yell.
