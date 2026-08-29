Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB473016E0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972811; cv=pass; b=P7u0Zh4CD91CRLQcw1YLCMHQAs8Snhpk3230YqHrkty5he3UUCZnAPqchiht+0t/bU9ZSnDdL3+/UKnmvps5p67igAtSKD4+vjfEkgr/6bD9uZWGqZNzE4jbxc4OYYK8U15xUurfDmVRDD8faCLyXAiwF1Dc/eH+mJnJi97a3Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972811; c=relaxed/simple;
	bh=F3OQaC8PQ5TDnD7bw3HCNaofGqMQTZ1s7xINj7DqLMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCb2ZzCdIpDeqhcDBzH3fuyuQxnuVeDatm1VR1cAhLi1oG+4x0lrHz/rJtbQnBkzxHTCo56++b1Y20HwB5JuNIhBfgMi37FNG6zYAc3uEtjfaQIQRvxbiIAdpH/8MSUOEYtK5Dzer/0XJdx+b79+uF6D3bM98c6F9PNsctcJNYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OSw6nCCH; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OSw6nCCH"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c10e86e52so79251cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787972806; cv=none;
        d=google.com; s=arc-20260327;
        b=EscJq3IFtLvsjRAvJMb8p342aQuJNpgD0g+DN7Jomy6L4FDcqK7qA5AO53rbX/BOPF
         0G3oitnCmR5FBJJVCAS7IfAVbxUgrflrBBgyTXP4LmtP7i+VlM/H8KNXKK88f2FV9DRI
         /ZfYettD05lZ723hBHYUvvV37yGUj1hofzLvf5gxA4jDQX08TXd2tSZzEuubtxm8du+h
         MjcYzQMcwwCTgV38zzjzbrb0DVrCdQla6CKARZupHkpq4DiFjnFNF8+CCyLiU+uC5nhG
         5RMQWbAHIhDk9Wei9B1o7WAhevMEJnO7MyMrAQvWkQ1tfjiJlxBxxW9jFn1Ab+tD39uQ
         0g+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bAd6Cs6cAIBMoTEeCRV3gq9M08ePmZpyE5FmQw284bs=;
        fh=jcW4DGMaA7gbyun2HLcWXEnCvPG3CrXlsvEsvCLNXlc=;
        b=YGztuwYo0xXVHgVJ8eAGd4kN4MAuFml16CdiQGXHLoCx97pJeKUjKe6JNXlchGbznF
         XHvhvOuJVEM4HB4gTmUsH67vEjozqr5o2RTeYfzw6+sXSTtJRY05JOAdZRoD+QXGOCcd
         s7zKCuBVUgDBcYuzp8Q4WGA/hPIDAOXyypa8xZovNMA1vAkyb8+zUYu2kXx6eHVxWrAO
         xn5EMdjAgYA6hE5Xb3Ty/Q9XUe0/5AewRYyXEhUppfhb3rJPp59Ry1eXmpsnnFO795YQ
         5hKk9sTHrzzlwWixCWA9zVIhQVQEs4P6j3pH59MSMOSWQNwthwVSR85fICVkpoqqrsIG
         pB+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787972806; x=1788577606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bAd6Cs6cAIBMoTEeCRV3gq9M08ePmZpyE5FmQw284bs=;
        b=OSw6nCCHY5t0LeaKxvwMYI+TD0iQElGYzVofuhCvhxjfgffuAxHBAxXmxJMBhNO6uj
         DL7hQrBqS1fdoxHz47+qnGcLnEtRMWTxmrO1R3f/UO2pspyouueOubCEvPY+yo/UR1gJ
         LoHwrOd5M2Nb/wV/P5LJpMnLjD0C+3WbDoWVjd7nfMAhv9vCH6igwx+1ePBcoOe3/Uj2
         Z7deA9YHQsPZAhEuFYUp1F1naYt0FEpR5DAv4sIDeOMgMy7qRcJYrAReYWRnlzQHQcF0
         Edl4un5fGoMAJ9eDi6VwvO4eBzRH7q4bdGYhhUbyzU9Q/gEOFY5KwGi6UV+xXHMcjrTE
         jSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787972806; x=1788577606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAd6Cs6cAIBMoTEeCRV3gq9M08ePmZpyE5FmQw284bs=;
        b=nRhkUPruTHlWQKGIOjA2Ntu1VB5COR7zLE3dJ/CkWXY5d/X0Z9JvFO74shya7OxtCD
         hQ3q3NS7IJZV3A/kUis092Id7F/Ilv9BS63m62f7Q75YTxGULt3+YrLSTpKkTR46jS/T
         L2LhVsEXAd4vB+zdhKSIlkyPhCljuI6pIRPqNoa/ZXAv+SxSLgVfBfQh+oDcBC1ruQn1
         Erp7c8/wROXyxjneprELC1JXAgMySgjgyaHL+I1mMqG7dtsBOLQNKIdHM6IJJg+DJCWy
         l5sQ7lo0ghm7f9UdHl2Cba3XDnyziw3tt2meuRT0w1ZwGcRoJWBgt6cODEA/XStGuoEi
         +FDw==
