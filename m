Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCF44C0433
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057784; cv=none; b=daxTQnHqAGJqaIaZyGTXIRtFmAvU+YD7tyyaos3US/fPS8adY+jsyoOJnw560kJ6rVo9T2VNW1NbYSri+3irVHhDW/WqDRZs1R7du0UFsB/LDUVGJ2EBoBPVmh4UEB5aum+0yXQ5kWE1xLmteni6o9416mbDQ+0dADphQMcGQqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057784; c=relaxed/simple;
	bh=VdPxTIAUduSzQVNP2I+/XmwpniL0HU0csb6yPjvTEsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kk+oPg44JiqFs6Vqg6jK7MtHgDgiWd0a3VUwY+/Zn+syL/BuSzhaT5+67LSLCI6aNDUgEgQrSlcgg8soJS6PY0UTJweKcLhkr79O+HvhkKkc6gWSrcmeWxi1lsJpE42nRzjEyIwvoooSc9sRcnLhWhQYT/HQ/fP+Hm9WxtYHCF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZvaOANK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJoiJ32z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZvaOANK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJoiJ32z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2sKPw3675270
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QD9OZSWXaBeCFdJ9EgRL8gkX0kzU54vcy6sjbTcxjoU=; b=dZvaOANKg7xSKbC2
	PX67kSgnG/vtuLNG2USNJZeySJvNZ+N6cOsNjrwaAVkBgW9UVQQdUw3z7vGkfExj
	ignsZN+DAJ1kRZ74S5T9PhukCX5COsS68aHTD6liJaily47UPJ6Z7DwJrauCG2TW
	Ekc8xs3Cmgu6Vk/d2tktWEL0tv5Ss7E9E4IWI2Y/kmagezaAAn5bbjvra1hYZV1T
	QDcpuOx3Aub3wqGgQpblcyjme49pfpQFKwu6ppdW6By1y5YMfxb0LbWDHNllyXS2
	V9GkFBeFtlEqeDzoMJYaaajKdB0fMz6RzgBLRPF8rCdlbr+NMZcygiYH3rhKZ+gO
	dB3rBg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5rnd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:16:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-868f443cbd0so3473711b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790057780; x=1790662580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QD9OZSWXaBeCFdJ9EgRL8gkX0kzU54vcy6sjbTcxjoU=;
        b=DJoiJ32z7pQ7JqfsUrmSHhnmC3O+UE6nBVxc8LFDlbQI6A2tyui7XuOZcbXZE1rkx4
         tdvf7Uaeb8PsRcz4n5wvk2jhrhAjK/nil/ERtqDN6ESYy7h4LK9ACNepm4xIbk1GJAmI
         CLsM5q/VGuUA8cToAcVUNYu1sVFGZxE0dxQlQ3/xjcWV/7+y1JWPp0UPho1zE/msFgwN
         JfpOX8WqNz4DnJCg/Kb61GemuTQ1GKP4p3yEonbhUi+3hF7ffLj75BYn9BS9zRR2dcjo
         gaCQT6sGIbv/jOTY4zRnJiPzzB2HLKiwmd24lwPvMDqK9TWDGLBzeaswrRYq1ZyMg9m8
         A3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057780; x=1790662580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QD9OZSWXaBeCFdJ9EgRL8gkX0kzU54vcy6sjbTcxjoU=;
        b=UNni2oTYfp+Dr6CAsChLtKcJ7rCuAz3PRT+tePJu+5zlcI4w7EsNtSFM2CXzvq99aJ
         gX+idlD7hbu6jnt4KveSgVoWeFbHqX5JJ5pQOmhP/wmWcCHBSNLQZ4fPiwLH7PuemO5d
         U6Eu1RCH4a0cJbWrzZWWIM5wgcdxxA7nlttnlK17YeLIDkCRFUR2BrD3n0+t3A5wCQlU
         hOeAqQKaFxvwszN9qWbZ3JBN3O3rbN2rUQ7cZnU6DVngoUSQh9othF+wOh4iKfFa4V+F
         RDZtetM+VBn42JsbgauElWN3HL/rxnTN12BV40WMQ5X57v/lspAvhqFubVQ/UAfnaWxG
         tkhA==
X-Gm-Message-State: AFuF++ndHVjSKuBk5C4LTclXip0OEBDAusNLOxuoc+HM38Na70+ot2sk
	0n3nicur0yjF4TtpHS5Z/jAm+BGEKMTOAqVYtoq4xJ/HvEmvhN7gLGx2Wczls3ejjHtEd/xRl9H
	RxyGn+zRWTnDTP6Wcq5KWpzWBr3iVrAdbJcM4B+jFJc2aKnZ6hKxNwRCZnX58Ip6x9zI=
