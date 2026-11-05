Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914344;
	b=yzJmyPSXi3yfuYpLytgsiGjwhT57E1479fs18sGEYoEGP/zkyMi7rRT8uHPAviWSVF9f
	 0+oeLi7kzk4TIStbgN8UYIRfDtAWjBK+9otwEQFT3wsInwoCwkOo+OgJ75Q1BC4WgCcKs
	 R5jNOI16veje2qz7Rli3TpA72Q6bhprUG6lIgGdAK3yqL1gdduBSjIgNDGxlxOhSSvCrZ
	 K2DXDZfseCWWU+0f1+fVoR06ZYJwuSjoKFagR9JUBvHTEze16w9WF3uOaOs3YDdu0S66z
	 VLmy1xvqScvOSb9A5QKE5iABjWRpzxoYgKd9HC2ZyRuhy5Uzm0yYoeNcsOPjLoNUs1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mHNN4UGYk4f7WxUC5WbYI+QRTZfXHOpEwWQNcGzXGsQ=;
	b=Wl/4zXhbRofcuNKIEiowt0vznRvMNgaFeao0BLkJlzQVh+8NnqL2NOCMfTXyJ4sl1mOo
	 ycbJbk1jzhp932Yesbizf898GJKQFLLDhWzHoDl9IR24Y5hm0u9/fO67s8sutZfoToXBI
	 uwdgP+YyVz7biJ7RQDkh+xo5GqInUmJVR2AlZJV4qrOuMEW8ITEsH1SL7dO4YKail9awI
	 RmckBeB1104jefiaTkThBi7PREkqW9FK53gIkxDMg38ItQ7cR4ktYsi9DPAUaPKc5wYoo
	 6OIHWRAAKhZlw132g5wT/UV3OpkD+IncCWLHllSR3QdvmrIjHjX35M/HzVgtSZQI0bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vg6n9+Nb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyjncdJY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CD4606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CD4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vg6n9+Nb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyjncdJY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L69q6984536
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 21:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mHNN4UGYk4f7WxUC5WbYI+QRTZfXHOpEwWQNcGzXGsQ=; b=Vg6n9+NbGZTtVHdj
	Fz7wYa9/FYcyzV22b/1Gg82MrUzkIbdIZmOWOiV+6e/ghF3OVDd6TM+1o3rpdmqX
	9yWlE5N8F91vnpvAozYHL4nPABbkacPq2npUzkH+Zv0a1AcLPmkHC/e2Qfz71FOS
	wCpHILOloAPNxhhbGU1ByUvH+WTMUsm6wO2Ts1qKAcof9FTEhiuh1cGDZbWYu8wa
	HaelUJcU1M70JJDABgwx0W9731gYoPin3mM5O7pWXAKMKiEVujaARKftk9Y82Ndv
	4blXjOTnEuf8gzVqzRnyigSOW+eWdQrKZ6RMUXsXDT6J85ncVEEdLCOmFyl6i8bF
	+PMHMA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvp8gj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:32:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso1687022eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793914342; x=1794519142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHNN4UGYk4f7WxUC5WbYI+QRTZfXHOpEwWQNcGzXGsQ=;
        b=gyjncdJYRsY3wOI0izFyUFBlQTlocziFnU1Xk/U7vkO+mSy5hThtFmE1anNjMTfrnx
         ZlG8NcwTuQHJiJWQtTNceke5QJzQ1wa95RXrbt45ysxm/GxG+Q7WncbtazxOFrHGWHuj
         qdArpsS3d+3Tzx63nmV+nye3JfVxuR6Q+HqknmRtojb8DA6Bdwu1QM2MCqwLMYP+kdiS
         30cJ/JLonmKbTLKQQ5PBadBzMM/98Y3rGsb9mOByqx2WsYbKsHhfpIIHF2GNn422OAxz
         Jj7wBGGOW4U6sGzJbNGVkEIergMEQ0r1V2hVEqK2fdJGBo1tL7yjVnwFqHjVkb4WIxZd
         gYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914342; x=1794519142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHNN4UGYk4f7WxUC5WbYI+QRTZfXHOpEwWQNcGzXGsQ=;
        b=PeakF+5bazBWKt9Gbx3xwFZ8U3mg7uvDOIFWEFzapQ8RRgDgLVwb5WHY/btYNvVUyc
         DbzMbBhsX4KXiHvCWqeLSbiWg2c8Nlk497ZEuGXlHgkjAxVJg26OlyrYlwaRTEmymonZ
         1ATkSc/DFM24ye+V3rN1nJSqqtpmgK0P9h4AiZ8p6AVQnx5bzqIRs2Rsqw8/7oHkj3Vf
         kAjkGDtSMA2PHwkfyf7ThG0uvONh8kbuAdcCxbDrmA4FDzaqDmoosgXoD5/ULRu5pWfB
         GUrz2iLWYoVy81bkerDJPD7o3NQlnp/8yK7xIOX0OGHxsdWXqfuFYmEfi8OnbEpZvuuv
         O9dA==
