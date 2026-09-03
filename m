Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E147D3BF682
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428757; cv=none; b=P87hs5Kitn7O4N+jT84OWqLrmtXYVH5RiViHAAAWN8+zOzAZf/TT/U8Bd9kqxK99pP5o4/+Bmit8hDwdZ69rt7N/ULw2H6csC8kn/EMFrdAqxRclDrQ5LqjlJFZc7Trqz7NDIZ7xKIp4DCN+as68WRih9yKaar1Fn6bhE3pGHyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428757; c=relaxed/simple;
	bh=bjN3M30Ep3WgmUgjhhDmuncCbH8FYD+tR8QRFkjuQn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3JunxIBtlZ9dJGjvsyhZi8t8weUvDhc1WLxmV9G767bmydTJJTw4cIL7hL1lCfWHRqNHsKpPWNA/5VxD/M9CZkj9KbcrHOstH9aiT+PR99p3D9Rg9gC7mlFHx4z/A3H1LXyDDSyin03KIYCsUgy1rmmw7kroowiHlL/oSSZef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8sAFUfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enIZJ3q1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8sAFUfX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enIZJ3q1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392vYI269129
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0lmoue5eucI+rt1G7AZu5sBjUo04Z78KhxZq2assY8=; b=i8sAFUfXSEkYKyzy
	kZ1mu/S8BnuJRg7AS65UyLAyAnzE11ToHM7aYAZ4CD2AtI7SC6mabv7lv2++B8WD
	cnyus6NbgNNxojnAnLhhB2WOIwFzG9pqk/mgoSlyfr0mBrOcCH7LMQXTB5+MDLmB
	HsCq41xmadauTBv2uNw1pD3CylGRGU69+UF6Gb90Pp+JV+XOzsPcRSkk8Y8Ws+M9
	nECHQzUDS+vaL4A2Gm61YXuweYgSd3FYcji714yBl1jJ54OQE9Tfe5yskM5uexU9
	UqsbdrO+ZuS3F4RwHowRwZsB7P2nAodkcuWfdbdcsnzQ98HEfyj/ArwCC09Ak/h/
	YoJXPA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhcj4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:45:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so3565026a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788428754; x=1789033554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0lmoue5eucI+rt1G7AZu5sBjUo04Z78KhxZq2assY8=;
        b=enIZJ3q1NrWddZNZOg24tlH2SdocM4io6YaTiNUSLjdq3bNl8mX9hPbov0W0Lq3Hkv
         pAfGplatZQ0Lt3IM+VlCie9DazFLzO0E57wDBgeex5ahQrQToH+Fbidw8QbFd9SeqQR/
         R9nG0LVP2uiu3a8EOJJq0eRu5W7swQ7IA8xG+Ki7uQe5kVN7Zldcycjl1LYiHS2/qlIx
         bLxOIvr2/ODwiWAl34Hkq/546JwoSt3Qt4fvfe4MoNTbk4MPv14rR8UWPkFvRElSbOY3
         tJbbmH20u1rYwAvjlujgsMm6oP2v+yXqWTPj+2+JvfqVKgo1jPWpHkVE4OWRHfntmXMk
         uWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428754; x=1789033554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0lmoue5eucI+rt1G7AZu5sBjUo04Z78KhxZq2assY8=;
        b=IpFFH8aqbcVGnGF2FsShSQ3G+ucgQomvoPAVY12n9XRueoRCencZA3W5KLtXMo5zo/
         ZQA9e/YTaxhB7WdixN/BQAFTlDj4bX+UvEDUvLa0zT7fQfI0LZLoc7IiSULP8C1FChdu
         pBiHDnqbgT7Ky+MLc4m3lZaS3yBFJUwE/DiUnsYlNsxtLg7+hXMJNYZi4qxan0OgHOMz
         r4J1jmxCQGF0h/FhSY2FAHwi0h5BLc6aPCValLF+rY9RRe7IOEbVKUDcNUDjnXV7s+w3
         byyhqC04CoOy6NvEq7prJilKYeSUMT6HhLRa2NKYHU5kVWF+vMIKi3u7opU8guUrmo7U
         pdbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjso+JvJ6/zONtyRT+eqmEKfMCBOBS8qs37hspKRLOWQjZdGu1eIUREKbBj2qqwvm8ICMsshJpRIrBOmc=@vger.kernel.org
X-Gm-Message-State: AFuF++l/wyjPDZ03+Tvsg3NZSeKiCJqfQbqBo3/d3BPm2D6HUxZM/G7t
	1Ole3sgZN3/E9yheG6aG5nsGx4BBXNMS4wgP5oQ4LmrpJtcKQATDjCF9FlCoBHY0NyI4Sz2v6Qf
	0Z/+gZcZBYOLVB6vjqekouAj5UyUveS75WJo6UKMabBMVlJ32HIVswAehZkL0eam4ZW4=
