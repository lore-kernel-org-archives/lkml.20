Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934DE436BC8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789913415; cv=none; b=SMr6SOjjx5fptMspfhWgQFecH8LKk6wT6m2oOxqDOUm5n9n64eX8MaMFXSIK5yjTZyNm4yZABKqIznEIXMPow9gJ0O34hzmTSBrm2wTXYzE1sbnUAs0gfKEtLn9c2VRw9zWQ0xyOo8PdTM7QpAR5qAZ0QSV2IWrvptCcCR8nTWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789913415; c=relaxed/simple;
	bh=xE5Th+T+q47uR+eRw2tXrCbhqFfG/KHZf9xKJXKqHYs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Ys57g/gkVyXKmdTyIKpxJxmTWA3kuJuYsFxlWRytyCWeO7TEpqrPEV9r0MRXX/8R6j3h4xfgyxJl5HxvUf4AXsAFsnf1lC+nOzFGjpNKedPByDbVgpQ+rMnHMSZ6QFMyoDAHApa+gVvEPehUfF/85SaM0eAwSEdDKdoyZnP+V1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6bc3374cb0cso1240078eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789913395; x=1790518195;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0sBbJ9/b2DWURdT9rlkpvRosWzvqTutodmGOna80EJ4=;
        b=qC5V6Ug295BAPfFYkshnC5igLL5UKLOOdWuvohMWc4vAYmv8D//SNvukiXaF3rs+eE
         yuvgDmx9coaAzrh8iZgskFd9d1XleZ78t3fmJq5o1rkDiMqwYM+Dxo/E0gsovec5mtvW
         izCXtfNavPZqutT0Iujsz4YQ6Lf+IZv+JF7dyQh5hWZ+PSDcAcZ8Gz3dOd86NOKTovGN
         5AfqBKcCs5MoL1TwgrZldRH1MOQ/AL6BYUmgkWTkGo1624k0puDQhkuvD+rcm7AuS/Up
         FEOHekd+obXqJgVATjSxqT+lE0H7DXab+F9MTq6WlT++mFcsnb3Q7ysDNGXNOEDriPja
         VpRw==
X-Gm-Message-State: AFuF++kjaaL9EwYxfohOCPu4oB3vFq4AS/aJXU7w0oDCjWXpxMfo6SJh
	s9s7DiOIjg8nxhz8O4QRudPdEV0+8X2SPTFZ/fiMgFK8H+pPCE1LbjwPh2RpkMGxi06cf+f8pPy
	BSNW5bL9iUNAQVj5TC7Uql+HvRsVnoLwbbT6ZRZ7kspOxv09k/m2wf53hQsQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:160a:b0:6b7:8396:f3c4 with SMTP id
 006d021491bc7-6ca9c24a3damr7099766eaf.38.1789913395511; Sun, 20 Sep 2026
 07:09:55 -0700 (PDT)
Date: Sun, 20 Sep 2026 07:09:55 -0700
In-Reply-To: <6aaf3eb5.3179f8cd.1e36b2.0006.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafe933.e548f532.1ca396.000b.GAE@google.com>
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

