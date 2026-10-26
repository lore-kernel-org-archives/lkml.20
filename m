Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006282;
	b=nYNzNsKA1t18X3LwFJkvBxfKkFFIZIuRB2fB4IwzMLFOA9P4bWdfp7fuIu5XNTLVhXbd
	 /0BsjU6qoUHyTFYaOtUckNxBpoVoQZpyL7W06ZAgeHtNwP7ZwCt5zhIJ2b2NB1nRMX6XW
	 zAG2uC8Y04paVh35bpWFXHdcAloIwrYDK0hPhFFtCMUyz1Idx+nnVqag6+Wg1upfSorhL
	 AkDVOziT2mz1eG85yeTNExMfqlvlY+G38ZGGgq9kSHxnibOIO6JFQau5so6WRuEX1GRXj
	 xatgLPL7awHUYtdoxSQFWCvnprZQkVZ1yTR54mdOMZP+pOX6V9VDMAegpX03G0Bo7ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vs0s3P39868InZqKcCMlmBK4q2AP/gKRdDkPfmZM/b4=;
	b=TLlVmIiZ6hXAkCAfLQvDPGAmcwag+dMc4cA/xrF59sRkRPAuNHvmPSIVkOPUIYf7VVWp
	 KwA1EjktbrSzTV9FbNs3qrwDRgjRDr4hjoCQwW037uMuZLdi003Yxofxm/GsY9vqrvM4V
	 r+oFv23UOtk0Mt0TrKovs813C4wRiAmOgKPSNAjqEmI8snHhuswLy4/SRhxNipPSMwzme
	 2b9Fx/XR65wpQKGnEQjPFJDIb15jGYv468JgoYKOCdXPlDglKjrvcExaNX8yz5t5ys/Ft
	 J4GHnqgKm5i1l7+Yg7eGqFN0jwWsGjqq37D3TJf3yIiYnNHQOSor1NC+wnOvhrpRQpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LgPdiuXE;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D401606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D401606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LgPdiuXE
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35829219da8so4858146eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006280; x=1793611080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vs0s3P39868InZqKcCMlmBK4q2AP/gKRdDkPfmZM/b4=;
        b=LgPdiuXEf4Vl17SCpAu6K88Eg5KHcacuGdDWEJ6dkzZyVTFk1OMLAMY3nm4qWeq3WW
         pR7fwIGBgJcxUjCZoIv88quH3VCpmfr7PH/Ko0qs6PKsDXmKEZgubUH9MHi7hKrNC9UY
         H60no+1BggORy2fMgw1nD+ih9TIOeBuEyhJTOXF5PqcDd9QwSc7MeBhqcnpTE2dszWx9
         X/Dx2z774u5Iv8vqAjt75y282M9cN7As3feNGI/BjXKsf9Si+gKXMTP5gdBD6+F2+6lf
         +weZlTJ5sT3MBgzPUvI+zbvhWFod2NOLUNFWGnT/3hBGsbAR7CSafENVDisaMHiqL6Os
         b9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006280; x=1793611080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vs0s3P39868InZqKcCMlmBK4q2AP/gKRdDkPfmZM/b4=;
        b=Oe2EYy4qTYn5DMWEqJ6IqSsshyhWSsEGWIzmU/4TtTZMYYSAfNBLAqfbDhLsW919bf
         z2phP9IkQ7rUou+bciT+fbXyyZjyAP6+hqqPhQgMmLfpYPrwyyCejNtBcwdggn+Odxky
         Rg4SWL6yy6W9+23HDq5dKWGtCiT3UNriqzpXmijakywLcQscYGT8fVY1hUHAIsj9hkfY
         ZHcnmAg5qVHxZyr1vU0rjrMPyaNjZWdvQ/bGmjAMC6wjZUYyTQkt1kMNxgVEWxr2khK8
         nrl9rc2CUHCYxy0k86nV3mySJKO3Y4zScnyUElGmBPFjIQEtBDnQS9B8WAqBu2SmLqRk
         BCWw==
X-Forwarded-Encrypted: i=1; AKwUvBxfYKcRU6ylpmfxbjz1YLFSkyhEpbmiyxZC2Pjo1xrwkJlO0gjvoZsPUbwPNYwzqAa6Llt2uiLkQejYUrk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoPfeSjOqFBM6HFDD0T2gka1ZJ346ECUhtFrNKbMb74C9IwPIS
	aBQ42BiBPZ2IjWcjntc8Og2dPlh31mC5jTJMYVtdyQFEW4+Qlusdafw9
