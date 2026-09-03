Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF41F429CD0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421457; cv=none; b=XDa/67y5nW4yhYJr8dNamYh6FMpflXnm/47n7E7gxtpFm4ivnn05aAVQoYOyck2sbkih1Tz6br35kBoOnP1C6/1T7k5Dil6eAan4IoJlmp3RaLG66yp8eBf5Q8jjE4xmcIkr/Z7QaBcZzmtmKhXbhfPsGPHp6Oxwhb0nVQdC7FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421457; c=relaxed/simple;
	bh=3yBQW4M/U3usW5Bkp7d0eQGmzAcbhHS+cvRXVoYulCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QAk1SaY0RtAzSSy8VOTW8yDBp37tjS6YfwRuPn7mGKg3aJgyKaHdvOn9kmeGoxyFTkGgIsH7UOwxFDHiA4nqCDkDWMBcZlvTormeluhZAayYAHyIooUxmJdgE1zobaVdC1r98KFULsiyFN4f8NHo+kr2M/6aRdmsR5/0Aysgmio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xnqrar2n; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xnqrar2n"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6fbdc8772so6663835ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788421452; x=1789026252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUbrqLv47LI31OwZX/zERcJxLxOgrZ94RwwzK9bj0r8=;
        b=Xnqrar2nWev6qOfBQMa1/a9DiIkw6FZjcf2U78Ru2/vPoc3zjssXDHl8Q6nJy/+QEB
         0fQ8/bgdLZDoNQtFoBLVwQ2pTHLztek5+iT/pOMUnYCU/Iu96z3PH4HKpUIj+w5ibdoG
         OeEDu4j1rN/sC4tOU8eU6GijZQW48yIshf+qXdtYoSiaD6N1FVwxSwD+xy03rkVfQ7Yw
         Kx3WiClILqrxhpAljoizbDp0LABbr9/S7IblaidskNx2J9shVaPy9++bSo3FAUidsIJr
         RfZ+MwH2gwv49jVbinY5/9Ic9D5gfPfhsqZjLd9WVanRxdAIiPSHxrQD8v8f75ELkpTV
         2ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421452; x=1789026252;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUbrqLv47LI31OwZX/zERcJxLxOgrZ94RwwzK9bj0r8=;
        b=ImHN+5z49EF9693tFK0biFBIHHLr+u7Er0QlDTtc+J1KMGVfIe9SNo1CWJ/U7kx76G
         xJNu7WWNf56esQT/wMvlBpE+no4duKQ5ctGVS9yQ7iZXGTlAcyyf5Dd5IuSbWLUwMmgt
         Lp9iqt7NM6Be5j+r0uRs7zlU7yBvWsEmV8wQRCtpR9fkknmbR7LnEiHMGeMvkvp6zhzl
         j1o0ACMMRAvsSdFfO0PtkZnUHZ41Xm8X6UntMtxnuCRZ8YTajMirg+wngTqnTyPky96d
         FJvSQzsLTSvnQx5aLoaIaCN418/OwRBeozVmF72D3aCT9igeH4IbqLUx5taQKJzEN6K8
         QMiw==
X-Forwarded-Encrypted: i=1; AKwUvBwEY7xdewLRBvZWpbN0qTk5epVctenbV7j6W1PnQ2tRZsnUjUCt2zxUVGrE/we8fKdCmpgE9ds9mNOYHWA=@vger.kernel.org
X-Gm-Message-State: AFuF++k32OfTYLzclxi8U7w2229v3Vn8tjuTi7mYl0NIbzc2juaIadRZ
	StkG3GObFmDIrarpdR/STPAOVcWEZnXKHbokTtBiHcXWmlAKBonNx2J1
X-Gm-Gg: AYBFou0fdwqmkxjF94WsDmfn0VTbKyLHh2Q0DusCH7R/6cBwvgduisbz9U78K93LgnI
	Jp6ROLkSLR4m6uv/VigoLaz75+Jcw20mxnTmkd7vOxJfPA8f4124Y/v84sTDxxN0BC/xE9FL+jw
	8yFho76qnQQRsx/lEAEETvmOXz+x02bCg4HJRpi60mEmpwA7QCCvtN7rSUEcMVrOA17qJTkiJVU
	gj3DiekjPJh2BcmJZzD+vbS+hSlHTX/6yIpJsRpXQTzYvxOI5NKcydzJR1TIMvT7DJniF84yc2p
	W4Ym1r6nTaq6tDWJ9Dk8z+yhdM8bJUyP6UH2WXbh90CBI/kjxyY7PryzIMmZzxaenvqgMt6kBy+
	jqz+yvQqPKjP28OZVPFaJVHlLHYJLQMAe32RkFtiy0WVKZP5yPF72jUojb7uhdp9AfA/qWCYdjk
	xpkVJY+NwJIAzgUPIfSkJQCMy6urjfQxc1G8SDZ6XgNj6zQYloq/JQVuB1cn4jwiVT+gMCYbYFj
	JeVD18=
