Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1863E4915A5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944790; cv=none; b=FrBVljogxvwZ0teTR9npWPYSpqol4ets+3g3oJUVtdzR/jGpGE40HhXxQn2kg4Wf/I5wzNHAxwISOxUdB/dPN4uXasg9W1xwUte8f7P+QghwD7O9D7Stk0LGKpCTkxHzJvnJ6IS4zjA7et4/7Wj9u5vGcNYss2DQKoPHtkNgtZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944790; c=relaxed/simple;
	bh=BY9a+ZadOL45ZPY8IaR2ogPLW9G41+UC5MKC1/JBri8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4Dv7BrOXJPBHpSQXGBpHt/LB8A2szG57vcyyEhgW6WGmEXQeio5NUnknPkbRxdsoBhBu4RR/ifWE2E8fnwglvEJgvEeTeab1GQyxWr5PpszbRSqJJh6iWIb/iG5kUS92huhczz306Pvk00PFkzc8lEGXwiYrDuuMUD9BMyViIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5MkzCNf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAcXK+Gz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5MkzCNf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAcXK+Gz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896Ro5D045470
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 09:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLPtpvb5yV7GW2CVT7bLRhge7vNl77o0SOVL4Mkt9ak=; b=R5MkzCNfXOLTy4zr
	njn+glFqrnLbIc84z1tp7TRk1KEjGyV2AYNg/OMx3LV5ZnTDf6mL4XcNiBXkbB+S
	nie37pqqzLE7wBPNgDete+WZJwcEdpe6r5BIVBU4W4SbC+5g3JCPj+gBNZXA1+ci
	zFxtJtkGkJVZ4LI98OZZopq++yMYUFB1dRXmIPEwjMi/SNW6OdvtfcXkPDVyDAxW
	f1menFYcbVEpxf8dGacC6RpfYUXzan46UNq2TcdntElKtICAE/hrcesOvlp3WDwv
	vF/GOWSzbHziz+lGz9M3Q5qHjHztm3C69OHUPQyzXmHBUeMf+mJ5EQ7zlbzmBE95
	qLkAyQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqewk4kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:06:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9103db79014so16544736d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788944787; x=1789549587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLPtpvb5yV7GW2CVT7bLRhge7vNl77o0SOVL4Mkt9ak=;
        b=IAcXK+GziZ3nEzpNV+EtQ7NTWW0oO+jAiC5g/gnGaZsa0egHGOLddmyIvptwXTowWS
         nar7iF/QQ2IZzjmBZu5krLKdTY+luV+Y/23cwUwdlh5/MG1QrIUbTMVSfQQ6NjjPlcFW
         z4m+aYHA0fNQkQ5n0euF363D5Z2hHSDwn+zhwzwvgkCToFZxLV6QwH3eP0YFnbjFqSIN
         nSG15g7UP/8e//YT7kfP8bSiPGc10LRIdVn/z7dag84OimNwoeMMxXtsuk/ZyjDQp92q
         IdZ/mCvg/ftg02GCvD5wcZG24qpwOSYYHMqzosTMfj0lHxsODj+QVR+aejPlG+kq3VU/
         DwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944787; x=1789549587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLPtpvb5yV7GW2CVT7bLRhge7vNl77o0SOVL4Mkt9ak=;
        b=pmm/IPle116l2H+hwaV8SrbFCEMURI5mgP5wa6dB3L4+zPeukENkIrUAwOOzvrwfmh
         syEObri/sNegxkEgoc4EovMmNw1NpwUuapZs0oV2gIXeM2uolTcjEJ9TjDk0gSukdBuG
         e8nw7HfufyhsARwHSDg6mF5z+QP2/FsfYVp6pkuEHszEeWRXXsFPXuPmSJ6ltCIbMM3z
         +1FpyurjVoo0q1DayS4zvzDgU0KP8OdeR0xkxjuw4I/GtJOQVK7WfiqZxjaTjeQIXnsv
         46FeaiZl67k4Lu76Bc+2f+hhvCq6Jnph0IMsIGcqTXJrzKd+O0qwZ9cCfpKCT+uYFCa6
         17kw==
X-Forwarded-Encrypted: i=1; AKwUvBxUobMimEdMF+xspnob/E3HYsAJNH+g039gXvhQ16jQ5+g8w67A84rrqVKDl8dnXc2ELtuLgFf4ujCXBYA=@vger.kernel.org
X-Gm-Message-State: AFuF++lxKMRHGaO47ho0euh1a3GOFMErZhfkIfKqI4kQK5rdCGJxWVRJ
	5wBa4RuSgqtGWQ5gT1xCFqmE3cWerv98I48Ao9IiDTy5xt0krA1BZyo2ks+OboBB39HmJuUGy8S
	msb8l8BgmWh+VALFSNHsLsZhVXXj7Gzf8TuV/Q+wt/zBNUjasQlD9LkC7a91H93vZab0=
