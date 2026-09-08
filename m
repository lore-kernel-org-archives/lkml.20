Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1615A530DF8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788904143; cv=none; b=hoS8q2Di+rDgD3utAsA93PtCgaN6kQDz33du+KEBEnr6bhcCzvFmF87DCwBbgJQ8k5MtSWIoMOIkgRNqlmblLqQRh7qOpTtjSEWYVFSHF4PAUpMkyDkhCiNz1yxgAO55q216nudyeL3yRR9SlvuwXNCXkVLz4JIL3VtOCyahuJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788904143; c=relaxed/simple;
	bh=MgAyQ+++n8cxRHLmFaJ/Sol7hN0t/oEkA1fFq4yfCSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgAV/zTWaFFNVW7783B+4/VFKBp2UeSOk19yDFVY6ymevHsYfn/RDNFafozozt4vCtK9ViGJzyl3s/oNyyn8uwSyhiv+QH08wVDjRtq/Qtxn+dnsCevoDrbAfTyPznqQ13o4Ajko1tAZMXwdBf2pigkdylgzgqwv2ooTVkMnQ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNdv+k4p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNdv+k4p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA881F00A3A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788904141;
	bh=SRj5/+71oEw51fEMN0Yf34skdA28n5/tgdHP34PLH1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fNdv+k4p1B14oTolCPdFGEWPgZH3HyhVZdda/BcNF3M/9hJ959HQDh4lVVnNTz0l4
	 Qn4xgkQWKiP4hkHk1EGYV7ENHlo2QegnagHQrkklbVJ/9CxDMRjr4RN030HxN2ys/c
	 MewbcCdhXLhxUOBFpAwRe/wH9HurD12Dt5XiyGbnrPz8MpUMBNpt4m5Yn+vBRnwq+3
	 E4rBHlbVpfnPsG5rfDW0hbQfPgsl1unT6wUEFO5YcGlR+pE3jD20BLJ1/EKoJySqKn
	 BLA6jTfho6+JrhciTpfxcRQhrT8MCfDSPaO23JmGlabZwYyG+hVrmfEnyejbjicEij
	 HsyRD8uN1/ACA==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeb7so50843385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:49:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx76kCZKvgtoJXUj+LEu1CSei8h4TXwbFXE09xUJSswgNXPG3P7sSkEeqiS0cKYTtk9FrjHJvZ6St74eao=@vger.kernel.org
X-Gm-Message-State: AFuF++n3kyhyZpdgBQM+hZezmukuXK3Z2qODHLVG76gtYThtk4+Tdwnz
	VJqsRMoEJgASDrDaK8WQq0NgmBCNtzRIEdkOccrRo9f06STjviJgtHXCjo48CT4Ruq1M65rJYs3
	59unTCUPYE4aQQht1OHDG/vmM2XcZl1I=
X-Received: by 2002:a05:620a:6887:b0:939:b482:d474 with SMTP id
 af79cd13be357-939c94d1567mr389574985a.35.1788904136079; Tue, 08 Sep 2026
 14:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901054358.4049095-1-dev.jain@arm.com> <20260901054358.4049095-9-dev.jain@arm.com>
In-Reply-To: <20260901054358.4049095-9-dev.jain@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 9 Sep 2026 05:48:45 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yQhafd8zoESxFza3N8kxWxpOpa1Pv-Sf+N=mCPz5or=w@mail.gmail.com>
X-Gm-Features: AcwNN1WplhjIUPyGVS7vzahad1sRXKX0hXs9tSmw_MqKdbFgEAwOX3x96mPKlcA
Message-ID: <CAGsJ_4yQhafd8zoESxFza3N8kxWxpOpa1Pv-Sf+N=mCPz5or=w@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] mm/rmap: batch unmap anonymous swap-backed large folios
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	hughd@google.com, chrisl@kernel.org, kasong@tencent.com, riel@surriel.com, 
	liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com, 
	lance.yang@linux.dev, baolin.wang@linux.alibaba.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev, 
	youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de, 
	ryan.roberts@arm.com, anshuman.khandual@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 1:45=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> Enable batch clearing of ptes, and batch swap setting of ptes for anon
