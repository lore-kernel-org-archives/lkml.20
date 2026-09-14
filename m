Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7233A3BA239
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367142; cv=none; b=Af+nQWG++QHP4AQ4t5PkGAPL9+aEdaJ/SW1N8hKAD3pomDZgKviI3Rs0Tcu3xfOPzLJuNu912d5jdqa14mybNLx2ZDlGDWZomSJeEq2+U9X7LgaiJ19qBE6zN6XBMLVmvf6z9QJDP5E3IJlQVxmGFCVoZdxStXj6xrYLh/Rr0lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367142; c=relaxed/simple;
	bh=V86rTByWW1Z+VCDQS52S4sKYQLsMr1/KnwPYo2/YAFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWuLI3YRySfkSG/V78ryNFdynMkkL++SKBUC5xQqkEA5wRoBnCUJZ7D7djZieP3S/uXi2e4zZ6UUFHGigBnxQWzfUK/WFALZ8s1LeHbH3aC3RPS67zhnikvEWJyZTE7ePBvKTRBIhJDlQBvWlZNOZIJAKHtGBNWiwaVPaBWU7m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xh8DVKFu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffcduAmF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xh8DVKFu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffcduAmF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j6r03369976
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ly/6Y5AJLozMR3X+z5mhaBeapEGwdSQcWIykg0k0VfQ=; b=Xh8DVKFuRsXOa/pP
	AWFK4LToMlM3fufR1w8G9l7jOTJMNsrWnVgzuuiRBudQLX9oRaOYqj9IsV51owh4
	wjDPTnUfoO6w3b3xYRd+9vpE3V8lCLHK/RYFaTowsTOhCc5fUtyh4CWzgdmUhm0v
	iOn2xn58ssb2xCt2zRhZCVoLZW1S+RJ+WGNlLRJFuiD5f4h4WibRa5d0cDC/NNFN
	rs/DX1qeryI3BOmJbRBjWq1zsk5HT7Wgg2YHSQG9mEgIq6LBvVCVIIL4rUA45ABR
	veqY1L9KEZNik2CrYdTUIiMaK48w/5FkjStezws5aCCmig2LL/heNuheRkoTunWS
	aONRRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5ayd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:25:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso5374473a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789367140; x=1789971940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ly/6Y5AJLozMR3X+z5mhaBeapEGwdSQcWIykg0k0VfQ=;
        b=ffcduAmFKfocYVxG9T8KZRts/HoGfcEaFhKgIcErY1vQ93RqsGBLCXu/WuMQkenzko
         XegJ14fh7BSwWfaYX06Sz5WSUQSOVKYlTu3bsyXy37Uj1I7tOn17iWMuRnALjZooAixb
         bgiRVbMdekJ9eHbKYZEdrP4dkzuyYUFpB2NF7+OQN3bbBbRoYw3pnPH3pD85mwoTnWcB
         7V0cpEJHuyLHAQJMc0iclZHD+yknI7U/Ljmx4YHbZ86u/dv3JYuhp2MAkY1YRgICrQi3
         ha3aqZw6Kj9GG2dDEkLZFXQDXfslI88RdjKFwTZ+HR8tN6c4iqE7ktBv5IAsQU7WYLG4
         Wt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367140; x=1789971940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ly/6Y5AJLozMR3X+z5mhaBeapEGwdSQcWIykg0k0VfQ=;
        b=j71IZDzXJJibzWBc7K+ciwpQIAeuM1zDW+wVzEZq3I6bDT+vbPrVwRWH8pDD5iIdZF
         sh331OyNmbAjndKgYUb9/Pg5AoTK3kYoCxG8jEl9v8dhI+u+7YK/3nH8KBT63ycjSu70
         LuqDQcMglKzn+Q3dOof7W5gmBOzXmVgWwgkRaEXm2RtqcYnTH1bdPP9sS9EvWMXRF4rx
         q0/o0eRG9LxRf+PakbTB/usnsyEaGEMrTxL3OZ2crN9xUkZoTgv/+VdJSVh2Wn9jO7nJ
         xEWQ2mSWerQlvoawxW1hK0xX4EhoO/tCK03UwTpLTIoQ7vZFEEt8BFb2C1EuBPAns5xV
         7ZsQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0hDV7Vj6Z1xC8FoX1V3q8fIfN9S1n2XzEZ0mXOe5Rl9Z4YSzaEo/sLsvjUv3AbMd2UjcTq+aAAF+M1+A=@vger.kernel.org
X-Gm-Message-State: AFuF++mYLGTqD/CBBhaautucrjZChYMdQa6+B95cpehYsuGDAR/DKLBG
	MqjGuvLhWhxt8mfBceG2OB+ItBRtzDHDH4xygcWRa07m3Acu1p+EKDyXaaF2nZyLKfMVtjzPeES
	EDIQNTN4cc0i+Xsa06z3UdQHzlC40pF7N3HwlWlGxFPIAsJTIpl7pCJ8EZekM40eoM6xd0OI2Ib
	M=
