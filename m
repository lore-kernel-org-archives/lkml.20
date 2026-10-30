Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373364;
	b=A9XLNQ7SBmuESumyI3+O7U/sKzHQZCETbKG13Ek+9WpqgiKQl47SLYSZemLm58vOlOr0
	 6VLLzQM6u4/A6ZJlqH6gk6NnlqJR7cSLhZRFCy3+SwotsFAOT4PLKamZfdH1aURxLZ4D5
	 M5hnD4ZZ8/18/oqYyqw/sVsm6eg4622O/8cKQa5Pb6giCPJ/aqq7DSfzG+YH9SC2QHUy3
	 2+jcHrL7LGpLVI6B7caZ4AAZnF71Aod8nPGQ5g9tJfSAqjMQ5XcFU6xotHEbpfbQVOS9/
	 +8N4QopvndS4JfcedUpsVrM9soS7NO6M5W7C71yl+tn2s0msSWwoicmlvTe0xbkbraw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9uA/IfCkiaIeDnjEur6PD87lpfcM5Ji//ButOxh5saQ=;
	b=ySBIlbrxPen230uDarmqBzYc51m7SEpSzn72QOa+7f8mZ9jeqNfFRVblg1j6LP3xJ9Z0
	 aegazAPXSS3oyIKBVnGP9MteUgKDVK3LdeOT5fAfm1ihoLGqR4CIDN7iBGkoxkmLjeqGt
	 DEY1ZZIkDVTSno4akZUamZ3rsEOVeBxyO9vvGJNTK7TlM0crdknTWvEWwivuC6RWOy+vs
	 IoDPl9OmwH/8WjU0ZEuLpsccNuOvMJ6BsjoUHlPe6dFPrvpb/7PXoCXKqqcXpV3Fk+7nh
	 XTYu7vZCcZi7xTHVsQYgzD1oTVDi8IGt//2xxfwVSNXmDx48D/3/vuL64PSAaNPb0nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrGgEkfj;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8693606A333
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8693606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrGgEkfj
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e00eee27dso476839f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373362; x=1793978162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9uA/IfCkiaIeDnjEur6PD87lpfcM5Ji//ButOxh5saQ=;
        b=MrGgEkfj0lQIVjNHAQytoBIgwZzsnFhNTCvHc+YcE6hzm+Zakb+PLOvToKJV1GAfpt
         67qWrZWbc+4L0F4F0RmkzwRhtUToYJBcnZYt79rqX7LAVtAxr027Us/xNPSBaZ6j/rBH
         EkzKH48BgMrzKjb002thIHucOGUFj6cocDOvP8msk3i36karF01Ta8l+ZUyj84m1/ypP
         zRzIcm8rW4hwf3tC4Ih1I9a/hRcoTHCKY5ACr8hRFwY15KbvIifwIZ8CDJXiN4V/0NbX
         TfLWDuaBPjwnmciwDQiiaG7Sonyh1Om9BLG5kXq8gKm8IMkOGQvFg09PSAVOzJsGyjxe
         vDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373362; x=1793978162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9uA/IfCkiaIeDnjEur6PD87lpfcM5Ji//ButOxh5saQ=;
        b=uBnd+Z4FuNFF5usBvxw7H5WHpuEs3NR9zrisqRi+jbFoyIvys9clXPRHh0YsXtaMW+
         kXIv3tBmLtKiivD67wHLCgedpkt/+Uj3BkGUGAb/dY9Lgwtx+sNze21HyNyFtUEnGIyu
         jGG/lKAem33haa7HbNqAyBU0vIG3/vO91qWrGL78vLBNi/kLlMhWQv0RywMadLPBPOiI
         7S+WzQl+rXtJFDSw0RKQ4daJtWy0xLNOJvmsvWZ213RxLD3dmMhxcI2lqyiroPTe2FUP
         nMyYbHKVQ4W0jE4y4YspNP6CWPaCrlKrENlott851vjKKv4kwXC/DY5zaSMG95Y1+Hv5
         tLdw==
