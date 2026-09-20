Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B93D33DEC2
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789922293; cv=none; b=ousKw7wL1ab5R0WIAlU+gZd54v84WG/y2mm/2Yh3aejVENHs/3GYsFm0zl7dia278fjayTIbGf2PJRoxXcC4nKGHnxiiqn4iPcLcvJgGomjusiU9Y/Yr/RoaiKAFsbdwfMW+6KXaN9vxjek/7aMhHrLf8UT7v0BeVTU71tz9c+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789922293; c=relaxed/simple;
	bh=rDv/W22ePbYyKp22YgESjKCd5Rrxe0kYDef+tOGzx64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IoQ2bkeSuxzaFq3vM8/stRl8TBNMaudO4N74AkrE4HnpoYlyJj+MfhEcY9Gr7jPF160hOScabKOdJfcnkyTdcEAYRJVmSGPGmXYzkTS35QMF3J9VrB/EZUY/DDMmZGli9yzKGVGDpI4unwTcGuGZfGgqKQN3W7UMhT7Mgm5lwt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiREKi7X; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiREKi7X"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso1486857a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789922292; x=1790527092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocH8X1s2HOFa2KmE9/zFLWAAzVth74Tekaym0qewjiE=;
        b=LiREKi7X7ZIkNEOb6gccfR6rE+EaTXqoU3qxbNU6HuWjJZqVVrJsYrUxFbBL6bNJy7
         H7Lu3c0VEaw0j7eH7Hrgd1etKSjtVL6y6c1YVUWUUAqJJ3K1iNYf37DqCn8DQCP0ZOF1
         sC6ZlU2xkIGDm3WPzBxkD+HK8etyWOJSWabyL8DfYCdYF7kQoCc3wp1biOl6NKTJ2xCW
         epKSwS+MCF+zAk3IQ5D4YbXMBZ4kgHwCEme5+QSlBQgzXBNg0VzFwUhOx7dFr6cZ+3iW
         +k5ljkoY9dFAiC90BTxzJ4MBPU4a//MMzr0sorNRlkdHOxJVceU94/OyHSPyjwhwOnfd
         DKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789922292; x=1790527092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocH8X1s2HOFa2KmE9/zFLWAAzVth74Tekaym0qewjiE=;
        b=jP+AtTpZxo1g+TDdx8Jv/hhS39cYuMIznfpIysi3gVkcHdh1yC+bGhcl+Clx/VPuq/
         BAPdkexoUyhiZsJ415/ixrIBqOQF7xKeXYrNd+r87rFaMJPKjqU8aA3N+T5IvCMuzQaM
         0pnxLH9BcpBYL3nDT1Nw4jZLbFqvU+tgx2r4fq7kPAIkfHUukJ31aNBZA7lBolsaH1hm
         kl6b/O2IX32BafKj7njACo0wXCilXVZshGhMyFL/HydYCGyABnePCzD2ikhbtUqSh7QJ
         SkrbdinDFiSy6oZzfyHzSLhnb+jQIw4KVo5bIJZScu14+/F4o1oCEb8aAdJmXNsP7IJq
         uPIg==
X-Forwarded-Encrypted: i=1; AKwUvBy2pmEs96UCNcc8k7LPwdWoe+Fz05oFKqEPKliwG0gM6Up2VGmpN09InwVIsBpb1kSewWQqhIx5AnlbBbU=@vger.kernel.org
X-Gm-Message-State: AFuF++kjFujxCJuT4mvDTnQiTDrpxIbO+zPPIwGWXyUFUtOhgX9AOGDi
	Tq9X7EumpFVJFPG/Q0LIYhDGnchlYo+qlZ8csIiDGgft9rc+mPzzYe9T