X-Received: by 2002:a17:902:e809:b0:2d7:4b42:9352 with SMTP id d9443c01a7336-2daec60af43mr131715375ad.3.1788421451864;
        Thu, 03 Sep 2026 00:44:11 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62d7c2sm5931425ad.29.2026.09.03.00.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:44:11 -0700 (PDT)
Message-ID: <edd83cd6-663f-43f5-8058-99e59d941d5b@gmail.com>
Date: Thu, 3 Sep 2026 15:43:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] kdump: reduce vmcore size and capture time
To: Baoquan He <baoquan.he@linux.dev>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
 alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <apfkDlcMYrgiuGYA@fedora> <6aef2f48-1cc5-408d-a5a2-2b4b4d45ad7b@gmail.com>
 <apkiW8gn9Z5XaVQh@fedora>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <apkiW8gn9Z5XaVQh@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/3/26 15:31, Baoquan He wrote:
> On 09/03/26 at 03:05pm, Wandun wrote:
>>
>>
>> On 9/2/26 16:53, Baoquan He wrote:
>>> Hi Wandun,
>>>
>>> On 09/02/26 at 03:31pm, Wandun Chen wrote:
>>>> From: Wandun Chen <chenwandun@lixiang.com>
>>>>
>>>> On SoCs that carve out large firmware-owned reserved memory (GPU,
>>>> camera ISP, ...), kdump currently dumps those carveouts as part of
>>>> system RAM even though their contents are firmware state that is not
>>>> useful for kernel crash analysis.
>>>>
>>>> This series introduces a MEMBLOCK_NODUMP flag in memblock to filter
>>>> reserved memory on DT-based architectures (arm64, riscv, loongarch).
>>>> Reserved regions default are marked MEMBLOCK_NODUMP so kdump omits them;
>>>> reusable CMA regions are different because their pages are handed back
>>>> to the buddy allocator and may carry crash-relevant data.
>>>>
>>>> ACPI systems already filter reserved memory out of the vmcore through
>>>> their existing path; only DT-based systems currently fail to filter these
>>>> regions, which is what this series addresses. The flag lives in memblock
>>>> itself rather than in a DT-only structure, so the mechanism is generic and
>>>> both ACPI and DT systems can benefit from it (suggested by Rob, thanks) [1].
>>>
>>> Thanks for the effort. I am not against this patchset, and I haven't
>>> went through it carefully. Just from the cover letter, you mentioned
>>> generic, I am wondering if this can be generic for excluding other
>>> memory regions. Asking this because I try to find a way to exclude
>>> unwanted memory regions too, please check below link where there's
>>> the relevant discussion. We definitely don't like inventing wheels
>>> time after time. Do you think this memblock region excluding can
>>> be used in other places of kernel?
>>>
>>> https://lore.kernel.org/all/aoLFai0gzzH2bGgy@MiWiFi-R3L-srv/T/#u
>>
>>
>> Thanks for taking a look, and for the pointer to the crash-wipe thread.
>>
>> To answer your question directly: the exclusion mechanism in this series
>> is already generic, memblock_mark_nodump() is the entry point. Any code
>> that wants a region out of the vmcore just marks it MEMBLOCK_NODUMP, when
>> preparing vmcore elf header by walking memblock, these regionss are skipped;
>> This series is simply one caller, marking the DTS /reserved-memory and
>> /memreserve/ regions with MEMBLOCK_NODUMP.
> 
> Thanks, for memory not allocated from memblock, e.g buddy, is it still
> good?

Yes, still good, only need to pass the physical range to memblock_mark_nodump().

