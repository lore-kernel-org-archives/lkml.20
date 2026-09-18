Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4C12F8E8F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740105; cv=none; b=KoWn5QwwN612H0qiiVZ/rt0q2rl2bQImCjrbxeTMrTrgziVojbCH0N6s9utJVCvWPjFJt4ywQO56e4ERPMWGbr7sPQvkkFv2/BgQnAb8hVa0Rkc/k1wU8uogrzeGQqj8Iy09VOzSgNrGH5azVvLMyTya2KoVbBmcHKuFZqIcZgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740105; c=relaxed/simple;
	bh=IudqScPIApanPqU1wHU/LAxo+S2FQNZ/o5QqwyUu3Tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BaCqs8oENua17so7raQyvFdny2pRT4X2H3fAzI69sKOv1jJj6jY2r9b/ilA6ZGyzrczAlVvj8WRu1skbhLTluRuDK10AWIA7JewCAfdgfRaZhcgOKsHgylPnrX4/3/Q3zWeY/Z96o30cfQeqHTyNkxcAvHDMswiGfleIcfxs1gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BfbvDw33; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BfbvDw33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789740102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oiLxcuf3moIzoAJiz7VjqGkuKZ3KLxcnu3OutAUBSw0=;
	b=BfbvDw33WdXY37AYiCvoQktaH/7txQNY2or7hRpiIidXG3+64jh8zd6pQT2uz6jvaEN0n2
	NJMJob64s7PccXsUwJFu1WEFxJyPiULErRsDjJDsrpa7+j0nFmG2O0QRPDiJBBurGTZ+I1
	tOnGCCaIWRALcSmUmy0tW74WgfCnT7g=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-RfnzM10hNmSWz4EWKPvaiQ-1; Fri, 18 Sep 2026 10:01:41 -0400
X-MC-Unique: RfnzM10hNmSWz4EWKPvaiQ-1
X-Mimecast-MFC-AGG-ID: RfnzM10hNmSWz4EWKPvaiQ_1789740100
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66cbfb7ec42so957852d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740100; x=1790344900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiLxcuf3moIzoAJiz7VjqGkuKZ3KLxcnu3OutAUBSw0=;
        b=SFO+d1LPGqN9K0PvMbzYzzOhkGXArU33lS00FwlEWzPrznLPv9KIC/JfEMNBEE+IhE
         +Iu5jJWBUJSIUptv3ReoQqLDyQewIuMBwUtCFpkq+f4nhZI8Uu8ythk4zszzyD8l7ft8
         F/N16Ycv+lyElvFdZnT0JjkWEvOK0CG3sYMlcXNAK+yhra79uTk4v7DEGWiX5kRKojnf
         opjYWNvrdr3yoW/HVoB9lRm/vEQ094JVYUB3MWrRnVUH8mOmDeFmJkYsh90bk5bcM6SM
         qfUNnnTVB3DRpw+n0N4Er+kZVuNc19iZmeaWo/i65ikbypnE8ld+i7D0dIFc6ukNC7wD
         lANQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1bJpVecRZDI6oFTcePODAe0YIa12+7lpm7oKCWGmZmBNH+dCkc7Q79V7sCJQ4r0rLlwDbnBw44E9kOps=@vger.kernel.org
X-Gm-Message-State: AFuF++kZMNB7QCZnXmKYwdyoBUyah9uFVUVOASOWvud3Cl0UTfuEuRPd
	y7VxE/kRpYcPnx0qjfyhcJxO524E17tf4po2AmC2lZ8D3oK/Ji/P+Wmfet/aW3mJgqKGiI+WQQt
	NSlg+EFdxOzwmGiVGWgiezO5Ku3gzHQTXtmS3mRh42T/LtIjCu/kG9XXoENTMafPooQ==
