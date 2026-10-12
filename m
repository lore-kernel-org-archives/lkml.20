Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AF941A50B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800669; cv=none; b=Gv1n5w+lpTtpB5FYoLqWvihMa28+Zs2LNsnVjjk2ik3YU4/5NOnpjMXakaPhe2QhBotvj2XBEB04MXTv/UgCg4axWifuqnUvsmteilNcbs8zRwLlThEwhV+s9I6eWvlipCmW2DjwA+tyW2MwmdGAGSQqPJU95aVc/JNix4xWSPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800669; c=relaxed/simple;
	bh=yAcg4dx/zNqaXeHfWpCo3xrp+xBnubt9TSB+dfKvH/c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZcZ4YI42R7LLtPBoECn8/+5NEbHGqu3BYN0UdNl5ymqOmsibvV7ZR0k73Vw9826HKgoYzgx/SZw0mzlyPrplFHX0OFSjke5M//SYXHhVAt9DWPVBoCZy4t1eePhmr2Fvsxl76pRfGL4GXE08LQO/kXTsNiF/YYZb9142UPB4OMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYOInHZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VgfQx9uU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYOInHZq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VgfQx9uU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KHVX1779399
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:24:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Qez6+RtqXrFwpKgN7ltkzNXGq/q6Mf8vdKXpshu2lQ=; b=DYOInHZqGOALow3x
	HxqJOwp6WnEWJhWxrOapXWlhKmYzOlvkjeeucnnazs9iQYf4+Uek6rIKpDDBtkha
	JNtlFwmMHTQaGAksm7hNvB1FFcLndvl/g0EZfGAG1uSJkKZxLk3E0MK8PNvTuLFm
	/GjZ9eeheA5JtclbudwE3H9JsAVNY4Z0kSQ+yW/iXvV55DcpwftEC2i2Syx6BrbP
	4XSgvOq7rWQixMKiSwED7JmzOd0MthBJ1ueqmm6FpFwvMz8mip2Ui1W0vGFbb1pk
	D0U71g0/hU2qLo+VOAltR7BDDJBXfqXDw8gA9iqWC0WsqWJ62R6NAjSm/pXf5mFh
	1usogQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq0qfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:24:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so3329505a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791800657; x=1792405457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Qez6+RtqXrFwpKgN7ltkzNXGq/q6Mf8vdKXpshu2lQ=;
        b=VgfQx9uUT5L0n7Qqdlsow3jl4PYruV9drFuLPNT/Sb+ThlgIwlr1OUUfMnHr0bUGM/
         1SR0mfLiIVx3bgiQ6/l/TkphgMvoPvQxO+MclvF9QR33Oc+eXpbHP0xsSDyR9yfymwZV
         D8FDF7I9+pLPfSoWKziOKrr1gK3YYoisuig6Old1y81/VZBlGDFUiPSgOd5D5/83uB77
         bFVZQ/defXw7KTJj0MDuqvdaNF0pqwoH29irHuGItyQQsAQb/v4KZXB39A9hLNtIOLfU
         MSlzxeMvq4cXIATWhO03J3+N3aK+JsDLzKK4Hvhz+kHol6UF4sknAhMN/lJNZfZ1a/DZ
         b4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800657; x=1792405457;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Qez6+RtqXrFwpKgN7ltkzNXGq/q6Mf8vdKXpshu2lQ=;
        b=BSJkAST8LLzW2vRZgmghg9tIoJsxg89Yk7A/P4UmlB9ldHkPcluWeAchV/rj0+HLnR
         C8JO/DFVUgrZVrqdxKiD15FgJQijBQBBmU3ojMpeY3oAc600kqY9vi6FiYmJ6NEad5Ur
         YY25iq5QxJc+JYvRNWioGwYPct01iq02NmPtNiADUtCX7QhS7Y3Nruo3yGAibOAqcbG9
         PsuX8y85vTKCoaZZ8ZwpLkmyfEqwW/gsHDgbJZipTFjblyX8ieelgENojtfYu9+Efkt9
         cInvt0ZKNZ0iooDHkNY1IsvHUthRWmkWMoPILh+APyGdbRU/NdQGUIIqd2FeRvANf/89
         Fu6A==
