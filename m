Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AAB3806C1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939460; cv=none; b=Fdka6/9ts2P9XGVMjK9ItBvtcjXrZkkxo3uovEqAg/n1JCViOQfSOV6YgPH1C4f+lq42cGoHUYAIru/eaTPbqqqjSx365LxWCfkNe2kn0svbTSZCo5VVu/ZKTBcwZyDfuwumdVeH96LyA+d+WYPFHm1xKdq3sogg6+3CDhGJxeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939460; c=relaxed/simple;
	bh=rIQghz1DdBqWmQCzB2UZAKvYVAzvTlzPkeyezBhS2hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6AwOStvy88I2XM65hhkvJV8MbrXzsCtKRAIzNuEpjhQPeiubXO8WwPnFW0UYd15BYboug/SfUEcs+Xj8JpKcNGJE7LDH4nu4l1oTidQAC7Nxjrw/gypOCbKIVDR4xPW23lVvRvpuddM43StbroRipa6QwCwzh0UmmIvBPwZtDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIjSZK74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIp5mvcR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIjSZK74";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIp5mvcR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SGJrMR380081
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/OxxXV9WtxfoOsHrFSeDk4/H9j66TfeNbkxSbwQuzw=; b=KIjSZK74jDbrkl6X
	sFtBt8IqND77X7UIXtKK33M5WQbN56AdcNzvWsp/uYLfKD8H1EL52xzqL1UFZMjn
	uMsKw+fEce6lilkYuuR74yxa0ERjCQMb5L21QsypQuo2So591WTUT6vLQ7g6CNX3
	ITjWhIIa3vENHANfOX0B6po5j7pJKo39u0l4aNHbuABV2TkfNICvzHytf7iB/lEk
	ecDd20JUWTgtgRnaSJCPs+33ymh61bC8vls794CA+40FN4Wf+dvAP3hLzahsv5CX
	ik5rjBDRPXzs4j/3qfphrvc30SzOj2Og/5hL6ZJZ3mUFWrF7c3VdpPABW2ZlZ9l7
	0fqtQA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb8afhqf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:50:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so2405777a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787939457; x=1788544257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/OxxXV9WtxfoOsHrFSeDk4/H9j66TfeNbkxSbwQuzw=;
        b=NIp5mvcREgpYBbkTbG9qe2Vl8GUdeUhB9AzQlYXSr5UlWslaWqo0FoZvXda9Dr5mC2
         ety4Bs+8CtwWNMlyr+QQSZXiICUwJ5jviibQ3VFJVnId2Qk+sHR81u4F+g4KAgFKgXmb
         Ozw2zUFt9/pOX/2ZDRjdlEDabUtfrqrftr0eTKuruoqMRnDWrC4Wj5bh6x0k8mvEFh3g
         dXzsEFDo0MqBEVwdlapRLinBMrTh2phivh0QCdAZuD9NIKjAG7OFVd2hpW68mjW+UTeC
         5ZjmPCgy65p+qUCKtTdgOd0US7GBoQoevtN/tFpo7ytTdMdFx48hcik3V8XbSw3yF1EQ
         VDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939457; x=1788544257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/OxxXV9WtxfoOsHrFSeDk4/H9j66TfeNbkxSbwQuzw=;
        b=JM8pD94q5/RIdWrLQNV5Of6j6iUKQSLrYjQka5C1QX+yjZH3A58Y6wquUfOuxx4GcD
         QSBA6OBN8ws2BJr5fhxk0yzTWf2Hoep7Ucx7YWO4j9AORAm/8rLVx6v92wyLiiHdspDH
         ptUfQt3g6jWVutUpeYCfAI4V7erjGxJ55O6G9INEV4WkFDalwsQxHrkYMcgJahDbCvIJ
         3pYwmXSwua3qEUZkhPjycqpmUHOV7ExyS96KjBhvrIVa02B0ntikPKfHBnRM6tiKDuTU
         ntBs29hpi2W7umw08y/hpll1ZNqYi68cseVgCsI5MV3afH0PXbsWljxYiGQwQaW/YYhZ
         8rrw==