X-Gm-Gg: AYBFou3/36BWo6bMBVVaW330k7NEEF0cB3YSuA+iT3JhtV3zrDQLpkcG1k2gzYYyxvB
	1tuLEN1jUkGFDQOOoKZ6IvSJVozIm6sZmdms8QPp2c6FgyRVbQSP4vB9kSFuCJc3awrn4CEi4HA
	1tL2xn56iVHePrxVS/ADR5w0MfHAGc8jVD0EN2KH06GLPhWn4runsnNB1/vtSKDzPbo8HwqiJe1
	LYpkUs+x+TJrgmLe2SHA8Bi8AiUB6daF+V7Y/sDH48ywY3h+wDsxAwyoF2lzXuazHHjBSCgZc67
	M6RTcGhhlWaJ+b4qnD5XXpzD373XfQgPxOH9dYgxefkfLu5vBNYg+yj/e+p7lljDqeSZDpqj3iX
	o+gA9kM0+1KgvKOiMiA==
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr18256932a91.1.1788428753657;
        Thu, 03 Sep 2026 02:45:53 -0700 (PDT)
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr18256854a91.1.1788428753180;
        Thu, 03 Sep 2026 02:45:53 -0700 (PDT)
Received: from [10.64.71.54] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39451sm4337270a91.7.2026.09.03.02.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:45:52 -0700 (PDT)
Message-ID: <8664726d-80b1-42e5-830c-a5490f8e531d@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 17:45:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/15] arm_mpam: Fix MSC MMIO window size to use
 resource_size() instead of end - start
To: Andre Przywara <andre.przywara@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
 <bd59c8b4-6b29-494d-b540-8feed38d0955@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <bd59c8b4-6b29-494d-b540-8feed38d0955@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fGb1dJjRAtOE_gauqDKpuQZVscxVJQFz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MyBTYWx0ZWRfX4PD+12uMjdA0
 TNQi3MZPQ7gdsd7o8o2CjnKtj4aWk605nw+mSru/Q1q+Xpioz2r6hr2AJaEDSFC08kbbOKzHrbr
 Tk0OGel4jkzp+AezxlcrkbgmpqxEyJzrcfHndMpn702F5ux7aCGW9Ce+q03l6uuc34SYrX39PQd
 ND7CR7IJYmta853rarc8emvOVr33zILcqdBs8m8i+q/aGhkVqYmNhscl5F62DHK/W5jRR42zz5q
 Cfh2uxnnBJ488a+MHKKgzwV2pzksTDQnOC9ouunCox++T9O1n8qG+lE6xCNzQvJ+mlqfFt7hh/u
 iGbDe7nMKPaUbvFhfPbkZg8kDI41IuCvm4DUaGp6GqBoqCYmqqLpqX7uBo+46VBCpbarL8ymr1l
 z4jN28GTWGSOciZf/NU8HVIthzQtpWsI3d5TfhsTDsRlE/Mgxyp7ed8CUKE1ntbkIRs3XbNnVfL
 Cu3R4vYvJX2sMIHT/Iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MyBTYWx0ZWRfX9RKCvLaZxfiR
 2bA2KmI3Pt8Y3bgELsONMOE33mB20IZXDHzaAiZcyYMgG3YSSJiqMpDKS3AdGF6WrhGgYCYXSSr
 qgdrP3fb+QnpiF9VEEH/FBwTqF5N21Y=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a9941d2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=YPZJ3_3Ys_XZ9m81jMgA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: fGb1dJjRAtOE_gauqDKpuQZVscxVJQFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030083



On 9/2/2026 9:16 PM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> struct resource uses an inclusive end address, so the correct size is
>> end - start + 1. The previous calculation of end - start was off by one,
>> resulting in a mapped window one byte smaller than the actual resource.
>> Use resource_size() which correctly computes end - start + 1.
> 
> Yes, thanks for catching this and making a patch. We found this 
> independently during other MPAM work, but no one got around to make a 
> patch ;-)
> 
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 
> So this patch is independent from and non-conflicting with the DT work, 
> so either Ben or James pick this one directly, or you put those kind of 
> fixes first in the series, when you repost.
> 

Hi Andre,

Thanks for the review and the Reviewed-by tag.

Agreed — like the RIS range-check fix, this one is independent of the DT
work, so I'll move it to the front of the series in the next repost.

> Cheers,
> Andre
> 
>> ---
>>   drivers/resctrl/mpam_devices.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index 1e082fb60e30..5d1854d97371 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -2296,7 +2296,7 @@ static struct mpam_msc 
>> *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>               dev_err_once(dev, "Failed to map MSC base address\n");
>>               return ERR_CAST(io);
>>           }
>> -        msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>> +        msc->mapped_hwpage_sz = resource_size(msc_res);
>>           msc->mapped_hwpage = io;
>>       } else {
>>           return ERR_PTR(-EINVAL);
>>
> 

-- 
Thx and BRs,
Yin

