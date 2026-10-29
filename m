Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793309291;
	b=Rt4etvAt6GFr4idOmwbjcU6LP+pIjiZ6e/Uwb9Y3WYMpyq7zTTG9T8o/2aBd9GxXSEni
	 SCXOBmlOITbCbxjmG7M/pd+7WCBvQQNAZi+SdmdYgVzhpANJQYKTdgGqmODamNVlWqwqe
	 sdeXBSA/hbt+2n7aE0qbRiN5/xYzZSZmzpLStPUb8KuyTKQFGi0OCQTOp9qUz1JlPn7lE
	 Wz/RQg4mkXII67GfboA+yCvcYVWPoIswPTM7QKUYOHt9+8gzmb9S2kr8nvXNWogoa2NmL
	 TXKNPufjb1u2mf0cRvgFd5a8lF+HnL1XT4x4yJbFiTdSxVV4y0UlJ4AhFIMSTTL/ppQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309291;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6hVwHTU0GHPRCW3hjRHqce++5Z2pLoYbYCApNYxLMvs=;
	b=2e2KGCHPK3MqYjOLXlFW+ppVCP3k9eaN5G9V1gDFdDUtWH+ORG0FLwb12ECzg/AqnB9v
	 safkghSahSsGiczzuCBl5N1ggp9MNn635FcYxnzxRPhLaSfl+ZfsvmcDJxnckjJPlqnVZ
	 Qw1pyX46O0UgPOD2E2RX9Dr+fK6prdsm+H7oef3h+cVBkoDR1w2Zz0yfNLBJf+b9T70xB
	 hC/kv7QXDprf3gJUMN6w4nR/2+K8o47Dcattz2w0AAHA3ER6vKIv/6PxDD0gbb6bIcsmQ
	 YYGZjSDvBhS0dFNBwMNm89X39+sMy/WlQJHMHOkPPM9NzCxOML6N3+H8j3MJlm2LJQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLH+sRwM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gs+MXgSH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12027606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12027606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLH+sRwM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gs+MXgSH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjUFN059395
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=6hVwHTU0GHPRCW3hjRHqce++5Z2pLoYbYCApNYxLMvs=; b=eL
	H+sRwMds8lIU2pRZSxje2mH8cXy0k4lHgYt3eZYj2eMmHJaYgsJv1sSF56vS/4+N
	5SvNbWZ9qeQlJoCjEOrL2IvjP9tahZ6XSkXabnIP6IHKWDozYfXlMqdS0tu/F46Y
	R9/1i+ZQU9pDqvBmP9ifunmk+yvDxKp9F2h5e3QDcuVP/8LNAFEop6iC0T06H057
	ED/+uch14f41WXZLF+F+d1Mo1zZcUd9+A8woQmeIJ0YZMHP+xHOmA5kcGS3Fyh4d
	PgK1hgh5IVKS+W/Vxf6Z6cuPop3I88u6BpJvM793eztZvI9Jvwldc4cefYsquaao
	8oHchG6IaAGfe2WphqJw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmby38jfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:28:09 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4519ef1babeso38766fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793309289; cv=none;
        d=google.com; s=arc-20260327;
        b=iAfEe4cn52HdjWiaz3240IQi1NGmgW1ymnoggrJzyIxPQq64WJ6hVGfMZ6biKIcDXe
         IQ7zs0ANKnU4+KBQm1Be9kMz8YmWnFss9x/lGAx7TuuPsgaDkmrRGbeF8Y9nyuTL2Z8y
         J2BHdV8VUEd2+eX7KbBQi4qdtsDzq6SfgASUnn7ynTVv/d8kcG0RVZLudImD6jBtC8ob
         iUn46LrANdIpkdIK9MAu9OqGDLlSyUF9qobdRA/5IT2C7YKKf4s0yj/fUb0bD1OKybao
         Ig8c7DBDtCfSyYKY1TYOPK+pH5L5oAG+sEYhjUCQasRrMuHMHzNfnv7is7GpY93Xe+vP
         cXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=6hVwHTU0GHPRCW3hjRHqce++5Z2pLoYbYCApNYxLMvs=;
        fh=cmYSa+oepyN0LOI/LR1Dadp8tWW+abyXSAfIr/mI9Bg=;
        b=qR7Cuj0cU3ANbWvIONDipXa/eABRnw51R4/vMv0VhisVN+uzdItaFu/rx30vC1PxlW
         jDLFiNj4289IYyT9xS7zA/UWlr4sbh33s4FkyFJQsZg+dKmDJwH5z5AOyL+o781H5EL5
         FgfkazOIRfPBJdl0Pjv3MLE8f9UfIhHNEKB7sEZfv7ArRU8nmoMvO6FJw46NB8v+pQtQ
         FB3Zu6fipnqphLjHKxiMARQpz4wLNpesKpihxWAIsRVmx/QJ1vhqzepdNWe4owJj7Nn9
         4TNBeXmhn/N70gTD72FBPSGuJPeNe0lB/v1wi2zfX4xXT7hBkr6X9VQr5CIXKyHqWNNY
         KagQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793309289; x=1793914089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6hVwHTU0GHPRCW3hjRHqce++5Z2pLoYbYCApNYxLMvs=;
        b=Gs+MXgSHCld692dSyGYFLZf04y4Y3twhUU7p4kXKrDAmOmuqkGoJtFW57EHFraSHmj
         +0o//5RbgS1jqguIOp31ZlIBIiB3uMLULvQ1wmEMeHRnmLU/bui5/fSTboVDN1pY7bAq
         XlyHx/R51mezbPcZz9QhcbZ0DqBWwB5ObE9PI2eYtS4t/NZHA6YnCU1xQ0vRCauId2+x
         QD673eYQ0fLlvybedWanUobFb+/2ogtJ5iN7RjMs5IYHUG5jBI8VQJQ8lf7PGf869Rym
         GqifkNWANAQ3NVxS1BR/+Z8OzgytGEZxmtTFtTmCdReIip+vyZ5mS2AF930XTgODeKsB
         rPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309289; x=1793914089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hVwHTU0GHPRCW3hjRHqce++5Z2pLoYbYCApNYxLMvs=;
        b=tsGqNUDa1K5WVw3/zNcwK4AqOfsaMlZs2l1tIKD8wiicUrC1W06c+UuqMDSEJc+OEe
         ZRI98RIPjk0WApjpNBaSrJj5wCnoAuwB2negXUrQWkj+XUSFLpP6IcofEkDAMlxFcLdW
         6WajaDNljvC4I1gmI7pD1BP+703TaLwxD6kXbDcXhEenXNSOgxJgMN8euRqR2FhrkRJw
         stTT8wyg6630/CoD5/tdA0Ols3brKvy3vDN+BAolqiN+ycKso/NteyW+FJO5P3zjNkuF
         YCWRStRj+scbSVqYyxL/S9QP0WzNjlbhktffskyfoS8t/2LZ/v3sI43txDix6bVtq2We
         FAyA==
