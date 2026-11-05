Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916033;
	b=4iydpzZ3DBnAge2Vl/Qh+3bZqYoysiV2Dj6gfz54KjrZ2ROz2E1cAHN1JY5t40c8j/Np
	 Dqg8UrPSPWh7czlGEqSKJcFhcjQIhJSplDYUMI/xl4aay7FWuTZjBAmIDDg/RtbDjOWC+
	 kK0j7Ksw637c4UrzuRj4lLu2BQc13IWxyKIELHtAlO+UnX2tmK6ohfMe0AO8aHVbtv4Dg
	 3nSHxjQG3V364ZfOKNrAuIi/r79oyVTvBrwx/KiqsYsYksp0FsiHDBwaizJUWEaB9pAxy
	 HwSmAIuSdJIveajiUd4Tsr18yzvrY/r3g3dMvwUCM3dL1RdmpPRnrNSCG+z1UD57uqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wJNjolyzsnHuSD33r/49z8gm5UN8Kafker5qeL2G2gE=;
	b=Jh2DjLw4KL1SG+9O2f4ksiFqIQWcCX2n8eP03k446V3j27pfRoLqv+wOfyuYpce1kYUt
	 2ruSCXoi7L8FGxgd5CFGHpJB2dWr0n7pxen2l4ZIdkOpMTNHna13g2rSih19HFRSR19zl
	 J/2PndigzHTbX0ENHyHJxf8kOnFMVenRTtWzJSTCkPdJXyPs9opT9j66Ad9as7QXwzLVU
	 mSewBd/7oxJaLd8nMR0BCnKHlZ+LtzKvCdp5cVXWRG84QJrwz5feV/F/ZvUv8bLHOUMtw
	 y0zhCJ9SiYPB843oCWoJ5NvsCXnewJEYAodUH7aoAQrbz+ErnpYlkRGf3IUNj1z3HsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o1zEJvrx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N02lYoxI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96256606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96256606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o1zEJvrx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N02lYoxI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L68YC844580
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 22:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJNjolyzsnHuSD33r/49z8gm5UN8Kafker5qeL2G2gE=; b=o1zEJvrxo8+XDtIJ
	SKR8dJMwThbORfM7FgEsXENMjHoWqWDpZdT06TU146orNq9f93qbPxognVIxT1JA
	KWEeXRYtn+AIDnVfxhS+/BfaOSLSXFKPJVvShpTlhCpnvnRQQf6KrTOy5rLj0DMe
	w0yzznj3jfwZbCU5HxvNBcfZEjArwRuqec0B8OTB55rel54ZfmRuHhEy1l3CJZLv
	Yr45Xcp1+LZvvbcaMz35Hxa3dQIKKyujWIBikv3dkWNxWfy76JJGsCff0LXDT+E3
	SpA8cQmKjaNMJJka1+Rh62hgLYN1PyXzH6ygmlgCoenmjYI9VV5DcHyGZyWz+4YR
	ToZBBw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvv0mhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:00:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1732934a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793916031; x=1794520831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJNjolyzsnHuSD33r/49z8gm5UN8Kafker5qeL2G2gE=;
        b=N02lYoxIN0y6xGdqUJZ4iSNkRi7WPzj0S5tdLVUC6NKPjB0F9C1TSDlRrcrMe85wV1
         lI0UU54ufIG0y7pF2nn8W8eXt2FYKa69jhmfUqi/OxOP+XLahkh0yz1nf4f+zCNdApLO
         zFv0cIDqc+UZHapVL7SaxoXPONGwJM7QHxvyMSP4u3Njb/s6zEfAjx6MWrm11rf9EcxD
         yFtxN7nvVvYf8dMCE8PlYMlQsaUrnVH8ly58XRLGUF0VL8QN+PijT9u4bxWRIZLVxAVw
         WckWGBmztsIiRhVd9izstyziJdb6EzyILHrA8P1ttzrgzFHrtwyGW5/uGFm+WZk4RZOP
         /U4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793916031; x=1794520831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJNjolyzsnHuSD33r/49z8gm5UN8Kafker5qeL2G2gE=;
        b=jWPcEMq49aEv4NarNBSgZ6U1PHa9HrzGHoqMiJ1YhU1jfr66FS2BaAaAveviryo9Ph
         0ahrOm0Nd9ZUlapQf5vaf/1sZUSpOT6+x1Du/iwxS3r7xrQBxSccc/QoRxSPH5U/AWbV
         8+7yEcbJghOAabEKp+Au4+9ZY2d7V3CVHaZw9tfJAbJBAjbToeVqotJYWPIiJGOKEJLL
         RbysXrPtOx8U1JA0omKqREGQ4XJdxtguKUTw9xJ0FKotNH69BF6kKU50tYV3v8HaZt4P
         +T+pTSg6i6V1u+9n5gGs56ljmDy134bpO/opNyGhBLhch73mUDMmEcAa2C6S5M1NYiNr
         8VDA==
