Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289732;
	b=4lySNDG+DzPM/bPQFcGObCl3bSNVnQQokox9ujrXSZBRsxmecYOjzYrjH6wHKT4c9v7A
	 60H7tSBE7eP3hh7wSOroKmAeLjFYz8pwuBp9t59uIZhtY5DyBmA4JeOxGLGWT9JiiZint
	 bunQkiAfmwpq8NKTHb03JD1tL2D9F8VQFwoTUy5eO9BCrXZkvYYofLUd3uxA2d3b8HvG8
	 NVI3sb9x2Dzctza8UwCcTNJUjwWocqj5OiPUnSBlPGGJfNHY5FRH8UutX2cGtQJ+amcaq
	 sNmOXL+21b8yKD0P7sK/2StrL76mvtijXoIsRR6X0fZvLfoTl/ZqhMr3Pde/lUnzM6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XpnbsjJLLF0pRRHml5avH3sFfAy4a7G34t01Mzwk4xE=;
	b=z6PrsQvODGFepM7aYnaDvrejDqy+JvsFnLRFNOjMW47yiyUJzLdkvjqx9mZx+KAfmVk+
	 YjgsXcpG4yJphyNuGDrQJmgOKacgNq3nQK6UfjiXguRNuPhOA6bgQnsC34zv0If0Ksiev
	 om9ZGliQuwsCSEy+kChaYpSWgBe1Tu6SVop6Ff4KTAJOZGQLxoNIdS+AzXyA/atYGK/Y3
	 Jls6zI3cQk5Ds3NP7JAKWOd4j7I8pNZULaZtiramXrFgL/zX+a+gn3u7gEKLm8W0Jvo3O
	 CQL9u/TI4Hs0Wbq6m+qQD2aGIXiKGbYueQ4al3alrxLt9qmaPZZKKOiMwzNkGAOgkUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e4KCys2e;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F90F60A2612
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F90F60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e4KCys2e
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1016239a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289732; x=1794894532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpnbsjJLLF0pRRHml5avH3sFfAy4a7G34t01Mzwk4xE=;
        b=e4KCys2en/VTZutevJNS6Vowl2RHQ/IdR85AnBozyVnaUn9j/5HVu1s50JpIdhASda
         r4TrstFDhmDemAswHXkHJiQ+/l1c9tHKCWicyslXuZwgUPjlBG5eCA1MS7lqPYd5MC5y
         bADeECnCZTiimpQL9sW+Sh/g9tHd2vLbHbzz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289732; x=1794894532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XpnbsjJLLF0pRRHml5avH3sFfAy4a7G34t01Mzwk4xE=;
        b=0HDeLxhKcUvgMsLfIPXpRDpMD7HU/4EGqrRJyf7FTAFvE2Q9mB9Ir8SXjXhVO4x+q6
         di4F/Xp400ajxeP4ZdBuxjvsEiBJakwuHaXSNppEJmuofPNLdg9HCKnmlFXmo1APddbe
         crzk9Ttj/u+fjcHyQj88JoYUcyXGZ/VawqCI0qMbkUnhC5GjQjxF7oIPLkO+C59yGNrO
         O7XAKy8JK3/DP8xnFl22Z7Krs9ynTgbuD2L6pqC+3CafcLgOMB10aU5MLyvHEP3e2GZj
         jQX/gfzrkJuIgbEEdrW12Sep8nq0+X3OiZXHxhOlt5AFBVbqsGA729QaIX/egzDEFgeL
         +Wgg==
X-Forwarded-Encrypted: i=1; AL+hErGpmaTuakNc4ZtHRIh+XUdqXXqVvijYxucMdDkYKOGmSKjRGPNiIgzmx+fih3HjHoqV8qcEhQ1V3YU7P5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U8ADeEJxqgqD3UH9stIPsiAkhR4C1Nf6N3VxJxvHzZ9mZBNdF
	juJHbhhO0/rA2XeOtJWnCN3k7/8YhfYv4GJiNcRKv1nGqHvdXkb6FSVeGlrmx4VOyA==