X-Forwarded-Encrypted: i=1; AKwUvBxB1gaL1MQK5LdYcgstK9YaeuxhfWY9dA13oSyZGQo5e2Pt8JqBFeU8rp5IqywuJjRV4SvsR0I55egvIRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhkWxpRmIAFBFuWvNIlHpj/JL+MxbOkT67kMudToAFjb73g39S
	8QxRwmipn9FVZdyO7jZmKA7MFRTVo72F6rVX2Z34VncHVO2E1iIdymsiubaDpG33Udw7R766hKO
	bc6BR3FgdOHf12n9N/OaLsOw/1ML7RuiragwRvTg8g168ZEOE2KZbMaOC52n5wggnrJWbQXZnfj
	50jzpPFFiLS8iGjJoGdONALrMNY60Qg1i3pHgWg77o1Q==
X-Gm-Gg: AYBFou3FUo5DBqYIGs43MjkeVPgudWmQEnhG1bERB7ZY1u+gwIKnzeO5ewIp3AK1lVa
	cAomfmT2xbmwt0UiBUHfIfy7F2xgViLXy+ZrPKMqNnPyWe+rR8LUSdrG4d5TKr/BkSzOtOlz/4U
	3lsgrz/NVIsJcNuA9iRoBkqa7FhQTZ8eHZFK610z9EhxtkaJ+2HpKDYS2Jmw==
