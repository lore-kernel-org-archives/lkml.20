Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C3C37DE83
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368352; cv=none; b=c3y8+ZlQjQGRlheTIo8/0WwDQ8dl4WiTrsFsuSs2qhGGEU8fESSBDMWWDVynxPqESF0/xpYLf+e8MlzwUntSgvsItS1+yyuvemjMmmAq8SJpHX7zj53vD84qQFX9JZ3SEVGciWEt5zt5uFzm+gOcsqyopAUy8rRnF58gtg8Hmpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368352; c=relaxed/simple;
	bh=GucUQ9BrcmJEFSmWL2Gf/8LZYv+Q1r16zQ8+qDFLPBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mkI3/+3B1IQtNeXjFei8zH2E2Mca0Mi+zzcXdyi1Nj0b/vrY7aJLaJhrwQt1OjB+gKFZoarWntY5CzhxvuP8fIa/ISTMh0yfbGZhta0R3U6vdbpXv0DA0gZK6xcr8tR8FNVqurNU2S9hZWW6aN/IsI6AEwiTeyL/hhqb5z7axWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYBE8WCg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PK8IhrLU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYBE8WCg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PK8IhrLU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jERf3842265
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJFjE+3X6Q9vN3UmXLSv13IsPzIuqlyAFlOptZBHPaE=; b=mYBE8WCgc9lMuNFf
	xE8whSGS8UNjB64NOkMtwy8sj114x6Ni9I609rVDsDACyWbRB2Mw9aOtZcJGDIl/
	z537m9EWjkqAJWM6aSjhsovk4hkHkn5Jz1wd532+63VovBRtXzaTr4ThFD7/IoYI
	QHdOTJoJ/p2nwfVF4GC05FSJtDKE2dO8NnyxaSV7hfQwMLKepjiMS8JDUuyJwpes
	IIg46VKbSrYqYHV3HvOVbOP4muLm3U55qbPIUfcADi+pjbOBKXtLTbyL9K32gj/7
	rbkR8Rf2fTbaxwRLbmPd5wpROhfsHDiDWq3r83n1VhSfUO+SVob33msFISeshQy+
	Gfr/BA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5cyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:45:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db0a41434bso55625765ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789368349; x=1789973149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJFjE+3X6Q9vN3UmXLSv13IsPzIuqlyAFlOptZBHPaE=;
        b=PK8IhrLUpbKFLIvzdWpxEhIJZ9YkvRAXXPJEF7PQNLucLn1+O8Wk8M0ll6n3ycZ5fC
         uGGCUnFeKDsr8oHNL3TPIdui7pKL4F9hs3GD7jXaj7JGuOAk9qYytQlmhbneSYEuRU3i
         2k1xahTQKfAvUyYKCUCDiZn2l6fMHFy9UAamfgl+tAuMphUcpip9r09KAbfGrhmtN5X0
         xGCsflhRzP9VUBDCmhfl9aTnjSTX8uhaKSNxy9n1LNJljhn0MywmA1JtySqmXy42DrWQ
         q26ekCmWfbXCs+pqJ0am7SU+aBB27mu6z38H4FbyzyRiaVlS3JomEveR4TBJ/MXmmUV7
         4HMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368349; x=1789973149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJFjE+3X6Q9vN3UmXLSv13IsPzIuqlyAFlOptZBHPaE=;
        b=LIvCgiFp9BqSJ9zqvgyzIR6jMJEaocfJ7D1efna3hUHoqD6WR26+NjxVoq6Ys+df8a
         7sZNxOhisaYhNojtVRNyKgCSGVn9CBRxROu4tRLTB+SPFLO0ftT0ihfBoRm/UUzJ2To9
         27g2kaFjrARaASYd8BPcE0GiGgKChI9F9umdA2u7OTPCZIv+iJed/YVYnyGHy4VyPox7
         opwZjRou5vC527S7y0cnxP1QZIBzBkRrz5sU5TCTjItu7YZILnxMcS9PSVEFyY9Zv1Fe
         dNP3L/5DA49U8RE5vZo/C1oH8oUNMkqL6yA86CCQ4W2/HH7/DH4JvkcyH8IQsIIZUtIK
         bDxg==
