Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4011F4519A3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945180; cv=none; b=C4WfbpnYY2CruhQKAanYmfDd7xccBeuiQzyMfvH2lzYQbnH8SlZhmMnGyWgZfboKsI1rH5Y1+GdTm1PoMNm08chMESA+ISWrwxtRlEYN8i3CyUzr0yVxNkrKquJhzok/xVsK67hIZpUuhU060ENiVnD2DWdF4sbbHuOYPNd3vEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945180; c=relaxed/simple;
	bh=205z5LLDhgWohb4z8Gq9km9s7S+j/R98tGDLJ5Q4hps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbI50/adJJ15/MC95iy1N87PDjXdK40uOQ3Kqqm4AXWTM+hzt55ft7WXFP4A7NNkSBPnC3eAX9umoba7pF417GCakh5hoVa5F/YNb+cDo680iiRWqgmdSaAutCyvlLJb7McMnX4bJcjgenmpLvMKuGOv4ooyMiSNP0sU+5S2SjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ileTv8IO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EeJSk3o5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ileTv8IO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EeJSk3o5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nWh8960563
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 12:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6lyYymx3dDTOEqcC+QoyEp2I
	DDrTkkMvcQgBdtGhsSc=; b=ileTv8IOLZDeS6W19nnEvF2Y8bPz4TeDXtYbq5L4
	fgnJgDUVqE+uEjD6iMH3VL8l2rF6GIJJdeZXzqGFEuKkV6f7jy2Axg1lA7LpVgXP
	VkaL3YJnwMSw82iSLb4t5OU9ZcOg7Wp/RhCuccNoe66nAE5Ev8bfBzdfbiVWk4JT
	Zcx4CseMKkgwUHMl3ykSr/Klmz5cd8Uoh4AghgfdudUzNAukNQaFRoOWpy0Ssc7a
	RiBUdkS6Dl4K5OfxA+rO0yEfh6BHKlTt5Mu2FeXH+kdnoru98OSJSgo7JIUqz0W4
	2RkZMQSVXKbUY9JBWBuG/Jzz4fJzOY7jqCbb9zSVdSYgmQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdcmcps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:46:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so738001137.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790945177; x=1791549977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6lyYymx3dDTOEqcC+QoyEp2IDDrTkkMvcQgBdtGhsSc=;
        b=EeJSk3o5JQtpURF2GmdnCZC9gCWORKyxSTykUzc1sJKql5Km0ejyidueBGBq0ad11k
         gnfLvp/+Vubid5pH2HOPH8JW7J895/Trndm7AObnCQcPCyz4iexzsQsTmE7OgdvM8h/B
         5TrQQrDRJUcV7DiJr+b6fRHdcZkXC0EeKAl4KKhk60DLZAxD0bbBdFFiyDK+5jajUeJG
         sQ1oWAGfCPg/85gFz7nNicPEiZCPo2MKvE92p1aq8xY8uXELFUjoTqP9pBbshvjzsmKr
         VxQKt1q64ASAfne9TNnVIcXwmfBW9iGHHgI2R9ozubaiiT90rMqR4Y7tope58pvxXk7t
         Ppng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945177; x=1791549977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lyYymx3dDTOEqcC+QoyEp2IDDrTkkMvcQgBdtGhsSc=;
        b=ZoCbxWSHgN4ZnrfpC+kgRKXAML09M21Ashv/KgONNvsD9fJqT0Abd5dG2ZUcqEsqSi
         fywYKZFALzEPrT8Hxs9tmkNyiG4YY/UP1fo02w2uJ6gRssqstNkFG2/M+muMUhG82yfq
         CwFh+ktRHcOMN3eyK4UjjdpzjZtpQJGSkOsCNx0RxxiHFeJTL3kIZ7QpYpC5gTlRzTBL
         3XB1unkbLWDPok+pBj1XLt4N5RHzeTV8e4Ua74RFhNSjS8kgUC++Ax1ZiefsfzpmUZtm
         3yuvaOun9FIACRZW6hXrV4qsAXzrHX1tspqJ3dW/F1AfEJJm96MiWqDLjJDTm8HFZsPL
         CMow==
X-Forwarded-Encrypted: i=1; AKwUvBxuB4QuuQsn5N25y1cVYO1ZP0oKFZpTZuENSXUHOpZBilNIjbUhPsdPMsvX7zpQ6k+rB9NBx0MMXPyhW1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQL6TJcYI38xWEHfk6XM+4KMWFyGHZ/bIPer9nqG7eTgHgdgaC
	uHBIgoDwuezQIaDfYrnFxo158SDNbMjzFhW48BasjBLimgeQlauCN44Vxi/LTa/XHFHDM5c0yvs
	RvgaRG2Kj9clV4F4eT5WH/NLn36f1pEoom4U3f+imQwwVcS+ktAQv3pGhSEb1q10QzlA=
