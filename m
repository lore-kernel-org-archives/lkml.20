Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885990;
	b=FWpagXPZ3oypVp6IGU/SCYSMrRXwjgvH54G5CTJPKTO+IKJIbGQGIbGjPPpvFV1pCYfg
	 3/LLuZ8buwBZqpRKcTncHmO+kzpi60lX0ODyw5jHpcSJkwPj6KjZweQvTF1Nu3gr9mAEi
	 41wT46TQnwbVu3nqV99mCcV6b114HjXXQ12mQ5NyhdWlQia1oJj3x0BBPB6TGE8u8qGlx
	 kXKKqUPClVTlJmESfTjyNNKxJVSwYqt0E/u2JsEAcYTOx6aCLhzLoO6eYVOB78lH832yN
	 8JVPdl1HXftp+55NNS5OZVJxZMgtYCh54/RCsC0/6o/DQbxMkRGvRBHXAGFgpc3qdoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ca75OONoSil29mOME3yxUZukBMpNuAXeGO/o4FyBT1k=;
	b=0cmFYjZNc5niwAc2pKzpP4fPOnHPxIlN2wSirQzGPjaA8gtzGijhjF7rWS+qGpwjHqK4
	 Dpv8rzBWX78WXPXzXxe2aj3pfsp6iULdOuecORfP4ptdoNqXKFVMLj1wszaBXtIlYSLkg
	 vwBSJiDBFhDFvFV3zIq1wAN2XDOxnw5jq+Zkja1GdFA+Ev5XwlIQULAdQCYzTTmVTcb+O
	 cqLgi7B0zrfbhNKg8qogl5/kUYGZkGLTii8IB5PKTZAp6sqTK1NK9XYDDDKICDcYhVD18
	 vcjyaR6D4a5uRM4EKZWDd78w11nCQ3agvpcyeiTPLdMmcV2pGDeyB1RXMlDQEc5NG0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CClOpqWi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilqt0GpI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A35606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30A35606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CClOpqWi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilqt0GpI
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tFAb082962
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 13:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ca75OONoSil29mOME3yxUZukBMpNuAXeGO/o4FyBT1k=; b=CClOpqWiTvqkA03E
	ytnL7SM0+W+sCOnUnxqSaoBQS7OcqQR1mhJF8edLeQQtPhGLvG7IpgErn/E+4vrM
	l4HuE4tHLfdNcLfum8Gku0xiQJfBimzs/Cn+Ryam4yafeo7Ft6ly2Ub9vHiPMGvU
	O+KdHkf1LUD0sS0E4H+MbuDZ6z2uNOV3fx8MaU7Be0GlMrWnqh78rvsu1pSAN2KZ
	UEBWZBtl+uRBrivSlv6Eo9cuikEbxgdlwJ/6fazpYuprtx0gGIAsei8WL44Ya6DO
	KOC6WT5+C2hrdLZmmdyV7pqD5nqI3IEMj1X9YdzYEgMMMUacY+Vy08/oL704tM9C
	L19VWQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p12tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:39:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso1268356a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793885988; x=1794490788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ca75OONoSil29mOME3yxUZukBMpNuAXeGO/o4FyBT1k=;
        b=ilqt0GpIe1ZV83p8+wTj86UbD6upCgLXdSHqRFteml2pQFu7bp7tTyfCGPG9vmMxY4
         wWznLwABk2T1pgTL//NkJOF1QLKD2MSP6Nw2aXDN7YltXE/Pp2bsAHFUyCjhcOgRVDB4
         eDmvw9fmcDUMChIywklkPf/NvDb7OJK8+3fwAV9JJO6P8DgV54d4w3hn+HtjtdwMo0JX
         O9I9Z3o1Mh+vFaAxlYj14afh3rpB9NTnQtO5BPrG8usOwgXun1Hr9VFdR5U/2nLyjkGL
         iaqzDwUPA+FBrGb+G4zmWktGOph2g1MV6GiUC8080nNUq72HmrDkZcBC8Ar2oU2l7eUx
         vnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885988; x=1794490788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ca75OONoSil29mOME3yxUZukBMpNuAXeGO/o4FyBT1k=;
        b=mvfarFfNPjYflzYrLWfn/X/j73JHeFYZNjJGQ+lLGrxJsCCMn4u3KiCZUhm/sUUxCf
         u4D2X5mhopxjMfO1Rq9gdU0RWanFis5SciNv3NftYs0WRQyWCZB6aoIuHpJEcDVBHKdn
         ERZCBl9LtOKWGiYEgI+iYyFhl4avioPzkYJMihd+xOPd1675nK4pLurjlHrCxDWwJCe2
         hZx4icZr1us72UgOSLqQs4d8RAKfzFJ0+azTjdg80RwjT+NG5sy61qswKKrwKMIcTt6+
         YR+WaxjZGyk787e3dkSwYLlqmXA0IjDaq5dhROiGMhL9cFRHQJn5j2RBIudLzkw0HYcE
         2Rww==
