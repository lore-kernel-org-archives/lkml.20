Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2DE5013AE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578324; cv=pass; b=dp7nloBWbwwbT61zENUmIQsn3KEpsoJG+rWL1tQ/qeQJiszdhXm4ZiMzofPLF3jmq4RodkU8kcEqMrWlpSsg9xT2fKQeQIArjWLzQCjej6TXzWjlQ4FBzISH1YF9qa6wIE/E8rYjqGuLoi/LpL0nS6FO50yxyFGGi+KY4GEX+0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578324; c=relaxed/simple;
	bh=qoB6OrwSgsgFXVOTBScJEwGT+JLDAy9EVuBfwvUNmVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vpc8p/bCRoZaw108YWXgkAt3v0tFTaCgTRcWZ2O6CkkeNW+ltCg3rwhLL++LK6kJpfoXH90rON0Xt652vgi+dP5DEq3vxOnU02ua1UqlcIKZnJJcwetfp48MVJ/g/Y1vkYzSgW0YnWPRwiwRcM9F+vhzavYBSIjm0hCppWCSI1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=emGlS47+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmm8bpyb; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="emGlS47+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmm8bpyb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699K0ixf2617941
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 20:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=mzIVdGs6RcUFZqYrYN3XeF/T6muDs1hNJKCaHsJQyLs=; b=em
	GlS47+cuC45LDUISnWVg6KekwD7gRFysWnK+50MTt9im1NBsJf/RDZt7b/fWzui4
	c+GHPaKjH9UwfWH2aFFjRvdORnWfceFRpNAJuxk88eyhQBk1RAbYsYjSAoBv0wUg
	333f3Ue6ODKyoFvDTnBSsFdRF0kxR9/1g8/y9I/xiWP3bgtdQf7EbHiBO3F4TpUO
	2IB64n4Ym95vN7XWzJ6SovtQJmxyWPeFlk9QK0cvVt2gZN4MkFNPY7g9mFM1fwH8
	VWbafdZ7f63RvGIVbJfRfzVix/Ed4D60WTq3ei3E3TFakkwd15sXzeDHGL59TwTW
	zZN0VhkZwwjriiVT5SfQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8rkhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:38:33 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-466d41a1d9aso333602fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791578313; cv=none;
        d=google.com; s=arc-20260327;
        b=loJh3suOFaMwE3bC070sfjvnKSp5JQoFb7SsXyNMV6lq6lv/Wj2WJ0BhgG9+hUTeIZ
         yPGeNhNhno5uiy12avLJvpJ+cXW+yQcz/0aElZT/pPY1kD3qBtvb+HkKcrT3SsjBExof
         ttp7r27pkL3jOMxLFicz53oyfKmcXe1UrgdC1Y3p2vrh0KWCNRPTGpmk1FSAAHqghBxi
         B9ynjEfYA0YTA+rAkmFdusZN922jxu5cu5nGaaseZypRJZ/vvk53rl5DCfu7f5Rmd7PG
         4X3tRknNaJUHtPshrsl8lgyYHHlFb7dCyM/GKRisTuWIHZNwQKzPiSbHIQzGAExABKSi
         p+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=mzIVdGs6RcUFZqYrYN3XeF/T6muDs1hNJKCaHsJQyLs=;
        fh=xWlPmPkTrgqgjaBKKpYbkkyh+U/0RKzUDnKo7OhCvEU=;
        b=FJZmubO5jB949yTgXyNUtTk72cODBZkoiky0GAsnWW++PLvS1wy0lhOuqdgp9R8yIi
         KTxQ9nai9wDtJkbowWBrYp4hvPCBh4MQfDXs9Vm793FN6o2y3OjE/JjA1R0haIcwxWp6
         DfxW5xrZyLspJeVOGVgAr/WZmzYjwlYUGFuBSvSoLr35LvBoF3TH//8EJURU1aWdO8QZ
         y959lCIfwqz3StDxTDOtdEHFZ1EdRBQZPr2DS4TH9vCPdg3axXOWMTwn0+9XQkQwsN+j
         ZmLvRoG09GYrV4gA0wPA/z3dHqvX68BB1F/dJzd0uPtbWhtnrhXqPsnQrWDWgr4WXkDR
         Uckw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791578313; x=1792183113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mzIVdGs6RcUFZqYrYN3XeF/T6muDs1hNJKCaHsJQyLs=;
        b=bmm8bpybJ/DO025c995j2z/1EtcNnR5lNF9HJEzQbfE5AfBhZO77OdPemEIc5UOall
         DJs6KTCTqgm2meOwBPCkpukBwJZ48gjIQmb6xJBAyRAUk8mm03NIVML7b7GlaIjlnr1L
         XfqLvFXFpLfJ1kZOq7xlOfIjKvV1/sWzaWfSqieTGP8+s76K7V7mLGWooPYQkjMklCnX
         eZTRB5AWCmXde5gK+oreu7P/+G/S1eJtYLJ+5wtIaIek5l/HEEQTvbUVZ4C70DmxdCLt
         WtLI5k/rKRKWt6bz+tJADRwJZ5qub8l+YYd5xu8JNWERtpT1ph/PYa4gEKRXnOq2f8BB
         iOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791578313; x=1792183113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzIVdGs6RcUFZqYrYN3XeF/T6muDs1hNJKCaHsJQyLs=;
        b=z6WP+hkFuDZSaatTTUF+Z62sQ5LixknVV40i4gtN2HGt9Czpy8ZV8eTaPbG4BPlwYI
         QPOoH/Rd77R1JawGNQgJHcNi14vSmn38L77wnYxHTMLWbGT+wkM8jPyoXG8fyvzk853h
         4UN8TsMEyZG2PlNw77xPSESm63vbJeEAbsjghcfyp7y4mBYUnwUdlb5ZM8/PbnmTHk4I
         LbjIlL6i5rP+d7WFR4Pg7kMWL0w+4g0ooqMce8MhiN7LKhast38Fo5x9dUt0FFjIYx0D
         gOKq4FphH9WmKtTNhXQRutzlbKdhR8TnRNJGDi9AnB4bfHvXmRR0y0iXXniUE4yx8sdM
         IPNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2H2z21QjJCdpwiBjQa7y/Xf1LSUTzGRbzzStvDTMG5epNYn39MOnLKmx8f5mifL8z9OcQMfCGjrH2deY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3O/rugvzmIjoyL3KCSRzhMtJDCOWNrtyCAiQJvl1neHz1I8rd
	J987NAoMApF8bYOqYGkiTXVoCQGuoOXlk7pp/yQtQW+rXS7F/GGZbmR9xYPbS58qY77y9DSEs8r
	01MDOFaSXg4iPOss+WA3eS2XM/MOTmEKHbkgLkBn/VxCPYhqX5w3J+Fbk0wtPWfiBolHe7DG5wV
	w9cuq8p2eXlC/S8kCuEoIegaAZ9aotgTY+MFVKBZ010g==
X-Gm-Gg: AYBFou3fyKA8x7M2COKh6Pks+oNhEjklPXsxWbo71zxRRUabWfOWluZdiTat6/3yRtE
	EtcBFC0ViPUxu8wZILnVi0E1I26BJ3uJJmT+ojz5l5it4WzG3LkM+ECddEC8iWS/bqnftoAS3Me
	jzNsDcK4FH18ETAjK53hOe3QCuuPrNd41dxsEXXs2Nd6PengtelE7dXQM/fQ==
X-Received: by 2002:a05:6870:96a3:b0:483:bdb3:a524 with SMTP id 586e51a60fabf-4a2a85123eemr2763304fac.4.1791578312064;
        Fri, 09 Oct 2026 13:38:32 -0700 (PDT)
X-Received: by 2002:a05:6870:96a3:b0:483:bdb3:a524 with SMTP id
 586e51a60fabf-4a2a85123eemr2763263fac.4.1791578310702; Fri, 09 Oct 2026
 13:38:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009131927.551319-1-robin.clark@oss.qualcomm.com>
 <20261009131927.551319-3-robin.clark@oss.qualcomm.com> <7c9149f5-b1fc-43f1-9f4f-299767c32a90@oss.qualcomm.com>
In-Reply-To: <7c9149f5-b1fc-43f1-9f4f-299767c32a90@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 13:38:19 -0700
X-Gm-Features: AclHuK9pKFnl_bW-7HJb57xY6-3cD_vRe-PZTeX0uby4Naofj_lxR10-FuQ-9zE
Message-ID: <CACSVV01j14Ew6BQbW47vzy6OBDcUdODBT+J7DqBsB2geJRnC-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Split out a7xx/a8xx device tables
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dZcVTnXe c=1 sm=1 tr=0 ts=6ac950ca cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=D-Nd7UFsM87LjAWOci0A:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: DQV3BZKk7PtNdQ27faxKea5qZLMqiqec
X-Proofpoint-ORIG-GUID: DQV3BZKk7PtNdQ27faxKea5qZLMqiqec
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA4MiBTYWx0ZWRfX8rg7GTpDrTQl
 wEGER+yYxBZM5EU4zld9UhsJAMinUyUMJ8uEqdTWVLQ8xiDheH0vbviQNjIDmlRx/quacOrYUg6
 /Us8kVaDskh4DI6K/D32Nvuwq4lSn8Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA4MiBTYWx0ZWRfX5fZwq/k7nw4q
 1s/HhCJgsnMpYQjv5z4MpxD57w8kKtogEyyN0DmpMpetINj8oM8nvlM3PRarbT2dtulztuqPWvc
 J1RvdRcTQi8Xm5R2G14kEmKV/mj+8b9q9IxYvqsnHHbslyVBvBbi+aIukm+cFsmMf+u42c6DvBd
 qDUJDMDulW+IBH2R1xuq3dNOUqlO4Kz/VY8UxHALAXcANhRyi+X2IqnIt6U8hMckA2jNmzNDj7Q
 1OEuNdqoM4sApd9tj97IrOMDY48HqTiHilJINiXrduNFrDqXktvw4k1/ckjHMl/a7WkuAEDXGGJ
 IYny4bGeBVyRLbjHczogK32jWLmL1boZgbr0LhRwhMqUX5fOL+TonM7faJARMc6qxMV44uE1Xdu
 eH1EhRJ4vR6Cv86k6R5kyKAlexaAzR7Zsh/WpY0CwXB3yAQ9QfHXdJX8xUlZ2BatgketxYQgQ9G
 MEYkFlwrvNhZ3VW3bPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090082

