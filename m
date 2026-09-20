Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C8F472554
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929040; cv=none; b=O8pN4eF2PiTzvEKwFwSG2xWNGaNvlv/gQZQ4djQDKeua0A3ItTYpgeZQeM33+LVmAiTLmimljFkLs8YNygeT9owy3tAC3po0LJOzYpGDCWItVI0EqtV/D8LLF7Kjv2+mNnlGekHdADEH2ZeuaPzyY5Rf3KjvyQ5iBFAsGEEn0+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929040; c=relaxed/simple;
	bh=SI/It3Y7Nmi0Qd33uYrJsmK8dlYFazFQgXLrKfZIwhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvG8U5xrd2FUsEw2I2X6ZUJ7l+g4y1USrLV0KnQPeHZg3eDCmxvKZwyPhpqGHDJnafe7gwNwYvoDX12ON7NyRkZPb0mqVZ/WWRulr61Wkmss6rDcNBh4NmkNqTe5UEYvx/vnwLKj5Q6bHbF/HMj4pXyn8DmHehIbFOMZCzMc1qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=VSjE9Qzd; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="VSjE9Qzd"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso2077125a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929036; x=1790533836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVhzIJ0voivWryYWZvH7CE/nJwrk1ooSyz4ZIVHdKLo=;
        b=VSjE9QzdzI4eXvJdb52BA1DX+7Wq69akq5l5L/0htrH0j1T1lH+UMJwzVGuF1LvG/M
         NQmflEPaUqRsRnyfFd0DgkSJknAf2FyFdLa6y/z5+k3PUMeD5oaOUG4u7x8LxVKAFcvm
         HPGCnvy/DH70iUU9om2uVmr2hNYGstchsvTntGg9evLf9SqVnmzvaq3XO5qHqPZAD7Vc
         alaeQqNd8nDpT1OODFqoZzpTHuxLf2tKXG+o1UOqSI9bGpetFnE5ZnzRBu+RNdEqitmf
         HS+w6OotsDptPcxcn+TiBNxIZxVoQPG+zmeFwRFhk1bqUhY8/HXJHeliUsRRXZwLfdug
         3YEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929036; x=1790533836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVhzIJ0voivWryYWZvH7CE/nJwrk1ooSyz4ZIVHdKLo=;
        b=zEaet5EDhuOima0C/A7RW47QrvxY8gO65kkh0BOsDSykazqY2nxt8v2PPacJ1DPyEO
         9R1Rov7DLovfIAzfqEy9n7xcFU6WPVdEvR4P1IdVq0q5svRJyy+2ODrTDIg/PHrfIJHi
         dPF63wYcRfMa/uuS7I7v14EUvbuYQpeQcK3tFqavRYTdWiw6QtvIsFYxxP8mmKJE2TS2
         EixUbsmFTlX87phKLUPt7i+vI5AcKdE5THv5F0OQXMdqN8DLm6MSiCoMkpaQZC27girs
         JYGuc/gpVmmAs/aNIlgSqOc/vT2XA24lBH1xQUqbX2oxcoghXGwf8OXZxVVyObZkqTWX
         coJQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0w+5rXi4cfYV5ESF64YuENhNFuXrXGk3NeGelVirNUSfBSNcJGtvEl4hlA2a5gclFn/PdlMLwi3+6jXg=@vger.kernel.org
X-Gm-Message-State: AFuF++kirklt3tHL0gJy0LvRl2uH+BAJaGYbs3RIedXerDG+fUChl0Wl
	w/iwkFrcLIZnm3UbRbtExskYNVQbq0koxBhGYB/MCxmYlXQ1g/pCUESOltBsCNsg2mU=