X-Forwarded-Encrypted: i=1; AKwUvByescuAPGx7ZcDRS6FkCoM0bOyUAX1L0X6TniX5aWNo9N8xdVkPgIozNq+ZO/paL12y7sPCB2Q1m+y9J+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gXa2qRsd80L+HkCyuQmKD11UDBMh4NTN6ZRqDtaes+L/83/sp
	iuHFtoLdBPGrnFd+1Z49QxNBBZyRfiVIhCUoILWdoXdkaozB+de5P+03UdRi/RvaXVbnDAlzwpF
	WnaPvoGXiL3ZqisHy33gdEs/I7O5dyqn2uE0cw4OKSn1hZvpTKx0m6BGull45P5zv5iI=
X-Gm-Gg: AYBFou39OUFffDC/A1A6XnQkFEIofDWETmvF5kWIhrPe9nsg1CpyAz6lwsgIoY08iTa
	LT6oT9il3emOY7vOAonBGV+U7SXXEUY+YMEwDHHD/vTDXQvL1g7/eyY+Eb5uXJv98g4ib4FkRtq
	X9Yutr/i/aHc2EIx6KRtvQOMahlYG+AWb05nfa9z8CnaW3gwXAML8SAZJRsc3Bics+fRnRTtWPD
	hU8P1AUgquaoCv/Ea73EKVJneW2yOZPs9XK+SsZOeMA/ddm588bjTBdPiNRV5YlEbs610hJ7NGJ
	fqzWNu4h5OQW276pZoH7EiOM6yUly78gEyJMFZyPADrWapQo17KgiN8x400rVq2AzfZT99U8Q0c
	UtmegoVVF90xNNC6KJaCizU0PXmNNu873+pL69iezsCuO8J+UvpV/e+g38yhxF5mLcMnCt1qrnb
	N7OQ==
X-Received: by 2002:a17:90a:da86:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3ae897f61aamr16476355a91.24.1793885987754;
        Thu, 05 Nov 2026 05:39:47 -0800 (PST)
X-Received: by 2002:a17:90a:da86:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3ae897f61aamr16476312a91.24.1793885987137;
        Thu, 05 Nov 2026 05:39:47 -0800 (PST)
Received: from [10.206.97.48] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4691d431sm2208325a12.11.2026.11.05.05.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:39:46 -0800 (PST)
Message-ID: <e7d81da2-c083-4aca-8fe9-38a068613ddd@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 19:09:38 +0530
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
Subject: Re: [PATCH v6 2/2] of: Add support for "iommu-ranges" on a device
 node