X-Gm-Gg: AYBFou1KN1JiVatBcEICtbKu/XoReL/6GVH5HHY3K+GOH7SestEmsJI/z0vguo3jgQy
	9g0pHV+PxYofkGUrCFdJLcR1m7z4M6rEFc6vlVpTajWunMYk47Q1u/5k7b0lfSmkC2c8R7PjrHG
	wVFUAF8UvAj/dpgFX99tFgqcAJPT6bIzH5ohp1Hf6VVwnzV11DRI/YoFWvKrV5VWl0Xa1IY6Qn7
	MgH5aoTlgWT4NTgWyRtd4cPQysinu+PhI6ciFw4VpJNu+Upr+Gh5eHwOb3S+RkUT3kaaHPKUPbT
	GGX8s1ELYxfocW4QgOL44mx1dXeALfU9fpl4bJhXKSCdNQwaK2Q2mFGNaM917XxFwZL4eadVXDj
	EwnQgqDPCOxYe9R8iN49/qEhs8n2LzGeUKlvhSN2/cZdAQ+kz1emi3BovsSyGDWB5JjnBDUJo11
	uyduPyW/ezq5LI
X-Received: by 2002:a05:6102:4b11:b0:7a7:198a:c2bd with SMTP id ada2fe7eead31-7c0f59b12damr762619137.37.1790945177460;
        Fri, 02 Oct 2026 05:46:17 -0700 (PDT)
X-Received: by 2002:a05:6102:4b11:b0:7a7:198a:c2bd with SMTP id ada2fe7eead31-7c0f59b12damr762553137.37.1790945173587;
        Fri, 02 Oct 2026 05:46:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c795bd0sm692372e87.38.2026.10.02.05.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:46:11 -0700 (PDT)
Date: Fri, 2 Oct 2026 15:46:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        valentine.burley@collabora.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/ci: add sc7180-trogdor-wormdingler-rev1-boe
Message-ID: <mxfi2t4qwxb5n3xebdfesq2rwwrimtpav5uwvkchtqfjksl2rt@gr4bjqqyt22y>
References: <20260616115410.325837-1-vignesh.raman@collabora.com>
 <20260616115410.325837-3-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616115410.325837-3-vignesh.raman@collabora.com>
X-Proofpoint-ORIG-GUID: e_11C9n0LfyK6emQW2syD-Xdn4nl-W7i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MCBTYWx0ZWRfXwSj/pQh3TjM4
 D4/8BukVos/3HVRyg9GZqQv0nk7V1z1UhN8Atf7zmfzq+aw6qRfBbrHa3d4v85W31kaHoFlEHxK
 k9wNgPftJDk0lZeN8hcN4/fKkvdhRdo=
X-Proofpoint-GUID: e_11C9n0LfyK6emQW2syD-Xdn4nl-W7i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MCBTYWx0ZWRfX9mt+FfEGPc5R
 rsXlBe85nYw7TIpynPAERj1y/2ruPd/TF+8nhntUOr536XOsXWCRFjUmI4LkToiUMGtBUPrDeGB
 lb12svVz/c2Kw5aafWkrfjVx9+TofItczZ0uKGoiFaiDzx3efygu/XA8/qWRPA5gPkNDND7Kt4o
 mzi30xmKQ36+I0mmjr++xqUCyFE/aa6my48d/uFsp0NV1I7SffZf+Fzt34c1hJoE3Zwk2JSNVjn
 TZ31qDsZHqg0BC8ewjWxaU7vhzJepBFkc/nkz+KrlC9kRlE9U1hACtx/J2mmsiFOfUxCYsRQ/6Y
 33Vv7GyTQKYhd4/hXi/Ay7Hd5EtshSU1Xhm7n+6zyBlOpE91VNueAncw1SF5H/snwmijfUQTrMc
 0quvUPdYrFXAIkPihq8xDkLLzTslIyogOKn8V0+A/V+WaBV90c2ebiBTrLXJ4HorJ4qB4aybdlv
 gt1aGGtGwyYYOavcdmg==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abfa79a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QX4gbG5DAAAA:8
 a=xPXTalVV15vKJwUFfvMA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020050

On Tue, Jun 16, 2026 at 05:24:05PM +0530, Vignesh Raman wrote:
> Add job that executes the IGT test suite for
> sc7180-trogdor-wormdingler-rev1-boe.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index fdaa26ad79d6..61ac2d043ce3 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -28,6 +28,7 @@ if [[ "$KERNEL_ARCH" = "arm64" ]]; then
>      DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb"
>      DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtb"
>      DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sm8350-hdk.dtb"
> +    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb"

Let's keep it at least minimally sorted, puting wormdingler between
kingoftown and sm8350

>  elif [[ "$KERNEL_ARCH" = "arm" ]]; then
>      GCC_ARCH="arm-linux-gnueabihf"
>      DEBIAN_ARCH="armhf"

[..]

> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
> new file mode 100644
> index 000000000000..4af93eeeaf99
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-fails.txt
> @@ -0,0 +1,23 @@

Most of the entries here are shared with kingoftown / limozeen, except
for:

> +kms_invalid_mode@overflow-vrefresh,Fail

Do you know why it fails? Why does it not on previous devices?

> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt
> new file mode 100644
> index 000000000000..8d1768de90cc
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-wormdingler-rev1-boe-skips.txt

This is mostly a copy of the existing lists, but kingoftown and limozeen
list .*suspend.* here. If we don't skip them for wormdingler, should we
unskip them for kingoftown too?

Also, I see that kingoftown lists several additional tests to be skipped
(kms_flip@2x-wf_vblank-ts-check, kms_cursor_crc@cursor-random-max-size,
kms_invalid_mode@overflow-vrefresh). Do you remember why?

Overall, I _think_ I have commented beforehand, but I can't find that
comment (so it might be my delusion or false memory). Is there a way to
unify the configuration for sc7180 trogdor devices?

-- 
With best wishes
Dmitry