X-Gm-Message-State: AFuF++kEKxIvAQt9z1CLnJ0F18ZsSHK5kgyrfL/AtiJhgQ/jtjqmQT+n
	coePHU6DFF1vh6CXcvRUy54eiEdQKnIXcBIA7lpAerQKDqStkXJYTUZogNiJGa5odC9PVCEMveY
	oQ0dOUs93DpBjv5DeVf+x3nJiaZ1ksVwd/MwQl0fd
X-Gm-Gg: AR+sD13kEIw2p67JfgjCz3GI79LLekiftR1w+9qwCv5E5wAewaNBkJJcrEBnO9GgiTP
	2Ibr7UgWXzPhb5plFeu8SXpxnqA5xoyGd/yk2uXrAAvQ+mK4YcI/02/FXPRcs98ihGTSsfPOwkp
	j4qsom4ouMPsFJHVkMh1YgjzpeWCKM+CA5B4qCOa7jQi/okF7Vn7GJy/ajlxEYYL1aSOj7sNC1U
	PNK7ZUEj+Q3m8x4yHoBDVNtn9FpK8Ror1Tjq89I8uDWju/oRU9Sv508B1rMUNhKgCoEEOg8Cv8Y
	P3nxJB1YadSPv0jYhLObgS7sKeLQVIf8+2SO/xTu0FPbgxsYvLwC0g==
X-Received: by 2002:ac8:58c5:0:b0:52d:9d62:6163 with SMTP id
 d75a77b69052e-52ff715f2cemr6683411cf.9.1787972805626; Fri, 28 Aug 2026
 20:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811025157.1632867-1-riel@surriel.com> <20260811025157.1632867-8-riel@surriel.com>
