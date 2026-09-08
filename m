Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929C055C1B9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879561; cv=none; b=fOIIr0MgHYSbzBSK/Tom3Dp/Hx2V4xDHEmPY8J3TnrCb2Gk/s/F6p4Jj9dvqOI5f2y4jm7aZat+50VaYyYUqShdhzJTDctsWqNTNv8WP9hI4Yx62cVWDXIYwfz/RV7X+2RyQS7d2r4dN4E8RgoteQ2TFGQUrQLR06nhDKCJ3hBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879561; c=relaxed/simple;
	bh=l7egi5UjJ2To5I2KIwcpO28ZjBbiPnd1kJK4z01fOyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fmmvUMPctzFS3686iktVySEML3PZIZ3A+zRueWiNipBTfDKCPM44Qc4kl79dCoRlduEzH/2b5y8xS2DMLhtpryeI+hsreRG4YgV2mVsDHAfijPnV0TEw3zxmtPWezwXryjZ6ksUhFLxnwTZ8bhI6/25zkUU57UD9ZtpyaU4Q7XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuwEwX0C; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuwEwX0C"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so380042a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788879542; x=1789484342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y660mH1fstS8jeOSvAcT1QO85azY27kGYaHvsI2L+cE=;
        b=BuwEwX0CyCFv5VASicbFivZdgbYHKPzTGZO8okpWKNgDyw+iczCMzmo+1ogPc2QWQR
         J7kgGVTdZYB98tnvmEvYJ1P7tqkwojCt/CdS9aNdJxE+IQ2t+JLVer/HVrv5F8Qdme29
         v2cRFVVOW7nGXAYVLCDUNFUTPTuevs55CL6gtZPqFpqzbxgNszZsdU4GuG1NCSmYDizT
         9F1m7FPWEr9HfNH0dzDzBdP8XlApsl+8PI/yS0H+bxyG6ayxTEbT9kCzVjpqCkUy4cxk
         0e49lqEwi0DtQpvHLjU3dQgIhXsVnCtybEY9yHEoI5TYUPPXhlK8UbXSdQcjzYtfT+Bi
         XUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879542; x=1789484342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y660mH1fstS8jeOSvAcT1QO85azY27kGYaHvsI2L+cE=;
        b=RHfLe43lSQIc56FmIvnWjhfgT095x06T8hlM7th5KbxYLAC39rEZgyncDa83DnWzg4
         Toy7WdiYzQmN+IbcT5h4tERCEg8JHpW4dxSN4t0AWM9lYt9wwn7809+iHMgod1DicYL8
         PdVginI5L1u1abmvH/mtgfLBybt34kNwy9Z60yCLclJpEsd95NaoXm4l8sajHISQX9JB
         drSN2oD3kX38LehByLJbqLWXgQ/7//zx74k1reNPdrnlf5MbCa+MmP99JxZ0CxOBR9XM
         5ObiAqfWe+uVrV2lQeT59JRg6vv7FM8+fRgHrOilfEJRhHAD0gguWCnqBmEljOdbuxAn
         s2SQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhUght6vH43WKkHn1j5C63hZwQwHBbt5TfXZo/uGahaNHnYeBUjShAJ5wT9AY3tHP7h8KoV2iiKZAg3Ko=@vger.kernel.org
X-Gm-Message-State: AFuF++liT8A+17HK0j4DhZfWVuoB7zEqSWT8DBBGjv6FvUstx7E47/J+
	PtRerOc4Kk3eAWmOHkzAC0UU4tjFQieLVGQJOkVNrj5kRTlFUuQydy8f
