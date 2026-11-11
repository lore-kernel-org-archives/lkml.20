Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417573;
	b=IHk1U4mY/8qXBwW8yQGCku1i1droOT2ROxPBuuzBEWdPetLJPN78AHoDk42N7uLBC3x7
	 49tY9fz6nqvCeDusVIQqwbccrlFQ8q5pBPhIQc9lAmMr//b6UAdkqYIkZLNKRnCv4DKWn
	 0dzwMfcP2QoxPEuSLYZZA2MGB1becPm2nCTBGNiUSm1zXbyVCHSLUpQHR7cs6WoSxaffp
	 2cWvvJnzTxzBH1w5vmuI9yGfcN2tfh7lavJL+yXrk5cgKl8iIEyx+XGzLhHRiOn83XphL
	 YJFroDBHp6ENbfqCR1DwifKj5tWEMGHImxQr/aKZhiCo52xCK8Sc02d6k7eovXpv6Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KrAwE14sLjPV1wagWRb3nhUSBxA8ruoUwCfDea/0XLY=;
	b=lds36T/s2z60N9xv8k1p9rCGQxLJrJYI5V5yl/Xd/jAAPefCd3P7Ow5tVAz2/cYTwYl3
	 HbVRsSyRCXvHq1uhBJ1FwpalPMERqHPi5JtmJMWByp4JKmf74T5HLZJDPdIp6YUZxQDcd
	 htrONrlrEJdk5bGdsiI9BKBxxSeHjMPmwG9VJrCX8ZF79n7RzxIOipnGz+aknMFzgiENM
	 au6MzVQkid+XZqUt8Z6WB1cnASl+KDMNtjbNCMM7V2roHdElUF67ygEKNoamqadiGayVi
	 R1rDMDmrIE0g4kHd7M6No1qRg17eQj0AFJx6F6G4ySDl+9qkAmyNeRYdL3oWuaK1vXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K2ynn78s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF20606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CF20606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K2ynn78s
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-376a4059061so92158eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:19:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794417572; cv=none;
        d=google.com; s=arc-20260327;
        b=VnlFwxGNwruV37XsZJ+AVHl+aDkpve5Kx4hjjGAZUZTwoF5cTMpwr2olTwQnXevoO4
         KEn0dENOo2y17qecGPDsfg6TtSc6QkBq5pBbcbvfGnjEzp2aUJ8BNB0tW3K2HbQCKsC5
         SUB0J3wVJtbiMjdtZsPs+u0xzNVVwmOLc4ldCbzpqgANGbPKTBAFyRrBguG6GZKKNRon
         KGCJT/SG58Nwikv8PSLpSNRoz7+P3E0lEoCE4DOxigBQxYu3GznWC7jEuM21FsgWaFgY
         giGzArTpalNDWDmlxudEzWUUKcn3NSgbnRI8p5Z6TC3DY9cmVpNY5A7+s/b8XUwiDcFI
         Yg7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KrAwE14sLjPV1wagWRb3nhUSBxA8ruoUwCfDea/0XLY=;
        fh=/wntGwOD9rN4jS6jxgUBvNbSFiHxJKN09qhbKe08s3U=;
        b=HqaqRfUwaWC8fPClZ0ZO0lnvBL+LlktZ/k7u6ghUVXRwdTQizllmh0umDssC3sEkqB
         D2k4K6lmBZZuS51TMvIwSQx7jb5osmriuKmZA5rXUwMWMfu9l4t1CVE0kxkg67urrT0G
         pPpc7ctgQl0UU1An1XRp8sA8RGegymtJ2TJgvJOoSy3IAps/qgxVTi301xY4jXw65xf9
         qF3SJ/DOgcQIgiEH7XvEIbt2DPdOGXSkqY2w6Y7YOsY6RSwzK6n4U2CwtYHghuUo+YE1
         cZ/HpmWlky4/UQDh1KIdwsSs6RUvwXuwUbzh8ARv1JA0ElfVCjb7oWFJwYIBcQ9we4E2
         Eypg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417572; x=1795022372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KrAwE14sLjPV1wagWRb3nhUSBxA8ruoUwCfDea/0XLY=;
        b=K2ynn78s9fHBJ2Cs9WHUalvqdA+fUsplC+NXWAectO3322dhd4q7IY7cVDxIiUld0M
         KEr4uFmArXN3fnSLg0zrjjh94H+ghVHQvpOm+kj2jA5Ut7tgg7DO+Bmr/MF7XVujpU5/
         NMxjQItp6QMkgT+Ae3MRH+wfwgVZnAETczX4ejBJb4a69usMy2hMtlYHUcPafYDvChqP
         ltG6Wgj5R1bTFANRxQ131epMso37oHnhSZppN5W+SyJFxkySghdKk9Fy7fMH99IdKhUo
         44Wod8Ld+WzHSrNVApFsoQcIa7xcZKqtiB/hEY0OfMobVrA9ifARkLOjAQpffdsHatwV
         Cjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417572; x=1795022372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KrAwE14sLjPV1wagWRb3nhUSBxA8ruoUwCfDea/0XLY=;
        b=SnuH8FYNDQdmm5fMg1QeAcM6342I01UGAdgEd7so/8D8YwTo8x7Z9wlwOuXeA8SMLk
         CU5MD+oH1bSGmwaLbh/lIUJS0kQgk7fp22Z1BHW59uW/ku/ZeeULpD6BFWOXcLauFIkk
         5JPm6Fs49nSf8W6IqeonnZ0m4DzIDGMprY45BSc3mnUUorwFLDxHnByp5539zgsKBFKl
         rAEB1yxdETFuWcKz+Zky6nN+/6O6xvynikuwz7BGoqpCA7QdiBwDIXXjpwzxUbQjYbdD
         m7mYoAiInHaCy8IFPRrHDPtNSTy8sfG22GE912dIvvB9+z1ovrUN0NVYmNNJ+FzJXzUo
         QnXQ==
