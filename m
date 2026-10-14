Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4F34F4743
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975495; cv=none; b=d8h361oXSuQvUiaDpVqpAZnnc2rb1onFH3uwn8gZ9ZMbhhF2rAdQlV97AtPlMGOtlDalNgLTD6PRm9lqz6x2e0jrnaONDFke58zGXKNhLZcNu3R9nREf3m9b7uO4pgSaBIohBZwPOpbQBGs27x+5ERNiqPzR9xGl3k00F+XaIC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975495; c=relaxed/simple;
	bh=oMdJQ4OULZXyBz3Ko0nv7l3azl/UbkYzjQDSpcXpAiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obsfRGuS7V/mnOaaNC4io3gU/ftA3fi4v1TcdpK5TFtmjMibYeGvhiE/1IZJqu+or5aj11f3c8VvdLk+Jyx+yYAKNMSiOu67PjjNR4vyn+UP0bnDZw/w1xTlwL8Itx1ZTpy6pcZSVYuF+7Dq0NIYpvzqza4s7fGjJnuarvAL5d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ft5vQYAs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tsZFKvrD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ft5vQYAs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tsZFKvrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791975493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jH1ufsQ5g3r1H3aslg+X8qJ0wMgxmZRuam6ChKawEQw=;
	b=Ft5vQYAsmmGrRvVXqCt1HYeHZ/Ss5dxr+fW7NY2k/4aJRERtUVy/lcCqrKuHmbsHW1mIvF
	lwm0g58dzj8uO5BdKbbyl88Cy96OXK2D0xq5nPhbHx1TXTSahG42t6QArrLKLHX60mPBvZ
	NUjCa1cCI43Ezz/SggMR+G19hiElMBU=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-sTBVsbq0Nz-ypl-rAfFYhQ-1; Wed, 14 Oct 2026 10:58:11 +0000
X-MC-Unique: sTBVsbq0Nz-ypl-rAfFYhQ-1
X-Mimecast-MFC-AGG-ID: sTBVsbq0Nz-ypl-rAfFYhQ_1791975491
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a813204f87so257374a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791975491; x=1792580291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jH1ufsQ5g3r1H3aslg+X8qJ0wMgxmZRuam6ChKawEQw=;
        b=tsZFKvrDJdx0xmEGXFDrwEUj6NFztX1lFZcLELxDCe8JkICwkQrgex07wF5qaXKRtI
         nVcjGshA+pAgOfyOJAJBIHgXQ1qGPw4xPK+igxTmxRy6Wmp3BdbRpb+LlC14CggA3+QR
         gTEKWRerJgr32RdzSITDcUPayUqQJQyZ5fbMyoryb1IWY5K8HfOHeqxKJaT6P2P8ZI6F
         SzMHNXewgLJGLhusb88n1YmzU3bybx1t5XW3ZsXVDXoizidq54LN8JiRu9EkRSGm0/lr
         zu2MAhEMIPrjCRyuVYYRENudlCgmcmBTHcdaPNVup7TrUqKRG6sWnR6rpZoKveOR2SRg
         vzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975491; x=1792580291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jH1ufsQ5g3r1H3aslg+X8qJ0wMgxmZRuam6ChKawEQw=;
        b=DbWiry1ETA1ULWfmr7AGXUfAY3/X5i0eqw3URHuwCCoZqoHXolnWiaTz+edW2I2snW
         rum8n5wx5Vhv4IcsmCeEp+5Hx/6oKD73B2rjW1rCr1O5O/lMDaf3amCSJywsnRGLVmb0
         /hii4/+hjzN1+mkZs09Ql2d8sRQB91v7gYiSrSI4+7JUlaQB8TXo+gmEChaZt9NuEh6L
         Q2pP+4j8E1NQ3ucJcxDNNYedRYUE3kqNjHG2IUApns8muDQMU7uLtZbDzUCLpbtr7Udl
         +akyHiLhgUno1SLkeBl8o8c29YP2SM3gKUNiyjh3TXsJQYzxpUO1PgGr4jXOKwdxadvP
         pAcg==
X-Forwarded-Encrypted: i=1; AKwUvBxxRE9pRFqZnqgsgy1GYCUQwtnexU4ObXN3s7DZWctV9weG2QsA6jK1EnubdPUP6w3zrStwMpMURvZpMpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJor+ZZI9wBV5MTyTtaFHw8k1wZkE2MiMA1/QdQSltRKl17eZdT
	eqQYmE5Bpc4kaTJ3WmEEn0ALke6UaJLocjhRHZroHDrZYnqxK5JGhvdXnl5fEuAsJkXkExp+kDQ
	N8VGbvUrA7T1TY89HsbT/N6nA+Q4t1b1PebW8Phd31M1o/o/kHcdyESLfmy08PSUlVHiKjSjHUA
	==