X-Gm-Gg: AYBFou1Vada+4KANdY51y/CgX6IngZjo3LerA9rV8LftuyLmOd1uSvK26kZ1xeZVL3C
	juevqGHK6MRJ5BVGSIpYMRrcdwERK4l5ExnVFwkFQ489/O4gslvYCFiRUWCaPNkeRzCFAgA8xZX
	3rhaByu0TCx8xws400zF1xA52Tv3Y3brHIc2p78aujeEIRMJlr/PwtEWMhjhf8K+xIfoatw3DNN
	rB8pQCjkHpq0ewEce24P04gDrf7dEc28gLHCdjoTdwDiiaZJW3lmT0iWqAdbHeyLlKiSKVHH4pR
	hM3Ko/4tT4fCv0qsLtUX7tjcbfV6Uxg6zhbdP2VLxUfHuKKuRfXqHzQYoi7gQluncXG6s0x7PFh
	TuOA=
X-Received: by 2002:a05:690e:4594:10b0:671:214:30a6 with SMTP id 956f58d0204a3-6717fe4a92dmr589954d50.94.1789740099849;
        Fri, 18 Sep 2026 07:01:39 -0700 (PDT)
X-Received: by 2002:a05:690e:4594:10b0:671:214:30a6 with SMTP id 956f58d0204a3-6717fe4a92dmr589856d50.94.1789740098908;
        Fri, 18 Sep 2026 07:01:38 -0700 (PDT)
Received: from [192.168.2.110] ([142.172.30.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9125809a249sm13111076d6.46.2026.09.18.07.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:01:36 -0700 (PDT)
Message-ID: <970c8f34-3cf4-4c6c-931c-b132e3bc6838@redhat.com>
Date: Fri, 18 Sep 2026 10:01:35 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] mm: thp: always enable mTHP support
To: Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, david@kernel.org, baolin.wang@linux.alibaba.com,
 ziy@nvidia.com, lance.yang@linux.dev
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com
References: <cover.1789695931.git.luizcap@redhat.com>
 <ad25b99c-d9f6-4e52-819b-81e08eb2a131@linux.dev>
Content-Language: en-US
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <ad25b99c-d9f6-4e52-819b-81e08eb2a131@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/18/26 6:37 AM, Usama Arif wrote:
> 
> 
> On 18/09/2026 02:45, Luiz Capitulino wrote:
>> Introduction
>> ============
>>
>> Today, if an architecture implements has_transparent_hugepage() and the CPU
>> lacks support for PMD-sized pages, the THP code disables all THP, including
>> mTHP.
> 
> 
> Hi Luiz,
> 
> Sorry for asking this so late in the series, but which CPUs lack support for
> PMD sized pages?
> 
> Is this series mainly for PowerPC?

No :)

The architectures that have conditional PMD page support (ie. discovered
at run-time via has_transparent_hugepage()) are x86, s390, powerpc and
mips.

For x86 for example, even on 64-bit there are cases where the PSE bit
may not be present (eg. some errata and by hypervisor CPUID masking).

That being said, the main goal of the series is that
has_transparent_hugepage() is overloaded: it has different semantics on
those architectures and is used to gate all THP support (which is not
the right thing to do for mTHP).

