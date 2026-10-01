Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD2435C6B5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841753; cv=pass; b=PJD05bUBsAWVs2cJpTV3/rEyDu2UR/0n5BG62wiAiCs8IhBGBZjBGc+7d8iNHJgbvObTxeG7mQxkt+hbKVtd+3nZkEVp8USzF8iddew+UAN8FqrPyrMG09/9Y1HycXPMUQgvv0Nt1Wu/7mehf3X7HIH5qNaUeR0pi5Lsh5owAXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841753; c=relaxed/simple;
	bh=Z9ocL7EXJKoBOJM9sIy7S/mYCwwL/yYXrxGGwv2WVhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ui0G+KbIG52gHPgbmKWdW6Odr858ccztKINafmiQm5m3oq4wq6ha8oPOOLnx3/ClLTeKb43xLFsx/H1h+vFkXPdg5028fF3GSrZ7TxFJGjAvT5kiqpCKJQ2mJJFid4vSbc/ISeGriGwjXhWFduulYo3kM6XIjqQrDP05m1lUzD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hc8TuhO5; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hc8TuhO5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so4820932f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790841749; cv=none;
        d=google.com; s=arc-20260327;
        b=tAiQurab/qHL/tgOCD4Ys0rCVCfXu4HG1HXPrMp26o1l/KXT9FlYeGRh+DoqlVhOfs
         UPeTzS7JD0hwgI3gPzGR6UNwi2e7fbDRoGrZlpHWPxQ8ZgaqWogzVJveqwFIFcgFuq9D
         7jx1ti3fxW0e7jvwti2S65y5DAUA/H03yUJrrMVu8PHyP9qYdccNmob8OasS0NdXUSCB
         JvW/21pQrYvo+/HDaFRjS6PeavxXgcW+/r+TsYd50Aiky/GnDM/I5qkcxbhzyd8T5wHr
         W6GMZLjpOai3GOiR+p7ij5Fd+I6L3irnvxZb5OWj9HSbqdtgfiYnXvSulHReDH147Nl0
         3sOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8wFYgQFxyClJH+0q2sU9iXyjK0XmqVNpkJ48os8SONM=;
        fh=AReG1KFqGKStN5VqljmNX6RGX3PvJHlwB9pzCsOIefM=;
        b=ISBroY7QY2qOiRKj6J1W7rfYqaPM9Jb3XNfbSAxhVFLFkiSuB51RO/ZdPIwuikS01q
         xuHpm7H7hHZxyo9ZluNVb9jyLh5Sz73Bg5uVC7HFtUrl0Ia226S6v2hJh04hHkFC+MiV
         UalZl1WAyL7WDE8hOzXy6J9u0Wc3CNKDWYStNavqq3hCUzmxHgDSFWPb4NnbYm6Tr2aL
         oaZ04J2D80aeCuQWIL0vwQXxZBEuiTQyqotiPdtPVqAHAFWrOsoECr1D6sWNiZVREkBG
         G4kSXh+t9NEgyuQe74a2O1XW5MkOqRiyH6fib9TAzW5fC8IGr9FNAlqkTpvicSEoFtgq
         FMqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841749; x=1791446549; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wFYgQFxyClJH+0q2sU9iXyjK0XmqVNpkJ48os8SONM=;
        b=hc8TuhO5dFPdfAbwfIwxRdhtcqqvIrkBsz5OLwPYYNQCqvWDrPQgSpSpzlwXrSvjta
         cKrVoL2sko+RHXxGUHUrKg0KOMfGlSe3vVu4La7mK31mZpqCx1TKJdvcPBD2reKdDWGn
         cxRn3sPyrR1MFrWhhFu5RzudwACd94CAJUcQHTBhkDCoi3V4wUoXLQecxZ8vynHh40St
         Pao1/n8a8jKsEgZxF0rlsyCAFR6pyjtEI4Zkjgz0sARQ8wHJeDgwZLDjhJ14cAtDRTGo
         mrclMjlADOsHPRrTPnamVMxuG6qbshvWXsssSnpmEJHL3n9mZplhYUVI+SyVUSNlT6Ms
         nJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841749; x=1791446549;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8wFYgQFxyClJH+0q2sU9iXyjK0XmqVNpkJ48os8SONM=;
        b=aeZIi9GfocBW3h+aif/BVS1JuQwfbRehkOGIKQIK0iR6K+fCsVAKg5EttW3mFqI+BX
         TvCVU4uYJOzGcI8+3lj59dP4BBGGQ1r4DeIbDjcozFccortrFwYGfEN6Bkq/UKewRVkg
         OM76G0JIesJNraiJtLI+U2wcqVt9FlqmbHtJJB9RXdk+B04EKoqBoLFfbArrKJl+X5LL
         XcvWFKWI6GzFXlFoXy0hfN24VwO7CIFE5jH/rAY2DKJTwh9j2iq3aquF5n+zLd9ohXUf
         3dYrCXS8jg33ObuvdgUcQxxzYR1Px1wAoXamYLhcsSK92cU7WTRx8rV9tABrvjXfl98H
         +GuA==
