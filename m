Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEFA370D7C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437800; cv=pass; b=WZuB/dNXsa/AlfzGEf37dc/X443YUumfHPHJFpzBGfh9Ljk3YKlsOdfLBPtZVTO5Lzu1j+GwhO5S5ou1ebCWXgHVRbt5U7Y6Km9zroCzJ+gFgyTG+WC+cBqtMRn+1nW3mEPC1HUGQYQV6oTTFzLncMXfmH2NRBe5R1XrZTu+d7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437800; c=relaxed/simple;
	bh=wpZnotsK3EvWZc2W7+M8xLGBGb3W9bxT+E2tZYv5RII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugraPJnMdeBM+0K0SnxwLIabN9AWJIjL2U3bk4HSxthpggor03cBENCH4OZn2EpV9iKiXpq/dQF+1GbMzWCAOmqAimr9KUCS6ven5JCs2f4RPMNTGLILx3nvp7TVmKWdT6+RsTahcBYjuM6Py5aAIYBEdL2Xw2WdNl6zG4irYoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eu56kTDw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5Y2ZHNk; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eu56kTDw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5Y2ZHNk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QDfbFx503759
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=x5PdX9DxWJnyk2v9EFXGjBKujlwifuu0xz8YQXo6qPw=; b=Eu
	56kTDwUvhYxvgeCA1se3G9INk9M6Eq1BcgR5Dqc4RveIn+MKTpFhWEcQ05As+qvw
	gMzgeih+iykA1mh4fSb4UWXeP8VsGiVRI5iGEyecAsfE/a2Y3/bAVij0FaupuRQl
	flrwbxj9UDZ5pyym0iCBOKx4NNkPZwVH61aERzuZ5EH6gANv5xzSz+oCp4BVgCKE
	pc1ChxvTHIhFmv/BuKBeau7lv6mvebsnJrHkLTuVCk6PwX/KVNoYuYsE7RjpecMg
	GRjp+m/mK3nnGP1qCwz8PGCwwYpmRJSW9RpWgOLERLP0DaYN+V6gg2yfBJgxhxcs
	6JvsdSiaX8cJJVEVCGNg==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mw97y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:49:56 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4519ef1babeso1592524fac.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790437795; cv=none;
        d=google.com; s=arc-20260327;
        b=p+iVn6Ls7VIH6bDiLaxYV9beC7XSDNkM+BCQv2xPnaHiOAf3k2cEbvMAYF19U5rUFp
         bK9j0q089KcaXAVPkjWWIvtlXfS0d/6T40A09QWSh431zVEGFQ0/yoLDhf/OBYRCcRCB
         1aqkkDUukXWMhZ+Hgo40jIG1q8vaoEHGoHHYMHYTWeFL1HgrZXuihxBCHt/KquhQ1tE6
         OETiqcqwYqDX7HWoT0LbI/6mfy0e7cCnT2NMFFLbCCc8ryuhkm4ie6az752LmmGp+heS
         Ep9w2UiHkdu+6kwFz5agGGL7yFXBbmRkytgR2aLLCFPyoumgV8ClRrmBPy9irVOyyfai
         A3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=x5PdX9DxWJnyk2v9EFXGjBKujlwifuu0xz8YQXo6qPw=;
        fh=WMBXrwIg90rY2ofhwCP6HorYZ0IoOO4yKdyuo1x8gyg=;
        b=KOOyQD+cgzj8zYqxs66tSq8lJIhnsGeXWtEO6S6zqCz4a3PrmIOxksjbiC+TH5Bkz0
         SbIZ/GRJ9x5nX8NG9mgOHtm6gAWDTHJ8osVXpMspHL0jEDLsEV2fPSlHwyJ82Q8jlv1d
         h1XLrTGGFvmCKiS2hRgvZO1NfGpLyT/WH26vy3CTfjG7H1cG6MdsMF6bPbu0hro620R/
         f13wGi8N8LarZ41coZArTGB3oUXpjKEyLcWUGaiig2S4hT//7wcvBhYqYwykpSzmgGOn
         YfD4V6s7wzNYH/gMLkQERbnjWuZ5i+LMPXwIZanKVFm3vECjT4rRUL6F48qHeX/FM5Ch
         +98A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790437795; x=1791042595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x5PdX9DxWJnyk2v9EFXGjBKujlwifuu0xz8YQXo6qPw=;
        b=I5Y2ZHNk1dlOb0EPT1wOqNqyQaGWRN8rULDgTQ/ZX9tYaAoCjycYrtdU0ROEfF/gDY
         GE0UrevS3qsaLZEXRMvpEIs5CwiTHHmDaWVzTqFJBgd2rz3UVQ6EVTCukpA942ZeWLsP
         XHgZA6EKZ1Pbtu6Na4EU5QwGNk945SFaDPSVATfaAiwK3gVjMkjeOWEN3qRL05Ko4G7X
         Lm7b+N1wcEdPAco6aIVwnqo8axPHZIl9yu2uFTKFOoELlnqXo3WLiOp6YWTxjpB1JCPk
         mUkyCecc7BRS9z0wrTU5tO0FaKwR2PA1XmedYzWP9DAUHFYxbwu58uYhIH62J0TxDT3U
         5ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437795; x=1791042595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5PdX9DxWJnyk2v9EFXGjBKujlwifuu0xz8YQXo6qPw=;
        b=hzYERKvaAwA7M29XjEmEi/2lUmq1BoUMCWTisAPfMRgtWVFdbOP0IvQIr3AiLnTx8X
         26ZWRVeM5lF05ZHwfjWK2wCORm6gFN13vIjGMwFOXQI+1gRV4GWbSH9lrI5/7hI4AJ55
         czHbTYo2VRR3k3VlWqChRUbDcW9O3JeRzJiYBjaGpHRAKtp1QZiMLNXgBxxXg3WY1HA+
         L1yhiwdBhcJr1w31XCwuLwdUp9FT7ABDBaDtQa7XarE3RaNk/6svQ5gadGaFRS9oSB/P
         bu5S9xI6vDEMAD9Wsan+uRzagROIcGL2v2SX6LRlViIFzMybBJavf0R/Ny1mf59CKm5G
         RO/w==
