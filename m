Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540537;
	b=oM0hmyjw9VNeId136m2Dla83gLd8oM336GulQ1Ny/9SZ6pMW4q23u/0bL+EjwF8VAbil
	 QtwTua9q6EyvY5KKlWhryWDtIm2cUHY5VI4c5L/9ecxb17gqXLTHiGLWGs7x9j9wNyJ8s
	 cM1t3w+RoQF05J7A9LyYHa8nDUNu4BntZSBrerGD/dwoAl1GRbkelSYPbIauDAIXHqrAA
	 LU66ZooOeoml59zqu6UCOeK6QTDGho3ZNwJhCfiXgoBLpglcN0MCga8LSHsi+0yPS+Iy0
	 iwcUPE+1nAcuBf4DOXz3veleEL4QFuDvvMSZ3JqOd/3oxTBXt+DQvmyv4NDmZFA0wAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540537;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=bOwK+5oLftQk320DH0GEbzZnadmplgpiQL2jCJ+yV24=;
	b=Zmgci03pMKS53OzUph9pbA++VQZgjvFgKrtitIOIXRPtkwphss79nPXYnL9E2cwJI1IM
	 Y7qIINnFZjBNZn3LrPrFyoyu/zvU3FiOFcgtcDk8ApLzXyTI1EMvFo8/rpWxX7ZBLZAad
	 ZBbJwqvPsj0TRa7TkxWfsoy9W1tjaZWZnP3F6Zf2zPUAD1r96grewfFePKcwHtNAQ8mWv
	 IEICQkuu/i6cVpg+15IBGvTSKfYep45+0XXQ5Z2ubpeD1JFs3DpOyK1MLXr8XhGFru9Pp
	 PC7WPe2R5VLB3gEboF7Keqq2ywW/JkMO10b5C99I4SuegiK7t/Nu2ViMN74mWuMY82w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cQzJAi9q;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79B9606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cQzJAi9q
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6D24175A;
	Thu, 12 Nov 2026 19:28:51 -0800 (PST)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 106C63F632;
	Thu, 12 Nov 2026 19:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794540534; bh=kLEU3+bkOweqD+kWRCMnCgNUSxxZISweiL/OZrrvsQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQzJAi9qDEf+g9Wu+39XmiWj8YhBA0INOILUGffcjMUE8/Tf9z7R4Xduj/J3XnJva
	 NIkTXHmTBtDOBXymBVjpVAXOyuDh6Q8LHelosDBddoa2rtGosn/7Xf/ohNpiQnHq7C
	 yISkFw1TmXdLfYUuB5eNB4w4khmLNN95v7wKKgUE=
Date: Fri, 13 Nov 2026 08:58:51 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V4 0/4] arm64/mm: Convert pgtable READ_ONCE() as
 pxdp_get()
Message-ID: <vtaekdnpxd5avhpv3hlmeswwq5raf57ila2qyilxvddu3w5nnq@lkenzauzv7hy>
References: <20261105043403.3326445-1-anshuman.khandual@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105043403.3326445-1-anshuman.khandual@arm.com>

On Thu, Nov 05, 2026 at 10:03:59AM +0530, Anshuman Khandual wrote:
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
> V1 series. There are no functional changes here, and besides mm kselftests
> do not show any regression.
> 
> https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/
> 
> This series applies on v7.4-rc1 and have been hosted below for reference.
> 
> git@git.gitlab.arm.com:linux-arm/linux-anshuman.git (arm64_pxdp_get_v4)
> 
> Changes in V4:
> 
> - Dropped all pxdp_get() platform overrides per Catalin
> - Moved pmdp_test_and_clear_young() and [pud|p4d]_offset[_phys]()
>   helpers inside arch/arm64/mm/mmu.c to avoid build problems
> - Updated all commit messages as required

This series has run into some KASAN fault issues during boot with 5 level
pgtables but also unlike Sashio suggestions these would require more code
churn to fix. Please find the details below.

https://lore.kernel.org/all/ohyhflzuoxdemccemutoosmj5hsfwylrlt6tvnyehulerk7gf3@ada6wu4zrzkp/

NOTE: somehow Sashiko had dropped LAKML from the thread although it shows
up in MM list.

Given the above scenario, I would suggest falling back on the V3 series,
that defined and override pxdp_get() helpers for arm64 platform. Although
similar to generic MM default fallback, they prevented code movement into
arch/arm64/mm/mmu.c file causing these KASAN issues in the first place.

https://lore.kernel.org/all/20260924062214.1635078-1-anshuman.khandual@arm.com/

V3 series apples cleanly, builds, boots and also clears MM selftests on
v7.4-rc2 as well.

> 
> Changes in V3:
> 
> https://lore.kernel.org/all/20260924062214.1635078-1-anshuman.khandual@arm.com/
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
>  arch/arm64/include/asm/pgtable.h | 38 +++----------
>  arch/arm64/mm/fault.c            |  8 +--
>  arch/arm64/mm/fixmap.c           |  6 +-
>  arch/arm64/mm/hugetlbpage.c      | 10 ++--
>  arch/arm64/mm/kasan_init.c       | 18 +++---
>  arch/arm64/mm/mmu.c              | 97 ++++++++++++++++++++++----------
>  arch/arm64/mm/pageattr.c         |  8 +--
>  arch/arm64/mm/trans_pgd.c        | 14 ++---
>  8 files changed, 108 insertions(+), 91 deletions(-)
> 
> -- 
> 2.43.0
> 
