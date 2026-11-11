Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379661;
	b=VVQXmtEPjvPsja+jU/4ZyqUHYamO/+s52mWnUvUMzlzC935mAOuP+4JcrMMKfXZeNn9P
	 4aFToo+2a7lwZMUvAVbbcuUMcQH1Kt83TSr4LStJv1UWFXdTEpREIVHFvfhvAsLRA8ued
	 sfM+LOXG212YejtuDJZiiR61pg7JiLYotSbFzTlcfzrkeUAgFkSOBj8o19R41j/u5YqJ2
	 lbSFhIH2hppIDLCvzvCLb6foZQhuEbDjHSFzukIfHE7q8AjYqHGprsdNg08uKb3l5lWFx
	 U8vj0AfC2DwivKoxcprJ5uecNTGJEomnpmUyW3la/K+VwrxNdrueE/yD4eNbjs9ofaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qqGM2KLzXD6pB2VSlJO6zpbbVGS3h4JqJlzrKIKVnss=;
	b=MQ7YgY3n+Q8WHSHyoDKfpIYNd2gkjgCy9JF9YyXcYWmev5javdE/ibnQlVw4MYBVH343
	 Tf56nYkl1X1hu3SuL7djGNs6CbQ1ia/fqOiIwEG/z4s2sxWtORZZK0Y80M7xywhJVDE2n
	 MLoCyBaDUe02fW5nq0nG5/rsATI/M/KWeNt/3o1HNeYltxZ0A8E+Tk4oIvaexgXIVzYGE
	 caFI56IfdVfM+XpCu9NLxS81cmQF1pIFVZ9jBHRzXnJPnNvRKP67mJgnsjVHtJToNM8ni
	 wryTMaN1oyq4sZa4gWF8eL57hvQm3Jazb16n1cMoMtPj7Fh3NM9DWU4tbzCLT74CFnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B8OEH67w;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0960A2628
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CD0960A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B8OEH67w
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1622872a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794379660; x=1794984460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqGM2KLzXD6pB2VSlJO6zpbbVGS3h4JqJlzrKIKVnss=;
        b=B8OEH67wlHoMADFinjkQ5svEZ5+yKV8tamwJNy+RUMhTb9rmG+4SlMEQ3AzSkmSnzc
         8ugg/b3ytFr3RPvLqTdE/HGZeyX4Dg6KRYKf+vk31LQ+cFUuuCIJgFmAF8GplX65+YnE
         TKhI+oHYb28kMguFY2DjAqYMO0eXU4xw7xbVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379660; x=1794984460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqGM2KLzXD6pB2VSlJO6zpbbVGS3h4JqJlzrKIKVnss=;
        b=BuSRao87Q2F18g1bEt5uzS4ccENvGwf3l9/BBh/m1i+5YNDiSzq/tr2bwCfb/AgCQQ
         IiIG74TrS+ifBtf6gX/WZll9oP5DlLVFwdBCH4+GKDH4flgX3lCwmXpGSqgggH/sy9U+
         xlnxEgxKsmWIBI6m1LdvsBRgfL0jq1VumLkLTzfpHx9Jhtj47ngzImjiMN33BCa/6+0Y
         cnovnvrECFPZuwAr9F9UCMgIm5z0QNCx5yNW9naHYh0+ixcoT3QFy6APAvGjhm7QZsqQ
         DmTrY4S4vqbBgtzUtbN512xcHTN+SzP98gRY1smVXmY2bVneFSCiZofFICb1nAVbAKIX
         +0AQ==
X-Forwarded-Encrypted: i=1; AL+hErFHoniDlSM05Xl+qWn6uU4S2t2qQJMCANRColoVEusDRz4auN7fuY+dLggGhhVHH8UWU90jDAMNdi8cHN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kGm+S7PTLCZOBwqEBcqIYjc3dRfqjRb/lpud+PACcVUdnbQs1
	HtlHagMUEd44fhOdXCnwpWsmUBa2fGkRbST0YrmOIv3okDmYyIolEsmSXvngx4yzFA==
