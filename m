Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792866606;
	b=GcpjObLoeGP2esKF92lZDQvgeHwsZixXGS1mfPkeS0IkXe1pS5syLD9e4HFdmXaLxs8i
	 XUL63TIvv+0NhqeHXwJUbAuKvLF1aYPffAYSM+iamojfOYm8bJiVa3rLdnv53tk7uQYWi
	 ku0d535Ao6lDrtns3FtPbWWgOJNMUcbpQO4nO5NGlTrOFMfyn8gCI3uDQgLgVSKXd9Bo+
	 ElnmIKfzbYmxusUMTr6xmqXIsF5QVXz58GDBhYqXwSldM5DQ756VK5eE2SqZL5WPB4/6W
	 eDuB85q2UPsurbYVQ6Gnp800d/nTNOhAlU5VfhgOwUjVAAM0c+k/yyb2u5ETSy2VcSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792866606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RzgpDeCtFTyFOQNCp/6SrK6BvKk4jvhN0gJuk9MhrcE=;
	b=YduMemeuX1+xI+iE6aT6N05TlUgHFP2gYG1Vc2Dt0JfOwG9Jn3d06uZSBAHEBRiNxl09
	 bHYyfIY4ToNgcf5UeNr/QVYKjmJdRgpAP1j7p8aWrJBygcQjjusF8pYBAiNe95nERy/kJ
	 ee2+SJxZH0zkzBsC9lC5KjL8SA6PBOgJ7Pv3WruZNBO6adDkAYDi7AKT6wBg4g/9Gce8E
	 qedPHML79Qux6xPRhbstC2pVlDRZy0O5lFm8Vh86sQ6K/XZm/N7NjbaRe6n4Tr0fn7Qor
	 vaTjhi2j4ivTcNbk47cG4Ez7ZglEyMvscyy7y5ocq/r48tQ//CVBclGP2D8qYELaalQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DohtRfeD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A42606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DohtRfeD
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso256272a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792866605; cv=none;
        d=google.com; s=arc-20260327;
        b=drQ5x4aOjZIyRq8KGIMjNW7gwNL3162Slsa9L5Y0CNlPa9wY330oTwB1RCgD+bkb5w
         dCDgbiaA8EhdfOhU3E24wqCeAMWRUvG+4KURxdMSi5PcdCV/THB98xDJNbCFN0SpeG67
         otWaeJnKMkfKBY05YTapOEh3uWAvbbze/7Xc8XEdMuDAEwm3P7OAb3mz2r2WnLtaGK7U
         iV4oDbBpGF7e79Li2MhVyBt5nQeCyHUjhjk1MhPEpwza3cl7yAj1CbixkPel4TlzZq/Q
         jX+76EGHNG/xBH/33u+sCr04BDWxwbK0g+lsM2eq6fSWW1Yl6RrU8moZCv7dJFcnghIs
         yzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RzgpDeCtFTyFOQNCp/6SrK6BvKk4jvhN0gJuk9MhrcE=;
        fh=CZjX7m5zAicJ+wmmmDTTjBfxhJot+FFiONB7+ViK5OY=;
        b=X4pKAFC33zRIKoJUTfs4sTraELB+y0aLt7i4G2Tm06ZXBPGlDtK8W7bevZMnd2EwV5
         O9vYKNbARTmYDNHbpIvBptcjTz1u9byNORdh+XWw7vBvGGbhKYH1dzMgUL4DvBkMSyZh
         Hwe3nQOLkD1Hl5+HrgA2iNKrIUU6L8aUHfjCspgFXSBZpgWuB7DsG2CBZsrcLqT6Vyey
         zy6SjHtwqTOrvoEimUt4pjsJL+uULAZPYhu7tnKCeDTc+NiCwwEQ2bJOzYRkkKJgESi9
         56HEKzLDRDufsL+NAHeNdLcUXlt/4MJLJcWeKoMe2feHVnJbZhT7FbPv/98Qjm2UcJ+u
         oSsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792866605; x=1793471405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RzgpDeCtFTyFOQNCp/6SrK6BvKk4jvhN0gJuk9MhrcE=;
        b=DohtRfeDIfIVt2N/VMLpJzMeVxhhdoH63HMbOLSZJlb72XzhCrCVRx7XmgGAGpkHvO
         kUb6fVySVlnHday/lEz11YTVIeJDn+oXrQxqDEMFQB6Ycsr82OCnvqr8VnalblHF1heO
         4zMh7qL68JiVJ5wPAC3kBr2Vi8muZDpC0mpOn1pyTw16pjZa9e27b30M+nfsb592hwGt
         VVOlMN+qbkVI8o6cnK99ngxlzEpUg5pusBnTRsPBkMPoQ4+jXZ579XwPPMbrawhI84kz
         aTt42JHook4ljIN26y7HEs7Z68c9/L3KmMInUFx7wp1ssi0yO7oHq3uMJ+w/YjXZheYl
         3m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792866605; x=1793471405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzgpDeCtFTyFOQNCp/6SrK6BvKk4jvhN0gJuk9MhrcE=;
        b=cJmhui3SrBueOUFn13zZYvF4/ienGEp1ovv/FssLrOKICYb9kehSpij8gXNjxQyCIw
         DZePzC9h46zSyc8zKVDvnoMZE9quEyWHU/dk1uVXxb2N63bavYATVR+vdSRd6Ye1ADEb
         R3YRvEULdJpyqAoJDAQ/FK4Sx4+tI0OamzLQxZmc/rO53CoRrNBYnMi0AnCtF6bxz3tm
         /SpocsgnH3eFo4yT+mcLr9npM/ERRE8KWXZnL0ME131DbJUkCT2FGHgEkka5N6wmHple
         6rHDzKYuswhurbygPZr04NWLW4toVEux0JJV2bsQuKMhrDbWJtYvJ8TT4qtBlICpPx6N
         iJjA==