X-Gm-Gg: AYBFou2m0luQn4jvbVh6TPMSA47MYgMsLa8G5u7wtshNglSVTpkC60wwjBzDFIv0N6r
	P8N8lQoCP1wbWnhy2/+Pj1e3Tre9w3x6QluIM9vJrsl5M7Jqls03nYciilhahlO0ykU+Q6OayqN
	j4aLQdAPriFxuL7SsXghTv5BoXu4qSx6Ei/721mMf/P2G6s8ji5WHoriW03dMM7W0iiKc/x0/Gc
	MBSx2SCTBbdUV9ZOBUYUg1x1q6inaFgcScgKRZAlzdHkIGbliXDOSBL2GMiBmGn39wTKTlYIiBs
	vz/ZWv+WV+jJKfJmM7SO321qKmI5cAnFgft1YR7v7H+U9QQqSorg4RiArBcJZ/FFChch16//WMR
	JOUWVgBdsautCoO8tj5EeGg==
X-Received: by 2002:ad4:596f:0:b0:90e:9952:82e4 with SMTP id 6a1803df08f44-9104795fc63mr261666616d6.4.1788944787084;
        Wed, 09 Sep 2026 02:06:27 -0700 (PDT)
X-Received: by 2002:ad4:596f:0:b0:90e:9952:82e4 with SMTP id 6a1803df08f44-9104795fc63mr261666156d6.4.1788944786500;
        Wed, 09 Sep 2026 02:06:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm648279666b.25.2026.09.09.02.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:06:24 -0700 (PDT)
Message-ID: <47f0399d-bb31-48bc-b69d-4abd445727b4@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:06:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Use CX AO Counter register for
 timestamp on a750 GPUs
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
 <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cpirVV4i c=1 sm=1 tr=0 ts=6aa12193 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=ubtBxe2QYwUAodWgXbcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3O5WA5nvsyI5345L8hL3-oYBNQPcsoFw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMCBTYWx0ZWRfXzWDANU5dQUMV
 ccrgjlHPfWNwSEO1Xm/V8zcPMaHz+GX194unR2WUe9R5+P7ZV51vFYKkbxYbPKNJ7RiJM2zKOfU
 jtfy9agvZgGUFDE5AbL5r+mLK3Pg3gd/qYM+J7ZqVVL93eq7pIu7NDmbVHIH6ZdD6E0EBfLReIL
 44oALPP33m1ABhbn2aMCXF2wspiznEAf0HA6jziNY7h9vs4E6KIoq3A4tLJrDHbO4ib7gCJ2WYc
 6vSzWco91O51eSNDldMzWUdJH/imqIzHZxwG0Wm/dyNEGmU5Gj14D8IpHDxVsaU3RwZa0aWIRy9
 GZvoF4CRSlIZVJTeMYNj7B/ZIFm3awIMIMnPg2ezt5YMWe4mZVkMhXFd4CzVRkGsxIT/qaEHdOv
 S5qqAEQmAPNrG07EapTk5pcru4A2TEvJTUxmoUAP14eINsJeeBWJQNAIP5lXs0OOCtg3g8GJPcW
 AL/3Cfpnz1/sVoDD1Fw==
X-Proofpoint-ORIG-GUID: 3O5WA5nvsyI5345L8hL3-oYBNQPcsoFw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMCBTYWx0ZWRfXwfwtNU5+9KoE
 9a5/ERkg74pLLQDN0Ali0Ozvv8MRu1czq1vj1iBtv3sF6/tH0U+9MP63zthNpP22k9wqNoThw8N
 D8cAhChK9joL/zQNzaMpPft+45CZFg0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090100

On 9/8/26 3:24 PM, Neil Armstrong wrote:
> The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
> register on A6xx and other A7xx GPUs, use it when running a A750 GPU.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index f9de9329dee3..081e79ea4652 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -23,9 +23,15 @@ static u64 a6xx_gmu_get_timestamp(struct msm_gpu *gpu)
>  	u64 count_hi, count_lo, temp;
>  
>  	do {
> -		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> -		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
> -		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> +		if (adreno_is_a750_family(adreno_gpu)) {
> +			count_hi = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);
> +			count_lo = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_L);
> +			temp = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);

KGSL apparently *writes* the system time to these registers, is that
an idiosyncrasy regarding how the vendor userland drivers then use
this counter?

Konrad

P.S. looks like a8xx also has this counter

