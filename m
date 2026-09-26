Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECFD439328
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790429951; cv=none; b=pWTzelhVmyyZ75k+uZapkvxR3dkfvF8L6D8dLcCJL76evbpgtbcekYwiZLLZuf4RlHlm/8ziJUVna+5VZs2kR22iezMxmI6LvYXWODE29ioLXH7fXpXsx4VqkB7mt0ztwbeIsiNP7yENm4GIWgKTyAnRMaHXEU/h/BQtLMViZd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790429951; c=relaxed/simple;
	bh=kxpM4woXbVN3C61iCkKOMRV76lDdpJXI6TiGREDFTAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwbyYCO7AiEQjBAEAxH3fEFGMrVRQKzSSSK5puNk2vDS7GoeCJoirZ0j5PLoMyL6nTWWGHsG+hIOnpA1egpzRMEj8v14fxCNojTo+EWVePQC+zd+PMZiNoGgnxqKfwFn4iAVp2KeArhaJaFq2dp9UidV8wz37uTqwbtxHM26Y5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3LxcIkF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHALdjNZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3LxcIkF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHALdjNZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QAoURe3611059
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ryy0TaceLombIiL4TAr0+o046iePkO13SoMlmGHBezM=; b=U3LxcIkFYFlytTfx
	jKLMqAGBDdHcRGSfy0eyL488h3TuiAXRHbKaj7yFfM6RsQi2DGKYQR1l4GU8vTBH
	FVsE9fjpyCIH3hhsfyWB+2RtyVBl3cHaimRcA5bJUME2qFn3NxV9PW6qvlRrnXje
	EZ3Yoxe81pVs0c+0h7OdHZyjv/eXPVRL+0tpz+AtiYFTdUjz3FwVVLMvt6p9J4aG
	+9uAgrGKAbdbrQLIfqt+o6hQvMaF5Wm0jGf6WunNnLuB4j6x6IDi9/4r5dyzDMjm
	HMl/oSGx736WTdqJY+JoJM8PGofxMkuJj6k/k/fcnWf+rYABFktjTvUsdb3aTKio
	ojh1iw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5cgh2af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:39:09 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3437d0cc8c7so1166409eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790429948; x=1791034748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryy0TaceLombIiL4TAr0+o046iePkO13SoMlmGHBezM=;
        b=OHALdjNZAreqsa2gR96K64a2KYzgljqBMJoxk/DLCb7ekLb4owsEw3DN+UUlBkQmp2
         xT0BJP567ca/jgSsJcZm7t/smI893TmUg+lEV3kDudFo8yGcrQ8YBmd20VXNcVoeYFqj
         OCifEM7vBvuomJ07X2SIWD0o8YHbhtUm3qoXxOyb5NrtU5feiNLSEAXPPCeV4Jb5vN1Y
         rlt39i+zMFU4039YEigxFG5CyvHSDpockhg0LkyULSz23E03SK/29c4G1Mq4MKniFCCX
         COFmQ4uRmoPTXRV+eiJPrdllNF1sD79bc3eCfNgGPozQb9nkxILs9WJc+ixb0usAQAnL
         hlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790429948; x=1791034748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ryy0TaceLombIiL4TAr0+o046iePkO13SoMlmGHBezM=;
        b=KgVp+7oyY522Wac0/IZf3nh8aEHpq8TZZYgHlllmbVjPf/QjfhfxYCbZzTEVOAvND2
         QY+/2tXdG/vLA8dccFM/krY0e25yngfNlMY44xw5D2ryfKl5OLqPr3v6XGmnrQxfSa+H
         nsaU0uXWnWQTurxzh8AyIE5+uLNS3Sw9TRpmz9QMdKBtf8BSQZPEXhtdlNrnlFE4/EFX
         Ydks7z3kkOqKTuIPV9uC3erYqUCr6cqHmHOQEF/tHGl7jAjISsrINNBRGHeG+nvNbr16
         M/TJ84LRRMp5ZFiHDWLDaqlxvj4TAhpUa9GsuLGvDSiu1bh15gAJLy68fUxRZa/hgDiu
         m0XA==
X-Forwarded-Encrypted: i=1; AKwUvBxnD2omTUdG5MQyNlVhtS2x/qR0fXxqCI0R8ssQly+tioNxtNP7giGtusaKbZxCx6mcyDjCiwzYiegDpkg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZiOoEX4oEZg/a3DURnF8lKXydQn975hnoEU4Xve5bmlQjflg8
	tN/55pwb/v+0TBGbM8nwxCCDkNHDuNtwND94CrHJXufhpJclt7lnGvCHsfrOzYA2nfJVG+p1iWg
	pGIuVUMKvnA0mAbMWtDDq2CkBmH/rBNmRHP0JJhDG3n1knJVxdiHUhfrvL+pfYPMWoqQ=
