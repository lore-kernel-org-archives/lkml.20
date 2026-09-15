Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6D247DFBF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789507171; cv=pass; b=b32cKuD2ZINX0e/7Pc32lKDi5eTlUHxL1OcfUE5t7jgeECINOB+lIzj4J9sVdtb8YYlI4tZ1cUlWuQhSV8osl+FBl0DGY5fO95Q8fZzgCVzqEhtn5uPykRm4iLQlitH0aCFBPVx5QClNBEUFfv76nIhzraHq/Jv2Y0G5ADnOmFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789507171; c=relaxed/simple;
	bh=HZyGc4dn7AJ2DuUFYW9V6d2LUkkWR/LMP6HTK3mBe8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gfiq3lM+mL1bfbCoA3zmYKFUs2+XFdRKp9g+qhk51diUvSCOhNSjUPsd+h+TSTyUhKCEiYtmEx8fefsWv60pTBO5lRSIq6dso120RaZALdnpUPWX17RSiKtn4oxxgkaUsuAPQgeyvUYA6o5nM4Hbv6+ZYpti5kQk6EDv/+ta1k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVQRyRhI; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVQRyRhI"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85368f1d484so26807b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789507169; cv=none;
        d=google.com; s=arc-20260327;
        b=ftp5cINu+mI6oqjVzW7EV7hzZ4syJz2oizcaCK+JmBW+TLL2zwlIYOpZGl+N9yWXQq
         iApLOqImXVXMRSQQGmUjlCfPoQ0v9Jt6rcetMVHTs3f/Zm/XIeotEVnfdADj8y5xmm85
         BHBafZJnWng96/OLUAhrVYHQGx/S3QX5v4EhJYEelHz8E+AVr+zVRJz1kxVyNfu9BkGP
         g1NkhZqSGHuWcYo28Vy5GkKw8FgeScSNldWm2NZYt6FAw+aabGFhvVkQpT4ffqfFXPVM
         vUv271NNpunMJBn29KysfH0q03s39n65MPrSunK0Uk5U0kHhuW/pWJfOjmgAk3jKjGyq
         d1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27RlSNmJ/rh6QBvW1joFS9tTEzX+MG2zy1HOT3+SmIQ=;
        fh=jKqGKLUZ13PavqSQSfHhgclw9L3IN1yL/BkpoSvaCqw=;
        b=mxX2iRZT316tLPaGx0sQxSwHvCWpdm+OWb7r3y2oj1xooq7XAP9BI5+kNC9WGeGAgF
         vOPrODHTJhZDcIeZGimLuoHM+Yp/dJdZP3t/ESHTCnFw8BrW5+gnn/Zp2Xc1GV8JEIZc
         2aShRcEODIwwyHEC8sTLqhku+RYQTaQsnC4x5WbbbFJZ14Mbw+R+ys01O3pi8ENa4g/M
         rVvbBTu3cerZjNB2YBQgO783zyoTuESs3JXrLWxD74FURxjGwlkDvSqy/S/9q9X2N36Q
         5pjozaGUvtUbxhFhd2Tjx5pIqylqK43S4dsTvNDwYTwY8tywWBeS9mWtADsRWejhfOuZ
         3TRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789507169; x=1790111969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27RlSNmJ/rh6QBvW1joFS9tTEzX+MG2zy1HOT3+SmIQ=;
        b=UVQRyRhIsG/W/Q8AHUSGg8+Xk310V3DZB4m8W/AnlTnS5lZcKEGqopHAgrVU+1SaUn
         G8yDaEL72nPqlqWrKUr4EEgSK5I++upHB1xlHXVPOvSJCPtkbbehcMrzh+wEmvAoTl2G
         DPOOZBrFFwCVld0uhTARR2Pn8CIFsxu7ny0y9ilxjwrAx/4M0OVNeepJianz+fvE0qJP
         25w5mq/YWA6ZJKip5Ceir2x9HfSm+twopVs3W0KU0xZgixLDRkPPFV4wrfv/NTsGDrHM
         fnxa1zkEYcM9IROnXsV0f/HpTrB/A9KxlXLExf0csRwr69ESZ6hgi1SoTfOtg89vJ6GQ
         ZV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789507169; x=1790111969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27RlSNmJ/rh6QBvW1joFS9tTEzX+MG2zy1HOT3+SmIQ=;
        b=wK9wXhQYHNKQw93tzEkQlQ3CwNIy9Ra8wA5LHrBGkIZqNA25s7CCbet3RrtOphEuoW
         VFm6MFzxtgHhARUdkfuA9mcqDPSTCFZCoYPXCnkEUwe1edMuokWv1hbbFISN8Ms+1gu4
         99Lx1Q13JvppeoXtoIKlhRlf7i7BMPjjSjMwCtdfWuTKoPgE/ehXK1XKCYZqBAJ1wfvK
         H7oKr2sBus0QGwLOSUI7SoV2iGNZslY//xUFkV7hjMdvY/ZKAkRzN1AB+1IF4mtumekI
         k1fgOeMG7XL+m6o2lnqVsaDCM/IgWXiGztawJZuJhsTSW0WeTvPgayU8I0vy+jWxFMwN
         uVeg==
