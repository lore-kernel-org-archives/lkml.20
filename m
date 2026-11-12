Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501610;
	b=chjGFelBhI8mrwpvXgGtxNeKtTYnLHSznFSs/kG3EEL5cPH9j15ZRWHZRH20MFI5bTNb
	 TBkWgOt9vGnWtDASsBnG5xKQFYhRxhq0zuwW/KH4s+W41zVOwz5wPmgR/EsWjGeMol7Q+
	 jTvefnzEpl6ZmzVXjTv132e3noqNJa1PaSqXxSqwz00tzBSvfNucBZtu0x4bfe0l91naL
	 +fq5s1VhtpXIBMZAo0WWnnSvekgZeu+R+/4PLIxUhytEgM7UXt0vLNBG5/vlL4ikmaZKt
	 V7Bp3kjWtix9EspDyEdgBQFKHPnXpoxg4m0F2XoVI1oXg7PFcdLSMaP/CnU6XJkmIXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501610;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=C/y7Uwn+oYzUTWr8Qk21aG5gEd4/XpyC+An9k7mgPHU=;
	b=3Ebfqbx29myiZk3+HUvfqvDqxGPzOkHWngdyLJ+sExipoTv6LsQiRS33MMO8XDelMSou
	 zV4VoDcNseAdo13a0OUImiunwRrJOm/2VDIRttg2dPhr0Wy6gGZhUcQi8nmeXV1NZLvoQ
	 ZpyhG7KE1JAh6voDXGgThLzUJ+pFApFCwgg4CZT2DhiNVL3Zc92fbsLIJfyIUGgAvlpY+
	 Q/a2wCPDahYZT2LnCu8DgD9L+kly1JxJ6NV7PhA82IvjbZwtSFGlTQve2ym6wJefbKACM
	 IcRhCADL2zjxpCp6nT+MxxfE9ydVADZJRl9u70BCE2+YQlZYwqzTfkKNT+B9sfm+pEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=l+Q1RsYq;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA3760A2627
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA3760A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=l+Q1RsYq
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DE811516;
	Thu, 12 Nov 2026 08:40:06 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 232B23F673;
	Thu, 12 Nov 2026 08:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794501609; bh=OJf9vH/UgjbPnMOOD4wehtLjTNHfSY54RGcIkGkVj5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l+Q1RsYqmctClM4wHH70rhdR+HU8l3Kg7ueSQCCj6M/lsoXW/qFh42720oSelH2GM
	 JhQXQQCr16wIWjJDJ2zx1hNlB/x3J6qZhH1su+womvkbU7Ez3JFeN0hyByCHApTd3o
	 ZcLq8SbN47HvFupyhUkfKC4cIsm+8vL3/4W5TAJk=
Date: Thu, 12 Nov 2026 16:40:05 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] slab: allow sheaves for SLAB_NOLEAKTRACE caches
Message-ID: <avXr5f2pe5lXpDN2@arm.com>
References: <20261112-kmemleak_sheaves-v1-1-e40e3d73b253@debian.org>
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
In-Reply-To: <20261112-kmemleak_sheaves-v1-1-e40e3d73b253@debian.org>

On Thu, Nov 12, 2026 at 02:04:18AM -0800, Breno Leitao wrote:
> This is a patch that makes kmemleak cheaper to run, by letting
> kmemleak's own metadata cache use a _new_ sheaves type. The flag only
> makes that possible without recursion.
> 
> The cost today:
>   * every allocation kmemleak tracks needs one kmemleak_object from
>     object_cache. An RCU callback frees it later.
> 
> Why that's slow:
>   * object_cache has no sheaves, so each of those allocations and frees
>     goes to the shared slab lists under n->list_lock.
>      - On meta's fleet kmemleak kernels, list_lock is the second most
>        contended lock, after kmemleak_lock.
>      - About 88% of that wait is RCU callbacks freeing kmemleak objects.
> 
> Why sheaves aren't allowed:
>   * a sheaf is a kmalloc object. Tracking it makes kmemleak allocate
>     another kmemleak_object, which needs a sheaf, and so on.
> 
> When I reported the recursion in [1], I suggested keeping
> SLAB_NOLEAKTRACE caches away from sheaves, and commit e47c897a2949
> ("slab: add sheaves to most caches") did that. It stopped the
> recursion, but it took the sheaves away from the whole cache, although
> only the kmemleak tracking of the sheaf itself recursed.
> 
> Commit 17c38c88294d ("slab: remove cpu (partial) slabs usage from
> allocation paths"), from the same series, then left these caches with
> no per-CPU caching at all.
> 
> In hindsight, skipping kmemleak only for the
> sheaf itself, as the new SLAB_ALLOC_NO_LEAKTRACE does, would have been
> the better fix.
> 
> Link: https://lore.kernel.org/all/aW_NK2NXVgtuzCVH@gmail.com/ [1]
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
