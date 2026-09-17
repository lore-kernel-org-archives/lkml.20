Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055E24B0E4F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638309; cv=none; b=IM/q8T2XLO71W12m1SZ8pcoy7MNU3avpp0/GT/DnsHn1jTrwVnPr2VfAAwXQMdvaeYnQRfJuQqvVi1DzJUIGCsutA/S8kCJecFt9esiZ4k0J6KCd6XccYulE3C8K6kR3KR22B8iB4XSgFSLa2Etqlx+aUqwwT+Ib9lkse+5kenQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638309; c=relaxed/simple;
	bh=JfZAoL8Eh3ns00ScmhezFLOO0B/hvl3Jz2KqSsSE7eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIuQnlzDNDClKLHHNYpsja+uoEJ4bCV21Ia5X1XkzZGXNWFhXwz2+G8BbbiPgN5PsZ9YAuwAvwDDehcdwJBQqxQQ/6CQI1VrE3MU0Dzhkzv37Xb1m+PEZufgd2pqOQ7zR8uKDG1jOJcLYVY4MlN70fAYvulN/40XoOrsaFckZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lA/oD3Xi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lA/oD3Xi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FAE1F000FF;
	Thu, 17 Sep 2026 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789638298;
	bh=D1skJUV0DdBu4g2bOw3ZBlDk+5R5phbl6b1ujncvlfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lA/oD3Xi/R7OGRfWv0XtB2ZJULQzeebJ0WnCL3HhKF5gfSpng//lWwlWDveRr1v3u
	 XnHKqt9K4kONwsNb/4byXHynuDo7i9vRnvTK6jwmJQVSv9Q14qvCMpo+jteHhUo0Et
	 QsdR7S7bppX81g2kyyWMrDikoznTWHTESjFjO/h/N7FnlWIa3GVRPceIS03Na96Puc
	 CwNk1JL5xC/buoc9Mm8Axflsv/VdtLgeXQhjXhyugkY0f4+a6k0+fyfYtWFphoUG6W
	 S3bvpSWujQghG5IqqSChyaaG9wwbRD9sHq/W4ji+P2RUHGdFIpjzZ1cPBCakka1Vfk
	 XvPRQtSdy0D9w==
Date: Thu, 17 Sep 2026 12:44:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Priyanshu Kumar <priyanshukumarpu@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] memblock: Remove unused exact nid allocation API
Message-ID: <aqu2lCK5Nkw-9fHW@kernel.org>
References: <20260917081504.30426-1-kaitao.cheng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917081504.30426-1-kaitao.cheng@linux.dev>

On Thu, Sep 17, 2026 at 04:15:02PM +0800, Kaitao Cheng wrote:
> This series follows the removal of the unused exact_nid argument from
> memmap_alloc(). That change removed the last in-kernel caller of
> memblock_alloc_exact_nid_raw(), leaving only the memblock simulator
> tests using the function.

Please resend the patch that removed exact_nid from memmap_alloc() and
these patches as a single set.
 
> The first patch moves the applicable exact-node allocation tests to
> memblock_alloc_range_nid(). The second patch removes
> memblock_alloc_exact_nid_raw() and drops the exact_nid argument from
> memblock_alloc_internal(), as all of its remaining callers allow
> fallback to other NUMA nodes.
> 
> The investigation cannot be extended to removing the exact_nid argument
> from memblock_alloc_range_nid(). CMA passes true when reserving per-node
> CMA areas. Allowing such an allocation to fall back to another node
> could leave the CMA area's recorded nid inconsistent with the physical
> location of its memory. KHO also passes true when allocating per-node
> scratch areas and requires those allocations to remain on the requested
> node.
> 
> Since exact-node allocation remains a required behavior of
> memblock_alloc_range_nid(), deleting all of the tests in
> alloc_exact_nid_api.c would remove useful coverage. Preserve the
> applicable NUMA tests by making them call memblock_alloc_range_nid()
> directly with exact_nid set.
> 
> Some tests cannot be preserved unchanged because they exercise
> memblock_alloc_internal() retrying below min_addr. Unlike
> memblock_alloc_internal(), memblock_alloc_range_nid() treats its start
> address as a hard boundary and does not retry from address zero. Remove
> those tests together with the now-unused TEST_F_EXACT dispatch from the
> shared allocation tests.
> 
> Kaitao Cheng (2):
>   memblock tests: Move exact nid tests to memblock_alloc_range_nid()
>   memblock: Remove unused memblock_alloc_exact_nid_raw()
> 
>  include/linux/memblock.h                      |   3 -
>  mm/memblock.c                                 |  44 +-
>  .../memblock/tests/alloc_exact_nid_api.c      | 454 ++----------------
>  tools/testing/memblock/tests/alloc_nid_api.c  |  20 -
>  tools/testing/memblock/tests/alloc_nid_api.h  |   1 -
>  tools/testing/memblock/tests/common.h         |   2 -
>  6 files changed, 42 insertions(+), 482 deletions(-)
> 
> -- 
> 2.54.0 (Apple Git-157)
> 

-- 
Sincerely yours,
Mike.
