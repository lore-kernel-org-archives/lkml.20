Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625568;
	b=EXhmWRv+tu3tXR30Z92+r9xDe/48q/ExEELIMavjV6+xap+AWpiaSp90KOX0Oifn0yZ9
	 ZAa4fTp0ll98LHPc8+B+HuBN4kRUYEPHhONN+DGXQXe1dPA0XunQq0dyBdLan3aqzKopK
	 AnhfpgYkjau9eToL2f2+XB2vJIRUAlDj/KA5igVVEvAeFFo8X5M8QKmcmrL5+dpEyxV2i
	 ncDn7treG/Dug4KDbUeP9SKaj8f2fFVVoz4QPsJP19a4VHzlldMNSqfPmBuNOzP2SXGVG
	 laUuasK6mLsrJyjtmlwcOWdGEhA8MuIvC87Z5WL/iJ7yslEASpo+80HIZqwrnzrAX+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sPGugwP5a+NZDPLjjDFcrKI3MvgB5lVarOa98f6lAQY=;
	b=UacbmrnSDgim99gfmqcE+kMLrtOF6JBKdDQ5jaxecy5mxxgmQ4XgVTxKaLhVxTsHIPpv
	 CvBFcfKNNEGt+zD/SO1v5NmVjil5UTN1t0DeCG8d6ELyVXOdWtyjPukHlxpTQJQO9GKHg
	 w7U5n9JFBi93y09vaNXb6TiF2dnoQ8mk1r0QJCloMuKBX1zY8L5O5kZBb0GONmMZWF0I6
	 +QovdYRuGVRp8xHaHG724RrQQRubathJsbqkVwMFh2gxroHPy0H2MJwPJXe3bJzjOx6+s
	 FeXvcmfaohyDeIoiOKM2uKftft1jqmCAG9Z/O9Ki1Bf1Yon1ap35bBwWwS+jEDFXG8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=VQtgmn75;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D1606D4C9
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9D1606D4C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=VQtgmn75
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3791619605cso3338963eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625567; x=1795230367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPGugwP5a+NZDPLjjDFcrKI3MvgB5lVarOa98f6lAQY=;
        b=VQtgmn7512HbQNy0H1MBdItX0NlSvKTRSS5CcAhyeAapbxMbpTKJWDWLFhRnnzzQQV
         YBtNocsjkYademqEDFNHDXeudNESCEGnZskxc5KNJ5orATsFDmE6u3Q+xqBDEA9qBM+1
         Xj0MIXbHlRUVIpUZbgl90AcMVYEl172qt9pBiHaexowdnqO49Pf3w1Qy/tfAJuflJvpS
         0foNIXTQKb7v4N/UoZjGNBuWLPr51GxeeXuLvBXOv6cgGmrgKnfnoVrRWhyd88KIgar2
         hYgVfjCatp7Ou0JVqhkMvXaRuWNGjJFQcXF9XVUoM6S1q5cOwy8bZEi/0r+yIHeN9Nzk
         aFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625567; x=1795230367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPGugwP5a+NZDPLjjDFcrKI3MvgB5lVarOa98f6lAQY=;
        b=0/W5TClOVY/gl3f086Mu8kjdFjdjsY0S0Uf3HFpFsR/8wxIPxGkMIg8U4XsRfbcDkC
         F3RXZsqNZLZeB8nZcYd8oDfFHcYTCQbpIGSq8E8eQYShNFU4xC1mecUuppsdqv93Pvnp
         jvsTL/EvMSW4UruepuyfAPbELQmOitLWwPBsicwMaZJc4KkWpAXxThlit7p2jrMrTuuP
         dOT/LVtjY1XRWpN+qpn0GjU37/oXGbo66xaUSDos88bX4SFvSE1IK+uPWo1x/ySO1Ckv
         tRbCRiX6/14/lAPXs4N1SC1jrTcpWCK5SG+eIu2BE/FJJz7JLBSk2COSJ+P/VjGf9QeB
         /zNA==