X-Gm-Gg: AYBFou2vLAm5iWWxs/QS4xiVgLdfUjofoeeNwt7f8dnBCpzXDwIxFWKWwPJQvpcgWP7
	D9VlOQhyWk7tF8ziCS7d+YCLKp1/OtDhP9tYKizVKdQudA484HSMXzN4Jj2xeTLfaaZ8zwcxzeK
	OX3xRp2GKUTd1QrHjKOZG4hm348c35548NdfNM+khwCERoqhLWsE/dMTFcPSpa92L0MfRJnMul1
	hFe3ReXUzvR9cFZH0yK42S3CwIsnRs7fPpvu00wNZTjoGWblag29pqtgojjbUZNSh/icghA8lXz
	i11bBlr4el8TaKYS0YxO7VkjPH47fcgQrn+lnEmls0FEObt4Uj75dBowAUpYU8b42hmuFcMZX/h
	gBMjia/IWxQfZDVeGwpLMMADb8GzvE/RuRcZ7+c/s9vV5YGMJ74epGvkR2jR8gBzIhfDt9amGc8
	AtCk/FDa5vrB97jqTLWVUG82OFoUP4tAHEl9jAKl04f9mK2bpb2M3Cg87HSpRh5oxmfnzpufgz8
	7JggOA=
X-Received: by 2002:a17:90b:4b06:b0:398:9bd3:d6d6 with SMTP id 98e67ed59e1d1-39b8bf67006mr6125806a91.16.1788879541422;
        Tue, 08 Sep 2026 07:59:01 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm27018724a91.8.2026.09.08.07.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:59:01 -0700 (PDT)
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
Subject: [RFC PATCH v5] binder: switch alloc->mutex to a spinlock plus install_mutex
Date: Tue,  8 Sep 2026 22:58:54 +0800
Message-Id: <20260908145854.1130776-1-zhangbo0325@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Split the lock into two with distinct roles:

- alloc->lock (spinlock) exclusively owns the non-sleeping metadata:
  pages[], the LRU list, the rb-trees and free_async_space. This is the
  hot path hit on every transaction, so removing the sleeping lock here
  eliminates the priority inversion.

- install_mutex only serializes the sleeping PTE operations for a given
  alloc: page installation's vm_insert_page() against the shrinker's
  zap_vma_range().

pages[] and the LRU are always updated together under alloc->lock, so
binder_lru_freelist_del() always observes a consistent state.

The shrinker takes install_mutex with mutex_trylock() and skips the page
on failure: the install side may hold install_mutex while vm_insert_page()
recurses into reclaim and re-enters this shrinker on the same thread, so a
blocking acquire would self-deadlock. trylock also avoids an ABBA cycle
with mmap_lock.

binder_alloc_deferred_release() drops alloc->lock around the clear-on-free
memset and binder_free_page() so preemption is not disabled across the
whole cleanup, and takes install_mutex to wait for an in-flight shrinker
(which still touches the alloc after dropping alloc->lock) before freeing
it.

Performance (binderThroughputTest, Qualcomm SM8850, 2 workers, 10 runs)
under concurrent drop_caches:

                    mutex (baseline)    spinlock + install_mutex
  throughput:    27k-59k iter/s       84k-89k iter/s
  average:       0.031-0.068ms        0.021-0.022ms
  P99:           0.088-0.148ms        0.046-0.058ms

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
Tested on Qualcomm SM8850 with KASAN (HW_TAGS), PROVE_LOCKING and
DEBUG_ATOMIC_SLEEP enabled, under concurrent drop_caches, with no
warnings.

Changes since v4:
- Fold the two patches into one. v4 patch 1 (spinlock only) has two
  regressions that can only be fixed with the install_mutex from patch 2,
  so it was never correct on its own (Sashiko).
- binder_alloc_deferred_release() no longer holds the spinlock across
  the clear-on-free memset and binder_free_page(); it drops alloc->lock
  around them so preemption is not disabled for the whole cleanup, which
  under a spinlock could otherwise be triggered by unprivileged userspace
  (Sashiko).
- binder_alloc_deferred_release() takes install_mutex so it waits for an
  in-flight shrinker (which accesses the alloc after dropping alloc->lock)
  before freeing the alloc, closing a use-after-free (Sashiko).

