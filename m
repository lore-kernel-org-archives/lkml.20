Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57C823EAB0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013110; cv=none; b=WX+4O36KdQeDTrkIM53FOBV+L3q4uIvSUnLUFcsSSTVmADzit45ZDUthxtnVy88310UorIfmH1Ml5rvquncJQl7QFN0ZeQVnASRZ6qwf24nMTlnB7ep2k3FA1rtXBILDNOL4iad/Mj/DzFPKHDQ/bpcImH9WDmrr2Pcox3P3Ub8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013110; c=relaxed/simple;
	bh=rAWrnAEYwtxB463a6X/NBqTWvXFmxUTkIqzzvCsxG78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjmWazRtWbc0HoUBAmVO5XT3Mg/qyn6GA0hn5/Oub65ENYF7yhSXe8+2Dv4wFxj6ayWwZ09eiS1HLmVzVgSNceAf8I9qeqmuuGFjHbQjvMDfN9F6hEe13Jd0079Err+RDwJhbBU3OnY3FA4WXt2m2dKNkcSAvn0SMazXJL0aWbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tCD5v4VU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tCD5v4VU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC607153B;
	Wed,  9 Sep 2026 21:05:02 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAB983F7B4;
	Wed,  9 Sep 2026 21:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789013106; bh=rAWrnAEYwtxB463a6X/NBqTWvXFmxUTkIqzzvCsxG78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tCD5v4VUvLSUKDwb09dHubBqZMyi0aXPHA7yJz72TlE/XLQq4uYoYeyVilQgXOZKc
	 UZ9s09iK+VC5GbdAALOudg5bQ05HkZVwdMpybiLdve6B2m/peyyq3TQ4200H8aRkIN
	 rt3JRDGreOcdVN26eSoiOLR5jUGp1QSoUaQLEVWQ=
Date: Thu, 10 Sep 2026 09:35:03 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH V2 1/2] arm64/mm: Move __check_safe_pte_update()
Message-ID: <u3uvjnmd7k7f7dijdvsykta3pcxyxhvztncu4apvg5eb6rvtyh@kmdgfebs6dns>
References: <20260909040005.4148136-1-anshuman.khandual@arm.com>
 <20260909040005.4148136-2-anshuman.khandual@arm.com>
 <04358f9d-3b64-47c0-94dc-f1ef19c22f78@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04358f9d-3b64-47c0-94dc-f1ef19c22f78@kernel.org>

