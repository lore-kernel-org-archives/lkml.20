Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CFE4A2638
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063089; cv=none; b=OZy6A+36SunGY5R5pQJt24x7buwhS9iY9ZHWXBPF30qn0ZmapQ6wLuVpN/77mshQuuR7jZn3YnPMcQq3pg5cDjmP1G0kno3Z9A/AqgJ8MYe/ZEcSb1U+479eizxLvocmR6cKw6jX4ZsYP5sR71u0ObvnLDNGN2U9a4cbY+kWJ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063089; c=relaxed/simple;
	bh=4Jq657e1rt+YqI41Xo68/ctWVUVpPaDwJJON8tVbDf8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=f3o+Gu5tK9MTkk9Z6XOwgB0V1a9BnERvcu04LSzuq8PjQDHtAz39kqRAouzGj9M0i/oUNL+LkYPQIBcqYkM1k3fnMmaRxW5Y99S/sUrTZ9HiWEnj/Mcj873GAnctnbISXeNx+zq7ETMWIq27PZE7QNghnKQm8IyFYJl0bsrU7W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 69FBI3I3013890
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:18:03 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 69FBI3g1013887
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:18:03 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <06cd882d-7f4e-4697-b6b1-ba140f8ad4dd@I-love.SAKURA.ne.jp>
Date: Thu, 15 Oct 2026 20:18:04 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6] block: avoid long sync_blockdev() under disk->open_mutex
 during parallel close
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: LKML <linux-kernel@vger.kernel.org>
References: <17fb5b42-4f54-41db-8bcb-2c13e05c6137@I-love.SAKURA.ne.jp>
 <d52496da-fb19-4b60-91bc-76402822c6b7@I-love.SAKURA.ne.jp>
 <450c6828-9187-487e-a219-f64e56d34fe7@I-love.SAKURA.ne.jp>
 <f9f521a6-2132-4eb7-ad74-28363366e6a8@I-love.SAKURA.ne.jp>
 <8d188283-b5c7-4b16-95ee-6d985472c120@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <8d188283-b5c7-4b16-95ee-6d985472c120@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav113.rs.sakura.ne.jp
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
 block/bdev.c              | 24 ++++++++++++++++++++++--
 include/linux/blk_types.h |  1 +
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index cd8323083740..cc16f0d7d496 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -1167,10 +1167,30 @@ void bdev_release(struct file *bdev_file)
 	 * of the world and we want to avoid long (could be several minute)
 	 * syncs while holding the mutex.
 	 */
-	if (atomic_read(&bdev->bd_openers) == 1)
+	mutex_lock(&disk->open_mutex);
+	if (atomic_read(&bdev->bd_openers) == 1 + bdev->bd_closers) {
+		struct block_device *whole = bdev_is_partition(bdev) ?
+			bdev_whole(bdev) : NULL;
+
+		bdev->bd_closers++;
+		if (whole)
+			whole->bd_closers++;
+		mutex_unlock(&disk->open_mutex);
 		sync_blockdev(bdev);
+		/*
+		 * Always sync the whole disk when closing a partition despite
+		 * we need to sync the whole disk only when we're also closing
+		 * the whole disk, for we can't serialize concurrent closing of
+		 * partitions using disk->open_mutex.
+		 */
+		if (whole)
+			sync_blockdev(whole);
+		mutex_lock(&disk->open_mutex);
+		bdev->bd_closers--;
+		if (whole)
+			whole->bd_closers--;
+	}
 
-	mutex_lock(&disk->open_mutex);
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

