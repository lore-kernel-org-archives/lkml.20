Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB0A42317C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377703; cv=none; b=nnblVSL991ZY87wayxUlSUMRsROWM1WRBC7cWn7yhXmKxFE8ulHh2x4J1AkLEWJSDyVbPIbA/7WkiJuI/gEVZ4WByVukIKmCcaQ+M8Du6faWLddhVd9f0tb+klT03Gp50am/lbO7HiZdPMn85sVOeiTn/sHtIxqGGBa1g96eoTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377703; c=relaxed/simple;
	bh=AWgNdelLuusMKTO3XmEV6H2qIFR8ZhjKw8eGqirrJj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHBNxxTpWm+YO8+OnSiuj+qbOKDWLfudtdJdrSKiP3kWCLLZrIpIr+B7N7phiAayNW5/DhpmGwIUHH++GD43vl9o1jYPCsPfruz8oXJteC7Ue7cOtQJcTIv/k4AMkz3O8ONusMtFgAfzL9ubSHaWF5kUrCJ+zLSI2sg+QuGjbIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCKXjLqg; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCKXjLqg"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-530ea5dafd4so22267801cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377700; x=1789982500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJLNgmlgQhAoJRQ2IrTohM5uVJQIzCvFDhXSRTt2DE4=;
        b=BCKXjLqgahPBnZIF2oa8n4IX/jW/XfHQtuXpWlaNdbMa1o2Kr2kIitX2FNE6YLaxxn
         IszLyAzzeP40Z/04KUGPn0PDttkyxKcWgaSeHAVO9zLVrjLfrG7/EnIvTHgaCAOBxN1a
         ey1G82Kz+9LeK5amNquTWc65uNNNU6EdqebrdPpx0uO2wZSow6zPsbtBqXJjy3RpBj+d
         8S0ZRZLQCPbkNrHmC3zmSns2jygCFE9nYmP1tZU0ONmRfnCQrmzXzp56/6AOCaYMGD6c
         c3xfwRGQadddqtIlWNm7FegBB7ORdKqRNVBNXNO4QvjXakvfqzzklMpUZwdHhPQWn+gO
         tZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377700; x=1789982500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJLNgmlgQhAoJRQ2IrTohM5uVJQIzCvFDhXSRTt2DE4=;
        b=kvGeKXtitcnlT1FolxYgLIF/1wza2UeuuU4nTtemYwtPnD5dXU1XCOlm70l1mRcugx
         bmjS//cIuZ0wzelAOEi5p94R5a/iE01NqplqYo36EU/3kfee68UDN4hj4pb7BYEIdJbc
         4S8RQ46nHfHxsjv+Z9U+k93uAfwG+CK19v997wi+nDCcA2D1C3c4GKnfLpdzSTC0FuL7
         APGg6epf7to/EvwQHpY4tJdCdak4TfBnfya/L59w8qjwbeXqQJhSRqReobwl8nsQgnOr
         +QcWkf47lSFEpI8MzCfB8gj5eA6bNvceWtbv4PI6vEiUfCOzZLkV7VZMSHKxHbHJ85Jh
         iErg==
X-Forwarded-Encrypted: i=1; AKwUvBzAl+VCpQtltAexZHM1VddSvhCv9Maidxz8qtH3VC2dItVe+/MVOmr+NcXu0S5OHEM/Ckvfdc84FdHowrQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nQmeFjHDAkNX/096SmcdRUDacoKSYcioKXQjyDDpCT33VGd5N6
	EWGr7wsYLPvOcH6HcScCeueFQ7dJwcOB9p72Yw1nZL7mRJuw2LY/39dA
X-Gm-Gg: AYBFou37GeTkElvB4YNdgSe5vbTvMOROfVbXbxITeEySJxeIHtkuKHCW9NWA7fpymR6
	71R1XNcgGQGOYHfGZy1mBl0PPGLucAIcF006t8D2jQtmlRyTWqrHLpzSq+ZqVXXXjZjTarguryU
	7BHWy3FdA7MDJYFonzVJRnA7AyhIif8H8Sj9dF0cNUTPKYlsliEpMK98EDbt5OWps/9pWEBcEk6
	sY5CgUB4gpnsjh6arpgm+EOEGhzukoJonWVSsW9TFCID5DD0n8abAY/RxQZon+eoC2YjBvrJk+h
	xP4o205jBdivbmNcYXt88ckwPbTmY13F2Fahtdc3RBCXrpF3OhcIBD/4+i3/Q5UaL4IphN9jffj
	k3UOVriMrkh6zDvgHH0ADeQQiyNIl7azIcP99tLCz/r4AoZgLTdIawRYUZhgQjn45NsUYe1/9ag
	mfHkg/Q+7cFTaFd7UEUptlqz0W4O+KQPBkgUMO//7TipmlpDLQenT+GhVJt107hOadYo9BybLbd
	IPV4lwPCf4Bm1XEjid3yqys1DVbEYrTmrh/bevV/FlyRFBug0g2eYDgrD1liWDOF0wR