X-Forwarded-Encrypted: i=1; AL+hErHBhThvW9Lo4cLKgTw3zyPuMi5j8EVTWZvEB5XA1qxS+pBov4SEpHfqTkI3ktSiVeTCP1hPrAcqfjtapb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hdnfQld0JIex2FMBKIIaMbxwphN0xFAgq66WQKNxBG00sCa0H
	BaD5OEywlzoVAcOTInzAf8YL3/1lPuD0KM766oSdrv53jWauz4RmXLmKlPXOUygqZMg=
X-Gm-Gg: AYBFou1c0C05Lads6hdciUUEBCFOnviQrV6b9uwrlug8z2/P4wmDFebAl6jF5SqYAQr
	WO3hMecNFHE13SREl0GqF+SX61wTREP1FLlcUW7GmXpr/KWYw/sDYRhQv8+AFq2KLjz0I29GiZK
	KaPcLbX+FvPwkOGYcpwy6QhRYEV3IGO1/NzGst8lMGCIQYdGVbTIu3/Y8COCsL/wWosruS0De/j
	M9r+IntPHqQIjjK6OFju9oE8FVQMwGmekG4enAcbkUlgZqu3Jh1GB42b47R8V8rMPZt2bJIfP6f
	wsGAsEUMBFEg5qPqh4NKl+fYoeBcjbQk+rb5FrXWOVU47Ep/vUnzzfklT/Cj2mz9yLR9WD6NuSN
	kTB8Enzq/aWWDav5r2YFg906Ee2FeuFauCJYUEhqextCCkExeWawWn1REnjyMX8MLCAxyvrrChA
	qy5B/jOAjjXjvoUG1vhagagB/vG2FSKSBNykHkDD61ZtR6QtnCOFBEDDxDi89CqrdSpWq/Voyva
	tIHsaI63+TsYmeDpuvJsFSaW3L6MMTSG+NeeWMbJ/VAUbkCWndQdwL3h0jeAvxmisdPE78Q8a4s
	SVauj62DI5qsjugeWsmUiP1arFHNXQVWBKXoqtKT8XwyEZ7kSzsw
X-Received: by 2002:a05:7022:c89:b0:1b5:227:7d1f with SMTP id a92af1059eb24-1b5030d765dmr3707627c88.11.1794625566343;
        Fri, 13 Nov 2026 19:06:06 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:06:05 -0800 (PST)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Daniel Wagner <dwagner@suse.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 15/17] nvme-fc: Hold inflight requests while in FENCING state
Date: Fri, 13 Nov 2026 19:04:29 -0800
Message-ID: <20261114030454.2836543-16-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114030454.2836543-1-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
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

When a controller enters FENCING, its inflight requests must not be
completed until CCR or CQT guarantees that the target can no longer
execute them. Completing them earlier lets multipath resubmit them on
another path while the original command may still run on this one.

nvme-fc currently cannot hold requests across the fence.
nvme_fc_fencing_work() tears the association down first, so the LLDD
can finish unregistering the remoteport/localport, and
nvme_fc_delete_association() completes all requests as part of the
teardown. nvme_fc_fcpio_done() also completes requests that finish with
an error, which happens to every request aborted by the teardown.

Split nvme_fc_delete_association() in two:

 - __nvme_fc_teardown_association() aborts outstanding ios, waits for
   the aborts to drain, sends Disconnect, deletes the hw queues and
   marks the controller inactive on the rport. It completes no
   requests.

 - nvme_fc_flush_held_requests() completes the held requests and
   unquiesces the queues.

nvme_fc_delete_association() calls both, as before.
nvme_fc_fencing_work() calls the teardown up front and the flush only
after nvme_fence_ctrl() returns, before moving to FENCED. The queues
stay quiesced in between, so nothing new reaches the dead association.

