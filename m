Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80A33546C2
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789914808; cv=none; b=I7TYTy/Cg/Y62QorQaYCElwE+X8xPlLDhyYjH2tJQj0fLKjkckZdR/LMGPe43FCdkbCkEC9gknLO5tGuyw3vMbB9zVdkHGC8fnsdzuWWUrWaNKJGZUQlb1SuBudxTqaJPrFFPDKQcXNPAUCI/kvgKHPN15YbU0zYzkqL51NI1JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789914808; c=relaxed/simple;
	bh=3pxNHbCzxSQwckjsNKHFSlhE50lIlo3WeRAKR1GUg80=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J3lZVxsoZihjvs1r9/TWA/4qiE3e+5FVYm0cl1xj3FR0hgq553bb73bMfQ4O9awdW/LHJD4/y0EkjPynuWlcGy1VFr1+ScWlvPYy3GME57ZdeAias3PDiEFzDYsTChOoIU9uXD2VSlJyJj6knwe/bpWAWzAeywqRpuXdW5qDdtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HHw/rFAK; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HHw/rFAK"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b8088203so1951494a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789914805; x=1790519605; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OqhYolaf6vUsqT3z/D8MoSBfgcWhbBjeVI+jdzmWR2U=;
        b=HHw/rFAKyz268dMdvKjX8AbzJddD0UbVtJn+zkhDO2Rr/FjBl9cc+7BX5AM6+wrWHY
         TJHCiG4EW2ofC6WcebX36WmZzlEd+qspWioTbR8U6gpU6WxFkpkOQLWZVrZRwfhP445h
         W8MaXu/YXKSV8/eO9sEkfdlfTnb2SoRi6ZqIyN2In30AwY3UU7+s4LYadk2WrrCoH6mT
         oUQZQRu2y+CNiUVe3V7O7a5PgGJ51izJmneamF8P3+kd8X+93zZQ+T59ttvq5FxtBq8h
         wqGcPpvfw+MMsIVPe2JML11lQ9B/fk0AH1lARz2nZA8eA6hEBs9mAs57ESsYiswvUL1h
         u6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789914805; x=1790519605;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqhYolaf6vUsqT3z/D8MoSBfgcWhbBjeVI+jdzmWR2U=;
        b=Q+7J8uiADHmMLlY7HTTY+c23Xn20BtChn3kMQNzudfGiZyZL3SWId8Sm/RCIzJAtag
         pz8NrnsC++PaFZ26IfOmLSaveOQ48TjeOCE32rIo1vM7fuW/3dSgqgXg7RI/Kap24+oj
         rELpw7pfb+c4+S5qox+2D0XSSRczaDQmlvjawDaom68DnVxp9ErEJ+E9yN5Bc+/vpG/X
         TY+OrGYoAJkav8fAd6fRvLU+djVjLzn8HCODNSkTyf01fIHAN0zrWkslu4YBPtz6iRyw
         ZgQK5EBaN/KVn4DCNz7sWHG9KrOfRvNWKBDGBEUMQ6Ul2RmVpc4ZhLsIiJDhj0zUiIBx
         pS6w==
X-Forwarded-Encrypted: i=1; AKwUvBxiAwCKXI/oU5zy3iP1uZMPwHV/lQyF2RWf1E+8LOHGihsRquEC030OdJ2UxJgOj67SGb4fxcojh72lKnY=@vger.kernel.org
X-Gm-Message-State: AFuF++ktsM645zb/lJh0s/Xu6osQ7XA0ycWzKKb3IQLwZY59gM2CTT4b
	uSiHaLmSbXPYA5jaGfhvVXzx+f/kAsMJWQSzS4woZz9H9TnUH39NXVNA1X7c8FNbZr7+s26apek
	sgQAV+qlYZDxKIT/xzcz1Sw==
X-Received: from pgte19.prod.google.com ([2002:a65:6893:0:b0:cc4:bede:3dc7])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1b81:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3dd8c3d3acfmr14271494637.4.1789914804832;
 Sun, 20 Sep 2026 07:33:24 -0700 (PDT)
Date: Sun, 20 Sep 2026 22:33:19 +0800
In-Reply-To: <20260920143319.3659543-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260920143319.3659543-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260920143319.3659543-3-stanleyjhu@google.com>
Subject: [PATCH 2/2] scsi: ufs: core: Remove unused force_compl parameter and
 MCQ helper
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>, "Martin K . Petersen" <mkp@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Peter Wang <peter.wang@mediatek.com>, Bean Huo <beanhuo@micron.com>, 
	"Bao D . Nguyen" <quic_nguyenb@quicinc.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

With ufshcd_host_reset_and_restore() converted to call
ufshcd_release_stopped_reqs(), both remaining callers of
ufshcd_complete_requests() (ufshcd_abort_all() and
ufshcd_err_handler()) pass force_compl = false.

Remove the unused force_compl parameter from ufshcd_complete_requests()
and ufshcd_mcq_compl_pending_transfer(), and delete the now-unreachable
ufshcd_mcq_force_compl_one() and ufshcd_mcq_compl_all_cqes_lock()
helpers.

No functional change intended.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufs-mcq.c     | 26 -----------------
 drivers/ufs/core/ufshcd-priv.h |  2 --
 drivers/ufs/core/ufshcd.c      | 52 +++++-----------------------------
 3 files changed, 7 insertions(+), 73 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 8106d55f4041..55ed72d15ada 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -328,32 +328,6 @@ static void ufshcd_mcq_process_cqe(struct ufs_hba *hba,
 	}
 }
 
