Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5854D2192FA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791340919; cv=none; b=fyw2fziH8aGetCy2Gt3uAvANFDVSIH/yvPCRkz7ctVR3ewgOicuga0m+HV11ZKIIixhULDo1LmOgPI+Yk5ps25T5DtGXlRaRHknj3eabqEIUlqN1KV90tVi7PRjqjlmisqiyOkADJhmPIYxw/ewt8UrpQVbhewt5rVebCmBp3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791340919; c=relaxed/simple;
	bh=s760qSaiBVVuc/LlAknuKVghmlM0TMznspZHDm1DREY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AK1L/yLDAyiBD08h3/82iTMwBHIW/Lh4vyc1hqAVNtLe1CtArLH/qbIOGb3WJnLpLQehmwhIAjB1kRonN3k02y19GI1hDl5qaIR/Yf9xi7EtZzydQ2fPuX1v3wPc/cc1TbrhXYK55eBUlC7iJzqbNQr2Sf1z801WLWc9mPBp5As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=aw1QVinr; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aw1QVinr"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 136BF152B;
	Tue,  6 Oct 2026 19:41:52 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0AB63F86F;
	Tue,  6 Oct 2026 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791340915; bh=s760qSaiBVVuc/LlAknuKVghmlM0TMznspZHDm1DREY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aw1QVinr2aO2c2FZnGj7T7Kqjx9TOzGUooCiuw2agzb1q4f/FKMKf13h2fkYMtblQ
	 MBrdedFXgG4ie9YnrLy1Nkc8/1quegvgmIIJkrQ5/A/44y3he0uM8VSA20x9PXwziZ
	 PwAKmcDr6d3jYWiZhWfNFUOp2n0arCI2kMqgP0Ww=
Date: Wed, 7 Oct 2026 08:11:52 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	kasan-dev@googlegroups.com
Subject: Re: [PATCH V3 1/4] arm64/mm: Use pmdp_get() for PMD accesses
Message-ID: <lqjq64vw6mlm27kp6ffms6auerj67avecc4ongedouumsrspjh@2f2eblm7wi4u>
References: <20260924062214.1635078-1-anshuman.khandual@arm.com>
 <20260924062214.1635078-2-anshuman.khandual@arm.com>
 <asPCv5Icdm7Z9mWF@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asPCv5Icdm7Z9mWF@arm.com>

On Mon, Oct 05, 2026 at 04:31:28PM +0100, Catalin Marinas wrote:
> On Thu, Sep 24, 2026 at 11:52:11AM +0530, Anshuman Khandual wrote:
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index 763c5a411d64..9ad2d03e86ad 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -84,6 +84,12 @@ static inline void arch_leave_lazy_mmu_mode(void)
> >  	arch_flush_lazy_mmu_mode();
> >  }
> >  
> > +#define pmdp_get pmdp_get
> > +static inline pmd_t pmdp_get(pmd_t *pmdp)
> > +{
> > +	return READ_ONCE(*pmdp);
> > +}
> 
> This is the same as the generic version. Does it need redefining?

Without this pmdp_get() override, replacing READ_ONCE() in pmdp_test_and_clear_young()
with pmdp_get() causes a build failure as pmpd_get() which is defined in the generic
pgtable header is not visible from inside platform specific pgtable header, even with
a forward declaration.

Earlier had moved pmdp_test_and_clear_young() inside arch/arm64/mm/mmu.c to avoid the
above described dependency problem. But then realised that pmdp_get() gets eventually
overridden on arm64 platform for D128, why not just redefine here it now as standard
READ_ONCE() to avoid the current build problem and the code movement.

Please find some context here from earlier discussions during V2.

https://lore.kernel.org/all/212067fe-1b16-4b87-87a7-4ce50847eb24@arm.com/

> 
> > +
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> >  
> > @@ -811,7 +817,8 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
> >  }
> >  
> >  /* Find an entry in the third-level page table. */
> > -#define pte_offset_phys(dir,addr)	(pmd_page_paddr(READ_ONCE(*(dir))) + pte_index(addr) * sizeof(pte_t))
> > +#define pte_offset_phys(dir, addr)	(pmd_page_paddr(pmdp_get(dir)) + \
> > +					 pte_index(addr) * sizeof(pte_t))
> 
> Why not make this change in the generic version?

Could you please elaborate on this ? pte_offset_phys() is arm64 specific helper which
is also local to this header file. AFAICT there is no generic version for this helper.

> 
> -- 
> Catalin
