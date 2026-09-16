Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F328F3E0C59
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789581439; cv=pass; b=ssqVfOzi+g7P7KWUL+fVtl9nLElhIeOncyuh/R7YSP4XQSd3lJtvIqPKvU5N3OzK1vvwrjVpsdLLcTgcyDz/Hf0XXGVYe9tT9L/MOWRwDY4Ol0vmGjJDW/UhA2Dnye0ThikzDNE8OirowezR7T63DNfZguXkySbIvybKXTnpn8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789581439; c=relaxed/simple;
	bh=C3URFdSDUZcRUw7EIGem+G4SArlq47FRi03C5f36bfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9N3IOYDhLMGGk8O0VAd24PL1BSyo+x03OBzpSawG9vDcF18A+LTPskKjjrJbM+8eQAJ96GYz1bMr3k9O1rxjaNW2Yr+xWWcvR1UZdJKF/yvwD2uhm1EheemSf10cn/XTSFzq2prbuDya42PpXtDkAUbYh+PsFlUWrdlF/JNIig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ej0hD7+W; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ej0hD7+W"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-399026951a2so139840a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789581431; cv=none;
        d=google.com; s=arc-20260327;
        b=FeT+ISqPwwVR5zW4LTA2Lfqsk8Ack355xz7Ypnxe1IcKiv3H/gUV/5wfDSmAWcJ9VG
         fjZGG88uM2gjFtJoeQt1Kw4SqTGF6Ywl1HkLQCMTJKfS/7ewpuiZkVPGMW775fMS9XrL
         RdefNVA60HJeR8CjJr5XERKoqI171cMalQ0EjgSQEehMWlTD8pELfzGbejbf84QPVyAS
         mlNGANF3NofFR7r/iMt9O0/YAbka4jdjrFYAD+X1ElZ9BDqvwZjfvnQMPxkzu/bfQJb6
         fKYzE3mQ75D3YvKCElIeK7ASSwNE4mngDwcbAUMatVdklJYh46rvb1vNrWwZCaZ68y++
         VwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRhmmCrAtVPev1jQLA09AINV4vc5qQ/mpuw1U6wCpOQ=;
        fh=HDE6fJu3OY9S10qMOo9zzQxO0QQbs6T1KLm8af6uLbk=;
        b=g6NBbUai6wlPjafLASx6iVUtF7x7DGczEX0/qAf8G2ooPV4w6EyHlZfdWFT0nZfTTh
         U707SV6gmRnvrpzZW/zGAxbxWUM9bbOG9TK1/CDtevD1ttVmF2dYjoTsPBNTLMP/vuG3
         gPhyqub/hRZoDwQ+6irXbryGXW/4Hs2aURNGZ4WVg2sYHvArVBCS3F7s3n3DOpxCFe5k
         3vS4+RNLaBpuNqMyD6kWxkPaWdP3WT9hcGxJsvZqdawpA27vc1R/TXWM92yrkPzULEyf
         cZ40hAes4VgW3OJ7rHdkdMp87Zz4EoK5sPXdyRZqQduV/6VBE2OFTnc0Z3CWrEif+xpd
         vMWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789581431; x=1790186231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bRhmmCrAtVPev1jQLA09AINV4vc5qQ/mpuw1U6wCpOQ=;
        b=Ej0hD7+Wi0W6MffV+E8XutU2Wn0q03HYqWIGV8KovGmQGjtYUfZBAVsugsMckKAlZ1
         A2FRlflhdSZnf4elg2FSV5bCyYxIrCjbUZIXLsekSlxVT4R3oExkbKKudS4JdHgu+EgU
         csBfiXV6vzKgV0NFUddeAHZSLl8u0fRAFllVRxsOxQidYHnF19mHS3EvDWwy8hFYlJ/P
         EzsjHpGApuW4FHWrgpNvyacDiOHMocl4+sf9N1d5DGVXlQg7s/xdr4KY95v/TsOYVZPO
         BC/+dE9ykuw90vwQJsqXEHDpdEqyW9CeDkL9ZSbYGN1a7/wX1kLZHcqjNkgdL1UwDqU+
         5gTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789581431; x=1790186231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRhmmCrAtVPev1jQLA09AINV4vc5qQ/mpuw1U6wCpOQ=;
        b=1edsFf1nii2+6BI0RmJeayCwLWHX4gb/Wq5PrSavdMa5jEm+Kah2vDlz/6SzwoCR+j
         uL7Vkl08P8sdwBumsn7OLNbvgLXm8b5uMzLajPxiplfAi5Is99Rv+bZT+s6/aq6G2lTq
         cCMOmoacyoz+lauz61Dk/P7VH9Z4EYMqfglsXQTPzZ2rJ3Z4dVqOeAv6Xl4/Llboh26L
         m+Fz5vk3xlc3JUcV30WZmpirtIs8LvLW24n6fnEj6JzWVK5oiqLJh+760eTHCj7s6UoS
         J7/ZSVzx8CY2TkKzEP9ypknJ5djVKAgQF18V8dpnU2+xTxsKX6dps8aKFw0qeHW9HWzu
         7wRg==
