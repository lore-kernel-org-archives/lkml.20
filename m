Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212CF221F39
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223838; cv=none; b=LDN+6SWNQuKCpUqevLW+5JrWAt1sCaWAqJEQKG5CnnIXROWarGpPty2GrqjYTFI8gQ1nOM6EsdicOvhjRWHKFSTTNJPPv5YaZE3FDzZFUORP8Rr2dJ4ALt5/Mx7h9/CbcrAJ4q0QaU5t8jVd2C9Hk7wStqCD53Ak9O7ZkHWthWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223838; c=relaxed/simple;
	bh=mhxVmBkutSMe9fD1mx6TA46QJ685wJqUuRlfi7URACE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCGVwe3b4U+foqRuekyA7BrkkcR/WKKWDrdxLOI5FxTD2V5YkEU6u580kx4otQ86p1z1nlq/sT2TlZpJrO8ESD46BPE1UmlWL9eRDta+Oh8+LJjDt2CU1M33zt0bKOXAr04OEqAiDb2atvrvVQU5pk6OM3SFXMi3+spgaUxHO2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oe0+3cBK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oe0+3cBK"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2297152B;
	Wed, 23 Sep 2026 21:23:51 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5849C3F632;
	Wed, 23 Sep 2026 21:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790223835; bh=mhxVmBkutSMe9fD1mx6TA46QJ685wJqUuRlfi7URACE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oe0+3cBKJYM5Q01mTk0/JnjmaKQli2AM0Bfcu8MVx3AOJrpuoK4owxkVJ2yPdgDXD
	 uTqSUonHmn9FqOlmV3irphyq/BmKzqiK2S1I3IWRBgSKPFxmoXXJcBgFmdIzstvf84
	 BPshgjSAERmmzkoL+Apww7RL1LkIDIffX1txorso=
Date: Thu, 24 Sep 2026 09:53:51 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH V2 3/4] arm64/mm: Use p4dp_get() for P4D accesses
Message-ID: <e3e5nbiles3kq7uftst7du7ys2qgtm6tfcxfolux5hmpmvvd7s@gptm5ukkwsm5>
References: <20260922061638.3967467-1-anshuman.khandual@arm.com>
 <20260922061638.3967467-4-anshuman.khandual@arm.com>
 <ae280191-4d9b-4971-b724-60233895fdce@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae280191-4d9b-4971-b724-60233895fdce@arm.com>

On Wed, Sep 23, 2026 at 09:30:26AM +0100, Ryan Roberts wrote:
> On 22/09/2026 07:16, Anshuman Khandual wrote:
> > Replace READ_ONCE() with p4dp_get() for P4D accesses in preparation for
> > supporting both D64 and D128 translation table formats.
> > 
> > READ_ONCE() cannot currently be used for 128-bit page table entries on
> > arm64 because it does not provide the required 128-bit single-copy
> > atomicity, causing builds to fail for accesses wider than 64 bits.
> > 
> > Although LDP/STP provide the required atomicity when FEAT_LSE is
> > available (as required by FEAT_D128), extending READ_ONCE() to support
> > 128-bit accesses is undesirable. READ_ONCE() is a general-purpose API,
> > so doing so could encourage other 128-bit users that would either fail
> > to build in configurations without D128 support or, if D128 becomes a
> > runtime option, silently permit tearing on systems without the required
> > hardware support.
> > 
> > Instead, standardize P4D accesses on the existing page-table helpers.
> > These can be overridden on arm64 to provide 128-bit single-copy
> > atomicity when required. No functional change intended.
> 
> I notice you still have uncoverted READ_ONCE(*p4dp) in:
> 
>  - pud_offset_phys()
>  - pud_offset()
> 
> Is that intentional? If so, perhaps we need a comment explain why it's not using
> the helper?

Platform overrride for p4dp_get() should solve the problem.

