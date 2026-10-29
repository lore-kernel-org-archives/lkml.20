Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793276581;
	b=WQXY2GLci5Ru6BuEtK76JlPIZJ1X0sNZX5q9C3VnKppQAavKzI5hZ+LSx4DH/xDyjoRR
	 d1VhTlpl0VkatIHDZKaDAJ/OHroDyM9kX8r8zMCbQbZ8VFwjRhPmgC9mKiEGID9cQG4ho
	 37rwHDs/fnPDucNnzUSTLUNz4TjrIEY9IDgfyt6sLAVxwzEDoFRreN7DfS1pQp2OdsQ15
	 9AsDSVqKna54lAB28BALT+cPiJJhH4MFWhpEJb8tELFJlmXpWwX8xcNeSU4u5mv++WFiH
	 Od5uumNjIvA+qV6oi8HSSCzqU6fEpwagQw9G5jgT/AsIhBvQ4k1kuriH7phMsj/4aqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276581;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=r6E1IEixHTh8cJ3/xRiHjP84PzUjYGfrYzQ71GFVa4U=;
	b=5P6Vu9ZgWtz27+81HW1kMXsw9qBp5G3uj6g3DWLWtfZRV8y3C3zFEPVgWQfOhX5DDqU/
	 NCasVuiwo8nqCtJdNZ8xDr+TSW2okOVw2Mcz0i6g8vpP5XlT3i4kgVrQGxZ5xdD7qnU+K
	 JEZp9cWEQ5KGAdd2KUjRi4XM4CvSb6eZEqKDX4os5ZcO6hEyw+bGmvhXAPeh25DHu+AG6
	 BKSAVoBa1TxEooldGD3j/blBzCmjb7kU+Uee3pwZqnDUOwhYx8+YEy01pWXNndmK9uh7b
	 pY7IQq1PCU0jhtXezlzhiRHKP5a93sidVhKAlKvJ81pnfz2n2OLg9aVtV0FnRG88lKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DY4TNd5n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4B3606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DY4TNd5n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4251F01825;
	Thu, 29 Oct 2026 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793276581;
	bh=r6E1IEixHTh8cJ3/xRiHjP84PzUjYGfrYzQ71GFVa4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DY4TNd5naEMsmhz2lvr3AUxVCOaYTfN4Gh5huITORmh05nN3YGxczRJbuCgLdFe+J
	 v7OZntuOdNvhFvnbYgF2YThtGw9fVrr9/9cL0vchoH46OXubztM3mtbD/Uo272P3lj
	 i6u9BcZ1EVKqwtsEWWG0OfQTHx4vPmadUmRIH3vEsCSc2y6NQsCyf3iNJyL34tBuIV
	 tdO9bh3Sb6dKTez4oQaZPhwLKSVgv1PXv8DbihTyGae+HrBtyCAemi38u1jMlgFSJ2
	 8USRGvYOnpsYW8Q6vkYcY0phhNtH4B2af+3Xiyq1K6mZEvlG7nTzlR6an8TQiaUWZR
	 rHL8n/kJ/a/Fw==
Date: Thu, 29 Oct 2026 14:22:54 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, fvdl@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mm/cma: fix range selection in
 cma_declare_contiguous_multi()
Message-ID: <auM6nqlB9FusAr4B@kernel.org>
References: <cover.1792032699.git.skunkolee@gmail.com>
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
In-Reply-To: <cover.1792032699.git.skunkolee@gmail.com>

On Wed, Oct 14, 2026 at 08:53:39PM -0600, Ivy Lopez wrote:
> These two patches fix two independent bugs in the multi-range selection
> of cma_declare_contiguous_multi(), found by code inspection with the
> help of an LLM (both patches carry Assisted-by: LLM).

cma_declare_contiguous_multi() seems broken in many ways.
I'm working on a patch to rewrite it.
 
> Patch 1 fixes list_insert_sorted(), which does not actually sort: it
> stops at the wrong entry and, when no entry matches, inserts before the
> last entry instead of appending. The caller assumes the list tail is the
> smallest recorded range and that the list is walked largest first.
> 
> Patch 2 fixes sizesum counting the size of ranges that were skipped
> because the list was full, so the sizesum < total_size check can pass
> when the recorded ranges cannot cover the request, and the function
> returns 0 having reserved less than asked for.
> 
> Each patch fixes a distinct failure and neither depends on the other.
> No kernel-level reproducer was produced and nothing was tested beyond
> compiling; the examples in the commit messages come from a userspace
> copy of the helper and the selection loop, written from the source.
> 
> Changes in v2:
> - resend as a series with a cover letter, as requested by Lorenzo
> - commit messages now state how the bugs were found and that they were
>   not tested on hardware or in a booted kernel
> - add Assisted-by: LLM
> - patch 1: correct the sentence about the first inserted range staying
>   at the tail (only until it is evicted)
> - rebased on the current akpm/mm-new
> - no code changes
> 
> v1: https://lore.kernel.org/all/20261011003059.169430-1-skunkolee@gmail.com/
> 
> Ivy Lopez (2):
>   mm/cma: fix list_insert_sorted() ordering
>   mm/cma: do not count skipped ranges in cma_declare_contiguous_multi()
> 
>  mm/cma.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> -- 
> 2.56.0
> 
> 

-- 
Sincerely yours,
Mike.
