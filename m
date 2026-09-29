Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EFF52E064
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699398; cv=none; b=PUcSCBH1lRGz9QSs+UfgWeUwebzrcMC9K81zfQrR6+05t3wBWhSsuf7Blj7UrTbBfr9HxGZcrIfspqfiS0x5a2mB8EYCMgTz/qZl4mklmBAMoDXPuyBUbFE81jSE6uZ70hcLhYoq0+DjX9FQ8PAm5/fRQ0dDKOiUMbPT1f7CISk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699398; c=relaxed/simple;
	bh=3RaYRMVXn2BIUsCB/bZhtFbTVHGk+QiNMUl8qUepp+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+YEyGNMleBfvbmPWLZl4GfAxHIbNfewtmEgFTAABpqlVoU9rUlmm4bq8sii91Ojy0DWYHqJZ64ZmkQg8xiy868JgwoNpqYjqcXSC+oiBu8AKN3dHlsh7tizqXs3+M31Lz0pgeIRquF4SQB8M4F6rcPYe958NQ2DPRQp5oKz0gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UWeQUOOW; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UWeQUOOW"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so7086570a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790699394; x=1791304194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=benznCTRx/IEcE/MVflwkxYVhHzqfo0H2S1mbmL87+g=;
        b=UWeQUOOWCm2cfRWYAT1EOty+HsszSfMj7dOZHSUiOvdDcD1vGVWbsXttVMe5dmJRwz
         dYYMAK+uH/LyQb0lmUCmba81UWfM4yt23nl4yMFaCl624t8P05Pag5suRikDGBKBTnBa
         5unyjPKiDPJWYTgr0OIg52zQBSAIc9XKp56u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699394; x=1791304194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=benznCTRx/IEcE/MVflwkxYVhHzqfo0H2S1mbmL87+g=;
        b=AXCKAFyA5w5st8wIjt0oqFGKqr9gwRg7k5zO87GgMDTFWZnFI+QXfEATA3fKHreUqP
         QSSwlhYtc1iPZgtT5/3Cshh1Oavr89865VJcSHu0JZapO3ss/ZCninwiTrGpp3IBApw7
         OXJ2L8NNJ+SUvGzq861A2tjEogoD2r8rKIaTU90oMA7zXLAK1NaPMjltvB+3wQi2eCWS
         yR6wYKfSzn6a3cPV/we6CHFbiMQaCa5yt5rQ4oElisuZwPQ6RYMEKQtRPaZFqyrqqOP1
         Dj5m/nfRDY0NXOrV4eInw0yQ19W0HyKVP9aQVaAKCO6ZOl6+pood6PQRilaa6251ChgA
         LApA==
X-Forwarded-Encrypted: i=1; AKwUvByAPf4zSTN5zv4S42LXkoGaYXWVPi5ODFLe8KPR/mGxOYq6eY9MFV4WQZtN7Rk94haOMXDoDIeZTRf2LWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9t1y8GDScwxDFmLirCv+oX0+tYUj2NgADM/Y+3aMTPAZtMV6l
	JO8C+WC6+zHxpmIvGrTkzMZx5nxkB2JiV4zeXr/Fr9+U3PDsj3rFexdYBLVp0KiQDyxMPXNFIEP
	xGU4dow8m
X-Gm-Gg: AYBFou3ORd7Ue2pZCLoy+XmgZFElU1wQQlTBb4ccVF+AVuDLO+EQj5v9nIkngDdx35N
	J4PAsUrmxnPHdnomT2Mb4w1MQB/Qwb12OtwduLal7QNUM9Cf5FS/IvuvbgqBsqUvXPFXgsOAwhM
	P5MNJHJGh4Ex6RbtAA+waCAJF/t6LqkrtjSE/FC2EZ9UHaA3VBsNiy73nZ/RybOQVzyT8d6EOAe
	zYXCkGSWpLvLs2pdK+mEYw1g7tf+F/83LnZTYiwXyA1U+w5S6O85am4t1b0Uxxvp8FftE//AJTH
	1HYBfyetkWusknj9JgZfMFy/amTFT0Kn+a80HCVaE5MLf/Z48C0bxQd3ZlR4ni1t9WGifn2utOv
	XoUEFE6tGkTyPpC6oR26ulyL6Nl8WE7bFBLfyKotSMnp6cDV15rXBQTBVIYKkrt8HggFa9yVpNm
	KZu9WA1no/7JYBUxtyeQlQvwguUdiUVlcNtzMC5KO+N6AX5XGefUSPfriN3VU241FWXIIsNSTiq
	UMztAlN1QWc5b43p435P3fHxtoHL1sq0T4PuqZk1Sm3SszSPg==