X-Forwarded-Encrypted: i=1; AKwUvBwJNnx54duL1pPFfWI+xMrauFIGJfheFgpIWj/juUAqBMnkjMXaQFduJuRNTcAr8Ruv8aquZlh3/U0VxgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0ixpR6A1KUXgRmYRd991YTaKTPyKQt34o93jjrhwpinxOZ3nr
	NrsPNd64aiKSFilPIyBT5MCLAyEBgKgx4Ne01btbqVhqVQ9D/i1gsDta3kq9PnyTTeQcu4QtONk
	jrVDvHHOM6SR/PPz5t20VUho0diAtFa7g+PhXnyCTxyDK3wT55dBiQQ+N/bORCrRCKNo=
X-Gm-Gg: AYBFou1wqVjMvqyXjaQQlETmSxC5cov+Gyt61nbjsY8urP9UQcWEn/gI7+KaOpSz/30
	Ol/Z1lW5FsCKyIks0anxB6LNZmZd30ThHKLuvKC1ZahYBUTyb1jz6yBrg9531c4yfdiI0RCah7w
	1zILgeITjm/jWXxHsU0NfsP+3KhXoB6sOwgsM7IZy9pqXPDzGRNiWyGRO0vnz4NEoYmeWM5bpLZ
	MPYRWPQrYWDx7Yc09yGQSXrZVMxW7+tcmHnnRupfIZbJrMx0GCDOUL19VY4NWL84GKs7mrMI+EM
	x2yKhMGdwe98kAnONtonXe5Z/MzvMUSXseItb0PLbL8q83aBcrTZ4LltGDN8AGFkw3plsT6g0gN
	NccQVq2RK6lYY/TqYcG6/MzffW85CT7TiO0dRrmtw/W4bM7tAxoJacx+c1M/APGbmWhTKZtg=
X-Received: by 2002:a17:90a:f945:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b0db6d7d8fmr311991a91.18.1793916030568;
        Thu, 05 Nov 2026 14:00:30 -0800 (PST)
X-Received: by 2002:a17:90a:f945:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b0db6d7d8fmr311958a91.18.1793916030062;
        Thu, 05 Nov 2026 14:00:30 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8a3d9sm888376a91.10.2026.11.05.14.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 14:00:29 -0800 (PST)
Message-ID: <7767e37e-ccfb-490d-b0d4-6fb5c6275618@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:30:20 +0530
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
Subject: Re: [PATCH v6 08/15] drm/msm/adreno: Fix PROTECT span length
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-9-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-9-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NyBTYWx0ZWRfX3ZTQbY6WEFtD
 ZoEvhctAILhaX6fhOn9hde/4l83Vjhp/WWnXua/EkKdkww7SXICvQ+KjOT6u15BH29LWzbMOnPE
 nnN0SQJ2LJSZAfP4fpGp2WLHY7N4MyU=
X-Proofpoint-GUID: bdEnu6-4MHa0_DExw7w5Ki7rwCFe0Vdg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NyBTYWx0ZWRfX10KlES4QdG98
 4VUVjak1Fu+AQ4dLlyB6JfhwlJtz22ZB5ejU82+EkVx/WBmXBCQANB3Ft+k9q1Yj64OvN+bZcPZ
 89g8IxVDsF4rSGmRVSfEeQo1SG3vFN33XiodLShH3T0BeyYKKjB268NswNXw9Pla8bMlYCFeHe0
 +30Amss/+boPmds/YWqnAYWRh1+Q1AZ1JRiZg6EcH1EXTewrf9CoBUVvMsA56MHT7/kayaWSWiR
 kJqOeCbjvLB+BDDMQa97y/+dTMby8ClrNABegFX/aZ6dDs93o6+Kmfz3HDoj0P3tS/3qE6zUK97
 OzCQv8BEsDIXX4HxMyCDAbkHkWCAAlUyTSbLOUNEeUJNw1R3yesuAVkcAHU4ahM9eHmYNpz6Iqn
 J+uFMVT73E+pfbGKGo8XkgqM2WEiNzRd5b2955aUgso91nwh+dnbDpVc23/M7vjFGmOYwJafwWK
 PNXFXUoyjfSUgqzgSug==
X-Authority-Analysis: v=2.4 cv=dKUzC+Zb c=1 sm=1 tr=0 ts=6aecfc7f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YCRwkS1-XJqieDW-VhcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: bdEnu6-4MHa0_DExw7w5Ki7rwCFe0Vdg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050087



On 11/6/2026 1:59 AM, Rob Clark wrote:
> Don't let the length bleed into b31.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 4a3898e58aee..cfe7a3ed44c4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
>   */
>  #define A6XX_PROTECT_NORDWR(_reg, _len) \
>  	((1 << 31) | \
> -	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> +	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
>  
>  /*
>   * Same as above, but allow reads over the range. For areas of mixed use (such
> @@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
>   * single register
>   */
>  #define A6XX_PROTECT_RDONLY(_reg, _len) \
> -	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> +	((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
>  
>  extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
>  extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;