X-Gm-Gg: AYBFou0nFQ8pSnOozZJpORmfQQ5J4l7NYdazD9eB7YdcLXNLDs4HLT2w0eVpLj/nDxG
	4M2lo6M/At6IxQs5wyoe5Ysn5YpIuMwJKIRpUyZEtiMgYeDLEDIfv5g7hZPE/9Mv6OpWChGBFe0
	nOojJN+cX6MN/82SUHObedLkNNmG9SUfj72d1eqgbsjljL77Eprwzd/Tzdx3LHU7gCEj26gesNo
	YBfj40OAIVn/iLKYohl9LdCz5D3jCeS0JMNzbiU/1udfo1l/R0lgbnd9KTh1Yj1suY8HEyRXXaJ
	9WcEoCjIKhwM4zhBqaW11ptYocXnStWxhTc66EKMQN/vuRp/45UzsyaRzqtgOQpuC0Mv+XT9kwb
	l8w0fi0SID1NQT2aRM3yNPueGOa/7w1DpYI5uyKHwi+nhDYoCLkVf98Frwoc835/VSOQZLkhLyc
	G7R6Nk0F8Mcn7/y5hQH7bn1nKpA5sG5xVjMgd7EZurvgoOkWXDzVqCU67JdFW8M3q0lE1z0N90B
	wdgHrRW2/xtxYL83L8tDqS8k54cxuhz06jJONtrT08r0O7OasFY2rg3+JXVDMYp7q4f6FH62kRM
	cntMNzB93Va2mt936AjK5uz7hnypVng8OR3cPB2GRZ9uh6pOraDQQJ7Cz96E776WVbitsAHWbMr
	LkpDUa2w6CTClY0Yb2KBhEjOZa49XcIarMqynUFI=
X-Received: by 2002:a17:90b:4b0f:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b182e12794mr1705154a91.1.1794379660232;
        Tue, 10 Nov 2026 22:47:40 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db85a9bsm3268666a91.14.2026.11.10.22.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:47:39 -0800 (PST)
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
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Yosry Ahmed <yosry@kernel.org>
Subject: [PATCH v3 09/11] zsmalloc: embed struct zs_handle into zram and zswap entries
Date: Wed, 11 Nov 2026 15:46:32 +0900
Message-ID: <20261111064707.2568433-10-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261111064707.2568433-1-senozhatsky@chromium.org>
References: <20261111064707.2568433-1-senozhatsky@chromium.org>
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

zsmalloc allocates an object from handle_cachep for every stored
object, just to have a stable address which compaction and page
migration can update when the object moves.  Both zram and zswap
already have per-entry structures that hold the handle, so we basically
keep a pointer to a pointer, which costs 8 bytes per stored object,
slab alloc/free on every store and free, and one more memory load on
every access.

Make struct zs_handle public and embed it into zram_table_entry and
zswap_entry (their sizes don't change), so that zsmalloc writes object
location directly there, and remove handle_cachep.  zs_malloc() now
takes a handle pointer and returns an error code, zs_free() resets the
handle.

Since compaction and migration update the handle in place, it must be
naturally aligned, must not be on the stack (zs_malloc() warns about
both), must not be copied, and must stay allocated until zs_free() or
zs_rebind_handle().  zram recompression allocates a new object before
it frees the old one, so it uses zram->recomp_handle, protected by
->dev_lock, and zs_rebind_handle() moves the new object to the slot
handle.  zram recompression is the only user of zs_rebind_handle().

This saves 8 bytes per stored page, e.g. 2MB per 1GB of swapped out
4K pages.  Since handle is per-entry the memory savings scale.

Reviewed-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/admin-guide/mm/slab.rst |   2 +-
 Documentation/mm/zsmalloc.rst         |  18 ++--
 drivers/block/zram/zram_drv.c         |  70 ++++++-------
 drivers/block/zram/zram_drv.h         |   6 +-
 include/linux/zsmalloc.h              |  29 +++++-
 mm/zsmalloc.c                         | 145 ++++++++++++++++----------
 mm/zswap.c                            |  22 ++--
 7 files changed, 178 insertions(+), 114 deletions(-)

diff --git a/Documentation/admin-guide/mm/slab.rst b/Documentation/admin-guide/mm/slab.rst
index 14429ab90611..57e4a118a391 100644
--- a/Documentation/admin-guide/mm/slab.rst
+++ b/Documentation/admin-guide/mm/slab.rst
@@ -96,7 +96,7 @@ except some that are deemed too performance critical and don't need to be
 debugged by specifying global debug options followed by a list of slab names
 with "-" as options::
 
-	slab_debug=FZ;-,zs_handle,zspage
+	slab_debug=FZ;-,zspage
 
 The state of each debug option for a slab can be found in the respective files
 under::
diff --git a/Documentation/mm/zsmalloc.rst b/Documentation/mm/zsmalloc.rst
index d2bbecd78e14..d6b21a0c0694 100644
--- a/Documentation/mm/zsmalloc.rst
+++ b/Documentation/mm/zsmalloc.rst
@@ -22,13 +22,17 @@ worst case, page is incompressible and is thus stored "as-is" i.e. in
 uncompressed form). For allocation requests larger than this size, failure
 is returned (see zs_malloc).
 