On Fri, Oct 9, 2026 at 11:55=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
>
>
> On 10/9/2026 6:49 PM, Rob Clark wrote:
> > This way we can start including generated tables for a8xx GPU snapshot
> > in the device table (without having conflicts with earlier gens if we
> > eventually try to retrofit this approach, or later gens in the future).
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Makefile              |    2 +
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2311 +--------------------
> >  drivers/gpu/drm/msm/adreno/a7xx_catalog.c |  496 +++++
> >  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 1847 ++++++++++++++++
> >  4 files changed, 2346 insertions(+), 2310 deletions(-)
> >  create mode 100644 drivers/gpu/drm/msm/adreno/a7xx_catalog.c
> >  create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> >
> > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefil=
e
> > index 0b8f2cafed19..1e246616f83f 100644
> > --- a/drivers/gpu/drm/msm/Makefile
> > +++ b/drivers/gpu/drm/msm/Makefile
> > @@ -24,6 +24,8 @@ adreno-y :=3D \
> >       adreno/a6xx_gmu.o \
> >       adreno/a6xx_hfi.o \
> >       adreno/a6xx_preempt.o \
> > +     adreno/a7xx_catalog.o \
> > +     adreno/a8xx_catalog.o \
> >       adreno/a8xx_gpu.o \
> >       adreno/a8xx_preempt.o \
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_catalog.c
> > index b44b0fd916aa..66c44cbc4d55 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> > @@ -670,7 +670,7 @@ static const u32 a690_protect_regs[] =3D {
> >  };
> >  DECLARE_ADRENO_PROTECT(a690_protect, 48);
> >
> > -static const struct adreno_reglist a640_gbif[] =3D {
> > +const struct adreno_reglist a640_gbif[] =3D {
>
> Is the removal of 'static' intentional here? I think some static checkers=
 will
> complain.

Yes, but alternatively we could just have a 2nd copy in
a7xx_catalog.c, since it isn't that big of a table.  It was the one
awkward aspect of the split.

BR,
-R

> Rest LGTM. For the whole series:
>
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>
> -Akhil.
> >       { REG_A6XX_GBIF_QSB_SIDE0, 0x00071620 },
> >       { REG_A6XX_GBIF_QSB_SIDE1, 0x00071620 },
> >       { REG_A6XX_GBIF_QSB_SIDE2, 0x00071620 },
> > @@ -1216,2319 +1216,10 @@ static const struct adreno_info a6xx_gpus[] =
=3D {
> >  };
> >  DECLARE_ADRENO_GPULIST(a6xx);
> >
> > -static const struct adreno_reglist a730_hwcg[] =3D {
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022222 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222220 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22220222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00222222 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x44000f00 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00555555 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00440044 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
> > -     { REG_A7XX_RBBM_CLOCK_MODE2_GRAS, 0x00000222 },
> > -     { REG_A7XX_RBBM_CLOCK_MODE_BV_GRAS, 0x00222222 },
> > -     { REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222223 },
> > -     { REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222 },
> > -     { REG_A7XX_RBBM_CLOCK_MODE_BV_GPC, 0x00222222 },
> > -     { REG_A7XX_RBBM_CLOCK_MODE_BV_VFD, 0x00002222 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222 },
> > -     { REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002 },
> > -     { REG_A7XX_RBBM_CLOCK_MODE_BV_LRZ, 0x55555552 },
> > -     { REG_A7XX_RBBM_CLOCK_MODE_CP, 0x00000223 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL, 0x8aa8aa82 },
> > -     { REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
> > -     { REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
> > -     { REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
> > -     {},
> > -};
> > -
> > -static const struct adreno_reglist a740_hwcg[] =3D {
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x22022222 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x003cf3cf },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222220 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00222222 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL2_UCHE, 0x00222222 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000444 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x44000f00 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00555555 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00440044 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
> > -     { REG_A7XX_RBBM_CLOCK_MODE2_GRAS, 0x00000222 },
> > -     { REG_A7XX_RBBM_CLOCK_MODE_BV_GRAS, 0x00222222 },
> > -     { REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222223 },
> > -     { REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00222222 },
> > -     { REG_A7XX_RBBM_CLOCK_MODE_BV_GPC, 0x00222222 },
> > -     { REG_A7XX_RBBM_CLOCK_MODE_BV_VFD, 0x00002222 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00000000 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00000000 },
> > -     { REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
> > -     { REG_A7XX_RBBM_CLOCK_MODE_BV_LRZ, 0x55555552 },
> > -     { REG_A7XX_RBBM_CLOCK_HYST2_VFD, 0x00000000 },
> > -     { REG_A7XX_RBBM_CLOCK_MODE_CP, 0x00000222 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL, 0x8aa8aa82 },
> > -     { REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
> > -     { REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
> > -     { REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
> > -     { REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
> > -     { REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
> > -     { REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
> > -     {},
> > -};
> > -
> > -static const u32 a730_protect_regs[] =3D {
> > -     A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
> > -     A6XX_PROTECT_RDONLY(0x0050b, 0x0058),
> > -     A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00510, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00534, 0x0000),
> > -     A6XX_PROTECT_RDONLY(0x005fb, 0x009d),
> > -     A6XX_PROTECT_NORDWR(0x00699, 0x01e9),
> > -     A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
> > -     A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
> > -     /* 0x008d0-0x008dd and 0x008e0-0x008e6 are unprotected on purpose=
 for tools like perfetto */
> > -     A6XX_PROTECT_NORDWR(0x008de, 0x0001),
> > -     A6XX_PROTECT_RDONLY(0x008e7, 0x014b),
> > -     A6XX_PROTECT_NORDWR(0x00900, 0x004d),
> > -     A6XX_PROTECT_NORDWR(0x0098d, 0x00b2),
> > -     A6XX_PROTECT_NORDWR(0x00a41, 0x01be),
> > -     A6XX_PROTECT_NORDWR(0x00df0, 0x0001),
> > -     A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00e07, 0x0008),
> > -     A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
> > -     A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
> > -     A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
> > -     A6XX_PROTECT_NORDWR(0x08e80, 0x0280),
> > -     A6XX_PROTECT_NORDWR(0x09624, 0x01db),
> > -     A6XX_PROTECT_NORDWR(0x09e40, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x09e64, 0x000d),
> > -     A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
> > -     A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
> > -     A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x0ae50, 0x000f),
> > -     A6XX_PROTECT_NORDWR(0x0ae66, 0x0003),
> > -     A6XX_PROTECT_NORDWR(0x0ae6f, 0x0003),
> > -     A6XX_PROTECT_NORDWR(0x0b604, 0x0003),
> > -     A6XX_PROTECT_NORDWR(0x0ec00, 0x0fff),
> > -     A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x18400, 0x0053),
> > -     A6XX_PROTECT_RDONLY(0x18454, 0x0004),
> > -     A6XX_PROTECT_NORDWR(0x18459, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1a459, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1c459, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
> > -     A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
> > -     A6XX_PROTECT_NORDWR(0x1f860, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x1f878, 0x002a),
> > -     /* CP_PROTECT_REG[45, 46] are left untouched! */
> > -     0,
> > -     0,
> > -     A6XX_PROTECT_NORDWR(0x1f8c0, 0x00000),
> > -};
> > -DECLARE_ADRENO_PROTECT(a730_protect, 48);
> > -
> > -static const uint32_t a7xx_pwrup_reglist_regs[] =3D {
> > -     REG_A6XX_UCHE_TRAP_BASE,
> > -     REG_A6XX_UCHE_TRAP_BASE + 1,
> > -     REG_A6XX_UCHE_WRITE_THRU_BASE,
> > -     REG_A6XX_UCHE_WRITE_THRU_BASE + 1,
> > -     REG_A6XX_UCHE_GMEM_RANGE_MIN,
> > -     REG_A6XX_UCHE_GMEM_RANGE_MIN + 1,
> > -     REG_A6XX_UCHE_GMEM_RANGE_MAX,
> > -     REG_A6XX_UCHE_GMEM_RANGE_MAX + 1,
> > -     REG_A6XX_UCHE_CACHE_WAYS,
> > -     REG_A6XX_UCHE_MODE_CNTL,
> > -     REG_A6XX_RB_NC_MODE_CNTL,
> > -     REG_A6XX_RB_CMP_DBG_ECO_CNTL,
> > -     REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
> > -     REG_A6XX_UCHE_GBIF_GX_CONFIG,
> > -     REG_A6XX_UCHE_CLIENT_PF,
> > -     REG_A6XX_TPL1_DBG_ECO_CNTL1,
> > -};
> > -
> > -DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
> > -
> > -/* Applicable for X185, A750 */
> > -static const u32 a750_ifpc_reglist_regs[] =3D {
> > -     REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
> > -     REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> > -     REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> > -     REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> > -     REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> > -     REG_A6XX_RBBM_PERFCTR_CNTL,
> > -     REG_A6XX_TPL1_NC_MODE_CNTL,
> > -     REG_A6XX_SP_NC_MODE_CNTL,
> > -     REG_A6XX_CP_DBG_ECO_CNTL,
> > -     REG_A6XX_CP_PROTECT_CNTL,
> > -     REG_A6XX_CP_PROTECT(0),
> > -     REG_A6XX_CP_PROTECT(1),
> > -     REG_A6XX_CP_PROTECT(2),
> > -     REG_A6XX_CP_PROTECT(3),
> > -     REG_A6XX_CP_PROTECT(4),
> > -     REG_A6XX_CP_PROTECT(5),
> > -     REG_A6XX_CP_PROTECT(6),
> > -     REG_A6XX_CP_PROTECT(7),
> > -     REG_A6XX_CP_PROTECT(8),
> > -     REG_A6XX_CP_PROTECT(9),
> > -     REG_A6XX_CP_PROTECT(10),
> > -     REG_A6XX_CP_PROTECT(11),
> > -     REG_A6XX_CP_PROTECT(12),
> > -     REG_A6XX_CP_PROTECT(13),
> > -     REG_A6XX_CP_PROTECT(14),
> > -     REG_A6XX_CP_PROTECT(15),
> > -     REG_A6XX_CP_PROTECT(16),
> > -     REG_A6XX_CP_PROTECT(17),
> > -     REG_A6XX_CP_PROTECT(18),
> > -     REG_A6XX_CP_PROTECT(19),
> > -     REG_A6XX_CP_PROTECT(20),
> > -     REG_A6XX_CP_PROTECT(21),
> > -     REG_A6XX_CP_PROTECT(22),
> > -     REG_A6XX_CP_PROTECT(23),
> > -     REG_A6XX_CP_PROTECT(24),
> > -     REG_A6XX_CP_PROTECT(25),
> > -     REG_A6XX_CP_PROTECT(26),
> > -     REG_A6XX_CP_PROTECT(27),
> > -     REG_A6XX_CP_PROTECT(28),
> > -     REG_A6XX_CP_PROTECT(29),
> > -     REG_A6XX_CP_PROTECT(30),
> > -     REG_A6XX_CP_PROTECT(31),
> > -     REG_A6XX_CP_PROTECT(32),
> > -     REG_A6XX_CP_PROTECT(33),
> > -     REG_A6XX_CP_PROTECT(34),
> > -     REG_A6XX_CP_PROTECT(35),
> > -     REG_A6XX_CP_PROTECT(36),
> > -     REG_A6XX_CP_PROTECT(37),
> > -     REG_A6XX_CP_PROTECT(38),
> > -     REG_A6XX_CP_PROTECT(39),
> > -     REG_A6XX_CP_PROTECT(40),
> > -     REG_A6XX_CP_PROTECT(41),
> > -     REG_A6XX_CP_PROTECT(42),
> > -     REG_A6XX_CP_PROTECT(43),
> > -     REG_A6XX_CP_PROTECT(44),
> > -     REG_A6XX_CP_PROTECT(45),
> > -     REG_A6XX_CP_PROTECT(46),
> > -     REG_A6XX_CP_PROTECT(47),
> > -};
> > -
> > -DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
> > -
> > -static const struct adreno_reglist_pipe a7xx_dyn_pwrup_reglist_regs[] =
=3D {
> > -     { REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -};
> > -
> > -DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
> > -
> > -static const struct adreno_info a7xx_gpus[] =3D {
> > -     {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x07030001),
> > -             .family =3D ADRENO_7XX_GEN1,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "a730_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "gmu_gen70000.bin",
> > -             },
> > -             .gmem =3D SZ_2M,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION,
> > -             .funcs =3D &a7xx_gpu_funcs,
> > -             .zapfw =3D "a730_zap.mdt",
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .hwcg =3D a730_hwcg,
> > -                     .protect =3D &a730_protect,
> > -                     .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &a7xx_dyn_pwrup_reglist,
> > -                     .gbif_cx =3D a640_gbif,
> > -                     .gmu_cgc_mode =3D 0x00020000,
> > -             },
> > -             .preempt_record_size =3D 2860 * SZ_1K,
> > -     }, {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x43020100),
> > -             .family =3D ADRENO_7XX_GEN1,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "qcom/gen71700_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "qcom/gen71700_gmu.bin",
> > -             },
> > -             .gmem =3D SZ_1M,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION,
> > -             .funcs =3D &a7xx_gpu_funcs,
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .hwcg =3D a730_hwcg,
> > -                     .protect =3D &a730_protect,
> > -                     .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &a7xx_dyn_pwrup_reglist,
> > -                     .gbif_cx =3D a640_gbif,
> > -                     .gmu_chipid =3D 0x07110000,
> > -                     .gmu_cgc_mode =3D 0x00020000,
> > -                     .bcms =3D (const struct a6xx_bcm[]) {
> > -                             { .name =3D "SH0", .buswidth =3D 16 },
> > -                             { .name =3D "MC0", .buswidth =3D 4 },
> > -                             {
> > -                                     .name =3D "ACV",
> > -                                     .fixed =3D true,
> > -                                     .perfmode =3D BIT(3),
> > -                                     .perfmode_bw =3D 16500000,
> > -                             },
> > -                             { /* sentinel */ },
> > -                     },
> > -             },
> > -             .preempt_record_size =3D 1536 * SZ_1K,
> > -     }, {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
> > -             .family =3D ADRENO_7XX_GEN2,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "a740_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "gmu_gen70200.bin",
> > -             },
> > -             .gmem =3D 3 * SZ_1M,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION,
> > -             .funcs =3D &a7xx_gpu_funcs,
> > -             .zapfw =3D "a740_zap.mdt",
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .hwcg =3D a740_hwcg,
> > -                     .protect =3D &a730_protect,
> > -                     .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &a7xx_dyn_pwrup_reglist,
> > -                     .gbif_cx =3D a640_gbif,
> > -                     .gmu_chipid =3D 0x7020100,
> > -                     .gmu_cgc_mode =3D 0x00020202,
> > -                     .bcms =3D (const struct a6xx_bcm[]) {
> > -                             { .name =3D "SH0", .buswidth =3D 16 },
> > -                             { .name =3D "MC0", .buswidth =3D 4 },
> > -                             {
> > -                                     .name =3D "ACV",
> > -                                     .fixed =3D true,
> > -                                     .perfmode =3D BIT(3),
> > -                                     .perfmode_bw =3D 16500000,
> > -                             },
> > -                             { /* sentinel */ },
> > -                     },
> > -             },
> > -             .preempt_record_size =3D 4192 * SZ_1K,
> > -     }, {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
> > -             .family =3D ADRENO_7XX_GEN2,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "gen70500_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "gen70500_gmu.bin",
> > -             },
> > -             .gmem =3D 3 * SZ_1M,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION |
> > -                       ADRENO_QUIRK_IFPC,
> > -             .funcs =3D &a7xx_gpu_funcs,
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .hwcg =3D a740_hwcg,
> > -                     .protect =3D &a730_protect,
> > -                     .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &a7xx_dyn_pwrup_reglist,
> > -                     .ifpc_reglist =3D &a750_ifpc_reglist,
> > -                     .gbif_cx =3D a640_gbif,
> > -                     .gmu_chipid =3D 0x7050001,
> > -                     .gmu_cgc_mode =3D 0x00020202,
> > -                     .bcms =3D (const struct a6xx_bcm[]) {
> > -                             { .name =3D "SH0", .buswidth =3D 16 },
> > -                             { .name =3D "MC0", .buswidth =3D 4 },
> > -                             {
> > -                                     .name =3D "ACV",
> > -                                     .fixed =3D true,
> > -                                     .perfmode =3D BIT(3),
> > -                                     .perfmode_bw =3D 16500000,
> > -                             },
> > -                             { /* sentinel */ },
> > -                     },
> > -             },
> > -             .preempt_record_size =3D 4192 * SZ_1K,
> > -             .speedbins =3D ADRENO_SPEEDBINS(
> > -                     { 0,    0 },
> > -                     { 59,   1 },
> > -                     { 7,    2 },
> > -                     { 232,  3 },
> > -                     { 146,  4 },
> > -             ),
> > -     }, {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
> > -             .family =3D ADRENO_7XX_GEN3,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "gen70900_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "gmu_gen70900.bin",
> > -             },
> > -             .gmem =3D 3 * SZ_1M,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION |
> > -                       ADRENO_QUIRK_IFPC,
> > -             .funcs =3D &a7xx_gpu_funcs,
> > -             .zapfw =3D "gen70900_zap.mbn",
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .protect =3D &a730_protect,
> > -                     .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &a7xx_dyn_pwrup_reglist,
> > -                     .ifpc_reglist =3D &a750_ifpc_reglist,
> > -                     .gbif_cx =3D a640_gbif,
> > -                     .gmu_chipid =3D 0x7090100,
> > -                     .gmu_cgc_mode =3D 0x00020202,
> > -                     .bcms =3D (const struct a6xx_bcm[]) {
> > -                             { .name =3D "SH0", .buswidth =3D 16 },
> > -                             { .name =3D "MC0", .buswidth =3D 4 },
> > -                             {
> > -                                     .name =3D "ACV",
> > -                                     .fixed =3D true,
> > -                                     .perfmode =3D BIT(2),
> > -                                     .perfmode_bw =3D 10687500,
> > -                             },
> > -                             { /* sentinel */ },
> > -                     },
> > -             },
> > -             .preempt_record_size =3D 3572 * SZ_1K,
> > -     }, {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x43030c00),
> > -             .family =3D ADRENO_7XX_GEN2,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "gen71500_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "gen71500_gmu.bin",
> > -             },
> > -             .gmem =3D SZ_1M + SZ_512K,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION,
> > -             .funcs =3D &a7xx_gpu_funcs,
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .hwcg =3D a740_hwcg,
> > -                     .protect =3D &a730_protect,
> > -                     .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &a7xx_dyn_pwrup_reglist,
> > -                     .gbif_cx =3D a640_gbif,
> > -                     .gmu_chipid =3D 0x70f0000,
> > -                     .gmu_cgc_mode =3D 0x00020222,
> > -                     .bcms =3D (const struct a6xx_bcm[]) {
> > -                             { .name =3D "SH0", .buswidth =3D 16 },
> > -                             { .name =3D "MC0", .buswidth =3D 4 },
> > -                             {
> > -                                     .name =3D "ACV",
> > -                                     .fixed =3D true,
> > -                                     .perfmode =3D BIT(3),
> > -                                     .perfmode_bw =3D 16500000,
> > -                             },
> > -                             { /* sentinel */ },
> > -                     },
> > -             },
> > -             .preempt_record_size =3D 4192 * SZ_1K,
> > -             .speedbins =3D ADRENO_SPEEDBINS(
> > -                     { 0,   0 },
> > -                     { 294, 1 },
> > -                     { 263, 2 },
> > -                     { 233, 3 },
> > -                     { 141, 4 },
> > -             ),
> > -     }
> > -};
> > -DECLARE_ADRENO_GPULIST(a7xx);
> > -
> > -static const struct adreno_reglist_pipe a830_nonctxt_regs[] =3D {
> > -     { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> > -     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BR) | BIT(PIPE=
_BV) },
> > -     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BR) | BIT(=
PIPE_BV) },
> > -     { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BR) | BIT(PIP=
E_BV) },
> > -     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PI=
PE_BR) | BIT(PIPE_BV) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BR) | BIT(PIPE=
_BV) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BR) | BIT(PIPE=
_BV) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_3, 0x00400000, BIT(PIPE_BR) | BIT(PIPE=
_BV) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BR) | BIT(PIPE=
_BV) },
> > -     /* Configure GBIF GX registers */
> > -     { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) =
},
> > -     /* Enable full concurrent resolve and unresolves */
> > -     { REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> > -     /* Partially enable perf clear, Disable DINT to c/z be data forwa=
rding */
> > -     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_GC_GMEM_PROTECT, 0x0c000000, BIT(PIPE_BR) },
> > -     /* Configure number of outstanding transactions to 32 */
> > -     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> > -     /* Configure UCHE request time out to 16 cycles for CCU/UCHE arbi=
tration */
> > -     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> > -     { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE)=
 },
> > -     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE=
) },
> > -     { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> > -     /* Enable contribution of all shader stages to SP perfcounters */
> > -     { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> > -     /*
> > -      * BIT(26): Limit the number of wave-slots for Eviction buffer to=
 1 per ALU GRP
> > -      * BIT(30): Disable LPAC auto-promotion
> > -      */
> > -     { REG_A7XX_SP_CHICKEN_BITS_1, BIT(26) | BIT(30), BIT(PIPE_NONE) }=
,
> > -     /*
> > -      * BIT(22): Disable PS out of order retire
> > -      * BIT(23): Enable half wave mode and MM instruction src&dst is h=
alf precision
> > -      */
> > -     { REG_A7XX_SP_CHICKEN_BITS_2, BIT(22) | BIT(23), BIT(PIPE_NONE) }=
,
> > -     { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080,  BIT(PIPE_NO=
NE) },
> > -     { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
> > -     /* Enable cubemap small miplevel optimization settings */
> > -     /* BIT(26): Disable final clamp for bicubic filtering */
> > -     { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
> > -     /* Disable tag bank id hashing */
> > -     { REG_A6XX_UCHE_MODE_CNTL, 0x00080000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> > -     /* Limit gmem number of ways for GMEM requests in each set */
> > -     { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE)},
> > -     /* Disable write slow pointer in data phase queue */
> > -     { REG_A8XX_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
> > -     /* Configure UCHE to CCU switchthreshold timeout cycles */
> > -     { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> > -     { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BR) | BIT(PIPE_=
BV) },
> > -     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BR) | BIT(PI=
PE_BV) },
> > -     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BR) | BIT(PI=
PE_BV) },
> > -     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BR) | BIT(PI=
PE_BV) },
> > -     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BR) | BIT(PIPE=
_BV) },
> > -     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BR) | BI=
T(PIPE_BV) },
> > -     /* Disable redundant tile data optimization */
> > -     { REG_A8XX_VSC_KMD_DBG_ECO_CNTL, BIT(11), BIT(PIPE_NONE)},
> > -     { },
> > -};
> > -
> > -static const u32 a830_protect_regs[] =3D {
> > -     A6XX_PROTECT_RDONLY(0x00000, 0x03a3),
> > -     A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> > -     A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> > -     A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> > -     A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> > -     A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> > -     A6XX_PROTECT_RDONLY(0x00759, 0x0026),
> > -     A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> > -     A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> > -     A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> > -     A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> > -     A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> > -     A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> > -     A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> > -     A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> > -     A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> > -     A6XX_PROTECT_RDONLY(0x03cc6, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> > -     A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> > -     A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> > -     A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> > -     A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
> > -     A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> > -     A6XX_PROTECT_NORDWR(0x0ae10, 0x036f),
> > -     A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> > -     A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> > -     A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> > -     A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> > -     A6XX_PROTECT_RDONLY(0x1f878, 0x0787),
> > -     A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> > -     A6XX_PROTECT_NORDWR(0x20000, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> > -     A6XX_PROTECT_RDONLY(0x27880, 0x0381),
> > -     A6XX_PROTECT_NORDWR(0x27882, 0x0001),
> > -     A6XX_PROTECT_NORDWR(0x27c02, 0x0000),
> > -};
> > -DECLARE_ADRENO_PROTECT(a830_protect, 64);
> > -
> > -static const u32 a830_pwrup_reglist_regs[] =3D {
> > -     REG_A6XX_UCHE_MODE_CNTL,
> > -     REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
> > -     REG_A8XX_UCHE_GBIF_GX_CONFIG,
> > -     REG_A8XX_UCHE_CACHE_WAYS,
> > -     REG_A8XX_UCHE_CCHE_MODE_CNTL,
> > -     REG_A8XX_UCHE_CCHE_CACHE_WAYS,
> > -     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
> > -     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
> > -     REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN,
> > -     REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN + 1,
> > -     REG_A8XX_UCHE_CCHE_TRAP_BASE,
> > -     REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
> > -     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
> > -     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
> > -     REG_A8XX_UCHE_HW_DBG_CNTL,
> > -     REG_A8XX_UCHE_WRITE_THRU_BASE,
> > -     REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
> > -     REG_A8XX_UCHE_TRAP_BASE,
> > -     REG_A8XX_UCHE_TRAP_BASE + 1,
> > -     REG_A8XX_UCHE_CLIENT_PF,
> > -     REG_A8XX_VSC_KMD_DBG_ECO_CNTL,
> > -     REG_A8XX_RB_CMP_NC_MODE_CNTL,
> > -     REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
> > -     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
> > -     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
> > -     REG_A7XX_SP_READ_SEL,
> > -     REG_A6XX_TPL1_NC_MODE_CNTL,
> > -     REG_A6XX_TPL1_DBG_ECO_CNTL,
> > -     REG_A6XX_TPL1_DBG_ECO_CNTL1,
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),
> > -};
> > -DECLARE_ADRENO_REGLIST_LIST(a830_pwrup_reglist);
> > -
> > -static const u32 a830_ifpc_reglist_regs[] =3D {
> > -     REG_A8XX_RBBM_NC_MODE_CNTL,
> > -     REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
> > -     REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
> > -     REG_A6XX_SP_NC_MODE_CNTL,
> > -     REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN,
> > -     REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN + 1,
> > -     REG_A7XX_SP_CHICKEN_BITS_1,
> > -     REG_A7XX_SP_CHICKEN_BITS_2,
> > -     REG_A7XX_SP_CHICKEN_BITS_3,
> > -     REG_A6XX_SP_PERFCTR_SHADER_MASK,
> > -     REG_A7XX_SP_HLSQ_DBG_ECO_CNTL,
> > -     REG_A8XX_CP_INTERRUPT_STATUS_MASK_GLOBAL,
> > -     REG_A8XX_RBBM_PERFCTR_CNTL,
> > -     REG_A8XX_CP_PROTECT_GLOBAL(0),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(1),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(2),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(3),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(4),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(5),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(6),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(7),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(8),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(9),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(10),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(11),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(12),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(13),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(14),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(15),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(16),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(17),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(18),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(19),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(20),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(21),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(22),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(23),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(24),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(25),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(26),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(27),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(28),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(29),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(30),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(31),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(32),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(33),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(34),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(35),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(36),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(37),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(38),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(39),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(40),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(41),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(42),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(43),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(44),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(45),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(46),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(47),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(48),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(49),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(50),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(51),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(52),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(53),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(54),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(55),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(56),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(57),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(58),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(59),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(60),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(61),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(62),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(63),
> > -};
> > -DECLARE_ADRENO_REGLIST_LIST(a830_ifpc_reglist);
> > -
> > -static const struct adreno_reglist_pipe a830_dyn_pwrup_reglist_regs[] =
=3D {
> > -     { REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > -             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > -             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > -     { REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > -             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > -             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > -     { REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) |=
 BIT(PIPE_LPAC) },
> > -     { REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | =
BIT(PIPE_LPAC) },
> > -     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > -     { REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIP=
E_BR) },
> > -     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) =
},
> > -     { REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> > -     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BR) | =
BIT(PIPE_BV) },
> > -     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> > -     { },
> > -};
> > -DECLARE_ADRENO_REGLIST_PIPE_LIST(a830_dyn_pwrup_reglist);
> > -
> > -static const struct adreno_reglist_pipe x285_nonctxt_regs[] =3D {
> > -     { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> > -     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > -     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(=
PIPE_BR) },
> > -     { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIP=
E_BR) },
> > -     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PI=
PE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_RB_GC_GMEM_PROTECT, 0x15000000, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> > -     { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE)=
 },
