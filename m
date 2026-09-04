Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDFD480DE8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519931; cv=none; b=fawrGHAMT6TSW3sSuTiKr6ldSk2ZQLfhUGSGcFnyRAIixskpKCOWQGUHqY3xfSe8nDnVs13tDIzZrOUGYbbt0NTD47LUN9MctTVViLZXLDgXLZHlhbYF9U1enXGasiApKNmmQw8Ru8tQzNZMt/jiCR8uLrx1AqOxCptcucW2UAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519931; c=relaxed/simple;
	bh=nZsmx7FC9fi69o3Ztgu8R9IK5zRHEqH458HU9/J3m7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sts1JK8MWe7oc0IRiphlhbRMH3/GsLSmVj6zkGtasW7pqz3liLljHWq7DKDvu19b7Y51e5w9aoxdecNKLEQ9t3VDm4bVpg5rhdnVkEmFHQpGk8GXLP0ZN2JjqqY2hCdGXDk9WMlqbxmB9P6a4YDkhqaXPDgQxRs+qm29UWX7iPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P330i2u7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P330i2u7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf452def93so18860325ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519929; x=1789124729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4sLv0qA+zU7iFGsyox/gHVsMLtpzuumWMznYIGPYBw=;
        b=P330i2u73IcBdOqNppHkKTYUgpsuAQ5f1fxMFB70nYATOVnQot6KM263TU0rVHF2+w
         SrZjHgWKYfhaAqp3r6i6y6ZFA86FULEQ7DM0XtCgVGfT4sD5NSBRB1nFGw26D6OpjA/2
         uAES0eOSE5/mnBHoww7GoOYkA111GSEGRCv+Cu0jTWTxJgwBUP1OwY+3rxgAXW7jzdpM
         cRlyujHxIbGH0zkSfsPtFwGZwyr4oO7bZHCskfhCO0fvs/KnNti6eJEMrkWCAub3+V/J
         ruT0v4zgLmf3EzA1/kP39lUVm5fano3VGsas/3fb8wyk48/V8wBdoa25fypUH3sxjhsC
         Bbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519929; x=1789124729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q4sLv0qA+zU7iFGsyox/gHVsMLtpzuumWMznYIGPYBw=;
        b=rnsJoeoc6tdvKXjEV14A89+gCC3pJJm9phT3+wis+KGwty++OpSACi8ja6Ohp7HU2Z
         QLqTqaYpu3LynjjHtj5qKTGxKG2tqfo69Y8iW5tFOgkYY5z/+FgeFUzDHIz3gEPfPZCB
         cN5ENrmg8cyAkKbV1Qs0/TCP1OnYEIjVNzuFY0ZKty0aFU0v12G/3uSRMmo9TufENYnY
         DqxtKXyjMVe6lSVBq2ezhyvDpo+9//Qr+KKAwjzJdk5NazE9jWZOAzbxsEk7HfIQwEgY
         FWAna72MkmHlL4xfAXAnoFmVmjWT4TqDmeE1ZwgeTB1+6cNiQ6XVE3Sn1gCfY56kquIx
         33Kw==
X-Forwarded-Encrypted: i=1; AKwUvBz+WUPmd2FHIQThvYpwlAODCnQqfnvMk/cHVnE4y+hJwGsNAWe6V2a5T1tdgstXtk9q+43cZNDhnFizPkU=@vger.kernel.org
X-Gm-Message-State: AFuF++kN3fw1R7vuiUNkT+TRwkZP6MfAX3pfWcg36NceX4keSibLgwpl
	FBIP3oCu0EDuy9Bc2S7Oidot+oOUqUOHTWjs8/r3KHDFS/dSChnGPjYs
X-Gm-Gg: AYBFou1iWGiIf51/31taVam/oEUBnKGVs4XNR2E6WI1JrH6AJt3uDzYWC81sFZQI6Rh
	pHKFBJtUo+GM56zWvxEMbW/eOsdx+BZ/u9G+GqEYVjFzKRLLtLA7vHnMAnYQlapzrrc1Zm9CHtU
	r4HLf0OxLLpPX6GDKMNQfbFSGNvcyRvEhoxIfqWqzOlw6YCVsKTYjMuA2vd1nXW+vC1ZZUQQMtd
	b3erEZBzva1wrFZnZRsGQbqA4kWi8bR/D6kLF09YIftj+ZWSRGL+L9uQbSlGR1WVkUEcn3CHi2P
	+3FqmhinGOnQhn8EH8KuAeMt6vpu4qYXrG/d0sz4lpz6RwyOJqxiy0So1ElPmcDBVsGPSciwLij
	ZijpDyRHeTdDeQRzxw29tckKpi1mReqFD+UGms9uRGaA4geUaJs4YtbRRhK5n5BoDHShabD7cJj
	RQgFhdEpBYHbqSI92qXNO8s2QYNOG+9M5YsgLTz7wykwQkutZ04qXGBoQjNbJIAOnvlRJndJRFE
	k2znQc=
