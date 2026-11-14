Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625563;
	b=jC44mcfcpWTcW9sQO83ZGtcq/iwV0ucKLae0Cd+Hb9gSP50Q2EiEX9TCAd4gTSuNmrfs
	 o0NvyhE77E7p7nhDaiSzh5gcaUkiCAwDvKeHNeEsDIZe+w0g+nJ8llsdiJtrkXubv1mfa
	 SEzThtVHdPCdCQxP930II1IJXiVcbU9ZGv8lTeJ2wikp1lTH/eYdgxLS23fFkO3+XBRiR
	 AKWWFduomTe/jRtuJhD/M5yrS56sa9MM+cCxPwHbX/r0i+RKYRPkbLjfz6uXfllVLRZ0m
	 2RTMiF12HKRVbvai885eHzSkaPit6EhyoC9wT5J2bygCnmyX2jsYhVuIvpEzt0WBqVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qFMz0pc1AFuqa2RNN04ND5/ZelYIOBKWfMxb2sBhDbo=;
	b=FXQHlli3ME9xAkb4eqU/3MgQNSU/RzOXj8U6aX++Z+Ni38o4EQOZUo08uzm2DfAHJJsM
	 yfR5VpQ8+ASvV11UDlOx8jfxSA4fy4QyEmA1tLVYrkA9/yq3vbY0fPDn4tf6sK5QzQ5Xj
	 2tSjmDTE2ZubzLpiXeUVPeWRVSdlZFC2ysXsQs6FRLFSzgHOmC7PkqoTFN62M4B+iShIL
	 60oxzwZrZ/lCnr/qT+3ADQLfo0UrL3sKjhaZBWdToq8pKVIeYMP1whuTf05zRJ0NY2cDz
	 QrcSnE2W6HnAcFJ6UM35lcnD0ba4WJ47+B6oc0uwIQUcIbmlRefCxWrsNvb/biEqk8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ij5ZyKla;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3F360A5BD3
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A3F360A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Ij5ZyKla
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37628596783so2860622eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625563; x=1795230363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFMz0pc1AFuqa2RNN04ND5/ZelYIOBKWfMxb2sBhDbo=;
        b=Ij5ZyKlaZMtkW+ZEoGIIipS3fKjK9llR4kK/L1gRPpu+/CU1hD00O+NSeIKzRLru7R
         0pxzZ3Wiz+fNug/a0K1xT+ngfzRRe7YVqwbP8Q0Ul+hEndGGjaV4KRnr7eSkdsb2JdXt
         IaqdDi+8ggx6ob1E5flwneB1EpuZPxyJuF9WUGq2YA1sPISASN5/N+VCyfmWI3XEQTyD
         eOUZPOs/i1L789k2mMMzTivNn3xolMdwTN+mzwsQqpsEBt506w5jmck0jrx8NOgFslMY
         wGIRYdka/0Mhk1ed3TO5ZGJ6WIpuqFXxVcpl8nMK8qHRhGc1N9Hncfi9dzeEHl19dnwk
         6Gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625563; x=1795230363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFMz0pc1AFuqa2RNN04ND5/ZelYIOBKWfMxb2sBhDbo=;
        b=G9EvXb2HUoWvt4Y0ZYV25bR0Q1Ngjn5KnTQ3uWsYtHdojEGC2G4f2Lyl9Jp9NIvXG6
         u4ArEi3+kXaTw+Ckd8f3azY8BX5m4XsVtzEWJzeu85d5ALtXCnqv7CkBxmxzIMmQ3xnO
         2xVGmYhWk7eLzNIJ8k2eT1U6+46AGokEr8eoIhuEjMVsgzOtkz+H/mVkrnaqI9jzpXy8
         Ve2uu2YIyyMEncvHYSGbEyx9K+eFS4qYT4QzwPF7PpYX8v9lIQJ0PtqmFkbQkl/fGYoN
         1Rcqf6XweZxscdgIsbrZQ6ynDIXQl+lthihWQf3O1pyF3TDPXZP/JsDrSE63UfISA0oi
         SbuQ==
