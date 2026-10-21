Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573428;
	b=DbF29Qc7tlm2sMYH5TDO7d4p/RdXfP4hmRSHUppB+GqwcjiMDDbS8PTZnLiguqG6JpgX
	 6W/C2Yf0dLRpRQFwPVWAF1V0Zsv9I0HdSXfV3Z6rAkHe2OwVNCk/F0grUwvnTQ6FJOW62
	 DcmdDWklhvXGOb6nzJ+909bRCZEw9btJkQ1UpTMmvkhAdrh6TspF5Khe/3uZ+clnpnWiT
	 4/RghjZHI7tywJdHGwiBadDOuTQJ1lJ2Au+cwLilI/9FSDf+J6+dtTBQEwqWdBmhd/Tqq
	 wCxU47RGxPk5Yy7nRHG+igRNdhUJ/U0VIEUhqnoOVxUimkatl0lA/e6h3WUWXd6bOnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b5BtvqtvptDu4T6AHb9Bl48iLMJa4oRxaJrIUF7qgQQ=;
	b=1MxoQWkMqJ1lDRv0d0+i8k6wzf0FbespKXLzCcaRN1pe+rvCxy12f5Vk6ZBDjq2zTRKM
	 nLV38oe/2s5UYoWqpBgybbGXwklYbB7l2DwvorazcRX5tP/Q9QLUfh5k1G79em6yeBjrv
	 f8qQvJ/sWuJ2/292haOzXYwhwKlMJHRTTTDOObcOK+A5kwPxIwBhErcPF0o5I7e7sDtuY
	 6S1w/mfKjQe470aKwN3vIGr4FpZzcMxwnC/zdowAcJTeQ2TmFb/7SJ5BGvVbQ/y+ITCXc
	 FpQQQfRI4kT9mz1cON+B9laR0su6Evres8oErkHq29PTrv/mYJ+pRrmENJG2b2oc78A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+Hq+DUt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2UIYRLc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DBF606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2DBF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z+Hq+DUt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T2UIYRLc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j6rQ793346
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5BtvqtvptDu4T6AHb9Bl48iLMJa4oRxaJrIUF7qgQQ=; b=Z+Hq+DUtwjM3e+7q
	FQiql8qBvO9CK7NZQpBz+IQ1xlHSd3P98RmIslutyrqCR8nx7FY7PMc/tbRLXmFI
	7054hLp+yWXH1m8FoR6tF3/ZuowLXg2QpXNlaI+4lbqWOqtVr7SbTFBQOiUEAYJ7
	E25TqyjLVCxfBhX+Mhk0Lj+UiuTskaTGV8IdC7UY5C80UV7i/ve7UZuBYSMfTAU5
	tA3a7WwfoWf/zvJ2P0POOu0RjedPoZcHWTz931+tTR5s9xMHTSTwMwAK0mNW7/jL
	Y+vnjmjigckwPgu1LF/+rkI0KI6hBPi9WPi4PPnNjs35uMlDjdFctdPLTBCyC5f0
	398H0w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabk625-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:03:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36637676140so884199eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573426; x=1793178226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5BtvqtvptDu4T6AHb9Bl48iLMJa4oRxaJrIUF7qgQQ=;
        b=T2UIYRLciffuZJlr26g21fr8jtvvPFPP/gRqchv2nLjkRmPt3B/2k/KK9MxnIpfO+2
         ZeKyJzc3HnYrq0kwnY/jLVTFhhtBJ90u4ld3TjvJmZc4bHFIt+/04gkCj5Gq2NGx45KA
         oorpMgEo/o4i2L5QxULCsx6rihvYSyOsyvdfagYEB9Zlpe5CPomTDqPzWF8/w0oq+9rM
         X6qsAtKvappWozuJW2ldOr9xoobUrpWADZ9+9iL9E4ifJpvrk5mmfTVsmem5LVTw9srJ
         9dCvuNnc7kxqoFF+0TXhgMJgLOif21H7gB9a1qpZ+aHhQfwMMmZWEDHR3grWPIRpORgg
         3c/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573426; x=1793178226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5BtvqtvptDu4T6AHb9Bl48iLMJa4oRxaJrIUF7qgQQ=;
        b=o0KOj9R3uIlj2WLwPkRqhZ7+0BdLbSejmc1Y6PzUXEx0HSPtlKYbkTv58QsAGBBysh
         iuSsHQS2MlGIPjwQb/XK4SnIvqCLtoFrj0iSfqzL6zBRNvaQAlGPetpUU6MlocvHw1RE
         sPNrQkfQOJa9EFvgseA4C26zUriobMWtiJ71c8o5yV75SeuC7BTA/o8a6jRvAM4jL5BA
         gnUYiR9v5NSJhDAn7qIPALCaepYnAYYBr2COnArSm98j02W8jxfc0CAIVJyxKTXkk73X
         hAFloscyVxXLlkpYLMxOq3HdqBX5IlidNDJlyjKI+H/HlHCDmbm29XrJG7tUAMTTAIH/
         sRXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDRdIjHBN7L6/fGB5LUuW4mZ5rVbPttZL066nE3LVlQijSv0e3wTyPQMlSCLKYg7+0TSwVeaayZp3+hDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7q3koUhlgZ5zqASBMNVTrY3nawbUAoOYGOWC8psHF+LSaCZe/
	NSqULrkYOiEhCyrOtMusrfaT8bJW97qHjs0tjxY73qBp7VDEHISy6YoiUdm5o2/atyW7w87iMOo
	4FooO3SG0YNYNBzY9hWgHRqNscxrTVMYIkbxwen42OVe0nwaCw7AkOq2HGvJESj3rOcA=
