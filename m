Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658580;
	b=zPms0Zhs9wNVj0BeMkZLJQGR0zXAdA83oEKHO2PBfMCBtcHs7NOjQPoWyvzq0KoHzjoI
	 8RiFNed3r/648hVoBWLGbiH6zkBI7S8QgL/Gsa8T6v+ry+CpGHp/eoLzqS/OIuysuT1q0
	 LZHaWagAGoF/UdqOQRch+LPDKQjPJIzMCs3wrWy0o2GID2z+745uFZHtTn17iz1Mj5mGf
	 QPu3yHj2LhLDD+btJ6AOCtpocyeU0vI3Ot42shkugsnVE5n2gCz64wNwKS6Gc5S0dVrse
	 G8KcoG7TZmMDoJuIKBLWy7RGNzBEvnfMEbng3RdPjC1DjMsrHJl8h3n17j1Unyzf71Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=;
	b=Y/QiYaLVbuSk4Fxa9y9V+OiMIiSpwmxPGu4SmEwoDlfzD3p3apur4dGxFQErUdHczkVw
	 Vyfu3Z4mRJWF3edMZFYzO5q4xeWKJlnxcuhVxxRAvX9HDyiUK63Y6xjvJrZ8DGoAR9Yt+
	 0LcmCDb9r1n62L7FChAOm+RgseI2CIMd/PX9vxI+LWbe9BNx8YWC4PUiXgzy/5Moaryo/
	 9IOuUZhc/VHHBPkxRUJUH8HkliOs/SjNBbZPtHObtQV13Mn8kP/pE7hsOzrMH5dFhidJ9
	 IuRwSCwGA2H6sY/aSbkm8PATRqsfTiyQ+yfdLi8W7jr71CREhh2U230rl6Yxf7nhozA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCSGe98M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ichuT6E2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A30606A327
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A30606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCSGe98M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ichuT6E2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708bs3517459
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=; b=UCSGe98MnsUuyhDh
	cA4uW5rR5UfdQpzTvdb7KUu6cDh2Hmxp88qSgVTeaWnaG0yqed3z9VB2MdSfDRsq
	+yTRKUL2p5PDaPOe6cfSQdLfGCUTsJe0gbtZWp+/h3e7XTxmqc0SqFFnnHEcdmbF
	WXjgCfFgYoWxJr1covmyXjKMvaHEF6TXRbWgVuwAw3cgZMColKh8Qwff1DQjYX3q
	D+kMMoeSW5v2DBTAu/qdXd/JEJncGxt/vwCzQ1kft4K3PWj1gjPv6NH+PskCJMmZ
	6tZxgiyZK9/ttGnh05MPuQyBBjZ5D77xkVUsK5jyU80XDl7hk+a3CtCI0WKogg8E
	ods/jw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhfqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:42:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab868fe362so2497944a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792658578; x=1793263378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=;
        b=ichuT6E2x4Tp4oysE2ZRo7yJe+flVEBM/gy+fGinn9yrQAhu0HqgzF2oEcmDpmWES/
         JC/sIp0BjR1/b8HSQZdFcn2cl9f2jDWmV8jDeF3PYWg2E8+F+9xSjTNw6WwTYtp9pAJL
         si/eVwYdS1v8qMw4agZznSe2AqNFa1cvjCn4MK9ZZvWU1Rs1nEQ0+X9RVQ8/1DzB562C
         a8i5hF/lG7WuCpAx+cQr/5iiIPTtaPJxy7VizD49JHkArLTvvK3QhBVJCRxGvg+W6hXI
         XxyhnNJc9+lTnqth51DYqckeHC6eZqTRWdqulpZwhbLrx7hhG/HA6QRGqSA9nTfU7bXj
         JfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658578; x=1793263378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wq4BgAJOxS33r70ErOyo9pTWYNHSqnL5o2cT/KMQO28=;
        b=GAXqteVNFuRPOJZ1UDYxF4xLgUV/0aVPk4jErMvq+v9Vhtq2+ATVwX7xgrWyzJkFVB
         3eLrWLnljgfnzKTSDpT7szLdyhbx8VtYsf6YB3o9i4vk/nDPS3xUoiV0S6Kn7icmg06H
         OWHbCO9y6Q1qptdssl54uCCp2bBFytLcNRJbs7a/e+FTBG8IFRl7dugO6n24m9Mhnk6w
         1pxcXz52c9k7uFEEOXtUdnAni+ZkpIAVad7f7bwUjYFmejWiQ73+3OLz5BjKvWSrMM8A
         Q4YYU3DcTJmVPu0XJOI34Xkw9+/zCQxS62+AZZYxBTABQ/Iq+3fv2XL2Tvq7cRGFFmUy
         Y8yw==
X-Forwarded-Encrypted: i=1; AKwUvBxmTeamPyZocmD1BdyDoIGAbBy73ftpwjTRcdLvoadJKXydhkYYrYX7+hLNcBzOq54aTvHS6yTefjohfTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQXKyZyZEZSEOnJwZW2thppWYCbH9pgrjzotrrrB77uF3zYztd
	eZzIb+sQumM8p7kyL30/A/Y+0T7N9pVP4FAoPxLsjvGlrXld1uXzspRwbFTwKIYwwpMnCQF6JEH
	1xWYp2eFHQbIR9+Noy+jlrav6epvuOsXuYIcwFe9la4LNNGuXseVhTGtqdJYlfvUQJsM=
