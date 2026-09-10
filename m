Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AB13C1D48
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029453; cv=none; b=BOG0r0VXnYvrtCJG6beUziYEx5l+nYvBFbW9yKauK54T0V1LSwpzD9dHUbuWFAf7Ux57PRRMBBzsPc0BIMyQ9kdvC0ahFXFn5M+5XKbD0zQiaxhHMLlD+jTF+EQs5QWzHpuY9GNycr8VJfWciWlTapVd9t8mAJb/FTD8tKRDVug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029453; c=relaxed/simple;
	bh=Bm6qwae6rfMoystER1qjRoOGRKrM3ILl+z/TuAPgV6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pB3niOp6JT5gZcQ9eHrHQ87MQvJAFCnu8w5ExxByfiIiXd4GdkkUCOgd7wxYargOPacDT/sf/OI47Ix7ssWgiTzhaNKB4ivkd5/tVT2QAKaW0nO3X11gMO4d9gY4eD1qsP80NVKqw/eZuH1Vub3ZnIS033WYeMuWDb/otH9Wfbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=giHvLtj/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="giHvLtj/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d157f691cso1934435e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789029450; x=1789634250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJIiEj4Fo7EXptzZ3xyRq/QCKCVnUyOIwhQjeCmiD+o=;
        b=giHvLtj/IZylj2Mk6u6XfNypzfX4+2b1Ool7y0a9QRmWShDZbPBH+xYGlBw+5hHdQy
         4CQYsxGvSmHlh3xFYGcWgGjE9Q9BD0uRBzPlzmEJth6z5JmgnnOMuxX2HHYFdbGO3e79
         43tiv2EiZNMNVtiaZ51/Qg4Iuw8SlqcJh9aI9Z5NfVfNfmRsNykgWmv1MJaklzkmhofK
         DpLO0svTDT7fLB4zVWlV8qfmpxa3rugdPKfGT8HSbiLowwxpD3j+lCxWm0fps65IsT/O
         JuC4lAVbcXCaOtq26QeVMVGIBkiofl9MvQdZSapd09ExIePsnmZCizpSk7vHc6SiIl8o
         SxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029450; x=1789634250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJIiEj4Fo7EXptzZ3xyRq/QCKCVnUyOIwhQjeCmiD+o=;
        b=agMCi9PHCG4jb4nEVQbdJooizzWhvZKtj9ewocFOi1z5UXWKAgnhMzg+Ia8zQodsrH
         fpmXovjvtp+u1Ye8i8Dqgu5gwOJa9YvbiL3/H0cZWdupTXphWxC/Ne81Sq7S07vTo2y7
         gOpB5jfAg1UBv/ODu9HhrIJRllNmgTn6sKGD6WOMDh/s3YWZM6IkjIFKyftjAuAfr+t7
         RBi0EYEhFoCv39UdQvUr6KKdjVAFRPRaG+QQ25t7jNRSbo5PgUGeHSXqdLLlUXULLezh
         yRpBodeSy6V/a5E+Is/soYpZo1C7b4BawXCKcbaMe5xEit9l8GHMSyqcGtXbuMFqRaq9
         CJNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2dga84t3ZA3PwuB0C6wyH2Wj1GK6KmBNS1woTAC8CRPyd7oTwgZwj93ROF/TW8pjFGMuvIqlaHvjnEk0=@vger.kernel.org
X-Gm-Message-State: AFuF++mXlWUf4LPSMM3wU3Z72fsxXHR7cgnitrp2bOnUU9s7jXRcpqcr
	Y+rlwKmfIvxhBAi/3cLGH+L5bhCf4Fw5GPBxLaoF/2PRrdOeRsqvGWfDpvXlxt5Iwqc=
X-Gm-Gg: AYBFou06v4vrhiInmadRF5tbxMl+ju6S6yElTHHoab6vTsfeOnXCkaOXNEmJ7F7Vbsy
	ZBFYUTZ0fVYjm1RJ201JkfNGvPPJaAaF66Hu5Qhz+m8F7iHNx7IniO+hz2WNdU+ZAOlKdk+tOt7
	jasQj3TEbr4Uz+TFOEGG444bLBPVRfQ34I/fRdE6Hk7sOTkeF5zWqyjFld9HUmzUS8Y3+TGWZXN
	YGji7+G1cIzvrMfhu4KtR4zAeYu5HaFJ0jcKTMrLWrpuxyZUyNJoYzkbAlx00nY1xV/7hdbDjFd
	GbW74esFvWh8bimzIm0JRT2kvS/f7WWv0lglt0n3bfOZEs0UwjhEEqKp3xq4N+3Zq8AaAn3SL7Q
	Ls4FsvkcfeAFtILOXxUb87snpuhsnCdeuDcM6qjLzEcay+iIr94U0SBF9/VdHzcknkItpIq+z6U
	MfhsUGAWlmDLUOOUMzAJ/GWSk7wIOCNhWuFAZFwKjMmjnk9W3wbD3vQgemTdABOagkk5ffF5ZMA
	OdVHOLO9vezGx6aKLoMtEmAocfhbzJ0dS/BlR8MmvftWZk=
