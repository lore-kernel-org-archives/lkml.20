Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595659;
	b=g+gShPJOIBfd6Fpalk0k0a4MVWInlV8CDyWLGJB1Zu54aIFr0R2tPwLF+DNgCz6cAsXq
	 3KDtqy2hWQBiDV1p2HxrWnyPiy0WswposjUi8JUdspF4v01+GXS8xth2IYiR/cfuN+f5b
	 VfnVoal6xBpqQt5s8QbmXR+HfQbzVyLls122ElclHGlwZWaqeipeEty4NYdfHBto3GShY
	 JF7cv21IIGXt8lb5SG3749eI4VDKGU9/gvbUmg0AcD0J0EH41Me5GHAKygIy6bKuQRWg+
	 5Rv6E1AzawYNS6m2xX1AhbMJ1I25g6ECYp9w8Fyqs7u2B5eQO1PcNt57zNWOmbKWHOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595659;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=1C5B03h9LkM0Rfb71CtzbzXspL8HxxnoCixsWU3wVKo=;
	b=VnHNqvAotaJ7zKBlfmH2Vyy+yo0UuYUnCjDDIp8MFfz/LWLqHyk4PAAQsAS3m2LH3YD+
	 MY/ljy3/NjUmNYdrnm+bBuNlTnrp5OuToKk3Fkk1LaxacfTBhTpV9RDKxLYrWUI3p3ez1
	 a+NfRnoQm+pKfZpo1Yv3aQpHznVQIz3JxOgtYEVFqmXOIeqZ5Y3lKUjUNN9upOOZR+1Yd
	 UoH55BxD0zMW3wVrYhcsvB5hZGFX6djVQ4RXD8gTYzZkjd6YzwlB/0G+A8ZahAIHzjYDv
	 JcqiCVQ9WuEGAWoaFuzOXKBwzQvQOTCS5lp3RydJegNFdWU409uCuM46OwpaQF6KYsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bieAlkYB;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1D2606A661
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B1D2606A661
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bieAlkYB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B30E3143D;
	Fri, 13 Nov 2026 10:47:34 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E29AA3F673;
	Fri, 13 Nov 2026 10:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794595657; bh=FlyuBewiCDaPu1+s79sWx/lfGstyIBmDKHKwd7lp/vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bieAlkYBHpiq7QexIl6ZIv6M7QaRTP5zcRITuv0go21Gf47D3IhN291ITaYxrPNPD
	 WP+N1VV8XUBe2tMhPl8J4zlu4fJoNSx3g2TVg15aXVlmGGEXdFO5JvV6Sz2g5qC0wZ
	 dide5nesRF9/b94f0Vka18t5XTni0ynuw8xegKs8=
Date: Fri, 13 Nov 2026 18:47:32 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] slab: allow sheaves for SLAB_NOLEAKTRACE caches
Message-ID: <avdbRHMbKxVlIRnu@arm.com>
References: <20261113-kmemleak_sheaves-v2-1-8c557c66cec2@debian.org>
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
In-Reply-To: <20261113-kmemleak_sheaves-v2-1-8c557c66cec2@debian.org>

On Fri, Nov 13, 2026 at 06:36:56AM -0800, Breno Leitao wrote:
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
> The sheaf is allocated with SLAB_ALLOC_NO_RECURSE as well, like kmalloc
> sheaves. Without it, a backing kmalloc cache that needs a new sheaf of
> its own allocates it with SLAB_ALLOC_NO_LEAKTRACE too. kmemleak then
> does not track that sheaf, and can report objects queued in it by
> kfree_rcu() as leaks.
> 
> SLAB_ALLOC_NO_RECURSE also skips allocation tagging, so mark the codetag
> of these sheaves empty on free, as is done for kmalloc sheaves.
> 
> Link: https://lore.kernel.org/all/aW_NK2NXVgtuzCVH@gmail.com/ [1]
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Changes in v2:
> - Fix sashiko findings:
>   - Set SLAB_ALLOC_NO_RECURSE along with SLAB_ALLOC_NO_LEAKTRACE, so the
>     flag stays off the kmalloc cache's own sheaf allocation, per Catalin
>     Marinas.
>   - Mark the codetag of SLAB_NOLEAKTRACE sheaves empty on free, per
>     Catalin Marinas.
> - Link to v1: https://patch.msgid.link/20261112-kmemleak_sheaves-v1-1-e40e3d73b253@debian.org

v2 looks fine, so my reviewed-by stands. Thanks for respinning.

-- 
Catalin