X-Forwarded-Encrypted: i=1; AKwUvBy5E0s3iRW7nQIo4SUW9QorIvfRL4NH00x9qDgBQKF2KgWHXtufJRQQoFZbO3YCmXpL1lDMTYkRknWurrg=@vger.kernel.org
X-Gm-Message-State: AFuF++myRosb9KXwi/Uq6Kzea93270Lny1weoxZTkYuuG0GlkLNlsTdj
	vE87jMhyZXWv8q/PRHNRW8ITHalGPl08NOMaWy+BGrOEoXB/iS+o3170vngcNRI96Hh9oAXpwGt
	Q4DXH2PYcSjw7klMmb1LgcCWiAmMCuRiTX5v75PwYTn4a7WWEqi1sixtddENYXN373mSxdaRUVG
	Q=
X-Gm-Gg: AYBFou0LHnnEf1ffNEFBqxt7UviveqKgv7yoCyMT4b/WOOtbUaHGmn9er7WXuebHpJe
	gQ2JhdMXA+lvHzVCdbiqRZC9IgxFS4stLU1IVxsx1WhO0p7PRfmm8/nT29xjX3H7bZvG7xA/XnG
	cNKjIrarn5Bav6xO/KCFOu8XY7yDB3ZvhnFzY+S5D5w+Mgm6syDXdqInvG9D5qGyjapsxebVnPb
	R1gFhgybZboAEuJmIYqDIRgJd+Fjok+JH6kHipguT6q52z54nJKZobtRbJxroCbBGNDx9uXfc2V
	qknvkvUb4uvpbuMrB2MBzRuR8uFYXnEABXO+8qX8wQUCfkKT4FJDZmrMI7ONRxxAcUy6gjqRh1m
	PrFJ59yMxvoeGExJf8TrBgPZYTNEyPXSDp8XVFO4ABznufdx16pnB2Txh5kfJr6A=
X-Received: by 2002:a17:903:1b70:b0:2dd:4070:8eb with SMTP id d9443c01a7336-2dd6c741e30mr27982025ad.20.1789368348604;
        Sun, 13 Sep 2026 23:45:48 -0700 (PDT)
X-Received: by 2002:a17:903:1b70:b0:2dd:4070:8eb with SMTP id d9443c01a7336-2dd6c741e30mr27981525ad.20.1789368348124;
        Sun, 13 Sep 2026 23:45:48 -0700 (PDT)
Received: from [10.133.33.70] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb3f66sm42416135ad.35.2026.09.13.23.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:45:47 -0700 (PDT)
Message-ID: <bbfc7313-c4fa-4cd2-aa22-66e2cb0dfa20@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:45:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Gavin Shan <gshan@redhat.com>, Andre Przywara <andre.przywara@arm.com>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <095ebf41-e3c1-4e7e-b6f9-84b6f94da3ce@redhat.com>
 <7c6b728a-38e8-41d0-b99e-85a09a79a0b1@oss.qualcomm.com>
 <a347c9e4-cbaa-46ff-bb54-a634da32ef9e@redhat.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <a347c9e4-cbaa-46ff-bb54-a634da32ef9e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BHD1npPrSUarLTC0uQB0ZiNJ3gahaxee
X-Proofpoint-GUID: BHD1npPrSUarLTC0uQB0ZiNJ3gahaxee
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7981d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=JfrnYn6hAAAA:8 a=L7FipRsCem679_Rc0t8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX4zDf3oiUE3zK
 ql6FTymDdEDQc9RDUkvGsaJ3bOoJwO01ZCko2zSFQFfKb5ouFhjv3kCtOFmvN8HznPZHciQiwqT
 9xTaHykBHN4XjnUIh/OBVhv5A4JWI2VESH8RS021OL7gIz6NN9uew0F3jjKChFxJcJTLjxLYDeP
 xolN2btMnCTa/GN2P4eDy8b9OYH0wSTMrObs54lmzEeb65gRyri24oSDpYU5tPUJ92G+DQHFbKv
 2/+FVbKXaMqt4Illfl0MKqgJBKQ7TmwtlMb/wZnn0S8mgYf9cUO/VSQLflMBK7uUCRiaiJukSf0
 LjR4pjX+jnlkA704hcVxC4/WlyLkz+p63Xe+0rgYG4JiervXYBMzkMHtiU5anLd6B9r52rJQ2jc
 1f6HcRWG0sQI6WC7bI2BPO8FfA87xCokz26E2ug7qYLKEEHE5lLrX3RpVV+fq8tqVLbkSW+o44W
 f+Vo/1V8EHVb7natdIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5NCBTYWx0ZWRfX5T3xN1Bz3WeZ
 JA4g8gNeFvMfcmVAz77zk7UnTPK4Ln8nES+peTYOQZh+GXWYNqFKeQtZo2LDIIG/qJ63VLzDxOo
 I1aSSPqA0k91+UXGnE98JB3128Q1Vjg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140094