X-Forwarded-Encrypted: i=1; AL+hErF2KZZIKrTkxpjDsGLYcV0D/aD6UdgpqxBrYpVHKhuzl2kpcjxipnTqQu2HLxERQd/CkfEkyS7idnjCdmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a7ZtfoYYH4/zml+F8L4Bh/KRMkutiEeFt3xekEp8nbmZjb41f
	DCHynwVQRcXqIZH1ABeQhuEY4VclrpQgj73XJHYzWVBtbniAzoCmxyILY2WoLiwCTTI=
X-Gm-Gg: AYBFou1xcmNK2eNbkdCKKLqj/HxdpiRKCE+LgftFH8AN0NvJZmnOB5dhQqGMnt6O68r
	zVrpHgeOzrFJFENPeIN59fHyJ9mmbvOHdCdtl/mkvDUNnwVgwWLbPAPbA4HGkJBBR+6jHtdvx0I
	Z+RUHEcHsFMBYMR4L+6NkJgl50CkUIBsw+YRUqTzK3WcYp9tJyyte+JA5oMSBOePNODd3oKyBH0
	w1hRk+iuZ1x0IcFsqZitF8pS0FIo1EWk9zZaZ6+FvdgFjJiR7W5FZC4Omcgftnk2ujmZFYtmIQF
	nYe4DPv54lUzy099lRThBETT91ByXBEefN4D5XQAGjkHMmNfSmCAMlnK5YtCf5Ts5DwikCmtJ1d
	moIkArqidXh+98RYxunAMdBxmoPSl4PW/KGHRsauOhyGptw3BfmDB8O0ZcLzm3PgsHlyplLRE1X
	QP6j4utFRxrRpeMZslPVaLDpZRZ1gd9nqO8xB4K+YYHYgivRm+QRWiNZqSi4u1t0mR25vhJs8dr
	KaBd030SOLydj6NJx0+VXY3EW5ca0RstSAWDPgKLDXesVAXfeFHXivnDJ2o3JaRT7iyNNU9a56W
	0XD5iVSzt/sdTiT9zpMXOLEm/MDEM9PwbRZazwLIOmTU1W5Yh6Xu9NTZAtsZ9hMOal3JLOSU/A=
	=
X-Received: by 2002:a05:7022:3a85:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b50312b3b0mr4171060c88.33.1794625562200;
        Fri, 13 Nov 2026 19:06:02 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:06:01 -0800 (PST)
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
Subject: [PATCH v7 12/17] nvme-fc: start error recovery instead of aborting timed out IOs
Date: Fri, 13 Nov 2026 19:04:26 -0800
Message-ID: <20261114030454.2836543-13-mkhalfella@purestorage.com>
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

Aborts issued from the timeout handler run outside the FCCTRL_TERMIO
window, so they are not counted in ctrl->iocnt and
nvme_fc_delete_association() does not wait for them. The association
can be torn down while the LLDD is still working on the abort.

Instead of aborting the timed out command, reset the controller like
the other fabrics transports do. The association teardown aborts the
outstanding IOs, counts the aborts and waits for them to complete.

Count every abort in ctrl->iocnt, not only the ones issued while
FCCTRL_TERMIO is set, and do not reset the count when the teardown
starts. An abort issued before the teardown is then waited for as well.

Only a LIVE controller starts error recovery. In every other state the
association is being set up, being torn down or already gone, so abort
the timed out command from the timeout handler instead and return
BLK_EH_DONE. The command completes through nvme_fc_fcpio_done() once
the LLDD has finished the abort, and the abort is counted so a teardown
that follows waits for it. This matters for a controller being deleted.
The delete path drains the IOs itself and tears the association down in
nvme_fc_delete_ctrl() once the drain is done, and DELETING cannot move
to RESETTING, so without the abort a timed out IO would hang the drain
against a dead target.

