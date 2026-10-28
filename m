Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793212786;
	b=MVV9dIu5D/M9811LrD8s7kDqU2PU6+Jy8yrtPeNlXJRPSWIiku4IBYls2PPW+AA5XSHR
	 C40yNH37q88TTsJQQ4x99iWxliQlzO637En0dNXn246Jiw0hKUwwkshFDo9O2Fe5JPuh2
	 5A/VNhgnR5tfYqwp/WtpSbSJTwY/hAPNUxqjcyumyDEratfs3JTmH3jrVnfLJTT06+ftD
	 1LsSVxRRHRlX3oQF5H2BCeVzhWWiiddfBK6iTgRtGibsNbp76ZmElHjKkX5amiJcg4YAt
	 XaKb/bLaQ5SwC0v+MDNkNbRiUapVMW2oHl9VA7L/pSIwmXtzedamhGhPyBbN9U9KJwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lzWBDFykZYmQVbPs60wnZX1zpllZ/48DYMT9Prys7GQ=;
	b=sVVNyVv8Ddlu3XFrBw9PlFeUn32dj4HYiiX/V8OYwrQZfz6m9LWkR+J/a6MvzF3A0Rin
	 21DrNq3g2d8K9oZbYHaooIGf8aiNmBHAdf1XFy37BHMAHe0LaKQd1VZROztMGczLmTueK
	 2miRIRC8VffwB7EAaPZnGh1EqlOcLMA6GR68Tz2OGxu1fFNbEuHWyVcMIHgys0qCTCqwu
	 E6i36tVKQ9x1NxbvRcLreSwnQqbKvdbW8W2Vkcop11zD3zy2UIG3u0J2IT0q1sa68ErPr
	 oup+wnnjrWA8CZc7Yj+cFnRADgOhrn6xm5EfK1ft7H6/vcyDWKiFZEkqXZTJLFquGJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=sAcaLbhJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E51606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E51606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=sAcaLbhJ
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a6fb4040cfso462751fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793212784; cv=none;
        d=google.com; s=arc-20260327;
        b=eRLzl5q9qvc7Wi9Ju8kDFE0pgkS9n2L6Ip2/dD1FFmLytUaEYjSxuev59fFR7vk96a
         PaC3A7CPdRIz5uzRkKVhKpAOm4nnqL5KFKFBCLypZyLiRZhhdeexlIYnt0GxP1CfU04f
         Mp9kxdyNAOa2bdwiYxPtA1zDgh36f0gUDStTV0WPm4tYxiRlzObrzQL5wgjqDpSX55PM
         SjGdnu2hQpsDVSs1syerW6TT/L7tlxyF2ifEX4T6NxQX6dsk66pLRk4ZcyBr/Y2QwDjD
         j/dkkLYPxBoHWlKC0pjGPJe8Ax1hfecj+hJtCHNEHI5dijFoz/h9Wai17R/nqrYAgJDp
         VC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lzWBDFykZYmQVbPs60wnZX1zpllZ/48DYMT9Prys7GQ=;
        fh=niPNAgNJxy3JRFBn3vpm6FSKhEM6t5sEJ15WmIO0DBU=;
        b=QcE9qLIWXV55EPRuLnZUawc8iGZZAtQ614ZAakFakGOCIOOSmRMibCwdBV+ag2jU7A
         b18vA2f3yyLmvbddmOxG+QLM74/EdSXcQeNpo1z10D38ASWXg+KzWLH1h9mnZHHzx8kv
         ExYfRbSqUapU++og1uWoZgibxAjsZsJb0TzN9/UrDzkAkpe7LelSF9GEJy3jfoJceLEv
         oKBZq1WOFNLwJa+v+vpC708df3lsKtRcj+stcTRzy7vnn2tWeE4Gj+E1DUZWShCE58h0
         j8Uxxu51rrvXEqZVhZPM+NCueawSmKE7UJDs9QOUmRI9sBy7fACdJTb9C+H+Q7vlLEVY
         1HEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793212784; x=1793817584; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzWBDFykZYmQVbPs60wnZX1zpllZ/48DYMT9Prys7GQ=;
        b=sAcaLbhJ4PruFteD+5ifr+3dehHdYOyHdN7/Vug7o1ZVK7UP2t8RBFc/6vSdb6NVfW
         ThBR0SoY8CmwCphHBJ4Gdfp50QsB+g+GP1v8j/NbV+3kxjFc/6yZQLfGdSvgfRA22mJw
         klP3MK7XkXoieaY3VVvZuj6Aex00KfJw78O4rMEcY+0TXJE4wSJG6PinXcn8/8YwY7/Y
         mOWYqgQ+4Skcd0dkw6+z+9xC4Cua95f/TjhuTrP4U+5SO3+Zb7XbyqoDj+viEo8LxcuC
         FIUDPwrr3uj6U4tbAk//zbh/VHK2umu7B1EbEoZAf7wqMMRkBiLyvh6+cyhsSWPfjjs5
         8+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212784; x=1793817584;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lzWBDFykZYmQVbPs60wnZX1zpllZ/48DYMT9Prys7GQ=;
        b=k9lBzzDJz9bI7t7Sq+S49RZwpbvrMP/r5rLG2w8f68PiqfJsVGcyYSCdbPyrK7aK2L
         WIwZTk4zBCSngZWV8zZYIX1acDCgkxjJWJ7+R8tE+52A4A8TIzHBTOzsyUN5s/nWbpsW
         uj1LxYeXCpVx4U/OO0rmC9ASBLlEVjZWsTzOOPqTn0LE6lL4qIGWJO0A7wxDlf7xaw4s
         u4Tayr190AAOpHxBOcrP0EBMGw4p+2hveAfn50mnOgqjKKNWgioIc5T4gfwUlA79L9ih
         smNRf/EtNfgQeHA8NKkwt9pfZwmQjc0uO6xJiA/61OQ/chSDJJV/BYHlBXy1LzTTR0+3
         rizg==
