Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3D74A0913
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214299; cv=none; b=GSNunqRuhNiG34CsAFbrgWVeVFYjcPwm6r2bU3j6dQ+weCZ9bQVAhJLesxy4ik4rQdAmvm9LrO7YDdR3Jw/D/EaIVk2WuMhwpb/UTNCXrmCWz69RSKb8xbNlSOuJBrSk0dc6L4mdRglwo7FeRMr22iNtoncxgI+xuRVTybJxJAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214299; c=relaxed/simple;
	bh=UfbkEj7jWC5+3mriZ290i7LpZ34xnOeNx98uhNGcwvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cARdcp0nCDi7z4hI9RMnC8EscMOY/JXo9aCpN1sOE5BWwy07ZvF+DpDaSGUq5Up/UNp/Ua9aQoJYi68SbKlbFriREAMfFSSJ0PmPovNza/FcFGOrAlCn0g1FfOaXbvI9GRXCr04Gwk0fT/o4iSippMXVfnjCEwoZUB/UJRMzjug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=exVUm0cZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="exVUm0cZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDDB1152B;
	Mon,  5 Oct 2026 08:31:33 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B85EB3F66F;
	Mon,  5 Oct 2026 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791214297; bh=UfbkEj7jWC5+3mriZ290i7LpZ34xnOeNx98uhNGcwvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exVUm0cZnHQnY5eDcThWwtVtsV8bnj/H4FIk9vMSC0M9uS6j/8ciV6Puh+y0NX116
	 oI/KBHXz6lA63AsMY4N4h+jtZA/cp2j9D7tDztXG8s4lHbkVXoN5n7cQWvthLajd+L
	 3/qGM3C3zhcyE1sjAcn3EEG/VTNV+Zr8YqR+3xUg=
Date: Mon, 5 Oct 2026 16:31:28 +0100
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
Message-ID: <asPCv5Icdm7Z9mWF@arm.com>
References: <20260924062214.1635078-1-anshuman.khandual@arm.com>
 <20260924062214.1635078-2-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924062214.1635078-2-anshuman.khandual@arm.com>

On Thu, Sep 24, 2026 at 11:52:11AM +0530, Anshuman Khandual wrote:
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 763c5a411d64..9ad2d03e86ad 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -84,6 +84,12 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  	arch_flush_lazy_mmu_mode();
>  }
>  
> +#define pmdp_get pmdp_get
> +static inline pmd_t pmdp_get(pmd_t *pmdp)
> +{
> +	return READ_ONCE(*pmdp);
> +}

This is the same as the generic version. Does it need redefining?

> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>  
> @@ -811,7 +817,8 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
>  }
>  
>  /* Find an entry in the third-level page table. */
> -#define pte_offset_phys(dir,addr)	(pmd_page_paddr(READ_ONCE(*(dir))) + pte_index(addr) * sizeof(pte_t))
> +#define pte_offset_phys(dir, addr)	(pmd_page_paddr(pmdp_get(dir)) + \
> +					 pte_index(addr) * sizeof(pte_t))

Why not make this change in the generic version?

-- 
Catalin