The new nvme_fc_start_ioerr_recovery() is the common entry point for IO
timeouts, transport errors reported by nvme_fc_fcpio_done(), Disconnect
LS and connectivity loss. It moves the controller to RESETTING and
queues ioerr_work only if that succeeds, so nothing is ever queued on a
controller that is CONNECTING or being deleted. A Disconnect LS or a
transport error received while CONNECTING is resolved when the inflight
request fails, or times out and is aborted.

ioerr_work still calls nvme_fc_error_recovery(), which returns without
doing anything for a controller that is not LIVE. With the controller
already in RESETTING when the work runs, no recovery takes place yet
and the controller stays in RESETTING. The next patch moves the
recovery into ioerr_work itself and completes the change.

Link: https://lore.kernel.org/all/20250529214928.2112990-1-mkhalfella@purestorage.com/
Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/fc.c | 66 ++++++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 0b9ff50d26ff..c4603be38144 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -227,6 +227,8 @@ static DEFINE_IDA(nvme_fc_ctrl_cnt);
 static struct device *fc_udev_device;
 
 static void nvme_fc_complete_rq(struct request *rq);
+static void nvme_fc_start_ioerr_recovery(struct nvme_fc_ctrl *ctrl,
+					 char *errmsg);
 
 /* *********************** FC-NVME Port Management ************************ */
 
@@ -788,7 +790,7 @@ nvme_fc_ctrl_connectivity_loss(struct nvme_fc_ctrl *ctrl)
 		"Reconnect", ctrl->cnum);
 
 	set_bit(ASSOC_FAILED, &ctrl->flags);
-	nvme_reset_ctrl(&ctrl->ctrl);
+	nvme_fc_start_ioerr_recovery(ctrl, "Connectivity Loss");
 }
 
 /**
@@ -1569,7 +1571,8 @@ nvme_fc_ls_disconnect_assoc(struct nvmefc_ls_rcv_op *lsop)
 	 */
 
 	/* fail the association */
-	nvme_fc_error_recovery(ctrl, "Disconnect Association LS received");
+	nvme_fc_start_ioerr_recovery(ctrl,
+				     "Disconnect Association LS received");
 
 	/* release the reference taken by nvme_fc_match_disconn_ls() */
 	nvme_fc_ctrl_put(ctrl);
@@ -1813,11 +1816,18 @@ __nvme_fc_abort_op(struct nvme_fc_ctrl *ctrl, struct nvme_fc_fcp_op *op)
 	unsigned long flags;
 	int opstate;
 
+	/*
+	 * Every abort is counted, not only those issued by the association
+	 * teardown: the teardown waits for iocnt to drop to zero before it
+	 * deletes the hw queues, and an abort issued earlier, by
+	 * nvme_fc_timeout() while deleting or by the CONNECTING recovery
+	 * path, must not still be in progress in the LLDD then.
+	 */
 	spin_lock_irqsave(&ctrl->lock, flags);
 	opstate = atomic_xchg(&op->state, FCPOP_STATE_ABORTED);
