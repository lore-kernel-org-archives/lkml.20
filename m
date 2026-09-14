Received: from mta0.migadu.com (out-6.mta0.migadu.com [91.218.175.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4561D3F1050
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372325; cv=none; b=UITd/BScOf1ekYH97ohfgJJCbqAkzyvaFLCQ6XBtFYEP1SIgzoeyKYtl97OLrZ7BJgtz8XExXYyRyLOxTDnaf+Bn5GN9xj2sLn3V8wHLAFjTFmd+Al5PL9edIF0GDnQv/CRt2qTcLrY2Y0N638DeP5t68FRabmyfyYBHzz3pqi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372325; c=relaxed/simple;
	bh=nXlIXZyzZAmUaaXn6/AG1Qoa90qlZRNpDV2IZ5Xt6I8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=V4aI0Uv/u1tUymd8AQcB7FrXIpAU7b1Q7K0BdjVd+QXsw47fxy66asVGjWNZYfs/UzpX4wcaaL4VQwGvW9jjnBZNnKFPsMcQAuElgJh2cj+QPm0AdVL3+Ny8le1Ssb04ACIboas/XSyK4beG82vvaMbd/G4uk4vHXZIWe2zXVNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BwcSvFdE; arc=none smtp.client-ip=91.218.175.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BwcSvFdE"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nXlIXZyzZAmUaaXn6/AG1Qoa90qlZRNpDV2IZ5Xt6I8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789372317; v=1; x=1789977117;
 b=BwcSvFdElIUHCrFEATDcx/wtsn0aU0ZDfA152keO1eLQwSqs7cgfZjS6XOj/O2ewQoTZk+NR
 vu0Rr6gGGPGWkmw1sN4Cz1OpiABBGEKw4wxU4B61n5wXki9xHdFycd2PvCiIAM/OllaDj3VeFwh
 tI56Kt+FFaGgM9I1Cu4XAT8Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 7f6bbc8e5bf97846;
	Mon, 14 Sep 2026 07:51:57 +0000
X-Mizu-Trace-ID: 7f6bbc8e5bf97846
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v3 01/11] mm/sparse-vmemmap: introduce
 CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <178937209455.4188640.17761540933640972197.b4-review@b4>
Date: Mon, 14 Sep 2026 15:51:40 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <42F502DE-9DEE-447B-9323-0CBB2300FAFE@linux.dev>
References: <20260911050228.58884-1-songmuchun@bytedance.com>
 <20260911050228.58884-2-songmuchun@bytedance.com>
 <178937209455.4188640.17761540933640972197.b4-review@b4>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 14, 2026, at 15:48, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> Hi,

Hi,

>=20
>> The section-based vmemmap optimization infrastructure is still =
guarded by
>> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP, but it also can be used by =
device
>> DAX. Introduce CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION as a common =
config
>=20
> CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION is a bit mouthful :)
>=20
> I think that dropping _SPARSEMEM won't hurt readability.

Yes, I'll simplify it in v4.

