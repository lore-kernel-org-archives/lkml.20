Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBE82E975E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152232; cv=none; b=jZbw3RJVTJF3QssxZ2//GxT/4IQed42DeuGVkOWYCD3ygqTVeZKbO2bPGw+0X/7uQazce7bYOuYw5V6dpNFOrNEdqCorCNZl5l8kqpRzpvf89EA2v5aztDPJTeLEClvHx19hEdWDe/RgLtas7iHFd5PTQm8aX5FZahW7TNhTDtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152232; c=relaxed/simple;
	bh=v2WXtyBLSB3YhyBRLWAjDMJC2CGbUi5Cb+4KfZ8nbrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qf29hpF1/LeTFR+V48ABbIQ97zjU6XSkacEE9d3Y1myDcEiHYxY0xZO+4ggmYYVULl/aGwr6WLXFOXR3NQl4PDhxqQ8eBNF07jlnQciKP9Xk9Lcvtj+5TwhmFs7tg11mtqvbonZixe+sHzFHCYKCpR8RGEnZwrjhf/WZ0bd0s1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nF7al3z+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nF7al3z+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B79AA1570;
	Wed, 23 Sep 2026 01:30:25 -0700 (PDT)
Received: from [10.0.138.135] (XHFQ2J9959-5.cambridge.arm.com [10.0.138.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E3A93FA32;
	Wed, 23 Sep 2026 01:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790152229; bh=v2WXtyBLSB3YhyBRLWAjDMJC2CGbUi5Cb+4KfZ8nbrI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nF7al3z+DZBg+8dub1pTw8FtztOSgeR7ezbMdaeQ5LFQzTP/C37w01jTHe1I43jHD
	 vNLmEuv2MdLvnuEzA7jG3n2GM2rMZ4v6LRUA4Ml8zBGUdRio/9nN0TS0jYrMzZ0iP7
	 1t17BjusAYyUNC/TSoZrGmORAsTqHX9uScNIy1hk=
Message-ID: <ae280191-4d9b-4971-b724-60233895fdce@arm.com>
Date: Wed, 23 Sep 2026 09:30:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] arm64/mm: Use p4dp_get() for P4D accesses
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com
References: <20260922061638.3967467-1-anshuman.khandual@arm.com>
 <20260922061638.3967467-4-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20260922061638.3967467-4-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/09/2026 07:16, Anshuman Khandual wrote:
> Replace READ_ONCE() with p4dp_get() for P4D accesses in preparation for
> supporting both D64 and D128 translation table formats.
> 
> READ_ONCE() cannot currently be used for 128-bit page table entries on
> arm64 because it does not provide the required 128-bit single-copy
> atomicity, causing builds to fail for accesses wider than 64 bits.
> 
> Although LDP/STP provide the required atomicity when FEAT_LSE is
> available (as required by FEAT_D128), extending READ_ONCE() to support
> 128-bit accesses is undesirable. READ_ONCE() is a general-purpose API,
> so doing so could encourage other 128-bit users that would either fail
> to build in configurations without D128 support or, if D128 becomes a
> runtime option, silently permit tearing on systems without the required
> hardware support.
> 
> Instead, standardize P4D accesses on the existing page-table helpers.
> These can be overridden on arm64 to provide 128-bit single-copy
> atomicity when required. No functional change intended.

I notice you still have uncoverted READ_ONCE(*p4dp) in:

 - pud_offset_phys()
 - pud_offset()

Is that intentional? If so, perhaps we need a comment explain why it's not using
the helper?

Thanks,
Ryan


> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: kasan-dev@googlegroups.com
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/mm/fault.c       |  2 +-
>  arch/arm64/mm/fixmap.c      |  2 +-
>  arch/arm64/mm/hugetlbpage.c |  2 +-
>  arch/arm64/mm/kasan_init.c  |  4 ++--
>  arch/arm64/mm/mmu.c         | 12 ++++++------
>  arch/arm64/mm/pageattr.c    |  2 +-
>  arch/arm64/mm/trans_pgd.c   |  4 ++--
>  7 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 435e2e14c070..a6afd8929a10 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -174,7 +174,7 @@ static void show_pte(unsigned long addr)
>  			break;
>  
>  		p4dp = p4d_offset_lockless(pgdp, pgd, addr);
> -		p4d = READ_ONCE(*p4dp);
> +		p4d = p4dp_get(p4dp);
>  		ptval_to_str(pxd_str, p4d_val(p4d));
>  		pr_cont(", p4d=%s", pxd_str);
>  		if (p4d_none(p4d) || p4d_bad(p4d))
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index d9a870836faf..2a0fe0b0f771 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -74,7 +74,7 @@ static void __init early_fixmap_init_pmd(pud_t *pudp, unsigned long addr,
>  static void __init early_fixmap_init_pud(p4d_t *p4dp, unsigned long addr,
>  					 unsigned long end)
>  {
> -	p4d_t p4d = READ_ONCE(*p4dp);
> +	p4d_t p4d = p4dp_get(p4dp);
>  	pud_t *pudp;
>  
>  	if (CONFIG_PGTABLE_LEVELS > 3 && !p4d_none(p4d) &&
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index c9ad5e75b073..5771bf49e1fe 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -288,7 +288,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
>  		return NULL;
>  
>  	p4dp = p4d_offset(pgdp, addr);
> -	if (!p4d_present(READ_ONCE(*p4dp)))
> +	if (!p4d_present(p4dp_get(p4dp)))
>  		return NULL;
>  
>  	pudp = pud_offset(p4dp, addr);
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index aad29bcc7622..4dd8c1186471 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -89,7 +89,7 @@ static pmd_t *__init kasan_pmd_offset(pud_t *pudp, unsigned long addr, int node,
>  static pud_t *__init kasan_pud_offset(p4d_t *p4dp, unsigned long addr, int node,
>  				      bool early)
>  {
> -	if (p4d_none(READ_ONCE(*p4dp))) {
> +	if (p4d_none(p4dp_get(p4dp))) {
>  		phys_addr_t pud_phys = early ?
>  				__pa_symbol(kasan_early_shadow_pud)
>  					: kasan_alloc_zeroed_page(node);
> @@ -162,7 +162,7 @@ static void __init kasan_p4d_populate(pgd_t *pgdp, unsigned long addr,
>  	do {
>  		next = p4d_addr_end(addr, end);
>  		kasan_pud_populate(p4dp, addr, next, node, early);
> -	} while (p4dp++, addr = next, addr != end && p4d_none(READ_ONCE(*p4dp)));
> +	} while (p4dp++, addr = next, addr != end && p4d_none(p4dp_get(p4dp)));
>  }
>  
>  static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 22efaee79293..83709d987e7c 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -367,7 +367,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  {
>  	int ret = 0;
>  	unsigned long next;
> -	p4d_t p4d = READ_ONCE(*p4dp);
> +	p4d_t p4d = p4dp_get(p4dp);
>  	pud_t *pudp;
>  
>  	if (p4d_none(p4d)) {
> @@ -457,7 +457,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>  	}
>  
>  	do {
> -		p4d_t old_p4d = READ_ONCE(*p4dp);
> +		p4d_t old_p4d = p4dp_get(p4dp);
>  
>  		next = p4d_addr_end(addr, end);
>  
> @@ -467,7 +467,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>  			goto out;
>  
>  		VM_WARN_ON_ONCE(p4d_val(old_p4d) != 0 &&
> -				p4d_val(old_p4d) != READ_ONCE(p4d_val(*p4dp)));
> +				p4d_val(old_p4d) != (p4d_val(p4dp_get(p4dp))));
>  
>  		phys += next - addr;
>  	} while (p4dp++, addr = next, addr != end);
> @@ -1622,7 +1622,7 @@ static void unmap_hotplug_p4d_range(pgd_t *pgdp, unsigned long addr,
>  	do {
>  		next = p4d_addr_end(addr, end);
>  		p4dp = p4d_offset(pgdp, addr);
> -		p4d = READ_ONCE(*p4dp);
> +		p4d = p4dp_get(p4dp);
>  		if (p4d_none(p4d))
>  			continue;
>  
> @@ -1788,7 +1788,7 @@ static void free_empty_p4d_table(pgd_t *pgdp, unsigned long addr,
>  	do {
>  		next = p4d_addr_end(addr, end);
>  		p4dp = p4d_offset(pgdp, addr);
> -		p4d = READ_ONCE(*p4dp);
> +		p4d = p4dp_get(p4dp);
>  		if (p4d_none(p4d))
>  			continue;
>  
> @@ -1809,7 +1809,7 @@ static void free_empty_p4d_table(pgd_t *pgdp, unsigned long addr,
>  	 */
>  	p4dp = p4d_offset(pgdp, 0UL);
>  	for (i = 0; i < PTRS_PER_P4D; i++) {
> -		if (!p4d_none(READ_ONCE(p4dp[i])))
> +		if (!p4d_none(p4dp_get(p4dp + i)))
>  			return;
>  	}
>  
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 07b2fa4de57f..826856ef64a8 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -403,7 +403,7 @@ bool kernel_page_present(struct page *page)
>  		return false;
>  
>  	p4dp = p4d_offset(pgdp, addr);
> -	if (p4d_none(READ_ONCE(*p4dp)))
> +	if (p4d_none(p4dp_get(p4dp)))
>  		return false;
>  
>  	pudp = pud_offset(p4dp, addr);
> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> index d119119455f1..7afe2beca4ba 100644
> --- a/arch/arm64/mm/trans_pgd.c
> +++ b/arch/arm64/mm/trans_pgd.c
> @@ -99,7 +99,7 @@ static int copy_pud(struct trans_pgd_info *info, p4d_t *dst_p4dp,
>  	unsigned long next;
>  	unsigned long addr = start;
>  
> -	if (p4d_none(READ_ONCE(*dst_p4dp))) {
> +	if (p4d_none(p4dp_get(dst_p4dp))) {
>  		dst_pudp = trans_alloc(info);
>  		if (!dst_pudp)
>  			return -ENOMEM;
> @@ -145,7 +145,7 @@ static int copy_p4d(struct trans_pgd_info *info, pgd_t *dst_pgdp,
>  	src_p4dp = p4d_offset(src_pgdp, start);
>  	do {
>  		next = p4d_addr_end(addr, end);
> -		if (p4d_none(READ_ONCE(*src_p4dp)))
> +		if (p4d_none(p4dp_get(src_p4dp)))
>  			continue;
>  		if (copy_pud(info, dst_p4dp, src_p4dp, addr, next))
>  			return -ENOMEM;

