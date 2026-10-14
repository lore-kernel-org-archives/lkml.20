Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7951649F137
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987185; cv=none; b=BjcATDCuUn7iv4/n5yZA7KGMLqqkpG8da35LHEmAAgAXAh2F7E7g3TR1qnogHnIU8R64bXBWi+VLpUVXsTcHT5eTWys8CGZwfPgiFmkLS6GhGunNsjPVq5Y1B9/s68kHdmVXdtzeLx9wT6NqShrdP2thaQ0vDpIgKtx5T10B3n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987185; c=relaxed/simple;
	bh=2R+j7PKxywR0zLgzJambMUNH/kA2nPdoA9MoEyXX3Uw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=bkRFDZobzSll6rub/TGI00VASPYJ9UvGS6Zr2DFtBV6xvuly1VSqNNkBUQCAZwYgaM5pb2eDPQlzUu50Yg8vPnPzOez+dM+uBozT4AIj3OBOPsQUk860PDQvL+61twPiOwWWUccLUbqIymZAm3G94nMSYh/reLMNhMwwebNhVZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 69EED0Nb089247
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:13:00 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 69EECkdf089205
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:13:00 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <450c6828-9187-487e-a219-f64e56d34fe7@I-love.SAKURA.ne.jp>
Date: Wed, 14 Oct 2026 23:12:45 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3] block: avoid long sync_blockdev() under disk->open_mutex
 during parallel close
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: LKML <linux-kernel@vger.kernel.org>
References: <17fb5b42-4f54-41db-8bcb-2c13e05c6137@I-love.SAKURA.ne.jp>
 <d52496da-fb19-4b60-91bc-76402822c6b7@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <d52496da-fb19-4b60-91bc-76402822c6b7@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav211.rs.sakura.ne.jp

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

Assisted-by: Gemini-Pro
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 block/bdev.c              | 35 +++++++++++++++++++++++++++++++++--
 include/linux/blk_types.h |  1 +
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index cd8323083740..c71dacd0c2b1 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -1155,6 +1155,7 @@ void bdev_release(struct file *bdev_file)
 	struct block_device *bdev = file_bdev(bdev_file);
 	void *holder = bdev_file->private_data;
 	struct gendisk *disk = bdev->bd_disk;
+	struct block_device *whole;
 
 	/* We failed to open that block device. */
 	if (IS_ERR(holder))
@@ -1167,10 +1168,40 @@ void bdev_release(struct file *bdev_file)
 	 * of the world and we want to avoid long (could be several minute)
 	 * syncs while holding the mutex.
 	 */
-	if (atomic_read(&bdev->bd_openers) == 1)
+	mutex_lock(&disk->open_mutex);
+	whole = bdev_is_partition(bdev) ? bdev_whole(bdev) : NULL;
+ retry:
+	if ((whole && atomic_read(&whole->bd_openers) == 1) ||
+	    atomic_read(&bdev->bd_openers) == 1) {
+		bdev->bdev_syncer = current;
+		if (whole)
+			whole->bdev_syncer = current;
+		mutex_unlock(&disk->open_mutex);
 		sync_blockdev(bdev);
+		if (whole)
+			sync_blockdev(whole);
+		mutex_lock(&disk->open_mutex);
+		if (bdev->bdev_syncer != current ||
+		    (whole && whole->bdev_syncer != current))
+			goto retry;
+	} else {
+		/*
+		 * Mark sync_blockdev() being possibly raced.
+		 *
+		 * Theoretically, it is possible for a malicious thread to
+		 * trap a victim thread in an infinite "goto retry;" loop
+		 * by repeatedly calling open() and close(). In practice,
+		 * however, trapping a victim thread in such a loop is
+		 * extremely difficult. This is because the bd_opener count
+		 * remains elevated between open() and close() calls,
+		 * meaning the victim thread will observe bd_opener > 1
+		 * and skip synchronization within just a few retries.
+		 */
+		bdev->bdev_syncer = NULL;
+		if (whole)
+			whole->bdev_syncer = NULL;
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

