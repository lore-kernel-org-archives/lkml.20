Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E7E509F10
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755438; cv=none; b=Vawydzxt6XIG6Hx1heTh2L5gMUgELO5qqZ6JjBQEIhwdefbvIq9GiQ85/rIg2ZacG5x/0YVYF5R/mqDe4HwYKVW0xenJdpS7k0HFI9yUir+ao/bl12Ur6/cVev5wyjiTY6zoabSoJQ3AjLWU1Huh8GMgoDd6oYGTUHELOmGSCgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755438; c=relaxed/simple;
	bh=brszAfCb8xPeY2++BmqbzkUD7Gs991VIWtKQ+a7lhTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DR2F8kH7wxSCT0ameWja696b92CJd5L+o19gYl7tHcmTs5Jz5L3OqdwLpeTqm1tgUgsnFMBEWIU9vHtyL80AKGeBgvKtaq9145Vii0KgjEAGOYSiTo76lEW7AST9YI/prSL7IRt2aNb1w73v7TBTYrnEvdcN/vViaAEfLcNs57A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=MlZkJLwS; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="MlZkJLwS"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c3304784so902063a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755436; x=1790360236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jjZqkSxtF056SbAAw5d/uzyUYxqOIAwzrV4C8XoM0U=;
        b=MlZkJLwSaWcYt7RTPzQ66mLjPxFpJSQQlugav351cPBDj42DLfYJrWSPtmxlaW1fdp
         CwrewX4Y0cTPqmGRutpWYS9Mj5zVOFJyQ10WwrREYcr7DNirT1XGDWuYSBfxheGnn87Z
         GCCwIq91llCnnHm98kBtQ4iELbGkDQfQbZwvGqY+rblmhP+HdY2sKs0XCVzSwLLvw3nr
         HVdPkBsRlvQ/82Cf+swcSKilengahHMbCVMVGa0KV+xNzx+KhB+QqEneaEfkPu6S7z8O
         rLvE2bs8oPOPzenSbGk28/YJAFw9ITfeKo+f4GxT0GuyO8yhcfaFKRJUZOcbET2J7j/5
         dyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755436; x=1790360236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jjZqkSxtF056SbAAw5d/uzyUYxqOIAwzrV4C8XoM0U=;
        b=WTgHRFVILs2Oe86NUrBnb68L123WQASqvKt/5ftJuAbhMvix+IKXa+59idtPRGgRxI
         LDmxcQ2UXillvrokDP1QoSn2YXmVvddPM/Dc7EEHXHDP2Uex1J4RvBG0S3Rda5wBCtso
         ibA0KqXIcs2lJ5RYh/ij5r6ouRTbu845SuPjkwin2bAUF12m9n8yfIKhqJjdxPROKrUI
         Cok74jkMdioWDiEqx0i/vtuMZ+y0huEoaN8RQ4h4bZ8Ke2C4yQsPc0Y93C2DQfJbaEBt
         CzdIQUbLZsHihMf9r9OVVSeRPF8RtQDIh8hv5tdx0P3SPtedlMkEFCnNhwaAoA1juBI6
         Qaag==
X-Forwarded-Encrypted: i=1; AKwUvBxgkde2Ii3HG9BrhaW0vZJBFpS8hMNxonXuQKmwUa2lHSCHk4es3+Mf96TQIf2kaNlLJTlxvdt0OCbdQuM=@vger.kernel.org
X-Gm-Message-State: AFuF++ksfWNk8d4tFUDShP8qVE5xmPmD2sbny8M+Uq+ihsJVKhowG1gd
	dTTP/GaqqpvgLEgGK4oX9Kbs2QXklnMbu6rrpe5FAMXm4zoILbxL7JIRniivwebqFyw=
X-Gm-Gg: AYBFou0j4lkDPLmTYYifJNystAAQuoA5OzWfjlPoOr0b8zdxV8EsvsoUN2bGJsHea9z
	BsehWx+r4fFwBFpiXQqQphFY5TbnP1UBxKcYf5VVX+R4XrXLlhwTuMaJfWf+zh7vPQnT7Es3dXg
	tGdNuCyYRRzsBAmuyl3BfkIdl7Sfu6XC5mLA99rPgizmTgjhUnCts02jytRvx6g80wK7jJGCQfV
	8hos3yoD++bdroDiSFeaTeDZ1fg+UYmgedg6zQdjKZrJx9tU5Y9UU2q7M3jvxj+SPVCQRrNazVU
	Yh20ZVKnmSUdYfF+leeUECjTGYnHLZQ4souCXpAz8aTVH/3tEUaN38sS8O3uj1j3lYvopTGLWv7
	IwxGHTFJG3RPdCOQ/JAyij7TrwQq4gZJ0chguzIM9RAQmbBdUA1myA7fR1SQm/r+I4hEfgSo+BA
	RMHx61wue/fsUODTfkX8FAWsVfOUrXGihNMgAKwJJDXqwkU8gPWfZreoMN6PKEyAfQOZ5xetGkh
	DllYywvlNeAXBeolX30Jg==