X-Forwarded-Encrypted: i=1; AKwUvBzyHkhTSFIElR6KTv6vPliB76WVcl1MRYC7r6PP2/St9DWyxM1c5U5FIMr636OSD9sgeuD2l39TBBqCbO4=@vger.kernel.org
X-Gm-Message-State: AFuF++nkju/bLJuP0D3yWbHM9xa4SKsNT5VupERqHCKlGzEhcGnPWsTt
	asnzh72aGgZJc8cSmnCNydz+zufuK4ZL4w/qGWxU29bIIVJhmHy8+fH9g7IuaFet9q1tROhBZoX
	/QC5KtWmpsDUfiXaG9TbLqtOt+WHxHulP+iu24y/H5w9mTv16NsgmnoL5X8P2BUmiD4ScxTxCDd
	FTJBU/shpQ1aWkBBeUI9GbZRRokSzkthABFtYkXAG5Aw==
X-Gm-Gg: AYBFou2PjFOQfvVg9gMfgJSL0calaa+fUJ7G8xaLwN8suLLO8XpwGn07cYW3KZBAzvq
	8TOaRnEGtGhcrVJX5mkkylPKyTvaFTnGQMeJwYF07n4JNS6q/8Ik/lHH3mJYAa3QIs2dtd4uEyG
	4++i2Uw0ZNTDLDYTU6Nt2lQuhf+uU+/KsMyxdrTNGp/uW9HjH7yWCR6HeW
X-Received: by 2002:a05:6870:178f:b0:449:bccf:bb67 with SMTP id 586e51a60fabf-49355fb0e0fmr4957362fac.5.1790437795342;
        Sat, 26 Sep 2026 08:49:55 -0700 (PDT)
X-Received: by 2002:a05:6870:178f:b0:449:bccf:bb67 with SMTP id
 586e51a60fabf-49355fb0e0fmr4957335fac.5.1790437794877; Sat, 26 Sep 2026
 08:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
 <20260912-fd-kms-fix-smmu-v3-1-a7ddc6fe2032@oss.qualcomm.com> <CACSVV00XJ4Ad8AMr9C8hv7LjnjVXmG2JrDtJxsyqx=Gz+rZ2XA@mail.gmail.com>