X-Received: by 2002:ac8:59c1:0:b0:530:db0e:e098 with SMTP id d75a77b69052e-5310cf602b0mr23311491cf.23.1789377700398;
        Mon, 14 Sep 2026 02:21:40 -0700 (PDT)
Received: from kernel-dev.. ([2a01:4ff:f0:3ff2::1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f49444bsm89854256d6.29.2026.09.14.02.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:21:40 -0700 (PDT)
From: Uzair Beg <uzairbeg11@gmail.com>
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk,
	asml.silence@gmail.com,
	Chengfeng Lin <lin2530632123@gmail.com>,
	linux-kernel@vger.kernel.org,
	Uzair Beg <uzairbeg11@gmail.com>
Subject: [RFC PATCH 2/3] io_uring/rsrc: bulk refill the node cache on allocation miss
Date: Mon, 14 Sep 2026 09:20:48 +0000
Message-ID: <20260914092049.130079-3-uzairbeg11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914092049.130079-1-uzairbeg11@gmail.com>
References: <20260914092049.130079-1-uzairbeg11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A first fill of a sparse fixed file table takes one allocator round
trip per install, since the per-ring node cache starts empty and
nothing is freed back during the fill. At 4,096 slots that is 4,096
calls into the slab allocator.

When the cache has a dedicated kmem_cache, refill it in batches on a
miss: allocate up to IO_ALLOC_CACHE_REFILL objects with
kmem_cache_alloc_bulk(), return one and stash the remainder in the
cache. A 4,096-slot first fill then enters the allocator roughly once
per batch instead of once per object. This mirrors the existing bulk
allocation of requests from req_cachep.

kmem_cache_alloc_bulk() may return fewer objects than requested,
including zero; both cases are handled. Stashed objects have their
init_clear region zeroed and are poisoned like any other cached
entry, and the cache never grows past max_cached. Callers without a
dedicated slab are unchanged.

Bare-metal measurement shows this is neutral on the reported workload:
the per-object cost is in the SLUB allocation path itself, not in the
number of allocator entries. It is kept because the following patch
relies on the same bulk machinery.

Reported-by: Chengfeng Lin <lin2530632123@gmail.com>
Closes: https://lore.kernel.org/io-uring/CANGjgdmt0FQ=offsdfn+wEaDxbOFoAa6bi92X_vEo4S6aCZ56A@mail.gmail.com/
Tested-by: Chengfeng Lin <lin2530632123@gmail.com>
Signed-off-by: Uzair Beg <uzairbeg11@gmail.com>
---
 io_uring/alloc_cache.c | 29 ++++++++++++++++++++++++++---
 io_uring/alloc_cache.h |  1 +
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/io_uring/alloc_cache.c b/io_uring/alloc_cache.c
index a44b82a80f1..cba0e6c5d66 100644
--- a/io_uring/alloc_cache.c
+++ b/io_uring/alloc_cache.c
@@ -42,10 +42,33 @@ void *io_cache_alloc_new(struct io_alloc_cache *cache, gfp_t gfp)
 {
 	void *obj;
 
-	if (cache->slab)
-		obj = kmem_cache_alloc(cache->slab, gfp);
-	else
+	if (cache->slab) {
+		unsigned int room = cache->max_cached - cache->nr_cached;
+		void **slot = &cache->entries[cache->nr_cached];
+		unsigned int batch, got, i;
+
+		if (unlikely(!room))
+			return kmem_cache_alloc(cache->slab, gfp);
+
+		batch = min_t(unsigned int, IO_ALLOC_CACHE_REFILL, room);
+		got = kmem_cache_alloc_bulk(cache->slab, gfp, batch, slot);
+		if (unlikely(!got))
+			return NULL;
+
+		/* return one object, stash the rest in the cache */
+		obj = slot[got - 1];
+		for (i = 0; i < got - 1; i++) {
+			if (cache->init_clear)
+				memset(slot[i], 0, cache->init_clear);
+			if (unlikely(!kasan_mempool_poison_object(slot[i])))
+				break;
+			cache->nr_cached++;
+		}
+		for (; i < got - 1; i++)
+			kmem_cache_free(cache->slab, slot[i]);
+	} else {
 		obj = kmalloc(cache->elem_size, gfp);
+	}
 	if (obj && cache->init_clear)
 		memset(obj, 0, cache->init_clear);
 	return obj;
diff --git a/io_uring/alloc_cache.h b/io_uring/alloc_cache.h
index b288bfccc91..82d552c7517 100644
--- a/io_uring/alloc_cache.h
+++ b/io_uring/alloc_cache.h
@@ -7,6 +7,7 @@
  * Don't allow the cache to grow beyond this size.
  */
 #define IO_ALLOC_CACHE_MAX	128
+#define IO_ALLOC_CACHE_REFILL	32
 
 void io_alloc_cache_free(struct io_alloc_cache *cache,
 			 void (*free)(const void *));
-- 
2.43.0