X-Gm-Gg: AYBFou21ziY6Wgx+E8wFPk00fMmn3u1/7fMnuzaQ4u+xChvLhzXDP19GGzepNTl8GLU
	j0PahR+aEDVslVvnp30HOkme0yZYp7ZO4LRXIGvbt6NAPLBpYUq9Ws7Ok4hiXqpexdJU2upE4jq
	EDkysFUroC2vms39ZMWiZOUfDQ6PdnrSV1GNe3FntHS5ejberj2g/HBFLA/+Y2f/BV2h8hk58Y3
	eVAHXRTTIDJmWtp7Z3RlysqxCA9wo1GMlJxEeTGoCVHoGgLBCnKMtCJSbnd+f5ei0vCjtQEGJnq
	3leJicWvyoONJ1B8AuMoa79bUBkiduOnoD/tI5LCpummkMOMO6xrvDEyXrC9R8FZlb4fizMXFVe
	z11gCq8ROY4i8yKrNF6JSLcZ59SRdcPXfR1SAh2Z/nxGgs7zzLQXQn+aPsQ8sdsH93BXxS8LCvC
	BqK5hg6DHcY3WhmKrNOp+cumfTmp33+hALuIPnWy2ZAiE8gltEJIu0K00D
X-Received: by 2002:a17:90b:4ac6:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-39e54c01efemr13709813a91.14.1789929036238;
        Sun, 20 Sep 2026 11:30:36 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:35 -0700 (PDT)
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
Subject: [PATCH v6 13/18] nvme-fc: perform error recovery directly from ioerr_work
Date: Sun, 20 Sep 2026 11:28:11 -0700
Message-ID: <20260920182936.2317916-14-mkhalfella@purestorage.com>
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

Now that nvme_fc_start_ioerr_recovery() moves the controller to
RESETTING before queueing ioerr_work, the nvme_reset_ctrl() call in
nvme_fc_error_recovery() fails with -EBUSY and no recovery runs.

Do the recovery in the work itself instead: stop the controller, tear
down the association, move to CONNECTING and schedule a reconnect,
same as nvme_fc_reset_ctrl_work(). If the CONNECTING transition fails
the controller is being deleted and the delete path finishes the job.
This is how rdma and tcp structure their error recovery too.

The work now re-checks the controller state when it runs. A work
queued while CONNECTING can execute after the connect succeeded and
the controller went LIVE (a timed out connect command that completes
right after the timeout fires). Claim RESETTING in that case; if that
fails, a concurrent reset or delete owns the controller and will
complete the outstanding IOs.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/fc.c | 96 +++++++++++++++++++++++++++---------------
 1 file changed, 61 insertions(+), 35 deletions(-)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 6181cb7ea8ce..5a530aa37641 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -229,6 +229,8 @@ static struct device *fc_udev_device;
 static void nvme_fc_complete_rq(struct request *rq);
 static void nvme_fc_start_ioerr_recovery(struct nvme_fc_ctrl *ctrl,
 					 char *errmsg);
+static void __nvme_fc_abort_outstanding_ios(struct nvme_fc_ctrl *ctrl,
+					    bool start_queues);
 
 /* *********************** FC-NVME Port Management ************************ */
 
