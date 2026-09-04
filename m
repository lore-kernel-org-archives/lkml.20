Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E53480DE8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519925; cv=none; b=M8aCzHR+BsA/AINjRImLmd5WtF4ZbN7ANVhBWohNQGHOCVlTMQYGYnda0dR2x6PvH88NsRCkvQh6B8MHEsFyZZQ9FuPb4Bj3UblzNxxP87idYI+bZdbi9cCFZU/vaNZEIcioBX9kfhRAqeA9m8zHuvsNLYAFNA+s9wsQhoFyNy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519925; c=relaxed/simple;
	bh=rItonB3XZ4pHsKkz8KrJoaBdBViwlV5RZCVQjVbIlAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kEeVzhjLTwHEr8276It1GbNLLE7kXNmnBS+GaeVd3UgJEMe2Pav5pwlFADW6zK1ACFWI8z6QfR49oJIL79kmwigVJ4JWts1yVEbCCFqkVvZrOV5cxf9sv6YdztmlFJJygLwE8dCIqJ+pO7l0yXRj6Nw56MYswkbctn5J3T+UsZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAXi2L6l; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAXi2L6l"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso958828a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519923; x=1789124723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Go9xvhW72HCp8LdE0Td0yog+aTjZC2UsDVyW4qB8dv0=;
        b=NAXi2L6lppmfNPVUY9A/L/odQiqhGJ4lQR6grCDavp6oYSaQkZw3bjxoMancxpCtgl
         LMDiLhPutwj0pmlE+a7PtUjPPWuoWgmhfKJ+yM6mg/Y2/+zzHJrru5AlbcH1DAdG8Aax
         B3cNfWmgOh39nNK3hOfBc1v/pYNSq4W8NkIzbVEN323oH9NNiaDI7JHmOeZ+50RR7vo+
         OO4lQ0hHFU+lrpdXorp4tw5J97548ooWr0PcONDkvQR8AtKzINvjNaZPoqHYW4K0ZrM4
         W/AMvp130Ua5dp6Z9yQxFbd5HgBt1jFOy0Vs2I1JyxmOs8IBD9RO6M3Kv2iuGUbIC1XC
         JEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519923; x=1789124723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Go9xvhW72HCp8LdE0Td0yog+aTjZC2UsDVyW4qB8dv0=;
        b=JOAe3bitnjNpbgIFuSzuiSkXBTHejPy/uB0nmjvRivYZah8NW7UmgK0AblHB0uO7Mw
         O2+tl/0DxXtU7tgsdoQuqYijfPJfEZHp/+U9v7Q3pKW9b8cpDhZwkwC3Jkxm62T3EZZK
         Zy+YVzCZ5iLRKXbYRWvi3XqPq95QvpjQ7FLFQYZP4UJFnTxOIysL8hcKFekkv73en/rh
         41an0d8ac4x3CMQ6uIeT+/jRY5jfm+cE2iyF60+XAxD7aZxYOnNHBl44Bi4I7b9OEgqz
         wzyBti7N2hL0cMKen4HCWtCze9SXhtmsLXXSd9X5grqqzqP+6jeRFA6kFpbS+4xclkVR
         ylKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyxk1IGD7zNub5sD325oZG+YD02YMt5y6eYuH2b5IPKLwCqptbyjNqbrKSJNGQUOgTWrY+Q16ny57mTms=@vger.kernel.org
X-Gm-Message-State: AFuF++kxLPHTXfiFF6bCjmeVFILswY4oAmO91NcAaqArfRjwvzamPcG8
	ZmXdUlApxw8siAMMxBi8ehS3TGgv6+/BfQKWRu+85j6TmiYcWAHbIAgH
X-Gm-Gg: AYBFou0bC8+M9TT6bUJGYviP516c5Ly3/4QBoZnRbACAuCWiHclji0tNqBLxivrApb5
	rPGpPH8Q7iR+ei9db/Cn0yXBpiPVIQ6UfEv/aRASgsRNISAezKHr3lUkEC65hiCSbx3wmSyEU8I
	o79mmCjsARZyeZg/LuWvl8QzPk1N6m6rBq4Iz4BlNZYZXXLAi/lZbMj4fuGTxE28f9Ta3DM326E
	5vyrM+q61HDqLLwdYk9GzVua5u1wtOsG+LU/rQcdDN2trrmC8faqoL4/8TJNCV7obBa2eo93Oc1
	JfTXdW2HIchZikLpGUqm+HB9+w1pBjmo06Sgvi1HVY5AqwM2xpuA4fq/eTlbu+SdHLJgN4X8sLt
	jTfKCml9rMo+fk4rFGKWxrwSXi9SxacUPs8cw8v5eRulLWAV05Be10WzAxQ+gilQ+KuQ1yX0bSi
	Q30ZoQJvk7wwgpT0WyFLNfzD2d6rIrq3h1/uMwYWg+WPT8UtT1vRSziTW8x9KKsjJ6PL7ZUfK/6
	Ovnl8A=
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr9190496a91.16.1788519923104;
        Fri, 04 Sep 2026 04:05:23 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm3951145a91.8.2026.09.04.04.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:05:22 -0700 (PDT)
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
	Bo Zhang <zhangbo56@xiaomi.com>
Subject: [RFC PATCH v3 1/2] binder: switch alloc->mutex to spinlock for buffer metadata
Date: Fri,  4 Sep 2026 19:04:47 +0800
Message-Id: <20260904110448.23086-2-zhangbo0325@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904110448.23086-1-zhangbo0325@gmail.com>
References: <20260904110448.23086-1-zhangbo0325@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bo Zhang <zhangbo56@xiaomi.com>

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

