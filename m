Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D94DF4BE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786090; cv=none; b=gyxkLn1xyOFG+pjCumYtTEO1may/Z2rMhw++gtcGH9vx9NuP6A/bwgp7nF73CW/R6zhqk6iPGmZNmqavc20mO0t3NuJUvQbGBVDzA1zGCfY0PHHZkO1GXPbbIVcwY081eK4t/5+UbWHouFjpyMAO9ZqjUUkIfwaFWNI5po5vHBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786090; c=relaxed/simple;
	bh=Uu8Er2qciH/hteunKwwIyhQ8yN2NjkOur8S+PEwmODc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hPFFYDGSQPuwgJ03quk54Yn2KyZR92Jh5GBOrC2yClqfxLSzhjLegF2DWIJAYmCNUSa2ASBfpDvVZXEFuHtZq28lBqnRslZU0hs+cSQONW7e6OFbV7Dfta258afZGUAnAxipQs7WyrsHwAzBWHaUL5GUfDLQOY7PBKstmeAJhfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOx4L+YO; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOx4L+YO"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2815892a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788786063; x=1789390863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQVw/+VqJ3DWkc1LzeHgs5adAH411wNwhFKsTiEvV6I=;
        b=BOx4L+YOhtfqeFyZOwZ5RnI4h3FqCRDXifNcSh5x+Nr5aYTb7mMFb1/xNT+ySUWP1Z
         oyuxZ0rKdhvBKECNSwpLSBOFdLfnbX6KN4P2Hbi4khOgu94TNzjxmAiZNQafigaWt051
         dpnipfq3KRNjWT2fYtTGPxm12ARQPlA50rCM6CsVESXFTuWw+YGuChQtXtXk3U7z36V4
         Kt9OurchJVDCgedStNFwsIlRGoEsBBsdKR29hXuQXbNeEor+jy/lU4Vf//rryPf+Gcmd
         FL98rn9kwvcO8Z1ibsRdjqiRJfJR0ltrhgg/2g4Hj0R4qLHevMNaThK24irs4yk2I3uN
         2zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786063; x=1789390863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uQVw/+VqJ3DWkc1LzeHgs5adAH411wNwhFKsTiEvV6I=;
        b=CYD5LRay7sXiznTSVWNksarWnHNVHMdsCXKRTpBIahNpN+fwcCPPmuFTbbq/SiAIdC
         Ag+od12X8VhK7r3+ynIEKtQ+Vn0mJlzdWSgpIZ5owECn4KQxed2lkHsX60fpZbO55g6P
         ZnBP64kr/4KNXASW8VgZrhH0GBjJbSir7CA2GQYjYDkzWbYc7+D1SRYHoGaSXGnIAMsr
         qBhqPQwIjT5LMgyRR1lfljeQtRnT8iP9CV3orASad7Dpqz21Y12ebz5rmo8ImiM7smfC
         TvpK9Y8qhtkGXcZyFgJlGNOrF9DcIfXHVKFB1HOZH+LfvQcTlWrYmHbKBh3qvxNddz2M
         z0Ig==
X-Forwarded-Encrypted: i=1; AKwUvBw9yq78P94G+FgRU0eBOcj3qjrhfEpygX8TzJd68RxdIqFRH5L4sbwvAYYFD6DMHMTh80LyK/nQBzptc5w=@vger.kernel.org
X-Gm-Message-State: AFuF++nTqOYS/CQPLTtyFIfMxO2E8hNLB/kFWtLQ8jsK+lsaYJYtiKUT
	SxaXvjvAVD82Y6AryxDJxzdUixKZfJtptWuYcHH14yFBA5Mf3vLBLJH9
X-Gm-Gg: AYBFou0hdlV/PkNszGITUMh7OS1ZFh0t6DzSzcoJxdkmsSNEEh6/HN4RZZTzVBM2iC2
	Nlbv/a6Nw9tu+uCyPHM834xFcffygGgKv0hgGydegE1deBFzYEVbxB8xZOHf1p//SoGtKUvAXt0
	SuZ7/4NtHMBCcKOV53Gl8vkLQinS13AZYu3dUOM3OgcOkHjl4DaVAGGkafEQxFEKCUbZMz+d09Y
	0BMHWWAXuCUjBv/9xv6dEbSPNkukOIHr2RRjnPgSyCiJc5WNEC1FbaQNDYMf8g51QLe+O6LR1Pi
	BhafMrTeB5mylZ/wl+LO+Wf8aTeFgJMtaBgkD8ypXZkoios9GTA5+nqyWUkfKO2Oq+xv7KpO5N0
	yvjWAMiuCFXTclgw2Da99vjk6HPgoBJqshVNC1kjreOAwcPt8EuRRHWBUTdOcnVGvT7DNve1aE0
	GiaQHdSTg1RmaahYbY19K2iAocw3ufJ3ONVVP4PSK9MevR6WuvFeSx6ENinnBU2nzz+HRq5OpKv
	hxPAT0=
