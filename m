Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289744;
	b=q6da/LuBi2EGCrTD5jmeTvvH8RF0Mbt7obG8f1qGura1QdgY2jTCK9aSOrPMvUkJk/py
	 /grcMT/G+vH9QXYRhheLlXh+x6F3qhxk6WX+ErFqgWRlHxpeKSrHzLVlgsciejvn2JsrO
	 Y5SXof/oSI47eV7cSFaFph1Z+kMnlYF9m9Tyri6Gj68kINP8B7XLqAPOr7YaYddFDjjZJ
	 NPPBeuP2QyIXfrmVKYyP59Ex0pMK38RFnvZw0sfganap79LwEY4vclUZVwK/AlWkJ6hJm
	 2Bhs02f0vaGZ4zH7AyX79OKJts4680Gltm6iPXJ1r8op5n1/cZcRBEtGy9n5OdCGhCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X7J8W8iGMlxVtygfltgHoQnyuGwmlkD+WN19PoJbqGw=;
	b=X4qSW40bDQGg8lGQ3amHHsA1ZSUzQ7APgvpFQUCHoGlwCU7uJoy/ma04VVnn8zpHakZr
	 y0JYaqmOrYjU7ggIuNHSF2DLUgap/ziNK6AOUcuvLjzjBIg18LAURNNkk4nfG84a0JDze
	 4Jnckz+FyAatDu9uAMPjCzlVor/3ZWdHV0eHVNpc63AYf2upeI5kFB6bnie6lGIAhhzJ6
	 sTV/Q0l46F6bPebc+sOntdfsR+ScofBmZE/VAlR45JSxC4aVK8uxtk3fhYW7dDdvDVelo
	 UEjgyoaVjke7SzZT3/rhEuiOesX3J8dZUVpFZ2y4n8oloXkqcwzaA2WYXZ4U0b8V5IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="G7j/r8SO";
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899D1606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 899D1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G7j/r8SO
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b8ecfa886bso742331b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289743; x=1794894543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7J8W8iGMlxVtygfltgHoQnyuGwmlkD+WN19PoJbqGw=;
        b=G7j/r8SO31RG6om+dY6mnb8eRzQMnVKt7r2QX9BCG96JNErEc1129q/wu2KssUcyu5
         xsTjEPbXa4v4/zfw3eQRQfzBywB0P1c1TXVTcTFbnHNEG8ROELdMsWWFSR4YaSb/7WrD
         k5N5NUo7Gxw0EuCcQOEcgjxT4cUmAFzSRTR2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289743; x=1794894543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X7J8W8iGMlxVtygfltgHoQnyuGwmlkD+WN19PoJbqGw=;
        b=qTfoo8HUC8cXBOW80qKLP2N3ppyvvceEFSDoGhZK2YstCiPJAm3vyveybC12uCFmDj
         73RausgxvRK5If5Laj5lTfyawN4/PiYWV8updpxRwUDlexQoMGmSx2yiFhs5BmzEpv5n
         efX98C3dn6bN2QGru5edCzUIhouD2QGSHtYTUvNMed+63ZVvtIoHOEdCjMQSBkOWvt7A
         9YYr30ckUsNz71yM8pk7tGle+u1SEERnrtEyxhL6oCw+Wy5BSnRRXWS5PhW5oLNBeoMP
         K7pKnxNO8zx5qPLi7PK0gd5qeXKVZaC+sRb9zIK3P7b7RRExqOd0JP6afvsrWbRCuW8t
         incg==
X-Forwarded-Encrypted: i=1; AL+hErEeKTN3gXrRrsMfssLhr8Ks2kUISbK834twV01e4GtsN3NItf8ib6QYHZvFZRqKel+Y5Ythyrw0rwZ8CMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ys1y2uOdYHEa7udGuowW9MgpvQaoJaK/zA2uEWK6Tx+mFJO4v
	5mApSAJTtHMZO3EFkJDttCTPfxqxYfij5Zg6ihy2shLAaOm+AcUOf9fmutiGncW2QQ==