X-Forwarded-Encrypted: i=1; AKwUvByCUmFIsOCkxSuE2iwvHSajn05HXpQ4283jXYrPmBm8FGXU7RWxQGTlb92CGrgWIHkGJ4Jwx0R2PHgmKI4=@vger.kernel.org
X-Gm-Message-State: AFuF++nl61dcEuzDKZH+9lPRFVeik62Dj7mUsIcXZzmpd6XyFaGrYH1C
	PcqKZRQ1mQpoGylaONni+XW8vZBrLS8ZRaURXrt325c6p3y+Vy/+wRZy+hxANbhFMVv/oiIVCDi
	MiqdYI3TPhjzrOHHCt19a9BtetBHv0GU=
X-Gm-Gg: AYBFou16ZPB9tRhWtgaJkfejW5HQgoxnu74KtygldCBD5aDvR0/buIv3QWwO1xh1B7b
	q4smP0f6WH2m77WcUz3iEMUseCQmi+vQet92DbcNZuAonCabfd4LZiDo880+nq3ZNFsRqBR9fcz
	qJMFoZSv5RB5p6tUy36zVjyur2t/O9GZBTEonm46loRLv7UYpM+eADYyhftvX6gNcFJM6HmCF4X
	hsjxNBkbKiqNdqeit1eeOL69VZlQ/+P1F4O6W7x8Kd0VQJinNW9Kl1NNkb/reRf8QWJygpBX9bW
	OmmqksZHVeGrCPnZklLA8utLH2j5Nntzxo0cXbzhe9NMTFb+eymQB2LP
X-Received: by 2002:a05:600c:3152:b0:49c:fc6e:8cbb with SMTP id
 5b1f17b1804b1-4a01b131631mr63017475e9.31.1790841748605; Thu, 01 Oct 2026
 01:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923062832.479455-1-jiangwen6@xiaomi.com> <20260923062832.479455-8-jiangwen6@xiaomi.com>
 <ar0nuJ7ocTMgbiMu@milan>
In-Reply-To: <ar0nuJ7ocTMgbiMu@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Thu, 1 Oct 2026 16:02:17 +0800
X-Gm-Features: AclHuK9TMMGS3_KK3AGC469G5gqBizlXQV9uB6i_baT8npA09Tvz5gZK4c--_ZU
Message-ID: <CAHKocdH-NeWYJBrCVfGctuDyh=D4a2YrzUf1VxB3cG7Di-EAMw@mail.gmail.com>
Subject: Re: [PATCH v9 07/10] mm/vmalloc: extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 23:16, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Wed, Sep 23, 2026 at 02:28:29PM +0800, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
> > provides a clean interface by taking struct page **pages and mapping them
> > via direct PTE iteration. This avoids the page table rewalk seen when
> > using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> >
> > Extend it to support larger page_shift values, and add PMD- and
> > contiguous-PTE mappings as well.
> >
> > Rename it to vmap_pages_range_noflush_walk() since it now handles
> > more than just small pages.
> >
> > For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
> > iterate over pages one by one via vmap_range_noflush(), which would
> > otherwise lead to page table rewalk. The code is now unified with the
> > PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > ---
> >  mm/vmalloc.c | 84 +++++++++++++++++++++++++++++++---------------------
> >  1 file changed, 50 insertions(+), 34 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index d475e52110e4a..6e0dec73107a7 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -558,8 +558,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
> >
> >  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> >               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> > -             pgtbl_mod_mask *mask)
> > +             pgtbl_mod_mask *mask, unsigned int shift)
> >  {
> > +     unsigned long pfn, size;
> > +     unsigned int steps;
> >       int err = 0;
> >       pte_t *pte;
> >
> > @@ -590,9 +592,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> >                       break;
> >               }
> >
> > -             set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> > -             (*nr)++;
> > -     } while (pte++, addr += PAGE_SIZE, addr != end);
> > +             pfn = page_to_pfn(page);
> > +             size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
> > +             steps = PFN_DOWN(size);
> > +     } while (pte += steps, *nr += steps, addr += size, addr != end);
> >
> nr_mapped_pages?
>

