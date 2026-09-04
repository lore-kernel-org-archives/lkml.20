Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380DB3AA4EB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489761; cv=none; b=MuD1K8MFwcase2qXLwNWlZq3Obh8CkEXrM5vXvBdgcJsoNeN3yrZjCzRRnZi763W1xp9U6Ju8XroTWsy9ypPrzKh80s2R69MC2iSJnmUSANv9q8zEhO8HPWnA9j8wgNYT40os+O+i1xp33CnQa1mYrJo+3uD0Jx5zzjtLGmu7U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489761; c=relaxed/simple;
	bh=rxG5qb25UYzVQNxYfuPHH3FGVqj4kKxY8R0d1etCtpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBZUpyP0ND5xFZlBhAU6gBPWwcjFuR+x9GbeK4Sosm8y35SRovrif5lqjm/1V02SK9KGSebaUxDOrL3te/rfXaH1JjIYje0bXK0ZZdIlV5ZTnGNGwYyIOrS3tc2OaWgx2OUM9iezYGfb/MLIfW94z1YffUbMr+h+RT/WaKJEbBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eo74QmJ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJGUq3lJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eo74QmJ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJGUq3lJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683NbaAl3073269
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 02:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0525HgtheBE4qZcaZExgs/VP1xEGbWMqw5TkM1yBa9s=; b=Eo74QmJ5ELtT75BU
	Q1uLmrkRmvWAxM5L9rH9zzFca8D9RwmjKYzXG4wugbg9br34pZPhrXg0wkKsCg5f
	7MBvwh22cYuvZ0UE8ninhzVlUu8qYYVQfgmyfNi2IVyZdDmzLkjOjN1JKcE2009v
	4ZbWMwM/6izpallQrzUkdSbyfFZSDEep0/13UkdxE58OPQqJT1TqynAXjSb5EUE4
	SfNudi6VfL8zCXWU2uHV/qIecWTrk8AlURHKACtsTEktuGhJ9Mj9wSi/EGkf1J1w
	7/lETQ6xp+l7bu+rCBK1mkTyZkvaQCi/jOdelW5EJAahJ6lERwTvHy3Uq1FMOpfS
	UXihuA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b1b8t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:42:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so9157385ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788489758; x=1789094558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0525HgtheBE4qZcaZExgs/VP1xEGbWMqw5TkM1yBa9s=;
        b=LJGUq3lJUiMkAU3Brcs3DtzdLdlzmdBOaU3HI6JVW8BKsuqosOSoKI+ORlKkkyGxgP
         /UO13PPPj9V9muU3ZWDGTRRNmR+p5kYthP/4k5EegsBi4a4zI4ROVsl/izIMobICDQlf
         IuCZOgLAUUhd8EROjFS9vfLloMceS+9g6HhZWKYNtBLzSQnZG8wSPO5ldvFGWqCxl9hk
         FH9XSzhflpmI9kdO08cKVWcGukiDrtzcUT324a512jTQ0vpahkYfyadY/fSLBouLIfZP
         T/1oY0kmAj25XuCXct+KuTer0Vk8GdbkLHLIIn83WvGVPIWXZzxVSlPRqWmTN3HrXU5q
         q3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788489758; x=1789094558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0525HgtheBE4qZcaZExgs/VP1xEGbWMqw5TkM1yBa9s=;
        b=jZHJ4BTRBp4vJg4bm/cdDmZGpxKR3tO2O/6auHWbJu4u8ISsVoSDwgcsoGoF7e27pW
         cudhNJSwDCjgx/6P69Qy8yB9tOI8gCpK7KZYW0zrnOYslAbBBaesHjWpE0XgsuJJRJQ9
         uzYn2V3Pll8z4llz6cmeTGQGk+JJrA9/Vn75IMtJw3xQw/HYMVfexKjBWfyroyXyKgfh
         NLo0jOtAmKwM23XiDNlVK477IN0Uc029uIK4RtmY5Mog00LFKWbvJjNp/owRToGrWXy6
         DGc6zp5lPUUtWMIj+s2hMZZqZhIcNQxTigh6HJqlHzHN0zVCliJ2sTHRpfdiFIpSFz2w
         R+ng==
X-Forwarded-Encrypted: i=1; AKwUvBxCfSNBwe1zcIrQuFbEsV9wBUu3w/9l8VrdtY/cnYiKGrp+raEVmiozLF0u/bo3OiBvLxl3S+C0UCV6MAg=@vger.kernel.org
X-Gm-Message-State: AFuF++m3nBQXTnNLz+eAW2euuxx06BemGBmA7Lg6rVBW4uAH6pf7mzDS
	oWoyDQvW7dw4cieG60bztTG3jeKGpDikE40GlMls+XF26vrQ1ySvT8xH8xPkNcDmIYxHI7TJHq8
	z48WyLS7hQ3EggAPRSZbsTui4aF8uOqZZFbdPSabFuBGGnW1ObVt3JJa+h2OJdI1pmOU=
