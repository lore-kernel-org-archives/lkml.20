Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572030;
	b=WsA7VL2LEPlNEMnp54M1g1dM6M4AGvUb1ExBqS16wyF71NoDKKd0AnU5Nx1GoLKCKUFh
	 AEOWx2gIsYuakwGev3iCZ7y1IED60RRu80vxct5fUqEly/swy4NLOvWLJtKfKV1v7gPlU
	 eXwxcPqyCFQebkzN+rSK7ljmnrM9KPQViOw1rBDJJX17Ugj/mH8JPfjM7dlvRP7HkNin+
	 pzIt5My74E448RB0tbmAyNglWb+tgYRiOcRmrsc1ewH7prW5iKuTAjAibwdr6nTkNFrc2
	 75p8GjuVNQq23Oy9BuZRTDzdA+Q4mYcbzjxyIlZ/DLG5/nuKE3DaQPzspYXqQCRdLAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kpoys/1kxKqn4AHu1v2G/H664oi65sLNEFT40K6LcKU=;
	b=1KLLGc28yP7Dyt3gmxT94u0hw0Rmt8qsLY4xLVgNDI7EsKl2zdOI9NLBMrkh/ne0I0xh
	 iJDglJqAvOY/67gxlW+2zy4pzmtbp6TIyJr668UuA9FGVB1i7K7aPDxhqPhVNv3GqG3pO
	 q9kwmKYVUtR8nji3cicpnl3OWCKBTozFJKX2djUuTvQLPuIR535kA3hfeBWH7BO0Iqf+T
	 37RrfIQnTa2+x/AfqUWR7HaxQuCY36UpB/aCNiHo1PvzVDVxJcaAWrWh4MO6dUPrd8so7
	 RiF16DRh8F0gWcvt1OaE7rY7XjSVeaVPOOjSQlhb9M9gAC+WVU5jyST6ftfJ5TDvfxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CjYxi8nj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Emo40QNp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE67B60A6F76
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE67B60A6F76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CjYxi8nj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Emo40QNp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jL5Z2848643
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kpoys/1kxKqn4AHu1v2G/H664oi65sLNEFT40K6LcKU=; b=CjYxi8njMzWuUsIf
	P+qmKKyvQPvo53I6G4lnQMuJrJejY9WR1VnV/XrTOkezdFaYPo40gv0TPZuz2fHb
	cMOk5aWqZ7gqroeQLLKOEQ/2unqAFyRXeWZh+llp4XpN+Ql3/mTkj3t5nvRxdSzS
	4y4KVJWSQGhx3a3cxbl7isSSVRTa71ehkW4BORaAwqB7FFqTsnMvAiElIP3k0JZ3
	0Xt6bk2M0NGBv0GJ8vCH36mAadljju2MIOSncloxTuMM7tTtqFLGbC8tywg4gPHO
	OSO9UNunCrBlqR6k7ceL7TWYgHUI9XOAQHYjibSzBPI7m1rkVhq9S6D3WO4rptYD
	cYyIww==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9ar3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179ef12a03so2781376d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572023; x=1793176823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kpoys/1kxKqn4AHu1v2G/H664oi65sLNEFT40K6LcKU=;
        b=Emo40QNpNfIdTE8zrKxUPCtotBJknDvUlQgmuFDZktvErDRMLhoPzwBn2rq7/oYrnb
         271QCqHRDdqrjZRc352lSSjuq8Owo+KdsFsLMhwdnI0JRAq6pwNsUkJeWWcVAZI0WXCe
         lQk5JQuafoXstgdQThsJ2kmn2hvd5GkXKBEfvbxaoIA7OGItPBmPPd0IItwghU4tr/C+
         AJDpDuFqJJxH3znAlx1bTr2OvKCOs4Pctfa4iUZ26X+CrkowKlhzq417NdKEDEYudfSX
         riOr+TIMJrMJRLwMRE4BFDvbkw3DPoefH35Zf3R3FWdyRwTrXoE3DkUivVXmVeQOHHIE
         cxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572023; x=1793176823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kpoys/1kxKqn4AHu1v2G/H664oi65sLNEFT40K6LcKU=;
        b=nHt2N4lrLYgFHhs7Jz30vYT0ht5TQaHAntZIPI/G1C4rfCkqxeTJy6ZieiTX3EWp4P
         qXIx0KnVWqykTMJW1QXdwt0PWTuq3xx4P1jAXFyvgwNkREoBCKMIHKkGjvji2yv0+V7E
         bCEl5BDybO7BlXosadvjbQVBv0yb3uvEvexJN9JTgAopIisFXRsymjkxshgDMKKN/d5q
         qvgntCU+069858LlcGhHYFvm77HoTYYAhUh3mF54pAetm8SJ7yIQ4lP0rlrHrvstyFFB
         DWVMK8XUYoOlDkpiLhnqKfyP/wizZb23+0FUyFxZFXG5qh07cfvsdkzRFHOV9/Hq0afG
         Y1Kg==