X-Received: by 2002:a17:90b:4c09:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-39b27d7894cmr3198730a91.11.1788519928682;
        Fri, 04 Sep 2026 04:05:28 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260f64ecsm3951145a91.8.2026.09.04.04.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:05:28 -0700 (PDT)
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
Subject: [RFC PATCH v3 2/2] binder: add install_mutex to serialize page install and shrinker zap
Date: Fri,  4 Sep 2026 19:04:48 +0800
Message-Id: <20260904110448.23086-3-zhangbo0325@gmail.com>
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

The previous patch converted alloc->mutex to a spinlock for the hot
path (buffer alloc/free). However, this leaves page installation and
shrinker's zap_vma_range() unserialized, which can cause use-after-free
as identified by Alice Ryhl.

Add a separate install_mutex to serialize page installation against
the shrinker's page reclaim (pages[index]=NULL + zap_vma_range). This
mutex is only contended on the cold path when pages need to be installed
or reclaimed, not on the hot path.

Key changes:

- binder_install_single_page() holds install_mutex across the entire
  install sequence, eliminating the need for binder_page_lookup() (GUP)
  since concurrent installers are now serialized.

- The shrinker holds install_mutex across pages[index]=NULL and
  zap_vma_range(), making them atomic to the install side.

- binder_lru_freelist_del() returns -EAGAIN when list_lru_del() fails
  (shrinker already isolated the page). Any pages already removed from
  the LRU are rolled back, and if the free buffer was split, the split
  is undone (rb_erase + list_del). The caller in binder_alloc_new_buf()
  reallocates the preallocated buffer on each attempt, so a freed
  pointer is never reused.

- To avoid an ABBA deadlock (the shrinker takes mmap_lock before
  install_mutex, while the install side takes install_mutex first),
  binder_page_insert() uses mmap_read_trylock() in its fallback path
  and returns -EAGAIN on contention. The caller drops install_mutex and
  waits for mmap_lock without holding any binder lock before retrying,
  so the install side never blocks on mmap_lock under install_mutex.

- Under install_mutex the PTE cannot already be populated, so an
  unexpected -EBUSY from vm_insert_page() is treated as an error rather
  than retried, avoiding any risk of looping.

Performance (binderThroughputTest, Qualcomm SM8850, 2 workers, 10 runs)
under concurrent drop_caches shows no regression from the install_mutex:

                    mutex (baseline)    spinlock + install_mutex
  throughput:    27k-59k iter/s       85k-89k iter/s
  average:       0.031-0.068ms        0.021-0.022ms
  P99:           0.088-0.148ms        0.046-0.056ms

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
 drivers/android/binder_alloc.c | 108 ++++++++++++++++++++++++++-------
 drivers/android/binder_alloc.h |   3 +
 2 files changed, 90 insertions(+), 21 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index 9775df3616aa..bbef44cc30d4 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -268,8 +268,13 @@ static int binder_page_insert(struct binder_alloc *alloc,
 		return ret;
 	}
 
-	/* fall back to mmap_lock */
-	mmap_read_lock(mm);
+	/*
+	 * Fall back to mmap_lock. Use trylock to avoid blocking under
+	 * install_mutex, which could deadlock against the shrinker (it
+	 * takes mmap_lock before install_mutex). Retry on contention.
+	 */
+	if (!mmap_read_trylock(mm))
+		return -EAGAIN;
 	vma = vma_lookup(mm, addr);
 	if (vma && binder_alloc_is_mapped(alloc))
 		ret = vm_insert_page(vma, addr, page);
@@ -325,24 +330,36 @@ static int binder_install_single_page(struct binder_alloc *alloc,
 		goto out;
 	}
 
