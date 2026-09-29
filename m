Received: from mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69443AAF58
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668417; cv=none; b=qeydS9UVjS757tiOjHu+mbqjH3Yx5DOKo0gpUWR2BJsUa16uOYj9w0dI8vPeyHxaBCvDVUTaeAlzaITIxLJjS1wQgCMFDIzVb/FT9Iz6TNSaz4v2K4aAvM4sD/wRidkpXNbRmbUZh7Aqwf1aOH8/ZHbKh8gRslYRRxJS6VyirZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668417; c=relaxed/simple;
	bh=UVeeOQdrWmFqZlj5Z7vC/2L8sbl3nluI5tg6Il2hotU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rX5OLXy2my7cLRyixgNff8wD8x8OCLG7FpDRVymqdR+CwK8SNWEYFIj9H4VZy5g4a8XUnhVDjAdQecpLF569QXOLQQflMjgR23f0qeXE7TGxi/5YNzqfiwoeHKt5YfdP0edoEcDTCliZpxDrwbXVUJlcrq33198N9Z3XVS18c7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ud+OwCx8; arc=none smtp.client-ip=95.215.58.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ud+OwCx8"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UVeeOQdrWmFqZlj5Z7vC/2L8sbl3nluI5tg6Il2hotU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790668412; v=1; x=1791273212;
 b=Ud+OwCx8sz5JctF/EYW7j4Nm8DDn8E4rHSLo8wlPMyWndqRvi25SqH2q8Y9EmTKjm/QxhOKf
 p+sT8qZ5dAmL5JVId9m+W/kZjLRH2/vRh9f92PIEAV35z8xMUa3KRi290vG9JUx1pPIR4XJAgm+
 4UQXspfD8f+f00qrZr9Fa8Ps=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 36715084ceb0146c;
	Tue, 29 Sep 2026 07:53:30 +0000
X-Mizu-Trace-ID: 36715084ceb0146c
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v5 03/12] mm/sparse-vmemmap: introduce
 CONFIG_VMEMMAP_OPTIMIZATION
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <d7a75c99-3021-495f-ae34-883d047370f3@kernel.org>
Date: Tue, 29 Sep 2026 15:53:15 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lance Yang <lance.yang@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D0B0A406-100C-437D-8AA8-D276E8DA8278@linux.dev>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
 <20260927025441.741633-4-songmuchun@bytedance.com>
 <d7a75c99-3021-495f-ae34-883d047370f3@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 29, 2026, at 15:11, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 9/27/26 04:54, Muchun Song wrote:
>> The section-based vmemmap optimization infrastructure is guarded by
>> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP, but it can also be used by
>> ZONE_DEVICE users that set dev_pagemap::vmemmap_shift. Introduce
>> CONFIG_VMEMMAP_OPTIMIZATION as a common config for the shared
>> infrastructure.
>>=20
>> Select the new option from HUGETLB_PAGE_OPTIMIZE_VMEMMAP and from
>> ZONE_DEVICE when the architecture opts in to DAX vmemmap =
optimization,
>> and use it to guard the generic sparse-vmemmap state and helpers.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Acked-by: Qi Zheng <qi.zheng@linux.dev>
>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> ---
>> v5:
>> - Move this patch after the shared tail-page factoring.
>> - Select VMEMMAP_OPTIMIZATION from ZONE_DEVICE instead of DEV_DAX,
>>  covering all users of dev_pagemap::vmemmap_shift, reported by
>>  Sashiko.
>>=20
>> v4:
>> - Rename SPARSEMEM_VMEMMAP_OPTIMIZATION to VMEMMAP_OPTIMIZATION
>>  (suggested by Mike Rapoport)
>> - Collect Acked-by from Mike Rapoport
>>=20
>> v2:
>> - Fix SPARSEMEM_VMEMMAP_OPTIMIZATION being selected without =
SPARSEMEM_VMEMMAP
>>  reported by Sashiko.
>> - Add an explicit DEV_DAX dependency on ZONE_DEVICE
>> - Collect Acked-by from Qi Zheng
>> ---
>> arch/x86/entry/vdso/vdso32/fake_32bit_build.h |  2 +-
>> fs/Kconfig                                    |  1 +
>> include/linux/mm.h                            |  3 +++
>> include/linux/mmzone.h                        | 10 +++++-----
>> include/linux/page-flags.h                    |  5 ++---
>> mm/Kconfig                                    |  5 +++++
>> mm/sparse-vmemmap.c                           |  2 +-
>> mm/sparse.h                                   |  6 +++---
>> 8 files changed, 21 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h =
b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
>> index bc3e549795c3..72a92cb9b53d 100644
>> --- a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
>> +++ b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
>> @@ -11,7 +11,7 @@
>> #undef CONFIG_PGTABLE_LEVELS
>> #undef CONFIG_ILLEGAL_POINTER_VALUE
>> #undef CONFIG_SPARSEMEM_VMEMMAP
>> -#undef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> +#undef CONFIG_VMEMMAP_OPTIMIZATION
>> #undef CONFIG_NR_CPUS
>> #undef CONFIG_PARAVIRT_XXL
>>=20
>> diff --git a/fs/Kconfig b/fs/Kconfig
>> index d1c210c6508f..1454b7fe9641 100644
>> --- a/fs/Kconfig
>> +++ b/fs/Kconfig
>> @@ -278,6 +278,7 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> def_bool HUGETLB_PAGE
>> 	depends on ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
>> 	depends on SPARSEMEM_VMEMMAP
>> + 	select VMEMMAP_OPTIMIZATION
>=20
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks.

>=20
> Is there a path to remove HUGETLB_PAGE_OPTIMIZE_VMEMMAP, and to merge
> ARCH_WANT_OPTIMIZE_DAX_VMEMMAP+ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP into =
a
> ARCH_SUPPORTS_VMEMMAP_OPTIMIZATION?

These are actually two completely different capabilities.

ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP requires the architecture
to support dynamic updates to vmemmap page tables, meaning a
PTE entry can be changed from one valid entry to another
valid entry. This does not meet the requirements on arm64,
because arm64 requires page table operations to satisfy BBM
(there is, of course, a series [1] attempting to do this).

However, for ARCH_WANT_OPTIMIZE_DAX_VMEMMAP, the vmemmap page
tables do not involve dynamic updates, so the BBM requirement
can be satisfied. Therefore, arm64 can enable
ARCH_WANT_OPTIMIZE_DAX_VMEMMAP, but cannot enable
ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP. To make the naming clearer,
I have another patch [2] that renames it for greater clarity.

As for ARCH_WANT_OPTIMIZE_DAX_VMEMMAP, I plan to remove it
entirely in the future, because architectures that do not support
it can simply choose to disable it, as can be seen in patch [3].

So in my plan, ultimately only one config will remain:
ARCH_SUPPORTS_VMEMMAP_REMAP.

I hope this clarifies the plan. Let me know what you think.

[1] =
https://lore.kernel.org/20260708031129.3503195-1-jthoughton@google.com/
[2] =
https://lore.kernel.org/20260903122128.12264-2-songmuchun@bytedance.com/
[3] =
https://lore.kernel.org/20260513132044.41690-6-songmuchun@bytedance.com/


Thanks,
Muchun

>=20
>=20
> --=20
> Cheers,
>=20
> David


