Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8EC4F0546
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991044; cv=pass; b=jp50nqf8/NNkLalIZmlSXIqxcoy/8Fz5ivGh4mMSQaZp521f8Xlhpx8MzrSAKTDMMff7h2swRV9hNgQIQAJQR5kcfd3SJb7q1WZIzQjEucfpxwalLzl1xsSbN2grJC6bsq33Gf53P6ChadGlcn/8sYWpeW12PXs3ELwj6NCXfbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991044; c=relaxed/simple;
	bh=jLB54/QzegPM53gETkuOD8YqbMdS4BgCNjOmDHesM9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGu8qXs/KB55fBXdHFO2O12RSac2TacrOsdY7FJ80jVh6A9gZHRtlsu8Q1idyFzpM/Zzagk6j9n2GX95HJHs9CFi/sWrd7vPlImoXa1oS0oKPsKEHxWj1Sj/rg/cvWn0e6bHU8EZ8eeEuMXN6pNNNmIgWnuE2Yz033E35k1OUBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G82B7O4q; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G82B7O4q"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35179d0747fso331363eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791991042; cv=none;
        d=google.com; s=arc-20260327;
        b=pmZAiqcxGeeCc/n+Zx4ipFCszKui7JOe0SoOKc+eSMdCUK20amqULuFobTkyZ2hfNB
         ZWkAINANa+C81ttp5v2zrD0HvgiYVfkhIIcSMZpu1PXA6EVNqsH1zdIJZuWU+HPSSjGv
         H4xhZmi/H0taKVDaX4uJiopGjYUeGi+XsF80pOwoCHTDv/ccSsoV2EMxgjh5jVJ7Tpl4
         qetwh5/AQpa0mzX3bE9ZlUBCYWVRC27pnKd0tcV7vyHNW44fZb4kJtvdTeXytpFC2jf0
         PBy12Yhz1YEbtgd8W8h0cA7d7yqjpEB8IK+gsqHJzU7U1ae9PE7rLBR76izNhTd4op5w
         7G1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MP15FskDIroB85P/ZsRhtMZULyczrJXp5CoRckGiRdk=;
        fh=P2BUKmkJbmDWu4gE5NaKlvfkP32W1r6VDx6JlxupeyY=;
        b=eS1Fk7R34sRH0/DiQ0a1Ruf3zc9jiKyFZBynWR/66e6ENYUOW4GfjgQ1VtW4qP8IvV
         U0SJKOHh2YvfkLG7lDL86QZckF/8DOZwLluI4Hhv/YZA+zo5YdwmaQU3zk4maTLq+uwT
         sAv7+Em25Zz0lDeAl2OKFn64dgJZIz/lJt09BplRiRJK9kwhZfiHiIz1ccRxDJKa/O6i
         zdNsy8bfN7+4iRsUyIn+qCrznv68BpxD0h0zdCyFY463kpWeJR4DhENeCwYxB5Tz1sh+
         aP9HEv+cyi+fGo3kkArmUQn4lHrmcQsGzOCmzEX0iT6pQSGBW46kuPijNGbvUowDkCPS
         uwHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991042; x=1792595842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MP15FskDIroB85P/ZsRhtMZULyczrJXp5CoRckGiRdk=;
        b=G82B7O4qlhAas663oEBg/eVJgLP3F6EOIf4z716H7cYBYUGE1MtPlALyOc/twSEVtv
         uS6FgvQK/XlJnWRu8NIfAo8LxAqy3ToAskngR3gpV9h+9EosivWEkNyEsEYKMX0a5iqy
         GgauRt5lbg5N9dw+ALnEXfOATzIbyebtH6UVTM2Ba6f3hfCCaCW38Y0OQ5ge38p/OA9W
         oilXtVYAO8VZhvi1L9AbDJhgSa/hoALgbwhLSJwZ0pFJATqb1PYD2exXBKQHhFaiDOEc
         B0w0xNgeMZMomxASe3L0v7yB3T/EgV6kj9l73M4z/WGZaToPStvp++IuWkyrRGwdU4Qy
         mirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991042; x=1792595842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MP15FskDIroB85P/ZsRhtMZULyczrJXp5CoRckGiRdk=;
        b=KmZOn1BF1+Efjpas+1JYKu0XgRbHgMT8sIq8jHQrkZgShFti/fXXhbI4LMaapgzl1B
         AoGcExItGcSxWndvsR+Rs6QrEEuzGRTj0qetXJFueevfNScC0x49EX/QiUSOWyT6gr3P
         Qab4iYd8y7vtdwXpeDS+v3PoyPD4ZCrPXpnerN+LD1FgkUe6baCcOMBl299OhWmTwR6E
         2wxM1qI2Ap6j3JpHlZop1CgEI7DZYbpO/hmBeqwKTb9RL0oicdp4HG3G+h8lLbPQAMO+
         Z35FdnD8WWYJuDOW2dEBaT127XqxpWxe2Zfrsu1dOwqt2rgHQv810tMZhGyK+jRz6Dn9
         z6aA==
