Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF3F4C9E01
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979392; cv=none; b=BgKObfvBAc2vNgyEqdZVWztvXEzBIdtVsu7AG9WNhmQnXHcHnpgprMov0j8Cke//GIp9W0pfTZq4YCIvWeC4QgjOdQ+lLXn4fhQbbbYaKxtgj4gRJutKsAkxVgtCVsuRKow/sn+LeE/vtXG73aS71de+snKsotAEhZzIJ5v13UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979392; c=relaxed/simple;
	bh=RCMiJMwZ/p84YRjFKN47cNWn+KpGmmsrfTfEMKulcuo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=FCt7D6yHoaSCZoJbBlzbk5xaTttJeuKCsFWvx8gQH4cNRAH7xWupqKIIL8vGioQrjVBhKeKbxKKGEXia9wsK8VEXA6PKTo211dFkxIUDgpvCPi2tX2SWk4p3qRn5sHUybH+8C4M7WREZRfxnChuFfL6xMfEwAENZS22hxE/btng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 69EC2v9H062924
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:02:57 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 69EC2v8P062921
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:02:57 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <17fb5b42-4f54-41db-8bcb-2c13e05c6137@I-love.SAKURA.ne.jp>
Date: Wed, 14 Oct 2026 21:02:56 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: LKML <linux-kernel@vger.kernel.org>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH] block: avoid long sync_blockdev() under disk->open_mutex
 during parallel close
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav214.rs.sakura.ne.jp

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
 block/bdev.c              | 41 +++++++++++++++++++++++++++++++++++++--
 include/linux/blk_types.h |  1 +
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index cd8323083740..07e4cc0e5c2a 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -1167,10 +1167,47 @@ void bdev_release(struct file *bdev_file)
 	 * of the world and we want to avoid long (could be several minute)
 	 * syncs while holding the mutex.
 	 */
-	if (atomic_read(&bdev->bd_openers) == 1)
+ retry:
+	mutex_lock(&disk->open_mutex);
+	if (bdev_is_partition(bdev) &&
+	    atomic_read(&bdev_whole(bdev)->bd_openers) == 1) {
+		/*
+		 * This "bdev" is a partition, and blkdev_put_whole() from
+		 * blkdev_put_part() will trigger blkdev_flush_mapping() on
+		 * the whole disk. Therefore, we need to sync the whole disk.
+		 */
+		bdev->bdev_syncer = current;
+		mutex_unlock(&disk->open_mutex);
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
+		 * blkdev_flush_mapping() on the whole disk because we chedked
+		 * bdev_whole(bdev)->bd_openers != 1. Therefore, we need to
+		 * sync only this "bdev".
+		 */
+		bdev->bdev_syncer = current;
+		mutex_unlock(&disk->open_mutex);
 		sync_blockdev(bdev);
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

