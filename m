Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E381248C3E4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452270; cv=none; b=jj+72bvQ1nQqCofr+Hzu1gH/Ea31CCiwyMli84OH+SEuRgqt//WXMDU+RjFgdplhOytOE5XyR80XAtijoejaGcMl1Z3ze2qqPnXT9KcGgDiiGft0mS1PxOWxmwARS70e2bEQgdGlloOGOpidYvxNf2rmtevb//bRljrsh8qKRE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452270; c=relaxed/simple;
	bh=fZWfemVvGtWHwkXGkFHBbHyg4qYhdtmmR0lL1dQLPlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQT9SPm7OHUbXKUYe9ew3eon7mbeLUtrNuE4gpZ+aG2BqKa6Fy80v/t2YRjdbHyQ22mLaHmv5+6klYMrDdCCaDa21VER13Gt4zS26+rKMm22Lfk7Q+ibJEy7UzDDZsqnvacnid3iXTNESyzmcOGhNMD3zKpK7SLkl7GJtf/oCgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faVNjPNz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faVNjPNz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso3961259f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791452264; x=1792057064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18VflGcr/rg7Q0V7PofkeOLJD464+eZLWISs5MFigS8=;
        b=faVNjPNz4kRzSy+yPiQg0h9gkiIgxhLu1p2ME+c+O3shzjRHkZjRaB0PBfuJWcOqEh
         zqS0stiU2eklyMf9U19SaiV2IWQWUYXfg1D20T3uNyNOB+ESx/hCnx1fS1jB4tF2Pd5p
         hsTxm43uerIMjcUBe2Q2QhPtZe/TQInVLuFTeveWIPC7RrBu3BxcZQKyTR9XU2Gfq7Hz
         V3br5YmA34kTo6U/BUWYc7sEShOkz1uZ7PsLWzRC61J4wR7aXIgeGfmA2dmY9SfRuaMY
         d+sNKrDQwV+qxOrDsyZd7V3mTypj5IowW7dE/TMgf16T7BiMsJGlH2DZ1Yd+0rK6UTrs
         KwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452264; x=1792057064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=18VflGcr/rg7Q0V7PofkeOLJD464+eZLWISs5MFigS8=;
        b=HLsoTm11m6Zr7OWuIKR0DkIDRX+IaKQU22Zt7Dxy1Miix3/duA8Wi4FSxd583A8T9d
         uefAgBNq/6VbHkqKDqs6AL/jF6M/JWmxdHQV64Pxpa4Lg3PJ/NY2lf57memUxI1hlntv
         kJe1e3ZLOhUsgz8R7zzVd2TVNgCiVywLBMIzSg0tK+66fLeQXrxx1dq2q+LjMGsLKwC2
         IjjsYA2fU4WqvFYtOrnlYiMukl2H0LgMgRgCdtVSRo7iPdJx3TcVCCAYGlXKCg708C21
         IiPwfeup2bpPUjy0NZoFXJ439bubRYXE6eWycsW6Rmc9Lo5eVbEPM4Yz+EGQ+GSTOvQt
         eF4w==
X-Forwarded-Encrypted: i=1; AKwUvBzBmiFoqIeI7TlRkzg/yk1q04DI50hJ+KXXuIiG4UWrtBZXw/wgyxaG28hz9w7L6I/PNtLQynJJGJcXKLI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg1e0TKX8PkncdoSDV03Q1B79/9fozzr8EjnsS763ngYXPazwe
	daXODBsjQ53WfH1DmMxh2CA7FZ4nOOMJ8ysKei+N9VyV+Ksd3Xx+MnM=