In nvme_fc_fcpio_done(), start recovery first and hold the request
only if the controller is FENCING afterwards, since a held request is
completed only by the flush that fencing_work runs. If the claim fails
because a reset, a delete, or a connect in progress owns the controller,
the request is completed at once and that owner finishes the teardown.
A held request cannot be completed behind the fence's back because
nvme_fc_timeout() returns BLK_EH_RESET_TIMER while FENCING, and
nvme_fc_start_ioerr_recovery() does nothing in FENCING.

Track held requests explicitly in op->state with a new
FCPOP_STATE_HELD, and have the flush complete only those. An op enters
HELD only through cmpxchg(COMPLETE -> HELD) in nvme_fc_fcpio_done().
For each busy request, the flush does cmpxchg(COMPLETE -> IDLE) and
cancels the request only if it saw HELD. This settles the race with an
nvme_fc_fcpio_done() that has already moved its op to COMPLETE but has
not yet decided whether to hold it. Teardown does not wait for such an
op, since it was no longer ACTIVE when the aborts were issued:

 - nvme_fc_fcpio_done() wins: the op is HELD and the flush cancels it.
 - The flush wins: the op is IDLE, the hold cmpxchg fails and
   nvme_fc_fcpio_done() completes the request itself.

The flush must use a single cmpxchg. Reading the state and then acting
on it would let the op become HELD in between and leave the request
with nothing to complete it.

Both cases rely on the flush being the only thing that can move an op
out of COMPLETE behind nvme_fc_fcpio_done(), so make
__nvme_fc_abort_op() use cmpxchg(ACTIVE -> ABORTED). It used
xchg(ABORTED) and then restored the old value if the op was not ACTIVE,
so for a moment such an op read as ABORTED. A hold cmpxchg that ran in
that moment would fail and complete the request in the middle of the
fence.

