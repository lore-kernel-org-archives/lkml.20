Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793516194;
	b=zBmbieBbC4Av9nVlS9gRBy18jSjPfAepHFnoRBxjqYZl7LeiuzY/y+dHOHI1Mrbxx1Qc
	 gFCdUuLMjkBTEgPIPz/APQFT0PGh+BQNwU3O99/Vg8Lai4FOThgSgRx47c8T8YbPaPSDo
	 32mBPPaw5hY4TSlgTFWlly9xK1VEK7ki0gLgQlr4IgFdmwnc9xe6erBjXaWvu5NUBJlho
	 rGANQbiaG/TvtwhfKqjRFMMDGout6PHv2/Z5en9yTgCgD/MjClkrRAn8QfHhKAzumOqBQ
	 yqUkRsm6XTkSJEMcRG/f7ADn/DO1nNotMp9akhrN2BbR96oRU82LDIx9TdMK3AVLabA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793516194;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=v4B3Z+vyjFOZ3NXznu3UfBs3xYEdHpd7Ad18VpZadd8=;
	b=Fwc97SExDi84WdMAhPjl0Nfawucu8ostCAr7/0J12B4oCOZFIGAYTmHld4R5KUrXnt0A
	 Sc/4Q6lxZ/sJaURCx/pqaz3bwC1gh/DZ1AlhsE3K19OTNSrAlfJoCnaW3YQsXuKRbwo1m
	 c9bY4xYN0uNKJHZiKe9jYawQgcDziUzxCILehXnoEqTODbIiG4kjlHwL3+cbq6WCuqh5Z
	 2WlqE0KgSvPdlsr2aDlIhJW2f3oBC9DJ3XJkLZgVCqr+apHM+dAx5LgVxOhq/qorVA+Yo
	 I23fE+eLS98jrUu0Oamey4UPYBpDKOhCK9/U72Dsyk5hQVh41wh15z01zouoRdPCShQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ida8RXck;
	arc=none smtp.remote-ip=95.215.58.232
Received: from mta1.migadu.com (out-232.mta1.migadu.com [95.215.58.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EDA606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45EDA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ida8RXck
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZcO999B06qC4lUge9AN7c8raiSfFZnUwVxvBJv+yD9A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793516191; v=1; x=1794120991;
 b=Ida8RXcklakI58X5J5aWwWR3xSschDfni6YJ2+mEMKDUt/9qPBeXoYw7VCfe4nlSngI9KVbf
 mPaihqGsN01rwX7Rnq25/qST/RzSaTQKY6Ge/WGFqxUG5QN4ZSrlnBFESMUkO6MWYH/PNzI8yOa
 CMnMLO1bzHo7OVDoUA33ey14=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 12acc32e1bb7e80e;
	Sun, 01 Nov 2026 06:56:31 +0000
X-Mizu-Trace-ID: 12acc32e1bb7e80e
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 02/12] mm: hugetlb_vmemmap: unify
 VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <86d9a986-58ea-44f5-a8af-514abff12c2a@linux.dev>
Date: Sun, 1 Nov 2026 14:56:15 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>,
 David Hildenbrand <david@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <99503D05-0C4D-45E4-B5D6-EDD927838935@linux.dev>
References: <20261020115306.813483-1-songmuchun@bytedance.com>
 <20261020115824.823278-1-songmuchun@bytedance.com>
 <86d9a986-58ea-44f5-a8af-514abff12c2a@linux.dev>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Nov 1, 2026, at 14:22, Qi Zheng <qi.zheng@linux.dev> wrote:
>=20
>=20
>=20
> On 10/20/26 7:58 PM, Muchun Song wrote:
>> VMEMMAP_SPLIT_NO_TLB_FLUSH and VMEMMAP_REMAP_NO_TLB_FLUSH do not
>> describe fully independent choices. A split-only walk can defer the
>> PMD-split flush to a later global flush, and a remap-only walk can
>> defer the final remap flush. However, when a PMD split is followed
>> by PTE remapping, the split flush must happen before the PTEs are
>> changed, because stale large-page translations must not overlap with
>> new small-page translations that map different physical pages.
>> Replace the two flags with a single VMEMMAP_REMAP_NO_TLB_FLUSH flag.
>> Keep split-only walks able to defer the flush, but force the split
>> flush whenever a remap_pte callback is present. Callers that batch
>> HVO work can still defer the final remap flush and issue their own
>> global flush.
>> Current callers keep the same flushing behavior.
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>>  mm/hugetlb_vmemmap.c | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)
>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>> index 1105aa925acc..8b3abb562599 100644
>> --- a/mm/hugetlb_vmemmap.c
>> +++ b/mm/hugetlb_vmemmap.c
>> @@ -42,10 +42,8 @@ struct vmemmap_remap_walk {
>>  	struct list_head	*vmemmap_pages;
>>    -/* Skip the TLB flush when we split the PMD */
>> -#define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
>> -/* Skip the TLB flush when we remap the PTE */
>> -#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(1)
>> +/* Skip the TLB flush while updating the vmemmap page tables. */
>> +#define VMEMMAP_REMAP_NO_TLB_FLUSH	BIT(0)
>=20
> Since this flag is now also used by the split-only path, the
> VMEMMAP_REMAP_NO_TLB_FLUSH name is somewhat misleading. Moreover, the
> flag does not suppress every TLB flush, as the PMD-split flush is =
still
> mandatory when remapping follows.

Yeah, good point.

>=20
> Would VMEMMAP_DEFER_TLB_FLUSH better describe its semantics? It

I think so.

> indicates that flushes which can be safely batched are deferred, =
without
> implying that all TLB flushes are skipped.

I'll change it along side with the comment to:

  /* Defer safely batchable TLB flushes to the caller. */
  #define VMEMMAP_DEFER_TLB_FLUSH       BIT(0)

Thanks.

>=20
> Thanks,
> Qi
>=20
>>  	unsigned long		flags;
>>  };
>>  @@ -85,7 +83,12 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct =
page *head, unsigned long start,
>>  		/* Make pte visible before pmd. See comment in =
pmd_install(). */
>>  		smp_wmb();
>>  		pmd_populate_kernel(&init_mm, pmd, pgtable);
>> -		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
>> +		/*
>> +		 * Modern MMUs allow overlapping TLB entries with =
different mapping
>> +		 * granularities only if they map the same physical =
address. So
>> +		 * remapping must not proceed without first flushing the =
TLB.
>> +		 */
>> +		if (walk->remap_pte || !(walk->flags & =
VMEMMAP_REMAP_NO_TLB_FLUSH))
>>  			flush_tlb_kernel_range(start, start + PMD_SIZE);
>>  	} else {
>>  		pte_free_kernel(&init_mm, pgtable);
>> @@ -272,7 +275,7 @@ static int vmemmap_remap_split(unsigned long =
start, unsigned long end)
>>  {
>>  	struct vmemmap_remap_walk walk =3D {
>>  		.remap_pte	=3D NULL,
>> -		.flags		=3D VMEMMAP_SPLIT_NO_TLB_FLUSH,
>> +		.flags		=3D VMEMMAP_REMAP_NO_TLB_FLUSH,
>>  	};
>>    	return vmemmap_remap_range(start, end, &walk);
>=20