> 
> Thanks,
> Usama
> 
>>
>> This happens because the has_transparent_hugepage() helper is overloaded:
>> its name implies it checks whether THP is enabled, but on some architectures
>> it actually checks whether the CPU supports PMD-sized pages. In addition,
>> the THP and shmem code have a big switch on has_transparent_hugepage().
>>
>> This series solves this by decoupling THP availability checking from
>> querying CPU support for PMD-sized pages. THP availability can be checked
>> with IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE). For querying PMD-sized page
>> support, this series introduces a new helper called pgtable_has_pmd_leaves(),
>> which is independent of THP, has well defined semantics and can be used
>> in fast paths.
>>
>> Core THP code and shmem can use pgtable_has_pmd_leaves() to determine
>> PMD-sized THP support at page fault time (or folio allocation time for
>> shmem), leaving THP and shmem always enabled for other THP sizes. For
>> architectures and CPUs that do support PMD-sized pages there's no
>> intended change in behavior.
>>
>> We also convert each user of has_transparent_hugepage(), and the related
>> helper thp_disabled_by_hw(), to IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)
>> and/or pgtable_has_pmd_leaves() according to the call site's check semantics.
>> On s390, powerpc, mips and x86 the arch has_transparent_hugepage()
>> implementation is moved out of the CONFIG_TRANSPARENT_HUGEPAGE guard and
>> renamed to arch_has_pmd_leaves().
>>
>> Thanks to David Hildenbrand for suggesting this improvement and for
>> providing initial guidance (all bugs and misconceptions are mine).
>>
>> This applies to mm-new 93f615a22169 ("mm/swap, PM: hibernate: atomically
>> replace hibernation pin").
>>
>> Reporting availability of PMD-sized pages to user-space
>> =======================================================
>>
>> Before this series, not having PMD pages available would shut down THP support
>> meaning that /sys/kernel/mm/transparent_hugepage would not be available.
>> After this series, /sys/kernel/mm/transparent_hugepage and hpage_pmd_size are
>> always available but hugepages-<PMD-size>kB is only available if PMD-sized
>> pages are supported.
>>
>> To me this seems logical, as hugepages-<size>kB is only available if <size>
>> is supported. If this is correct, then MM kselftests that depend on PMD-sized
>> pages will need to be updated to check for it as they fail with this series
>> applied when PMD-sized pages are not available.
>>
>> The alternative is changing hpage_pmd_size: either don't create the file
>> when PMD-sized pages are not available or set hpage_pmd_size=0. My concern
>> is that this could be considered an ABI breakage as this file was never
>> reported to be optional or report a zero value.
>>
>> Testing
>> =======
>>
>> - Ran MM kselftests on x86_64 and s390
>> - Tested all mTHP sizes allocation on x86_64 (with and without PMD-sized
>>    pages available)
>> - Tested shmem with within_size w/ mTHP on x86_64 (with and without
>>    PMD-sized pages available)
>> - Performed defconfig build on x86_64, s390, arm64, powerpc, and mips
>>
>> NOTES:
>>    * I'm forcing arch_has_pmd_leaves() off on x86 to simulate not having
>>      PMD-sized pages available
>>
>>    * Running the MM kselftests when PMD pages are not available causes some
>>      tests that depend on PMD-sized THP pages to fail as noted earlier
>>
>> Changelog
>> =========
>>
>> v8
>> --
>> - Fixed build breakage on MIPS (Lance)
>> - Rebased on top of mm-new (fixed conflicts in include/linux/pgtable.h and
>>    mm/shmem.c - dropped a Reviewed-by as a result)
>>
>> v7
>> --
>> - Applied on top of latest mm-new
>> - Improved various changelogs including cover-letter
>> - Changed arch_has_pmd_leaves() default implementation to use IS_ENABLED()
>>    instead of IS_BUILTIN()
>>
>> v6
>> --
>> - Rebased on top of mm-unstable (required a minor conflict resolution)
>> - Added more Reviewed-by and Acked-by tags
>>
>> v5
>> --
>> - Moved init_arch_has_pmd_leaves() to mm_core_init() (David)
>> - Renamed init_arch_has_pmd_leaves() to pgtable_leaf_support_init() (Lance)
>> - Added new patch changing shmem_getattr() to set blksize according to
>>    highest supported THP order (Baolin)
>> - Added new patches to move has_transparent_hugepage() out of
>>    CONFIG_TRANSPARENT_HUGEPAGE guards
>> - shmem_allowable_huge_orders(): rename variable and only disable
>>    PMD_ORDER (David)
>> - Added <linux/jmp_label.h> to include/linux/pgtable.h
>> - Added new tags and removed Reviewed-by from changed patches
>>
>> v4
>> --
>> - Used static key for pgtable_has_pmd_leaves() API (Lance)
>> - Moved shmem pgtable_has_pmd_leaves() check to
>>    shmem_allowable_huge_orders() (Baolin)
>> - Default pgtable_has_pmd_leaves() implementation to
>>    IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE) (Zi)
>> - Dropped patch “mm: thp: x86: cleanup PSE feature bit usage” (Dave)
>>
>> v3
>> --
>> - Rebased on top of latest Linus tree
>> - Removed i915 patch as driver dropped has_transparent_hugepage() usage
>> - Moved init_arch_has_pmd_leaves() call in start_kernel() to avoid conflict
>>    with early_param handlers clearing CPU feature flags
>> - Fixed build error with CONFIG_MMU=n (kernel test robot)
>> - Fixed huge_anon_orders_inherit default setting when !pgtable_has_pmd_leaves() (Baolin)
>> - Small commit changelog improvements
>>
>> v2
>> --
>> - Added support for always enabling mTHPs for shmem (Baolin)
>> - Improved commits changelog & added reviewed-by
>>
>> v1
>> --
>> - Call init_arch_has_pmd_leaves() from start_kernel()
>> - Keep pgtable_has_pmd_leaves() calls tied to CONFIG_TRANSPARENT_HUGEPAGE (David)
>> - Clear PUD_ORDER when clearing PMD_ORDER (David)
>> - Small changelog improvements (David)
>> - Rebased on top of latest mm-new
>>
>> Luiz Capitulino (14):
>>    docs: tmpfs: remove implementation detail reference
>>    mm: shmem: shmem_getattr(): set blksize to highest supported THP order
>>    mm: introduce pgtable_has_pmd_leaves()
>>    drivers: dax: use pgtable_has_pmd_leaves()
>>    drivers: nvdimm: use pgtable_has_pmd_leaves()
>>    mm: debug_vm_pgtable: use pgtable_has_pmd_leaves()
>>    mm: shmem: allow THP support determination at folio allocation time
>>    s390: move has_transparent_hugepage() out of THP guard
>>    powerpc: move has_transparent_hugepage() out of THP guard
>>    mips: move has_transparent_hugepage() out of THP guard
>>    x86: move has_transparent_hugepage() out of THP guard
>>    treewide: introduce arch_has_pmd_leaves()
>>    mm: replace thp_disabled_by_hw() with pgtable_has_pmd_leaves()
>>    mm: thp: always enable mTHP support
>>
>>   Documentation/filesystems/tmpfs.rst           |  5 ++--
>>   arch/mips/include/asm/pgtable.h               |  6 ++--
>>   arch/mips/mm/pgtable.c                        | 25 ++++++++++++++++
>>   arch/mips/mm/tlb-r4k.c                        | 22 --------------
>>   arch/powerpc/include/asm/book3s/64/hash-4k.h  |  2 +-
>>   arch/powerpc/include/asm/book3s/64/hash-64k.h |  2 +-
>>   arch/powerpc/include/asm/book3s/64/pgtable.h  | 18 ++++++------
>>   arch/powerpc/include/asm/book3s/64/radix.h    | 14 ++++-----
>>   arch/powerpc/mm/book3s64/hash_pgtable.c       |  8 ++---
>>   arch/s390/include/asm/pgtable.h               |  6 ++--
>>   arch/x86/include/asm/pgtable.h                | 12 ++++----
>>   drivers/dax/dax-private.h                     |  2 +-
>>   drivers/nvdimm/pfn_devs.c                     |  6 ++--
>>   include/linux/huge_mm.h                       |  7 -----
>>   include/linux/pgtable.h                       | 21 ++++++++++++--
>>   mm/debug_vm_pgtable.c                         | 20 ++++++-------
>>   mm/huge_memory.c                              | 27 ++++++++++++-----
>>   mm/memory.c                                   | 11 ++++++-
>>   mm/mm_init.c                                  |  1 +
>>   mm/shmem.c                                    | 29 ++++++++++++-------
>>   20 files changed, 144 insertions(+), 100 deletions(-)
>>
> 

