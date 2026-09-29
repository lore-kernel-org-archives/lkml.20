Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6B423EA83
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669122; cv=none; b=m9nnWphCrFc10evrItmSwxUMj+50hKpdAEASifYQG0PJ4Dfg4+CXkdVnv+izcYJQ3Lf0Mlcupiuyesn8Wcoc1I6LfiV9H7wUZTxAVsTuUCaD9/bz7kgQLL3PKV8UpzYwvs9h4uKgFpBo646qE19HyoWyA1ob4Hi7OzaiDogs2FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669122; c=relaxed/simple;
	bh=Cu3PmaM4+usDuxduqOqsYpNfFf0tzadb722O33EBlFs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lt6eLhg4cx12j8o3f4G52AHDPedHRG/imAXYpAoOLh4l68tWils3pJOAoyihoWQPjUnDRXbhmd3YZMvpLcXZY4HEpXAxYOahGsCqRYf5RdL/4iRDpsG020SCHpv8O5NJ1YZphtUCfpPnkQsjXIeQL96/0ZpM/mMpZs+OdB/Ik1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pEiS4CAq; arc=none smtp.client-ip=91.218.175.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pEiS4CAq"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Cu3PmaM4+usDuxduqOqsYpNfFf0tzadb722O33EBlFs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790669116; v=1; x=1791273916;
 b=pEiS4CAqRhKAXEpY5GJeEoHPtjNXppUWTKZwpVgTWqQ+f4ccdJlJfOyFFbl7qcspQgQYvred
 qxzvHh8eshC1Cub/8Sh0lCirl+W64+dUIFIAdhMiecoIM31bOfsoVsxfuW9wCpTXUrJHdBJD2Ld
 SKgcBOqqFQ1YRoheW1caIrrA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id dcefedb6d7c8165b;
	Tue, 29 Sep 2026 08:05:14 +0000
X-Mizu-Trace-ID: dcefedb6d7c8165b
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v5 05/12] mm/sparse-vmemmap: prepare DAX vmemmap
 population for compound page orders
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <deecea10-589f-4e2c-9c17-5e5dd4e81250@kernel.org>
Date: Tue, 29 Sep 2026 16:04:55 +0800
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
Message-Id: <77523FDF-D7CC-4B79-AF35-DF2E6673F0A1@linux.dev>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
 <20260927025441.741633-6-songmuchun@bytedance.com>
 <deecea10-589f-4e2c-9c17-5e5dd4e81250@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 29, 2026, at 15:24, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 9/27/26 04:54, Muchun Song wrote:
>> Device DAX still uses vmemmap_populate_compound_pages() to populate =
its
>> compound-page vmemmap mappings. That helper allocates the head and =
first
>> tail vmemmap pages explicitly, then reuses the first tail page for =
the
>> remaining tail page mappings.
>>=20
>> Device DAX is being moved to the section-based vmemmap optimization
>> infrastructure, but it cannot switch to the generic section-based
>> population path yet. Once a later patch records the DAX compound page
>> order in section metadata, DAX head and first-tail PFNs can look
>> optimizable to the generic helpers as well.
>>=20
>> Add a DAX-specific population flag for this transition. It keeps DAX
>=20
> Well, you're not adding flag, your reusing an existing one and =
renaming it?
>=20
> And then you're specifying it on more paths.

You're right. The commit message need to be more precise.

>=20
> [...]
>=20
>> mm/sparse-vmemmap.c | 27 +++++++++++++++------------
>> 1 file changed, 15 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
>> index e4dae98ba7f8..2457ea2c6dca 100644
>> --- a/mm/sparse-vmemmap.c
>> +++ b/mm/sparse-vmemmap.c
>> @@ -35,8 +35,8 @@
>> /*
>>  * Flags for vmemmap_populate_range and friends.
>>  */
>> -/* Get a ref on the head page struct page, for ZONE_DEVICE compound =
pages */
>> -#define VMEMMAP_POPULATE_PAGEREF 0x0001
>> +/* Vmemmap population for ZONE_DEVICE compound pages */
>> +#define VMEMMAP_POPULATE_DAX 0x0001
>=20
> Cleaner.
>=20
>>=20
>> #include "internal.h"
>> #include "mm_init.h"
>> @@ -243,13 +243,17 @@ static inline struct page =
*vmemmap_shared_tail_page(unsigned int order,
>> #endif
>>=20
>> static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
>> -  			struct vmem_altmap *altmap)
>> + 			struct vmem_altmap *altmap, unsigned long flags)
>> {
>> 	struct zone *zone;
>> 	struct page *page;
>> 	const unsigned int order =3D pfn_to_section_compound_order(pfn);
>>=20
>> - 	if (!vmemmap_optimizable_pfn(pfn))
>> + 	/*
>> + 	 * Device DAX still relies on vmemmap_populate_compound_pages() =
for
>> + 	 * head/first-tail allocation and tail-page reuse.
>> +	 */
>> + 	if (!vmemmap_optimizable_pfn(pfn) || flags & =
VMEMMAP_POPULATE_DAX)
>> 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
>>=20
>> zone =3D pfn_to_zone(pfn, node);
>> @@ -271,7 +275,7 @@ static pte_t * __meminit =
vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
>> 		pte_t entry;
>>=20
>> 		if (ptpfn =3D=3D (unsigned long)-1) {
>> - 			void *p =3D vmemmap_alloc_pte(pfn, node, =
altmap);
>> + 			void *p =3D vmemmap_alloc_pte(pfn, node, altmap, =
flags);
>>=20
>> 		if (!p)
>> 			return NULL;
>> @@ -286,7 +290,7 @@ static pte_t * __meminit =
vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
>> 			 * and through vmemmap_populate_compound_pages() =
when
>> 			 * slab is available.
>>  			 */
>> - 			if (flags & VMEMMAP_POPULATE_PAGEREF)
>> + 			if (flags & VMEMMAP_POPULATE_DAX)
>> 				get_page(pfn_to_page(ptpfn));
>> 		}
>> 		entry =3D pfn_pte(ptpfn, PAGE_KERNEL);
>> @@ -546,6 +550,7 @@ static int __meminit =
vmemmap_populate_compound_pages(unsigned long start_pfn,
>> 	unsigned long size, addr;
>> 	pte_t *pte;
>> 	int rc;
>> + 	unsigned long flags =3D VMEMMAP_POPULATE_DAX;
>=20
> const and at the top?

No problem.

Thanks,
Muchun

>=20
> --=20
> Cheers,
>=20
> David


