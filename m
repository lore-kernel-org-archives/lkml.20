Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E134B95C2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967635; cv=pass; b=urRV5aUq8JzZpdZeZEJEulVS5Q/yZEiPy/TexTxhJd+OIb07d7PptdxR5OpK1XqtuEonoJlOSzzxNWrjMJw6qNWyHoQBzuroVjmWwAmLIDASVmuUoqQlgdLLEqI3r06scgbckC1RcCcAd+8sVnU5n6ajy4NzGHmDIvfDJVezkHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967635; c=relaxed/simple;
	bh=RjRSgudujTroQGX/lGqhIyzTeeSkjfjsxwTHk0iInF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5Glec5iYaF+hflENZOydEFxyVadTLqYBO7KBEQvioa9eKgA82JBHrNgt+WkAJ/SCZTNplPX0oZUwjBTHd9yH7WIzgf5vz+Env0j1vHrNnJxoTmCEaIB7AwzrCkzui5HshHZlVNJrmmdvXDEpRgj1vFEvQP1u+/gsGftgcLT8kM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdjopkf/; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdjopkf/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a17baef589so6085255e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791967628; cv=none;
        d=google.com; s=arc-20260327;
        b=YYKS5Cbx2nQAU6v8HsgYA8lL5alKdreevbdJrNSrOXkEK0aEN29BCYpgS7WRz37g1c
         vkE886jeJRuarMcdeEHVQgtQvUlZHcmx0Mlv/WgT0qpsx/eznRmnHm6MezTzy0W23+8E
         kKAQINR4tMrDJwP8GCvkNE0DQN4Nys2hQgCSqV/29V7gQ+KN1cHSaEoHzui4Vx8F1rff
         U0yxu4ZwupiwqHWJbvSYfNdOXUJZwJe+jN99Mt9l1zHTXqYmzvzuGQhacaVWSU/8tnnF
         goYs9MMfIdZgEo9xI87lHOr4iz6P38wxXpCQ0lqGR8ZMmDYMGB5CQpFpaAm5Vm0zH0Nr
         1hDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0cYhJsFY6GItBPWieM4stDAK2l4sudXXbycAkGrr3pY=;
        fh=AK4+qgTeQ+t8yGnO/WazNvS3jPfR7rvpZtlLzo79J3U=;
        b=H0HS6bvfqrUTTBwx3FEP2ij07P5zFGasQil48H3c0IfORZv2Eo9GER9OnpyNwFs2l9
         /OsIfQND5usnRISwQxbZIaqeG9hHB40pwXLrdJhtAlvOYtoqN6MD804+orHH22PWVxE5
         o3LYrXGoEZ+2Sz5hMpP1OP5rlBzkdkaKn8Wd5D8nkcP03JqwHneshoHybgVGomd1XEz2
         x4h0ZoUmeY+MzmHR8wSZaGlibdTE+bFsxe3rciVKsGxv1CMjVph4BEjNWWezb60FS2Dp
         TI9aVm9y/DRl9WclHado3rSzHUbsAE9caBM5ioCCOMxPUrNulEuz0RibnxB6wbJf2Xux
         zz8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791967628; x=1792572428; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cYhJsFY6GItBPWieM4stDAK2l4sudXXbycAkGrr3pY=;
        b=hdjopkf/W39t/1BjKq7m19zUq05ktnYY/QcxIIEu3manjo6G/zXhSjMTKvxL1V7ml+
         35T79dI1uVubQ74QaU5pDfe6PxQul5Ru9fWxRHVnpTJCpgnDQIFPwEzPJIXS8QCa0Mqs
         QeRL9mZrlH63Uh/ZcDXiGDOmPOSosJ2kP/rxR3GLIBbpc0cRi8CjgHxVo6/uuXi4sj0r
         8jVzKORbH2tw5mvAZyNFNgFfCGe4dWX0nl9nT/F/nRkvMDdvw+11eJEWco2oCYAhi47l
         t9xIUvYRW/ncrSnFRECe1wlQ0/dgSp4fyOq2LmU2yo225P0xuo/bsGFEL1IHCjIL3raV
         huTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967628; x=1792572428;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0cYhJsFY6GItBPWieM4stDAK2l4sudXXbycAkGrr3pY=;
        b=xpMEpJQmZtQjPfSRQmXVIfPs+D/rUmQTqqb7eWbcaCTZ4oUTD6XyywRX78Y8Oy22hR
         bPRmGJbeNX734hNOg7sCBFIhPp0EN/eJlqULfQsHztjEjG2LHDlhX1dKJqSIV0XYTron
         zdWEnkdjashTsVEp1Mwu8BTTAUpmD3eckZsnwb5bNQRPQMJVR1iDhlsmgaQkS5yZLgnF
         eAaMqg3L92Ac/L05N3caxKRpTIUqWqvW1tbAhZR6TbrHiA85MxTcOS/QYbPEsfGasCsa
         JcfjGNQql30Ia8mvWdsZRilD67S2DlIytpiJsE/a80CDSE9nsbUvTqreHyk5AF0jky1N
         1POw==
X-Forwarded-Encrypted: i=1; AKwUvByyqzsl9BezIxMY6iWDr83iBNMPx4SJg7PuBYak/tgA/W2y5pj4AuKO2STfok9/pfDoWs2LBB20aHR2+zE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu16kadvegYk4Q4D8V1ikmzQK4VBN90xMVWmEhyNpduv+G8m/V
	OhfEJm57H5oE0q8r5oZL+qMq3Acxc6yt4gYm7m01TawD8gqQ2KbuWEEPhO6BgRwcCB4cgAFrT8+
	1hLzEIiyS9+2KcfjR6St85M9hGJW6/G0=
