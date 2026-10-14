Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA983E2769
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994894; cv=none; b=JoWSm/Yk5HsR8N05LJK9pcXnCSTH6nvWLfVuHRuPTnGnO1tjLX4Pqv78k6S0CYrfoMRIJkC/fW5FbYQ/jryAokwXcNNwgo2Hu7jxDcVkRk626Ts+LGMBxUXLzu/zgrroaPXBcHxgno/MOoxEXeqwwsZXM1dw5NokPPslt5h3CDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994894; c=relaxed/simple;
	bh=DKmUcf3UX2uo5PYFvyNXWQbwzGjnAAIqyn8pLNXb+iQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=cIdVbCcrh8lGF6SIl8fsrt9Vb/2iTKkkOiCVQuZnp4w9Kobn5xgvIDY8DdiIhS24m0wWJlGH6Z68Y8JTDFv8MhlIhM5z+m6YmbSzzc2e3qBBii91DVxp/ThxMmJRgiO0+QHDoE7bAsoETz5e6FZ1Du8nI0N7k8zO0ex5TZ4S34M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 69EGLT8Q014763
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:21:29 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 69EGL9Z0014721
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:21:29 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <f9f521a6-2132-4eb7-ad74-28363366e6a8@I-love.SAKURA.ne.jp>
Date: Thu, 15 Oct 2026 01:21:09 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4] block: avoid long sync_blockdev() under disk->open_mutex
 during parallel close
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: LKML <linux-kernel@vger.kernel.org>
References: <17fb5b42-4f54-41db-8bcb-2c13e05c6137@I-love.SAKURA.ne.jp>
 <d52496da-fb19-4b60-91bc-76402822c6b7@I-love.SAKURA.ne.jp>
 <450c6828-9187-487e-a219-f64e56d34fe7@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <450c6828-9187-487e-a219-f64e56d34fe7@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav412.rs.sakura.ne.jp
X-Virus-Status: clean

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
 block/bdev.c              | 37 ++++++++++++++++++++++++++++++++++---
 include/linux/blk_types.h |  1 +
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index cd8323083740..57f0f57da8c1 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -1167,10 +1167,41 @@ void bdev_release(struct file *bdev_file)
 	 * of the world and we want to avoid long (could be several minute)
 	 * syncs while holding the mutex.
 	 */
-	if (atomic_read(&bdev->bd_openers) == 1)
-		sync_blockdev(bdev);
-
 	mutex_lock(&disk->open_mutex);
+ retry:
+	if (bdev_is_partition(bdev)) {
+		if (atomic_read(&bdev->bd_openers) == 1) {
+			bdev->bdev_syncer = current;
+			mutex_unlock(&disk->open_mutex);
+			sync_blockdev(bdev);
+			/*
+			 * Always sync the whole disk despite we need to sync
+			 * only when we're the last one, for we can't serialize
+			 * concurrent closing of multiple partitions on the
+			 * same disk using open_mutex.
+			 */
+			sync_blockdev(bdev_whole(bdev));
+			mutex_lock(&disk->open_mutex);
+			if (bdev->bdev_syncer != current)
+				goto retry;
+		} else {
+			/* Mark sync_blockdev() being possibly raced. */
+			bdev->bdev_syncer = NULL;
+		}
+	} else {
+		if (atomic_read(&bdev->bd_openers) == 1) {
+			bdev->bdev_syncer = current;
+			mutex_unlock(&disk->open_mutex);
+			sync_blockdev(bdev);
+			mutex_lock(&disk->open_mutex);
+			if (bdev->bdev_syncer != current)
+				goto retry;
+		} else {
+			/* Mark sync_blockdev() being possibly raced. */
+			bdev->bdev_syncer = NULL;
+		}
+	}
+
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