-Additionally, zs_malloc() does not return a dereferenceable pointer.
-Instead, it returns an opaque handle (unsigned long) which encodes actual
-location of the allocated object. The reason for this indirection is that
-zsmalloc does not keep zspages permanently mapped since that would cause
-issues on 32-bit systems where the VA region for kernel space mappings
-is very small. So, using the allocated memory should be done through the
-proper handle-based APIs.
+Additionally, zs_malloc() does not return a pointer; instead, it returns 0
+(or a negative error code) and stores the encoded location of the allocated
+object in the caller-provided ``struct zs_handle``. The reason for this
+indirection is that zsmalloc does not keep zspages permanently mapped since
+that would cause issues on 32-bit systems where the VA region for kernel
+space mappings is very small. zsmalloc also keeps a back-pointer to the
+provided ``struct zs_handle`` and updates it asynchronously during
+compaction and page migration, so the owner must not modify or copy the
+handle and must keep it allocated until ``zs_free()`` or
+``zs_rebind_handle()``. Using the allocated memory should be done through
+the proper handle-based APIs.
 
 stat
 ====
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index dbcbc267344e..878582cb1e33 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -952,7 +952,7 @@ static int zram_writeback_complete(struct zram *zram, struct zram_wb_req *req)
 	if (test_slot_flag(zram, index, ZRAM_HUGE))
 		atomic64_dec(&zram->stats.huge_pages);
 	atomic64_sub(get_slot_size(zram, index), &zram->stats.compr_data_size);
-	zs_free(zram->mem_pool, zram->table[index].handle);
+	zs_free(zram->mem_pool, &zram->table[index].handle);
 	zram->table[index].blk_idx = req->blk_idx;
 	set_slot_flag(zram, index, ZRAM_WB);
 
@@ -2068,8 +2068,8 @@ static void slot_free(struct zram *zram, unsigned long index)
 		goto out;
 	}
 
-	handle = zram->table[index].handle;
-	if (!handle)
+	handle = &zram->table[index].handle;
+	if (!zs_handle_is_allocated(handle))
 		return;
 
 	zs_free(zram->mem_pool, handle);