X-Gm-Gg: AYBFou1UrkkaWsDg/8OL80/sRj/jmGIPvTM/hogOp/tygNpd3zSzj8L9/l7L4B4r0+6
	ze1xVoM8JDpqJ3ioS35m0iwS2reicIgJJ1x4boB0ndksJuJnjZcxgFwUkAy7xYw/re8mHE1FoQB
	RyKLb2RZhTpRQJAWhLBbnvZKD/ZkHFtc5DBhKF85iSzGAzmawqQrJKy+NP+95IX54fXyRYqlFnc
	ZarImIiIWZv2J323E7yUa4xZEKdoPCNSVM0YpvZj998od4Zs0bMWC9mQikffz4NGMs2eCKSQrp7
	p7gLRF+xcQoylgKx4Ve9sHbGW5DGefYrnxLezzuKWxqnEVOzO7exrG7j3A==
X-Received: by 2002:a05:600c:83c4:b0:4a1:7367:5395 with SMTP id
 5b1f17b1804b1-4a18e446f4amr296569785e9.2.1791967627867; Wed, 14 Oct 2026
 01:47:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002090947.869220-1-jiangwen6@xiaomi.com> <20261002090947.869220-2-jiangwen6@xiaomi.com>
 <7b3c3a39-4cf3-430d-9fd3-ba83e5175e72@arm.com>
In-Reply-To: <7b3c3a39-4cf3-430d-9fd3-ba83e5175e72@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Wed, 14 Oct 2026 16:46:55 +0800
X-Gm-Features: AclHuK-bFuc3dEYGYwD4zSgb8fq4NoGf2OiM-E1K3hrsnLGY-8dDIYkDzN8S8fw
Message-ID: <CAHKocdFOoDhjcuWXJatQ-AbSXyXuV+Q=sA1-iGiGrp7vhHZMBQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org, 
	chleroy@kernel.org, david@kernel.org, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 14:03, Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 02/10/26 2:39 pm, Wen Jiang wrote:
> > vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
> > set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
> > helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
> > unavailable on CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to
> > HugeTLB internals it does not otherwise need.
> >
> > Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
> > pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
> > __set_ptes() and __get_and_clear_full_ptes() directly, so they do not
> > depend on CONFIG_HUGETLB_PAGE.
> >
> > There is no caller yet: mm/vmalloc.c is converted later in this series,
> > once the generic fallbacks are in place.
> >
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Reviewed-by: Barry Song <baohua@kernel.org>
> > ---
> >  arch/arm64/include/asm/pgtable.h |  6 ++++++
> >  arch/arm64/mm/mmu.c              | 23 +++++++++++++++++++++++
> >  2 files changed, 29 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index 6000905a2e865..9b762eb68cff0 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -1978,6 +1978,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
> >
> >  #endif /* CONFIG_ARM64_CONTPTE */
> >
> > +#define __HAVE_ARCH_PTE_SET_HUGE
> > +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> > +               pgprot_t prot, unsigned long size);
> > +#define __HAVE_ARCH_PTE_CLEAR_HUGE
> > +pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size);
> > +
> >  #endif /* !__ASSEMBLER__ */
> >
> >  #endif /* __ASM_PGTABLE_H */
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 79d90226fd5dc..ae2f15618c97d 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -1912,6 +1912,29 @@ int pmd_clear_huge(pmd_t *pmdp)
> >       return 1;
> >  }
> >
> > +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> > +               pgprot_t prot, unsigned long size)
> > +{
> > +     unsigned long pfn = __phys_to_pfn(phys);
> > +     pte_t pte = pte_mkcont(pfn_pte(pfn, prot));
> > +     unsigned int nr = size >> PAGE_SHIFT;
> > +
> > +     VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
> > +     VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
> > +     VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
> > +
> > +     /* For vmap, there is no valid -> valid transition */
> > +     VM_WARN_ON(pte_valid(__ptep_get(ptep)));
> > +
> > +     __set_ptes(&init_mm, addr, ptep, pte, nr);
> > +}
> > +
> > +pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
> > +{
> > +     return __get_and_clear_full_ptes(&init_mm, addr, ptep,
> > +                                      size >> PAGE_SHIFT, 0);
> > +}
>
> I think we should have the same VM_WARN_ON() checks here, as for
> pte_clear_huge(), in addition to also warning for
> current->mm != &init_mm.
>
> We should make it clear that pte_clear_huge() gets called only for
> kernel mappings, and the range we operate on is definitely an aligned
> CONT range - which is why we do not go through get_and_clear_full_ptes ->
> contpte_get_and_clear_full_ptes, and possibly contpte_try_unfold(), but
> directly use __get_and_clear_full_ptes.
>

Hi Dev,

I'll add the alignment VM_WARN_ON() checks to pte_clear_huge() to
match pte_set_huge().

Regarding the current->mm != &init_mm check: these functions don't take
an mm parameter -- &init_mm is hardcoded in the function body.
current->mm would never equal &init_mm in practice: for user processes it
points to the process's own mm, and for kernel threads it is NULL.
So VM_WARN_ON(current->mm != &init_mm) would always fire.

The existing hugetlb helpers that vmalloc used before this decoupling
(huge_ptep_get_and_clear -> get_clear_contig) also take mm as a
parameter
and don't check current->mm either -- the caller simply passes &init_mm.

How about adding a comment to make the "kernel mapping only" intent
more explicit?
Something like:

 pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
 {
+       /* Kernel mappings only */
+
+       VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
+       VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
+
        return __get_and_clear_full_ptes(&init_mm, addr, ptep,
                                         size >> PAGE_SHIFT, 0);
 }

Thanks,
Wen
