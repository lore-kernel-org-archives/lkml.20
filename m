Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC3F4D5992
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774304; cv=none; b=rvD9xpoJ0qtLuvowVZTz3O7pU6P8RLt+0Viuhr0pqqqdGqKPZywcppSdZcSwPKPvuBRRJXqFV7wJyPjxnPAl2Z+4wKzLKcVGeVRfQPKaNFStXIexLYEVOq2sR976E6HDJzw+P0ZTzaRMc6ILHo1gkY7kLO+Ezv1Z8dB+syz1JwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774304; c=relaxed/simple;
	bh=sne0r/MKtkzpA4Tun8W2bH7vt1HfsOeiaDBFoDhlFpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kbimid1za7VSa4plCze5ZxlwKniH1rNm1XjhGMNRlnJIDpjlIkwsHcHnQIfDm1/FSLLFTeMlZrEMaz8IRVDDCsreXfRztmMJDZ1wuJ4M+NFlpC0krPU/n34LGSbJm9aJjmU8/5AZ+A4KtlmtI6xbxUtbPIICSkxyJBkrhJA1Wc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJPtWyJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8QbeJly; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJPtWyJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8QbeJly"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8UBO3796660
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0XeiQBP16z/6q+80+PDDqmE4avHoAxEAHZJWQwfonY=; b=FJPtWyJ9lC84jmAy
	UdE8XPWuqaWr2Fs+U2eV8/QCyFXkZEBEVvgg0H7WKZvOLg4nYDohqPiVKw/dXDoF
	nVSN0pnff8rHlByEHm4vYplfJFXllLmBEmLzm1RcwOXfQPAIQfb3vpbLjoLJjRVM
	cFoml/4I9e9UUcBZvJgDa7FzYuKPIEJ64OTk9oK8rcxO+QdEVu4Q9qeIaXmqbGIi
	/xE2Nqd04rBEHrO9ojho/gFx4CiIxU4Vr5SMhcjdGcgOGvxe/42gGr/HFFdH2pJf
	+YzvVeHhRSVr61YrwFbO907pkSBvulS30Lro23POfcrw+paLp2rrYS//3jTEtkJH
	yKqCIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3kkjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:18:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4a053dcadso2060310a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790774294; x=1791379094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0XeiQBP16z/6q+80+PDDqmE4avHoAxEAHZJWQwfonY=;
        b=M8QbeJlylprAKp1ZFO/dwJHvI9sfQTzh57uIGYFnzi1Tb8V2n8+kCXTjWP8Y05TOuu
         ZLnZnl3Dy0IpkbOawMU8qgz26WAand/eBl+e3ParC5C4Hmse2HRY/49W3J2vr28IMEFi
         66AsXPwOJqY4QFtJQWz7/EnWI6KJRg0Kc/Ce8QNy4q6vSECfOH5tSZbj19I3xO8ewwOO
         yTFAcJlIdt8G6Ts3MVy+dTqR3lpF5OSZwaLPSa5RH3pxN86s6sBFWdb2QHCGqr9Q85Q/
         8eCpsp8Tg1Np+X23i7UxfMXbKOXx5P33KWtq13y2pYoV2ekQO0AEC9iseWstufqN6bHM
         MT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774294; x=1791379094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0XeiQBP16z/6q+80+PDDqmE4avHoAxEAHZJWQwfonY=;
        b=TI3Ve9R92jkJajM1PdBvi47swO687ov3FH5mIMly/gcApt/47oCNaXaNmvo7/LupzT
         mrv8DDHf+ydRpWmgA8Bqn6Mn8wLWZEnRoC4kECLIxVLLCRlBXde4w6vtHk33TfoW8hp5
         dp3WSk4izdkNnJA8YjoMZtKbZJL9b2oxB1If4jcNiiNkb4/B1Qxt7J2GUUqmLjePxAra
         kc6mMYtFKBlDCSOJZdeAiDGxv0emxmfgIm2tIaY+8eEWWqKigOZPyoDYpnk3dJPa5aVI
         oeLh4cUhYvyTgbJa3aMerM5NHrQ8sCWE8A8eLRFANH3awuOtjh8eb28Wcn7a0enkFOEc
         nLhw==
