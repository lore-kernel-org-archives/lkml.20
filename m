Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BB3412280
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965282; cv=none; b=I9CBd2bihYfKKqfKmioAgN2+juDntiXgfBPkB/GPmrj1wCdlziZsxZzF2p56aqFvdd9C3ZwhzSUyS0qXUiuYe8v7eTiQtrzcjAefLMr20dCdTsQl9wJnzUBw4AyWs6MvEApxSKgrQajEDvUS9ZM9YJYkjcXsEG/8De+PVpo5qEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965282; c=relaxed/simple;
	bh=MUie6VSnW5OquybNhX7YpynpIviFja/SPKRkeO/X0wM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J3y3YXmyX663XbpO7ZU8O6vZNAoEA99CoNKTIkvcRvRvKCYBlbCFKTaqk+557GwR+fzrgjhGqwmcTJ1KheHQpdPA6ke1C1BTfTM0vp0+nCQ/awzHXdVSFKVwHk4aJrPW9bQ608LwkdUIFlmvcPZwiVZfCwCMh//pJ0jHM9KndEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=D36suGID; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="D36suGID"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56E2F1576;
	Wed, 14 Oct 2026 01:07:55 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28C6B3F7B4;
	Wed, 14 Oct 2026 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791965278; bh=MUie6VSnW5OquybNhX7YpynpIviFja/SPKRkeO/X0wM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D36suGIDWLUtoLdWoMaoApXTyWb2dzsEOXw/86kfMa+KgI93jY3cyZhzJ4faej4Sh
	 JoeimUdc+OnzEu/p97k/KVlKyD++ribIOtPYH/XLmQ5DbwSBE4LVzCjncH4gY/3l/L
	 763i0DKSevsHZIg/cPifkmIZayELI65poLThF0W0=
Message-ID: <1a34d980-4520-464a-b8d9-7720136bdacf@arm.com>
Date: Wed, 14 Oct 2026 13:37:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/10] arm64/hugetlb: drop the init_mm special case in
 clear_flush()
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 baohua@kernel.org, chleroy@kernel.org, david@kernel.org,
 jiangwen6@xiaomi.com, leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
 ryan.roberts@arm.com
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-5-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261002090947.869220-5-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/10/26 2:39 pm, Wen Jiang wrote:
> clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
> was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
> pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).
> 
> Now that vmap uses pte_set_huge()/pte_clear_huge(), mm/vmalloc.c is no
> longer a caller of set_huge_pte_at() on arm64. The only remaining
> callers passing &init_mm are in arch/powerpc, which uses its own
> implementation. Remove the dead branch.
> 
> No functional change.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Reviewed-by: Barry Song <baohua@kernel.org>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  arch/arm64/mm/hugetlbpage.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8e799c1fe0aa6..ce247b06fe03d 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
>  		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
>  
> -	if (mm == &init_mm)
> -		flush_tlb_kernel_range(saddr, addr);
> -	else
> -		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
> +	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
>  }
>  
>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,

