Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABF7560AAC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960275; cv=pass; b=f8iKSCo+6Fco0zztPDOOKW23XYwKYJ0Pu4A8vu7tw1y6bK5LjU6SX0MIJcBXcSVPqZ5BiXPkEIMm0iy3j6jdgDu/0ClIGK0uvrXVRhIyPvPKIhtzTI0Ku8MrBCCyIS20sSLzWyqydTo7ka/FApl3N9PS1wkg0nVDznHrI9B4mOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960275; c=relaxed/simple;
	bh=dAe+a4zELch82xSDA3dN2f8QTvE2pyX8JIAm1UCPsnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNfesVb8OcXNmMjxSNe7GwyNiQBROgYx+qz8c3/8P4NSnPMuUylxV1FBGaBQXklrQRX2fKMU/C3twIiiEK+Xpw8KFtLy2ytPnVWvnMnS1+FTv5Y/uIsWFrqS/yfMgjt62YaZSuUD6pBJU0eNqpilaXa2cuKtRwh7XLmSkM0OYyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8ib5qvT; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8ib5qvT"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2569so622102a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:24:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788960266; cv=none;
        d=google.com; s=arc-20260327;
        b=UwF5wzhaUkY2DFR7BR/cHSl715CDeqwHvmtzLQzRFYpVIlSvhmQ7rEnaYC9vpR37aN
         b8bbvwwIOUHDER6e4fuPwuGNXUx5vkidPuopZzWl0QoDV3mFZVtkbQ9S6TKBRFGoZh18
         gGllwgfoTeMFz8MuNDeTc/vDIJCyd/X3SiW07HT+H3FLZOnhndfr3xrPJHL/Pip8wKlI
         UF7vPyr2zfMJUVXSBIZTU6UJZfZ92f6/LwkU54GZM0uvbuwzJjLif8eYOqX9Q3ko1Wle
         x3/GnFk5r9pwfHIV1O+7RpezNKag2YvCDa4fFTolj5mFsXbakWOD8gGuX7uW63shB9dK
         JpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nWDGOx6XLuNNayvEPs6THIuSRdlyzHqLn64Wfdmy9F4=;
        fh=aDRqfVQj2Y5R1cgQthSqiWxKfm0Scnc8s1GFvJg+SgY=;
        b=S/gZsHnH/nANjv2ZdAKDe/NzIaAD/g6QJHr3/QPoAM5NdqLqoBK5xXnFw9BT+fmwvV
         Yf2oRw/03YAKo9fzxSibuwFXTXS1nj6QwI6Se2eX1sCU4eCw8F0/RPg/HzjA1ul0R+bF
         a6EWv5EMKunY+ADs7im92ABOFC6fNYHxQtF9ptZtxHii3JM2t0QK/0kJl0e3X+RKNs6+
         LyWGuz6ePxi7EzFmm4OlmXd3la86D+IlK2/V7oo7hdfERMKNm9PXXAfOg/MHQDNcQSz1
         Aqn0aIkgICSO6heaFCTYaASaasbZAfPGk282SEv4D0+YoOHYk5TU/w57JCLpdT8WcKTg
         TC6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960266; x=1789565066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nWDGOx6XLuNNayvEPs6THIuSRdlyzHqLn64Wfdmy9F4=;
        b=T8ib5qvTWRROhnEESek5leX8Y098BcJfE5yet623iYqFyEWZECqEfOGQPWXWOBp1xq
         1SUNnEWJUFwICT1iW1GHcdBy8S5fndv5fKG+yocY+bkW4BBKv08RW63vGyIeyI7cirPy
         Lyk7s7hzjaITYEqXk/p7JdPgzeJG+gXktDf7I9rRsF30Wb/CmuO284rEJ02RGiQrRNGK
         KX8zQAa7KDeXzXRgTYnW2UdgL/TbRhsFozBUE32T73+/nOSbtSN4AwoRgXe5WE0F9+ME
         8GoUeLCA3vl+hQ6FEJCy83l8CUSTi7b/CuLkJ9e3lbVzYN8vc+fQFz+NqgJxHIy2tSUD
         W6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960266; x=1789565066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWDGOx6XLuNNayvEPs6THIuSRdlyzHqLn64Wfdmy9F4=;
        b=CWgjoG3ophyy76CgRXG2mrGpN0ov9yYuKZLkYqwiVyjudvQUl66uLZv1pslMn2Ob29
         wewThvxd3WU/BeRoB3fqadV/7Qe1R+z6jBgjZZxKCAJhlXX6qypckATTfBd+PKTgRerb
         iFeIY82xoFpHcZ92/rV2aX34XWenqyyeQxeON2iGo2jGBd+dKNrec3n9udYBNELXHUlC
         2fBxcQaQ+xwAy8uyxVXh9VoUuCidQbTb/c+15lrQ4+7yZ6cs9KWdnxkQI77u64pnWJgX
         za5LtvMceFaKTxjEQkZJxa3ltD54g0aL/ib4sIg8ekVKKSxB4GxFjbtd/gv5LgejwVyK
         cuxg==