X-Gm-Gg: AYBFou11SmNevCdIcSBnZMxg2sgrb1plnuiyJMf5BpdJBSueDUqx03mYXW/CtFEMlZ0
	Xl6yeFTKlDM34eBLyl7LH/uZKQ0TS9ipA9aPIRkl5Les6xMjlo5i1WTH7cfBQ87BKGLVvuZtNTS
	dSd4Z/QP0YOEiafC+k3/VMT8zJkniIHEx0MvatqwKUC46ND67JuRlLOlT2tLRJivwNaPK5uLnI3
	I7226UV7CHB9NMNLVLkbU7B26i+s5Db+3qZ/6glEV7ZuGY00m2dYY9YjFR73UYJme+3DZbUNHTw
	LEIdc4wbxJOAgiHoc+lKL1/Bd/Mvl48EM5JgDOievRArz6YTxk7k4cg6P4JD5xEsPoJcBb5YrmG
	aFv6e/FiNX4PmR3ZY0VvVEQc0C2rTIGmRiUID7ylBcosURZ5AqGqgYDzDqbicFp3rQab5os2fZ1
	VtxiTmtL8+qJxVTbdM8r8KmE5Y3K5a/Q0niBoWuL+t09ThNDK0dEVqTE8VCWwlZy2mL7IwYAB0q
	591QWnyQoyfjAc=
X-Received: by 2002:a17:90b:17cc:b0:39e:135e:130e with SMTP id 98e67ed59e1d1-39e54af6a0emr13628763a91.3.1789922291762;
        Sun, 20 Sep 2026 09:38:11 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:2022:c2a9:de8:d005])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5647c151sm5267536a91.4.2026.09.20.09.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 09:38:10 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Daniel Wagner <wagi@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+77955102efac681ec73b@syzkaller.appspotmail.com
Subject: [PATCH] nvmet-fcloop: fail LS request synchronously when remote port is gone
Date: Sun, 20 Sep 2026 23:38:04 +0700
Message-ID: <20260920163804.67858-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fcloop_t2h_ls_req() handles a missing remoteport by queueing the request
on tport->ls_list and completing it with -ECONNREFUSED from a work item.

nvmet_fc_delete_assoc_work() sends the Disconnect Association LS this
way. When it runs during nvmet_fc_unregister_targetport(), the work is
queued after flush_workqueue() has started, so it is not waited for.
nvmet_fc_free_pending_reqs() then frees the still-pending lsop and the
late work item calls lsreq->done() on freed memory:

  BUG: KASAN: slab-use-after-free in fcloop_rport_lsrqst_work+0x242/0x2e0
  Workqueue: nvmet-wq fcloop_tport_lsrqst_work
  Allocated by nvmet_fc_xmt_disconnect_assoc
  Freed by nvmet_fc_free_pending_reqs
           nvmet_fc_unregister_targetport
           fcloop_delete_target_port

Return -ECONNREFUSED directly instead. __nvmet_fc_send_ls_req() unwinds
and nvmet_fc_xmt_disconnect_assoc() frees the lsop, so no completion is
left outstanding.

Reported-by: syzbot+77955102efac681ec73b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=77955102efac681ec73b
Fixes: bbccbf791e6f ("nvmet-fc: free pending reqs on tgtport unregister")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/nvme/target/fcloop.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index b63af3b643a6..9f9fb40f8a97 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -456,21 +456,18 @@ fcloop_t2h_ls_req(struct nvmet_fc_target_port *targetport, void *hosthandle,
 	 * 1:1 tgtport vs remoteport
 	 */
 
+	/*
+	 * Fail synchronously: an async completion can run after
+	 * nvmet_fc_unregister_targetport() has freed the pending lsreq.
+	 */
+	if (!tport->remoteport)
+		return -ECONNREFUSED;
+
 	tls_req = kmem_cache_alloc(lsreq_cache, GFP_KERNEL);
 	if (!tls_req)
 		return -ENOMEM;
 	tls_req->lsreq = lsreq;
 	INIT_LIST_HEAD(&tls_req->ls_list);
-
-	if (!tport->remoteport) {
-		tls_req->status = -ECONNREFUSED;
-		spin_lock(&tport->lock);
-		list_add_tail(&tls_req->ls_list, &tport->ls_list);
-		spin_unlock(&tport->lock);
-		queue_work(nvmet_wq, &tport->ls_work);
-		return ret;
-	}
-
 	tls_req->status = 0;
 	ret = nvme_fc_rcv_ls_req(tport->remoteport, &tls_req->ls_rsp,
 				 lsreq->rqstaddr, lsreq->rqstlen);
-- 
2.43.0

