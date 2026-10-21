Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576138;
	b=1Ox+lFJTPpHGG6atGdIuXZJAUOVZrM1NB8R3EJ7GpbpUtZY6zfFIy1OCQykwCKRRxXAo
	 i6u8IJ2XIkIJS2k/KPLbk8dws1+VED9VCnjkA72fNVw0PGSp5EvaGjVHXCpS/YVbubOGy
	 itC7JarVjqsxDcyLiExYU7eD+JbJC8ULUohVO2ng8dGoHHv8L1OrU+HYSdMiqkQSd+V0n
	 6XmrbZmTjtBo2TH2EVgcAqIooC3s1VUOItpY/daDFuyg62TvzrFs331P5SKIlbQsJhR1v
	 tPvw1XQdISPdpGmfPG0R4Slfp6kueCr14sRt/SOR5iVcvQgwKbCsM6qZnEiAn67LvsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qb8CCyZKDo3DU8wu9akhVT7quX2USeXAOK8NbuiE3KM=;
	b=lt2/mjDXGJFjZtj9ZMLJOvyiOLQh3CivkiGWEAxUcPUWTe8UYwNlAYihFc4Vm9H390M7
	 s9OBN/i9H+WKD+L5gGkwrcq72KvkjaKrZQIjH2QsuwOI8q1ByS/dbs3boWm/tf/IQJsAF
	 tmsVOYgRqiYCeKsf4jamiXJittypaJhQAZnOHFJYW8pkvckzDboVBZyCJ90Du4BxaEhsy
	 T6dUWcO+x9wIEwfyY8Cfz/5gX3o+jtQKfEW0pSEzN1xkou1z4dDPxHtrhpDNp2wGPvGeW
	 NsosTmKEhy4f5Nsbvo5jGYYOFx1b4sApj0teQ2KOzuxPAeRwoXDig8lubLt3/FWFK1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZcF1QtXg;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC42606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECC42606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZcF1QtXg
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2e831901331so3017235ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792576137; x=1793180937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb8CCyZKDo3DU8wu9akhVT7quX2USeXAOK8NbuiE3KM=;
        b=ZcF1QtXgC1nrEzptZ5YfjL+EQbnJYpMyYo6GC2NF0ORQaIAHwW7I8Mu39Cxroz90hB
         OxNLBauiLEH750+f3WjFLxNE1lSoMmFv4l1tHOJ6wjEdnVZN330MzloAbV45RqJiowFz
         kcbgHdmQhUdT5s39OJmDXeSlAGTByWYs9lLwZW3swgWhn2/aNWpdhgsg2Al1MDKtM0YF
         hD6jYUXvaFA5RhRpdp04ASgWu6z9fqgA0Tno0C98Dwa81nyUw+vrpFWUnArpPsrETq4/
         99AhjLQKs0Kcjd5rW80B8ZwIyuaIDvKGLoPtV7E29ldKXJPVBTo7SQ406Szv6iU2Qf4f
         JFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576137; x=1793180937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qb8CCyZKDo3DU8wu9akhVT7quX2USeXAOK8NbuiE3KM=;
        b=EgXI8NxnwQDTLtLd8RYBCDhT5zTrnoDVk0ySo3Wkfi0qTOqzBUEgzHeuojZ1TKfjf2
         jRiFJuzk//Yjt3sl0H9u/+n7qTzzo9iHk5jjtRnmnBLWXgL2A5TUHS89YEG33tRy8/39
         GHmHmyAf/JpTrkgcu9Gdqg9IED6CGCW4rtvq9tJRGfCC6oes6I4YqnpTQLFunCHMPbre
         Yevv2L8WjiObHypVTQ11WtO1Ez2bwcTHFk4KkbFfUvipTVZYBjMEY1UZLb7gnVMXGOjO
         6xod93UqmKTqLR69wJBD7BzIBmIVez1YZV+P9ZBJqY+lkeGJH9wKluhXA2Nzhj1akx0P
         JuVA==
