Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFFA3AE1BC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483117; cv=pass; b=UFw7S/hD/MCs5mJ8xQRn7PWiMBD+nrnpAzwK5y8Xwi+8kuyIqQJhXEvWdHB2D/YlO0TAfJrTcn+bbsYKYEd1nAQ6A3YjoqsdT8z8S44NTaFNWk5N8I6O9uBDIkSeFQyoe6ZapOYGVWxRQgtkA0/61NWN0vegXFQoVSnFRyyJ9TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483117; c=relaxed/simple;
	bh=v/QmfXMnxoIWgdev+GCUEZw7H49HtDlO6GqIf0JOWNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWrG6j0S+csr6LqrGsa3DaaqYctO9Wvhvca9we5RW9YkMl+qeTSwDQhwoniG1OE+I2huAeoI/ZZKSSy0Rfc1mWBhh8aSod+aXoCGOrtY6Oj3wqm6gUjJ9oREKlOzOQtsOtZ//CwvYOLj9yV/0IsdzZi/dN5KfWYFAms06IriWvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eC/hHhLZ; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eC/hHhLZ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c315729ad50so483157066b.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791483112; cv=none;
        d=google.com; s=arc-20260327;
        b=RQLNZjJxaTog4HN1hsWEWUQoGkviPmnKhUVz4x0Jiq0OgtGjOhbwp+z+7iDCZQiRG3
         Vu4+RDtBv6aWIrIizcUMEreaC+0bUx12Ve73em/DMSozNeH1qmawzYM8EthwFkpIH8Cy
         4GT0im9BQ28E0ZGSDmWi1ptKFTm0sHL8biLuDacyYMyPnygiOdyZhsCgBEFxkGuiEdrm
         bQArS/QcCDNiYG5BDPX8bJ5DO6Cu4Gf20IZ4aJUCXdxETKzZCnCk8z1ArzMyk/M6sw0m
         ecgsGL9oicGGc9p5i3rwG/1ns9Tu9vLqG8B0sSIMyW+OK+HtR7BQ7G2ED7s35VZXm3tk
         2SCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mJueXiMU6C3+5L1e5alLDOg0bAXaz1Z72DpQmQMXcyc=;
        fh=Y3FBMmJZfzu0flyYmYnVQMfrrOACX+tW84ROgqMVX4U=;
        b=oB2K7S3JosCEUv4NGY2CSY594SsrTTOFn+N0rIXKnWJ3trhB7ZCXQ4gS/zvxpMJCTV
         IgbFpHRLT2kD8SsCi9IN/LqoZ+il/AA1QgioklskmKnFVTnYrUi7zSUiV86ijPk+kfjI
         kXMezvmj6H+Do+K5/yj3asRck9cRAOQkP6WPn6CBp2dIVTntmpnzAyXp2I8f2Gl7h1VF
         DSvLuCza/ke4RHye9zcdltthGfHzEzMRDoQPgjzN0Jg12VlbG743FxpIKpE+Bk7gcRVJ
         ALJ/DgaWI0Tnym/er70P7v8MKGNvLNvFxmxqUZgYeGFDGdTO5XCQik0zRCimtC5adYkX
         TRsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791483112; x=1792087912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mJueXiMU6C3+5L1e5alLDOg0bAXaz1Z72DpQmQMXcyc=;
        b=eC/hHhLZl4H0PhCWnx3yl9y966AtveN8OJJ/0nuTaWqUSBkpFBDS2VhNJUsic7luQI
         27H1mkY1xu+LlsGYLmH+074HSBOajdAt9zAgHAK4qCSWApCFHtlNmxCEx7STCTDcSuMt
         4Xj0BDabBk0BDbulU9DQUuwCNxLRZ+t/Xfql44jmEvkJW2VlqJfVA80712rpwmOV3w4G
         Bf6BbOj8w0MV3mmGQLTXrYx5TndHKE4yQ33hfKgldmbLTEYQE/XCVbfJSlO60GOK/44K
         Ut0Wm0lUQLV4ve1qO7XGP7h52FggLXUauUZ4cS0uKth1KDuxD1QS+Qlisw32uoV1GRzb
         0XYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791483112; x=1792087912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mJueXiMU6C3+5L1e5alLDOg0bAXaz1Z72DpQmQMXcyc=;
        b=TSD+Sf98naq41n7k3gtVby/G/8FSNEk18G44N5P5zqdMvadm3EBTX7HLenL3m3pyGX
         zZTgvqnuxfZb7PV68s595NQn0WsqUrKZzl9YmSu6egXQG09jcUnoZ9NyVBej5Fb7oj42
         MGsoMnRD17OhsMbBKNr5nZ7o4lIjze4uP85c0+Wx9SezVF7mMKnDfXLCsTtlu611VeSI
         IQWEsLNkNluuA4oEf68NIcFKq6oy9n0NtRXClXpwZ0Iz9YNdcRtNYUOpjec3mmrzSL5K
         z7ILd8Fa8I7yp78k6U2VcjvZupir5hg9zEUcO1ZjX6e6i83YAP2mzPPERsB+QB0O1Ew4
         TlQA==
