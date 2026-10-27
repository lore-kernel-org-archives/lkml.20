Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100671;
	b=fS+ePMax9ZVQxrV1T4FZ149lLY6+0gLAXXcohst++vyOG8LT/bPz6q0mvQjNWCAjZkB5
	 opkAaa32nPBzUDsZd3y9p6O/lscqqjnHnvfJAECSVN3UtUwoc9un9r38oSoNvULdUws6K
	 6bo37NaH4CfYVmi8tB/JT/pzRVZvPYpnCzWXt0hsmUJatahdAYpHN7hFHC6D7w2jTxe0K
	 Zx9cPwbHYG830gGMhxJLYQdCThNSrzh5H2Dsf+dOxgSra7KQke/Z5uzBn15WhNr97Om9w
	 00T1DmKeiNbcwA5g/qxvjfrMAvWgPk/GFeZzU8gdbuYriwoxUNeDf4fXF8vYkMS7IWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EZV999AdlRRtqkxVlOTuk2BEEI+idcTU+X5XEmWLzBM=;
	b=afIyul5k/AvBdJu9+Bpp+RBkwmopniOU92vh7YwV9j9xGEtb0HRQ7ixb4Vzr6bRkrswg
	 H/8fty0BLLvyHHSE4TahbWrHMHhZF8ByHnNIeRqtbTtGNkXpLLYFGv4T8jr4mpkVwBTeT
	 pmQ7qMHvcTEX1OlPUb4L+bhUtvg/7gwL0pMKVe7EkX5ZNlmytYfogvkr6hoF7EXlXYMXy
	 chRpBvl3sEs7rsCYtzI7XgLKF3fzeQGuFASq7EDsASkC+lbzma7NesI+mwGjJ69867lhK
	 f3z8yIml4bhpPRInvqjHdVEqy/Zd7kttqr4JIMg0ZUPG2nClCmE4GdDRyPZ09ZLpE0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CxhXrxeR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wj1yzZjP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84B7606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E84B7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CxhXrxeR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wj1yzZjP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe4XX894410
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZV999AdlRRtqkxVlOTuk2BEEI+idcTU+X5XEmWLzBM=; b=CxhXrxeRo0uHosVs
	d+YypxksBHMEuil3Lvq31ZAu7lZ5zUP/I0rhgeninKTHNegcPkDehC1Z7x/MhcqX
	57rao/AG897OTeTj/a9DdWqqBSTHHw91oaItygxwnh09mzR4dcnYfEusq7oakmi4
	FWOfMn7mEva1j6baGb424lXhwteRHSJKCoBsVedhOpCK/lmJ2MBEffZybvel80zJ
	bH6cvvvrVab2E+l9IiJCtjN2ijbQFSiSRSa663uHNgj1u4zlfyVdrv+zl4oLu9xJ
	zO0kxS0pnLRkwyxXHI9oS8iOJn0V7FDavUjXJfXEmAzVV3xC0fqx8YdITd1Zb7G9
	NRZCyg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smv837-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:31:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso103311685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100664; x=1793705464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZV999AdlRRtqkxVlOTuk2BEEI+idcTU+X5XEmWLzBM=;
        b=Wj1yzZjPdRiBfGXItQRWWjllGqBpNJgZgMteECHaIuQLVcsyV4hwobyWZL/bx2BNbn
         VkUECcWKl1Vhy5eoeeuaLLIwupcSRrUzZFCZ4deSUG9JSNzAQoGiphPmAkmehrjWvf1K
         QnYxmjaAxWcGMq7GjE03IoYSdRUB1YrifiBAE4S2n0lN8Z6uxaRHsIHbl/vjdeqR1Hiz
         S8qstLq6SSSwpMpQHcXJidBF2ofm20MqVHTckrkUIy+FPIdY9LDjyphRi5Curxgxipby
         XrT+F7lJDRHX7VDTMFMjcfXE3Ef5SK+vypkilPk8pxmRYcScq/krzWnicawXElXy6GUL
         TTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100664; x=1793705464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZV999AdlRRtqkxVlOTuk2BEEI+idcTU+X5XEmWLzBM=;
        b=wQUOnCRCbYrcYcf1Cscs6b+Yxud0MVBOuiCkYfatdq1V2KxigCtuWVOS1RKVSz2cGa
         jreB6M6/oe2aZGz1+x3jRaxTdEjZujrucvoBT8yFVBQs1SYrQWW69ZU22EOnQaBVZfDZ
         7Pe9/5yeLkqz+DAFcfphZc/EHiGGjFz4eb6oWWdzxxbA5GP8kgrJswZ6MSXCfb/SV6nn
         fMmvd3FZr9ceSfqiqvwXvD6yBZ3cOaIaKyuWKKEeIemY9zF54nQsIBe9CEnloAKE3HRv
         Wn58b8V9eyC10Wu+SX/IkqDfi0b0elwfer+fV1cVtDuo8ruu4CUuLCcLd4HmGWMF7mBJ
         a9Sg==
X-Forwarded-Encrypted: i=1; AKwUvBxYbk/rR75amCUM7dV+pcGLZyZNy6PuhnqqSV4XF6lQg06WbLCef1miXO9BVMpiEBZNOzmYVVBwJHvTzCs=@vger.kernel.org
X-Gm-Message-State: AFq9FYImUOuQb0WBVNAjBoFhRlu25SMA6ybItxRFAgB16i689nLx4rbf
	8H+AtNTPC7wNhBFAn9Cfnb1Ji4Z6T7rQl0/pvTDQAu+0HCLVsqd0jWApzpcds7SoASoK5VW1Aas
	PotvtO8yVf+69TYl2LepOi9ojlzSN623EVLFmcar/epkzBrJb3prMin1IfQ3WRdNYmE0=
