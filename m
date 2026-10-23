Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748678;
	b=w1SXx5hyTXaRYfQYdFINLMmDXywisHPj4/UOw3hdJZFBxfHm0UBhkQg9+RN8+2BX70wB
	 /5Nves4QzRo27rgKKawvAiwPLj9yaXI8ey9ilWdAL8K1v9btWRlYLv4D1bHe4+oJIaP3I
	 /8347XMrcDfIpqKJ8DYWfLmMTXef2h1ROa6r6M78o/BfzFqSzqb3/192e8ZjEAd0DCl6A
	 FaPzPgwjXaB0mNtDlAJB/OAZBCesKORlCXlO17l8cajre+37UOBM0AAmAEIbgBQaXz5Ir
	 Fg8Lj3WLFKNjWIUQu3scvsqckE75l0Zm01zvhaFQbkvs77yIfhpEeaUU/1e+Y75j7Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6eHpkzruNMWM7nEd9yLSMJY9dIBghjETsUAxANFqYe8=;
	b=UpTBvQraHIpVkQSCTLXroS4H+uhbCez6FGxP/3uQ6Cgbmq7424n8DUtnpC+GZmBMONVe
	 4uo8obcrAlmigYBJEnt/ckFvakRFlztv6ayQwdRf7ColyaJjuIgGk0m4OpUQpOCQu5RwK
	 RFXajVdzghpLPeDXfvf4m2AC5f7IP7PHIx+EBbU7fZHA1UqFTQv2TAsGE6UWHSCPr74pR
	 GkA/AlZD0kv0Zy0uz4pfc27lGsF25hOnOsNSP/uhakZccUM151XBxcNrcm27QjnEnIinX
	 VsIBz4at+Az4qLxtWwpKQiYZOID+r8D2I2r2hpfePxMDgwA16IOoGMG2i7FHNeus4VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G8ep9k5+;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB6F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB6F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G8ep9k5+
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e609985789so1449955ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792748677; x=1793353477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eHpkzruNMWM7nEd9yLSMJY9dIBghjETsUAxANFqYe8=;
        b=G8ep9k5+w70jIPSgfhNg2w7SI6742uELJGXG91cEef5XL/sPbv092Nm42ZEUmoeu7K
         UKQsaG7GH6RXfYBTJ1ZEHVWaSesrBKUnYU1mTxefks7YumhJadCCuNY4yMPjF+mkGxvb
         IYC98M3+1cI+AL+m2AvKcrdp9MFOX1qL1OKBDVNAflxl1LfzRPrBNvOFt0e8omhypzoM
         gGTYtjyB+XPXVUKFYmhekTLIjS8SRNRL0zPzJdhRc1G4AdwAxA/GsTdZGagZiIeKzz3N
         G4fTIcJ6cKGdn6nsixRaivZgQS1NV9qbFcJcTBNPyN0Ep2bLdxf99J+xvi28qimMil0Z
         Rt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748677; x=1793353477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eHpkzruNMWM7nEd9yLSMJY9dIBghjETsUAxANFqYe8=;
        b=VQDACcDnk7Wtjqb8SPhZRR924BXcYf1apBZtsQaT5sVTP+/CJQA8U3cJFTWwKCMMgH
         XiAu/vuY6euKBjAlt7+YVGwxa6rweRoerweLSqNnlJhs410LUS2q6JhcYs7ORP2EUrAv
         i6ZAZlBxsSLmgj3PkcOElXKMv/kwkzZL7WJipEot7Lyp2d2GoMcElDPO6ryUNdTwvACd
         D7ADgIoMoH0LbRTVXaozgdeQzf+RRqyUFAJEbZv+th5e+xYnhnuRzEuIMCDXpAbG7hjd
         8QWXqbYsSXwYukI6xwK/USVHgCgFaDvMN7a+lRRMWUQCH49xIuBc/Tq9pXtpNlgUDNz6
         RHsw==