X-Forwarded-Encrypted: i=1; AKwUvBwzpTUoLxqTnKfwv9be+zXgxgu0bXbeSbBe3/mYa4J63BHO2t6XlTLhR3XPRLm+W32RqVA6ZDT+bm9224E=@vger.kernel.org
X-Gm-Message-State: AFuF++nl3byweJJKOAYJnzFkSA7cyDJZ3Du6m/s2wkKy4fPfehZGVVZz
	I2Caw2wUnsLL2yKCBz4y2cGLcErl/suHO1To/dDw8hey0J9K3qm8luAAcTUsJDHSd3Oj809Z9p/
	Z/zEqL27icmfy8I3YLfEpDhW4YUEiuLU=
X-Gm-Gg: AYBFou06K4xAXgkHhs+bvEtyXJKAttLmsIakPqTjW4in9Yjv17yp1EIX+wPW2OIWYLc
	LplEAT/897FE/TiU/e4ESrYpb2fYdscgZQvhtTIHKO+3Qu/h/WhUiF2P9hJTyZt5kxffuxWtm4Q
	C+UdryF4+3DIcEVgyMWlyCZB+F0jksP2NLjy/1eXQ8q9WFkpAjQMcfrEn+t0wYCq15kq7RZH0gX
	STC9a/e9lOcns4l7CYb91f1P+og2HoHtZQlMUPLdfEl4SaDIGgxy+mknYtg3UxD4Gc8z3AWBnNr
	RGSgxPmuUH/FS0rn8IQf3See3/yCXEcryQtid/wkXNngXDzuj02/nQLbsRZ7FSQWbfhb8iW7/1x
	906S/XZvNLnRMla/Mtu3Wf/e67DnavI+kCO/jgfXw2Q==
X-Received: by 2002:a17:907:3f9b:b0:c26:1648:a062 with SMTP id
 a640c23a62f3a-c317be58e90mr628369066b.29.1791483111643; Thu, 08 Oct 2026
 11:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com> <20261007-alpha-hugepages-v2-6-8e108af2d961@gmail.com>
