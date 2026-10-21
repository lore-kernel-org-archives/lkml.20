Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583271;
	b=ycRAYZTsKP94zIGxo6528bDLAlLy9vy+Q6SLsP6rbDA+Rs6z4zKfggQlilA1M8/ISzte
	 78mbKmsilJ7FXlyqk8T3ifq3EZ9Y8/n9V/rWhWbKsPCJ/bx1RsW0MkAHHPrk4XKwgInz4
	 zlGMFLoEQAvT1IQqy9Gr+LVsysuuXyz4LVthHBijCvXAfGreCQjsfcyQGtPUA5BKLD6Ip
	 7nfBUxSguphb/CdQxwFw6cMGNrzg6k8L5TDnh2SnT1UxP6+wyt4FkuJHiXXWS7uMuhYA5
	 7M+JctiXGbYhc4bhLoG7PeSHY3EPkbt0jpAncTULvnLbn85192IeHWhVRK9BfCM4o5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583271;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=LamOgwOLGcvObJJ6uLyjNnr+OKxJmcO2SWrOkvHa4B0=;
	b=GURSkDRKl7d9Kc7Y9PWjh1yN2KlFgn2DyN4Xx99S40MajHPqX6o6hYBy7ge0xiGuitJG
	 xgSCI4AUD9NPXr4qqxtZuI25xBUaCf15rFpkcJ+FbO4a5CZrwo1D0W8LEhVbi360Egx/r
	 nX/KAZLxpWX6mA5nozQcMFLJsyibUpn47JColacCc17B+SzhZRgvRFJ0DDmSUemDbim8r
	 eLn//b3luxpDnvYO1Wi8Lt0DtPJDSkpbuwuJO140fR4iApF5CO/jEYgqMbVK/cViQi1wS
	 mYKh8pkHPnUvjgKerIXwG9vomq+ipfVDY7hxN5efHXpmKORD4vz7IJSwWz4Ng57/4kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABx0n5+w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03182606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABx0n5+w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4EE1F000C4;
	Wed, 21 Oct 2026 11:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583270;
	bh=LamOgwOLGcvObJJ6uLyjNnr+OKxJmcO2SWrOkvHa4B0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ABx0n5+wJXHhNQk6ZRp0wqw4Rw7NF+bXiYQq2SvsBPoBKUDyPS1FKlsineSsqAOud
	 Ao6k/OkSWtjiesySf8tDYRaKmnk0uZRkpiMrIBtr1f2ZkErMR031WCq6j4RvxMdW9E
	 TlL1ttZOyHC6ksfHTx30Mk27mlMpFbUMTGp9dAVK/qVF0j0+sTE9ckvhejDBOOP2fj
	 g5edE9dWu6I9P5Qu8zdos9gI3ACgQlZET6Y0qNKIlglWaH78OpwE8XdhTD/l2cyU8Z
	 uwCY+GDwkDoxGJhOXUQeOP7COA7+6xbWzdWZl02/XKQzVrtVPJcHxnP7SW1o4Rf2aG
	 OXu998Y20Iu4g==
From: "Harry Yoo (Meta)" <harry@kernel.org>
Date: Wed, 21 Oct 2026 12:46:48 +0100
Subject: [PATCH slab/for-next 07/14] arm64/mm: specify SLAB_MAY_ACCOUNT for
 pgd_cache
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
Message-Id: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-7-096800aa3330@kernel.org>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

When PGD_SIZE != PAGE_SIZE, user PGDs are allocated from pgd_cache
with GFP_PGTABLE_USER, which includes __GFP_ACCOUNT. Specify
SLAB_MAY_ACCOUNT when the object may be charged to a memcg.
__GFP_ACCOUNT without SLAB_MAY_ACCOUNT will not be allowed.

Path (e.g. 64K pages): copy_process() -> mm_init() -> pgd_alloc()
  -> kmem_cache_alloc(pgd_cache, GFP_PGTABLE_USER)

Assisted-by: LLM
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
---
 arch/arm64/mm/pgd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/pgd.c b/arch/arm64/mm/pgd.c
index bf5110b91e2f..0fd5b90b5160 100644
--- a/arch/arm64/mm/pgd.c
+++ b/arch/arm64/mm/pgd.c
@@ -63,5 +63,5 @@ void __init pgtable_cache_init(void)
 	 * Naturally aligned pgds required by the architecture.
 	 */
 	pgd_cache = kmem_cache_create("pgd_cache", PGD_SIZE, PGD_SIZE,
-				      SLAB_PANIC, NULL);
+				      SLAB_PANIC | SLAB_MAY_ACCOUNT, NULL);
 }

-- 
2.54.0

