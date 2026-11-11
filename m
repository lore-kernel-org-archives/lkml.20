Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412170;
	b=3kLlrrLsyXThtouTKNK5lf+wCS3NaC+kK2GISWhD9sFGZIm+YE9Q0fesOe3nQj7PjnzC
	 p79HyJPKyQkl6nf/2+pvar+hhvl3KiRxi2R09oRQzQaK36xy2tif2DHPl8CS67KwDmNVR
	 lyigunywvCFpDSiBiAm4TshyMoQ42EuK4EDQ3cAuI4P5MWsiwm4i1igpOCdf6U/nj1vnH
	 9XyyiGKX+BQzMYQwjV78rVajlG+bRzF/hgeCHkeqMTH4Cm2OWvkZ1S441nuCU+lwHANRN
	 pMt2aFGTnJSJtjNT5QF2x0B+9yKTZt4HotN26PoGBgBHmsQgyllkuqLB6KhZ3Q4ZZOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6GnlyLNGY6NT+GSUapR6x1kGipILRzIEm/U/49m1Jx8=;
	b=rd9O5rz6S7phLgJ5AYWkD18C38TJy4MxCH9qrEhVHLYa7H6XtkKFn5wPRAads5v+Ptuu
	 ZpZQ4k+BgmStq6qwLGZ0rNAMLyUDPuyIVl/Gh3LpTcTWio+7a3+Czl2c7sUbiF5NgWuxB
	 yx8L1QWc+mz//u0BD6JA4XCrp7auxo+z/eTK9al+Jm1UeqWw5U3CRHkPe+7yP/aX2BXw3
	 PqS0orXoX5yiDSuIEyCCUNTi8hwBPdEewfam38inCdKr2yQ/QJlryWakm5/+kkx/BBOSs
	 h4J1QnJK0RxIbHufLBAydmzdzJagk0mLENkhIyQChu2R73WfSS/GUO8MuS0OyhfTSeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L7OyFM9M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+iwYJhh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1188E606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1188E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L7OyFM9M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+iwYJhh
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF07Ti3597228
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6GnlyLNGY6NT+GSUapR6x1kG
	ipILRzIEm/U/49m1Jx8=; b=L7OyFM9Mc9v8R/qLVa0eB8IM8QxWLQnjY8OwAkGo
	O9WI6UGgHPN5E0wYHCI3bgxOt70kwmpuNNT+9MM8kRTM+DqPkIyUQaKv3+ibjOHp
	+xSPEagLmih/Xq1SKjNoBPlgIs7wF9x5FF+OBizABAcKLaK0D2A/sM6ofKybb6XI
	dftwV/XkDngacTPZ5TRD3cFh1+o49BGUmvfgqNs53K0VMroqbMpZcStIIi4DQIqM
	jiaPepTBxiaFZf3/t+BdZ7/YD4cKsuIjzNO2fJ6rVH619iLpYYFzEcOLcEMbsstO
	lPWqUnmQ3Jybf/B6pPKyvw3EbPpVx3malsXcVl53bv5ztw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1u8d2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:49:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ea71789d8so86664016d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794412168; x=1795016968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6GnlyLNGY6NT+GSUapR6x1kGipILRzIEm/U/49m1Jx8=;
        b=a+iwYJhh2sh5DXDlI4mc6xyzUdvDj4t+na7UH80IwT4aQ5cpVjxsuVdOiVc5QBcqKO
         sC9dZdpFotSuE7eZ5nlKRNL3668npzLnxnhd8sQqbRLXo1ZlFvuRwMGXWLs/ICnJrbkv
         j1e9VyyMbnzQFjRA6LDb1SBnTOIZiO6sC6KaIn1sQKqy0gRFBhoeDg3Q0Hr0qq27dbE2
         jKOVTBErC3Jlj2tInWkl/bNMz66cw5o5UhKxa0N4EBwNEOXD55YafMq+BIp3DNVgpatu
         +1hpPqQ/uhoQLsIZs4DDSGcx3kOxFnGsjSjGVt2r24Ifm6/IoqRfUX6BnaVx3WS8TDa2
         hANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412168; x=1795016968;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GnlyLNGY6NT+GSUapR6x1kGipILRzIEm/U/49m1Jx8=;
        b=MCBFur1QRHqP4DyyOSVTXwlGnxQLKF6s974L0/gisvwRjPeDDieX880gUwPtlZthDS
         GBqUhfDGf2eYbtQpkpNf/uyUyFXCbRIoD3/O7R+AM2/Cj/5c4V8v1e1pRLBq3egpjogm
         yYT5slOqr6P6vQO6Bg6SVrb8vvjZMGn9GdAqNy4gWbiYvpHvm9+5DURSZ6sqj033Bg5z
         Savxyl31naVlwz8NW27Hnh9mG/xswTFFak3GhnI39Wxcu/meICpPsd1mGFYW9lQ5lUVx
         0FwtRo9N7ExBW1gEjz0vhDKrgcdUfuibdCi5DeVNk4quVz+PlmFiivWa8kbdrAhyqw0u
         kuUA==
X-Forwarded-Encrypted: i=1; AL+hErF6uOopacVb1svCTvqvinbrnErhhD7uBLq4dmQYW4ASWgNbCxDevYYttnUp+eTO9xBufIBfko7xGoW1ras=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aKsX5tlF6EeiTAyTAzvjfj0WdJT8QBjS2Ft+8sS9bvug66/Jx
	nFh2qypjxHvugqcb/nxIQvcQnZy/G+va4WgBRu+2M6Wz5zHaAsadBOqx1Q6BKDZZWAGcKXzxkFP
	tFH49SYDdujH5c1cN/niX+Utx5s3K2FK1gY1bz/xLg49ra3dikPS9iZro24LLSePcW6c=
