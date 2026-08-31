Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6EE400987
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179771; cv=none; b=QXMPq5h3CiQm6k1QbY4TQStL88CJRajif0b7WqSL9mOgkZQIrJsrvp5w+k2UuUMyyD4QJO4/Rvjm5xEPQdKyHNU02Ni+m7DKwmdL1+ZNu2pz1nbjPwGNv6NTRx4tfjBX1DPuAEF9xyVukeRFKUFeMSq1X7SBIBxpWE88mi6SoHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179771; c=relaxed/simple;
	bh=5VmFGXO2THIC1ElKsZHCyDs0LOvF/2GZA7e4bXBxIwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EVLN4uqbz8vcD1xqdwsWY0tJDQpJbHzKihbP9jP/UnNDs044tyb2ZJWABXpNn1Cml7QXYUGerVXN5r7c6upVCPuHY/K+v6JFSdjeC6HJuF5SICt9KjVOsAvvPtQFBgVTv1Z6YMReXpLPDQxFu0bzcuHlNwNQygIrWOmdsbI/l6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYHNG4M8; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYHNG4M8"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8520161fdb9so4120758b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788179769; x=1788784569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ki0AfBSXcv6Q8Gg3qCdHGcmsARPRfMTEXg0rBtuB2Ag=;
        b=dYHNG4M8V8GCGt27Pk7iApN5NZ1eG3ZjqD+ZqrCNH6LbedeqWBNfo62rFwM86by61N
         vN0FwN1tmCyM3BU6AQZVC3uS2Onn0TWHgryaW6nQner0FT8rPLcP2cmtuO+4X95LJNZQ
         K5r5xlPdt8xIFeCsotJk8YsVuFP3LIObGYXHtHFECBZPbn8Cf/luALaw4faRSxuVCbOE
         ke1afjh+9SK4zLFd0wMDakloTCcxZv+Y6O1RfpWm4kUKRN3vnrNOLjRLpR692k6hL6L6
         XgABHU3fMMvFoFm4bBY5Zc9LrfYg/77QHiRDHvV55AN7ovQcZRoShf3zJH2X/8mtfpE/
         mY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179769; x=1788784569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ki0AfBSXcv6Q8Gg3qCdHGcmsARPRfMTEXg0rBtuB2Ag=;
        b=S64E8sxNoQzlX834bdg+4iJ218itBdcUDfh1xK0POGqhbG8CA+d1eDR4TRdX+XOm9H
         QMOyhbvSUKhZqDJvkFz0erNHt86+RZj/hQnIaLPX7/FSVJexJvsDc/JT19eSD9gbusQ0
         tbsZbrDX1THEXIwcNfQaW3MTRXPQ9H7S7sGR5q0M0XhNmAeDmHJYmpixBK3EvfQAWDdb
         K6FNT/9N1J6icqxPSBwZb1musih+I3Bl7GycQL9ASMX6xNMOPJtztlNKSuFgSFB0ELii
         LIx5nxXefzzmQ/RWz72Qr7WOuPD0Vkpy2nuTfObhPMuq66hpQSpyh3axjB6sQjiBfNyO
         kH6w==
X-Forwarded-Encrypted: i=1; AHgh+RqxMq9AZWw/0CnQVbUxG9CJYgptxoL3Ud/VksXbhhQrH48Fe4YDTfI+s6xajlMFQT9ckb7fSUV+9/ilJ7o=@vger.kernel.org
X-Gm-Message-State: AFuF++ls24btiZA90+t197n03f2Yp+NJvCSMELd1ajtEbLXSaTvUutgk
	SdwtOtgXA7G7h0jt9LpV3tfNod9fxQ7xHzzZ7LV2V+eQzls0lwX7t32e
X-Gm-Gg: AR+sD12X8FHSj8+VC86qOHjRUvKNBSiKjqf/5+X2OvhZ7u2OWBHrL3caMgnnbpGWfnv
	N8KkPq1M3FUXF8iQMUduO/itDXYA3Nb82nz0DQnaiu/WjbcT6ydPAy2U/YTyqHxSCAs6JDRMrHy
	XrbjEvqsEVKGv2s46Rmv50Z9IUrbidKzSoO4tdrRu8MywiYfuV40ibppk1mcihMJL4dNxt1yPKV
	HupQ5ADFGJ9UHtc5kQcpFBt87Zm7Iy6PDyS0AogrhTXOw+WnmqmYtFWRcY9gVMNWySqCS7l+6d+
	qtMeOUou1y3r+BWVQ0xXg9tlkmg7qWFJPiihscerYLyDJHgG1E9Tvo5S3dG0C6jyXhtDkBLAFXc
	e0gBd7ayXo7UlPhR/cO9LnIvlIHhg3WG61mhsz+cwBUCxOLfqIZt90snmkW/aqeodCR+T4b+eIf
	vxSLHdV5JZmnjqBjrmUFGCwjxVXGicW113cDb7AKA7MJzkZkeXEjfwIop5uzfVDuZUm8AxT7FqX
	58eQw==
