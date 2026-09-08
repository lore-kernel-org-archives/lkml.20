Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D8D4DF4AA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867912; cv=none; b=JoUNfF0c8UBZmSjjS5VJupDLss32ZuxtlPMOyJNtIV5T6gAIsgt3Pk4oHp/UDNozTPkOeMstTJ2/c56vq75ckTzrGNgLyTenXLwIAxS1zD85yCh6i1fHp+cSnFKFtHPy1S5v3QjSWGFHtwdf51qQ/aUt+FcslD07HVYf1MM7+vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867912; c=relaxed/simple;
	bh=2lnjyG2aLgNkVEo3+hRGXnG+fNvKoY1z3nKcScXSgms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9eiDIAkPvD1Y2VP4HY7OxHTUgPix1aGpQVO366D6LzjVgBpgmXsHK8zGKmYW3L+VUSzkALHfrA3RFMl+/UO/613eD55smhwbX3yjCVGMQP29Ew1fZiGTsubGCYRYGaLkfQ8SkRFmUfBawkcUdmIJOELUvR4WlqtsucBg8H1a64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8btow6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IBJlZDlB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8btow6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IBJlZDlB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADavx3825951
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 11:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0R6HxB4xS9P0kh2KTlln0CaPw4s9m8YTu+2xy9jIJP0=; b=J8btow6ZiPSUMTeN
	pH5cTdqQgZKjwde99Cx+EoaafbitcoLF6mH6IY0Au81AQJaHYkiBoOep8n8kJNXR
	yEnGxTlxfWs0h+PkmY8eVMrXg4f6z8Fyo2zE317iMDEey2EKq81fXMB5p4P+Ycf0
	3Z73DMWD9q3sNpcDynKiwOdfVJEBpp/j/OfL19M19bS8Y6uqNlrbrX+aiy8mP0xZ
	Arb9FgZxHm0dLrC56ArXCIhul7mXczfIIF9h25cPlbTpH/4sHMkV9Gs3Qb4R6Rua
	RzWgDvrfjkstrijxEjJP0DKuoPBeJ5rLqDRolzCm19NylJc1cL8qHir6WkRSnymh
	pbcpzw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p9r8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:45:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ea38b1e7eso10624161cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788867905; x=1789472705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0R6HxB4xS9P0kh2KTlln0CaPw4s9m8YTu+2xy9jIJP0=;
        b=IBJlZDlBUK1V5cMC1UHJv/0Vy9yICyMXUyRY1a8zzoVInjARunhTyTk4sznYQw9s/0
         UDuNu+tq2XUUdFJWAf7V88MHpQKOyclCkeDeHpfADZFVMT7KSS/px2l8ieiXJxoTfIEC
         L4wriGYiP3ZefnFV2lnG30MYDTU4+g2WXxCZPVeg4hPhLMcOt3fouDoIHWlLdW6GwZ6R
         QVN1qXyd7Oo82UY9ot5hc6+4hiAcwk5McXVAxa4xTccAOoDx7WYAAUVtge65qqfK66NE
         gxKcMpx5x1SRavS+9c6dgyQespnxrTX0Wm1LOnrDeHBDjTt9B1rVSb8G82njpWmQothx
         xYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788867905; x=1789472705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0R6HxB4xS9P0kh2KTlln0CaPw4s9m8YTu+2xy9jIJP0=;
        b=iz1nU84LCqOa3m+igjePT008du4aVkf+JNB84JzrplXJeuoAOFXN37VKSrSqJWK6s9
         O/D6h+vojlkBvdBc0AMmwKzFtYQ+EAwufN562t7U/nAVd9XdecIXSGRUQmm8jViexTVr
         mbG0B8PvVZUxWTudPflwBN5EQji0zE0S9c7xCWUdxTzN8AhwhW5wsYB5TVPnFAB+vuLv
         RE+RMWlQyGHuxtK9FZ3z65VJ1oExC+T8OXopNfv87tkyFx8pjiV6ZA9/ef0l6omp7ahA
         2C2rnjUP5uT51M1JAuNqhORPa1mEn/w+XDoiyIdYrxzBz8evt4JDRzlObDKTmPiYaoHm
         w70w==
X-Forwarded-Encrypted: i=1; AKwUvByx/TObAb9eQxYo1gwnpC3EOFFjeKfwqkAAvDPYsz/7ndKSFXkmlkmCy9U6miW7j+9Txcc25vqMsLu3br4=@vger.kernel.org
X-Gm-Message-State: AFuF++nvzgXI/vICMhdxV3V0vZraizc+ehpvx3N4fgsqdumUKMt/+8Q1
	67EB7Qb7H45rbNjWXWwc6u1o1xgqh2QlGIlrsK29KgtMxwm9509QT3iUneIO+4FlOpLCccGQ3v5
	R0qXvseoYVh6nFxy0URmoGk2r+PG1T22VarzJVup0RFuGixrAKRRQFj0n8jznIc+F9iw=
