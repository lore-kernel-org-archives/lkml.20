Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4AA2BE034
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789913199; cv=none; b=O7UXR+UVVV9cfeehjuKWi8gKBLxKEpwKOqLCI2HTAczcpRqiaIs9hhHs9cfVW43HXBoDWMoAueoF43TIbnTzwWzIQkn4BgKjA1Pct06TzcW1VUwD3e/dBL5ACxh8preb7wRjIr+ZnMb3SHb6QjtVehqeXYtQUNzSzKfP4eyaj+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789913199; c=relaxed/simple;
	bh=xE5Th+T+q47uR+eRw2tXrCbhqFfG/KHZf9xKJXKqHYs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WhqweJDE4WOvO8gzgb7+xyHZ4FvxxluBDGnynhoF5SKNQ0hhjaOnEl4EXUlWMUYIlyfI1JifKXP3oer875BwHm4KLCI58THWad4cmWAIMvSLnzS1c5SiUJl6yj4UjULx7pIyMyjxE7gNCjcY1NlMtxtNIaXOTCkkqSYXWVDaeIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1abf73d1fso1435121eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789913197; x=1790517997;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0sBbJ9/b2DWURdT9rlkpvRosWzvqTutodmGOna80EJ4=;
        b=Jmw4k9aTPhLuIsOt1x1avQ5dO+LZZGzoaiGa1Mb4UCYpmK9ZO3EAkg/x0wuQZt1bCv
         qkIwog5DdQph6wxbafDgu167Qn+zUdbyaf7oTzP82Zn4vWypEqRrjOFfrF7rXFr17Zzs
         IuZ/rXfB3Vhfo9LC3THqUtoYlTvaKQw8k/HqNnfLBKkr+aCB1EJJxGEIo1StTS+qToci
         4xtL1OlwySToLmSDoYnfud0bqkdNfMvuzVZ5hD+zNfWxNJGXLNlik8kpAAiWES2u6kuX
         ZJ9DW81TKpbxgQyvqvF9yDi/f4gw9as+7t9QpGF4mmPM0vQTHQqvnnWAqQmp8VPugJf6
         qp9Q==
X-Gm-Message-State: AFuF++lEU8cgHmlleZV6elwLHocrcQyHVU20B3BrtSR1rqObnetl4EAv
	dZvHtdhALBpJ2XAgy6PXhwRE33cLpy/SgeAGh42EATFrBp0d8sY4cnSKhR4PMJXXYeVFrOm3zqK
	cIih9xOmUApPkw65km6qz2nXjfbTl7lProMgIuOCRe2n3sXyMMGrKoQ2Ds3Q=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:624:b0:6c1:d1af:dd8b with SMTP id
 006d021491bc7-6ca9c94d65cmr7488406eaf.45.1789913196922; Sun, 20 Sep 2026
 07:06:36 -0700 (PDT)
Date: Sun, 20 Sep 2026 07:06:36 -0700
In-Reply-To: <6aaf3eb5.3179f8cd.1e36b2.0006.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafe86c.3179f8cd.1e36b2.0010.GAE@google.com>
Subject: Forwarded: [PATCH] nvmet-fc: fix use-after-free of nvmet_fc_ls_req_op
From: syzbot <syzbot+77955102efac681ec73b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] nvmet-fc: fix use-after-free of nvmet_fc_ls_req_op
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


nvmet_fc_free_pending_reqs() unconditionally frees each queued
nvmet_fc_ls_req_op (lsop) when a targetport is unregistered, but an
LLDD (e.g. fcloop) may still hold a pointer to that request queued on
its own async work, with no way for the target core to know.

If the targetport is torn down while such a request is still in
flight, the LLDD later dereferences the freed lsop when its completion
work runs, causing a slab-use-after-free.

Fix this by refcounting nvmet_fc_ls_req_op: one reference for the
core's ls_req_list, and one for the in-flight request handed to the
LLDD via ->ls_req(). The object is only freed once both the normal
completion path (__nvmet_fc_finish_ls_req) and teardown
(nvmet_fc_free_pending_reqs) have dropped their reference, whichever
runs last.