As noted in the patch 6 reply, I'll rename steps to nr_pages here as well.

> >
> >       lazy_mmu_mode_disable();
> >       *mask |= PGTBL_PTE_MODIFIED;
> > @@ -602,60 +605,88 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> >
> >  static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
> >               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> > -             pgtbl_mod_mask *mask)
> > +             pgtbl_mod_mask *mask, unsigned int shift)
> >  {
> >       pmd_t *pmd;
> >       unsigned long next;
> > +     int err;
> >
> >       pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
> >       if (!pmd)
> >               return -ENOMEM;
> >       do {
> >               next = pmd_addr_end(addr, end);
> > -             if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
> > -                     return -ENOMEM;
> > +
> > +             if (shift >= PMD_SHIFT) {
> > +                     struct page *page = pages[*nr];
> > +                     phys_addr_t phys_addr;
> > +
> > +                     if (WARN_ON(!page))
> > +                             return -ENOMEM;
> > +                     if (WARN_ON(!pfn_valid(page_to_pfn(page))))
> > +                             return -EINVAL;
> > +
> > +                     phys_addr = page_to_phys(page);
> > +
> > +                     if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, shift)) {
> > +                             *mask |= PGTBL_PMD_MODIFIED;
> > +                             *nr += 1 << (PMD_SHIFT - PAGE_SHIFT);
> >
> *nr += 1 << (PMD_SHIFT - PAGE_SHIFT); --->  *nr += 1U << (PMD_SHIFT - PAGE_SHIFT);
> as it used to be?
>

Agreed, I'll use 1U.

> > +                             continue;
> > +                     }
> > +             }
> > +             err = vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift);
> > +             if (err)
> > +                     return err;
> >       } while (pmd++, addr = next, addr != end);
> >       return 0;
> >  }
> >
> >  static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
> >               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> > -             pgtbl_mod_mask *mask)
> > +             pgtbl_mod_mask *mask, unsigned int shift)
> >  {
> >       pud_t *pud;
> >       unsigned long next;
> > +     int err;
> >
> >       pud = pud_alloc_track(&init_mm, p4d, addr, mask);
> >       if (!pud)
> >               return -ENOMEM;
> >       do {
> >               next = pud_addr_end(addr, end);
> > -             if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
> > -                     return -ENOMEM;
> > +             err = vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift);
> > +             if (err)
> > +                     return err;
> >       } while (pud++, addr = next, addr != end);
> >       return 0;
> >  }
> >
> >  static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
> >               unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> > -             pgtbl_mod_mask *mask)
> > +             pgtbl_mod_mask *mask, unsigned int shift)
> >  {
> >       p4d_t *p4d;
> >       unsigned long next;
> > +     int err;
> >
> >       p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
> >       if (!p4d)
> >               return -ENOMEM;
> >       do {
> >               next = p4d_addr_end(addr, end);
> > -             if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
> > -                     return -ENOMEM;
> > +             err = vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift);
> > +             if (err)
> > +                     return err;
> >       } while (p4d++, addr = next, addr != end);
> >       return 0;
> >  }
> >
> > -static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> > -             pgprot_t prot, struct page **pages)
> > +/*
> > + * It can take an array of pages which are not all contiguous, but it
> > + * may have contiguous chunks, as hinted by @shift.
> > + */
> > +static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
> > +             pgprot_t prot, struct page **pages, unsigned int shift)
> >  {
> >       unsigned long start = addr;
> >       pgd_t *pgd;
> > @@ -670,7 +701,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> >               next = pgd_addr_end(addr, end);
> >               if (pgd_bad(*pgd))
> >                       mask |= PGTBL_PGD_MODIFIED;
> > -             err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
> > +             err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
> >               if (err)
> >                       break;
> >       } while (pgd++, addr = next, addr != end);
> > @@ -693,27 +724,12 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> >  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> >               pgprot_t prot, struct page **pages, unsigned int page_shift)
> >  {
> > -     unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> > -
> >       WARN_ON(page_shift < PAGE_SHIFT);
> >
> This is not about this patch but probably on that WARN_ON we should bail out
> early.
>

I'll send a separate cleanup patch changing it to:

        if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
                return -EINVAL;

Thanks,
Wen
> --
> Uladzislau Rezki
