Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8015441A502
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797514; cv=none; b=afCmppyYiE6y6KdSjZjmpoTrC2KRZYEcM2Wx5tnXJz0eaKrx7JKbh/IHJNlGKdrg+Ea4jW9E/l04J2NLGskvZf27lhB7bO/ZRLE9nNrds3x0aQYTaiKp5ezBc7wajjZu6iG7A2POd9n765mkh6TzaxhN6ZIs4Qy2QeogngLUIN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797514; c=relaxed/simple;
	bh=oEJ9pL2ufHgP3SOJQR5MsVD6wC4aYmWLe1U7dUsX/t0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHmy1l/5XGLpW82hlx8Tt27nNxgyXvOLT7ew3f2k21My0BC84YG6TjNubyPWtgnqWyEAqIA/R5VRJ60weeonbOWN8gUAptOA5b9cqigewpxvChiwYPfcqlJuglDTKYnooIFJoI1UVL6TVfRCN+PpYnadLIliw83F9Y6bT7N91Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HqOXyU/r; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HqOXyU/r"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e028ed54dso279287666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790797511; x=1791402311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mHNTp1AZTn0ZS3nuL3EGnRpKBBCGGCs0wPlH2fLdFaY=;
        b=HqOXyU/rc+zswoa3OnqJkYF2tubohskHSSEws19UygUljU4Zq7vNkpvNjCFg3XEjLe
         DelkwYzZyL10YlxyexIxXCXyGKuhSVaEsP6TGnTxljT94zvgnqugCxweI42u7kAs/GDk
         YssAwBmfx2nFR8gzcvccthWtXUwdLtekGBlfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797511; x=1791402311;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHNTp1AZTn0ZS3nuL3EGnRpKBBCGGCs0wPlH2fLdFaY=;
        b=PC+A83Cs8wzh0D6qhndqoXf5tJsxpLgVcmpBdlpwZ6vLTdtTK90N74JOEeGdEox7hB
         tlZP2HumXUdRYcdx64P2bzgH67i4uwcMIdV4CgPOzRIOqDNy3TRxgI7zGWYX21LlEK+n
         pvOa1TxFDqjhcMmR5SNxcuc8Ql5tGCQjHlreenUeJ+xYS+NZFQ0wLDtJxpVb4EjXi8QX
         NlnBdXkR2YTWifzybruw0UdUaWyGhoRbKsc0pz8+0lOsIQDfvM9OGJS5xDOlOeoJQXA1
         gae6BrYgTi4x2hOU3z9wv0hby2B61u3cebHcjyiMuY4FPoY+TZVz3kZt0JjZFY3AUhnE
         SGAA==
X-Forwarded-Encrypted: i=1; AKwUvBwpVHbjdjPabomAT3T4ZiWlk0k56udnsblj8zvgaLmILmBQ/htt4+jyFgVVlo003m3CVVLVeguhg6vPLEs=@vger.kernel.org
X-Gm-Message-State: AFuF++my0MfQ/dO7ISR69iDRzKgLM7XQuiaztffO6sJ3mxxMF1YxV2HC
	bgLI1G5GJ0KZZRa20JFcQzcCXEEFORg/2/cmuRvDIbK66twuIL/EuuGU/elE5G71sfVGb7DDa4L
	jCPV3kA==
