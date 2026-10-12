Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CA441D11E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803058; cv=none; b=Fe8Q9vooqNscrtDaYKG1aGwX46Ls69QWFAodsnUtxbTJFIC7KZby+51f83n4JnozGBP6FFJ7OMii0hp+SQqh6qVT8uE7mh9XdbW76sieW2l0zOCVgiYWCw/6HgDTa/PTEibu+xC2KxeNr4C2x45jOsDM4S/Gs4Gbg5cY5BSewWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803058; c=relaxed/simple;
	bh=GCUhwqR9gUHDDQkSnLEoqzzvzh0xq7rUr9tQxJpA+Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbawUdINCuMi8ybEqj116A8aIqnGYowOy/oZqQYHgYGU7nxgfdExcL8fW0Bwvdb5lgsFebncmqF/et53ZLOfPQZOZk7WJBnlHwzDKjSJsvc1qJ2EaQuxbslDfi4RkX2fV0DPdRfOErOHITk1fLtDg4x/SpblFF+9wl/FclOtDTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F++r00nm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F++r00nm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F2BB1A00;
	Mon, 12 Oct 2026 04:04:12 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 196FF3F882;
	Mon, 12 Oct 2026 04:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791803055; bh=GCUhwqR9gUHDDQkSnLEoqzzvzh0xq7rUr9tQxJpA+Tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F++r00nmSoucDHHIsuKWsEv8xVrypp0HtBNdtRJkDKmLkBuJP64zRrb/xJIShO22H
	 uzo9MhZARvb/XeMwbi4x6xH3NT4IvmY4wF11YylB9B5Dtu48YuFY4E4Wms0ChMknp5
	 vAcbnxdzzKSKleLIyoOeqv3IWqJ/z9HrDI5yVhac=
Date: Mon, 12 Oct 2026 12:04:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH V3 1/4] arm64/mm: Use pmdp_get() for PMD accesses
Message-ID: <asy-q5SBnrBQSadP@arm.com>
References: <20260924062214.1635078-1-anshuman.khandual@arm.com>
 <20260924062214.1635078-2-anshuman.khandual@arm.com>
 <asPCv5Icdm7Z9mWF@arm.com>
 <lqjq64vw6mlm27kp6ffms6auerj67avecc4ongedouumsrspjh@2f2eblm7wi4u>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lqjq64vw6mlm27kp6ffms6auerj67avecc4ongedouumsrspjh@2f2eblm7wi4u>

On Wed, Oct 07, 2026 at 08:11:52AM +0530, Anshuman Khandual wrote:
> On Mon, Oct 05, 2026 at 04:31:28PM +0100, Catalin Marinas wrote:
> > On Thu, Sep 24, 2026 at 11:52:11AM +0530, Anshuman Khandual wrote:
> > > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > > index 763c5a411d64..9ad2d03e86ad 100644
> > > --- a/arch/arm64/include/asm/pgtable.h
> > > +++ b/arch/arm64/include/asm/pgtable.h
> > > @@ -84,6 +84,12 @@ static inline void arch_leave_lazy_mmu_mode(void)
> > >  	arch_flush_lazy_mmu_mode();
> > >  }
> > >  
> > > +#define pmdp_get pmdp_get
> > > +static inline pmd_t pmdp_get(pmd_t *pmdp)
> > > +{
> > > +	return READ_ONCE(*pmdp);
> > > +}
> > 
> > This is the same as the generic version. Does it need redefining?
> 
> Without this pmdp_get() override, replacing READ_ONCE() in pmdp_test_and_clear_young()
> with pmdp_get() causes a build failure as pmpd_get() which is defined in the generic
> pgtable header is not visible from inside platform specific pgtable header, even with
> a forward declaration.
> 
> Earlier had moved pmdp_test_and_clear_young() inside arch/arm64/mm/mmu.c to avoid the
> above described dependency problem. But then realised that pmdp_get() gets eventually
> overridden on arm64 platform for D128, why not just redefine here it now as standard
> READ_ONCE() to avoid the current build problem and the code movement.
> 
> Please find some context here from earlier discussions during V2.
> 
> https://lore.kernel.org/all/212067fe-1b16-4b87-87a7-4ce50847eb24@arm.com/

Thanks for link summary of the past discussion. I agree, for D128 we'll
have to define our p*d_get() but I haven't decided D128 is worth merging
yet (it depends on future hardware availability, I need to get more
visibility into this).

For the time being, I'd keep the p*d_get() accessors generic and move
pmdp_test_and_clear_young() to mmu.c.

> > >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > >  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> > >  
> > > @@ -811,7 +817,8 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
> > >  }
> > >  
> > >  /* Find an entry in the third-level page table. */
> > > -#define pte_offset_phys(dir,addr)	(pmd_page_paddr(READ_ONCE(*(dir))) + pte_index(addr) * sizeof(pte_t))
> > > +#define pte_offset_phys(dir, addr)	(pmd_page_paddr(pmdp_get(dir)) + \
> > > +					 pte_index(addr) * sizeof(pte_t))
> > 
> > Why not make this change in the generic version?
> 
> Could you please elaborate on this ? pte_offset_phys() is arm64 specific helper which
> is also local to this header file. AFAICT there is no generic version for this helper.

You are right, I got confused.

Anyway, I'd push this series post -rc1. It depends on the mm tree and
it's getting pretty close to the merging window.

-- 
Catalin
