Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0FB40488C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179775; cv=none; b=hYz9Hy/Jxywf7B/LtHdM2PpATWU05h9f03SfnRxUeX+i1wg5EzuXSFq39IV8raJPYtvO2zXBSRc3Dv0MQ1ZswPduRjHrZVD26dF9xSNm0gQq/p4TQDD26q18ShMU+awG1m0SKe5nmg75v1NTgKnGxGnMS3Xj6vpPxb56ECqBdmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179775; c=relaxed/simple;
	bh=z1u41K9zTpZIXU2DGSA12QPcoN9jq4k/9itdE6RHE1E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c2BDZnTgCMa5Eyy00LljpedUqqWbuuYt0858rozYXYCGaKMYwp3CKJn/ILLEXNVh66Kl6gnvIMn+dBqwGuIDBMiMfZSvqeF1Hh0ZkQC1uQFXnfeQFJDT+ZwoMa1lILY3EsrrzYdOPCb4RsPJy3wffV68x0KFajb/1zMN4dg/DIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sI4FhVCI; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sI4FhVCI"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8525efa7274so2660396b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788179773; x=1788784573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbkMCUWkvn0RzElH+4v0KfQyaYSXCDSx8CHp76UBY7E=;
        b=sI4FhVCIFUE+e0ipBWv0dnOErDgMDB71CIBdp02cXCfTigmov+EhBs3wRiHba2L4ar
         9lBbbl9EmK3iyoUC9J+sZUZWj09oQz6MqYhRdEllF/6ZolyjHiCJJJ83+fZ7uH/GPOFl
         X1ur7iVYwOSXXehyEWWkECQO45qhRbDAzRPn8DwsLxYinxOUbgj40oXEECMtgRTaAw7W
         sB870kjNuNu6X5wyykqbAWaSjbM8dvuyf05tjyoKSoIKmwjUzCL6ppGIVa6g8uItV6j2
         5082z4pSN6m09rFiWfhTZlr3kq/lzFCfTigwWR6YGAQc0UpfPsqupsSg/pUNZ00O+DEA
         B8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179773; x=1788784573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qbkMCUWkvn0RzElH+4v0KfQyaYSXCDSx8CHp76UBY7E=;
        b=QJTvvgpGb21F4gWhkIi7KdQScVGrWMIgIkkgMPGbmEd/uGYsSqY23W0jm2yDNRXcK4
         lxiAItJYdAWcMQSz0xU4Bh+eV8aWtS2gsoRjQadXsEgX+cSH9FlShNdLRpmyt1GJxuwv
         taxkP7MJ4SKUjXkQn22bVqayZd1ux5GdW6c4IKW6MNdLV+7aBAyOLLCK0rek0d0n9Ej/
         4rWWS/nSaz4EnW0tfV+2iXiUsUp9VKmum1SEUG9z2TAZTbMjlnbDWfiEcDOX4/Foo9SF
         nh4ZZiPdfZV9GCIosPI99kDkpthIh9Eqph79Z982/DUByWQs8jE2wWtJ0601Keh1Z7Mj
         0QWw==
X-Forwarded-Encrypted: i=1; AHgh+Rr8RIg8V9q99pd935IoUWK791P2VOzoZ/4H2CfwVtlOaWEVoFW+oSNdpEyveAgs3iyfOS6mMK0Yg/uFZ1A=@vger.kernel.org
X-Gm-Message-State: AFuF++na/KeMJWeBJs4woaWAlGIGUqbmPG46GReC//Opbk6IWIeCQjKf
	Ju4TdXjY5oitfqIcKLjMN8pjl0NQ4IFk+qCn1XpmBLbAETASqWyX2cr1
X-Gm-Gg: AR+sD10tmrMBLHMO8GRzNzXKBckKF8lB+OmXFPCOFkwT0gKA5Ak3g9EdLo4xz4OjKGb
	jsbuaNe2eEJjzCNXS+ksCwSUtWh274GdLU8uZnBUI8QU7g+fA7n+S1oHreG/TZ4SasnQq8+kDIQ
	5CxhNPrEMZQX7o1kU+5GtlTY//lTvBwcqqPRJsDVPayEdy/8z/uEoEZEi1rP91nnubYSARPPqW9
	+LOzG2sFGfRkeyxmmms7WVLvM077+5YZrT6Sf1ZSQClSqE6OyL0j2Ou89cbBLAmPnYPjbAWbAI5
	YtQ7s006g1vmsaUlQ5yZ6dU5o0LHWfLdouI/zEq+gd+8+yyy9pnkf9xI9xeLL60bAYl2M5YFs6m
	JP+eAPOg3s7vDa52QfTeeO4s5Mx09NjTfyR/ErVOKZiu1ENVY+AIp9OZ2HIYONerJIgiTS3SP8n
	rM/yoyY+w2k5KYGIwTYvP9XSAHzmQsVcBsUyzPU3yz5gHC/6d8pqSYYEd0JiTR1cLPCQeaIwX0U
	kKGdA==
X-Received: by 2002:a05:6a00:ae0c:b0:858:6307:5f7d with SMTP id d2e1a72fcca58-858630762dcmr17701226b3a.8.1788179773325;
        Mon, 31 Aug 2026 05:36:13 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a3a7bf20sm3502474b3a.57.2026.08.31.05.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:36:13 -0700 (PDT)
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
Subject: [RFC PATCH v2 2/2] binder: add install_mutex to serialize page install and shrinker zap
Date: Mon, 31 Aug 2026 20:35:45 +0800
Message-Id: <20260831123545.3655557-3-zhangbo56@xiaomi.com>
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
  (shrinker already isolated the page), with rollback of any pages
  already removed from the LRU. The caller waits on install_mutex for
  the shrinker to finish, then retries.