> > -     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE=
) },
> > -     { REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, 0x0fffffff, BIT(PIPE_NON=
E) },
> > -     { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) =
},
> > -     { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_CHICKEN_BITS_2, 0x00820800, BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> > -     { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> > -     /* Disable CS dead batch merge */
> > -     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_2, BIT(31), BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NON=
E) },
> > -     { REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> > -     { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
> > -     /* BIT(26): Disable final clamp for bicubic filtering */
> > -     { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> > -     { REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> > -     { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > -     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00000020, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > -     { },
> > -};
> > -
> > -static const u32 x285_protect_regs[] =3D {
> > -     A6XX_PROTECT_RDONLY(0x00008, 0x039b),
> > -     A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> > -     A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> > -     A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> > -     A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> > -     A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> > -     A6XX_PROTECT_RDONLY(0x00759, 0x0026),
> > -     A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> > -     A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> > -     A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> > -     A6XX_PROTECT_NORDWR(0x0082c, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> > -     A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> > -     A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> > -     A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> > -     A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> > -     A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> > -     A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
> > -     A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> > -     A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> > -     A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> > -     A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> > -     A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
> > -     A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> > -     A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
> > -     A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
> > -     A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
> > -     A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> > -     A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> > -     A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> > -     A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> > -     A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
> > -     A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> > -     A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> > -     A6XX_PROTECT_RDONLY(0x27880, 0x0385),
> > -     A6XX_PROTECT_NORDWR(0x27882, 0x000a),
> > -     A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
> > -};
> > -
> > -DECLARE_ADRENO_PROTECT(x285_protect, 15);
> > -
> > -static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] =
=3D {
> > -     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > -     { REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BV) | BIT(PIPE_BR) =
},
> > -     { REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BV) | =
BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR)},
> > -     { REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_RBP_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > -     { REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > -             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > -             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > -     { REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > -             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > -             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > -     { REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) |=
 BIT(PIPE_LPAC)},
> > -     { REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | =
BIT(PIPE_LPAC) },
> > -     { REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIP=
E_BR) },
> > -};
> > -DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
> > -
> > -static const struct adreno_reglist_pipe a810_nonctxt_regs[] =3D {
> > -     { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> > -     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00f80800, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(=
PIPE_BR) },
> > -     { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIP=
E_BR) },
> > -     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PI=
PE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000023, BIT(PIPE_BV) }, /* Avoi=
d partial waves at VFD */
> > -     { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> > -     /* Partially enable perf clear, Disable DINT to c/z be data forwa=
rding */
> > -     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> > -     { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE)=
 },
> > -     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE=
) },
> > -     { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) =
},
> > -     { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> > -     /*
> > -      * BIT(22): Disable PS out of order retire
> > -      * BIT(23): Enable half wave mode and MM instruction src&dst is h=
alf precision
> > -      */
> > -     { REG_A7XX_SP_CHICKEN_BITS_2, BIT(22) | BIT(23), BIT(PIPE_NONE) }=
,
> > -     { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> > -     { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NON=
E) },
> > -     { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> > -     { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
> > -     { REG_A6XX_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> > -     /* Disable write slow pointer in data phase queue */
> > -     { REG_A8XX_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> > -     { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > -     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > -     { REG_A8XX_RB_GC_GMEM_PROTECT, 0x00900000, BIT(PIPE_BR) },
> > -     { },
> > -};
> > -
> > -static const u32 a810_protect_regs[] =3D {
> > -     A6XX_PROTECT_RDONLY(0x00000, 0x03a3),
> > -     A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> > -     A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> > -     A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> > -     A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> > -     A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> > -     A6XX_PROTECT_RDONLY(0x00759, 0x0026),
> > -     A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> > -     A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> > -     A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> > -     A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> > -     A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> > -     A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> > -     A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> > -     A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> > -     A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> > -     A6XX_PROTECT_RDONLY(0x03cc6, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> > -     A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> > -     A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> > -     A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> > -     A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
> > -     A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> > -     A6XX_PROTECT_NORDWR(0x0ae10, 0x036f),
> > -     A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> > -     A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> > -     A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> > -     A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> > -     A6XX_PROTECT_RDONLY(0x1f878, 0x0787),
> > -     A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> > -     A6XX_PROTECT_NORDWR(0x20000, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> > -     A6XX_PROTECT_RDONLY(0x27880, 0x0381),
> > -     A6XX_PROTECT_NORDWR(0x27882, 0x0001),
> > -     A6XX_PROTECT_NORDWR(0x27c02, 0x0000),
> > -};
> > -DECLARE_ADRENO_PROTECT(a810_protect, 64);
> > -
> > -static const uint32_t a810_pwrup_reglist_regs[] =3D {
> > -     REG_A6XX_UCHE_MODE_CNTL,
> > -     REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
> > -     REG_A8XX_UCHE_GBIF_GX_CONFIG,
> > -     REG_A8XX_UCHE_CACHE_WAYS,
> > -     REG_A8XX_UCHE_CCHE_MODE_CNTL,
> > -     REG_A8XX_UCHE_CCHE_CACHE_WAYS,
> > -     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
> > -     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
> > -     REG_A8XX_UCHE_CCHE_TRAP_BASE,
> > -     REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
> > -     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
> > -     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
> > -     REG_A8XX_UCHE_HW_DBG_CNTL,
> > -     REG_A8XX_UCHE_WRITE_THRU_BASE,
> > -     REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
> > -     REG_A8XX_UCHE_TRAP_BASE,
> > -     REG_A8XX_UCHE_TRAP_BASE + 1,
> > -     REG_A8XX_UCHE_CLIENT_PF,
> > -     REG_A8XX_RB_CMP_NC_MODE_CNTL,
> > -     REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
> > -     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
> > -     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
> > -     REG_A7XX_SP_READ_SEL,
> > -     REG_A6XX_TPL1_NC_MODE_CNTL,
> > -     REG_A6XX_TPL1_DBG_ECO_CNTL,
> > -     REG_A6XX_TPL1_DBG_ECO_CNTL1,
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),
> > -};
> > -DECLARE_ADRENO_REGLIST_LIST(a810_pwrup_reglist);
> > -
> > -static const u32 a810_ifpc_reglist_regs[] =3D {
> > -     REG_A8XX_RBBM_NC_MODE_CNTL,
> > -     REG_A8XX_RBBM_PERFCTR_CNTL,
> > -     REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
> > -     REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
> > -     REG_A6XX_SP_NC_MODE_CNTL,
> > -     REG_A7XX_SP_CHICKEN_BITS_2,
> > -     REG_A7XX_SP_CHICKEN_BITS_3,
> > -     REG_A6XX_SP_PERFCTR_SHADER_MASK,
> > -     REG_A8XX_CP_PROTECT_GLOBAL(0),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(1),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(2),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(3),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(4),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(5),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(6),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(7),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(8),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(9),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(10),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(11),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(12),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(13),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(14),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(15),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(16),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(17),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(18),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(19),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(20),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(21),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(22),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(23),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(24),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(25),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(26),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(27),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(28),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(29),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(30),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(31),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(32),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(33),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(34),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(35),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(36),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(37),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(38),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(39),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(40),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(41),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(42),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(43),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(44),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(45),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(46),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(47),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(48),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(49),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(50),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(51),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(52),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(53),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(54),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(55),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(56),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(57),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(58),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(59),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(60),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(61),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(62),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(63),
> > -};
> > -DECLARE_ADRENO_REGLIST_LIST(a810_ifpc_reglist);
> > -
> > -static const struct adreno_reglist_pipe a810_dyn_pwrup_reglist_regs[] =
=3D {
> > -     { REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) }=
,
> > -     { REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> > -     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > -     { REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIP=
E_BR) },
> > -     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) =
},
> > -     { REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> > -     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BR) | =
BIT(PIPE_BV) },
> > -     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> > -};
> > -DECLARE_ADRENO_REGLIST_PIPE_LIST(a810_dyn_pwrup_reglist);
> > -
> > -static const struct a6xx_hfi_clx_table_v2_cmd x285_clx_tbl =3D {
> > -     .version =3D (2 << 16) | 1,
> > -     .domain =3D {
> > -             /* GX DOMAIN */
> > -             {
> > -                     .data =3D CLX_DATA(60, 11, 0, 1),
> > -                     .clxt =3D 0,
> > -                     .clxh =3D 0,
> > -                     .urg_mode =3D 1,
> > -                     .lkg_en =3D 0,
> > -                     .curr_budget =3D 100,
> > -             },
> > -             /* MXG DOMAIN */
> > -             {
> > -                     .data =3D CLX_DATA(60, 3, 1, 1),
> > -                     .clxt =3D 0,
> > -                     .clxh =3D 0,
> > -                     .urg_mode =3D 1,
> > -                     .lkg_en =3D 0,
> > -                     .curr_budget =3D 100,
> > -             },
> > -     },
> > -};
> > -
> > -struct a6xx_hfi_limits_tbl x285_limits_tbl[] =3D {
> > -     {
> > -             .feature_id =3D GMU_MIT_IFF,
> > -             .domain =3D GMU_GX_DOMAIN,
> > -             .feature_rev =3D 0,
> > -             .cfg =3D {
> > -                     .enable =3D 1,
> > -                     .msg_path =3D 0,
> > -                     .lkg_en =3D 0,
> > -                     .mode =3D 0,
> > -                     .sid =3D 12,
> > -                     .mit_time =3D 5,
> > -                     .curr_limit =3D 18000,
> > -             },
> > -     },
> > -     {
> > -             .feature_id =3D GMU_MIT_IFF,
> > -             .domain =3D GMU_MX_DOMAIN,
> > -             .feature_rev =3D 0,
> > -             .cfg =3D {
> > -                     .enable =3D 1,
> > -                     .msg_path =3D 0,
> > -                     .lkg_en =3D 0,
> > -                     .mode =3D 0,
> > -                     .sid =3D 18,
> > -                     .mit_time =3D 2000,
> > -                     .curr_limit =3D 6000,
> > -             },
> > -     },
> > -     {
> > -             .feature_id =3D GMU_MIT_PCLX,
> > -             .domain =3D GMU_GX_DOMAIN,
> > -             .feature_rev =3D 0,
> > -             .cfg =3D {
> > -                     .enable =3D 1,
> > -                     .msg_path =3D 0,
> > -                     .lkg_en =3D 0,
> > -                     .mode =3D 0,
> > -                     .sid =3D 6,
> > -                     .mit_time =3D 3,
> > -                     .curr_limit =3D 66000,
> > -             },
> > -     },
> > -     {
> > -             .feature_id =3D GMU_MIT_PCLX,
> > -             .domain =3D GMU_MX_DOMAIN,
> > -             .feature_rev =3D 0,
> > -             .cfg =3D {
> > -                     .enable =3D 0,
> > -                     .msg_path =3D 0,
> > -                     .lkg_en =3D 0,
> > -                     .mode =3D 0,
> > -                     .sid =3D 6,
> > -                     .mit_time =3D 3,
> > -                     .curr_limit =3D 18000,
> > -             },
> > -     },
> > -};
> > -DECLARE_ADRENO_LIMITS_TABLE(x285_limits);
> > -
> > -static const struct adreno_reglist_pipe a840_nonctxt_regs[] =3D {
> > -     { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> > -     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > -     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(=
PIPE_BR) },
> > -     { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIP=
E_BR) },
> > -     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PI=
PE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     /* Disable Dead Draw Merge scheme on RB-HLSQ */
> > -     { REG_A6XX_RB_RBP_CNTL, BIT(5), BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> > -     /* Partially enable perf clear, Disable DINT to c/z be data forwa=
rding */
> > -     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> > -     { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_POWER_UP_RESET_SW_OVERRIDE, 0x70809060, BIT(PIPE_=
NONE) },
> > -     { REG_A8XX_RBBM_POWER_UP_RESET_SW_BV_OVERRIDE, 0x30000000, BIT(PI=
PE_NONE) },
> > -     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE)=
 },
> > -     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE=
) },
> > -     { REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, 0x0fffffff, BIT(PIPE_NON=
E) },
> > -     { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) =
},
> > -     { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> > -     /* Disable mode_switch optimization in UMAS */
> > -     { REG_A6XX_SP_CHICKEN_BITS, BIT(24) | BIT(26), BIT(PIPE_NONE) },
> > -     /* Disable LPAC large-LM mode */
> > -     { REG_A8XX_SP_SS_CHICKEN_BITS_0, BIT(3), BIT(PIPE_NONE) },
> > -     /* Disable PS out of order retire */
> > -     { REG_A7XX_SP_CHICKEN_BITS_2, 0x00c21800, BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> > -     /* Disable SP2TP info attribute */
> > -     { REG_A8XX_SP_CHICKEN_BITS_4, 0x00000002, BIT(PIPE_NONE) },
> > -     { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL, BIT(14), BIT(PIPE_NONE) },
> > -     /* Ignore HLSQ shared constant feedback from SP */
> > -     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1, BIT(17), BIT(PIPE_NONE) },
> > -     /* Disable CS dead batch merge */
> > -     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_2, BIT(24), BIT(PIPE_NONE) },
> > -     { REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3, BIT(7), BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NON=
E) },
> > -     { REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> > -     { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> > -     /* BIT(26): Disable final clamp for bicubic filtering */
> > -     { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> > -     { REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> > -     { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > -     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00000020, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > -     { },
> > -};
> > -
> > -static const u32 a840_protect_regs[] =3D {
> > -     A6XX_PROTECT_RDONLY(0x00008, 0x039b),
> > -     A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> > -     A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> > -     A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> > -     A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> > -     A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> > -     A6XX_PROTECT_RDONLY(0x00759, 0x001b),
> > -     A6XX_PROTECT_NORDWR(0x00775, 0x000a),
> > -     A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> > -     A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> > -     A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> > -     A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> > -     A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> > -     A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> > -     A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> > -     A6XX_PROTECT_NORDWR(0x00c07, 0x0008),
> > -     A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> > -     A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> > -     A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
> > -     A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> > -     A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> > -     A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> > -     A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> > -     A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
> > -     A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> > -     A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
> > -     A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
> > -     A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
> > -     A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> > -     A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> > -     A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> > -     A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> > -     A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
> > -     A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> > -     A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> > -     A6XX_PROTECT_RDONLY(0x27880, 0x0385),
> > -     A6XX_PROTECT_NORDWR(0x27882, 0x0009),
> > -     A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
> > -};
> > -DECLARE_ADRENO_PROTECT(a840_protect, 15);
> > -
> > -static const struct adreno_reglist a840_gbif[] =3D {
> > -     { REG_A6XX_GBIF_QSB_SIDE0, 0x00071e20 },
> > -     { REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
> > -     { REG_A6XX_GBIF_QSB_SIDE2, 0x00071e20 },
> > -     { REG_A6XX_GBIF_QSB_SIDE3, 0x00071e20 },
> > -     { REG_A6XX_GBIF_CX_CONFIG, 0x20023000 },
> > -     { },
> > -};
> > -
> > -static const uint32_t a840_pwrup_reglist_regs[] =3D {
> > -     REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
> > -     REG_A7XX_SP_READ_SEL,
> > -     REG_A6XX_UCHE_MODE_CNTL,
> > -     REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
> > -     REG_A8XX_UCHE_GBIF_GX_CONFIG,
> > -     REG_A8XX_UCHE_CCHE_MODE_CNTL,
> > -     REG_A8XX_UCHE_CCHE_CACHE_WAYS,
> > -     REG_A8XX_UCHE_CACHE_WAYS,
> > -     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
> > -     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
> > -     REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN,
> > -     REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN + 1,
> > -     REG_A8XX_UCHE_CCHE_TRAP_BASE,
> > -     REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
> > -     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
> > -     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
> > -     REG_A8XX_UCHE_HW_DBG_CNTL,
> > -     REG_A8XX_UCHE_WRITE_THRU_BASE,
> > -     REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
> > -     REG_A8XX_UCHE_TRAP_BASE,
> > -     REG_A8XX_UCHE_TRAP_BASE + 1,
> > -     REG_A8XX_UCHE_CLIENT_PF,
> > -     REG_A8XX_RB_CMP_NC_MODE_CNTL,
> > -     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
> > -     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
> > -     REG_A6XX_TPL1_NC_MODE_CNTL,
> > -     REG_A6XX_TPL1_DBG_ECO_CNTL,
> > -     REG_A6XX_TPL1_DBG_ECO_CNTL1,
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),
> > -};
> > -DECLARE_ADRENO_REGLIST_LIST(a840_pwrup_reglist);
> > -
> > -static const u32 a840_ifpc_reglist_regs[] =3D {
> > -     REG_A8XX_RBBM_NC_MODE_CNTL,
> > -     REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
> > -     REG_A6XX_SP_NC_MODE_CNTL,
> > -     REG_A6XX_SP_CHICKEN_BITS,
> > -     REG_A8XX_SP_SS_CHICKEN_BITS_0,
> > -     REG_A7XX_SP_CHICKEN_BITS_1,
> > -     REG_A7XX_SP_CHICKEN_BITS_2,
> > -     REG_A7XX_SP_CHICKEN_BITS_3,
> > -     REG_A8XX_SP_CHICKEN_BITS_4,
> > -     REG_A6XX_SP_PERFCTR_SHADER_MASK,
> > -     REG_A8XX_RBBM_SLICE_PERFCTR_CNTL,
> > -     REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
> > -     REG_A7XX_SP_HLSQ_DBG_ECO_CNTL,
> > -     REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1,
> > -     REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_2,
> > -     REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3,
> > -     REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN,
> > -     REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN + 1,
> > -     REG_A8XX_CP_INTERRUPT_STATUS_MASK_GLOBAL,
> > -     REG_A8XX_RBBM_PERFCTR_CNTL,
> > -     REG_A8XX_CP_PROTECT_GLOBAL(0),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(1),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(2),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(3),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(4),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(5),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(6),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(7),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(8),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(9),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(10),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(11),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(12),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(13),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(14),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(15),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(16),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(17),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(18),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(19),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(20),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(21),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(22),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(23),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(24),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(25),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(26),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(27),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(28),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(29),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(30),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(31),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(32),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(33),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(34),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(35),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(36),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(37),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(38),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(39),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(40),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(41),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(42),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(43),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(44),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(45),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(46),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(47),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(48),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(49),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(50),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(51),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(52),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(53),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(54),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(55),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(56),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(57),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(58),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(59),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(60),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(61),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(62),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(63),
> > -};
> > -DECLARE_ADRENO_REGLIST_LIST(a840_ifpc_reglist);
> > -
> > -static const struct adreno_reglist_pipe a840_dyn_pwrup_reglist_regs[] =
=3D {
> > -     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > -     { REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BV) | BIT(PIPE_BR) =
},
> > -     { REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BV) | =
BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR)},
> > -     { REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_RBP_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > -     { REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > -             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > -             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > -     { REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > -             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > -             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > -     { REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) |=
 BIT(PIPE_LPAC)},
> > -     { REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | =
BIT(PIPE_LPAC) },
> > -     { REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIP=
E_BR) },
> > -};
> > -DECLARE_ADRENO_REGLIST_PIPE_LIST(a840_dyn_pwrup_reglist);
> > -
> > -static const struct a6xx_hfi_clx_table_v2_cmd a840_clx_tbl =3D {
> > -     .version =3D (2 << 16) | 1,
> > -     .domain =3D {
> > -             /* GX DOMAIN */
> > -             {
> > -                     .data =3D CLX_DATA(60, 5, 1, 1),
> > -                     .clxt =3D 0,
> > -                     .clxh =3D 0,
> > -                     .urg_mode =3D 1,
> > -                     .lkg_en =3D 0,
> > -                     .curr_budget =3D 100,
> > -             },
> > -             /* MXG DOMAIN */
> > -             {
> > -                     .data =3D CLX_DATA(60, 1, 1, 1),
> > -                     .clxt =3D 0,
> > -                     .clxh =3D 0,
> > -                     .urg_mode =3D 1,
> > -                     .lkg_en =3D 0,
> > -                     .curr_budget =3D 50,
> > -             },
> > -     },
> > -};
> > -
> > -struct a6xx_hfi_limits_tbl a840_limits_tbl[] =3D {
> > -     {
> > -             .feature_id =3D GMU_MIT_IFF,
> > -             .domain =3D GMU_GX_DOMAIN,
> > -             .feature_rev =3D 0,
> > -             .cfg =3D {
> > -                     .enable =3D 1,
> > -                     .msg_path =3D 0,
> > -                     .lkg_en =3D 0,
> > -                     .mode =3D 0,
> > -                     .sid =3D 12,
> > -                     .mit_time =3D 5,
> > -                     .curr_limit =3D 6000,
> > -             },
> > -     },
> > -     {
> > -             .feature_id =3D GMU_MIT_IFF,
> > -             .domain =3D GMU_MX_DOMAIN,
> > -             .feature_rev =3D 0,
> > -             .cfg =3D {
> > -                     .enable =3D 1,
> > -                     .msg_path =3D 0,
> > -                     .lkg_en =3D 0,
> > -                     .mode =3D 0,
> > -                     .sid =3D 9,
> > -                     .mit_time =3D 2000,
> > -                     .curr_limit =3D 6000,
> > -             },
> > -     },
> > -     {
> > -             .feature_id =3D GMU_MIT_PCLX,
> > -             .domain =3D GMU_GX_DOMAIN,
> > -             .feature_rev =3D 0,
> > -             .cfg =3D {
> > -                     .enable =3D 1,
> > -                     .msg_path =3D 0,
> > -                     .lkg_en =3D 0,
> > -                     .mode =3D 0,
> > -                     .sid =3D 7,
> > -                     .mit_time =3D 3,
> > -                     .curr_limit =3D 30000,
> > -             },
> > -     },
> > -     {
> > -             .feature_id =3D GMU_MIT_PCLX,
> > -             .domain =3D GMU_MX_DOMAIN,
> > -             .feature_rev =3D 0,
> > -             .cfg =3D {
> > -                     .enable =3D 0,
> > -                     .msg_path =3D 0,
> > -                     .lkg_en =3D 0,
> > -                     .mode =3D 0,
> > -                     .sid =3D 7,
> > -                     .mit_time =3D 3,
> > -                     .curr_limit =3D 6000,
> > -             },
> > -     },
> > -};
> > -DECLARE_ADRENO_LIMITS_TABLE(a840_limits);
> > -
> > -static const struct adreno_reglist_pipe a845_nonctxt_regs[] =3D {
> > -     { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> > -     { REG_A8XX_CP_MULTIDRAW_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x01000800, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > -     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(=
PIPE_BR) },
> > -     { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIP=
E_BR) },
> > -     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PI=
PE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000803, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_3, 0x00400000, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_5, BIT(28) | BIT(30), BIT(PIPE_BV) | B=
IT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) =
},
> > -     { REG_A8XX_RB_GC_GMEM_PROTECT, 0x0C000000, BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > -     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> > -     { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_SLICE_PERFCTR_CNTL, BIT(0), BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_POWER_UP_RESET_SW_OVERRIDE, 0x70809060, BIT(PIPE_=
NONE) },
> > -     { REG_A8XX_RBBM_POWER_UP_RESET_SW_BV_OVERRIDE, 0x30000000, BIT(PI=
PE_NONE) },
> > -     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE)=
 },
