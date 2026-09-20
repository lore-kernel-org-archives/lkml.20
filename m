Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1411471425
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929037; cv=none; b=D/YGRts/s8qOrs/1cCR/EA9oA6jnkbpYvWgHTHL4l3sUBASqb+kkytbp/QJwj/l1W2kn6CttgckWD5cuvGSqmOjuhZI9XIYUcpO6qTv6Ff+KD8JVspYSKFCPgnhVtEvMp14mEIGQEcLq+o69q8NwdkhC4FTI+pc0YkpApB16F8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929037; c=relaxed/simple;
	bh=wqPjBR1evZQ/NfBLUjWvC2B83LrJtIxtRxteAVRWHsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iB76hNfpHbQXBaQoFVbKOpWRF+j84d6lMAnyqRJfgat8YSxNf+xF4sonv4Wd5qQwXLPJJseFi3fZ6NYWCbhTqrLA9z7dNnXHS/LwKpZMjmArBEzH1ITxPTLXSV0eKCfrtpRrZLhixkGkh008WhBHFCE1ntMkLpEmxA47R+8aGPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=X0GkcNoo; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="X0GkcNoo"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so20187185ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929035; x=1790533835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmH177YS3gZ19sjEKDEKKTFEFMiPIMvZkv9++g5knBc=;
        b=X0GkcNooaUTP0pHbLUYkJ100ydAsl1V/MAFnRptWzBc0mih4QxsmfZcd6nRwgS5w5c
         x/Vqnv+weyCIbT3ZHeoyBRwOYkfNobIAjg11ZTBEJOgbYYSbLM3L1nFWH3yS+SQntAc5
         ARpxytbN9/c/7FtFq2vDeYrIBd5DVCOWAOVPthOS2Ufa+UHcyKVqPrC9fTZMCX7PYZnf
         fLml0xiaJTHwPkA8RaKg+aDDqElG4B2QWz0K76bOhObx0C4/ubMC9i9L/Pa2wWPbAEgW
         9KF1cwBubeQJweCCmrXlpFi1VnP8miKkssVAVBX9WTWzx8w4R4gUBBub3HfMzJwFKlv3
         5eFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929035; x=1790533835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pmH177YS3gZ19sjEKDEKKTFEFMiPIMvZkv9++g5knBc=;
        b=gW/F77Cx75O/PWCagv4CFYk3n7pzH1Iog1nhRKDzexfV6hkpIauTrhWt8aH/YSSi6Z
         QvUtbIUcq44AHBMnGH2sYQhViQLhQBadKAKy6d5Dt9JxKoKqeuAjAB1zWXtWUjKhZBfI
         y0Zjn7a66R3mr/OThfRZQn63zwDFDtxXqMBsRxwRbI8LG3gbHcDSWGqn11ONl5Vxa2y4
         k25nNi5An3lD2MRWkxdb0IoFqLigexfgo3vRibG1vY1HDgTrwvHRt7m5CH1aIBeO9lTM
         nf/+2nAkbLG9PrslIqV4TvZDcVfbI6/IvD1zhEBxccb9BaonY4hWUxsWUYV27ifLk4el
         jV5w==
X-Forwarded-Encrypted: i=1; AKwUvBw9DgnHK/aCOKxOQQkG5aH9Wnpm94+rb2hQGIy3L3LIJR8pkKJq+QKX0BLNh4PiEoPeLPQfh5wYq5AOpkw=@vger.kernel.org
X-Gm-Message-State: AFuF++mIM3+kiG0F8bGNXkcWRFkz3lJ/3BDNHoIBm3iHSn/TUkBMVRmK
	GFSKDAMSVxbOzexV4wfZIR37Hqwichoh6VAe07h2351EF/7QU93h937gq1zGxrtjeUI=
X-Gm-Gg: AYBFou0ym1DswiKdwgHAL1ufdwQeuh6/zlE0tnYwbYMbmW9fApCugUgCM6Qos/7Ih5x
	lehlCFWHpYloVlJN0Kp/J8k7zM3u7ZkbyKUEI4DerI30Kkz8noYkl+OZDcjVG06jxeerfJMBKdp
	FyGmFHmXQOH5V98Mny7oS0NjB9ALwOOIVODtsLydtYt6NlvYssGIQXLZOPWrRkNWgjS7iYgTOQn
	WYeYYKThEkYVeYp3KeEpf71NH3ul8GlMa8ndHBfTpbTZvjg0uhMBS5tx5oBSIUx4FpOKlLf7v6V
	ZlpC0wzDyErRlc388t7AtN6+nEXYG6hfeauPmYqXmrf/Pd/CGQk+u8p6w5l9cIa/iXUxlExjzUv
	cY1p6SG7VIaTDmwPSFgv27bAUs6wZUZMkGrWBv5tbg+HORPzer8tWLKmFqvgwu4cxx8yc8L0aow
	VR3h9cMx/DykgyDAfPpoEn8nZxZuBdrBkvU/73P2nCpaajEYwMwO1aqz/c
X-Received: by 2002:a17:90a:e7c9:b0:39e:6c69:34c9 with SMTP id 98e67ed59e1d1-39e6c6935f5mr7688114a91.45.1789929034766;
        Sun, 20 Sep 2026 11:30:34 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:34 -0700 (PDT)
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
Subject: [PATCH v6 12/18] nvme-fc: start error recovery instead of aborting timed out IOs
Date: Sun, 20 Sep 2026 11:28:10 -0700
Message-ID: <20260920182936.2317916-13-mkhalfella@purestorage.com>
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

