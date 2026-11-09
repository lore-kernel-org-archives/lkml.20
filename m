Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794256505;
	b=QzToTjgetFh8ZPkz7eUCc/RJVe8sXOxpi77g6V2pZONlRo8pim90l7P5tm+IKteqMt18
	 NqRAwk01dco67yqtZd8l69+7Rkn+P88gtgKM9W/wFjHioQb61VLOGW/vQu/aj/yZpPKOZ
	 3c4jUK8f+4TajBdpDlGE/XJFmpMB/ozHzdLZDyD6xxIUHBehr0BPigadrXnEPBWqRoqnX
	 zQDSnfZf/co4/Ue0VwgsFFSktUBRG98rDCfrnwKvlbtcJPNrPuxA6OkrI4qMLI7RnSuVm
	 UDe6Pu3KHaJcy5oQww2ocTz3r9fQty+qsBdZUA4OT1hj7WMhih1yLfawjJ+gkQpUr7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pfwLw9rBCjiBO9BkSejRs0pLl7ihPFNRSexH8P18xG0=;
	b=e6o51z61sZQ58FxAKhh2sgGnX1CKqI4AXcbX2FEJgeIRcFj0jM2OQTKRMMTmtTKlOa9b
	 DdBDR8H4uBKKviIwZ8ySYl06xnD7lvgnDTvobRFCXqCbg2YhZAjN8wQM8n+hwwmr8Y11X
	 jDfdxkjS6E4Y95uYdD2SSB1/s4CurqXjVAphhz5rwhcUzfn+DHytprbrsBtVVOLP55wq7
	 LGcjoddV2siV1Tnw67XlUJ/Ox8iPUMvsFt3LPDGw9WFHKHHZeG5mIKUoxmUDFqMQRWgKB
	 kBO0BE1CIPKUW26Uu9Y5BypuvJ8bzPef07h0qRtvw/nGxNYQnYIGA3a0YAwoKjTbJeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YfzV5Uob;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FF7606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45FF7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YfzV5Uob
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7cc30120465so55662137.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:35:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794256504; cv=none;
        d=google.com; s=arc-20260327;
        b=cofpikNlM6kdvXtgpo6e7EVf1rkwGAIWRRzFK3Xmq1dDr4Mzr+fICh21xYlbJiDhhy
         pLOeP5QV9ghE2xlqsKyeiN5FhivAhejVFXLRYIfroCalHq2c/RaBfIsSSE5byTChloFO
         7U3tyDRIYWKVp7cWE0LrLJqv0z5uIw+C0SfyZZSt9WhJWtD80dPpEAVSGvnk2lEtDvBb
         G1M9csYL//KcTVluQkJigTRqfZUH1NG/urYvnQjy0J9vCOosfBRjjK4IVzjfFw831Sq8
         zm4iK3Y+tLK1EmJtFijwss8l9kt1Cmvc7/r5vHjb49iCkyw8n6PZOKOdqrAZsbP15r3n
         33rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pfwLw9rBCjiBO9BkSejRs0pLl7ihPFNRSexH8P18xG0=;
        fh=9bTo98eTbxhKwnQ/jg3TBVOih3tY8JFK53zTHiHyvwI=;
        b=MvBuoOkYMjrMlOQ9eiLiQk2LadPAnPTPDWYGFxcWAS9sJfY6HQydNFx9MDJS6LYuWA
         eo+9YpXBQ442NBJzp8kpJPCJwVsmwZntrKQXmBb9qeIDzvJ/Y6/nTJFJV83zh7mFo1x0
         M5iuVfDPBTemzLJDUzn7r/NsnXseoOwHT6/uhIYJ6OPwQUPAM8JNePxDGac/YUKWNnvQ
         0XErbNC04d60AvCMfDPHNKJOjn7Es7vxTXFRZNzfcZOMNteBPzisdtS6KqPhMb/qzHHp
         fjaN7k7RgOyhyqRKzEzA3WAugjnxXV6QEOaoU5qHh3YuBLKjtyxSneHff/MIaDa3EQAi
         01nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794256504; x=1794861304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pfwLw9rBCjiBO9BkSejRs0pLl7ihPFNRSexH8P18xG0=;
        b=YfzV5Uobo7HC6w0mibsX/jjc5Tyk34CGlEppxWjjEum/boSGRGai5rPn1AM5GDqZ1R
         9hyG4/5qJQfMZpm28rAoRskyoXU+RdiQd6tIH3BEUH1U1lvihZg9BdrcJRq0pkq84B/m
         L+HtldqWbxVGF8FKRhNfcVUg17kpYcdDu8ltb5af3iTppCLtc2Gyk/pqKPumUQA1bwME
         KEx5rOHXgZNDBdda1VcSKdnlo1IHqUhH0Og/o8oqakE34wvS3egj0pBWFWdSEwhHE/am
         swMr1Kggob+1Gafkmzq5CAVGSBuOk1BHuc05PZM5wlUWuPQ2jjRviu8x4g71I+lSjujg
         Ld0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794256504; x=1794861304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfwLw9rBCjiBO9BkSejRs0pLl7ihPFNRSexH8P18xG0=;
        b=j29R9K7PoW3+c2leLYfR1R7PwRdXiBWZGK7MX4rMhM8VhogwyUHoqmapgAo9LLdHww
         Ccy+vTcmRlMnuenCLTNAd3Gd8jGuVmFCOKQR5g+FcjHXuRq2zmcPrcBQy+Ha3hVenUDC
         FevBXh8GUe5XSqa8PeI3SrmwYXES2dPwoMRhpyi+EQv+x39fGcjTp17HEYpexnYX8KPJ
         uowMvvFav5yxg0fz0weR/x/+uUmlPu2SdLHqZQZmmYACgJDQirvIvl450nV39eVIzKBo
         zAoZklmLvqda9/IfAccAEiqW+y7sfS2Lf1HXUCA6qzmI9XQWM76HNemCOIDS34RBtoSx
         KzyQ==