X-Forwarded-Encrypted: i=1; AKwUvByJ8drIg0LgIvqcmALRHnLF6AA2OOBqmGXcBp9BM7N3oOJfLxFPwIMU2X9CTjxs7VImfr54uef+QlFaHpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjK+TvQZpABGTATqSvxI4SFHSrRyZ9fCKvlySnqhJtIRRSJ9IL
	kjAm4iG66sCU3IamNa9meEEBRUk0CLwOM74ynN8zkCR8NmOxfqms7zeyElo55wpk17yjTFAeubD
	znNOKi4F+XcCrw58VvGgwfCvgXQcjav2rzmDXDylIs014xR9O+znKj4zF8Ww/DPhQh0E=
X-Gm-Gg: AYBFou2crUuT/SnlVpJGabXxS65z/RZx5dmoH2n+zIpLhQ+KAf8GsLjKnHxfhkvmavO
	1PcXPPj+2tbi0IH7iuKDPYWavFPMxBppAlGgiytbIRdtJCGi+Xe/DYU6290TUgvOR+d6u70DogY
	05LzlMVTXLPU7jKUfHDhwXn93BFRBYBNp8Zt35FkPFwyY7et1z7Ai1KRnW5BFD7yElSV66961Lf
	k/gc9kfqdZ8Yr3IWNk8F3/J5AlqKKHGWZSJXEKeBTC2z435nncAgKBrpn1WUxowXVSfQJPIwOQ8
	88km/+osnXQ4g3GItuFVwuOBaX/diXRffsKIep6y9E1fGZAkICFPrI/A40x+dpCAtigvhjWuErz
	yuHiragKaCEckAVH57A==
X-Received: by 2002:a17:90b:5887:b0:3ab:364a:9532 with SMTP id 98e67ed59e1d1-3ab3acc548fmr8404188a91.44.1791800656837;
        Mon, 12 Oct 2026 03:24:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5887:b0:3ab:364a:9532 with SMTP id 98e67ed59e1d1-3ab3acc548fmr8404138a91.44.1791800656287;
        Mon, 12 Oct 2026 03:24:16 -0700 (PDT)
Received: from [10.64.69.36] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ca1e04sm16636916a91.1.2026.10.12.03.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 03:24:15 -0700 (PDT)
Message-ID: <51bc6576-7e52-4685-b7b2-a355c2b7e1ae@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:24:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
From: Yin Li <yin.li@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
 <20261008212736.GB1318789-robh@kernel.org>
 <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accb551 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=U2AAjZBgJX8MQhfA68EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MSBTYWx0ZWRfX2ndXcQyHI7pt
 Rrm34zAl7uXJnu8dwHC4oe/ZsYN3n5wVx1qWAQ4tOoKLatNxZj4DVDX/id5FiS+drswLD78VWBw
 VFTaZ8i9zUtjc9fHLV1VaLDrDynwLGg=
X-Proofpoint-GUID: 6XrkSELqvuDpi9WgZ8ePI-GGHE3l5utt
X-Proofpoint-ORIG-GUID: 6XrkSELqvuDpi9WgZ8ePI-GGHE3l5utt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MSBTYWx0ZWRfX99Syrd7MDMYn
 4RTnj9roUIFQuDLWC1BmiT63kG143t3eXt5I3hpKbYfe7IIgTRv9Byg79xMp8x65361rn+fYOT2
 6PacZUYqFj4tOzmNpPunw6Zg/w5f1OqMHJtAerJs0spRSMlVp5aBNViNzQiR8Fdj2756kSIcqKp
 g7nQgtXbxuly6xGWhhPy3Qh87x7Ndp7/cuB21AmyabwYNSrFCnEVBv5SKAiMIadss8qZ7lD77LY
 qma80HkfhgBVHVatE3ko83NZxf9Cg/d5/JZ6HCSnMI4G0rZ/i1t3D2iBEfu8sxEem6SFAxxb7o6
 V6gZvccEsnUTXju+9fwzGuXJDMiaSDt0x5YDp04WpSP0d4OIBA5wwDYGt7bmNlBAycJICF96+mx
 ZvwpUt9ye+ffJxpnRtTGOiFB6e2DjHAqLqdWZfb856Vz3nGaNOhdFg90gROF3rHZbSIE9wBvjjK
 OuWUU1d5t0xBwhDuMzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120041



