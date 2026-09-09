Received: from mta1.migadu.com (out-164.mta1.migadu.com [95.215.58.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E6055198A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956985; cv=none; b=UwwYPwm+Jq9d8/T81QEYkvCENMnXgr55KVFSP0AZHbxX3V0qvM7ZVUbWAO25pmkNhqTn9DBx56P6rMr3DysREBdnzJykVDmLbl8J+hwqxA7suiNDLjYg2/eUuEjEpbNo4jQlOxLTIrMYLtZ8ItJskEamutSHeBD0CHrni5cENDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956985; c=relaxed/simple;
	bh=+c1G5fdvgYFobZQK+AOg+Lekv53bc0i4dzKelbiKc0s=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jiyRjGtlLBM44EvZTsNRfEHhDJB5KtanjJkTlPubfA7iFks1VXCZEzLnI/ILT3JuA97ssG2KpNMJNaAC+abEpXLeInLXkHmMcZx/yMXgHjoOmULUK2GWN8MGgt4gvTWC4XZ2WiQnUtyslkL3UWPU6HJc7lslw5qvEr+1/IUiUtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Sihn6XTZ; arc=none smtp.client-ip=95.215.58.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Sihn6XTZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+c1G5fdvgYFobZQK+AOg+Lekv53bc0i4dzKelbiKc0s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788956980; v=1; x=1789561780;
 b=Sihn6XTZQrxBYZ+N1YaX4N3H9SEuYBt/W4h0c+QSqJ+FUd4gbH7MyxSFDFQoNUEwGOwj65lN
 CbDrQrdtUi/EgPGnGhSlmLZslQ+nbM+dPmiybFUQUrxaQKhI4yd4aeld4HY+MxhI5I3md51T1QT
 wPmYbmEuI1p1tsP2A2EZp+W8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 82dccf2517e47cd1;
	Wed, 09 Sep 2026 12:29:40 +0000
X-Mizu-Trace-ID: 82dccf2517e47cd1
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v5 09/17] mm/sparse: initialize memory sections earlier
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <a2016390-28ce-4199-a063-d2e9101dacab@kernel.org>
Date: Wed, 9 Sep 2026 20:29:23 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 Michal Hocko <mhocko@suse.com>,
 David Laight <david.laight.linux@gmail.com>,
 "Liam R . Howlett" <liam@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E54037CE-6CE6-41AB-A525-8BDCE55996AC@linux.dev>
References: <20260825084608.47437-1-songmuchun@bytedance.com>
 <20260825084608.47437-10-songmuchun@bytedance.com>
 <a2016390-28ce-4199-a063-d2e9101dacab@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 9, 2026, at 17:56, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 8/25/26 10:46, Muchun Song wrote:
>> Upcoming HugeTLB bootmem changes need sparsemem section metadata =
before
>> the HugeTLB bootmem allocation path runs. The memory sections are
>> initialized from sparse_init(), which is called too late for that =
setup.
>>=20
>> Move the code that initializes sparsemem section metadata for =
memblock
>> ranges into mm_core_init_early(), before free_area_init() and the =
HugeTLB
>> bootmem setup. Rename the helper to sparse_sections_init() so the new
>> caller describes the sparsemem-specific initialization step.
>>=20
>> This is a preparatory change.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> ---
>> v5:
>> - Collect Reviewed-by from Mike Rapoport
>>=20
>> v2:
>> - Rename the helper to sparse_sections_init() to describe the section
>>  metadata initialization (suggested by Mike Rapoport)
>> - Fix the !SPARSEMEM stub name so SPARSEMEM=3Dn builds compile
>>  (reported by Sashiko)
>> ---
>> mm/mm_init.c |  1 +
>> mm/sparse.c  | 10 ++--------
>> mm/sparse.h  |  2 ++
>> 3 files changed, 5 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>> index 0317fb781e77..e2a16d833635 100644
>> --- a/mm/mm_init.c
>> +++ b/mm/mm_init.c
>> @@ -2642,6 +2642,7 @@ void __init mm_core_init_early(void)
>> {
>> 	kho_memory_init_early();
>>=20
>> + 	sparse_sections_init();
>> 	free_area_init();
>>=20
>> hugetlb_cma_reserve();
>> diff --git a/mm/sparse.c b/mm/sparse.c
>> index e6cb67ca9c8d..439802e6a6ad 100644
>> --- a/mm/sparse.c
>> +++ b/mm/sparse.c
>> @@ -191,12 +191,8 @@ static void __init memory_present(int nid, =
unsigned long start, unsigned long en
>> }
>> }
>>=20
>> -/*
>> - * Mark all memblocks as present using memory_present().
>> - * This is a convenience function that is useful to mark all of the =
systems
>> - * memory as present during initialization.
>> - */
>> -static void __init memblocks_present(void)
>> +/* Initialize memory section metadata for all system memory. */
>=20
> I'd drop this comment, it's not entirely accurate. A lot more =
initialization of
> the sections happens later.

I can drop this line comment.

>=20
> What this function mostly does is
>=20
> (a) Allocate sparse-exteme metadata
> (b) Temporarily store the nid and mark the section for being present =
and online

Yes.

>=20
> I have patches to get rid of __section_mark_present() and just set =
them all to
> SECTION_IS_EARLY|SECTION_IS_ONLINE such that we can just iterate early =
sections
> and get rid of that PRESENT monstrosity.
>=20
> Apart from that LGTM, even though I don't particularly enjoy splitting =
us now
> having two init entry points
>=20
> sparse_init

Maybe this one should be sparse_memmap_init? If yes, it could be another =
separate
cleanup patch.

Thanks,
Muchun

>=20
> and
>=20
> sparse_sections_init
>=20
>=20
> Where it's rather unclear from the name what is actually happening.
>=20
> --=20
> Cheers,
>=20
> David


