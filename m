Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322012;
	b=L7REe0fAqD2zSk+UYVcZ2ILyn+lHzmUMQMA/jTZ8nKSmjOuoqU4HXu2jPhyjhifL/pzN
	 4i6x7p0gpB/eFrBy/unJbZxIDzTA7M+dqBRPMxHDG/c7bKoaR49LSx4hUL2ddZ+j7HtKY
	 o0xesaxTnczQVuXfBkYKqUFZXTZOYU/UOfG0EBrGFMw40/nTQX1cy48ehmkA2Y2Ud5G+6
	 hsgULeWEFwvK/v1dE2MaT9i3z7jmEWz3UCI1/tTdjLA3xQ1uY+3+sKcvlk7g7U++NlvgP
	 EjozISUaphBESMhziIsC3XxMSCtEJ+FDHhR0f6c03LEF8s4SPJUqEcLehcapnmmfkxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322012;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1KVmT/jAeHggYSDMy5XhsiWoFkhNbvG+TBe6IcrseP8=;
	b=gx+8fyT4yQ7/4KWwVkvMrrSlaaBOdI65Zls5z0SkZt0lD+ytAlPmfld8Q0Gs9DW5Gc7C
	 TvzeXqWqSSHByqOJU31rPkmbPfwcy73iX7JPs2Ao0DlFpNzYAt+IBGT/TUgJOMBB3tMBy
	 A9lDtqFS+CE7Nuiml+ZzuE46uh7hVmOApSnPvr8SFTKmB3O2cEXwKSUsvscVhLIm2vdpc
	 byGMON3fmFggJalezIJe33Umpre83syyhoqC96JycuxeIV9L1A4HEBy4K2rmn63V9garo
	 hVAK/2kqA4sj6v9A375/kFAoL9uU6C3071Red9Zzy3oX3MonbzeDi02QfPs6ukdJ10A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZkPeK3S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34A360A260B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZkPeK3S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DED81F008BD;
	Tue, 10 Nov 2026 14:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794322011;
	bh=1KVmT/jAeHggYSDMy5XhsiWoFkhNbvG+TBe6IcrseP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OZkPeK3SJPZwzex0XvhopNw0+zo4i+WiKBEzj82AQHInnkKWB4VBeieUMz8ofOoCp
	 +u3bP35JvUZM/d+xteqYk81GWQCPplHbdF38AWss8uamUw4RxeueKzSsp7F/Q761Hm
	 /7q8F/gQdNlw1zJMCMPLOrqBuSh4o9Tj0eNrtEjh/Wg0llY+DWmNRzaiasmXpMGG2X
	 5mR0TUWRd2iNLGv5DYodgTkjsonUyYL3CrmxgqxmOkR3vOJPnqHSzzywV+s4KxwM+T
	 l2S1SJmtgsPgAZ87jfcOY/BM7y4Q4/jqF/GNGCqGWvQfVRrgYyTTbvbCXlyBqiIo/L
	 XGCOQVUbV2tkQ==
Date: Tue, 10 Nov 2026 15:46:49 +0100
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 00/10] replace CONFIG_SLUB_TINY with a slab_tiny boot
 parameter
Message-ID: <avMspQZD7fyg4i2x@thinkstation>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
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
In-Reply-To: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>

Thanks. I think it'll be ready once the issues on patch 2 and 4 are
addressed. Could you please adjust in v4 and respin?

Also I think it's worth measuring impact on memory footprint of this
(SLUB_TINY before this series vs. slab_tiny after this series)
and put that in the cover letter.