Changes since v3:
- Fix an AA self-deadlock: the shrinker uses mutex_trylock() on
  install_mutex, so install-side vm_insert_page() recursing into direct
  reclaim and re-entering the shrinker on the same thread no longer
  deadlocks (Sashiko).
- Fix a use-after-free: pages[index]=NULL is done under alloc->lock
  (with the LRU isolate) instead of under install_mutex (Sashiko).
- Fix an RT-task livelock: pages[] and the LRU are consistent under
  alloc->lock, so the -EAGAIN retry path is removed entirely (Sashiko).
- The mutex_trylock() also removes the ABBA concern with mmap_lock, so
  the install-side mmap_lock fallback returns to a plain blocking acquire.

Changes since v2:
- Fixed the ABBA/-EBUSY/next-buffer issues raised on v2 (superseded by
  the simpler locking above).

Changes since v1:
- Dropped the spinlock-only approach that raced install against shrinker
  zap; added install_mutex to serialize them (Alice).

v4: https://lore.kernel.org/all/20260907130028.807366-1-zhangbo0325@gmail.com/
v3: https://lore.kernel.org/all/20260904110448.23086-1-zhangbo0325@gmail.com/
v2: https://lore.kernel.org/all/20260831123545.3655557-1-zhangbo56@xiaomi.com/
v1: https://lore.kernel.org/all/20260805152752.1924434-1-zhangbo56@xiaomi.com/

 drivers/android/binder_alloc.c | 107 ++++++++++++++++++++-------------
 drivers/android/binder_alloc.h |  11 ++--
 2 files changed, 73 insertions(+), 45 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index e4488ad86a65..644a9d81e1ed 100644
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
 
@@ -325,34 +325,34 @@ static int binder_install_single_page(struct binder_alloc *alloc,
 		goto out;
 	}
 
-	ret = binder_page_insert(alloc, addr, page);
-	switch (ret) {
-	case -EBUSY:
-		/*
-		 * EBUSY is ok. Someone installed the pte first but the
-		 * alloc->pages[index] has not been updated yet. Discard
-		 * our page and look up the one already installed.
-		 */
-		ret = 0;
+	mutex_lock(&alloc->install_mutex);
+
+	/* Someone may have installed it already; check under alloc->lock */
+	spin_lock(&alloc->lock);
+	if (binder_get_installed_page(alloc, index)) {
+		spin_unlock(&alloc->lock);
+		mutex_unlock(&alloc->install_mutex);
 		binder_free_page(page);
-		page = binder_page_lookup(alloc, addr);
-		if (!page) {
-			pr_err("%d: failed to find page at offset %lx\n",
-			       alloc->pid, addr - alloc->vm_start);
-			ret = -ESRCH;
-			break;
-		}
-		fallthrough;
-	case 0:
-		/* Mark page installation complete and safe to use */
-		binder_set_installed_page(alloc, index, page);
-		break;
-	default:
+		ret = 0;
+		goto out;
+	}
+	spin_unlock(&alloc->lock);
+
+	ret = binder_page_insert(alloc, addr, page);
+	if (ret) {
 		binder_free_page(page);
 		pr_err("%d: %s failed to insert page at offset %lx with %d\n",
 		       alloc->pid, __func__, addr - alloc->vm_start, ret);
-		break;
+		mutex_unlock(&alloc->install_mutex);
+		goto out;
 	}
+
+	/* Mark page installation complete under alloc->lock */
+	spin_lock(&alloc->lock);
+	binder_set_installed_page(alloc, index, page);
+	spin_unlock(&alloc->lock);
+
+	mutex_unlock(&alloc->install_mutex);
 out:
 	mmput_async(alloc->mm);
 	return ret;
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
 
@@ -967,7 +967,14 @@ void binder_alloc_deferred_release(struct binder_alloc *alloc)
 	struct binder_buffer *buffer;
 
 	buffers = 0;
-	mutex_lock(&alloc->mutex);
+	/*
+	 * Hold install_mutex to serialize against the shrinker, which may
+	 * access this alloc after dropping alloc->lock to zap pages. This
+	 * also keeps pages[] stable so the loops below can drop alloc->lock
+	 * for the sleeping memset and page free.
+	 */
+	mutex_lock(&alloc->install_mutex);
+	spin_lock(&alloc->lock);
 	BUG_ON(alloc->mapped);
 
 	while ((n = rb_first(&alloc->allocated_buffers))) {
@@ -977,7 +984,9 @@ void binder_alloc_deferred_release(struct binder_alloc *alloc)
 		BUG_ON(buffer->transaction);
 
 		if (buffer->clear_on_free) {
+			spin_unlock(&alloc->lock);
 			binder_alloc_clear_buf(alloc, buffer);
+			spin_lock(&alloc->lock);
 			buffer->clear_on_free = false;
 		}
 		binder_free_buf_locked(alloc, buffer);
@@ -1010,15 +1019,18 @@ void binder_alloc_deferred_release(struct binder_alloc *alloc)
 					      page_to_lru(page),
 					      page_to_nid(page),
 					      NULL);
+			spin_unlock(&alloc->lock);
 			binder_alloc_debug(BINDER_DEBUG_BUFFER_ALLOC,
 				     "%s: %d: page %d %s\n",
 				     __func__, alloc->pid, i,
 				     on_lru ? "on lru" : "active");
 			binder_free_page(page);
 			page_count++;
+			spin_lock(&alloc->lock);
 		}
 	}