>=20
>> for the shared infrastructure.
>>=20
>> Select the new option from HUGETLB_PAGE_OPTIMIZE_VMEMMAP and from
>> DEV_DAX when the architecture opts in to DAX vmemmap optimization, =
and
>> use it to guard the generic sparse-vmemmap state and helpers.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Acked-by: Qi Zheng <qi.zheng@linux.dev>
>>=20
>> diff --git a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h =
b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
>> index bc3e549795c3f..5f8424eade2bd 100644
>> --- a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
>> +++ b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
>> @@ -11,7 +11,7 @@
>> #undef CONFIG_PGTABLE_LEVELS
>> #undef CONFIG_ILLEGAL_POINTER_VALUE
>> #undef CONFIG_SPARSEMEM_VMEMMAP
>> -#undef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> +#undef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
>> #undef CONFIG_NR_CPUS
>> #undef CONFIG_PARAVIRT_XXL
>>=20
>> diff --git a/drivers/dax/Kconfig b/drivers/dax/Kconfig
>> index 602f9a0839a91..6250954b0fa7a 100644
>> --- a/drivers/dax/Kconfig
>> +++ b/drivers/dax/Kconfig
>> @@ -8,6 +8,8 @@ if DAX
>> config DEV_DAX
>> tristate "Device DAX: direct access mapping device"
>> depends on TRANSPARENT_HUGEPAGE
>> + depends on ZONE_DEVICE
>> + select SPARSEMEM_VMEMMAP_OPTIMIZATION if =
ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
>> help
>>  Support raw access to differentiated (persistence, bandwidth,
>>  latency...) memory via an mmap(2) capable character
>> diff --git a/fs/Kconfig b/fs/Kconfig
>> index d1c210c6508f0..9b32ce79cc805 100644
>> --- a/fs/Kconfig
>> +++ b/fs/Kconfig
>> @@ -278,6 +278,7 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> def_bool HUGETLB_PAGE
>> depends on ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
>> depends on SPARSEMEM_VMEMMAP
>> + select SPARSEMEM_VMEMMAP_OPTIMIZATION
>>=20
>> config HUGETLB_PMD_PAGE_TABLE_SHARING
>> def_bool HUGETLB_PAGE
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index c49ef99b4413b..a2ebe87e76546 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -5175,6 +5175,9 @@ static inline bool =
__vmemmap_can_optimize(struct vmem_altmap *altmap,
>> unsigned long nr_pages;
>> unsigned long nr_vmemmap_pages;
>>=20
>> + if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
>> + return false;
>> +
>> if (!pgmap || !is_power_of_2(sizeof(struct page)))
>> return false;
>>=20
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index acd94cecc0d39..97511f651ebc0 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -102,9 +102,9 @@
>>  *
>>  * HVO which is only active if the size of struct page is a power of =
2.
>>  */
>> -#define MAX_FOLIO_VMEMMAP_ALIGN \
>> - (IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) && \
>> - is_power_of_2(sizeof(struct page)) ? \
>> +#define MAX_FOLIO_VMEMMAP_ALIGN \
>> + (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION) && \
>> + is_power_of_2(sizeof(struct page)) ? \
>> MAX_FOLIO_NR_PAGES * sizeof(struct page) : 0)
>>=20
>> /* The number of retained vmemmap pages with HVO enabled. */
>> @@ -116,7 +116,8 @@
>> #define __VMEMMAP_OPTIMIZATION_NR_ORDERS \
>> (MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
>> #define VMEMMAP_OPTIMIZATION_NR_ORDERS \
>> - (__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 ? =
__VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
>> + ((__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 && \
>> +  IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION)) ? =
__VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
>>=20
>> enum migratetype {
>> MIGRATE_UNMOVABLE,
>> @@ -1155,7 +1156,7 @@ struct zone {
>> /* Zone statistics */
>> atomic_long_t vm_stat[NR_VM_ZONE_STAT_ITEMS];
>> atomic_long_t vm_numa_event[NR_VM_NUMA_EVENT_ITEMS];
>> -#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> +#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
>> struct page *vmemmap_tails[VMEMMAP_OPTIMIZATION_NR_ORDERS];
>> #endif
>> } ____cacheline_internodealigned_in_smp;
>> @@ -2019,7 +2020,7 @@ struct mem_section {
>> unsigned long section_mem_map;
>>=20
>> struct mem_section_usage *usage;
>> -#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> +#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
>> /*
>> * Normally, sections hold regular (order-0) pages. However, for
>> * sections with HVO enabled, this tracks the compound page order
>> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
>> index 86dd0470da117..462e89e055485 100644
>> --- a/include/linux/page-flags.h
>> +++ b/include/linux/page-flags.h
>> @@ -208,14 +208,13 @@ enum pageflags {
>> static __always_inline bool compound_info_has_mask(void)
>> {
>> /*
>> - * Limit mask usage to HugeTLB vmemmap optimization (HVO) where it
>> - * makes a difference.
>> + * Limit mask usage to HVO where it makes a difference.
>> *
>> * The approach with mask would work in the wider set of conditions,
>> * but it requires validating that struct pages are naturally aligned
>> * for all orders up to the MAX_FOLIO_ORDER, which can be tricky.
>> */
>> - if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP))
>> + if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
>> return false;
>>=20
>> return is_power_of_2(sizeof(struct page));
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index bc7befafb47b5..c180d40cd6712 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -461,6 +461,10 @@ config SPARSEMEM_VMEMMAP
>>  pfn_to_page and page_to_pfn operations.  This is the most
>>  efficient option when sufficient kernel resources are available.
>>=20
>> +config SPARSEMEM_VMEMMAP_OPTIMIZATION
>> + bool
>> + depends on SPARSEMEM_VMEMMAP
>> +
>> #
>> # Select this config option from the architecture Kconfig, if it is =
preferred
>> # to enable the feature of HugeTLB/dev_dax vmemmap optimization.
>> diff --git a/mm/sparse.h b/mm/sparse.h
>> index d3a71ef4fad0f..3151d4db75753 100644
>> --- a/mm/sparse.h
>> +++ b/mm/sparse.h
>> @@ -10,7 +10,7 @@
>>=20
>> #include <linux/mmzone.h>
>>=20
>> -#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> +#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
>> static inline unsigned int section_compound_order(const struct =
mem_section *section)
>> {
>> return section->compound_page_order;
>> @@ -75,7 +75,7 @@ static inline bool vmemmap_optimizable_pfn(unsigned =
long pfn)
>>=20
>> static inline bool vmemmap_optimizable_order(unsigned int order)
>> {
>> - if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP))
>> + if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
>> return false;
>>=20
>> if (!is_power_of_2(sizeof(struct page)))
>=20
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thank you Mike.

>=20
> --=20
> Sincerely yours,
> Mike.
>=20

