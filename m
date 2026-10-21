Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792560986;
	b=tjZSAKcxIZZpGTHJqt8CPUDKgm7U6Bk5zoOm/m7xYs+cGQAZvJrgebXbGICzaKMZsL1/
	 ST0pRoioXZbxC1g9DUbhbVpA2VF5LTWjoO2+QnsU6XbgEkIarPl2KYX6KtmWROsD5cTnb
	 lteoo8fgLXpqgm6O/d7z1NXhBroKN63YR12uCDwADo0sJhEsFy/cw47HR1hEx/tVmIHoS
	 58ORIE/9fqFx+dfmox3xhXhSjj5JEfrKIr5o7r1hdcLECmU2R4g9F+DXuVdZxxXGW8CBs
	 lrwMMEQuY0YeRTs0MfVDOyJT422FzQlkc3laMgPmZZkeOzTm9/WMDOnNYKdwSVrPQ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560986;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=o3QDH4GHZKZklfz0YvP98XXlcOQ9C0e/UzN3/wc5PoU=;
	b=uJ9zu/maywBrUaXoTNJyTWlNK0MVWGtisRqbm/y4F7mtlIPnp5aCQ/qP0dnGdvdS0Frj
	 g0mmy/GexPhzMPMkTnqs3Pd63X6cvQDS9RByFtdhN9V7Jb+Cic94ZLolm5P1q6UlsljPs
	 AQpz4Rptoza6j6PZ+Xqw9kEY+mhQ7ECTFAmbRGeoi1PV2TrzkXA795Lh+vBV8MYGMlSrB
	 SLmZjpo+sLUBkjj8prM5yU2g6cHoIpD+2FXSCygbRKk3H/qCg4CNZjRe8NjVfJtdBrRgc
	 5389wbuR1xB1blxI59NO1yL1HRz9r2HH/onG/81nEuIQi2dVymS50M4rlVIvd7Z9oBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=luoyeHPH;
	arc=none smtp.remote-ip=91.218.175.97
Received: from mta0.migadu.com (out-97.mta0.migadu.com [91.218.175.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB56606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADB56606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=luoyeHPH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WRus9dGBDYjUeT/LwFm/stq6NmRjNXUQhGme5JxIkOY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792560982; v=1; x=1793165782;
 b=luoyeHPH6x3yhOyE2QrOEiKTsuLBH2bb4PQiEdYqtGEvh0MnnaAj9tJrZ1HAb9qYsR/qASIa
 5/u3IENo3j1lgFPUZgjyzZXsf8dzM+USSkRXGxSHBywXQcifyHvlfirzE0YNM/BfclNUKNi3lAs
 zpgrmirXOdkoONjWDJweCQ/k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3d92309cb2c66050;
	Wed, 21 Oct 2026 05:36:22 +0000
X-Mizu-Trace-ID: 3d92309cb2c66050
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
Subject: Re: [PATCH 1/4] mm/sparse-vmemmap: map shared vmemmap tail pages as
 read-only
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261021045744.93554-1-lance.yang@linux.dev>
Date: Wed, 21 Oct 2026 13:36:00 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 akpm@linux-foundation.org,
 david@kernel.org,
 osalvador@suse.de,
 maddy@linux.ibm.com,
 corbet@lwn.net,
 ljs@kernel.org,
 liam@infradead.org,
 vbabka@kernel.org,
 rppt@kernel.org,
 surenb@google.com,
 mhocko@suse.com,
 mpe@ellerman.id.au,
 npiggin@gmail.com,
 chleroy@kernel.org,
 ritesh.list@gmail.com,
 sshegde@linux.ibm.com,
 skhan@linuxfoundation.org,
 rdunlap@infradead.org,
 qi.zheng@linux.dev,
 linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F19AE41A-8150-4444-B18D-824BB0CECB82@linux.dev>
References: <20261019090830.1917657-2-songmuchun@bytedance.com>
 <20261021045744.93554-1-lance.yang@linux.dev>
To: Lance Yang <lance.yang@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 21, 2026, at 12:57, Lance Yang <lance.yang@linux.dev> wrote:
>=20
>=20
> On Mon, Oct 19, 2026 at 05:08:27PM +0800, Muchun Song wrote:
>> Both early HugeTLB HVO and device DAX use the common vmemmap =
population
>> path for shared tail mappings. Map these pages read-only so that =
illegal
>> writes fault instead of corrupting metadata shared by multiple tail
>> pages.
>>=20
>> For early HugeTLB, this moves existing write protection into initial
>> population without changing the final mapping. Device DAX gains the =
same
>> protection.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> Documentation/mm/vmemmap_dedup.rst | 3 +--
>> mm/sparse-vmemmap.c                | 3 +++
>> 2 files changed, 4 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/mm/vmemmap_dedup.rst =
b/Documentation/mm/vmemmap_dedup.rst
>> index 8c287ae3f86c..76f903975a40 100644
>> --- a/Documentation/mm/vmemmap_dedup.rst
>> +++ b/Documentation/mm/vmemmap_dedup.rst
>> @@ -193,5 +193,4 @@ There's no remapping of vmemmap given that =
device-dax memory is not part of
>> System RAM ranges initialized at boot. Thus the tail page =
deduplication
>> happens at a later stage when we populate the sections.
>>=20
>> -Deduplicated tail pages are not mapped read-only. The mapping layout =
is the same
>> -as HugeTLB.
>> +The mapping layout is the same as HugeTLB.
>> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
>> index 40eba70c0048..ba0496daf4de 100644
>> --- a/mm/sparse-vmemmap.c
>> +++ b/mm/sparse-vmemmap.c
>> @@ -295,6 +295,9 @@ static pte_t * __meminit =
vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
>> return NULL;
>>=20
>> 	entry =3D pfn_pte(PHYS_PFN(__pa(p)), PAGE_KERNEL);
>> + 	/* Map the shared tail page as read-only to catch illegal =
writes. */
>> + 	if (vmemmap_optimizable_pfn(pfn))
>> + 		entry =3D pte_wrprotect(entry);
>=20
> LLM pointed out that an AO MCE before bootmem gather could still reach
> TestSetPageHWPoison() on a shared tail, since the head isn't marked
> hugetlb yet.

Compared with the RO problem, a more serious issue may be
that the struct page has not yet been initialized, and the
MCE preprocessing flow may all be problematic, performing
various operations based on an uninitialized struct page.
However, this problem is not specific to hugetlb; the same
problem exists when CONFIG_DEFERRED_STRUCT_PAGE_INIT is
enabled.

>=20
> Wouldn't that trigger an Oops ... Anyway, I wouldn't expect to hit =
that
> during boot.

Therefore, I do not think this kind of problem during the boot
stage is a problem, because we have no way to prevent it.

>=20
> Reviewed-by: Lance Yang <lance.yang@linux.dev>

THanks.

>=20
> [...]
>=20
> Cheers, Lance


