Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7549463
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372563; cv=none; b=M5z7AZzy7AuRG+ViDdXwOV1k102Lhs0jqcI5v7DDaEdWaOjdnrFO3bzg57J7SI0zkRKqn/bg7d8jRWKxtlQVQKN3VDOl+Ip5EEgficX2CgYvsDpkai8YYCuMueYTqr4T1zg17vSibaTZEVs/C1vN6eEtxXmCqmO9OVaTqLo2PDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372563; c=relaxed/simple;
	bh=im369v4xYbbax9nJw1RR0rFdXHMg6zdTsynV7CGkZfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdwqTvQdf1s50hp8yBEMYVlRwHNu/8Fz4tgi3QXbYZilMMLgTpBu7SAFiVnQk7rLXWsUrxDWPdEtRw3yuJaoOtEl9tB4F5Y5m3DWH9/oYd9fzIkPc4DlkfMR64iTgy1gRjyllZr/LLVUnoGOj5VbDziMJd6RUz30DV9hJhy2h4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oB9JJJP1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAC62Yt3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oB9JJJP1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAC62Yt3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j0Y83369533
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hdpi2jzl0BvQv5X+F2dziFnBhCFeUf0VIA21wNKOf5E=; b=oB9JJJP1E/TZlsDk
	96UPZpWDmngqCXam50q43Hkzct6TF8/JLaxwFVAtm2LgpZho1WVYv7eYhRyQoWc4
	yQNloyf/8zK1HSWDiR1LEg+vvg0smBxvqqA9JtX0k9lUWeX4f0dEgmpqAGouwFNd
	YYcmmn3fbrP0+iLx9JM6+583KMvBV+K+7j6Ej1dHFG/advDis3XpoDkDuT913zLB
	LyI2NW2nXOG+G2E917iopFccrNOEXHmZdzI2QIiulRFYaO7q329nMwSmrr4yEvOY
	uFlyyFiCldk3CxN/LdWY+tUURitViwDTGBM3gbQwYyQp09cwuxGUnNYgLYfEA8wL
	PIcMog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5mq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:56:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso51334285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789372560; x=1789977360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hdpi2jzl0BvQv5X+F2dziFnBhCFeUf0VIA21wNKOf5E=;
        b=XAC62Yt3bmqiwwr00jFaedUJGKzHkLs+dSflar8TyXDE/JYwuHOhMLWKHdu58iB7hi
         PxGRrCGQPHN/i8dlFMHNAqgBfTwTttx84hyLBs0mK5AnejL2W/Xa75wA6teC4DQjJCA+
         3p7vTFjX6VJ9/dmsa4riltkesBclmCDcZFMdfQ17EgOlfCR13pwFYEeIp3T7qnW3JSNH
         /1L9qWnk3Kb/+KPpQ7hsnA71XzRv2FV3BwMRchLfJ6Blo7Q4IGbV5Nbpb6Xg5WKCZfS+
         udiX2w150OZEsS/ucllLSz5zWB64RAGP9v6X7vMMaU4eDzNgSNdEzTMFKHgB3pRuxlGl
         BVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372560; x=1789977360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hdpi2jzl0BvQv5X+F2dziFnBhCFeUf0VIA21wNKOf5E=;
        b=Mb4etWbXbtbL0CTSDZ6PnWO7dROJUNw+bX3N2zVV02Eu46EbGR8VOa4R4MamNUfKTd
         Pq5yUfvTLdwz8uxXeQ51CoKxJD750ayks1f70LEHB/Ria4kK7Ky+y/Ao129/63qPs6Qz
         deoEHxLZ9MPgKJCG77JCDst0TMzxsyuuw65zLm1zoboy7Vynb7HxDmHxebe8HIhbglah
         HYhsQii0l8HL5FoGwSfR0N3oRovt82lLACxhoH8nM9Acb88nrGa8nL8LomtsDNBaTo7c
         ylYfW390tgFFaEAtHyOMNPZCDfZdb7NbeUAs10Z1gZ7C8YOqVKfoIw2OGVs3M+m7RgV+
         FzNw==
X-Forwarded-Encrypted: i=1; AKwUvBybh2eWwKWFIAE1xgKAxRvodONOyk/9hFyT4QkDDfuX2sHRUx8dl8wtvytHgZyttBJxFL3bXIzdKfHFjxo=@vger.kernel.org
X-Gm-Message-State: AFuF++nGzo8+CxqEI1QaBfbLMGqDYg/2u+GQT3GdPXKMMFfVWJddO8Ul
	0n227fzmHnpKuaJYVetNS/v7linzzunG8rcOzUb/iU49GTS+PEpwqQTwr5kNWHgiGjChKposHVE
	8jOgrzB1hs93exsBXAr4sNpyR4gH+xpOb/5N9aGoRgGf51vFxNQQITzUf3YCQOCtaz0Y=
