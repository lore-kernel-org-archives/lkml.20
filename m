Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906593C5536
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406905; cv=none; b=fiZ5rohVHVvs4Nu/ZqGmf+YH7tAKi5yd3vDLd2h/zCfwhnCkki36xCHHUktayTFOagaSlWg/rDoTMhlL0ZXyrgDeUrS8ZnxweuM4ath4XzksnF57OeCJ9HuyVhr8VmRiaMLuzJ0LanWEFMYIvPH9hTqyU64f/MY0CnKARsfj2xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406905; c=relaxed/simple;
	bh=iWelEh5WTFtiuhjvHXqEJk6UgYv+6dS3Y9MFxXTD4gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJn9Hzxa4qoRK3gyPjQFquTrZm8L6eRsuDXcJXqLsaLLFukAAM1WoNuTJWmD16Gsab+E5edaEXxCD+bmOeGeSs1pXaT3QytHQzrWDi80LjnaLKpCYPDs4vZlyR4rr87JTnS5rY4SVyUXcafFPMLmctKipOLSjJznMvP+fbOh1Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iqVO95GG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iqVO95GG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F2CB1570;
	Mon, 14 Sep 2026 10:28:18 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 104EA3F882;
	Mon, 14 Sep 2026 10:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789406901; bh=iWelEh5WTFtiuhjvHXqEJk6UgYv+6dS3Y9MFxXTD4gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqVO95GG/lAzGR+I07S9/5tlA29acYiZ/DZ5aBXzX2+E7SEpYUgg7Vv4VlcTWkfGH
	 Gl3JT9xnFYPbTnJ+hGrmwfzrrCGuR+NhASmSfHwBa84Z+UrTtvm6msFhiSGiAhB8yX
	 DmomfBtMw/bRPNL9c7SCisQUO9WKy6Nsc5ZIHJnM=
Date: Mon, 14 Sep 2026 18:28:15 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Shivam Kalra <shivamkalra98@zohomail.in>,
	Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v5 09/17] mm/huge_memory: rename remap_page() to
 remap_anon_folio()
Message-ID: <aqgur6-4y2tpEGh6@e129823.arm.com>
References: <20260915-swap-thp-cleanup-v5-0-39878b37dfb0@tencent.com>
 <20260915-swap-thp-cleanup-v5-9-39878b37dfb0@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-swap-thp-cleanup-v5-9-39878b37dfb0@tencent.com>

LGTM.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

> From: Kairui Song <kasong@tencent.com>
> 
> remap_page() now only has one caller, __folio_freeze_split_anon(),
> and is only ever called for anon folios: unmap_folio() currently
> leaves file folios unmapped after the split, so they need no
> remapping.
> 
> Rename it to remap_anon_folio() to make that explicit, and add a
> VM_WARN_ON_FOLIO() documenting it.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/huge_memory.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 1749905ade6a..77bf68c9b9af 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3552,7 +3552,7 @@ static void unmap_folio(struct folio *folio)
>  	/*
>  	 * Anon pages need migration entries to preserve them, but file
>  	 * pages can simply be left unmapped, then faulted back on demand.
> -	 * If that is ever changed (perhaps for mlock), update remap_page().
> +	 * If that is ever changed (perhaps for mlock), update remap_anon_folio().
>  	 */
>  	if (folio_test_anon(folio))
>  		try_to_migrate(folio, ttu_flags);
> @@ -3637,10 +3637,17 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
>  	return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
>  }
>  
> -static void remap_page(struct folio *folio, unsigned long nr, int flags)
> +static void remap_anon_folio(struct folio *folio, unsigned long nr, int flags)
>  {
>  	int i = 0;
>  
> +	/*
> +	 * unmap_folio() installs migration entries only for anon folios,
> +	 * so currently only anon folios need to be remapped. File folios
> +	 * stay unmapped after the split and are faulted back on demand.
> +	 */
> +	VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
> +
>  	for (;;) {
>  		remove_migration_ptes(folio, folio, TTU_RMAP_LOCKED | flags);
>  		i += folio_nr_pages(folio);
> @@ -3724,7 +3731,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>  		 *
>  		 * Note that for mapped sub-pages of an anonymous THP,
>  		 * PG_anon_exclusive has been cleared in unmap_folio() and is stored in
> -		 * the migration entry instead from where remap_page() will restore it.
> +		 * the migration entry instead from where remap_anon_folio() will restore it.
>  		 * We can still have PG_anon_exclusive set on effectively unmapped and
>  		 * unreferenced sub-pages of an anonymous THP: we can simply drop
>  		 * PG_anon_exclusive (-> PG_mappedtodisk) for these here.
> @@ -4084,7 +4091,7 @@ static int __folio_freeze_split_anon(struct folio *folio,
>  	if (need_remap) {
>  		if (!ret && !folio_is_device_private(folio))
>  			ttu_flags = TTU_USE_SHARED_ZEROPAGE;
> -		remap_page(folio, 1 << old_order, ttu_flags);
> +		remap_anon_folio(folio, 1 << old_order, ttu_flags);
>  	}
>  
>  	return ret;
> @@ -4206,7 +4213,7 @@ static int __folio_freeze_split_file(struct folio *folio,
>  fail:
>  	/*
>  	 * If we want to use try_to_migrate() on file in unmap_folio,
> -	 * remember to add remap_page() and adapt it.
> +	 * remember to add remap_anon_folio() and adapt it.
>  	 */
>  	xas_unlock_irq(xas);
>  	if (nr_shmem_dropped)
> 
> -- 
> 2.55.0
> 
> 

-- 
Sincerely,
Yeoreum Yun
