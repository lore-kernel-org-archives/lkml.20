Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900397;
	b=uvai7XU5bQHj6AX8INqtDTHIWt1T8MVa0kpg8YV+tF2yNb9H3X6GUQg11p+WpKFTbwHv
	 anYp0euE7cAYQWNeNumnq4jtQeIFbLaxljzugCyAoq80jhvYXbJ8cK/FecnEhmer7eJUn
	 mAS5NS0duZ+N2knTLiBcEIbOlAuzbDxbF5V7g3ZNE/yf5Ti5Muk5Kp3SXTzb+aMk9klBD
	 da76me06Sw7Q/yOrrX9l4Sd0zP+T+5hCKFK/bhGjNM6776RfduSP4CPy9V4AMwblACZj5
	 gfVoT5GU59vEjk88uostLBOnRTS/oN9XGzTvlOmHQw0+FQ6XgK4WE2Bq5MnLpxx2LkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=;
	b=HuJjdr7M9CukZAP1AsIJcPw01o3B5pnMO9TEMea7H3s0lY8KcftxwpQG52c0mi4F17y8
	 j0mt1+TQ/XrDu3AGZy41Amz9ngI+9uA2zCIimZ8J+nI5/MuMB9ZrS+AOLbQktIaO+2myr
	 L3G2ztrIecKFDNjhRRO15nWahEOR652pLEsVWTevQ5ccb3pNzDc/gWeUfwjwgIqGD1kIw
	 iaxkpr889o6x82OZC18jsl1F8WFQZ0hvFb467TvcWt7MtvAytzisQ46MOh6k8WEYuxYZm
	 FXu0pFTm5mTjxpePKXTJ2Ht4X3EBH0AM2UEPPJCREFHeJH6BdJcpvIBu0mH9l57Plhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwBI+vib;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHZX8XTf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED07606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED07606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwBI+vib;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHZX8XTf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LgkG3980596
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=; b=lwBI+vibggJsAHUf
	TCibgt8UJOSKTM9ZWDAoXdJG0eTAAwN+BZs2Zfqr3dl2WZWedkfVjyOfA3EinHVn
	7bchx+Z/R3g8uOEhAqcCgXUbLziRN0fwiN6TEzQhLLXbKw4WJ54GyZ0NTu0iKJuW
	TXmCGPXJFioMr+f/kIbaxGHV2YuKhzv34o80FsQY8REGgDdgFK9WtsUgIVY8zKCm
	vTpRHHcNXtlAvgyrszEI5zySfJbUUzi08aoRjpEsfWC55yRUJ3T56dReAwULA0Jo
	iSJgJtF5UNS6JSsKG5emFVcH2GfFcvaOOm91zowj96zUKltq8OpoJjaYfb+j0MMO
	kXWBnw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd07gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:26:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so3391219a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900395; x=1795505195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=;
        b=QHZX8XTfy//y9AHjo5mjbBuzMVOo8P9v139xj0dLBmLqOTv9FVumUmBNom56MPtmhe
         axIugMLN/Rb19QPVvv7Jd1k0KU+ZFF2G7wf79E6TApllfP4ocPpiyJPAARj2WYBXqmG2
         vYMyrVGt2kvY88UiZOPBAWI/fWZIqTnM7J5qKIaUbe+BjhlGJ9Kujg4eX85xfzkwko5V
         oS9vWygNTME9Z2RvLxg2uURNlZMkBUS4KLajwbO8NDnzZ2N+7o3w2snuGBditZ0xslx/
         cIMSGGcbDnOS8DiM09eurIP/C54fe7nMnaoVGSydPAJB7aWjdYk9uyXGW0okRq7AH7cy
         XrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900395; x=1795505195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=;
        b=RUqEbFm/BiPWhYpbLr9+EnZjPXxbCMyMHu4uoIY8EZHm1UBBoJgg0ssnEIRhStyGCx
         a+wLKXngw1Y9eqR2IAR0JkMEyDETixdXzPqEcFc9643UZBw32b1BOKiu/9yAPOmicM53
         95Jhhe/Swv5Ed7hDwQ+6SpoughiPPT4K/LLZWPOO+A8LMfOheMDy80ItxwhQxi71AoJx
         siNz1a++MyMgYiqYR8p1jnRia95VyHLQnvJNFWUXD13nTUaA8GUs0JnoJARnRv7NGC+J
         7g81/IJrKS7T9OqjYTlitJuZPT4BWZZp+pVDr+LOiN+qCRXkB+uePf5ErS9UsaasFC7g
         52kQ==