X-Gm-Gg: AYBFou3wyJGjS8O0JqinPIrgeCtoexYjREZbC5cFAz2IOvCBhY1j8iW8IibYCrLBWzs
	otl+Xteyu5nVK8bJGfXiz9acK2iIjmxz5JlEyY8qROpsGCosjwJVjMgWRbt6lLwIGjlvVBjNecd
	+ms83nmyetekaKTQ5TEvsQJ8CRwo/9Lw5+AzFVPjHchTNQFienHxYAqkau5Pmmkau8nrYDemneC
	bxRYlrum2CA/Tx8u3+kvT55cLQh16uD4x1Up/+4I7Hk0R74j+vPv7Z1E8gqmPWkQgal/zRfx2Tb
	6wJ5uJLCzPKcOmmFve0DiUv3iKfnb45+N879Oi7lvI5Qr70olnYFAiScqj7LaBEbekfQiGt/W8B
	2e3UyhpxJgfgLYUOR91/6/r0BKFookj32ETVGVl2D/X1P0M3mrQMjbkekb2VES07rm1886I44qx
	tq5zvI7+oOU1mWonIoGuMZOJH6WqNEQqO5BHqoNcx0
X-Received: by 2002:adf:e00b:0:20b0:48a:f603:1b41 with SMTP id ffacd0b85a97d-48c72787781mr6556444f8f.17.1791452264016;
        Thu, 08 Oct 2026 02:37:44 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7af45d94sm3649370f8f.12.2026.10.08.02.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:37:43 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v5 2/2] RDMA/rxe: copy send WQE to kernel buffer in completer path
Date: Thu,  8 Oct 2026 09:37:40 +0000
Message-ID: <20261008093740.3034881-3-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008093740.3034881-1-tristmd@gmail.com>
References: <20261007223222.2342804-1-tristmd@gmail.com>
 <20261008093740.3034881-1-tristmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

The completer reads send WQEs from the same userspace-mapped shared
queue as the requester. Even after the requester copies the WQE to a
kernel-private buffer (previous patch), the completer still reads
directly from shared memory, leaving it exposed to the same TOCTOU
races.

Fix by copying the WQE in get_wqe() to a completer-private buffer
using the full queue element data size (max_inline bytes). The local
copy is reused when the same WQE is being processed with unchanged
state, which preserves DMA progress across multi-packet RDMA READ
responses. A fresh copy is taken when the state changes or a new WQE
appears.

State transitions from the requester are observed through an
smp_load_acquire() / smp_store_release() pair. Completion status and
rd_atomic state are written back through WRITE_ONCE() before the
consumer index advances.

The copy is invalidated on QP reset and when the completion advances
to the next WQE.

Fixes: 8700e3e7c485 ("Soft RoCE driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/infiniband/sw/rxe/rxe_comp.c  | 53 ++++++++++++++++++++++++++-
 drivers/infiniband/sw/rxe/rxe_qp.c    |  1 +
 drivers/infiniband/sw/rxe/rxe_verbs.h |  6 +++
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_comp.c b/drivers/infiniband/sw/rxe/rxe_comp.c
index 1390e861bd1d7..5d8b692114a33 100644
--- a/drivers/infiniband/sw/rxe/rxe_comp.c
+++ b/drivers/infiniband/sw/rxe/rxe_comp.c
@@ -137,22 +137,69 @@ void rxe_comp_queue_pkt(struct rxe_qp *qp, struct sk_buff *skb)
 	rxe_sched_task(&qp->send_task);
 }
 
