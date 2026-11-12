Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460557;
	b=nmUrsPYqkuvcZPDWQbQmH3DiKas2FoBPFUY8g/wpjQAagErUNhJ3AqbuJfEL44eNGtO7
	 1nR+aokaNvs7pZ1YJfUJtrPpkQlgXfPEp3/PtJpSwpmuA4DqNgQSBs8DWK6fc1R/e8ww/
	 nkEVe/vgB/IEY0CQyObu3tEgUmkp4kkaJrrJBUND7wLqccn3xl6QsqFfEEqO27oMAqOMT
	 UZRvp2ml/OxD+bHqYAz4wjspNo93w4xaL4seaAwqRdgt0+f2Pm/LQmgRklJDQEdS+dSE/
	 cm7oa3ivIO04PTguxd0qe7PQzdfoSb101Y6V+RKnUdw64a6Z9KOzMZR962mhwPlLYaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=f0wFOoV3gZteXz/J+9Mzt9fZx7gZF3rMFK0sA9IOej0=;
	b=aJw5EOnV+mCs7Vfn5/r8w3aBJ2dA9gR5mXvmn0wujoOv7B4PfoUkKlrLCwY8HjEn5bBl
	 rV7Qq6Vypt3aUPRfAjelKDFFliBfwhNk11f4JWd9jxFagoS5RfwV64WDu+rdFj6k23KFQ
	 PlW7W+auW7YzAFJRCXD3u6pfLfUqX6K3jyDJ311YCjAa4KpsDwl1COjEghbbCXiPDW2CG
	 UBqbpw3pVKc5ZoNk2ZSxvkKr8jPmIwTGtXIMD3ATlMePYziQl6siitg+1lvhi2lkHWhYb
	 DcK33gXwEqIS4jsLG6gNn2WM25Z4iGsjj4IdU2ndIqqtG0aM3vUuScPbWdGGj6LEdng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WJRS9l1U;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BFD606A884
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BFD606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WJRS9l1U
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1420857eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794460556; x=1795065356; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0wFOoV3gZteXz/J+9Mzt9fZx7gZF3rMFK0sA9IOej0=;
        b=WJRS9l1UD4QUBgJXX5qNYdqCFydbJ3sCPGZkMmKTIEbXAX8+WwqpfNB/q/9Eu8W2Sx
         TYwE4a3sg+rIg5jne6AjBZKSKBHUXDddB2wpytYoSROjZndd7xrIq9bXvKB6GU5dXCS7
         dzeDDuJxHfWOkF1GxHoKdf9z2mtSsV+I2uNPB58omo7fHUh41wktn/pycHrVRCDyZc2c
         I4WSRvY2NVgqybt2RESNM4m2uF9qtRCUBXvNB7XFjpiuY8o6NCdmkPGoVWLuNGMaBrme
         lMTbC6UrEV8fSxByReMK9yLfMGJqPD8AealAZprrC0WtLYChJD1BVNtmyim4QognHPJN
         wxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460556; x=1795065356;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0wFOoV3gZteXz/J+9Mzt9fZx7gZF3rMFK0sA9IOej0=;
        b=DpdE1VveRr5f+z9e0vRMPZxDwCbbueSVHxHGbf/C4LUSSSgBdlFMp/rkxCRPz4PkLu
         PMX+TwYIKQvwSnFFpnqagc1sLK9aljQ9DvSZgT1Z8YFuC1aTDf2i39ba3Xiy+te9Sy4P
         K2/Lbisime95wknngvCxw7UW7JLa6VhnVCMuS4ggSzpd9J0eXxaB9ufhCCWp8ywN6erq
         rqO7SM7wkviA8rYFiiL4wXuSK9uaGGt8rmaqCl+R9p8MAD/yt0rz19zTHsa7uZ4hprlD
         v8xYdpeeAx+tZr3zPZknhXsZSp7us3qeZX8saZe+y8sP6GcY7bfR13sno4a32nIXswhw
         96TQ==
X-Forwarded-Encrypted: i=1; AL+hErF8WnNCGTF36yvY659eyv3nO8YgIjVw1AfAXCB90gVn7yf6XYvoNHv3ZpuTff/ZXAZq6q1Fq/IXYRi853E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EFSPI+Bs+K4O/2TcZXQK/UBKyQGbja1jM/VgLIDCM8TNAM4GP
	wdln0/LF7poYiZt7TEz1K4NIHiS7kBT+0SARzCEk6qrBos/Itvm2AxhYNoL688zdSaEdKx98R/m
	jGl30FDcMykEgeDIaECdGYA==
X-Received: from dybph4.prod.google.com ([2002:a05:7301:4184:b0:370:f640:2508])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:2324:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-376858967b7mr6988251eec.14.1794460555146;
 Wed, 11 Nov 2026 21:15:55 -0800 (PST)
Date: Thu, 12 Nov 2026 13:15:37 +0800
In-Reply-To: <20261112051542.1539779-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112051542.1539779-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112051542.1539779-5-stanleyjhu@google.com>
Subject: [PATCH 4/9] scsi: ufs: core: Fail PM commands fast when fatal
 recovery is scheduled
From: Stanley Jhu <stanleyjhu@google.com>
To: linux-scsi@vger.kernel.org, "Martin K. Petersen" <mkp@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bean Huo <beanhuo@micron.com>, 
	Peter Wang <peter.wang@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>, 
	Can Guo <quic_cang@quicinc.com>, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, 
	Asutosh Das <quic_asutoshd@quicinc.com>, Hongjie Fang <hongjiefang@asrmicro.com>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, HOYOUNG SEO <hy50.seo@samsung.com>, 
	Brian Kao <powenkao@google.com>, Jens Axboe <axboe@kernel.dk>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Once a fatal error has scheduled the error handler during a PM