> swap-backed folio unmapping.
>
> Processing all ptes of a large folio in one go helps us batch across
> atomics (add_mm_counter etc), barriers (in the function
> __folio_try_share_anon_rmap), repeated calls to page_vma_mapped_walk(),
> to name a few. In general, batching helps us to execute similar code
> together, making the execution of the program more memory and
> CPU friendly.
>
> On arm64-contpte, batching also helps us avoid redundant ptep_get() calls
> and TLB flushes while breaking the contpte mapping.
>
> The handling of anon-exclusivity is very similar to commit cac1db8c3aad
> ("mm: optimize mprotect() by PTE batching"). Since folio_unmap_pte_batch(=
)
> won't look at the bits of the underlying page, we need to process
> sub-batches of ptes pointing to pages which are same w.r.t exclusivity,
> and batch set only those ptes to swap ptes in one go.
>
> arch_unmap_one() is only defined for sparc64; I am not comfortable
> regarding the nuances between retrieving the pfn from pte_pfn() or from
> (paddr =3D pte_val(oldpte) & _PAGE_PADDR_4V).
>
> (And, pte_next_pfn() can't even be called from arch_unmap_one() because
> that file does not include pgtable.h) So just disable the
> "sparc64-anon-swapbacked" case for now.
>
> We need to take care of rmap accounting (folio_remove_rmap_ptes) and
> reference accounting (folio_put_refs) when anon folio unmap succeeds.
> In case we partially batch the large folio and fail, we need to correctly
> do the accounting for pages which were successfully unmapped. So, put
> this accounting code (which is finish_folio_unmap()) in
> __ttu_anon_swapbacked_folio() itself, instead of doing some horrible
> goto jumping at the callsite of ttu_anon_folio().
>
> Similarly, do the finish_folio_unmap() in ttu_anon_folio itself for
> the non-swapbacked (lazyfree) case.
>
> If the batch length is less than the number of pages in the folio, then
> we must skip over this batch.
>
> The page_vma_mapped_walk API ensures this - check_pte() will return true
> only if any of [pvmw->pfn, pvmw->pfn + nr_pages) is mapped by the pte.
> There is no pfn underlying a swap pte, so check_pte returns false and we
> keep skipping until we hit a present pte, which is where we want to start
> unmapping from next.
>
> Remove the label finish_unmap since no goto callers are left now.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/rmap.c | 110 ++++++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 81 insertions(+), 29 deletions(-)
>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 1b9f07d4d1be9..68e0201ffd003 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1964,12 +1964,14 @@ static inline unsigned int folio_unmap_pte_batch(=
struct folio *folio,
>         end_addr =3D pmd_addr_end(addr, vma->vm_end);
>         max_nr =3D (end_addr - addr) >> PAGE_SHIFT;
>
> -       /* We only support lazyfree or file folios batching for now ... *=
/
> -       if (folio_test_anon(folio) && folio_test_swapbacked(folio))
> +       if (pte_unused(pte))
>                 return 1;
>
> -       if (pte_unused(pte))
> +#ifdef __HAVE_ARCH_UNMAP_ONE
> +       /* Add batching support to arch_unmap_one() to remove this */

I'd like to make this clearer. For example, could we say that
sparc has `arch_unmap_one()`, which doesn't support batching?

BTW, it shouldn't be too hard to save `nr_pages` tags, looking at
the code:

static inline int arch_unmap_one(struct mm_struct *mm,
                                 struct vm_area_struct *vma,
                                 unsigned long addr, pte_t oldpte)
{
        if (adi_state.enabled && (pte_val(oldpte) & _PAGE_MCD_4V))
                return adi_save_tags(mm, vma, addr, oldpte);
        return 0;
}
Maybe the sparc folks can handle this.

> +       if (folio_test_anon(folio) && folio_test_swapbacked(folio))
>                 return 1;
> +#endif
>
>         /*
>          * If unmap fails, we need to restore the ptes. To avoid accident=
ally
> @@ -2139,16 +2141,25 @@ static pte_t swp_pte_prepare(swp_entry_t entry, p=
te_t old_pte,
>         return swp_pte;
>  }
>
> -static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
> +static void finish_folio_unmap(struct vm_area_struct *vma,
> +               struct folio *folio, struct page *page, unsigned long nr_=
pages)

We are not necessarily finishing the whole folio here, right?
The name is a bit misleading to me, as it sounds like we're finishing
the whole folio.

Maybe `finish_folio_unmap_batch()`?

> +{
> +       folio_remove_rmap_ptes(folio, page, nr_pages, vma);
> +       if (vma->vm_flags & VM_LOCKED)
> +               mlock_drain_local();
> +       folio_put_refs(folio, nr_pages);
> +}
> +
> +static bool __ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
>                 struct folio *folio, struct page *page, unsigned long add=
ress,
> -               pte_t *ptep, pte_t pteval)
> +               pte_t *ptep, pte_t pteval, unsigned long nr_pages,
> +               bool anon_exclusive)
>  {
> -       const bool anon_exclusive =3D folio_test_anon(folio) &&
> -                                   PageAnonExclusive(page);
>         swp_entry_t entry =3D page_swap_entry(page);
>         struct mm_struct *mm =3D vma->vm_mm;
> +       pte_t swp_pte;
>
> -       if (folio_dup_swap_pages(folio, page, 1) < 0)
> +       if (folio_dup_swap_pages(folio, page, nr_pages) < 0)
>                 return false;
>
>         /*
> @@ -2157,21 +2168,57 @@ static bool ttu_anon_swapbacked_folio(struct vm_a=
rea_struct *vma,
>          * so we'll not check/care.
>          */
>         if (arch_unmap_one(mm, vma, address, pteval) < 0) {
> -               folio_put_swap_pages(folio, page, 1);
> +               VM_WARN_ON(nr_pages !=3D 1);
> +               folio_put_swap_pages(folio, page, nr_pages);
>                 return false;
>         }
>
>         /* See folio_try_share_anon_rmap(): clear PTE first. */
> -       if (anon_exclusive && folio_try_share_anon_rmap_pte(folio, page))=
 {
> -               folio_put_swap_pages(folio, page, 1);
> +       if (anon_exclusive &&
> +           folio_try_share_anon_rmap_ptes(folio, page, nr_pages)) {
> +               folio_put_swap_pages(folio, page, nr_pages);
>                 return false;
>         }
>
>         mm_prepare_for_swap_entries(mm);
> -       dec_mm_counter(mm, MM_ANONPAGES);
> -       inc_mm_counter(mm, MM_SWAPENTS);
> -       set_pte_at(mm, address, ptep,
> -                  swp_pte_prepare(entry, pteval, anon_exclusive));
> +       add_mm_counter(mm, MM_ANONPAGES, -nr_pages);
> +       add_mm_counter(mm, MM_SWAPENTS, nr_pages);
> +       swp_pte =3D swp_pte_prepare(entry, pteval, anon_exclusive);
> +       set_softleaf_ptes(mm, address, ptep, swp_pte, nr_pages);
> +       finish_folio_unmap(vma, folio, page, nr_pages);
> +       return true;
> +}
> +
> +static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
> +               struct folio *folio, struct page *first_page,
> +               unsigned long address, pte_t *ptep, pte_t pteval,
> +               unsigned long nr_pages)
> +{
> +       unsigned long batch_idx =3D 0;
> +
> +       while (nr_pages) {
> +               bool anon_exclusive =3D PageAnonExclusive(first_page + ba=
tch_idx);
> +               unsigned long len =3D page_anon_exclusive_batch(batch_idx=
,
> +                               nr_pages, first_page, anon_exclusive);

`len` is really a bad name, as `len` usually describes a size.
Maybe `batch_pages`?

> +
> +               if (!__ttu_anon_swapbacked_folio(vma, folio,
> +                               first_page + batch_idx, address, ptep, pt=
eval,
> +                               len, anon_exclusive)) {
> +                       /* Restore the remaining PTEs that were cleared. =
*/
> +                       set_ptes(vma->vm_mm, address, ptep, pteval, nr_pa=
ges);
> +                       return false;
> +               }
> +
> +               nr_pages -=3D len;
> +               if (!nr_pages)
> +                       break;
> +
> +               pteval =3D pte_advance_pfn(pteval, len);
> +               address +=3D len * PAGE_SIZE;
> +               batch_idx +=3D len;
> +               ptep +=3D len;
> +       }
> +
>         return true;
>  }

Best Regards
Barry