X-Forwarded-Encrypted: i=1; AKwUvBwVqjPsNLDgLiAghRvXEEKiloY20POpr46b/C5NJ21vcj4+FvTtjrOzyJu2f02/ivG0OsxWcw2z7rdO2XA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5VHQ6T43l1CsMMw3yPxDZuzczkW7ENJ7f4RYyB0GQduhYSycE
	ll3oTJ3bb+5mqU9RgAcr8ZwtArMiMEWlNKtz4vWsyJSchesFvpfgkFGdBKT8Fcxck3w+nZowx2L
	4gul7ONiAEUa+f8TOOV0x3Ke7rALBZjDBFg5JZ6C/cI08HQkh68KAazPwY/c4c6Jr95A=
X-Gm-Gg: AYBFou0cEjs/25bbUR7f0opN+7ILFxY/SHiy6RIDm0d+Uz2RTLIdfd0Xc+ezYkWcLto
	9uunjr6tpeaziQgPdvkYxMvi+65jPWkImMdplkY0WM9l9ISWetFYzlbZpObBz/h/vzjOMlqCLHZ
	MmggQg9/nQxSNka9kGOOovbnV9Q6YIa6giJaPcmWtCvNK05cAHyDlZPHKZbC7+Y3HOxZTl6mi3q
	jrp4wh1/Z/O+VPiGKvewKGoZPKPq7C84k4zbVTMN9gW5XZ1/r4gUY2T1AGuCsGtmpKL6hAl1ZWM
	1BOLL2FLP94sSY5mvoWPjRnln5WOct09SZ+HMoNXomqoXX/JxSQWG8QKs78hDC07x353nVZCxxG
	nPn8pyPKLDcwq+3luDrEB4Q==
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr356219685a.0.1792572023184;
        Wed, 21 Oct 2026 01:40:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr356217185a.0.1792572022767;
        Wed, 21 Oct 2026 01:40:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130691sm613327a12.23.2026.10.21.01.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:40:21 -0700 (PDT)
Message-ID: <daed5a07-7d4c-4597-bec9-7a537d0af4a9@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:40:18 +0200
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
Subject: Re: [PATCH 06/12] drm/msm/adreno: Fix PROTECT span length
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
 <20261020204728.28844-7-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204728.28844-7-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX8gca0umOiyek
 kPhNTbIk571xDyHGPrKM/1loxY2iizf9dJ84ZcgAsVNpeU8TfVKAmAjRTYY0g781bX2M8vnGBTZ
 qm++c7wux13n7eRmj4ntNg7t2dBDCr8=
X-Proofpoint-GUID: GCUvMayFg1Oo-fVOZzHjZln7mUOE8Rw_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX62OnlOXgeaDg
 I8bFmp5YO2tnmCJCdGjmV4TERE9j4y3cXZZeCxyIaB9PihUxbSbs+2PgfnYGzhCdYCW+2pmf26w
 UCHKdUnpOdInGVZu53hvsXNtGIT0UAe2dgvicgw6SbjdKn9pgBaySDLYPbkZhhra08jerrd9QMP
 zXp3sw/ZcFbpSyTohjpR8YsATN37Sjdvs2FGT1QcK7Q1pKfXM/lKSyAycS4c3+0JdWYkF1zjAaj
 qTTWKotWeuBBPgTmrpef9vwfGtGn1eeMwMBl9XkqVVUypdskkgY5lY33Hx30Ez8Y4zc1XyqiXl2
 cw1rMLlc+WzyVVbBr2d51QoNYHDCgKTJyeqWnGCYI7s0OJ23OwEQmD4eHmkrGRhhz/da0JFekdK
 IldU90/dKPOPRPuYfhpP5AOtmII9tak+5+CrlDVsBq1fq2i9rOP8QwJs7jT3Fjz1f2cFJrbdjE3
 IdfccmLeIp+AEs2maiw==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87a77 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=swWRwoZvoC88mqOtqHgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: GCUvMayFg1Oo-fVOZzHjZln7mUOE8Rw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 10/20/26 10:46 PM, Rob Clark wrote:
> Don't let the length bleed into b31.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index d60cbfaa0d8e..5e1f35c83d63 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
>   */
>  #define A6XX_PROTECT_NORDWR(_reg, _len) \
>  	((1 << 31) | \
> -	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> +	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))

Time for FIELD_PREP()?

Konrad

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