X-Gm-Gg: AYBFou35ayOjcOYTdO9pmDZGbi5DCk+o8PWgdPCeoDtW8S0/Qdp5MdxJ+lm7VOuSJ2c
	3wfNywzAp/LT9QmXUw5Vk+r20x2lfkbXWZA6vRcZQC7msMC9qiprtA4SQvk1RJhp3wpK2KEt9E5
	PxKXDbUagHdNzyTWS6eP0N6qDcnoX35erV30Je7BObjDCMsfDPk7avhd7zhMDf4LpZ9+JKQXnWw
	VdEuOn/ytW3tpaT4pBI8pNC1dNt/qfkPdGumircj/AMqmOqGOLpbR912WrxpzwPNW3XpRiUZWY3
	KFSKpzpxMgCF5JPytP+V53Ez8TJjjt/vMBXDK/jzF0pqtxfkxGBoS5Be77sFTwXIA5lajYI/oPK
	OKk58u2d1PdetwgVPro64lAnt1FlF6dI=
X-Received: by 2002:a05:7300:d090:b0:351:7d5f:df26 with SMTP id 5a478bee46e88-3674db5680cmr2001078eec.15.1792573425909;
        Wed, 21 Oct 2026 02:03:45 -0700 (PDT)
X-Received: by 2002:a05:7300:d090:b0:351:7d5f:df26 with SMTP id 5a478bee46e88-3674db5680cmr2001055eec.15.1792573425175;
        Wed, 21 Oct 2026 02:03:45 -0700 (PDT)
Received: from [10.217.223.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm7902967eec.24.2026.10.21.02.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:03:44 -0700 (PDT)
Message-ID: <ff0a5a0a-92de-46f3-9377-ee601d8d12fa@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:33:39 +0530
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
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
 <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
Content-Language: en-US
From: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
In-Reply-To: <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX3Ll9IHMiPOkj
 YgOfLvCXuIlmEeLzaQCRDg4Ma6sJRfyNTn1ZJItxgF/YAdb/4ZLppPdWV4q3ETQB54btg20YB1g
 cVMF0mnHWWdNT7bOyVj4KJJT7b6lTC4=
X-Proofpoint-ORIG-GUID: xaSJAFyqjPjRi5FVuHWpWYyfwJwPBRYK
X-Proofpoint-GUID: xaSJAFyqjPjRi5FVuHWpWYyfwJwPBRYK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX9u5T38uPetfD
 IM1WelADbn8XjRwRlv955K1LN+8QrjoTDTr2mBabmuVrU4ASPz8or2FA7Wi2z+EVz4v8gTygUa6
 ryj6zsfMx12VyeUUrh7Z1b/k94Qx2gNDeYCHF5Th94dpc0NugbkLz+hdX8XaVrh5Iv/ztiJa0sM
 yz4qm9rIJs/aDtlFboDQPh148bziMwoENgqpPcrauU8k3jOQscc1uXWZjoOnkXNCuKinbJ1H42j
 XZV60BdpTjxBbpoE25cwfWfBsjP/1nus1BxKU0YROMwhmD7TKKPxr5Oo5r9zf/6jlGCicVkKmlA
 RdNVIUvE+5uO0F/ZHqd4GjcPaksC2voyRBARMwWDkEujKg4eOh6/yF7uKhHnYtV3arVcIvtvtB4
 bq8k+xO+oflGCT0tkN4ZHy8/zZerEerzwvd2gTiMNsvASoCTWos6TvchWtXCXsu+mVhPFJHWiey
 Iayyxubzbg9O2bJIKSA==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad87ff2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iDK90Gyl-TMhxqDKVhgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210035



On 10/20/2026 5:46 PM, Konrad Dybcio wrote:
> On 10/15/26 4:37 AM, Shawn Guo wrote:
>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>
>> Add initial device tree support for the Lemans SA8255P Ride board. Enable
>> UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
>> zones for PMM8654AU sensors, and SCMI protocol nodes.
>>
>> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	thermal-zones {
>> +		pmm8654au_0_thermal: pm8255-0-thermal {
>> +			polling-delay-passive = <100>;
> 
> Do we need the polling, is there no interrupt?
> 
> [...]
> 
> 
>> +&pcie0_ep {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
>> +		    &pcie0_ep_wake_default>;
>> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> 
> This GPIO reference feels like a layering violation - the previous
> commit promised TLMM is abstracted away

Hi Konard,

For PCIe EP, the TLMM gpio's are controlled via kernel and are not 
abstracted. Possibly we need to reserve them for kernel only.

-Shazad

> 
> Konrad