X-Gm-Gg: AYBFou2Pnf8j8st9qsULgPJQ1olR5Vi7ABpVTmpxE4bu5+ldtBtdHXA9e9pZI/1VgmT
	S4Iz3quuTJzr82cksLDsxn0AcACm4LFA4glZcQIOSxoq03tNWc4XKkJvhtyO5KVlYomB3pR5uYC
	0fkklS9+uAej0wiN+0qdGtjIRFmmCL5xribDcrLeDfeNr1mO4HIIGXrBqKnuwQlzQ0qaS4xdcdR
	plHXoJ5TJ+4j96tnZKUXLefsfNPFSZhr52cMKqSRoKzzdQ6vbv3sNVrD4hi924V1lbDslt3Zlvr
	EXuIjT8+vKI2gJ2QIpHuTh0Sa/a8WwI2biYWxs541Ks2yUAJ7B84eo3O21CZ+dheBSHDgowfb08
	+2QfB0Cyxltflv1/HFpWRf9omq6A7vgFbF9prEJp/QA4NcDilfaTMURFNuLbKzkixLu35IouU6d
	UE5MwWZuZRNXF0/9aRhN/ZTN0c0XyvJwzqIog5fDTUHVUj/rZMutnfMXRuLp5+VgzPKFhBk/QOL
	FpSQkdqktjr/ZIKFRK7+uvUDdnydoe+YNrqBTXjm8S0p76p+fi6PPQXAV1wz8uKVxdrV3SMs3rG
	lyVQGxYwinPuaM3LWac=
X-Received: by 2002:a05:7022:3b82:b0:166:f097:6f10 with SMTP id a92af1059eb24-1993505ebb4mr9971384c88.11.1793006280006;
        Mon, 26 Oct 2026 02:18:00 -0700 (PDT)
Received: from jeuk-MS-7D42.. ([211.226.54.223])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm26854348c88.6.2026.10.26.02.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:17:59 -0700 (PDT)
From: Jeuk Kim <jeuk20.kim@gmail.com>
X-Google-Original-From: Jeuk Kim <jeuk20.kim@samsung.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	bvanassche@acm.org,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	peter.wang@mediatek.com,
	vamshigajjela@google.com,
	cw9316.lee@samsung.com,
	hyenc.jeong@samsung.com,
	stanleyjhu@google.com,
	beanhuo@micron.com,
	can.guo@oss.qualcomm.com,
	rafael.j.wysocki@intel.com,
	avri.altman@sandisk.com,
	john.garry@linux.dev,
	ping.gao@samsung.com,
	linux-kernel@vger.kernel.org,
	j-young.choi@samsung.com,
	jeuk20.kim@samsung.com
Subject: [PATCH] scsi: ufs: mcq: Reap aborted CQEs before returning from abort
Date: Mon, 26 Oct 2026 18:17:45 +0900
Message-ID: <20261026091745.1490707-1-jeuk20.kim@samsung.com>
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

ufshcd_mcq_abort() can return before the OCS_ABORTED CQE is reaped.
If the command is retried or reused, the late CQE can unmap its new
DMA buffers or access a freed SG table, triggering a KASAN
null-ptr-deref in dma_direct_unmap_sg().

Reap the CQE and serialize resource release with CQ processing before
returning. On timeout, wait for a host reset to invalidate late CQEs;
a successful LU reset alone allows the SCSI core to reuse the command.

Reproduced with QEMU UFS in MCQ mode using fault injection and a
test-only delay in OCS_ABORTED CQE processing.

Fixes: 53755903b935 ("scsi: ufs: mcq: Delete ufshcd_release_scsi_cmd() in ufshcd_mcq_abort()")
Signed-off-by: Jeuk Kim <jeuk20.kim@samsung.com>
---
 drivers/ufs/core/ufs-mcq.c     | 31 ++++++++++++++++++++++++++++++-
 drivers/ufs/core/ufshcd-priv.h |  2 ++
 drivers/ufs/core/ufshcd.c      |  9 +++++++++
 include/ufs/ufshcd.h           |  2 ++
 4 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index df293b66350d..efbe4d1487b4 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -692,11 +692,20 @@ static bool ufshcd_mcq_sqe_search(struct ufs_hba *hba,
 	return ret;
 }
 
