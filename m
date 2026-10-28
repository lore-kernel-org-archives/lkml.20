Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793151266;
	b=mZV5b5ZG4LwGxIdD2skvcym1cc5ZqOLcCjCwpWDRGL7ILvBU1p1mRSiazErETPX70Ohm
	 yvY0U1ZeDXi0/8AgVClcp7lsXwkg3ZRC3IFGxV26PDIteCoct9oyiFkhH2xOdIrbwRXef
	 wqBrPS9GOKHz7PcaXO7f5xGW+KgPi8q3ytMzqLbkjmdKUQ3HVDW34tWdKYVD/3m5FTwXa
	 BwKHepxgXjxbusYXT+C0DkZpsIWK0haUWfH+Z6mhg10BYKx+lRLDwPR1eA4d0v2729L65
	 BUkigVFJFrOd1oUiKfc0Hj1gRtj3uGSYMvhOAo7Tbkn3ALFFiy0INdwOpCpnJA8uu3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793151266;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Xm/wGXx2WzjPp6XsncEgT9WQiDFDT8zDzQqjFMg0UB4=;
	b=Rmj8krLssASZVsc3r7Vjbg56d2S8hEY5qVpSPo83DoxDNZDhmEIh1vrWOgKZ3T7oR2Df
	 B6YAEj26jZPvguGcfqsWrcXlA97cnSFzYBXxEuAc6eiqsJNem0G1UijKJGSIIUYMq66uL
	 ualdVY/BQB6sp1tJJ/6WSkMGCsEghYoBBziIaPKE4yxzNPX1HNKRong78B9VCZqc9iVuo
	 V0Oza/a9UO2MF5JxOEQifxeLeU8J8o1Cooef5qsZHnOyJUCqN7hEXxXCVtzhjN3FghkSO
	 SuVOuWzZZ0uRDQXqpVLGDznP7GifQobsTtGSNu8gt45AzjQxSaZ1nuqV12b49n50PbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjV8pOXW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EwHlc+ns;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB0C606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AB0C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjV8pOXW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EwHlc+ns
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0irgd3816321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Xm/wGXx2WzjPp6XsncEgT9WQiDFDT8zDzQqjFMg0UB4=; b=Uj
	V8pOXWAffqIp3CZMAyVWrXgVWRu0450pcGDimX5I66AOeUSNFIHx7xxmuRJXCBmt
	RLx+uNacyaY3hO9woAutTYamvzDszL5AOA74yQ1MpQWDSsamVX+lGSqNpk2X842i
	GDS4xWPGcDVu/Rq63IAd8U25Zdcq7BoscrJrRx+RuWvi+cX2w6SwllxXTXrQ33yq
	3iIyo0yN3CTG/i7+XRlVDUYEDxHb3gG/B/Ty85OJ33+Vh89dI4SNtl4RcIOZP/U+
	EnuV+pAsCVpuie25Q/Qf7DOFhhAmwyCi137KSJqNfN4uPS58zcDkm/UoSmDeqwBH
	Ob/iuIlDMIgBOFZt4fnQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1kf19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:34:25 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6dfe0f03baeso716458eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793151264; cv=none;
        d=google.com; s=arc-20260327;
        b=s4DoUtp9nsW7i+TmFEaq+jx0wFMMNkERI3hv26eOU6ULmFTj+fKPf6YdYUTHgWFNbM
         ZzhgI3CGSa6OJiXTti5wRqI3W76kqSFvo/DMpNvCdlqwzQUIU/lFGtq6Y/I6v2PDbtKB
         ZIumnFIowiI060mVataG+7AmWpp/Ka+uh+9as73WqlPf29EvUgRdteszCVET4tDgSfzD
         Pu7h8VPTDLpfJRDatoXARYv7kuJAPxdCnR1LvlUmm7mDxVATMxTORQv2z3GJ7jWgSpaB
         1O6asNf+kKAw+sbY4pO8uK3mbaz8ObXm4qIIZtVK9SY1fJUcZHnrwUarSa3H7CF315cS
         lO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Xm/wGXx2WzjPp6XsncEgT9WQiDFDT8zDzQqjFMg0UB4=;
        fh=c3EoS3Mkn2VIdkUMnmL9aTvjnGOA1S3DjdG39JC/bcc=;
        b=XMRPNlcS8OvwmYP9tnNsNJsXWgur/BvpUVmQ/mV3l2kJP2evQ6w1upEoVswgqvWmuG
         0J21uTHfQQUEbje+TLk16b1KJjo+bkJro0ShbRWa4iBbpPunMDI1FfXVmznmvtlO3BjO
         C+FPT8YnYtBpfvXS4ymP6GETrfuJo+sr7tdL3GCTRxtCNcpXLS3lP8NToD9n2zPal736
         d3Rx1RQjpUlWddLa0itS0Gc7Mcs31UIMBc852rifuHu0pkGNArXlrN04RGOYhwHi8GPi
         20D9dUnzcY2l/ESWDj8mwoyM2GlQvXrDV0KyEd8DYdNprH54Xp8i8i+X9+GBCdXoRqgZ
         +YWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793151264; x=1793756064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xm/wGXx2WzjPp6XsncEgT9WQiDFDT8zDzQqjFMg0UB4=;
        b=EwHlc+nsNnp+HpEs/2Gh5QPCWfeevsejgWhi33GO4s5XD6+ep5iI6C94uYiK05UTJP
         TsTmiau7yk3+j/wKTuGof2VOodjmfIJyR4PJPOaGVY02Qno/kkNhPdwi5KFTbCC5NmV9
         TsIEsRuXqgMljL5XMdG49FsTXq6j3h52AOOF4mK73ObKcYPSKH34kLGUPzYNXzpd6pQY
         YeWT6VfebngQS5u0/dUGxHPyGUMCErOxIedLFXiXhTqciLaAiCu2baWrFj4gCiflROfG
         ERNvVwdqyLrGeNYqEx1YO4CWpi//zhqoOClArSVGChyKG7pRyMac93m3dHGLTv1QXkPy
         oBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793151264; x=1793756064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xm/wGXx2WzjPp6XsncEgT9WQiDFDT8zDzQqjFMg0UB4=;
        b=GV9X3dWMJ+VKAS1+B7TLpj4YLgMmBzr5XrPbYFIpefTKvqStkLj2KojxEFJUpZil3P
         d4LBxWZ2Iz5DmEh4uLmCTznzr7gZ8P8p64tHZlgpLyAR7PFpD89qmvnJmGEm3dekIdER
         xIfujHOA+KymQTG3WdMNwG88cJoggAElTnIJTGBUWvXXRw+JRuKCIg8N40cc8ZfAOEcJ
         XVLbjBKHxBPPVDMSGfS73/kFaVRqQ/Z7Uv5KDeW4n/a10YD6A9OlNWKBN1F4mKV5pf/2
         noBwZHE8QnpMKi/RxhP/2KToniQFISfNjeVhG2+jV5yDuh5Xg0sbCHhepUS4C7fRqTJ+
         u5Dg==
