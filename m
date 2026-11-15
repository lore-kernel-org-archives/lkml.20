Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727910;
	b=XjG0pH9V9AFoiu53OLLN8anQbOGUkREyFAfIicVNAxJN45eXXzhed96reIthMBfG0G7E
	 kHKA6vMI2h/rhRvcNB1EJR21NDnMUfx27/i8g0k4Edv87wTtCl4jXIFFgs1rom0Kl6Wqk
	 ZHnTAHHpbV7OZI1U7qPwl0Lb5PHx96EHHcUxPa2n2t/qJ9P61Vd6jNU3aj+vP+csQMp+z
	 jD0IKAszKadVWeHdJvgrCMs7G6V9K7FcVYahOZBykdeTBgDeQ5J0t/c20Ga9m9vcXhU3A
	 SBLPQ5O9TImaOCy+GkBcDGf/LdS2Hp/FbUmY4xDo4B4IcVh6ssqMj41GJjo46xa6HKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727910;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=TQ713QRNAekIGjd561kzHhEiq1a9v32zLLsxJ3VDhUE=;
	b=NEz7qMgExRMgAtF6CuH7M7IBxuv5n9x5MBt5tcovZ92uqztBU0H4IMpgg9vfA9hoqOHF
	 mvM5cfa2gL/LTQf/HHWaoWOOJfdnuuXriUYuem1SIctfKodtTig13oD3gqP8ZCO1f4evx
	 efzNr4y5JMcJIDHCCxSI2FC8IhmbLMuZDAmijdEHpafx63oynuYzwRgM4nZuVrOCti0pd
	 UzyAVpki+3QE7++q5oh1IxRoGNONC7HlrEylA0j7T17vJrJ4USzjJdw24d4ju+rC5jhUg
	 npGhwDjc7sLGhEHtkWAwhs2MwZ6iAgJkhdc4jxIpK9rB4Tqa1fCAKqrOH1CON86C8DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lmR+ov55;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B010606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lmR+ov55
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009211F000C4;
	Sun, 15 Nov 2026 07:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794727909;
	bh=TQ713QRNAekIGjd561kzHhEiq1a9v32zLLsxJ3VDhUE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=lmR+ov55w3BRND1pmg4VD+/X00Vfk8cE6VGaeaINUKR0AljewXM+RrwYXxG5xYXzY
	 nN1jWlgF7PgtJdwUoWrLfmmmkn+L/Sy4VaS20ZOT6ZfURkddQCl7yEzifz6EvSza7+
	 1s8jkPurTSZbnc2RYZNu8nENteW3J29zf22p0U3eSCKfOoCct743JZPQosfgcgksTb
	 dDa7Lx1v+awqW2cIhQFbqYQHVEZcsNVcUR7Va40dygaQt/fiBqEP34du7GD1e5FCRw
	 vGqjVUA+ZA7+4UPfcT1fRUtnnl8bxeKdR5myOHq80BzoD72n7OaqoclUE2XsGLq9Rs
	 nV8f3aOqAhzgg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/3] mm/page_ext: support early allocation for
 SPARSEMEM
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Alexander Potapenko <glider@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>, 
 "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
 Muchun Song <muchun.song@linux.dev>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
 Mostafa Saleh <smostafa@google.com>, Ketan <ketan.kishore@oss.qualcomm.com>, 
 Usama Arif <usama.arif@bytedance.com>, kasan-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
In-Reply-To: <20261114104150.58424-3-songmuchun@bytedance.com>
References: <20261114104150.58424-1-songmuchun@bytedance.com>
 <20261114104150.58424-3-songmuchun@bytedance.com>
Date: Sun, 15 Nov 2026 09:31:41 +0200
Message-Id: <179472790175.1870365.16622132821657916911.b4-review@b4>
X-Mailer: b4 0.16.1-dev

Hi Muchun,

> Moving KMSAN's per-page metadata into page_ext requires page extensions
> to be available when kmsan_init_shadow() runs, before memblock is freed.
> FLATMEM page extensions are available by then, but SPARSEMEM normally
> allocates them later from the page or vmalloc allocators.
>
> Add need_early so clients can request SPARSEMEM section backing from
> memblock during page_ext_init_early().

Can't we just always allocate page_ext for early sections from memblock?

> Use page_ext_init() as the common late path for client callbacks.
> KMSAN starts requesting early page extensions in the following patch.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  include/linux/page_ext.h | 26 +++--------
>  mm/mm_init.c             | 11 +----
>  mm/page_ext.c            | 99 ++++++++++++++++++++++++++++++----------
>  3 files changed, 82 insertions(+), 54 deletions(-)
>
> +static __ref void *alloc_page_ext(size_t size, int nid)
>  {
>  	gfp_t flags = GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN;
>  	void *addr = NULL;
>  
> +	if (!slab_is_available()) {
> +		addr = memblock_alloc_try_nid(size, PAGE_SIZE, 0,
> +					      MEMBLOCK_ALLOC_ACCESSIBLE, nid);
> +		if (addr)
> +			memmap_boot_pages_add(size / PAGE_SIZE);
> +		return addr;
> +	}
> +
>  	addr = alloc_pages_exact_nid(nid, size, flags);

And unrelated to this patch, do we really need to try an allocation from
buddy rather than always use vmalloc?

-- 
Sincerely yours,
Mike.