X-Gm-Gg: AYBFou3mOgBUKTOyMYKWMv/xuAOjA6CThXMp92xjpQqAobEY91RLBhBqQ5eFvrHb/AK
	+qFsvrqvSPghM1uFuF08dHkAXRYKnPYjtU7lMGvtj88QmIQIof44xceR5Kv5wGzD+eXLK8Eo31U
	55ytt+FBY7KCR/4ECGbVb4VQOCASpzqFs668Xu5x6ts9pvn8Yj+p3ySwo+8oMPkA0IMO9vbfiZb
	vSgyJYhX2VQXcC168qHe8eAVXN8q7wVg+V8uIofE6BpSmokbUILchF1p/zmt3Za1vC0uWq9OUAp
	ZgUnNDrYh4sZ1xPPSMZDsYw1QGCJfbTrL/9uPbeu9EJGDeQzOgTBl+iORBpyhdCtcj4xAOKZ85j
	auJE6WK63mmZPlFYR7nHepMlu1oY/b4vO5loK+6TCEVPlNR4mGUEmjdrjWOZS2TmXFfRhuQmRBv
	k1RFvA5pGVq1rXhRTB/A97XK4UTdf5Rydyuu+dBCPvbGE2OT1D9+zpDCeIpl389idmAVL8xs6sJ
	GbVwWCxalhnzqpGg0yY6fLDdyLdxMC/JAGrQa/leW5rKkACSgm4hrBqyGqbolA8ll7wuqmGQgN1
	FmBdhGF5s4kH2XMzxQTIZ7gzPvUiPKOTxcD6b8WhREXD5cKfp8fGLMMRrQsfzhz99hNhVXMRgY0
	plMT6Ce/11adiuSohOA==
X-Received: by 2002:a05:6a20:2447:b0:3e2:2a4b:1bfb with SMTP id adf61e73a8af0-3f173738e45mr1398876637.29.1794289743309;
        Mon, 09 Nov 2026 21:49:03 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d67e53asm444634a12.5.2026.11.09.21.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:49:02 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2 06/11] zram: allocate zsmalloc object under slot lock
Date: Tue, 10 Nov 2026 14:48:11 +0900
Message-ID: <20261110054836.1515030-7-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261110054836.1515030-1-senozhatsky@chromium.org>
References: <20261110054836.1515030-1-senozhatsky@chromium.org>
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

zram_write_page() and write_incompressible_page() allocate and
write zsmalloc object first and take slot lock only to free the
old slot data and set the new handle.  A subsequent patch makes
zsmalloc store object location directly in zram table entry, so
we need to free the slot before we allocate a new object for it.

Free the slot and allocate the object under slot lock.
recompress_slot() already allocates objects under it, and
GFP_NOIO reclaim cannot re-enter zram write path.

mem_limit is checked before slot_free() (previous patch), so hitting
the limit keeps the old slot data.  zs_malloc() can still fail after
slot_free(), e.g. when we write from reclaim (PF_MEMALLOC), which is
swap-out, so the old slot data (if any) is stale anyway, or when the
writer is an OOM victim that has no reserves left.  The slot is left
empty then, matching standard block write-failure semantics.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index d38b20a22595..aa3ab88f1259 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -2259,11 +2259,15 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	struct zs_handle *handle;
 	void *src;
 
+	slot_lock(zram, index);
+	slot_free(zram, index);
 	handle = zs_malloc(zram->mem_pool, PAGE_SIZE,
 			   GFP_NOIO | __GFP_NOWARN |
 			   __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
-	if (IS_ERR(handle))
+	if (IS_ERR(handle)) {
+		slot_unlock(zram, index);
 		return PTR_ERR(handle);
+	}
 
 	update_used_max(zram);
 
@@ -2271,8 +2275,6 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	zs_obj_write(zram->mem_pool, handle, src, PAGE_SIZE);
 	kunmap_local(src);
 
-	slot_lock(zram, index);
-	slot_free(zram, index);
 	set_slot_flag(zram, index, ZRAM_HUGE);
 	zram->table[index].handle = handle;
 	set_slot_size(zram, index, PAGE_SIZE);
@@ -2324,11 +2326,14 @@ static int zram_write_page(struct zram *zram, struct page *page,
 		return write_incompressible_page(zram, page, index);
 	}
 
+	slot_lock(zram, index);
+	slot_free(zram, index);
 	handle = zs_malloc(zram->mem_pool, comp_len,
 			   GFP_NOIO | __GFP_NOWARN |
 			   __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
 	if (IS_ERR(handle)) {
 		zcomp_cstrm_put(zstrm);
+		slot_unlock(zram, index);
 		return PTR_ERR(handle);
 	}
 
@@ -2337,8 +2342,6 @@ static int zram_write_page(struct zram *zram, struct page *page,
 	zs_obj_write(zram->mem_pool, handle, zstrm->buffer, comp_len);
 	zcomp_cstrm_put(zstrm);
 
-	slot_lock(zram, index);
-	slot_free(zram, index);
 	zram->table[index].handle = handle;
 	set_slot_size(zram, index, comp_len);
 	mark_slot_accessed(zram, index);
-- 
2.56.0.506.g506a7eabc5-goog

