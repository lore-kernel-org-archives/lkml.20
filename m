Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793322811;
	b=N8bBXjSArtscYNmms0qG0WYKCddDU0aPbxL0oW88IRv2zcge6f/wjq6FBkYUMccv1Skm
	 mwFI98OUCPR+oFABw6nopMOu1VL8tnA7KMBId1LI4B7ZnjhfR9ggTefxxgQ+HhgsxuevB
	 7+iHoMAQjnZg+/Y6MY/+S/8mKijYsmsT3EJ/BocnRNVPETaaM/DVSUjI6efYFzi8KsFzv
	 JGihzl86ifVwez5KndG/8PEp1xAjhEgVjKG8OwmfOlbfzrnoZ2M4TgMpNNUbkEHa7Y4rm
	 /2EwC2AEBtxRMsge0p0ZkPv4xXmmwMantkWRvmDnIfMEbFbBdx/ZxscT4BB0Inx29gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zSja1/zv+gUL+3ptUcoj/S7Maw9s60xwc8tnz1RZQbE=;
	b=lehGAK/5UuY03Xuqd6nIUOjwrpEZe91uq3d6fdU6V5vguxHkcsK1WfKIg4I/V+vFtqJT
	 A/2Pr4mh2ce6ntLxENzgdC/r4BZ2QhfXA+yMfcn9W3PWbsTW6ryu3NsS7LpmBcPCRoojv
	 1brxcZYbUvW1FTsBlsZ0ble7Q3We36RYYblH5mQGJDfqvXQkju9jjaqmBdeQYfiQXHEvj
	 kPV28NsJtPmN5ldkJz3GMOmWANUX4kJoS4A1vlgGbrMOr9DTXnbOD2rgNJuhr+z9bIbqf
	 Uh7Kq7m8vbSxq4veITNJOsLU1chwkTvSbDXPr+LYK1UXtgEOD2I8HoNaQrdgvS1oGGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LZrHxi0A;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F04606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F04606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LZrHxi0A
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a315ed211so267441eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793322810; x=1793927610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSja1/zv+gUL+3ptUcoj/S7Maw9s60xwc8tnz1RZQbE=;
        b=LZrHxi0AaoxFV6gDe5WnB63XnDIgeuzNnP3hc1faV/LDHXKX5rqaPhKEWjW9oTLhS7
         yEflCoMyLIdFqnA0TfkH3YD3+u2EkFTCPW0t3qdinU82NELlFbw31jIE5+YwC2og8KCm
         D8f8hi3HBaiH4radbUsR1jYtZp5CpUld9eNw9q4dlxKu8kzlaRrr9bR+a7ODyg6efLas
         tPM1LhnlIsdJuCGQXlUNL4T3udyapI6EXgHCe08dmBaXPaLvdOH4YMadhB9Ej+uXXk6n
         B9DDoLKjxFwyKrPyYm8bAByCAZtw4TuzIEPL1rkf6mqde9vVdR2n8j3awuV2AqAsOcDP
         Bkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793322810; x=1793927610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSja1/zv+gUL+3ptUcoj/S7Maw9s60xwc8tnz1RZQbE=;
        b=PWbk4ddaupq/IjElsMlqoCso8QfNKEk5kCH7y8LGJlz3JD5jnPijcHovTtW1psi5gX
         KH/AHaFLE/d++Ps73K5FD3nrdohcxceF4VOF/0pgKEnRMZvCcerCCqOsK4FnnPYp8ZQI
         L5L8DvU1L82zrTopV/EM5Xg996igZ7VjDMckblW4Dj52oIaD+2054FtdjxBUsXhqvKDE
         ljtHwCZWa0rDzBREa0tQ0+omc01DJ7UHR/DHh9OrZvrcjepOeAViXwbzFyyxJmABP6DK
         KWz4gOw8mLVsYMY7JLst0XVSO+RHUP/wH5xVOzv91veL+8r/7cI3FYGL5zRLPiqR8TF5
         0qzw==