X-Forwarded-Encrypted: i=1; AKwUvByNQg5zsg1gq9y9oFKpGkjEUhm9+71BZYydUcQL7zmR7gmVzN0BV8epk/VKlO/4I4gnkUhQz1raNnXsfdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVuY+HDIWhI9Fsi2K6QgQuslPHn5Ce6JAlGTpObGBbpXU9H+4i
	XRci35ozoEJ5m352m/tHwr5AyG1dvvyM4QAwd10wnKxRs0HPXrqK0UAs
X-Gm-Gg: AYBFou1AxBarr3XUhnk+nhDIMXcq138uNEUPBw27rqFwnETmYdNnWn0chBiOkJL5ozl
	dN1D3Mq+9+9OZ+x7WtvnDZ1cwY/wjO6wyqV4a+VKC5h2dSsJjumnsg1pHqkzAqxb0p1wevEy5r3
	39ZgHvZRI+upTOHdqk73OWCahsWRR7l6hCFNkWqcxTSh4N1opgtWGb7lCRtyE+IgzeSdt0/3tZh
	SQo4/FOdETzDcSVUzoVX7VUuRR/weEnL/bDdPBuEdyBgFYyd0VcnR7QLw1uN0uWMdpF8Z2ba577
	jKySqwIZ1KxXzGDIOMiWmFhKhFaXDI+9/Qwed468cJC71fx7zauyr51Vb9pSUD92/pneRTC4+SW
	xVl3GC6Bv3PqV0cZbNpKYfFVc8iy65/wzivSzlPk0DyF92G41TRCeuC2Q+GHnR2iqcLpXXlvsfu
	GezCQBB/7jSQe/seKUYrYKtMj6hNPoo07znpgoFRpcA+Wf3Kn6LymJ35i18iNQkB1JLZeDEfeAY
	S/YZqjh2Rc/pY/2pOlPIbEy/rEe/x7GrdslSAVru3GjKTGcM/7U1MS6q6/0n4OggZR5AAlcV2s9
	LLtnzX8=
X-Received: by 2002:a17:902:db02:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2ea7c169dfcmr18345425ad.5.1792748676866;
        Fri, 23 Oct 2026 02:44:36 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af680a9sm8381185ad.5.2026.10.23.02.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:44:35 -0700 (PDT)
From: Qing Wang <wangqing7171@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qing Wang <wangqing7171@gmail.com>
Subject: [PATCH] mm/slab: only require the requested size when refilling prefilled sheaves
Date: Fri, 23 Oct 2026 17:44:01 +0800
Message-Id: <20261023094401.2042862-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
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

kmem_cache_prefill_sheaf() and kmem_cache_refill_sheaf() only guarantee
@size objects, but for standard capacity sheaves
__prefill_sheaf_pfmemalloc() uses refill_sheaf(), which actually fills
the sheaf up to s->sheaf_capacity. The call thus fails with -ENOMEM
whenever the sheaf cannot be filled completely, even when @size objects
were already obtained. This leads to needless flushing of the partially
filled sheaf in kmem_cache_prefill_sheaf(), and may use pfmemalloc
reserves to fill the sheaf beyond what was requested.

Pass the @size from kmem_cache_prefill_sheaf() and
kmem_cache_refill_sheaf() down to __prefill_sheaf_pfmemalloc(), and have
it use the newly added refill_sheaf_min(), which returns success once
the sheaf holds @min_size objects while still trying to fill it up to
s->sheaf_capacity.

refill_sheaf() remains the full-capacity variant for
__pcs_replace_empty_main() and kmem_cache_return_sheaf(), because sheaves
on the barn's full list must be full.

Signed-off-by: Qing Wang <wangqing7171@gmail.com>
---
 mm/slub.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 544cff39762c..4f92b3e30d84 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2873,28 +2873,39 @@ static unsigned int
 refill_objects(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int min,
 	       unsigned int max);
 