Count an aborted op down only after nvme_fc_fcpio_done() has completed
or held its request, so that teardown, once it stops waiting, knows
every aborted request has been decided. The count-down now runs outside
ctrl->lock, so make ctrl->iocnt an atomic_t and wait for it with
wait_event().

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/fc.c | 171 +++++++++++++++++++++++++++++++++--------
 1 file changed, 139 insertions(+), 32 deletions(-)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 095adc9011cc..5e8977ad51cf 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -83,6 +83,7 @@ enum nvme_fcpop_state {
 	FCPOP_STATE_ACTIVE	= 2,
 	FCPOP_STATE_ABORTED	= 3,
 	FCPOP_STATE_COMPLETE	= 4,
+	FCPOP_STATE_HELD	= 5,
 };
 
 struct nvme_fc_fcp_op {
@@ -172,7 +173,7 @@ struct nvme_fc_ctrl {
 
 	struct kref		ref;
 	unsigned long		flags;
-	u32			iocnt;
+	atomic_t		iocnt;
 	wait_queue_head_t	ioabort_wait;
 
 	struct nvme_fc_fcp_op	aen_ops[NVME_NR_AEN_COMMANDS];
@@ -990,6 +991,8 @@ fc_dma_unmap_sg(struct device *dev, struct scatterlist *sg, int nents,
 static void nvme_fc_ctrl_put(struct nvme_fc_ctrl *);
 static int nvme_fc_ctrl_get(struct nvme_fc_ctrl *);
 
+static void __nvme_fc_teardown_association(struct nvme_fc_ctrl *ctrl);
+static void nvme_fc_flush_held_requests(struct nvme_fc_ctrl *ctrl);
 static void nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl);
 static void nvme_fc_reconnect_or_delete(struct nvme_fc_ctrl *ctrl, int status);
 
@@ -1828,12 +1831,11 @@ __nvme_fc_abort_op(struct nvme_fc_ctrl *ctrl, struct nvme_fc_fcp_op *op)
 	 * path, must not still be in progress in the LLDD then.
 	 */
 	spin_lock_irqsave(&ctrl->lock, flags);
-	opstate = atomic_xchg(&op->state, FCPOP_STATE_ABORTED);
-	if (opstate != FCPOP_STATE_ACTIVE) {
-		atomic_set(&op->state, opstate);
-	} else {
+	opstate = atomic_cmpxchg(&op->state, FCPOP_STATE_ACTIVE,
+				 FCPOP_STATE_ABORTED);
+	if (opstate == FCPOP_STATE_ACTIVE) {
 		op->flags |= FCOP_FLAGS_TERMIO;
-		ctrl->iocnt++;
+		atomic_inc(&ctrl->iocnt);
 	}
 	spin_unlock_irqrestore(&ctrl->lock, flags);
 
@@ -1863,19 +1865,27 @@ nvme_fc_abort_aen_ops(struct nvme_fc_ctrl *ctrl)
 }
 
 static inline void
+__nvme_fc_fcpop_count_one_down(struct nvme_fc_ctrl *ctrl)
+{
+	if (atomic_dec_return(&ctrl->iocnt) == 0)
+		wake_up(&ctrl->ioabort_wait);
+}
+
+static inline bool
 __nvme_fc_fcpop_chk_teardowns(struct nvme_fc_ctrl *ctrl,
 		struct nvme_fc_fcp_op *op, int opstate)
 {
 	unsigned long flags;
+	bool ret = false;
 
 	if (opstate == FCPOP_STATE_ABORTED) {
 		spin_lock_irqsave(&ctrl->lock, flags);
-		if (op->flags & FCOP_FLAGS_TERMIO) {
-			if (!--ctrl->iocnt)
-				wake_up(&ctrl->ioabort_wait);
-		}
+		if (op->flags & FCOP_FLAGS_TERMIO)
+			ret = true;
 		spin_unlock_irqrestore(&ctrl->lock, flags);
 	}
+
+	return ret;
 }
 
 static void nvme_fc_fencing_work(struct work_struct *work)
@@ -1894,12 +1904,14 @@ static void nvme_fc_fencing_work(struct work_struct *work)
 	 */
 	nvme_stop_keep_alive(ctrl);
 	cancel_work_sync(&ctrl->async_event_work);
-	nvme_fc_delete_association(fc_ctrl);
+	if (test_and_clear_bit(ASSOC_ACTIVE, &fc_ctrl->flags))
+		__nvme_fc_teardown_association(fc_ctrl);
 
 	rem = nvme_fence_ctrl(ctrl);
 	if (rem)
 		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
 
+	nvme_fc_flush_held_requests(fc_ctrl);
 	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
 	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
 		queue_work(nvme_reset_wq, &fc_ctrl->ioerr_work);
@@ -1982,7 +1994,7 @@ nvme_fc_fcpio_done(struct nvmefc_fcp_req *req)
 	struct nvme_command *sqe = &op->cmd_iu.sqe;
 	__le16 status = cpu_to_le16(NVME_SC_SUCCESS << 1);
 	union nvme_result result;
-	bool terminate_assoc = true;
+	bool op_term, hold = false, terminate_assoc = true;
 	int opstate;
 
 	/*
@@ -2113,22 +2125,58 @@ nvme_fc_fcpio_done(struct nvmefc_fcp_req *req)
 	terminate_assoc = false;
 
 done:
+	/*
+	 * Start recovery before completing or holding anything. A held
+	 * request is only completed by nvme_fc_flush_held_requests(), which
+	 * fencing_work runs once the fence is over, so a request may only be
+	 * held once FENCING has been claimed and fencing_work is guaranteed
+	 * to run. If the claim fails because a reset or a delete already owns
+	 * the controller, the request is completed below and that owner
+	 * tears the association down.
+	 */
+	if (terminate_assoc) {
+		nvme_fc_start_ioerr_recovery(ctrl, "io error");
+		hold = nvme_ctrl_state(&ctrl->ctrl) == NVME_CTRL_FENCING;
+	}
+
 	if (op->flags & FCOP_FLAGS_AEN) {
 		nvme_complete_async_event(&queue->ctrl->ctrl, status, &result);
-		__nvme_fc_fcpop_chk_teardowns(ctrl, op, opstate);
+		if (__nvme_fc_fcpop_chk_teardowns(ctrl, op, opstate))
+			__nvme_fc_fcpop_count_one_down(ctrl);
 		atomic_set(&op->state, FCPOP_STATE_IDLE);
 		op->flags = FCOP_FLAGS_AEN;	/* clear other flags */
 		nvme_fc_ctrl_put(ctrl);
-		goto check_error;
+		return;
 	}
 
-	__nvme_fc_fcpop_chk_teardowns(ctrl, op, opstate);
+	/*
+	 * We can not access op after the request is completed because it can
+	 * be reused immediately. At the same time we want to wakeup the thread
+	 * waiting for ongoing IOs _after_ requests are completed. This is
+	 * necessary because that thread will start canceling inflight IOs
+	 * and we want to avoid request completion racing with cancellation.
+	 */
+	op_term = __nvme_fc_fcpop_chk_teardowns(ctrl, op, opstate);
+
+	/*
+	 * If the controller is FENCING, do not complete this request now.
+	 * Move the op to HELD and let nvme_fc_cancel_held_requests() cancel
+	 * it when it is safe to do so. HELD is only reachable from COMPLETE
+	 * through this cmpxchg: if the cancellation has already walked the
+	 * tagset it moved the op out of COMPLETE, the cmpxchg fails and the
+	 * request is completed here instead. Either way exactly one path
+	 * completes it.
+	 */
+	if (hold && atomic_cmpxchg(&op->state, FCPOP_STATE_COMPLETE,
+				   FCPOP_STATE_HELD) == FCPOP_STATE_COMPLETE)
+		goto check_op_term;
+
 	if (!nvme_try_complete_req(rq, status, result))
 		nvme_fc_complete_rq(rq);
 
-check_error:
-	if (terminate_assoc)
-		nvme_fc_start_ioerr_recovery(ctrl, "io error");
+check_op_term:
+	if (op_term)
+		__nvme_fc_fcpop_count_one_down(ctrl);
 }
 
 static int
@@ -2803,7 +2851,8 @@ nvme_fc_start_fcp_op(struct nvme_fc_ctrl *ctrl, struct nvme_fc_queue *queue,
 		 * cmd with the csn was supposed to arrive.
 		 */
 		opstate = atomic_xchg(&op->state, FCPOP_STATE_COMPLETE);
-		__nvme_fc_fcpop_chk_teardowns(ctrl, op, opstate);
+		if (__nvme_fc_fcpop_chk_teardowns(ctrl, op, opstate))
+			__nvme_fc_fcpop_count_one_down(ctrl);
 
 		if (!(op->flags & FCOP_FLAGS_AEN)) {
 			nvme_fc_unmap_data(ctrl, op->rq, op);
@@ -3261,22 +3310,22 @@ nvme_fc_create_association(struct nvme_fc_ctrl *ctrl)
 	return ret;
 }
 
-
 /*
- * This routine stops operation of the controller on the host side.
- * On the host os stack side: Admin and IO queues are stopped,
- *   outstanding ios on them terminated via FC ABTS.
- * On the link side: the association is terminated.
+ * This routine tears down the association on the link side and releases
+ * all LLDD resources: outstanding ios are terminated via FC ABTS, hw
+ * queues are deleted and the controller is marked inactive on the
+ * rport. Requests that nvme_fc_fcpio_done() decided to hold are NOT
+ * completed here, the caller must follow up with
+ * nvme_fc_flush_held_requests() once it is safe to release them.
+ *
+ * The caller must own the ASSOC_ACTIVE bit (test_and_clear_bit()).
  */
 static void
-nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl)
+__nvme_fc_teardown_association(struct nvme_fc_ctrl *ctrl)
 {
 	struct nvmefc_ls_rcv_op *disls = NULL;
 	unsigned long flags;
 
-	if (!test_and_clear_bit(ASSOC_ACTIVE, &ctrl->flags))
-		return;
-
 	spin_lock_irqsave(&ctrl->lock, flags);
 	set_bit(FCCTRL_TERMIO, &ctrl->flags);
 	spin_unlock_irqrestore(&ctrl->lock, flags);
@@ -3287,8 +3336,8 @@ nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl)
 	nvme_fc_abort_aen_ops(ctrl);
 
 	/* wait for all io that had to be aborted */
+	wait_event(ctrl->ioabort_wait, atomic_read(&ctrl->iocnt) == 0);
 	spin_lock_irq(&ctrl->lock);
-	wait_event_lock_irq(ctrl->ioabort_wait, ctrl->iocnt == 0, ctrl->lock);
 	clear_bit(FCCTRL_TERMIO, &ctrl->flags);
 	spin_unlock_irq(&ctrl->lock);
 
@@ -3323,13 +3372,71 @@ nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl)
 	__nvme_fc_delete_hw_queue(ctrl, &ctrl->queues[0], 0);
 	nvme_fc_free_queue(&ctrl->queues[0]);
 