X-Forwarded-Encrypted: i=1; AL+hErHQeV8HNNhR40JHxxprwCdeNw1fD5/me8o9aWN1DgQt8wk8y+SDxK0yai7PfkMknhSgtvsXBZvB+ATCaCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YnLYVzC1Kazz8GIoGiTmUcLddu5jei3mBuOg51ljxY5inaX0S
	O2CkQjAIl8a2MorZJ0EBcbjLhX3yzY/sR4pw2zjlTvTaK4wYMQfdlK022676K6049fAxxOuzOlX
	Pl/2bb10FS3pkIa3UTyeOW/n2VXWOniU=
X-Gm-Gg: AYBFou0EThcbYcyyKUYNu3cbN+0YqYP+trv7zjoyjerm2yn6vbYy4umaIU8jP2UNQy8
	9CvNex4jRPyzKIqL8sqe1FKqCAm/n6bA2gmmHStCTSERNxr9eE8IxAZaTSSj9dhx20JxBoTcmli
	/dmvk106ZPwV5FH8TeWzT+86gs4x73YbpM2ytSc9RRTurgIpWnPsMBlxQK1Sqn6UPAjMmDokZC/
	k2j3E5kMYW7uHSYez7Vk97FNGPWJ10gVRbkSwjt+TO7PmzJO1vy2NNzM0rkbm6B2Fi4Lw/nzp5F
	u2HzsmgQkXUwfVmAOQVMHGTL/nz1OK9AFdn9yqPm8kXMSDgwKZdKGwsaXLN5oHCKjHtT+24DDyn
	T5oSstnUNR34p0Idefgeo96WeSrPZLkKSOLMBW0stt/kpn7lntO3AhqJQadiw4zNGLNpUvk0Vyq
	vSHHerCY5rr4mQCGZrAPY9ho2+2nkIns3I3W/S3HOfAkhSLMiw8NfnbSAZ62I=
X-Received: by 2002:a67:f80b:0:b0:7d2:a064:aeda with SMTP id
 ada2fe7eead31-7d301b8b63cmr193657137.3.1794256504228; Mon, 09 Nov 2026
 12:35:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <8eb61179-c5b8-41df-a466-8b5c388b6b41@gmail.com>
In-Reply-To: <8eb61179-c5b8-41df-a466-8b5c388b6b41@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Nov 2026 15:34:49 -0500
X-Gm-Features: AclHuK_TD2z4jCOaoy6VhUcvF5q3LaXcr9adQrWeNzozi9jR9qfmBoEWs4Stl4M
Message-ID: <CADnq5_OrGuMJT4Tvt+wktPzTYEopdkCjyqq8sSdvJou40-HoKw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/amd/display: report synced displays to
 PowerPlay for MCLK switch
To: Richard Lane <richardlanedev@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:31=E2=80=AFAM Richard Lane <richardlanedev@gmail.c=
om> wrote:
>
> When driving multiple displays or tiled panels with identical timings
> (such as the two 2560x2880 tiles of an Apple 5K iMac panel), Display
> Core's program_timing_sync() aligns the CRTCs into a timing sync group
> in hardware during dc_commit_streams().
>
> However, on DCE < 12, Display Core leaves
> pp_display_cfg.all_displays_in_sync unset. Because PowerPlay is not
> informed that the streams have synchronized vertical blanking intervals,
> SMU7 prevents MCLK switching at idle or causes modeset underflows.
>
> If all active streams belong to the same timing sync group
> (timing_sync_info.group_size =3D=3D params.stream_count), report
> all_displays_in_sync =3D true to PowerPlay after committing the streams s=
o
> SMU7 can safely downclock MCLK at idle.
>

Looking at this a little deeper, the function bw_calcs() in
dce_calcs.c already calculates all_displays_in_sync using the helper
all_displays_in_sync().  Can you look into this and figure out why
that is not working as expected?  My concern with this patch is that
DCE and DCN have different logic for handling mclk switching so I'm
not sure it's safe to call dm_pp_apply_display_requirements() directly
from common code.

Thanks,

Alex

> Signed-off-by: Richard Lane <richardlanedev@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 74cd88d8d580..b4531383437e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4777,6 +4777,16 @@ static void amdgpu_dm_commit_streams(struct drm_at=
omic_commit *state,
>         dc_exit_ips_for_hw_access(dm->dc);
>         WARN_ON(!dc_commit_streams(dm->dc, &params));
>
> +       if (params.stream_count > 1 &&
> +           dm->dc->current_state->stream_status[0].timing_sync_info.grou=
p_size =3D=3D
> +           params.stream_count) {
> +               struct dm_pp_display_configuration *pp_cfg =3D
> +                       &dm->dc->current_state->pp_display_cfg;
> +
> +               pp_cfg->all_displays_in_sync =3D true;
> +               dm_pp_apply_display_requirements(dm->dc->ctx, pp_cfg);
> +       }
> +
>         bool frl_stream_found =3D false;
>
>         for (i =3D 0; i < params.stream_count; i++) {
> --
> 2.55.0