-static int refill_sheaf(struct kmem_cache *s, struct slab_sheaf *sheaf,
-			 gfp_t gfp)
+/*
+ * Refill a sheaf with at least min_size objects, up to the sheaf's capacity.
+ * Returns 0 on success, -ENOMEM if the sheaf could not be filled to min_size.
+ */
+static int refill_sheaf_min(struct kmem_cache *s, struct slab_sheaf *sheaf,
+			    gfp_t gfp, unsigned int min_size)
 {
-	int to_fill = s->sheaf_capacity - sheaf->size;
+	int min_fill = min_size - sheaf->size;
+	int max_fill = s->sheaf_capacity - sheaf->size;
 	int filled;
 
-	if (!to_fill)
+	if (!min_fill)
 		return 0;
 
-	filled = refill_objects(s, &sheaf->objects[sheaf->size], gfp, to_fill,
-				to_fill);
+	filled = refill_objects(s, &sheaf->objects[sheaf->size], gfp, min_fill,
+				max_fill);
 
 	sheaf->size += filled;
 
 	stat_add(s, SHEAF_REFILL, filled);
 
-	if (filled < to_fill)
+	if (filled < min_fill)
 		return -ENOMEM;
 
 	return 0;
 }
 
+static int refill_sheaf(struct kmem_cache *s, struct slab_sheaf *sheaf,
+			 gfp_t gfp)
+{
+	return refill_sheaf_min(s, sheaf, gfp, s->sheaf_capacity);
+}
+
 /*
  * Maximum number of objects freed during a single flush of main pcs sheaf.
  * Translates directly to an on-stack array size.
@@ -5074,7 +5085,8 @@ void *kmem_cache_alloc_node_noprof(struct kmem_cache *s, gfp_t gfpflags, int nod
 EXPORT_SYMBOL(kmem_cache_alloc_node_noprof);
 
 static int __prefill_sheaf_pfmemalloc(struct kmem_cache *s,
-				      struct slab_sheaf *sheaf, gfp_t gfp)
+				      struct slab_sheaf *sheaf, gfp_t gfp,
+				      unsigned int size)
 {
 	gfp_t gfp_nomemalloc;
 	int ret;
@@ -5083,7 +5095,7 @@ static int __prefill_sheaf_pfmemalloc(struct kmem_cache *s,
 	if (gfp_pfmemalloc_allowed(gfp))
 		gfp_nomemalloc |= __GFP_NOWARN;
 
-	ret = refill_sheaf(s, sheaf, gfp_nomemalloc);
+	ret = refill_sheaf_min(s, sheaf, gfp_nomemalloc, size);
 
 	if (likely(!ret || !gfp_pfmemalloc_allowed(gfp)))
 		return ret;
@@ -5092,7 +5104,7 @@ static int __prefill_sheaf_pfmemalloc(struct kmem_cache *s,
 	 * if we are allowed to, refill sheaf with pfmemalloc but then remember
 	 * it for when it's returned
 	 */
-	ret = refill_sheaf(s, sheaf, gfp);
+	ret = refill_sheaf_min(s, sheaf, gfp, size);
 	sheaf->pfmemalloc = true;
 
 	return ret;
@@ -5171,7 +5183,7 @@ kmem_cache_prefill_sheaf(struct kmem_cache *s, gfp_t gfp, unsigned int size)
 		sheaf->pfmemalloc = false;
 
 		if (sheaf->size < size &&
-		    __prefill_sheaf_pfmemalloc(s, sheaf, gfp)) {
+		    __prefill_sheaf_pfmemalloc(s, sheaf, gfp, size)) {
 			sheaf_flush_unused(s, sheaf);
 			free_empty_sheaf(s, sheaf);
 			sheaf = NULL;
@@ -5267,7 +5279,7 @@ int kmem_cache_refill_sheaf(struct kmem_cache *s, gfp_t gfp,
 
 	if (likely(sheaf->capacity >= size)) {
 		if (likely(sheaf->capacity == s->sheaf_capacity))
-			return __prefill_sheaf_pfmemalloc(s, sheaf, gfp);
+			return __prefill_sheaf_pfmemalloc(s, sheaf, gfp, size);
 
 		if (!__kmem_cache_alloc_bulk(s, gfp, sheaf->capacity - sheaf->size,
 					     &sheaf->objects[sheaf->size]))
-- 
2.34.1

