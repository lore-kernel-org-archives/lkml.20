Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572177;
	b=3ym6CS6MqyTvIsc1/yt8AUOjAFS5u+i5c6dqaZDht/aoeBnPlak8GQ+UJhOXMFVh1PN0
	 vFx/JOo0LHtTRjRDKifW6/EaaSd1vT+vU4/JOYwQESZPlTgwyZsDuq0OB8afEvnQ8jOSg
	 7xXw8Vif8bHh1I7JiIKlfYZRHo0ksWl7SrS7QLCnAxEiC/ueO8s5R1QBtOqchVjqNOlsJ
	 iK+D3afSVALeS0R/8UoFUYxpjnmAMIEK8x2lun6yIoRQba1sw3Dc6iSD9CXxzb52z3bHO
	 9rM43Mu1gQ00BDwNhGMo0Vrd30EgsvPJAYFu5mdo58SKjGimZKXpetQWSaM73d1v9Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=egoCefaEWBE1zHp2Q49ZFDFGmYZgTt9yQigi8gi4k1k=;
	b=r4yRSIFaZdmCbKwyAKv40GveQeOzV3NGEbiPYwT7qM+8yPeKCoD6llTX+TZMSSPZ/81y
	 UkqB6x6l/gy7MhdLBVbYHfknqDyy9R9JCaehfWOW8a+zZCC5JKgoCMI9d2M6OdQ4fyXRk
	 0KiQDno3Bh7Zu11o7BxzPXiE+xYBdkpZPlGKbpr06fQu6N/tt8mFWaCaZDj5+CXQJVHfp
	 8c1Gst7X17VG7cNQpkBbkxPfwi6ge67060Px16XnCKAOV95tMEnlmyJl+cU4doicyRT3z
	 v1GHwskLFKLdEtA6n+M91VBKfkIrI2KU6gu9Tan2arOgMvXsD01VdriR6ZKs3S5F/1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mfbOFkqE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c9EoSeUD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DFC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70DFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mfbOFkqE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c9EoSeUD
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jEpR3712419
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egoCefaEWBE1zHp2Q49ZFDFGmYZgTt9yQigi8gi4k1k=; b=mfbOFkqEFPZKslLb
	0cI/K72Sm0bZ5x0mXtPHd1EPwDqDrUHWxRlnp3DGmrpFaI6NCTVJNxQd2RclIx2e
	fYkwvZLeykvYsqEaiE9mJpwJmKafBSLNm+Tt5F+zf+VrbfZUGSKAjlUMQBqcwd9B
	JO5nly5fFAm/VOmj82J74rI1eh8ZLuFX9zaeO9B3Fn13p//YBY0SGqlvveQlB015
	yG2hkPgBUqbMcxokXZcdEgiGYwsEITvddfMY7MqTXuKckoQlYg6FIVWxDkjfNpBS
	TJp+677JlM3a5qRKPdL/pJxEg6gFzlnKhxUWowKm9ysximAVj7uXoucjvtCme6b7
	TLL6vQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v31mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:42:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso15224785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572176; x=1793176976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egoCefaEWBE1zHp2Q49ZFDFGmYZgTt9yQigi8gi4k1k=;
        b=c9EoSeUDodOC1d+gZYlly1Yzk0U6WBw5Zs4vFomjqT1JkiG7Aan2lBXQkOvZy84LPq
         GbAsFVZQ4Q9aC7nv2U0Ys2f/D+D8xC7LrJn68S6Np2C1mrGGDfTX2wvrH3ziWhvU62sZ
         rWy37LwiDZS6ew5sP3G9OPuhyPE8Y9hWbHsKK2bdQXt1o2c/yHzdKffM2JjvjoHqsri3
         /TydudmwAf/BNfyeQnk5t1TRdzzfOTl4kUq80bTkSvjoesevzhjmoA8RfyHJPRKwirm5
         crfPnhLGDWyW/JGgW2kQ2qFdgL2h/PTPmMzXH1sKbqbzYgBCQGatuKL8Y6/YSWrGJPuG
         baQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572176; x=1793176976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egoCefaEWBE1zHp2Q49ZFDFGmYZgTt9yQigi8gi4k1k=;
        b=b50MZ1BEytcCoJFffr5wdDprvU4rLX0WUOKimFrWSA+vaz1CbsuVGpzWZeOwNkLkiJ
         KmtYIskdavmYC3bcaSAlYQSJfqmDeVVedQvUjDbE4OSeWEXjQq0kN/g74bcwJsQqP6Ii
         ULXgR2mNufstvDtBB7oZ0U9KA0us4nx5nZxqIdF+otC/Mpny7xU0Z8M0KAH9lQ6F4AAg
         Gx4yb2G4jbks5PQILkOv2xQ6LkmPGnpF6yk2wia2pdRLB/NhHUBzyem+fJeMOUPpqzIj
         7nXNlpGgkdU3mdBvy0IdRrRFVKu/SHf48XHETKmlX27PgFPpzR/gyeiYMIRFiyB9389/
         7JNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx4SYU/tSonw6WS/xnSFK0Vho2pQgAYHtCTeJTd3wo41L04L3EcWLtRnpE66uQqDOjcQHDyx1+RfLTezI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLadeekjl29EtTw5+zJqE7v7bpGKygZXlOaB8pQVvvUBBeFmFGW
	1LgcgnSSd3ymQ5AXSuQ4pZvcOO09+WYkqsKC0FgHvG+C9EV4By4aHhZAtnwlh751Lx02HJN6ub7
	LET+xUO7twzGuy6e5tix13A4Rm5dRf1UZMG/a07B62U5gfCjxhnOGnNfRapco2i4RpVE=