X-Forwarded-Encrypted: i=1; AKwUvByXjbPVKh0uoKL7g4HWj7lH858kJUSbFyIu4u1HQs/buO7Tno4qhVITeDN61ZXyheZS1mJCwH5OeQPb+rc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIp3HkUiKy11dIBcsGV8gJ7bZxIKcyAtpU4h6CEbyVNunyGca6P
	ew93nXF8MikemOUQUatGmXTvnRJvgucX6HOgCJYnWmIizMxFpFpenQk=
X-Gm-Gg: AYBFou1GPoA8n1srsHvUc3XgAqYP82CdMxS3dLM/ESQ01+LYZBk8y+4bAkz2JD931Uh
	sh9RCltsyp95oDN9Bk5eBvoJc/3BToQ076bwUZ3c29sfIRNmCmqn+kXcEtkA8sJERomP3oq+vWm
	KR/HslG0G8iF4jAQdnV4Opn33/EufgNBGaoFJaWtuLxDpDWFzhrBDoyNHnHbRCcvi3KgZUdW0eg
	ZHbM2GBK8MGrqURgZJKCPbrovRs55CvY2xZ6F8lHtgtGqqI9flB5nlsK5HObbSS4lZ/rCQbZC/y
	rY4v1LLXS+55tuzRt7macqz51p81r4F/O6CsF1U7VxFElpantibyyQs1szArGVSi93NJ66F5iJD
	/uicEWWLrMgP/36YZm7I5ORGjbPMjHp1d9dxpr0mBNxoVo+6NAdJh721SDwMOELVQdEsb+Hwui9
	uyP68x9hDsB3gBqKcb1Is+L/srmIYozrS1RNA8fcGTmxCm2i1lNwIDC5UL1ePK4qPzhxFDvVUWB
	zMDvCinu+UtgiNzWm8sGdGIFFEHuUAJqBKUdLOWQnocbRFtm9Lp02tYMhtm+wIdffwLX7+JzHQN
	naYHenmlGFU=
X-Received: by 2002:a5d:5f4d:0:b0:48c:77e3:6c8e with SMTP id ffacd0b85a97d-48e6e50042bmr6286721f8f.49.1793373362184;
        Fri, 30 Oct 2026 08:16:02 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm3268511f8f.58.2026.10.30.08.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:16:01 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: Zhu Yanjun <yanjun.zhu@linux.dev>,
	Bob Pearson <rpearsonhpe@gmail.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 2/2] RDMA/rxe: copy send WQE to kernel buffer in completer path
Date: Fri, 30 Oct 2026 15:15:57 +0000
Message-ID: <20261030151558.1458444-3-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030151558.1458444-1-tristan@talencesecurity.com>
References: <20261030151558.1458444-1-tristan@talencesecurity.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The completer reads send WQEs from the same userspace-mapped shared
queue as the requester. Even after the requester copies the WQE to a
kernel-private buffer (previous patch), the completer still reads
directly from shared memory, leaving it exposed to the same TOCTOU
races.

Fix by copying the WQE in get_wqe() to a completer-private buffer
using the full queue element data size. The local copy is reused
when the same WQE is being processed with unchanged state, which
preserves DMA progress across multi-packet RDMA READ responses.
A fresh copy is taken when the state changes or a new WQE appears.

After copying, reject invalid opcodes (above IB_WR_REG_MR), out-of-
bounds num_sge, and invalid cur_sge by transitioning the QP to error
state through COMPST_ERROR. This prevents OOB SGE walks in copy_data()
from corrupted DMA indices.

The state read from the shared queue is preserved via smp_load_acquire()
and restored after the memcpy to prevent a concurrent userspace write
from overwriting it with a stale value.

DMA progress (resid, cur_sge, sge_offset) is written back alongside
completion status and rd_atomic state, ensuring retries can resume
from the correct offset rather than restarting from zero.

The cache is invalidated on QP reset, when a completion advances to
the next WQE, and on retry to ensure the retried response gets a
fresh copy with the updated PSNs from the requester.