X-Received: by 2002:a05:6402:540a:b0:6ac:b49e:42a with SMTP id 4fb4d7f45d1cf-6acb49e060amr1727093a12.28.1790699394142;
        Tue, 29 Sep 2026 09:29:54 -0700 (PDT)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com. [74.125.225.141])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb8e19b41sm1165196a12.4.2026.09.29.09.29.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:29:53 -0700 (PDT)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so25147935e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:29:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzlFRwmXN5rj0uWLz0fZHyyOwyv6s4WjtH4YjQuwd1yNSN/CKLHf0A9ezoE0vyC/tg3uVISPjuK9kSEi5M=@vger.kernel.org
X-Received: by 2002:a05:600c:1f95:b0:49f:ce78:3562 with SMTP id
 5b1f17b1804b1-49fe66f1aa8mr296606315e9.19.1790699389340; Tue, 29 Sep 2026
 09:29:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929080143.559685-1-hungen3108@gmail.com>
In-Reply-To: <20260929080143.559685-1-hungen3108@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Sep 2026 09:29:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UU+NS0T-Ga8i12QKTNCYOu8kar_6=NsH0=4FVUFyKB7A@mail.gmail.com>
X-Gm-Features: AclHuK_CMHHACYWLbkCTUj8Wg_n6T0qMeI89YsR3gxxruJZion0bIfNfLPongVU
Message-ID: <CAD=FV=UU+NS0T-Ga8i12QKTNCYOu8kar_6=NsH0=4FVUFyKB7A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ronbo-rb070d30: Use mipi_dsi_*_multi() functions
To: Hsieh Hung-En <hungen3108@gmail.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 29, 2026 at 1:02=E2=80=AFAM Hsieh Hung-En <hungen3108@gmail.com=
> wrote:
>
> Replace the deprecated mipi_dsi_dcs_exit_sleep_mode() and
> mipi_dsi_dcs_enter_sleep_mode() calls in the enable and disable callbacks
> with their _multi variants, as suggested in Documentation/gpu/todo.rst.
>
> The callbacks retain the same return values. The new helpers additionally
> log an error if the command fails.
>
> Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
> ---
>
> Notes:
>     Compile-tested on arm64 with W=3D1; not tested on hardware.
>
>  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

_multi doesn't buy us much here, but this is still something we want
to do so we can (eventually) remove the old functions. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll be at a conference next week and will probably wait until I get
back before applying, just in case there are problems. So unless
someone else applies in the meantime (or other issues come up), I'll
try to land in ~2 weeks.


> diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/d=
rm/panel/panel-ronbo-rb070d30.c
> index c3fbc459c..ebe6352db 100644
> --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> @@ -75,15 +75,19 @@ static int rb070d30_panel_unprepare(struct drm_panel =
*panel)
>  static int rb070d30_panel_enable(struct drm_panel *panel)
>  {
>         struct rb070d30_panel *ctx =3D panel_to_rb070d30_panel(panel);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
>
> -       return mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
> +       mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +       return dsi_ctx.accum_err;
>  }
>
>  static int rb070d30_panel_disable(struct drm_panel *panel)
>  {
>         struct rb070d30_panel *ctx =3D panel_to_rb070d30_panel(panel);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
>
> -       return mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +       return dsi_ctx.accum_err;
>  }

nit: not new for your change, but it's probably better if
rb070d30_panel_disable() ignores the error here and always returns 0.
We often ignore errors in disable(), especially when unprepare() will
power the panel off anyway. If you wanted to send a followup patch
fixing that, it would be nice. ;-)

-Doug
