Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7DE4FD799
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065754; cv=none; b=thCEP4+XnOUygdD7+PEupEXDvnycdQzTY3RUtDslALpJsj1HhONzUakZYF9TCcC0gzkWcTMUPiwtumi0rxgiAo3+VCel3TiqMfps9kt8gTkmcXgJw1LZ5+sEwwueS3jmTxKpXytAybtiLaXs5VtWV5H8MIDvA2h4qpXY2Rf0BR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065754; c=relaxed/simple;
	bh=CYPbeJPrlKuFT0PtxaMLrbp89Af1BG+90UbXLz2oSdk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uptXAzCW+1HiuAw0LgHx9O+SBhqlx3KGGF46p+vJcNToor3QSB/mfNsEl4PUe0ZD+zKN99upcJ6zonqfTPCdA6K6Z5FaSh2ySxJjTcRbvic1biXvPCWcbPdI1U2BIsiSagNBR4I+pzFoCz+/hHof2voVELQ5t+taDR4IOcwafO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M77rUSIN; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M77rUSIN"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8b20a899fso21233345ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792065751; x=1792670551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApNHjCttumEMl6K7MdkUpNjEISJlLnpsoD/T2Ism33Y=;
        b=M77rUSINNVLBXl+JwpF06lfdNTMeOtyNPXl5FHIBHm8mO05vN25CEhW0+ZZUxVCemA
         u+ryF8o1jHx6ZnBG9QO/rStXlbculKRebhAkuuqPlqAg1v0fnI8SHx8ZUc/OjBRMvws8
         MAeE2qBXrsrC12JHmTsz4tprkgY/5kTSNioIw8ks1K9aKRgJMyKaYxWt0oPTKsL3wxZ8
         coGVZ9i+zGcibT2yjlXOWvQ4j0yUKofOFAa3a2Zv7uejUubJmbrnW7wnoL/q7qf1ox6H
         f3MY3HEF4QWOp366KTk/7vMUOEtRfcAT0ngYRxfQFJbhFbvzUZD5EP9RrmV7OgNh90D6
         JwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065751; x=1792670551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApNHjCttumEMl6K7MdkUpNjEISJlLnpsoD/T2Ism33Y=;
        b=2FeT42d951isDoNg2kzXR3MzlsiwsC33XJPjPTGPaaUAIC/1wPPEJsSkw9OI4u8m2q
         dP/zhqL23dLaBpzQbanACQD7k+Ji0Ne8r4QwlLf2UEaWYq2Golo+kLHigamIDtKw6tCA
         iHDlaYz/aK/EomEW+yI5O/WuGiLJI88qzB8UZcE9vhJs4SmXbPdtL3O+xDpX94RPGRdq
         tQlERfkqq9FxiERASYlkf0Qlg5F0tQUDZ0pqlPPaj+qRBoMZRwLx5ASPOaIcXzhuRRYq
         CbkEqiOWT2k4Yu2HcZk+SrbgBcd/MMkkTkPCNNYS3npxnCDSO3RpG4kEh96NWasAgqQS
         5crw==
X-Forwarded-Encrypted: i=1; AKwUvBzxxXTP+qSrwh3zW5N9oqO2siiOLjbgqqpeotO2/JUx0vypJNK0Qb90LW7fu8FQ3d7t5YYvNXUU7Mwcdiw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6/YT+KkahpYpcPus0Za05Dj4dyLp3lZ++jcqU5ZuTrlJhpXLL
	e6SbSjXoW5QmgKNziSPl+TAcD1J5Em95fShJUOf/elsDaT7Kk2P5w4bhCGzAho4QcgCV9w==
X-Gm-Gg: AYBFou2f8uW7bhN7VFfEwjtKFh4YkJm5W5/fzl+5RXy+GMEsFD4us8AdbB5g4VqeiDA
	kgHcpUH6lI5Qfxfmh8rk53yFAoPzABhIQR0Y8inC2+5HwueUln5VC8hXy+KV4xQ+/JSJBYcMtpE
	+GwaMFh4Ynr1ETb5e1wwPQyg5EABr1Oyxt5/VjaV22vigz7DLzMFDZau6G5iKMyK3F6le8Zd1O0
	8g73bOVFJmT15DDcabBDFAQO19sjQ/iOIrDaYgmKMqMnDXDZvnUEK5apj+OO8Zynp1jmQek3Z6E
	liJRNKu94CDY0je3X5X/0JQ87mRuuqWggqYa9u9NHbCmoWuncVptnTSo7T1m2DM593s8jfegNYe
	Q82ko7aSO5xBtOV/Ec6d4aQLMrR435iKGdwv4oK1sSDIMqFhudlYS6RZO7igCk6YEjSDQr1NOdK
	YvHREkZHHzyV2MbdXhAXUwUiR+ptjN2ptFd9i8slRIXjOeqDvvb58dJ5qypq0PL+KENf67XH5Wk
	Pf4BdmX357DsUOONQ==
X-Received: by 2002:a17:903:19e7:b0:2e6:1a6c:abcd with SMTP id d9443c01a7336-2e84280a68fmr186355835ad.3.1792065749469;
        Thu, 15 Oct 2026 05:02:29 -0700 (PDT)