X-Gm-Gg: AYBFou1TJnEC9t4g5KbMAWYY0EScUtL79iHYGKaoJFAnAj6/WX1l4whlSURh9nQL4qE
	dyOivMQkLk5A/pbMbcoNXa7Eth3Aw+U5oCx66hdsJ+Y+EJ3McjzgPgHizjS9jG+NytHQ2+rl9UP
	MP2/zNht20PFZTMuthZotiLqeAbQ49Dk6iJetqwhUq8pZ8DGFCPpFMnlPC/Vt9ly4GRbcWZycnT
	dcv0aoeCafuuw5d+WIhw+vEYluA7do6p4J5zPvuPNHxUtun6Sb9YppJsoMbfaaaSYSg3i3CRx6o
	Tou7xr+mbU3Fr+XYj6gG7dTUS/z2rlXC+B5H5iv4SYBpcsRfVN6XawdPSEwbHIFNOKqzdJ/WWsa
	QgJxignFBYk3TjTVJU9TgRfh2dE5IFuu+yq/yRo8/o41Xdq+KfO12Dt/jiPR2LKkj
X-Received: by 2002:a17:902:ccca:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2db127cc2afmr41780975ad.14.1788489757710;
        Thu, 03 Sep 2026 19:42:37 -0700 (PDT)
X-Received: by 2002:a17:902:ccca:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2db127cc2afmr41780565ad.14.1788489757237;
        Thu, 03 Sep 2026 19:42:37 -0700 (PDT)
Received: from [10.133.33.207] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497e9e5sm3207345ad.38.2026.09.03.19.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 19:42:36 -0700 (PDT)
Message-ID: <3f67a5dd-e567-409c-ba93-8931ffadf75b@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:42:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/15] arm_mpam: Fix ris_idx type to prevent range
 check bypass on truncation
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
 <20260811-mpam-resctrl-dt-knp-support-v1-8-ea6397bead59@oss.qualcomm.com>
 <bca22f76-4fc0-4a99-8648-4f148de7246d@arm.com>
 <b6463a78-9aed-4e17-b044-83b734cc0f9a@oss.qualcomm.com>
 <bf973056-590b-45d4-a66c-d61b480ce229@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <bf973056-590b-45d4-a66c-d61b480ce229@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YrrtPsqQUBxcJva3pBsCNkFXcJYrJXYB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDAyMyBTYWx0ZWRfX44y/HIlxvplZ
 kyPj3Wa/ewQBdigN8775YHqUJLTXhaByOHEe+Wxx1VLrZ1ysLRWqCfjuseXb7PjqpYRnUwYh3Ln
 ujvgSAqwzCLVQ9pjwGE5QgqHap0Z1dI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDAyMyBTYWx0ZWRfXxWbxi9o0JvaM
 QhDe69IoYOpY4i8kf+t3o/EfgM/N0SLYiC7azrHXznFNEwDbQWJfF2JiKfB6iwCYcCqS56beOh5
 l84qtQ9oCGtU9lQvOjTx0VRWDzsNsYyz7jtU+S9l0BMUy+A5pnOcFMTcV0jw0gBxQcxGu+C6RE+
 QTY6T0Usi6Q1+3U/W7pUCId4uTm7w3Hl/vFyNd8ZqqON4GHr/9FEvjfj0UIGMHQaohLNuDyjVTf
 6/FRNxbuPiAzMVRi5whTIoET1czaDzRyTSZg/fk+VCDJHyIi4qSvE3hLyeVn/93C0abTdXnzT6h
 83p3qsDhew23y6xZSlYGVtkh8lNhqp0PRnvivw+vwQNFP5YLspm80qQ8Jyayid8HmvgllLWMxGA
 wpNIkM1tQQSTK/mTcB2kFerApYElDaRG2X+rvsU47oVtWB9Vcv3WNe5HFobjQiQpEH8HE66MCfy
 W9Q9vLBDbg7ZGk6RSrQ==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a9a301e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=neYdvBUB4e3bnShflY0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: YrrtPsqQUBxcJva3pBsCNkFXcJYrJXYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_07,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040023



On 9/3/2026 9:27 PM, Andre Przywara wrote:
> Hi,
> 
> On 9/3/26 11:42, Yin Li wrote:
>>
>>
>> On 9/3/2026 12:22 AM, Andre Przywara wrote:
>>> Hi,
>>>
>>> On 8/11/26 15:30, Yin Li wrote:
>>>> The RIS index is read from device tree as u64 via 
>>>> of_property_read_reg(),
>>>
>>> what does it do that using an u64, actually? Do you refer to the reg 
>>> property of the ris subnode, which has a limit of 0xf in the DT 
>>> binding? So shouldn't it be an u8 all along, and we fix the types up 
>>> at the sources, rather than widening everything needlessly to u64?
>>>
>>
>> Hi Andre,
>>
>> Thanks for the review.
>>
>> Yes, this is the reg property of the ris subnode. The reason it starts
>> as u64 is that it's read via of_property_read_reg(), whose API takes a
> 
> Yes, I figured as much, *after* hitting the Send button ;-)
> 

