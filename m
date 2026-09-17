Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FEF83A963A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789618736; cv=none; b=gs2blVFFk7eLW1r8FZCsqiBIJL8kXhmEqVsgALIW4aqmJOljPN6SJeoCnheL/neRZP0UzxmVbf027Jr/X6N+M+7q9YUUiv/ZU0TPr+jr6/ZMoWabb+qnooYcYOXO7GKVnt91+WZXRZpEUse085MH+L45nLCor284CwM3UUpiN/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789618736; c=relaxed/simple;
	bh=qX2pKJSt+jbXVDMn1VIn5tjWN9rlhtAz20MEdFpS9BE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wxci3xeAreNbbFMCNStIqArWqvPmRZ6ZPeakLeKbzPINXXInfU4+9ZSddzbN76Ht1VDQ1D+Soe45EJKwLVPshXxlhHtWX0+N3MZ/4QLC/l5rjxX0DOW7Filv6+v3yOFwGORBSepdaoJGVdQFBVkQ8cp9IxJmv/cEIp/VerVYEaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=obxnpRuD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="obxnpRuD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 685F61476;
	Wed, 16 Sep 2026 21:18:49 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B8FD3F882;
	Wed, 16 Sep 2026 21:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789618733; bh=qX2pKJSt+jbXVDMn1VIn5tjWN9rlhtAz20MEdFpS9BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obxnpRuDgn1BP2nOU1Vovtq9joyGzBs6NtdCxr476bPAgUJ6iu0l89qcfyFvS4bd9
	 8TKZ3sYcFvvmnBZpnmEwKRMjkMvnjgEyRSJAQ5ab7vP0JwXmReJbkqQFnPSGSqgj6Q
	 eZbJAQH7mV04PfWF029nyZb7q7W2JBXHLc9gNeNY=
Date: Thu, 17 Sep 2026 09:48:49 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V2 04/14] arm64/mm: Route all pgtable atomics to central
 helpers
Message-ID: <vuetqfctrtbm5e7ay7owffyqkoopeqaxlle37uu5byhf5oeu7k@aplgoj4fijip>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
 <20260907035030.2839978-5-anshuman.khandual@arm.com>
 <ef85271a-a1a3-4b9b-8c99-c1f871a13c6b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef85271a-a1a3-4b9b-8c99-c1f871a13c6b@kernel.org>

On Wed, Sep 16, 2026 at 03:39:05PM +0200, David Hildenbrand (Arm) wrote:
> On 9/7/26 05:50, Anshuman Khandual wrote:
> > Route all cmpxchg() operations performed on various page table entries to a
> > new ptval_cmpxchg_relaxed() helper. Similarly route all xchg() operations
> > performed on page table entries to a new ptval_xchg_relaxed() helper.
> > 
> > Currently these helpers just forward to the same APIs that were previously
> > called direct, but in future we will change the routing for D128 which is
> > too long to use the standard APIs.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> 
> [...]
> 
> >  	case PAGE_SIZE:
> > @@ -1400,7 +1411,7 @@ static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
> >  	do {
> >  		old_pte = pte;
> >  		pte = pte_wrprotect(pte);
> > -		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
> > +		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
> >  					       pte_val(old_pte), pte_val(pte));
> 
> Indentation goes out of sync here.
> 
> >  	} while (pte_val(pte) != pte_val(old_pte));
> >  }
> > @@ -1438,7 +1449,7 @@ static inline void __clear_young_dirty_pte(struct vm_area_struct *vma,
> >  		if (flags & CYDP_CLEAR_DIRTY)
> >  			pte = pte_mkclean(pte);
> >  
> > -		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
> > +		pte_val(pte) = ptval_cmpxchg_relaxed(&pte_val(*ptep),
> >  					       pte_val(old_pte), pte_val(pte));
> 
> Same here

OK - will fix the alignment on both the above instances.

> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> -- 
> Cheers,
> 
> David