X-Forwarded-Encrypted: i=1; AKwUvByIbg4r/BcMyrZaSKKmLO/Tz00pKuhmGZ44OPtW+qypWu+khmafFwsVzgVmfGcajg/1x9SJghhE4DeQPzw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBUjoIT6kSq5If5rfZnZRx14dxcq3B7eT1v9DP2/NRvk1wyb5M
	Bov9STL4zvp3Xc/tKRkbatLYKseQAekT2kaqmE8QwaFvnYkoFdNs0yYB7zzilGtxBubnA/PAum0
	f/1UakjEGEbvWpJi7JKoR4dDHI/tmShM=
X-Gm-Gg: AYBFou0rtWpYU0zCg8f2ECxEY7ryS8w8v0os5cd/WNzHS7BQREKNMSBhPQg3KHqquPY
	yV7pqtzQykyPkGwkqH1ufq2JU18igcmp4VC7o/6L0MMM1pdGms1gql/JXJbFthe/vKtr4tjtPDD
	kxYQGI1ukH9tMjf2kEzJXoToqssQN72IBbooVg/bdKmtAChw+1rP0OvZ13oN5Q9A+XW953zL4Px
	ssVqfiuh/ni1X9dGRAkBKLKQk34FF94tpT6md4+0TZ9iUE8zielsJa84/w8u2dV6ecPg+Vzn9yC
	TxUHf4V7XRR+nADhOKSUlvRtAnThj+vc/thiYC5fKSnd5z/hHqC5Jq8zfBZEdgR3fl4wJiZJMBO
	S8d/t3xnhhO4CYYPJD8bp7BZ6Hj3pcesmPDRayYiAD1d73rLy8IDmGg22Yt94fHLxF4u5nlCfPM
	VI
X-Received: by 2002:a17:90b:58cd:b0:3ac:9c37:9422 with SMTP id
 98e67ed59e1d1-3adea2003c9mr3866384a91.2.1792866604827; Sat, 24 Oct 2026
 11:30:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com> <20261024-assorted-fixes-oct-v1-6-2977f974ddb7@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-6-2977f974ddb7@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Sat, 24 Oct 2026 14:29:52 -0400
