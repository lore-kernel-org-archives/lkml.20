Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583274;
	b=T591tsYKSjDls3ZXUiDrnQo5D1vM+0JP3b4GknH70OXlP49L/y36/RZaFvGKLFhShj+X
	 BFsbk/jVzI+swPrV7JKnkcc70VesX2uHXIa+XR2NUMAlzF+uzdpkgXM+mMygIuXgrSUa1
	 REFC4z0IcHhHmywNdrQJt8D/1T/i1Bu4TNip39rkrxpMZjrk8j+hI+R8qxBxWhEa3ekJx
	 a8WJG5Fitj/qtuvmlHCc0H4ONmMnkhPfMNtNqdLRdVYZs8IVGCHengEDXdQEEvdyxWyTk
	 FL6HCUF6IOXxKCj6vPbl3Q/UOv1Onfpa7L2GnF1U1qmby6sh8NNDAk+IUr5Hveaeayw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583274;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=FdNzDMyikUDkRQM2Yx/R+UlgduqMmo5RYSj82aLvC8w=;
	b=n/7a4CaiN4ElAs4+eLkOCrd+/1Ysg7xQ7wl0yl01DgeLfYFTaecbsclI2G7fqaJgxItU
	 r6Q3zKRSKsTLwVYOHsmmKXIISbpSicr9jIXEKSCNtlcVMnGyFubmzEyoLdqqFITQ+RYH3
	 mXrl4vzJg08PmKYJiz8Vv2zPPlMB1xO9a3YUiq1ZruYItL2FjcO7eRnq2j9tjsIVQzRq5
	 Fqv3iB5jSJ3fMh7lX6G+rzP+VVH1/1taR7rW9md36VED98JlOtSiICFEXGWFgcohMliIN
	 eRzmYcyJyM86prLgDiRHA94SbvWEVxevN5NIBQsNncxqz6yWa6OyCDU3UTJXowp7nlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSTsVZbL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B77606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSTsVZbL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EFB1F000CA;
	Wed, 21 Oct 2026 11:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583274;
	bh=FdNzDMyikUDkRQM2Yx/R+UlgduqMmo5RYSj82aLvC8w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fSTsVZbLq+oG9k7aYHjUwtPMV2IMdRjBz/QrEGiTP+glW02RmmZw163JDRDdGuzXG
	 ywJ1FSKJMY2U+wwwHaYftuUZPJFEuS+rwSxA3qjefkUKmt85gQX5cG+G6pO9lNJ98H
	 ZD611ggfnEzxeVeI/KZr/eowxy1lXMgJEP6Ktem733QZ7eKIwIQcESDMaVeROgqNxu
	 axrwIZcRoZLJpLln5ZhrCy5MDuufEYKyqgX7r/bcohNhL8/zAnDke1oQkn9JeFAir0
	 jZ5NkJECpu/2s80E+IxbA1NYUZ+Tu8/sRif3MMhZ26ifDHLj4eFQHoiAH/GG6CSL8x
	 MMe8xKQYEaOhA==
From: "Harry Yoo (Meta)" <harry@kernel.org>
Date: Wed, 21 Oct 2026 12:46:49 +0100
Subject: [PATCH slab/for-next 08/14] powerpc/mm: specify SLAB_MAY_ACCOUNT
 for pgtable caches
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
Message-Id: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-8-096800aa3330@kernel.org>
References: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org>
In-Reply-To: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-0-096800aa3330@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
 David Rientjes <rientjes@google.com>, Muchun Song <muchun.song@linux.dev>, 
 Hao Ge <hao.ge@linux.dev>, Pedro Falcato <pfalcato@suse.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 "Harry Yoo (Meta)" <harry@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.16.0

User page tables are allocated from PGT_CACHE() with
pgtable_gfp_flags(), which adds __GFP_ACCOUNT for non-kernel mms.
Specify SLAB_MAY_ACCOUNT when the object may be charged to a memcg.
__GFP_ACCOUNT without SLAB_MAY_ACCOUNT will not be allowed.

Path: copy_process() -> mm_init() -> pgd_alloc()
  -> kmem_cache_alloc(PGT_CACHE(PGD_INDEX_SIZE),
                      pgtable_gfp_flags(mm, GFP_KERNEL))

Assisted-by: LLM
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
---
 arch/powerpc/mm/init-common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 745097554bea..72dfcc559630 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -140,7 +140,8 @@ void pgtable_cache_add(unsigned int shift)
 	align = max_t(unsigned long, align, minalign);
 	name = kasprintf(GFP_KERNEL, "pgtable-2^%d", shift);
 	if (name)
-		new = kmem_cache_create(name, table_size, align, 0, ctor(shift));
+		new = kmem_cache_create(name, table_size, align,
+					SLAB_MAY_ACCOUNT, ctor(shift));
 	if (!new)
 		panic("Could not allocate pgtable cache for order %d", shift);
 

-- 
2.54.0

