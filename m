Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25F73C7DF5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691703; cv=none; b=W1bHHGUq1PnZjA6nAH8X5xvQ6LMH5/ENyyeeKq3R2SFPquP1LV46vDS6EhJFjFnjGjL/WnOI+WVBelsWZ0L8ohCqsN8Zc1VdR2EajjhG9ztv6htR7ICqhc2iffRVTXfeweOjUKKXf7AmSkDjkCH68XeYNoK0u+C1YvV6aWhIH9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691703; c=relaxed/simple;
	bh=J4siTGXmdbSbtaIO6aLhQAfXTi6BER1sQOOt7WUN1Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DE+endf7VgR7GjKsGiZfiDtFvvs7E0IC+UKXWddJqukbizJGwOzSeqN2G2Dhwk2fA79YO4EihpoXNd4nQ8/c4CRdC3cBE0Pdj+IFA1jqMZBJ4R1FmjHIEthGGDzV1aO8l5rxOwiCG0FYSt2YHOzDqPlp9DSzlvOhrWsA8g/hWL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ik499Jek; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ik499Jek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3271F000FF;
	Tue, 29 Sep 2026 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790691701;
	bh=1reho69nUF+kdSehk4siYojJssv+Dw0ygWX/hVVwBmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ik499Jek/zqilrnYYC+EvqJwQBrSy6MYHjOwwTEhZvk9cxhOU0fVBL1jzHil2Ctmk
	 ZXANQlTwLWcQH4Z7CBSf51lnzpoxWZkVRymSm3AR1zv6S4/kSruSIZ0aoJgnPd03Mg
	 /sJOzDQo0hjKnq0dLUaQCleH+y6GnvJBa3YDHfMXWVncN/3Q63uEaYc49tssjC9MV4
	 YrlGfnqNOQ1PA6Igd2zHZxrJ3MOr4XEbTsCqqlnRCK3S3rReRRbnsM78yR3gOeAiNk
	 zzFE8erNTYp4rT9ItW9xbeljW1+o9Q4cNoPSAweosy34U2S6OnBIn2I7Nbd/ZmO+rl
	 nKhYg9U4pW7Lg==
Date: Tue, 29 Sep 2026 15:21:33 +0100
From: Will Deacon <will@kernel.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
	kas@kernel.org, rppt@kernel.org, catalin.marinas@arm.com,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] arm64/mm: add set_direct_map_ro()
Message-ID: <arvJbQmr9GwToA8R@willie-the-truck>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-3-xueyuan.chen21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901151818.3191443-3-xueyuan.chen21@gmail.com>

On Tue, Sep 01, 2026 at 11:18:17PM +0800, Xueyuan Chen wrote:
> Implement set_direct_map_ro() for arm64 and flush the TLB internally.
> 
> Co-developed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  arch/arm64/include/asm/set_memory.h |  2 ++
>  arch/arm64/mm/pageattr.c            | 12 ++++++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
> index 0091ba12200e..1be86dc11543 100644
> --- a/arch/arm64/include/asm/set_memory.h
> +++ b/arch/arm64/include/asm/set_memory.h
> @@ -13,6 +13,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
>  
>  int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
>  int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
> +int set_direct_map_ro(struct page *page, unsigned int nr);
> +#define set_direct_map_ro set_direct_map_ro
>  bool kernel_page_present(struct page *page);
>  
>  int set_memory_encrypted(unsigned long addr, int numpages);
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 132938b32eb1..0e95cd904ccb 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -355,6 +355,18 @@ int realm_register_memory_enc_ops(void)
>  	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
>  }
>  
> +int set_direct_map_ro(struct page *page, unsigned int nr)
> +{
> +	unsigned long addr = (unsigned long)page_address(page);
> +
> +	if (!can_set_direct_map())
> +		return 0;
> +
> +	return __change_memory_common(addr, PAGE_SIZE * nr,
> +				      __pgprot(PTE_RDONLY),
> +				      __pgprot(PTE_WRITE));
> +}

I haven't quite followed whether or not you intend to send a v8
making set_memory_ro() handle linear addresses, but fwiw the
implementation you have here at least looks correct to me, so:

Acked-by: Will Deacon <will@kernel.org>

Will
