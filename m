Received: from mta0.migadu.com (out-97.mta0.migadu.com [91.218.175.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0184B463B66
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293580; cv=none; b=M5uyWe+EhSToOc4vuDdhtG7iD0HoKKEUMNIHtjtDIbTdEA6+fhyDdhFVEuknnRFQ9t6KSOESCa/9khaUdosI4iexgFOExGzqFUwoKt7wIyJlKzaKWgc1xTYiJG0MJYuvbTYiFYeImyczF0B331yJMW5XAlWbBdsTXFmsgwj98AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293580; c=relaxed/simple;
	bh=smNz1eVU0GPZ0bGB5TxQ5+zWKlDqUlqFk7rJBl1+TLI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MOrKYKWO+FRAQRBNbyq2NXl3tagM2vlrDDnK/eOv3h5a6wKItZoRCfHVlGM3bN8MrEnAs5KiX4UMBkGuHlCqzN0J3nel/OTPJFVbuyb1ifanRuaOVTWANNkrCVxnVZmnow2W03WGdEqwGWKsF4c7sxA68LkjK+E9hwEjz3arD3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Jekc39bp; arc=none smtp.client-ip=91.218.175.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Jekc39bp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=smNz1eVU0GPZ0bGB5TxQ5+zWKlDqUlqFk7rJBl1+TLI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791293575; v=1; x=1791898375;
 b=Jekc39bpI+ioS9+/6w+urByOeYORvH5fCIWg9NHDTuHFtSIJ4zHHA8DJ8fSensly7uHX/HR/
 107fIDjvmzrDpMlAjWnOOfZClu0j0s7hC1Mj6DPm/mAmZBfuONGQURZ+fMeBqUKxRJL59z83wPU
 Jq8nzS/PSiEN8JYwtO+Vjud0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 72132319fdfc02e7;
	Tue, 06 Oct 2026 13:32:55 +0000
X-Mizu-Trace-ID: 72132319fdfc02e7
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v3 6/6] mm/mm_init: add zone mismatch warning during page
 init
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <asTS6OtxPMVshuIO@kernel.org>
Date: Tue, 6 Oct 2026 15:32:43 +0200
Cc: Muchun Song <songmuchun@bytedance.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Ritesh Harjani <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Qi Zheng <qi.zheng@linux.dev>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CF8ED1DC-9745-42D3-92F0-424A02385EC1@linux.dev>
References: <20260929053231.66085-1-songmuchun@bytedance.com>
 <20260929053231.66085-7-songmuchun@bytedance.com>
 <ar5xbQsUpSQZg0wO@kernel.org>
 <78D5D6AA-BE36-432C-B0F7-453F93DF18C0@linux.dev>
 <ar9p39Y9SmlxvbA_@kernel.org>
 <85941AA4-7E50-4AAE-BC05-0F443B21BE8B@linux.dev>
 <ar_0GLYM6KsIH6tQ@kernel.org>
 <D91CEA1E-6B79-434D-AF49-16C62C0FD095@linux.dev>
 <asTS6OtxPMVshuIO@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 6, 2026, at 12:52, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> On Mon, Oct 05, 2026 at 06:27:52PM +0200, Muchun Song wrote:
>>> On Oct 2, 2026, at 20:12, Mike Rapoport <rppt@kernel.org> wrote:
>>>=20
>>> On Fri, Oct 02, 2026 at 05:56:40PM +0800, Muchun Song wrote:
>>>>> On Oct 2, 2026, at 16:22, Mike Rapoport <rppt@kernel.org> wrote:
>>>>=20
>>>>>>>> diff --git a/mm/mm_init.c b/mm/mm_init.c
>>>>>>>> index 1650d6bc1211..bd02e8d06965 100644
>>>>>>>> --- a/mm/mm_init.c
>>>>>>>> +++ b/mm/mm_init.c
>>>>>>>> @@ -609,6 +609,9 @@ void __meminit __init_single_page(struct =
page *page, unsigned long pfn,
>>>>>>>> if (!is_highmem_idx(zone))
>>>>>>>> set_page_address(page, __va(pfn << PAGE_SHIFT));
>>>>>>>> #endif
>>>>>>>> + =
VM_WARN_ON_ONCE(vmemmap_optimizable_order(pfn_to_section_compound_order(pf=
n)) &&
>>>>>>>> + page_zone_id(page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) !=3D
>>>>>>>> + page_zone_id(page));
>>>>>>>=20
>>>>>>> Hmm, page + VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES is initialized =
a tad later
>>>>>>> than page so it'll have stale data in the page->flags, won't it?
>>>>>>=20
>>>>>> Lance is right. The shared tail struct pages are already =
initialized by
>>>>>> vmemmap_shared_tail_page() during vmemmap population, so they're =
not stale.
>>>>>> The head 64 struct pages are initialized later =E2=80=94 right =
here, after vmemmap
>>>>>> population.
>>>>>=20
>>>>> Still it looks out of place here, can this check be done in =
sparse-vmemmap
>>>>> somehow?
>>>>=20
>>>> The struct page entries of a vmemmap-optimizable compound page
>>>> are currently initialized in two stages. During vmemmap
>>>> population, the shared tail entries are initialized first. The
>>>> retained head area=E2=80=94normally 64=E2=80=94is initialized later =
through
>>>> __init_single_page().
>>>>=20
>>>> This warning connects the two stages: while initializing the
>>>> retained entries in the second stage, it verifies that their zone
>>>> information is consistent with the shared entries initialized in
>>>> the first stage. Therefore, the same check cannot be performed
>>>> during vmemmap population.
>>>>=20
>>>> I am planning to first unify the HugeTLB and Device DAX
>>>> compound-page initialization through a common helper [1]. Once that
>>>> work is complete, maybe it will be easy to move the initialization
>>>> of the retained head area into vmemmap population. With both the
>>>> retained and shared entries initialized in the same stage, there
>>>> will be no cross-stage inconsistency to check, and this warning
>>>> can be removed.
>>>>=20
>>>> Would keeping the check here for now and removing it as part of
>>>> that follow-up sound reasonable to you?
>>>=20
>>> While it feels really out of place in __init_single_page(), but =
having it
>>> memmap_init_range() close to the if that skips shared tail pages =
makes
>>> sense.
>>>=20
>>> What do you say?
>>=20
>> Sorry for the late reply because of traveling to LPC.
>>=20
>> Putting the check in memmap_init_range() would validate the
>> invariant for the shared-tail range skipped there. It would
>> not, however, cover all vmemmap-optimized initialization
>> paths: optimized Device DAX bypasses memmap_init_range()
>> when there is no altmap, and deferred boot-time HugeTLB
>> initialization may also initialize retained entries
>> elsewhere.
>>=20
>> If the intention is to validate only the skip in
>> memmap_init_range(), moving it there makes sense. If we want
>> the warning to cover both HugeTLB and Device DAX generally,
>> it still needs to remain in __init_single_page() or be
>> called from the individual initialization paths.
>=20
> Yeah, putting this into all the callers sucks too :(
>=20
> With all the callers,__init_single_page() is the right place for this
> check, but I think we can add a static inline in sparse.h, like e.g.
>=20
> vmemmap_optimization_verify_zone(page, pfn)
>=20
> to make it a bit nicer.

Yeah, factoring this into a helper makes sense.

Since it currently has only one caller, how about keeping it as a local
static inline in mm_init.c instead of putting it in sparse.h?

Thanks,
Muchun

>=20
>> Thanks,
>> Muchun
>>=20
>>>=20
>>>> [1] =
https://lore.kernel.org/20260513132044.41690-18-songmuchun@bytedance.com/
>>>>=20
>>>> Thanks,
>>>> Muchun
>>>=20
>>> --=20
>>> Sincerely yours,
>>> Mike.
>>=20
>=20
> --=20
> Sincerely yours,
> Mike.