In-Reply-To: <20261007-alpha-hugepages-v2-6-8e108af2d961@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 8 Oct 2026 20:11:39 +0200
X-Gm-Features: AclHuK-aqLSIZxF96Cz9j30E0cCpQF4i_m-jLtt7e-Ep5i5uuGymRtDv63F-xQA
Message-ID: <CA+=Fv5RgEQDkM34g_b60uPVALVHwEgShQhsq3P_gnSH28ZmGdg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] alpha: implement hugetlb support
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Oct 8, 2026 at 5:24=E2=80=AFAM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Alpha has no leaf entry above the last page table level, so the only
> huge pages it can offer are granularity hint blocks: 64KB, 512KB and 4MB
> with 8KB pages. Register all three as hstates, with 4MB as the default.
> There is no PMD sized huge page, hence no transparent huge pages, no PMD
> page table sharing and no gigantic pages.
>
> As with arm64's contiguous PTEs, each PTE of a block keeps the frame
> number of its own page, so a block is written with set_ptes(). Each
> hstate's buddy order is its hint order, so a hugetlb folio is always
> naturally aligned physically, as the hint requires, including after a
> demote.
>
> All PTEs of a block must agree in bits <15:0> (note 2 of Table 22-3 of
> the Alpha Architecture Reference Manual), and both __ACCESS_BITS and
> __DIRTY_BITS reach into that range, so every update rewrites the whole
> block and huge_ptep_get() merges the young and dirty state back
> together. Rewriting a valid block in place would leave its PTEs
> disagreeing part way through, so changes to a valid block go through
> break before make, following the procedure in section 11.6.1.
>
> The hint is advisory, so this is safe on implementations that ignore it,
> and gup_fast needs no changes since it walks the individual PTEs.
>
> Enabling CONFIG_HUGETLB_PAGE derives pageblock_order from
> HUGETLB_PAGE_ORDER, which lowers it from 10 to 9 and so halves the
> anti-fragmentation and compaction granularity from 8MB to 4MB.
>
> Hugepage migration is left disabled, since it has not been tested.
>
> Co-developed-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig               |   1 +
>  arch/alpha/include/asm/hugetlb.h |  43 ++++++
>  arch/alpha/include/asm/page.h    |  13 ++
>  arch/alpha/mm/Makefile           |   2 +
>  arch/alpha/mm/hugetlbpage.c      | 308 +++++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 367 insertions(+)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index b5b02bb42aca..b2c359b947f6 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -19,6 +19,7 @@ config ALPHA
>         select ARCH_NO_PREEMPT
>         select ARCH_NO_SG_CHAIN
>         select ARCH_SUPPORTS_ATOMIC_RMW
> +       select ARCH_SUPPORTS_HUGETLBFS
>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>         select ARCH_USE_CMPXCHG_LOCKREF
> diff --git a/arch/alpha/include/asm/hugetlb.h b/arch/alpha/include/asm/hu=
getlb.h
> new file mode 100644
> index 000000000000..ff69e24c775d
> --- /dev/null
> +++ b/arch/alpha/include/asm/hugetlb.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ALPHA_HUGETLB_H
> +#define _ALPHA_HUGETLB_H
> +
> +#include <asm/page.h>
> +
> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t fla=
gs);
> +#define arch_make_huge_pte arch_make_huge_pte
> +
> +#define __HAVE_ARCH_HUGE_PTEP_GET
> +extern pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr,
> +                          pte_t *ptep);
> +#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
> +extern void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> +                           pte_t *ptep, pte_t pte, unsigned long sz);
> +#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
> +extern pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long=
 addr,
