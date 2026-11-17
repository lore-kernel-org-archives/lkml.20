Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891274;
	b=JXtpQn3FDWbLqh30p9k17sV2OqtEN2ZK7aVNDGQLLtsHeMmFAqbXSsGfaSwjYVqYmYMM
	 rzXsbKIbECa3xPIBBDkGbgODZCYxnVsES2G2W/zHgGDuIcaOyhbfN6fT3yBLW7e3kmpyc
	 57bjokfgK3Eqss3nQNWa0f8Jo1KwjPKgoPzsvD4ECM8bi/TgxHy19C+ZmgI+W8vQRZzDv
	 xcUEJmghWFHNj02NVcoumQCAlqUcHfc7BD8TCQfaZvZuCfMV6WRTpXIoBEGEasJ8d9T0y
	 McR89zdZlsPp+M72NAOVoaeiU4eHjX+wssnihGrG7TVD/kJtcwtvxVtIo8qmQRBdmNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891274;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9jwU+jRDguVi89EfWTfk/SuDfHVWfiWUZP/2wYDxr2I=;
	b=mbLtDQsNuLcSUB5V6dtEhibOu+IPv1LXPRZt8J2Sjb3u4vk7ESizyeXZp40Aab/IRYnv
	 3dmwhGRw62VL9zOcRepIZHGd2iOzuOrpY18+di3catN5xcBVt7pQwhZ8uU29cnLLJsVS8
	 71xpPkclRGjlHHTXFaIaT9vB8k5dWQGvnN9WLZxVzkGqwtn7huFntb/4RERNKw+zIzy/A
	 xhIgrls6cj5GrtSq+iWb45MuRYtXCoO+/wjX+HinEuLA537RHVV2TAGQDoMs6LXlxRJxe
	 Kjkly1N0gqFvPfLue4s3KXS5pS0hboyHlo9wFSB+gAy7OMfu3SgHnVlDEdyu3We/NkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhlUR+Lx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27C9606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhlUR+Lx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735DC1F000C5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794891274;
	bh=9jwU+jRDguVi89EfWTfk/SuDfHVWfiWUZP/2wYDxr2I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nhlUR+LxlNEQ5p5tQTA/Q2OEkP0Q14VWlqWpe2q8D3VSDoEE/LMIsWBdX2nEle4BI
	 2jLevCN0qWKf0HESY3GJPoNNLT52jkQX613YGnL1lklBPfC4apdkDzIYDXK7l8CK82
	 q7Bu3M+ouun926ICrtA6v5NzCPyWuOPi7FUy1GBG9qqaQEh8h3nMB3raFKuQjCJBca
	 DTebu1Ramj5WD3cu/6ZJ2SRHFVjaX3iPOvgXlbvoTFOMTjCtng5BY/WjqRCDe9Pfuf
	 WPGmJr2VmymOPLpDDqpV80dI7ZKNh7+G3VJqBOgWK7kLL3wCWcemEF7myKSlSO7cdQ
	 iEwnuYtw+797g==
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9495c633eb5so205692085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:54:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEA3fAZIgJtpY0RZ+nYyJQm5khpwzbhWGrhtGOPDsVYjlXB8KHJJRsjrxutJsVtNeOIX+uChNNWrr1wIiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WXUd/fcJPYx3vo7AezAcwxp+16on/emGDRgbhaPUnFcweEWTC
	jvA7/kpidbiapqAw0Nf4tKhm7Yv5yWzHtmy6wRLEtCAVgq9fDQhjlAhmTvrE+I7gHNUADRwyYvo
	dT9z+PykJ33hipNsHNuKuR5eAxyHJJAA=
X-Received: by 2002:a05:620a:44c2:b0:943:f301:49b9 with SMTP id
 af79cd13be357-9494bc2b238mr2017557485a.53.1794891273791; Mon, 16 Nov 2026
 20:54:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <71980310d9bf1bf9733ea0e4b772635e1b2bc5c5.1794886401.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <71980310d9bf1bf9733ea0e4b772635e1b2bc5c5.1794886401.git.baolin.wang@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 17 Nov 2026 12:54:21 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wY2r=jyR64Zrx1+8ddq3PMG=k5tsdoqEHXD6oBxEF1pQ@mail.gmail.com>
