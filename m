Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72804AE8D3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790812483; cv=none; b=IIbQlkPyeer+VdhyKctv2LXEHqaZBFNE6go836TqSYetlAO52RpnYA7j5zjv+OT3/FbMR6AODQUEsxUMXwctZUSGzDfepAMUFrk5rtLmDyOe/V7RVRhM/AXgTuI9jAz67tY4n7IimggOQOpbXiG4vSfg8ZuI8aQVDk5si5usqxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790812483; c=relaxed/simple;
	bh=0GH7/cOmLoBSirEp1hBwrAQHO95TPrfccj3KWBQ0rz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LRjLVz6EHO/7nRuyTbcyB/Wh4xFBFaS+NkWs5uTWrDL7gV0dhC80kI9yrzMyjkfQ/Mltu+jBMkHaV0qBMRBKQvwx7EP894EwARaf7EovHA9jPOUwd4Zoz+g8WGUEK4GeuCAx5Ri/Cca+1qAxJLalJbFl85es1yY0U27KCJxnV58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIkU2sJt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIkU2sJt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27C61F000FF;
	Wed, 30 Sep 2026 23:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790812481;
	bh=LLgbJMciNYXzfOaMeH8TIVdRk5weLJbhP8q1PNI6ADw=;
	h=From:To:Cc:Subject:Date;
	b=WIkU2sJtnTGPhQtXkWtnyDs+DQjrUhwvJ1epEhSB4+iDfyUB/oNFYJJJi21XSrd2z
	 dHkGpOVnUCLOJYCBC0frKDfpRKwpDCryj4qzCgaT8nuXezr1BoZqlyFfpz7jCHAmTS
	 wEhLLcwi1tMJkQ4UjimSazBx9M5aN9znjX/yLocoQU5nc7JOkelSOb3CZBmmj7qGJX
	 1k5uGrFy3bVVjqH5FOl5sVRnc/A17+jokE/ZMHRuvIOXxdZrTzVghvdh5AkJ9yAbXq
	 tcTgt3HOy71TKhgOYq0ZJqDl5eXCmxSSOssWqHu1XILdxHFJ+18694BsVX4fz1PZNu
	 R+3es9gT3uvHw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH 1/2] f2fs: cache: pin cached block in f2fs_end_cache_writeback()
Date: Wed, 30 Sep 2026 23:54:34 +0000
Message-ID: <20260930235435.3789910-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

Like page cache folios, writeback does not hold an active reference on
the cached block during I/O flight, relying instead on truncation or
shrinker callers to wait on F2FS_BLOCK_WRITEBACK before releasing the entry.

However, in f2fs_end_cache_writeback(), clear_and_wake_up_bit() executes
two distinct steps:
1. clear_bit_unlock(F2FS_BLOCK_WRITEBACK, &entry->state): clears the bit.
2. wake_up_bit(&entry->state, F2FS_BLOCK_WRITEBACK): hashes &entry->state
   to look up the waitqueue and wakes waiting tasks.

Once step 1 clears the bit, a concurrent waiter in f2fs_do_truncate_cache()
or f2fs_do_shrink_cache() is immediately unblocked. The waiter can proceed
to delete the entry from the radix tree, drop the final reference, and
kfree() the entry before step 2 finishes, causing wake_up_bit() to access
freed memory:

CPU 0 (I/O completion)               CPU 1 (Truncation / Shrinker)
- f2fs_cache_write_end_io()
 - f2fs_end_cache_writeback(entry)
  - clear_and_wake_up_bit()
   - clear_bit_unlock(WRITEBACK)
   : bit is cleared!
                                     - f2fs_do_truncate_cache(entry)
                                      - f2fs_cache_wait_writeback(entry)
                                      : sees WRITEBACK cleared!
                                      - radix_tree_delete(&cache->root, ...)
                                      - f2fs_put_cache(entry, true)
                                       - atomic_dec_and_test(&refcount) == 0
                                       - f2fs_do_free_cache(entry)
                                        - kfree(entry->data);
                                        - kfree(entry); <--- FREED!
   - smp_mb__after_atomic()
   - wake_up_bit(&entry->state, ...)
   : Dereferences &entry->state on freed entry! (UAF)

Mirror the logic in folio_end_writeback() by acquiring a temporary reference
via f2fs_cache_get() before clear_and_wake_up_bit() and releasing it with
f2fs_cache_put() once wake_up_bit() completes. This guarantees the entry
can not be freed until wake_up_bit() has finished.

This fixes commit 399410a90ca7 ("f2fs: cache: implement metadata cache").

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 38fc5eb17f92..7831e53f5678 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -117,7 +117,15 @@ void f2fs_end_cache_writeback(struct f2fs_cached_block *entry)
 	 */
 	f2fs_cache_update_tag(entry, F2FS_CACHE_TAG_WRITEBACK,
 						F2FS_CACHE_TAG_NONE);
+	/*
+	 * Writeback does not hold an entry reference of its own, relying
+	 * on truncation to wait for the clearing of F2FS_BLOCK_WRITEBACK.
+	 * But here we must make sure that the entry is not freed and
+	 * reused before clear_and_wake_up_bit().
+	 */
+	f2fs_cache_get(entry);
 	clear_and_wake_up_bit(F2FS_BLOCK_WRITEBACK, &entry->state);
+	f2fs_cache_put(entry);
 }
 
 static int f2fs_cache_refcount(struct f2fs_cached_block *entry)
-- 
2.49.0

