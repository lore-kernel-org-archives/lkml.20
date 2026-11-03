Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737635;
	b=GNL1sOxcUfcosIGlv1g61urW5LlQbiCL3v72d9FLoT6uHFGwSu4/wQSqNjMu1ROCDv7B
	 ms2zz43MmgLjDqGBoIrJOPW1oIWd9LurE0H0PoW52kMOAoiCBM4DtO14znN0WaRL2leh7
	 VaBLGXqcCQqUqcgKT2ijMJIbJ+YLxgE/sOoHUZjKb7f9BmY84gZIyAnv7d0w2lxjXoP7Z
	 G6r+rRYNhpXS9hrIAh/xB0y+d5rV8bfya4+k23/dJLntxXpH7fGgbVol4kmnmYS/zNC4a
	 f/mE88taaZzH4HfWZOwdzo00Pujdwz4B0pGwbWmZef4OgTQQ5WAJNFgu9HMmjq7OuEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737635;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oqrcEuwTdfOxKIfYEs/ydcBz2K7swqbaTmtMGonjwTg=;
	b=KlODBiS9hkYXSpd5gvHrhL2X/0Ogo3ntscDvvJPM9fOIckAHmCai1mM2purDMiQbcm9P
	 +MHQ0JktP69hnbyulM1FJDBWF54PWFvnhBRXmwYHZxOYs2PO0FaPqFBodNAsudIsl1erW
	 x4oFfTzAdYnpt7x9uS0jL9bpoYyJ+nb3oGNwPZXkLof4nEVnZwyejmK4KkBRddGgRtYHG
	 t5HshvJgQe4oOBTi8jjcB+KQkYjUoOtFo69EgbLE2BRJN+VBBfsF/yMV1BhrHgLRxJkZn
	 7LzQCP2HnICYOz8HCq5IUJP6IlffudjF6Kchtg60ao5G4yNGVac93IWLMlD+6uKlYZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBuMa7bV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B69606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBuMa7bV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEA01F00919;
	Tue,  3 Nov 2026 20:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793737635;
	bh=oqrcEuwTdfOxKIfYEs/ydcBz2K7swqbaTmtMGonjwTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RBuMa7bVjJ0UxmmAC9Gj7sJYqYOOjMltPrVTwC9E2KH9ptZ/cGgtyUnJLhymy5yx0
	 GBnQJ+wJVvrpF/IvMdnRNVX83S2XHSH65MLEwU8kBoyjPBfR3EHEMJABWSJmNLqDEW
	 6t5JSw70LQ9UWkw8C0nucvCTtdmTxPYDzhKEHmSWJuf3dTCgmG6F5rNWXA2k9lUFPZ
	 OV5vJOzvtiH7jplG6HgbMspXjSDSddzx9BMwd04MZ/QDSH/PiYnge49CJrruSIaKju
	 XctTZ6vAqKLPTopE5K/D6CisYvav8teHEc+u/or9bRfiQCqVM9ldyDkBjE91y60cTg
	 8ldWFY/4tLiBw==
Date: Tue, 3 Nov 2026 20:27:09 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH v3] mm/memory: use pmdp_get_lockless() for the pmd read
 in do_fault_around()
Message-ID: <aupAdlzeOtc0qSsQ@gremlin>
References: <20261103014749.96764-1-hui.zhu@linux.dev>
 <aumfvNWiemmuyooP@gremlin>
 <61f8a583-5ea5-4fcc-bf30-ea9cafe94d65@kernel.org>
 <auoXIdTpLO60mkEw@gremlin>
 <c0e648e2-aa1f-40f3-84f4-c4ca4123de9f@kernel.org>
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
In-Reply-To: <c0e648e2-aa1f-40f3-84f4-c4ca4123de9f@kernel.org>

On Tue, Nov 03, 2026 at 08:51:38PM +0100, David Hildenbrand (Arm) wrote:
> On 11/3/26 19:24, Lorenzo Stoakes (ARM) wrote:
> > It turns out we're as wildly inconsistent on pmdp_get_lockless() as we are on
> > pmdp_get(), so TL;DR my main concern is moot so:
>
> Yeah, I know that we use it in some core places already properly, like in
> GUP-fast, __handle_mm_fault() or our complicated __pte_offset_map().

Yup, but also inconsistently, basically mostly interchangeably with
pmdp_get(). Rarely is this value actually used.

> > * But it turns out it's all a giant mess (of course)... for
> >   CONFIG_GUP_GET_PXX_LOW_HIGH arches you really actually need to also do:
> >
> > pmdp_get_lockless_start();
> > pmd = pmdp_get_lockless(...);
> > pmdp_get_lockless_end();
> >
> > And that's because, as Hugh points out in commit 146b42e07494 ("mm/pgtable: add
> > PAE safety to __pte_offset_map()")), you need IRQs disabled for these arches for
> > it to be safe.
>
> Yes, there is this pmdp_get_lockless_start() magic ....

One of those things that, the more you look into it, the more stuff you find...

> It's really a mess. I wonder if we can remove that somehow completely ...
>
> arch/mips/Kconfig:      select GUP_GET_PXX_LOW_HIGH if CPU_MIPS32 &&
> PHYS_ADDR_T_64BIT
> arch/sh/Kconfig:        select GUP_GET_PXX_LOW_HIGH if X2TLB
> arch/x86/Kconfig:       select GUP_GET_PXX_LOW_HIGH             if X86_PAE

Yeah that'd be ideal.

But actually could we not just simplify and allow these arches to be a little
bit slower (who cares for museum pieces)?

The only user of the start/end magic is __pte_offset_map(). And it does:

	irqflags = pmdp_get_lockless_start();
	pmdval = pmdp_get_lockless(pmd);
	pmdp_get_lockless_end(irqflags);

So that could just get folded into pmdp_get_lockless() for these arches.

That would mean the places that don't require IRQs to be disabled (optimstic
checks) would now be needlessly enabling/disabling, but hey - use a system that
doesn't live in a museum :)

That way we could safely convert every non-PMD lock holding caller to
pmdp_get_lockless() without needing another pmdp_get*() variant + fix confusion
about whether the start/end magic is required.

And this would work even in places where the IRQs are already disabled as it's
fine with nesting.

So you'd just update thusly:

static inline pmd_t pmdp_get_lockless(pmd_t *pmdp)
{
	pmd_t pmd;
+	unsigned long flags;

+	local_irq_save(flags);
	do {
		pmd.pmd_low = pmdp->pmd_low;
		smp_rmb();
		pmd.pmd_high = pmdp->pmd_high;
		smp_rmb();
	} while (unlikely(pmd.pmd_low != pmdp->pmd_low));
-
+	local_irq_restore(flags);
	return pmd;
}

...

pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
{
-	unsigned long irqflags;
	pmd_t pmdval;

	rcu_read_lock();
-	irqflags = pmdp_get_lockless_start();
	pmdval = pmdp_get_lockless(pmd);
-	pmdp_get_lockless_end(irqflags);

	...
}

What do you think?

--
Cheers, Lorenzo
