Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886096;
	b=YxTSlqVbQ1RavHF4IPnBjqGBvfqG8UhAiWJx6ksBsAJ1yjOkhPTnGzM+sMG6rCrHA0YQ
	 UgbiuGTR4w1b2FlQmWNXlHSctWXVHgySwlrB4O/Yjp6O6UvH3yJd70kjMcLl2a5rHVlRS
	 b3H2WdCOeMZ2olk4nAIWVmke4LPg7beOBmzsjHJtOTqUCFy/qo5RAk6dTBexaV3DpS6Mn
	 vp3QGERgqEmJ143i8cMoXy/E9PeLZ1jr/dNgZMLeYjJI73DAU9J+FjyauLlI+fQm+1GZE
	 viZ/0cBUQk+nORbaw3YdZHI2X22uzBDWWxuCyUa/52zhZtNh9Cx0ZIF6W3w7jc//wLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iMd3kYBOu+TSW3dG0LvqQCxVneA1Pzgi8pIv9GsQNzU=;
	b=t3Xo/FasqN4GeF6R/ZBp5RN/gypd+3THSKlvsWIt7nLDe0jipLH8UZUK03Npf1cDhtJ+
	 yCj1JvsEiHZzO4ew0Y1SR7WY9rh3D6xsTHfvlDM/afCgjU6UFSc6KnUvXWrp6oBC31fNi
	 8hRjb70TpbToFH8SaxFTjv1dx8JzXUPr+poboKKoJT3PvlBm62tLp0GaUyqJ5Dz0hS8at
	 QEm98If3WCkyeKg8Bi7Hp+BuPtr9ltyXBZRiTPSJuXe93rAn1SiJVQ2rvrYrBJTmMNj83
	 Q5xoA8Oj85nZ5siBc8SFX5e1xrv6AsfSN1mfa/jn3vt3Z+AlEbb/jzwYuZjjmexC6MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c5zgv4O6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B6JhKe1S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927CA606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 927CA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c5zgv4O6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B6JhKe1S
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tJJk082993
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 13:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iMd3kYBOu+TSW3dG0LvqQCxVneA1Pzgi8pIv9GsQNzU=; b=c5zgv4O6mlrsJZlO
	cPzXh1UHezP5ML4J4r5c31GBVxZ0Ykk6w/uDPWl4toE+EZX7+bkDJecE+su/sjCz
	WZPi6cJsGi2fjYb0LqQMK5dO55ZA3d/BGLHfRikIn77zVgzsQOO8sBeVmV7gl9Yp
	H4bcZae8VebNfHWWB3kau7qQ6aR4RHE1iOAhuczoiiwc2V8uWmWODdrRjVNX7L3u
	hKGtM6ej0KYKiPa8ZaMhWizVeg8vj589RFIvEGxzr/YtsIgqOw2wg81bZ+9uzarD
	FFGYjUoXQJAG9r4bAC5rVI8NC0YdGpfWGrm2y4H6wKLXm8WRhiNlZ0PuAjnCsmYW
	tCstVA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p130m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:41:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so2681270eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793886093; x=1794490893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMd3kYBOu+TSW3dG0LvqQCxVneA1Pzgi8pIv9GsQNzU=;
        b=B6JhKe1S1lzGTb+1fZRXuFeRVDvIfN49LKEespKyNG029zeI7MmMo+wPYmUa2s9Uvp
         1ZOAZjyPMT/N/Qjh+nUFtVR6ZLcrUXrnlF00j+Salg58asJ3UNnXDF4Uegp98vuEVSxT
         ojOiPyTV2jXYZJUiVi8aebIWsm53HT4pQ4WLFAHFlLRsWPKyV9NqBfBo3/13G+FrLc70
         xdyy4R1v1HfGPCqzeBYo7xhLyaNiA4iCyTbzb3nNwfNdhdz2qog4BGFGLGJAxeCbnKFx
         H5Ld2H21C5FOI9nJPDQZL+CRI8jsFQfj/1ssJeDFa4L3sWUYyK1H1bVM449YqL5tJPlo
         QQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886093; x=1794490893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMd3kYBOu+TSW3dG0LvqQCxVneA1Pzgi8pIv9GsQNzU=;
        b=ps9396dwt2KCiPUYC0l77kai4Gjbrmvi8oTysUCTYzyalfqTkJIcX2dHPZ9cJvIgoC
         fC6Ga7Zq2HHOoi/FSBuh9jjhTlns2HdR50hmMb9D8mt2wa28r8NP4tqNHnm8Z3BgCHN6
         EItJj+jl9ON8t9iQuAVPxLhWgVeziv9hyt63qkgTfNmdMdqX9D6n8f3MYj6HI2LgoLsJ
         RJTBECIFD2zMUcQ0O2bgM72LIIPAqlY4sJBTUP7VNLEgj/OjHDCEq7mFjsNUwgkkQGX6
         +K75mCVTlA2dxH0Rq9JfWEbf/j057RSS4lrTrhzln49NeC/MyJ8hUZp5KiADpi3cPzm3
         ehKw==
X-Forwarded-Encrypted: i=1; AKwUvBwCxd69jXqXb8V860//fxjTVqiD2SITHGlGY6ug7BptXoSYyyQbUbs0ptJH9PbvxedtKGg+f96tJB2X7ps=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kZuA7JB2qf76DzUoSH4uvohTBtOjrCQ+j3V+YqwHfXPbR9x9N
	Imm72fs+A24RPIhm6Ziwy+MOcajQReFzgNmHoMx6SjIuyrnmWlT//WyEqnYqvWGx/+99MqcXCO8
	vjHKXQwPbdZh45EZZzBGuIdbC1zLdJZRbG6mOUgwAaN2Uyj28mEHegVk+By0qEGS7vdY=
