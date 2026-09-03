Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8C241F7D8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423127; cv=none; b=blgKsSylxhgAAgYtFDafsLlzU6PGTvn9zMk3NhqR2j1SR2ORiaTNCekxIPgOo3B6B2E87UnQrJ6ZYMH0yTk1/6ldSD6m4U6mOT0CzqFAQok3JEfOE+x/PfsiKIoxGXNfRSX1Qd//TcmPWGkMLLpjUQwqMOA8tEGRE4rVTqt9JVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423127; c=relaxed/simple;
	bh=LP+faQ2q9FfsPkGPTysKaeADczY8Bs1t2OWTsH1X2fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzVFtio1igWXiApqwYgqHvO8Ja4QmmWmK6BeuSFek/wFcSNsgr7h51VgemWGB0rda5F0p04ZeDgi6hx1AKFaYXuDpJFTY1OFGSDJOaU8rXeB5X5Q0WHZB5J50Is6S2xrsMtVIwJ8FY2bh8haA4ZjbTbOWt1MD5ChRV58fqq85kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiTy2hYp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQOEG3dh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiTy2hYp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQOEG3dh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lO1v3113986
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 08:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTwr/5OtEq/VpaOWQL4jObXZ7wWN4MYqtYLvdmVNJX4=; b=NiTy2hYpa7IuGlYu
	8mZj5GcLAaf9exfWJdVMyg5wT7ljKakRvRQ39170wM32MBQbIM/DeaTAJD0ZWsrV
	xsJBGdtjRQJCHM9iQLIfps0ZONC/qjWBe0cMQpHzZc+8SIFiK3Xlat5J2C84aCWc
	4Q8ZqXbG5gqVWfQbexlVZzpoOvO7N6MQUca15GjaThDZ11YcHkQf5Uyb+Ufpxqzf
	ZVPquDIt2fkLHnV+w7n0DJibOI9pElrFNoTANJwe6+b5uUMhB/2F9ywBx+UKI7S9
	pJ3xoHnHMVo3teVbcY2ExGvvf4MJG15LOR0N9dAQkYFlQCktFMUsQR9ku5yyVAfh
	YI3lhQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjs31k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:12:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso900507a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423121; x=1789027921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTwr/5OtEq/VpaOWQL4jObXZ7wWN4MYqtYLvdmVNJX4=;
        b=LQOEG3dhyDqhVXZGMWshC6M8KB4sdIv22E37hi6myRnyIWbpzCO7HjFi49zrCiLz2p
         wiy1ZaUP2QA0t7l2PiIcuPlUyEvT86OdAU1Am0jCNpHlc/n5lmGLUUbKB7Qh13pS8pfP
         u6QaEqIxLjPbZeCQyMqxafPBCnnqU5wym4vf6p07oUrG7KkKBCktSDlXXmpEQbklYXJk
         FNoptrBr0Ghe/2KdiYOrpbdBKgHQSc+i5xwYRPl0fmHfeCOLBKvU0PMgyxaC/t4dDDX1
         e1OqimtcfrftJFFOdsGb5EF3dYbp8ZrliQ9XsnyyX+dlnWdnEq1gCw7xLtLRIS5GxB41
         TY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423121; x=1789027921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTwr/5OtEq/VpaOWQL4jObXZ7wWN4MYqtYLvdmVNJX4=;
        b=BdWfkZTnFwZlVNg/b6ZaR8sUeA6kjfdZ7LGj3SxX56zCmXDAyfGi56qSh82OzVvcIp
         iwC/eOmiRxp6PceDqKOagqehu3aqbEHW8yu80utZMN0HR5NvuWJ1Vt/MWVJZE3KPm7Vq
         YYQysyG0fxxUR6RtyqMly+4qTecvBm2nWHNISof2uMsNzLj7Hjmb3A/Si805jS2s8jLv
         tFtvxrLNK3y23l/6WUv8H0faI8qGNf2PxyhrxEDZ5AZQiTegN4YZPWtIvyWaR/3HG3do
         260jQKDMiXSaN91spT5nzS1yOrWIsvwLkDHqgLGX+GNSotn4AfaXh4K+2s6GFTmNsce3
         ryAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5ZLXAjspQWKlvXL6+Oqz4FQkWr1Ri0xrsCJUrdriDb5UE57IDq1d7an9Xy4F4YOaZrnkhfKpCE49YXG8=@vger.kernel.org
X-Gm-Message-State: AFuF++mKnEIt7Hq7cjm5de1bNJjgvGfDQZjjxfQDnqLE2Mly+as21g5Z
	oYuYO2q76dz3D3XYxvXGE1NOx7uEQiLH5kBchjbmAziS08o4kWSXXRZaoaKFkiVUkYV0vRO+UTe
	62tE6mANmWcrGIqWRn7EGiAHJpH4KOi8Fckqsw7b+XX9hElBTAdYY0ud3hZfK20YSZN0=