+static bool ufshcd_mcq_cmd_reaped(struct ufs_hba *hba, struct ufs_hw_queue *hwq,
+				  struct scsi_cmnd *cmd)
+{
+	struct ufshcd_lrb *lrbp = scsi_cmd_priv(cmd);
+
+	ufshcd_mcq_poll_cqe_lock(hba, hwq);
+	return test_bit(UFSHCD_LRB_RELEASED, &lrbp->flags);
+}
+
 /**
  * ufshcd_mcq_abort - Abort the command in MCQ.
  * @cmd: The command to be aborted.
  *
- * Return: SUCCESS or FAILED error codes
+ * Return: SUCCESS, FAILED, or -ETIMEDOUT if the CQE was not reaped.
  */
 int ufshcd_mcq_abort(struct scsi_cmnd *cmd)
 {
@@ -705,6 +714,7 @@ int ufshcd_mcq_abort(struct scsi_cmnd *cmd)
 	int tag = scsi_cmd_to_rq(cmd)->tag;
 	struct ufshcd_lrb *lrbp = scsi_cmd_priv(cmd);
 	struct ufs_hw_queue *hwq;
+	bool reaped;
 	int err;
 
 	/* Skip task abort in case previous aborts failed and report failure */
@@ -743,5 +753,24 @@ int ufshcd_mcq_abort(struct scsi_cmnd *cmd)
 		return FAILED;
 	}
 
+	/* Reserved commands do not set UFSHCD_LRB_RELEASED. */
+	if (blk_mq_is_reserved_rq(scsi_cmd_to_rq(cmd)))
+		return SUCCESS;
+
+	/* Reap the CQE before the SCSI core can reuse the command. */
+	err = read_poll_timeout(ufshcd_mcq_cmd_reaped, reaped, reaped, 20,
+				MCQ_POLL_US, false, hba, hwq, cmd);
+
+	/* Wait for any CQ handler still releasing the command. */
+	scoped_guard(spinlock_irqsave, &hwq->cq_lock)
+		ufshcd_release_scsi_cmd(hba, cmd);
+
+	if (err) {
+		dev_err(hba->dev, "%s: no completion for aborted tag %d\n",
+			__func__, tag);
+		lrbp->req_abort_skip = true;
+		return -ETIMEDOUT;
+	}
+
 	return SUCCESS;
 }
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index e55c2a02c1f5..b899014ea70e 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -6,6 +6,8 @@
 #include <linux/pm_runtime.h>
 #include <ufs/ufshcd.h>
 
+#define UFSHCD_LRB_RELEASED	0
+
 void ufshcd_enable_intr(struct ufs_hba *hba, u32 intrs);
 
 static inline bool ufshcd_is_user_access_allowed(struct ufs_hba *hba)
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index cc75384c6502..38148d8081f8 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -3029,6 +3029,7 @@ static void __ufshcd_setup_cmd(struct ufs_hba *hba, struct scsi_cmnd *cmd,
 	struct ufshcd_lrb *lrbp = scsi_cmd_priv(cmd);
 
 	ufshcd_init_lrb(hba, cmd);
+	lrbp->flags = 0;
 
 	memset(lrbp->ucd_req_ptr, 0, sizeof(*lrbp->ucd_req_ptr));
 
@@ -5968,6 +5969,11 @@ static irqreturn_t ufshcd_uic_cmd_compl(struct ufs_hba *hba, u32 intr_status)
 /* Release the resources allocated for processing a SCSI command. */
 void ufshcd_release_scsi_cmd(struct ufs_hba *hba, struct scsi_cmnd *cmd)
 {
+	struct ufshcd_lrb *lrbp = scsi_cmd_priv(cmd);
+
+	if (test_and_set_bit(UFSHCD_LRB_RELEASED, &lrbp->flags))
+		return;
+
 	scsi_dma_unmap(cmd);
 	ufshcd_crypto_clear_prdt(hba, cmd);
 	ufshcd_release(hba);
@@ -8183,6 +8189,9 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	if (hba->mcq_enabled) {
 		/* MCQ mode. Branch off to handle abort for mcq mode */
 		err = ufshcd_mcq_abort(cmd);
+		/* A LU reset cannot invalidate a late CQE. */
+		if (err == -ETIMEDOUT)
+			err = ufshcd_eh_host_reset_handler(cmd);
 		goto release;
 	}
 
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index be62165b785e..1892821c5054 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -166,6 +166,7 @@ struct ufs_pm_lvl_states {
  * @lun: LUN of the command
  * @intr_cmd: Interrupt command (doesn't participate in interrupt aggregation)
  * @req_abort_skip: skip request abort task flag
+ * @flags: per-command flags
  * @issue_time_stamp: time stamp for debug purposes (CLOCK_MONOTONIC)
  * @issue_time_stamp_local_clock: time stamp for debug purposes (local_clock)
  * @compl_time_stamp: time stamp for statistics (CLOCK_MONOTONIC)
@@ -190,6 +191,7 @@ struct ufshcd_lrb {
 	u8 lun; /* UPIU LUN id field is only 8-bit wide */
 	bool intr_cmd;
 	bool req_abort_skip;
+	unsigned long flags;
 	ktime_t issue_time_stamp;
 	u64 issue_time_stamp_local_clock;
 	ktime_t compl_time_stamp;
-- 
2.43.0