X-Gm-Gg: AYBFou1v9c1sVowTzdJ8N3V+3mi7gbsiOubuXBf9OS4CoYPdB6q7sTaA5ix87P/5i0X
	iEREers2JqDzlnT3Ix3rWMquqypzPn1pTeQh81u11tqpJlbFnsTCSfYewN/PWuSBv5ZsGe9yOhX
	42jAe6HpFs1U03HEVfETHFkJv58vfYL5KmELrWlQKUBmUMBSisIMWl8nBr3hzHx1ZmQicB1VAzd
	ucMzs3cRXc+oR8bVWcqUVMaqqvRVgfxVIVrRzjCGirPMlvk8KWtzzVSm4Fnmp5Ny4E5Lz5MfwjW
	tOW3vLEwVqkX2q+fS0SPrjG81xe6iK1goi0xiTy1JGXBontgXE5OX1o9PH7KF+eLSkeLZ97h0vN
	KSevUbkif7nl73RofolU25dn+dVRhfGGp5KLbW9/bOArjn86hxR49wOskVaCRRmaAf6vNonwJvb
	h+eQ==
X-Received: by 2002:a05:693c:409a:b0:369:f05d:6c67 with SMTP id 5a478bee46e88-36a42364b83mr31028056eec.12.1793886093247;
        Thu, 05 Nov 2026 05:41:33 -0800 (PST)
X-Received: by 2002:a05:693c:409a:b0:369:f05d:6c67 with SMTP id 5a478bee46e88-36a42364b83mr31028024eec.12.1793886092676;
        Thu, 05 Nov 2026 05:41:32 -0800 (PST)
Received: from [10.206.97.48] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fe477sm15424892eec.17.2026.11.05.05.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:41:32 -0800 (PST)
Message-ID: <15ff1391-d35a-480a-b28d-a6507b69ba66@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 19:11:25 +0530
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
 <20261103-add_iommu_ranges-v6-2-361f3921a133@oss.qualcomm.com>
 <f416b51a-0775-4834-9e1d-af8a72d9a1d8@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <f416b51a-0775-4834-9e1d-af8a72d9a1d8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec878e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=r7ux6a0TY3_jL4VTlKIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX2EiLe8CyHKsq
 5Qn6uoZ4WNyRXSrP1x/5EfEcrwMx6riFkGBAsb7bG+LLYjWLd2aHknH56Cg8qIQ7Q6c8SW6v+L/
 Awk9LytYmXNzQKryhg+LYzavmI3d0isAWFZCvG4d0XM6yN++nRljGoo5CA/HkLQTxLtB4GAIqz7
 VhyqGfaKxbzsvzLNsxfQl2C+bvzJvXNnD8WjVUiTniJ/r7DMma5FmapMuifErg6N9cqhxcuEm5Y
 2sicvBn+YvHH3EYbtzPYIMWVsa3MPuEY/KQdz/AltizcxXmhiVCfGZI3EEw0XF9zbGgIuS3kUOr
 DjVJmWKRf8sLlRr/OC4F3BRg3iSV0s8JZ1mXLrIqJTkFu5KpbdIvBtMfhjuo8CfgKnAGUl6Yuaf
 cm/Bg2KT5XP3m8w6c7a45iZ5MFvyl5xsEB1iDbxGSsjg9AroK2JeQjYS7JQMbWlnOg0aRLR3Olb
 I2DpmnYzj5JTgi8XvZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX4Mh3IdDjiylc
 JzpUP6FpcMRHUPnMF+kUMkNyZCn3G7VgrMC0bJTIGZiq/Ad7pxqpfES0cqPlgRsPZKkw8sTSC6P
 JQoK/wLfuS++LDqk+KinKGm6oebzla4=
X-Proofpoint-ORIG-GUID: r-ww3daroE8BckFw3SC0XzoF07T8y7mt
X-Proofpoint-GUID: r-ww3daroE8BckFw3SC0XzoF07T8y7mt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050054

Hi Bryan,

On 11/4/2026 9:53 PM, Bryan O'Donoghue wrote:
> On 03/11/2026 15:29, Vikash Garodia wrote:
>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>> index 
>> 5c266511db78910d6fd221af5437cecff4931c22..0428ceb50dec58f11872b4fb64e283fa8d9046a3 100644
>> --- a/drivers/iommu/of_iommu.c
>> +++ b/drivers/iommu/of_iommu.c
>> @@ -185,11 +185,118 @@ iommu_resv_region_get_type(struct device *dev,
>>       if (start == phys->start && end == phys->end)
>>           return IOMMU_RESV_DIRECT;
>> -    dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] 
>> as reservation\n", phys,
>> -         &start, &end);
>> +    dev_err(dev, "non-direct mapping [%pr] -> [%pap-%pap] is not 
>> supported\n", phys,
>> +        &start, &end);
>>       return IOMMU_RESV_RESERVED;
>>   }
> 
> Same feedback as @ the last version of this.
> 
> I still think this behaviour change should have its own patch that 
> preceds this patch so that the logical change is clearly explained and 
> understood as a standalone change.
> 
> Supporting iommu-ranges != not mapping misaligned ranges.
> 
> Otherwise this change goes under the radar of the new functionality 
> addition.

Ack. Will push this out as a separate patch.

Regards,
Vikash

> 
> ---
> bod