- EBUSY from vm_insert_page() is handled defensively with -EAGAIN,
  though it should not occur under install_mutex serialization.

Performance with memory pressure (binderThroughputTest, SM8850,
2 workers, 10 runs, concurrent drop_caches) shows no regression
from the install_mutex:

                    mutex (baseline)    spinlock + install_mutex
  throughput:        27k-59k iter/s       81k-94k iter/s
  average:           0.031-0.068ms        0.020-0.023ms
  P99:               0.088-0.148ms        0.047-0.061ms

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
 drivers/android/binder_alloc.c | 75 ++++++++++++++++++++++++++--------
 drivers/android/binder_alloc.h |  3 ++
 2 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index 9775df3616aa..f2cc822df5f7 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -325,24 +325,28 @@ static int binder_install_single_page(struct binder_alloc *alloc,
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
 	case -EBUSY:
 		/*
-		 * EBUSY is ok. Someone installed the pte first but the
-		 * alloc->pages[index] has not been updated yet. Discard
-		 * our page and look up the one already installed.
+		 * This should not happen since install_mutex serializes
+		 * all page installations and shrinker zaps. Handle it
+		 * defensively by retrying.
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
+		ret = -EAGAIN;
+		goto out;
 	case 0:
 		/* Mark page installation complete and safe to use */
 		binder_set_installed_page(alloc, index, page);
@@ -353,6 +357,8 @@ static int binder_install_single_page(struct binder_alloc *alloc,
 		       alloc->pid, __func__, addr - alloc->vm_start, ret);
 		break;
 	}
+
+	mutex_unlock(&alloc->install_mutex);
 out:
 	mmput_async(alloc->mm);
 	return ret;
@@ -377,8 +383,10 @@ static int binder_install_buffer_pages(struct binder_alloc *alloc,
 			continue;
 
 		trace_binder_alloc_page_start(alloc, index);
-
+retry:
 		ret = binder_install_single_page(alloc, index, page_addr);
+		if (ret == -EAGAIN)
+			goto retry;
 		if (ret)
 			return ret;
 
@@ -389,7 +397,7 @@ static int binder_install_buffer_pages(struct binder_alloc *alloc,
 }
 
 /* The range of pages should exclude those shared with other buffers */
-static void binder_lru_freelist_del(struct binder_alloc *alloc,
+static int binder_lru_freelist_del(struct binder_alloc *alloc,
 				    unsigned long start, unsigned long end)
 {
 	unsigned long page_addr;
@@ -411,7 +419,16 @@ static void binder_lru_freelist_del(struct binder_alloc *alloc,
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
@@ -420,6 +437,8 @@ static void binder_lru_freelist_del(struct binder_alloc *alloc,
 		if (index + 1 > alloc->pages_high)
 			alloc->pages_high = index + 1;
 	}
+
+	return 0;
 }
 
 static void debug_no_space_locked(struct binder_alloc *alloc)
@@ -583,8 +602,12 @@ static struct binder_buffer *binder_alloc_new_buf_locked(
 	 */
 	next_used_page = (buffer->user_data + buffer_size) & PAGE_MASK;
 	curr_last_page = PAGE_ALIGN(buffer->user_data + size);
-	binder_lru_freelist_del(alloc, PAGE_ALIGN(buffer->user_data),
-				min(next_used_page, curr_last_page));
+	if (binder_lru_freelist_del(alloc, PAGE_ALIGN(buffer->user_data),
+				min(next_used_page, curr_last_page))) {
+		/* Shrinker is reclaiming a page we need. Undo and retry. */
+		buffer = ERR_PTR(-EAGAIN);
+		goto out;
+	}
 
 	rb_erase(&buffer->rb_node, &alloc->free_buffers);
 	buffer->free = 0;
@@ -676,10 +699,21 @@ struct binder_buffer *binder_alloc_new_buf(struct binder_alloc *alloc,
 	if (!next)
 		return ERR_PTR(-ENOMEM);
 
+retry:
 	spin_lock(&alloc->lock);
 	buffer = binder_alloc_new_buf_locked(alloc, next, size, is_async);
 	if (IS_ERR(buffer)) {
 		spin_unlock(&alloc->lock);
+		if (PTR_ERR(buffer) == -EAGAIN) {
+			/*
+			 * Shrinker is reclaiming a page we need.
+			 * Wait for it to finish by briefly acquiring
+			 * install_mutex, then retry.
+			 */
+			mutex_lock(&alloc->install_mutex);
+			mutex_unlock(&alloc->install_mutex);
+			goto retry;
+		}
 		goto out;
 	}
 
@@ -1175,7 +1209,6 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 	trace_binder_unmap_kernel_start(alloc, index);
 
 	page_to_free = alloc->pages[index];
-	binder_set_installed_page(alloc, index, NULL);
 
 	trace_binder_unmap_kernel_end(alloc, index);
 
@@ -1183,6 +1216,9 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 	spin_unlock(&alloc->lock);
 	spin_unlock(&lru->lock);
 
+	mutex_lock(&alloc->install_mutex);
+	binder_set_installed_page(alloc, index, NULL);
+
 	if (vma) {
 		trace_binder_unmap_user_start(alloc, index);
 
@@ -1191,6 +1227,8 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 		trace_binder_unmap_user_end(alloc, index);
 	}
 
+	mutex_unlock(&alloc->install_mutex);
+
 	if (mm_locked)
 		mmap_read_unlock(mm);
 	else
@@ -1236,6 +1274,7 @@ VISIBLE_IF_KUNIT void __binder_alloc_init(struct binder_alloc *alloc,
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