> > -     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE=
) },
> > -     { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) =
},
> > -     { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> > -     { REG_A6XX_SP_CHICKEN_BITS, BIT(24), BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_CHICKEN_BITS_2, 0x00820800, BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_SP_CHICKEN_BITS_5, BIT(3), BIT(PIPE_NONE) },
> > -     { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL, 0x04000000, BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1, BIT(17), BIT(PIPE_NONE) },
> > -     { REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3, BIT(1), BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NON=
E) },
> > -     { REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> > -     { REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
> > -     { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> > -     { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
> > -     { REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_HW_DBG_CNTL, 0x01410000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> > -     { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > -     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00080020, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > -     { REG_A8XX_VSC_VISIBILITY_FLUSH_CNTL, 0x00080004, BIT(PIPE_NONE) =
},
> > -     { },
> > -};
> > -
> > -static const struct adreno_reglist_pipe a850_nonctxt_regs[] =3D {
> > -     { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> > -     { REG_A8XX_CP_MULTIDRAW_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x01000800, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > -     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(=
PIPE_BR) },
> > -     { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIP=
E_BR) },
> > -     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PI=
PE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_3, 0x00400000, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_5, BIT(28), BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > -     { REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) =
},
> > -     { REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > -     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> > -     { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_SLICE_PERFCTR_CNTL, BIT(0), BIT(PIPE_NONE) },
> > -     { REG_A8XX_RBBM_POWER_UP_RESET_SW_OVERRIDE, 0x70809060, BIT(PIPE_=
NONE) },
> > -     { REG_A8XX_RBBM_POWER_UP_RESET_SW_BV_OVERRIDE, 0x30000000, BIT(PI=
PE_NONE) },
> > -     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE)=
 },
> > -     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE=
) },
> > -     { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) =
},
> > -     { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> > -     { REG_A6XX_SP_CHICKEN_BITS, BIT(24), BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_CHICKEN_BITS_2, 0x00820800, BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_SP_CHICKEN_BITS_5, BIT(3), BIT(PIPE_NONE) },
> > -     { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL, 0x04000000, BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1, BIT(17), BIT(PIPE_NONE) },
> > -     { REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3, BIT(1), BIT(PIPE_NONE) },
> > -     { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NON=
E) },
> > -     { REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> > -     { REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
> > -     { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> > -     { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
> > -     { REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_HW_DBG_CNTL, 0x01410000, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> > -     { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> > -     { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > -     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > -     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00080020, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > -     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > -     { REG_A8XX_VSC_VISIBILITY_FLUSH_CNTL, 0x00080004, BIT(PIPE_NONE) =
},
> > -     { },
> > -};
> > -
> > -static const u32 a850_protect_regs[] =3D {
> > -     A6XX_PROTECT_RDONLY(0x00008, 0x039b),
> > -     A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> > -     A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> > -     A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> > -     A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> > -     A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> > -     A6XX_PROTECT_RDONLY(0x00759, 0x001b),
> > -     A6XX_PROTECT_NORDWR(0x00775, 0x000a),
> > -     A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> > -     A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> > -     A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> > -     A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> > -     A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> > -     A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> > -     A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> > -     A6XX_PROTECT_NORDWR(0x00c07, 0x0008),
> > -     A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> > -     A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00df5, 0x0003),
> > -     A6XX_PROTECT_RDONLY(0x00df9, 0x0007),
> > -     A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> > -     A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
> > -     A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> > -     A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> > -     A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> > -     A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> > -     A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> > -     A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
> > -     A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
> > -     A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> > -     A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
> > -     A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
> > -     A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
> > -     A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> > -     A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> > -     A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> > -     A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1ac00, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1cc00, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> > -     A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
> > -     A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> > -     A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
> > -     A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> > -     A6XX_PROTECT_RDONLY(0x27880, 0x0385),
> > -     A6XX_PROTECT_NORDWR(0x27882, 0x0035),
> > -     A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
> > -};
> > -DECLARE_ADRENO_PROTECT(a850_protect, 15);
> > -
> > -static const u32 a850_pwrup_reglist_regs[] =3D {
> > -     REG_A8XX_RB_CMP_NC_MODE_CNTL,
> > -     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
> > -     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
> > -     REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
> > -     REG_A7XX_SP_READ_SEL,
> > -     REG_A8XX_CP_MULTIDRAW_CNTL,
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
> > -     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),
> > -     REG_A6XX_TPL1_DBG_ECO_CNTL,
> > -     REG_A6XX_TPL1_DBG_ECO_CNTL1,
> > -     REG_A6XX_TPL1_NC_MODE_CNTL,
> > -     REG_A6XX_UCHE_MODE_CNTL,
> > -     REG_A8XX_UCHE_CCHE_MODE_CNTL,
> > -     REG_A8XX_UCHE_HW_DBG_CNTL,
> > -     REG_A8XX_UCHE_CCHE_CACHE_WAYS,
> > -     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
> > -     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
> > -     REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN,
> > -     REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN + 1,
> > -     REG_A8XX_UCHE_CCHE_TRAP_BASE,
> > -     REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
> > -     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
> > -     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
> > -     REG_A8XX_UCHE_CLIENT_PF,
> > -     REG_A8XX_UCHE_DBG_ECO_CNTL_0,
> > -     REG_A8XX_UCHE_GBIF_GX_CONFIG,
> > -     REG_A8XX_UCHE_TRAP_BASE,
> > -     REG_A8XX_UCHE_TRAP_BASE + 1,
> > -     REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
> > -     REG_A8XX_UCHE_WRITE_THRU_BASE,
> > -     REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
> > -     REG_A8XX_VSC_VISIBILITY_FLUSH_CNTL,
> > -};
> > -DECLARE_ADRENO_REGLIST_LIST(a850_pwrup_reglist);
> > -
> > -static const u32 a850_ifpc_reglist_regs[] =3D {
> > -     REG_A8XX_CP_INTERRUPT_STATUS_MASK_GLOBAL,
> > -     REG_A8XX_RBBM_NC_MODE_CNTL,
> > -     REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
> > -     REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
> > -     REG_A8XX_RBBM_SLICE_PERFCTR_CNTL,
> > -     REG_A6XX_SP_CHICKEN_BITS,
> > -     REG_A7XX_SP_CHICKEN_BITS_2,
> > -     REG_A7XX_SP_CHICKEN_BITS_3,
> > -     REG_A8XX_SP_CHICKEN_BITS_5,
> > -     REG_A7XX_SP_HLSQ_DBG_ECO_CNTL,
> > -     REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1,
> > -     REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3,
> > -     REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN,
> > -     REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN + 1,
> > -     REG_A6XX_SP_NC_MODE_CNTL,
> > -     REG_A6XX_SP_PERFCTR_SHADER_MASK,
> > -     REG_A8XX_SP_L0_PERF_TUNE,
> > -     REG_A8XX_CP_PROTECT_GLOBAL(0),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(1),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(2),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(3),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(4),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(5),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(6),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(7),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(8),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(9),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(10),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(11),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(12),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(13),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(14),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(15),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(16),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(17),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(18),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(19),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(20),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(21),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(22),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(23),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(24),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(25),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(26),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(27),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(28),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(29),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(30),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(31),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(32),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(33),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(34),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(35),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(36),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(37),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(38),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(39),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(40),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(41),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(42),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(43),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(44),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(45),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(46),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(47),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(48),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(49),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(50),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(51),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(52),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(53),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(54),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(55),
> > -     REG_A8XX_CP_PROTECT_GLOBAL(63),
> > -};
> > -DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
> > -
> > -static const struct adreno_reglist a850_gbif[] =3D {
> > -     { REG_A6XX_GBIF_QSB_SIDE0, 0x00071e20 },
> > -     { REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
> > -     { REG_A6XX_GBIF_QSB_SIDE2, 0x00071e20 },
> > -     { REG_A6XX_GBIF_QSB_SIDE3, 0x00071e20 },
> > -     { REG_A6XX_GBIF_CX_CONFIG, 0x20023020 },
> > -     { },
> > -};
> > -
> > -static const struct adreno_reglist_pipe a850_dyn_pwrup_reglist_regs[] =
=3D {
> > -     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > -     { REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BV) | BIT(PIPE_BR) =
},
> > -     { REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CHICKEN_BITS_5, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BV) | =
BIT(PIPE_BR) },
> > -     { REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR)},
> > -     { REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_RBP_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > -     { REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > -     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > -     { REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > -             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > -             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > -     { REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > -             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > -             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > -     { REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) |=
 BIT(PIPE_LPAC) },
> > -     { REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | =
BIT(PIPE_LPAC) },
> > -     { REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > -     { REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > -     { REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIP=
E_BR) },
> > -};
> > -DECLARE_ADRENO_REGLIST_PIPE_LIST(a850_dyn_pwrup_reglist);
> > -
> > -static const struct adreno_info a8xx_gpus[] =3D {
> > -     {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x44050001),
> > -             .family =3D ADRENO_8XX_GEN1,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "gen80000_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "gen80000_gmu.bin",
> > -                     [ADRENO_FW_AQE] =3D "gen80000_aqe.fw",
> > -             },
> > -             .gmem =3D 12 * SZ_1M,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION |
> > -                       ADRENO_QUIRK_IFPC,
> > -             .funcs =3D &a8xx_gpu_funcs,
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .protect =3D &a830_protect,
> > -                     .nonctxt_reglist =3D a830_nonctxt_regs,
> > -                     .pwrup_reglist =3D &a830_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &a830_dyn_pwrup_reglist,
> > -                     .ifpc_reglist =3D &a830_ifpc_reglist,
> > -                     .gbif_cx =3D a840_gbif,
> > -                     .max_slices =3D 3,
> > -                     .gmu_chipid =3D 0x8000100,
> > -                     .bcms =3D (const struct a6xx_bcm[]) {
> > -                             { .name =3D "SH0", .buswidth =3D 16 },
> > -                             { .name =3D "MC0", .buswidth =3D 4 },
> > -                             {
> > -                                     .name =3D "ACV",
> > -                                     .fixed =3D true,
> > -                                     .perfmode =3D BIT(2),
> > -                                     .perfmode_bw =3D 10687500,
> > -                             },
> > -                             { /* sentinel */ },
> > -                     },
> > -             },
> > -             .preempt_record_size =3D 13536 * SZ_1K,
> > -             .speedbins =3D ADRENO_SPEEDBINS(
> > -                     { 0,   0 },
> > -                     { 252, 0 },
> > -                     { 242, 1 },
> > -                     { 232, 2 },
> > -                     { 221, 3 },
> > -                     { 190, 4 },
> > -             ),
> > -     }, {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x44070001),
> > -             .family =3D ADRENO_8XX_GEN2,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "gen80100_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "gen80100_gmu.bin",
> > -             },
> > -             .gmem =3D 21 * SZ_1M,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION |
> > -                       ADRENO_QUIRK_SOFTFUSE,
> > -             .funcs =3D &a8xx_gpu_funcs,
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .protect =3D &x285_protect,
> > -                     .nonctxt_reglist =3D x285_nonctxt_regs,
> > -                     .pwrup_reglist =3D &a840_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &x285_dyn_pwrup_reglist,
> > -                     .ifpc_reglist =3D &a840_ifpc_reglist,
> > -                     .gbif_cx =3D a840_gbif,
> > -                     .max_slices =3D 4,
> > -                     .gmu_chipid =3D 0x8010100,
> > -                     .bcms =3D (const struct a6xx_bcm[]) {
> > -                             { .name =3D "SH0", .buswidth =3D 16 },
> > -                             { .name =3D "MC0", .buswidth =3D 4 },
> > -                             {
> > -                                     .name =3D "ACV",
> > -                                     .fixed =3D true,
> > -                                     .perfmode =3D BIT(2),
> > -                                     .perfmode_bw =3D 16500000,
> > -                             },
> > -                             { /* sentinel */ },
> > -                     },
> > -                     .clx_tbl =3D &x285_clx_tbl,
> > -                     .limits_tbl =3D &x285_limits,
> > -             },
> > -             .speedbins =3D ADRENO_SPEEDBINS(
> > -                     { 0,   0 },
> > -                     { 388, 1 },
> > -                     { 357, 2 },
> > -                     { 284, 3 },
> > -             ),
> > -     }, {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x44050a01),
> > -             .family =3D ADRENO_8XX_GEN2,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "gen80200_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "gen80200_gmu.bin",
> > -                     [ADRENO_FW_AQE] =3D "gen80200_aqe.fw",
> > -             },
> > -             .gmem =3D 18 * SZ_1M,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION |
> > -                       ADRENO_QUIRK_IFPC,
> > -             .funcs =3D &a8xx_gpu_funcs,
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .protect =3D &a840_protect,
> > -                     .nonctxt_reglist =3D a840_nonctxt_regs,
> > -                     .pwrup_reglist =3D &a840_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &a840_dyn_pwrup_reglist,
> > -                     .ifpc_reglist =3D &a840_ifpc_reglist,
> > -                     .gbif_cx =3D a840_gbif,
> > -                     .max_slices =3D 3,
> > -                     .gmu_chipid =3D 0x8020100,
> > -                     .bcms =3D (const struct a6xx_bcm[]) {
> > -                             { .name =3D "SH0", .buswidth =3D 16 },
> > -                             { .name =3D "MC0", .buswidth =3D 4 },
> > -                             {
> > -                                     .name =3D "ACV",
> > -                                     .fixed =3D true,
> > -                                     .perfmode =3D BIT(2),
> > -                                     .perfmode_bw =3D 10687500,
> > -                             },
> > -                             { /* sentinel */ },
> > -                     },
> > -                     .clx_tbl =3D &a840_clx_tbl,
> > -                     .limits_tbl =3D &a840_limits,
> > -             },
> > -             .preempt_record_size =3D 19708 * SZ_1K,
> > -             .speedbins =3D ADRENO_SPEEDBINS(
> > -                     { 0,   0 },
> > -                     { 273, 1 },
> > -                     { 252, 2 },
> > -                     { 221, 3 },
> > -             ),
> > -     }, {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x44010000),
> > -             .family =3D ADRENO_8XX_GEN1,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "gen80300_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "gen80300_gmu.bin",
> > -             },
> > -             .gmem =3D SZ_512K + SZ_64K,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION |
> > -                       ADRENO_QUIRK_IFPC,
> > -             .funcs =3D &a8xx_gpu_funcs,
> > -             .zapfw =3D "gen80300_zap.mbn",
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .protect =3D &a810_protect,
> > -                     .nonctxt_reglist =3D a810_nonctxt_regs,
> > -                     .pwrup_reglist =3D &a810_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &a810_dyn_pwrup_reglist,
> > -                     .ifpc_reglist =3D &a810_ifpc_reglist,
> > -                     .gbif_cx =3D a840_gbif,
> > -                     .max_slices =3D 1,
> > -                     .gmu_chipid =3D 0x8030000,
> > -                     .bcms =3D (const struct a6xx_bcm[]) {
> > -                             { .name =3D "SH0", .buswidth =3D 16 },
> > -                             { .name =3D "MC0", .buswidth =3D 4 },
> > -                             {
> > -                                     .name =3D "ACV",
> > -                                     .fixed =3D true,
> > -                                     .perfmode =3D BIT(2),
> > -                                     .perfmode_bw =3D 10687500,
> > -                             },
> > -                             { /* sentinel */ },
> > -                     },
> > -             },
> > -             .preempt_record_size =3D 4558 * SZ_1K,
> > -             .speedbins =3D ADRENO_SPEEDBINS(
> > -                     { 0,   0 },
> > -                     { 242, 1 },
> > -                     { 221, 2 },
> > -             ),
> > -     }, {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x44060000),
> > -             .family =3D ADRENO_8XX_GEN2,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "gen80100_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "gen80100_gmu.bin",
> > -                     [ADRENO_FW_AQE] =3D "gen80100_aqe.fw",
> > -             },
> > -             .gmem =3D 15 * SZ_1M + SZ_512K + SZ_256K,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION |
> > -                       ADRENO_QUIRK_SOFTFUSE,
> > -             .funcs =3D &a8xx_gpu_funcs,
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .protect =3D &x285_protect,
> > -                     .nonctxt_reglist =3D x285_nonctxt_regs,
> > -                     .pwrup_reglist =3D &a840_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &x285_dyn_pwrup_reglist,
> > -                     .ifpc_reglist =3D &a840_ifpc_reglist,
> > -                     .gbif_cx =3D a840_gbif,
> > -                     .max_slices =3D 3,
> > -                     .gmu_chipid =3D 0x80a0000,
> > -                     .bcms =3D (const struct a6xx_bcm[]) {
> > -                             { .name =3D "SH0", .buswidth =3D 16 },
> > -                             { .name =3D "MC0", .buswidth =3D 4 },
> > -                             {
> > -                                     .name =3D "ACV",
> > -                                     .fixed =3D true,
> > -                                     .perfmode =3D BIT(2),
> > -                                     .perfmode_bw =3D 16500000,
> > -                             },
> > -                             { /* sentinel */ },
> > -                     },
> > -             },
> > -             .speedbins =3D ADRENO_SPEEDBINS(
> > -                     { 0,   0 },
> > -                     { 388, 1 },
> > -                     { 357, 2 },
> > -                     { 284, 3 },
> > -             ),
> > -     }, {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x44041400),
> > -             .family =3D ADRENO_8XX_GEN2,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "gen81100_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "gen81400_gmu.bin",
> > -                     [ADRENO_FW_AQE] =3D "gen81100_aqe.fw",
> > -             },
> > -             .gmem =3D 12 * SZ_1M,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION |
> > -                       ADRENO_QUIRK_IFPC,
> > -             .funcs =3D &a8xx_gpu_funcs,
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .protect =3D &a850_protect,
> > -                     .nonctxt_reglist =3D a845_nonctxt_regs,
> > -                     .pwrup_reglist =3D &a850_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &a850_dyn_pwrup_reglist,
> > -                     .ifpc_reglist =3D &a850_ifpc_reglist,
> > -                     .gbif_cx =3D a850_gbif,
> > -                     .max_slices =3D 3,
> > -                     .gmu_chipid =3D 0x80e0000,
> > -                     .thinmem_config =3D 14,
> > -                     .bcms =3D (const struct a6xx_bcm[]) {
> > -                             { .name =3D "SH0", .buswidth =3D 32 },
> > -                             { .name =3D "MC0", .buswidth =3D 4 },
> > -                             {
> > -                                     .name =3D "ACV",
> > -                                     .fixed =3D true,
> > -                                     .perfmode =3D BIT(2),
> > -                                     .perfmode_bw =3D 16500000,
> > -                             },
> > -                             { /* sentinel */ },
> > -                     },
> > -             },
> > -             .preempt_record_size =3D 13564 * SZ_1K,
> > -             .speedbins =3D ADRENO_SPEEDBINS(
> > -                     { 0, 0 },
> > -                     { 0xd8, 0 },
> > -                     { 0x11c, 1 },
> > -             ),
> > -     }, {
> > -             .chip_ids =3D ADRENO_CHIP_IDS(0x44051401),
> > -             .family =3D ADRENO_8XX_GEN2,
> > -             .fw =3D {
> > -                     [ADRENO_FW_SQE] =3D "gen81100_sqe.fw",
> > -                     [ADRENO_FW_GMU] =3D "gen81100_gmu.bin",
> > -                     [ADRENO_FW_AQE] =3D "gen81100_aqe.fw",
> > -             },
> > -             .gmem =3D 18 * SZ_1M,
> > -             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > -                       ADRENO_QUIRK_HAS_HW_APRIV |
> > -                       ADRENO_QUIRK_PREEMPTION |
> > -                       ADRENO_QUIRK_IFPC,
> > -             .funcs =3D &a8xx_gpu_funcs,
> > -             .a6xx =3D &(const struct a6xx_info) {
> > -                     .protect =3D &a850_protect,
> > -                     .nonctxt_reglist =3D a850_nonctxt_regs,
> > -                     .pwrup_reglist =3D &a850_pwrup_reglist,
> > -                     .dyn_pwrup_reglist =3D &a850_dyn_pwrup_reglist,
> > -                     .ifpc_reglist =3D &a850_ifpc_reglist,
> > -                     .gbif_cx =3D a850_gbif,
> > -                     .max_slices =3D 3,
> > -                     .gmu_chipid =3D 0x80b0100,
> > -                     .thinmem_config =3D 14,
> > -                     .bcms =3D (const struct a6xx_bcm[]) {
> > -                             { .name =3D "SH0", .buswidth =3D 32 },
> > -                             { .name =3D "MC0", .buswidth =3D 4 },
> > -                             {
> > -                                     .name =3D "ACV",
> > -                                     .fixed =3D true,
> > -                                     .perfmode =3D BIT(2),
> > -                                     .perfmode_bw =3D 16500000,
> > -                             },
> > -                             { /* sentinel */ },
> > -                     },
> > -             },
> > -             .preempt_record_size =3D 19708 * SZ_1K,
> > -             .speedbins =3D ADRENO_SPEEDBINS(
> > -                     { 0, 0 },
> > -                     { 284, 2 },
> > -                     { 216, 3 },
> > -             ),
> > -     }
> > -};
> > -
> > -DECLARE_ADRENO_GPULIST(a8xx);
> > -
> >  static inline __always_unused void __build_asserts(void)
> >  {
> >       BUILD_BUG_ON(a630_protect.count > a630_protect.count_max);
> >       BUILD_BUG_ON(a650_protect.count > a650_protect.count_max);
> >       BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
> >       BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
> > -     BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
> > -     BUILD_BUG_ON(a810_protect.count > a810_protect.count_max);
> > -     BUILD_BUG_ON(a830_protect.count > a830_protect.count_max);
> >  }
> > diff --git a/drivers/gpu/drm/msm/adreno/a7xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a7xx_catalog.c
> > new file mode 100644
> > index 000000000000..15d669515e4e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/adreno/a7xx_catalog.c
> > @@ -0,0 +1,496 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2013-2014 Red Hat
> > + * Author: Rob Clark <robdclark@gmail.com>
> > + *
> > + * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
> > + */
> > +
> > +#include "adreno_gpu.h"
> > +#include "a6xx_gpu.h"
> > +#include "a6xx.xml.h"
> > +#include "a6xx_gmu.xml.h"
> > +
> > +extern const struct adreno_reglist a640_gbif[];
> > +
> > +static const struct adreno_reglist a730_hwcg[] =3D {
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02022222 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000f3cf },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222220 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22220222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00222222 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x44000f00 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00555555 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00440044 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
> > +     { REG_A7XX_RBBM_CLOCK_MODE2_GRAS, 0x00000222 },
> > +     { REG_A7XX_RBBM_CLOCK_MODE_BV_GRAS, 0x00222222 },
> > +     { REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222223 },
> > +     { REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222 },
> > +     { REG_A7XX_RBBM_CLOCK_MODE_BV_GPC, 0x00222222 },
> > +     { REG_A7XX_RBBM_CLOCK_MODE_BV_VFD, 0x00002222 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222 },
> > +     { REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002 },
> > +     { REG_A7XX_RBBM_CLOCK_MODE_BV_LRZ, 0x55555552 },
> > +     { REG_A7XX_RBBM_CLOCK_MODE_CP, 0x00000223 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL, 0x8aa8aa82 },
> > +     { REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
> > +     { REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
> > +     { REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
> > +     {},
> > +};
> > +
> > +static const struct adreno_reglist a740_hwcg[] =3D {
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x22022222 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x003cf3cf },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222220 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00222222 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL2_UCHE, 0x00222222 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000444 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x44000f00 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00555555 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00440044 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222 },
> > +     { REG_A7XX_RBBM_CLOCK_MODE2_GRAS, 0x00000222 },
> > +     { REG_A7XX_RBBM_CLOCK_MODE_BV_GRAS, 0x00222222 },
> > +     { REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x02222223 },
> > +     { REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00222222 },
> > +     { REG_A7XX_RBBM_CLOCK_MODE_BV_GPC, 0x00222222 },
> > +     { REG_A7XX_RBBM_CLOCK_MODE_BV_VFD, 0x00002222 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00000000 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00000000 },
> > +     { REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000 },
> > +     { REG_A7XX_RBBM_CLOCK_MODE_BV_LRZ, 0x55555552 },
> > +     { REG_A7XX_RBBM_CLOCK_HYST2_VFD, 0x00000000 },
> > +     { REG_A7XX_RBBM_CLOCK_MODE_CP, 0x00000222 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL, 0x8aa8aa82 },
> > +     { REG_A6XX_RBBM_ISDB_CNT, 0x00000182 },
> > +     { REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000 },
> > +     { REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000 },
> > +     { REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222 },
> > +     { REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111 },
> > +     { REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555 },
> > +     {},
> > +};
> > +
> > +static const u32 a730_protect_regs[] =3D {
> > +     A6XX_PROTECT_RDONLY(0x00000, 0x04ff),
> > +     A6XX_PROTECT_RDONLY(0x0050b, 0x0058),
> > +     A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00510, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00534, 0x0000),
> > +     A6XX_PROTECT_RDONLY(0x005fb, 0x009d),
> > +     A6XX_PROTECT_NORDWR(0x00699, 0x01e9),
> > +     A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
> > +     A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
> > +     /* 0x008d0-0x008dd and 0x008e0-0x008e6 are unprotected on purpose=
 for tools like perfetto */