Received: from localhost.localdomain ([183.250.189.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1807sm80886315ad.43.2026.10.15.05.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:02:28 -0700 (PDT)
From: Ye Linfei <yelinfei66@gmail.com>
X-Google-Original-From: Ye Linfei <yelinfei@ruijie.com.cn>
To: linux-mtd@lists.infradead.org
Cc: chengzhihao1@huawei.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: ubi: block: forbid direct reclaim I/O during synchronous read
Date: Thu, 15 Oct 2026 20:01:59 +0800
Message-Id: <20261015120159.305277-1-yelinfei@ruijie.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1792046946.git.yelinfei@ruijie.com.cn>
References: <cover.1792046946.git.yelinfei@ruijie.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ubiblock implements ->queue_rq() synchronously: the task submitting the
bio executes the whole UBI/MTD read itself, from inside the block layer
submission loop (current->bio_list is non-empty) and while holding the
tag_set SRCU read lock (blk_mq_run_dispatch_ops(), taken for
BLK_MQ_F_BLOCKING drivers).

An allocation in that context may trigger direct reclaim, which with
GFP_NOFS - used by all UBI allocations - may synchronously write dirty
pages to swap.  On systems where swap is backed by a device with
BLK_FEAT_SYNCHRONOUS (zram), that ends in swap_writepage_bdev_sync()
-> submit_bio_wait().  The swap bio is only queued onto
current->bio_list, never dispatched: per submit_bio_noacct_nocheck(),
bios submitted while a submission loop is active are only collected on
current->bio_list, and their sole dispatcher is the task currently
executing ->queue_rq() - which is now sleeping waiting for the very
same bio's completion.  The task hangs forever, the pending SRCU read
lock freezes grace periods (blk_mq_timeout_work() -> synchronize_srcu()
never returns), and the unfinished request blocks all other I/O to the
device.

This was observed in the field on a 1 GiB RISC-V networking product
running squashfs-on-ubiblock with zram swap: 47 tasks stuck in disk
sleep for 600+ seconds, ending in a hung task panic.  The allocator
never reached the OOM decision point, because the task died inside
try_to_free_pages().

Mark the whole read with memalloc_noio_save()/memalloc_noio_restore()
so direct reclaim never issues block I/O while this driver executes:
reclaim is restricted to dropping clean page cache and shrinking slabs,
page (swap) reclaim is performed asynchronously by kswapd, and the
worst case is -ENOMEM, which propagates to the caller as an ordinary
recoverable I/O error - a recoverable read failure instead of a total
system hang.

This covers every allocation performed below ubi_read_sg(), including
lock-tree entries, VID buffers and I/O helpers, regardless of the gfp
flags they use internally.

Fixes: 9d54c8a33eec ("UBI: R/O block driver on top of UBI volumes")
Cc: stable@vger.kernel.org
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Ye Linfei <yelinfei@ruijie.com.cn>
---

Changes in v2:
- Drop the ltree GFP_NOIO patch: its allocation rides under
  ubiblock_read()'s memalloc_noio_save() scope, which already implies
  NOIO semantics, and the remaining ltree_add_entry() callers (cdev,
  update and wear-leveling paths) run in process context where swap
  I/O from direct reclaim can complete, so widening the flag change
  was unnecessary.  Suggested by Zhihao Cheng.
- Add Reviewed-by: Zhihao Cheng.

 drivers/mtd/ubi/block.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 29c0d6941a81..c9d42181bf64 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -38,6 +38,7 @@
 #include <linux/blkdev.h>
 #include <linux/blk-mq.h>
 #include <linux/hdreg.h>
+#include <linux/sched/mm.h>
 #include <linux/scatterlist.h>
 #include <linux/idr.h>
 #include <asm/div64.h>
@@ -189,6 +190,7 @@ static blk_status_t ubiblock_read(struct request *req)
 	int leb = pos;
 	struct req_iterator iter;
 	struct bio_vec bvec;
+	unsigned int noio_flags;
 	int ret;
 
 	blk_mq_start_request(req);
@@ -201,6 +203,18 @@ static blk_status_t ubiblock_read(struct request *req)
 	ubi_sgl_init(&pdu->usgl);
 	blk_rq_map_sg(req, pdu->usgl.sg);
 
+	/*
+	 * This entire callback runs in the synchronous dispatch path of
+	 * blk-mq: submit_bio_noacct_nocheck() only queues a bio submitted
+	 * from here onto current->bio_list, and the sole dispatcher of
+	 * that list is this very task, busy inside ->queue_rq().  Any
+	 * block I/O issued from below would therefore deadlock against
+	 * itself (e.g. synchronous swap writeback reached via direct
+	 * reclaim).  Forbid it for the whole read instead of relying on
+	 * every callee using safe allocation flags.
+	 */
+	noio_flags = memalloc_noio_save();
+
 	while (bytes_left) {
 		/*
 		 * We can only read one LEB at a time. Therefore if the read
@@ -221,6 +235,7 @@ static blk_status_t ubiblock_read(struct request *req)
 
 	rq_for_each_segment(bvec, req, iter)
 		flush_dcache_page(bvec.bv_page);
+	memalloc_noio_restore(noio_flags);
 
 	blk_mq_end_request(req, errno_to_blk_status(ret));
 
-- 
2.25.1

