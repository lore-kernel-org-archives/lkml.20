Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583250;
	b=5hVZIDcU4h4Rz/Kv/z7dHzwF0Yapi6tvMW6K2U1WLsYVtd01UzatSbOn+HmpgGMiE8xn
	 mopms3lluXdnpyUu6FD3lJM48C/+COAtiSGH9tAiwmDUwBP0qNh+FvIWvewKtHm2bupdH
	 2C03LnWqrzhcuCGqoAouUnln+AXWu8q6+rIPtMM/m2n2w+0Nfjmbt7rD+4EfOVAI49QhO
	 EFTz1KLO9y8I/5Ki8jLgWhgm/b2uU6v37Qfw5nTI2sQ53ahSEs82/yQjxoZh8ZN/gEleG
	 JeVU8FVj3s9ptiORh38c+6OYsHJiv5bSVKfB5VjN+hR70fj0TD1HwJBMBN2QOcLep/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583250;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=2+QlAU91iW8vdzYP4e+NTj6CSrh8UAuZujBTeOhXewQ=;
	b=bv5p5a777GxWkvVsKFHgQVgQreySvbpch8iyMZZtDFr2hgtw4lX6iTiXLHIHmUxWARLM
	 UqaAkQAi4BwtOBWnHOb8f7fgMrB4aZSwSKID1lMNZxGg3IFIn2EqUzXHSuP2Wi80Y5FmB
	 9vUA1xexPjzAqfOtW44gB36/mwSkHLc8DwerKkGkAuio+I5+UYiv2QEbhW6UM07SqleeF
	 4CDb4uSpvfrfoUzV3yN+cgUkB1N57KSUbFUREc60nJq7Iw4EhES7nysvWqe3bxd59okGE
	 xHNb3EZS2oLgFIn/occo/BV38X1tK4i7Ru270RLNjhGLQG5ApVJQ0aA8xuEk0y9HL3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EM4SfxUP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EED60A2634
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EM4SfxUP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292601F000CC;
	Wed, 21 Oct 2026 11:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583250;
	bh=2+QlAU91iW8vdzYP4e+NTj6CSrh8UAuZujBTeOhXewQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EM4SfxUPPQhjHei94lxELC53m1/3Tey35zwsz45f/BJ1R1p36Hpki+CNSGunclV7W
	 UD2+EtUoltIuBI57uWe98SrZTZf6/Sovk7sIsCTapAaEg8DXnYz2U1EA5KsilVKJ7z
	 X+2GwxmWwyPah0+6/VsIp3ExsBw2WLp1lGo0vU8F2uVLGf3S3LFa5sxHjo5Adbv16C
	 qII1+JmEE66LoxGxKk1fdI8+lkG6xD0OjgXk8n8pn+8wxHI7tliLPE4i9eGFFeqPyr
	 JCQAIANeNsNIAgD6Xk5MrUCfYdVwxqWwScDRgeCXSSxVHgkDL2DbnDj0yrW+QbHbEd
	 0yHdDF+XGttyA==
From: "Harry Yoo (Meta)" <harry@kernel.org>
Date: Wed, 21 Oct 2026 12:46:43 +0100
Subject: [PATCH slab/for-next 02/14] lib/maple_tree: specify
 SLAB_MAY_ACCOUNT for maple_node cache
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
Message-Id: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-2-096800aa3330@kernel.org>
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
 "Liam R. Howlett" <liam@infradead.org>, Alice Ryhl <aliceryhl@google.com>, 
 Andrew Ballance <andrewjballance@gmail.com>, maple-tree@lists.infradead.org
X-Mailer: b4 0.16.0

Maple tree users can pass accounted gfp flags down to node allocations
(e.g. arm64 KVM's smccc_filter uses GFP_KERNEL_ACCOUNT). Specify
SLAB_MAY_ACCOUNT when the object may be charged to a memcg.
__GFP_ACCOUNT without SLAB_MAY_ACCOUNT will not be allowed.

Path: mtree_insert_range(GFP_KERNEL_ACCOUNT) -> mas_nomem()
  -> mas_alloc_nodes() -> kmem_cache_alloc(maple_node_cache)

Assisted-by: LLM
Cc: "Liam R. Howlett" <liam@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Andrew Ballance <andrewjballance@gmail.com>
Cc: maple-tree@lists.infradead.org
Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
---
 lib/maple_tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 1aba6cced713..e4794b31e5bf 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -5790,7 +5790,7 @@ void __init maple_tree_init(void)
 
 	maple_node_cache = kmem_cache_create("maple_node",
 			sizeof(struct maple_node), &args,
-			SLAB_PANIC);
+			SLAB_PANIC | SLAB_MAY_ACCOUNT);
 }
 
 /**

-- 
2.54.0