X-Gm-Gg: AYBFou0A/we6E/8ZF07kPXIAvur79v2k6uvGPwxYZkn69JOrI0LwwCWI6EqXgSNQD9B
	PDrVlDWa1NmFr3uyOYP5O7KBBqCHJyi2qaeLNppzkw6TJW+i9PoXLkriHIzT1nOm9eb6HAM8jvr
	2aUA7OlwjFYB7JCrxfv/DbDsIzs0SvU8+xTSOfPfOD+TuIwlJ9TMzqM6laTs38/eoflLCgsIwZW
	y3AN+9/jKispDxXqx/vpxvqNkANi1Hpm8OJoVOnuxmXNp586UNiuiAun3h6IDJzjtfqfQcBovSR
	dy73Z1sLex90mPWvRlD5oPM9/kWFB8BNi3bK9YzSUKDGvJT1NsY5ceTue4EeuPrgS21eVP5xh8m
	LD5W1L1FpqOL64ku0AtCy2EqVeSet0tFeHGRUpcwLNaYMAmkQB8iHXRXIeTyDpBKTDPEJ0sMWUE
	IakrSACYXNpdC6zMa/ga2qFYj/03zfFGHHmiSEjRMOZcJW9CZ+XTuFQ/CT+ySzoVSX7qE6BRxd5
	Vi7uz+2mCWIszihijwKEwPGjG03IFAbc1QP9g==
X-Received: by 2002:a17:906:6a0f:b0:c29:f5d8:9c7c with SMTP id a640c23a62f3a-c2e23d2a4b9mr204695566b.43.1790797510731;
        Wed, 30 Sep 2026 12:45:10 -0700 (PDT)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com. [74.125.225.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dd9fbfsm48923566b.71.2026.09.30.12.45.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 12:45:10 -0700 (PDT)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so3538863f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:45:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzWFHMascN4jnapktCengHuGTzVobdrCwM1MbPLkMPF8vMIyohl30MizUtltygV4m8IN3RNtC0xtgbDDME=@vger.kernel.org
X-Received: by 2002:a05:6000:25c6:b0:48a:faf0:bdee with SMTP id
 ffacd0b85a97d-48b0252bc90mr4838704f8f.45.1790797509042; Wed, 30 Sep 2026
 12:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930013029.3241267-1-hungen3108@gmail.com>
In-Reply-To: <20260930013029.3241267-1-hungen3108@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Sep 2026 12:44:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WoNqqYOYTXEnv+Z7Kx2cA1PkYhLqZ9VKTASixJuLJaDw@mail.gmail.com>
X-Gm-Features: AclHuK_q8n2VplupGbm1CQbFF7zgz0MF-_7CVjuB8tEzVBqsiKmLQaKI4IO57P8
Message-ID: <CAD=FV=WoNqqYOYTXEnv+Z7Kx2cA1PkYhLqZ9VKTASixJuLJaDw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ronbo-rb070d30: Ignore DCS errors in disable()
To: Hsieh Hung-En <hungen3108@gmail.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 29, 2026 at 6:31=E2=80=AFPM Hsieh Hung-En <hungen3108@gmail.com=
> wrote:
>
> If rb070d30_panel_disable() returns an error, drm_panel_disable() skips
> clearing panel->enabled. unprepare() still powers the panel off, but the
> next drm_panel_enable() sees the panel as already enabled and does
> nothing, so the panel stays dark.
>
> Always return 0 from disable(). A failed ENTER_SLEEP_MODE is still logged
> by mipi_dsi_dcs_enter_sleep_mode_multi().
>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
> ---
>
> Notes:
>     This applies on top of:
>     https://lore.kernel.org/all/20260929080143.559685-1-hungen3108@gmail.=
com/
>
>     As suggested by Doug in:
>     https://lore.kernel.org/all/CAD=3DFV=3DUU+NS0T-Ga8i12QKTNCYOu8kar_6=
=3DNsH0=3D4FVUFyKB7A@mail.gmail.com/
>
>     Compile-tested on arm64 with W=3D1; not tested on hardware.
>
>  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/d=
rm/panel/panel-ronbo-rb070d30.c
> index ebe6352db..2d54182fe 100644
> --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> @@ -87,7 +87,7 @@ static int rb070d30_panel_disable(struct drm_panel *pan=
el)
>         struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
>
>         mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> -       return dsi_ctx.accum_err;
> +       return 0;
>  }

It's probably worth adding a comment explaining why we are purposely
ignoring the error value. Something about
mipi_dsi_dcs_enter_sleep_mode_multi() already having logged the error
and how a failure here shouldn't really block us continuing on to
unprepare to power the panel off.

-Doug