X-Forwarded-Encrypted: i=1; AKwUvBzvNRiepMJBWwM3cDbYZcCWKfi72lfqBvivgcljh/YSyx0tq+crQuZHanVtypGFjxKsTEAh+sgoZWkFpQE=@vger.kernel.org
X-Gm-Message-State: AFuF++nhb+yMvx9aPY6icCXSo/1qnOFgncmwGe0/tD+XJOJbsBpLZqFo
	my7eK3RfBiu4F8RLPCqiHV1jxVldOw4TM2bVVGizlaFFvNuNu4MmaUqYDc8LTDuRoCYpg8b1ETM
	pppB+wWfXgDpAAN899mexpIrCdIdwb9QNF/RRyVwVqG0GcaSqytUurg+Gg7UmY9Yg4TE=
X-Gm-Gg: AYBFou0mHzn3RT7ftzw+yhAh6QH/8eejalgwYH58bSMMNceNYFc5UroNy0POscGnx08
	bG9WhCYZ/K+ygZ6iWyrCqR7CUD8Ynocvq11xQU9f2YSvxQcBhdm8dYg0jBK324a05hIv5XUXYnB
	7cnNhZf2jjS0/KkbCigRfhlHW1Wnc4WiTu3hLe526RKYXI4rJVot8cExLyoOKsqSRMcW6dbg0dM
	VHFOoF3tlM/SzKyu+HyRuKdwNDmlX0mGhOr/xiLy2w1EXHaUyV+/3GwfrXGjopEDCd39ruCpbiT
	41r3YHe2hVvQjn/i1yVQE5iEgy+XTTm4w1y6lCUBZFXBzorUjtRpnbc+HCzFlDTPm/HnQbX327H
	DA+kKxzZ4ViYcGWfVxBX9yxm3g3UR7bV/XHLC9spgCSFVHIeDAZlnyB827b2fGjxu8X4=
X-Received: by 2002:a17:90b:1d04:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-3989bd40d7fmr2370349a91.18.1787939457155;
        Fri, 28 Aug 2026 10:50:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1d04:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-3989bd40d7fmr2370286a91.18.1787939456661;
        Fri, 28 Aug 2026 10:50:56 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.243.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm8082192a91.6.2026.08.28.10.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 10:50:56 -0700 (PDT)
Message-ID: <26da98ca-8074-4116-a1cb-291f306f55bf@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 23:20:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: xhci: add xhci-no-soft-retry-quirk
To: Matt Eaton <linux@divinehawk.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
 <20260828-xhci-no-soft-retry-v1-1-b9c264b56601@divinehawk.com>
 <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org>
 <CABUBpLfsjscV1-ftUPjKbL4EYq-9NSHYSCGJ_vqStM7k4FtkdA@mail.gmail.com>
 <14fd70cb-d07a-456f-9800-d3ece4039529@kernel.org>
 <CABUBpLfH+bi3Q5hD+WWG0QnyCfmQMRt9TkUN+zC1pvH44ez90w@mail.gmail.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <CABUBpLfH+bi3Q5hD+WWG0QnyCfmQMRt9TkUN+zC1pvH44ez90w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L8-UQygGXvA2Rc0TjZ5hTz5e-N7tA_wC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE1NSBTYWx0ZWRfX7TM1ic9AL0dt
 gx/DLkLA2A2LEbQNOu1Fg80Rxp0OFMlt3YAsd8PkmMdoUXxZHuzJK40BdvubW0EUdRga71pEKC1
 NAOTYR1G0Ub5bfKR08+sXd8UouiP7sQ=