-/*
- * This function is called from the UFS error handler with the UFS host
- * controller disabled (HCE = 0). Reading host controller registers, e.g. the
- * CQ tail pointer (CQTPy), may not be safe with the host controller disabled.
- * Hence, iterate over all completion queue entries. This won't result in
- * double completions because ufshcd_mcq_process_cqe() clears a CQE after it
- * has been processed.
- */
-void ufshcd_mcq_compl_all_cqes_lock(struct ufs_hba *hba,
-				    struct ufs_hw_queue *hwq)
-{
-	unsigned long flags;
-	u32 entries = hwq->max_entries;
-
-	spin_lock_irqsave(&hwq->cq_lock, flags);
-	while (entries > 0) {
-		ufshcd_mcq_process_cqe(hba, hwq);
-		ufshcd_mcq_inc_cq_head_slot(hwq);
-		entries--;
-	}
-
-	ufshcd_mcq_update_cq_tail_slot(hwq);
-	hwq->cq_head_slot = hwq->cq_tail_slot;
-	spin_unlock_irqrestore(&hwq->cq_lock, flags);
-}
-
 unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
 				       struct ufs_hw_queue *hwq)
 {
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index e55c2a02c1f5..8ddc19143abf 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -73,8 +73,6 @@ int ufshcd_get_hba_mac(struct ufs_hba *hba);
 int ufshcd_mcq_memory_alloc(struct ufs_hba *hba);
 struct ufs_hw_queue *ufshcd_mcq_req_to_hwq(struct ufs_hba *hba,
 					   struct request *req);
-void ufshcd_mcq_compl_all_cqes_lock(struct ufs_hba *hba,
-				    struct ufs_hw_queue *hwq);
 bool ufshcd_cmd_inflight(struct scsi_cmnd *cmd);
 int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag);
 int ufshcd_mcq_abort(struct scsi_cmnd *cmd);
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c0772822731e..b7492a5af616 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6109,34 +6109,6 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
 	return completed_reqs != 0;
 }
 
-static bool ufshcd_mcq_force_compl_one(struct request *rq, void *priv)
-{
-	struct scsi_cmnd *cmd = blk_mq_rq_to_pdu(rq);
-	struct scsi_device *sdev = rq->q->queuedata;
-	struct Scsi_Host *shost = sdev->host;
-	struct ufs_hba *hba = shost_priv(shost);
-	struct ufs_hw_queue *hwq = ufshcd_mcq_req_to_hwq(hba, rq);
-
-	if (blk_mq_is_reserved_rq(rq) || !hwq)
-		return true;
-
-	ufshcd_mcq_compl_all_cqes_lock(hba, hwq);
-
-	/*
-	 * For those cmds of which the cqes are not present in the cq, complete
-	 * them explicitly.
-	 */
-	scoped_guard(spinlock_irqsave, &hwq->cq_lock) {
-		if (!test_bit(SCMD_STATE_COMPLETE, &cmd->state)) {
-			set_host_byte(cmd, DID_REQUEUE);
-			ufshcd_release_scsi_cmd(hba, cmd);
-			scsi_done(cmd);
-		}
-	}
-
-	return true;
-}
-
 static bool ufshcd_mcq_compl_one(struct request *rq, void *priv)
 {
 	struct scsi_device *sdev = rq->q->queuedata;
@@ -6151,22 +6123,12 @@ static bool ufshcd_mcq_compl_one(struct request *rq, void *priv)
 }
 
 /**
- * ufshcd_mcq_compl_pending_transfer - MCQ mode function. It is
- * invoked from the error handler context or ufshcd_host_reset_and_restore()
- * to complete the pending transfers and free the resources associated with
- * the scsi command.
- *
+ * ufshcd_mcq_compl_pending_transfer - Complete pending MCQ transfers from EH
  * @hba: per adapter instance
- * @force_compl: This flag is set to true when invoked
- * from ufshcd_host_reset_and_restore() in which case it requires special
- * handling because the host controller has been reset by ufshcd_hba_stop().
  */
-static void ufshcd_mcq_compl_pending_transfer(struct ufs_hba *hba,
-					      bool force_compl)
+static void ufshcd_mcq_compl_pending_transfer(struct ufs_hba *hba)
 {
-	blk_mq_tagset_busy_iter(&hba->host->tag_set,
-				force_compl ? ufshcd_mcq_force_compl_one :
-					      ufshcd_mcq_compl_one,
+	blk_mq_tagset_busy_iter(&hba->host->tag_set, ufshcd_mcq_compl_one,
 				NULL);
 }
 
@@ -6723,10 +6685,10 @@ static void ufshcd_exception_event_handler(struct work_struct *work)
 }
 
 /* Complete requests that have door-bell cleared */
-static void ufshcd_complete_requests(struct ufs_hba *hba, bool force_compl)
+static void ufshcd_complete_requests(struct ufs_hba *hba)
 {
 	if (hba->mcq_enabled)
-		ufshcd_mcq_compl_pending_transfer(hba, force_compl);
+		ufshcd_mcq_compl_pending_transfer(hba);
 	else
 		ufshcd_transfer_req_compl(hba);
 
@@ -7027,7 +6989,7 @@ static bool ufshcd_abort_all(struct ufs_hba *hba)
 
 out:
 	/* Complete the requests that are cleared by s/w */
-	ufshcd_complete_requests(hba, false);
+	ufshcd_complete_requests(hba);
 
 	return ret != 0;
 }
@@ -7089,7 +7051,7 @@ static void ufshcd_err_handler(struct work_struct *work)
 	spin_unlock_irqrestore(&hba->host->host_lock, flags);
 
 	/* Complete requests that have door-bell cleared by h/w */
-	ufshcd_complete_requests(hba, false);
+	ufshcd_complete_requests(hba);
 	spin_lock_irqsave(&hba->host->host_lock, flags);
 again:
 	needs_restore = false;
-- 
2.55.0.1082.g2b9226bbc0-goog