X-Forwarded-Encrypted: i=1; AKwUvBxISozEbmVa9QZ0mDOL70cUhDQoMAvLIRhpxO0acgQPTFuqBSjimT/cjmX6pXr/FITl9aMkikLO7x8BqAs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAM3MW+qVoYpQDVYZZcX4C4iXLdHLIz4Ksbnxc/NUrBod45qf9
	iJFzyLK3NsG0v1mVyNlAwqlK8YEupA3N+PRon+JQZ3eSaOex8ZA+YNc+
X-Gm-Gg: AYBFou1OW3cx3n8nvvnBTfW+62Qm37NvOoixCtF59pPR528hZKyU5YW/+Hr/W8iJ1BL
	i4zBWh6b9B16maKfapLBfZKEbAMGheJmZ9gjglbVmwCk9b9mc8doUia+Aw8hbV9fK00pZFasGGY
	nPWMvj3zgH7MMbXK5ug6o8IEgWO+g8sq6XDsN4HNkaZXGJiTEsUo4SBiAQmC5HxEG7/9KwUYiFH
	K4QCqPh+S9DcGuRTUt1gu0o0hJkykV0AODFHeinzamqtgCri8w71SEosRwVRCiHIApKuB2eMPje
	qzHUQZo2/Q4zOsjlxzSpwD53dTdW8MHQ1OJFc+T8gw1EtZ6Q31Jn/hPRVTAXWg42+JhvVIs7oqy
	+hA1o6hiqPIzVxUQKEt9GKx5NfBBaGS6bs+gjOthB5Vt1XBeU94qtRS7pFcAblhdZUV6mobw8Ae
	ufB/0k5cO4eQGyzCFeKOlyrBjnSgOrqDCHCLMCaHDbRapE6vDHhWEJvDxe9SPIfRAR998LtlKri
	HfiY73sD4WkJJeYxy61agMtngTrfIFSuVOjXGeRAMTDeojTLCQuYJTy3Ldbu3+ZCunkEtkN4qcO
	CLWrSTWpxYh85fS5qYLfFox0NLBvow+qYceDKTVLum3VjiFKsoNuCnpAogSCuNZc3ovpfPq592m
	TMKS1usx2024=
X-Received: by 2002:a05:693c:41ce:20b0:359:27e6:b684 with SMTP id 5a478bee46e88-36a2fd486a2mr5837694eec.3.1793322809865;
        Thu, 29 Oct 2026 18:13:29 -0700 (PDT)