> 
>>
>> x86 currently builds the vmcore elf header from iomem_resource, not
>> memblock; it could be switched to memblock, but that would bring no
>> benefit for the problem this series solves, so this series makes no
>> x86 change. I'd personally be in favor of switching to memblock for
>> a unified implementation across architectures.
>>
>> Best regards
>> Wandun
>>
>>
>>>
>>>>
>>>> Since the reserved memory regions are filtered out, the vmcore is
>>>> smaller in size and faster to produce. 
>>>>
>>>> The series is based on linux-next and is organized as follows:
>>>>
>>>> Patches 1-4: Preparation and bugfixes: fix the missing HugeTLB
>>>>              flagname, switch riscv crash_mem to memblock, fold the
>>>>              duplicated per-arch memblock walks into the weak
>>>>              defaults, and serialize crash header preparation against
>>>>              memory hotplug.
>>>> Patches 5-9: NODUMP infrastructure: switch crash_core to
>>>>              for_each_mem_region(), introduce the MEMBLOCK_NODUMP
>>>>              flag, add a dumpable flag to struct reserved_mem, and
>>>>              mark /reserved-memory and /memreserve/ entries with
>>>> 	     MEMBLOCK_NODUMP flag.
>>>> Patch 10:    Exclude MEMBLOCK_NODUMP regions from the vmcore ELF
>>>>              header.
>>>>
>>>> In v5, Sashiko found some pre-existing issues related to reserved-memory,
>>>> and has no dependency on this series, so these issues have been addressed
>>>> in a separate series [2].
>>>>
>>>> v5 --> v6:
>>>> 1. Serialize crash header preparation against memory hotplug to avoid
>>>>    out-of-bounds or use-after-free issues.
>>>>
>>>> 2. MEMBLOCK_NODUMP marking is now done after memblock allows resizing,
>>>>    avoiding a panic from too few regions before resize is permitted.
>>>>
>>>> 3. Reordered the patches, put pre-existing bugfixes earlier in the series.
>>>>
>>>>
>>>> v4 --> v5:
>>>> 1. Rework the mechanism around a memblock-level MEMBLOCK_NODUMP flag
>>>>    (suggested by Rob) instead of the v4 opt-in 'dumpable' flag on
>>>>    DT-only struct reserved_mem.
>>>> 2. Switch the riscv vmcore elf header preparation to use memblock
>>>>    instead of the resource tree, aligning it with arm64 and loongarch,
>>>>    so riscv also can exclude reserved memory from vmcore.
>>>> 3. Deduplicate the vmcore elf header preparation: arm64, riscv and
>>>>    loongarch open-coded the same logic, so fold it into shared
>>>>     __weak defaults in crash_core.
>>>> 4.  Drop the v4 patch that saved /memreserve/ entries into the
>>>>     reserved_mem array; /memreserve/ is now marked MEMBLOCK_NODUMP
>>>>     directly.
>>>>
>>>> v3 --> v4:
>>>> 1. Rebase this series on v7.2-rc1.
>>>> 2. Add two cleanup patches (patch 02/03).
>>>> 3. Simplify patch 03 to avoid checking whether initial_boot_params is
>>>>    NULL multiple times, suggested by Rob.
>>>>
>>>> v2 --> v3:
>>>> 1. Fix out-of-bounds issue if device tree lacks /reserved-memory node.
>>>> 2. Fix UAF issue when alloc_reserved_mem_array() fails.
>>>> 3. Add some prepare patches.
>>>>
>>>> v1 --> v2:
>>>> 1. v1 added an opt-out DT property ('linux,no-dump'). Per Rob's
>>>>    feedback [3], v2 drop that property and exclude reserve memory
>>>>    by default.
>>>> 2. Split some prepared patches from the original patches.
>>>> 3. Address coding-style comments on patch 5 from Rob.
>>>>
>>>> [1] https://lore.kernel.org/lkml/20260723234126.GA3253409-robh@kernel.org/
>>>> [2] https://lore.kernel.org/lkml/20260818092420.2859026-1-chenwandun1@gmail.com/
>>>> [3] https://lore.kernel.org/lkml/20260506144542.GA2072596-robh@kernel.org/
>>>>
>>>> Meijing Zhao (1):
>>>>   mm: memblock: add missing HugeTLB flag name
>>>>
>>>> Wandun Chen (9):
>>>>   riscv: build crash_mem ranges from memblock instead of resource tree
>>>>   crash_core: fold duplicated memblock arch hooks into the weak default
>>>>   crash_core: serialize crash header preparation against hotplug
>>>>   crash_core: replace for_each_mem_range() with for_each_mem_region()
>>>>   memblock: introduce MEMBLOCK_NODUMP flag
>>>>   of: reserved_mem: add dumpable flag to opt-in vmcore
>>>>   of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
>>>>   of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
>>>>   crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
>>>>     header
>>>>
>>>>  arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
>>>>  arch/loongarch/kernel/machine_kexec_file.c | 27 ------------
>>>>  arch/riscv/Kconfig                         |  2 +-
>>>>  arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
>>>>  arch/x86/kernel/crash.c                    |  2 +-
>>>>  drivers/of/fdt.c                           |  2 +
>>>>  drivers/of/of_private.h                    |  2 +
>>>>  drivers/of/of_reserved_mem.c               | 48 ++++++++++++++++++++
>>>>  include/linux/crash_core.h                 |  2 +
>>>>  include/linux/memblock.h                   |  9 ++++
>>>>  include/linux/of_reserved_mem.h            |  1 +
>>>>  kernel/crash_core.c                        | 51 ++++++++++++++++++++--
>>>>  kernel/dma/contiguous.c                    |  1 +
>>>>  mm/memblock.c                              | 17 ++++++++
>>>>  14 files changed, 131 insertions(+), 95 deletions(-)
>>>>
>>>> -- 
>>>> 2.43.0
>>>>
>>

