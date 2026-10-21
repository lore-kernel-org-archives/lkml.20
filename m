Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584042;
	b=ZhegsjTHtchkea1xkcg+k7e9kEFhkRG+bTcNgVjkdteNy58WZWeQGO5a+tSZ+YKfp586
	 hQ00IO/vJhbRFaOg69Cy5eyiA6+bzlLT9vqv0urcMXvdULkAS6bQWmHcnPjrZeLhLFvIU
	 5y2esl6O8bvdgnaIWC5qOj7YKE9/Wa9tBlVlxaRQypc8pCSc/NIamH44wFqbzxT2hyjz2
	 2JD03swrTZzIPTpM+uucqTV9n3PLgZI6xAwXKAku2gWaYgGusPuxv1LzAFEvBmzWMevsN
	 IE9CjNIoEiP+Li3vJx9jhHjOLE+L0R6UTZglRQmPU+KZ3SVBwieYCU+0BfdG21kApyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584042;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7492lyDGCMJVk5RTZk51iOq1Kd3H7jR4clDwOkE2Xww=;
	b=RHxdIA9F0rNxgBqJ/OoQJIqyCRhGNtV7WR3xv0PRvCb6MiPMuy60p2XAs7jL7yZLyy4C
	 o045y1l4hD4b3Nmx/53VosVSRoPaU/KLx1+qz7Hv7+GwiTYXXiZ1ZhdzcKeXrTwPK+BZO
	 WRPidwwXEkxPITLUd4YS2vq2AJ0dE2/5/91DcPZTh5zwcGNa/MSf23Rih6Q3UIRjTF9Ma
	 r5DIuvjuwskZ/SZ1Q+u0LKeL5lkllYRol+tqlJUYJQ6j1TCNTb/YrNIoVWz7q8sD0S4EW
	 Y5U0JvjtY2pMoqi1nUUV52SlTHPcQ//m+fgCYQf+yTI3IDKGHAmVFZVPoNrZG4UKjwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cKo3fbec;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSfhO8co;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146CC606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 146CC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cKo3fbec;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSfhO8co
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg598977402
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7492lyDGCMJVk5RTZk51iOq1Kd3H7jR4clDwOkE2Xww=; b=cKo3fbechJkj0j7V
	/mI6/lX0+qidNJxs+cN+0pFj98rmr64pq4aGnU6tCHb7h3VnwzQ86KmbuH4XCbGQ
	P/W9T4/49uonL0sr3trUtcZRVUPJvU8DNa5RivotrTAdnwuH1n0fEmgC+vi2x5fN
	Rz7RLqiBtdUhnJ4rKS28zPImZf+jI5Q/h8mz2N38Kbbi4Ez1S4SyIWXsY7bFR8at
	Ob1794tBR9wqLjHB3C/HP04bPHHF0WFz1APOcNp+mL+g1FxHQL0wZk+SuEAHiPUF
	FHDFl5HY0AV2w1EEx0Sp43bIFhtMKwe1qNHzJMBItOtOBtvWG9aP68OBD+UZQxar
	/g1OkQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02ywk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:00:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e93f67358eso6946435ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584039; x=1793188839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7492lyDGCMJVk5RTZk51iOq1Kd3H7jR4clDwOkE2Xww=;
        b=HSfhO8co5kdydQnNxCwAeDgw3el0p5eo5IcSuLMZUq3i9SErYeVT1i0tz3JyEQxMMz
         MgM57yVrpz8DG9Z2Wiv4/EzFyEZqrH5RPoUXaX7cyBhJKA3/OrEhC5OMv1FHzv79l/Q+
         8thVFpMDLvAg0x6g7QQT/OOgzcD0jC0v3i38UO+oX3mPOlCn5FF3V8GIJYQW5jmEi/YV
         82L41/pH+kacZhCeMIlyx4JcZ+OuKAQaAWqWDMK4JcEGafNiASJW68CDGs0NcumiFIlD
         BuHBoQy1petRw4DzEljMrNpX3+Dj67ekMJKsH3kvbj5IBFLQXyBtlMvkw+MSoe/tFdXm
         RVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584039; x=1793188839;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7492lyDGCMJVk5RTZk51iOq1Kd3H7jR4clDwOkE2Xww=;
        b=kYtX/ZLkSR9MlLbZbTEE13Rn7mPbojom7mn7tj9MOE732ZLHLCXkjQ4rfHLtCsmzHp
         SUxARek/PbGmB+JswLmuMpluZI9IWwF/x23fXUpW+Qfjuv+oCB52hBJbfPPCI9biN8uK
         s+zdxxCZMxfA/CUA2SQNYrQmOZk2l84PBp5T+fozWDnK9jsuVQQIGIUvnkdueWMx/nJm
         53RBSCpeuFYgSrZiQ6gQ+maRIlLNvjFi8JP5YmFe5jhraRa983aZLiF1ug1+P/vqezpP
         3BWX5Bdb9N/KfJMR4A90lUBUj+lzjApcVLvtMi0TshJOGxJnfhPPPAKuNXSp4ZoAK/vd
         TxfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOL85CI6/7ew+9DI8jakMH1GR72Qb8BBgqOotwl+WFnDrLuEMpwBeGx4M0Kz867peLPYe9E3vzSjprfPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3I571HYqbxVY+tUhtujFXvYmmXDnpvZv464ZI7b3i9+ySeOXH
	ZajygrDWUM/6dbU6pkpY/5bbl4R6dJSMnsSJNbqHqf60kFW7QbZM8ymyNwZ/9xlHbwCSTkbcNne
	3jwEuzoEzNzdhgq2TC7IeQ8dHZQ/dsSEl3TO9HFI7xM+E84vKRA32gPrPbY/QvG4ixx8=