X-Gm-Gg: AYBFou0zXmaU6XI3B4PsOmga6rn+93pAxg/Qdirrq9gqxwEuFjiimErpNLl7iXZJRsA
	0PuhURxPCsloYK3+9p0/jeQ0+l0N8hm8IUe6GsD2JKO98hNff5ZfBM6+rvDQRj/rfwFD45pk3F8
	+cajJxqxo0nxIZmMzJI9++NC3966WpH77PIi2JB67Hh9iyFKhSU5PNZz4YJJo4im4wpCXWTTLw8
	/u5hNn6AuKF1t8gVeAhUhWtkOlyTPKV2AxwyalKuHAxCAvN3epalR+VOXXOg6difX9DnljqU/t9
	O3RD26ah6u6ilgMtS29YMpgn6ka9l2AYq0FZrKufoSa0sK2KWA6p/5toLNij2Nu6uzmpOCkh5I7
	lKy31fdSzv2IJm/KgCw03zi+rp8DszqFxQiRyFZE7f4Ap1cIFN+tYC/jeTN+nKWs=
X-Received: by 2002:a17:90b:39cc:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-39debf5f2a2mr2755642a91.4.1789367139852;
        Sun, 13 Sep 2026 23:25:39 -0700 (PDT)
X-Received: by 2002:a17:90b:39cc:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-39debf5f2a2mr2755588a91.4.1789367139389;
        Sun, 13 Sep 2026 23:25:39 -0700 (PDT)
Received: from [10.133.33.70] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d995a42a5sm18760134a91.17.2026.09.13.23.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:25:38 -0700 (PDT)
Message-ID: <7c6b728a-38e8-41d0-b99e-85a09a79a0b1@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:25:34 +0800
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
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <095ebf41-e3c1-4e7e-b6f9-84b6f94da3ce@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa79364 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8
 a=TdcjmqNvtQ7Mihavh1wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA4OSBTYWx0ZWRfX2quRbLdvhjcJ
 D/agZFMakDm/XCaNJx5qVUIz1q1L+3sK0QX4GmTu+l+uI8gJdk0Hroi8jJ2GY6vFIusht0O0B59
 GYhnZmVvvoHNwEJAQnHSV017imatb64EuHL6cz1gULt74ntA/awIRr8DyGzUo+cdkcKf+8cAPKq
 yuJ/PvNpRJiRYRSM+PLuH36cTQimNS/azzzl/u2NWHvDW45R7ANTAdU/zaM1vd2kVe/FXdk/aG0
 Zu1pd0bhp650zCmZO4Rrv0muId1S5lk2qrSsyviPh7gk/bOPOZ10dmsfmi+D46e0G8TsRVMekiw
 U58gcAMsaAOUrYN7QBU1oPY4a9aRMlelZ3fYaNIcay7R4A+OdQvncSDM7vcnd3P2itwtYpd3srQ
 S7zvzaUuhf7c0w89qpEYXztBFzi9X3FdQpTGN/6n0fHBX3W26EvbxDJr/YwGVHdBSrBtfMBKCy4
 DmN2NPnjQJhl8kpp4dQ==
X-Proofpoint-ORIG-GUID: 0_7wFVx7SYIz6e91vwDm2-MBxgcxJ0Ib
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA4OSBTYWx0ZWRfX4ld6XvLlPhhS
 Rd4cAMseEcRxr7MM4byXyqiKJKNiUGbZlaIi3LWJVYSwijro28mMkBn5hX0/XbIkxEwJQyT7kdO
 6NlynWK8YhDqz41VeWbP2t2lzE3K9bU=
X-Proofpoint-GUID: 0_7wFVx7SYIz6e91vwDm2-MBxgcxJ0Ib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140089



On 9/14/2026 2:14 PM, Gavin Shan wrote:
> On 9/3/26 12:37 AM, Andre Przywara wrote:
>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>> error value.
>>
>> Check the returned value for this error condition, before passing the
>> value on to other code, which would hide the negative number in some high
>> value in the unsigned type.
>>
>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/ 
>> mpam_resctrl.c
>> index 9d223057953ab..a5e661eff86d7 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>   /* Find the L3 cache that has affinity with this CPU */
>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t 
>> tmp_cpumask)
>>   {
>> -    u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +    int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +
>> +    if (cache_id < 0)
>> +        return -ENOENT;
>>       lockdep_assert_cpus_held();
> 
> find_l3_equivalent_bitmask() passes @cache_id to 
> find_l3_equivalent_bitmask() as
> a 'unsigned long' argument. Actually, it can be 'u32'. It's not directly 
> related
> to this patch though.
> 
> int mpam_get_cpumask_from_cache_id(unsigned long cache_id, ...);
> 
> can be:
> 
> int mpam_get_cpumask_from_cache_id(u32 cache_id, ...);
> 

Hi Gavin,

Thanks for pointing this out. I've made exactly this change in my MPAM
DT series (v2, in preparation) — mpam_get_cpumask_from_cache_id() is
changed from unsigned long to u32 there, along with the related cache-id
variables.
https://lore.kernel.org/all/20260811-mpam-resctrl-dt-knp-support-v1-6-ea6397bead59@oss.qualcomm.com/

I'm about to post v2 of that series and will make sure you're on Cc, in
case you'd like to take a look.

Thanks,
Yin



> Thanks,
> Gavin
> 

-- 
Thx and BRs,
Yin