> 
> Thanks,
> Ryan
> 
> 
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: kasan-dev@googlegroups.com
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> >  arch/arm64/mm/fault.c       |  2 +-
> >  arch/arm64/mm/fixmap.c      |  2 +-
> >  arch/arm64/mm/hugetlbpage.c |  2 +-
> >  arch/arm64/mm/kasan_init.c  |  4 ++--
> >  arch/arm64/mm/mmu.c         | 12 ++++++------
> >  arch/arm64/mm/pageattr.c    |  2 +-
> >  arch/arm64/mm/trans_pgd.c   |  4 ++--
> >  7 files changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > index 435e2e14c070..a6afd8929a10 100644
> > --- a/arch/arm64/mm/fault.c
> > +++ b/arch/arm64/mm/fault.c
> > @@ -174,7 +174,7 @@ static void show_pte(unsigned long addr)
> >  			break;
> >  
> >  		p4dp = p4d_offset_lockless(pgdp, pgd, addr);
> > -		p4d = READ_ONCE(*p4dp);
> > +		p4d = p4dp_get(p4dp);
> >  		ptval_to_str(pxd_str, p4d_val(p4d));
> >  		pr_cont(", p4d=%s", pxd_str);
> >  		if (p4d_none(p4d) || p4d_bad(p4d))
> > diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> > index d9a870836faf..2a0fe0b0f771 100644
> > --- a/arch/arm64/mm/fixmap.c
> > +++ b/arch/arm64/mm/fixmap.c
> > @@ -74,7 +74,7 @@ static void __init early_fixmap_init_pmd(pud_t *pudp, unsigned long addr,
> >  static void __init early_fixmap_init_pud(p4d_t *p4dp, unsigned long addr,
> >  					 unsigned long end)
> >  {
> > -	p4d_t p4d = READ_ONCE(*p4dp);
> > +	p4d_t p4d = p4dp_get(p4dp);
> >  	pud_t *pudp;
> >  
> >  	if (CONFIG_PGTABLE_LEVELS > 3 && !p4d_none(p4d) &&
> > diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> > index c9ad5e75b073..5771bf49e1fe 100644
> > --- a/arch/arm64/mm/hugetlbpage.c
> > +++ b/arch/arm64/mm/hugetlbpage.c
> > @@ -288,7 +288,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
> >  		return NULL;
> >  
> >  	p4dp = p4d_offset(pgdp, addr);
> > -	if (!p4d_present(READ_ONCE(*p4dp)))
> > +	if (!p4d_present(p4dp_get(p4dp)))
> >  		return NULL;
> >  
> >  	pudp = pud_offset(p4dp, addr);
> > diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> > index aad29bcc7622..4dd8c1186471 100644
> > --- a/arch/arm64/mm/kasan_init.c
> > +++ b/arch/arm64/mm/kasan_init.c
> > @@ -89,7 +89,7 @@ static pmd_t *__init kasan_pmd_offset(pud_t *pudp, unsigned long addr, int node,
> >  static pud_t *__init kasan_pud_offset(p4d_t *p4dp, unsigned long addr, int node,
> >  				      bool early)
> >  {
> > -	if (p4d_none(READ_ONCE(*p4dp))) {
> > +	if (p4d_none(p4dp_get(p4dp))) {
> >  		phys_addr_t pud_phys = early ?
> >  				__pa_symbol(kasan_early_shadow_pud)
> >  					: kasan_alloc_zeroed_page(node);
> > @@ -162,7 +162,7 @@ static void __init kasan_p4d_populate(pgd_t *pgdp, unsigned long addr,
> >  	do {
> >  		next = p4d_addr_end(addr, end);
> >  		kasan_pud_populate(p4dp, addr, next, node, early);
> > -	} while (p4dp++, addr = next, addr != end && p4d_none(READ_ONCE(*p4dp)));
> > +	} while (p4dp++, addr = next, addr != end && p4d_none(p4dp_get(p4dp)));
> >  }
> >  
> >  static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 22efaee79293..83709d987e7c 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -367,7 +367,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
> >  {
> >  	int ret = 0;
> >  	unsigned long next;
> > -	p4d_t p4d = READ_ONCE(*p4dp);
> > +	p4d_t p4d = p4dp_get(p4dp);
> >  	pud_t *pudp;
> >  
> >  	if (p4d_none(p4d)) {
> > @@ -457,7 +457,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
> >  	}
> >  
> >  	do {
> > -		p4d_t old_p4d = READ_ONCE(*p4dp);
> > +		p4d_t old_p4d = p4dp_get(p4dp);
> >  
> >  		next = p4d_addr_end(addr, end);
> >  
> > @@ -467,7 +467,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
> >  			goto out;
> >  
> >  		VM_WARN_ON_ONCE(p4d_val(old_p4d) != 0 &&
> > -				p4d_val(old_p4d) != READ_ONCE(p4d_val(*p4dp)));
> > +				p4d_val(old_p4d) != (p4d_val(p4dp_get(p4dp))));
> >  
> >  		phys += next - addr;
> >  	} while (p4dp++, addr = next, addr != end);
> > @@ -1622,7 +1622,7 @@ static void unmap_hotplug_p4d_range(pgd_t *pgdp, unsigned long addr,
> >  	do {
> >  		next = p4d_addr_end(addr, end);
> >  		p4dp = p4d_offset(pgdp, addr);
> > -		p4d = READ_ONCE(*p4dp);
> > +		p4d = p4dp_get(p4dp);
> >  		if (p4d_none(p4d))
> >  			continue;
> >  
> > @@ -1788,7 +1788,7 @@ static void free_empty_p4d_table(pgd_t *pgdp, unsigned long addr,
> >  	do {
> >  		next = p4d_addr_end(addr, end);
> >  		p4dp = p4d_offset(pgdp, addr);
> > -		p4d = READ_ONCE(*p4dp);
> > +		p4d = p4dp_get(p4dp);
> >  		if (p4d_none(p4d))
> >  			continue;
> >  
> > @@ -1809,7 +1809,7 @@ static void free_empty_p4d_table(pgd_t *pgdp, unsigned long addr,
> >  	 */
> >  	p4dp = p4d_offset(pgdp, 0UL);
> >  	for (i = 0; i < PTRS_PER_P4D; i++) {
> > -		if (!p4d_none(READ_ONCE(p4dp[i])))
> > +		if (!p4d_none(p4dp_get(p4dp + i)))
> >  			return;
> >  	}
> >  
> > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > index 07b2fa4de57f..826856ef64a8 100644
> > --- a/arch/arm64/mm/pageattr.c
> > +++ b/arch/arm64/mm/pageattr.c
> > @@ -403,7 +403,7 @@ bool kernel_page_present(struct page *page)
> >  		return false;
> >  
> >  	p4dp = p4d_offset(pgdp, addr);
> > -	if (p4d_none(READ_ONCE(*p4dp)))
> > +	if (p4d_none(p4dp_get(p4dp)))
> >  		return false;
> >  
> >  	pudp = pud_offset(p4dp, addr);
> > diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> > index d119119455f1..7afe2beca4ba 100644
> > --- a/arch/arm64/mm/trans_pgd.c
> > +++ b/arch/arm64/mm/trans_pgd.c
> > @@ -99,7 +99,7 @@ static int copy_pud(struct trans_pgd_info *info, p4d_t *dst_p4dp,
> >  	unsigned long next;
> >  	unsigned long addr = start;
> >  
> > -	if (p4d_none(READ_ONCE(*dst_p4dp))) {
> > +	if (p4d_none(p4dp_get(dst_p4dp))) {
> >  		dst_pudp = trans_alloc(info);
> >  		if (!dst_pudp)
> >  			return -ENOMEM;
> > @@ -145,7 +145,7 @@ static int copy_p4d(struct trans_pgd_info *info, pgd_t *dst_pgdp,
> >  	src_p4dp = p4d_offset(src_pgdp, start);
> >  	do {
> >  		next = p4d_addr_end(addr, end);
> > -		if (p4d_none(READ_ONCE(*src_p4dp)))
> > +		if (p4d_none(p4dp_get(src_p4dp)))
> >  			continue;
> >  		if (copy_pud(info, dst_p4dp, src_p4dp, addr, next))
> >  			return -ENOMEM;
> 
