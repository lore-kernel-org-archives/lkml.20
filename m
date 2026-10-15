Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4CF4570E1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049624; cv=none; b=h2eqT7fXZjSY7uFI98MvWHcgnki4pyz+TFEbxqYxOJQ67+QC9zU4dK2JDQNTAC0IOb80XILfrFPr1H2dKzqpgxzaEFmmE7aOkfGKzW8acZRD4/VddpdeAPabwwjIbYbSTLd9ksjeCUEzMdGf69q3sQepHKgyiZCapijc/ryCV/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049624; c=relaxed/simple;
	bh=6BxT+BHxSI98HiJQAwTZmNruYNpujSCqp7VwjopeXCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lKjeNQE4q/A1qcmaE1/EFCTTjie6791/vahUipjdeEvgcvXG4hjEPV36yxi1LIGcchB1hc/fZ+GOeCB6tQ76AbOmWLf84hzn/wPlcx1RIzQ040N7+O9HqOUJg0sNybO55wg3/dnam2WdqkQlYRYfPevN5D8TQG3rqVjqhUijUks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sobRWzcZ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sobRWzcZ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab3260b2cdso2211201a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792049621; x=1792654421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDV5CdvDDo6YswEAFIGrF4lABKfaTV0Zi1WVMCT/JHk=;
        b=sobRWzcZcIRmKxyv7ubJB880XHpVHGO9aXbEOqIYi938FD70z/lEFVL9AslrPFJTo6
         cyJ+LsT/gXHhsUmdxLfWcyouADevSF6VFkwzFQS3OiEPeOivkRn7BXUaR0fMCZk8fUZr
         XZlSahIJWJH6JvjPOvJl3zHXm31MbaiY7Cyr9enkwA+iZYbRyJbPpIiNtT0LLUEP9fkp
         6pGYBxmkPwijm80srZp6S7oCYhKAQSxPZAq2tiXivh89aykf6wH/wj4pjdWJVijXi/NG
         cGcl14qKryTaxSoo4pEaMtgGTOjDNiXw6GcIXBYSkp9hrGfeuOp2Wza+kxWMSxps9Twr
         r7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049621; x=1792654421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDV5CdvDDo6YswEAFIGrF4lABKfaTV0Zi1WVMCT/JHk=;
        b=ALEzBH7usBzJpt5FeS3ThoSXfOEQ5Hdj70ejvKrumrUTtVb4ALIhyjD94MH1vDuhCP
         dcLyXBJSfx3btSgyseCpQrRfq/hdWe8kVMHwdBjITAZeBqSSTV93yg8KSLBykAzR2Lf/
         e80Vwn3eqQTvzgm4lgj/1ZsZaOgU98aRaWVMVZsjGDpTExrtigDEr+9zLMPKWVg/7c+h
         C+9eO8nWG84tAEOlON3xhJojB5bnqlVa+7eQBkgPTGNbHxsysVDak1f3qpmGzgWQsnKv
         Il/gesgGUfNYeQJA2mGg4nrm/Q1UhFgsP45dpyHWL9B152ViF61fBeFAqV/AFJrsNCsP
         uWXA==
X-Forwarded-Encrypted: i=1; AKwUvBxW4qR5IiOLaur25cpk+39ZWQYQYcZxIxmdq0CbY7x9PcVUwE5WabG2yPGf0Lt/P03DFAa5rrVUjTRuNxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa3Mrbu5Sv8QaxdcJcTxd7rB6y4EGsbiWw7PvJ9RDckXMW5rBM
	GxGjhTMbgeO+Qoa3Rrvlge9cRygBQIjUn+2A7lx3Ew3+wcxrly1Io9fOsDFlFjIELm1JSQ==
X-Gm-Gg: AYBFou3pHPP1TmDX82SlBRhY+Y+ZQLWsF4RPXWblSuZxjaRskcdCkvOoqPHn6sHVvz/
	sqMYMAvqYPv5xLfB/a5+2vWn5c3fXtdVr5TobDZ3IKktCsKnIiQJ689WOCSZnEMGON0NZST+wby
	i1U18Em/t66h/wmprok4lE3MwdOffaG15NOKxgS+jZ0NIBFYzNUHU3w4LyMJF6l5N1wnGfXwBaw
	Y/5uPCnwgmzsxsz8VE7j+LnzRPs+yBNRkUVTf96Oyvi6ZHmidy/fRXrdJOv7Mx0UO6B9V7m8/4k
	RUYGn21n9egcVE01CWRJZBPRCVdWN0k5MMBuAStZzKMmfkN6k+0qiGWbaoZo0UHk0LkkXvBnv53
	FbXC135kiNoT4Iay9wxz+SIAG0/oQtLwvDO+5gQiqV+GVNk5LgGu+9JP11POwuENP1MmkeTpUqp
	c8BcDJqdbFnVtKuLiKmxkLYwTKaUBq5DaANGp9NMtPsv45ZCCfAAaEJ5+r8ckXrYLWiKDejFv0F
	+xA59U4D/MOaB/d
X-Received: by 2002:a17:90b:2d06:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ab3acdf2e1mr13286209a91.42.1792049621389;
        Thu, 15 Oct 2026 00:33:41 -0700 (PDT)
Received: from localhost.localdomain ([183.250.189.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94748c6csm3066274a91.10.2026.10.15.00.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:33:41 -0700 (PDT)
From: Yelin Fei <yelinfei66@gmail.com>
X-Google-Original-From: Yelin Fei <yelinfei@ruijie.com.cn>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: ubi: block: forbid direct reclaim I/O during synchronous read
Date: Thu, 15 Oct 2026 15:33:20 +0800
Message-Id: <d2657317d2d8f9cca201f09dbcd6d9b9b82744ba.1792046946.git.yelinfei@ruijie.com.cn>
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

From: Ye Linfei <yelinfei@ruijie.com.cn>

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
Signed-off-by: Ye Linfei <yelinfei@ruijie.com.cn>
---
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