Received: from jeuk-MS-7D42.. ([211.226.54.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429000f8sm2323621eec.13.2026.10.29.18.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:13:29 -0700 (PDT)
From: Jeuk Kim <jeuk20.kim@gmail.com>
To: bvanassche@acm.org
Cc: James.Bottomley@HansenPartnership.com,
	alim.akhtar@samsung.com,
	avri.altman@sandisk.com,
	beanhuo@micron.com,
	can.guo@oss.qualcomm.com,
	cw9316.lee@samsung.com,
	hyenc.jeong@samsung.com,
	j-young.choi@samsung.com,
	jeuk20.kim@samsung.com,
	john.garry@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	mkp@kernel.org,
	peter.wang@mediatek.com,
	ping.gao@samsung.com,
	rafael.j.wysocki@intel.com,
	stanleyjhu@google.com,
	vamshigajjela@google.com,
	stable@vger.kernel.org
Subject: [PATCH v2] scsi: ufs: mcq: Reap aborted CQEs before returning from abort
Date: Fri, 30 Oct 2026 10:13:21 +0900
Message-ID: <20261030011321.1868029-1-jeuk20.kim@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Jeuk Kim <jeuk20.kim@samsung.com>

ufshcd_mcq_abort() can return before the OCS_ABORTED CQE is reaped.
If the command is retried or reused, the late CQE can unmap its new
DMA buffers or access a freed SG table, triggering a KASAN
null-ptr-deref in dma_direct_unmap_sg().
It can also overwrite cmd->result and complete a resubmitted command
because SCMD_STATE_COMPLETE is cleared on resubmission.

Track driver completion for all command types and check it under cq_lock
in the shared SQ cleanup path, covering abort and LU reset. CUS alone
does not establish that software has consumed the CQE. If SQ cleanup
times out, leave DMA mapped and let the SCSI core escalate recovery.
Release uncompleted commands in the existing host-reset cleanup path
after ufshcd_hba_stop(), including commands with SCMD_STATE_COMPLETE set.

Reproduced with QEMU UFS in MCQ mode using fault injection and a
test-only delay in OCS_ABORTED CQE processing.

Fixes: 53755903b935 ("scsi: ufs: mcq: Delete ufshcd_release_scsi_cmd() in ufshcd_mcq_abort()")
Cc: stable@vger.kernel.org
Signed-off-by: Jeuk Kim <jeuk20.kim@samsung.com>
---
Changes in v2:
- Track completion separately and wait in shared SQ cleanup for abort/LU reset.
- Keep DMA mapped on timeout and let SCSI EH escalate recovery.
- Release timed-out commands during host-reset cleanup; fix flags and metadata.

 drivers/ufs/core/ufs-mcq.c | 28 ++++++++++++++++++++
 drivers/ufs/core/ufshcd.c  | 52 ++++++++++++++++++++++++++------------
 include/ufs/ufshcd.h       |  6 +++++
 3 files changed, 70 insertions(+), 16 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index df293b66350d..9ca74947bfd0 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -554,6 +554,19 @@ static int ufshcd_mcq_sq_start(struct ufs_hba *hba, struct ufs_hw_queue *hwq)
 	return err;
 }
 
+static bool ufshcd_mcq_cmd_completed(struct ufs_hba *hba,
+				     struct ufs_hw_queue *hwq,
+				     struct scsi_cmnd *cmd)
+{
+	struct ufshcd_lrb *lrbp = scsi_cmd_priv(cmd);
+
+	ufshcd_mcq_poll_cqe_lock(hba, hwq);
+
+	/* A completion may have started after the poll dropped cq_lock. */
+	guard(spinlock_irqsave)(&hwq->cq_lock);
+	return test_bit(UFSHCD_LRB_COMPLETED, &lrbp->flags);
+}
+
 /**
  * ufshcd_mcq_sq_cleanup - Clean up submission queue resources
  * associated with the pending command.
@@ -570,6 +583,7 @@ int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
 	struct ufs_hw_queue *hwq;
 	void __iomem *reg, *opr_sqd_base;
 	u32 nexus, id, val;
+	bool completed;
 	int err;
 
 	if (hba->quirks & UFSHCD_QUIRK_MCQ_BROKEN_RTC)
@@ -616,6 +630,20 @@ int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
 	if (ufshcd_mcq_sq_start(hba, hwq))
 		err = -ETIMEDOUT;
 
+	if (err)
+		return err;
+
+	/*
+	 * CUS reports hardware cleanup, not software completion. Reap the
+	 * command's CQE before any caller can allow the command to be reused.
+	 * On timeout, leave its DMA mapping intact for error recovery.
+	 */
+	err = read_poll_timeout(ufshcd_mcq_cmd_completed, completed, completed,
+				20, MCQ_POLL_US, false, hba, hwq, cmd);
+	if (err)
+		dev_err(hba->dev, "%s: no completion for tag %d\n",
+			__func__, task_tag);
+
 	return err;
 }
 
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index cc75384c6502..3f2b99cfd87f 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2426,6 +2426,8 @@ static inline void ufshcd_send_command(struct ufs_hba *hba,
 	const int tag = scsi_cmd_to_rq(cmd)->tag;
 	unsigned long flags;
 
+	lrbp->flags = 0;
+
 	if (hba->monitor.enabled) {
 		lrbp->issue_time_stamp = ktime_get();
 		lrbp->issue_time_stamp_local_clock = local_clock();
@@ -3098,11 +3100,15 @@ static void ufshcd_map_queues(struct Scsi_Host *shost)
 }
 
 /*
- * The only purpose of this function is to make the SCSI core skip the memset()
- * call for the private command data.
+ * Initialize the completion state and make the SCSI core preserve the private
+ * command data across dispatch attempts.
  */
 static int ufshcd_init_cmd_priv(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 {
+	struct ufshcd_lrb *lrbp = scsi_cmd_priv(cmd);
+
+	/* The SCSI core may complete a request before calling queuecommand(). */
+	lrbp->flags = BIT(UFSHCD_LRB_COMPLETED);
 	return 0;
 }
 
@@ -6014,6 +6020,7 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
 			(struct utp_upiu_req *)lrbp->ucd_rsp_ptr);
 		cmd->result = 0;
 	}