X-Forwarded-Encrypted: i=1; AKwUvByVEsHDwy9kHVLJGtVEHdbwlVxxMyiTgGjLmYszec3hxhlF9IXHEbvFU32tHHYuNsdGGnR+RcO6fOb/G0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLjTQPJvT885dpEkqYup/wKIoZiTESKTRfk7NsHtswjZvN1oYu
	Sw7ecSKwhfU2dWPsUKKVSX4jyOagK18oa6t1Q5bWrwxyFEQ6/TYsvnxk8J7NpgqmX23k3rXFfrX
	9AKgVjCy6Germu96L274i9DNdXaLhfbtuJbmfAIioTg==
X-Gm-Gg: AYBFou3O6gH99WE+mxCTfA0rbPyYUyKbbtI8Op1B/T6Kwsxg0/EKQEz6QE1J5Mk3zG/
	4QnoCaohJ4QwZfONn1VlU8IKwiakMsMc/xsq5iHhzAp6XSRA90/x29jlZPvehg4mcaarPZfcjMJ
	aPWTMzDgCAlgH3277CSeTAs7+bfC7D0rjAJUNVyTXDMbfwRQ4TE5zENCaiYM5w0HNjjarX14tpL
	fTUsJeYETE+DDQNZ3rHxOmbBiEKX1wg+YCJersLng7GvRLwKHCuQthP29/LagSskMg+yvvzdXm9
	fvHMyLlrzesvT84iWjYdJ9ld7i97+bEy/KZHGRF0DiG0QhU2y69GsgBT2Me982XNjfKISoGPzRO
	03SplRwF78Xv9yHUk8elBLC9HllLWUEIDtYfB7TgakAtVoKBGwJ+TBs0dCi4XDofhnsmPjPrFEF
	Y9vX8dFmFi29q+CtDf2QBocQ5ruVdTPW610iwrz9OJp6hzOH/Dme9texIgol6uu8xdnfw+JtZFL
	A==
X-Received: by 2002:a05:6870:702b:b0:491:88f1:f3aa with SMTP id
 586e51a60fabf-4a8bb48c1b5mr2356106fac.26.1793212783847; Wed, 28 Oct 2026
 11:39:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026164028.78792-1-lucas.tanure@neat.no> <20261026164028.78792-2-lucas.tanure@neat.no>
In-Reply-To: <20261026164028.78792-2-lucas.tanure@neat.no>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 28 Oct 2026 18:39:27 +0000
X-Gm-Features: AclHuK8Od9Fw9YArha1MRLfNbwD9hyqoyIn5oK-539amYVA4Yy6MtEUKuv8b45Q
Message-ID: <CAPY8ntBg==BaznZcnm+zj+GWcooDeo7fW3_WfyAAEes86BNhBQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/vc4: hdmi: power down the BCM2712 PHY when the
 output is disabled
To: Lucas Tanure <lucas.tanure@neat.no>
Cc: Maxime Ripard <mripard@kernel.org>, Dom Cobley <popcornmix@gmail.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 16:40, Lucas Tanure <lucas.tanure@neat.no> wrote:
>
> From: Dom Cobley <popcornmix@gmail.com>
>
> vc6_hdmi_phy_disable() is empty, so on BCM2712 the PHY keeps its PLL
> and TMDS drivers running after the HDMI output is disabled, until the
> next vc6_hdmi_phy_init(). The TMDS clock is therefore not stopped
> between two mode sets, which the SCDC clock ratio change requires, and
> the idle PHY wastes power.
>
> Reset and power down the PHY on disable, as the BCM2711 variant does.
>
> Fixes: 0b1dbe82e051 ("drm/vc4: hdmi: Add support for BCM2712 HDMI controllers")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> [lucas.tanure: Rewrote commit message to clarify the issue and fix]
> Signed-off-by: Lucas Tanure <lucas.tanure@neat.no>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> index 56e6a35da357..5040f014bf7e 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> @@ -1197,4 +1197,9 @@ void vc6_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
>
>  void vc6_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi)
>  {
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
> +       vc6_hdmi_reset_phy(vc4_hdmi);
> +       spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
>  }
> --
> 2.56.0
>