X-Received: by 2002:a05:600c:474a:b0:49c:ff81:e062 with SMTP id 5b1f17b1804b1-49d276628c8mr27402325e9.2.1789029449895;
        Thu, 10 Sep 2026 01:37:29 -0700 (PDT)
Received: from nicolas.morey.ovh (lfbn-ann-1-199-252.w86-200.abo.wanadoo.fr. [86.200.161.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bc5fsm57007895e9.3.2026.09.10.01.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:37:29 -0700 (PDT)
From: Nicolas Morey <nmorey@suse.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Moni Shoua <monis@mellanox.com>,
	Amir Vadai <amirv@mellanox.com>,
	Haggai Eran <haggaie@mellanox.com>,
	Kamal Heib <kamalh@mellanox.com>,
	Doug Ledford <dledford@redhat.com>,
	linux-rdma@vger.kernel.org (open list:SOFT-ROCE DRIVER (rxe)),
	linux-kernel@vger.kernel.org (open list)
Cc: Nicolas Morey <nmorey@suse.com>
Subject: [PATCH v3] RDMA/rxe: Sanitize receive WQE in local buffer
Date: Thu, 10 Sep 2026 10:37:12 +0200
Message-ID: <20260910083712.1595862-1-nmorey@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For both SRQ and non-SRQ receive paths, the WQE is copied from shared
user memory into a local buffer to provide a kernel-owned copy. However,
several issues remain:

1. Double-fetch TOCTOU race: Reading wqe->dma.num_sge directly from
   shared memory allows the compiler to re-fetch it between the bounds
   check and memcpy(). Furthermore, memcpy() copies num_sge from
   shared memory, leaving an unvalidated value in the local buffer causing:

      BUG: KASAN: slab-out-of-bounds in rxe_receiver+0x8109/0x9ec0 [rdma_rxe]
      Read of size 4 at addr ffff88812c4867f8 by task kworker/u9:6/361
      Workqueue: rxe_wq do_work [rdma_rxe]
      Call Trace:
       rxe_receiver+0x8109/0x9ec0 [rdma_rxe]
       do_work+0x149/0x610 [rdma_rxe]
       process_one_work+0x726/0x10a0

      The buggy address belongs to the object at ffff88812c486000
       which belongs to the cache kmalloc-part-13-2k of size 2048
      The buggy address is located 0 bytes to the right of
       allocated 2040-byte region [ffff88812c486000, ffff88812c4867f8)

2. Uninitialized DMA state fields: cur_sge, sge_offset, length,
   and resid are copied directly from userspace without validation or
   initialization. A malicious or malformed WQE can supply an arbitrary
   cur_sge or sge_offset, leading to out-of-bounds array indexing in
   copy_data().

Consolidate WQE validation into a helper recv_wqe_sanitize() that
- Uses READ_ONCE() on user_wqe->dma.num_sge and sizes the copy with
  struct_size().
- Overwrites kernel_wqe->dma.num_sge with the validated value.
- Resets cur_sge and sge_offset to 0.
- Calculates and verifies length and resid from the SGE table using
  check_add_overflow() and bounds-checks against RXE_PORT_MAX_MSG_SZ.

Fixes: 8700e3e7c485 ("Soft RoCE driver")
Signed-off-by: Nicolas Morey <nmorey@suse.com>
---
v2 -> v3:
 - Extended fix to sanitize cur_sge, sge_offset, length, and resid (Sashiko).
 - Added READ_ONCE, struct_size, and check_add_overflow helpers.
 - Consolidated RQ and SRQ sanitization into recv_wqe_sanitize().
 - Dropped Reviewed-by tag due to substantial changes.

 drivers/infiniband/sw/rxe/rxe_resp.c | 70 ++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 19 deletions(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_resp.c b/drivers/infiniband/sw/rxe/rxe_resp.c
index 02b16e2b49b8..d686bad3c03c 100644
--- a/drivers/infiniband/sw/rxe/rxe_resp.c
+++ b/drivers/infiniband/sw/rxe/rxe_resp.c
@@ -257,6 +257,47 @@ static enum resp_states check_op_valid(struct rxe_qp *qp,
 	return RESPST_CHK_RESOURCE;
 }
 
+static enum resp_states recv_wqe_sanitize(struct rxe_qp *qp,
+					struct rxe_recv_wqe *kernel_wqe,
+					struct rxe_recv_wqe *user_wqe,
+					int max_sge)
+{
+	unsigned int num_sge;
+	unsigned long length = 0;
+	size_t size;
+	int i;
+
+	/* don't trust user space data */
+	num_sge = READ_ONCE(user_wqe->dma.num_sge);
+	if (unlikely(num_sge > max_sge)) {
+		rxe_dbg_qp(qp, "bad num_sge > max_sge\n");
+		return RESPST_ERR_MALFORMED_WQE;
+	}
+
+	size = struct_size(user_wqe, dma.sge, num_sge);
+	memcpy(kernel_wqe, user_wqe, size);
+
+	for (i = 0; i < num_sge; i++) {
+		if (check_add_overflow(length, kernel_wqe->dma.sge[i].length, &length)) {
+			rxe_dbg_qp(qp, "message length overflow\n");
+			return RESPST_ERR_MALFORMED_WQE;
+		}
+	}
+
+	if (unlikely(length > RXE_PORT_MAX_MSG_SZ)) {
+		rxe_dbg_qp(qp, "message length too long\n");
+		return RESPST_ERR_MALFORMED_WQE;
+	}
+
+	kernel_wqe->dma.length = length;
+	kernel_wqe->dma.resid = length;
+	kernel_wqe->dma.num_sge = num_sge;
+	kernel_wqe->dma.cur_sge = 0;
+	kernel_wqe->dma.sge_offset = 0;
+
+	return RESPST_NONE;
+}
+
 static enum resp_states get_srq_wqe(struct rxe_qp *qp)
 {
 	struct rxe_srq *srq = qp->srq;
@@ -264,9 +305,8 @@ static enum resp_states get_srq_wqe(struct rxe_qp *qp)
 	struct rxe_recv_wqe *wqe;
 	struct ib_event ev;
 	unsigned int count;
-	unsigned int num_sge;
-	size_t size;
 	unsigned long flags;
+	int err;
 
 	if (srq->error)
 		return RESPST_ERR_RNR;
@@ -279,17 +319,13 @@ static enum resp_states get_srq_wqe(struct rxe_qp *qp)
 		return RESPST_ERR_RNR;
 	}
 
-	/* don't trust user space data */
-	num_sge = wqe->dma.num_sge;
-	if (unlikely(num_sge > srq->rq.max_sge)) {
+	err = recv_wqe_sanitize(qp, &qp->resp.srq_wqe.wqe, wqe, srq->rq.max_sge);
+	if (err) {
 		spin_unlock_irqrestore(&srq->rq.consumer_lock, flags);
-		rxe_dbg_qp(qp, "invalid num_sge in SRQ entry\n");
-		return RESPST_ERR_MALFORMED_WQE;
+		return err;
 	}
-	size = sizeof(*wqe) + num_sge * sizeof(struct rxe_sge);
-	memcpy(&qp->resp.srq_wqe, wqe, size);
-
 	qp->resp.wqe = &qp->resp.srq_wqe.wqe;
+
 	queue_advance_consumer(q, QUEUE_TYPE_FROM_CLIENT);
 	count = queue_count(q, QUEUE_TYPE_FROM_CLIENT);
 
@@ -314,22 +350,18 @@ static enum resp_states rxe_get_recv_wqe(struct rxe_qp *qp)
 {
 	struct rxe_queue *q = qp->rq.queue;
 	struct rxe_recv_wqe *wqe;
-	unsigned int num_sge;
-	size_t size;
+	int err;
 
 	wqe = queue_head(q, QUEUE_TYPE_FROM_CLIENT);
 	if (!wqe)
 		return RESPST_ERR_RNR;
 
-	num_sge = wqe->dma.num_sge;
-	if (unlikely(num_sge > qp->rq.max_sge)) {
-		rxe_dbg_qp(qp, "invalid num_sge in recv WQE\n");
-		return RESPST_ERR_MALFORMED_WQE;
-	}
-	size = sizeof(*wqe) + num_sge * sizeof(struct rxe_sge);
-	memcpy(&qp->resp.srq_wqe, wqe, size);
+	err = recv_wqe_sanitize(qp, &qp->resp.srq_wqe.wqe, wqe, qp->rq.max_sge);
+	if (err)
+		return err;
 
 	qp->resp.wqe = &qp->resp.srq_wqe.wqe;
+
 	return RESPST_CHK_LENGTH;
 }
 
-- 
2.54.0

