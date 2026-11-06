Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946292;
	b=3QUXubf5ZjAP/INsjupnjtx0hHkJW8sk1p0Oh2l799q4PuXj5K80+YrYO8Blea/tBwDg
	 jVOF6aXocT+hDk5Cu8qMhoBYGvAay5YxkYa/D/J6hYnU4FkBJXPLgKVy08S0+dk7kf9Te
	 73xwUzK2CMjvCLoMHgXnJcwmgKJ2XCn/4apy8U10e9Y3VzeajHhTPCeoolV+kDE8ffy/5
	 x7STGybqdiojSASItWu4Jsd17Rufib2AXQdjqGJRK2nGwThtYx3Gt/OQUS/25Y45Ns36N
	 7jBuwsw7aNyr7cO2D3sDqtxudOEffsJNcdZ4AZ9C/g1imzV2kqVEP2oTpLqlNrEQ1kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946292;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hNhdEdbELbxYnbq7Z+uVlCghlviJuJjsxKDpjppnRdg=;
	b=In2r84Y87bzTjfOhecxDHQ6ajVKMwLtpR8yANtZ9j2UmbwvGd/f+XD+pBdX+ifBoBz4M
	 OLaJSgActp0yXCqV4UbXSyTbNi6a0a5gs+XwWtbrYpCjtLp1UnjeqtYTFsMjLJaRAc38V
	 h9V/DYPjNhenn6K0eA4PTDaB2wtanuq4iSyCaxMzFrxm6O2/6VxosVG42KIfM1tOEFNtT
	 K18i4KyFB1LkJgnxABS06oEW0HKXpk2yz/N21gW9sRCwmXQHrG2ouJa77cpe8WgkLRNcE
	 JR0Q4Te7djcyt4cjd5r/52lDfQnJ8jfxpbL334SuExQWulGkOjjQwTmgquiahexDzLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MaTl1+Ww;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE50F606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MaTl1+Ww
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCE01F008A6
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793946291;
	bh=hNhdEdbELbxYnbq7Z+uVlCghlviJuJjsxKDpjppnRdg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MaTl1+WwrS0vWZrUPOnAwM4Ajmv3xOdg4V7MhEl4HmgKLX+oOS9WwqCllQDH/js2y
	 HGQiDNgggHLFyvmSfagsvVVlZeqz7MGStzuSzVHOeoE4OjQS31fiSo8diRFsz4UwF9
	 3sK3J7h1MVgJvXGM2RLnr4mNFBxTlxiM39XsXlsUk04ReEuK/cdn5cGcYESSilupT/
	 vMVUxmzSP50WgV3sSQqgER0SCpm8zHKcmpGIfc73jXkO5LmxE3XYlr8Ufet+7Ar5rh
	 WbmFi4KDxVudDG0dYjbSybAIrfUcWEBRD/Wq94yzcvMyph5Gjvv/LkbRB0ChTn/5ZE
	 OtgX3BjOTVsSQ==
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91b8306b9f8so5226556d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:24:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxZUgf4inpmCNOO3xpQYD/Hae1EMFyq2C0IlnN4/UTmRdO7EV1QpUWKExIDUegl9wRGyCpXRkvu8fiBntA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g6QMv7Jw927Z8uT8R1+JQErYDbyxiQD3/4zqPaVgQD7IfhcPY
	D/dAzL6gTFdWQc7UTg23D2YdMNCNv+AMuqMgKmXDIxuFggKKG3ku9FnH0QtgJ3MP8tbl96RtTpC
	TJvpEQfobv6nINXHe93Y3DFIsRzZOShc=
X-Received: by 2002:a05:620a:1a03:b0:93f:707f:28d2 with SMTP id
 af79cd13be357-945f344cc28mr233095685a.26.1793946290734; Thu, 05 Nov 2026
 22:24:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
 <20261105045406.39871-1-lance.yang@linux.dev> <0ddaf336-7cb7-4e83-af2c-f60d23f7aafd@linux.dev>
 <f7bd740e-1328-473e-96f5-89658a08d514@linux.alibaba.com>
In-Reply-To: <f7bd740e-1328-473e-96f5-89658a08d514@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 6 Nov 2026 14:24:39 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zHtv7hBCaW=wdfiM7yA4OJS7pcFomSo22bEzWHizYAXQ@mail.gmail.com>
X-Gm-Features: AclHuK8sH4jIu7KkqgNySV7lEo_7cZEAX1FymEzj8OWRWHpCtROXagBOAzb0Q08
Message-ID: <CAGsJ_4zHtv7hBCaW=wdfiM7yA4OJS7pcFomSo22bEzWHizYAXQ@mail.gmail.com>
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio sizes
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, david@kernel.org, 
	ljs@kernel.org, riel@surriel.com, liam@infradead.org, vbabka@kernel.org, 
	harry@kernel.org, jannh@google.com, qi.zheng@linux.dev, pfalcato@suse.de, 
	ayushr@modal.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:00=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> CC Barry, who added the TTU_SYNC in shrink_folio_list().