X-Gm-Gg: AYBFou1Om9iKZvTqNTe2H1TrWlu1q3+01bZFtFDgRYTFYpo0FdE53rnnC6T6jGV00/s
	BEYrYVE0v9MrNqDnVEuafQe2ggxTrxyuM2u2jQ5fMBuY3lEBQjChDxNR1nf0gItp4BaDv395No9
	MDJ3Yl/lHgs8EmG/7LTBG7fq1Fkn37O1Pc2BpOhZPhdrBcuAcOOT2B8vsBBlC3dYgLMMSbS7DhW
	x3sc5LlVN0nMKmtooAPRKD++vmi4ldouUEfLQfaCsObH9t+Qjwd1jY79b4mxzsYFLSiaGhk8oDB
	tvuaX4w8vbzJf68k3KG4usdtcyZmXj+xxZInt6UpANzFhZsI/1fbreaYQjdBvraNozOJVy4r4Or
	Ortl34S/KLD3vguIXliXw4eaByY7L
X-Received: by 2002:a17:903:2309:b0:2e9:4243:431d with SMTP id d9443c01a7336-2ea439a650bmr14235045ad.30.1792584038507;
        Wed, 21 Oct 2026 05:00:38 -0700 (PDT)
X-Received: by 2002:a17:903:2309:b0:2e9:4243:431d with SMTP id d9443c01a7336-2ea439a650bmr14234645ad.30.1792584038003;
        Wed, 21 Oct 2026 05:00:38 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b486965sm10235045ad.63.2026.10.21.05.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:00:37 -0700 (PDT)
