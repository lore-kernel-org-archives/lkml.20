Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884346;
	b=c53YZYixzDiumB/+2v0K7Pk/3V3Q+1194+M6Lg0KlN5ZS+dZeXpu5VuOtLJnuY4i1qnL
	 TCWglfwaiewRV+qlSI85hOGW6qm5+nyb9dCwKDc0rA7DFCbpbAKRdjGmR3kxMvYKH+PvC
	 wA4mvi3/a075gpfIjrrxN0iNqCySni2kd9xVn1Yp/5U5ayrR6sGKokwF/fMhSdueLyCff
	 UI7Icfd8G0YWDPGNtqkWhblgVt+ZHRmyIycSmnn/2EvYuOFSSuwhZtyqBEY+5EzjQXf29
	 0ZUJgHk2HnKCN9XTDZ0GQGK0WPU22MN3uhEIh2fYerVwJIt6SngQWr4iAKaKRXUb4sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884346;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bOPqnwsFQYHBISIkk2pO8UlDsjZcYkTbh8+hSmmU5WE=;
	b=bxuTmSz5rEZfRvKKxH6bs4SKQD4vOfntOfpGHWyykaykK3EPw3lvLl0w8OfbTxqkeDEA
	 nLSXGdGRowRAcd3PFoeid8/tN2daLMujEETqFCi/658ihCP1DDNGParFvprVmhcUsofmv
	 aSgSuQ7+Q3uKIj7pIgLD6OoJkdolOarTrmJC8MGadN6ZP2ZkeNp7mGvQ/ERh/3xCPlCcf
	 z0UV8Y7nJeVKQ6VBO+iGsnM2bKAZLlwvFmi3MpQH93CNBrgJ4gHPN8RCHC1xLd6ZJtHLP
	 ngoaDF9IkTEeaotBB+5VASIF9g20oKYu2Dg6eiFoTtydjWyLImpEZDfx6faApcgdpOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SETtaNlQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCC8606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SETtaNlQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4584B1F000C1;
	Thu,  5 Nov 2026 13:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793884345;
	bh=bOPqnwsFQYHBISIkk2pO8UlDsjZcYkTbh8+hSmmU5WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SETtaNlQ7OqsZkRg+4F2KmbHGav+xCxS/suET8Op3SQDNp6N3sLYa3YJsMTWYO6f/
	 hMDLtHhnUNRMTE0I5Khqn8cm6ednL+pf58FJ85kw4j8BIcStIJNHpVhDAMPSxWuHi/
	 fxPM6wqJo7EZlC3gdIdLI3DoJQzr6cU5PlGTprW9KJuRE5+ui1Mz9fJya2BoyJG6CY
	 J6+JjLmTxOr361wRJFO8z19ZKI72DQm7lA57p5HhXFjpHiDWPXuezeD3J5ZfKaCFu2
	 hpQqeGuoZv96PdCasfN/hK0iibtlzBPkCbzVpSUVzQ/M9rS9pbbJJuf9FS9jHtblBH
	 640xeM4gu4FTw==
Date: Thu, 5 Nov 2026 13:12:23 +0000
From: Harry Yoo <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Subject: Re: [PATCH v3 03/10] mm, slab: refactor slab_min/max_order handling
Message-ID: <aux_UhaXFYy0ZXhm@thinkstation>
References: <20261105-slub_tiny_rework-v3-0-0484ce59eabb@kernel.org>
 <20261105-slub_tiny_rework-v3-3-0484ce59eabb@kernel.org>
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
In-Reply-To: <20261105-slub_tiny_rework-v3-3-0484ce59eabb@kernel.org>

On Thu, Nov 05, 2026 at 09:43:52AM +0100, Vlastimil Babka (SUSE) wrote:
> Setting slab_min_order and slab_max_order as boot-time parameters
> currently has several not so great aspects:
> 
> - slab_min_order is not checked against MAX_PAGE_ORDER
> - slab_min_order can raise slab_max_order
> - processing requires custom callbacks, their execution order
>   depends on the order of boot time parameters specified
> - upcoming SLUB_TINY changes would be more complicated
> 
> Instead of custom callbacks, introduce __initdata variables that hold
> the boot-time parameter values (if given). All inputs are then evaluated
> deterministically in kmem_cache_init(). slab_min_order is always capped
> at slab_max_order and cannot raise it.
> 
> debug_guardpage_minorder() still overrides any given boot time params,
> but it could be changed if there's a use case.
> 
> While at it, rename the slub_min/max_order variables and
> slub_min_objects to have a "slab_" prefix instead, as their values
> determine the sizing of slabs, and the "slub_" prefix already became
> deprecated also for the boot-time parameters.
> 
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---

Looks good to me,
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

-- 
Cheers,
Harry / Hyeonggon