+	mutex_lock(&alloc->install_mutex);
+
+	/* Check again under install_mutex */
+	if (binder_get_installed_page(alloc, index)) {
+		mutex_unlock(&alloc->install_mutex);
+		binder_free_page(page);
+		ret = 0;
+		goto out;
+	}
+
 	ret = binder_page_insert(alloc, addr, page);
 	switch (ret) {
+	case -EAGAIN:
+		/* mmap_lock contended; drop install_mutex and retry */
+		binder_free_page(page);
+		mutex_unlock(&alloc->install_mutex);
+		goto out;
 	case -EBUSY:
 		/*
-		 * EBUSY is ok. Someone installed the pte first but the
-		 * alloc->pages[index] has not been updated yet. Discard
-		 * our page and look up the one already installed.
+		 * install_mutex serializes page installation against the
+		 * shrinker's zap, so the PTE should never be already
+		 * populated here. If it somehow is (e.g. populated
+		 * externally), fail rather than retry to avoid looping.
 		 */
-		ret = 0;
 		binder_free_page(page);
-		page = binder_page_lookup(alloc, addr);
-		if (!page) {
-			pr_err("%d: failed to find page at offset %lx\n",
-			       alloc->pid, addr - alloc->vm_start);
-			ret = -ESRCH;
-			break;
-		}
-		fallthrough;
+		mutex_unlock(&alloc->install_mutex);
+		pr_err("%d: %s unexpected EBUSY at offset %lx\n",
+		       alloc->pid, __func__, addr - alloc->vm_start);
+		ret = -ENOMEM;
+		goto out;
 	case 0:
 		/* Mark page installation complete and safe to use */
 		binder_set_installed_page(alloc, index, page);
@@ -353,6 +370,8 @@ static int binder_install_single_page(struct binder_alloc *alloc,
 		       alloc->pid, __func__, addr - alloc->vm_start, ret);
 		break;
 	}
+
+	mutex_unlock(&alloc->install_mutex);
 out:
 	mmput_async(alloc->mm);
 	return ret;