In-Reply-To: <20260811025157.1632867-8-riel@surriel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 28 Aug 2026 20:06:33 -0700
X-Gm-Features: AcwNN1USY2yx7hCAprC1d-hQFovSZ7Q9NX1eU3m3N3_-DPrZ-emHexSsiEQQVi8
Message-ID: <CAJuCfpGyQkFOp4JPzGcMi05CzRZQyJJUBE5zckPLGNPj+7or8g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 7/8] mm/gup: walk multiple PTEs per
 follow_page_pte() call
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 7:57=E2=80=AFPM Rik van Riel <riel@surriel.com> wro=
te:
>
> follow_page_pte() looks at one PTE per call, so __get_user_pages() calls
> it once per page, restarting the pgd/p4d/pud/pmd descent and retaking the
> PTE lock each time.
>
> Walk every PTE from @address to the page-table/VMA/@end boundary in one
> call instead. Adjacent pages from different folios, or plain base pages
> with no folio relationship at all, are covered by the same call under one
> lock.
>
> A failure on the first PTE is returned as before. A failure after that
> ends the walk, and __get_user_pages() retrying the read gets the error.
>
> Measured with mm/gup_test.c, median get time over 16 iterations on a
> 256 MB MADV_HUGEPAGE region in a 4 CPU VM. Folio size was confirmed
> through the per-size anon_fault_alloc counters, 4100 folios for 64 kB
> and 128 for 2 MB:
>
>   gup_test -L -m 256 -n 65536 -r 16 -t
>                         before      after
>   4 kB base pages      2753 us     1178 us   (2.3x)
>   64 kB mTHP           2946 us     1361 us   (2.2x)
>   2 MB THP (control)     72 us       70 us
>
> Base pages and mTHP gain about the same amount, because what is saved is
> the page-table descent that no longer restarts per page, not anything
> folio-specific. 2 MB THP does not reach follow_page_pte(), so it stays
> flat.
>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  mm/gup.c | 62 ++++++++++++++++++++++++++++++++++++++------------------
>  1 file changed, 42 insertions(+), 20 deletions(-)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index ea2bb379183e..c4233a7b8a48 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -916,38 +916,60 @@ static long follow_one_pte(struct vm_area_struct *v=
ma, unsigned long address,
>         return 0;
>  }
>
> +/*
> + * Walk the PTEs from the start address to the end of this page table or=
 VMA,
> + * whichever comes first, and commit every page found.
> + *
> + * A failure on the first PTE is returned to the caller. A failure after=
 that
> + * is a short read; __get_user_pages() retrying the read will get the er=
ror.

I guess it's ok to explain your expectations about __get_user_pages()
retrying upon receiving an error. Could you please also document what
this function returns?

> + */
>  static long follow_page_pte(struct vm_area_struct *vma,
> -               unsigned long address, pmd_t *pmd, unsigned int flags,
> -               struct page **pages)
> +               unsigned long address, unsigned long end, pmd_t *pmd,
> +               unsigned int flags, struct page **pages)
>  {
>         struct mm_struct *mm =3D vma->vm_mm;
>         bool need_no_page_table =3D false;
> -       struct page *page;
> +       pte_t *ptep, *orig_ptep;
> +       unsigned long walk_end;
> +       unsigned long nr =3D 0;
>         spinlock_t *ptl;
> -       pte_t *ptep, pte;
> -       long ret;
> +       long ret =3D 0;
>
> -       ptep =3D pte_offset_map_lock(mm, pmd, address, &ptl);
> +       orig_ptep =3D ptep =3D pte_offset_map_lock(mm, pmd, address, &ptl=
);
>         if (!ptep)
>                 return no_page_table(vma, flags, address);
> -       pte =3D ptep_get(ptep);
> -
> -       ret =3D follow_one_pte(vma, address, ptep, pte, flags, &page);
> -       if (!ret && page) {
> -               ret =3D follow_page_pte_commit(vma, address, page_folio(p=
age),
> -                                            page, pte, flags, pages);
> -               if (!ret)
> -                       ret =3D 1;
> -       } else if (!ret && pte_none(pte)) {
> +
> +       walk_end =3D min(pmd_addr_end(address, end), vma->vm_end);
> +
> +       for (; address < walk_end; address +=3D PAGE_SIZE, ptep++) {
> +               pte_t pte =3D ptep_get(ptep);
> +               struct page *page;
> +
> +               ret =3D follow_one_pte(vma, address, ptep, pte, flags, &p=
age);
> +               if (!ret && page) {
> +                       ret =3D follow_page_pte_commit(vma, address,
> +                                                    page_folio(page), pa=
ge,
> +                                                    pte, flags,
> +                                                    pages ? pages + nr :=
 NULL);
> +                       if (!ret) {
> +                               nr++;
> +                               continue;
> +                       }
> +               }
> +
>                 /*
>                  * no_page_table() may look up the page cache, so it cann=
ot run
>                  * under the PTE lock.
>                  */
> -               need_no_page_table =3D true;
> +               if (!ret && pte_none(pte))
> +                       need_no_page_table =3D true;
> +               break;

The flow in this loop is a bit weird. You could save at least that
early "continue" if you break on a failure early and let the
successful case continue looping naturally.


>         }
>
> -       pte_unmap_unlock(ptep, ptl);
> +       pte_unmap_unlock(orig_ptep, ptl);
>
> +       if (nr)
> +               return nr;
>         if (need_no_page_table)
>                 return no_page_table(vma, flags, address);
>         return ret;
> @@ -969,7 +991,7 @@ static long follow_pmd_mask(struct vm_area_struct *vm=
a,
>         if (!pmd_present(pmdval))
>                 return no_page_table(vma, flags, address);
>         if (likely(!pmd_leaf(pmdval)))
> -               return follow_page_pte(vma, address, pmd, flags, pages);
> +               return follow_page_pte(vma, address, end, pmd, flags, pag=
es);
>
>         if (pmd_protnone(pmdval) && !gup_can_follow_protnone(vma, flags))
>                 return no_page_table(vma, flags, address);
> @@ -982,14 +1004,14 @@ static long follow_pmd_mask(struct vm_area_struct =
*vma,
>         }
>         if (unlikely(!pmd_leaf(pmdval))) {
>                 spin_unlock(ptl);
> -               return follow_page_pte(vma, address, pmd, flags, pages);
> +               return follow_page_pte(vma, address, end, pmd, flags, pag=
es);
>         }
>         if (pmd_trans_huge(pmdval) && (flags & FOLL_SPLIT_PMD)) {
>                 spin_unlock(ptl);
>                 split_huge_pmd(vma, pmd, address);
>                 /* If pmd was left empty, stuff a page table in there qui=
ckly */
>                 return pte_alloc(mm, pmd) ? -ENOMEM :
> -                       follow_page_pte(vma, address, pmd, flags, pages);
> +                       follow_page_pte(vma, address, end, pmd, flags, pa=
ges);
>         }
>         ret =3D follow_huge_pmd(vma, address, end, pmd, flags, pages);
>         spin_unlock(ptl);
> --
> 2.55.0
>
>