X-Gm-Gg: AYBFou3b24eTlTOHi3SJTQei+tNZusivpuFElbW55Oh5Uuep/DOjmkD4XwT2MH8aqtS
	JgLoF2MQvYVjbV6SOwbJg5b5dQpcGoM3iy63rcxPy5wsXZbVWaafcB82xNyb1Zt5Vm7kI8uWJBe
	wGYkkUPNRsDI5eDB6GkQV4/ALU5/mb/FZHImPhmwV+RT4MTqFXt+2M5CfZcQyBvjhVCNy3dBp/O
	iA2ccDr+yZbnsc9y+26pw0aYijPJmacn4bxB3GALRyJL+CVkGm33zkg2lbc7ekYujbJIsXkij0L
	Ih17RFvzGeiPkAOF62yf/3G75jN8C9eYaeXfSLQ73n5MBcPIoo8YQ1QaSPN4Jrf4gVnU/0elq57
	zRkF3BJzjtSTvF9o6g7afTw==
X-Received: by 2002:a05:622a:609:b0:517:6162:daf5 with SMTP id d75a77b69052e-5306468ebaemr205196211cf.3.1788867905029;
        Tue, 08 Sep 2026 04:45:05 -0700 (PDT)
X-Received: by 2002:a05:622a:609:b0:517:6162:daf5 with SMTP id d75a77b69052e-5306468ebaemr205195761cf.3.1788867904645;
        Tue, 08 Sep 2026 04:45:04 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3b2esm5717235a12.11.2026.09.08.04.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 04:45:03 -0700 (PDT)
Message-ID: <1f881a4e-3536-482c-8fa3-4e141f633a8c@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <80eb9f51-9cff-4c07-822a-759360617cbf@oss.qualcomm.com>
 <le7zslxe27qauz7duczbxl4rrd3kbekg5cwxzg5tmsy77r2t2z@7gdoif3yfkgg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <le7zslxe27qauz7duczbxl4rrd3kbekg5cwxzg5tmsy77r2t2z@7gdoif3yfkgg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LrqK4AN3CkhDzVIPz-dRF1UZwipl2qel
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfX1opJmMHudBM0
 KA9wbH+SElLqTvPbmhEIOs/nThx5m37xBg3cJIDZXzL+OK06lG+EEHBi17bMR/9Vhx/1uP0esE3
 goZpZDoP9Ak7BxY4tYvFBFhldXyuo0I=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9ff542 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yFWfLQOVxOdxj_LqjH4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: LrqK4AN3CkhDzVIPz-dRF1UZwipl2qel
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfX/7gebIdAktEX
 JNcV/klVTFSD05QhF5314z0zhskxut8C1zB/373QhJE/rqjvXcAZ/mKaEQaPJ20ZvR8H/NYYMzL
 k+3pB8Gb/ikMfuJ8pbo0PGfAwRPBrz3IJ87IbzG+qfyoU1hxvDW3U1kGOpqmj0MwXyXtXuqyNhC
 s7A53rjm9yV1KXBMkM88LKi+tBKTUWi2jEjTZp0R0HbqrxqHYC4jH3S4FK17ZjB7aRvgqXHjmTA
 Sa6rSRMQJNu4Ue/9nltg9roW4tVhyXRN5oPQqUXn66PahbGeGt8FHCcpT+w2DLDeaA7Ni+6+Z9y
 Vx9mWH9sXzFd0vvhg9agZnLPd/CYtYQjh3uttSm/9BNvvg7PGiWpox8/wIkKsEJoEmeeyild1cx
 fc04ougF+r2hDeLnldci7ZiRAiE+wNm+LweWmsRD4Y1yov73WCseAl2d5aK3ul2mnHzA4HxfFlM
 UMvz5PCgg8ZIUoO8qRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080125

On 9/8/26 1:43 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 08, 2026 at 09:03:55AM +0200, Konrad Dybcio wrote:
>> On 8/28/26 1:13 AM, Dmitry Baryshkov wrote:
>>> The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
>>> domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
>>> zero whenever the GPU is powered up again and the timestamp reported to
>>> userspace jumps backwards. On an a702 six reads three seconds apart all
>>> land in the 500..1200 tick range, stepping backwards twice, and on an
>>> a530 the OpenCL device timer conformance test fails because
>>> clGetDeviceAndHostTimer() returns an end time below the start time.
>>>
>>> Save the counter in the suspend path of the affected generations, while
>>> the GPU is still powered, and add the accumulated ticks to the value
>>> reported to userspace.
>>>
>>> Assisted-by: LLM
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
>>> domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from zero
>>> whenever the GPU is powered up again and the timestamp userspace reads
>>> jumps backwards.  Accumulate what the counter reached before each suspend
>>> and add it to what is reported afterwards.
>>
>> Could (some) a5xx parts use A5XX_GPMU_ALWAYS_ON_COUNTER/0xa879?
>> msm-3.x defines it as KGSL_PERFCOUNTER_NOT_USED fwiw..
> 
> It seems it also restarts on power collapse (so always on is not
> actually always). Also if it worked, it would have helped only a530 and
> a540 (MSM8996 and MSM8998), leaving SDM630/660 and all MSM8956/76/53/37
> without the fix.

Yeah, that's why I said "some". Is there a chance that's because we
mistreat the cx/gx split on a5xx?

Konrad