X-Gm-Gg: AYBFou2EyR6F8vTeQQVkEn+JSR+Z/IkFnOkB6QmkGGzOfuu9LKRUYCGFQv+kmV1Us1S
	FjbcdpjlJnNzmpFU/lbCCTtlERTLe1/74K7HljC1vkbKm6Rk3WG9AbDWCUO/LsAs8Mn8oUha7oC
	DzMaEN9F/xnAtJGlO5kwyRH5FWFwC5RvY3DnHehqccw3rXZYGONdo849CT2O0xvzIifIvLRxwHP
	rRimQdvG/1trlTMTIssBx8Y7SINk5f8VSM/mm0UgcQQVv7zASYIzzKLxcIb31ED8PLEcqbL2YBr
	5U22OQvdw66cqdQjZiZrIvh7AiaA1TIF/C0GTnJSRNtvM3Rvh3tqn20Ta+IuKFChHZ8FPXttd1K
	Fz1WT/Wi43zptuCDAIyZFDqcbKD0soV4Exlw=
X-Received: by 2002:a05:7300:3b28:b0:328:2ea5:bd39 with SMTP id 5a478bee46e88-342705b94bcmr4840024eec.4.1790429947107;
        Sat, 26 Sep 2026 06:39:07 -0700 (PDT)
X-Received: by 2002:a05:7300:3b28:b0:328:2ea5:bd39 with SMTP id 5a478bee46e88-342705b94bcmr4839926eec.4.1790429945792;
        Sat, 26 Sep 2026 06:39:05 -0700 (PDT)