In-Reply-To: <CACSVV00XJ4Ad8AMr9C8hv7LjnjVXmG2JrDtJxsyqx=Gz+rZ2XA@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 08:49:43 -0700
X-Gm-Features: AclHuK-RciRtAJx994R3gG3wy_WgHDhW8e0P-gvRnH-8QYnK2N0vc2wRF8XuNhk
Message-ID: <CACSVV00SHn=f4kt-zbGsCjnB+g+aanrJ-GkzhtpkNVDiZDt8gg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] drm/msm: serialise framebuffer pin state
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Jya4doIWyrBxGYpY9yoFjNOUMi_V1H0q
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab7e9a4 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=ZeSDCgH4AKyXpHf_t3sA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: Jya4doIWyrBxGYpY9yoFjNOUMi_V1H0q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA2MyBTYWx0ZWRfX4LqeKrvurjEn
 A/cBb74FsCn6V/lsW1xcB3+nuKf3jf9CtfRO4TXINUvFuhrtj+tBw7CAvOPUscrkp9ARPlmNWiE
 x057gMUxC1lb6rF0UKgRf3Si9M3FbnpV/4ZD+ph2Dq/ePGEu4WIlo5h5b5sXTa/eyhgo91TrT6Q
 2caNx53W9rCVtEkHOgkTAVVoNH9KTp4mDKNeA3bkud7F6LKfA3TL+jF+IaPjta3SVR8GNlchFqa
 YtPMVv8ShpZLV4hdMgZT0+S+4gBARFxwAmPLBiHB3EL+tbqlF7aYyed2O0Qq/fVyaVlU3fa/hew
 AuLF5heiXFgDB+QD/kv5vxaDLVEDRYetHZI3Gr/08yVmH64Wkg8QZ9f5t+8iHlVmUlAX4DcIn45
 YFlrNmC3kZ45CkOZvM6v8xF9oXt9OzX45BsnBwbPG8kLl8BNf0mbZEpWpqxYXPIfB8Sj+Kb+hui
 VByLvlpkf8Cdw1lbQCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA2MyBTYWx0ZWRfXymCdzaeDYURD
 XTfavVMFTJGdJUanoKgpiyZykAw6oP6pIeGhSae2wiY4vfs7YFgjfZWKfXxXDvPPul+sH15g1Rf
 SHHvHsTJ0JwiN8TFjGtVP3O/gGbhF0Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260063

On Sat, Sep 26, 2026 at 8:47=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Sat, Sep 12, 2026 at 5:48=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > prepare_count, iova[] and the pins they describe are updated locklessly=
,
> > but drm_atomic_helper_commit() prepares a new state in parallel with th=
e
> > completion of the previous one -- stall_checks() only stalls on the sec=
ond
> > previous commit.  Commit N+1's ->prepare_fb() thus runs while commit N =
is
> > in ->cleanup_fb(), and for a double-buffered flip that is the same
> > framebuffer:
> >
> >   cleanup: prepare_count 1 -> 0
> >   prepare: prepare_count 0 -> 1, pins, stores iova[]
> >   cleanup: memset(iova, 0)
> >
> > leaving the plane programmed with a NULL base address:
> >
> >   arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0x402,
> >       iova=3D0x00000100, fsynr=3D0x3e0023, cbfrsynra=3D0x1c00, cb=3D11
> >
> > The opposite order is broken too since commit 8ac37c88f991 ("drm/msm:
> > Refcount framebuffer pins"): a prepare which finds the count non-zero
> > returns at once, assuming iova[] is populated.
> >
> > Both callbacks may sleep, so a mutex will do.  drm_framebuffer_init()
> > adds the framebuffer to the object idr, from where userspace can reach =
it
> > before msm_framebuffer_init() returns, so take the private state out of
> > its way and initialise it first.
> >
> > Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_fb.c | 44 +++++++++++++++++++++++++++++++++---=
--------
> >  1 file changed, 33 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.=
c
> > index 60c108d35d2a..77415302e6d8 100644
> > --- a/drivers/gpu/drm/msm/msm_fb.c
> > +++ b/drivers/gpu/drm/msm/msm_fb.c
> > @@ -22,9 +22,12 @@ struct msm_framebuffer {
> >         /* Count of # of attached planes which need dirtyfb: */
> >         refcount_t dirtyfb;
> >
> > +       /* Protects the pin state below: */
> > +       struct mutex lock;
> > +
> >         /* Framebuffer per-plane address, if pinned, else zero: */
> >         uint64_t iova[DRM_FORMAT_MAX_PLANES];
> > -       atomic_t prepare_count;
> > +       unsigned int prepare_count;
> >  };
> >  #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, =
base)
> >
> > @@ -45,9 +48,17 @@ static int msm_framebuffer_dirtyfb(struct drm_frameb=
uffer *fb,
> >                                          clips, num_clips);
> >  }
> >
> > +static void msm_framebuffer_destroy(struct drm_framebuffer *fb)
> > +{
> > +       struct msm_framebuffer *msm_fb =3D to_msm_framebuffer(fb);
> > +
> > +       mutex_destroy(&msm_fb->lock);
> > +       drm_gem_fb_destroy(fb);
> > +}
> > +
> >  static const struct drm_framebuffer_funcs msm_framebuffer_funcs =3D {
> >         .create_handle =3D drm_gem_fb_create_handle,
> > -       .destroy =3D drm_gem_fb_destroy,
> > +       .destroy =3D msm_framebuffer_destroy,
> >         .dirty =3D msm_framebuffer_dirtyfb,
> >  };
> >
> > @@ -76,13 +87,15 @@ int msm_framebuffer_prepare(struct drm_framebuffer =
*fb, bool needs_dirtyfb)
> >         struct msm_drm_private *priv =3D fb->dev->dev_private;
> >         struct drm_gpuvm *vm =3D priv->kms->vm;
> >         struct msm_framebuffer *msm_fb =3D to_msm_framebuffer(fb);
> > -       int ret, i, n =3D fb->format->num_planes;
> > +       int ret =3D 0, i, n =3D fb->format->num_planes;
> >
> >         if (needs_dirtyfb)
> >                 refcount_inc(&msm_fb->dirtyfb);
> >
> > -       if (atomic_inc_return(&msm_fb->prepare_count) > 1)
> > -               return 0;
> > +       mutex_lock(&msm_fb->lock);
>
> guard(mutex)(&msm_fb->lock) ??
>
> here and below that would simplify the error path