X-Forwarded-Encrypted: i=1; AKwUvByHpYtPCBN++vAs8uy0Pg7V1lX6XyazBK/jeagrmfiMeUkZFP0PEvNjeBq/uK2kQe/IV0Nofv41U30hQXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLevJn7Q0kMG3fYx1aETy8QKELYmRNVQ0OxeUMBsdFXIdaKIZnr
	vNkjpMscGPl/dN8+6RKKrT8Q1ceD1oNoD+80a86Pepm27NOY9xzThDFiJwtAxH8EsJ7VZnaBR58
	LiUc0ksrwd/jzAF3ILdxaeDfOovdXCDOX+d+8V7lv5Fnun15MFxCB43RsHdf/DKTBwJ0AQHlMFv
	8gU7tGGAG3ux/e+QKaa9XhpS+cLOizFKEA7hPaQzTL8g==
X-Gm-Gg: AYBFou24Z72DxffBwojwSTGRy9Mrv9Py3I6sCX9MQYIj+UhCo//UOaenFN7itJs8Ceq
	/VcOHJHFFubl/jZQITOs7jB91qwjhMcY1ucu9A5ueQAqjMKvPUXBEl/GtfuVaD5l/+ktJ7ClBfa
	4lJBg5+ySnx94jwNLwP1feN7cX3A8rEMeZryU94TaWCgwGZ0pCPq6pya7IGA==
X-Received: by 2002:a05:6820:1693:b0:6d8:9568:840a with SMTP id 006d021491bc7-713ee188879mr490987eaf.46.1793151264357;
        Tue, 27 Oct 2026 18:34:24 -0700 (PDT)
X-Received: by 2002:a05:6820:1693:b0:6d8:9568:840a with SMTP id
 006d021491bc7-713ee188879mr490977eaf.46.1793151263851; Tue, 27 Oct 2026
 18:34:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
 <20261027230452.130031-6-robin.clark@oss.qualcomm.com> <wxfx4nhwdx6dud4ahy3rfz3btfto4t2zor2pjbotlqpglvwolx@jhnm65bzecnq>
