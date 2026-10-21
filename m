Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571936;
	b=cH3t8RcWTaZ1U3rxcrBBZ/QYrE1dIZ3v6j3BLX6xJ9UqdzONmdZEn2JDjfCfRC1lsQbf
	 weyVZnjUHXqNlesiKeFIMQnVA/EH0YhUybpqz8gDXo3P8Fck4HsiTzeCfWtmBkdNVLthS
	 511REKfuOF7FcF98gpO1DnCoIhdWRfE4y+MYQwFRMBYDg0X5OMS8jIOBeIM+b/8cphr4W
	 Y36QoHnGuJdPmRxuI+sPx/uYK0RvisfyhdJGC87YKMCCgotpaXF1oWTw3WZ9zV6+ypEme
	 YpcVroiKIquBeglCmhUW2ZrOpOz3ebIPy0jBaBR0hYTpBmGJ6Gft37+oqnJ1osgyzrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=10q99WjpupYyXoAqEGbsDSnGwWdgp3LWUj2x80wFg9g=;
	b=g7b66yXSLzNPYBIyIL3RGqpVqhoJHSipJVhJFlqUnjgtAYr+keZwZI/nRowVCbhdqxnK
	 atY3fEWB8sK0MgnJFCiMDRhzpcQTYnIZPuDjUvWiS09OaNfFZR7mdmPjE+wVxXeLPS5m5
	 UbaatdknZyQvqoojDb50dyl3CoVb39axxRcKgAaw7r+QOn+rSjrIfmwRe/xCZG1DGlj7M
	 RKrS+UKfU2hi44C5ZQ0+aAlk1U7YJTS2/Ww4BJTB2JBtbqb5qhjln8Pi7b6bNImFLHZTh
	 w7A1yamGiqD1Q12ft//69yozh2ELspGDM4h3qr4Rpr0tdLF1m5y4CNcwu62EcZ/7JAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBP1AgCN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5THkjeN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A85606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A85606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBP1AgCN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5THkjeN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8cdEU644174
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10q99WjpupYyXoAqEGbsDSnGwWdgp3LWUj2x80wFg9g=; b=IBP1AgCNXnfxKQWs
	U/gF6I4kttmVJBgP+n+m+w1mQh1SNWfkVPYDMewQm13NgtuORAjhg0dJtMxpqUXE
	TuKwpKXCL1WE7G0F8Oeb+JZMNvrfs6zex1hf8PtQKWdBJmth2HzTbu2AqD2E8WNg
	79MaS4yUU1GPhHx5gQBZA1tj5tzs40i2f6ps8KE/R4rbPgvGkggDy4n4nM3bOf6u
	D2BdEpDYiuail7KwS2VxG0yIIT8WsEn5NVRTDyWnZfvJ6oNheQcfRhxxqkgSO7yC
	n258RB16rRgVP6BZ0+Uzwrn4b7QOYu0g9HPXbgaELdP2kyD7PW66/58dcuwG7rIV
	abvBcA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajjxtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:38:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so1023946d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792571934; x=1793176734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10q99WjpupYyXoAqEGbsDSnGwWdgp3LWUj2x80wFg9g=;
        b=f5THkjeNNGZCSZkmJzhLz3FLgIXAOHnKyK4eL5RKVzeu1wxkIzJSide/BBPfF9ZbEF
         is3CeA+EgISIu+8+/hgJQ4smzSfRucqUljXInxr68kNINYDEQMnAH+XhyT/WCC4NM2lx
         bBmmPCo98lw5hqjJX94cwbJVls4z9U0b7BqNecn7Cq0AQJxcMTsmjfp1pUwrAynUYVnF
         Tj4CtUmy8+mDejmEt4Lo3ICWp57hPbkI+UfsJk5ezFD5BVQA1/Nsx8xVDQj9t2vcf3/Y
         lom2MflvxTd44Oovc5l+VjR9jT6OSmRW9qcmTj2uZFMQt7nZj6/2E7bfmiUYf8ck1fKa
         hOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571934; x=1793176734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10q99WjpupYyXoAqEGbsDSnGwWdgp3LWUj2x80wFg9g=;
        b=RMhjr8DEXAF7/ttM7hZp8o0laivlojBACUVBcrS2ER/TfN8rIOMG4JR8Aipl504rFN
         oQNVdKT9Ilgumf+JXMz7knh0KqgyIibV2LtIRlRSqNxUDemS9G0QZ/EBNOU4l5TVQSPk
         WVs5LiX9Jt+BKRGjVsAqK5U+LfyBFFG4uw6NbC5te7DxzNwoQXo63OkCEx0uP7BhucJU
         yHqQm0LDFvLBB5/ld581sONkPaxT1hcW+FSb2Dx4vUaIqATDayqWevEo9FCpNtylhWTj
         MVP5LQiCO8LhsJC3nTnZbDKgxbQ1FL4he5emfLe/Rrs8oMR+LvYLuU9yeb5KzCD0I/NV
         wGCg==