-	mutex_unlock(&alloc->mutex);
+	spin_unlock(&alloc->lock);
+	mutex_unlock(&alloc->install_mutex);
 	kvfree(alloc->pages);
 	if (alloc->mm)
 		mmdrop(alloc->mm);
@@ -1043,7 +1055,7 @@ void binder_alloc_print_allocated(struct seq_file *m,
 	struct binder_buffer *buffer;
 	struct rb_node *n;
 
-	guard(mutex)(&alloc->mutex);
+	guard(spinlock)(&alloc->lock);
 	for (n = rb_first(&alloc->allocated_buffers); n; n = rb_next(n)) {
 		buffer = rb_entry(n, struct binder_buffer, rb_node);
 		seq_printf(m, "  buffer %d: %lx size %zd:%zd:%zd %s\n",
@@ -1069,7 +1081,7 @@ void binder_alloc_print_pages(struct seq_file *m,
 	int lru = 0;
 	int free = 0;
 
-	mutex_lock(&alloc->mutex);
+	spin_lock(&alloc->lock);
 	/*
 	 * Make sure the binder_alloc is fully initialized, otherwise we might
 	 * read inconsistent state.
@@ -1085,7 +1097,7 @@ void binder_alloc_print_pages(struct seq_file *m,
 				lru++;
 		}
 	}
-	mutex_unlock(&alloc->mutex);
+	spin_unlock(&alloc->lock);
 	seq_printf(m, "  pages: %d:%d:%d\n", active, lru, free);
 	seq_printf(m, "  pages high watermark: %zu\n", alloc->pages_high);
 }
@@ -1101,7 +1113,7 @@ int binder_alloc_get_allocated_count(struct binder_alloc *alloc)
 	struct rb_node *n;
 	int count = 0;
 
-	guard(mutex)(&alloc->mutex);
+	guard(spinlock)(&alloc->lock);
 	for (n = rb_first(&alloc->allocated_buffers); n != NULL; n = rb_next(n))
 		count++;
 	return count;
@@ -1161,8 +1173,16 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 		vma = vma_lookup(mm, page_addr);
 	}
 
-	if (!mutex_trylock(&alloc->mutex))
-		goto err_get_alloc_mutex_failed;
+	/*
+	 * Use trylock: the install side may hold install_mutex while its
+	 * vm_insert_page() recurses into reclaim and re-enters this shrinker
+	 * on the same thread, so blocking here would self-deadlock.
+	 */
+	if (!mutex_trylock(&alloc->install_mutex))
+		goto err_get_install_mutex_failed;
+
+	if (!spin_trylock(&alloc->lock))
+		goto err_get_alloc_lock_failed;
 
 	/*
 	 * Since a binder_alloc can only be mapped once, we ensure
@@ -1180,6 +1200,7 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 	trace_binder_unmap_kernel_end(alloc, index);
 
 	list_lru_isolate(lru, item);
+	spin_unlock(&alloc->lock);
 	spin_unlock(&lru->lock);
 
 	if (vma) {
@@ -1190,7 +1211,8 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 		trace_binder_unmap_user_end(alloc, index);
 	}
 
-	mutex_unlock(&alloc->mutex);
+	mutex_unlock(&alloc->install_mutex);
+
 	if (mm_locked)
 		mmap_read_unlock(mm);
 	else
@@ -1201,8 +1223,10 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 	return LRU_REMOVED_RETRY;
 
 err_invalid_vma:
-	mutex_unlock(&alloc->mutex);
-err_get_alloc_mutex_failed:
+	spin_unlock(&alloc->lock);
+err_get_alloc_lock_failed:
+	mutex_unlock(&alloc->install_mutex);
+err_get_install_mutex_failed:
 	if (mm_locked)
 		mmap_read_unlock(mm);
 	else
@@ -1235,7 +1259,8 @@ VISIBLE_IF_KUNIT void __binder_alloc_init(struct binder_alloc *alloc,
 	alloc->pid = current->tgid;
 	alloc->mm = current->mm;
 	mmgrab(alloc->mm);
-	mutex_init(&alloc->mutex);
+	spin_lock_init(&alloc->lock);
+	mutex_init(&alloc->install_mutex);
 	INIT_LIST_HEAD(&alloc->buffers);
 	alloc->freelist = freelist;
 }
diff --git a/drivers/android/binder_alloc.h b/drivers/android/binder_alloc.h
index d6f1f6f2d00e..85817efdbef6 100644
--- a/drivers/android/binder_alloc.h
+++ b/drivers/android/binder_alloc.h
@@ -9,7 +9,8 @@
 #include <linux/rbtree.h>
 #include <linux/list.h>
 #include <linux/mm.h>
-#include <linux/rtmutex.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/vmalloc.h>
 #include <linux/slab.h>
 #include <linux/list_lru.h>
@@ -80,7 +81,8 @@ static inline struct list_head *page_to_lru(struct page *p)
 
 /**
  * struct binder_alloc - per-binder proc state for binder allocator
- * @mutex:              protects binder_alloc fields
+ * @lock:               protects binder_alloc fields
+ * @install_mutex:      serializes page installation and shrinker zap
  * @mm:                 copy of task->mm (invariant after open)
  * @vm_start:           base of per-proc address space mapped via mmap
  * @buffers:            list of all buffers for this proc
@@ -105,7 +107,8 @@ static inline struct list_head *page_to_lru(struct page *p)
  * struct binder_buffer objects used to track the user buffers
  */
 struct binder_alloc {
-	struct mutex mutex;
+	spinlock_t lock;
+	struct mutex install_mutex;
 	struct mm_struct *mm;
 	unsigned long vm_start;
 	struct list_head buffers;
@@ -156,7 +159,7 @@ void binder_alloc_print_pages(struct seq_file *m,
 static inline size_t
 binder_alloc_get_free_async_space(struct binder_alloc *alloc)
 {
-	guard(mutex)(&alloc->mutex);
+	guard(spinlock)(&alloc->lock);
 	return alloc->free_async_space;
 }
 
-- 
2.34.1