Received: from [192.168.68.104] ([49.207.195.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a00dsm15522844eec.1.2026.09.26.06.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:39:05 -0700 (PDT)
Message-ID: <23f281ef-d724-4fdb-aa1d-408c368d941c@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 19:08:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        sudeep.holla@arm.com, trilok.soni@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-4-suzuki.poulose@arm.com>
 <20260924100313.00003be7@oss.qualcomm.com>
 <d4b768e5-c942-43cf-aea2-c266a8bab353@oss.qualcomm.com>
 <bb4a6fa1-721c-44f8-a8d2-54e80b5449c6@arm.com>
Content-Language: en-US
From: Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>
In-Reply-To: <bb4a6fa1-721c-44f8-a8d2-54e80b5449c6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1NCBTYWx0ZWRfXy6ESppMDTLrN
 4fm32WSNtqv3GDizhuVrnqyOZVQI1ANmCPns0UnoXn15+AsVY2Q5++Qo9djRhUKYMwU2UEM+gM9
 8vJwXL/ZqPE+uMWtSP4I96VkrMe0K6gCtnOhCjWqx2j8xjscGCeaqLEh5ktPJ3EY5dTQ4GXcasW
 Lys+iIKmmXSrS4T9jx0USHRMaFokGYkcPSsJAYedwwwiCoroh7Ll0GSa7LBPSQFJmISsgDkAgTf
 mbZuMdDvfHPSxnCq317VMLZPvP+j3Pk9UyNYxksg9PAga1JQxdYYmAB3PukHmIH9P6SZ/9qoAU2
 +sAUCsTSatm7XmgBizwc7x0ltifCEBIIvlD6z97UCyttOd7bCbHHrLflrhyUOIEpb9X0ZcS9Wzy
 Y42ZZX5S5N6y8HDJZ5bZxGzWIrVZhEgp3pmvcPXRjx074vT1n+l+Jhtu6G/GvzqrJL73sUNvZ2g
 JYwRlaO7Be+Y8CoexYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA1NCBTYWx0ZWRfXzL20MPpcBtUi
 HDCeNUfi5oai1lf8Xe2uyHDB1Sg+V8Qsi3m2WhVDe1bu2poxWHwZvrFtQhmhgfIclqeFiDVFiPT
 Pq9oOOmXFAsg82c/w16Tj14rnrOv5r4=
X-Proofpoint-GUID: uyxjrcks0PlV-xhrLJc4R4y2aNCWBasj
X-Authority-Analysis: v=2.4 cv=QvLLTlyd c=1 sm=1 tr=0 ts=6ab7cafd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=lfboiZ0IWGQn+/ls2+s3/g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=VEZfdOmQvSGR4K_WtDcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: uyxjrcks0PlV-xhrLJc4R4y2aNCWBasj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260054


On 25-09-2026 08:26 pm, Suzuki K Poulose wrote:
> On 25/09/2026 14:23, Venkata Rao Kakani wrote:
>> Hi Suzuki,
>>
>
> Hi Venkat,
>
>> Now, with this patch Host can set RMM Granule size equal to 
>> PAGE_SIZE. Does RMM send the request to root to set GPT physical 
>> granule size = PAGE_SIZE?
>
> I don't think FIRME lets you do that and it would be too complex. Please
> remember that the GPT is not just for the Non-secure/Realm world, but
> also for the Secure world.
> So, the Physical Granule size would be statically configured to 4KB on a
> platform unless it supports the 4KB granule size, to support all
> possible Sofware components.
>
>
>>
>> In a scenario where, GPT granule size (|GPCCR_EL3|) set to 64K and 
>> Host PAGE_SIZE set to 4K, how does root handle GPT granule mappings, 
>> when Host send RMI_GRANULE_DELEGATE(PAGE_SIZE)?
>
> If GPCCR_EL3 is set to 64K, RMM must not report it supports 4K GRANULE
> size.
>
> nit: Please avoid top posting your comments and use plain text for
> discussions on the list.
>
> Suzuki
>
>
>
>
>>
>>
>> -- Venkat
>>
>> On 24-09-2026 10:33 pm, Jonathan Cameron wrote:
>>> On Thu, 24 Sep 2026 14:51:57 +0100
>>> Suzuki K Poulose<suzuki.poulose@arm.com> wrote:
>>>
>>>> RMM v2.0 brings the ability to set the RMM's granule size. Check the
>>>> feature registers and configure the RMM so that it matches the host's
>>>> page size. This means that operations can be done with a granularity
>>>> equal to PAGE_SIZE.
>>>>
>>>> Signed-off-by: Steven Price<steven.price@arm.com>
>>>> Signed-off-by: Suzuki K Poulose<suzuki.poulose@arm.com>
>>> Hi Suzuki,
>>>
>>> Some trivial stuff inline.  Assuming that is addressed.
>>>
>>> Reviewed-by: Jonathan Cameron<jonathan.cameron@oss.qualcomm.com>
>>>
>>>> ---
>>>>   drivers/firmware/arm_rmm/rmi.c | 70 
>>>> ++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 70 insertions(+)
>>>>
>>>> diff --git a/drivers/firmware/arm_rmm/rmi.c 
>>>> b/drivers/firmware/arm_rmm/rmi.c
>>>> index 3baba931f92e4..c9ea964fd9081 100644
>>>> --- a/drivers/firmware/arm_rmm/rmi.c
>>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>>> +
>>>> +static int rmi_configure(void)
>>>> +{
>>>> +    unsigned long granule_feature;
>>>> +    unsigned long granule_size;
>>>> +    int ret = 0;
>>> Value not used.  Fine if it is future churn reduction, but I didn't 
>>> spot
>>> where if so. I'm guessing left over from refactoring
>>>
>>>> +
>>>> +    switch (PAGE_SIZE) {
>>>> +    case SZ_4K:
>>>> +        granule_size = RMI_GRANULE_SIZE_4KB;
>>>> +        granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
>>>> +        break;
>>>> +    case SZ_16K:
>>>> +        granule_size = RMI_GRANULE_SIZE_16KB;
>>>> +        granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
>>>> +        break;
>>>> +    case SZ_64K:
>>>> +        granule_size = RMI_GRANULE_SIZE_64KB;
>>>> +        granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
>>>> +        break;
>>>> +    default:
>>>> +        BUILD_BUG();
>>>> +    }
>>>> +
>>>> +    if (!(rmi_feat_reg(1) & granule_feature)) {
>>>> +        pr_err("RMM does not support %luKB granules\n",
>>>> +               PAGE_SIZE >> 10);
>>>> +        return -ENXIO;
>>>> +    }
>>>> +
>>>> +    struct rmm_config *config __free(free_page) =
>>>> +        (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
>>>> +
>>>> +    if (!config) {
>>>> +        pr_err("Unable to allocate memory for RMM config\n");
>>>> +        return -ENOMEM;
>>>> +    }
>>>> +
>>>> +    config->rmi_granule_size = granule_size;
>>>> +
>>>> +    /*
>>>> +     * For now we set the tracking_region_size to 0 which is the 
>>>> only option
>>>> +     * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 
>>>> 16KB/64KB).
>>>> +     * TODO: Support other tracking sizes via Kconfig option for 
>>>> other
>>>> +     * PAGE_SIZES
>>>> +     */
>>>> +    config->tracking_region_size = 0;
>>>> +
>>>> +    ret = rmi_rmm_config_set(virt_to_phys(config));
>>>> +    if (ret) {
>>>> +        pr_err("RMM config set failed (%d)\n", ret);
>>>> +        ret = -EINVAL;
>>>         return -EINVAL;
>>>
>>>> +    }
>>>> +
>>>> +    return ret;
>>>     return 0;
>>>
>>> So obvious this is the good path without anyone having to think 
>>> about it!
>>>
>>> I did quick check on whether this was to reduce churn due to later 
>>> changes
>>> but couldn't immediately spot anything
>>>
>>>
>>>> +}
>
Understood. Thanks Suzuki.