X-Forwarded-Encrypted: i=1; AKwUvBz+cHB+alh3YPhx+OZyzpx95mCrSt1HmjtHpEcLR15nkqjIuI59NaAt+nmlkUGAebtAA8kFZGHrrYE3ddk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKd2My6caWbvDYlD8VHXLdMIc30O212LlFUZlHJzRkwd+2L0YvH
	h6O5fp4nha7o/QtTlfUGPVD02jWt5XYt0+CDGg66Tw0FazPBhnZPUQ18
X-Gm-Gg: AYBFou0pH1XaKPuIyrpF2KSc0jrqimT92wvZ8up7h7oitv8SGCMMbplQLrzd8KeMz5u
	CuJjmw6XF4as9d39UpRIcvNzkwjGbSFr9FQGcRhUtrJiUgVWuUFbQovp0XSLxEWP6G1M5rBEaTt
	oIXJVjBUhaSqQxU+DEIvGc2anqzI22JKzUnHYF3Wr+zOJxg8b1ee9R4XwlLoc1vZCOrCbR2TvXp
	0+2JljX+Ur+mgj7OhQJGSOUsODXK5f2aDnsNjX/p0svD15hdvTh27UPMGeLEaDQwyi5U0dIgqkg
	LbOHIH2to0EsEtHOsVH3DUdnr/ITqvHVaNkJcWVgsxZQs2QJZk38BBC2ICBA9Wmp+41PbZ5P0Gu
	a3P3HLx+pD+ZJ0sOEIvufMGw3ruz6lZMzHgFjEf/LhpFrK76Tv1aIPqbhONDbIrq+v5ExWDwdKq
	qoU84ey2tXTAlRrjWUjjgr5Wr3C+qBKmtAAp1aZVVaAnZgcbzyI+00xx/VNYznumlGaXMi74fm4
	k0310E+/Fc+RVZIaG8pLRKmMGJxn7EcIMlOfB/52SRI3mXU4ltFtIsKZ6E3uIY=
X-Received: by 2002:a17:902:f60e:b0:2ea:192a:13b8 with SMTP id d9443c01a7336-2ea43a13e4fmr10496695ad.20.1792576137131;
        Wed, 21 Oct 2026 02:48:57 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b486970sm8858055ad.62.2026.10.21.02.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:48:56 -0700 (PDT)
Message-ID: <a1665f9e-3116-47bc-974e-98dce408fa37@gmail.com>
Date: Wed, 21 Oct 2026 17:48:37 +0800
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
Subject: Re: [PATCH v9 3/8] crash_core: serialize crash header preparation
 against hotplug
To: Jinjie Ruan <ruanjinjie@huawei.com>, robh@kernel.org,
 baoquan.he@linux.dev, rppt@kernel.org, m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, saravanak@kernel.org, akpm@linux-foundation.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, linux-mm@kvack.org, iommu@lists.linux.dev
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021083011.2170525-4-chenwandun1@gmail.com>
 <12e4e687-1ff0-41b2-bdf8-7f48b29e1f2f@huawei.com>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <12e4e687-1ff0-41b2-bdf8-7f48b29e1f2f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/21/26 17:13, Jinjie Ruan wrote:
> 
> 
> 在 2026/10/21 16:30, Wandun Chen 写道:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> crash_prepare_headers() counts memory ranges before populating the
>> allocated crash_mem array. The weak implementation used by ARM64,
>> RISC-V and LoongArch walks memblock.memory, while x86 performs the same
>> two-pass operation over system RAM resources. Concurrent memory hotplug
>> can change range source between the two walks and make the populate
>> pass overflow cmem->ranges.
>>
>> Take device_hotplug_lock when preparing crash headers during
>> kexec_file_load(). The x86/riscv memory hotplug path already takes
>> device_hotplug_lock, so call __crash_prepare_headers() directly
>> to avoid recursive locking.
>>
>> Sashiko reported this issue in [1].
>>
>> Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
>> Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
>> Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
>> Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
>> Acked-by: Baoquan He <baoquan.he@linux.dev>
>> ---
>>  arch/riscv/kernel/crash.c  |  2 +-
>>  arch/x86/kernel/crash.c    |  2 +-
>>  include/linux/crash_core.h |  2 ++
>>  kernel/crash_core.c        | 17 +++++++++++++++--
>>  4 files changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/crash.c b/arch/riscv/kernel/crash.c
>> index fe5a4b306aae..ac8df2edf2a7 100644
>> --- a/arch/riscv/kernel/crash.c
>> +++ b/arch/riscv/kernel/crash.c
>> @@ -70,7 +70,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>>  	 * memory resources.
>>  	 */
>> -	if (crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
>> +	if (__crash_prepare_headers(true, &elfbuf, &elfsz, NULL)) {
>>  		pr_err("unable to create new elfcorehdr");
>>  		goto out;
>>  	}
>> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
>> index e6f23933a6df..bef008a0cb22 100644
>> --- a/arch/x86/kernel/crash.c
>> +++ b/arch/x86/kernel/crash.c
>> @@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>>  	 * memory resources.
>>  	 */
>> -	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
>> +	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
>>  		pr_err("unable to create new elfcorehdr");
>>  		goto out;
>>  	}
>> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
>> index bc087124cd78..28e7a81cf263 100644
>> --- a/include/linux/crash_core.h
>> +++ b/include/linux/crash_core.h
>> @@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
>>  				       void **addr, unsigned long *sz);
>>  extern int crash_prepare_headers(int need_kernel_map, void **addr,
>>  				 unsigned long *sz, unsigned long *nr_mem_ranges);
>> +int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>> +			    unsigned long *nr_mem_ranges);
>>  extern int crash_exclude_core_ranges(struct crash_mem **cmem);
>>  
>>  struct kimage;
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index faa0f22dbb41..8a861a946e26 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/mm.h>
>>  #include <linux/cpuhotplug.h>
>>  #include <linux/memblock.h>
>> +#include <linux/device.h>
>>  #include <linux/kmemleak.h>
>>  #include <linux/crash_core.h>
>>  #include <linux/reboot.h>
>> @@ -344,8 +345,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
>>  	return 0;
>>  }
>>  
>> -int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>> -			  unsigned long *nr_mem_ranges)
>> +int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>> +			    unsigned long *nr_mem_ranges)
>>  {
>>  	unsigned int max_nr_ranges;
>>  	struct crash_mem *cmem;
>> @@ -382,6 +383,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>>  	return ret;
>>  }
>>  
>> +int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>> +			  unsigned long *nr_mem_ranges)
>> +{
>> +	int ret;
>> +
>> +	lock_device_hotplug();
>> +	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
>> +	unlock_device_hotplug();
> 
> I think this patch conflicts with my changes and would also conflict
> with the implementation of arm64 crash hotplug.
> 
> https://lore.kernel.org/all/20260921090450.807575-15-ruanjinjie@huawei.com/
> 
Have these patches already been merged? My current work is based on the latest
linux-next. If they have already been merged into the maintainer's branch,
please let me know, I will update my tree and rebase/re-adapt my changes accordingly.


Also, regarding the changes in kernel/crash_core.c: it looks like we modified
the same spot, the change is not wrong, is that right?

> arm64 crash hotplug:
> https://lore.kernel.org/all/20260918100442.3841135-18-ruanjinjie@huawei.com/

In addition, if arm64 gains crash hotplug support, the code there would indeed
need to be modified (to avoid a deadlock). As of now, arm64 crash hotplug
support has not been merged yet either, has it? I just want to make sure I
haven't missed anything.

> 
>> +
>> +	return ret;
>> +}
>> +
>>  /**
>>   * crash_exclude_mem_range - exclude a mem range for existing ranges
>>   * @mem: mem->range contains an array of ranges sorted in ascending order
> 