@@ -377,8 +396,21 @@ static int binder_install_buffer_pages(struct binder_alloc *alloc,
 			continue;
 
 		trace_binder_alloc_page_start(alloc, index);
-
+retry:
 		ret = binder_install_single_page(alloc, index, page_addr);
+		if (ret == -EAGAIN) {
+			/*
+			 * Wait for mmap_lock to become free before retrying,
+			 * to avoid busy-looping. Safe here as no binder lock
+			 * is held.
+			 */
+			if (mmget_not_zero(alloc->mm)) {
+				mmap_read_lock(alloc->mm);
+				mmap_read_unlock(alloc->mm);
+				mmput_async(alloc->mm);
+			}
+			goto retry;
+		}
 		if (ret)
 			return ret;
 
@@ -389,7 +421,7 @@ static int binder_install_buffer_pages(struct binder_alloc *alloc,
 }
 
 /* The range of pages should exclude those shared with other buffers */
-static void binder_lru_freelist_del(struct binder_alloc *alloc,
+static int binder_lru_freelist_del(struct binder_alloc *alloc,
 				    unsigned long start, unsigned long end)
 {
 	unsigned long page_addr;
@@ -411,7 +443,16 @@ static void binder_lru_freelist_del(struct binder_alloc *alloc,
 					      page_to_lru(page),
 					      page_to_nid(page),
 					      NULL);
-			WARN_ON(!on_lru);
+			/*
+			 * If !on_lru, the shrinker has already isolated this
+			 * page and will reclaim it. Abort so the caller can
+			 * retry after the shrinker finishes.
+			 */
+			if (!on_lru) {
+				/* Rollback pages already removed from LRU */
+				binder_lru_freelist_add(alloc, start, page_addr);
+				return -EAGAIN;
+			}
 
 			trace_binder_alloc_lru_end(alloc, index);
 			continue;
@@ -420,6 +461,8 @@ static void binder_lru_freelist_del(struct binder_alloc *alloc,
 		if (index + 1 > alloc->pages_high)
 			alloc->pages_high = index + 1;
 	}
+
+	return 0;
 }
 
 static void debug_no_space_locked(struct binder_alloc *alloc)
@@ -521,6 +564,7 @@ static struct binder_buffer *binder_alloc_new_buf_locked(
 	struct rb_node *n = alloc->free_buffers.rb_node;
 	struct rb_node *best_fit = NULL;
 	struct binder_buffer *buffer;
+	struct binder_buffer *split_buffer = NULL;
 	unsigned long next_used_page;
 	unsigned long curr_last_page;
 	size_t buffer_size;
@@ -568,6 +612,7 @@ static struct binder_buffer *binder_alloc_new_buf_locked(
 		list_add(&new_buffer->entry, &buffer->entry);
 		new_buffer->free = 1;
 		binder_insert_free_buffer(alloc, new_buffer);
+		split_buffer = new_buffer;
 		new_buffer = NULL;
 	}
 
@@ -583,8 +628,17 @@ static struct binder_buffer *binder_alloc_new_buf_locked(
 	 */
 	next_used_page = (buffer->user_data + buffer_size) & PAGE_MASK;
 	curr_last_page = PAGE_ALIGN(buffer->user_data + size);
-	binder_lru_freelist_del(alloc, PAGE_ALIGN(buffer->user_data),
-				min(next_used_page, curr_last_page));
+	if (binder_lru_freelist_del(alloc, PAGE_ALIGN(buffer->user_data),
+				min(next_used_page, curr_last_page))) {
+		/* Shrinker is reclaiming a page; undo the split and retry */
+		if (split_buffer) {
+			rb_erase(&split_buffer->rb_node, &alloc->free_buffers);
+			list_del(&split_buffer->entry);
+			new_buffer = split_buffer;
+		}
+		buffer = ERR_PTR(-EAGAIN);
+		goto out;
+	}
 
 	rb_erase(&buffer->rb_node, &alloc->free_buffers);
 	buffer->free = 0;
@@ -671,7 +725,8 @@ struct binder_buffer *binder_alloc_new_buf(struct binder_alloc *alloc,
 		return ERR_PTR(-EINVAL);
 	}
 
-	/* Preallocate the next buffer */
+	/* Preallocate the next buffer; (re)allocate on each attempt */
+retry:
 	next = kzalloc_obj(*next);
 	if (!next)
 		return ERR_PTR(-ENOMEM);
@@ -680,6 +735,12 @@ struct binder_buffer *binder_alloc_new_buf(struct binder_alloc *alloc,
 	buffer = binder_alloc_new_buf_locked(alloc, next, size, is_async);
 	if (IS_ERR(buffer)) {
 		spin_unlock(&alloc->lock);
+		if (PTR_ERR(buffer) == -EAGAIN) {
+			/* wait for the shrinker to finish, then retry */
+			mutex_lock(&alloc->install_mutex);
+			mutex_unlock(&alloc->install_mutex);
+			goto retry;
+		}
 		goto out;
 	}
 
@@ -1175,7 +1236,6 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 	trace_binder_unmap_kernel_start(alloc, index);
 
 	page_to_free = alloc->pages[index];
-	binder_set_installed_page(alloc, index, NULL);
 
 	trace_binder_unmap_kernel_end(alloc, index);
 
@@ -1183,6 +1243,9 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 	spin_unlock(&alloc->lock);
 	spin_unlock(&lru->lock);
 
+	mutex_lock(&alloc->install_mutex);
+	binder_set_installed_page(alloc, index, NULL);
+
 	if (vma) {
 		trace_binder_unmap_user_start(alloc, index);
 
@@ -1191,6 +1254,8 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 		trace_binder_unmap_user_end(alloc, index);
 	}
 
+	mutex_unlock(&alloc->install_mutex);
+
 	if (mm_locked)
 		mmap_read_unlock(mm);
 	else
@@ -1236,6 +1301,7 @@ VISIBLE_IF_KUNIT void __binder_alloc_init(struct binder_alloc *alloc,
 	alloc->mm = current->mm;
 	mmgrab(alloc->mm);
 	spin_lock_init(&alloc->lock);
+	mutex_init(&alloc->install_mutex);
 	INIT_LIST_HEAD(&alloc->buffers);
 	alloc->freelist = freelist;
 }
diff --git a/drivers/android/binder_alloc.h b/drivers/android/binder_alloc.h
index bea5a77bb6da..85817efdbef6 100644
--- a/drivers/android/binder_alloc.h
+++ b/drivers/android/binder_alloc.h
@@ -9,6 +9,7 @@
 #include <linux/rbtree.h>
 #include <linux/list.h>
 #include <linux/mm.h>
+#include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/vmalloc.h>
 #include <linux/slab.h>
@@ -81,6 +82,7 @@ static inline struct list_head *page_to_lru(struct page *p)
 /**
  * struct binder_alloc - per-binder proc state for binder allocator
  * @lock:               protects binder_alloc fields
+ * @install_mutex:      serializes page installation and shrinker zap
  * @mm:                 copy of task->mm (invariant after open)
  * @vm_start:           base of per-proc address space mapped via mmap
  * @buffers:            list of all buffers for this proc
@@ -106,6 +108,7 @@ static inline struct list_head *page_to_lru(struct page *p)
  */
 struct binder_alloc {
 	spinlock_t lock;
+	struct mutex install_mutex;
 	struct mm_struct *mm;
 	unsigned long vm_start;
 	struct list_head buffers;
-- 
2.34.1

