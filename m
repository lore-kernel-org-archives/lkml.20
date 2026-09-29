Received: from mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C423AE6FC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668870; cv=none; b=Afegyd609kSJCESORhPld1bs1RSPuP+bM1Z3XL0/LgJlJyWRGXSemRiziPxyfSTk3XGcm9kx5t0NDpS1hupefDfkIEuDpeFn/AxzIo2RqMLNZRFj6/v7QdpCBNEOf8XtvQz9uLMJpgyF8nur2gz/14kkolfMtjK1UARcvs/9kUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668870; c=relaxed/simple;
	bh=MD9qZpr2p5t9FhYsovu1Jono6fdj3Cfdqpkd+cOqNz0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=t5izDbi3zCNJGWGCVSO2GAlQct4mxesOgygyxJqJftkqp6EMk77ewZSDhjLcBHgiTynoPusSEje/APy/X/gNmnZwilSQ0/goo5nC0n3d9JQ1mHoBVmQTen7aJD832B9g0DdnMC+j15luLNSTiPuTwKbpdY6uT0auWfFUKRMq+us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uwkw+xlU; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uwkw+xlU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MD9qZpr2p5t9FhYsovu1Jono6fdj3Cfdqpkd+cOqNz0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790668865; v=1; x=1791273665;
 b=uwkw+xlUVWQ2sgOn7jzpFAYwfkWbYfy9enm1gQfMh/5pjq0Y2gGxrAEBUOZbR6KXKrOaGHf9
 jARK7fAnWoUsdM9iJWvFgzFlHRoRzy+qHJoPHLtLiMC+hA3B84hOq1ifN0p/NTLmZQZJh2Jyutn
 mSUiU9tHWXM8ddBhVjGxZmjk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 737886a2c9b58270;
	Tue, 29 Sep 2026 08:01:05 +0000
X-Mizu-Trace-ID: 737886a2c9b58270
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v5 02/12] mm/sparse-vmemmap: allocate shared tail page
 array dynamically
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <36a93f95-2fb4-4310-bef2-88c12dbe7971@kernel.org>
Date: Tue, 29 Sep 2026 16:00:42 +0800
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
Message-Id: <78618F09-296E-4632-A890-53351739024D@linux.dev>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
 <20260927025441.741633-3-songmuchun@bytedance.com>
 <36a93f95-2fb4-4310-bef2-88c12dbe7971@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)



> On Sep 29, 2026, at 15:21, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 9/27/26 04:54, Muchun Song wrote:
>> Commit 622026e87c40 ("mm/hugetlb: remove fake head pages") added the
>> per-zone vmemmap_tails array. Its size depends on MAX_FOLIO_ORDER, =
which
>> had been moved to mmzone.h in preparation for the array.
>>=20
>> PUD_ORDER is defined by linux/pgtable.h, which cannot be included =
from
>> mmzone.h without creating an include cycle. It was therefore =
open-coded
>> as PUD_SHIFT - PAGE_SHIFT.
>>=20
>> This removed the dependency on PUD_ORDER, but not the underlying
>> dependency on architecture page-table definitions. PUD_SHIFT is
>> generally provided by architecture page-table headers, which are not
>> guaranteed to have been included when mmzone.h is parsed.
>>=20
>> The dependency remained hidden because vmemmap_tails was originally
>> guarded by CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP. Under that =
condition,
>> MAX_FOLIO_ORDER resolves to either MAX_PAGE_ORDER or the fixed =
HugeTLB
>> limit, rather than the PUD_SHIFT-based definition.
>>=20
>> Device DAX, however, does not require CONFIG_HUGETLB_PAGE. When it is
>> converted to use section-based vmemmap optimization, MAX_FOLIO_ORDER =
can
>> resolve to PUD_SHIFT - PAGE_SHIFT while it is being used to size
>> vmemmap_tails. This would make struct zone depend on architecture
>> page-table definitions being available when mmzone.h is parsed.
>>=20
>> Replace the embedded array with a pointer and allocate it on first =
use.
>> This moves the order-count evaluation into sparse-vmemmap.c, after =
the
>> architecture page-table definitions are available, and removes the
>> dependency from mmzone.h.
>>=20
>> Removing the compile-time array also removes the original reason for
>> keeping MAX_FOLIO_ORDER and the vmemmap optimization sizing =
definitions
>> in mmzone.h. Follow-up cleanups can place each definition in the =
header
>> owned by its respective subsystem.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> v5:
>> - Add this patch to fix the RISC-V build failure under the =
configuration
>>  reported by the kernel test robot
>> ---
>> include/linux/mmzone.h |  7 +------
>> mm/sparse-vmemmap.c    | 35 +++++++++++++++++++++++++++++++----
>> 2 files changed, 32 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index acd94cecc0d3..68807ff7f946 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -113,11 +113,6 @@
>> (VMEMMAP_OPTIMIZATION_PAGES * PAGE_SIZE / sizeof(struct page))
>> #define VMEMMAP_OPTIMIZATION_MIN_ORDER =
(ilog2(VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) + 1)
>>=20
>> -#define __VMEMMAP_OPTIMIZATION_NR_ORDERS \
>> - 	(MAX_FOLIO_ORDER - VMEMMAP_OPTIMIZATION_MIN_ORDER + 1)
>> -#define VMEMMAP_OPTIMIZATION_NR_ORDERS \
>> - 	(__VMEMMAP_OPTIMIZATION_NR_ORDERS > 0 ? =
__VMEMMAP_OPTIMIZATION_NR_ORDERS : 0)
>> -
>> enum migratetype {
>> MIGRATE_UNMOVABLE,
>> MIGRATE_MOVABLE,
>> @@ -1156,7 +1151,7 @@ struct zone {
>> atomic_long_t vm_stat[NR_VM_ZONE_STAT_ITEMS];
>> atomic_long_t vm_numa_event[NR_VM_NUMA_EVENT_ITEMS];
>> #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>> - 	struct page *vmemmap_tails[VMEMMAP_OPTIMIZATION_NR_ORDERS];
>> + 	struct page **vmemmap_tails;
>> #endif
>> } ____cacheline_internodealigned_in_smp;
>>=20
>=20
>=20
> [...]
>=20
>> struct page __ref *vmemmap_shared_tail_page(unsigned int order, =
struct zone *zone)
>> {
>> 	void *addr;
>> - 	struct page *page;
>> + 	struct page *page, **pages;
>> 	const unsigned int idx =3D order - =
VMEMMAP_OPTIMIZATION_MIN_ORDER;
>>=20
>> 	 (WARN_ON_ONCE(idx >=3D VMEMMAP_OPTIMIZATION_NR_ORDERS))
>> 		return NULL;
>>=20
>> - 	page =3D READ_ONCE(zone->vmemmap_tails[idx]);
>> + 	pages =3D READ_ONCE(zone->vmemmap_tails) ? : =
vmemmap_tails_alloc(zone);
>=20
> This reads much nicer if you handle the  =
READ_ONCE(zone->vmemmap_tails) inside
> the function.
>=20
> pages =3D vmemmap_tails(zone);

Sounds good.

>=20
> So just place the entire logic of obtaining the array in there.

No problem.

Thanks,
Muchun

>=20
>=20
> Apart from that LGTM.
>=20
> --=20
> Cheers,
>=20
> David