X-Forwarded-Encrypted: i=1; AKwUvBy/2BPxDo7XNCOgjc1QlBUloOdlsgoQtqA5X1QjyOtatHxYj3vGCXRbFPa4vs1rJhR6C8vELcyR5xjwfYg=@vger.kernel.org
X-Gm-Message-State: AFuF++mIxB3NlzvFyxk6Zr9EpHoKRd9cZG2y5K8FL1Lz+3Z/8udGKYDS
	Zy3pW+Gi3j0LNkYp5Z2J67wls4TfolAt30tRLsyPl72SsTknspUzlPQKpvKVc+U1TSxQeEBVwgW
	wT8FIUy4rlitD/msSpWB20l1t2adG0Nk=
X-Gm-Gg: AYBFou1jR5hFwDxGHMJi2E4iMkpIaY74JR92uH2C/MbhTlVIFol+XfAADsATmM1OJRJ
	Ga8yPLA9ZpcEOCaXPwVsJ2QD/I074vaQaTHPZw+4RZVRb/r96wUmaSEVKeeY2TkQTvJaeSy9MEf
	PZ7uGHNv+m1VrMXrjbecAaDRoqT20sgf2pbvKOHq9r+QJOG1b2dvssKaoI9F6CUpVaoCGeHyEzq
	fI+JwJM3W8N8t0kWHMGKK93jUcL8Kpc3oW5UZtQU/57A+n+OSRWNj/r97jZrgtpqkd1rCIAzEeT
	rgsWVmqkkBRSmvC2W194CrJLKRLeeoy0xV6kOZ3MaGXPFZFYK5SJ8Sr/k2VMz7v9C6zs2ZKvGMZ
	9HmQXHuvRc0t1KH6HvYvkCu60TxT2u1GGCYpTVpbTMlA/vJcp5LIj
X-Received: by 2002:a17:90b:4c49:b0:39d:fcbe:fdd7 with SMTP id
 98e67ed59e1d1-39e1e23cff7mr5673235a91.1.1789581431294; Wed, 16 Sep 2026
 10:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915201525.3530491-1-arnd@kernel.org>
In-Reply-To: <20260915201525.3530491-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Sep 2026 13:56:58 -0400
X-Gm-Features: AcwNN1WqFxHVyo89bZ3kWQkp1b6VgBRYVdOql17xbIgcYVCDABYsam0h7bBy_4M
Message-ID: <CADnq5_MG+Yrws17OPHCCtc2Sw2yVBZUf-6ym8QCxnOW+SFKFfg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix unused function warnings
To: Arnd Bergmann <arnd@kernel.org>, "Wentland, Harry" <Harry.Wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tom Chung <chiahsuan.chung@amd.com>, 
	Gaghik Khachatrian <gaghik.khachatrian@amd.com>, Dillon Varone <dillon.varone@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rodrigo Siqueira <siqueira@igalia.com>, 
	=?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
	Alex Hung <alex.hung@amd.com>, Ray Wu <ray.wu@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 4:21=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When CONFIG_DRM_AMD_DC_DCE is disabled, most functions insde dce110_hwseq=
.c
> are no longer referenced, causing a lot of warnings such as
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3510:=
13: error: 'dce110_enable_analog_link_output' defined but not used [-Werror=
=3Dunused-function]
>  3510 | static void dce110_enable_analog_link_output(
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:3391:=
13: error: 'dce110_set_cursor_attribute' defined but not used [-Werror=3Dun=
used-function]
>  3391 | static void dce110_set_cursor_attribute(struct pipe_ctx *pipe_ctx=
)
>
> Replace the #ifdef with an IS_ENABLED() check that leads to an empty func=
tion
> in this configuration, so the compiler can eliminate the unused functions
> and not complain about it.
>
> Fixes: cd2cfe4d1504 ("drm/amd/display: gate DCE ASIC code behind CONFIG_D=
RM_AMD_DC_DCE")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This still leaves an unused empty function, not sure how much harder
> we should try. Maybe the file should just be built conditionally?

I think so?  @Wentland, Harry What do you think?

Alex

> ---
>  .../gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/=
drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> index 817f2bf736f4..a334e10eb1cd 100644
> --- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
> @@ -3618,7 +3618,6 @@ void dce110_disable_link_output(struct dc_link *lin=
k,
>         dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTE=
R_DISABLE_LINK_PHY);
>  }
>
> -#if defined(CONFIG_DRM_AMD_DC_DCE)
>  static const struct hw_sequencer_funcs dce110_funcs =3D {
>         .program_gamut_remap =3D program_gamut_remap,
>         .program_output_csc =3D program_output_csc,
> @@ -3685,9 +3684,8 @@ static const struct hwseq_private_funcs dce110_priv=
ate_funcs =3D {
>
>  void dce110_hw_sequencer_construct(struct dc *dc)
>  {
> -       dc->hwss =3D dce110_funcs;
> -       dc->hwseq->funcs =3D dce110_private_funcs;
> +       if (IS_ENABLED(CONFIG_DRM_AMD_DC_DCE)) {
> +               dc->hwss =3D dce110_funcs;
> +               dc->hwseq->funcs =3D dce110_private_funcs;
> +       }
>  }
> -
> -#endif /* CONFIG_DRM_AMD_DC_DCE */
> -
> --
> 2.53.0
>