> > +     A6XX_PROTECT_NORDWR(0x008de, 0x0001),
> > +     A6XX_PROTECT_RDONLY(0x008e7, 0x014b),
> > +     A6XX_PROTECT_NORDWR(0x00900, 0x004d),
> > +     A6XX_PROTECT_NORDWR(0x0098d, 0x00b2),
> > +     A6XX_PROTECT_NORDWR(0x00a41, 0x01be),
> > +     A6XX_PROTECT_NORDWR(0x00df0, 0x0001),
> > +     A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00e07, 0x0008),
> > +     A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
> > +     A6XX_PROTECT_RDONLY(0x03cc4, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
> > +     A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
> > +     A6XX_PROTECT_NORDWR(0x08e80, 0x0280),
> > +     A6XX_PROTECT_NORDWR(0x09624, 0x01db),
> > +     A6XX_PROTECT_NORDWR(0x09e40, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x09e64, 0x000d),
> > +     A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
> > +     A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
> > +     A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x0ae50, 0x000f),
> > +     A6XX_PROTECT_NORDWR(0x0ae66, 0x0003),
> > +     A6XX_PROTECT_NORDWR(0x0ae6f, 0x0003),
> > +     A6XX_PROTECT_NORDWR(0x0b604, 0x0003),
> > +     A6XX_PROTECT_NORDWR(0x0ec00, 0x0fff),
> > +     A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x18400, 0x0053),
> > +     A6XX_PROTECT_RDONLY(0x18454, 0x0004),
> > +     A6XX_PROTECT_NORDWR(0x18459, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1a459, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1c459, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
> > +     A6XX_PROTECT_RDONLY(0x1f844, 0x007b),
> > +     A6XX_PROTECT_NORDWR(0x1f860, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x1f878, 0x002a),
> > +     /* CP_PROTECT_REG[45, 46] are left untouched! */
> > +     0,
> > +     0,
> > +     A6XX_PROTECT_NORDWR(0x1f8c0, 0x00000),
> > +};
> > +DECLARE_ADRENO_PROTECT(a730_protect, 48);
> > +
> > +static const uint32_t a7xx_pwrup_reglist_regs[] =3D {
> > +     REG_A6XX_UCHE_TRAP_BASE,
> > +     REG_A6XX_UCHE_TRAP_BASE + 1,
> > +     REG_A6XX_UCHE_WRITE_THRU_BASE,
> > +     REG_A6XX_UCHE_WRITE_THRU_BASE + 1,
> > +     REG_A6XX_UCHE_GMEM_RANGE_MIN,
> > +     REG_A6XX_UCHE_GMEM_RANGE_MIN + 1,
> > +     REG_A6XX_UCHE_GMEM_RANGE_MAX,
> > +     REG_A6XX_UCHE_GMEM_RANGE_MAX + 1,
> > +     REG_A6XX_UCHE_CACHE_WAYS,
> > +     REG_A6XX_UCHE_MODE_CNTL,
> > +     REG_A6XX_RB_NC_MODE_CNTL,
> > +     REG_A6XX_RB_CMP_DBG_ECO_CNTL,
> > +     REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
> > +     REG_A6XX_UCHE_GBIF_GX_CONFIG,
> > +     REG_A6XX_UCHE_CLIENT_PF,
> > +     REG_A6XX_TPL1_DBG_ECO_CNTL1,
> > +};
> > +
> > +DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
> > +
> > +/* Applicable for X185, A750 */
> > +static const u32 a750_ifpc_reglist_regs[] =3D {
> > +     REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
> > +     REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> > +     REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> > +     REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> > +     REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> > +     REG_A6XX_RBBM_PERFCTR_CNTL,
> > +     REG_A6XX_TPL1_NC_MODE_CNTL,
> > +     REG_A6XX_SP_NC_MODE_CNTL,
> > +     REG_A6XX_CP_DBG_ECO_CNTL,
> > +     REG_A6XX_CP_PROTECT_CNTL,
> > +     REG_A6XX_CP_PROTECT(0),
> > +     REG_A6XX_CP_PROTECT(1),
> > +     REG_A6XX_CP_PROTECT(2),
> > +     REG_A6XX_CP_PROTECT(3),
> > +     REG_A6XX_CP_PROTECT(4),
> > +     REG_A6XX_CP_PROTECT(5),
> > +     REG_A6XX_CP_PROTECT(6),
> > +     REG_A6XX_CP_PROTECT(7),
> > +     REG_A6XX_CP_PROTECT(8),
> > +     REG_A6XX_CP_PROTECT(9),
> > +     REG_A6XX_CP_PROTECT(10),
> > +     REG_A6XX_CP_PROTECT(11),
> > +     REG_A6XX_CP_PROTECT(12),
> > +     REG_A6XX_CP_PROTECT(13),
> > +     REG_A6XX_CP_PROTECT(14),
> > +     REG_A6XX_CP_PROTECT(15),
> > +     REG_A6XX_CP_PROTECT(16),
> > +     REG_A6XX_CP_PROTECT(17),
> > +     REG_A6XX_CP_PROTECT(18),
> > +     REG_A6XX_CP_PROTECT(19),
> > +     REG_A6XX_CP_PROTECT(20),
> > +     REG_A6XX_CP_PROTECT(21),
> > +     REG_A6XX_CP_PROTECT(22),
> > +     REG_A6XX_CP_PROTECT(23),
> > +     REG_A6XX_CP_PROTECT(24),
> > +     REG_A6XX_CP_PROTECT(25),
> > +     REG_A6XX_CP_PROTECT(26),
> > +     REG_A6XX_CP_PROTECT(27),
> > +     REG_A6XX_CP_PROTECT(28),
> > +     REG_A6XX_CP_PROTECT(29),
> > +     REG_A6XX_CP_PROTECT(30),
> > +     REG_A6XX_CP_PROTECT(31),
> > +     REG_A6XX_CP_PROTECT(32),
> > +     REG_A6XX_CP_PROTECT(33),
> > +     REG_A6XX_CP_PROTECT(34),
> > +     REG_A6XX_CP_PROTECT(35),
> > +     REG_A6XX_CP_PROTECT(36),
> > +     REG_A6XX_CP_PROTECT(37),
> > +     REG_A6XX_CP_PROTECT(38),
> > +     REG_A6XX_CP_PROTECT(39),
> > +     REG_A6XX_CP_PROTECT(40),
> > +     REG_A6XX_CP_PROTECT(41),
> > +     REG_A6XX_CP_PROTECT(42),
> > +     REG_A6XX_CP_PROTECT(43),
> > +     REG_A6XX_CP_PROTECT(44),
> > +     REG_A6XX_CP_PROTECT(45),
> > +     REG_A6XX_CP_PROTECT(46),
> > +     REG_A6XX_CP_PROTECT(47),
> > +};
> > +
> > +DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
> > +
> > +static const struct adreno_reglist_pipe a7xx_dyn_pwrup_reglist_regs[] =
=3D {
> > +     { REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +};
> > +
> > +DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
> > +
> > +static const struct adreno_info a7xx_gpus[] =3D {
> > +     {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x07030001),
> > +             .family =3D ADRENO_7XX_GEN1,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "a730_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "gmu_gen70000.bin",
> > +             },
> > +             .gmem =3D SZ_2M,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION,
> > +             .funcs =3D &a7xx_gpu_funcs,
> > +             .zapfw =3D "a730_zap.mdt",
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .hwcg =3D a730_hwcg,
> > +                     .protect =3D &a730_protect,
> > +                     .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &a7xx_dyn_pwrup_reglist,
> > +                     .gbif_cx =3D a640_gbif,
> > +                     .gmu_cgc_mode =3D 0x00020000,
> > +             },
> > +             .preempt_record_size =3D 2860 * SZ_1K,
> > +     }, {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x43020100),
> > +             .family =3D ADRENO_7XX_GEN1,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "qcom/gen71700_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "qcom/gen71700_gmu.bin",
> > +             },
> > +             .gmem =3D SZ_1M,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION,
> > +             .funcs =3D &a7xx_gpu_funcs,
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .hwcg =3D a730_hwcg,
> > +                     .protect =3D &a730_protect,
> > +                     .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &a7xx_dyn_pwrup_reglist,
> > +                     .gbif_cx =3D a640_gbif,
> > +                     .gmu_chipid =3D 0x07110000,
> > +                     .gmu_cgc_mode =3D 0x00020000,
> > +                     .bcms =3D (const struct a6xx_bcm[]) {
> > +                             { .name =3D "SH0", .buswidth =3D 16 },
> > +                             { .name =3D "MC0", .buswidth =3D 4 },
> > +                             {
> > +                                     .name =3D "ACV",
> > +                                     .fixed =3D true,
> > +                                     .perfmode =3D BIT(3),
> > +                                     .perfmode_bw =3D 16500000,
> > +                             },
> > +                             { /* sentinel */ },
> > +                     },
> > +             },
> > +             .preempt_record_size =3D 1536 * SZ_1K,
> > +     }, {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
> > +             .family =3D ADRENO_7XX_GEN2,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "a740_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "gmu_gen70200.bin",
> > +             },
> > +             .gmem =3D 3 * SZ_1M,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION,
> > +             .funcs =3D &a7xx_gpu_funcs,
> > +             .zapfw =3D "a740_zap.mdt",
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .hwcg =3D a740_hwcg,
> > +                     .protect =3D &a730_protect,
> > +                     .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &a7xx_dyn_pwrup_reglist,
> > +                     .gbif_cx =3D a640_gbif,
> > +                     .gmu_chipid =3D 0x7020100,
> > +                     .gmu_cgc_mode =3D 0x00020202,
> > +                     .bcms =3D (const struct a6xx_bcm[]) {
> > +                             { .name =3D "SH0", .buswidth =3D 16 },
> > +                             { .name =3D "MC0", .buswidth =3D 4 },
> > +                             {
> > +                                     .name =3D "ACV",
> > +                                     .fixed =3D true,
> > +                                     .perfmode =3D BIT(3),
> > +                                     .perfmode_bw =3D 16500000,
> > +                             },
> > +                             { /* sentinel */ },
> > +                     },
> > +             },
> > +             .preempt_record_size =3D 4192 * SZ_1K,
> > +     }, {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
> > +             .family =3D ADRENO_7XX_GEN2,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "gen70500_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "gen70500_gmu.bin",
> > +             },
> > +             .gmem =3D 3 * SZ_1M,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION |
> > +                       ADRENO_QUIRK_IFPC,
> > +             .funcs =3D &a7xx_gpu_funcs,
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .hwcg =3D a740_hwcg,
> > +                     .protect =3D &a730_protect,
> > +                     .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &a7xx_dyn_pwrup_reglist,
> > +                     .ifpc_reglist =3D &a750_ifpc_reglist,
> > +                     .gbif_cx =3D a640_gbif,
> > +                     .gmu_chipid =3D 0x7050001,
> > +                     .gmu_cgc_mode =3D 0x00020202,
> > +                     .bcms =3D (const struct a6xx_bcm[]) {
> > +                             { .name =3D "SH0", .buswidth =3D 16 },
> > +                             { .name =3D "MC0", .buswidth =3D 4 },
> > +                             {
> > +                                     .name =3D "ACV",
> > +                                     .fixed =3D true,
> > +                                     .perfmode =3D BIT(3),
> > +                                     .perfmode_bw =3D 16500000,
> > +                             },
> > +                             { /* sentinel */ },
> > +                     },
> > +             },
> > +             .preempt_record_size =3D 4192 * SZ_1K,
> > +             .speedbins =3D ADRENO_SPEEDBINS(
> > +                     { 0,    0 },
> > +                     { 59,   1 },
> > +                     { 7,    2 },
> > +                     { 232,  3 },
> > +                     { 146,  4 },
> > +             ),
> > +     }, {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
> > +             .family =3D ADRENO_7XX_GEN3,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "gen70900_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "gmu_gen70900.bin",
> > +             },
> > +             .gmem =3D 3 * SZ_1M,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION |
> > +                       ADRENO_QUIRK_IFPC,
> > +             .funcs =3D &a7xx_gpu_funcs,
> > +             .zapfw =3D "gen70900_zap.mbn",
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .protect =3D &a730_protect,
> > +                     .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &a7xx_dyn_pwrup_reglist,
> > +                     .ifpc_reglist =3D &a750_ifpc_reglist,
> > +                     .gbif_cx =3D a640_gbif,
> > +                     .gmu_chipid =3D 0x7090100,
> > +                     .gmu_cgc_mode =3D 0x00020202,
> > +                     .bcms =3D (const struct a6xx_bcm[]) {
> > +                             { .name =3D "SH0", .buswidth =3D 16 },
> > +                             { .name =3D "MC0", .buswidth =3D 4 },
> > +                             {
> > +                                     .name =3D "ACV",
> > +                                     .fixed =3D true,
> > +                                     .perfmode =3D BIT(2),
> > +                                     .perfmode_bw =3D 10687500,
> > +                             },
> > +                             { /* sentinel */ },
> > +                     },
> > +             },
> > +             .preempt_record_size =3D 3572 * SZ_1K,
> > +     }, {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x43030c00),
> > +             .family =3D ADRENO_7XX_GEN2,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "gen71500_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "gen71500_gmu.bin",
> > +             },
> > +             .gmem =3D SZ_1M + SZ_512K,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION,
> > +             .funcs =3D &a7xx_gpu_funcs,
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .hwcg =3D a740_hwcg,
> > +                     .protect =3D &a730_protect,
> > +                     .pwrup_reglist =3D &a7xx_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &a7xx_dyn_pwrup_reglist,
> > +                     .gbif_cx =3D a640_gbif,
> > +                     .gmu_chipid =3D 0x70f0000,
> > +                     .gmu_cgc_mode =3D 0x00020222,
> > +                     .bcms =3D (const struct a6xx_bcm[]) {
> > +                             { .name =3D "SH0", .buswidth =3D 16 },
> > +                             { .name =3D "MC0", .buswidth =3D 4 },
> > +                             {
> > +                                     .name =3D "ACV",
> > +                                     .fixed =3D true,
> > +                                     .perfmode =3D BIT(3),
> > +                                     .perfmode_bw =3D 16500000,
> > +                             },
> > +                             { /* sentinel */ },
> > +                     },
> > +             },
> > +             .preempt_record_size =3D 4192 * SZ_1K,
> > +             .speedbins =3D ADRENO_SPEEDBINS(
> > +                     { 0,   0 },
> > +                     { 294, 1 },
> > +                     { 263, 2 },
> > +                     { 233, 3 },
> > +                     { 141, 4 },
> > +             ),
> > +     }
> > +};
> > +DECLARE_ADRENO_GPULIST(a7xx);
> > +
> > +static inline __always_unused void __build_asserts(void)
> > +{
> > +     BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
> > +}
> > diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/dr=
m/msm/adreno/a8xx_catalog.c
> > new file mode 100644
> > index 000000000000..ee1985bbe236
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> > @@ -0,0 +1,1847 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2013-2014 Red Hat
> > + * Author: Rob Clark <robdclark@gmail.com>
> > + *
> > + * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
> > + */
> > +
> > +#include "adreno_gpu.h"
> > +#include "a6xx_gpu.h"
> > +#include "a6xx.xml.h"
> > +#include "a6xx_gmu.xml.h"
> > +
> > +static const struct adreno_reglist_pipe a830_nonctxt_regs[] =3D {
> > +     { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> > +     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BR) | BIT(PIPE=
_BV) },
> > +     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BR) | BIT(=
PIPE_BV) },
> > +     { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BR) | BIT(PIP=
E_BV) },
> > +     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PI=
PE_BR) | BIT(PIPE_BV) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BR) | BIT(PIPE=
_BV) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BR) | BIT(PIPE=
_BV) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_3, 0x00400000, BIT(PIPE_BR) | BIT(PIPE=
_BV) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BR) | BIT(PIPE=
_BV) },
> > +     /* Configure GBIF GX registers */
> > +     { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) =
},
> > +     /* Enable full concurrent resolve and unresolves */
> > +     { REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> > +     /* Partially enable perf clear, Disable DINT to c/z be data forwa=
rding */
> > +     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_GC_GMEM_PROTECT, 0x0c000000, BIT(PIPE_BR) },
> > +     /* Configure number of outstanding transactions to 32 */
> > +     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> > +     /* Configure UCHE request time out to 16 cycles for CCU/UCHE arbi=
tration */
> > +     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> > +     { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE)=
 },