On 10/12/2026 3:05 PM, Yin Li wrote:
> 
> 
> On 10/9/2026 5:27 AM, Rob Herring wrote:
>> On Thu, Oct 08, 2026 at 02:41:12PM +0800, Yin Li wrote:
>>> From: Rob Herring <robh@kernel.org>
>>>
>>> The binding is designed around the assumption that an MSC will be a
>>> sub-block of something else such as a memory controller, cache 
>>> controller,
>>> or IOMMU. However, it's certainly possible a design does not have that
>>> association or has a mixture of both, so the binding illustrates how 
>>> we can
>>> support that with RIS child nodes.
>>>
>>> A key part of MPAM is we need to know about all of the MSCs in the 
>>> system
>>> before it can be enabled. This drives the need for the genericish
>>> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
>>> until a h/w specific driver potentially enables the h/w.
>>>
>>> Cc: James Morse <james.morse@arm.com>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> [ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
>>>    standalone arm,mpam-msc and the two-item combination; fix schema 
>>> field
>>>    order, type constraints and yamllint spacing; fix example reg 
>>> addresses,
>>>    add arm,mpam-device phandle and remove TODO comment ]
>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 ++++++++++ 
>>> +++++++++++
>>>   1 file changed, 202 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml 
>>> b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>> new file mode 100644
>>> index 000000000000..3c7b13a23ff2
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>> @@ -0,0 +1,202 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
>>> +
>>> +maintainers:
>>> +  - Rob Herring <robh@kernel.org>
>>> +
>>> +description: |
>>> +  The Arm MPAM specification can be found here:
>>> +
>>> +  https://developer.arm.com/documentation/ddi0598/latest
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: arm,mpam-msc                   # Further details are 
>>> discoverable
>>> +      - items:
>>> +          - const: arm,mpam-memory-controller-msc
>>
>> Why do we need this?
>>
> 
> Hi Rob,
> 
> Thanks for the review.
> 
> The 'arm,mpam-memory-controller-msc' compatible is needed because,
> unlike cache MSCs, memory controller MSCs cannot rely on the parent node
> to identify the resource type.
> 
> Cache controllers universally carry a 'cache' compatible, so the driver
> can recognise any cache parent and derive the cache ID from standard
> properties. No equivalent convention exists for memory controllers, and
> the component ID comes from the MSC's own 'numa-node-id' rather than the
> parent, so there is no parent attribute to rely on.
> 

Hi Rob,

As a follow-up to my previous reply:
Whatever the outcome of the discussion on "arm_mpam: Add support for
memory controller MSC on DT platforms", we will keep the binding and
driver support consistent. If it's dropped, the 
'arm,mpam-memory-controller-msc' compatible, 'numa-node-id' property, 
and the memory controller example will be removed together.

Thanks,
Yin


