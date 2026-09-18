Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C460151CF5A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755435; cv=none; b=ihVeUULNISvN6yZVKD/hnb9PQzOHJ+XlOMJLOcMlf1PVaqBZcZ2Zyqf3wTa80oXaWEw22E0tqtjGg3i7bWd7qQZWVqoxFtk+bfCOXNFcuvkz2UVZWbHyaylkmBGuCtJdukYwugzopX2cwQhGFMlL0LuI9lpG6cMfbPIVjcNJjBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755435; c=relaxed/simple;
	bh=wqPjBR1evZQ/NfBLUjWvC2B83LrJtIxtRxteAVRWHsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DaedUgh5adknW3cnsVmwYoXJ6/Mt1TBJ9STp+B0nQFC0sH5QNuyWDF0e8Pz/d0iHm3C/NjrXzWY0g5rOfkpNydbNt2ZmMtyguZjQRqeswV38QvmOLrVfRRpT3d518WxcPZ7PZuEVVq46J7a/WI9BAqHTAqTx4R4w318Esi0GF3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=H8AV/Ql3; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="H8AV/Ql3"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso653737a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755433; x=1790360233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmH177YS3gZ19sjEKDEKKTFEFMiPIMvZkv9++g5knBc=;
        b=H8AV/Ql3jyu5Hz3zBmYL1y8/BWk+aHDHBHdmFX+6KAVfeM3Wsroigk9YTSffSxGvPu
         prWFRv58Tsd3NiRRxOKSE2YNmwB+eQ0MD1Kcn9JImq01wtBRRSKEyWucBOFr1UX6ATke
         5OcHYQvuXLlJYLXjL7JO9US8qgd1BXMm/WT1jis02r+bShrgeXKeXjR3OK3TRkvbzoi9
         4E9JRYXxkXopK80tOlvl9Lcue7KhWdFGRMWnuAf6djgd6z7b2rxuDySFOm1O0YbRRAAY
         IWI4fECJI8ICwUjBp4dpTcxxakzHcYQrEPwECqAV6e7tnaAp6/rhAu5nPyWtYDZ6ijxY
         1n3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755433; x=1790360233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pmH177YS3gZ19sjEKDEKKTFEFMiPIMvZkv9++g5knBc=;
        b=uZx1mjeozMjv5ps9ptxmeWvYFtY6H03VnJHNIwGNV1aipFrvjqvmS1whc7cqTWjs/n
         5z3R51bkBkvl/Igoc/BKPxeOQIHOSgPLjdKMWUGOM+LoolHhY/fX6ROcGuXRmW9lY/Ce
         ep0pX8nv0hEBIiBGX78eZqJazoONDy5kxhIBNonqeU+qnerGMYRToQzHpD6zY2x/D1I/
         4pIVz/N0KT0cGdxuQEKgF4yrbOjBtpcbKG4q2SNKeCujHKHKmJQEqm3OpOz3VogMcVNf
         PfbGjnMoT2fHXJYg2GCn6BGxVI6wHFXe7nddLY8gZUHC/TqCopYgX9t2FI713AkZJHxy
         x93w==
X-Forwarded-Encrypted: i=1; AKwUvByoTF4lQsWKnedgcwlJ/gz8q3Zjgnk1+jvedM6xWhc7herXsr3Tgh6qY2fxk02Z4IRNyahtIBr+sIgy2Xs=@vger.kernel.org
X-Gm-Message-State: AFuF++l52Bt3S/+YPnjAATnipZTMp8zJlJmk0YnwkhTyABK6na1aeMy2
	rv2cepLCAHg4Mm7QsorZmJ9sas/yfUTnin5LzbrnXYusBRfY7oKpws82/5aUNwSwiyc=
X-Gm-Gg: AYBFou2VgSLfIw9451BKnWSoTpbCdynn0gAkT9uqbcQS4oY/mNQ/Szs8VkZErLN9xi2
	OC0IT4dZUCGAkr3O1J5e/7NlU7uMm0jpWmSc95B+LR9hrt1j6zqlca7YNXFithcyI4MMrsdOun2
	n4wkkQ0wyoEqwRValbtP5dZHijV9FZTTfcJhXHJXzzdF1mOLhz22fOmuHlY3+cXYfmJvn7no3VS
	7sr4xYO1a/VCMDA3l8clUrCG7qW5zID4QPj0duZqvEu4rIDvsh1B1GEyg/w/j29Zm5M7XfdAesP
	KpDI/bphe2rx6k5C1bpeLKNDpRnXOICOgdk++82YudiFTNwUG5403q2vZoUn/0b3MUESMd7MN+a
	/BgepYlgONxGotcPYAB/9TlMpOXxq/wJwngyfSQ05Ugpm5b6uMMDavYdHvuJhBHbtmApJGrfjH2
	uts+Y2tAMfBjnKeuyjMXFMcRoK9KYthWYBuZBET9BCzB69LLI0BH6hGFRDokkONjX1Sw7frnEVk
	RWwrdZsIdRlhDwhmMVmyR9z3e0toEIL