X-Forwarded-Encrypted: i=1; AKwUvBw/NiibktOjlcQJ2pdVeYF/NiKc+SLZxqJHaYoe7LH92bWhkNffSrvxg5gUVBH8vOQvuwAzDkAmh2wh6lM=@vger.kernel.org
X-Gm-Message-State: AFuF++mygezDf6oJM5Qg0PuhlId4KrZO4ehYZ77XrQWYhgoS4QXkA2Xp
	zTCcP+Ag/3zrkWMohXa/icOTpQXdmcqAvcq7tSb5PTX2rcDHsxcUpYuhQ16ns1FPz0+Few8FHWy
	5rIrPxDtFcXRawWv0B4XyiPpqGYvay9W80L3JCi3iFKWYQuvjLNp3uz/gZ6hpDNve6ho=
X-Gm-Gg: AYBFou1yBQvYZpC+83js6EcFLzII8Jt+G/bsSfd78vuBpA5l7gzzT1p5G2GBlCiFC10
	8th4mZnsfe7gKE8KU7I5mRpY2fRvvVKAdA9z0uFVTgSfM+8hDUVIGeDr8lqiKvnfDMZcCPu4llF
	0xTs42phDiUfVZDsn+csrnZgQdKYvOJnkwncyWcL57XHhFZPYqfDmxkVjm6397V9l8tSbKKCSOM
	i/NTwFd/1FORJvaFmuSVDilb8SBlPXo8WTd91JRWuQwRSgfiyIxvRifLgxzpdDhTDw/ogCYBJgY
	xye15vmZkS16vwvk56wWlLJ8OAvRiyPgR4AsVpyLUrGtzWNO/YZRqrRa1JbuVBGWW9aI72H/KnO
	Y8xfIQ81RGLHTObdst2q2sg5C
X-Received: by 2002:a17:90a:e7c7:b0:3a2:af98:3c58 with SMTP id 98e67ed59e1d1-3a4d059c0cbmr1474831a91.0.1790774293630;
        Wed, 30 Sep 2026 06:18:13 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c7:b0:3a2:af98:3c58 with SMTP id 98e67ed59e1d1-3a4d059c0cbmr1474784a91.0.1790774293087;
        Wed, 30 Sep 2026 06:18:13 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e697008asm389132a91.3.2026.09.30.06.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:18:12 -0700 (PDT)
Message-ID: <d6cb8aa3-1360-47cf-9ec2-e2403974bbed@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:48:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH msm-next] drm/msm/a8xx: report the GMEM size of the active
 slices
To: Rahul Pon <theflyingrahul@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260930111711.1160-1-theflyingrahul@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260930111711.1160-1-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rLzfobySJzX0DUBCo5Z61xIqK8NoLO1p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MiBTYWx0ZWRfX77dEHO5yYrtf
 S4Sfd+5PsewgdjwqboQH7y1Zleflx/F8YwsenIXiVrnzwecywgCWMHyA/Ku/6DUr5wflQxbjlGG
 o12VXUhq6n0S1V99QfG31w1X3ROaXQgzmD3NeaskFh64VOt4KTcLZ7I5Ax1S8REvSGrsHfUtkQI
 HbYq60on03/Rk1wFhT2/AgQ54EYYA2UZR5LW+eXDh5QljhK3xE8i9WN3xxsRTTfEPLlYBsQMcpb
 G5qqbHQAVOvG01NamkoZPQQNG4lHFpDQ9SFwGlv1GPRXauVTljTED4EZ3QC8DoBBTIOR6WjRIsP
 ncSsQ8X8bY/W9cM/LDZZfwrNex6149eOO4wWV3QHfT8ncFIRPRl7qBH3CgV+FVnhRvBGtUwJHLY
 /Jc2mm4F31dsCwFoj6rfS3XWtUPaQXkjh/icToxcr7ZhxjalqISJ4UThfRc0jSnx5wFs8BO6o2d
 vOmAl03Tf/z4pC1Q4bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MiBTYWx0ZWRfX27AY32WQes9h
 p7/bxvAZUiZlBx7y+Z4BKOD819kU+yG2r8TOyxJh8P3OfHNSW/UOYflFkDG/y5++umh0l48Lzaf
 Bf2KvCY56zBr4bufubnenxjHNjKAh+c=
