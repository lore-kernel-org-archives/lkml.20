Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739DC3C3F4D;
	Mon, 31 Aug 2026 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166818; cv=none; b=tSylOAMzdw+jet4uLJ7r5C4tsSDV3GrDSKp/ZqLtzRLaHp1zrmhP5c1xNWsCLZ3Z/+qAz5c5hCQJ9gWNVVyNVa6UsmpDPXJNRA3YRvscoy5EeEsvjga6RRiZCv394+UBwmgd4krmc76LdCRK8h1gZHquMJScUuUXtGjaVlw13FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166818; c=relaxed/simple;
	bh=jZowTxn56yVlDxjNbekDindYO770ezmyC/x23vzBo5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoylQzKTa12cTSIo9b6v+M1gLTL/ImTZH9YwQd55bv84vlDeL7Ec9JyWrQ/QrdQoqZV1LHArFOl2eeOE/txy8bf1cp5p2OD0rz9YV7ESKhdb5jCtDScbwdI+kB9G+8g8ba0CePox/VyQmY7Z5TdeIKyP0i9iDluIewKXMR0dubM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+fCunIa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+fCunIa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565CA1F00A3D;
	Mon, 31 Aug 2026 09:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166817;
	bh=zi54Xqc9wYL4hOWczwnWfHtX2+L7V7hgC2AJ84YdNes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S+fCunIaNf5e046H2LrNrB9xa1oI+cz/7K5WGt2m+QU4J1O7Q4q4zkactYTUJjEna
	 ZXDXDWJFCZBZeMuL0R5BGFzezr7l+t10w23P8E0DgD8N36jmTndUD+3sWi1Rsw55pS
	 HnyrUy7xRo2rYW4gyiAru2sdSx/8MQT450NBHzWM7YUle6h12dUkvZvWwHWc8bbQ8+
	 RyCR7Nb0Mjx5jbjiMz2pndFw4USjQnmc7QoyWHhUBYmPaIh5QNwk/nje8pKfPjFcmS
	 ADkQaTtXqgN/JiqWTviAzOIMGEzz4xNcU6Dq7NvIiknL6i2C2NbhaLeAjeMi8pzEUE
	 CaEZzYqJDBxlQ==
Date: Mon, 31 Aug 2026 10:00:07 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/khugepaged: cap min_free_kbytes recommendation at
 1 GiB
Message-ID: <apVCAeICeuxaL5Ed@gremlin>
References: <20260831075635.2244437-1-noren@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831075635.2244437-1-noren@nvidia.com>

On Mon, Aug 31, 2026 at 10:56:35AM +0300, Nimrod Oren wrote:
> When THP is enabled, set_recommended_min_free_kbytes() may raise
> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
> With MIGRATE_PCPTYPES equal to 3, the formula accounts for 11
> pageblocks for every eligible populated zone before capping the result
> at 5% of low memory.
>
> This is reasonable when a pageblock is 2 MiB, as on common 4 KiB page
> configurations, but scales poorly with larger base page sizes. With
> the default arm64 pageblock sizes, the contribution per eligible zone
> before the 5% cap is:
>
>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
>
> Consequently, min_free_kbytes can reach excessive and unwanted levels.
>
> Add an absolute 1 GiB cap to the recommendation, in addition to the
> existing percentage cap. This bounds the automatic recommendation to a
> sane value on systems with large pageblocks while preserving existing
> behavior for typical systems with 2 MiB pageblocks.
>
> Link: https://lore.kernel.org/r/20260716173504.760369-1-noren@nvidia.com/
> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Nimrod Oren <noren@nvidia.com>

I do think this is a practical way of preventing runaway increase of reserves.

In the long run we need to rework the pageblock model I think, but this is
a reasonable way forward in the short-medium term.

Obviously I defer to David and the community on this if they think this is
horrible, then let's not.

But I do worry that we'll carry on with unworkably huge reserves on 64 KiB
page size while rejecting every way out until pageblocks are _entirely_
reworked to account for this (probably the long term solution).

So I think this the least-worst approach of those proposed so far for now
:) Therefore:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> v2:
> * Use a named constant for the cap.
> * Drop explicit linux/sizes.h include.
> * Update min_free_kbytes documentation.
>
> v1:
> * Cap the final recommendation at 1 GiB as suggested by Lorenzo.
> https://lore.kernel.org/r/20260728202014.2517142-1-noren@nvidia.com/
>
> RFC v1:
> https://lore.kernel.org/r/20260716173504.760369-1-noren@nvidia.com/
> ---
>  Documentation/admin-guide/sysctl/vm.rst | 8 ++++++++
>  mm/khugepaged.c                         | 7 ++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 5b318d17aa4b..c0c925e6f504 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -539,6 +539,14 @@ watermark[WMARK_MIN] value for each lowmem zone in the system.
>  Each lowmem zone gets a number of reserved free pages based
>  proportionally on its size.
>
> +When Transparent Hugepage (THP) support is enabled through global or
> +per-size controls, the kernel may raise this value automatically to
> +help keep pageblocks free and reduce fragmentation for THP allocations.
> +The automatic recommendation cannot exceed 5% of low memory or 1 GiB,
> +whichever is lower.  This limit applies only to the automatic
> +recommendation and does not constrain a higher value written by
> +userspace.
> +
>  Some minimal amount of memory is needed to satisfy PF_MEMALLOC
>  allocations; if you set this to lower than 1024KB, your system will
>  become subtly broken, and prone to deadlock under high loads.
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index f49a6710933b..a8fc061d2488 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -101,6 +101,7 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, MM_SLOTS_HASH_BITS);
>
>  static struct kmem_cache *mm_slot_cache __ro_after_init;
>
> +#define THP_MIN_FREE_MAX_PAGES		(SZ_1G / PAGE_SIZE)
>  #define KHUGEPAGED_MIN_MTHP_ORDER	2
>
>  struct collapse_control {
> @@ -3120,9 +3121,13 @@ void set_recommended_min_free_kbytes(void)
>  	recommended_min += pageblock_nr_pages * nr_zones *
>  			   MIGRATE_PCPTYPES * MIGRATE_PCPTYPES;
>
> -	/* don't ever allow to reserve more than 5% of the lowmem */
> +	/*
> +	 * Don't allow the THP recommendation to exceed 5% of lowmem or an
> +	 * absolute cap, whichever is smaller.
> +	 */
>  	recommended_min = min(recommended_min,
>  			      (unsigned long) nr_free_buffer_pages() / 20);
> +	recommended_min = min(recommended_min, THP_MIN_FREE_MAX_PAGES);
>  	recommended_min <<= (PAGE_SHIFT-10);
>
>  	if (recommended_min > min_free_kbytes) {
> --
> 2.45.0
>

--
Cheers, Lorenzo
