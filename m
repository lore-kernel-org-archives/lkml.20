Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914714;
	b=HIcAIrUXspf58Xtpx/3Tvd+9AOBEXEwcSuGT7JWZwJJpuL8+GuxBjjj77SozhDw/VxX0
	 TSaOHHPTdRUQqXyXFhzuwIyYy+t1c0CmCArKETZnW4NJA602kca2Tpp9rkNlgNoF0p1cV
	 9rwfVckbqzToI3+K89VQJMJJiXCMZeVBR9E3X7o3r2YPSduk+Q5ki35PsYEPWCTN4yJZ2
	 GU9klWzinb/1iICebkXPxAjTKiyM465507uFI+GgmdI6D17Tnux5jxTzCekRaKLemtIgE
	 Sa9cl25qGhvcjEKyFWM79mLHtHcBp6EVYnsD5csPFl35ayseRGFOA/gEBf84mJHautQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GLUyA+JdVk9Y5FHBpmrNpe/SRtKzv7LV1qnsCQhdxLw=;
	b=pLar9GvRANPc/SoJ5Pgo6jcc+r09sXUAjkGUZyWVKYPg82P4jHMMzluE8UnhSY/fYf1S
	 6FNy1pcqjJhRgPNMTR4FVniTGDybmGQPiQyrlZr0IRYZ0znby62xw8kQ4cP5ftLdFu/Aw
	 y9ZVPCU96AycorpSggLqbylpZLtUrEYANyA7LXphQKpjcb7PZbB4PAfIFqXqmSJnjlqrT
	 RoHPDpJp0IDQxEWPgBqL4ZbgtJU+nyjs7m+ARp6hdGu2jp5DfAXRlPHWLUuswe8IFz4f8
	 RvndqZMN0JHE4W7y4i3biO0IDmJRE+gAoC4zcsIbglbV864ugjkO9d+GqBiBre1FXBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="g/9yJ1w6";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GnJC3Kn/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB3F606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB3F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g/9yJ1w6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GnJC3Kn/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L6H3D1947946
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 21:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GLUyA+JdVk9Y5FHBpmrNpe/SRtKzv7LV1qnsCQhdxLw=; b=g/9yJ1w6xyus8CSG
	6GreSuiJmB/RUoe5sKIVIVElj0KgJ7ld+oQcBgna1Qsvs9zMXvVNtnpT/TUVslzi
	SB6Z7JWI62WSfj825jlQATQ6NN3fViOZXXhAd8ZpGbsGrHhvLl6GlBp1BYa0n65W
	d5Zpu43GzSjkSHDmpzfFbBlSDmWimMecYFt8HsYtqY9Rt72VdhUoCh+x2RjczMkL
	Uzk86BXgBh+gHuDY7vWb1ASZUXYSuIQ03AsToxSt5MawOa4wL95tFLGwRxCJtZvl
	2QevwuGApTsJPN4dKJIH2dYDDLz/RStitsEjQpor7JgKYJ4raGrubZZfa52vOOvF
	PPix7w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaakemm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:38:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so537581eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793914711; x=1794519511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLUyA+JdVk9Y5FHBpmrNpe/SRtKzv7LV1qnsCQhdxLw=;
        b=GnJC3Kn/hxqGO4kVVYhguyz8ACGN6W2vkcvQc0HbDD+uvR2suJQugxeiiPLTvtNN7e
         NZWc4rWHudnn0PaJEHMK54HKIO+Kj4Ljz2g/SyuYLtcl9j+yQYM8MhB9qOdsedE09MtV
         zJYBbP5msf6KoBvPT6wyORmh+PA96R5tTCvyjVZxvx6PBpcHpwvtVSVEJXAvIbiejfDt
         TPNlkgZdGl7VMMrUTVmfksGo9ftjT0pfYGWrYUTW2+Q8bgRt7X1QCHfKtBaUxipEqW+X
         vATfZHLkH7OWFZ8Ppw2/PpGOREp+wYvIw7fZJs0mnYHFOU8PWdjntF+wEgYEFCi4qJtV
         19Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914711; x=1794519511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLUyA+JdVk9Y5FHBpmrNpe/SRtKzv7LV1qnsCQhdxLw=;
        b=Ffgt8dJeWqkrN6hOiGqRc5c1pZLWU/nXsWUog5d7inMzmhRQZpFbaRywFB3RfiXXM7
         0lTvm8hiQw35CEQO+4qFTnrKelIr2NZdkUfH47iZW6d3B8pied7jq+VnVmQAS1Se9SZV
         /qyRikxrXXfnAAkuk6zorcqixPJ42D+N+fkliWjb1RkhnChNWxjKv2ERzmp+W14NL+kO
         aQj7wDdZHSmhhlviezk4xkr7bEMGak+tSs/ZvFY4G3meHBrROCL8F9GvHDzXlzzT3hF4
         P6OpFJRpSRmqM89zKsPTQ3BM2G58zeJ9zqtr8tazEwnArimWrMi13hqRENZTk8IaH5bq
         LT5A==
X-Forwarded-Encrypted: i=1; AKwUvBx/696asdPej+htB9fyiXNkCXC4pJqPqnRApO9i70FYZ5v8ZeU/fk89/vwUyZeo+wf+9iW8lQ85Mga8YP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v0voxshnadmXUSGCWp1MxeYXpuTs9RL/rDHc3tQW3wXldaajZ
	UFBDuJMrCmHifZSu1dYRQUZXdYN3SvFldTo+dlmurOBeLTw4L0jhwySePihp5V40PzbWwRd+nP9
	jel8jMWqUeCMrnG/OKN7Qrx0sKdyHbwO9N19NBgOKWW5q0h5V+efRK2Hcu6VNtLAFEFc=
