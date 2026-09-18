Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A6E51D501
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755436; cv=none; b=l5S+EDQYFY6n5iWvvLLi6PawIsJxAUX7VIYUie9/FpsRVQmz4Fbj5/55HXEOZbZBRvgAm2pPXBIeX43HgSj2pasvonruDHx13T96vbw8vYh/84ho8tuJKQPEaxfPnRqmMtvW6xjZl+dI3cJZ0bZAqGVhGZfTWlVDksw1MVIX0G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755436; c=relaxed/simple;
	bh=SI/It3Y7Nmi0Qd33uYrJsmK8dlYFazFQgXLrKfZIwhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCgGZKsNc51+GAaM9+9oYahBqSyTL1NzY9Txr8/RIEzNyq98/KxlyfcVVHfl8lewEGM5Z13VVPmsUsV7PAdA8va95/o3JkTe/NjhqV64E0iJUhWwTQMWpWBLR/LSrtiSA3DU1WKc10s/QreMkHxLJ7hkYINva5hvbuK7/VhYs7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=GGf3VJUj; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="GGf3VJUj"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso855206a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755434; x=1790360234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVhzIJ0voivWryYWZvH7CE/nJwrk1ooSyz4ZIVHdKLo=;
        b=GGf3VJUjxBSUpxPEgag3v7lFnw8BDpLcdSZ2PM0TB8UZOVx3F/N/xs225tga5UCwp9
         47VBzOcHSHzOjr/RLXtzxHgipUnJ9IqjE4buAtTlqjhaCbf/HIO74TMrOgVD3DlWBunw
         zg4AgP35p9+8YUD3hoNPUA8sN/mdNIpbT1xn1dvdy8LPDeYIGEmZpLruRxSZ7b7sYdW3
         GnUeN1JEs8D2PIw6a2Df3OjFcZUZDdWJd0pWk5EDSlSdCEug1L7GCx85m9tGjU/809xm
         raNyHK9VLMcM3CDjgVlmotV46syXLIAfNqpvw0dDdXy6HXUcNEvLFdli/f+cmnKDzZjm
         pw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755434; x=1790360234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVhzIJ0voivWryYWZvH7CE/nJwrk1ooSyz4ZIVHdKLo=;
        b=xBzl1mHcHQKlf7+2xIJ1ZYUoPXyxF3/E8UnwaCCI1NyJnWxl+vp3htxnz+l3CLMUyv
         ITuvaCF4cIqHPyOA5cU8lEw9S+X3HzZR4Z9VgiWpblgm2MfCTAovFnfM0cLh85L/P3OZ
         xjCMNU0nz2myG+8eTr8Ag7DvIvZAE6xbVM9k7M2yE15IZbXFdFf5YkN+PsdB1WaT0Mk3
         kGvGl2sNjUL+K5estjp2qxxbZzhqLnWVi9clX1iUyCqgBOj8SYHn8jbS7CvA/ALD3qZX
         1PZhCw9GIFL2zFtoKl9Jwe9TFGQaz8nmL4X5ZvP/GXvfB0I06na5xtASTzuxHjhTT4qt
         Lx7w==
X-Forwarded-Encrypted: i=1; AKwUvBwrql9zYNirHwfwlAdZGz/Qhdj5rM5Xdf5yh+UVOnFQX8cMWgISY/EaytGpAK949wTC2zf0t3fOimdY1jo=@vger.kernel.org
X-Gm-Message-State: AFuF++mDn4JbN24l7eT7to4e912eJRZX12QLIHHWIqmkI1G3r2tNwOXY
	83ZE2zvXkJDfQrQCJw7AkmbP8h7a/As0uRMcaaPmuynaZTkr5u+xgbXD5FBCGI/42tU=
X-Gm-Gg: AYBFou3NTjA8GD+FyE78lyt1ovCKZlnQXlLEYu3rPFIGhXO9jUH5G2MHEFUjk3Eifx5
	+TZW2CIJaxiDRkkEFXgVAI0G1pAw0kUf07UN0MoBwwZURHvTiMES95RImOrXX9IKspEaanmiZKn
	tK4cFjmXmPv1QiMyufa+lqMGBvn/ZWbtmnnOGaAFkRvY9X4YV/bWxYdWVVgbNOhr208L+JfZ41V
	rEppwK2xLAPTpKDPX3dTIeikcc+J00RCOcD/KqwzV/mEQZXWIwDvtSGKFe2aDSxSAS7bT4bbrbH
	Pl0ra4NIgQ1KuNYnKsyjYjycRd0cgtM3LHdnumFop/7KS+t8I629IMBT5qW02ieYvWOoIfj3ZCm
	a/GpggrTaXEruFuCu2x96mL37MpSk4VMNUz+YpRbNtipbOHPG/swHV3xGS5lsLURAxRWyLHhEpb
	FlOoovp+FanXuZ5Kgop+c9Q9OBQzuuJUmQnCt6KD50dx31jvKgFA4rfF/y1uOZNVVef0UsGreBW
	PwKYaPEENzs6tlFG42D+w==
X-Received: by 2002:a17:90b:2784:b0:39e:6a7f:eeec with SMTP id 98e67ed59e1d1-39e6a7ff073mr2104953a91.17.1789755433632;
        Fri, 18 Sep 2026 11:17:13 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:13 -0700 (PDT)
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
Subject: [PATCH 13/18] nvme-fc: perform error recovery directly from ioerr_work
Date: Fri, 18 Sep 2026 11:14:13 -0700
Message-ID: <20260918181614.3947933-14-mkhalfella@purestorage.com>
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