X-Gm-Gg: AYBFou0mmdJ/X+mfDpd4RnlwKRB4aQ80vBOn8hXrsIqz9IKEml6VHAiiOVhnYWBWtSq
	oN9WLK4hk2lTD9Z0glbkqnZT16Ol+vUyUNU0oRA4YQDL2I9FJPC5kKa5tzAV+If+E/EPf4jZg0e
	/keEWFkP4ltF8QePmd0/VD+Xh8kZoWAzkCygqZunScEKIBaCIln6x3WIiMCylXrpwfuFJpsc7CZ
	g+81gu0fqLGo+OFAR848gZme739cXhCH8la1JyFfggreUBOqePG359ooLAgbEpSKtabrsEywqqk
	IB4rjkjpOchAbgVZkkxCzcGKdxQ69DIfXOfduroF3RMYEMQQDrn8NNmydKAsnlRO0zcYH0xVdAk
	2IqkiZDqu9G2XP7yMFCtlvECVd7koIqRv3hhY5ODfAE1gaeOaNmiZp36riL2Rs0d0KQ==
X-Received: by 2002:a17:90b:2c87:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b133026e6mr1762174a91.15.1788423120767;
        Thu, 03 Sep 2026 01:12:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2c87:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b133026e6mr1762152a91.15.1788423120264;
        Thu, 03 Sep 2026 01:12:00 -0700 (PDT)
Received: from [10.92.216.81] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875e5e9sm4332855a91.14.2026.09.03.01.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:11:59 -0700 (PDT)
Message-ID: <80f21ab6-3d4e-445a-b156-7326b0e92998@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:41:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
 <20260831-messy-ebony-warthog-cfd727@quoll>
 <ce5bf06b-8284-4355-94bb-416a8e34bd5b@oss.qualcomm.com>
 <cc52ff33-3da4-492e-80cd-ba2b1711bfed@kernel.org>
 <6af2e860-ba7a-4f86-a0e7-872a312b47e4@oss.qualcomm.com>
 <3574212b-1a4b-486a-97df-1d6ae7895097@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <3574212b-1a4b-486a-97df-1d6ae7895097@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MiBTYWx0ZWRfX87LpRXr4VRSk
 x4mrYrnZlNoO8RUOb3PXPQZpxeW+Utb79AuHsqgVAUo/htZQq000BGADajxkjX+nB9vbhe9F2p8
 2zBwffuaRH8bahSEC23JJOUF7AB1cNl6QQU8N00kDgpLVEgysNnlPXrqvcZ4akYOmzTm+L5PLm0
 FdSRyDUV5NNlw+7I8vg5pzh/fNfr+bqkUcD0bVbYN/sTZYzEMwqYtq7Xh8yq3iq9j6ccRfCYK4C
 4til0PzFJBKpET7OiecSg3Jr8c20Rw+C0Ve7tLcIwJ7xAzgp9BUJFxaR1fX9Zdu5t4N7UPSXLER
 IE52hS/IfQO2klTljg0lhRwZHEkhjcpmzo6M/ZKV4B8mxJyx5aCLpUPs1FbTEDBXLo0P1SPi0JX
 ScS1u3n4A5PPG1n/RNo6mjcpyx6wCjfIFJ9m/R1RIYDHSNrF+15IbTzdKXxXX4h3fwuhgMrC0vT
 GqqQSwo/jZ/TCQXZUSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MiBTYWx0ZWRfX+wGrcXKuWbm7
 RTROiLIaBdWjMv8F1QTnM/Qf6morEWvtI89CRjc8WXjHW3F6fYOvLoy2OpeOYc+pll3Q3g+8Nb7
 8N1g/8mhIKSjsbqDINueGPtLY+M+iVM=
X-Proofpoint-GUID: OlcPSfvwKSoUQMuTHlbeET80r6L-zHOM
X-Proofpoint-ORIG-GUID: OlcPSfvwKSoUQMuTHlbeET80r6L-zHOM
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a992bd1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=hQxA1nNTofH2dBn-U5oA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030072



On 9/3/2026 12:11 PM, Krzysztof Kozlowski wrote:
> On 02/09/2026 16:10, Konrad Dybcio wrote:
>> On 8/31/26 2:29 PM, Krzysztof Kozlowski wrote:
>>> On 31/08/2026 11:03, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
>>>>> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>>>>>> Currently for Glymur non-multiport USB controllers, number of interrupts
>>>>>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>>>>>> present.
>>
>> [...]
>>
>>>>>>                  - qcom,eliza-dwc3
>>>>>> +              - qcom,glymur-dwc3
>>>>>>                  - qcom,ipq4019-dwc3
>>>>>>                  - qcom,ipq8064-dwc3
>>>>>>                  - qcom,kaanapali-dwc3
>>>>>
>>>>> This changes the ABI without an explanation.
>>>>>
>>>> As per the harware specification, the controllers do have both
>>>> hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that
>>>> info. Will update the commit message accordingly.
>>>>
>>>
>>> So the change in 99df63d20dabda8d7ae01bcca7cdb1e92110a555 was
>>> incomplete? Lack of context here is not helping.
>>>
>>> If they have these IRQs but it does not matter, then it is not a good
>>> reason to change ABI and you should just add the clock as optional to
>>> the end. Was this binding already released? I think yes.
>>
>> IIUC the intent of the patch is to allow specifying the currently
>> missing hs_phy_irq on non-multiport controllers (i.e. usb3_[012]).
>> Bundling the DT change would have made that easier.
> 
> This does not answer my concerns. So repeating: patch is changing ABI
> without an explanation. This means contributor needs to provide
> explanation for the ABI change in terms of actual impact.
> 
 From a functional standpoint, there would be no effect. I was trying to 
make the bindings reflect that the hardware has hs_phy_irq.

Regards,
Krishna,
