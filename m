Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324BC2F9C37
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983283; cv=none; b=RD5GbwGUNH0fJAtU4FgrT7ju2KJqMeR/CpRDjMB62kpRUclPNUaRz2CNt1g1m9KXLXwaVmsP9Rhv80EA9YmfjANLxtPKyWARWokcb69ndLS0jF+Vcukht1EG3kCAXCsxRenueSBQA4xEduQAgE2DKBDstiFV3Hwi9FcYEUkBzrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983283; c=relaxed/simple;
	bh=YRrhKndGOmQ5kLLs2naETMmzgu55E1WWngoR1G7zFo4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=OGTfYjrgl1mV5c5sEg1Iq9uQqH+s5v8yLTi8GSCbUdUP0jTG7Unht7qciLuYgwzwQZenpFgfOtiHvJ8gV14u2phrzcZszWGARXCJj20WlWjIh7f0ochbm0KWeKmTFl1OAY8bZBb26TTPLuLEWZMWRz5YCtp+mkeUb4TnnItkR8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 69ED7wLQ076652
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:07:58 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 69ED7wXb076649
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:07:58 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <d52496da-fb19-4b60-91bc-76402822c6b7@I-love.SAKURA.ne.jp>
Date: Wed, 14 Oct 2026 22:07:57 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] block: avoid long sync_blockdev() under disk->open_mutex
 during parallel close
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: LKML <linux-kernel@vger.kernel.org>
References: <17fb5b42-4f54-41db-8bcb-2c13e05c6137@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <17fb5b42-4f54-41db-8bcb-2c13e05c6137@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav213.rs.sakura.ne.jp

Commit b849dd84b6cc ("bdev: Reduce time holding bd_mutex in sync in
blkdev_close()") introduced a sync_blockdev() call immediately before
holding disk->open_mutex. But this check was racy and best-effort basis.

If more than one process concurrently called bdev_release() and saw
atomic_read(&bdev->bd_openers) > 1, the process which actually hit
the atomic_dec_and_test(&bdev->bd_openers) condition will call
sync_blockdev() from blkdev_flush_mapping() (which could take several
minutes) with disk->open_mutex held.

Kill this race window and make sync_blockdev() always be called before
holding disk->open_mutex, by using a marker that checks whether lockless
sync_blockdev() has raced.

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Changes in v2:
  - Fix errors mentioned by sashiko.

 block/bdev.c              | 43 +++++++++++++++++++++++++++++++++++++--
 include/linux/blk_types.h |  1 +
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index cd8323083740..0b24c252206c 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -1167,10 +1167,49 @@ void bdev_release(struct file *bdev_file)
 	 * of the world and we want to avoid long (could be several minute)
 	 * syncs while holding the mutex.
 	 */
-	if (atomic_read(&bdev->bd_openers) == 1)
+	mutex_lock(&disk->open_mutex);
+ retry:
+	if (bdev_is_partition(bdev) &&
+	    atomic_read(&bdev_whole(bdev)->bd_openers) == 1) {
+		/*
+		 * This "bdev" is a partition, and blkdev_put_whole() from
+		 * blkdev_put_part() will trigger blkdev_flush_mapping() on
+		 * the whole disk. Therefore, we need to sync both this
+		 * partition and the whole disk.
+		 */
+		bdev->bdev_syncer = current;
+		mutex_unlock(&disk->open_mutex);
 		sync_blockdev(bdev);
+		sync_blockdev(bdev_whole(bdev));
+		mutex_lock(&disk->open_mutex);
+		/* Need to retry if we raced. */
+		if (bdev->bdev_syncer != current)
+			goto retry;
+	} else if (atomic_read(&bdev->bd_openers) == 1) {
+		/*
+		 * If "bdev" is a whole disk, blkdev_put_whole() will trigger
+		 * blkdev_flush_mapping() on this disk. Therefore, sync this
+		 * "bdev".
+		 *
+		 * If "bdev" is a partition, blkdev_put_part() will trigger
+		 * blkdev_flush_mapping() on this partition, but
+		 * blkdev_put_whole() from blkdev_put_part() won't trigger
+		 * blkdev_flush_mapping() on the whole disk because we checked
+		 * bdev_whole(bdev)->bd_openers != 1. Therefore, we need to
+		 * sync only this "bdev".
+		 */
+		bdev->bdev_syncer = current;
+		mutex_unlock(&disk->open_mutex);
+		sync_blockdev(bdev);
+		mutex_lock(&disk->open_mutex);
+		/* Need to retry if we raced. */
+		if (bdev->bdev_syncer != current)
+			goto retry;
+	} else {
+		/* Mark sync_blockdev() being possibly raced. */
+		bdev->bdev_syncer = NULL;
+	}
 
-	mutex_lock(&disk->open_mutex);
 	bdev_yield_write_access(bdev_file);
 
 	if (holder)
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 98e21b4cbf32..d79bb4b6100f 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -74,6 +74,7 @@ struct block_device {
 #ifdef CONFIG_SECURITY
 	void			*bd_security;
 #endif
+	struct task_struct	*bdev_syncer; /* Not refcounted. */
 	/*
 	 * keep this out-of-line as it's both big and not needed in the fast
 	 * path
-- 
2.56.0

