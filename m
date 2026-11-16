Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827936;
	b=n/DwszEgyinU+XEJpkeq1gbh3p4tSUC1hpLvxQZw8B9P6XIGH9nLbF1JD+pL/WKvexpC
	 sGD1ezjzSwwh0Ip9ZnKOV+0PO/oMXlJDlqCuRjdtsRqIipIO6VPVYcBc7JQ6ikDQQ1gtR
	 j7IjwUmO7dtyoqKJFot64kkB63OU8oJzd3bXAnSOPJLegvZrZaFlsya4lV2KzzBJpPrOo
	 /HQVO9IU0rz/0MkUagl1VxvrZhcPxrUJi1Z47c2IsihAuPz4isuzGoZMIo5+l/1YzRJit
	 JTsg1atNAwOlwYjRWBfYKiGHKRC2pCWRr1njdU/QfTSkjNTy36yVV+IGEoFh8DUKo+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/M4tNKxMt2fBsOXOhu84GGPzS40IEvP0EO6XY1dI84A=;
	b=MRsG6rKebZjx7PWPbP1ZL0DK/KpQtKffJASaKXRoQB14DznJ+pnO1HDQbuNQocxSAugI
	 2TOEZDXvWZqVQ5PRYiQcdhhPMx1PPzHTeE/hF2LWY7ZqKcaKsRXWbhoP4kFFKr8wYo9el
	 Zxsgi7eI1tcKFVrQluGK/dVfPXkN5h4shbPy1Oz9mukcjhtsCeEOphHFGQOXo75U1Nm8I
	 f7DkdwDW0UJcPGe8hx/gevQro7m04Gf0YYcZL9ztpFyHJjRZtcXWy9MXCcZAsElsAfarX
	 dHE1o4BO3nbIl/ZE+R3fqqIChVrHHnZwEVYOXrLS3ZewCFd0ztwkzIIQKiTxeCpXcCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Buu2wo26;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNtdGh9h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C03606FEB2
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05C03606FEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Buu2wo26;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNtdGh9h
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGB5k1G2094031
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/M4tNKxMt2fBsOXOhu84GGPzS40IEvP0EO6XY1dI84A=; b=Buu2wo26A87LNAvo
	vfTcVD3KrHkISdUrofq/hDwS6Osq6iV85QykFm9BSVpW8Rq0Z/eRsXRyG+4kUXox
	lPGhxqXjD/XP8J/jaKDoQ58k6XqCcrG59N6dk9azLoWq2tkW/BVVSswlim17ukVk
	Jp4KzFjKIFjJcFURryPkIswYZlXWqRP8MWsp57QTdrndTEwEYfMN2INHZko70NGb
	UDOUBwqV4A3OT/bXshTEz+PUmYKbUONTsAAtRUdAbZWRdV47o7H6LaPRUYquoiwC
	acZOMyVVqc6fDe/e9nRBZP3AmlfpGPkblE8ulj4FKri8SCmM1wF8g2wnjHKI2Jf1
	2XjvBA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfg1d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:18:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so3878984a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794827934; x=1795432734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/M4tNKxMt2fBsOXOhu84GGPzS40IEvP0EO6XY1dI84A=;
        b=kNtdGh9hQrKfSbzsMJV1U5ylLOTzp3nsf/pn2RkkuLv//oeyHPFCDsTzIVBfTc5QEa
         naVFRMp62qaRsL0Ca6gQpvjSSpOFFGgPGWEyOQ/yBmnlt+k3Zv8VN5CkD9EEXqCn60oK
         zmoaSB/pdzmGHS9BhuTxrraVCbw7OyDXVyQkpJO9rYkeD5aNYxsJVaNg2UZwJWFMKjiS
         Ml3WNsvPC+4WeP3CVEMkqOLoe6FTX65HCm9aTto0Iix3ezweKM7iIEC6KbWpcutGHn59
         2RJK+bsaqf3T7M8WsCwdNoLU9hqTyCIwlKdvEEGinjzipUuvUmen1JRZDzmr4y7kUSP2
         WzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827934; x=1795432734;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/M4tNKxMt2fBsOXOhu84GGPzS40IEvP0EO6XY1dI84A=;
        b=t9G2LwuSl/c2pYvtgt81SBaq/xNXfADoL7pcvXMhrKOEu567NLJxhpAP5MmRfEwRkY
         Bd9KuC7vsnUSv9r788UchIwzY29nzfJsyUrlotGWbQxzwcLnddx/Pwx10E6H1pjqqV6I
         VW5Gj800eJ2PzPnhirE6hvXSECwh2ZQ764t8LVxBskCtsuc/ncsvLh3EQE9+aX27GS/5
         g8GN2h9Q9VlRvo1bdOAndULY99jVZqfuZdpP6QR3/KVDissXMwFLigeu3+tVaBLa1nbJ
         p9Zix5ydopqHfSRZ3jSN+TVFGle3A2+ljILk5dF+uIltfXeGYCbjSdpNJMc7C7HqLt7F
         6wNw==
X-Forwarded-Encrypted: i=1; AL+hErGUFTZad7Xq6REyBMUrV6ahBAi2aVF9QFe3wCNi9djGy3sUNLLSlQPn3P6lvCiAlBqUysEsxwlNzNIUUvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a3tKAFf/oYXmzVJoZIYhkcoYwgrvqsXWczS2bd4m68X2F1C6Y
	JDU9REJt5NZq3FUJN4iW4md42XxliJjNDX3Qtk8ABMrdsy3eOB9CFDfoBijVMVqG+7V0deFgdKq
	eZDIX8P2/BTpnK4yCm4qWgpDc6mcFHW/JtR5QzRT/g3oZTAX5mZ8cojrtdtJWTOh/W1M=