X-Received: by 2002:a17:90b:4c:b0:39e:6c68:c780 with SMTP id 98e67ed59e1d1-39e6c68ca53mr592406a91.54.1789755432638;
        Fri, 18 Sep 2026 11:17:12 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:12 -0700 (PDT)
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
Subject: [PATCH 12/18] nvme-fc: start error recovery instead of aborting timed out IOs
Date: Fri, 18 Sep 2026 11:14:12 -0700
Message-ID: <20260918181614.3947933-13-mkhalfella@purestorage.com>
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

Aborts issued from the timeout handler run outside the FCCTRL_TERMIO
window, so they are not counted in ctrl->iocnt and
nvme_fc_delete_association() does not wait for them. The association
can be torn down while the LLDD is still working on the abort.

Instead of aborting the timed out command, reset the controller like
the other fabrics transports do. All aborts now happen in
nvme_fc_delete_association(), where they are counted and waited for.

The new nvme_fc_start_ioerr_recovery() queues ioerr_work directly in
CONNECTING (abort the IOs so the connect attempt fails) and in
DELETING/DELETING_NOIO (tear down the association so the IOs the
delete path is draining get completed - the timeout handler no longer
aborts them, and a dead target would otherwise hang controller
deletion). In all other states it moves the controller to RESETTING
first. Connectivity loss, disconnect LS and IO errors now go through
the same entry point.

With nvme_fc_timeout() no longer aborts timedout IOs the reset code
in nvme_fc_reset_ctrl_work() needs to be updated to teardown the
association before stopping the controller. This is important because
nvme_stop_ctrl() waiting for ana_work or fw_act_work to be flushed can
get stuck forever.

Link: https://lore.kernel.org/all/20250529214928.2112990-1-mkhalfella@purestorage.com/
Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/fc.c | 54 ++++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 48454cb7a0fc..6181cb7ea8ce 100644
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
@@ -1892,6 +1895,30 @@ char *nvme_fc_io_getuuid(struct nvmefc_fcp_req *req)
 }
 EXPORT_SYMBOL_GPL(nvme_fc_io_getuuid);
 
+static void
+nvme_fc_start_ioerr_recovery(struct nvme_fc_ctrl *ctrl, char *errmsg)
+{
+	enum nvme_ctrl_state state = nvme_ctrl_state(&ctrl->ctrl);
+
+	/*
+	 * In CONNECTING, ioerr_work aborts the outstanding ios so the
+	 * connect attempt sees the error. In DELETING/DELETING_NOIO it
+	 * tears down the association so IOs the core delete path is
+	 * draining get completed.
+	 */
+	if (state == NVME_CTRL_CONNECTING || state == NVME_CTRL_DELETING ||
+	    state == NVME_CTRL_DELETING_NOIO) {
+		queue_work(nvme_reset_wq, &ctrl->ioerr_work);
+		return;
+	}
+
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
@@ -2049,9 +2076,8 @@ nvme_fc_fcpio_done(struct nvmefc_fcp_req *req)
 		nvme_fc_complete_rq(rq);
 
 check_error:
-	if (terminate_assoc &&
-	    nvme_ctrl_state(&ctrl->ctrl) != NVME_CTRL_RESETTING)
-		queue_work(nvme_reset_wq, &ctrl->ioerr_work);
+	if (terminate_assoc)
+		nvme_fc_start_ioerr_recovery(ctrl, "io error");
 }
 
 static int
@@ -2548,24 +2574,14 @@ static enum blk_eh_timer_return nvme_fc_timeout(struct request *rq)
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
 
-	/*
-	 * the io abort has been initiated. Have the reset timer
-	 * restarted and the abort completion will complete the io
-	 * shortly. Avoids a synchronous wait while the abort finishes.
-	 */
+	nvme_fc_start_ioerr_recovery(ctrl, "io timeout");
 	return BLK_EH_RESET_TIMER;
 }
 
@@ -3348,10 +3364,12 @@ nvme_fc_reset_ctrl_work(struct work_struct *work)
 	struct nvme_fc_ctrl *ctrl =
 		container_of(work, struct nvme_fc_ctrl, ctrl.reset_work);
 
-	nvme_stop_ctrl(&ctrl->ctrl);
+	nvme_stop_keep_alive(&ctrl->ctrl);
+	flush_work(&ctrl->ctrl.async_event_work);
 
-	/* will block will waiting for io to terminate */
+	/* will block while waiting for io to terminate */
 	nvme_fc_delete_association(ctrl);
+	nvme_stop_ctrl(&ctrl->ctrl);
 
 	if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING))
 		dev_err(ctrl->ctrl.device,
-- 
2.55.0

