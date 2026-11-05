Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836972;
	b=D9D1l7oUq3ddP4aC+vFb+0cSsUBGHq6tfL7R3xOYZXwxdJXubCINa6bufzv7HXK7ftKZ
	 HImj7JdQo84fAnr+XmFLzxA/LPQYSdKUNP2QqXhQkA7gynuWhGJTCOLSp+IhgntQ1iosP
	 196j913pkYEPNzNsffnwVdbvk/jsP7p9LcQsCP2Nq2SQYrKV9dL+lzSvQe64Jfo3G61ON
	 zhqRgdLXw5ttOzDCCyntplDBsArVX9gJGLq1IQE5NAaHbtfq6A2ZMKhrLAdOxhdX1PV67
	 lt3q4az6gdzS8kAIAhEoV1A+qiO1PwX1WfCWHYtiQYaP0ldt5EoQuETqT9IMlw0o6og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9RSuIZdwtYVcc2DoJVsmwG7WZuhihyHHeboegvG5hKc=;
	b=bUFV2IgP2szcQhTDPfar+S5ipVM8qnGpSNhPNbDhETchw+71z2+Ku8aw/fRUjGkR+p1U
	 XiohaUK6C46V/iXFGh9W/A7hCfVviK/D2ZhtznHkrfvG2ebOZL6qoWAsVxgosYU94WNEL
	 MTyhI0QvV5/LuXP4EmoHuUONIz3fo1RgF1CZEunllFiXsrXC40ZRSeevZlz9uL0+twjyL
	 I2DB3s9tYS9CkDxHUCg5K130DtOJgEDrmnjiFlKvyFBbMAFON4kHFnX+hu4pe0A1K+fMc
	 K6Njx+FPLVeG/G0Am83wvM4Eeet+K3WCGNEUjd1iC1KtXsfWdyl0cDNakF60OQ98vgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUZXkwZA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="d7n/ri6f";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37F7606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E37F7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUZXkwZA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d7n/ri6f
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4MvaeI3033204
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 00:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9RSuIZdwtYVcc2DoJVsmwG7WZuhihyHHeboegvG5hKc=; b=AUZXkwZArcmvGexQ
	TQZmhATI0LtBwQwk7FyA2OyzObTgrdFIhZlSx7cVLhcg8Ds9mjRWwJ/b9xNyXr+C
	7ZrhTuEpB41c4slKvyCvJHCrJzTtkK0IyNUJ9dnFmYgSMLK5SsPQqorXZKOjXM1I
	7c3ZjL/PVtlhByF/694QQf2GFBtJntjViy6NCyd0KzFwEzEniE0fvRhuH0YQZK6O
	o5iXSc7jPRqy3Hug6r8vN6pUFKL+ihL29AQl4U31u53iSDdVlXS1CQe4a0nSkhZq
	iX7ayF9VfQLiq8aO30aTqO1ToqNH8/YUU/2VrYc//7JTr6uEWoVxt88flUeoQVah
	yaY7KA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv1nyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:02:50 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1af203073e0so2140920c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793836970; x=1794441770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9RSuIZdwtYVcc2DoJVsmwG7WZuhihyHHeboegvG5hKc=;
        b=d7n/ri6ff6Qus9T0jgCmCs57uslm6jG7FtBDpISYK9eEIaoNvZVrKa51QjoCt+MWoG
         2203nwhnCsoPWB1KpqrScrHBJ0EQj7SrN0GbP6lrnpoiLIsJddhujt8QM3IGTVeyba73
         4d6vvV8Pw9na0oo5wxsoOYEMXye6pnvkLDUSdO0qyPCaJIv9BWVYVgc6dn08YroDj1Nf
         THVG2buJh8+9UW3pdDvfIzHQzTCLLtWUfHi1Gj6Yeh0X7GekUfcSGIfhoKltZLBijXNN
         T6it+1pUvAE4XR+p9MmtiPFVrh/eKYStmvE9zONBJX8qbtA9xzn31blhxT6VfqUCokUz
         xCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836970; x=1794441770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9RSuIZdwtYVcc2DoJVsmwG7WZuhihyHHeboegvG5hKc=;
        b=U+TWX26SSN9pXXgyrHwC+P0rQuiTG3tbYvMI7jMN/q5xd+KdWmGrgnL23fEDlGinjP
         IhWFJNAaXYusbTI/TJMiy+wf0yividoXLwur+nk68wzVenyF4qfkIXn63AxAHryqI0kD
         z6vSZq1aTVliWHaN0f4e0mQjaW53cyXqVZ8FX6ym3LbohqUVhS5gKdwYyBLeWSH3sgrz
         mPN25evegxPBFyd1adhmaKJKwuI2Ps+EsHH409uDARZjFn006pGg62rg0xcXVd6Ey8B9
         WZpWx/jGOMchhM1Lhg01RA+BQi8iu5cCIt2PhsqJudYIIaeXithW5jBlbXLvM5oYBfZs
         67LA==
X-Forwarded-Encrypted: i=1; AKwUvBxlIRmgEAUMf/bGLe6hvV0egFQJ6i9m2vQLQe4VzG5IEqGygNSEyP5llp43iYcliuh6sBGLYr1YXvQ64ow=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rf+yA084zBGBrA43A+GK9m0afEZPAuvvjrGS6GHwAb/W1dlvd
	pvxSbswiTEuGZ2Q4fh4FvdxRhMZ2ubRhJrriKF7B6vP9s6GGrJy/3vW2q4wxA3gZWEO//0jjZsc
	Zf2wzgvUiPLglFHV2EFdtMmkxwNo4rpB4DGPrgFZln8dGgR3fXVrXX6YgmUOdJVC1FPEn7Iwfn2
	g=
