Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B3537A494
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957919; cv=none; b=UW5n5Y1md7cUottkA4q2VuxHRLdJxMuZNuZ/v/hw3xq+1WPZP6QiSp8oth4SuQHXJG5gXFdShNb94ifA+QT+9987GlyTLnFAeFkFSqor/++7WJnNJG5+GHDCebH+BaYXs8GlMQKC7pZttCQFWxxOuJNcCAXIYY4tUf0M27EmgDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957919; c=relaxed/simple;
	bh=npdUYq9yMIsLpChnrVFm65H8LEUeDfCG65JUETLKARk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLGTJCEpTBb8m9ZCn1HmDYP+3nB6RnwrOm9IUAMjF3ILvWAguSQS1FOgOUKNUw3ynbsnNloJ1lFPacOPSyF3UQO6v1dZN9OsumiHdiKqPnmRlW5+SlqfvpAXcruz4VbLLlaACqyXxXXMcNXdgLNBjaHhE8qB6BLWY+XJLtlKbyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2T3YKRQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hv3oAhz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2T3YKRQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hv3oAhz4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7tL2375926
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 12:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+LSBWZs6PrdGX4mxuF7FdvAqDUtCMH6i87wA9bo8R6c=; b=I2T3YKRQGUnTtlwm
	hUuW8rktwf0XSD4EZJnWJUJ7mjgwltsq8a+UkhgBCsNhXmzOuIpADyLDiI6vbQwS
	txwFaSMn+ZOVWWtecWe+ebmmGhB8OerNlBYNz4JAVdsyNt/kDX/Cw7CSL+D2zoGF
	pP+uxS2B0p3Gc+pB6kzNd7Mmwn8yT7a+EeNZGLtQrWPhuPo7X9a1UqHjOploYAb4
	bWG2Qd+mMScHqgoqezH7I7S9MShTlvBEXpPZYCYxmLBtatJ2xxS/kz2Aitnef8yj
	sq+gPHcW5Js0rbh51WIn7M5+wbgLTtS/dYdIKq6r2JacWireJ+IMXx48G2iIchQs
	TDOMnQ==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru0f66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:45:15 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-455ad408573so9121522fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788957915; x=1789562715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LSBWZs6PrdGX4mxuF7FdvAqDUtCMH6i87wA9bo8R6c=;
        b=Hv3oAhz4ie9QQiog+FSuVIBmZyldp4eLyXWgod1Ce8atdMCEAp2N6qRM+rwEvOt51v
         BExHrVYJ6FcyFy53JSyMlPd87G7I0mOLXP55EPXGyI28G35RuAo8ONBoT+k77KoLHi41
         hNbNrETaPD7HuEXzY/X672c8bG42RfvU3ND7vSTcUcFs26s7I70LoMJrgLzwpdEEttxm
         dYrCyUstEKTqTCxsq5T5C9eS66vF3L0SOFNFozmLwO1JKPncVm1sIwooIlx7Pa9Uytbb
         zIDbUbbqxW6jKM2n/60tCFXvXEzKMDVsfEUX5oZSXVkgrZljh8OgWkSV0veTgOCXEgDe
         iiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957915; x=1789562715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LSBWZs6PrdGX4mxuF7FdvAqDUtCMH6i87wA9bo8R6c=;
        b=VIIUMObtXZ7A+OsCSs1/wxSPHjyXXEXSLvbTRi0DNTnnsj2wSfYHhCkCho+gqS8OHG
         jj8xGuB/VF3MrdETDqRd8e4jJz89M7yiwQgCpM2rZ3UngMQ+hR6m2pYgamjQuYjvervC
         GuVCW14SppjNvEL2Vi8kv9Vs5b86xMlD2rxcoX4yVRRPvnoXpcnrBaQnM+9C2/bHjvz8
         S82e1s5rS7yXNl1kfgV0ZhUGDUlu0+8FfxF/JPqXGhjEi/9T5Wpw7TwSP7rSfDVnHcv9
         AAIinfjDQgR6PPhxNiurcTB7vvW8FzC6EXEpvYF8PDsny63iFqxppwktSY6b0Tq5yA0N
         bRKw==
X-Forwarded-Encrypted: i=1; AKwUvBxnL9iK5uCwF3nNGmGH+N7EIlZxEWoXwxJuiMY42xc2oyyGD+0SXuTvUOuR/R3zVBsT5t66c6KoI7IMpg4=@vger.kernel.org
X-Gm-Message-State: AFuF++nrW4lWJaMKcFCYDl3CYvYm8wM6NY3+FPuZ0z6MTWrnGSzCnURc
	sBV0fvk0y3dAkvWe+jrZUJyYSyshsmcphYJCFavAzLgmpGx+fHBnimC4yxrP+8GkZbtPIzAsQYn
	JMdPB+IMj42YQOKJPcUXTDdFiMwkyyDAjADv6dK54D8GGf80C4BE3jJH6YMuMuzuz/2E=