X-Forwarded-Encrypted: i=1; AKwUvByc3g8s/ufFd5UtK/guTxRc/nD6cUz0VlSn6BjXc841p8rncRBpcLdcQ+Qdw1CGOutKylIb3EMRj3uS3X4=@vger.kernel.org
X-Gm-Message-State: AFuF++l6bMl7L8j1MpMz3I3lkqLbBZLGWSw45Sx4CdTtReNneOPcgVNx
	FnS2OT0aMLNvTsnxDt+Ojw20Tf9L36g5EADCeKrH2fIscXtWr4aD+gMUvuro9NXzDGOvUKPpypP
	tW33qTikF54n1VDYJOrOqxxdk2ggeQ08=
X-Gm-Gg: AYBFou0ZyqNwQnF0k0hKhHyamANlBx8m7Pxpz7tZDUcSw4FP1z8KHBkxZHvds02VCik
	3/InQpOcSeNTkZ8NwKOn++BgxMp5vjKSBC/SgPcs0GIFnqya3zN2gHMt/vjRqIqTQC0xFtzitnP
	33m/dkGctr8W54pKrVy3ZPU1CafVjo+GLaYiCkeljV9mF8W6qO5atZp1iI3XrBPgIWneOHGWfOi
	MOLgWUG7UjgIyvMaX51NS5vzipToM3Unntr/gHCgPpfvwTGgorrssroHcNT9JOOuCn0JVnZeMQ7
	GHh6xHeSVOAw1SdhtyAKsITr01WJvmkX7pAHNX8GO0kfcsABgAC7Ad/KmfrKudeqEPrn3jpxEQu
	35VIH3epXxT5ciJSBLIO8PQ==
X-Received: by 2002:a17:90b:3907:b0:398:bada:832b with SMTP id
 98e67ed59e1d1-39b3d8a3d1cmr27490020a91.6.1788960265594; Wed, 09 Sep 2026
 06:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
 <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
 <47f0399d-bb31-48bc-b69d-4abd445727b4@oss.qualcomm.com> <5bd35343-1bd9-43c6-90f9-d57d67e6d416@linaro.org>
In-Reply-To: <5bd35343-1bd9-43c6-90f9-d57d67e6d416@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 9 Sep 2026 09:24:14 -0400
X-Gm-Features: AcwNN1XDIGqxTwFTzYxc9ACHpOeiJfaYEzctXSxy3CZjTiBOkSiKBiUHjwpg3z8
Message-ID: <CACu1E7Fs-=sKJ07Pcb_7BCTFaXLCMVGEu=yQ6+hfG3Vjc2Y_RQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Use CX AO Counter register for
 timestamp on a750 GPUs
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 5:32=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> On 9/9/26 11:06, Konrad Dybcio wrote:
> > On 9/8/26 3:24 PM, Neil Armstrong wrote:
> >> The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
> >> register on A6xx and other A7xx GPUs, use it when running a A750 GPU.
> >>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++++++++---
> >>   1 file changed, 9 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index f9de9329dee3..081e79ea4652 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -23,9 +23,15 @@ static u64 a6xx_gmu_get_timestamp(struct msm_gpu *g=
pu)
> >>      u64 count_hi, count_lo, temp;
> >>
> >>      do {
> >> -            count_hi =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS=
_ON_COUNTER_H);
> >> -            count_lo =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS=
_ON_COUNTER_L);
> >> -            temp =3D gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_=
COUNTER_H);
> >> +            if (adreno_is_a750_family(adreno_gpu)) {
> >> +                    count_hi =3D gmu_read(&a6xx_gpu->gmu, REG_A7XX_GM=
U_CX_AO_COUNTER_H);
> >> +                    count_lo =3D gmu_read(&a6xx_gpu->gmu, REG_A7XX_GM=
U_CX_AO_COUNTER_L);
> >> +                    temp =3D gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX=
_AO_COUNTER_H);
> >
> > KGSL apparently *writes* the system time to these registers, is that
> > an idiosyncrasy regarding how the vendor userland drivers then use
> > this counter?
>
> This is a GMU counter, no sure why & how KGSL or freedreno would write an=
ything to it...

It is writeable. This is part of implementing
VK_KHR_calibrated_timestamps. The idea is that when the GPU suspends
and resumes, we keep track of how many ticks it would've taken and
then pretend to advance the counter by writing the CX counter (after
powering on CX but before powering on GX which initializes the normal
GMU counter).

Note that VK_KHR_calibrated_timestamps worked initially on turnip but
the tests started failing with v6.19. I haven't bisected yet but my
guess is CX was never actually collapsing for whatever reason and we
made it collapse hence breaking the tests. So we probably do need
this.

Connor

>
> >
> > Konrad
> >
> > P.S. looks like a8xx also has this counter
> >
>