X-Gm-Gg: AYBFou2eeGGA8V7vB7wADjXUmAYPlXkheGOGCFnROErCx1yCGMBPmiqzUU12Ul4wO/T
	Bysq+TLhXHY/UZCwxD8+V/GLn8tkA1+DJtc7DxtUsVqzvyXoWBPJSmA8+uYx9G0r/e/C2nI9905
	mWMyG6CMyUEBfyfQXDZzPfIf7ewj2lFV6UU6ta9E6Z9MiV6/gwI75TXCQoBftqk/Rtfvcldbrnp
	7hQzbBYomhF53TofymNm3Jfydujz6c1PjOSgmKtCCNtE9wWCrE8Mlb9yaftipTT356mAC33UG4u
	7joFYfZOEFB710ze/xwJNNt7GuaggFP6x0l1ialWMv/VrLj/uPSWistkUL4LAHlSWfTYz/E0xoD
	FCRDYoAlg9oKWcjivNK2czxbPHvSySJQLvBpXT3k+rF1hG1Gc2BE3DK3tw/Ltr94=
X-Received: by 2002:a05:6a00:9513:b0:845:c694:5c3d with SMTP id d2e1a72fcca58-87c81bb9c72mr178375b3a.1.1790057780378;
        Mon, 21 Sep 2026 23:16:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:9513:b0:845:c694:5c3d with SMTP id d2e1a72fcca58-87c81bb9c72mr178322b3a.1.1790057779882;
        Mon, 21 Sep 2026 23:16:19 -0700 (PDT)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c336aba96sm320004b3a.61.2026.09.21.23.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 23:16:19 -0700 (PDT)
Message-ID: <d410b2d1-499b-4abf-94d0-b7c5183fc5de@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:16:15 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm_mpam: Only schedule mpam_enable work after first
 successful MSC probe
To: Ben Horgan <ben.horgan@arm.com>, "ping.li" <leeonion.muyu@gmail.com>,
        james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, reinette.chatre@intel.com,
        fenghuay@nvidia.com, Andre Przywara <andre.przywara@arm.com>
References: <20260818130646.663778-1-ping.li@horizon.auto>
 <20260908024846.2063161-1-ping.li@horizon.auto>
 <558c0816-604a-49b6-8843-66ea5df28d3e@arm.com>
 <5f3f2dba-17c0-49e6-a0cc-df92436d26e7@oss.qualcomm.com>
 <b85e2d57-13f2-4c24-b880-e6dde5a69a29@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <b85e2d57-13f2-4c24-b880-e6dde5a69a29@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KTBO0RJwjPrmSOIOQ7KUUJBr-8yXR_z3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfX+1gt0zXxLSIJ
 0dPTe0/fO2XpLpZWiiV0GRs5SYdtVqK242iKDvayTuGWowwqZisvJy66vXEnU+DvHXMlXar5+eu
 eBSn2FdVE8eXLwA3D1A+vF88vHlrVbQ=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab21d35 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=e53MFRgxDW3MDr-_ceoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: KTBO0RJwjPrmSOIOQ7KUUJBr-8yXR_z3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfXyJUI8b8F80ry
 9Rj6MoDJ+8qchs26g2AQCqyZ5iVtJaKsnIehFDOuSdOd+6zynVh78t42cbY7i2NmVu39YUQcqEl
 M/puDWSlmJR+17fMVBsVGJYQBAB30tpMzwmj/sUeX3VOuHyqXgNxKLVEsBHvAr1fk7YwxdJ3g6p
 7MqGRbpCuVG9+Xsq+4O+wmMIVYPSo3l9c9sujAOLIdRSDQp6Yw0RMtyZWauCHxUyC7XiZgEYDtF
 p7tAXlw8s/vfWudoDs9FI+BLkJHvjBqFxq9U2VKXtXZfHxaeAkSG3jzG1Pt+7wVcfSgkZffLb0k
 sad0rxofu9GzJDWzLJoKoVlWNcPF/vtYRF4IIKWfF3z2EZwqIngV1ePlEzy68GWjJZnijVmXf0B
 fuJ2BejKz05CtuVgZy7BQhyIFN5zw3qidrIE8waIqktNJpCJab6claGK60eq0P429r0X7R23zJw
 OaWKEE3v7vIQNNp2l4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220088