X-Forwarded-Encrypted: i=1; AL+hErG3RA2zhqyTcKL/Jk/B8WEXWQJsGFBF5hlDNdSjCr8fEUV0ZiBqe9btaqTVCDm8p30+2BUQzWNbxAM/R04=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uuLFMxxzfxW74yygqtSdrTWOxTCyYbAC7eVw2rjXXZtO/ukOX
	C2l8i+iEM9g8UbUGOOxWRbQy3wwmDpVnoOSTSATsmGxO0jIkaEo4K7oA7/YgHhlsWp0yqaWZKXu
	7bJW+obRVzdhMg/+oU5h9po0exUE1W4o=
X-Gm-Gg: AYBFou2xuxsvivxMrD487BFdIqNYgGjs6j6wEGkHIltJxrrD4DlOeLXeIM2sUHK2Kt5
	+zNAUdUc7ANWjdHUKIkqNhTq7euyRAjugSIj7mu2INtRkD/UmBFJWZ8s+SWft0pWtbhGLQFcurA
	NA1rpU6nv0m8sfD/Zhl6ZnIYuaMSfAA5VB7Qhe9vUNxjJVko8TmEalatm56Z9koc1jjIdZPrYwG
	uiQcjODwi+PcK5/GUpsOuMMp6IMWANBIwT2Bq5g7sL1wfte5gwZA2ISlbTU63nYhjL1C3k+MYBf
	Uce76eYvUcidm4Yo7fj7Zdcg79ej3zsyc8JVirfT+kluC0cbv/RbKxCyfj4tDzlq8AIgdqCk7RT
	HiEyxvP9bdiTVwgULSyR5AoxqNwYyTz0t97HEtLG1aEnwEcxLVFEdhsxHAP1uIIgnxcFvBDy0vX
	ieCkjxhmlN31XSZjqBEBWQO0nQTNvzti9fd66TgbW2UAKVN+jBwX11hutEiTI=
X-Received: by 2002:a05:7022:3a86:b0:143:5c2a:e45f with SMTP id
 a92af1059eb24-1b3c01600d4mr4568870c88.0.1794417571814; Wed, 11 Nov 2026
 09:19:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110215334.947250-1-colin.i.king@gmail.com>
In-Reply-To: <20261110215334.947250-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Nov 2026 12:19:19 -0500
X-Gm-Features: AclHuK9Ltzz1VkoOh3Aq7MLGRPgESiTW_dVehgDaxaFmKVDwtYC6QW68oRx-BvE
Message-ID: <CADnq5_PSk1mPj0t24ZjQfR5STAnVFvsB9wz-K6PqHjeWzoTS-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove extra trailing semicolon from a
 couple of statements
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dillon Varone <Dillon.Varone@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed and applied.  Thanks!

On Tue, Nov 10, 2026 at 5:11=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There are a couple of statements that are terminated with ;; - fix this
> by removing the extra redundant semicolon.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  .../dml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dm=
l2_core_dcn6_funcs_mode_support.c b/drivers/gpu/drm/amd/display/dc/dml2_0/d=
ml21/src/dml2_core/dml2_core_dcn6_funcs_mode_support.c
> index 71d14fb8c830..5dd22003f165 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core=
_dcn6_funcs_mode_support.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core=
_dcn6_funcs_mode_support.c
> @@ -328,7 +328,7 @@ void dcn6_ms_calculate_writeback_bandwidth(
>                 }
>         }
>
> -       DML_LOG_DEBUG_2D_ARRAY_DOUBLE(outputs->WriteBandwidth, display_cf=
g->num_planes, DML2_MAX_WRITEBACK);;
> +       DML_LOG_DEBUG_2D_ARRAY_DOUBLE(outputs->WriteBandwidth, display_cf=
g->num_planes, DML2_MAX_WRITEBACK);
>         DML_LOG_FUNC_EXIT();
>  }
>
> @@ -4255,7 +4255,7 @@ enum dml2_status dml2_core_dcn6_funcs_validate_solu=
tion(struct dml2_core_instanc
>         enum dml2_status status =3D DML2_STATUS_OK;
>         struct dml2_core_calculate_ms_context *calc_ms_ctx =3D &core->scr=
atch.mode_support_locals.calc_ms_ctx;
>         struct dml2_calculate_mcache_allocation_in_out *calc_mcache_alloc=
ation_params =3D
> -                       &core->scratch.mode_support_locals.calc_mcache_al=
location_params;;
> +                       &core->scratch.mode_support_locals.calc_mcache_al=
location_params;
>         struct dml2_core_internal_display_mode_lib *mode_lib =3D &core->c=
lean_me_up.mode_lib;
>         unsigned int i;
>
> --
> 2.55.0
>