😜

>> u64* for the value — so ris_idx has to be u64 at that point, regardless
>> of the 0xf limit in the binding.
> 
> Which actually makes me wonder whether this is the right function to 
> use, since there would be no translation (as indeed guaranteed by this 
> function), but also no size, and I guess no cell size requirements 
> beyond 1. I think it has the added benefit of checking #address-cells 
> and #size-cells, but technically a standard of_property_read_u32() would 
> do as well? Though this probably has the same problem, just with u32 ...
> 
>> If ris_idx were narrowed to u8 before reaching the range check in
>> mpam_ris_create_locked() (ris_idx >= MPAM_MSC_MAX_NUM_RIS), an
>> out-of-range value such as 0x100 would be truncated to 0x00 and silently
>> bypass that check. Keeping the wider type through the chain lets that
>> check see the real value and reject invalid indices.
>>
>> If you feel an explicit check right after of_property_read_reg() (with
>> the downstream types kept as u8) is cleaner, I'm glad to go that way —
>> whichever you prefer.
> 
> Yeah, I feel it's sane to already check the limit directly after parsing 
> from the DT, not only in mpam_ris_create() later. Do you know of any 
> particular reason this is done so late?
> If there is none, I think the cleanest is to keep of_property_read_reg() 
> and check against the limit already in that function. Then we can use a 
> u8 all along.
> 

Hi Andre,

No particular reason for the late check — it just followed the existing
structure, where mpam_ris_create() already does the range check for both
the ACPI and DT paths. Nothing requires it to happen there.

And agreed on keeping of_property_read_reg(): the #address-cells /
#size-cells validation is worth having, and of_property_read_u32()
wouldn't avoid the truncation anyway.

I'll check the limit right after of_property_read_reg() and use u8
throughout the downstream path. Checking before the narrowing avoids the
truncation concern at the source, and drops the needless widening. Will
do this in the next version.

> Cheers,
> Andre
> 
>>>> but was narrowed to u32 when passed to mpam_dt_parse_resource() and
>>>> further to u8 when passed to mpam_ris_create(). A value exceeding
>>>> MPAM_MSC_MAX_NUM_RIS could be silently truncated to a small index that
>>>> passes the range check in mpam_ris_create_locked(), leading to 
>>>> incorrect
>>>> RIS creation.
>>>>
>>>> Widen the ris_idx parameter through mpam_dt_parse_resource(),
>>>> mpam_ris_create_locked(), and mpam_ris_create() to u64 so the value
>>>> is preserved until the range check in mpam_ris_create_locked() rejects
>>>> out-of-range indices.
>>>>
>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>> ---
>>>>   drivers/resctrl/mpam_devices.c | 6 +++---
>>>>   include/linux/arm_mpam.h       | 4 ++--
>>>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>>>> mpam_devices.c
>>>> index cc9fa1d78925..1e082fb60e30 100644
>>>> --- a/drivers/resctrl/mpam_devices.c
>>>> +++ b/drivers/resctrl/mpam_devices.c
>>>> @@ -260,7 +260,7 @@ static int mpam_dt_count_msc(void)
>>>>   }
>>>>   static int mpam_dt_parse_resource(struct mpam_msc *msc, struct 
>>>> device_node *np,
>>>> -                  u32 ris_idx)
>>>> +                  u64 ris_idx)
>>>>   {
>>>>       int err = 0;
>>>>       u32 class_id = 0;
>>>> @@ -712,7 +712,7 @@ static int mpam_ris_get_affinity(struct mpam_msc 
>>>> *msc, cpumask_t *affinity,
>>>>       return 0;
>>>>   }
>>>> -static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>>>> +static int mpam_ris_create_locked(struct mpam_msc *msc, u64 ris_idx,
>>>>                     enum mpam_class_types type, u8 class_id,
>>>>                     int component_id)
>>>>   {
>>>> @@ -799,7 +799,7 @@ static void mpam_ris_destroy(struct mpam_msc_ris 
>>>> *ris)
>>>>           mpam_vmsc_destroy(vmsc);
>>>>   }
>>>> -int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>>> +int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>>>               enum mpam_class_types type, u8 class_id, int 
>>>> component_id)
>>>>   {
>>>>       int err;
>>>> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
>>>> index f92a36187a52..30461cd71199 100644
>>>> --- a/include/linux/arm_mpam.h
>>>> +++ b/include/linux/arm_mpam.h
>>>> @@ -39,10 +39,10 @@ static inline int acpi_mpam_count_msc(void) 
>>>> { return -EINVAL; }
>>>>   #endif
>>>>   #ifdef CONFIG_ARM64_MPAM_DRIVER
>>>> -int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>>> +int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>>>               enum mpam_class_types type, u8 class_id, int 
>>>> component_id);
>>>>   #else
>>>> -static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>>> +static inline int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>>>                     enum mpam_class_types type, u8 class_id,
>>>>                     int component_id)
>>>>   {
>>>>
>>>
>>
> 

-- 
Thx and BRs,
Yin