X-Gm-Gg: AYBFou2mkoy0I2fp6MV/kpBfbFV0i7xRtDO7EnYM6Qr3dFZTbbh+0MjKrl/6BA5SkRE
	T2w2MpMb8VE83uMfOfDBQVuDRRHxB9N9P16aN/4/pcPR2PPNHx0mRAmk8F7fCUFJ54HJz1I2MV9
	O/0d/uXjYECirJz/C9KCQLpE98dnO3iSssWF8d6mwJSe+aTOa9S3b0+VYHysA2iKpBB0F4YaLAa
	xyI8GKqSReojOP8ikWdzmABJpttaBxiBBtppxienoQBhsB3xh5KzeHqusrIxSKBt39lNTB9D5M8
	8W6EVW9KBfD+8J8mkfsRwscDG6LN4kPpH3CbFdkr3qb/COaS//vNVPaumX5un+Qv2Fa6PyJt/3B
	7u7yeI/5LQ/lEfMYOxdf+VCYKG3R9EZC5pqZ/7PheoXibkVyBQsSq+wDuM66CkhjgSM6W+Rjwm7
	ykZoKUGBOct7Nrm5YvZUDLWfhnX/i1M9K1QLBf8SYsj5IRCr0zPQAKwpF7RnmNIw==
X-Received: by 2002:a05:620a:4449:b0:93c:a468:2db1 with SMTP id af79cd13be357-947b001c81dmr448433285a.58.1794412167959;
        Wed, 11 Nov 2026 07:49:27 -0800 (PST)
X-Received: by 2002:a05:620a:4449:b0:93c:a468:2db1 with SMTP id af79cd13be357-947b001c81dmr448428585a.58.1794412167449;
        Wed, 11 Nov 2026 07:49:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bab78bsm1006942e87.38.2026.11.11.07.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:26 -0800 (PST)
Date: Wed, 11 Nov 2026 17:49:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>
Subject: Re: [PATCH v3 1/4] drm/msm: Resume devfreq from each GPU's resume
 callback
Message-ID: <wivdiwqd366ucltiodaldicdc3liy5smlidwl6ysma5kmkyee3@adxian5nmcch>
References: <20261107-a5xx-gpu-pm-v3-0-e2480408abea@gmail.com>
 <20261107-a5xx-gpu-pm-v3-1-e2480408abea@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107-a5xx-gpu-pm-v3-1-e2480408abea@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX9SIF9tYuBvlS
 mM2Ir4i2ZT+3048BgzBYEPEjE36/aKdEKyzi49gl+MS+WfdB+woiZ0YkRYZvuADXoykdPfWbNf4
 KX8cDSTQNaFrDGiuSZBjmkORvMLQttw=
X-Proofpoint-GUID: KlwbdGcEZykoqC0DBS0Jv-IVOxcHJ4iB
X-Proofpoint-ORIG-GUID: KlwbdGcEZykoqC0DBS0Jv-IVOxcHJ4iB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX1tkboo9aEdI1
 QwZytZWgBYxWPn9kiQqhnAAACeL4EqKlu/OUXtxdMcHk01YmA86xsNlOayigHlMC4SMTfTjN5yz
 uDuqfPZDLr1++BTh5DfWROFI7OpqsaAtQN65b4DZgxiImIYLswvXsa/ijDDhh48HVowMANfpWoR
 hyWYYowh7Ba+pJ7IB+UySC/YG7t3iULsUAsazSCYRhex+JkEsC6Pq+L4BtIYkNZGq7zb48rjmxi
 EIgqJPctIPjMQumAI8MZzf07Ick3Nw2rreYV0fCABvgVnsige4M8tgoRzCMV7eHewg1Y03KBPQk
 HVZ9UXhhLfFNhRjXsFV2uT3/EKpHsSBkv5gwKKGJmyXufrEwQFIUfN1WlyvXSztSKLAtYcFYtF1
 UQB819UnddxRGfwK6WzAbQXfW6IwErWJAzQlh+YHAG7gHYgFGoxmOtKjZCo93uNeiLIN4r6wgao
 oyCgOWXPG4NROoUP0Jg==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af48e89 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=gKfNi3ubWl9wpb68aOsA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Sat, Nov 07, 2026 at 05:26:07PM -0300, Fabricio Akio wrote:
> msm_gpu_pm_resume() resumes devfreq, which samples the GPU's busy
> counter as the baseline of its next poll. A resume callback that resets
> the GPU after msm_gpu_pm_resume() clears that counter, and the next
> poll then subtracts the old count from the new one and wraps.
> 
> Move the call out of msm_gpu_pm_resume() into the resume callbacks that
> use it, as A6xx already does, so that each GPU can resume devfreq once
> its hardware is ready. The A3xx, A4xx and A5xx callbacks call it right
> after msm_gpu_pm_resume(), where it ran before, so nothing changes yet.
> A2xx has no gpu_busy callback, so it has no devfreq.
> 
> Suggested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> New in v3.
> 
> Tested on A508 only; the A3xx and A4xx callbacks call it where
> msm_gpu_pm_resume() did.
> ---
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 15 ++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c |  2 ++
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  2 ++
>  drivers/gpu/drm/msm/msm_gpu.c         |  2 --
>  4 files changed, 18 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