Fixes: 8700e3e7c485 ("Soft RoCE driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---

Changes since v6:
  - Fixed all sashiko AI review findings (2 Critical + 9 High).
  - FORTIFY_SOURCE: memcpy into enclosing struct, not inner member.
  - Copy size: max(max_sge * sizeof(ib_sge), max_inline).
  - Opcode bound: IB_WR_REG_MR (was IB_WR_ATOMIC_WRITE).
  - Requester: removed silent num_sge clamp, use mask=0 for invalid opcodes.
  - Completer: validate num_sge + cur_sge, preserve smp_load_acquire state.
  - Both paths: DMA progress writeback (resid, cur_sge, sge_offset).
  - Completer: *wqe_p = NULL for posted state, invalidate on retry.
  - Addressed Zhu Yanjun review feedback.

Changes since v5:
  - Added opcode bounds check and num_sge clamp after copy.

Changes since v4:
  - Resent from the correct sender address.

Changes since v3:
  - Copy full queue element (max_sge SGEs) instead of per-WQE size.
  - Invalidate on QP reset, ERR flush, RESET state check.

Changes since v2:
  - WRITE_ONCE/smp_store_release for field writeback.

Changes since v1:
  - Split into per-path patches. Cache across multi-packet ops.
 drivers/infiniband/sw/rxe/rxe_comp.c  | 72 ++++++++++++++++++++++++++-
 drivers/infiniband/sw/rxe/rxe_qp.c    |  1 +
 drivers/infiniband/sw/rxe/rxe_verbs.h |  6 +++
 3 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_comp.c b/drivers/infiniband/sw/rxe/rxe_comp.c
index 1390e861bd1d7..cd4085a1bf2f8 100644
--- a/drivers/infiniband/sw/rxe/rxe_comp.c
+++ b/drivers/infiniband/sw/rxe/rxe_comp.c
@@ -137,22 +137,87 @@ void rxe_comp_queue_pkt(struct rxe_qp *qp, struct sk_buff *skb)
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
+	WRITE_ONCE(shared->dma.resid, local->dma.resid);
+	WRITE_ONCE(shared->dma.cur_sge, local->dma.cur_sge);
+	WRITE_ONCE(shared->dma.sge_offset, local->dma.sge_offset);
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
+		*wqe_p = NULL;
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
+	/* Copy shared WQE to kernel-private buffer.
+	 * Copy size matches the queue element data area.
+	 */
+	qp->comp.shared_wqe = wqe;
+	memcpy(&qp->comp.comp_wqe, wqe,
+	       sizeof(*wqe) + max_t(int,
+				qp->sq.max_sge * sizeof(struct ib_sge),
+				qp->sq.max_inline));
+	qp->comp.comp_wqe_valid = true;
+
+	/* Preserve the state we observed via smp_load_acquire()
+	 * since memcpy may have overwritten it with a stale read.
+	 */
+	qp->comp.comp_wqe.wqe.state = state;
+
+	/* Reject corrupted opcode or SGE indices, error the QP */
+	if (unlikely(qp->comp.comp_wqe.wqe.wr.opcode > IB_WR_REG_MR) ||
+	    qp->comp.comp_wqe.wqe.dma.num_sge > qp->sq.max_sge ||
+	    (qp->comp.comp_wqe.wqe.dma.resid &&
+	     qp->comp.comp_wqe.wqe.dma.cur_sge >= qp->sq.max_sge)) {
+		qp->comp.comp_wqe.wqe.status = IB_WC_LOC_QP_OP_ERR;
+		wqe = &qp->comp.comp_wqe.wqe;
+		*wqe_p = wqe;
+		return COMPST_ERROR;
+	}
+
+	wqe = &qp->comp.comp_wqe.wqe;
+	*wqe_p = wqe;
 
+check_state:
 	/* WQE does not require an ack */
 	if (wqe->state == wqe_state_done)
 		return COMPST_COMP_WQE;
@@ -454,6 +519,8 @@ static void do_complete(struct rxe_qp *qp, struct rxe_send_wqe *wqe)
 	if (post)
 		make_send_cqe(qp, wqe, &cqe);
 
+	rxe_comp_writeback_wqe(qp);
+	qp->comp.comp_wqe_valid = false;
 	queue_advance_consumer(qp->sq.queue, QUEUE_TYPE_FROM_CLIENT);
 
 	if (post)
@@ -788,6 +855,7 @@ int rxe_completer(struct rxe_qp *qp)
 							RXE_CNT_COMP_RETRY);
 					qp->req.need_retry = 1;
 					qp->comp.started_retry = 1;
+					qp->comp.comp_wqe_valid = false;
 					qp->req.again = 1;
 				}
 				goto done;
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