> > +     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE=
) },
> > +     { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> > +     /* Enable contribution of all shader stages to SP perfcounters */
> > +     { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> > +     /*
> > +      * BIT(26): Limit the number of wave-slots for Eviction buffer to=
 1 per ALU GRP
> > +      * BIT(30): Disable LPAC auto-promotion
> > +      */
> > +     { REG_A7XX_SP_CHICKEN_BITS_1, BIT(26) | BIT(30), BIT(PIPE_NONE) }=
,
> > +     /*
> > +      * BIT(22): Disable PS out of order retire
> > +      * BIT(23): Enable half wave mode and MM instruction src&dst is h=
alf precision
> > +      */
> > +     { REG_A7XX_SP_CHICKEN_BITS_2, BIT(22) | BIT(23), BIT(PIPE_NONE) }=
,
> > +     { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080,  BIT(PIPE_NO=
NE) },
> > +     { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
> > +     /* Enable cubemap small miplevel optimization settings */
> > +     /* BIT(26): Disable final clamp for bicubic filtering */
> > +     { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
> > +     /* Disable tag bank id hashing */
> > +     { REG_A6XX_UCHE_MODE_CNTL, 0x00080000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> > +     /* Limit gmem number of ways for GMEM requests in each set */
> > +     { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE)},
> > +     /* Disable write slow pointer in data phase queue */
> > +     { REG_A8XX_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
> > +     /* Configure UCHE to CCU switchthreshold timeout cycles */
> > +     { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> > +     { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BR) | BIT(PIPE_=
BV) },
> > +     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BR) | BIT(PI=
PE_BV) },
> > +     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BR) | BIT(PI=
PE_BV) },
> > +     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BR) | BIT(PI=
PE_BV) },
> > +     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BR) | BIT(PIPE=
_BV) },
> > +     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BR) | BI=
T(PIPE_BV) },
> > +     /* Disable redundant tile data optimization */
> > +     { REG_A8XX_VSC_KMD_DBG_ECO_CNTL, BIT(11), BIT(PIPE_NONE)},
> > +     { },
> > +};
> > +
> > +static const u32 a830_protect_regs[] =3D {
> > +     A6XX_PROTECT_RDONLY(0x00000, 0x03a3),
> > +     A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> > +     A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> > +     A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> > +     A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> > +     A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> > +     A6XX_PROTECT_RDONLY(0x00759, 0x0026),
> > +     A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> > +     A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> > +     A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> > +     A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> > +     A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> > +     A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> > +     A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> > +     A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> > +     A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> > +     A6XX_PROTECT_RDONLY(0x03cc6, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> > +     A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> > +     A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> > +     A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> > +     A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
> > +     A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> > +     A6XX_PROTECT_NORDWR(0x0ae10, 0x036f),
> > +     A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> > +     A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> > +     A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> > +     A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> > +     A6XX_PROTECT_RDONLY(0x1f878, 0x0787),
> > +     A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> > +     A6XX_PROTECT_NORDWR(0x20000, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> > +     A6XX_PROTECT_RDONLY(0x27880, 0x0381),
> > +     A6XX_PROTECT_NORDWR(0x27882, 0x0001),
> > +     A6XX_PROTECT_NORDWR(0x27c02, 0x0000),
> > +};
> > +DECLARE_ADRENO_PROTECT(a830_protect, 64);
> > +
> > +static const u32 a830_pwrup_reglist_regs[] =3D {
> > +     REG_A6XX_UCHE_MODE_CNTL,
> > +     REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
> > +     REG_A8XX_UCHE_GBIF_GX_CONFIG,
> > +     REG_A8XX_UCHE_CACHE_WAYS,
> > +     REG_A8XX_UCHE_CCHE_MODE_CNTL,
> > +     REG_A8XX_UCHE_CCHE_CACHE_WAYS,
> > +     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
> > +     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
> > +     REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN,
> > +     REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN + 1,
> > +     REG_A8XX_UCHE_CCHE_TRAP_BASE,
> > +     REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
> > +     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
> > +     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
> > +     REG_A8XX_UCHE_HW_DBG_CNTL,
> > +     REG_A8XX_UCHE_WRITE_THRU_BASE,
> > +     REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
> > +     REG_A8XX_UCHE_TRAP_BASE,
> > +     REG_A8XX_UCHE_TRAP_BASE + 1,
> > +     REG_A8XX_UCHE_CLIENT_PF,
> > +     REG_A8XX_VSC_KMD_DBG_ECO_CNTL,
> > +     REG_A8XX_RB_CMP_NC_MODE_CNTL,
> > +     REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
> > +     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
> > +     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
> > +     REG_A7XX_SP_READ_SEL,
> > +     REG_A6XX_TPL1_NC_MODE_CNTL,
> > +     REG_A6XX_TPL1_DBG_ECO_CNTL,
> > +     REG_A6XX_TPL1_DBG_ECO_CNTL1,
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),
> > +};
> > +DECLARE_ADRENO_REGLIST_LIST(a830_pwrup_reglist);
> > +
> > +static const u32 a830_ifpc_reglist_regs[] =3D {
> > +     REG_A8XX_RBBM_NC_MODE_CNTL,
> > +     REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
> > +     REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
> > +     REG_A6XX_SP_NC_MODE_CNTL,
> > +     REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN,
> > +     REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN + 1,
> > +     REG_A7XX_SP_CHICKEN_BITS_1,
> > +     REG_A7XX_SP_CHICKEN_BITS_2,
> > +     REG_A7XX_SP_CHICKEN_BITS_3,
> > +     REG_A6XX_SP_PERFCTR_SHADER_MASK,
> > +     REG_A7XX_SP_HLSQ_DBG_ECO_CNTL,
> > +     REG_A8XX_CP_INTERRUPT_STATUS_MASK_GLOBAL,
> > +     REG_A8XX_RBBM_PERFCTR_CNTL,
> > +     REG_A8XX_CP_PROTECT_GLOBAL(0),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(1),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(2),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(3),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(4),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(5),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(6),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(7),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(8),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(9),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(10),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(11),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(12),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(13),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(14),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(15),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(16),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(17),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(18),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(19),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(20),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(21),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(22),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(23),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(24),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(25),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(26),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(27),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(28),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(29),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(30),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(31),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(32),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(33),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(34),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(35),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(36),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(37),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(38),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(39),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(40),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(41),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(42),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(43),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(44),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(45),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(46),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(47),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(48),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(49),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(50),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(51),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(52),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(53),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(54),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(55),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(56),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(57),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(58),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(59),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(60),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(61),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(62),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(63),
> > +};
> > +DECLARE_ADRENO_REGLIST_LIST(a830_ifpc_reglist);
> > +
> > +static const struct adreno_reglist_pipe a830_dyn_pwrup_reglist_regs[] =
=3D {
> > +     { REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > +             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > +             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > +     { REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > +             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > +             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > +     { REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) |=
 BIT(PIPE_LPAC) },
> > +     { REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | =
BIT(PIPE_LPAC) },
> > +     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > +     { REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIP=
E_BR) },
> > +     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) =
},
> > +     { REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> > +     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BR) | =
BIT(PIPE_BV) },
> > +     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> > +     { },
> > +};
> > +DECLARE_ADRENO_REGLIST_PIPE_LIST(a830_dyn_pwrup_reglist);
> > +
> > +static const struct adreno_reglist_pipe x285_nonctxt_regs[] =3D {
> > +     { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> > +     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > +     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(=
PIPE_BR) },
> > +     { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIP=
E_BR) },
> > +     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PI=
PE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_RB_GC_GMEM_PROTECT, 0x15000000, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> > +     { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE)=
 },
> > +     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE=
) },
> > +     { REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, 0x0fffffff, BIT(PIPE_NON=
E) },
> > +     { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) =
},
> > +     { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_CHICKEN_BITS_2, 0x00820800, BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> > +     { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> > +     /* Disable CS dead batch merge */
> > +     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_2, BIT(31), BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NON=
E) },
> > +     { REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> > +     { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
> > +     /* BIT(26): Disable final clamp for bicubic filtering */
> > +     { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> > +     { REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> > +     { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > +     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00000020, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > +     { },
> > +};
> > +
> > +static const u32 x285_protect_regs[] =3D {
> > +     A6XX_PROTECT_RDONLY(0x00008, 0x039b),
> > +     A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> > +     A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> > +     A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> > +     A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> > +     A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> > +     A6XX_PROTECT_RDONLY(0x00759, 0x0026),
> > +     A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> > +     A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> > +     A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> > +     A6XX_PROTECT_NORDWR(0x0082c, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> > +     A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> > +     A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> > +     A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> > +     A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> > +     A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> > +     A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
> > +     A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> > +     A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> > +     A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> > +     A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> > +     A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
> > +     A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> > +     A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
> > +     A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
> > +     A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
> > +     A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> > +     A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> > +     A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> > +     A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> > +     A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
> > +     A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> > +     A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> > +     A6XX_PROTECT_RDONLY(0x27880, 0x0385),
> > +     A6XX_PROTECT_NORDWR(0x27882, 0x000a),
> > +     A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
> > +};
> > +
> > +DECLARE_ADRENO_PROTECT(x285_protect, 15);
> > +
> > +static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] =
=3D {
> > +     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > +     { REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BV) | BIT(PIPE_BR) =
},
> > +     { REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BV) | =
BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR)},
> > +     { REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_RBP_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > +     { REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > +             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > +             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > +     { REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > +             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > +             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > +     { REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) |=
 BIT(PIPE_LPAC)},
> > +     { REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | =
BIT(PIPE_LPAC) },
> > +     { REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIP=
E_BR) },
> > +};
> > +DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
> > +
> > +static const struct adreno_reglist_pipe a810_nonctxt_regs[] =3D {
> > +     { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> > +     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00f80800, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(=
PIPE_BR) },
> > +     { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIP=
E_BR) },
> > +     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PI=
PE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000023, BIT(PIPE_BV) }, /* Avoi=
d partial waves at VFD */
> > +     { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> > +     /* Partially enable perf clear, Disable DINT to c/z be data forwa=
rding */
> > +     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> > +     { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE)=
 },
> > +     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE=
) },
> > +     { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) =
},
> > +     { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> > +     /*
> > +      * BIT(22): Disable PS out of order retire
> > +      * BIT(23): Enable half wave mode and MM instruction src&dst is h=
alf precision
> > +      */
> > +     { REG_A7XX_SP_CHICKEN_BITS_2, BIT(22) | BIT(23), BIT(PIPE_NONE) }=
,
> > +     { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> > +     { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NON=
E) },
> > +     { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> > +     { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
> > +     { REG_A6XX_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> > +     /* Disable write slow pointer in data phase queue */
> > +     { REG_A8XX_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> > +     { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > +     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > +     { REG_A8XX_RB_GC_GMEM_PROTECT, 0x00900000, BIT(PIPE_BR) },
> > +     { },
> > +};
> > +
> > +static const u32 a810_protect_regs[] =3D {
> > +     A6XX_PROTECT_RDONLY(0x00000, 0x03a3),
> > +     A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> > +     A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> > +     A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> > +     A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> > +     A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> > +     A6XX_PROTECT_RDONLY(0x00759, 0x0026),
> > +     A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> > +     A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> > +     A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> > +     A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> > +     A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> > +     A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> > +     A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> > +     A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> > +     A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> > +     A6XX_PROTECT_RDONLY(0x03cc6, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> > +     A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> > +     A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> > +     A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> > +     A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
> > +     A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> > +     A6XX_PROTECT_NORDWR(0x0ae10, 0x036f),
> > +     A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> > +     A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> > +     A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> > +     A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> > +     A6XX_PROTECT_RDONLY(0x1f878, 0x0787),
> > +     A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> > +     A6XX_PROTECT_NORDWR(0x20000, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> > +     A6XX_PROTECT_RDONLY(0x27880, 0x0381),
> > +     A6XX_PROTECT_NORDWR(0x27882, 0x0001),
> > +     A6XX_PROTECT_NORDWR(0x27c02, 0x0000),
> > +};
> > +DECLARE_ADRENO_PROTECT(a810_protect, 64);
> > +
> > +static const uint32_t a810_pwrup_reglist_regs[] =3D {
> > +     REG_A6XX_UCHE_MODE_CNTL,
> > +     REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
> > +     REG_A8XX_UCHE_GBIF_GX_CONFIG,
> > +     REG_A8XX_UCHE_CACHE_WAYS,
> > +     REG_A8XX_UCHE_CCHE_MODE_CNTL,
> > +     REG_A8XX_UCHE_CCHE_CACHE_WAYS,
> > +     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
> > +     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
> > +     REG_A8XX_UCHE_CCHE_TRAP_BASE,
> > +     REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
> > +     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
> > +     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
> > +     REG_A8XX_UCHE_HW_DBG_CNTL,
> > +     REG_A8XX_UCHE_WRITE_THRU_BASE,
> > +     REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
> > +     REG_A8XX_UCHE_TRAP_BASE,
> > +     REG_A8XX_UCHE_TRAP_BASE + 1,
> > +     REG_A8XX_UCHE_CLIENT_PF,
> > +     REG_A8XX_RB_CMP_NC_MODE_CNTL,
> > +     REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
> > +     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
> > +     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
> > +     REG_A7XX_SP_READ_SEL,
> > +     REG_A6XX_TPL1_NC_MODE_CNTL,
> > +     REG_A6XX_TPL1_DBG_ECO_CNTL,
> > +     REG_A6XX_TPL1_DBG_ECO_CNTL1,
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),
> > +};
> > +DECLARE_ADRENO_REGLIST_LIST(a810_pwrup_reglist);
> > +
> > +static const u32 a810_ifpc_reglist_regs[] =3D {
> > +     REG_A8XX_RBBM_NC_MODE_CNTL,
> > +     REG_A8XX_RBBM_PERFCTR_CNTL,
> > +     REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
> > +     REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
> > +     REG_A6XX_SP_NC_MODE_CNTL,
> > +     REG_A7XX_SP_CHICKEN_BITS_2,
> > +     REG_A7XX_SP_CHICKEN_BITS_3,
> > +     REG_A6XX_SP_PERFCTR_SHADER_MASK,
> > +     REG_A8XX_CP_PROTECT_GLOBAL(0),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(1),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(2),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(3),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(4),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(5),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(6),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(7),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(8),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(9),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(10),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(11),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(12),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(13),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(14),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(15),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(16),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(17),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(18),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(19),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(20),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(21),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(22),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(23),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(24),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(25),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(26),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(27),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(28),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(29),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(30),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(31),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(32),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(33),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(34),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(35),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(36),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(37),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(38),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(39),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(40),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(41),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(42),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(43),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(44),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(45),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(46),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(47),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(48),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(49),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(50),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(51),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(52),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(53),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(54),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(55),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(56),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(57),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(58),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(59),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(60),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(61),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(62),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(63),
> > +};
> > +DECLARE_ADRENO_REGLIST_LIST(a810_ifpc_reglist);
> > +
> > +static const struct adreno_reglist_pipe a810_dyn_pwrup_reglist_regs[] =
=3D {
> > +     { REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) }=
,
> > +     { REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> > +     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > +     { REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIP=
E_BR) },
> > +     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) =
},
> > +     { REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> > +     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BR) | =
BIT(PIPE_BV) },
> > +     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BR) | BIT(PIPE_BV) },
> > +};
> > +DECLARE_ADRENO_REGLIST_PIPE_LIST(a810_dyn_pwrup_reglist);
> > +
> > +static const struct a6xx_hfi_clx_table_v2_cmd x285_clx_tbl =3D {
> > +     .version =3D (2 << 16) | 1,
> > +     .domain =3D {
> > +             /* GX DOMAIN */
> > +             {
> > +                     .data =3D CLX_DATA(60, 11, 0, 1),
> > +                     .clxt =3D 0,
> > +                     .clxh =3D 0,
> > +                     .urg_mode =3D 1,
> > +                     .lkg_en =3D 0,
> > +                     .curr_budget =3D 100,
> > +             },
> > +             /* MXG DOMAIN */
> > +             {
> > +                     .data =3D CLX_DATA(60, 3, 1, 1),
> > +                     .clxt =3D 0,
> > +                     .clxh =3D 0,
> > +                     .urg_mode =3D 1,
> > +                     .lkg_en =3D 0,
> > +                     .curr_budget =3D 100,
> > +             },
> > +     },
> > +};
> > +
> > +struct a6xx_hfi_limits_tbl x285_limits_tbl[] =3D {
> > +     {
> > +             .feature_id =3D GMU_MIT_IFF,
> > +             .domain =3D GMU_GX_DOMAIN,
> > +             .feature_rev =3D 0,
> > +             .cfg =3D {
> > +                     .enable =3D 1,
> > +                     .msg_path =3D 0,
> > +                     .lkg_en =3D 0,
> > +                     .mode =3D 0,
> > +                     .sid =3D 12,
> > +                     .mit_time =3D 5,
> > +                     .curr_limit =3D 18000,
> > +             },
> > +     },
> > +     {
> > +             .feature_id =3D GMU_MIT_IFF,
> > +             .domain =3D GMU_MX_DOMAIN,
> > +             .feature_rev =3D 0,
> > +             .cfg =3D {
> > +                     .enable =3D 1,
> > +                     .msg_path =3D 0,
> > +                     .lkg_en =3D 0,
> > +                     .mode =3D 0,
> > +                     .sid =3D 18,
> > +                     .mit_time =3D 2000,
> > +                     .curr_limit =3D 6000,
> > +             },
> > +     },
> > +     {
> > +             .feature_id =3D GMU_MIT_PCLX,
> > +             .domain =3D GMU_GX_DOMAIN,
> > +             .feature_rev =3D 0,
> > +             .cfg =3D {
> > +                     .enable =3D 1,
> > +                     .msg_path =3D 0,
> > +                     .lkg_en =3D 0,
> > +                     .mode =3D 0,
> > +                     .sid =3D 6,
> > +                     .mit_time =3D 3,
> > +                     .curr_limit =3D 66000,
> > +             },
> > +     },
> > +     {
> > +             .feature_id =3D GMU_MIT_PCLX,
> > +             .domain =3D GMU_MX_DOMAIN,
> > +             .feature_rev =3D 0,
> > +             .cfg =3D {
> > +                     .enable =3D 0,
> > +                     .msg_path =3D 0,
> > +                     .lkg_en =3D 0,
> > +                     .mode =3D 0,
> > +                     .sid =3D 6,
> > +                     .mit_time =3D 3,
> > +                     .curr_limit =3D 18000,
> > +             },
> > +     },
> > +};
> > +DECLARE_ADRENO_LIMITS_TABLE(x285_limits);
> > +
> > +static const struct adreno_reglist_pipe a840_nonctxt_regs[] =3D {
> > +     { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> > +     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > +     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(=
PIPE_BR) },
> > +     { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIP=
E_BR) },
> > +     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PI=
PE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     /* Disable Dead Draw Merge scheme on RB-HLSQ */
> > +     { REG_A6XX_RB_RBP_CNTL, BIT(5), BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> > +     /* Partially enable perf clear, Disable DINT to c/z be data forwa=
rding */
> > +     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> > +     { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_POWER_UP_RESET_SW_OVERRIDE, 0x70809060, BIT(PIPE_=
NONE) },
> > +     { REG_A8XX_RBBM_POWER_UP_RESET_SW_BV_OVERRIDE, 0x30000000, BIT(PI=
PE_NONE) },
> > +     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE)=
 },
