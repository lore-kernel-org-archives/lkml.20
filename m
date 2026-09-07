Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72731427FBE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786075; cv=none; b=lR6/8ohTHd0/U0Xi/NxlqHHm5l0sstGunSx4+D7JW744FfIJiEDCxPv4BCLqS9bTr6swAl/RoYWuky3W+E8Hj2+LDJT/vOH677LqY1xWm4e+r5BDo9/Jo2B0g6xOrjDpz4BitJusNcLi0WdEcnIfmp1OoVKQ4IXxGxWYsn/T0qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786075; c=relaxed/simple;
	bh=5VmFGXO2THIC1ElKsZHCyDs0LOvF/2GZA7e4bXBxIwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/hxCkNl3LYhDv5edfTuc43kQFxEqeLqH+2ZnxQvaWaRQ9NqB1GurYYOvfwd4EobwLjZHa/W0CpP+6ZyFTR8rHOer7oTtZro4chgWGUsUQ5/0xmAfPW7agtJSsbJFDWtO2IEjIE8OCTGoO4/zxUqiLayBJyHENbTON6txSoVkNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMqVJpf2; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMqVJpf2"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39682983a0fso3782948a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786059; x=1789390859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ki0AfBSXcv6Q8Gg3qCdHGcmsARPRfMTEXg0rBtuB2Ag=;
        b=eMqVJpf2YoF0ecBO86VWd2NXOVwEmV2HS8M4bWQrLwWKkB/V/VMiYghItLjKgHILoH
         pOlwVvRVeUII+oLp1eWz3brsUVHNRbrbHgt45BrzggIEqYSGYahDhrU3pC4A8qHZMJYu
         f0y5V8YTgYOm3XCiFsqnYP0G2aAD+e8XhlnOiChObB+zW54XQGIIRu2R6L0RHKXpeS3C
         8VfSVmUwOZjICDZ2ZGhQalj8stS7RuUp2yZa2FAwinefR5sWaWbE2H7CE8+G0HRCJ9B9
         hD4KquE6vGF2vafghhjLOq8ugUlHjhImyKdDwuDHtFCUA6E5b/WQKfUw8C11UxLfwJMy
         tXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786059; x=1789390859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ki0AfBSXcv6Q8Gg3qCdHGcmsARPRfMTEXg0rBtuB2Ag=;
        b=Hwd8f9rAyU9ZhYf0RQMs06yi2vY1QpAqtcTCG0voRh6F8FiHZdzMK5AqDSIgS6ILFV
         u16ErY3ePGXY5N9ba/dU3hLOCOewtMA7oHltIem9AVra9Y9nSpE4Lcz143vkdt5iE0jb
         vVtoYIY7FN/1yJFqOjeRlVVojz0ZVOaLErMRSfDoKb109Y0kvcU4yz2hLhWYLpaTwkYY
         8jGt7Ajz8k8f+j28U66uRE4Oy8Omla8uKPpwhv5v812PVBZTZmhp5XX9gAV6I2rPGMBf
         ZZsip19b5ek7n2fRL2D+ZbfT4kEon7+PJTDZiwivJjz5z2B4L3EhkLf9pmHEA1rSe+cf
         0XQg==
X-Forwarded-Encrypted: i=1; AKwUvBwpUYAG7xzVj8dRiGB74MWgo93bwiOgdzjDg04dmSUwk1iVHHQH6mmrBINd7kanqkBlQHeQKQfqQQ4l9xY=@vger.kernel.org
X-Gm-Message-State: AFuF++nAilHCEVi8rsVD0c/MhmFAjWLlTLr7Q4ZLw2BZDuz6ysqYeLcG
	fSLck40TxJvedI0kU/Cu6VlTVIKNhaP2RJtWN3enrqnJQG2ZWdiNRSav
X-Gm-Gg: AYBFou3YD8NmI6eogHEHYoFghnqrmOxLvZlTn7bbIsxf7a3pg1lMViOUEI/bjSvbn5G
	BOTKNjr5aJzuLmKL7Ix87EReLJ4r8b4+O7QOKlInG4VYlDqJES6/GOyBHZTY0M8eyixor7JlIpj
	VwE1XsIYRJV7USQPpoAM+deTbk5NLZwJblv6RvaVJUvQiVWaxN4OnFr7eI5sADdQ2Xdlo4pnWOR
	+f4bQUeI6Ox4AeMrlmMWjN6WiYQdkHsYeEiG4RMv7Iz11/ryJ2c/CioDBuHrqEzPfPn5DCQUnLa
	cQxakqGLFhhGkk4R1T5vUqvKsiMKWyvVfq/qjYpU+K0GCnyMZIFwcqNx0UAf9XM6fPAzxwp0SrZ
	ryAgdSRjcwI45MJKTi5xcefby0g5RgpI58+P243HV6+yBk4T1ak2JhXhkEYDohrkJOfxUmTgACb
	WJI2mvXN9a76OVhIz/paKQc0Y4ExAoJ6U9B0tjNYe/przbUxgX8VfbxLOvidButdKiABKdqZqS4
	tZPgHSzGojjChdWIg==
X-Received: by 2002:a17:90b:538b:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-39b261d5148mr33552829a91.13.1788786059283;
        Mon, 07 Sep 2026 06:00:59 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae62a54f6sm10916296a91.1.2026.09.07.06.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:58 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
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
	Bo Zhang <zhangbo0325@gmail.com>,
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [RFC PATCH v4 1/2] binder: switch alloc->mutex to spinlock for buffer metadata
Date: Mon,  7 Sep 2026 21:00:27 +0800
Message-Id: <20260907130028.807366-2-zhangbo0325@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907130028.807366-1-zhangbo0325@gmail.com>
References: <20260907130028.807366-1-zhangbo0325@gmail.com>
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