Reported-by: syzbot+77955102efac681ec73b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=77955102efac681ec73b
Signed-off-by: Deepanshu kartikey <kartikey406@gmail.com>
---
 drivers/nvme/target/fc.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 1b557775e033..a25f7579049d 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -56,6 +56,7 @@ struct nvmet_fc_ls_req_op {		/* for an LS RQST XMT */
 	bool				req_queued;
 
 	struct work_struct		put_work;
+	struct kref                     ref;
 };
 
 
@@ -339,6 +340,22 @@ fc_dma_unmap_sg(struct device *dev, struct scatterlist *sg, int nents,
 		dma_unmap_sg(dev, sg, nents, dir);
 }
 
+static void
+nvmet_fc_ls_req_op_release(struct kref *ref)
+{
+    struct nvmet_fc_ls_req_op *lsop =
+        container_of(ref, struct nvmet_fc_ls_req_op, ref);
+    struct nvmet_fc_tgtport *tgtport = lsop->tgtport;
+    struct nvmefc_ls_req *lsreq = &lsop->ls_req;
+
+    if (lsop->req_queued)
+        fc_dma_unmap_single(tgtport->dev, lsreq->rqstdma,
+                    (lsreq->rqstlen + lsreq->rsplen),
+                    DMA_BIDIRECTIONAL);
+    queue_work(nvmet_wq, &lsop->put_work);
+}
+
+
 
 /* ********************** FC-NVME LS XMT Handling ************************* */
 
@@ -347,7 +364,6 @@ static void
 __nvmet_fc_finish_ls_req(struct nvmet_fc_ls_req_op *lsop)
 {
 	struct nvmet_fc_tgtport *tgtport = lsop->tgtport;
-	struct nvmefc_ls_req *lsreq = &lsop->ls_req;
 	unsigned long flags;
 
 	spin_lock_irqsave(&tgtport->lock, flags);
@@ -363,12 +379,8 @@ __nvmet_fc_finish_ls_req(struct nvmet_fc_ls_req_op *lsop)
 
 	spin_unlock_irqrestore(&tgtport->lock, flags);
 
-	fc_dma_unmap_single(tgtport->dev, lsreq->rqstdma,
-				  (lsreq->rqstlen + lsreq->rsplen),
-				  DMA_BIDIRECTIONAL);
-
 out_putwork:
-	queue_work(nvmet_wq, &lsop->put_work);
+	kref_put(&lsop->ref, nvmet_fc_ls_req_op_release);
 }
 
 static int
@@ -406,12 +418,16 @@ __nvmet_fc_send_ls_req(struct nvmet_fc_tgtport *tgtport,
 
 	lsop->req_queued = true;
 
+	kref_init(&lsop->ref);
+	kref_get(&lsop->ref);
 	spin_unlock_irqrestore(&tgtport->lock, flags);
 
 	ret = tgtport->ops->ls_req(&tgtport->fc_target_port, lsop->hosthandle,
 				   lsreq);
-	if (ret)
+	if (ret) {
+		kref_put(&lsop->ref, nvmet_fc_ls_req_op_release);
 		goto out_unlink;
+	}
 
 	return 0;
 
@@ -1591,7 +1607,6 @@ static void
 nvmet_fc_free_pending_reqs(struct nvmet_fc_tgtport *tgtport)
 {
 	struct nvmet_fc_ls_req_op *lsop;
-	struct nvmefc_ls_req *lsreq;
 	struct nvmet_fc_ls_iod *iod;
 	int i;
 
@@ -1611,12 +1626,7 @@ nvmet_fc_free_pending_reqs(struct nvmet_fc_tgtport *tgtport)
 		if (!lsop->req_queued)
 			continue;
 
-		lsreq = &lsop->ls_req;
-		fc_dma_unmap_single(tgtport->dev, lsreq->rqstdma,
-				    (lsreq->rqstlen + lsreq->rsplen),
-				    DMA_BIDIRECTIONAL);
-		nvmet_fc_tgtport_put(tgtport);
-		kfree(lsop);
+		kref_put(&lsop->ref, nvmet_fc_ls_req_op_release);
 	}
 }
 
-- 
2.43.0