callback, the callback should fail fast and leave recovery to the
error handler. Two paths do not:

1. ufshcd_issue_dev_cmd() keeps sending device management commands to
   the stopped controller, and each one waits for a full timeout. This
   includes the NOP OUT retries in ufshcd_verify_dev_init() after the
   controller has been stopped.
2. When START STOP UNIT times out, ufshcd_eh_timed_out() resets the
   link inline and marks the host operational while the error handler
   is still pending. System suspend can then succeed and hold
   hba->host_sem across sleep, which blocks the error handler until
   resume.

Fail device management commands with -EIO in that state, and let
START STOP UNIT, the only SCSI command a PM callback sends, take the
same deferred recovery path. __ufshcd_wl_suspend() then returns
-EBUSY, so system suspend is aborted and releases hba->host_sem for
the error handler, and runtime suspend is retried once recovery is
done. Also keep UFSHCD_STATE_EH_SCHEDULED_FATAL when
ufshcd_err_handler() stops early during shutdown so remaining shutdown
PM commands fail fast as well.

Fixes: 01d5e237b339 ("scsi: ufs: core: Handle PM commands timeout before SCSI EH")
Cc: stable@vger.kernel.org # 7.3.x
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 6d789f3badf1..5563d28ef92e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -3395,6 +3395,11 @@ static int ufshcd_issue_dev_cmd(struct ufs_hba *hba, struct scsi_cmnd *cmd,
 	struct request *rq = scsi_cmd_to_rq(cmd);
 	blk_status_t sts;
 
+	if (hba->pm_op_in_progress &&
+	    hba->ufshcd_state == UFSHCD_STATE_EH_SCHEDULED_FATAL &&
+	    !(ufshcd_eh_in_progress(hba) && ufshcd_is_hba_active(hba)))
+		return -EIO;
+
 	rq->timeout = msecs_to_jiffies(timeout);
 	sts = blk_execute_rq(rq, true);
 	if (sts != BLK_STS_OK)
@@ -7133,7 +7138,9 @@ static void ufshcd_err_handler(struct work_struct *work)
 	down(&hba->host_sem);
 	spin_lock_irqsave(&hba->host->host_lock, flags);
 	if (ufshcd_err_handling_should_stop(hba)) {
-		if (hba->ufshcd_state != UFSHCD_STATE_ERROR)
+		if (!(hba->shutting_down &&
+		      hba->ufshcd_state == UFSHCD_STATE_EH_SCHEDULED_FATAL) &&
+		    hba->ufshcd_state != UFSHCD_STATE_ERROR)
 			hba->ufshcd_state = UFSHCD_STATE_OPERATIONAL;
 		spin_unlock_irqrestore(&hba->host->host_lock, flags);
 		up(&hba->host_sem);
@@ -9701,6 +9708,7 @@ static void ufshcd_eh_pm_cmd_timed_out(struct ufs_hba *hba,
 				       struct scsi_cmnd *scmd)
 {
 	struct request *rq = scsi_cmd_to_rq(scmd);
+	bool is_scsi = ufshcd_is_scsi_cmd(scmd);
 	struct ufs_hw_queue *hwq;
 
 	if (!hba->mcq_enabled) {
@@ -9708,6 +9716,8 @@ static void ufshcd_eh_pm_cmd_timed_out(struct ufs_hba *hba,
 			return;
 		ufshcd_hba_stop(hba);
 		ufshcd_force_error_recovery(hba);
+		if (is_scsi)
+			ufshcd_release_scsi_cmd(hba, scmd);
 		set_host_byte(scmd, DID_TIME_OUT);
 		scsi_done(scmd);
 		return;
@@ -9730,6 +9740,8 @@ static void ufshcd_eh_pm_cmd_timed_out(struct ufs_hba *hba,
 	ufshcd_force_error_recovery(hba);
 	scoped_guard(spinlock_irqsave, &hwq->cq_lock) {
 		if (!test_bit(SCMD_STATE_COMPLETE, &scmd->state)) {
+			if (is_scsi)
+				ufshcd_release_scsi_cmd(hba, scmd);
 			set_host_byte(scmd, DID_TIME_OUT);
 			scsi_done(scmd);
 		}
@@ -9739,13 +9751,14 @@ static void ufshcd_eh_pm_cmd_timed_out(struct ufs_hba *hba,
 static enum scsi_timeout_action ufshcd_eh_timed_out(struct scsi_cmnd *scmd)
 {
 	struct ufs_hba *hba = shost_priv(scmd->device->host);
+	bool is_scsi = ufshcd_is_scsi_cmd(scmd);
 
 	if (!hba->pm_op_in_progress) {
 		/* Activate the error handler in the SCSI core. */
 		return SCSI_EH_NOT_HANDLED;
 	}
 
-	if (!ufshcd_is_scsi_cmd(scmd)) {
+	if (!is_scsi || hba->ufshcd_state == UFSHCD_STATE_EH_SCHEDULED_FATAL) {
 		ufshcd_eh_pm_cmd_timed_out(hba, scmd);
 		return SCSI_EH_DONE;
 	}
-- 
2.56.0.567.gdb80ae8cd5-goog