+	set_bit(UFSHCD_LRB_COMPLETED, &lrbp->flags);
 	/* Do not touch lrbp after scsi_done() has been called. */
 	scsi_done(cmd);
 }
@@ -6091,6 +6098,7 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
 static bool ufshcd_mcq_force_compl_one(struct request *rq, void *priv)
 {
 	struct scsi_cmnd *cmd = blk_mq_rq_to_pdu(rq);
+	struct ufshcd_lrb *lrbp = scsi_cmd_priv(cmd);
 	struct scsi_device *sdev = rq->q->queuedata;
 	struct Scsi_Host *shost = sdev->host;
 	struct ufs_hba *hba = shost_priv(shost);
@@ -6101,13 +6109,18 @@ static bool ufshcd_mcq_force_compl_one(struct request *rq, void *priv)
 
 	/*
 	 * For those cmds of which the cqes are not present in the cq, complete
-	 * them explicitly.
+	 * them explicitly after the controller has stopped. Timed-out commands
+	 * still need their driver resources released, but SCSI EH owns their
+	 * result and completion.
 	 */
 	scoped_guard(spinlock_irqsave, &hwq->cq_lock) {
-		if (!test_bit(SCMD_STATE_COMPLETE, &cmd->state)) {
-			set_host_byte(cmd, DID_REQUEUE);
+		if (!test_bit(UFSHCD_LRB_COMPLETED, &lrbp->flags)) {
 			ufshcd_release_scsi_cmd(hba, cmd);
-			scsi_done(cmd);
+			set_bit(UFSHCD_LRB_COMPLETED, &lrbp->flags);
+			if (!test_bit(SCMD_STATE_COMPLETE, &cmd->state)) {
+				set_host_byte(cmd, DID_REQUEUE);
+				scsi_done(cmd);
+			}
 		}
 	}
 
@@ -7934,31 +7947,34 @@ int ufshcd_advanced_rpmb_req_handler(struct ufs_hba *hba, struct utp_upiu_req *r
 	return err ? : result;
 }
 
+struct ufshcd_lu_reset_info {
+	u64 lun;
+	int err;
+};
+
 static bool ufshcd_clear_lu_cmds(struct request *req, void *priv)
 {
 	struct scsi_cmnd *cmd = blk_mq_rq_to_pdu(req);
 	struct scsi_device *sdev = cmd->device;
 	struct Scsi_Host *shost = sdev->host;
 	struct ufs_hba *hba = shost_priv(shost);
-	const u64 lun = *(u64 *)priv;
+	struct ufshcd_lu_reset_info *reset = priv;
 	const u32 tag = req->tag;
+	int err;
 
-	if (blk_mq_is_reserved_rq(req) || sdev->lun != lun)
+	if (blk_mq_is_reserved_rq(req) || sdev->lun != reset->lun)
 		return true;
 
-	if (ufshcd_clear_cmd(hba, tag) < 0) {
+	err = ufshcd_clear_cmd(hba, tag);
+	if (err) {
+		reset->err = err;
 		dev_err(hba->dev, "%s: failed to clear request %d\n", __func__,
 			tag);
 		return true;
 	}
 
-	if (hba->mcq_enabled) {
-		struct ufs_hw_queue *hwq = ufshcd_mcq_req_to_hwq(hba, req);
-
-		if (hwq)
-			ufshcd_mcq_poll_cqe_lock(hba, hwq);
+	if (hba->mcq_enabled)
 		return true;
-	}
 
 	ufshcd_compl_one_cqe(hba, tag, NULL);
 	return true;
@@ -7972,6 +7988,7 @@ static bool ufshcd_clear_lu_cmds(struct request *req, void *priv)
  */
 static int ufshcd_eh_device_reset_handler(struct scsi_cmnd *cmd)
 {
+	struct ufshcd_lu_reset_info reset = { .lun = cmd->device->lun };
 	struct Scsi_Host *host;
 	struct ufs_hba *hba;
 	int err;
@@ -7989,7 +8006,8 @@ static int ufshcd_eh_device_reset_handler(struct scsi_cmnd *cmd)
 		/* clear the commands that were pending for corresponding LUN */
 		blk_mq_tagset_busy_iter(&hba->host->tag_set,
 					ufshcd_clear_lu_cmds,
-					&cmd->device->lun);
+					&reset);
+		err = reset.err;
 	}
 
 	hba->req_abort_count = 0;
@@ -9617,6 +9635,7 @@ static void ufshcd_async_scan(void *data, async_cookie_t cookie)
 
 static enum scsi_timeout_action ufshcd_eh_timed_out(struct scsi_cmnd *scmd)
 {
+	struct ufshcd_lrb *lrbp = scsi_cmd_priv(scmd);
 	struct ufs_hba *hba = shost_priv(scmd->device->host);
 
 	if (!hba->pm_op_in_progress) {
@@ -9653,6 +9672,7 @@ static enum scsi_timeout_action ufshcd_eh_timed_out(struct scsi_cmnd *scmd)
 			set_host_byte(scmd, DID_TIME_OUT);
 		}
 
+		set_bit(UFSHCD_LRB_COMPLETED, &lrbp->flags);
 		scsi_done(scmd);
 	}
 
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index be62165b785e..69e49d25f6ce 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -151,6 +151,10 @@ struct ufs_pm_lvl_states {
 	enum uic_link_state link_state;
 };
 
+/* Bits in ufshcd_lrb::flags. */
+/* No driver resources remain; also set before the first dispatch. */
+#define UFSHCD_LRB_COMPLETED	0
+
 /**
  * struct ufshcd_lrb - local reference block
  * @utr_descriptor_ptr: UTRD address of the command
@@ -166,6 +170,7 @@ struct ufs_pm_lvl_states {
  * @lun: LUN of the command
  * @intr_cmd: Interrupt command (doesn't participate in interrupt aggregation)
  * @req_abort_skip: skip request abort task flag
+ * @flags: per-command flags (UFSHCD_LRB_*)
  * @issue_time_stamp: time stamp for debug purposes (CLOCK_MONOTONIC)
  * @issue_time_stamp_local_clock: time stamp for debug purposes (local_clock)
  * @compl_time_stamp: time stamp for statistics (CLOCK_MONOTONIC)
@@ -190,6 +195,7 @@ struct ufshcd_lrb {
 	u8 lun; /* UPIU LUN id field is only 8-bit wide */
 	bool intr_cmd;
 	bool req_abort_skip;
+	unsigned long flags;
 	ktime_t issue_time_stamp;
 	u64 issue_time_stamp_local_clock;
 	ktime_t compl_time_stamp;
-- 
2.43.0

