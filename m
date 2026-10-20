Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504892;
	b=yRFBOBRdPpo0GwjxnoKm2K6bDBIYeqkjHe0Wr50o1KsIQNGh6GvhVwgStCMX9XZVEurY
	 6xXe0VE+Saln+GnqTVkK+2yqe4DouOFBGpFizkNQGmkUoS8lxTwiXGFZHNiybD4JGZn0J
	 CUQFffCxZFn7Pqgv7CmYKgEIznBGWK3sQcIRafb5ga0Dzwe/sMaxctbuEYBlxxWQV56BF
	 Y8kldjuBowC8BLxqUoAm1tsFhQsAxsJ0QN3a9cPb3hSnbhE3ph7nrC6YB60/vNRXPSbL0
	 LHhlpSNoo6CMkwVlpXFpaYI35zxpaNvnOtA2Hq70T4v+3k4G2K0q+AVbgcxoEQcQewQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=;
	b=bfi0aFCcdIg6EzCEKyn5ykGKvPx3Y0RLeZmiUubfJLxoRbsLMQjOhftfP3Il+u7wJf21
	 DRBYTMOA8n0K9ntCMzUDikTdfzHpEWXfpoLGCDif+9oqWqOaaDdpVi7YVoeutn9nnDEKX
	 0xedOs31DYsuBfnMSGnaUAWWz+rDyNafquK+lfuHUv4uUdGHdG89wukpD3uNLSbM2MWlE
	 kO8xZBY8S8Ku4oHHjgPPH79RuC/d5BVJQ7M9YBy8w2vgpzqIfP6YLLGcyDZ4awQUCDFgP
	 TUWwjZMqOJK6E+3aR8lvNoRQY2IGWy3+cnqUTXxthDZsZccvzZ4XHEUviXtPVsaNFZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqNYPlK3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fdfUd8Io;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 834C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqNYPlK3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fdfUd8Io
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA23e2298138
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=; b=QqNYPlK3iN0DZizd
	jG0edZTjx7AzM9Os37g5vfDpBPvpa8eoDAlkhL1XjwDuuhMIqcNii/gyGtdwC/dQ
	Duk9HhdRrssaJfnje4WOWusbTT6Zmdui7At6OMP33f8My2X8pf+YHPvjyHHMu74p
	0D9kZah66xD02sxC6KjzHY+DSYSj+h/9IX/WxZ8+5w5WXQ68LdBo9WW3O++6WJLL
	v0lxxwZGQ3j5cdgIESu2jNP0/qPscJ+UR5AZMgQMVl/HOK+Pt59CEaJLeeaVOY1n
	P0q7/AsDmIO+thg9Ozh8C5zEQYCap0qgnY9K9CHb5Wh8k3uUrZs/fWPCInw5aVBG
	7L/tDQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjsvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:01:30 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9909853d264so36635241.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504890; x=1793109690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=;
        b=fdfUd8IoEMG8upHkv9XsdZXrVJxhfAxxy6Pp1K0peZIFDXic5NBPMGRXPMV2Cwu4Kq
         gDvqnNhkAwM91i4aGRk7rhqX07Vbxqpjni+IY483Yw2BkDq65VSICqy2epTx0ijhxsxw
         q+j2nU4ApG3jTXvdHRRnv2xY0n0VCC4retSi3VmWO+GVz2tBHJ6EW2PUc3lIzzSL+Aj2
         NPdy3f5Yo2iNHE+y9pWZlWls+0G0kRjHIhs42I2T2VTZk9pIDxNgw9uaZCts/AQJW+si
         cwpfCBoqTghOe3fx6m2Y5o2VLF3r5o+bnKZir3vUYBqsOth2o9GtJkiiD1gVZ/S1mb/B
         oLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504890; x=1793109690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=;
        b=wBL5MfR2WdXdecDjAHJ12mGLDWe+zH5kcKG7xnpcL1OE8zbNZpIETqO2O5iEiXvKHU
         WGheB+ZcCHaoGiOfySjYkMXghy4puhh1X2W5wbzAaEbY0qUmyol0ghaHWCXQl4Qsudi+
         FV8b2r1zrFNmXDnqlu6s2o2BbTvtn9DUQmz9N/mYc12QZdxnIL1kM+Dpgcp94BEw8vdd
         T+UZ7d69NrlCzWi7SIuYYiSbO8ajgytQ508r/Tw0hVwMekrWyl+CIUR6E1/cpgTqNDea
         lE/gIctwa0HvEQuBvX402YTM3SNnM5TLqtYJBfAlcgY4QZ+U5TGiu5l0B7AX1ArcxbhR
         ksyw==
X-Forwarded-Encrypted: i=1; AKwUvBzISYVDWoc3Mt+xTMlWxW09J2ZFUZz5jSK6/oM1rcLfRLS3juADmn9gb1o8LERL03+GgdLkqoSVo9NU7wI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJW6OHRX6jLykVdhFKOZz7foTyy6KNmNl0U+5zT83AuJTuywPFP
	aPXSBgGZ4+6PG5KMkpyF1rhoJwZ213GWmK3O2tCGhRrA261GhpnYY1QZj6rbAcn3YPjKBfJVQ2/
	lop8B13O8pJaqbzRKBwLntp0rtOhAnQZhgelYboLRbHzx12zcB7oOyPV8ovzrNpWkWRs=