X-Forwarded-Encrypted: i=1; AL+hErG1micp7s5mgTWU6pAe0UUrwyjewiNWkkYLeqzxhY8vk6VSuBUGX5w2zPG+Unqa9NK5ZNglSU+Z3qm/dRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PD4GcJKkzFiUmDJF8Whjbp9PABb+izsLj29880y/TX2RkOuoZ
	hherA8epa7K/vYumIyUEGZ7Av6kUDaR7zJbHfPpHaHxPGGGQ9EfWzHChCGYJlLQ5tYKrYHHIleA
	78/kFf2KyAmWhNGEUJwoPdTwWRCFiu3xDdjOfDJVRrqx2lsyzWRAGNL73p6n2vYy1dTM=
X-Gm-Gg: AZFdTZf9atE1v9LUWBH+FzuK/rsiP/P2KYA8CGDqrWnYAn5BbP3DZK0jfq9rZ3mmy4D
	ZfbILNBBBZGHitfI41P4JoRpcTuMds1wGDTzloPQ7nrVnUbHH3GVeiRiRwZ9sS7+Y9AM5dkRP0a
	/nLxKjOL04Zzkb+DWa8n83CPcGNQ1/HRvv0BqTnA0IWop8zcAspdW7yuZvczk2fH7qsq22c6I6I
	0M4bJpdrqvg83mS06i2j5J+60V/bIDQ34Jszfyu1GhFDERWVPYlfbxyf+GgB/lnpDc8ZvNNZ76g
	263dO8NbpkjoNAuP4Wo1OzEXjGTDJ+VdBMISnFc9jBtzizSFzNakQLH4YdUkpBF+g6y3o1rGBZz
	Akd+aCIxZ/OXz0+To8F8MPcDpRCBWk2UdhzOHfVPlKJQo7tsU86UKZbAEkuvHeRzQiiF+yG+J
X-Received: by 2002:a17:90b:53c5:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3bf8fa1admr117634a91.35.1794900395002;
        Mon, 16 Nov 2026 23:26:35 -0800 (PST)
X-Received: by 2002:a17:90b:53c5:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3bf8fa1admr117617a91.35.1794900394563;
        Mon, 16 Nov 2026 23:26:34 -0800 (PST)
Received: from [10.219.2.72] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe78930sm2697549a91.12.2026.11.16.23.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 23:26:34 -0800 (PST)
Message-ID: <d880b084-ed36-488c-98bf-fe9acf757464@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 12:56:29 +0530
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
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
 <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc01ac cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=SKk0sALQ5wlVL1HxRVsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX20vBcrXnsWS7
 advbJmJ0Pt5Xjw0O44ijQKxg9gz5imOdIISfC6oSiPnS7a+y42elfqUxbUVktATOdtNZPB30M0G
 RLGAzhUEyDJ31JGQIf6gqkSGu0LQqzA=
X-Proofpoint-GUID: oWnI2DxHEKIdUx6qBJqA1y39q6Vx3l-M
X-Proofpoint-ORIG-GUID: oWnI2DxHEKIdUx6qBJqA1y39q6Vx3l-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXzY7KO5YHjVMP
 73hcsQdTue1HyKoW1qE3ZDRgiV+OBfnvjpxiH6ZmN+T+ktKydnNcirtH+fKoGZxgtK5vC8c+ugR
 pomKPW7uLhJ9mcOlScdR9NUg/jTdioFJzYjCpdpWmOZeWBC/QDvg/v0v1rd82Wj/1bqFcsB4wBS
 G/B43Z0g3lRZA4IxSvMP4K/1V8X4OufNxdoAeeMpqk6qJ21aivf1x4JPU3CJZKuv1qwAdDZXQB/
 OVTZJiXlkemAoQ9Mv098kjYB2YrFRgL4ocStewixbzfUo4LS0hREL1J8mziIViF49A6FJYtC+t1
 eYesvM3YEP26xaHNWOXVGP3VLkIuzGuGZ+uuIpjhtYDLLLdhn19LM5btWDngFteJosyIq7FohmB
 /xGKVWK1DY8wSpIEkcRKHZnz9v6T7TF3OlKSs6PYEW4Vl+bjKrrVveYQdXJKCZOwiKuTDNmv+tQ
 SZ8U/XOwTIiL/Cf7UtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029



On 9/8/2026 6:32 PM, Konrad Dybcio wrote:
> This patch produces dozens of compile warnings and is not split properly per
> subsystem.
> 
> Also, it looks like the data you provided here is a subset of
> pinctrl-sdm670-lpass-lpi.c - is there a chance that the block is directly
> copy-pasted between these SoCs? Are the extra functions present on 670 also
> present on QCS615?

Hi Konrad,

Initially the i2s1 functionality seem to be similar between this new 
pinctrl driver and sdm670, but now for further implementation upon 
further inspection , there seems to be differences between the 
functionality of this new pinctrl driver and sdm670 for example : i2s2 
functions from LPI GPIO 23-28, will send v2 with new functions, hence we 
will prefer going with this new pinctrl driver

Thanks,
Karthik S