X-Gm-Gg: AYBFou2s59eVqPpbqiC2qISVGG3fKUyKgY2nBl3L4K0TtoV2fgcDjBfEHvA5RM9EULi
	zHUK01sB6bsYxCRWrcaF2PVnxxANiYAEX+E76I5ERfEolF9Cpw0BFvBZCSX+8vaslEApwtXdq0w
	aB1IRKXcM2wHhnlUF6ccrbXMubWV3bJ0iw1yhpwWCK9Za1D2JKu4DZjKXzMx0oC4bnjxR/qzIcB
	lXBkL2dDrVrVBM2mFpJtTIoXStjkrv96KXI0UgQ0SwKm/CxYCrojfPQyYiVhzFrQB6m6qzubYP5
	9LIRaAc1xjgL57mKoAnzVc5+jZYrc2vPnYCNRdpZpI6dLFElBDI3V1yMVsOxwvul+5mm5KWrGqH
	MUcCFfonUNM1ZbVfNay9vYxj+e/PA
X-Received: by 2002:a17:90b:4410:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ad86e97863mr3524480a91.18.1792658578405;
        Thu, 22 Oct 2026 01:42:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4410:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ad86e97863mr3524466a91.18.1792658577942;
        Thu, 22 Oct 2026 01:42:57 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada47f8ff1sm3380433a91.0.2026.10.22.01.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:42:57 -0700 (PDT)
Message-ID: <6f7aa923-e67b-4bd5-bf8b-085623d094c8@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:12:50 +0530
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
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura
 <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta
 <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa
 <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
 <atXJp5ct5jANeo0T@gurudas.dev>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <atXJp5ct5jANeo0T@gurudas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX0rfh7v/Q/CSC
 advXV9CiNjs3KIsXon5f//9oSac5UoP6eMlyhYg5GI1Dz1zTNtOJtsfIMS/dy61Rv8cXivQwqjs
 9DNnShsbioThSFAxRhBP4yiQeKVyEB4X9dF3JHeGTJCTLVxsun3gUj/F/oI1OotbRXd4CktvNmS
 P91M6P+CZFnNIZv29gW2i+e7ZJLwTqTfCifqmdVP1uzLnb67dP2MT60ikPfp58YM2BwbEU2OoiA
 SsWF7m4vO+6w1VM1h6hwjo9QA7o5I+0jJSB9GfexBsIqVaetGbZ6/R7VKaVEB+9fK8ZfgtXjWoR
 io7wm8uTUe49AjMSMJWuWi0hepJ8jwLWV3I8XWg70TQNOTeHh15oWifnrz7DWY7/qC/c94Bewel
 ylutXcBgzOWZhU8kp8880RcLKJRmNRY7elzvUn6Xq3loetk4N4kyQTK60P0aHPCqSbDtxkYv80n
 y2WwV7ODoZjRcZ7noKw==
X-Proofpoint-GUID: wZU4_H9a0OcOB7HmnBhEgNlc21IZIr8e
X-Proofpoint-ORIG-GUID: wZU4_H9a0OcOB7HmnBhEgNlc21IZIr8e
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9cc93 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8zo3re30kI2txGzbV-0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNCBTYWx0ZWRfX+NdL5ErKUgYu
 QpVUntTbDnHYcGzEgKlWzHiqCf4ArwQNRLXqWNU6pi8P5hy/jImHXFwKxz77LQfi6V6uM0s2Bpw
 IkcYplwwWUrqSJ4zfAwXcpOUbqDP3N4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220034

Hi Guru,

On 10/19/2026 1:11 PM, Guru Das Srinagesh wrote:
> On Wed, Oct 14, 2026 at 04:02:00PM +0530, Jishnu Prakash wrote:
>> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>>
>> Implement set_mode/get_mode support for PM8010 LDOs using the mode
>> control and status registers to allow clients to vote for LDO modes.
>> Mode voting is not supported in the PM8008 LDOs.
>>
>> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  drivers/regulator/qcom-pm8008-regulator.c | 75 ++++++++++++++++++++++++++++++-
>>  1 file changed, 74 insertions(+), 1 deletion(-)
> 
> ...
> 
> Patches 2 and 3 both say "Add PM8010 mode support" in their subject lines and edit
> the same file. Could they either be squashed into one commit or have their subject
> lines amended appropriately to better reflect the changes they are making?
> 

The difference is just one word, patch 2's subject is "Add PM8010 support".

To distinguish them, I'll update patch 3's subject to "Add mode voting support
for PM8010", I hope this is fine.

> Also, patch 3 uses the wrong subject prefix "qcom-pm8008" when git log on the
> regulator driver reveals the convention is to use "pm8008".

I'll fix this in the next patch version.

Thanks,
Jishnu