X-Gm-Gg: AZFdTZezLp0BhJTTe6XqWzMvmP4YsqtjsD+exteoJ+8d8UrEUiuJrPSZrQNCVyHydsE
	yjn6YBeO9oOsOxKF1r0CIfnjJ4O0SttPIETFOuWgli0UElga1l2paarzibBis3M4ZBRKv0MgPbQ
	/3UJUh6OzGP5Zo0xm1KrmDzJ7fX6vopeUdr78QqZP5FteefNlzB0PRTFnUhVKvgsXSQrIq/x0od
	a6TUreEHYyfKO/EKFwn0hFD9290sCp5AeSjbikMA8ufTNs14Ez0I+exNTIH7mXxN6RbbWXjLiZN
	0MAg6v1syQrrg8+QYEPNu7kuhhIu5EkPngNtiH0h+/uQ7LEnoapZzT69wHo7mT87YgmI0FFccAa
	L+vzixVruitoVbv4FzTzMESrx+Q9+4eBTpFr8xUSZAJ9RYdcfe8w6SHZRXu2rAE7PWwQCiklqkG
	k=
X-Received: by 2002:a17:90b:2d85:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3b1b0ca53bdmr10317943a91.37.1794827933749;
        Mon, 16 Nov 2026 03:18:53 -0800 (PST)
X-Received: by 2002:a17:90b:2d85:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3b1b0ca53bdmr10317925a91.37.1794827933363;
        Mon, 16 Nov 2026 03:18:53 -0800 (PST)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce49d6sm22100109a91.4.2026.11.16.03.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 03:18:53 -0800 (PST)
Message-ID: <691c3ec9-b21a-4e66-8c4a-de14c8987705@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 16:48:47 +0530
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
Subject: Re: [PATCH v2 2/6] firmware: qcom_scm: Transition to ICE TZ agnostic
 operations
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
 <20261111-ice-migrate-tee-svc-v2-2-29d19f6c92ab@oss.qualcomm.com>
 <20261113213403.GA35210@quark>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20261113213403.GA35210@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afae69e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mWdmoYhiF-GBnKHWv5IA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX/OifElD11rQA
 LNqpfuTYGiq3zT98EsXxePlLbqNj+YNf370iLPdHr9+6VZocl54Dhl4OWLJpSkcBcHuzHQBBnOT
 quKX5+4pSrTNb79OuVJlbfCUxZfg2wY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX5AcynHsad7kn
 YAL/0aqhUk6vP6Q7fKEXzL07hL/M4KWjbvMpl7r6DngIyM+HRCK7asmL0bM/OTdeUqn+8qeDQB1
 IGJblrym32S6nghplVBJNy7Njhs4+etd7wbSbCIvdAb3NrDWtsLRRX66jVFW0dvic05asq4z8ko
 l8+lgelxQMOGCYjayHhfXlfcqgZrhvNhJFX3Uns1RiPSn5lfljxRbCZQCq7J5Cks60G4ofRmxLy
 1xKQDOIrZjNZiRr0C4ij7grLlBWA6bKycjGtXNg7iCiAoteTr9Wo7TaJ0uxFvxvNShV2fKZvqj0
 o9dz1G3tLyu/RNGHMBM9b9KWcN9cuL+OwVktsnA9nXyh7lVrz9Mnr5O0/ujbNrYRIFJkaQ9X7Wk
 RNGV0b3biOAdUDfUpUPBKHWqb4XgKNcgx2jbGuPtFUKerZnW9cEMdOMI05CmxQWcpEIMyf7q4NJ
 lEG0X0kcOfb5SRq6dXw==
X-Proofpoint-ORIG-GUID: k93oxMpowBHyDo80WfaFmHzvmkz1h7w5
X-Proofpoint-GUID: k93oxMpowBHyDo80WfaFmHzvmkz1h7w5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160043

Hi Eric,

On 14-11-2026 03:04 am, Eric Biggers wrote:
> On Wed, Nov 11, 2026 at 07:47:02PM +0530, Harshal Dev wrote:
>> Transition the ICE related SCM calls to the generic ICE TZ operations by
>> registering them with the ICE driver and wrapping them in exported APIs
>> with the same signature.
>>
>> This prepares the ICE driver for eventual migration to the TZ agnostic
>> secure programming interfaces once the TEE bus based back-end becomes
>> available.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c | 131 +++++++++++++++++++++++++++++++--------
>>  1 file changed, 106 insertions(+), 25 deletions(-)
> 
> Wouldn't it make more sense to leave qcom_scm alone, and have qcom_ice
> decide whether it should call qcom_scm_ice_*() or the OP-TEE backend?
> That would avoid the circular dependency between qcom_scm and qcom_ice
> which this patch introduces, and eliminate the need for patches 2 and 6.
>

I agree actually. The QCOM_SCM and QCOM_PAS already have a circular dependency
because of the function pointer registration approach. I guess it is much
easier the way you suggested. I'll try this approach.

Corresponding to qcom_scm_is_available() and qcom_scm_ice_is_available() we
should have corresponding APIs from the OPTEE back-end; qcom_tee_is_available()
and qcom_tee_ice_is_available(). The qcom_ice_tz_ops_(un)register() can be dropped.

Ack.

Regards,
Harshal
 
> - Eric