X-Gm-Features: AclHuK8-OTyMITBBm6lumknloZRwvUS8D7rYd577xanULi7RlADzwuMxlOmI7lg
Message-ID: <CAGsJ_4wY2r=jyR64Zrx1+8ddq3PMG=k5tsdoqEHXD6oBxEF1pQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm: synchronize with PTE table reclaim for all folio sizes
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	riel@surriel.com, liam@infradead.org, vbabka@kernel.org, harry@kernel.org, 
	jannh@google.com, lance.yang@linux.dev, qi.zheng@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:40=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapp=
ed
> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also r=
ace
> with concurrent page table reclamation via zap_empty_pte_table().
>
> page_vma_mapped_walk() is used by many functions including try_to_unmap()=
,
> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migration_=
ptes(),
> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_to_un=
map()
> and try_to_migrate(), the other callers do not perform post-walk accounti=
ng
> checks, so the race has no observable impact on them.
>
> For migration, the race can cause unnecessary retries. For reclaim via
> try_to_unmap(), the race can cause failure to reclaim a folio that is in
> fact already unmapped (as shown below), which may cause cold/hot inversio=
n
> (e.g., in MGLRU) and increase refaults. In extreme cases, failing to
> reclaim unmapped large folios could even cause OOM in theory.
>
> CPU 0 (reclaim)                      CPU 1 (MADV_DONTNEED)
> --------------------------------    --------------------------------
> folio_lock(F)
> try_to_unmap(F, TTU_SYNC)
>                                     zap_pte_range(full PMD range)
>                                       spin_lock(ptl)
>                                       clear PTEs
>                                       zap_empty_pte_table()
>                                         spin_trylock(pml)
>                                         pmd_clear()
>                                         spin_unlock(pml)
>
>   page_vma_mapped_walk()
>     observe !pmd_present(pmde)
>     nr_pages < HPAGE_PMD_NR
>     skip synchronization
>     return false
>
> try_to_unmap() returns
> folio_mapped(F) =3D=3D true
> nr_unmap_fail +=3D folio_nr_pages(F)
>                                     tlb_flush_mmu_tlbonly()
>                                     tlb_flush_rmaps()
>                                       remove F's rmaps
>                                     spin_unlock(ptl)
>
> Commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped folios")
> has already moved the PMD clear operation (via zap_empty_pte_table()) to
> after tlb_flush_rmaps(). Similarly, page_vma_mapped_walk() also needs to
> use sync_with_folio_pmd_zap() to synchronize and avoid memory ordering
> issues on weakly ordered CPUs.
>
> Regarding performance, evaluated the impact on try_to_unmap(). Mapped a f=
ile
> to generate clean large folios, then used MADV_PAGEOUT to reclaim 1G of m=
apped
> clean large folios, repeated 5 times, with no measurable performance impa=
ct.
> Before: 16.031 ms over 5 loops
> After: 16.303 ms over 5 loops
>
> While the race scenario described in the patch may theoretically affect
> performance, the actual impact in real workloads is likely limited I thin=
k.
> Anyway, will use memory barriers to sync for non PMD-sized folios in a
> follow-up.
>
> Lance also reported the possible racy check for small folios[1]. However,
> whether to set TTU_SYNC for small folios should be done in a separate pat=
ch
> (this is a pre-existing issue) with proper measurement (though it may be
> hard to measure the actual impact).
>
> [1] https://lore.kernel.org/all/0ddaf336-7cb7-4e83-af2c-f60d23f7aafd@linu=
x.dev/
> Fixes: 6375e95f381e ("mm: pgtable: reclaim empty PTE page in madvise(MADV=
_DONTNEED)")
> Cc: stable@vger.kernel.org
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: Qi Zheng <qi.zheng@linux.dev>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>

Reviewed-by: Barry Song <baohua@kernel.org>

I agree we should start by respecting PVMW_SYNC in all cases,
although there are still some open questions to address.
Whether we should extend SYNC to more folios is a separate question.
