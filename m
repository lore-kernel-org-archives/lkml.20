Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DDD1B6D08
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788323945; cv=none; b=ZoC9Iua977tmgb3xmzD6tuP0GR0K3MUJDhjSHYCDHVM/6h5Un5Ko+GpEI5jM2JRBkRF+wPyS1bHTzwjJOGG9NE5kHT0Ys9bOXfa74aSXD8yXJlJSNIEqYg7jBHtB2qHIHMS3SbKg7CsCBdnY3UICiUN1mqojmP0KncjNwAbjKpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788323945; c=relaxed/simple;
	bh=lsYDvIHWzI7Z9foYuzRf+3oBreuXwlUShNlsSn4ADPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YN4Ms+0it8RWo5QYxrgtMgd8eUCGUbkMQsor6rsOgRyovbmKtheat1oPOHo6AnQNEo1P0C5Jsyc3V3ZKrIiiTf2zovam0J7HdU9Yg1lrXYaOqS2x7dgNAvmQGI4ap5E6La2hNmGYuM/KuS4KLmwG/BBaHV8Kj5bvYfPsSHCDw7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uL0K6Pk8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uL0K6Pk8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78ADE1596;
	Tue,  1 Sep 2026 21:38:58 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7692D3F7D8;
	Tue,  1 Sep 2026 21:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788323942; bh=lsYDvIHWzI7Z9foYuzRf+3oBreuXwlUShNlsSn4ADPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uL0K6Pk8Tssm6JHp0t8VZ4HINef7UJdYngfT3+Wl0ltc3Z0oEPcirHdU2lPXKwQTH
	 Fdq8I9j6i/SHqQ7ILgZ9Bm2Fk1YEoHiN9nlM0NIl7tfOIEzvCErbM5DC0yL0MukMlF
	 U+5WcylKG0URS5kCkwvLgmPSmzaOPqyRsyPuy6NA=
Date: Wed, 2 Sep 2026 10:08:58 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: hugetlb: fix BBM for mprotect() on contiguous PTEs
Message-ID: <xwyaihtgvjonk4wqmllsnzkq2ch63bhfzmvh6353ds6tpjuaww@lmu7ltps4il5>
References: <20260901131823.15799-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901131823.15799-1-kmehltretter@gmail.com>

On Tue, Sep 01, 2026 at 03:18:23PM +0200, Karl Mehltretter wrote:
> huge_ptep_modify_prot_start() clears a hugetlb entry before changing its
> permissions. For contiguous PTE mappings, break-before-make (BBM)
> requires a TLB invalidation after clearing the set and before making any
> entry valid again.

Agreed.

> 
> Commit fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from
> get_clear_flush()") removed this invalidation, relying on the deferred
> flush from the core code. Commit 410982303772 ("arm64: hugetlb: Restore
> TLB invalidation for BBM on contiguous ptes") restored it for
> huge_ptep_set_{access_flags,wrprotect}(), since a deferred flush is too
> late for the break step. The modify-prot path has the same problem.

The commit 410982303772 ("arm64: hugetlb: Restore TLB invalidation for BBM
on contiguous ptes") should also have fixed huge_ptep_modify_prot_start()
while at it ?

> 
> Use huge_ptep_clear_flush() for contiguous entries so that the TLB is
> invalidated during the break step. Leave huge_ptep_get_and_clear()
> unchanged because it is also used by teardown paths, where the deferred
> flush is sufficient.

Makes sense.

> 
> Fixes: fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from get_clear_flush()")

Probably OK as the earlier commit 410982303772 also blames the same.

> Assisted-by: LLM

So you did not actually see this problem on a system ?

> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> An instrumented QEMU detected the missing break-step TLBI on an unpatched
> kernel and none with this change. A fork() control exercising
> huge_ptep_set_wrprotect() remained clean. No user-visible failure was
> reproduced.

No user-visiable failure was reported even without this change ?
Missing TLBI as seen in QEMU is the only clue here ?

> 
> The QEMU checker was exercised with 4K and 64K base-page kernels. The
> patched kernel passed the LTP hugetlb tests with both -cpu max and -cpu
> cortex-a72 (16 TPASS and no failures).
> 
> Testing on Neoverse N1 hardware would be welcome, as it can use the
> contiguous hint and can be configured to report TLB conflicts.

But you have not seen any real TLB conflicts even on custom QEMU ?

> 
>  arch/arm64/mm/hugetlbpage.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8e799c1fe0aa..bb53a04b73b2 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -517,6 +517,11 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>  pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
>  {
>  	unsigned long psize = huge_page_size(hstate_vma(vma));
> +	pte_t pte = __ptep_get(ptep);
> +
> +	/* The break step for contiguous PTEs must include the TLB flush. */

Probably helpful to mention here that subsequent huge_ptep_get_and_clearI()
in the function depends on deferred TLB flush mechanism which would not be
accurate for contig HugeTLB pages.

> +	if (pte_cont(pte))
> +		return huge_ptep_clear_flush(vma, addr, ptep);
>  
>  	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
>  		/*
> @@ -524,7 +529,7 @@ pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr
>  		 * when the permission changes from executable to non-executable
>  		 * in cases where cpu is affected with errata #2645198.
>  		 */
> -		if (pte_user_exec(__ptep_get(ptep)))
> +		if (pte_user_exec(pte))
>  			return huge_ptep_clear_flush(vma, addr, ptep);
>  	}
>  	return huge_ptep_get_and_clear(vma->vm_mm, addr, ptep, psize);
> 
> base-commit: 786262be6048deab760f68c8acc2c85607165894
> -- 
> 2.53.0

Overall LGTM but will need some more testing.