X-Forwarded-Encrypted: i=1; AKwUvByXt+HBeFds9WjHGwwNg9IdZ9jJFNDMfNlHEFSsgyQbmM8jr2sAwtCfg4YRlI4fYnq/6vSKOqgH/YP90Qk=@vger.kernel.org
X-Gm-Message-State: AFuF++mqAcBH7P/3gBMdE3Bbp2N2j0QtXlkLaT0NveHDQ5NxmEpvs+hN
	e7bdQIPdlVUSHVMQi1yuOnh5AGe5PFZDdPBq4Ma/0mTPHqivARAr/KJcyQbkkjjMLrvNlInjCAt
	DEVVhCGozAwBOT9rCjwJi6cxoBzOKZ0Q=
X-Gm-Gg: AYBFou18taVT/eEGc2hDHSSbiqc3rgY+dTsi0IRYTd/lPgOO1zsMT9/1lxBNigQe3F9
	eMmdHzkPre5rXFpW1b7SNJ7UCPV1uoWUKOxuo+DHptJPrxyHlcYK8Nk1GSHPu2uxFjoEmE0aitY
	g7eeGTRuKsaq7FHFlqVgCCvS3tlDYf7X7ss9IoF8uxRNnoMd3iSo/TDOp/X9DqR1e/HLsdCDw2V
	+2hooKy8OPvAeA9xHjIFOTV5748fq/60d1IhGnhdIg/Ja4q2FxR8cAMmVdzo7NKdelkufXgj1Xx
	dLy5Oucm4EtgcfqdJz+UWgyImNQ+LBGvzDtJ+kfGxyiynR+ub/L5PYsZfKIjjTQH06v6g+mkpiO
	NP26ckZ2AQhnQWBdDirLnIqHSqaBz3qsmecCgB1r/kQ==
X-Received: by 2002:a17:90b:4d86:b0:39e:fbf:e7b5 with SMTP id
 98e67ed59e1d1-39e1ed3a90emr151963a91.6.1789507168853; Tue, 15 Sep 2026
 14:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aql0WF8CnlzgS4nz@stanley.mountain>
In-Reply-To: <aql0WF8CnlzgS4nz@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2026 17:19:17 -0400
X-Gm-Features: AcwNN1UIlmrWYu-j75aUFWIeZN3UW5lDNCOHYA_6wiqw4odajfx7LULhYdnp4hE
Message-ID: <CADnq5_OhB4DVhvyGtQ2yCi12xg5yMUtmT0sRGuU-AxZk2ox0LA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: delete a stray tab
To: Dan Carpenter <error27@gmail.com>
Cc: Yang Wang <kevinyang.wang@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lijo Lazar <lijo.lazar@amd.com>, 
	Asad Kamal <asad.kamal@amd.com>, Kevin Wang <kevin.wang@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Tue, Sep 15, 2026 at 12:46=E2=80=AFPM Dan Carpenter <error27@gmail.com> =
wrote:
>
> This tab was accidentally added in commit 6c9e0328d1de ("drm/amd/pm:
> refactor PPT limits by controller and power source").  Delete it.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drive=
rs/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> index a29e76b03476..6beafabf1306 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> @@ -3077,7 +3077,7 @@ static int smu_v13_0_0_set_ppt_limit(struct smu_con=
text *smu,
>                                 return ret;
>                         }
>                 }
> -                       return smu_v13_0_set_ppt_limit(smu, limit_type, l=
imit);
> +               return smu_v13_0_set_ppt_limit(smu, limit_type, limit);
>         } else if (smu->od_enabled) {
>                 ret =3D smu_v13_0_set_ppt_limit(smu, limit_type, msg_limi=
t);
>                 if (ret)
> --
> 2.53.0
>
