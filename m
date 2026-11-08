Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794157213;
	b=5ToBQW8FYfgBdR4og0cBCCrCbjZuHFHHjdr2lRCY2WUv5WBCho4EFopcjFcJuUhuzac/
	 InBV7H9ygEBjBTyp7u6uYTAUyDLl4QWk4+ng1s1dQ3bPfYK6yi8YRbwLwIRo0t6SFWxWU
	 VaIR0x3e0BqouawOSh7KtN2t+zd+DAtULlI8Vo2WZbEB85YvaBPnWLa7rbfEL/n/NgKN3
	 dYCJjPGcCPfsDnyUuFpSU4ojpaP/lbbPx1a0//d1gPAx4iMWv+D8EU6XnrKHLb6/xUP+M
	 DtEjQzeJej77p2wVT26E7qNQyHbd9mFjZXHq7sezpiz29l8W9BIY7fB0mC40K4neGrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794157213;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Cn29Cz409bAkUNu2nlc09QH3V1QgnP/zwgBADo3882E=;
	b=fvUQmHzqKBguWrFCLqfKEXJ1H+nKLxiIWD9B4+ksz9MZk/++h9BQi34vr0Fob1ZxDFlN
	 52VDzcq5w8e6PiHX8We+N1RjaQ2cjkZFiIXhD/S9B/GsAsrg16xQ2T4RIu2KFx2qRFPiO
	 VxvfJ00v0hAB+uVAFmC5r7IL7VO1xPA/JgRNLS/e9kOeM3kyYU4hLm5uwL6SeQxm0tu6J
	 97um+qWTZOfKtYSHfT55ctMrQjFuKTICqBj/UjejoNgVIsv7RGridYrQGO09hry4Q7V0+
	 oJfU6oHb7MTe9pFElFhgWAJ8X9DA9q9BwsOy3PiTXte57ovDLgN/GaGz03hZFHanJPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FbgV3wVs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5B1606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 17:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FbgV3wVs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A1D1F0089F;
	Sun,  8 Nov 2026 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794157213;
	bh=Cn29Cz409bAkUNu2nlc09QH3V1QgnP/zwgBADo3882E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FbgV3wVsZqo9w2ruVmy8VP2xJrKH6PVVF1CJzV0hBpuSGPDuVaZTvJqv+3/KgVK1E
	 GwIFHt80Cl8diJF4uGxipeEOrdoCYI01B26PI3JZzll56seXCbv1Rmogw2MAxtmTL9
	 sf53K+UkCoJGXPSUs5G8CqLU87xbFewtkQcsC+zCFi2349cpdk2WAja/4gvQ2K9lW8
	 cTkvwAM5VlV3QGG6zKNHGWJIZ0EQvEzeJa2wJZsqG1J7boGyWoCtWr+C0xQddg74FN
	 pLj88z6UjrCUNEUJOmwAlORhFochQSTEon3QbIPEcvjypUMRxoqTLfV2bdLM8KoLTh
	 ENe5yePI5pbYQ==
Date: Sun, 8 Nov 2026 17:00:11 +0000
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 05/10] mm, slab: rework KMALLOC_RECLAIM handling of
 SLUB_TINY
Message-ID: <avCo3RiQS4MN3nny@minisforum>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
 <20261105-slub_tiny_rework-v3-5-0484ce59eabb@kernel.org>
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
In-Reply-To: <20261105-slub_tiny_rework-v3-5-0484ce59eabb@kernel.org>

On Thu, Nov 05, 2026 at 09:43:54AM +0100, Vlastimil Babka (SUSE) wrote:
> One (relatively minor) aspect of CONFIG_SLUB_TINY is the assumption that
> letting reclaimable and non-reclaimable caches merge will save more
> memory, which is more important on small systems than the page allocator
> level fragmentation (where distinguishing reclaimable slabs should
> help).
> 
> For now that has been achieved by #ifdefs that result in making the
> SLAB_RECLAIM_ACCOUNT no-op and aliasing KMALLOC_RECLAIM to
> KMALLOC_NORMAL on the enum values level.
> 
> With the goal of converting CONFIG_SLUB_TINY to a boot-time decision,
> rework this so that SLAB_RECLAIM_ACCOUNT and KMALLOC_RECLAIM are
> distinctly defined always.

Nice!

> Now, creation of kmalloc-rcl caches is
> avoided by assigning a pointer to the normal kmalloc cache on the
> kmalloc_caches array level.
> 
> To prepare disconnecting of this boot-time decision (and the evaluation
> of the need for kmalloc_no_objext) from CONFIG_SLUB_TINY, introduce a
> slub_tiny_enabled variable that's initialized to the CONFIG_SLUB_TINY
> state.
> 
> There is one minor functional change for CONFIG_SLUB_TINY=y. Since
> SLAB_RECLAIM_ACCOUNT is not 0 anymore, caches that differ only in that
> flag will stop being mergeable. If that turns out to have a noticeable
> impact on memory footprint, we can adjust the merging decisions to
> ignore SLAB_RECLAIM_ACCOUNT when slub_tiny_enabled is true.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