X-Gm-Features: AclHuK_Wkxnx4x9hzjubfG-sNaa6VFJgJnA97sgJBAGJdBKAT92A62FuiwUWZSg
Message-ID: <CACu1E7EO1rYgy+KN66EqQWLxvdXVKiAhwh=EWqe2ZP6wWdhZ6w@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/msm/a6xx: Reset preemption records across suspend
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
	Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Luben Tuikov <ltuikov89@gmail.com>, Antonino Maniscalco <antomani103@gmail.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 6:31=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> The preemption records are initialised only once at probe time. On every
> resume, a6xx_preempt_hw_init() and a8xx_preempt_hw_init() refresh only a
> subset of the fields (rptr, wptr, rptr_addr, info, data, rbase). Whatever
> else the CP wrote into the record before the GPU was power-collapsed
> is left in place and gets consumed again by the CP on the next preemption=
,
> now carrying stale context state.
>
> To fix this, zero the whole preemption record on suspend and fully
> initialise every field in the hw_init path.
>
> Fixes: e7ae83da4a28 ("drm/msm/a6xx: Implement preemption for a7xx targets=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Thanks, this gets the AQE working on my glymur laptop (Slim 7x).

Tested-by: Connor Abbott <cwabbott0@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  2 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 37 ++++++++++++++++++-------=
------
>  drivers/gpu/drm/msm/adreno/a8xx_preempt.c | 11 ++++++---
>  4 files changed, 32 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 92e8c8abb86d..3e4afaa5345f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2248,6 +2248,7 @@ static int a6xx_gmu_pm_suspend(struct msm_gpu *gpu)
>                 for (i =3D 0; i < gpu->nr_rings; i++)
>                         a6xx_gpu->shadow[i] =3D 0;
>
> +       a6xx_preempt_record_reset(gpu);
>         gpu->suspend_count++;
>
>         return 0;
> @@ -2287,6 +2288,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>                 for (i =3D 0; i < gpu->nr_rings; i++)
>                         a6xx_gpu->shadow[i] =3D 0;
>
> +       a6xx_preempt_record_reset(gpu);
>         gpu->suspend_count++;
>
>         return 0;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index 79912a33e17c..62a19e22e230 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -305,6 +305,7 @@ void a6xx_preempt_hw_init(struct msm_gpu *gpu);
>  void a6xx_preempt_trigger(struct msm_gpu *gpu);
>  void a6xx_preempt_irq(struct msm_gpu *gpu);
>  void a6xx_preempt_fini(struct msm_gpu *gpu);
> +void a6xx_preempt_record_reset(struct msm_gpu *gpu);
>  void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>                 struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *qu=
eue);
>  int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/=
msm/adreno/a6xx_preempt.c
> index 1e599d4ddea1..df8d4f3e8d4c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -140,12 +140,17 @@ void a6xx_preempt_hw_init(struct msm_gpu *gpu)
>         for (i =3D 0; i < gpu->nr_rings; i++) {
>                 struct a6xx_preempt_record *record_ptr =3D a6xx_gpu->pree=
mpt[i];
>
> -               record_ptr->wptr =3D 0;
> -               record_ptr->rptr =3D 0;
> -               record_ptr->rptr_addr =3D shadowptr(a6xx_gpu, gpu->rb[i])=
;
> +               record_ptr->magic =3D A6XX_PREEMPT_RECORD_MAGIC;
>                 record_ptr->info =3D 0;
> +               record_ptr->errno =3D 0;
>                 record_ptr->data =3D 0;
> +               record_ptr->cntl =3D MSM_GPU_RB_CNTL_DEFAULT;
> +               record_ptr->rptr =3D 0;
> +               record_ptr->wptr =3D 0;
> +               record_ptr->rptr_addr =3D shadowptr(a6xx_gpu, gpu->rb[i])=
;
>                 record_ptr->rbase =3D gpu->rb[i]->iova;
> +               record_ptr->counter =3D 0;
> +               record_ptr->bv_rptr_addr =3D rbmemptr(gpu->rb[i], bv_rptr=
);
>         }
>
>         /* Write a 0 to signal that we aren't switching pagetables */
> @@ -163,6 +168,19 @@ void a6xx_preempt_hw_init(struct msm_gpu *gpu)
>         a6xx_gpu->cur_ring =3D gpu->rb[0];
>  }
>
> +void a6xx_preempt_record_reset(struct msm_gpu *gpu)
> +{
> +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> +       int i;
> +
> +       if (gpu->nr_rings =3D=3D 1)
> +               return;
> +
> +       for (i =3D 0; i < gpu->nr_rings; i++)
> +               memset(a6xx_gpu->preempt[i], 0, a6xx_gpu->preempt_bo[i]->=
size);
> +}
> +
>  void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> @@ -302,8 +320,6 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_gp=
u,
>         a6xx_gpu->preempt_iova[ring->id] =3D iova;
>         a6xx_gpu->preempt[ring->id] =3D ptr;
>
> -       struct a6xx_preempt_record *record_ptr =3D ptr;
> -
>         ptr =3D msm_gem_kernel_new(gpu->dev,
>                 PREEMPT_SMMU_INFO_SIZE,
>                 MSM_BO_WC | MSM_BO_MAP_PRIV | MSM_BO_GPU_READONLY,
> @@ -329,17 +345,6 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_g=
pu,
>         smmu_info_ptr->asid =3D 0xdecafbad;
>         smmu_info_ptr->context_idr =3D 0;
>
> -       /* Set up the defaults on the preemption record */
> -       record_ptr->magic =3D A6XX_PREEMPT_RECORD_MAGIC;
> -       record_ptr->info =3D 0;
> -       record_ptr->data =3D 0;
> -       record_ptr->rptr =3D 0;
> -       record_ptr->wptr =3D 0;
> -       record_ptr->cntl =3D MSM_GPU_RB_CNTL_DEFAULT;
> -       record_ptr->rbase =3D ring->iova;
> -       record_ptr->counter =3D 0;
> -       record_ptr->bv_rptr_addr =3D rbmemptr(ring, bv_rptr);
> -
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_preempt.c b/drivers/gpu/drm/=
msm/adreno/a8xx_preempt.c
> index 6cb53a071801..0e0503ed54a1 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_preempt.c
> @@ -121,12 +121,17 @@ void a8xx_preempt_hw_init(struct msm_gpu *gpu)
>         for (i =3D 0; i < gpu->nr_rings; i++) {
>                 struct a6xx_preempt_record *record_ptr =3D a6xx_gpu->pree=
mpt[i];
>
> -               record_ptr->wptr =3D 0;
> -               record_ptr->rptr =3D 0;
> -               record_ptr->rptr_addr =3D shadowptr(a6xx_gpu, gpu->rb[i])=
;
> +               record_ptr->magic =3D A6XX_PREEMPT_RECORD_MAGIC;
>                 record_ptr->info =3D 0;
> +               record_ptr->errno =3D 0;
>                 record_ptr->data =3D 0;
> +               record_ptr->cntl =3D MSM_GPU_RB_CNTL_DEFAULT;
> +               record_ptr->rptr =3D 0;
> +               record_ptr->wptr =3D 0;
> +               record_ptr->rptr_addr =3D shadowptr(a6xx_gpu, gpu->rb[i])=
;
>                 record_ptr->rbase =3D gpu->rb[i]->iova;
> +               record_ptr->counter =3D 0;
> +               record_ptr->bv_rptr_addr =3D rbmemptr(gpu->rb[i], bv_rptr=
);
>         }
>
>         /* Write a 0 to signal that we aren't switching pagetables */
>
> --
> 2.55.0
>
