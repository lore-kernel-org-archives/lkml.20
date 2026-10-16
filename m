Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CD64DB547
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165229; cv=none; b=IkagG3H+DPox5JhA0uQUA0tp6e7EPx7bX1W8IXl/wxPYwF0kOOlKB9BzeQatt6GSWMUigIkCWYZx1YUVnRy0afTqVYiJwFpoY2aexGpqvJOcuPOwCopov8ufOaXNXGFEVPa6M5lXNFUyEZnlr1Ja2rENev2pegUj7Jn2ZbFMcUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165229; c=relaxed/simple;
	bh=gDjFUhDwJ4sT9CgsizLZoWRdJEdTSPq77NqXBJWa+f0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Di/9mL9j//SQdffhvQAK050aqiG2AT2D6oQJdS+lZtWEDE3JT2z3OkBOqFNOK6t19To3M+GBlonbiAo9qRWPRIjPpMrgkU4Q85QJQsCWg+qaAkBoOtpZnRjKY9wnfzfQztCIyCguKANVLokpLWvIulqBWzon5IKqDubgh2Ea1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 69GFeJku088831
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:40:19 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 69GFeIXJ088828
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:40:19 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <6efed2d0-fe66-4d29-876b-fd3b74abaa70@I-love.SAKURA.ne.jp>
Date: Sat, 17 Oct 2026 00:40:14 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7] block: avoid long sync_blockdev() under disk->open_mutex
 during parallel close
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: LKML <linux-kernel@vger.kernel.org>
References: <17fb5b42-4f54-41db-8bcb-2c13e05c6137@I-love.SAKURA.ne.jp>
 <d52496da-fb19-4b60-91bc-76402822c6b7@I-love.SAKURA.ne.jp>
 <450c6828-9187-487e-a219-f64e56d34fe7@I-love.SAKURA.ne.jp>
 <f9f521a6-2132-4eb7-ad74-28363366e6a8@I-love.SAKURA.ne.jp>
 <8d188283-b5c7-4b16-95ee-6d985472c120@I-love.SAKURA.ne.jp>
 <06cd882d-7f4e-4697-b6b1-ba140f8ad4dd@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <06cd882d-7f4e-4697-b6b1-ba140f8ad4dd@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav412.rs.sakura.ne.jp
X-Virus-Status: clean

Commit b849dd84b6cc ("bdev: Reduce time holding bd_mutex in sync in
blkdev_close()") introduced a sync_blockdev() call immediately before
holding disk->open_mutex. But this check was racy and best-effort basis.

If more than one thread concurrently called bdev_release() and saw
atomic_read(&bdev->bd_openers) > 1, the thread which actually hit
the atomic_dec_and_test(&bdev->bd_openers) condition will call
sync_blockdev() from blkdev_flush_mapping() (which could take several
minutes) with disk->open_mutex held.

Kill this race window and make sync_blockdev() always be called before
holding disk->open_mutex, by using a counter that tracks how many threads
are calling sync_blockdev() from bdev_release() without disk->open_mutex
held.

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 block/bdev.c              | 18 +++++++++++++++---
 include/linux/blk_types.h |  1 +
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index cd8323083740..cc9f66fd9d6b 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -1150,6 +1150,17 @@ static inline void bd_yield_claim(struct file *bdev_file)
 		bd_end_claim(bdev, holder);
 }
 
+static inline void bd_early_sync(struct gendisk *disk, struct block_device *bdev)
+{
+	if (atomic_read(&bdev->bd_openers) == 1 + bdev->bd_closers) {
+		bdev->bd_closers++;
+		mutex_unlock(&disk->open_mutex);
+		sync_blockdev(bdev);
+		mutex_lock(&disk->open_mutex);
+		bdev->bd_closers--;
+	}
+}
+
 void bdev_release(struct file *bdev_file)
 {
 	struct block_device *bdev = file_bdev(bdev_file);
@@ -1167,10 +1178,11 @@ void bdev_release(struct file *bdev_file)
 	 * of the world and we want to avoid long (could be several minute)
 	 * syncs while holding the mutex.
 	 */
-	if (atomic_read(&bdev->bd_openers) == 1)
-		sync_blockdev(bdev);
-
 	mutex_lock(&disk->open_mutex);
+	bd_early_sync(disk, bdev);
+	if (bdev_is_partition(bdev))
+		bd_early_sync(disk, bdev_whole(bdev));
+
 	bdev_yield_write_access(bdev_file);
 
 	if (holder)
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 98e21b4cbf32..04d378818c76 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -74,6 +74,7 @@ struct block_device {
 #ifdef CONFIG_SECURITY
 	void			*bd_security;
 #endif
+	int			bd_closers;
 	/*
 	 * keep this out-of-line as it's both big and not needed in the fast
 	 * path
-- 
2.56.0