> > +     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE=
) },
> > +     { REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, 0x0fffffff, BIT(PIPE_NON=
E) },
> > +     { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) =
},
> > +     { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> > +     /* Disable mode_switch optimization in UMAS */
> > +     { REG_A6XX_SP_CHICKEN_BITS, BIT(24) | BIT(26), BIT(PIPE_NONE) },
> > +     /* Disable LPAC large-LM mode */
> > +     { REG_A8XX_SP_SS_CHICKEN_BITS_0, BIT(3), BIT(PIPE_NONE) },
> > +     /* Disable PS out of order retire */
> > +     { REG_A7XX_SP_CHICKEN_BITS_2, 0x00c21800, BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> > +     /* Disable SP2TP info attribute */
> > +     { REG_A8XX_SP_CHICKEN_BITS_4, 0x00000002, BIT(PIPE_NONE) },
> > +     { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL, BIT(14), BIT(PIPE_NONE) },
> > +     /* Ignore HLSQ shared constant feedback from SP */
> > +     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1, BIT(17), BIT(PIPE_NONE) },
> > +     /* Disable CS dead batch merge */
> > +     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_2, BIT(24), BIT(PIPE_NONE) },
> > +     { REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3, BIT(7), BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NON=
E) },
> > +     { REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> > +     { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> > +     /* BIT(26): Disable final clamp for bicubic filtering */
> > +     { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> > +     { REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> > +     { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > +     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00000020, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > +     { },
> > +};
> > +
> > +static const u32 a840_protect_regs[] =3D {
> > +     A6XX_PROTECT_RDONLY(0x00008, 0x039b),
> > +     A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> > +     A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> > +     A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> > +     A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> > +     A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> > +     A6XX_PROTECT_RDONLY(0x00759, 0x001b),
> > +     A6XX_PROTECT_NORDWR(0x00775, 0x000a),
> > +     A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> > +     A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> > +     A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> > +     A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> > +     A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> > +     A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> > +     A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> > +     A6XX_PROTECT_NORDWR(0x00c07, 0x0008),
> > +     A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> > +     A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> > +     A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
> > +     A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> > +     A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> > +     A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> > +     A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> > +     A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
> > +     A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> > +     A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
> > +     A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
> > +     A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
> > +     A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> > +     A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> > +     A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> > +     A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> > +     A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
> > +     A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> > +     A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> > +     A6XX_PROTECT_RDONLY(0x27880, 0x0385),
> > +     A6XX_PROTECT_NORDWR(0x27882, 0x0009),
> > +     A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
> > +};
> > +DECLARE_ADRENO_PROTECT(a840_protect, 15);
> > +
> > +static const struct adreno_reglist a840_gbif[] =3D {
> > +     { REG_A6XX_GBIF_QSB_SIDE0, 0x00071e20 },
> > +     { REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
> > +     { REG_A6XX_GBIF_QSB_SIDE2, 0x00071e20 },
> > +     { REG_A6XX_GBIF_QSB_SIDE3, 0x00071e20 },
> > +     { REG_A6XX_GBIF_CX_CONFIG, 0x20023000 },
> > +     { },
> > +};
> > +
> > +static const uint32_t a840_pwrup_reglist_regs[] =3D {
> > +     REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
> > +     REG_A7XX_SP_READ_SEL,
> > +     REG_A6XX_UCHE_MODE_CNTL,
> > +     REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
> > +     REG_A8XX_UCHE_GBIF_GX_CONFIG,
> > +     REG_A8XX_UCHE_CCHE_MODE_CNTL,
> > +     REG_A8XX_UCHE_CCHE_CACHE_WAYS,
> > +     REG_A8XX_UCHE_CACHE_WAYS,
> > +     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
> > +     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
> > +     REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN,
> > +     REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN + 1,
> > +     REG_A8XX_UCHE_CCHE_TRAP_BASE,
> > +     REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
> > +     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
> > +     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
> > +     REG_A8XX_UCHE_HW_DBG_CNTL,
> > +     REG_A8XX_UCHE_WRITE_THRU_BASE,
> > +     REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
> > +     REG_A8XX_UCHE_TRAP_BASE,
> > +     REG_A8XX_UCHE_TRAP_BASE + 1,
> > +     REG_A8XX_UCHE_CLIENT_PF,
> > +     REG_A8XX_RB_CMP_NC_MODE_CNTL,
> > +     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
> > +     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
> > +     REG_A6XX_TPL1_NC_MODE_CNTL,
> > +     REG_A6XX_TPL1_DBG_ECO_CNTL,
> > +     REG_A6XX_TPL1_DBG_ECO_CNTL1,
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),
> > +};
> > +DECLARE_ADRENO_REGLIST_LIST(a840_pwrup_reglist);
> > +
> > +static const u32 a840_ifpc_reglist_regs[] =3D {
> > +     REG_A8XX_RBBM_NC_MODE_CNTL,
> > +     REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
> > +     REG_A6XX_SP_NC_MODE_CNTL,
> > +     REG_A6XX_SP_CHICKEN_BITS,
> > +     REG_A8XX_SP_SS_CHICKEN_BITS_0,
> > +     REG_A7XX_SP_CHICKEN_BITS_1,
> > +     REG_A7XX_SP_CHICKEN_BITS_2,
> > +     REG_A7XX_SP_CHICKEN_BITS_3,
> > +     REG_A8XX_SP_CHICKEN_BITS_4,
> > +     REG_A6XX_SP_PERFCTR_SHADER_MASK,
> > +     REG_A8XX_RBBM_SLICE_PERFCTR_CNTL,
> > +     REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
> > +     REG_A7XX_SP_HLSQ_DBG_ECO_CNTL,
> > +     REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1,
> > +     REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_2,
> > +     REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3,
> > +     REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN,
> > +     REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN + 1,
> > +     REG_A8XX_CP_INTERRUPT_STATUS_MASK_GLOBAL,
> > +     REG_A8XX_RBBM_PERFCTR_CNTL,
> > +     REG_A8XX_CP_PROTECT_GLOBAL(0),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(1),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(2),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(3),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(4),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(5),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(6),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(7),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(8),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(9),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(10),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(11),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(12),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(13),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(14),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(15),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(16),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(17),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(18),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(19),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(20),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(21),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(22),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(23),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(24),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(25),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(26),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(27),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(28),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(29),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(30),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(31),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(32),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(33),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(34),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(35),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(36),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(37),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(38),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(39),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(40),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(41),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(42),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(43),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(44),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(45),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(46),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(47),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(48),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(49),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(50),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(51),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(52),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(53),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(54),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(55),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(56),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(57),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(58),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(59),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(60),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(61),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(62),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(63),
> > +};
> > +DECLARE_ADRENO_REGLIST_LIST(a840_ifpc_reglist);
> > +
> > +static const struct adreno_reglist_pipe a840_dyn_pwrup_reglist_regs[] =
=3D {
> > +     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > +     { REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BV) | BIT(PIPE_BR) =
},
> > +     { REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BV) | =
BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR)},
> > +     { REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_RBP_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > +     { REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > +             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > +             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > +     { REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > +             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > +             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > +     { REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) |=
 BIT(PIPE_LPAC)},
> > +     { REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | =
BIT(PIPE_LPAC) },
> > +     { REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIP=
E_BR) },
> > +};
> > +DECLARE_ADRENO_REGLIST_PIPE_LIST(a840_dyn_pwrup_reglist);
> > +
> > +static const struct a6xx_hfi_clx_table_v2_cmd a840_clx_tbl =3D {
> > +     .version =3D (2 << 16) | 1,
> > +     .domain =3D {
> > +             /* GX DOMAIN */
> > +             {
> > +                     .data =3D CLX_DATA(60, 5, 1, 1),
> > +                     .clxt =3D 0,
> > +                     .clxh =3D 0,
> > +                     .urg_mode =3D 1,
> > +                     .lkg_en =3D 0,
> > +                     .curr_budget =3D 100,
> > +             },
> > +             /* MXG DOMAIN */
> > +             {
> > +                     .data =3D CLX_DATA(60, 1, 1, 1),
> > +                     .clxt =3D 0,
> > +                     .clxh =3D 0,
> > +                     .urg_mode =3D 1,
> > +                     .lkg_en =3D 0,
> > +                     .curr_budget =3D 50,
> > +             },
> > +     },
> > +};
> > +
> > +struct a6xx_hfi_limits_tbl a840_limits_tbl[] =3D {
> > +     {
> > +             .feature_id =3D GMU_MIT_IFF,
> > +             .domain =3D GMU_GX_DOMAIN,
> > +             .feature_rev =3D 0,
> > +             .cfg =3D {
> > +                     .enable =3D 1,
> > +                     .msg_path =3D 0,
> > +                     .lkg_en =3D 0,
> > +                     .mode =3D 0,
> > +                     .sid =3D 12,
> > +                     .mit_time =3D 5,
> > +                     .curr_limit =3D 6000,
> > +             },
> > +     },
> > +     {
> > +             .feature_id =3D GMU_MIT_IFF,
> > +             .domain =3D GMU_MX_DOMAIN,
> > +             .feature_rev =3D 0,
> > +             .cfg =3D {
> > +                     .enable =3D 1,
> > +                     .msg_path =3D 0,
> > +                     .lkg_en =3D 0,
> > +                     .mode =3D 0,
> > +                     .sid =3D 9,
> > +                     .mit_time =3D 2000,
> > +                     .curr_limit =3D 6000,
> > +             },
> > +     },
> > +     {
> > +             .feature_id =3D GMU_MIT_PCLX,
> > +             .domain =3D GMU_GX_DOMAIN,
> > +             .feature_rev =3D 0,
> > +             .cfg =3D {
> > +                     .enable =3D 1,
> > +                     .msg_path =3D 0,
> > +                     .lkg_en =3D 0,
> > +                     .mode =3D 0,
> > +                     .sid =3D 7,
> > +                     .mit_time =3D 3,
> > +                     .curr_limit =3D 30000,
> > +             },
> > +     },
> > +     {
> > +             .feature_id =3D GMU_MIT_PCLX,
> > +             .domain =3D GMU_MX_DOMAIN,
> > +             .feature_rev =3D 0,
> > +             .cfg =3D {
> > +                     .enable =3D 0,
> > +                     .msg_path =3D 0,
> > +                     .lkg_en =3D 0,
> > +                     .mode =3D 0,
> > +                     .sid =3D 7,
> > +                     .mit_time =3D 3,
> > +                     .curr_limit =3D 6000,
> > +             },
> > +     },
> > +};
> > +DECLARE_ADRENO_LIMITS_TABLE(a840_limits);
> > +
> > +static const struct adreno_reglist_pipe a845_nonctxt_regs[] =3D {
> > +     { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> > +     { REG_A8XX_CP_MULTIDRAW_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x01000800, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > +     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(=
PIPE_BR) },
> > +     { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIP=
E_BR) },
> > +     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PI=
PE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000803, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_3, 0x00400000, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_5, BIT(28) | BIT(30), BIT(PIPE_BV) | B=
IT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) =
},
> > +     { REG_A8XX_RB_GC_GMEM_PROTECT, 0x0C000000, BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > +     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> > +     { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_SLICE_PERFCTR_CNTL, BIT(0), BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_POWER_UP_RESET_SW_OVERRIDE, 0x70809060, BIT(PIPE_=
NONE) },
> > +     { REG_A8XX_RBBM_POWER_UP_RESET_SW_BV_OVERRIDE, 0x30000000, BIT(PI=
PE_NONE) },
> > +     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE)=
 },
