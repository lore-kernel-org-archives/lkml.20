Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C652B47DF8C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962795; cv=none; b=Om+WC3i4T8+aWdc9PfJEAsPI+tWQ8gAMmk0UXuipfqWq6ExY8NrAtsszLK1x2/SIDvAmqXQbyNAk6xSh+o32Zf/CBjtYSctprBWCfILo6W3Zs0XxDidgeHiev6EM6UPbhRUMiFHq1LCNzxWLm0d+4U3mcbXSKBEFgVR8T0U3gWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962795; c=relaxed/simple;
	bh=jEDr7CZMnktmoXb4NjMcFjZ5CF1yuHZAy1IjGOmqKPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5/KAg2sQU+RSKxEB8ogjXTmFJYD92Ye8iM2/4AA+J7WHBi/OYnQ6tTfonM9Xe4X3I8QMASUuXXj5engVOUIDfOpHnKi10EtWT6IMQq4LU8iHv8ck4Xt/BxlN/M5N7FWS9WjhQFMOGOjwFre1aHOKEAXq/+TIcIl/P9W03lINNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fwSq6r9c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nMty9u8d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fwSq6r9c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nMty9u8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791962792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/27OLHjKCfoYXX3QS6shBfqd83AIp/PVTNTv8jw4t/c=;
	b=fwSq6r9cANIN3PFxR2uEJHauWpu6/J4tqlEyVybX8A3VJkCTBsi/EUEjau+yeXRZmSq8yd
	1fpijtnurapyhgKNEE5SfPmClsYgU+PjEI6zGOJSNo61D+t+gR/3KwJZd2XCL3rBY8KfJ3
	Lj7czB2412FfoITm/hq+Gg4oAWKEupk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-qvymdmDDOfKpbtw8UuBIFw-1; Wed, 14 Oct 2026 07:26:31 +0000
X-MC-Unique: qvymdmDDOfKpbtw8UuBIFw-1
X-Mimecast-MFC-AGG-ID: qvymdmDDOfKpbtw8UuBIFw_1791962790
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a470ead068so4100152a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791962790; x=1792567590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/27OLHjKCfoYXX3QS6shBfqd83AIp/PVTNTv8jw4t/c=;
        b=nMty9u8dUJBhkNNtnCDnq3lLBQmShQXJCW4X1Qxv1XSPLy1Kt/3Y7gAa7Q2Ec0vcQi
         0P5BmDBoZ141b9Hp9XRVnzL2Z6oEk1G21NiIjaiX3yZaKPqUV3jsQpCKTpNRy2EwtvPW
         kPtTcdf6fcV97Oh5snC4KoLfkeFVzE6gOr5aSUeeMR941ng3yhTticFfyMxPtKJPQVcP
         Y9VddIjqn+LFEGEVaIoW1rZEBGk7ZYHoyOLKkq9S8idqAx5cD/U1Z8QOzZB31lnq0Cem
         zjEH3Av/utSSOfYNqYXL9+1S27kJMl8Rz/CC5W4cuHXfeA7dwLAICfTNdasRZ5/IhRtu
         BfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962790; x=1792567590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/27OLHjKCfoYXX3QS6shBfqd83AIp/PVTNTv8jw4t/c=;
        b=TFDN5/9bh47U8DGC7/G7t0gHr/lhwWv7eoZrhiaqP+C2zYsPZ4D+4hG8q6t5k6Vn6K
         TD09Uc+ogzZ5pdv5Q6u8jPDYALq5uJgN9ClVw4UWHCIfve8MYsv48iGwtOzRcJ+P5jmc
         sIeEfHlBvt1MM4a+dd0DIYmxL1jUW5D5ICDCUxbeW1Twm9w0TsVWwGGdAFSuCfP02oj3
         +Kqzg5tcYJTylFfP15PQXL7i7ohtdI8TPhKxCZ4xy0AlRFMNqt9pNp9PRtuAnh34wLXT
         Hq17TtLQUb/ocKQGJ7qrZJNU7wSe5xUbFnBSFOd9SN4tfHSnxo+2MRFSWL3GbGIgSJZu
         YsiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsyJ16s9Lme8kZR11yv4jD44dztEvH7zuyc0sPlYb1MdWSCf5JidjRMoC2SxTgWqtkWM8Loz8tRjP8+14=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2JaEngkKpmVcJrwUSXGzX6IWdcMYhox8vOV6m7EWUWH+IUbOR
	vWyTDxdZoUg3bYfO2MovDHeu0ER1JxCJk8A35ddra3h0yB6FN/ynI7dYLRlWVnMRc9ty0ay6xQx
	m4t5yOannu1c4QvAuhVReBE+lZFtPC5HueVLVTW+pLgoNURmwxTc1mnZBYtb+QGt9Ew==