X-Received: by 2002:a05:6a00:23c1:b0:848:4424:2b8e with SMTP id d2e1a72fcca58-85627dbfaf8mr34292953b3a.3.1788179768882;
        Mon, 31 Aug 2026 05:36:08 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a3a7bf20sm3502474b3a.57.2026.08.31.05.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:36:08 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: aliceryhl@google.com,
	gregkh@linuxfoundation.org,
	cmllamas@google.com
Cc: arve@android.com,
	tkjos@android.com,
	christian@brauner.io,
	surenb@google.com,
	baohua@kernel.org,
	zhanghongru06@gmail.com,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [RFC PATCH v2 1/2] binder: switch alloc->mutex to spinlock for buffer metadata
Date: Mon, 31 Aug 2026 20:35:44 +0800
Message-Id: <20260831123545.3655557-2-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831123545.3655557-1-zhangbo56@xiaomi.com>
References: <20260831123545.3655557-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The alloc->mutex is a highly contended lock on Android devices. When a
low-priority task holds this mutex and sleeps, high-priority binder
transactions are blocked, causing priority inversion and latency spikes.

Split the lock by converting alloc->mutex to a spinlock that only
protects buffer metadata. This eliminates the sleeping and priority
inversion on the hot path.

Page installation and shrinker zap serialization is handled separately
by a dedicated install_mutex introduced in the next patch.