+/* Write back completer WQE fields to shared memory */
+static void rxe_comp_writeback_wqe(struct rxe_qp *qp)
+{
+	struct rxe_send_wqe *shared = qp->comp.shared_wqe;
+	struct rxe_send_wqe *local = &qp->comp.comp_wqe.wqe;
+
+	if (!qp->comp.comp_wqe_valid || !shared)
+		return;
+
+	WRITE_ONCE(shared->status, local->status);
+	WRITE_ONCE(shared->has_rd_atomic, local->has_rd_atomic);
+}
+
 static inline enum comp_state get_wqe(struct rxe_qp *qp,
 				      struct rxe_pkt_info *pkt,
 				      struct rxe_send_wqe **wqe_p)
 {
 	struct rxe_send_wqe *wqe;
+	u32 state;
 
 	/* we come here whether or not we found a response packet to see if
 	 * there are any posted WQEs
 	 */
 	wqe = queue_head(qp->sq.queue, QUEUE_TYPE_FROM_CLIENT);
-	*wqe_p = wqe;
 
 	/* no WQE or requester has not started it yet */
-	if (!wqe || wqe->state == wqe_state_posted)
+	if (!wqe) {
+		*wqe_p = NULL;
 		return pkt ? COMPST_DONE : COMPST_EXIT;
+	}
+
+	/* Pairs with smp_store_release() in rxe_req_writeback_wqe() */
+	state = smp_load_acquire(&wqe->state);
+	if (state == wqe_state_posted) {
+		*wqe_p = wqe;
+		return pkt ? COMPST_DONE : COMPST_EXIT;
+	}
+
+	/* Reuse existing local copy if still processing same WQE
+	 * with unchanged state (preserves DMA progress for multi-packet ops)
+	 */
+	if (qp->comp.comp_wqe_valid && qp->comp.shared_wqe == wqe &&
+	    qp->comp.comp_wqe.wqe.state == state) {
+		wqe = &qp->comp.comp_wqe.wqe;
+		*wqe_p = wqe;
+		goto check_state;
+	}
+
+	/* Copy shared WQE to kernel-private buffer. Use max_inline
+	 * as copy size since it covers both SGEs and inline data,
+	 * which share the flex array.
+	 */
+	qp->comp.shared_wqe = wqe;
+	memcpy(&qp->comp.comp_wqe.wqe, wqe,
+	       sizeof(*wqe) + qp->sq.max_inline);
+	qp->comp.comp_wqe_valid = true;
+	if (qp->comp.comp_wqe.wqe.dma.num_sge > qp->sq.max_sge)
+		qp->comp.comp_wqe.wqe.dma.num_sge = qp->sq.max_sge;
+
+	wqe = &qp->comp.comp_wqe.wqe;
+	*wqe_p = wqe;
 
+check_state:
 	/* WQE does not require an ack */
 	if (wqe->state == wqe_state_done)
 		return COMPST_COMP_WQE;
@@ -454,6 +501,8 @@ static void do_complete(struct rxe_qp *qp, struct rxe_send_wqe *wqe)
 	if (post)
 		make_send_cqe(qp, wqe, &cqe);
 
+	rxe_comp_writeback_wqe(qp);
+	qp->comp.comp_wqe_valid = false;
 	queue_advance_consumer(qp->sq.queue, QUEUE_TYPE_FROM_CLIENT);
 
 	if (post)
diff --git a/drivers/infiniband/sw/rxe/rxe_qp.c b/drivers/infiniband/sw/rxe/rxe_qp.c
index 77606c4a039b1..450254a131017 100644
--- a/drivers/infiniband/sw/rxe/rxe_qp.c
+++ b/drivers/infiniband/sw/rxe/rxe_qp.c
@@ -582,6 +582,7 @@ static void rxe_qp_reset(struct rxe_qp *qp)
 	qp->req.wait_for_rnr_timer = 0;
 	qp->req.noack_pkts = 0;
 	qp->req.send_wqe_valid = false;
+	qp->comp.comp_wqe_valid = false;
 	qp->resp.msn = 0;
 	qp->resp.opcode = -1;
 	qp->resp.drop_msg = 0;
diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.h b/drivers/infiniband/sw/rxe/rxe_verbs.h
index a22dfc6e5ae3c..6205dbc29dff6 100644
--- a/drivers/infiniband/sw/rxe/rxe_verbs.h
+++ b/drivers/infiniband/sw/rxe/rxe_verbs.h
@@ -130,6 +130,12 @@ struct rxe_comp_info {
 	int			started_retry;
 	u32			retry_cnt;
 	u32			rnr_retry;
+	struct rxe_send_wqe	*shared_wqe;
+	bool			comp_wqe_valid;
+	struct {
+		struct rxe_send_wqe	wqe;
+		struct ib_sge		sge[RXE_MAX_SGE];
+	} comp_wqe;
 };
 
 /* responder states */
-- 
2.47.3