X-Gm-Gg: AYBFou3RcAJ9rQ3b7RHxoPxAqgSZdvFT6vOrn3OZzjFo59k4NxrZKEI2X4M4XRRR2k/
	8WS/9y4SKsbxC+FV2ajHdVocCKjpPChYJaY8U3TPRh5equ2xCvnAfNjauXrd+1rPT+CqQ9D4goj
	iqQZXCtfgUfv/6w7ZG2FaQFQ/RTarXdWwBVct/lADEMZp3zNkVC+H8Hp7rG5HHCsnzpYfd5GyVq
	EG6tWdVl2eNBiaZGg6l1uQDJvpi3zgHwwK5lwl/ysEMqLo2o9cdx6IPyh7DjioBuNnfFethvSiD
	jk7YmwixPZLEhVleXWq4JJEy19JHB3KtFyYjs1Dnsjkk8Aj8F8JksFoFpatLrs4DEedsCbW8q56
	zrvBr9olQoVUbJKW496pWEw==
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1651125137.2.1792504889503;
        Tue, 20 Oct 2026 07:01:29 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1651074137.2.1792504888917;
        Tue, 20 Oct 2026 07:01:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b0f75sm5333722a12.13.2026.10.20.07.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:01:27 -0700 (PDT)
Message-ID: <ad849e0a-5ee8-4df6-a679-ffd44c2972b3@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:01:23 +0200
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
Subject: Re: [PATCH v4 2/4] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <ba7830c7-9ad8-6695-f543-c4c419aa9133@linux.intel.com>
 <e4cec04d-2c66-4900-940c-d7d3d245cc64@oss.qualcomm.com>
 <f97000c4-496d-0ce1-318a-1df5c0de804b@linux.intel.com>
 <3fecb67c-81b2-6e6f-889c-01425090321f@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3fecb67c-81b2-6e6f-889c-01425090321f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad7743a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=SB7vGQqGIbRnJ8eduEoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: a_uN_jyoNOEW7Aq4T0qlnRP60Uxw86nj
X-Proofpoint-GUID: a_uN_jyoNOEW7Aq4T0qlnRP60Uxw86nj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfXxQkCaXll3Ksi
 dBeYwg2NlYkquLTcPWuFD2MSFEnKcGc2HKdJh/r/hEkKSi3VQKYG7P+3eXsbhBDGKV/Qhrz8Oco
 FPxUbeikY1l4j7kGZv2qybzBGmRdWHohAfIxcJMciK/Ku5RiF4WCC7UIz0EzPZl67RqYqLTENCB
 SKsg+iu4QAUJAjae5RQ4EhvP27XZ6NIddlOP1pON1+lpT1Z4C5qg2Tc9IOLj5N7SGPCKY+fR9QX
 DZ52tidmWpo4HF1VY3Xn/KFwNUnFnOCDb+Pn0P2lePFW9yCAl9R5ZJNv+O9WoN40icOJw1bIDUG
 HBM3NhnVG/DryDo3luqIOaeeu11j4+jOGc9ZIjI+7UIP2zrEhS46ur8a6BStHqK822AHuI8klRT
 ZkDxn8+yqGO4eAEB6WAptENfWLVANoVl0gehRtHAAAA8ZJZjrf5B2kecGVaQdB7WikBFgjabxSQ
 SmoYvTP9Cog5dhNSiaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfXzxolgOmGE8/X
 F4a+i+FVQVoF1XmcgGw/I7lN4oYp8fe2C28E5putJq/70FOnE57v07E2wCIHAMueawWJULuUCI2
 RkfO3Zi+TiuQCNgyQgq7K27Tyu550K0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/20/26 4:00 PM, Ilpo Järvinen wrote:
> On Fri, 16 Oct 2026, Ilpo Järvinen wrote:
> 
>> On Thu, 15 Oct 2026, Konrad Dybcio wrote:
>>
>>> On 10/15/26 4:24 PM, Ilpo Järvinen wrote:
>>>> On Thu, 15 Oct 2026, Konrad Dybcio wrote:

[...]

>>> Yeah I know. I still left it in deliberately so that in case anyone
>>> wants to audit the format here and compare it to the DSDT it's more
>>> obvious that this wasn't an oversight. Do you still prefer I resend
>>> (or maybe you'd like to fix that up while applying, which I don't
>>> mind either)?
>>
>> We can keep the member there but I'll change it to {}.
>>
>> I can try to remember to fix these while applying (I'm good in 
>> forgetting though :-)). But I at least try to check all the comments made 
>> to the last version.
> 
> This patch 2 has been applied to the review-ilpo-next branch. The rest of 
> series will have to go through some other tree.

Thank you!

Konrad