X-Gm-Gg: AYBFou2uE6IEIwrnUPeyyskPjyui3q0vTvN2j1XEq9HyP95QC1BCvsvgkHV4PE4CnJ1
	WBDajxj3buVAyiJhl/1CLRnSkBN8J+euwh0fJuOcw12C031HOOKFiAUS8ZA6rKQr6gF5qZgiodV
	T3nbGxG12erFGN4HQRGVshMHyWkFXKflLdBMNyiCkNd6Zo1ST4JoeYYgRoahXo1qYAVaGbZGXsD
	1bSrx6qTflXVfNPltSO8VfHWpuIfLrpRn5q8DWT8xhMmL7wr6iy6DyobzsRo9tcX82c1bwOMGyJ
	+sgBHVroQTrc/LoIwiS+m+gVa+uI7aSYyGnN7wCzThD1jB0P5zG1uejkWVqzlCHbSCHFN0gztis
	79JOuvTXQQex/c6lSr1AmbPIsZby64AGvVPaHnDSUUUt+RycW84lKJ7TurpjOEFv3VTweA5mt2v
	fuReAUvrXnvDmk3vmikr7DweL0cU+zAcLKPmEUU8Cjmmb7ysf/N/CQOagPIDW2YO7VSZYoivpxo
	fNIzctWVfN22sR4qb/L1o8bbXTBA6/Yv3CJeIJn5n3EQO08816FAZbLbiKhdUS6u446mrN4gpbs
	a9dT7nSo7UKsvfdSGyGSvwk+zWjhvIk1CAAdf9sXbtTLGuGl2Szc4/MU7kEU5Xq5hkwzm9l/DVz
	t+rdeSc3jqW75+uiJeUnGbNw5j3jcOhg4OUit/rg=
X-Received: by 2002:a17:90b:548c:b0:3ab:31e6:12fc with SMTP id 98e67ed59e1d1-3b166a64553mr2044187a91.0.1794289731797;
        Mon, 09 Nov 2026 21:48:51 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d67e53asm444634a12.5.2026.11.09.21.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:48:51 -0800 (PST)
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
Subject: [PATCH v2 02/11] zram: drop get_slot_handle() and set_slot_handle()
Date: Tue, 10 Nov 2026 14:48:07 +0900
Message-ID: <20261110054836.1515030-3-senozhatsky@chromium.org>
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

zram_table_entry ->handle is overloaded to store zsmalloc handle,
same-filled page pattern and writeback block index, so calling
set_slot_handle() or get_slot_handle() for blk_idx and same-filled
pattern is confusing.

Turn ->handle into a union of handle, element and blk_idx, drop
get_slot_handle() and set_slot_handle(), and open-code field
accesses.  No functional change.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 43 +++++++++++++----------------------
 drivers/block/zram/zram_drv.h |  6 ++++-
 2 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 380615b73446..5c13addd22f6 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -111,17 +111,6 @@ static inline struct zram *dev_to_zram(struct device *dev)
 	return (struct zram *)dev_to_disk(dev)->private_data;
 }
 
-static unsigned long get_slot_handle(struct zram *zram, unsigned long index)
-{
-	return zram->table[index].handle;
-}
-
-static void set_slot_handle(struct zram *zram, unsigned long index,
-			    unsigned long handle)
-{
-	zram->table[index].handle = handle;
-}
-
 static bool test_slot_flag(struct zram *zram, unsigned long index,
 			   enum zram_pageflags flag)
 {
@@ -962,8 +951,8 @@ static int zram_writeback_complete(struct zram *zram, struct zram_wb_req *req)
 	if (test_slot_flag(zram, index, ZRAM_HUGE))
 		atomic64_dec(&zram->stats.huge_pages);
 	atomic64_sub(get_slot_size(zram, index), &zram->stats.compr_data_size);
-	zs_free(zram->mem_pool, get_slot_handle(zram, index));
-	set_slot_handle(zram, index, req->blk_idx);
+	zs_free(zram->mem_pool, zram->table[index].handle);
+	zram->table[index].blk_idx = req->blk_idx;
 	set_slot_flag(zram, index, ZRAM_WB);
 
 out:
@@ -2064,7 +2053,7 @@ static void slot_free(struct zram *zram, unsigned long index)
 
 	if (test_slot_flag(zram, index, ZRAM_WB)) {
 		clear_slot_flag(zram, index, ZRAM_WB);
-		zram_release_bdev_block(zram, get_slot_handle(zram, index));
+		zram_release_bdev_block(zram, zram->table[index].blk_idx);
 		goto out;
 	}
 
@@ -2078,7 +2067,7 @@ static void slot_free(struct zram *zram, unsigned long index)
 		goto out;
 	}
 
-	handle = get_slot_handle(zram, index);
+	handle = zram->table[index].handle;
 	if (!handle)
 		return;
 
@@ -2088,7 +2077,7 @@ static void slot_free(struct zram *zram, unsigned long index)
 		     &zram->stats.compr_data_size);
 out:
 	atomic64_dec(&zram->stats.pages_stored);
-	set_slot_handle(zram, index, 0);
+	zram->table[index].element = 0;
 	set_slot_size(zram, index, 0);
 }
 