> 'arm,mpam-memory-controller-msc' provides the explicit declaration that
> this MSC controls memory. It is used in "arm_mpam: Add support for
> memory controller MSC on DT platforms".
> 
> On 'oneOf': the original 'items' form requires both strings to be
> present, which is not appropriate for cache MSCs. Andre also noted this 
> in RFC v2, so we changed it to 'oneOf'.
> 
>>> +          - const: arm,mpam-msc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +    description: A memory region containing registers as defined in 
>>> the MPAM
>>> +      specification.
>>> +
>>> +  interrupts:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: error (optional)
>>> +      - description: overflow (optional, only for monitoring)
>>> +
>>> +  interrupt-names:
>>> +    oneOf:
>>> +      - items:
>>> +          - enum: [error, overflow]
>>> +      - items:
>>> +          - const: error
>>> +          - const: overflow
>>
>> This can be expressed as:
>>
>>        minItems: 1
>>        items:
>>          - enum: [error, overflow]
>>          - const: overflow
>>
> 
> Agreed, will update.
> 
>>> +
>>> +  arm,not-ready-us:
>>> +    description: The maximum time in microseconds for monitoring 
>>> data to be
>>> +      accurate after a settings change. For more information, see the
>>> +      Not-Ready (NRDY) bit description in the MPAM specification.
>>> +
>>> +  numa-node-id:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description: NUMA node identifier for the memory resource this 
>>> MSC controls.
>>> +
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +patternProperties:
>>> +  '^ris@[0-9a-f]+$':
>>
>> Based on the 'reg' constraints, drop the '+'.
> 
> Agreed, will update.
> 
>>
>>> +    type: object
>>> +    additionalProperties: false
>>> +    description:
>>> +      RIS nodes for each resource instance in an MSC. These nodes 
>>> are required
>>> +      for each resource instance implementing known MPAM controls
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        enum:
>>> +          - arm,mpam-cache
>>> +          # Memory bandwidth
>>> +          - arm,mpam-memory
>>> +
>>> +      reg:
>>> +        minimum: 0
>>> +        maximum: 0xf
>>> +
>>> +      cpus:
>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>
>> Drop. 'cpus' has a type already.
>>
> 
> Agreed, will update.
> 
>>> +        description:
>>> +          Phandle(s) to the CPU node(s) this RIS belongs to. By 
>>> default, the
>>> +          parent device's affinity is used.
>>> +
>>> +      arm,mpam-device:
>>> +        $ref: /schemas/types.yaml#/definitions/phandle
>>> +        description:
>>> +          By default, the MPAM enabled device associated with a RIS 
>>> is the MSC's
>>> +          parent node. It is possible for each RIS to be associated 
>>> with
>>> +          different devices in which case 'arm,mpam-device' should 
>>> be used.
>>
>> We should drop this until there's a use for it.
>>
> 
> On 'arm,mpam-device': we believe this property is structurally
> necessary. The MPAM specification (IHI0099B) states:
>      "Resource instance selection (RIS) allows an MPAM MSC to support
>      multiple resources, including multiple resources using the same
>      resource type or partitioning control. When RIS is implemented, an
>      MPAM MSC must implement independent resource controls and two or
>      more resources of the same type."
> 
> Once an MSC implements RIS, it must support ≥ 2 resources of the same
> type (a spec requirement). An MSC node has only one parent, so the
> association between each RIS and its corresponding device cannot be
> expressed through a shared parent alone. A per-RIS explicit association
> mechanism is therefore needed, and 'arm,mpam-device' is designed for
> exactly this purpose.
> 
> The property is used in the immediately following patch "arm_mpam: Add
> device tree support for MSC probing". If you have a different view on
> this design, we are happy to discuss further.
> 
> 
>>> +
>>> +    required:
>>> +      - compatible
>>> +      - reg
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +dependencies:
>>> +  interrupts: [interrupt-names]
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    L3: cache-controller@30000000 {
>>> +        compatible = "foo,a-l3-cache", "cache";
>>> +        cache-level = <3>;
>>> +        cache-unified;
>>> +
>>> +        ranges = <0x0 0x30000000 0x800000>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +
>>> +        msc@10000 {
>>> +            compatible = "arm,mpam-msc";
>>> +            reg = <0x10000 0x2000>;
>>> +            interrupts = <1>, <2>;
>>> +            interrupt-names = "error", "overflow";
>>> +            arm,not-ready-us = <1>;
>>> +            /* CPU affinity implied by parent cache node  */
>>> +        };
>>> +    };
>>> +
>>> +    mem: memory-controller@20000 {
>>> +        compatible = "foo,a-memory-controller";
>>> +        reg = <0x20000 0x1000>;
>>> +
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +        ranges;
>>> +
>>> +        msc@21000 {
>>> +            compatible = "arm,mpam-memory-controller-msc", 
>>> "arm,mpam-msc";
>>> +            reg = <0x21000 0x1000>;
>>> +            interrupts = <3>;
>>> +            interrupt-names = "error";
>>> +            arm,not-ready-us = <1>;
>>> +            numa-node-id = <1>;
>>> +        };
>>> +    };
>>> +
>>> +    iommu@40000 {
>>> +        reg = <0x40000 0x1000>;
>>> +
>>> +        ranges;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +
>>> +        msc@41000 {
>>> +            compatible = "arm,mpam-msc";
>>> +            reg = <0x41000 0x1000>;
>>> +            interrupts = <5>, <6>;
>>> +            interrupt-names = "error", "overflow";
>>> +            arm,not-ready-us = <1>;
>>> +
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            ris@2 {
>>> +                compatible = "arm,mpam-cache";
>>> +                reg = <2>;
>>> +                arm,mpam-device = <&L3>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    msc@80000 {
>>> +        compatible = "foo,a-standalone-msc";
>>> +        reg = <0x80000 0x1000>;
>>> +
>>> +        clocks = <&clks 123>;
>>> +
>>> +        ranges;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>>> +
>>> +        msc@10000 {
>>> +            compatible = "arm,mpam-msc";
>>> +            reg = <0x10000 0x2000>;
>>> +            interrupts = <7>;
>>> +            interrupt-names = "overflow";
>>> +            arm,not-ready-us = <1>;
>>> +
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            ris@0 {
>>> +                compatible = "arm,mpam-cache";
>>> +                reg = <0>;
>>> +                arm,mpam-device = <&L2_0>;
>>> +            };
>>> +
>>> +            ris@1 {
>>> +                compatible = "arm,mpam-memory";
>>> +                reg = <1>;
>>> +                arm,mpam-device = <&mem>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +...
>>>
>>> -- 
>>> 2.34.1
>>>
> 

-- 
Thx and BRs,
Yin