In-Reply-To: <wxfx4nhwdx6dud4ahy3rfz3btfto4t2zor2pjbotlqpglvwolx@jhnm65bzecnq>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:34:12 -0700
X-Gm-Features: AclHuK81DT8Al8nkBjxOqnV-fm8QFvrgKVznMTWgvFE3fwVLYN4R8IQKMbENEUE
Message-ID: <CACSVV00rXU=UxbDMCiomUKZDZOcGg0viVnnJ68J8fg8rRFXdHg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] drm/msm: Convert map helper to use dma-address
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae15121 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=qffPo4UZxZtRrYcd1KIA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: IgXWtOs0vc8RZ4QUoVTYozQBk6FVAyOh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAwNSBTYWx0ZWRfX715X7ap5Jc4D
 ErIZzm4XS3wdT1bAVKopcF+Fjx9c9XQ6/ytCZpMunXw1MF8DUtmdoDgO09nBTUEDkmH+q9gBkya
 RH2hr8azE79LOdCDzgRKzMy+EaWvWJQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAwNSBTYWx0ZWRfX+wpoeZJBRui1
 60HcS+oVvREKSiQi+tUmUApfW/ededpPF5Hkl+Jouf6COqcl7VB4ZSg/naSPOzuVLIlq7TGFW7N
 nqb0tWPKIgMypz139d6Qd8M+r+hgfm+wdB8I52F4TZp0HX5mV+JDgNJ7GBGLcEVFdzokE5B6WXq
 Ll4tL/ZT9mHRqkIX9NwZD20S3etPQkorEBLThFrcfXnhj3U889ROkDEYHXr1kJx259jVbD9/PUz
 +K6RgeM0D74fn6rPlrHA4TMlXzH2tsfJplooVV5uFsQWaGZtO0Fih1gLk4MuPs2Cd5Th4S6I/nl
 je+xAURKwk6u5KPACp+cQnHS0DQCMbMCLKRalNA/nmxLVyRRmHRLWmK4/MjbT8JZ88HyArRZaA9
 nbgXSAUrdPVf+YAYAu/qOXO+HEwdr3Pb6iORXSpZj6YUeYx3WDGeANI3w/Xdlr8JTNNI6fL0kfw
 c0xHN0MAq1eLltH8gUw==
X-Proofpoint-GUID: IgXWtOs0vc8RZ4QUoVTYozQBk6FVAyOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280005

On Tue, Oct 27, 2026 at 6:14=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Oct 27, 2026 at 04:04:48PM -0700, Rob Clark wrote:
> > Now that we have everything unified in one path, switch over to using
> > dma addresses for setting up the mapping.  This avoids issues with
> > CONFIG_DMABUF_DEBUG stripping the pages from the sgt.
> >
> > Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SF=
A14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=3Dy
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> This commit seems to break GPU on db410c (which uses qcom_iommu).
>
> [  104.954564] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
> to idle!
> [  104.954932] msm_mdp 1a01000.display-controller: [drm:adreno_load_gpu]
> *ERROR* gpu hw init failed: -22
> [  105.958559] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
> to idle!
> [  109.082571] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
> to idle!
> [  109.082670] msm_mdp 1a01000.display-controller: [drm:adreno_load_gpu]
> *ERROR* gpu hw init failed: -22
> [  110.086572] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
> to idle!
> [  111.098576] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
> to idle!
> [  111.098674] msm_mdp 1a01000.display-controller: [drm:adreno_load_gpu]
> *ERROR* gpu hw init failed: -22
> c[  112.102576] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for
> GPU to idle!

If that came down to this patch (and not the earlier msm_iommu.c
bits), then I'd look to the hint in the cover letter:

This all depends on being dma_map_direct() for the dma_map_sgtable()
to work.  This should be the case on modern things that use arm-smmu.
It's less clear when it comes to older pre-arm-smmu hw.  It's possible
that this series causes those things to catch fire.  If so, look to
commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to select
direct mapping") for inspiration.


BR,
-R

> >
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_=
iommu.c
> > index 479e5450a4dc..c2950d32c507 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -153,9 +153,9 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, str=
uct sg_table *sgt, size_t off
> >       u64 addr =3D iova;
> >       unsigned int i;
> >
> > -     for_each_sgtable_sg (sgt, sg, i) {
> > -             size_t size =3D sg->length;
> > -             phys_addr_t phys =3D sg_phys(sg);
> > +     for_each_sgtable_dma_sg (sgt, sg, i) {
> > +             size_t size =3D sg_dma_len(sg);
> > +             phys_addr_t phys =3D sg_dma_address(sg);
> >
> >               if (!len)
> >                       break;
> > --
> > 2.56.0
> >
>
> --
> With best wishes
> Dmitry
