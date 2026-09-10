Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449943E8C70
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033641; cv=none; b=bNYW/RvnxEb1DNFWnl9hABxEanBxKgIZ90ZTgqIwPQacSOAgomvb7v6wNXId1gVBDdyINKjmYRahMe7dPWbC+5RnB4bJRGRebqhZ15Q5MHBX2gDHt5J03MrOzxHHzfVtr4Gc6otl3Nt6f50TAC8vOzOeawVr6WX9EDVeDxDA1pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033641; c=relaxed/simple;
	bh=nx37oD+VATwTuapBTy48FxaEmdAgPeVuza1ezw/8JFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/3/A+OZZXzvIUZ/T5kOH44l3bUkZvQWEzlgMZDfrAtv/w4oFjudP9csrzLHwXbu4Ho0bz1PTq1gfiKQRmOpzqDXg/N03VtO2BuWxofWGFyUpO0LS2UnGa7uqWpk3iWdpHv0TJCb8/VsQ3IUs0wrjl91rO7aIGN9pnaxXQii8Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a75py5Pv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AfGlChtJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a75py5Pv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AfGlChtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789033636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2yXvhB+OP5CUFg1TBMcZH6iusQjFBNo5HCOtIhY7hZE=;
	b=a75py5PvGOgEDM3Na0n9HWs1C91WwUMBEPsBEi94oydAILLOaCJY0/edvQ2OCh5EOdFEUm
	1k0IB9Uc+Y12Q4zow8LesFCS+7eWnXA3b6Y6120bsO4no1Uf01h+BT0AJ0xBXCYJj/p6ub
	al+F8eT+HsUnzf9ngA+0GO6h2sm0zPY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-3wsHe94KOSSG0RjlR3IllA-1; Thu, 10 Sep 2026 05:47:15 -0400
X-MC-Unique: 3wsHe94KOSSG0RjlR3IllA-1
X-Mimecast-MFC-AGG-ID: 3wsHe94KOSSG0RjlR3IllA_1789033634
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d02df2bf09so62047485ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789033634; x=1789638434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2yXvhB+OP5CUFg1TBMcZH6iusQjFBNo5HCOtIhY7hZE=;
        b=AfGlChtJCCaDq/8NIVa8cS01QvaQgLyW0KEyc+oWRoe/CD6+22QXelYAnBrWfQ+jOD
         5IUdMaXh42zz0iF9QjuF/4ZBlfQSGB7zidIp+0dsrUFiAonp1qsRSg1Bq41VFeHZsk8/
         6ZMSBkFmO3p8iiN6CWaIB/hwFrUbzsb8oGUKj1HYS/GGZIHOCuttYT0dvRVKc4ncYY6j
         NKmG5a3eCuVeHFCy3mc2Otb6ndfSY+SC5Wb9MPIt5WjDVWAJzzn4rCuaGFucO+f9Mee0
         LIk1LBAVKeM2f5cngxjPVMIYSC6Jppxz3onInGweYGV+Vxi9l4W9qmWxnIFUEY1lV2al
         ZWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033634; x=1789638434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2yXvhB+OP5CUFg1TBMcZH6iusQjFBNo5HCOtIhY7hZE=;
        b=SvThDhJ6HZQXVerX1+2ER78ntPp3u9zwxAlu58jjF1qNd9KS1IpY7ITvdp5q9EcpWL
         0DJ8yVGFQ17tyZiZhYEPfBYkDU8vIAmR/30kXeEABzXwqBlzB5tIfDOd6jk9zCZAC5+y
         UsJ0Hbp7kRBz4t3pLeKuufLJ3z6bLFFEK3XJ/ttYUzSso1lWf6k5khzDtJBU2Znt2S26
         dh/KE/mDCgjgKWSkok5bymP6Fzce6vHg74cTMsMqDav8aoE/VMMnmw7HmEtS2rG7QMod
         RF9k8mlrqWgVCberDOSnfAMJ0zuXCbJnYUaXMi6u32XYXJWdtKUmVWBPTbvKFz7ER9bb
         ycug==