>
> On 11/5/26 1:48 PM, Lance Yang wrote:
> >
> >
> > On 2026/11/5 12:54, Lance Yang wrote:
> >>
> >> On Thu, Nov 05, 2026 at 10:56:28AM +0800, Baolin Wang wrote:
> >>> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing
> >>> mapped
> >>> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can
> >>> also race
> >>> with concurrent page table reclamation via zap_empty_pte_table().
> >>
> >> Good catch!
> >>
> >>> page_vma_mapped_walk() is used by many functions including
> >>> try_to_unmap(),
> >>> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(),
> >>> remove_migration_ptes(),
> >>> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for
> >>> try_to_unmap()
> >>> and try_to_migrate(), the other callers do not perform post-walk
> >>> accounting
> >>> checks, so the race has no observable impact on them.
> >>>
> >>> For migration, the race can cause unnecessary retries. For reclaim vi=
a
> >>> try_to_unmap(), the race can cause failure to reclaim a folio that is=
 in
> >>> fact already unmapped (as shown below), which may lead to unexpected =
OOM
> >>> or increased refaults.
> >>>
> >>> CPU 0 (reclaim)                      CPU 1 (MADV_DONTNEED)
> >>> --------------------------------    --------------------------------
> >>> folio_lock(F)
> >>> try_to_unmap(F, TTU_SYNC)
> >>>                                     zap_pte_range(full PMD range)
> >>>                                       spin_lock(ptl)
> >>>                                       clear PTEs
> >>>                                       zap_empty_pte_table()
> >>>                                         spin_trylock(pml)
> >>>                                         pmd_clear()
> >>>                                         spin_unlock(pml)
> >>>
> >>>   page_vma_mapped_walk()
> >>>     observe !pmd_present(pmde)
> >>>     nr_pages < HPAGE_PMD_NR
> >>>     skip synchronization
> >>>     return false
> >>>
> >>> try_to_unmap() returns
> >>> folio_mapped(F) =3D=3D true
> >>> nr_unmap_fail +=3D folio_nr_pages(F)
> >>>                                     tlb_flush_mmu_tlbonly()
> >>>                                     tlb_flush_rmaps()
> >>>                                       remove F's rmaps
> >>>                                     spin_unlock(ptl)
> >>>
> >>> Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
> >>> folios")
> >>> has already moved the PMD clear operation (via zap_empty_pte_table())=
 to
> >>> after tlb_flush_rmaps(). Similarly, page_vma_mapped_walk() also needs=
 to
> >>> use sync_with_folio_pmd_zap() to synchronize and avoid memory orderin=
g
> >>> issues on weakly ordered CPUs.
> >>>
> >>> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in
> >>> madvise(MADV_DONTNEED)")
> >>> Cc: stable@vger.kernel.org
> >>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> >>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>> ---
> >>> mm/page_vma_mapped.c | 5 +----
> >>> 1 file changed, 1 insertion(+), 4 deletions(-)
> >>>
> >>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> >>> index e6b6170c2f4f..8797467b6f0c 100644
> >>> --- a/mm/page_vma_mapped.c
> >>> +++ b/mm/page_vma_mapped.c
> >>> @@ -293,10 +293,7 @@ bool page_vma_mapped_walk(struct
> >>> page_vma_mapped_walk *pvmw)
> >>>             spin_unlock(pvmw->ptl);
> >>>             pvmw->ptl =3D NULL;
> >>>         } else if (!pmd_present(pmde)) {
> >>> -            if ((pvmw->flags & PVMW_SYNC) &&
> >>> -                thp_vma_suitable_order(vma, pvmw->address,
> >>> -                           PMD_ORDER) &&
> >>> -                (pvmw->nr_pages >=3D HPAGE_PMD_NR))
> >>> +            if (pvmw->flags & PVMW_SYNC)
> >>
> >> Right. Whether the folio can be PMD-mapped doesn't tell us whether its
> >> PTE table can be reclaimed, so those extra checks can skip
> >> synchronization
> >> that the caller explicitly asked for ;)
> >
> > Ouch ... one thing I missed ... what about order-0 reclaim?
> >
> > shrink_folio_list() only sets TTU_SYNC for large folio, so can't we sti=
ll
> > hit the same race there?
>
> Thanks Lance. But this matches the purpose of the TTU_SYNC flag, which
> is used to avoid racy checks with PVMW_SYNC. If no TTU_SYNC flag is set,
> it means the caller can tolerate some racy checks.
>
> For this case, I think we should set TTU_SYNC unconditionally in
> shrink_folio_list(). Barry, what do you think?

Baolin, thanks for reaching out to me. I added that flag
mainly for large folios.

I observed cases where PTEs for large folios are partially
cleared during certain transition states, for example, when
PTEs are cleared before being modified:

pte =3D ptep_get_and_clear();
pte modification;
set_pte_at();

In such cases, page_vma_mapped_walk() skips the empty
entries and starts from the next valid one.

This may result in partially unmapping PTEs for large folios
and trigger unexpected folio splits. At the time, I was
particularly concerned about unnecessary folio splitting,
so my focus was mainly on large folios.

However, I also noticed that a similar race can occur with
small folios. In that case, the folio may simply remain
unreclaimed by the reclamation path.

However, my main concern at the time was avoiding
unnecessary folio splits.

Your new race also seems to amplify the same situation.
However, I don't think this problem necessarily depends on
the commit you mentioned. It has been around for a long time.

If the concern is reclaim failure, I agree that there is no
fundamental difference between large folios and small folios.

Best,
Barry