To: Rob Herring <robh@kernel.org>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
 <20261103-add_iommu_ranges-v6-2-361f3921a133@oss.qualcomm.com>
 <20261104160346.GD3951195-robh@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261104160346.GD3951195-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec8724 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e-HLqTR_PI6rTb-hZFoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX3W+AfR/1HLA9
 wcwmXGW86YB8LRJTjNEadgbvXr5lAJ3WL/RoOqKFvqwh6awH8LEBKu6Jn9yGXqUhlF80LB7NO7E
 HlCYz1F4vDz1RMXNYw7O+O9Rge2+YM043/LgZ7LksoSQfhgO1vieODopLYEGIwIhi7zAXoljHSy
 HUDXKUVzxxGiJjbrVn6aUIrCE6Q0faMilcU59cYdmPF9Wj1KFMM0nafIvZvY3EkEfyo91J33jqF
 nnrLL9l1nBOwRr0IvlxC9TnQz4KTZTv3UI5JFXo+/yWoUVmGeYKzRczVxRgHPhq5eu/q4FOEijn
 B93jduOmdDup1/3aL8xv26XBTIHc/wbuI/JDBbtu2TfucKOY0N7V9uZD1RMMs9rcF77OQoVfXWx
 vF9FW0+6lWY++tXRhg5dIM75OvV5wx2p1tt8zkZ2bdjsv1hkXjrWHxhFqDkGqYV8zhg0fHzzzFh
 bwJeZ8JQ09tsBNyCLOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX9nlkML/lk4WB
 xXqvgQT8JllpEduxUut682ge8AYFLBRzMxHFCVFO+tr2g6HDzTsUKCdk249L2TuOFfwKwHdcq0F
 zUyHjR3lqqueo2oJN1B8PEAibPNRLfw=
X-Proofpoint-ORIG-GUID: uLmyQfdjWIOX8ZXl4bEHvrADKGS9Nfg5
X-Proofpoint-GUID: uLmyQfdjWIOX8ZXl4bEHvrADKGS9Nfg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050054

Hi Rob,

Appreciate your reviews/suggestions on this patch.

On 11/4/2026 9:33 PM, Rob Herring wrote:
> On Tue, Nov 03, 2026 at 08:59:33PM +0530, Vikash Garodia wrote:
>> Reserving an IOVA address using "iommu-addresses" requires it to be
>> placed in the reserved-memory node. But when "iommu-addresses" is the
>> only property being described and there is no backing "reg" (i.e. no
>> actual reserved system memory), it does not really belong under
>> /reserved-memory. A device IOVA range is specific to its own address
>> space, and does not describe the system physical memory to make it
>> qualify under reserved-memory. Given this, place "iommu-addresses"
>> inside reserved-memory only when it is paired with a "reg", otherwise,
>> define it within the device own node. It was discussed here:
>> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
>>
>> Existing "iommu-addresses" property expects a phandle, which does
>> not make sense when the property is defined within the device node.
>> "iommu-ranges" was introduced to specify the device specific IOVA ranges
>> when there is no backing "reg".
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/iommu/of_iommu.c | 134 +++++++++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 125 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index 5c266511db78910d6fd221af5437cecff4931c22..0428ceb50dec58f11872b4fb64e283fa8d9046a3 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -185,11 +185,118 @@ iommu_resv_region_get_type(struct device *dev,
>>   	if (start == phys->start && end == phys->end)
>>   		return IOMMU_RESV_DIRECT;
>>   
>> -	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n", phys,
>> -		 &start, &end);
>> +	dev_err(dev, "non-direct mapping [%pr] -> [%pap-%pap] is not supported\n", phys,
>> +		&start, &end);
>>   	return IOMMU_RESV_RESERVED;
>>   }
>>   
>> +/**
>> + * of_iommu_derive_resv_regions - derive reserved regions which
>> + *                                are outside of iommu-ranges
>> + * @dev: device for which to get reserved regions
>> + * @list: reserved region list
>> + *
>> + * A device can describe its own usable IOVA ranges directly on its node
>> + * via "iommu-ranges". Everything not under those ranges is derived
>> + * as a reserved region so the IOMMU allocator won't use it. Entries may
>> + * appear in any order in the property.
>> + */
>> +#if IS_ENABLED(CONFIG_OF_ADDRESS)
> 
> Is this really needed? Assuming CONFIG_OF is enabled, this is only false
> on Sparc. I don't think Sparc needs anything in this file. There
> aren't any IOMMU drivers for Sparc unless COMPILE_TEST is enabled. So
> maybe building of_iommu.c as a whole should depend on CONFIG_OF_ADDRESS?

Agree, that's much better than adding the check, will drop from other 
places too and make it conditional compilation.

Regards,
Vikash

> 
> Rob