On 9/21/2026 8:39 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 17/09/2026 10:19, Yin Li wrote:
>>
>>
>> On 9/10/2026 5:25 PM, Ben Horgan wrote:
>>> Hi Ping,
>>>
>>> On 08/09/2026 03:48, ping.li wrote:
>>>> From: Ping Li <leeonion.muyu@gmail.com>
>>>>
>>>> mpam_discovery_cpu_online() sets new_device_probed unconditionally after
>>>> processing each reachable MSC. Once an MSC has already been probed
>>>> (msc->probed is true), later CPUs sharing it skip
>>>> mpam_msc_hw_probe() but still leave err at its default value of 0.
>>>> As a result, new_device_probed is still set to true, causing
>>>> mpam_enable_work to be scheduled again even though no new hardware was
>>>> probed.
>>>
>>> This patch is an improvement but, thinking again, it looks there is scope getting rid of
>>> mpam_enable() altogether. Rather than walking the list after each hw probe we could increment an
>>> atomic variable, similar to what is done in mpam_msc_drv_probe(), and then just schedule
>>> mpam_enable_once(). What do you think?
>>>
>>
>> Hi Ben,
>>
>> Seeing another atomic-counter based sequencing mechanism in this patch reminded me of a similar
>> issue I explored while working on MPAM DT support.
>>
>> At the time, I experimented with removing the fw_num_msc pre-counting logic and moving the discovery
>> callback registration to a late_initcall() stage. The motivation was to avoid separate DT/ACPI
>> counting paths and allow discovery to proceed based on successfully probed MSCs.
>>
>> However, I eventually dropped that approach because it relied on synchronous probing and would not
>> behave correctly in deferred-probe or future asynchronous-probe scenarios.
>>
>> That made me curious about the motivation behind this change:
>>    - Is MPAM intentionally designed around the assumption that all firmware-described MSCs must probe
>> successfully before discovery can proceed?
> 
> James wrote the code but here's how I see it. The important point of synchronization is for MPAM
> enabling after the h/w probe rather than before discovery. This allows the number of usable PARTID
> and PMG to be calculated and allows the ris/comp/class lists to be considered read only after this
> point (except if MPAM is being disabled). For discovery I expect the MSC still be considered
> independently. However, the synchronization is convenient at discovery as it allows for cpu hotplug
> callbacks to do the initialisation, first for all MSC that have online affine CPUs and then as those
> CPUs come online.
> 

Hi Ben,

Thanks for the explanation.

Agreed that MSC enabling is handled independently.I understand that the 
"(atomic_add_return(1, &mpam_num_msc) == fw_num_msc)" condition as an 
ordering guarantee: it ensures mpam_all_msc is complete before the
cpuhp callback is registered, so no MSC is missed when the callback
walks the MSC list.

CPU onlining and MSC probing are two independent sequences. The cpuhp
mechanism handles the case where a CPU comes online after an MSC is
probed. But it cannot handle the reverse: an MSC that completes probing
after cpuhp has already executed will be missed.


>>    - Is the count-and-compare model primarily retained to guarantee correct ordering under deferred/
>> asynchronous probing?
> 
> Deferred probing for the discovery will possibly be required for enabling interrupts with GICv5.
> 

Deferred probing for GICv5 would indeed require the count-and-compare
model to ensure all MSCs have probed before the cpuhp callback is
registered. Thanks for the clarification.

Thanks,
Yin

> Thanks,
> 
> Ben
> 
>>
>> I'm not suggesting changing the implementation, just interested in understanding the design rationale.
>>
>> Thanks,
>> Yin
>>
>>
>>> Thanks,
>>>
>>> Ben
>>>
>>>>
>>>> Set new_device_probed only when mpam_msc_hw_probe() is called and
>>>> succeeds.
>>>>
>>>> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
>>>> ---
>>>> Changes in v2:
>>>> - Drop the Fixes: tag, as the extra mpam_enable() calls cause no real
>>>>     harm: schedule_work() merges the duplicate work, and mpam_enable()
>>>>     is a no-op until all MSCs have been probed. This is a cleanup, not a
>>>>     bug fix.
>>>>
>>>>    drivers/resctrl/mpam_devices.c | 6 ++++--
>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>>> index 2f09f4b78bd3..fefdcf588932 100644
>>>> --- a/drivers/resctrl/mpam_devices.c
>>>> +++ b/drivers/resctrl/mpam_devices.c
>>>> @@ -1866,13 +1866,15 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
>>>>                continue;
>>>>              mutex_lock(&msc->probe_lock);
>>>> -        if (!msc->probed)
>>>> +        if (!msc->probed) {
>>>>                err = mpam_msc_hw_probe(msc);
>>>> +            if (!err)
>>>> +                new_device_probed = true;
>>>> +        }
>>>>            mutex_unlock(&msc->probe_lock);
>>>>              if (err)
>>>>                break;
>>>> -        new_device_probed = true;
>>>>        }
>>>>          if (new_device_probed && !err)
>>>
>>
> 

-- 
Thx and BRs,
Yin