@@ -987,7 +989,7 @@ fc_dma_unmap_sg(struct device *dev, struct scatterlist *sg, int nents,
 static void nvme_fc_ctrl_put(struct nvme_fc_ctrl *);
 static int nvme_fc_ctrl_get(struct nvme_fc_ctrl *);
 
-static void nvme_fc_error_recovery(struct nvme_fc_ctrl *ctrl, char *errmsg);
+static void nvme_fc_error_recovery(struct nvme_fc_ctrl *ctrl);
 
 static void
 __nvme_fc_finish_ls_req(struct nvmefc_ls_req_op *lsop)
@@ -1873,8 +1875,44 @@ nvme_fc_ctrl_ioerr_work(struct work_struct *work)
 {
 	struct nvme_fc_ctrl *ctrl =
 			container_of(work, struct nvme_fc_ctrl, ioerr_work);
+	enum nvme_ctrl_state state = nvme_ctrl_state(&ctrl->ctrl);
+
+	/*
+	 * if an error (io timeout, etc) while (re)connecting, the remote
+	 * port requested terminating of the association (disconnect_ls)
+	 * or an error (timeout or abort) occurred on an io while creating
+	 * the controller.  Abort any ios on the association and let the
+	 * create_association error path resolve things.
+	 */
+	if (state == NVME_CTRL_CONNECTING) {
+		__nvme_fc_abort_outstanding_ios(ctrl, true);
+		dev_warn(ctrl->ctrl.device,
+			 "NVME-FC{%d}: transport error during (re)connect\n",
+			 ctrl->cnum);
+		return;
+	}
+
+	/*
+	 * Tear the association down only if this work owns recovery via a
+	 * RESETTING claim, or if the delete path is waiting for IOs to
+	 * complete.
+	 */
+	if (state == NVME_CTRL_LIVE &&
+	    nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_RESETTING))
+		state = NVME_CTRL_RESETTING;
 
-	nvme_fc_error_recovery(ctrl, "transport detected io error");
+	switch (state) {
+	case NVME_CTRL_RESETTING:
+	case NVME_CTRL_DELETING:
+	case NVME_CTRL_DELETING_NOIO:
+		nvme_fc_error_recovery(ctrl);
+		break;
+	default:
+		dev_warn(ctrl->ctrl.device,
+			 "NVME-FC{%d}: error recovery skipped, state %d owns recovery\n",
+			 ctrl->cnum, nvme_ctrl_state(&ctrl->ctrl));
+		break;
+	}
 }
 
 /*
@@ -2533,39 +2571,6 @@ __nvme_fc_abort_outstanding_ios(struct nvme_fc_ctrl *ctrl, bool start_queues)
 		nvme_unquiesce_admin_queue(&ctrl->ctrl);
 }
 
-static void
-nvme_fc_error_recovery(struct nvme_fc_ctrl *ctrl, char *errmsg)
-{
-	enum nvme_ctrl_state state = nvme_ctrl_state(&ctrl->ctrl);
-
-	/*
-	 * if an error (io timeout, etc) while (re)connecting, the remote
-	 * port requested terminating of the association (disconnect_ls)
-	 * or an error (timeout or abort) occurred on an io while creating
-	 * the controller.  Abort any ios on the association and let the
-	 * create_association error path resolve things.
-	 */
-	if (state == NVME_CTRL_CONNECTING) {
-		__nvme_fc_abort_outstanding_ios(ctrl, true);
-		dev_warn(ctrl->ctrl.device,
-			"NVME-FC{%d}: transport error during (re)connect\n",
-			ctrl->cnum);
-		return;
-	}
-
-	/* Otherwise, only proceed if in LIVE state - e.g. on first error */
-	if (state != NVME_CTRL_LIVE)
-		return;
-
-	dev_warn(ctrl->ctrl.device,
-		"NVME-FC{%d}: transport association event: %s\n",
-		ctrl->cnum, errmsg);
-	dev_warn(ctrl->ctrl.device,
-		"NVME-FC{%d}: resetting controller\n", ctrl->cnum);
-
-	nvme_reset_ctrl(&ctrl->ctrl);
-}
-
 static enum blk_eh_timer_return nvme_fc_timeout(struct request *rq)
 {
 	struct nvme_fc_fcp_op *op = blk_mq_rq_to_pdu(rq);
@@ -3389,6 +3394,27 @@ nvme_fc_reset_ctrl_work(struct work_struct *work)
 	}
 }
 
+static void
+nvme_fc_error_recovery(struct nvme_fc_ctrl *ctrl)
+{
+	nvme_stop_keep_alive(&ctrl->ctrl);
+	flush_work(&ctrl->ctrl.async_event_work);
+
+	/* will block while waiting for io to terminate */
+	nvme_fc_delete_association(ctrl);
+	nvme_stop_ctrl(&ctrl->ctrl);
+
+	/* Do not reconnect if controller is being deleted */
+	if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING))
+		return;
+
+	if (ctrl->rport->remoteport.port_state == FC_OBJSTATE_ONLINE) {
+		queue_delayed_work(nvme_wq, &ctrl->connect_work, 0);
+		return;
+	}
+
+	nvme_fc_reconnect_or_delete(ctrl, -ENOTCONN);
+}
 
 static const struct nvme_ctrl_ops nvme_fc_ctrl_ops = {
 	.name			= "fc",
-- 
2.55.0