On 9/14/2026 2:35 PM, Gavin Shan wrote:
> Hi Yin,
> 
> On 9/14/26 4:25 PM, Yin Li wrote:
>> On 9/14/2026 2:14 PM, Gavin Shan wrote:
>>> On 9/3/26 12:37 AM, Andre Przywara wrote:
>>>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>>>> error value.
>>>>
>>>> Check the returned value for this error condition, before passing the
>>>> value on to other code, which would hide the negative number in some 
>>>> high
>>>> value in the unsigned type.
>>>>
>>>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' 
>>>> resource")
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>> ---
>>>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>
>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>>
>>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/ 
>>>> mpam_resctrl.c
>>>> index 9d223057953ab..a5e661eff86d7 100644
>>>> --- a/drivers/resctrl/mpam_resctrl.c
>>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>>>   /* Find the L3 cache that has affinity with this CPU */
>>>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t 
>>>> tmp_cpumask)
>>>>   {
>>>> -    u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>>> +    int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>>> +
>>>> +    if (cache_id < 0)
>>>> +        return -ENOENT;
>>>>       lockdep_assert_cpus_held();
>>>
>>> find_l3_equivalent_bitmask() passes @cache_id to 
>>> find_l3_equivalent_bitmask() as
>>> a 'unsigned long' argument. Actually, it can be 'u32'. It's not 
>>> directly related
>>> to this patch though.
>>>
>>> int mpam_get_cpumask_from_cache_id(unsigned long cache_id, ...);
>>>
>>> can be:
>>>
>>> int mpam_get_cpumask_from_cache_id(u32 cache_id, ...);
>>>
>>
>> Hi Gavin,
>>
>> Thanks for pointing this out. I've made exactly this change in my MPAM
>> DT series (v2, in preparation) — mpam_get_cpumask_from_cache_id() is
>> changed from unsigned long to u32 there, along with the related cache-id
>> variables.
>> https://lore.kernel.org/all/20260811-mpam-resctrl-dt-knp-support-v1-6- 
>> ea6397bead59@oss.qualcomm.com/
>>
>> I'm about to post v2 of that series and will make sure you're on Cc, in
>> case you'd like to take a look.
>>
> 
> Thanks for head-up, please keep me on the cc list. I would like to review
> if I get bandwidth, but no promise :)
> 

Hi Gavin,

Thanks, will keep you on Cc for v2.

> I noticed RFCv1 series of DT support for MPAM was posted to linux- 
> kernel@vger.kernel.org
> instead of linux-arm-kernel@lists.infradead.org. Since MPAM is a arm64 
> feature, it's
> reasonable to post the patches to linux-arm-kernel@lists.infradead.org 
> at the same time.
> 

Good point on linux-arm-kernel — I'll make sure v2 goes to
linux-arm-kernel@lists.infradead.org as well.

> MAINTAINERS doesn't indicates a maillist for MPAM patches in section 
> "MPAM DRIVER". I guess it
> would be something worthy to be added.
> 

And agreed that the MPAM DRIVER entry in MAINTAINERS is missing an "L:"
mailing list, which is likely why get_maintainer.pl didn't pick up
linux-arm-kernel. I'll note this in the v2 cover letter so the MPAM
maintainers can decide whether to add it.

Thx and BRs,
Yin

> Thanks,
> Gavin
> 
> 

-- 
Thx and BRs,
Yin

