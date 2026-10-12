Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431822E7F20
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790462; cv=pass; b=ctCLhqYmpj/l48FsZbqlNLJYiwUaj8LCK6USZD3ZlKLO1J0b49eOZ6TB+WqIMVNju91pi3E/kzYujy64oKu+gkwZ39u9ZPmn9brL5pPjnhArT6X7SqfrkzyosuLust7rmn1xeuZF5qNaHTsOKinjLmkoKqTgfFZwbGUe2XlIH7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790462; c=relaxed/simple;
	bh=v12vB9xMLSOxbVpgUfHF/VXLEylH3hlXSXQT1/J5c/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYFkMY89rv6+skVdd2Vb9pf8AJv78wasM6oF+3mVkUPAKqFWt0v+acviWcY2TPbIrlIsZ2y/iBW6GnmtK9a5dkdfPJXfgxiRayF6YcmUl05ZWUW6uYfm1tU9ASaqxQR+0HRrpWlEMKalkUs015Db4HTEtWYnSyZyZOChwBqy8Fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gith5bjZ; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gith5bjZ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1065864f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791790455; cv=none;
        d=google.com; s=arc-20260327;
        b=RaCIEvjgyf+Lx1pbHn5x89aA4yAFCGZWoywVoAz/v8DAVGFPWEocq4LUVzq0tDgzQE
         rZKOQvGzZ0bW4g971AQo5gmHlof4YxJyHDd8bTqTTqU4nz5BJQgWmiYirogCeFN2Ajxn
         F4ksp4BsSH25sFq9rLGXRY8Z+A7ASIqM/yKsuYA/ZDXDgQme6VMdWdxgmb+Ki9XnDJ9C
         0fobVAKq/JPCGElRW30mrOdFa/jsmOU+JZ7gSL7ncYfAwUh/AD55dS1PlDHJ2DU3hy53
         GO0AOW0rVOO1wAheQBE3F54SCn1oVJCEQ3a0tHDHFnxHpL+Z3wbaujtSwR/+YCSXacza
         QYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TB1tvVpc7k0BKK/tU4j4YuTf01twWs+L2M2upFeIsNA=;
        fh=/pK6lo0QkVImFZ+gz5RA+3hkV5vUFlxTJV9CVZeOr0s=;
        b=DGgoMhoX1Gx/gYU2O/GF2YTGOTnPiTFk6Yjb0IvUrqctbR2ZJ7CHWzkGJ640xW9hBD
         yuWzSGVaQrZc/lYhhFa/hzGSyIJ3QzBKkgPw62mNbrUcAzihpm7jymglzwaB5buRsFwh
         p5rb3Mzfto9jc43nQKfZfISkOForz1GVWCx+A0IZXmQ3B00fGBiq2SJzlgzKn6zCDteV
         rWD6q0fDFBr1bNFz80C/gNTURL9VtZeOfXJxp6EZa0rCQY64Q1NKUuX45f39D7fsqYir
         Gvmk1y68Py17u2Ub+TledwusNoJbsX5JfA5Lwm8xRzQOsZSSd/PtigrX2LVQpGCF/0eB
         VFEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791790455; x=1792395255; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TB1tvVpc7k0BKK/tU4j4YuTf01twWs+L2M2upFeIsNA=;
        b=gith5bjZS2WDuR6SGmWMOT3LCfKIr6QibCgHB2dTYp/NjGvkXA4iAavh4HuTdNaK+S
         M4QK2ht/FMqPIjAuhg+D0POgiTycTu3tzXYUH+V1OEqDpbDeYNKsDvdjOOJ492PZys8/
         94r9d+Z8eL4nIONQsFUZSTjlkor1gFmT4XIhR1LgSh/2rbjswNmx5wXJnTna0ADadlet
         4da3JqAw44wKeqVHkmi9/JjHR/E+6SPXud7Fu9sRbqdrt8dlQlBrukN0bhAamMGHH9l8
         bNRE8B7rNp8k/KQstftKMj4UOh0ZIQkSIKkBQmuvGkQxt/OlmS36S0ruZoizC5VCHE/6
         jeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790455; x=1792395255;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TB1tvVpc7k0BKK/tU4j4YuTf01twWs+L2M2upFeIsNA=;
        b=RKwwLyB6xu6T2hzpqgwGxiPJiBEO6BLpu8VVzycj4JPZM0H4REx4MUX1i/MA3/xetZ
         L8nSHPCMAht/SsYPRgZpjcW0qpPetnUPMbY/zgw94RVNTXKL+t4MXIehIFLO0wxscPjr
         mS25fy4ViaT3RH244TBNDPR1jOgCQtC+0vhQse20LsTjvXubh6WkRZGvOBxmgg1yH1vF
         m/YCZ7KgCu80PzMbtUeMHXo9WGsQzjqWu5jGD5wblsqRHMBgaQw0XrHVOkyf7eGKLrXo
         BBPSPM01MQd1xVa+UZI0U9yjfj/Z+PWIAvtQR7T2F0nk9TRw9Up5Wq6p0ZOwMPK6YKSC
         x7uA==