@@ -2098,7 +2087,7 @@ static int read_same_filled_page(struct zram *zram, struct page *page,
 	void *mem;
 
 	mem = kmap_local_page(page);
-	zram_fill_page(mem, PAGE_SIZE, get_slot_handle(zram, index));
+	zram_fill_page(mem, PAGE_SIZE, zram->table[index].element);
 	kunmap_local(mem);
 	return 0;
 }
@@ -2110,7 +2099,7 @@ static int read_incompressible_page(struct zram *zram, struct page *page,
 	unsigned long handle;
 	void *src, *dst;
 
-	handle = get_slot_handle(zram, index);
+	handle = zram->table[index].handle;
 	zs_obj_read_sg_begin(zram->mem_pool, handle, sg, PAGE_SIZE);
 	/* an incompressible object never spans two pages */
 	src = kmap_local_page(sg_page(sg));
@@ -2134,7 +2123,7 @@ static int read_compressed_page(struct zram *zram, struct page *page,
 	void *dst;
 	int ret, prio;
 
-	handle = get_slot_handle(zram, index);
+	handle = zram->table[index].handle;
 	size = get_slot_size(zram, index);
 	prio = get_slot_comp_priority(zram, index);
 
@@ -2161,7 +2150,7 @@ static int read_from_zspool_raw(struct zram *zram, struct page *page,
 	unsigned int size;
 	void *dst;
 
-	handle = get_slot_handle(zram, index);
+	handle = zram->table[index].handle;
 	size = get_slot_size(zram, index);
 
 	/*
@@ -2188,7 +2177,7 @@ static int read_from_zspool(struct zram *zram, struct page *page,
 			    unsigned long index)
 {
 	if (test_slot_flag(zram, index, ZRAM_SAME) ||
-	    !get_slot_handle(zram, index))
+	    !zram->table[index].handle)
 		return read_same_filled_page(zram, page, index);
 
 	if (!test_slot_flag(zram, index, ZRAM_HUGE))
@@ -2209,7 +2198,7 @@ static int zram_read_page(struct zram *zram, struct page *page,
 		ret = read_from_zspool(zram, page, index);
 		slot_unlock(zram, index);
 	} else {
-		unsigned long blk_idx = get_slot_handle(zram, index);
+		unsigned long blk_idx = zram->table[index].blk_idx;
 
 		/*
 		 * The slot should be unlocked before reading from the backing
@@ -2255,7 +2244,7 @@ static int write_same_filled_page(struct zram *zram, unsigned long fill,
 	slot_lock(zram, index);
 	slot_free(zram, index);
 	set_slot_flag(zram, index, ZRAM_SAME);
-	set_slot_handle(zram, index, fill);
+	zram->table[index].element = fill;
 	mark_slot_accessed(zram, index);
 	slot_unlock(zram, index);
 
@@ -2289,7 +2278,7 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	slot_lock(zram, index);
 	slot_free(zram, index);
 	set_slot_flag(zram, index, ZRAM_HUGE);
-	set_slot_handle(zram, index, handle);
+	zram->table[index].handle = handle;
 	set_slot_size(zram, index, PAGE_SIZE);
 	mark_slot_accessed(zram, index);
 	slot_unlock(zram, index);
@@ -2355,7 +2344,7 @@ static int zram_write_page(struct zram *zram, struct page *page,
 
 	slot_lock(zram, index);
 	slot_free(zram, index);
-	set_slot_handle(zram, index, handle);
+	zram->table[index].handle = handle;
 	set_slot_size(zram, index, comp_len);
 	mark_slot_accessed(zram, index);
 	slot_unlock(zram, index);
@@ -2471,7 +2460,7 @@ static int recompress_slot(struct zram *zram, unsigned long index,
 	void *src;
 	int ret = 0;
 
-	handle_old = get_slot_handle(zram, index);
+	handle_old = zram->table[index].handle;
 	if (!handle_old)
 		return -EINVAL;
 
@@ -2554,7 +2543,7 @@ static int recompress_slot(struct zram *zram, unsigned long index,
 	zcomp_cstrm_put(zstrm);
 
 	slot_free(zram, index);
-	set_slot_handle(zram, index, handle_new);
+	zram->table[index].handle = handle_new;
 	set_slot_size(zram, index, comp_len_new);
 	set_slot_comp_priority(zram, index, prio);
 
diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index c563a7c13a49..5416e25e64e8 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -78,7 +78,11 @@ enum zram_pageflags {
  * of each entry and hence of the meta table.
  */
 struct zram_table_entry {
-	unsigned long handle;
+	union {
+		unsigned long handle;
+		unsigned long element;
+		unsigned long blk_idx;
+	};
 	union {
 		unsigned long __lock;
 		struct attr {
-- 
2.56.0.506.g506a7eabc5-goog