> +                                    pte_t *ptep, unsigned long sz);
> +#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
> +extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> +                                  unsigned long addr, pte_t *ptep);
> +#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
> +extern void huge_ptep_set_wrprotect(struct mm_struct *mm, unsigned long =
addr,
> +                                   pte_t *ptep);
> +#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
> +extern int huge_ptep_set_access_flags(struct vm_area_struct *vma,
> +                                     unsigned long addr, pte_t *ptep,
> +                                     pte_t pte, int dirty);
> +#define __HAVE_ARCH_HUGE_PTE_CLEAR
> +extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
> +                          pte_t *ptep, unsigned long sz);
> +
> +/*
> + * The generic version does not flush, which would leave the old transla=
tion
> + * live across a restrictive change to PTE bits <15:0>.
> + */
> +#define huge_ptep_modify_prot_start huge_ptep_modify_prot_start
> +extern pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma,
> +                                        unsigned long addr, pte_t *ptep)=
;
> +
> +#include <asm-generic/hugetlb.h>
> +
> +#endif /* _ALPHA_HUGETLB_H */
> diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.=
h
> index 59d01f9b77f6..67053c52953f 100644
> --- a/arch/alpha/include/asm/page.h
> +++ b/arch/alpha/include/asm/page.h
> @@ -6,6 +6,19 @@
>  #include <asm/pal.h>
>  #include <vdso/page.h>
>
> +#ifdef CONFIG_HUGETLB_PAGE
> +/*
> + * The default huge page is the largest granularity hint block, 4MB. All
> + * three hint sizes are registered as hstates, hence HUGE_MAX_HSTATE, wh=
ich
> + * linux/hugetlb.h needs before it includes asm/hugetlb.h.
> + */
> +#define HPAGE_SHIFT            22
> +#define HPAGE_SIZE             (_AC(1, UL) << HPAGE_SHIFT)
> +#define HPAGE_MASK             (~(HPAGE_SIZE - 1))
> +#define HUGETLB_PAGE_ORDER     (HPAGE_SHIFT - PAGE_SHIFT)
> +#define HUGE_MAX_HSTATE                3
> +#endif
> +
>  #ifndef __ASSEMBLER__
>
>  #define STRICT_MM_TYPECHECKS
> diff --git a/arch/alpha/mm/Makefile b/arch/alpha/mm/Makefile
> index 2d05664058f6..c022e55f231a 100644
> --- a/arch/alpha/mm/Makefile
> +++ b/arch/alpha/mm/Makefile
> @@ -4,3 +4,5 @@
>  #
>
>  obj-y  :=3D init.o fault.o tlbflush.o
> +
> +obj-$(CONFIG_HUGETLB_PAGE) +=3D hugetlbpage.o
> diff --git a/arch/alpha/mm/hugetlbpage.c b/arch/alpha/mm/hugetlbpage.c
> new file mode 100644
> index 000000000000..ca36af4667dc
> --- /dev/null
> +++ b/arch/alpha/mm/hugetlbpage.c
> @@ -0,0 +1,308 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Alpha huge page support, built on the page table entry granularity hi=
nt
> + * described in asm/pgtable.h. All PTEs of a block have to agree in bits
> + * <15:0>, so every update below rewrites the whole block.
> + */
> +
> +#include <linux/hugetlb.h>
> +#include <linux/mm.h>
> +#include <linux/pgtable.h>
> +
> +#include <asm/tlbflush.h>
> +
> +/*
> + * Every hint size is smaller than PMD_SIZE, so a block always fits insi=
de a
> + * single last level page table and its entry count is just its page cou=
nt.
> + */
> +static inline unsigned long num_contig_ptes(unsigned long sz)
> +{
> +       return sz >> PAGE_SHIFT;
> +}
> +
> +/* Hint order that maps @sz, or 0 if @sz is not a hint size. */
> +static unsigned int gh_order_from_size(unsigned long sz)
> +{
> +       unsigned int order;
> +
> +       for_each_gh_order(order)
> +               if (gh_cont_size(order) =3D=3D sz)
> +                       return order;
> +
> +       return 0;
> +}
> +
> +pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
> +                     unsigned long addr, unsigned long sz)
> +{
> +       unsigned int order =3D gh_order_from_size(sz);
> +       pgd_t *pgd;
> +       p4d_t *p4d;
> +       pud_t *pud;
> +       pmd_t *pmd;
> +
> +       if (!order)
> +               return NULL;
> +
> +       pgd =3D pgd_offset(mm, addr);
> +       p4d =3D p4d_alloc(mm, pgd, addr);
> +       if (!p4d)
> +               return NULL;
> +
> +       pud =3D pud_alloc(mm, p4d, addr);
> +       if (!pud)
> +               return NULL;
> +
> +       pmd =3D pmd_alloc(mm, pud, addr);
> +       if (!pmd)
> +               return NULL;
> +
> +       return pte_alloc_huge(mm, pmd, addr & gh_cont_mask(order));
> +}
> +
> +pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
> +                      unsigned long sz)
> +{
> +       unsigned int order =3D gh_order_from_size(sz);
> +       pgd_t *pgd;
> +       p4d_t *p4d;
> +       pud_t *pud;
> +       pmd_t *pmd;
> +
> +       if (!order)
> +               return NULL;
> +
> +       pgd =3D pgd_offset(mm, addr);
> +       if (!pgd_present(pgdp_get(pgd)))
> +               return NULL;
> +
> +       p4d =3D p4d_offset(pgd, addr);
> +       if (!p4d_present(p4dp_get(p4d)))
> +               return NULL;
> +
> +       pud =3D pud_offset(p4d, addr);
> +       if (!pud_present(pudp_get(pud)))
> +               return NULL;
> +
> +       pmd =3D pmd_offset(pud, addr);
> +       if (!pmd_present(pmdp_get(pmd)))
> +               return NULL;
> +
> +       return pte_offset_huge(pmd, addr & gh_cont_mask(order));
> +}
> +
> +/*
> + * A block is only as large as its own hint, so the walk can skip to the=
 end of
> + * the containing last level page table but no further.
> + */
> +unsigned long hugetlb_mask_last_page(struct hstate *h)
> +{
> +       return PMD_SIZE - huge_page_size(h);
> +}
> +
> +pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *pte=
p)
> +{
> +       pte_t orig_pte =3D ptep_get(ptep);
> +       unsigned long i, ncontig;
> +
> +       /* Swap, migration and marker entries carry no hint. */
> +       if (!pte_huge(orig_pte))
> +               return orig_pte;
> +
> +       ncontig =3D gh_pte_num(pte_gh_order(orig_pte));
> +
> +       for (i =3D 0; i < ncontig; i++, ptep++) {
> +               pte_t pte =3D ptep_get(ptep);
> +
> +               if (pte_dirty(pte))
> +                       orig_pte =3D pte_mkdirty(orig_pte);
> +               if (pte_young(pte))
> +                       orig_pte =3D pte_mkyoung(orig_pte);
> +       }
> +
> +       return orig_pte;
> +}
> +
> +static pte_t get_clear_contig(struct mm_struct *mm, unsigned long addr,
> +                             pte_t *ptep, unsigned long ncontig)
> +{
> +       pte_t pte =3D ptep_get_and_clear(mm, addr, ptep);
> +       bool present =3D pte_present(pte);
> +
> +       while (--ncontig) {
> +               pte_t tmp_pte;
> +
> +               ptep++;
> +               addr +=3D PAGE_SIZE;
> +               tmp_pte =3D ptep_get_and_clear(mm, addr, ptep);
> +               if (present) {
> +                       if (pte_dirty(tmp_pte))
> +                               pte =3D pte_mkdirty(pte);
> +                       if (pte_young(tmp_pte))
> +                               pte =3D pte_mkyoung(pte);
> +               }
> +       }
> +
> +       return pte;
> +}
> +
> +static pte_t get_clear_contig_flush(struct mm_struct *mm, unsigned long =
addr,
> +                                   pte_t *ptep, unsigned long ncontig)
> +{
> +       pte_t orig_pte =3D get_clear_contig(mm, addr, ptep, ncontig);
> +       struct vm_area_struct vma =3D TLB_FLUSH_VMA(mm, 0);
> +
> +       if (!pte_none(orig_pte))
> +               flush_tlb_range(&vma, addr, addr + ncontig * PAGE_SIZE);
> +
> +       return orig_pte;
> +}
> +
> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t fla=
gs)
> +{
> +       unsigned int order =3D gh_order_from_size(1UL << shift);
> +
> +       /*
> +        * Not every caller asks for a size Alpha can hint; mm/debug_vm_p=
gtable.c
> +        * probes with PMD_SHIFT. Leave the entry alone rather than compl=
aining.
> +        */
> +       if (order)
> +               entry =3D pte_mkgh(entry, order);
> +
> +       return entry;
> +}
> +
> +void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *pt=
ep,
> +                    pte_t pte, unsigned long sz)
> +{
> +       unsigned long i, ncontig =3D num_contig_ptes(sz);
> +
> +       /* The hint requires the block to be naturally aligned in the VA =
too. */
> +       VM_WARN_ON_ONCE(addr & (sz - 1));
> +
> +       if (!pte_present(pte)) {
> +               /*
> +                * Swap, migration and marker entries hold no frame numbe=
r, so
> +                * every slot gets the same value.
> +                */
> +               for (i =3D 0; i < ncontig; i++, ptep++, addr +=3D PAGE_SI=
ZE)
> +                       set_ptes(mm, addr, ptep, pte, 1);
> +               return;
> +       }
> +
> +       /*
> +        * All PTEs of a block must agree in bits <15:0> (ARM Table 22-3,=
 note
> +        * 2), which rewriting a valid block in place would violate part =
way
> +        * through. Invalidate it everywhere first, following ARM 11.6.1:=
 the
> +        * invalidate has to assume the hint is zero, so it must cover ev=
ery
> +        * page of the block.
> +        */
> +       if (pte_present(ptep_get(ptep)))
> +               get_clear_contig_flush(mm, addr, ptep, ncontig);
> +
> +       /* set_ptes() advances the frame number for each entry. */
> +       set_ptes(mm, addr, ptep, pte, ncontig);
> +}
> +
> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
> +                             pte_t *ptep, unsigned long sz)
> +{
> +       return get_clear_contig(mm, addr, ptep, num_contig_ptes(sz));
> +}
> +
> +/*
> + * The block size comes from the hstate rather than from the entry, beca=
use
> + * this is also reached for non-present entries, which carry no hint.
> + */
> +pte_t huge_ptep_clear_flush(struct vm_area_struct *vma, unsigned long ad=
dr,
> +                           pte_t *ptep)
> +{
> +       unsigned long sz =3D huge_page_size(hstate_vma(vma));
> +
> +       return get_clear_contig_flush(vma->vm_mm, addr, ptep,
> +                                     num_contig_ptes(sz));
> +}
> +
> +pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned l=
ong addr,
> +                                 pte_t *ptep)
> +{
> +       return huge_ptep_clear_flush(vma, addr, ptep);
> +}
> +
> +/* True if any entry of the block differs from @pte outside the frame nu=
mber. */
> +static bool gh_access_flags_changed(pte_t *ptep, pte_t pte,
> +                                   unsigned long ncontig)
> +{
> +       unsigned long i;
> +
> +       for (i =3D 0; i < ncontig; i++)
> +               if ((pte_val(ptep_get(ptep + i)) ^ pte_val(pte)) & ~_PFN_=
MASK)
> +                       return true;
> +
> +       return false;
> +}
> +
> +int huge_ptep_set_access_flags(struct vm_area_struct *vma, unsigned long=
 addr,
> +                              pte_t *ptep, pte_t pte, int dirty)
> +{
> +       struct mm_struct *mm =3D vma->vm_mm;
> +       unsigned long sz =3D huge_page_size(hstate_vma(vma));
> +       unsigned long ncontig =3D num_contig_ptes(sz);
> +       pte_t orig_pte =3D huge_ptep_get(mm, addr, ptep);
> +
> +       /* Keep the young and dirty state the block already has. */
> +       if (pte_dirty(orig_pte))
> +               pte =3D pte_mkdirty(pte);
> +       if (pte_young(orig_pte))
> +               pte =3D pte_mkyoung(pte);
> +
> +       /* Breaking an unchanged block only makes concurrent touchers ref=
ault. */
> +       if (!gh_access_flags_changed(ptep, pte, ncontig))
> +               return 0;
> +
> +       get_clear_contig_flush(mm, addr, ptep, ncontig);
> +       set_ptes(mm, addr, ptep, pte, ncontig);
> +
> +       return 1;
> +}
> +
> +void huge_ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
> +                            pte_t *ptep)
> +{
> +       pte_t pte =3D ptep_get(ptep);
> +       unsigned long ncontig =3D gh_pte_num(pte_gh_order(pte));
> +
> +       VM_WARN_ON_ONCE(!pte_huge(pte));
> +
> +       /*
> +        * pte_wrprotect() sets _PAGE_FOW, which lives in the bits the wh=
ole
> +        * block must agree on, so this takes the break before make path.
> +        */
> +       pte =3D pte_wrprotect(get_clear_contig_flush(mm, addr, ptep, ncon=
tig));
> +       set_ptes(mm, addr, ptep, pte, ncontig);
> +}
> +
> +void huge_pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *pte=
p,
> +                   unsigned long sz)
> +{
> +       unsigned long i, ncontig =3D num_contig_ptes(sz);
> +
> +       for (i =3D 0; i < ncontig; i++, addr +=3D PAGE_SIZE, ptep++)
> +               pte_clear(mm, addr, ptep);
> +}
> +
> +bool __init arch_hugetlb_valid_size(unsigned long size)
> +{
> +       return gh_order_from_size(size) !=3D 0;
> +}
> +
> +static __init int alpha_hugetlbpage_init(void)
> +{
> +       unsigned int order;
> +
> +       for_each_gh_order(order)
> +               hugetlb_add_hstate(gh_cont_shift(order) - PAGE_SHIFT);
> +
> +       return 0;
> +}
> +arch_initcall(alpha_hugetlbpage_init);
>
> --
> 2.55.0
>

Looks good, thanks!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
