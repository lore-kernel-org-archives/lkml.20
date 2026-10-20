Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792467098;
	b=eEu4emyZPlQrb3n6d7rrkVsZR4052FLkPjc31ajxZJqbvWH2SIW49tfzQM+fh8P1sKVu
	 7YGlIVUiFjv1X4ZoZRtJ2sZFBV5ceW/lSVw4Ajfqr/IinAKoWTOyKeuZoImh8Aw1ihi25
	 WuAX3BMPyGR657Ltxs/G8LO8Rywnqv9qEINlI/XR0+mSIiwoY8khVHUHgEInRco3sIxiW
	 FHcyl+PHexgT1rEp9wD2G2heXEnwvs653z4aFOmoZ7rZeuF26ZRKiMtFw7gCN/y74oCQW
	 EZQe1KtA4KToC53hqF5yzOmYiUDdh1mBS6l6Kge1Jrb318f9bbyZcysvyMwLOXON2bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792467098;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Yv6JJB6tZhhZV1nSU3fcdt/mKNMeJa2jTIPXvKYZGgc=;
	b=OADOZd36DuVU2Mfn6/VOoZoaPlPFE3+S70aeq0M9MsSc8prYZkv6ph8LGgBfLx6xlwoz
	 Z5Tca2wsuut+7nMHW8K66x9CDtzqAjc6d7oJ5Ws2HDTL1tPQzr0hrJveOY1OVLp+UUPY9
	 BNH9c0P3exky6NVUPP5+gFDuojtR4SYrh5woeHBTNHItau8REXAQgYOaCFia1+E1gNOMR
	 uLVZsuVhwTW4otiGqwGC56MlquKMpdeYqIMTwztz93brIapw5AAwx0AtiVET+TrLkacu+
	 XT5ktRuLdmpdWBRDlTpqxo/7mo7p2UEuZxeNn3KLtHhORSaNWLzJz147fBYXIbomzkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ouaut5bC;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DB7606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DB7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ouaut5bC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Yv6JJB6tZhhZV1nSU3fcdt/mKNMeJa2jTIPXvKYZGgc=; b=ouaut5bCYulu7dkPMg285SPBnU
	fyebWZUA93QjEHKGvABxSHeZsHnp22jhD9Xso+RnBtzuTkQRtJ/JYXWzLKvSoUzuj1M9/1QoMLx1v
	T+bFqiBUJ2mNgRJZ2CO+9y9NRzcW61ZDZGlrrJUMICWjT3VD1mN9zb8jAuX+LY+wy8IEZfkEZ0fMO
	zZA8Zho4ez58fHNACfzkELlnyVl229/Xn6tkRvcRo02ifb3SVA5R5UzoF8oB+4u3ANU3JkwNgxfOJ
	4PMz97VWeFw2oqcsJywSPGqW7jYo+LpLNS2zoyAIb3O9xjRYHyRY2BeMjnuy4jPS5UHTcLa5hu2Ju
	LK4Hd+OA==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ0Zb-00000008nPT-3Dm1;
	Tue, 20 Oct 2026 03:31:35 +0000
From: "Liam R. Howlett (Google)" <liam@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Liam R. Howlett (Google)" <liam@infradead.org>
Subject: [PATCH] tools/testing/shared: catch a failed posix_memalign()
Date: Mon, 19 Oct 2026 23:31:28 -0400
Message-ID: <20261020033128.1934349-1-liam@infradead.org>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

posix_memalign() returns zero or a positive error number and never sets
errno, so the checks for a negative return in kmem_cache_alloc_lru() and
kmem_cache_alloc_bulk() is not possible.  A failed aligned allocation
carries on with the pointer unset, into the constructor or the memset().

Test for any non-zero return.

Signed-off-by: Liam R. Howlett (Google) <liam@infradead.org>
---
 tools/testing/shared/linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/shared/linux.c b/tools/testing/shared/linux.c
index e0a0693df08f5..a37d2f86d3254 100644
--- a/tools/testing/shared/linux.c
+++ b/tools/testing/shared/linux.c
@@ -83,7 +83,7 @@ void *kmem_cache_alloc_lru(struct kmem_cache *cachep, struct list_lru *lru,
 	} else {
 		pthread_mutex_unlock(&cachep->lock);
 		if (cachep->align) {
-			if (posix_memalign(&p, cachep->align, cachep->size) < 0)
+			if (posix_memalign(&p, cachep->align, cachep->size))
 				return NULL;
 		} else {
 			p = malloc(cachep->size);
@@ -191,7 +191,7 @@ bool kmem_cache_alloc_bulk(struct kmem_cache *cachep, gfp_t gfp, size_t size,
 
 			if (cachep->align) {
 				if (posix_memalign(&p[i], cachep->align,
-					       cachep->size) < 0)
+					       cachep->size))
 					break;
 			} else {
 				p[i] = malloc(cachep->size);
-- 
2.47.3

