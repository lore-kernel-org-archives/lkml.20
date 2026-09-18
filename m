Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCFE527597
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764427; cv=none; b=oIHGK7Af8o+MAIJqGGb7H0fmoISH3w35Ib2nDJqa/o0Hti48jqjJkyJR+/gXCwKvAre6w82eFd4qPgksPJrPf0YpOJnANBS8nIqNPZEw07cskxtc7/jrxguEnOfGInJfYqERoQmQhqe2487o+GaHN3ZIs3dnPKMpSDGom7DnuQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764427; c=relaxed/simple;
	bh=QKfVWVtIJcPuI7wVZek4I1PWhgmJqZeOzdiYlEijovA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AF45K6ef/SxArXu9Cbbk5QMza9r/I/U6QP7o80byqWW6OJzM3nWFuHe6yoknyOQLNmQLubBGQ81BqmZNGsxEt+AGr/hI/QnaBXaNMk6SMSjoBvnz452PIpemA1D0BIMiq1bs8JyzxuFlhWnjcp8royZZ0XPzHs6wXzoXFsDbauI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKr6V+4u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKr6V+4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEF61F000FF;
	Fri, 18 Sep 2026 20:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789764425;
	bh=fe2KGn65vGnNk3T7Nd1gAbsrg0Fr2KhMni3HFhxALbc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gKr6V+4uPkVj2ijRbu8ZBVV3Ud/yBihVL2ETBxTzvm6vr8T1e78AA6m6p9jrqAR49
	 ShztAYhRkBZ7bmJ7P5viMWIlIPCE29GzfHWnwBRHK18Z5vCYYiQmnV/dzhB9V7Yvna
	 bU/apqh0UnbIqX0PM+xZTtpgIyLV+FFkwagZTxGoDt7ogqmdOGjLgL94oWmmPaZD7J
	 nTWFlWP4a3YtaV1trCe6gVQwlf27ANPq7BbP5vet9W0algcFfwWmHBhlTcHz/QjQnc
	 oVOvmBSAeY+m7Vndreh8QE9xTEmZbFdWSsK3hBHYkiml75OVOZY6XLjlpxBsoUqJZO
	 SbNTt1CRinRzQ==
Message-ID: <6e542162-fe6c-47da-b0c4-a36251242950@kernel.org>
Date: Fri, 18 Sep 2026 22:46:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/17] mm/huge_memory: rename remap_page() to
 remap_anon_folio()
To: kasong@tencent.com, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, "Kiryl Shutsemau (Meta)"
 <kas@kernel.org>, Shivam Kalra <shivamkalra98@zohomail.in>,
 Kairui Song <ryncsn@gmail.com>
References: <20260915-swap-thp-cleanup-v5-0-39878b37dfb0@tencent.com>
 <20260915-swap-thp-cleanup-v5-9-39878b37dfb0@tencent.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260915-swap-thp-cleanup-v5-9-39878b37dfb0@tencent.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 19:14, Kairui Song via B4 Relay wrote:
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

See my comment below, delete that comment about "what if X" entirely. Also, we
wouldn't want to update remap_anon_folio().

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

Add remap_anon_folio for file folios? Just delete this entire code comment.
Whoever wants to implement that can look into the pieces that are actually needed.


With the comments sorted

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