-	if (opstate != FCPOP_STATE_ACTIVE)
+	if (opstate != FCPOP_STATE_ACTIVE) {
 		atomic_set(&op->state, opstate);
-	else if (test_bit(FCCTRL_TERMIO, &ctrl->flags)) {
+	} else {
 		op->flags |= FCOP_FLAGS_TERMIO;
 		ctrl->iocnt++;
 	}
@@ -1856,8 +1866,7 @@ __nvme_fc_fcpop_chk_teardowns(struct nvme_fc_ctrl *ctrl,
 
 	if (opstate == FCPOP_STATE_ABORTED) {
 		spin_lock_irqsave(&ctrl->lock, flags);
-		if (test_bit(FCCTRL_TERMIO, &ctrl->flags) &&
-		    op->flags & FCOP_FLAGS_TERMIO) {
+		if (op->flags & FCOP_FLAGS_TERMIO) {
 			if (!--ctrl->iocnt)
 				wake_up(&ctrl->ioabort_wait);
 		}
@@ -1892,6 +1901,19 @@ char *nvme_fc_io_getuuid(struct nvmefc_fcp_req *req)
 }
 EXPORT_SYMBOL_GPL(nvme_fc_io_getuuid);
 
+/*
+ * Start recovery only if this caller can claim it with a state change.
+ */
+static void
+nvme_fc_start_ioerr_recovery(struct nvme_fc_ctrl *ctrl, char *errmsg)
+{
+	if (nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_RESETTING)) {
+		dev_warn(ctrl->ctrl.device, "NVME-FC{%d}: starting error recovery %s\n",
+			 ctrl->cnum, errmsg);
+		queue_work(nvme_reset_wq, &ctrl->ioerr_work);
+	}
+}
+
 static void
 nvme_fc_fcpio_done(struct nvmefc_fcp_req *req)
 {
@@ -2049,9 +2071,8 @@ nvme_fc_fcpio_done(struct nvmefc_fcp_req *req)
 		nvme_fc_complete_rq(rq);
 
 check_error:
-	if (terminate_assoc &&
-	    nvme_ctrl_state(&ctrl->ctrl) != NVME_CTRL_RESETTING)
-		queue_work(nvme_reset_wq, &ctrl->ioerr_work);
+	if (terminate_assoc)
+		nvme_fc_start_ioerr_recovery(ctrl, "io error");
 }
 
 static int
@@ -2548,24 +2569,32 @@ static enum blk_eh_timer_return nvme_fc_timeout(struct request *rq)
 	struct nvme_fc_cmd_iu *cmdiu = &op->cmd_iu;
 	struct nvme_command *sqe = &cmdiu->sqe;
 
-	/*
-	 * Attempt to abort the offending command. Command completion
-	 * will detect the aborted io and will fail the connection.
-	 */
 	dev_info(ctrl->ctrl.device,
 		"NVME-FC{%d.%d}: io timeout: opcode %d fctype %d (%s) w10/11: "
 		"x%08x/x%08x\n",
 		ctrl->cnum, qnum, sqe->common.opcode, sqe->fabrics.fctype,
 		nvme_fabrics_opcode_str(qnum, sqe),
 		sqe->common.cdw10, sqe->common.cdw11);
-	if (__nvme_fc_abort_op(ctrl, op))
-		nvme_fc_error_recovery(ctrl, "io timeout abort failed");
+
+	if (nvme_ctrl_state(&ctrl->ctrl) != NVME_CTRL_LIVE) {
+		/*
+		 * The association is being set up, being torn down or is
+		 * already gone, so recovery cannot be started from here.
+		 * Abort the command so the connect or teardown it would
+		 * block can make progress. It completes through
+		 * nvme_fc_fcpio_done() once the LLDD has finished the
+		 * abort, and the abort is counted so a teardown that
+		 * follows waits for it.
+		 */
+		__nvme_fc_abort_op(ctrl, op);
+		return BLK_EH_DONE;
+	}
 
 	/*
-	 * the io abort has been initiated. Have the reset timer
-	 * restarted and the abort completion will complete the io
-	 * shortly. Avoids a synchronous wait while the abort finishes.
+	 * A LIVE controller starts error recovery, which tears the
+	 * association down and completes this request.
 	 */
+	nvme_fc_start_ioerr_recovery(ctrl, "io timeout");
 	return BLK_EH_RESET_TIMER;
 }
 
@@ -3217,7 +3246,6 @@ nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl)
 
 	spin_lock_irqsave(&ctrl->lock, flags);
 	set_bit(FCCTRL_TERMIO, &ctrl->flags);
-	ctrl->iocnt = 0;
 	spin_unlock_irqrestore(&ctrl->lock, flags);
 
 	__nvme_fc_abort_outstanding_ios(ctrl, false);
-- 
2.56.0