Message-ID: <dd18e6d5-cb7b-407f-8e7a-2c6fd00359cb@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:30:27 +0530
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
Subject: Re: [PATCH v2 02/13] dt-bindings: display: msm: Document the Nord
 DiplayPort controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-2-a2ab9af954d2@oss.qualcomm.com>
 <20261013-tangible-wakeful-swift-a38f8f@quoll>
 <20261013-honored-bear-of-cleaning-bd8108@quoll>
 <425ddb41-cfd7-4032-8666-0193ab6b5819@oss.qualcomm.com>
 <565fd4c2-2d5a-4c2a-9ed1-c7bcb17efc9d@kernel.org>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <565fd4c2-2d5a-4c2a-9ed1-c7bcb17efc9d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8a967 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rLXGX9pe2IGxD4WxI2MA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX8CwiwWL9kAXo
 nI69d6NTMxqr8DIrAzJdyC7+l/pH7N3MaNf14rKhc1hKtPe123HM3VgwsKLlyvIcvrMwVaj3Z+t
 i8+aXVFXtLb9uFAcGtjQZvmcZ71WXJgOLVa198iHaRTOXUAjx4G1m7WqjSltOijIg8Vl8KCJRdZ
 xd0ZzEiwsN3E9BWh3MJEXF45wnK7ac+FB45fNoa0g3vO8M8K8pbpZ+EuVDH8l1TpykM/89cP9AY
 LkmHsFvbjboOvLAPRtnYnqgtGdx0xtCwzPeC4aDKJnbcOlRNLIEwyL0TDshEIcYJ0C0hgP5rNIR
 dQ1L+UIpYy70JYsiN+hpO9wqCdnupb11zN+WWeYEPmcElZHW6vL8yg9R0ZDMLECyJAp6VZYu0EB
 stD5U5qXFTjpYfU4NdWDSe10/S5JWVS6S6+/wb/ZY7Gv2/PE5aDHwqXDoyhFNPMn1vpZmIBCQTx
 ryHJDAxjFHdD6OPXhyw==
X-Proofpoint-ORIG-GUID: oaF2-6WGJ3y0JsA6nB-KMwyTq4sOrYDy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX+CJAO5c/NsZU
 ihf99yWkQi1dnYJXkfj8B1PGLnMUe66Oq1PsS6kg1GI5N12rr4M8TiCEjt7ZADodD4v3hkBcqsM
 2/XR7e0ymMna61fzSt7pUkCQTEW1ve8=
X-Proofpoint-GUID: oaF2-6WGJ3y0JsA6nB-KMwyTq4sOrYDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210047


On 10/21/2026 5:23 PM, Krzysztof Kozlowski wrote:
> On 21/10/2026 13:16, Nabige Aala wrote:
>> On 10/13/2026 2:18 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Oct 13, 2026 at 09:44:15AM +0200, Krzysztof Kozlowski wrote:
>>>> On Mon, Oct 12, 2026 at 07:02:12PM +0530, Nabige Aala wrote:
>>>>> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>>>>
>>>>> Nord uses MDSS 12.1 with two independent DP controller instances,
>>>>> each exposing two DP cores at new IO offsets. None of the existing
>>>>> compatibles match this layout, so add qcom,nord-dp.
>>>>>
>>>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>>>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>>>> Do I understand correctly:
>>>> Device is fully compatible with qcom,sa8775p-dp, but a simple to fix
>>>> driver limitation is preventing compatibility?
>>>>
>>>> If so, let's fix the driver - just add more addresses to the
>>>> msm_dp_desc_sa8775p array?
>>> Or it does not matter, because top-level MDSS anyway cannot use
>>> compatibility?
>> For MDSS0, the DP register offsets are same to those used on SA8775P.
>> However, the MDSS1 DP register offsets differ from SA8775P, and Nord
>> also utilizes a different MDSS instance. Because of these differences,
>> we introduced a separate compatible string for Nord.
>>
>> Are you suggesting that Nord should reuse the "msm_dp_desc_sa8775p"?
>> This would also pollute the sa8775p's desc table.
> What are the differences? Only registers, so no pollution. You just need
> them to match IDs.

Yes, only registers are changed.

Okay, I'll update the SA8775P descriptor table to also support Nord and 
drop the "qcom,nord-dp" compatible string change.

>
> Best regards,
> Krzysztof