X-Gm-Gg: AYBFou3Fb8NAxXFaj9a6H77gV4QA5rlmdcEcxcV+A2t+IhYZtX+6SpIfuESG6UIKUHg
	4l7svHYTMdK1tiKM/skSvnQB+qkHz8sANAAMZlLPDYsEKVWJxN51E45epLzuuZFXshDcHWLqB89
	QQFj5cDb6DMXlEtBkXmt4GxLNfllKoLFDvjjgF83GRk/K+tE8x7uXM00YYVSvKAgAKsJ0L9MPs2
	Ufgas8iSVYPaFYQBeLLTqen9Uiq7y/8xArsiVbO9ii1bzSC+V1jYHXx/V7hMAnYr/BDAykmKFsu
	fu8iAepXXz23PtC5zhNO/SgN/Gyzzuy4W0hkC4ICcmsdH1ieWQsHCJT8xne7Wc8cHV4K0eG2zd8
	OEh4GJ4F12dlOoUJAtAdcn9JJIB5JaYLuTV8WM+MqRw==
X-Received: by 2002:a17:90b:224e:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3ab3a9f42aamr10847049a91.23.1791962784937;
        Wed, 14 Oct 2026 00:26:24 -0700 (PDT)
X-Received: by 2002:a17:90b:224e:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3ab3a9f42aamr10847017a91.23.1791962784459;
        Wed, 14 Oct 2026 00:26:24 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f280fecsm3307221a91.13.2026.10.14.00.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:26:23 -0700 (PDT)