X-Proofpoint-GUID: rLzfobySJzX0DUBCo5Z61xIqK8NoLO1p
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abd0c16 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Yh4zZjHgJ5e_gT9T_1AA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300052



On 9/30/2026 4:47 PM, Rahul Pon wrote:
> A8xx GPUs split GMEM evenly between their slices, and parts can have
> slices fused off: a8xx_gpu_get_slice_info() reads the active slice mask
> and folds the slice count into the chip ID. The GMEM size reported to
> userspace (MSM_PARAM_GMEM_SIZE) is still the catalog value for all
> slices.
> 
> On an HP OmniBook 5 (Snapdragon X2 Elite, Mahua), the Adreno X2-85 runs
> 3 of 4 slices (chip ID 0x44070031) and the kernel reports 21 MB of GMEM.

This commit text is incorrect, but the fix is valid. Please use this series
for Mahua GPU support:

https://lore.kernel.org/lkml/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/

> Mesa sizes its tiles and places its CCU caches at the top of that range,
> past the end of the GMEM that exists, and GPU-rendered output is visibly
> corrupted: noise bands and block garbage, across the whole desktop with
> GNOME Shell. Rendering without GMEM (FD_MESA_DEBUG=sysmem) is clean;
> disabling UBWC, LRZ or compressed scanout is not.
> 
> Qualcomm's downstream driver reports GMEM for the active slices on this
> GPU: gen8_get_gmem_size() in KGSL returns
> gmem_size / GEN8_1_0_NUM_PHYSICAL_SLICES * active slices, 15.75 MB here.
> Do the same when reading the slice mask. The GMEM protection and UCHE
> setup still cover the full range, as in KGSL.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Assisted-by: LLM
> Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 4 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 ++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index add93c1fa039..9b95d9b3826a 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -112,6 +112,10 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
>  	/* Chip ID depends on the number of slices available. So update it */
>  	adreno_gpu->chip_id |= FIELD_PREP(GENMASK(7, 4), hweight32(slice_mask));
>  
> +	/* GMEM is split evenly between slices: report the active share */
> +	adreno_gpu->gmem = adreno_gpu->info->gmem / info->max_slices *
> +			   hweight32(slice_mask);

Please add '()' to improve readability. And it would be easier on eyes, if you
don't break the line.

Also, reword the commit text to exclude mentioning Mahua. We don't a partial slice SKU
commercialized yet.

With above updates:
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Thanks,
-Akhil.

> +
>  	/* Update the gpu-name to reflect the slice config: */
>  	const char *name = devm_kasprintf(dev, GFP_KERNEL,
>  			"%"ADRENO_CHIPID_FMT,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 5832dc25d6bf..dadfe4c69438 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -379,7 +379,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>  		*value = adreno_gpu->info->revn;
>  		return 0;
>  	case MSM_PARAM_GMEM_SIZE:
> -		*value = adreno_gpu->info->gmem;
> +		*value = adreno_gpu->gmem;
>  		return 0;
>  	case MSM_PARAM_GMEM_BASE:
>  		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
> @@ -1205,6 +1205,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	adreno_gpu->funcs = funcs;
>  	adreno_gpu->info = config->info;
>  	adreno_gpu->chip_id = config->chip_id;
> +	adreno_gpu->gmem = config->info->gmem;
>  
>  	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
>  	gpu->pdev = pdev;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 114a40f79ef3..8e6a88103610 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -204,6 +204,8 @@ struct adreno_gpu {
>  	struct msm_gpu base;
>  	const struct adreno_info *info;
>  	uint32_t chip_id;
> +	/* GMEM size available to userspace, see a8xx_gpu_get_slice_info(): */
> +	uint32_t gmem;
>  	uint16_t speedbin;
>  	const struct adreno_gpu_funcs *funcs;
>  
> 
> base-commit: d33622598496c8994c35ba0a8a913de064dfc1a4