X-Forwarded-Encrypted: i=1; AKwUvBwuhEalHbhH/wfl0nlSUwXMY/6p/7gk6z6dybz1leXH+zQbc3+A/spB1g46AAhm16kzPk+6sVfQ0rAiiPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNF/R2ZWJYHhrDjsK9fZwv+3BD3W2XXXYtwqjLn2SGe6YpLIFL
	deQmtCoKA1ojHhnHgwLn64noC7LrIEm8I6DekZX5XQHthpmMhif+cOmTLVFxv6o1uUAevztcDZ1
	iQjMkDtsUNrLi9Vj1Mh8qIM2777DoaTvejUXud/YmnGt/mind1HbJh0ZeupNkPzyYXT0=
X-Gm-Gg: AYBFou0ut6IH6YUgwXcoxR77qYrkBUhdjGRvbGyQW9Okn/dt5AqQDAnXNtvJc56+Mjp
	nForgeWH8C+QOsEw7EpG5AZ1iiwuvZU60qTxJTtKSkOpahuahCneZVxzUQ47Kcxgqe3nFO8n6dG
	6AFBqDn7Pyhs/65XS8lLnZmBoDqJivTg0WxyItQs3yKsP26sz0tkoNc3xH8IpD2qbwUe6bWRjut
	lmhB9l1Q6Q+E/T8jjLbcrsFMYj0xG4OUmYEtKqlYczZn+5apkEtfafeNQ9P3YvW+9ZG4YKT2LAw
	dWbsKUBILipQqgsPXCwfATjNLw65kvPQRqMCrnja30IZS2FRtBgA5zPxlj+SJiZmpiuVupm6Ddw
	Gqb2q5XsqQLD2RWTKN3SXrQ==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr338659185a.2.1792571934448;
        Wed, 21 Oct 2026 01:38:54 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr338657585a.2.1792571934003;
        Wed, 21 Oct 2026 01:38:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f77729sm54778566b.25.2026.10.21.01.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:38:53 -0700 (PDT)
Message-ID: <c90eb47d-0eac-46af-9806-8404f5053e38@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:38:50 +0200
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
Subject: Re: [PATCH 04/12] drm/msm/a8xx: Allow nonctx reglist to include GMU
 regs
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
 <20261020204728.28844-5-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204728.28844-5-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX3U2SRbcpDaS7
 040Vls2fb4pJbWkEui+EjGQMEWM0ZQAtnhNswCeZkHiJgDbQl9q3bTy3iriBxhyylCcvlbApw5X
 A0ZIQ6tkZoUvl7VqnrAnxyWE/R6i/yMCnf/BtFlS6AqiDurXmXH1COD5IEDi6vMNiUeoW6u1jbz
 rvMTKkrlHLSvoNAAR231Zynmik8FCLw3NhDXroK8J0iBddGAi/7kZAJTT2PUteJvlxYlJ9jd36k
 dTxBr7Aadm4LwJzfA2tBh+bTX9IAXzqkvAyH+wcjvBeqedqVPlqYq03TRKUyNjzrq46ZWQN0hX0
 1j9703F2QSx5GHRsfoGiw7iHhpl5Rr0N88ccDf/WcOln8fiC4MaagJwWKiWNmMIogHV+GkJfrRc
 KOWscgVHm0QO0PSF6ihKwIyBrgqaZbfEX3WNBkDMLCUNMvRY6YligWC+Fb6F3RL+oFLAd267z1w
 BJ9NcbEH4riNmN4M1eg==
X-Proofpoint-GUID: vly-x-3PBpdHNXSn_f9F-44KXz6Owx8z
X-Proofpoint-ORIG-GUID: vly-x-3PBpdHNXSn_f9F-44KXz6Owx8z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX4HOkMlIeO9iT
 9oTjA47IcZZ5lVIWb2hbQykx5kN7PxmTBC4kqgWUkQ6xeYtySPETgDKrwbIWYhdEjZWfaxsj4e5
 jliMJq7jUcM55rgIaxIovsKag7bgROk=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad87a1f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FxG1VXWaU6FXrht2Wa8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 10/20/26 10:46 PM, Rob Clark wrote:
> From hw PoV, it's all part of the GPU.  But from dt perspective it is
> it's own device with a separate io space.  So we need to detect this and
> direct writes to the correct place.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
