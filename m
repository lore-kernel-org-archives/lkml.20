Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDB4472558
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929045; cv=none; b=Fq9IlSbSXBENA+O5gqkzQX/BdAU1yzI+MusKMG3X7MtzMoq2SLQMkEId6eeT8kafMeVZeVcSUMMf6uPMNfwdJsSOQ2KOY4hqUU62xM5zVW7UYoZQNalc2QFsvdvEBS5eOPtpOVdjexdMM8SEXXsH7Jw1CS4x6fyyGnYYNcClkHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929045; c=relaxed/simple;
	bh=brszAfCb8xPeY2++BmqbzkUD7Gs991VIWtKQ+a7lhTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gydcSM/UptGpoJhFTi/DK/XmBZe4ncDvyBRQiXMHcqXtdPbeXNARR6Cvt0MrHgsSwmleeofBW5II7CpLWOQr/q6J329PrE7h9JyaqnV3YGPlN3iIvfHZIt0hQzweZbJpCn2yYoRzhEQvpJ7Lw80w9o+dr7otnVgroLH05Yg5NuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=PLagUTvW; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="PLagUTvW"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso1575568a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929040; x=1790533840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jjZqkSxtF056SbAAw5d/uzyUYxqOIAwzrV4C8XoM0U=;
        b=PLagUTvWC+LHG0S+ARAOCOsPEHcajAUgYKk1Ub5FP5/8LYA7hKYNvhBFqui7oayMJK
         3Ry6a4iFo7sfWPNmcdFSXGcATxbTTxxkUFtm53CDoiDIvfWntFI3eaf4f4ecLialfafD
         ylY161qwO0RXUPFMswC71b+kFG+SFcJn5a9shf7HCtStujuimgbnDEoiSZSMeQOhgwtm
         n4kLhDVUvpnuesoGIjn+SDUMFSIpJVT0R/OXRXtpVObWLwiS9N1qzDb1XJw8+YUd/ZOU
         Az41qboXCVhAM5k+9+irUczKRfkNsFUzNSyJs2YxavPOZYC0rjCCR014NRFHqIBJVunv
         6Yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929040; x=1790533840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jjZqkSxtF056SbAAw5d/uzyUYxqOIAwzrV4C8XoM0U=;
        b=NrdCIj5Fk9qNPEPrc7v28vjLOv16r7Uo6JNfJowjJK0Q4xes1UppXZu5zyCMGSVsS9
         IVwlFbyX1zCcE4X6x8dNLf9VuPYXDBT3DH3Mq80jwrdzOhBZJEvVji1+0GK/xrrq6J9s
         y6/n3+UrT6LElID4kdJF6walC7c0cB/x2Was2ABoUd+rFs/9WplTFb41Jsll2Lkls/dn
         U2bocScedoK8A6hrVYMwSf8hUlPgn5ly3NUMUpGcPW3A2Rh3MzOGIA+r+awcjzfuyQPn
         KNA+yG0Xvn1aHMuZvVTLOJyYeZ/0KkENgKrwFa3brtT3u5gegIc4WTXzgcZSL7UKCjMY
         lXjg==
X-Forwarded-Encrypted: i=1; AKwUvBxhIFGQ8x20Na14lygfAbWQWuzz+mlczYxwIy0fc/upUUSidtQewD7WLezbNNk4cYip9hasQuheFXOe0zQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nGuEhOB5u993qsxPTLgWmWH0u7B/XSQ+P3aKk7L9UFK+C1bZ41
	wLaOrUPj2Bsf/8IHx7utdtncVXqtatVYr+U+iMZ5Z+wn0rH2vk1/XE1eTgWJuggu0Ng=
X-Gm-Gg: AYBFou1KMlMx2iHhszC0KTdJe5zZ1350olc2ToyuO0iWqMXl6yrdKb6oCHlC7AXOXiw
	Db2Ym5jrd6MdOdPEa1KcOgnvAix8nWKijjhWwRUaiQHUkliIVyJQW7U1OpjjpgIIwvHa+r8xhhQ
	d03SessGdfK1auPdfU0CGN//QuGKvT8yDZ5UFbd2JsYyMQcz+1Xr3CL0cc6xo8Uf6c0DnWrM0Sx
	LhsegMDTyajCP7MeWvt/qdn3Pi3cVgh3QUzMdmMHEgzKRjdSZ5HK6NvpVc7MToFNw8DktH9nwbt
	l97w5Iem35t9vrzCf4hOJGyCg4wfqklXER32B9kwbrvCf/sC0eTgcLjuvNgwPIkMxD4mN8V7CZt
	Yi4Qeye8zuWnl8KxESSCb5tf/o08EntHbWFq0j11uYJfurYHUGx7VsynV3qb06rQj+MWVwZHVbm
	Ecp0d3V2aggzhhglAaE1ZQlYz8gCqg4u7zVOkfsH6qFvhz8Hp2R1rqcJC/
X-Received: by 2002:a05:6a21:1f82:b0:3dd:a197:cf29 with SMTP id adf61e73a8af0-3dda197d873mr6832729637.77.1789929039375;
        Sun, 20 Sep 2026 11:30:39 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:38 -0700 (PDT)
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
Subject: [PATCH v6 15/18] nvme-fc: Hold inflight requests while in FENCING state
Date: Sun, 20 Sep 2026 11:28:13 -0700
Message-ID: <20260920182936.2317916-16-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920182936.2317916-1-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
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