X-Received: by 2002:a17:90b:4b82:b0:39d:f06f:79be with SMTP id 98e67ed59e1d1-39e5502546cmr10108721a91.15.1789755435735;
        Fri, 18 Sep 2026 11:17:15 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:15 -0700 (PDT)
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
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/18] nvme-fc: Hold inflight requests while in FENCING state
Date: Fri, 18 Sep 2026 11:14:15 -0700
Message-ID: <20260918181614.3947933-16-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918181614.3947933-1-mkhalfella@purestorage.com>
References: <20260918181614.3947933-1-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the association torn down at the start of nvme_fc_fencing_work(),
canceling the held requests inside nvme_fc_delete_association() would
complete them at fence START, letting them fail over to other paths
before CCR/CQT guarantees the target can no longer execute the original
commands - defeating the hold this patch introduces.

Split nvme_fc_delete_association() into __nvme_fc_teardown_association()
(LLDD-facing teardown, no request completion) and
nvme_fc_flush_held_requests() (cancel tagsets + unquiesce queues).
nvme_fc_fencing_work() now runs only the teardown half up front and
flushes the held requests on the FENCING -> FENCED transition. The
queues stay quiesced across the fence so nothing new reaches the dead
association.

Update nvme_fc_fcpio_done() to not complete aborted requests or requests
with transport errors. Held requests cannot be forced out mid-fence by
the block layer, nvme_fc_timeout() always returns BLK_EH_RESET_TIMER and
nvme_fc_start_ioerr_recovery() is a no-op in FENCING state. Every held
op is FCPOP_STATE_COMPLETE before the fence starts (aborts drained,
synchronize_rcu() done), so the flush never touches the LLDD.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/fc.c | 116 +++++++++++++++++++++++++++++++++--------
 1 file changed, 94 insertions(+), 22 deletions(-)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 42671cca439f..a6e0fa2dc341 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -172,7 +172,7 @@ struct nvme_fc_ctrl {
 
 	struct kref		ref;
 	unsigned long		flags;
-	u32			iocnt;
+	atomic_t		iocnt;
 	wait_queue_head_t	ioabort_wait;
 
 	struct nvme_fc_fcp_op	aen_ops[NVME_NR_AEN_COMMANDS];
@@ -991,7 +991,8 @@ static void nvme_fc_ctrl_put(struct nvme_fc_ctrl *);
 static int nvme_fc_ctrl_get(struct nvme_fc_ctrl *);
 
 static void nvme_fc_error_recovery(struct nvme_fc_ctrl *ctrl);
-static void nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl);
+static void __nvme_fc_teardown_association(struct nvme_fc_ctrl *ctrl);
+static void nvme_fc_flush_held_requests(struct nvme_fc_ctrl *ctrl);
 
 static void
 __nvme_fc_finish_ls_req(struct nvmefc_ls_req_op *lsop)
@@ -1826,7 +1827,7 @@ __nvme_fc_abort_op(struct nvme_fc_ctrl *ctrl, struct nvme_fc_fcp_op *op)
 		atomic_set(&op->state, opstate);
 	else if (test_bit(FCCTRL_TERMIO, &ctrl->flags)) {
 		op->flags |= FCOP_FLAGS_TERMIO;
-		ctrl->iocnt++;
+		atomic_inc(&ctrl->iocnt);
 	}
 	spin_unlock_irqrestore(&ctrl->lock, flags);
 
@@ -1856,20 +1857,29 @@ nvme_fc_abort_aen_ops(struct nvme_fc_ctrl *ctrl)
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
 		if (test_bit(FCCTRL_TERMIO, &ctrl->flags) &&
 		    op->flags & FCOP_FLAGS_TERMIO) {
-			if (!--ctrl->iocnt)
-				wake_up(&ctrl->ioabort_wait);
+			ret = true;
 		}
 		spin_unlock_irqrestore(&ctrl->lock, flags);
 	}
+
+	return ret;
 }
 
 static void nvme_fc_fencing_work(struct work_struct *work)
@@ -1885,12 +1895,14 @@ static void nvme_fc_fencing_work(struct work_struct *work)
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
@@ -2003,7 +2015,8 @@ nvme_fc_fcpio_done(struct nvmefc_fcp_req *req)
 	struct nvme_command *sqe = &op->cmd_iu.sqe;
 	__le16 status = cpu_to_le16(NVME_SC_SUCCESS << 1);
 	union nvme_result result;
-	bool terminate_assoc = true;
+	bool op_term, terminate_assoc = true;
+	enum nvme_ctrl_state state;
 	int opstate;
 
 	/*
@@ -2043,6 +2056,9 @@ nvme_fc_fcpio_done(struct nvmefc_fcp_req *req)
 	 * association to be terminated.
 	 */
 