X-Gm-Gg: AYBFou3o2ueLEHr/b1vSdQKUXHYdaUq/Q1/1U+SaLxn6hexMDdmcE/jU5y6lj9bd/Lz
	Wk00cQDzQENZAJVkyIBvpMX+7c+LGizhq1Azogtz/7IuGSoo6EcD5Pzb8wBOzynwMZ/tPbhO8Pa
	EzyL+ThfRKIux6fTBQBKLGU8IzFt+kJUGZD6ecxSC7I/LPz6QZ+r5bCZoPWqY6DdZkJU3lQHCFc
	1/LUCzmniPwChB6DQ1yQQurmZD48lVy2YJkYxmFOJMSKDu6wasDT8SHlUAiA6zAigC73shx8Vm7
	DGojuBANa7r9odQDT4y85UBUrK2fzQnZgEfHWrR+hxevru3d+t5rlPHj950ISTCf26Qnahx6+sF
	8V98xdpAdUHHueq7xt+9RYUB0vtMO9g+r3YFEr60=
X-Received: by 2002:a05:6870:334a:b0:475:a1ec:9617 with SMTP id 586e51a60fabf-475a1ec9cdamr20255136fac.25.1788957914957;
        Wed, 09 Sep 2026 05:45:14 -0700 (PDT)
X-Received: by 2002:a05:6870:334a:b0:475:a1ec:9617 with SMTP id 586e51a60fabf-475a1ec9cdamr20255098fac.25.1788957914497;
        Wed, 09 Sep 2026 05:45:14 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47a7585b25esm5186332fac.11.2026.09.09.05.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:45:14 -0700 (PDT)
Message-ID: <56dd264e-d17f-4916-b8bb-bb41af063823@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 18:15:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
 <de0a0b99-9213-442c-ac5b-944a0f6bd432@sirena.org.uk>
 <adcac1a5-6d34-4978-8fce-b9b5a0361b76@oss.qualcomm.com>
 <23de3b70-6284-4c2c-938a-b92d76cdc088@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <23de3b70-6284-4c2c-938a-b92d76cdc088@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa154db cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=iCeh-t31pbVi7WQZdrAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: ExkHMUcRWEqJQ3ofIdz5BkjFPgkcLumj
X-Proofpoint-ORIG-GUID: ExkHMUcRWEqJQ3ofIdz5BkjFPgkcLumj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfX0DTFLVzEFX+W
 uYLdh8HTl9kGb8lnBqMmTSjyO/iS2gXdlsLJRG9J2VQm532c/PCsdlBMrgQfGHqyazJXNGPTWad
 FeaoSlkBgwNz02tqwrmrG0mTnWZaPkQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MiBTYWx0ZWRfXwQJ03xh8/PUN
 6LLdM1XiVob4VGnqlKPdQaLxK8ZYN7n3vyOJidif9z1E7iQnHAa3t1C1Y6fy/UgdFeJCr1w3d2f
 JUYTCdJu72/fKinpmcRjDscMIXPJiW7Kueo/+zc3Rfyox6pBqmihFLN/FWzPMgB0aBhidmy9PQc
 46ORIOFs4ydYX3kdKi14zk34Dv8N2WaFHtjCurPPxAZe7qaJtK2b0VnvtkwEWbsx25fE7XS4yB2
 IMk8RsQmaf8x9GSEBJuQG3xEbwlchId2xDa9/3fvy6UYiksHNGWWdc+lXyftFEm421ckpg6Lo1h
 WXJUSh+LBOIjsUcatk3JXoMDDA6QApbwEBJqWNaQpHdaS5Vgp/YsVp9OiybjaMAcWnGyORKbETe
 0c6i1rWZ8CIgLWk+ZKCj65hCIC0PIdrwuacllpL8zEFG7fkNZHyIRrGP/rB6XHi/02Ba+MGnKmo
 0UC6c0xvMjCqSkJUyTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090142



On 9/9/2026 6:09 PM, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 06:06:41PM +0530, Mohammad Rafi Shaik wrote:
> 
>> Although audio functionality working fine without this delay in my testing,
>> I seem to have overlooked this requirement.
> 
> These sort of sleep after reset requirements often end up getting
> implemented naturally due to other things that are going on and then
> issues crop up later.

yes i agree. The current behavior may be working because the delay is 
being met implicitly during initialization, which is not something we 
should rely on. I'll add an explicit delay based on the datasheet 
requirement to make the initialization sequence robust and avoid future 
regressions.

Best Regards,
Rafi.