X-Gm-Gg: AYBFou1h6wINigf/gpzNbDLPt00vSu794JJv+cY9ygUP20+QxYkTcC2IQhdb4V2r2sL
	pO88S9BgogsuAGj93kP/B12neM4mEGcDX8Y3NYHxTJ+5kmkTFMmo57h5SVjULeN8Zlr2wEaD0kV
	oG3zh6mcCwXUczYB4jNym8pcto0r2ULCfps0uVUEpi5yO+HgqzGxWg0LJvvcTRfmnIp6ATakg25
	TqDCLOQ73zDjABS8tKLR+iT3nKuTujjGysI20b6d08Kxy5FALNU1qwxg3EtGn/ykSZTE3ILj3Lq
	5MdgdrnJnW+EerZfYNmYvmQ6W8LsStsOYH2TkhpTcaTQBXmR8h8x/fK+Iu8c5bXWoUEHH0N6uVm
	ZyoAOG1s2fCgyqDdiJBjmqw==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr388315185a.6.1792572175529;
        Wed, 21 Oct 2026 01:42:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr388310785a.6.1792572175099;
        Wed, 21 Oct 2026 01:42:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b402f2c2dfsm608020a12.1.2026.10.21.01.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:42:54 -0700 (PDT)
Message-ID: <7f3a33a2-8194-4d6a-8459-73371bbf1b16@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:42:51 +0200
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
Subject: Re: [PATCH 09/12] drm/msm/a8xx: devcoredump state capture support
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
 <20261020204728.28844-10-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204728.28844-10-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX+uM+10mlpwxe
 db4vYcGDHMqb4OTAoBTV///x9z/GfiEIyPx45bR55wEKOPXM5ZdJ+ggrwOaiAJN/gJVp7neWFi7
 wylH305Ji3OGM5Q3yKRdQDz8CFzY48A=
X-Proofpoint-ORIG-GUID: BsK9tkHDWrGI5xD7lbIhotQWm-FyXn3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXz/cCETkuJsGF
 dYzYI/EEVz6II2T52OL/xYEXcg1W0gv0UOaQDoJAzIFWJbOyzGwkbENIgh1jnoRYlefRIBNPJu3
 dWNjMmyQyNX4iHhQm9YrbB5m243vcCJruoyXlhHJJaeNu1EA74899MGUj09WGzZa2zq+HD+m5rr
 Io8gOge9r1uIJmGxGIobOMtDfr9x1gs969ewC/cf/Wf3tlSjj1qthmxFfyPXgZUlbshZw95Se6D
 4Y8atEjwzC+OPFO0dawBCkJSvlq1keUC22GkdqcCphpbv4oRYKywPieuYuwtgQp4bZNPCGxLKts
 HzYRtumNAti05d3a0H8mcfjjI1EuG9eDt14jFyN4QIPTA74hE5+gGQZrvDOQprsxuMPLCUDPGQN
 Wh1ef7e5e8+vxaEQut0S8l+PDsRDzucss4BZwSgq8kZm7hBaxt6gMnJgsSeqby5TmW9wSHiWAys
 dvl/093c+HwsCw5o3pA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad87b10 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2HxrRyV7D69wryGh4VUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: BsK9tkHDWrGI5xD7lbIhotQWm-FyXn3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 10/20/26 10:46 PM, Rob Clark wrote:
> This attempts to make it easier to compare to kgsl, the downstream
> driver, to make it easier to spot bugs or missing things.  Such as
> re-using function names, etc.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

[...]

> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> +		.show = a8xx_show,
> +#endif
>  		.gpu_busy = a8xx_gpu_busy,
>  		.gpu_get_freq = a6xx_gmu_get_freq,
>  		.gpu_set_freq = a6xx_gpu_set_freq,
> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> +		.gpu_state_get = a8xx_gpu_state_get,
> +		.gpu_state_put = a8xx_gpu_state_put,
> +#endif

It's odd to have 2 identical compile bounds side by side,
I'd just group them

[...]


> +static void gen8_cx_dbgc_debugbus_select(struct msm_gpu *gpu, u32 block_id, u32 index)
> +{
> +	u32 reg;
> +
> +	reg = A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(index) |
> +		A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block_id);
> +
> +	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
> +	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
> +	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_C, reg);
> +	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_D, reg);
> +
> +	/* Wait 1 us to make sure the data is flowing */
> +	udelay(1);

Should that be a readback instead?

Konrad