+	/* Pairs with synchronize_rcu() in __nvme_fc_teardown_association() */
+	rcu_read_lock();
+
 	opstate = atomic_xchg(&op->state, FCPOP_STATE_COMPLETE);
 
 	fc_dma_sync_single_for_cpu(ctrl->lport->dev, op->fcp_req.rspdma,
@@ -2136,20 +2152,44 @@ nvme_fc_fcpio_done(struct nvmefc_fcp_req *req)
 done:
 	if (op->flags & FCOP_FLAGS_AEN) {
 		nvme_complete_async_event(&queue->ctrl->ctrl, status, &result);
-		__nvme_fc_fcpop_chk_teardowns(ctrl, op, opstate);
+		if (__nvme_fc_fcpop_chk_teardowns(ctrl, op, opstate))
+			__nvme_fc_fcpop_count_one_down(ctrl);
 		atomic_set(&op->state, FCPOP_STATE_IDLE);
 		op->flags = FCOP_FLAGS_AEN;	/* clear other flags */
 		nvme_fc_ctrl_put(ctrl);
 		goto check_error;
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
+	 * If we are going to terminate associations and the controller is
+	 * LIVE or FENCING, then do not complete this request now. Let error
+	 * recovery cancel this request when it is safe to do so.
+	 */
+	state = nvme_ctrl_state(&ctrl->ctrl);
+	if (terminate_assoc &&
+	    (state == NVME_CTRL_LIVE || state == NVME_CTRL_FENCING))
+		goto check_op_term;
+
 	if (!nvme_try_complete_req(rq, status, result))
 		nvme_fc_complete_rq(rq);
+check_op_term:
+	if (op_term)
+		__nvme_fc_fcpop_count_one_down(ctrl);
 
 check_error:
 	if (terminate_assoc)
 		nvme_fc_start_ioerr_recovery(ctrl, "io error");
+
+	rcu_read_unlock();
 }
 
 static int
@@ -2802,7 +2842,8 @@ nvme_fc_start_fcp_op(struct nvme_fc_ctrl *ctrl, struct nvme_fc_queue *queue,
 		 * cmd with the csn was supposed to arrive.
 		 */
 		opstate = atomic_xchg(&op->state, FCPOP_STATE_COMPLETE);
-		__nvme_fc_fcpop_chk_teardowns(ctrl, op, opstate);
+		if (__nvme_fc_fcpop_chk_teardowns(ctrl, op, opstate))
+			__nvme_fc_fcpop_count_one_down(ctrl);
 
 		if (!(op->flags & FCOP_FLAGS_AEN)) {
 			nvme_fc_unmap_data(ctrl, op->rq, op);
@@ -3260,25 +3301,25 @@ nvme_fc_create_association(struct nvme_fc_ctrl *ctrl)
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
-	ctrl->iocnt = 0;
+	atomic_set(&ctrl->iocnt, 0);
 	spin_unlock_irqrestore(&ctrl->lock, flags);
 
 	__nvme_fc_abort_outstanding_ios(ctrl, false);
@@ -3287,11 +3328,18 @@ nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl)
 	nvme_fc_abort_aen_ops(ctrl);
 
 	/* wait for all io that had to be aborted */
+	wait_event(ctrl->ioabort_wait, atomic_read(&ctrl->iocnt) == 0);
 	spin_lock_irq(&ctrl->lock);
-	wait_event_lock_irq(ctrl->ioabort_wait, ctrl->iocnt == 0, ctrl->lock);
 	clear_bit(FCCTRL_TERMIO, &ctrl->flags);
 	spin_unlock_irq(&ctrl->lock);
 
+	/*
+	 * Wait for a started nvme_fc_fcpio_done() to complete before we
+	 * proceed with cancelling inflight requests. This guarantees a
+	 * request is completed by one of the two codepaths, not both.
+	 */
+	synchronize_rcu();
+
 	nvme_fc_term_aen_ops(ctrl);
 
 	/*
@@ -3323,13 +3371,37 @@ nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl)
 	__nvme_fc_delete_hw_queue(ctrl, &ctrl->queues[0], 0);
 	nvme_fc_free_queue(&ctrl->queues[0]);
 
+	nvme_fc_ctlr_inactive_on_rport(ctrl);
+}
+
+/* Complete the requests held in __nvme_fc_teardown_association() */
+static void
+nvme_fc_flush_held_requests(struct nvme_fc_ctrl *ctrl)
+{
+	nvme_cancel_tagset(&ctrl->ctrl);
+	nvme_cancel_admin_tagset(&ctrl->ctrl);
+
 	/* re-enable the admin_q so anything new can fast fail */
 	nvme_unquiesce_admin_queue(&ctrl->ctrl);
 
 	/* resume the io queues so that things will fast fail */
 	nvme_unquiesce_io_queues(&ctrl->ctrl);
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
2.55.0