X-Forwarded-Encrypted: i=1; AKwUvByPJY4Dq/pHmmEfsXt/EUs4Ifd7D6n5SdWQ3XOpo3bo1N9c51buhcbu4TLf+TPZup24bVZqxNifG2Tl4uw=@vger.kernel.org
X-Gm-Message-State: AFuF++mFEc+f+8vq2oLk+rwrfjruIvD08fIjJ2jro8xeAQEwUmdiKKtv
	wvDft+jfp3UB4um6JyEnVZj+JZ7aMuSVmk+h0Avml/VvqWc3wezw38R4eP4TtFF/72yjW/C6UFO
	/mtFml1YtrLbRShdvu8edGEM2YAQImWvGLwTjpbq+MrisdEuR40sMXwcrXTW/E3fzRA==
X-Gm-Gg: AYBFou1PSphjWpLCGRjNXw31oVXGZjkvuwRse2Ih4WMDohEN1DO9EhtspUNcSyy1Dg1
	PJTLKHfOKmf53CNT6f7EfMHPjRHW6Dgha9OnEXpC5IeWL0beOUTcUDBMmfZ77n9IvvFhJXhI36z
	3K7Mk5FRJxvxwX11izrojXANzS4/G35XAUp53GxrrOqbi5WV4PwVOobHW5yXrk8VL/un114P3ho
	1cVFUzzFwdZypTFLTuY98nWQyI1sAuOWagogkY8FNLIQHu1AeDa3ey+vRsNaLXSvMn7F/HtwXai
	Vf0dXp2QV354Ds4sCdSr6wiYbkavtc3BQAxEczvuE8FKoUlxudHvmoheiiNe2p/QehgutqC5JnM
	XXmLkJkfupjBktpKxreq3rr+T9S9ZNLVsQqlgqt4mcA==
X-Received: by 2002:a17:903:1a26:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2dd0780d5cdmr98391565ad.5.1789033633859;
        Thu, 10 Sep 2026 02:47:13 -0700 (PDT)
X-Received: by 2002:a17:903:1a26:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2dd0780d5cdmr98390555ad.5.1789033633331;
        Thu, 10 Sep 2026 02:47:13 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495acf7sm86197935ad.25.2026.09.10.02.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:47:11 -0700 (PDT)
Message-ID: <7223aeec-b269-4ef5-b5b9-693d4d12afd1@redhat.com>
Date: Thu, 10 Sep 2026 19:47:00 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-2-suzuki.poulose@arm.com>
 <c9990440-acab-4c6c-b67f-8bde17feddce@redhat.com>
 <aca629b2-27a0-4c47-acac-87edb3b0d3d9@arm.com>
 <52e58930-8fa4-4c75-981c-25be42d83f2d@redhat.com>
 <44f02c8c-db52-4f3e-b5d9-f25c1c8c5f0b@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <44f02c8c-db52-4f3e-b5d9-f25c1c8c5f0b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/9/26 6:39 PM, Suzuki K Poulose wrote:
> On 08/09/2026 23:41, Gavin Shan wrote:
>> On 9/8/26 8:37 PM, Suzuki K Poulose wrote:
>>> On 08/09/2026 07:19, Gavin Shan wrote:
>>>> On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
>>>>> From: Steven Price <steven.price@arm.com>
>>>>>
>>>>> The RMM (Realm Management Monitor) provides functionality that can be
>>>>> accessed by SMC calls from the host.
>>>>>
>>>>> The SMC definitions are based on DEN0137[1] version 2.0-bet3
>>>>>
>>>>> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
>>>>>
>>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>
>>> ...
>>>
>>>>> ---
>>>>>   include/linux/arm-smccc-rmi.h | 494 ++++++++++++++++++++++++++++++ ++++
>>>>>   1 file changed, 494 insertions(+)
>>>>>   create mode 100644 include/linux/arm-smccc-rmi.h
>>>>>
>>>>
>>>> Some nitpicks below, please pick up the commits that look reasonable :)
>>>>
>>>
>>>
>>>>> +
>>>>> +#define RMI_RETURN_STATUS_MASK        (0xFFUL)
>>>>> +#define RMI_RETURN_INDEX_MASK        (0xFFUL << 8)
>>>>> +#define RMI_RETURN_MEMREQ_MASK        (0x3UL << 8)
>>>>> +#define RMI_RETURN_CAN_CANCEL_MASK    (0x1UL << 10)
>>>>> +
>>>>> +#define RMI_RETURN_STATUS(ret) FIELD_GET(RMI_RETURN_STATUS_MASK, ret)
>>>>> +#define RMI_RETURN_INDEX(ret) FIELD_GET(RMI_RETURN_INDEX_MASK, ret)
>>>>> +#define RMI_RETURN_MEMREQ(ret) FIELD_GET(RMI_RETURN_MEMREQ_MASK, ret)
>>>>> +#define RMI_RETURN_CAN_CANCEL(ret) FIELD_GET(RMI_RETURN_CAN_CANCEL_MASK, ret)
>>>>> +
>>>>
>>>> If I'm correct enough, RMI_RETURN_{STATUS, INDEX, MEMREQ, CAN_CANEL} _MASK are used
>>>> for once in this header file. So we needn't explicitly expose them and combine their
>>>> definitions with users to fetch the corresponding fields, as below.
>>>>
>>>> #define RMI_RETURN_STATUS(ret)        FIELD_GET(GENMASK(7, 0), ret)
>>>> #define RMI_RETURN_INDEX(ret)        FIELD_GET(GENMASK(15, 8), ret)
>>>> #define RMI_RETURN_MEMREQ(ret)        FIELD_GET(GENMASK(10, 8), ret)
>>>> #define RMI_RETURN_CAN_CANCEL(ret)    FIELD_GEt(GENMASK(10, 10), ret)
>>>
>>> I belive the header files were generated from a tool (by Steven) and
>>> these would make it easier to compare with the generated header file for
>>> any deviation from the spec. So, I am a bit reluctant make these
>>> changes.
>>>
>>> That said, I am happy to convert the mask definitions to GENMASK() for
>>> consistency and readability. i.e., something like:
>>>
>>> diff --git a/include/linux/arm-smccc-rmi.h b/include/linux/arm-smccc- rmi.h
>>> index 3eb88caf40964..078197284415e 100644
>>> --- a/include/linux/arm-smccc-rmi.h
>>> +++ b/include/linux/arm-smccc-rmi.h
>>> @@ -139,10 +139,10 @@
>>>   #define RMI_ABI_VERSION_GET_MINOR(version) ((version) & 0xFFFF)
>>>   #define RMI_ABI_VERSION(major, minor)      (((major) << 16) | (minor))
>>>
>>> -#define RMI_RETURN_STATUS_MASK         (0xFFUL)
>>> -#define RMI_RETURN_INDEX_MASK          (0xFFUL << 8)
>>> -#define RMI_RETURN_MEMREQ_MASK         (0x3UL << 8)
>>> -#define RMI_RETURN_CAN_CANCEL_MASK     (0x1UL << 10)
>>> +#define RMI_RETURN_STATUS_MASK         GENMASK(7, 0)
>>> +#define RMI_RETURN_INDEX_MASK          GENMASK(15, 8)
>>> +#define RMI_RETURN_MEMREQ_MASK         GENMASK(10, 8)
>>> +#define RMI_RETURN_CAN_CANCEL_MASK     BIT(10)
>>>
>>
>> Ok.
>>
>>>>
>>>>> +#define RMI_SUCCESS            0
>>>>> +#define RMI_ERROR_INPUT            1
>>>>> +#define RMI_ERROR_REALM            2
>>>>> +#define RMI_ERROR_REC            3
>>>>> +#define RMI_ERROR_RTT            4
>>>>> +#define RMI_ERROR_NOT_SUPPORTED        5
>>>>> +#define RMI_ERROR_DEVICE        6
>>>>> +#define RMI_ERROR_RTT_AUX        7
>>>>> +#define RMI_ERROR_PSMMU_ST        8
>>>>> +#define RMI_ERROR_DPT            9
>>>>> +#define RMI_BUSY            10
>>>>> +#define RMI_ERROR_GLOBAL        11
>>>>> +#define RMI_ERROR_TRACKING        12
>>>>> +#define RMI_INCOMPLETE            13
>>>>> +#define RMI_BLOCKED            14
>>>>> +#define RMI_ERROR_GPT            15
>>>>> +#define RMI_ERROR_GRANULE        16
>>>>> +
>>>>> +#define RMI_CONTINUE_KEEP_GOING        0
>>>>> +#define RMI_CONTINUE_STOP        1
>>>>> +
>>>>> +#define RMI_OP_MEM_REQ_NONE        0
>>>>> +#define RMI_OP_MEM_REQ_DONATE        1
>>>>> +#define RMI_OP_MEM_REQ_RECLAIM        2
>>>>> +
>>>>> +#define RMI_DONATE_SIZE_MASK        3UL
>>>>> +#define RMI_DONATE_COUNT_MASK        GENMASK(15, 2)
>>>>> +#define RMI_DONATE_CONTIG_MASK        BIT(16)
>>>>> +#define RMI_DONATE_STATE_MASK        GENMASK(18, 17)
>>>>> +
>>>>> +#define RMI_DONATE_SIZE(req)        FIELD_GET(RMI_DONATE_SIZE_MASK, req)
>>>>> +#define RMI_DONATE_COUNT(req) FIELD_GET(RMI_DONATE_COUNT_MASK, req)
>>>>> +#define RMI_DONATE_CONTIG(req) FIELD_GET(RMI_DONATE_CONTIG_MASK, req)
>>>>> +#define RMI_DONATE_STATE(req) FIELD_GET(RMI_DONATE_STATE_MASK, req)
>>>>> +
>>>>
>>>> As above, RMI_DONATE_{SIZE, COUNT, CONTIG, STATE}_MASK are used for once in this
>>>> header file. So their definitions can be dropped by modifying the followup macros,
>>>> as below. Some enhancements are also applicable: (a) Use 'BLOCK' to indicate the
>>>> unit encoded in the request. (b) The macros are put into order from MSB to LSB.
>>>>
>>>> #define RMI_DONATE_STATE(req)        FIELD_GET(GENMASK(18, 17), req)
>>>> #define RMI_DONATE_CONTIG(req)        FIELD_GET(GENMASK(16, 16), req)
>>>> #define RMI_DONATE_BLOCK_COUNT(req)    FIELD_GET(GENMASK(15, 2), req)
>>>> #define RMI_DONATE_BLOCK_SIZE(req)    FIELD_GET(GENMASK(1, 0), req)
>>>
>>> Same as above.
>>>
>>
>> Please rename RMI_DONATE_{SIZE, COUNT} to RMI_DONATE_BLOCK_{SIZE, COUNT} if possible.
> 
> Sorry, forgot to add that, I have renamed RMI_{DONATE,ADDR_RANGE}_SIZE
> => RMI_{*}_BLOCK_SIZE, left  the _COUNT as it is.
> 

