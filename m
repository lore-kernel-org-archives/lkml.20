Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C86336197E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182501; cv=none; b=eQXA1hyINAXDrr1pcWnUn5d6ZJD+mQIEoYGu2RU6mOKSCudje4B4d04QCuxb82umvy/w1Ip4gFpJUHj09c97d+pNfyjOJNmrXuXbdi6aivRB+8c0Ckd0UUFQmAeboWYCWwQhFglG2pxsNpWdpj/HIPVEqrEmnFz5raGcOf4E8KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182501; c=relaxed/simple;
	bh=gPS4BaPCtTXPkS/p8WI2ZOze4/Fjezx1OmLe4zcOaeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WSQP95RBBLHZAX132dk6PBG5GVnhtYY8qivTeOHaLFzR4csu7uHtQsuOftxKiX2pmimc46mCBcmSxYpSilvCE6QgDuG+Wccgf3lUFmt4URAm6v8cwMQAUw7f0jZ6tDGkjQKKTWZJIF3nXuBxr35kwejpo/LI16LbLf8UGoSvrYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iJBOFkhy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iJBOFkhy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBACF1595;
	Sun,  4 Oct 2026 23:41:34 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88A5B3F763;
	Sun,  4 Oct 2026 23:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791182498; bh=gPS4BaPCtTXPkS/p8WI2ZOze4/Fjezx1OmLe4zcOaeU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iJBOFkhyRkxDNSYu02g9UxsbHGxbruPrgL0D5tGBG06toBL2lw8y5vZyyuenf0q+4
	 1eOIIWsEa7tWNBClthYMJ/VFcNqRFOCoGaSYEujimXlW7ms7jJX8ZxyFPait/jXuUx
	 Hrf3cEXGPzzoFMxv490xa3FwfIB0J1XyQUHUg8/M=
Date: Mon, 5 Oct 2026 12:11:34 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org, 
	catalin.marinas@arm.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V3 0/4] arm64/mm: Convert pgtable READ_ONCE() as
 pxdp_get()
Message-ID: <6eghulpg35z63dpimrtw6p6x3zwfllfzjhpkpmgs5vcz4mpoda@poqgboea7nz5>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924062214.1635078-1-anshuman.khandual@arm.com>

On Thu, Sep 24, 2026 at 11:52:10AM +0530, Anshuman Khandual wrote:
> Route READ_ONCE() accesses on pgtable entries via level specific generic MM
> pxdp_get() helpers which platforms could then override when required. These
> accessors on arm64, will help in ensuring page table accesses are performed
> in an atomic manner while reading 128 bit page table entries later. But for
> now they just default to READ_ONCE(), thus preserving existing behaviour on
> current D64 translation a well.
> 
> This is similar to generic MM where all atomic accesses have already been
> converted from READ_ONCE() into pgtable level specific accessors.
> 
> These are preparatory patches for D128 enablement, although standing their
> own for D64 translation as well. These patches are split from earlier D128
> V1 series. There are no functional changes here and besides mm kselftests
> do not show any regression.
> 
> https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/
> 
> This series applies on v7.3-rc4 but after applying the following patches on
> pgtable entry print standardization posted earlier.
> 
> https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/
> 
> https://lore.kernel.org/linux-mm/20260916044933.2689426-1-anshuman.khandual@arm.com/

Hello Catalin/Andrew,

The above mentioned dependencies are already in mm-unstable, thus reflecting
in linux-next as well. Just to rule out merge conflict - this series applies
cleanly, builds and boots on latest tag next-20261002, which contains above
dependencies. But please do let me know if there are still some issues in
resolving this situation - will be happy to help. Thank you.

- Anshuman

> 
> These patches have been hosted here as well.
> 
> git@git.gitlab.arm.com:linux-arm/linux-anshuman.git (arm64_pxdp_get_v3)
> 
> Changes in V3:
> 
> - Added overrides for pxdp_get() and replaced remaining READ_ONCE()
> - Updated all commit messages as required
> - Dropped previous tags
> 
> Changes in V2:
> 
> https://lore.kernel.org/all/20260922061638.3967467-1-anshuman.khandual@arm.com/
> 
> - Rebased on v7.3-rc4 along with all latest dependencies
> - Updated commit messages per Ryan
> - Added tags from Ryan
> 
> Changes in V1:
> 
> https://lore.kernel.org/all/20260903060657.2717457-1-anshuman.khandual@arm.com/
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Linu Cherian <linu.cherian@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> 
> Anshuman Khandual (4):
>   arm64/mm: Use pmdp_get() for PMD accesses
>   arm64/mm: Use pudp_get() for PUD accesses
>   arm64/mm: Use p4dp_get() for P4D accesses
>   arm64/mm: Use pgdp_get() for PGD accesses
> 
>  arch/arm64/include/asm/pgtable.h | 40 +++++++++++++++++----
>  arch/arm64/mm/fault.c            |  8 ++---
>  arch/arm64/mm/fixmap.c           |  6 ++--
>  arch/arm64/mm/hugetlbpage.c      | 10 +++---
>  arch/arm64/mm/kasan_init.c       | 18 +++++-----
>  arch/arm64/mm/mmu.c              | 60 ++++++++++++++++----------------
>  arch/arm64/mm/pageattr.c         |  8 ++---
>  arch/arm64/mm/trans_pgd.c        | 14 ++++----
>  8 files changed, 95 insertions(+), 69 deletions(-)
> 
> -- 
> 2.43.0
> 