X-Authority-Analysis: v=2.4 cv=IPoyzAvG c=1 sm=1 tr=0 ts=6a91ca81 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ypuo+zZCpu048z3kylcvuA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Chss0xDGAAAA:8 a=_7onyXRF9wsX3SFU1x0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=VZ1z_dUGxXw8Qzmhq9nZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE1NSBTYWx0ZWRfX1OzVv6UaPc39
 e/8Wvm7Nj7ZkRZrxQBYZro45zjVOxy6dDdfVRcpiOjB08vBKmuY1aVWHint4O22OXCX/C09/9n7
 VLVsKbfT4G9VTIUjbBznCHbQc5Ifymr+Mq5IkQbPFG3z4Augq1MnHBK41fMfUDQKWClo2EgvCzP
 HNqt7ExEFDSMK/avzwz3g4zZk9Ugc8YWTWx04yXDEnZsKHC7BfT0As054YTqH+8hsfKNGm+sqNK
 lIpXoGsN2HQEFsDSnLif+pEySMJxZEB6h20fGydK61msH9kLor7EuDBZh+OTBZdzNoIDKXayD5m
 nvMgNX4ObGWlB4GFCn2dq7YCeEKCDdD1fh5KGs7aD8TzYoQ1qm8QmVJqrDkYeq71QlHm4+1NZ7c
 ZJPfo0AdwJp1pQU4ft65vI076ekRa83tlH76NWdQ0tNPo+wRscM/Hz78eJ3rwZGyZWifINL/2lL
 wpWISly5IThy/PWUE0A==
X-Proofpoint-ORIG-GUID: L8-UQygGXvA2Rc0TjZ5hTz5e-N7tA_wC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280155



On 8/28/2026 9:37 PM, Matt Eaton wrote:
> On Fri, Aug 28, 2026 at 3:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 28/08/2026 15:18, Matt Eaton wrote:
>>> On Fri, Aug 28, 2026 at 2:39 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 28/08/2026 14:37, Matt Eaton via B4 Relay wrote:
>>>>> From: Matt Eaton <linux@divinehawk.com>
>>>>>
>>>>> Document the xhci-no-soft-retry-quirk property, added in the
>>>>> following patch.
>>>>>
>>>>> snps,dwc3-common.yaml refs usb-xhci.yaml for every dr_mode other than
>>>>> peripheral, so a host-mode dwc3 node inherits it and dt_binding_check
>>>>> accepts it there.
>>>>
>>>> I do not understand how this sentence is relevant. Please describe the
>>>> hardware needing this.
>>>
>>> I came across this while porting the UniFi Travel Router (IPQ4018),
>>> the stock Qualcomm kernel is 4.4.60 which predates the soft retry
>>> code. The command ring hangs if you disconnect the device while it's
>>> transmitting. Reproducible consistently when using USB to tether to a
>>> phone.
>>>
>>>>>
>>>>> Signed-off-by: Matt Eaton <linux@divinehawk.com>
>>>>> ---
>>>>>   Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>>>>>   1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>>>>> index 4238ae896ef6..5d67a41658f7 100644
>>>>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>>>>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>>>>> @@ -25,6 +25,10 @@ properties:
>>>>>       description: Set if the controller has broken port disable mechanism
>>>>>       type: boolean
>>>>>
>>>>> +  xhci-no-soft-retry-quirk:
>>>>> +    description: Set if the controller cannot perform xHCI Soft Retry correctly
>>>>
>>>> Why isn't this implied by compatible? Looks like controller's property.
>>>
>>> The xhci device is created by dwc3 core as a child device, and so
>>> xhci_plat_probe() is used. I think a DT property is the right
>>> approach, similar to quirk-broken-port-ped, but to set
>>> XHCI_NO_SOFT_RETRY.
>>
>> Linux driver behavior should not matter here. DT property for telling
>> Linux what to do is not the right approach. As I said, it's implied by
>> compatible unless you bring hardware reasons why it is not. Driver
>> reasons don't matter.
> 
> Will rework without DT property. Appreciate the feedback!
> 
If you have any upstream QC target that needs this, you can use the 
following patch as reference:

https://lore.kernel.org/all/20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com/

Regards,
Krishna,