+	nvme_fc_ctlr_inactive_on_rport(ctrl);
+}
+
+static bool
+nvme_fc_cancel_held_request(struct request *req, void *data)
+{
+	struct nvme_fc_fcp_op *op = blk_mq_rq_to_pdu(req);
+	struct nvme_ctrl *ctrl = data;
+
+	/*
+	 * A single cmpxchg decides who completes this request. If the op is
+	 * HELD, nvme_fc_fcpio_done() is done with it and we cancel it. If it
+	 * is still COMPLETE, nvme_fc_fcpio_done() has not decided yet: move
+	 * it to IDLE so its own cmpxchg to HELD fails and it completes the
+	 * request itself (nvme_fc_complete_rq() sets IDLE anyway). Doing this
+	 * as read-then-cmpxchg would let the op become HELD in between and
+	 * leave it with no one to complete it.
+	 */
+	if (atomic_cmpxchg(&op->state, FCPOP_STATE_COMPLETE,
+			   FCPOP_STATE_IDLE) == FCPOP_STATE_HELD)
+		nvme_cancel_request(req, ctrl);
+
+	return true;
+}
+
+static void
+nvme_fc_cancel_held_requests(struct nvme_ctrl *ctrl, struct blk_mq_tag_set *set)
+{
+	if (!set)
+		return;
+
+	blk_mq_tagset_busy_iter(set, nvme_fc_cancel_held_request, ctrl);
+	blk_mq_tagset_wait_completed_request(set);
+}
+
+/* Complete the requests nvme_fc_fcpio_done() held during the fence */
+static void
+nvme_fc_flush_held_requests(struct nvme_fc_ctrl *fc_ctrl)
+{
+	struct nvme_ctrl *ctrl = &fc_ctrl->ctrl;
+
+	nvme_fc_cancel_held_requests(ctrl, ctrl->tagset);
+	nvme_fc_cancel_held_requests(ctrl, ctrl->admin_tagset);
+
 	/* re-enable the admin_q so anything new can fast fail */
-	nvme_unquiesce_admin_queue(&ctrl->ctrl);
+	nvme_unquiesce_admin_queue(ctrl);
 
 	/* resume the io queues so that things will fast fail */
-	nvme_unquiesce_io_queues(&ctrl->ctrl);
+	nvme_unquiesce_io_queues(ctrl);
+}
 
-	nvme_fc_ctlr_inactive_on_rport(ctrl);
+/*
+ * This routine stops operation of the controller on the host side.
+ * On the host os stack side: Admin and IO queues are stopped,
+ *   outstanding ios on them terminated via FC ABTS.
+ * On the link side: the association is terminated.
+ */
+static void
+nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl)
+{
+	if (!test_and_clear_bit(ASSOC_ACTIVE, &ctrl->flags))
+		return;
+
+	__nvme_fc_teardown_association(ctrl);
+	nvme_fc_flush_held_requests(ctrl);
 }
 
 static void
-- 
2.56.0