On Wed, Sep 09, 2026 at 05:12:24PM +0200, David Hildenbrand (Arm) wrote:
> On 9/9/26 06:00, Anshuman Khandual wrote:
> > The page table entry print helpers and related macros which are defined in
> > <linux/pgtable.h> will not be accessible in platform <asm/pgtable.h> which
> > is basically caused by cycling dependency.
> > 
> > Move __check_safe_pte_update() inside arch/arm64/mm/mmu.c as a preparation
> > for subsequent usage of the afore mentioned generic MM helpers. While here
> > drop IS_ENABLED(CONFIG_DEBUG_VM), although wrap __check_safe_pte_update()
> > inside #ifdef CONFIG_DEBUG_VM that preserves the current code optimization
> > which is achieved via the static inline functions.
> > 
> > This does not cause any functional change.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> > Changes in V2:
> > 
> > - Moved __check_safe_pte_update() inside #ifdef CONFIG_DEBUG_VM
> > - Added empty stub for __check_safe_pte_update() when !CONFIG_DEBUG_VM
> > - Dropped IS_ENABLED(CONFIG_DEBUG_VM) from __check_safe_pte_update()
> > 
> >  arch/arm64/include/asm/pgtable.h | 49 ++++----------------------------
> >  arch/arm64/mm/mmu.c              | 44 ++++++++++++++++++++++++++++
> >  2 files changed, 49 insertions(+), 44 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index e89ec5f4787b..281a512f1fc6 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -387,52 +387,13 @@ static inline pte_t __ptep_get(pte_t *ptep)
> >  extern void __sync_icache_dcache(pte_t pteval);
> >  bool pgattr_change_is_safe(pteval_t old, pteval_t new);
> >  
> > -/*
> > - * PTE bits configuration in the presence of hardware Dirty Bit Management
> > - * (PTE_WRITE == PTE_DBM):
> > - *
> > - * Dirty  Writable | PTE_RDONLY  PTE_WRITE  PTE_DIRTY (sw)
> > - *   0      0      |   1           0          0
> > - *   0      1      |   1           1          0
> > - *   1      0      |   1           0          1
> > - *   1      1      |   0           1          x
> > - *
> > - * When hardware DBM is not present, the software PTE_DIRTY bit is updated via
> > - * the page fault mechanism. Checking the dirty status of a pte becomes:
> > - *
> > - *   PTE_DIRTY || (PTE_WRITE && !PTE_RDONLY)
> > - */
> > -
> > -static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep,
> > -					   pte_t pte)
> > +#ifdef CONFIG_DEBUG_VM
> > +void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte);
> > +#else
> > +static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
> >  {
> > -	pte_t old_pte;
> > -
> > -	if (!IS_ENABLED(CONFIG_DEBUG_VM))
> > -		return;
> > -
> > -	old_pte = __ptep_get(ptep);
> > -
> > -	if (!pte_valid(old_pte) || !pte_valid(pte))
> > -		return;
> > -	if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
> > -		return;
> > -
> > -	/*
> > -	 * Check for potential race with hardware updates of the pte
> > -	 * (__ptep_set_access_flags safely changes valid ptes without going
> > -	 * through an invalid entry).
> > -	 */
> > -	VM_WARN_ONCE(!pte_young(pte),
> > -		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
> > -		     __func__, pte_val(old_pte), pte_val(pte));
> > -	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
> > -		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
> > -		     __func__, pte_val(old_pte), pte_val(pte));
> > -	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
> > -		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
> > -		     __func__, pte_val(old_pte), pte_val(pte));
> >  }
> > +#endif
> 
> [...]
> 
> > +#ifdef CONFIG_DEBUG_VM
> > +void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep, pte_t pte)
> > +{
> > +	pte_t old_pte;
> > +
> > +	old_pte = __ptep_get(ptep);
> > +
> > +	if (!pte_valid(old_pte) || !pte_valid(pte))
> > +		return;
> > +	if (mm != current->active_mm && atomic_read(&mm->mm_users) <= 1)
> > +		return;
> > +
> > +	/*
> > +	 * Check for potential race with hardware updates of the pte
> > +	 * (__ptep_set_access_flags safely changes valid ptes without going
> > +	 * through an invalid entry).
> > +	 */
> > +	VM_WARN_ONCE(!pte_young(pte),
> > +		     "%s: racy access flag clearing: 0x%016llx -> 0x%016llx",
> > +		     __func__, pte_val(old_pte), pte_val(pte));
> > +	VM_WARN_ONCE(pte_write(old_pte) && !pte_dirty(pte),
> > +		     "%s: racy dirty state clearing: 0x%016llx -> 0x%016llx",
> > +		     __func__, pte_val(old_pte), pte_val(pte));
> > +	VM_WARN_ONCE(!pgattr_change_is_safe(pte_val(old_pte), pte_val(pte)),
> > +		     "%s: unsafe attribute change: 0x%016llx -> 0x%016llx",
> > +		     __func__, pte_val(old_pte), pte_val(pte));
> > +}
> > +#endif
> 
> #endif /* CONFIG_DEBUG_VM */
> 
> Might be helpful here.
> 
> Consider the same in the case above

Sure will update the same both in here and also for the declrations
in the header file as well.

> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks for the review.

> 
> -- 
> Cheers,
> 
> David