X-Gm-Gg: AYBFou3ZrSY1JaM56o7vQDdTcvOTJ700jmsemGAYgpuPfN8jT6XWr5+ZckzdD3HyKOd
	7tC0aqeRSbucLNkdafm4W9Z3vLR9KMC8sLfHWZZhe/UUCYZKv6HyARjQTom+jvVU3YUfWFpNVct
	DmGDB/K8nGjvSGoSA/2UD6IdApSDF+AqxJzxxkoR92ip8NZHtQRTinET/xGS+cHLQDzqA2Ompyt
	DQsK6lJrx3QA78dXSq7EuewqoGpO17ZLTJ55oDXVKcYjr6+vaWCly9fLsAMQ14xqq1nhYrdfXgV
	8o+DScFbZigINV5XY2VkZ2mQ8P6TosIZtx+5/qwqNJyjuam57pvYoLXiY03RPpeHAa4J0HMsJAN
	LOCqnk4Yb2T2j6wBUFksjqjrmfemnMTmCXfX9EkXgKg==
X-Received: by 2002:a17:90a:51a7:b0:3ab:4262:1a3a with SMTP id 98e67ed59e1d1-3ab42621c33mr8647751a91.61.1791975490675;
        Wed, 14 Oct 2026 03:58:10 -0700 (PDT)
X-Received: by 2002:a17:90a:51a7:b0:3ab:4262:1a3a with SMTP id 98e67ed59e1d1-3ab42621c33mr8647724a91.61.1791975490063;
        Wed, 14 Oct 2026 03:58:10 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f05083fsm4391258a91.1.2026.10.14.03.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:58:09 -0700 (PDT)
Message-ID: <0ceda99f-0352-474b-a30a-c5e79b817c2d@redhat.com>
Date: Wed, 14 Oct 2026 20:58:00 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 02/10] firmware: arm_rmm: Check for RMI support at
 init
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-3-suzuki.poulose@arm.com>
 <2586e689-c27d-4e4c-8c69-03e24259cb96@redhat.com>
 <8be050e3-8af1-4f04-902f-9bc01b209dd0@arm.com>
 <3fbd4739-a4eb-4428-95ae-ead22e7cf9f2@redhat.com>
 <799fb810-c33e-4d0e-9a70-7092c0a681ff@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <799fb810-c33e-4d0e-9a70-7092c0a681ff@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 7:19 PM, Suzuki K Poulose wrote:
> On 14/10/2026 08:26, Gavin Shan wrote:
>> On 10/13/26 7:58 PM, Suzuki K Poulose wrote:
>>> On 13/10/2026 04:53, Gavin Shan wrote:
>>>> Hi Suzuki,
>>>>
>>>> On 10/2/26 4:14 PM, Suzuki K Poulose wrote:
>>>>> From: Steven Price <steven.price@arm.com>
>>>>>
>>>>> Query the RMI version number and check if it is a compatible version.
>>>>> All RMM feature registers are read and exposed for future code to
>>>>> use. Also restrict the support to SMC conduit.
>>>>>
>>>>> We only support this for Little Endian kernels, the Big Endian kernel
>>>>> support is anyway marked BROKEN and is being removed.
>>>>>
>>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>>> Cc: Oliver Upton <oupton@kernel.org>
>>>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>>>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>>>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>>>> Tested-by: Gavin Shan <gshan@redhat.com>
>>>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>>>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> ---
>>>>>   MAINTAINERS                       |   2 +
>>>>>   arch/arm64/Kconfig                |   1 +
>>>>>   arch/arm64/kernel/cpufeature.c    |   1 +
>>>>>   arch/arm64/kvm/sys_regs.c         |   2 +
>>>>>   drivers/firmware/Kconfig          |   1 +
>>>>>   drivers/firmware/Makefile         |   1 +
>>>>>   drivers/firmware/arm_rmm/Kconfig  |  25 +++++++
>>>>>   drivers/firmware/arm_rmm/Makefile |   1 +
>>>>>   drivers/firmware/arm_rmm/rmi.c    | 112 ++++++++++++++++++++++++++ ++++
>>>>>   include/linux/arm-rmi-cmds.h      |  48 +++++++++++++
>>>>>   10 files changed, 194 insertions(+)
>>>>>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>>>>>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>>>>>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>>>>>   create mode 100644 include/linux/arm-rmi-cmds.h
>>>>>
>>>>
>>>> [...]
>>>>
>>>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ arm_rmm/rmi.c
>>>>> new file mode 100644
>>>>> index 0000000000000..06f5392c982d2
>>>>> --- /dev/null
>>>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>>>> @@ -0,0 +1,112 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +/*
>>>>> + * Copyright (C) 2023-2026 ARM Ltd.
>>>>> + */
>>>>> +
>>>>> +#include <linux/arm-rmi-cmds.h>
>>>>> +#include <linux/cpufeature.h>
>>>>> +#include <linux/memblock.h>
>>>>> +#include <linux/slab.h>
>>>>> +
>>>>> +#include <asm/memory.h>
>>>>> +#include <asm/pgtable-hwdef.h>
>>>>> +
>>>>> +/* RMM v2.0 defines RmiFeatureRegister0 to RmiFeatureRegister4. */
>>>>> +static unsigned long rmi_feat_reg_cache[5] __ro_after_init;
>>>>> +
>>>>> +static int rmi_check_version(void)
>>>>> +{
>>>>> +    unsigned short version_major, version_minor;
>>>>> +    unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
>>>>> +                             RMI_ABI_MINOR_VERSION);
>>>>> +    unsigned long aa64pfr0 = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
>>>>> +    struct arm_smccc_1_2_regs res = {
>>>>> +        SMC_RMI_VERSION, host_version,
>>>>> +    };
>>>>> +
>>>>> +    /* If RME isn't supported, then RMI can't be */
>>>>> +    if (cpuid_feature_extract_unsigned_field(aa64pfr0, ID_AA64PFR0_EL1_RME_SHIFT) == 0)
>>>>> +        return -ENXIO;
>>>>> +
>>>>> +    if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
>>>>> +        return -ENXIO;
>>>>
>>>> I think we need to ensure SMCCC version is v1.2 or a newer one here? arm_smccc_1_2_smc()
>>>> is immediately called by rmi_smccc_invoke() after this check.
>>>>
>>>>      if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC ||
>>>>              arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
>>>
>>> We could. But I am wondering if that adds any value ? If the RMM
>>> exists and responds to the RMI_ABI_VERSION, it must be so on a
>>> platform with v1.2 or greater ? The extra check doesn't hurt.
>>>
>>
>> It's required as documented in section "B1.1 overview" of RMM-spec-v2.0- bet3.
>> In the same section, there are more requirements regarding the SMCCC version
>> when SVE/SME are supported. I don't see a practical problem if the check is
>> missed since the combination of TF-A and TF-RMM are the only RMM-spec- v2.0-bet3
>> implementation (as I knew) where the SMCCC version has been set to v1.5 in the
>> 'master' branch.
> 
> Reading the RMM spec again, DFNMZ lists how one can detect if the RMM
> ABI is present. That specifies that the user checks for SMCCC
> version >= 1.1, which we do by using arm_smccc_1_1_get_conduit().
> 
> Then checking the R{M,S}I_VERSION call is sufficient. So, I think
> we are good here. Do you agree ?
> 

arm_smccc_1_1_get_conduit() ensures SMCCC version >= v1.1, but we need
SMCCC version >= v1.2. We will have problem if the firmware only supports
SMCCC v1.1 and R{M,S}I_VERSION is coincidentally supported. In this
rare (even impossible) case, it's not sufficient to check R{M,S}I_VERSION
as I understand.

As far as TF-A+TF-RMM is concerned, I agree there is no issue. However,
the extra check doesn't hurt and make the code following the spec a bit
more strictly? :-)

Thanks,
Gavin

> Suzuki
> 
>>
>> Thanks,
>> Gavin
>>
>>> Suzuki
>>>
>>>>          return -ENXIO;
>>>>
>>>> Thanks,
>>>> Gavin
>>>>
>>>>> +
>>>>> +    rmi_smccc_invoke(&res);
>>>>> +    if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
>>>>> +        return -ENXIO;
>>>>> +
>>>>> +    version_major = RMI_ABI_VERSION_GET_MAJOR(res.a1);
>>>>> +    version_minor = RMI_ABI_VERSION_GET_MINOR(res.a1);
>>>>> +
>>>>> +    if (res.a0 != RMI_SUCCESS) {
>>>>> +        unsigned short high_version_major, high_version_minor;
>>>>> +
>>>>> +        high_version_major = RMI_ABI_VERSION_GET_MAJOR(res.a2);
>>>>> +        high_version_minor = RMI_ABI_VERSION_GET_MINOR(res.a2);
>>>>> +
>>>>> +        pr_err("Unsupported RMI ABI (v%d.%d - v%d.%d) we want v%d. %d\n",
>>>>> +               version_major, version_minor,
>>>>> +               high_version_major, high_version_minor,
>>>>> +               RMI_ABI_MAJOR_VERSION,
>>>>> +               RMI_ABI_MINOR_VERSION);
>>>>> +        return -ENXIO;
>>>>> +    }
>>>>> +
>>>>> +    pr_info("RMI ABI version %d.%d\n", version_major, version_minor);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>
>>>> [...]
>>>>
>>>>
>>>>
>>>
>>
> 