Message-ID: <3fbd4739-a4eb-4428-95ae-ead22e7cf9f2@redhat.com>
Date: Wed, 14 Oct 2026 17:26:14 +1000
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
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <8be050e3-8af1-4f04-902f-9bc01b209dd0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/13/26 7:58 PM, Suzuki K Poulose wrote:
> On 13/10/2026 04:53, Gavin Shan wrote:
>> Hi Suzuki,
>>
>> On 10/2/26 4:14 PM, Suzuki K Poulose wrote:
>>> From: Steven Price <steven.price@arm.com>
>>>
>>> Query the RMI version number and check if it is a compatible version.
>>> All RMM feature registers are read and exposed for future code to
>>> use. Also restrict the support to SMC conduit.
>>>
>>> We only support this for Little Endian kernels, the Big Endian kernel
>>> support is anyway marked BROKEN and is being removed.
>>>
>>> Cc: Marc Zyngier <maz@kernel.org>
>>> Cc: Oliver Upton <oupton@kernel.org>
>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>>> Tested-by: Gavin Shan <gshan@redhat.com>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> ---
>>
>> [...]
>>
>>> ---
>>>   MAINTAINERS                       |   2 +
>>>   arch/arm64/Kconfig                |   1 +
>>>   arch/arm64/kernel/cpufeature.c    |   1 +
>>>   arch/arm64/kvm/sys_regs.c         |   2 +
>>>   drivers/firmware/Kconfig          |   1 +
>>>   drivers/firmware/Makefile         |   1 +
>>>   drivers/firmware/arm_rmm/Kconfig  |  25 +++++++
>>>   drivers/firmware/arm_rmm/Makefile |   1 +
>>>   drivers/firmware/arm_rmm/rmi.c    | 112 ++++++++++++++++++++++++++++++
>>>   include/linux/arm-rmi-cmds.h      |  48 +++++++++++++
>>>   10 files changed, 194 insertions(+)
>>>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>>>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>>>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>>>   create mode 100644 include/linux/arm-rmi-cmds.h
>>>
>>
>> [...]
>>
>>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/ arm_rmm/rmi.c
>>> new file mode 100644
>>> index 0000000000000..06f5392c982d2
>>> --- /dev/null
>>> +++ b/drivers/firmware/arm_rmm/rmi.c
>>> @@ -0,0 +1,112 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (C) 2023-2026 ARM Ltd.
>>> + */
>>> +
>>> +#include <linux/arm-rmi-cmds.h>
>>> +#include <linux/cpufeature.h>
>>> +#include <linux/memblock.h>
>>> +#include <linux/slab.h>
>>> +
>>> +#include <asm/memory.h>
>>> +#include <asm/pgtable-hwdef.h>
>>> +
>>> +/* RMM v2.0 defines RmiFeatureRegister0 to RmiFeatureRegister4. */
>>> +static unsigned long rmi_feat_reg_cache[5] __ro_after_init;
>>> +
>>> +static int rmi_check_version(void)
>>> +{
>>> +    unsigned short version_major, version_minor;
>>> +    unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
>>> +                             RMI_ABI_MINOR_VERSION);
>>> +    unsigned long aa64pfr0 = read_sanitised_ftr_reg(SYS_ID_AA64PFR0_EL1);
>>> +    struct arm_smccc_1_2_regs res = {
>>> +        SMC_RMI_VERSION, host_version,
>>> +    };
>>> +
>>> +    /* If RME isn't supported, then RMI can't be */
>>> +    if (cpuid_feature_extract_unsigned_field(aa64pfr0, ID_AA64PFR0_EL1_RME_SHIFT) == 0)
>>> +        return -ENXIO;
>>> +
>>> +    if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
>>> +        return -ENXIO;
>>
>> I think we need to ensure SMCCC version is v1.2 or a newer one here? arm_smccc_1_2_smc()
>> is immediately called by rmi_smccc_invoke() after this check.
>>
>>      if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC ||
>>              arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
> 
> We could. But I am wondering if that adds any value ? If the RMM
> exists and responds to the RMI_ABI_VERSION, it must be so on a
> platform with v1.2 or greater ? The extra check doesn't hurt.
> 

It's required as documented in section "B1.1 overview" of RMM-spec-v2.0-bet3.
In the same section, there are more requirements regarding the SMCCC version
when SVE/SME are supported. I don't see a practical problem if the check is
missed since the combination of TF-A and TF-RMM are the only RMM-spec-v2.0-bet3
implementation (as I knew) where the SMCCC version has been set to v1.5 in the
'master' branch.

Thanks,
Gavin

> Suzuki
> 
>>          return -ENXIO;
>>
>> Thanks,
>> Gavin
>>
>>> +
>>> +    rmi_smccc_invoke(&res);
>>> +    if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
>>> +        return -ENXIO;
>>> +
>>> +    version_major = RMI_ABI_VERSION_GET_MAJOR(res.a1);
>>> +    version_minor = RMI_ABI_VERSION_GET_MINOR(res.a1);
>>> +
>>> +    if (res.a0 != RMI_SUCCESS) {
>>> +        unsigned short high_version_major, high_version_minor;
>>> +
>>> +        high_version_major = RMI_ABI_VERSION_GET_MAJOR(res.a2);
>>> +        high_version_minor = RMI_ABI_VERSION_GET_MINOR(res.a2);
>>> +
>>> +        pr_err("Unsupported RMI ABI (v%d.%d - v%d.%d) we want v%d.%d\n",
>>> +               version_major, version_minor,
>>> +               high_version_major, high_version_minor,
>>> +               RMI_ABI_MAJOR_VERSION,
>>> +               RMI_ABI_MINOR_VERSION);
>>> +        return -ENXIO;
>>> +    }
>>> +
>>> +    pr_info("RMI ABI version %d.%d\n", version_major, version_minor);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>
>> [...]
>>
>>
>>
> 

