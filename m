Received: from mta0.migadu.com (out-235.mta0.migadu.com [91.218.175.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649683DB620
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169778; cv=none; b=ZNleTjV2rNTe4Ckd+YSLGwzYw7Z7ePwwYql9Dv2n3Y/Y1DX4MAFH34gPozpqAI3VBb4kWBHES/lhTucq/3FhYCCfhq7bnrDiK3qSxK2z6EfpDXIUsTTB6TH36B2eQveT9yMHILUMziHtbMgjzTOAVUqy7wAnLfUigNqq58Vp3rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169778; c=relaxed/simple;
	bh=2tQ8kc8Ed0EXiv4AJfetOVW4cPn5i1WpwfCATVSfhG4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=SmRO5n6R0B5qM2LxLKu7yUWERCsd2tTybaBfCIAaouTxbJKwPknZm8z9JJ5Q+XDif1XO0c8ZUvUVqXXplKDPqHSqvcoXo1tFK+m5R4cbgmLD2diMJxn7+5OJl879kio2ZeeBf9Tw7NJ8TZoUI7DVnH2cYg4LKOyKlsoi9anr6bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nZTmAivR; arc=none smtp.client-ip=91.218.175.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nZTmAivR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2tQ8kc8Ed0EXiv4AJfetOVW4cPn5i1WpwfCATVSfhG4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788169774; v=1; x=1788774574;
 b=nZTmAivROI3QPvbKgW9/X3P9Pf+1p0Rev/SDbZe0poBfQAduPE1xFqHi8hAnzDmWV0REKtYQ
 k6o8dj/v6rzyZ973prNFiUjEYsSbFvLRpfM54hON91zkFfScvHr9rqsYKYKx7t12ii/NWXpIto6
 aDBNYfU9BdFsyEa7gBifzylg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id dc3f19ad1b3d1efa;
	Mon, 31 Aug 2026 09:49:34 +0000
X-Mizu-Trace-ID: dc3f19ad1b3d1efa
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH 01/11] mm/sparse-vmemmap: introduce
 CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <0e1c3bb8-49a4-479e-adb3-17c21261d409@linux.dev>
Date: Mon, 31 Aug 2026 17:49:16 +0800
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
 Mike Rapoport <rppt@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9BB960A5-E8C8-4094-BD28-87FE483AB680@linux.dev>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
 <20260831075342.57563-2-songmuchun@bytedance.com>
 <0e1c3bb8-49a4-479e-adb3-17c21261d409@linux.dev>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Aug 31, 2026, at 17:44, Qi Zheng <qi.zheng@linux.dev> wrote:
>=20
>=20
>=20
> On 8/31/26 3:53 PM, Muchun Song wrote:
>> The section-based vmemmap optimization infrastructure is still =
guarded by
>> CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP, but it also can be used by =
device
>> DAX. Introduce CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION as a common =
config
>> for the shared infrastructure.
>> Select the new option from HUGETLB_PAGE_OPTIMIZE_VMEMMAP and from
>> DEV_DAX when the architecture opts in to DAX vmemmap optimization, =
and
>> use it to guard the generic sparse-vmemmap state and helpers.
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>>  arch/x86/entry/vdso/vdso32/fake_32bit_build.h |  2 +-
>>  drivers/dax/Kconfig                           |  1 +
>>  fs/Kconfig                                    |  1 +
>>  include/linux/mm.h                            |  3 +++
>>  include/linux/mmzone.h                        | 13 +++++++------
>>  include/linux/page-flags.h                    |  5 ++---
>>  mm/Kconfig                                    |  3 +++
>>  mm/sparse.h                                   |  4 ++--
>>  8 files changed, 20 insertions(+), 12 deletions(-)
>> diff --git a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h =
b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
>> index bc3e549795c3..5f8424eade2b 100644
>> --- a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
>> +++ b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
>> @@ -11,7 +11,7 @@
>>  #undef CONFIG_PGTABLE_LEVELS
>>  #undef CONFIG_ILLEGAL_POINTER_VALUE
>>  #undef CONFIG_SPARSEMEM_VMEMMAP
>> -#undef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> +#undef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
>>  #undef CONFIG_NR_CPUS
>>  #undef CONFIG_PARAVIRT_XXL
>>  diff --git a/drivers/dax/Kconfig b/drivers/dax/Kconfig
>> index 602f9a0839a9..85ad4c135cdd 100644
>> --- a/drivers/dax/Kconfig
>> +++ b/drivers/dax/Kconfig
>> @@ -8,6 +8,7 @@ if DAX
>>  config DEV_DAX
>>   tristate "Device DAX: direct access mapping device"
>>   depends on TRANSPARENT_HUGEPAGE
>> + select SPARSEMEM_VMEMMAP_OPTIMIZATION if =
ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
>>   help
>>     Support raw access to differentiated (persistence, bandwidth,
>>     latency...) memory via an mmap(2) capable character
>> diff --git a/fs/Kconfig b/fs/Kconfig
>> index d1c210c6508f..9b32ce79cc80 100644
>> --- a/fs/Kconfig
>> +++ b/fs/Kconfig
>> @@ -278,6 +278,7 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>>   def_bool HUGETLB_PAGE
>>   depends on ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
>>   depends on SPARSEMEM_VMEMMAP
>> + select SPARSEMEM_VMEMMAP_OPTIMIZATION
>>    config HUGETLB_PMD_PAGE_TABLE_SHARING
>>   def_bool HUGETLB_PAGE
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index a9fbe26536f4..edadd7549b72 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -5188,6 +5188,9 @@ static inline bool =
__vmemmap_can_optimize(struct vmem_altmap *altmap,
>>   	unsigned long nr_pages;
>>   	unsigned long nr_vmemmap_pages;
>> + 	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
>> + 		return false;
>> +
>>   	if (!pgmap || !is_power_of_2(sizeof(struct page)))
>>   		return false;
>>  diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index c9ae7991a8b2..e9b54ea0eff0 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -102,9 +102,9 @@
>>   *
>>   * HVO which is only active if the size of struct page is a power of =
2.
>>   */
>> -#define MAX_FOLIO_VMEMMAP_ALIGN \
>> - 	(IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) && \
>> -  	is_power_of_2(sizeof(struct page)) ? \
>> +#define MAX_FOLIO_VMEMMAP_ALIGN \
>> + 	(IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION) && \
>> +  	is_power_of_2(sizeof(struct page)) ? \
>>    	MAX_FOLIO_NR_PAGES * sizeof(struct page) : 0)
>>    /* The number of retained vmemmap pages with HVO enabled. */
>> @@ -116,7 +116,8 @@
>>  #define __VMEMMAP_OPTIMIZATION_NR_ORDERS \
>>   (MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
>>  #define VMEMMAP_OPTIMIZATION_NR_ORDERS \
>> - 	(__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 ? =
__VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
>> + 	((__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 && \
>> +   	IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION)) ? =
__VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
>>    enum migratetype {
>>   MIGRATE_UNMOVABLE,
>> @@ -1155,7 +1156,7 @@ struct zone {
>>   	/* Zone statistics */
>>   	atomic_long_t vm_stat[NR_VM_ZONE_STAT_ITEMS];
>>   	atomic_long_t vm_numa_event[NR_VM_NUMA_EVENT_ITEMS];
>> -#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> +#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
>>   	struct page *vmemmap_tails[VMEMMAP_OPTIMIZATION_NR_ORDERS];
>>  #endif
>>  } ____cacheline_internodealigned_in_smp;
>> @@ -2019,7 +2020,7 @@ struct mem_section {
>>   	unsigned long section_mem_map;
>>     	struct mem_section_usage *usage;
>> -#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> +#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
>>   	/*
>>   	 * Normally, sections hold regular (order-0) pages. However, for
>>   	 * sections with HVO enabled, this tracks the compound page =
order
>> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
>> index ae2ebaed6d4d..de3c06062bc6 100644
>> --- a/include/linux/page-flags.h
>> +++ b/include/linux/page-flags.h
>> @@ -208,14 +208,13 @@ enum pageflags {
>>  static __always_inline bool compound_info_has_mask(void)
>>  {
>>   	/*
>> - 	 * Limit mask usage to HugeTLB vmemmap optimization (HVO) where =
it
>> - 	 * makes a difference.
>> + 	 * Limit mask usage to HVO where it makes a difference.
>>   	 *
>>   	 * The approach with mask would work in the wider set of =
conditions,
>>   	 * but it requires validating that struct pages are naturally =
aligned
>>   	 * for all orders up to the MAX_FOLIO_ORDER, which can be =
tricky.
>>   	 */
>> - 	if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP))
>> + 	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
>>   		return false;
>>     	return is_power_of_2(sizeof(struct page));
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index c1ddf59c0d71..b5f8372cd164 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -461,6 +461,9 @@ config SPARSEMEM_VMEMMAP
>>     pfn_to_page and page_to_pfn operations.  This is the most
>>     efficient option when sufficient kernel resources are available.
>>  +config SPARSEMEM_VMEMMAP_OPTIMIZATION
>> + bool
>=20
> As sashiko was concerned about [1], it seems we need to add
>=20
>        depends on SPARSEMEM_VMEMMAP
>=20
> here.

You are right. Besides that, we also need DEV_DAX to depend on
ZONE_DEVICE explicitly.

>=20
> Apart from that, LGTM. With this fix included:
>=20
> Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks.

>=20
> Thanks,
> Qi
>=20
> [1]. =
https://sashiko.dev/#/patchset/20260831075342.57563-1-songmuchun%40bytedan=
ce.com
>=20
>> +
>>  #
>>  # Select this config option from the architecture Kconfig, if it is =
preferred
>>  # to enable the feature of HugeTLB/dev_dax vmemmap optimization.
>> diff --git a/mm/sparse.h b/mm/sparse.h
>> index 049272aba84e..b408d15baf7b 100644
>> --- a/mm/sparse.h
>> +++ b/mm/sparse.h
>> @@ -10,7 +10,7 @@
>>    #include <linux/mmzone.h>
>>  -#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> +#ifdef CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION
>>  static inline unsigned int section_order(const struct mem_section =
*section)
>>  {
>>   	return section->order;
>> @@ -72,7 +72,7 @@ static inline bool vmemmap_optimizable_pfn(unsigned =
long pfn)
>>    static inline bool vmemmap_optimizable_order(unsigned int order)
>>  {
>> - 	if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP))
>> + 	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP_OPTIMIZATION))
>>   		return false;
>>     	if (!is_power_of_2(sizeof(struct page)))