On Thu, Nov 05, 2026 at 09:43:49AM +0100, Vlastimil Babka (SUSE) wrote:
> CONFIG_SLUB_TINY was introduced to help tiny systems migrate away from
> the SLOB implementation so it could be removed. Its main purpose has
> been to disable all forms of percpu object caching (cpu slabs back then,
> now sheaves), and being a compile-time config option, some extra minor
> saving were achieved by code elimination or more agressive merging of
> caches with reclaimable and non-reclaimable objects (keeping those
> separate helps reduce high-order page fragmentation but not memory
> footprint.
> 
> However being a config option brings issues such as incompatibility with
> other options that has caused troubles in the past and Linus argued for
> removing it [1]. Moreover, there is a use case for having full-blown
> scalable implementation enabled and being able to disable it with a
> boot-time rather than compile-time decision. That ise base is the kdump
> kernel which shares the same vmlinux but wants to minimize the memory
> overhead (which has to be pre-reserved from the production kernel) and
> does not mind reduced scalability.
> 
> Thus this series reworks the CONFIG_SLUB_TINY to be controlled by a
> variable set by a boot-time parameter. The config option itself is
> deprecated and only sets the default value of the variable, and all its
> interactions with other config options are removed.
> 
> The conversion builds mainly on the fact that most SLUB_TINY specific
> paths to avoiding percpu object caching are shared with slab_debug
> handling, except doing any actual debugging checks.
> 
> Thus introduce slab_debug=N (for No-op) option to allow using the
> slab_debug checks directly, and extract the underlying static key
> handling from CONFIG_SLUB_DEBUG only scope. The decision to create
> separate kmalloc-rcl caches is also made to be boot-time.
> 
> The parts of CONFIG_SLUB_TINY that can't be transformed to a boot-time
> decision are related to dead code elimination and fast path inlining,
> merging of non-kmalloc reclaimable and unreclaimable caches, an
> ignoring SLAB_NO_MERGE for performance purposes (currently used in
> networking). Those lost memory saving should be all relatively minor
> compared to the savings from avoiding percpu caching.
> 
> To sum up, after this series:
> 
> - CONFIG_SLUB_TINY is a deprecated option that has no interaction with
>   other options and only controls the default behavior.
> 
> - New slab_tiny boot parameter controls the functionality (and can
>   override CONFIG_SLUB_TINY in both directions).
> 
> - slab_debug=N can effectively achieve most of slab_tiny and on a
>   per-cache basic
> 
> - the implementation is simpler with many ifdefs removed
> 
> [1] https://lore.kernel.org/all/CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com/
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---
>
> Changes in v3:
> - Rebase to v7.4-rc1
> - Add SLAB_DEBUG_NOOP to SLAB_MERGE_SAME (sashiko)
> - Prevent premature slab free in slab and kasan kunit tests by new
>   patches 1 and 2 (sashiko)
> - Link to v2: https://patch.msgid.link/20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org
> 
> Changes in v2:
> - Rebase to current mainline (with slab/for-7.4 merged)
> - Stop triggering nohash pointers due to slab_debug=N (Harry)
> - Stop preventing slab merging dues to SLAB_DEBUG_NOOP (Harry)
> - Link to v1: https://patch.msgid.link/20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org
> 
> ---
> Vlastimil Babka (SUSE) (10):
>       slab, kunit: pin test slabs by an extra allocation
>       kasan, kunit: pin test slabs by an extra allocation
>       mm, slab: refactor slab_min/max_order handling
>       mm, slab: introduce slab_debug=N
>       mm, slab: rework KMALLOC_RECLAIM handling of SLUB_TINY
>       mm, slab: make SLUB_TINY handling dynamic for sizing decisions
>       mm, slab: convert CONFIG_SLUB_TINY checks to kmem_cache_debug()
>       mm, slab: remove remaining compile-time checks for CONFIG_SLUB_TINY
>       mm, slab: add slab_tiny boot param
>       mm, slab: deprecate CONFIG_SLUB_TINY and reduce its Kconfig effects
> 
>  Documentation/admin-guide/kernel-parameters.txt |   4 +
>  Documentation/admin-guide/mm/slab.rst           |  18 ++-
>  include/linux/slab.h                            |  17 +--
>  lib/Kconfig.kasan                               |   2 +-
>  lib/tests/slub_kunit.c                          |  36 ++++-
>  mm/Kconfig                                      |  16 +--
>  mm/Kconfig.debug                                |   2 +-
>  mm/kasan/kasan_test_c.c                         |  24 +++-
>  mm/slab.h                                       |  32 ++---
>  mm/slab_common.c                                |  21 +--
>  mm/slub.c                                       | 167 ++++++++++++------------
>  11 files changed, 195 insertions(+), 144 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20260911-slub_tiny_rework-8f2634dd17a7
> 

-- 
Cheers,
Harry / Hyeonggon