@@ -2100,7 +2100,7 @@ static int read_incompressible_page(struct zram *zram, struct page *page,
 	struct zs_handle *handle;
 	void *src, *dst;
 
-	handle = zram->table[index].handle;
+	handle = &zram->table[index].handle;
 	zs_obj_read_sg_begin(zram->mem_pool, handle, sg, PAGE_SIZE);
 	/* an incompressible object never spans two pages */
 	src = kmap_local_page(sg_page(sg));
@@ -2124,7 +2124,7 @@ static int read_compressed_page(struct zram *zram, struct page *page,
 	void *dst;
 	int ret, prio;
 
-	handle = zram->table[index].handle;
+	handle = &zram->table[index].handle;
 	size = get_slot_size(zram, index);
 	prio = get_slot_comp_priority(zram, index);
 
@@ -2151,7 +2151,7 @@ static int read_from_zspool_raw(struct zram *zram, struct page *page,
 	unsigned int size;
 	void *dst;
 
-	handle = zram->table[index].handle;
+	handle = &zram->table[index].handle;
 	size = get_slot_size(zram, index);
 
 	/*
@@ -2178,7 +2178,7 @@ static int read_from_zspool(struct zram *zram, struct page *page,
 			    unsigned long index)
 {
 	if (test_slot_flag(zram, index, ZRAM_SAME) ||
-	    !zram->table[index].handle)
+	    !zs_handle_is_allocated(&zram->table[index].handle))
 		return read_same_filled_page(zram, page, index);
 
 	if (!test_slot_flag(zram, index, ZRAM_HUGE))
@@ -2258,27 +2258,27 @@ static int write_same_filled_page(struct zram *zram, unsigned long fill,
 static int write_incompressible_page(struct zram *zram, struct page *page,
 				     unsigned long index)
 {
-	struct zs_handle *handle;
 	void *src;
+	int ret;
 
 	slot_lock(zram, index);
 	slot_free(zram, index);
-	handle = zs_malloc(zram->mem_pool, PAGE_SIZE,
-			   GFP_NOIO | __GFP_NOWARN |
-			   __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
-	if (IS_ERR(handle)) {
+	ret = zs_malloc(zram->mem_pool, &zram->table[index].handle, PAGE_SIZE,
+			GFP_NOIO | __GFP_NOWARN |
+			__GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
+	if (ret) {
 		slot_unlock(zram, index);
-		return PTR_ERR(handle);
+		return ret;
 	}
 
 	update_used_max(zram);
 
 	src = kmap_local_page(page);
-	zs_obj_write(zram->mem_pool, handle, src, PAGE_SIZE);
+	zs_obj_write(zram->mem_pool, &zram->table[index].handle, src,
+		     PAGE_SIZE);
 	kunmap_local(src);
 
 	set_slot_flag(zram, index, ZRAM_HUGE);
-	zram->table[index].handle = handle;
 	set_slot_size(zram, index, PAGE_SIZE);
 	mark_slot_accessed(zram, index);
 	slot_unlock(zram, index);
@@ -2295,7 +2295,6 @@ static int zram_write_page(struct zram *zram, struct page *page,
 			   unsigned long index)
 {
 	int ret = 0;
-	struct zs_handle *handle;
 	unsigned int comp_len;
 	void *mem;
 	struct zcomp_cstrm *zstrm;
@@ -2330,21 +2329,21 @@ static int zram_write_page(struct zram *zram, struct page *page,
 
 	slot_lock(zram, index);
 	slot_free(zram, index);
-	handle = zs_malloc(zram->mem_pool, comp_len,
-			   GFP_NOIO | __GFP_NOWARN |
-			   __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
-	if (IS_ERR(handle)) {
+	ret = zs_malloc(zram->mem_pool, &zram->table[index].handle, comp_len,
+			GFP_NOIO | __GFP_NOWARN |
+			__GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
+	if (ret) {
 		zcomp_cstrm_put(zstrm);
 		slot_unlock(zram, index);
-		return PTR_ERR(handle);
+		return ret;
 	}
 
 	update_used_max(zram);
 
-	zs_obj_write(zram->mem_pool, handle, zstrm->buffer, comp_len);
+	zs_obj_write(zram->mem_pool, &zram->table[index].handle, zstrm->buffer,
+		     comp_len);
 	zcomp_cstrm_put(zstrm);
 
-	zram->table[index].handle = handle;
 	set_slot_size(zram, index, comp_len);
 	mark_slot_accessed(zram, index);
 	slot_unlock(zram, index);
@@ -2451,8 +2450,6 @@ static int recompress_slot(struct zram *zram, unsigned long index,
 			   u32 threshold, u32 prio)
 {
 	struct zcomp_cstrm *zstrm = NULL;
-	struct zs_handle *handle_old;
-	struct zs_handle *handle_new;
 	unsigned int comp_len_old;
 	unsigned int comp_len_new;
 	unsigned int class_index_old;
@@ -2460,8 +2457,9 @@ static int recompress_slot(struct zram *zram, unsigned long index,
 	void *src;
 	int ret = 0;
 
-	handle_old = zram->table[index].handle;
-	if (!handle_old)
+	lockdep_assert_held_write(&zram->dev_lock);
+
+	if (!zs_handle_is_allocated(&zram->table[index].handle))
 		return -EINVAL;
 
 	comp_len_old = get_slot_size(zram, index);
@@ -2530,20 +2528,22 @@ static int recompress_slot(struct zram *zram, unsigned long index,
 	 * modify zsmalloc API to return this information. For now, we will
 	 * make do with the node of the page allocated for recompression.
 	 */
-	handle_new = zs_malloc(zram->mem_pool, comp_len_new,
-			       GFP_NOIO | __GFP_NOWARN |
-			       __GFP_HIGHMEM | __GFP_MOVABLE,
-			       page_to_nid(page));
-	if (IS_ERR(handle_new)) {
+	ret = zs_malloc(zram->mem_pool, &zram->recomp_handle, comp_len_new,
+			GFP_NOIO | __GFP_NOWARN |
+			__GFP_HIGHMEM | __GFP_MOVABLE,
+			page_to_nid(page));
+	if (ret) {
 		zcomp_cstrm_put(zstrm);
-		return PTR_ERR(handle_new);
+		return ret;
 	}
 
-	zs_obj_write(zram->mem_pool, handle_new, zstrm->buffer, comp_len_new);
+	zs_obj_write(zram->mem_pool, &zram->recomp_handle, zstrm->buffer,
+		     comp_len_new);
 	zcomp_cstrm_put(zstrm);
 
 	slot_free(zram, index);
-	zram->table[index].handle = handle_new;
+	zs_rebind_handle(zram->mem_pool, &zram->table[index].handle,
+			 &zram->recomp_handle);
 	set_slot_size(zram, index, comp_len_new);
 	set_slot_comp_priority(zram, index, prio);
 
diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index 5b211a9f314c..d64c99b74214 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -79,7 +79,7 @@ enum zram_pageflags {
  */
 struct zram_table_entry {
 	union {
-		struct zs_handle *handle;
+		struct zs_handle handle;
 		unsigned long element;
 		unsigned long blk_idx;
 	};
@@ -159,6 +159,10 @@ struct zram {
 	unsigned long bitmap_cursor;
 	unsigned long nr_pages;
 #endif
+#ifdef CONFIG_ZRAM_MULTI_COMP
+	/* Pseudo slot for recompression, protected by ->dev_lock */
+	struct zs_handle recomp_handle;
+#endif
 #ifdef CONFIG_ZRAM_MEMORY_TRACKING
 	struct dentry *debugfs_dir;
 #endif
diff --git a/include/linux/zsmalloc.h b/include/linux/zsmalloc.h
index 7fa500ae2653..8273ae924153 100644
--- a/include/linux/zsmalloc.h
+++ b/include/linux/zsmalloc.h
@@ -14,6 +14,7 @@
 #ifndef _ZS_MALLOC_H_
 #define _ZS_MALLOC_H_
 
+#include <linux/compiler.h>
 #include <linux/types.h>
 
 struct zs_pool_stats {
@@ -21,16 +22,38 @@ struct zs_pool_stats {
 	atomic_long_t pages_compacted;
 };
 
+/*
+ * zsmalloc writes object location into the handle, keeps a back-pointer to
+ * it, and updates it asynchronously when the object moves (compaction, page
+ * migration).  Therefore the owner must not modify or copy the handle, must
+ * not put it on the stack or misalign it (e.g. inside a __packed struct),
+ * and must keep it allocated until zs_free() or zs_rebind_handle().
+ */
+struct zs_handle {
+	unsigned long __private obj;
+};
+
+static inline void zs_handle_init(struct zs_handle *handle)
+{
+	ACCESS_PRIVATE(handle, obj) = 0;
+}
+
+static inline bool zs_handle_is_allocated(const struct zs_handle *handle)
+{
+	return READ_ONCE(ACCESS_PRIVATE(handle, obj)) != 0;
+}
+
 struct zs_pool;
-struct zs_handle;
 struct scatterlist;
 
 struct zs_pool *zs_create_pool(const char *name);
 void zs_destroy_pool(struct zs_pool *pool);
 
-struct zs_handle *zs_malloc(struct zs_pool *pool, size_t size, gfp_t flags,
-			    const int nid);
+int zs_malloc(struct zs_pool *pool, struct zs_handle *handle, size_t size,
+	      gfp_t flags, const int nid);
 void zs_free(struct zs_pool *pool, struct zs_handle *handle);
+void zs_rebind_handle(struct zs_pool *pool, struct zs_handle *dst,
+		      struct zs_handle *src);
 
 size_t zs_huge_class_size(struct zs_pool *pool);
 
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 9be538d0be22..54d4fe8ada53 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -22,14 +22,15 @@
  *	class->lock
  *	zspage->lock
  *
- * When ZS_OBJ_CLASS_BITS > 0, zs_free() skips pool->lock; it picks
- * the size_class from obj's encoded class_idx and serializes against
- * page migration via class->lock.
+ * When ZS_OBJ_CLASS_BITS > 0, zs_free() and zs_rebind_handle() skip
+ * pool->lock; they pick the size_class from obj's encoded class_idx and
+ * serialize against page migration via class->lock.
  */
 
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
+#include <linux/sched/task_stack.h>
 #include <linux/errno.h>
 #include <linux/highmem.h>
 #include <linux/string.h>
@@ -104,10 +105,10 @@
  *                     |
  *                     +-- ZS_OBJ_PFN_SHIFT
  *
- * Encoding class_idx into obj lets zs_free() locate the size_class
- * without holding pool->lock; class_idx is invariant across page
- * migration (only PFN changes), so a lockless read of the obj value
- * always yields a valid class_idx.
+ * Encoding class_idx into obj lets zs_free() and zs_rebind_handle()
+ * locate the size_class without holding pool->lock; class_idx is
+ * invariant across page migration (only PFN changes), so a lockless
+ * read of the obj value always yields a valid class_idx.
  */
 #define ZS_OBJ_PFN_SHIFT	(BITS_PER_LONG - _PFN_BITS)
 
@@ -267,11 +268,6 @@ struct link_free {
 	};
 };
 
-struct zs_handle {
-	unsigned long __private obj;
-};
-
-static struct kmem_cache *handle_cachep;
 static struct kmem_cache *zspage_cachep;
 
 struct zs_pool {
@@ -445,18 +441,6 @@ static void init_deferred_free(struct zs_pool *pool) {}
 static void SetZsPageMovable(struct zs_pool *pool, struct zspage *zspage) {}
 #endif
 
-static struct zs_handle *cache_alloc_handle(gfp_t gfp)
-{
-	gfp = gfp & ~(__GFP_HIGHMEM | __GFP_MOVABLE);
-
-	return kmem_cache_alloc(handle_cachep, gfp);
-}
-
-static void cache_free_handle(struct zs_handle *handle)
-{
-	kmem_cache_free(handle_cachep, handle);
-}
-
 static struct zspage *cache_alloc_zspage(gfp_t gfp)
 {
 	gfp = gfp & ~(__GFP_HIGHMEM | __GFP_MOVABLE);
@@ -470,14 +454,22 @@ static void cache_free_zspage(struct zspage *zspage)
 }
 
 /*
- * Pairs with READ_ONCE() in handle_to_obj(): zs_free() may read the
- * handle locklessly, so prevent store tearing here.
+ * Pairs with READ_ONCE() in handle_to_obj() and zs_handle_is_allocated():
+ * zs_free(), zs_rebind_handle(), and zs_handle_is_allocated() may read
+ * the handle locklessly, so prevent store tearing here.
  */
 static void record_obj(struct zs_handle *handle, unsigned long obj)
 {
 	WRITE_ONCE(ACCESS_PRIVATE(handle, obj), obj);
 }
 
+static bool valid_unallocated_handle(const struct zs_handle *handle)
+{
+	return IS_ALIGNED((unsigned long)handle, __alignof__(unsigned long)) &&
+	       !object_is_on_stack(handle) &&
+	       !zs_handle_is_allocated(handle);
+}
+
 /* Protected by class->lock */
 static inline int get_zspage_inuse(struct zspage *zspage)
 {
@@ -1307,31 +1299,34 @@ static unsigned long obj_malloc(struct zs_pool *pool,
 /**
  * zs_malloc - Allocate block of given size from pool.
  * @pool: pool to allocate from
+ * @handle: handle to store allocated object in
  * @size: size of block to allocate
  * @gfp: gfp flags when allocating object
  * @nid: The preferred node id to allocate new zspage (if needed)
  *
- * On success, handle to the allocated object is returned,
- * otherwise an ERR_PTR().
  * Allocation requests with size > ZS_MAX_ALLOC_SIZE will fail.
+ * zsmalloc keeps a back-pointer to @handle and updates it asynchronously
+ * when the object moves, so @handle must be unsigned-long aligned, must
+ * not be on the stack or modified/copied by the caller, and must remain
+ * allocated until zs_free() or zs_rebind_handle().
+ *
+ * Return: 0 on success, negative error code otherwise.
  */
-struct zs_handle *zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp,
-			    const int nid)
+int zs_malloc(struct zs_pool *pool, struct zs_handle *handle, size_t size,
+	      gfp_t gfp, const int nid)
 {
-	struct zs_handle *handle;
 	struct size_class *class;
 	int newfg;
 	struct zspage *zspage;
 
+	if (WARN_ON_ONCE(!valid_unallocated_handle(handle)))
+		return -EINVAL;
+
 	if (unlikely(!size))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
 	if (unlikely(size > ZS_MAX_ALLOC_SIZE))
-		return ERR_PTR(-ENOSPC);
-
-	handle = cache_alloc_handle(gfp);
-	if (!handle)
-		return ERR_PTR(-ENOMEM);
+		return -ENOSPC;
 
 	class = lookup_size_class(pool, size);
 
@@ -1350,10 +1345,8 @@ struct zs_handle *zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp,
 	spin_unlock(&class->lock);
 
 	zspage = alloc_zspage(pool, class, gfp, nid);
-	if (!zspage) {
-		cache_free_handle(handle);
-		return ERR_PTR(-ENOMEM);
-	}
+	if (!zspage)
+		return -ENOMEM;
 
 	spin_lock(&class->lock);
 	obj_malloc(pool, zspage, handle);
@@ -1368,7 +1361,7 @@ struct zs_handle *zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp,
 out:
 	spin_unlock(&class->lock);
 
-	return handle;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(zs_malloc);
 
@@ -1469,13 +1462,14 @@ void zs_free(struct zs_pool *pool, struct zs_handle *handle)
 	int fullness;
 	struct zspage *zspage_to_free = NULL;
 
-	if (IS_ERR_OR_NULL(handle))
+	if (!zs_handle_is_allocated(handle))
 		return;
 
 	obj_class_get_and_lock(pool, handle, &obj, &zspage, &class);
 
 	class_stat_sub(class, ZS_OBJS_INUSE, 1);
 	obj_free(class->size, obj);
+	record_obj(handle, 0);
 
 	fullness = fix_fullness_group(class, zspage);
 	if (fullness == ZS_INUSE_RATIO_0) {
@@ -1495,10 +1489,56 @@ void zs_free(struct zs_pool *pool, struct zs_handle *handle)
 		__free_zspage_lockless(zspage_to_free);
 		atomic_long_sub(class->pages_per_zspage, &pool->pages_allocated);
 	}
-	cache_free_handle(handle);
 }
 EXPORT_SYMBOL_GPL(zs_free);
 
+/**
+ * zs_rebind_handle() - Rebind an allocated object to a new handle.
+ * @pool: pool the object belongs to
+ * @dst: unallocated destination handle (must not be on the stack)
+ * @src: source handle that currently owns the object
+ *
+ * Rebinds the object from @src to @dst, updating the object header so
+ * compaction and page migration update @dst instead of @src, and resets
+ * @src.
+ */
+void zs_rebind_handle(struct zs_pool *pool, struct zs_handle *dst,
+		      struct zs_handle *src)
+{
+	struct size_class *class;
+	struct zspage *zspage;
+	struct zpdesc *zpdesc;
+	struct link_free *link;
+	unsigned int obj_idx;
+	unsigned long obj;
+	unsigned long off;
+	void *vaddr;
+
+	/* Should never happen; bail out rather than corrupting handles */
+	if (WARN_ON_ONCE(!valid_unallocated_handle(dst) ||
+			 !zs_handle_is_allocated(src)))
+		return;
+
+	obj_class_get_and_lock(pool, src, &obj, &zspage, &class);
+
+	if (likely(!ZsHugePage(zspage))) {
+		obj_to_location(obj, &zpdesc, &obj_idx);
+		off = offset_in_page(class->size * obj_idx);
+		vaddr = kmap_local_zpdesc(zpdesc);
+		link = (struct link_free *)(vaddr + off);
+		link->handle = (unsigned long)dst | OBJ_ALLOCATED_TAG;
+		kunmap_local(vaddr);
+	} else {
+		zspage->first_zpdesc->handle =
+			(unsigned long)dst | OBJ_ALLOCATED_TAG;
+	}
+
+	record_obj(dst, obj);
+	record_obj(src, 0);
+	spin_unlock(&class->lock);
+}
+EXPORT_SYMBOL_GPL(zs_rebind_handle);
+
 static void zs_object_copy(struct size_class *class, unsigned long dst,
 				unsigned long src)
 {
@@ -1795,7 +1835,8 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 
 	/*
 	 * The pool migrate_lock protects against races between zpage migration
-	 * and zs_free(), but only when ZS_OBJ_CLASS_BITS does not apply.
+	 * and zs_free() / zs_rebind_handle(), but only when ZS_OBJ_CLASS_BITS
+	 * does not apply.
 	 */
 	write_lock(&pool->lock);
 	class = zspage_class(pool, zspage);
@@ -1974,9 +2015,9 @@ static unsigned long __zs_compact(struct zs_pool *pool,
 	unsigned long pages_freed = 0;
 
 	/*
-	 * Protect against races between zpage migration and zs_free()
-	 * (only when ZS_OBJ_CLASS_BITS does not apply), as well as
-	 * zpage allocation and free.
+	 * Protect against races between zpage migration and zs_free() /
+	 * zs_rebind_handle() (only when ZS_OBJ_CLASS_BITS does not apply),
+	 * as well as zpage allocation and free.
 	 */
 	write_lock(&pool->lock);
 	spin_lock(&class->lock);
@@ -2298,23 +2339,17 @@ EXPORT_SYMBOL_GPL(zs_destroy_pool);
 
 static void zs_destroy_caches(void)
 {
-	kmem_cache_destroy(handle_cachep);
-	handle_cachep = NULL;
 	kmem_cache_destroy(zspage_cachep);
 	zspage_cachep = NULL;
 }
 
 static int __init zs_init_caches(void)
 {
-	handle_cachep = kmem_cache_create("zs_handle", sizeof(struct zs_handle),
-					  0, 0, NULL);
 	zspage_cachep = kmem_cache_create("zspage", sizeof(struct zspage),
 					  0, 0, NULL);
 
-	if (!handle_cachep || !zspage_cachep) {
-		zs_destroy_caches();
+	if (!zspage_cachep)
 		return -ENOMEM;
-	}
 	return 0;
 }
 
diff --git a/mm/zswap.c b/mm/zswap.c
index dc0400d7e1a3..241f9fdebaad 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -216,7 +216,7 @@ struct zswap_entry {
 	unsigned int length;
 	bool referenced;
 	u8 pool_idx;
-	struct zs_handle *handle;
+	struct zs_handle handle;
 	struct obj_cgroup *objcg;
 	struct list_head lru;
 };
@@ -770,6 +770,7 @@ static struct zswap_entry *zswap_entry_cache_alloc(gfp_t gfp, int nid)
 	entry = kmem_cache_alloc_node(zswap_entry_cache, gfp, nid);
 	if (!entry)
 		return NULL;
+	zs_handle_init(&entry->handle);
 	return entry;
 }
 
@@ -790,7 +791,7 @@ static void zswap_entry_free(struct zswap_entry *entry)
 	if (WARN_ON_ONCE(!pool))
 		return;
 
-	zs_free(pool->zs_pool, entry->handle);
+	zs_free(pool->zs_pool, &entry->handle);
 	zswap_pool_put(pool);
 	if (entry->objcg) {
 		obj_cgroup_uncharge_zswap(entry->objcg, entry->length);
@@ -890,7 +891,6 @@ static bool zswap_compress(struct folio *folio, long index,
 	struct scatterlist input, output;
 	int comp_ret = 0, alloc_ret = 0;
 	unsigned int dlen = PAGE_SIZE;
-	struct zs_handle *handle;
 	gfp_t gfp;
 	u8 *dst;
 	bool mapped = false;
@@ -950,14 +950,12 @@ static bool zswap_compress(struct folio *folio, long index,
 	}
 
 	gfp = GFP_NOWAIT | __GFP_NORETRY | __GFP_HIGHMEM | __GFP_MOVABLE;
-	handle = zs_malloc(pool->zs_pool, dlen, gfp, folio_nid(folio));
-	if (IS_ERR(handle)) {
-		alloc_ret = PTR_ERR(handle);
+	alloc_ret = zs_malloc(pool->zs_pool, &entry->handle, dlen, gfp,
+			      folio_nid(folio));
+	if (alloc_ret)
 		goto unlock;
-	}
 
-	zs_obj_write(pool->zs_pool, handle, dst, dlen);
-	entry->handle = handle;
+	zs_obj_write(pool->zs_pool, &entry->handle, dst, dlen);
 	entry->length = dlen;
 
 unlock:
@@ -982,7 +980,7 @@ static bool __zswap_decompress(struct zswap_entry *entry,
 	struct scatterlist output;
 	int ret = 0, dlen;
 
-	zs_obj_read_sg_begin(pool->zs_pool, entry->handle, input, entry->length);
+	zs_obj_read_sg_begin(pool->zs_pool, &entry->handle, input, entry->length);
 
 	/* zswap entries of length PAGE_SIZE are not compressed. */
 	if (entry->length == PAGE_SIZE) {
@@ -1004,7 +1002,7 @@ static bool __zswap_decompress(struct zswap_entry *entry,
 		dlen = req->dlen;
 	}
 
-	zs_obj_read_sg_end(pool->zs_pool, entry->handle);
+	zs_obj_read_sg_end(pool->zs_pool, &entry->handle);
 
 	if (!ret && dlen == PAGE_SIZE)
 		return true;
@@ -1608,7 +1606,7 @@ static bool zswap_store_page(struct folio *folio, long index,
 	return true;
 
 store_failed:
-	zs_free(pool->zs_pool, entry->handle);
+	zs_free(pool->zs_pool, &entry->handle);
 compress_failed:
 	zswap_entry_cache_free(entry);
 	return false;
-- 
2.56.0.542.g3ef89b7020-goog