X-Forwarded-Encrypted: i=1; AKwUvBxhpg9xKScW7n1cvm/JLcTQQOTXuUQiUiUniTVVUsEF3ruWhmWcIB8pPt0e3lCdsH1jhL24GTpb5ae5MBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY/HGNrQOWwAUaM1OWsaJYtPCq/WFoYowhKt0Ibrm5+s0Sqr2e
	OtBwkPP/BtTWnGjeNZ0MXO1hMja/nxByrzNY0uoExe7ggMiLMnn0ODCZcQg0QQZkBCyyB4S7S0h
	zdx9NcTmSW+rFSzAsX4wOmmDqx8cSC1o=
X-Gm-Gg: AYBFou2ExwPLrFZIp/fZax62y/7IjcNHfoRbkcctevhio5k7SfaMJcZ5+5v/rQeu1j3
	c9ENgTqb0CjJ/P5OdTiAbuNbMVNfd4DKV9ZI0ZavfIU4KOnZWSLMT203UoWs6B4CZLP2r5VTfDb
	neERx4M0KWA/zrUlgVm/MZ7h4INqo7yjj9BDX9s4LYLDffQLGPVPdkkXI0dtTSE6Gh3Y8CZUfso
	HAqyTM/0zvDQQ0lIo7WLdC8XiYMlHgy2hDxy2e8ZN8AuvEvQoDXFqQRCIE5gFjO2psqCL+5sqYl
	4I8d9LOAAupOxr4iaDtxYy87GLUtIhlazp9Mw4TP9ryprmJDWp3JVLxL
X-Received: by 2002:a05:600c:154b:b0:49c:fed6:cd3f with SMTP id
 5b1f17b1804b1-4a18e4d0be2mr158510455e9.23.1791790455069; Mon, 12 Oct 2026
 00:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002090947.869220-1-jiangwen6@xiaomi.com> <20261002090947.869220-4-jiangwen6@xiaomi.com>
 <asudY_EhrT5fZGmZ@milan>