It's ok to me. The point is to have "BLOCK", indicating it's related to
a block. In rmi.c, 'unit' is also used and needs to be replaced with 'block',
consistent with the spec.

>>
>>>>
>>>>> +#define RMI_OP_MEM_DELEGATED        0
>>>>> +#define RMI_OP_MEM_UNDELEGATED        1
>>>>> +#define RMI_OP_MEM_CONDITIONAL        2
>>>>> +
>>>>
>>>> B4.6.40 RmiOpMemContig type is missed here and they should be used in the c code.
>>>>
>>>> #define RMI_OP_MEM_NON_CONTIG    0
>>>> #define RMI_OP_MEM_CONTIG    1
>>>>
>>>> In the c code, we shall have:
>>>>
>>>> if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)) {
>>>>     ...
>>>> } else {
>>>>     ...
>>>> }
>>>>
>>>
>>> Does it make much sense though ? I prefer
>>>
>>> if (RMI_DONATE_CONTIG(req))
>>>
>>> to
>>>
>>>
>>> if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)) {
>>>
>>>
>>> than having a field for a single bit values. I am happy to change
>>> this if there is strong preference to the other.
>>>
>>
>> The point is RMM-v2.0-bet3 expose RMI_OP_{MEM, MEM_NON}_CONTIG instead of true/false
>> to indicate if the requested memory blocks are physically contiguous or not. So the
>> expression 'if (RMI_DONATE_CONTIG(req) == RMI_OP_MEM_CONTIG)' is consistent to the
>> RMM-v2.0-bet3 spec.
> 
> Agree, but the values are intuitively assigned to indicate whether it is
> 1/0. I personally think if (RMI_DONATE_CONTIG(req)) is good enough. But
> to be consistent with the spec, I will change them.
> 

Ok.

Thanks,
Gavin

> 
> Cheers
> Suzuki
> 