Performance (binderThroughputTest, SM8850, 2 workers, 10 runs):

                    mutex               spinlock
  throughput:    27k-59k iter/s       79k-84k iter/s
  average:       0.031-0.068ms        0.022-0.023ms
  P99:           0.088-0.148ms        0.050-0.062ms

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
 drivers/android/binder_alloc.c | 36 +++++++++++++++++-----------------
 drivers/android/binder_alloc.h |  8 ++++----
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index e4488ad86a65..9775df3616aa 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -169,7 +169,7 @@ static struct binder_buffer *binder_alloc_prepare_to_free_locked(
 struct binder_buffer *binder_alloc_prepare_to_free(struct binder_alloc *alloc,
 						   unsigned long user_ptr)
 {
-	guard(mutex)(&alloc->mutex);
+	guard(spinlock)(&alloc->lock);
 	return binder_alloc_prepare_to_free_locked(alloc, user_ptr);
 }
 
@@ -676,10 +676,10 @@ struct binder_buffer *binder_alloc_new_buf(struct binder_alloc *alloc,
 	if (!next)
 		return ERR_PTR(-ENOMEM);
 
-	mutex_lock(&alloc->mutex);
+	spin_lock(&alloc->lock);
 	buffer = binder_alloc_new_buf_locked(alloc, next, size, is_async);
 	if (IS_ERR(buffer)) {
-		mutex_unlock(&alloc->mutex);
+		spin_unlock(&alloc->lock);
 		goto out;
 	}
 
@@ -687,7 +687,7 @@ struct binder_buffer *binder_alloc_new_buf(struct binder_alloc *alloc,
 	buffer->offsets_size = offsets_size;
 	buffer->extra_buffers_size = extra_buffers_size;
 	buffer->pid = current->tgid;
-	mutex_unlock(&alloc->mutex);
+	spin_unlock(&alloc->lock);
 
 	ret = binder_install_buffer_pages(alloc, buffer, size);
 	if (ret) {
@@ -872,9 +872,9 @@ void binder_alloc_free_buf(struct binder_alloc *alloc,
 		binder_alloc_clear_buf(alloc, buffer);
 		buffer->clear_on_free = false;
 	}
-	mutex_lock(&alloc->mutex);
+	spin_lock(&alloc->lock);
 	binder_free_buf_locked(alloc, buffer);
-	mutex_unlock(&alloc->mutex);
+	spin_unlock(&alloc->lock);
 }
 EXPORT_SYMBOL_IF_KUNIT(binder_alloc_free_buf);
 
@@ -967,7 +967,7 @@ void binder_alloc_deferred_release(struct binder_alloc *alloc)
 	struct binder_buffer *buffer;
 
 	buffers = 0;
-	mutex_lock(&alloc->mutex);
+	spin_lock(&alloc->lock);
 	BUG_ON(alloc->mapped);
 
 	while ((n = rb_first(&alloc->allocated_buffers))) {
@@ -1018,7 +1018,7 @@ void binder_alloc_deferred_release(struct binder_alloc *alloc)
 			page_count++;
 		}
 	}
-	mutex_unlock(&alloc->mutex);
+	spin_unlock(&alloc->lock);
 	kvfree(alloc->pages);
 	if (alloc->mm)
 		mmdrop(alloc->mm);
@@ -1043,7 +1043,7 @@ void binder_alloc_print_allocated(struct seq_file *m,
 	struct binder_buffer *buffer;
 	struct rb_node *n;
 
-	guard(mutex)(&alloc->mutex);
+	guard(spinlock)(&alloc->lock);
 	for (n = rb_first(&alloc->allocated_buffers); n; n = rb_next(n)) {
 		buffer = rb_entry(n, struct binder_buffer, rb_node);
 		seq_printf(m, "  buffer %d: %lx size %zd:%zd:%zd %s\n",
@@ -1069,7 +1069,7 @@ void binder_alloc_print_pages(struct seq_file *m,
 	int lru = 0;
 	int free = 0;
 
-	mutex_lock(&alloc->mutex);
+	spin_lock(&alloc->lock);
 	/*
 	 * Make sure the binder_alloc is fully initialized, otherwise we might
 	 * read inconsistent state.
@@ -1085,7 +1085,7 @@ void binder_alloc_print_pages(struct seq_file *m,
 				lru++;
 		}
 	}
-	mutex_unlock(&alloc->mutex);
+	spin_unlock(&alloc->lock);
 	seq_printf(m, "  pages: %d:%d:%d\n", active, lru, free);
 	seq_printf(m, "  pages high watermark: %zu\n", alloc->pages_high);
 }
@@ -1101,7 +1101,7 @@ int binder_alloc_get_allocated_count(struct binder_alloc *alloc)
 	struct rb_node *n;
 	int count = 0;
 
-	guard(mutex)(&alloc->mutex);
+	guard(spinlock)(&alloc->lock);
 	for (n = rb_first(&alloc->allocated_buffers); n != NULL; n = rb_next(n))
 		count++;
 	return count;
@@ -1161,8 +1161,8 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 		vma = vma_lookup(mm, page_addr);
 	}
 
-	if (!mutex_trylock(&alloc->mutex))
-		goto err_get_alloc_mutex_failed;
+	if (!spin_trylock(&alloc->lock))
+		goto err_get_alloc_lock_failed;
 
 	/*
 	 * Since a binder_alloc can only be mapped once, we ensure
@@ -1180,6 +1180,7 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 	trace_binder_unmap_kernel_end(alloc, index);
 
 	list_lru_isolate(lru, item);
+	spin_unlock(&alloc->lock);
 	spin_unlock(&lru->lock);
 
 	if (vma) {
@@ -1190,7 +1191,6 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 		trace_binder_unmap_user_end(alloc, index);
 	}
 
-	mutex_unlock(&alloc->mutex);
 	if (mm_locked)
 		mmap_read_unlock(mm);
 	else
@@ -1201,8 +1201,8 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 	return LRU_REMOVED_RETRY;
 
 err_invalid_vma:
-	mutex_unlock(&alloc->mutex);
-err_get_alloc_mutex_failed:
+	spin_unlock(&alloc->lock);
+err_get_alloc_lock_failed:
 	if (mm_locked)
 		mmap_read_unlock(mm);
 	else
@@ -1235,7 +1235,7 @@ VISIBLE_IF_KUNIT void __binder_alloc_init(struct binder_alloc *alloc,
 	alloc->pid = current->tgid;
 	alloc->mm = current->mm;
 	mmgrab(alloc->mm);
-	mutex_init(&alloc->mutex);
+	spin_lock_init(&alloc->lock);
 	INIT_LIST_HEAD(&alloc->buffers);
 	alloc->freelist = freelist;
 }
diff --git a/drivers/android/binder_alloc.h b/drivers/android/binder_alloc.h
index d6f1f6f2d00e..bea5a77bb6da 100644
--- a/drivers/android/binder_alloc.h
+++ b/drivers/android/binder_alloc.h
@@ -9,7 +9,7 @@
 #include <linux/rbtree.h>
 #include <linux/list.h>
 #include <linux/mm.h>
-#include <linux/rtmutex.h>
+#include <linux/spinlock.h>
 #include <linux/vmalloc.h>
 #include <linux/slab.h>
 #include <linux/list_lru.h>
@@ -80,7 +80,7 @@ static inline struct list_head *page_to_lru(struct page *p)
 
 /**
  * struct binder_alloc - per-binder proc state for binder allocator
- * @mutex:              protects binder_alloc fields
+ * @lock:               protects binder_alloc fields
  * @mm:                 copy of task->mm (invariant after open)
  * @vm_start:           base of per-proc address space mapped via mmap
  * @buffers:            list of all buffers for this proc
@@ -105,7 +105,7 @@ static inline struct list_head *page_to_lru(struct page *p)
  * struct binder_buffer objects used to track the user buffers
  */
 struct binder_alloc {
-	struct mutex mutex;
+	spinlock_t lock;
 	struct mm_struct *mm;
 	unsigned long vm_start;
 	struct list_head buffers;
@@ -156,7 +156,7 @@ void binder_alloc_print_pages(struct seq_file *m,
 static inline size_t
 binder_alloc_get_free_async_space(struct binder_alloc *alloc)
 {
-	guard(mutex)(&alloc->mutex);
+	guard(spinlock)(&alloc->lock);
 	return alloc->free_async_space;
 }
 
-- 
2.34.1