In-Reply-To: <asudY_EhrT5fZGmZ@milan>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Mon, 12 Oct 2026 15:34:02 +0800
X-Gm-Features: AclHuK_LlxXaCmKE3CgA4amsUlg18qyTu4ifi545sZ2ZwusM-AnLpZx1y3tgmDI
Message-ID: <CAHKocdH9Cmjb4oEVvZnxDhYRKfK+b00k3mm_YwWmSnO4fZ+qyg@mail.gmail.com>
Subject: Re: [PATCH v10 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, 
	anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org, 
	david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Oct 2026 at 22:29, Uladzislau Rezki <urezki@gmail.com> wrote:
>
> On Fri, Oct 02, 2026 at 05:09:40PM +0800, Wen Jiang wrote:
> > vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
> > huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
> > the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
> > couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
> >
> > Now that arm64 and powerpc/8xx provide pte_set_huge() and
> > pte_clear_huge(), add the generic fallbacks next to the existing
> > pmd/pud_set_huge() family and convert vmap_pte_range() and
> > vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
> > around the block-mapping paths are dropped, so PTE-level block mappings
> > now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
> > longer includes <linux/hugetlb.h>.
> >
> > The fallbacks exist only to keep the build working on architectures
> > without PTE-level block mapping support. They are unreachable there:
> > the callers only run when arch_vmap_pte_range_map_size() or
> > arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
> > which requires an arch implementation. BUILD_BUG() makes that
> > explicit rather than silently doing nothing.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Reviewed-by: Barry Song <baohua@kernel.org>
> > ---
> >  include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
> >  mm/vmalloc.c            | 19 ++++++-------------
> >  2 files changed, 35 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 8c093c119e5a8..a7fd51fec8a17 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -2204,6 +2204,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
> >  }
> >  #endif       /* CONFIG_HAVE_ARCH_HUGE_VMAP */
> >
> > +/*
> > + * PTE-level block mappings for vmap.
> > + *
> > + * pte_set_huge() only has to be implemented by architectures whose
> > + * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
> > + */
> > +#ifndef __HAVE_ARCH_PTE_SET_HUGE
> > +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
> > +                             phys_addr_t phys, pgprot_t prot,
> > +                             unsigned long size)
> > +{
> > +     BUILD_BUG();
> > +}
> > +#endif
> > +
> > +/*
> > + * Likewise, pte_clear_huge() only has to be implemented by architectures
> > + * whose arch_vmap_pte_range_unmap_size() can return a size other than
> > + * PAGE_SIZE.
> > + */
> > +#ifndef __HAVE_ARCH_PTE_CLEAR_HUGE
> > +static inline pte_t pte_clear_huge(pte_t *ptep, unsigned long addr,
> > +                                unsigned long size)
> > +{
> > +     BUILD_BUG();
> > +     return __pte(0);
> > +}
> > +#endif
> > +
> >  #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >  /*
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index bea9f76ed7e74..fb757d95bde25 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -38,7 +38,6 @@
> >  #include <linux/rbtree_augmented.h>
> >  #include <linux/overflow.h>
> >  #include <linux/pgtable.h>
> > -#include <linux/hugetlb.h>
> >  #include <linux/sched/mm.h>
> >  #include <asm/tlbflush.h>
> >  #include <asm/shmparam.h>
> > @@ -100,7 +99,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >       pte_t *pte;
> >       u64 pfn;
> >       struct page *page;
> > -     unsigned long size = PAGE_SIZE;
> > +     unsigned long size;
> >
> >       if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
> >               return -EINVAL;
> > @@ -121,17 +120,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
> >                       BUG();
> >               }
> >
> > -#ifdef CONFIG_HUGETLB_PAGE
> >               size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> >               if (size != PAGE_SIZE) {
> > -                     pte_t entry = pfn_pte(pfn, prot);
> > -
> > -                     entry = arch_make_huge_pte(entry, ilog2(size), 0);
> > -                     set_huge_pte_at(&init_mm, addr, pte, entry, size);
> > +                     pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
> >
> As far as i understand, X86_64 arches do not use this path. This
> specifically is only for ARM64 or powerpc. pte_set_huge() makes me
> thinking about huge-page mappings(PMD/PUD/hugetlb). This helper is
> about mutli page mapping on the PTE level.
>
> Better naming? pte_set_large()?
>
> Any thoughts?
>

Agreed, "huge" is misleading here: on arm64 these are CONT_PTE entries
and the helper writes a range of PTEs rather than a single leaf, so it
is not a PMD/PUD/hugetlb huge mapping. I'll rename them to
pte_set_large()/pte_clear_large() in v11.

Thanks,
Wen
