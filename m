Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EFF4BE454
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790812485; cv=none; b=WqLxLaw2PqxqxkImOcG9JuMsuISmuhtgSr2GEYEU5O0v7N9gmP0DvFhvJIx4uM9F0CkSi78AN07ebOEqaUuCz9+cd7NG9gOf4twUHTxpshMg2tt/2s5EVB4Z8simhAGpSVcNDCI+nswSkvTz1Mh/lmH4+aB+vKNW2ryMWa//PgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790812485; c=relaxed/simple;
	bh=kuOG2Ufw3ovYQ1DvuOUsNIojcsy4LJyDqa9YuxbkeKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUb/doIZg0rA1FlyZqTpzVj1LTcsJ4upcH2Xh/HIwt0VP3Z4pv6cgkbGbTsZ9/92hpBv6ktZvHWXVyDGKZLsOskOnTUVodHJ6WMAAdMoOKng5rq8CZvkOVi1Oes7E9uYfUuTQ5zFqGoATSlkupxtwDBKvk24T5aFAAONSUTmUHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ktfyt73F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ktfyt73F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EE01F00899;
	Wed, 30 Sep 2026 23:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790812482;
	bh=7V6HxPW35u3T18aRl4kVKV9kWmiy0G03c0FyrS7TH1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ktfyt73Fn2tSbpuvT1sGhv/9EveUfkXPwa9IAea1aF5haUSi7XyGk9XlWMbraQKBY
	 C55LiCwlla+NlvZLV7CH93w4KkjwXks9Ao1QiuZkqIgRgzo+I0bA1RNKzwwyr/DF84
	 LahjmohMnc4eg1C0jFR+92EmFi4WSpKn/AGAmYJi1gyLUpKLG3GBdzJYx+B9KwHwb2
	 Jcqo2QWwJFwWa/ukm6ISjrUx2bmOOe0lX4729SSF128cy6zS44OubOSONUiVXoKC7Y
	 8smr0NeowPEcalHwFFt1zuyL+i5XNkpPREOjEuq59DAtVsulhFPied9M88cIqFAj+m
	 BiflJ1iLyw81g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 2/2] f2fs: cache: pin cached block in f2fs_unlock_cache()
Date: Wed, 30 Sep 2026 23:54:35 +0000
Message-ID: <20260930235435.3789910-2-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930235435.3789910-1-chao@kernel.org>
References: <20260930235435.3789910-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

During asynchronous read readahead (e.g., in f2fs_ra_node_cache()), the
caller drops its own reference via f2fs_put_cache(entry, false) immediately
after issuing the read bio, leaving only the radix tree holding an active
reference during I/O flight.

In f2fs_unlock_cache(), clear_and_wake_up_bit() executes two steps:
1. clear_bit_unlock(F2FS_BLOCK_LOCKED, &entry->state): clears the bit.
2. wake_up_bit(&entry->state, F2FS_BLOCK_LOCKED): hashes &entry->state
   to find the waitqueue and wake sleeping waiters.

Once step 1 clears the bit, a concurrent waiter in f2fs_lock_cache()
(such as in f2fs_truncate_cache() or f2fs_drop_cache()) is immediately
unblocked. The waiter can acquire the lock, delete the entry from the
radix tree, drop the remaining reference, and kfree() the entry before
step 2 completes. This causes wake_up_bit() to dereference freed memory:

CPU 0 (Read I/O completion)         CPU 1 (f2fs_drop_cache / Truncation)
- f2fs_cache_read_end_io()
 - f2fs_unlock_cache(entry)
  - clear_and_wake_up_bit()
   - clear_bit_unlock(LOCKED)
   : bit is cleared!
                                    - f2fs_lock_cache(entry)
                                    : acquires lock!
                                    - f2fs_truncate_locked_cache(entry)
                                     - radix_tree_delete(&cache->root, ...)
                                     - entry->cache = NULL;
                                     - atomic_dec(&entry->refcount);
                                    - f2fs_unlock_cache(entry);
                                    - f2fs_put_cache(entry, false);
                                     - atomic_dec_and_test(&refcount) == 0
                                     - f2fs_do_free_cache(entry)
                                      - kfree(entry->data);
                                      - kfree(entry); <--- FREED!
   - smp_mb__after_atomic()
   - wake_up_bit(&entry->state, ...)
   : Dereferences &entry->state on freed entry! (UAF)

Like commit ("f2fs: cache: pin cached block in f2fs_end_cache_writeback()"),
acquire a temporary reference via f2fs_cache_get() before clear_and_wake_up_bit()
and release it with f2fs_cache_put() once wake_up_bit() completes.

This fixes commit 399410a90ca7 ("f2fs: cache: implement metadata cache")

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 7831e53f5678..04b5408cbc58 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -18,6 +18,8 @@
 #include <trace/events/f2fs.h>
 #include "segment.h"
 
+static bool f2fs_cache_put(struct f2fs_cached_block *entry);
+
 void f2fs_cache_wait_writeback_cond(struct f2fs_cached_block *entry,
 					enum page_type type)
 {
@@ -314,7 +316,19 @@ void f2fs_lock_cache(struct f2fs_cached_block *entry)
 
 void f2fs_unlock_cache(struct f2fs_cached_block *entry)
 {
+	/*
+	 * In asynchronous read I/O completion (e.g. from f2fs_ra_node_cache()),
+	 * the I/O completion does not hold a reference of its own. Once
+	 * clear_and_wake_up_bit() clears F2FS_BLOCK_LOCKED, a concurrent waiter
+	 * in f2fs_lock_cache() (e.g. from f2fs_truncate_cache()) can wake up,
+	 * truncate the entry, and drop the final reference before wake_up_bit()
+	 * finishes.
+	 * Pin the entry here to make sure it is not freed before wake_up_bit()
+	 * completes.
+	 */
+	f2fs_cache_get(entry);
 	clear_and_wake_up_bit(F2FS_BLOCK_LOCKED, &entry->state);
+	f2fs_cache_put(entry);
 }
 
 bool f2fs_put_cache(struct f2fs_cached_block *entry, bool unlock)
-- 
2.49.0

