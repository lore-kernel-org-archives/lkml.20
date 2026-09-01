Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AC52D12F3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304564; cv=none; b=hs/4yDukl2b28SNHTVu4qjC3ig/aWXw7swDY12Dt5oE4ihK+uo6cnkvKukoRMgVIeoABSL7EP1JowXwb/ZopS5IpdJvyIxGdOLP/GrhW4O4z20ZfCy8Do8ley2tSkrKGn2YxhX913R8t/oI9HM/xz4PsMkRJBZyzKh8iahhUA1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304564; c=relaxed/simple;
	bh=WcHfPt4SyLOMyyNkLD5NpB3gmrnIqi5faY0Z7sOJdI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+HZkceNzeB3Y4kTkDJII0V8nq7j2f6uEf6BvmpjLqTXbgO4+Vqd78BTm7WK5mYPza7x7Un2KacPC96nFJv/DJRwk1TpdBqDdcWkOLL//N0VjNbHBS5ok9hxVmLCLGuIra+tTpvTIsWjH60Mi2W2IhqhSgcSij5IWceB8U9YxDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1x1Wwd-0006bb-00; Wed, 02 Sep 2026 00:27:07 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 439D4C0121; Wed,  2 Sep 2026 00:25:28 +0200 (CEST)
Date: Wed, 2 Sep 2026 00:25:28 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, corbet@lwn.net, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, maddy@linux.ibm.com,
	mpe@ellerman.id.au, agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com, david@kernel.org, hca@linux.ibm.com,
	gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, hughd@google.com,
	linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	akpm@linux-foundation.org, yintirui@huawei.com, dev.jain@arm.com,
	usama.arif@linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH v7 10/14] mips: move has_transparent_hugepage() out of
 THP guard
Message-ID: <apdQ2FJrLhkdjh_n@alpha.franken.de>
References: <cover.1788232334.git.luizcap@redhat.com>
 <371e2d3a7bcac265ac748ad3c67b74abfa238422.1788232334.git.luizcap@redhat.com>
 <f4c568ad-a17a-4982-b8d2-d5852a789a4d@linux.dev>
 <00eb76eb-c330-4662-9ca9-1e89fbc1e4ce@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00eb76eb-c330-4662-9ca9-1e89fbc1e4ce@redhat.com>

On Tue, Sep 01, 2026 at 03:53:18PM -0400, Luiz Capitulino wrote:
> On 2026-09-01 07:42, Lance Yang wrote:
> > 
> > 
> > On 2026/9/1 11:12, Luiz Capitulino wrote:
> > > A future commit will introduce a kernel API to allow for checking if the
> > > CPU supports PMD-sized pages. This API will be based on the
> > > has_transparent_hugepage() implementation but will be orthogonal to THP
> > > and therefore must work when CONFIG_TRANSPARENT_HUGEPAGE=n.
> > > 
> > > Move its definition out of the THP guard.
> > > 
> > > Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> > > ---
> > >   arch/mips/include/asm/pgtable.h | 6 +++---
> > >   arch/mips/mm/tlb-r4k.c          | 4 ----
> > >   2 files changed, 3 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> > > index fa7b935f947c..b038da872ec6 100644
> > > --- a/arch/mips/include/asm/pgtable.h
> > > +++ b/arch/mips/include/asm/pgtable.h
> > > @@ -615,9 +615,6 @@ unsigned long io_remap_pfn_range_pfn(unsigned long pfn, unsigned long size);
> > >   /* We don't have hardware dirty/accessed bits, generic_pmdp_establish is fine.*/
> > >   #define pmdp_establish generic_pmdp_establish
> > > -#define has_transparent_hugepage has_transparent_hugepage
> > > -extern int has_transparent_hugepage(void);
> > 
> > Assume a decstation_defconfig build. CPU_R3000 selects CPU_R3K_TLB, so the
> > Makefile builds tlb-r3k.o but not tlb-r4k.o IIUC ...
> > 
> > The only MIPS definition is in tlb-r4k.c, so R3000 would fail to link with
> > an undefined reference ... no?
> 
> Yes, you're right. I can reproduce this. Would the solution below be
> acceptable?
> 
> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> index fa7b935f947c..b038da872ec6 100644
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -615,9 +615,6 @@ unsigned long io_remap_pfn_range_pfn(unsigned long pfn, unsigned long size);
>  /* We don't have hardware dirty/accessed bits, generic_pmdp_establish is fine.*/
>  #define pmdp_establish generic_pmdp_establish
> -#define has_transparent_hugepage has_transparent_hugepage
> -extern int has_transparent_hugepage(void);
> -
>  static inline int pmd_trans_huge(pmd_t pmd)
>  {
>  	return !!(pmd_val(pmd) & _PAGE_HUGE);
> @@ -743,6 +740,9 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> +#define has_transparent_hugepage has_transparent_hugepage
> +extern int has_transparent_hugepage(void);
> +
>  #ifdef _PAGE_HUGE
>  #define pmd_leaf(pmd)	((pmd_val(pmd) & _PAGE_HUGE) != 0)
>  #define pud_leaf(pud)	((pud_val(pud) & _PAGE_HUGE) != 0)
> diff --git a/arch/mips/mm/pgtable.c b/arch/mips/mm/pgtable.c
> index 10835414819f..3a5b411493d9 100644
> --- a/arch/mips/mm/pgtable.c
> +++ b/arch/mips/mm/pgtable.c
> @@ -23,3 +23,30 @@ pgd_t *pgd_alloc(struct mm_struct *mm)
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(pgd_alloc);
> +
> +#if defined(CONFIG_CPU_R4K_CACHE_TLB) || \
> +    defined(CONFIG_CPU_SB1) || \
> +    defined(CONFIG_CPU_CAVIUM_OCTEON)

I guess using CONFIG_CPU_SUPPORTS_HUGEPAGES is a better approach

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