X-Gm-Gg: AYBFou1VxXHdI8dkASXjpuMbgmeEURhrFKxh3CIgV996br63cU7pY4309Z+mhGBK/Ud
	E/rT40CZg/7QaEfj+BRFybNzLMYQWb4mn24ekHih7hyTm0ECqvAa6RCf7V6gY0ukt16Q8kX91tQ
	Zc1niZc7g5frglHR5fm1UZIWu9rOed6HK4smOuiCPL+Qq7WWB0S2vvqmD0NCXvwFb7m4y/Oz1MA
	WGmfQ0TyVTBzq38dPu5gF0bYiiBeSGVDt4nMr81nQxsAjU4t0U7KoPlf0WVb18okL12zzpdA5TN
	ir2wkNAgaYT1rKTnLH/pBLvz/C1COcZihUIWDrhRcN0XkVuSJuzI78vJzL0DMAQ63bl5mWs5Xz4
	KVzVBYPh4yJ+sSm2YRC+maLmPZkpLZxKoMzptn17x553dA2RyFtXsL2vpEhDF7DDUNGxn0H0=
X-Received: by 2002:a05:701b:42cb:10b0:15b:afce:62c2 with SMTP id a92af1059eb24-1ac5fa237f9mr26890377c88.41.1793836969733;
        Wed, 04 Nov 2026 16:02:49 -0800 (PST)
X-Received: by 2002:a05:701b:42cb:10b0:15b:afce:62c2 with SMTP id a92af1059eb24-1ac5fa237f9mr26890329c88.41.1793836968977;
        Wed, 04 Nov 2026 16:02:48 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b8822fsm13232698c88.2.2026.11.04.16.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:02:48 -0800 (PST)
Message-ID: <4d24ae8d-24a3-4ea7-ab94-2b8886668428@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 05:32:41 +0530
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
Subject: Re: [PATCH] drm/msm/a8xx: Fix 1/2b alpha filtering precision
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danylo Piliaiev <dpiliaiev@igalia.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261104212048.21010-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261104212048.21010-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aebc7aa cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8 a=mnaISKIp132CONEVCwcA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA5NCBTYWx0ZWRfX0eo9dVGidPcE
 I5aHCuNwttC7QCyGrV/UT5sWO8OjPxFXSqcjdw1Eu4NTbfLQdZWNGIdU53vB/ITavRD1AnDK73c
 2TFCGmt4GbokDK8giLUB31Sp9C+YKec=
X-Proofpoint-ORIG-GUID: U-zazxkd2MWpP4pECutlbV5aK6DAHWpY
X-Proofpoint-GUID: U-zazxkd2MWpP4pECutlbV5aK6DAHWpY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA5NCBTYWx0ZWRfX8IVGscdvRTP+
 RGCixSHD6lyW+CqpoLes/4K/GSNm3FkJxKDSLe1UME3UHTB2XUwmJqVsurQy2ONjRYWpyQG+Zcy
 2EbVGtEtfozIbqp11GqNAW4fRhq2rS34hghL6TK4/Jn+jLeKvuN/m/rjcitcZJKQhm4Q0QKRfAc
 SSTL/yP6S2BX112BQLyotoctFc7DL4Sl9eVqBYIL6ipkTdNUypiYvEKjOx3DInpDhczF7xmfjJU
 uRkik7y/YzWkuErfiS1CrpOEzIVVyQkw4EiWXpr8Nw7u7BijtCO4OcIQbPx6vGRqK7VjLhOyCye
 3QWpdjZYEd4MMzc7VfrKsYJJZYk8BFnJ3xg0hmLmmUMJ4sGLzPVOuyVAk2p75ExCZdZeKLYrZZf
 xwwOUCykSWtgBqhRPk/AvaKfCQIojcwNiLmsXdydsEseMDqfsjnaOJJ1kGO8v8GN3MbgsnMRMf3
 B08VlAascDdoJUJCGzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040094



On 11/5/2026 2:50 AM, Rob Clark wrote:
> Need to set b25 in TPL1_DBG_ECO_CNTL1 on all gen8.
> 
> Reported-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> index a7d9ccf26493..510c2f6017db 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> @@ -61,7 +61,7 @@ static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
>  	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
>  	/* Enable cubemap small miplevel optimization settings */
>  	/* BIT(26): Disable final clamp for bicubic filtering */
> -	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000724, BIT(PIPE_NONE) },
>  	/* Disable tag bank id hashing */
>  	{ REG_A6XX_UCHE_MODE_CNTL, 0x00080000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> @@ -297,7 +297,7 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
>  	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>  	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
>  	/* BIT(26): Disable final clamp for bicubic filtering */
> -	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000720, BIT(PIPE_NONE) },
>  	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> @@ -397,7 +397,7 @@ static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
>  	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
>  	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
>  	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> -	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000724, BIT(PIPE_NONE) },
>  	{ REG_A6XX_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> @@ -630,7 +630,7 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
>  	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>  	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
>  	/* BIT(26): Disable final clamp for bicubic filtering */
> -	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000720, BIT(PIPE_NONE) },
>  	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> @@ -972,7 +972,7 @@ static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
>  	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>  	{ REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
>  	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> -	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x02000720, BIT(PIPE_NONE) },
>  	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },
> @@ -1030,7 +1030,7 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
>  	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>  	{ REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
>  	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> -	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x02000720, BIT(PIPE_NONE) },
>  	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil
