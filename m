Received: from mta0.migadu.com (out-136.mta0.migadu.com [91.218.175.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DD125B0A4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701213; cv=none; b=qJ0lcucBtN/3yaMNSbhNqxcsA1FPVZfcYiVUCpMBQ7P/ddez4cI6OSKj4ymYTCiii2ubQwduyau1RCvwLxIFkpMyaQ5eVyqkqgvSWPLJhXmxbpKHGQuznRAIG1rMMgvNKgutC1HBsEadDhPx/9IrPyACnaSC00rhO7wBQoaEuKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701213; c=relaxed/simple;
	bh=Rkn/RIiY9BjLJ/8Nz1FlDN7V2RpqMaZCBysWzgkBWaA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=byiv1Lhzj2ZgD6dKIPkLWJwdnVm2Ap6//Ni5K+idQKKwKp3vSr1Y88tIE1v/nLSs6sQ++Fvz3BzxFEWG4jV/l4Ffp+iLNM39h7OiibCc/LgxLVuPhnpHtFKvNOliBsJI98EIqIx9lW6o7UmEQWRWVs2wS7zcv3nW4fFhoxfxF4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OLnHFwLu; arc=none smtp.client-ip=91.218.175.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OLnHFwLu"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Rkn/RIiY9BjLJ/8Nz1FlDN7V2RpqMaZCBysWzgkBWaA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789701203; v=1; x=1790306003;
 b=OLnHFwLugetQqXu7J6UCm/JMKkjBzNriZGlObH/A7g6gLfogF4p0jKGTEtt52x9aq3ESeFO1
 zH/sQjJkIe6tBswucnba96dj4pFRJaO5ev8Kmi7otbsaSIXaf0OgNWcVkaZIX9rDypqt5BbkPVK
 SxhLWYnCOykiiJI1ocBdzSiA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 56057d78e329f5f0;
	Fri, 18 Sep 2026 03:13:23 +0000
X-Mizu-Trace-ID: 56057d78e329f5f0
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH v4 05/16] mm/hugetlb: use direct assignment instead of
 folio_change_private()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <DLI26G4YSWIO.E52DKMAH6ZSG@nvidia.com>
Date: Fri, 18 Sep 2026 11:13:05 +0800
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>,
 Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Kairui Song <kasong@tencent.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A1A14368-7A43-40ED-B2AB-C2EC2C5FFB1D@linux.dev>
References: <20260913-remove-pg_private-v4-0-848550f7574e@nvidia.com>
 <20260913-remove-pg_private-v4-5-848550f7574e@nvidia.com>
 <CC279633-6F0F-440C-BCDF-1D5362C4CB7B@nvidia.com>
 <c7a5ff0c-126d-4762-8b04-5897da09b8b1@kernel.org>
 <DLI26G4YSWIO.E52DKMAH6ZSG@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 18, 2026, at 09:41, Zi Yan <ziy@nvidia.com> wrote:
>=20
> On Wed Sep 16, 2026 at 2:12 AM EDT, David Hildenbrand (Arm) wrote:
>> On 9/16/26 03:56, Zi Yan wrote:
>>> On 13 Sep 2026, at 22:24, Zi Yan wrote:
>>>=20
>>>> folio_change_private() should be used along with =
folio_attach_private() and
>>>> folio_detach_private(), where adding and remove ->private content =
requires
>>>> folio refcount change. add_hugetlb_folio() simply sets =
folio->private to
>>>> NULL without refcount manipulation. Change it to direct assignment =
to avoid
>>>> semantic confusion.
>>>>=20
>>>> It prepares for a future commit that remove PG_private.
>>>>=20
>>>> No functional change intended.
>>>>=20
>>>> Assisted-by: LLM
>>>> To: Muchun Song <muchun.song@linux.dev>
>>>> To: Oscar Salvador <osalvador@suse.de>
>>>> To: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: David Hildenbrand <david@kernel.org>
>>>> Cc: linux-mm@kvack.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Acked-by: Usama Arif <usama.arif@linux.dev>
>>>> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
>>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>>> ---
>>>> mm/hugetlb.c | 7 ++-----
>>>> 1 file changed, 2 insertions(+), 5 deletions(-)
>>>>=20
>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>>>> index d3a0650ff6905..8d551cdaef9db 100644
>>>> --- a/mm/hugetlb.c
>>>> +++ b/mm/hugetlb.c
>>>> @@ -1446,11 +1446,8 @@ void add_hugetlb_folio(struct hstate *h, =
struct folio *folio,
>>>> }
>>>>=20
>>>> __folio_set_hugetlb(folio);
>>>> - folio_change_private(folio, NULL);
>>>> - /*
>>>> -  * We have to set hugetlb_vmemmap_optimized again as above
>>>> -  * folio_change_private(folio, NULL) cleared it.
>>>> -  */
>>>> + /* Clear all folio->private flags except =
hugetlb_vmemmap_optimized. */
>>>> + folio->private =3D NULL;
>>>> folio_set_hugetlb_vmemmap_optimized(folio);
>>>>=20
>>>=20
>>> Sashiko[1] said when a CMA hugetlb folio is freed but fails vmemmap =
restore,
>>> add_hugetlb_folio() clears HPG_cma. It either bypasses
>>> hugetlb_cma_free_frozen_folio() due to the missing HPG_cma flag, or
>>> skips cma_release() and causes a CMA memory leak if it is free =
directly
>>> to buddy allocator. Sashiko also asked if HPG_temporary should be =
preserved
>>> as well HPG_cma.
>>>=20
>>> Answer:
>>>=20
>>> Missing HPG_cma is a real issue. It can be fixed by checking
>>> folio_test_hugetlb_cma(folio) at the beginning of =
add_hugetlb_folio() and
>>> setting HPG_cma after folio->private is assigned to NULL.
>>=20
>>=20
>> Maybe we should just simply only clear flags we actually want to =
clear ...
>=20
> And it turns out to be a clean result (see below). add_hugetlb_folio()
> adds a hugetlb folio back to freelist, so prior operations like
> remove_hugetlb_folio() should clear hugetlb flags, like HPG_freed,
> HPG_restore_reserve, HPG_migratible. HPG_temporary is only set in
> one callsite in free_huge_folio() and is cleared before the folio is
> passed to add_hugetlb_folio() via update_and_free_hugetlb_folio().
> HPG_raw_hwp_unreliable probably can stay, since it preserves poison
> information. The remaining HPG_cma and HPG_vmemmap_optimized are the =
two
> we want to preserve.
>=20
> Muchun, maybe you can chime in about the patch below. It can be a
> follow-up patch after this series.
>=20
> Thanks.
>=20
>=20
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 8d551cdaef9db..bc772954e5685 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1446,9 +1446,6 @@ void add_hugetlb_folio(struct hstate *h, struct =
folio *folio,
> }
>=20
> 	__folio_set_hugetlb(folio);
> - 	/* Clear all folio->private flags except =
hugetlb_vmemmap_optimized. */
> - 	folio->private =3D NULL;
> - 	folio_set_hugetlb_vmemmap_optimized(folio);

This looks good to me. Since add_hugetlb_folio() will no longer clear
folio->private, would it be worth adding a whitelist-based
VM_WARN_ON_ONCE_FOLIO() here to catch unexpected flags? This would =
document
which flags may survive the transition and help detect future callers =
that
fail to clear transient state before returning a folio to the pool.

Thanks.

>=20
> 	arch_clear_hugetlb_flags(folio);
> 	enqueue_hugetlb_folio(h, folio);
> @@ -1736,6 +1733,7 @@ void free_huge_folio(struct folio *folio)
> h->resv_huge_pages++;
>=20
> 	if (folio_test_hugetlb_temporary(folio)) {
> + 		folio_clear_hugetlb_temporary(folio);
> 	remove_hugetlb_folio(h, folio, false);
> 	spin_unlock_irqrestore(&hugetlb_lock, flags);
> 	update_and_free_hugetlb_folio(h, folio, true);
>=20
>=20
> --=20
> Best Regards,
> Yan, Zi