X-Received: by 2002:a05:6870:b2ea:b0:475:e0a7:9f2f with SMTP id 586e51a60fabf-4a9076b1101mr271990fac.29.1793309288723;
        Thu, 29 Oct 2026 14:28:08 -0700 (PDT)
X-Received: by 2002:a05:6870:b2ea:b0:475:e0a7:9f2f with SMTP id
 586e51a60fabf-4a9076b1101mr271973fac.29.1793309288126; Thu, 29 Oct 2026
 14:28:08 -0700 (PDT)
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
Date: Thu, 29 Oct 2026 14:27:57 -0700
X-Gm-Features: AclHuK-TjUdlKoZnZG8f-CId0p1yRIAAyh4tUi1yT-oyXKhj7rxF2iO9qh7KDlc
Message-ID: <CACSVV03_=bZxh7KuQx7qx+2fZDDKv67Yn3dVu1biBG1s=J9+KQ@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX5iFfzqLeicA0
 7ftuYqGakutorcPd3l1uhDXwNpAtiPvGkMkE8Ph5Rb/Bg0dc/93/ogKem/oZAyCXc40fwzUNC7a
 yNkeXB1GtwswK2Y/Xq6ipE8uh2gMDbM=
X-Authority-Analysis: v=2.4 cv=ZvN4uN7G c=1 sm=1 tr=0 ts=6ae3ba69 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=qffPo4UZxZtRrYcd1KIA:9 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX9J15x0MPDaoZ
 lYWrVSdsRfeKqoQOXRp5GQmBXWR+NerFqz7S/M/6SUzBsKn1XZdONElirfkkZ1se2k62E+PkC5G
 s7bsmlIn6nx6dzqXwe48R+A9ELexiiZtjH/OA26v0+6h4GMq/RnTpshkEPXrDRWw4cTZwo1FSRz
 zkjMk+iZPPT8yujDmRTypZOfjOPnvvVRf6lOrZ8KkfFLmtzN30D6R8/6IIdFUdbbnI/q58VAAp0
 ORd4LtWrBDz68uaHHXlwXdP0OTqV8wpdARD+7lUDl6TKciLg52GTSAWDJUUVAWEXioMKTE2zEgU
 OlgfnKBqUnVKhHgGyGrQvezZwJYrr6YaU/L6NDJlGyLjfIQ3+YSOp1YNUFApQH0e5OjHZmv4J3U
 ur6hwFCe0Tv9rmAKEasuV21GRXOlvsfwfCdStFI4LwrQAeFDSivHvjQUfAYC06jcn2u4J2H2BWW
 Rsl9rHI+geQxZRc9mYA==
X-Proofpoint-ORIG-GUID: 1N_uoGBVRdAwsZlRy53N5ZDjz-Hchq5I
X-Proofpoint-GUID: 1N_uoGBVRdAwsZlRy53N5ZDjz-Hchq5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290084

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

In theory, this should help for qcom_iommu and msm_iommu, but untested:

https://lore.kernel.org/all/20261029212344.346069-1-robin.clark@oss.qualcom=
m.com/

Not sure if there would be further issues on devices with bootloader
splash?  It would probably be ok for DSI cmd mode panels which aren't
actively TX'ing to panel, but otherwise idk.

BR,
-R

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
