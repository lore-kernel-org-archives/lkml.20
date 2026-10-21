Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583247;
	b=4h5SwOy1W64Ovt9EPVP7/A8C84VMo+Kin/zc7DphHsUVR7HooXcLE9IRb+HScPefUzc+
	 DEMi3ZYWQQ2kAaoxSQOEXvD+S+aHGYs5jVK35fXnuP3NfPh1weuSXWBEIsQB9WC/D9bxv
	 G6nzuz4Isf38OQMLbtk3P7sftifoq4cNEMGYwpj1JTq17fTywa/iY5xZFhhFHCUN8hp2m
	 htlSn8bXkLxWTGRCJ+ktdup1jsWuXesQf934O2ABCzhMA/ZYO6IVnvpCJdF3Z5VS54d/9
	 sgXVDctd21v/G6ePj9x+oGGC5HENyw3qLN+x0Lu/i6cmiuNkic0vHGjvc/otFY+MJ0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583247;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=O0NXh8hdG+uzuvBEcab3bue23KeeKcY2/7YypkLouPE=;
	b=mylK/onAJy52qnlY40XCUIGZQrcpWzrMPM0qprVVt0slYaaKlYenuCusSRp0iBxgypYE
	 nkdbFZy72hoQmz/isO+caEtmNLK8GzlNkhU13SAYK3A0ebmbfZahIa8Do9vCwmYzxeySw
	 VGOg3L3vZcdBseFd4bqyzq4hDUJ18aDLGhl9Xz6u1HIDSoYwSsgOVX+4Dh8iCaByc5/1l
	 SGAb54+fN40N4HSZeAL4PfrkNsxwIEFoTGkql5yTELv5qjfS3lX9yQlhikijoVlr8gyJ5
	 fTtfYy/zrPwcpgokSjCptEQlL0jyq4MaUfdvg4aDGOWpSWxjlZo9RlroJm1szHaqdVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FeIwbXVa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E542D606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FeIwbXVa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392971F000C7;
	Wed, 21 Oct 2026 11:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583246;
	bh=O0NXh8hdG+uzuvBEcab3bue23KeeKcY2/7YypkLouPE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FeIwbXVa4VI7WJv3ok6ERoNwYKIgZ5pQ6nWD20UtkfoA0IpkgcqH8zAE55uqLRb1M
	 G1zxVIw2+vFkKcfs+jnML3y7c+3JP8EiddfweYD2fwQWJn5kMJxj9Z5vjfW+PzDE2B
	 TgARio/GdAS1jgtORs5ufeKUWyijpmLoB1jVlYsj8ACeA+05OibGU9yEE4qWHAMLLY
	 IG4cSaPCVUhI/z7SHyA4VF2+VxS1iFLP1R9U6NvvmHc3/sq8gnNbZk4n05G0T8IyL5
	 goBf7zAacatnIyIWdoUEJ1MNtSAuNi5XW3G5M3cFegppeQMbiRUF4ScWZlURkPpPoV
	 qrKh1YDtjm2dg==
From: "Harry Yoo (Meta)" <harry@kernel.org>
Date: Wed, 21 Oct 2026 12:46:42 +0100
Subject: [PATCH slab/for-next 01/14] mm/slab: allow passing
 SLAB_MAY_ACCOUNT to kmem_cache_create()
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
Message-Id: <20261021-memalloc-prof-dont-waste-slabobj-ext-metadata-v1-1-096800aa3330@kernel.org>
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
 "Harry Yoo (Meta)" <harry@kernel.org>
X-Mailer: b4 0.16.0

Callers will specify SLAB_MAY_ACCOUNT for caches whose objects may be
allocated with __GFP_ACCOUNT. Accept the flag in SLAB_CORE_FLAGS.

Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
---
 mm/slab.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slab.h b/mm/slab.h
index e94ac63d10dc..31783311e23e 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -472,7 +472,7 @@ void flush_rcu_sheaves_on_cache(struct kmem_cache *s);
 			 SLAB_CACHE_DMA32 | SLAB_PANIC | \
 			 SLAB_TYPESAFE_BY_RCU | SLAB_DEBUG_OBJECTS | \
 			 SLAB_NOLEAKTRACE | SLAB_RECLAIM_ACCOUNT | \
-			 SLAB_TEMPORARY | SLAB_ACCOUNT | \
+			 SLAB_TEMPORARY | SLAB_ACCOUNT | SLAB_MAY_ACCOUNT | \
 			 SLAB_NO_USER_FLAGS | SLAB_KMALLOC | SLAB_NO_MERGE)
 
 #define SLAB_DEBUG_FLAGS (SLAB_RED_ZONE | SLAB_POISON | SLAB_STORE_USER | \

-- 
2.54.0