> > +     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE=
) },
> > +     { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) =
},
> > +     { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> > +     { REG_A6XX_SP_CHICKEN_BITS, BIT(24), BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_CHICKEN_BITS_2, 0x00820800, BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_SP_CHICKEN_BITS_5, BIT(3), BIT(PIPE_NONE) },
> > +     { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL, 0x04000000, BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1, BIT(17), BIT(PIPE_NONE) },
> > +     { REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3, BIT(1), BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NON=
E) },
> > +     { REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> > +     { REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
> > +     { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> > +     { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
> > +     { REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_HW_DBG_CNTL, 0x01410000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> > +     { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > +     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00080020, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > +     { REG_A8XX_VSC_VISIBILITY_FLUSH_CNTL, 0x00080004, BIT(PIPE_NONE) =
},
> > +     { },
> > +};
> > +
> > +static const struct adreno_reglist_pipe a850_nonctxt_regs[] =3D {
> > +     { REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
> > +     { REG_A8XX_CP_MULTIDRAW_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0x01000800, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > +     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(=
PIPE_BR) },
> > +     { REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIP=
E_BR) },
> > +     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PI=
PE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_3, 0x00400000, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_5, BIT(28), BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > +     { REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) =
},
> > +     { REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > +     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
> > +     { REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_SLICE_PERFCTR_CNTL, BIT(0), BIT(PIPE_NONE) },
> > +     { REG_A8XX_RBBM_POWER_UP_RESET_SW_OVERRIDE, 0x70809060, BIT(PIPE_=
NONE) },
> > +     { REG_A8XX_RBBM_POWER_UP_RESET_SW_BV_OVERRIDE, 0x30000000, BIT(PI=
PE_NONE) },
> > +     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE)=
 },
> > +     { REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE=
) },
> > +     { REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) =
},
> > +     { REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
> > +     { REG_A6XX_SP_CHICKEN_BITS, BIT(24), BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_CHICKEN_BITS_2, 0x00820800, BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_SP_CHICKEN_BITS_5, BIT(3), BIT(PIPE_NONE) },
> > +     { REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL, 0x04000000, BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1, BIT(17), BIT(PIPE_NONE) },
> > +     { REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3, BIT(1), BIT(PIPE_NONE) },
> > +     { REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NON=
E) },
> > +     { REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
> > +     { REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
> > +     { REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> > +     { REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
> > +     { REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_HW_DBG_CNTL, 0x01410000, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
> > +     { REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
> > +     { REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_=
BR) },
> > +     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PI=
PE_BR) },
> > +     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00080020, BIT(PIPE_BV) | BIT(PIPE=
_BR) },
> > +     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BI=
T(PIPE_BR) },
> > +     { REG_A8XX_VSC_VISIBILITY_FLUSH_CNTL, 0x00080004, BIT(PIPE_NONE) =
},
> > +     { },
> > +};
> > +
> > +static const u32 a850_protect_regs[] =3D {
> > +     A6XX_PROTECT_RDONLY(0x00008, 0x039b),
> > +     A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
> > +     A6XX_PROTECT_NORDWR(0x00440, 0x001f),
> > +     A6XX_PROTECT_RDONLY(0x00580, 0x005f),
> > +     A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
> > +     A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
> > +     A6XX_PROTECT_RDONLY(0x00759, 0x001b),
> > +     A6XX_PROTECT_NORDWR(0x00775, 0x000a),
> > +     A6XX_PROTECT_RDONLY(0x00789, 0x0000),
> > +     A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
> > +     A6XX_PROTECT_NORDWR(0x00800, 0x0029),
> > +     A6XX_PROTECT_NORDWR(0x00837, 0x00af),
> > +     A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
> > +     A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
> > +     A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
> > +     A6XX_PROTECT_NORDWR(0x00c07, 0x0008),
> > +     A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
> > +     A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00df5, 0x0003),
> > +     A6XX_PROTECT_RDONLY(0x00df9, 0x0007),
> > +     A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
> > +     A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
> > +     A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
> > +     A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
> > +     A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
> > +     A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
> > +     A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
> > +     A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
> > +     A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
> > +     A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
> > +     A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
> > +     A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
> > +     A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
> > +     A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
> > +     A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x18400, 0x003f),
> > +     A6XX_PROTECT_RDONLY(0x18440, 0x013f),
> > +     A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1ac00, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1cc00, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
> > +     A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
> > +     A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
> > +     A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
> > +     A6XX_PROTECT_NORDWR(0x27800, 0x007f),
> > +     A6XX_PROTECT_RDONLY(0x27880, 0x0385),
> > +     A6XX_PROTECT_NORDWR(0x27882, 0x0035),
> > +     A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
> > +};
> > +DECLARE_ADRENO_PROTECT(a850_protect, 15);
> > +
> > +static const u32 a850_pwrup_reglist_regs[] =3D {
> > +     REG_A8XX_RB_CMP_NC_MODE_CNTL,
> > +     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
> > +     REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN + 1,
> > +     REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
> > +     REG_A7XX_SP_READ_SEL,
> > +     REG_A8XX_CP_MULTIDRAW_CNTL,
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(5),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(6),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(7),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(8),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(9),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(10),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(11),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(12),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(13),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(14),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(15),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(16),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(17),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(18),
> > +     REG_A8XX_TPL1_BICUBIC_WEIGHTS_TABLE(19),
> > +     REG_A6XX_TPL1_DBG_ECO_CNTL,
> > +     REG_A6XX_TPL1_DBG_ECO_CNTL1,
> > +     REG_A6XX_TPL1_NC_MODE_CNTL,
> > +     REG_A6XX_UCHE_MODE_CNTL,
> > +     REG_A8XX_UCHE_CCHE_MODE_CNTL,
> > +     REG_A8XX_UCHE_HW_DBG_CNTL,
> > +     REG_A8XX_UCHE_CCHE_CACHE_WAYS,
> > +     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN,
> > +     REG_A8XX_UCHE_CCHE_GC_GMEM_RANGE_MIN + 1,
> > +     REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN,
> > +     REG_A8XX_UCHE_CCHE_LPAC_GMEM_RANGE_MIN + 1,
> > +     REG_A8XX_UCHE_CCHE_TRAP_BASE,
> > +     REG_A8XX_UCHE_CCHE_TRAP_BASE + 1,
> > +     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE,
> > +     REG_A8XX_UCHE_CCHE_WRITE_THRU_BASE + 1,
> > +     REG_A8XX_UCHE_CLIENT_PF,
> > +     REG_A8XX_UCHE_DBG_ECO_CNTL_0,
> > +     REG_A8XX_UCHE_GBIF_GX_CONFIG,
> > +     REG_A8XX_UCHE_TRAP_BASE,
> > +     REG_A8XX_UCHE_TRAP_BASE + 1,
> > +     REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
> > +     REG_A8XX_UCHE_WRITE_THRU_BASE,
> > +     REG_A8XX_UCHE_WRITE_THRU_BASE + 1,
> > +     REG_A8XX_VSC_VISIBILITY_FLUSH_CNTL,
> > +};
> > +DECLARE_ADRENO_REGLIST_LIST(a850_pwrup_reglist);
> > +
> > +static const u32 a850_ifpc_reglist_regs[] =3D {
> > +     REG_A8XX_CP_INTERRUPT_STATUS_MASK_GLOBAL,
> > +     REG_A8XX_RBBM_NC_MODE_CNTL,
> > +     REG_A8XX_RBBM_SLICE_INTERFACE_HANG_INT_CNTL,
> > +     REG_A8XX_RBBM_SLICE_NC_MODE_CNTL,
> > +     REG_A8XX_RBBM_SLICE_PERFCTR_CNTL,
> > +     REG_A6XX_SP_CHICKEN_BITS,
> > +     REG_A7XX_SP_CHICKEN_BITS_2,
> > +     REG_A7XX_SP_CHICKEN_BITS_3,
> > +     REG_A8XX_SP_CHICKEN_BITS_5,
> > +     REG_A7XX_SP_HLSQ_DBG_ECO_CNTL,
> > +     REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1,
> > +     REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3,
> > +     REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN,
> > +     REG_A8XX_SP_HLSQ_LPAC_GMEM_RANGE_MIN + 1,
> > +     REG_A6XX_SP_NC_MODE_CNTL,
> > +     REG_A6XX_SP_PERFCTR_SHADER_MASK,
> > +     REG_A8XX_SP_L0_PERF_TUNE,
> > +     REG_A8XX_CP_PROTECT_GLOBAL(0),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(1),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(2),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(3),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(4),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(5),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(6),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(7),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(8),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(9),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(10),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(11),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(12),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(13),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(14),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(15),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(16),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(17),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(18),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(19),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(20),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(21),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(22),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(23),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(24),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(25),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(26),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(27),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(28),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(29),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(30),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(31),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(32),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(33),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(34),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(35),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(36),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(37),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(38),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(39),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(40),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(41),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(42),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(43),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(44),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(45),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(46),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(47),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(48),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(49),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(50),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(51),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(52),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(53),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(54),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(55),
> > +     REG_A8XX_CP_PROTECT_GLOBAL(63),
> > +};
> > +DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
> > +
> > +static const struct adreno_reglist a850_gbif[] =3D {
> > +     { REG_A6XX_GBIF_QSB_SIDE0, 0x00071e20 },
> > +     { REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
> > +     { REG_A6XX_GBIF_QSB_SIDE2, 0x00071e20 },
> > +     { REG_A6XX_GBIF_QSB_SIDE3, 0x00071e20 },
> > +     { REG_A6XX_GBIF_CX_CONFIG, 0x20023020 },
> > +     { },
> > +};
> > +
> > +static const struct adreno_reglist_pipe a850_dyn_pwrup_reglist_regs[] =
=3D {
> > +     { REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > +     { REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_GRAS_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0, BIT(PIPE_BV) | BIT(PIPE_BR) =
},
> > +     { REG_A8XX_PC_CHICKEN_BITS_1, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_2, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_3, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_4, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CHICKEN_BITS_5, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0, BIT(PIPE_BV) | =
BIT(PIPE_BR) },
> > +     { REG_A8XX_PC_VIS_STREAM_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0, BIT(PIPE_BR)},
> > +     { REG_A8XX_RB_CCU_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_NC_MODE_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_RBP_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0, BIT(PIPE_BR) },
> > +     { REG_A7XX_VFD_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BV_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BR_THRESHOLD, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VFD_CB_LP_REQ_CNT, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
> > +     { REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR=
) },
> > +     { REG_A8XX_CP_HW_FAULT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > +             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > +             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > +     { REG_A8XX_CP_INTERRUPT_STATUS_MASK_PIPE, 0, BIT(PIPE_BR) |
> > +             BIT(PIPE_BV) | BIT(PIPE_LPAC) | BIT(PIPE_AQE0) |
> > +             BIT(PIPE_AQE1) | BIT(PIPE_DDE_BR) | BIT(PIPE_DDE_BV) },
> > +     { REG_A8XX_CP_PROTECT_CNTL_PIPE, 0, BIT(PIPE_BR) | BIT(PIPE_BV) |=
 BIT(PIPE_LPAC) },
> > +     { REG_A8XX_CP_PROTECT_PIPE(15), 0, BIT(PIPE_BR) | BIT(PIPE_BV) | =
BIT(PIPE_LPAC) },
> > +     { REG_A8XX_RB_GC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > +     { REG_A8XX_RB_LPAC_GMEM_PROTECT, 0, BIT(PIPE_BR) },
> > +     { REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE, 0, BIT(PIP=
E_BR) },
> > +};
> > +DECLARE_ADRENO_REGLIST_PIPE_LIST(a850_dyn_pwrup_reglist);
> > +
> > +static const struct adreno_info a8xx_gpus[] =3D {
> > +     {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x44050001),
> > +             .family =3D ADRENO_8XX_GEN1,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "gen80000_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "gen80000_gmu.bin",
> > +                     [ADRENO_FW_AQE] =3D "gen80000_aqe.fw",
> > +             },
> > +             .gmem =3D 12 * SZ_1M,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION |
> > +                       ADRENO_QUIRK_IFPC,
> > +             .funcs =3D &a8xx_gpu_funcs,
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .protect =3D &a830_protect,
> > +                     .nonctxt_reglist =3D a830_nonctxt_regs,
> > +                     .pwrup_reglist =3D &a830_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &a830_dyn_pwrup_reglist,
> > +                     .ifpc_reglist =3D &a830_ifpc_reglist,
> > +                     .gbif_cx =3D a840_gbif,
> > +                     .max_slices =3D 3,
> > +                     .gmu_chipid =3D 0x8000100,
> > +                     .bcms =3D (const struct a6xx_bcm[]) {
> > +                             { .name =3D "SH0", .buswidth =3D 16 },
> > +                             { .name =3D "MC0", .buswidth =3D 4 },
> > +                             {
> > +                                     .name =3D "ACV",
> > +                                     .fixed =3D true,
> > +                                     .perfmode =3D BIT(2),
> > +                                     .perfmode_bw =3D 10687500,
> > +                             },
> > +                             { /* sentinel */ },
> > +                     },
> > +             },
> > +             .preempt_record_size =3D 13536 * SZ_1K,
> > +             .speedbins =3D ADRENO_SPEEDBINS(
> > +                     { 0,   0 },
> > +                     { 252, 0 },
> > +                     { 242, 1 },
> > +                     { 232, 2 },
> > +                     { 221, 3 },
> > +                     { 190, 4 },
> > +             ),
> > +     }, {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x44070001),
> > +             .family =3D ADRENO_8XX_GEN2,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "gen80100_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "gen80100_gmu.bin",
> > +             },
> > +             .gmem =3D 21 * SZ_1M,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION |
> > +                       ADRENO_QUIRK_SOFTFUSE,
> > +             .funcs =3D &a8xx_gpu_funcs,
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .protect =3D &x285_protect,
> > +                     .nonctxt_reglist =3D x285_nonctxt_regs,
> > +                     .pwrup_reglist =3D &a840_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &x285_dyn_pwrup_reglist,
> > +                     .ifpc_reglist =3D &a840_ifpc_reglist,
> > +                     .gbif_cx =3D a840_gbif,
> > +                     .max_slices =3D 4,
> > +                     .gmu_chipid =3D 0x8010100,
> > +                     .bcms =3D (const struct a6xx_bcm[]) {
> > +                             { .name =3D "SH0", .buswidth =3D 16 },
> > +                             { .name =3D "MC0", .buswidth =3D 4 },
> > +                             {
> > +                                     .name =3D "ACV",
> > +                                     .fixed =3D true,
> > +                                     .perfmode =3D BIT(2),
> > +                                     .perfmode_bw =3D 16500000,
> > +                             },
> > +                             { /* sentinel */ },
> > +                     },
> > +                     .clx_tbl =3D &x285_clx_tbl,
> > +                     .limits_tbl =3D &x285_limits,
> > +             },
> > +             .speedbins =3D ADRENO_SPEEDBINS(
> > +                     { 0,   0 },
> > +                     { 388, 1 },
> > +                     { 357, 2 },
> > +                     { 284, 3 },
> > +             ),
> > +     }, {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x44050a01),
> > +             .family =3D ADRENO_8XX_GEN2,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "gen80200_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "gen80200_gmu.bin",
> > +                     [ADRENO_FW_AQE] =3D "gen80200_aqe.fw",
> > +             },
> > +             .gmem =3D 18 * SZ_1M,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION |
> > +                       ADRENO_QUIRK_IFPC,
> > +             .funcs =3D &a8xx_gpu_funcs,
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .protect =3D &a840_protect,
> > +                     .nonctxt_reglist =3D a840_nonctxt_regs,
> > +                     .pwrup_reglist =3D &a840_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &a840_dyn_pwrup_reglist,
> > +                     .ifpc_reglist =3D &a840_ifpc_reglist,
> > +                     .gbif_cx =3D a840_gbif,
> > +                     .max_slices =3D 3,
> > +                     .gmu_chipid =3D 0x8020100,
> > +                     .bcms =3D (const struct a6xx_bcm[]) {
> > +                             { .name =3D "SH0", .buswidth =3D 16 },
> > +                             { .name =3D "MC0", .buswidth =3D 4 },
> > +                             {
> > +                                     .name =3D "ACV",
> > +                                     .fixed =3D true,
> > +                                     .perfmode =3D BIT(2),
> > +                                     .perfmode_bw =3D 10687500,
> > +                             },
> > +                             { /* sentinel */ },
> > +                     },
> > +                     .clx_tbl =3D &a840_clx_tbl,
> > +                     .limits_tbl =3D &a840_limits,
> > +             },
> > +             .preempt_record_size =3D 19708 * SZ_1K,
> > +             .speedbins =3D ADRENO_SPEEDBINS(
> > +                     { 0,   0 },
> > +                     { 273, 1 },
> > +                     { 252, 2 },
> > +                     { 221, 3 },
> > +             ),
> > +     }, {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x44010000),
> > +             .family =3D ADRENO_8XX_GEN1,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "gen80300_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "gen80300_gmu.bin",
> > +             },
> > +             .gmem =3D SZ_512K + SZ_64K,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION |
> > +                       ADRENO_QUIRK_IFPC,
> > +             .funcs =3D &a8xx_gpu_funcs,
> > +             .zapfw =3D "gen80300_zap.mbn",
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .protect =3D &a810_protect,
> > +                     .nonctxt_reglist =3D a810_nonctxt_regs,
> > +                     .pwrup_reglist =3D &a810_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &a810_dyn_pwrup_reglist,
> > +                     .ifpc_reglist =3D &a810_ifpc_reglist,
> > +                     .gbif_cx =3D a840_gbif,
> > +                     .max_slices =3D 1,
> > +                     .gmu_chipid =3D 0x8030000,
> > +                     .bcms =3D (const struct a6xx_bcm[]) {
> > +                             { .name =3D "SH0", .buswidth =3D 16 },
> > +                             { .name =3D "MC0", .buswidth =3D 4 },
> > +                             {
> > +                                     .name =3D "ACV",
> > +                                     .fixed =3D true,
> > +                                     .perfmode =3D BIT(2),
> > +                                     .perfmode_bw =3D 10687500,
> > +                             },
> > +                             { /* sentinel */ },
> > +                     },
> > +             },
> > +             .preempt_record_size =3D 4558 * SZ_1K,
> > +             .speedbins =3D ADRENO_SPEEDBINS(
> > +                     { 0,   0 },
> > +                     { 242, 1 },
> > +                     { 221, 2 },
> > +             ),
> > +     }, {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x44060000),
> > +             .family =3D ADRENO_8XX_GEN2,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "gen80100_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "gen80100_gmu.bin",
> > +                     [ADRENO_FW_AQE] =3D "gen80100_aqe.fw",
> > +             },
> > +             .gmem =3D 15 * SZ_1M + SZ_512K + SZ_256K,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION |
> > +                       ADRENO_QUIRK_SOFTFUSE,
> > +             .funcs =3D &a8xx_gpu_funcs,
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .protect =3D &x285_protect,
> > +                     .nonctxt_reglist =3D x285_nonctxt_regs,
> > +                     .pwrup_reglist =3D &a840_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &x285_dyn_pwrup_reglist,
> > +                     .ifpc_reglist =3D &a840_ifpc_reglist,
> > +                     .gbif_cx =3D a840_gbif,
> > +                     .max_slices =3D 3,
> > +                     .gmu_chipid =3D 0x80a0000,
> > +                     .bcms =3D (const struct a6xx_bcm[]) {
> > +                             { .name =3D "SH0", .buswidth =3D 16 },
> > +                             { .name =3D "MC0", .buswidth =3D 4 },
> > +                             {
> > +                                     .name =3D "ACV",
> > +                                     .fixed =3D true,
> > +                                     .perfmode =3D BIT(2),
> > +                                     .perfmode_bw =3D 16500000,
> > +                             },
> > +                             { /* sentinel */ },
> > +                     },
> > +             },
> > +             .speedbins =3D ADRENO_SPEEDBINS(
> > +                     { 0,   0 },
> > +                     { 388, 1 },
> > +                     { 357, 2 },
> > +                     { 284, 3 },
> > +             ),
> > +     }, {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x44041400),
> > +             .family =3D ADRENO_8XX_GEN2,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "gen81100_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "gen81400_gmu.bin",
> > +                     [ADRENO_FW_AQE] =3D "gen81100_aqe.fw",
> > +             },
> > +             .gmem =3D 12 * SZ_1M,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION |
> > +                       ADRENO_QUIRK_IFPC,
> > +             .funcs =3D &a8xx_gpu_funcs,
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .protect =3D &a850_protect,
> > +                     .nonctxt_reglist =3D a845_nonctxt_regs,
> > +                     .pwrup_reglist =3D &a850_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &a850_dyn_pwrup_reglist,
> > +                     .ifpc_reglist =3D &a850_ifpc_reglist,
> > +                     .gbif_cx =3D a850_gbif,
> > +                     .max_slices =3D 3,
> > +                     .gmu_chipid =3D 0x80e0000,
> > +                     .thinmem_config =3D 14,
> > +                     .bcms =3D (const struct a6xx_bcm[]) {
> > +                             { .name =3D "SH0", .buswidth =3D 32 },
> > +                             { .name =3D "MC0", .buswidth =3D 4 },
> > +                             {
> > +                                     .name =3D "ACV",
> > +                                     .fixed =3D true,
> > +                                     .perfmode =3D BIT(2),
> > +                                     .perfmode_bw =3D 16500000,
> > +                             },
> > +                             { /* sentinel */ },
> > +                     },
> > +             },
> > +             .preempt_record_size =3D 13564 * SZ_1K,
> > +             .speedbins =3D ADRENO_SPEEDBINS(
> > +                     { 0, 0 },
> > +                     { 0xd8, 0 },
> > +                     { 0x11c, 1 },
> > +             ),
> > +     }, {
> > +             .chip_ids =3D ADRENO_CHIP_IDS(0x44051401),
> > +             .family =3D ADRENO_8XX_GEN2,
> > +             .fw =3D {
> > +                     [ADRENO_FW_SQE] =3D "gen81100_sqe.fw",
> > +                     [ADRENO_FW_GMU] =3D "gen81100_gmu.bin",
> > +                     [ADRENO_FW_AQE] =3D "gen81100_aqe.fw",
> > +             },
> > +             .gmem =3D 18 * SZ_1M,
> > +             .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                       ADRENO_QUIRK_HAS_HW_APRIV |
> > +                       ADRENO_QUIRK_PREEMPTION |
> > +                       ADRENO_QUIRK_IFPC,
> > +             .funcs =3D &a8xx_gpu_funcs,
> > +             .a6xx =3D &(const struct a6xx_info) {
> > +                     .protect =3D &a850_protect,
> > +                     .nonctxt_reglist =3D a850_nonctxt_regs,
> > +                     .pwrup_reglist =3D &a850_pwrup_reglist,
> > +                     .dyn_pwrup_reglist =3D &a850_dyn_pwrup_reglist,
> > +                     .ifpc_reglist =3D &a850_ifpc_reglist,
> > +                     .gbif_cx =3D a850_gbif,
> > +                     .max_slices =3D 3,
> > +                     .gmu_chipid =3D 0x80b0100,
> > +                     .thinmem_config =3D 14,
> > +                     .bcms =3D (const struct a6xx_bcm[]) {
> > +                             { .name =3D "SH0", .buswidth =3D 32 },
> > +                             { .name =3D "MC0", .buswidth =3D 4 },
> > +                             {
> > +                                     .name =3D "ACV",
> > +                                     .fixed =3D true,
> > +                                     .perfmode =3D BIT(2),
> > +                                     .perfmode_bw =3D 16500000,
> > +                             },
> > +                             { /* sentinel */ },
> > +                     },
> > +             },
> > +             .preempt_record_size =3D 19708 * SZ_1K,
> > +             .speedbins =3D ADRENO_SPEEDBINS(
> > +                     { 0, 0 },
> > +                     { 284, 2 },
> > +                     { 216, 3 },
> > +             ),
> > +     }
> > +};
> > +
> > +DECLARE_ADRENO_GPULIST(a8xx);
> > +
> > +static inline __always_unused void __build_asserts(void)
> > +{
> > +     BUILD_BUG_ON(a810_protect.count > a810_protect.count_max);
> > +     BUILD_BUG_ON(a830_protect.count > a830_protect.count_max);
> > +}
>