X-Forwarded-Encrypted: i=1; AKwUvBzMWegY0R8mMFs2UK0IZQk6CTF2dYPuId2NyjGR6/VEYStOBPNsxA9ADlrItW+XDzvvAocID5Tn5SZzYsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3XSIMItGltBtA0znWbwEAdInlO6ScJxjyZXmc7UKXlgCdaQ9I
	iA42qnkCR3ONfbEFEU+j5tVgsXbOM8Xs9Psw4UV9eeIjGcn8sQ4z73DwSV2ey98HYdWE3ozFbdx
	OG6e98WOkaXPiAAnDj6tXqpaQbhb9smvXnARpQxIXa4kTG95yP4styFUVGhZKLvy0ghY=
X-Gm-Gg: AYBFou0k99rmzDVAdMAB6OXM4pdH/kJEekEf1wfCv/PqgwqulOIrxA1AnzBMX9I31qP
	JyNKXnLPnZN4VVMeQE9jfon3wiaM0t0bGLcuYpl79YAQAYG0Hbyt0MvLAtHpC2/8SQWBa/LW3F6
	GEFU9awUH7dMpRpiAcWGMM3fQfL2SkwatFfb1tAHSvYPia/fcRZ1IiFweuhEQeGuOmajPdbmM2Z
	hrNBr4l4sf4qXT1GCXtmQieAD7oHvdeFKjyI4vpuTj8bqlT+o1hI87XOgoF/Gq1gRJEC40TKhHl
	0+LrA1x3PwL8QOhWpPOL8Puc+vvFaDvyiCm/vZTdAsLNW78jzZ/6EhoOb2BYkdbTtjH29JRFs0q
	Vc8sksHtNBWBNn6odGMkihkKP+2h74CptylU2++cyLUegrvvzyOYJZCUVIYgYGNxTxQW98yo=
X-Received: by 2002:a05:701b:4552:10b0:184:ae11:51c8 with SMTP id a92af1059eb24-1b24f4e1984mr4785369c88.23.1793914341035;
        Thu, 05 Nov 2026 13:32:21 -0800 (PST)
X-Received: by 2002:a05:701b:4552:10b0:184:ae11:51c8 with SMTP id a92af1059eb24-1b24f4e1984mr4785332c88.23.1793914340117;
        Thu, 05 Nov 2026 13:32:20 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm22496768c88.22.2026.11.05.13.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:32:19 -0800 (PST)
Message-ID: <28a3a810-dc7c-404e-9fb7-35bb2daeac15@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:02:13 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] drm/msm/a8xx: Export aperture helpers
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ib4Symqa c=1 sm=1 tr=0 ts=6aecf5e6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AFLW1XQu_-GHGceg2_QA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: vNFwyRFu_UtULO8FpXT2ykfRwGy2rECl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfX2CL42LSJz/ny
 +MzVRujay9ScLkw4+DEoKuJovnW7x2MgEdo415cgYmfkEaizzc9+OFHNXEpd/zSMdlSpruG5MMn
 uNLfTv2a4eepRqXJNGu9OLkcb4nopEXKwQfFKAe9+mCvOCvDK342gftjT2ZKPpkQZEx/fo6iswG
 mYk33PVqERqJLGgtkFN3ZUVhJp92qp1EL2LSuqmilpAQQOYEABlG+oQ+YvsWG85lciQPzSm/+z8
 oAKSoulQ/Q30D0yUWz61W+qXoDTLczgrrigAFUwHhRpl1gx1YPwpPAxHx/HopTKbmKAnmuzzSKs
 b6M4O0+Xrv4PpEPWFJ4YQBy+UfJrMT1qV7yF/NeNB7BoIBvUGXJXT0DaS1CxNxr1SUHoQ/VL4HQ
 OB6otV0q8YtAvE7LIYtvf6epWHvR/K/I9oSQtqGpeUrd6efyUk4uzfXhR2M/46iEETWWtUVi5gi
 uQ9FcR74s0R9Wnk/yhg==
X-Proofpoint-ORIG-GUID: vNFwyRFu_UtULO8FpXT2ykfRwGy2rECl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfX5jFW3vrvW2WO
 3+Not/YFtvY2z1AzsEMSV+3eCSh/PTvovWlCEPawZm3ehH8Jpn6o+IpEVu0WD8DC/WCxInJ8MjF
 M2o80N2G1SFtDCEPEXuQUrfqaLRXUXw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050085



On 11/6/2026 1:59 AM, Rob Clark wrote:
> We'll need these from gen8 gpu state snapshot code as well.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 3 +++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index ab4cb43e4a54..c58a2665e9ab 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -346,6 +346,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  int a6xx_zap_shader_init(struct msm_gpu *gpu);
>  
> +void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
> +void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
> +void a8xx_aperture_clear(struct msm_gpu *gpu);
>  void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
>  int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
>  void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 25ee3ac16ed6..82cddaa7278f 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -32,7 +32,7 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
>  	a6xx_gpu->cached_aperture = val;
>  }
>  
> -static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
> +void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> @@ -42,7 +42,7 @@ static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, un
>  	a8xx_aperture_slice_set(gpu, pipe, 0);
>  }
>  
> -static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
> +void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> @@ -50,7 +50,7 @@ static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
>  	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
>  }
>  
> -static void a8xx_aperture_clear(struct msm_gpu *gpu)
> +void a8xx_aperture_clear(struct msm_gpu *gpu)
>  {
>  	unsigned long flags;
>  