X-Forwarded-Encrypted: i=1; AKwUvBw7HTZlepNq5QIvD7VYmayAvFmtYDGENynDK77pb7okC+Kec1X7Y9XdXNmznC/GX+OB85imO8T6MHE8jDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbZ6JzCeCTYVLARtDRN2EhM9GMcCdtPqkdO2wFm1dgdbzEPNMs
	jHRnFUtFAXBdCvph5BSX3qGybY8NsQclccQpJmQiMh+7uAINyXQkwMwOZuWMGgueswXhUzlyIhh
	l8Rz6sDkJFFsaT6yJWEMHK1nxDM4fMZE=
X-Gm-Gg: AYBFou0KyhaVC7/iejvqrvaD8MJJt7KGn0iPWD3V9Tsi8ahY/lftoaeCRksygqyLV28
	bguhhIUm+SAnRS27CP4P3LakWH+kgVDBwUeqYQqsgoEqp8ko0/g9RrGuLOt7E23v+UMorffEXOm
	JLVuh5R4jb7Wo7R9uj1q8Ptb3qqznYWYHCWR8ZJEBQH/MSUYaQDD8MmTne8jh0NVCzRXV3Xjmtw
	PpWlWHsVRywzFN+A3U91kay6Smm8w6iJTIy8iqiYgKmSD9ys88nE+ztXcJPnlJ2rfxZDUHkSHlx
	VMaWyMJgV2nMXHqXKZESsr9fw8T6ax8zgyxXWavQywQ5Lb92lSlOKog69MAfqgDUqyMc/rd6KVF
	qMuoIOjk5Dqv8jfaLyUSv0Tya7ZV8GfjYgMDQv3HJ/g==
X-Received: by 2002:a05:701b:4515:20b0:144:fd17:3b21 with SMTP id
 a92af1059eb24-16a4e2f6033mr31922651c88.0.1791991041918; Wed, 14 Oct 2026
 08:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014073228.2095339-1-thnkslprpt@gmail.com>
In-Reply-To: <20261014073228.2095339-1-thnkslprpt@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 Oct 2026 11:17:08 -0400
X-Gm-Features: AclHuK9RTzCxHcsg5D_RZu9qnWTIP8aQ_tciSx9Ychi7L8Go00NiqggSGvOxZjg
Message-ID: <CADnq5_OVC0GgZfiKA1yoW3zJXtTK7Wx+TnPQjQE7xW2FkbMSKg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: propagate errors when forcing SMU11 clock levels
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Kenneth Feng <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Wed, Oct 14, 2026 at 8:56=E2=80=AFAM Avi Weiss <thnkslprpt@gmail.com> wr=
ote:
>
> navi10_force_clk_levels() and sienna_cichlid_force_clk_levels()
> return success when a DPM frequency lookup or soft frequency range
> update fails. smu_force_smuclk_levels() then records the requested
> clock mask even though the operation failed.
>
> Return the helper error from both callbacks instead to improve
> observability. No obvious reason to clobber the return values here.
>
> Fixes: db439ca21b81f ("drm/amd/powerplay: add function force_clk_levels f=
or navi10")
> Fixes: b455159c05313 ("drm/amdgpu/powerplay: add initial swSMU support fo=
r sienna_cichlid (v2)")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c         | 6 +++---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gp=
u/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index f8ca5eb9adc6..2d05088619f6 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -1439,15 +1439,15 @@ static int navi10_force_clk_levels(struct smu_con=
text *smu,
>
>                 ret =3D smu_v11_0_get_dpm_freq_by_index(smu, clk_type, so=
ft_min_level, &min_freq);
>                 if (ret)
> -                       return 0;
> +                       return ret;
>
>                 ret =3D smu_v11_0_get_dpm_freq_by_index(smu, clk_type, so=
ft_max_level, &max_freq);
>                 if (ret)
> -                       return 0;
> +                       return ret;
>
>                 ret =3D smu_v11_0_set_soft_freq_limited_range(smu, clk_ty=
pe, min_freq, max_freq, false);
>                 if (ret)
> -                       return 0;
> +                       return ret;
>                 break;
>         case SMU_DCEFCLK:
>                 dev_info(smu->adev->dev, "Setting DCEFCLK min/max dpm lev=
el is not supported!\n");
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/dr=
ivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> index b42897e7c066..4ef3863fae1a 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> @@ -1460,7 +1460,7 @@ static int sienna_cichlid_force_clk_levels(struct s=
mu_context *smu,
>         }
>
>  forec_level_out:
> -       return 0;
> +       return ret;
>  }
>
>  static int sienna_cichlid_populate_umd_state_clk(struct smu_context *smu=
)
>
> base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
> --
> 2.43.0
>