or perhaps scoped_guard() if needed for the next patch

BR,
-R


> BR,
> -R
>
> > +
> > +       if (msm_fb->prepare_count++)
> > +               goto out;
> >
> >         for (i =3D 0; i < n; i++) {
> >                 msm_gem_vma_get(fb->obj[i]);
> > @@ -90,10 +103,13 @@ int msm_framebuffer_prepare(struct drm_framebuffer=
 *fb, bool needs_dirtyfb)
> >                 drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n=
",
> >                               fb->base.id, i, msm_fb->iova[i], ret);
> >                 if (ret)
> > -                       return ret;
> > +                       break;
> >         }
> >
> > -       return 0;
> > +out:
> > +       mutex_unlock(&msm_fb->lock);
> > +
> > +       return ret;
> >  }
> >
> >  void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_d=
irtyfb)
> > @@ -106,8 +122,10 @@ void msm_framebuffer_cleanup(struct drm_framebuffe=
r *fb, bool needed_dirtyfb)
> >         if (needed_dirtyfb)
> >                 refcount_dec(&msm_fb->dirtyfb);
> >
> > -       if (atomic_dec_return(&msm_fb->prepare_count))
> > -               return;
> > +       mutex_lock(&msm_fb->lock);
> > +
> > +       if (--msm_fb->prepare_count)
> > +               goto out;
> >
> >         memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
> >
> > @@ -115,6 +133,9 @@ void msm_framebuffer_cleanup(struct drm_framebuffer=
 *fb, bool needed_dirtyfb)
> >                 msm_gem_unpin_iova(fb->obj[i], vm);
> >                 msm_gem_vma_put(fb->obj[i]);
> >         }
> > +
> > +out:
> > +       mutex_unlock(&msm_fb->lock);
> >  }
> >
> >  uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
> > @@ -199,14 +220,15 @@ msm_framebuffer_init(struct drm_device *dev, cons=
t struct drm_format_info *info,
> >
> >         drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
> >
> > +       refcount_set(&msm_fb->dirtyfb, 1);
> > +       mutex_init(&msm_fb->lock);
> > +
> >         ret =3D drm_framebuffer_init(dev, fb, &msm_framebuffer_funcs);
> >         if (ret) {
> >                 DRM_DEV_ERROR(dev->dev, "framebuffer init failed: %d\n"=
, ret);
> >                 goto fail;
> >         }
> >
> > -       refcount_set(&msm_fb->dirtyfb, 1);
> > -
> >         drm_dbg_state(dev, "create: FB ID: %d (%p)\n", fb->base.id, fb)=
;
> >
> >         return fb;
> >
> > --
> > 2.47.3
> >
