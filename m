Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92CA4A92C7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345980; cv=none; b=BarvWi9cfJoCjD1Toy8VzWmFnfDDwKZlNsrCiH+bKP1Qa0zpjtU27kRbgLnEOEb1PYg8gmbwLVTcdDkDbPRW777sPmQOnRwuAX5H/dYwCgXPh6W9layunc+TUFi82ZItC+b7aRJGtFxXx/DP47YAthhRADVBGCxxFkRDlEBu62k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345980; c=relaxed/simple;
	bh=P2QceO7TWL/OkfQx50Hr3eRAkUKv9seQDfKLnm86cUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcA9sr0BEUhBLz4wWKL74gJl2TC6zU4uDvB0MUU+rJT+OK8bIXG/WF3kto6sFD7aC3oWYIcP9kcbjRaaMZ7FXiyrGSMcPOG0brWvWFyPKQ8fOPzgnIZYs8B/yxOIYrjauU7cBP8255r8uBuNXuyPWs7jfMpmWOHbLbllZdAFIVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXewc01/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXewc01/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7401F000FF;
	Fri, 25 Sep 2026 14:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790345977;
	bh=O90HcrDUDgs2gPlyP4PnGmdYEEb1BqgRZEgL2Xb6ukw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GXewc01/R8D6CuSugKRzRVSbYHz161gyghKdjbBLXgPoxnBYiwvlYMDy19RpgyO7z
	 RoAzuRyYQ1wUfenQJmIctyatSXZcfRy5yPXkHfRwbN+jNZkFNP/CXJyPMBv0PPf7wA
	 vB4GnsqGDG7W6YJJqHefdXeSqauBqsOF18fAxiPxFr4KmGyX6xqGN7XED4SE+qWjGm
	 09Cm5j0x/RqY/Gb9iU2wNz3k8E3P0NuRI2X8cyJSIGHBi6WON277di/UhPFcHYlrH7
	 ORuvIf6RIOXvnNbe1wqxNAHRMUBuWZJgB+cw5tuDSNk4IgY47Z91uDoVBFO+TD2xKU
	 zCpLfnfzWlt7Q==
Date: Fri, 25 Sep 2026 15:19:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@kernel.org, 
	ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev, 
	kas@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: shmem: ignore sysfs configs for shmem forced
 collapse
Message-ID: <araC3bWDouc4_i4X@gremlin>
References: <063f655b4d6c4234f3aa27ed6ecab10283ecb880.1789351825.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <063f655b4d6c4234f3aa27ed6ecab10283ecb880.1789351825.git.baolin.wang@linux.alibaba.com>

On Mon, Sep 14, 2026 at 10:12:41AM +0800, Baolin Wang wrote:
> According to Documentation/mm/transhuge.rst, MADV_COLLAPSE is expected to
> ignore any THP or mTHP interface settings.
>
> However, after commit 26c7d8413aaf ("mm: thp: support "THPeligible" semantics
> for mTHP with anonymous shmem"), performing MADV_COLLAPSE on shmem will
> depend on /sys/.../hugepages-2048kB/shmem_enabled being set to "inherit"
> (although that is the default), which can cause MADV_COLLAPSE to fail
> unexpectedly.
>
> Fix this by returning the result of shmem_huge_global_enabled() directly
> when MADV_COLLAPSE is requested, allowing PMD-order collapse while ignoring
> shmem THP/mTHP settings.
>
> Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP with anonymous shmem")
> Reported-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Closes: https://lore.kernel.org/all/20260908125105.1510704-7-kirill@shutemov.name/
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Seemes reasonable!

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> Changes from v1:
>  - Use the correct fixes tag (per Kiryl).
>  - Collect reviewed tags from Kiryl, Zi and Lance. Thanks.
> ---
>  mm/shmem.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/mm/shmem.c b/mm/shmem.c
> index c92ed17dbc4a..b572c60f2af8 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2049,8 +2049,11 @@ unsigned long shmem_allowable_huge_orders(struct inode *inode,
>
>  	global_orders = shmem_huge_global_enabled(inode, index, write_end,
>  						  shmem_huge_force, vma, vm_flags);
> -	/* Tmpfs huge pages allocation */
> -	if (!vma || !vma_is_anon_shmem(vma))
> +	/*
> +	 * Tmpfs huge pages allocation or forced collapse ignores
> +	 * sysfs configs.
> +	 */
> +	if (!vma || !vma_is_anon_shmem(vma) || shmem_huge_force)
>  		return global_orders;
>
>  	/*
> --
> 2.47.3
>

--
Cheers, Lorenzo