X-Gm-Gg: AYBFou1rmz6NwUhKk56x9CmyfpVPQYSaHjE4cD3omE9AY+JjrVvmcZuZMED/bOGKMZ0
	XNzRBqYSnqbdXGybliuE/HKuW2gIhQZ2S6QbJMsW7y3pqnsEE6iRVQCpEexWDL2rbQ/AP73RyZT
	J6h9Q5EeQnYxmax1dJBhYuhv5YZWGYbbJXcZhXVRF3hfIJui5w/XHLHfcXytxVoT6NVKO35epEX
	Y6Z0ez1h+UZMFCqO9pIE4KgHYxl4Ao+NEeo+XJO9BW3DPoVq3xLlzeoHwItrVUughV+z2B1ea7f
	mwhThoAhbBnzN+5uo5wi0ZZ0Bj8trFxxa0SU4WFVhNT6o7zEnkqALxJcZR35hW3hJTNp3dcbkZB
	QR1D9qon4yQJWNkzr25PM0A==
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1745445785a.4.1793100662978;
        Tue, 27 Oct 2026 04:31:02 -0700 (PDT)
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1745439485a.4.1793100662389;
        Tue, 27 Oct 2026 04:31:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd0f6f1asm441101766b.0.2026.10.27.04.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:31:00 -0700 (PDT)
Message-ID: <a3096f94-ae83-42f8-a9ab-19b185eb9531@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:30:57 +0100
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
Subject: Re: [PATCH v4 2/5] drm/msm/a6xx: Program the PDC sequencer on Adreno
 620
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
 <20261027-adreno-a620-v4-2-b0095e028c76@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-adreno-a620-v4-2-b0095e028c76@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 34uIbrQw9nNl6TMFY2HYlhIjZYdLSbzF
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae08b78 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=27YcngequVK7hVtoIPYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 34uIbrQw9nNl6TMFY2HYlhIjZYdLSbzF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXxcGM/94pg1aX
 0ctee0brU2gBUuxOGeSuu9uENKA8GTSibQEpmR7hP6RTo7YCzOmUt/ZhYmn1NvxQRKf5XORO5dy
 L/WVK7h9ZG05YXh62TvqYWmbp1M72jQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXzZFFUscsPybj
 383S2jbJdJ2RBxzbHqG8HltfLSE/5ueMBgVNET04sMzYAeAvdYM1qG+b0brLDI1uZFP9CcrCAdw
 1U6XTzpCVxRHkPZWB0SD9nh/1+TqXUUzO72jOujzu4WJ169tKRvqyy3w6WSmjeHjGFxSyDGCDuz
 GplES5oCL07+Jy9ToA24b3ca2a9bFIuXUwtLsH6U5k17i4fOBUK+E8q61AXl1A9jMqZ7qlV5oaT
 ZJOV9ny5iuC+uSVPh3b2H5LykT4iWgab6SHdwDfssb9w9tJZkcNW0pxcxyu2ddw/cqIJHcsh3L8
 5IIXDn/x2zA9BAEhGsYF6Qu2oJNNcDMj8JyRWJs/r3taCZEg1SGKbw8XAGmHUss6U3kT83wzRmQ
 mtzjWnGxgHF52/KApORBE8gGnzqaDFFxkJ/fntNV3dDjs0a87PfnTKMQ4a6jGv9eOiQbQMMR0V9
 ZLWZqofymbLpZZ7cHGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 10/27/26 8:14 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Unlike the rest of the A650 family, the A620 does not get its PDC set up
> by AOP (the downstream devicetree has no pdc_in_aop for it). Without the
> sequence, the RSC never acks the second power-up ("Unable to power on
> the GPU RSC") and the device hangs.
> 
> Program the sequence from the driver, taking the xo, mx and cx resource
> addresses from cmd-db instead of the hardcoded ones. Like the downstream
> driver, also program the VRM command when cmd-db has a vrm.soc resource.
> Add adreno_is_a620() for the selection.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 35 +++++++++++++++++++++++++++------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
>  2 files changed, 34 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 662f09bec9d5..8d426f1f127e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -686,6 +686,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	u32 seqmem0_drv0_reg = REG_A6XX_RSCC_SEQ_MEM_0_DRV0;
>  	void __iomem *seqptr = NULL;
>  	uint32_t pdc_address_offset;
> +	u32 mx_addr = 0x30010, cx_addr = 0x30000, vrm_addr = 0;

We should grab these form cmd_db unconditionally, so:

u32 cx_addr = cmd_db..
u32 mx_addr = cmd_db..

etc.

>  	void __iomem *pdcptr;
>  	bool pdc_in_aop = false;
>  
> @@ -697,8 +698,18 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	if (IS_ERR(pdcptr))
>  		return;
>  
> -	if (adreno_is_a650_family(adreno_gpu) ||
> -	    adreno_is_a7xx(adreno_gpu))
> +	/* Unlike the rest of the A650 family, A620 has no PDC setup from AOP */
> +	if (adreno_is_a620(adreno_gpu)) {
> +		pdc_address_offset = cmd_db_read_addr("xo.lvl");
> +		mx_addr = cmd_db_read_addr("mx.lvl");
> +		cx_addr = cmd_db_read_addr("cx.lvl");
> +		vrm_addr = cmd_db_read_addr("vrm.soc");

but keep assigning vrm.addr here, as kgsl only ever writes there
on A620, but the cmd_db lookup will succeed on other SoCs too

Konrad