X-Gm-Gg: AYBFou3txtehwimCPbb5irEPoXlnDET3XeQmRJzoB+I2c5LP8Zn0xTAKe3OJ1HLc98t
	pgriUlEnD8vvXFIr0m36zQ9WyisWp6lLdWyQ6mVyQUg8vd+c4kPy8HSO99MD2VthHJEtRNZ8iiW
	kUhL15117bZgOFsMVxyyybJoL3ryyzg9W4wOMdHISTtTY5qohxbQJYi5ZJOk5fPQw1CnO+uidqS
	L43oMq3rPiCVC/J4VtRB0gtO5j6MsK/+61owLTPscZq1Y2nYiTs1mSAqcHOF+G5U0BcMox+0/ec
	g1Pu24vzDuPKgMR4HBMSc5qKzPgrJKEx02vXbnEEmWzVNWkQNvCnabuh6qD4fGxqhwD98Ll6ipz
	64n6UDt1fczj57An78l80E71u1CDmzLQnuOOv3Ee8tgDDyiryo6lJGadzgDOY9tCThfLnkGk=
X-Received: by 2002:a05:7300:ae81:b0:36c:a390:8907 with SMTP id 5a478bee46e88-36f7611e32cmr566804eec.21.1793914711227;
        Thu, 05 Nov 2026 13:38:31 -0800 (PST)
X-Received: by 2002:a05:7300:ae81:b0:36c:a390:8907 with SMTP id 5a478bee46e88-36f7611e32cmr566744eec.21.1793914710521;
        Thu, 05 Nov 2026 13:38:30 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f73e79e93sm902327eec.1.2026.11.05.13.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:38:29 -0800 (PST)
Message-ID: <76517f11-c6d6-431f-89da-e49c21f8c27f@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:08:23 +0530
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
Subject: Re: [PATCH v6 03/15] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
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
 <20261105203057.66520-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfXzy2W7Xfrw5GQ
 OHsXd6pDo55MwsQvUfzLGw1wWc/Tw4NSn9AIODSFYZWMOAww7Aurq/OcBKD+TItvWy5R1yJDGVt
 1r0oi3aSTp9U/Bp2BLDupNWtcvdim/yPEW/cAXed3lsjoGUbzhvK0XKYnhNrKErSM4meaP5rjFw
 Sp83yTqxCYmI2B7v1NV4+lNwQFoAn4/S06gnS7L/8jTubeAQtQNZyj2bQQ1Wcgz5AKRe/rh4RL9
 w/TA1qlgkZ8De05ssRBOwOCiGDfEeDs0i+bwuhNAfkuX3c0XWimJTyBpfogWmSs8hjymkAirtrk
 yokaNCZ5OMlT63vUw/dkcYYwkIHMi8abs1TydTZOjZ047NGrIp2ACPQY6znMhIFZk1Up+rwruju
 j5MLtr9dRXbHsRC3dwodusAF94/kKicg+KndRvEbspWNYrkhQsQF2up0Vk46iiLl4hAm54zAkRX
 t111dwCwCheli8hkWAA==
X-Proofpoint-GUID: LamrJ4vY2qQCYFFBMPRZ8z_6ca53ZO4C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX6BKuufJRtX07
 gL1OOewGpq7f4DZDvppxDhQQIs36J2MByOy0q8UhngTyN9C682DRvLzhM4cahn4jGniGmwohhij
 EY69gE6yYib964EvRIhbzj1nqb9gwFI=
X-Proofpoint-ORIG-GUID: LamrJ4vY2qQCYFFBMPRZ8z_6ca53ZO4C
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aecf758 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PMOyc5WQbjzFEtWUSz0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050086



On 11/6/2026 1:59 AM, Rob Clark wrote:
> The snapshot code will need more control, setting additional bitfields.
> Rather than add a list of additional args, add a helper to acquire the
> aperture which directly takes a reg value.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 21 +++++++++++++--------
>  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index c58a2665e9ab..e6ec85b20fb7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -346,6 +346,7 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  int a6xx_zap_shader_init(struct msm_gpu *gpu);
>  
> +void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags);
>  void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
>  void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
>  void a8xx_aperture_clear(struct msm_gpu *gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 82cddaa7278f..be81f141300f 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -16,13 +16,10 @@
>  
>  #define GPU_PAS_ID 13
>  
> -static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
> +static void a8xx_aperture_slice_set(struct msm_gpu *gpu, u32 val)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -	u32 val;
> -
> -	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
>  
>  	if (a6xx_gpu->cached_aperture == val)
>  		return;
> @@ -32,14 +29,20 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
>  	a6xx_gpu->cached_aperture = val;
>  }
>  
> -void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
> +void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  
>  	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
>  
> -	a8xx_aperture_slice_set(gpu, pipe, 0);
> +	a8xx_aperture_slice_set(gpu, val);
> +
> +}
> +
> +void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
> +{
> +	a8xx_aperture_acquire_raw(gpu, A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe), flags);
>  }
>  
>  void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
> @@ -74,8 +77,10 @@ static u32 a8xx_read_pipe_slice(struct msm_gpu *gpu, enum adreno_pipe pipe, u32
>  	unsigned long flags;
>  	u32 val;
>  
> -	spin_lock_irqsave(&a6xx_gpu->aperture_lock, flags);
> -	a8xx_aperture_slice_set(gpu, pipe, slice);
> +	a8xx_aperture_acquire_raw(gpu,
> +		A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) |
> +		A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice),
> +		&flags);
>  	val = gpu_read(gpu, offset);
>  	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
>  