X-Gm-Gg: AYBFou1EtW8Z0jP7O1iC2myOVpLC4sAhdsYYe/vonsGCIJQ7Q6ENc7hChVs/Eytb8KJ
	lcpXaO4nKBtZxNJcCZR0/2wAQY2k3qQZX753/Y8lGwnkF4YsSWGsNg3WPlnXjS3c7fkFvW7+FsA
	NDWExVXauesjy9R7MCoixyF8i3cfYxuzQLauVW2017T3VgkOUfUseTY3Tc8NV8ReDVlF0p898fB
	IDXeGeEOGcl02cOPyvxnIBa6E3j26HTmzNNfpQCv3FDqLgF5WNLvkVo2r46cYmWJxVw9SOeNbqR
	2FrccptR5kYdeUMggZU/AFy0/JlmyxcJLB/6l80kneipYEREOzwSAmISiyzSIDVsCvE80b38moi
	B2WheWivNm3SqjMfrW35khw==
X-Received: by 2002:a05:620a:8394:b0:939:eb09:4458 with SMTP id af79cd13be357-93a29bad63cmr143697485a.3.1789372560229;
        Mon, 14 Sep 2026 00:56:00 -0700 (PDT)
X-Received: by 2002:a05:620a:8394:b0:939:eb09:4458 with SMTP id af79cd13be357-93a29bad63cmr143696085a.3.1789372559829;
        Mon, 14 Sep 2026 00:55:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966124c98sm373482966b.56.2026.09.14.00.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 00:55:59 -0700 (PDT)
Message-ID: <12b7dc43-b9c6-4cd5-bfaf-fac8bddd7352@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 09:55:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/gem: Add modparam to disable shrinker
 blocking
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20260912145922.24115-1-robin.clark@oss.qualcomm.com>
 <20260912145922.24115-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912145922.24115-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a891 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZVvdkDrwHHLD4pTVV7YA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExMSBTYWx0ZWRfXzfO/6ICjYP3Y
 Xh1/43G2jieX5C/OA8jdywP/6eP3BFw+iRxVvlgxAX7bbx7rUwYESjAFYzpm4zslspysFKHEuQd
 4EYYizn+cZ5r1/8j5/c5KAnyUYidoOF0K5nWZLUeE1bhd3Sx51L6lUUtXSgEDLlc5b7wR+Ic+jD
 EEbP0b0TqS1pk7Zj/Nm3Y71NHFRDwmDQjpNrB5YR0Wene8aDsmboP9t/TqLGR15ZLjm5TZmrIRM
 kmeMo7SMMf3R+sg1gDHu22mRv5uBC/wfREzMWRBbNT+oJkeN5ya6K4hVF/kJS40WK/f42JIThH0
 8YT3AKjU3pO2ykqifUOayefsIjMh2tJ/X1V0y9fBd/mXOhcVH6h4FW3Z/40WPgk+cefC9PuUiJs
 JHISJAuAujokoEdKrln1yHD5JOQQF4My0ZiEjkOs6nDJSgQTJxzS2hla/qgma/YV1oSI6qaIMAC
 AEeb1O/cphvMYH/ivLA==
X-Proofpoint-ORIG-GUID: PkPp_B3VfOKaFA2HPh9cEeH6sE-sOYlo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExMSBTYWx0ZWRfX+j7onvDjDUi2
 9RxKG54/SOO7yGam1m6950XgP55b9Xbf+jxHx3orHCglZ9UzJ9tHbBXGybkzhmDPTiaCgZW/Bb/
 t20uAzNIUsVuOBh7MAvSBlOMOHlgeJ8=
X-Proofpoint-GUID: PkPp_B3VfOKaFA2HPh9cEeH6sE-sOYlo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140111

On 9/12/26 4:59 PM, Rob Clark wrote:
> Normally if we are under enough memory pressure, the shrinker will
> eventually start waiting for BOs to become idle.  In some very latency
> sensitive use-cases this is undesirable.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index 3514d5c84989..83ee032cb21d 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -19,6 +19,10 @@ static bool enable_eviction = true;
>  MODULE_PARM_DESC(enable_eviction, "Enable swappable GEM buffers");
>  module_param(enable_eviction, bool, 0600);
>  
> +static bool eviction_can_block = true;
> +MODULE_PARM_DESC(eviction_can_block, "Enable blocking for GEM buffer to become idle for eviction");
> +module_param(eviction_can_block, bool, 0600);
> +
>  static bool can_swap(void)
>  {
>  	return enable_eviction && get_nr_swap_pages() > 0;
> @@ -26,6 +30,8 @@ static bool can_swap(void)
>  
>  static bool can_block(struct shrink_control *sc)
>  {
> +	if (!eviction_can_block)
> +		return false;
>  	return (sc->gfp_mask & __GFP_DIRECT_RECLAIM) ||
>  	       (current_is_kswapd() && (sc->gfp_mask & __GFP_KSWAPD_RECLAIM));
>  }

This is just a guess, but can we always keep both and jump out
of msm_gem_shrinker_scan() early if we can satistfy nr_to_scan
without locking?

Konrad