X-Received: by 2002:a17:90a:15cf:b0:39b:57c6:e280 with SMTP id 98e67ed59e1d1-39b57c6e283mr8442729a91.7.1788786063170;
        Mon, 07 Sep 2026 06:01:03 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae62a54f6sm10916296a91.1.2026.09.07.06.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:01:02 -0700 (PDT)
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
Subject: [RFC PATCH v4 2/2] binder: add install_mutex to serialize page install and shrinker zap
Date: Mon,  7 Sep 2026 21:00:28 +0800
Message-Id: <20260907130028.807366-3-zhangbo0325@gmail.com>
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

The previous patch converted alloc->mutex to a spinlock for the hot
path (buffer alloc/free). However, page installation may sleep in
vm_insert_page(), and the shrinker may sleep in zap_vma_range(), so
these cannot be serialized by the spinlock. Without serialization, the
install side could observe and reuse a page that the shrinker is about
to zap and free.

Add a separate install_mutex to serialize page installation against the
shrinker's zap. The two locks have distinct roles:

- alloc->lock (spinlock) exclusively owns the non-sleeping metadata:
  pages[], the LRU list, the rb-trees and free_async_space.

- install_mutex only serializes the sleeping PTE operations
  (vm_insert_page vs zap_vma_range) for a given alloc.

pages[] and the LRU are always updated together under alloc->lock, so
binder_lru_freelist_del() always observes a consistent state.

The shrinker acquires install_mutex with mutex_trylock() and skips the
page (LRU_SKIP) on failure. This is required because the install side
may hold install_mutex while its vm_insert_page() recurses into direct
reclaim and re-enters this shrinker on the same thread; a blocking
acquire would self-deadlock. Using trylock also keeps the shrinker out
of any blocking lock cycle with mmap_lock, so the install side may take
mmap_lock while holding install_mutex without risking an ABBA deadlock.

Performance (binderThroughputTest, Qualcomm SM8850, 2 workers, 10 runs)
under concurrent drop_caches shows no regression from the install_mutex:

                    mutex (baseline)    spinlock + install_mutex
  throughput:    27k-59k iter/s       84k-89k iter/s
  average:       0.031-0.068ms        0.021-0.022ms
  P99:           0.088-0.148ms        0.046-0.056ms

Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
---
 drivers/android/binder_alloc.c | 59 +++++++++++++++++++++-------------
 drivers/android/binder_alloc.h |  3 ++
 2 files changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index 9775df3616aa..61544e3cdae1 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
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
@@ -1161,6 +1161,14 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 		vma = vma_lookup(mm, page_addr);
 	}
 
+	/*
+	 * Use trylock: the install side may hold install_mutex while its
+	 * vm_insert_page() recurses into reclaim and re-enters this shrinker
+	 * on the same thread, so blocking here would self-deadlock.
+	 */
+	if (!mutex_trylock(&alloc->install_mutex))
+		goto err_get_install_mutex_failed;
+
 	if (!spin_trylock(&alloc->lock))
 		goto err_get_alloc_lock_failed;
 
@@ -1191,6 +1199,8 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 		trace_binder_unmap_user_end(alloc, index);
 	}
 
+	mutex_unlock(&alloc->install_mutex);
+
 	if (mm_locked)
 		mmap_read_unlock(mm);
 	else
@@ -1203,6 +1213,8 @@ enum lru_status binder_alloc_free_page(struct list_head *item,
 err_invalid_vma:
 	spin_unlock(&alloc->lock);
 err_get_alloc_lock_failed:
+	mutex_unlock(&alloc->install_mutex);
+err_get_install_mutex_failed:
 	if (mm_locked)
 		mmap_read_unlock(mm);
 	else
@@ -1236,6 +1248,7 @@ VISIBLE_IF_KUNIT void __binder_alloc_init(struct binder_alloc *alloc,
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

