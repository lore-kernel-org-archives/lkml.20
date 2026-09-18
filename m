Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D609E51CF7D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755434; cv=none; b=fHQVrtYwTWFd4A3JjAl3JxE5+M19Zlg23GCmBLR2+nJrYRNomsPn2v5p4gVre1QxefSwiY0BA4FIASWi0Sg9l+l8zIQCz0dRbU1KJsVeP6nf8B3QFmoeMZD23pfn4nMP5LmO957yRvx5xP0k7tHK4BveqEQbFOYCU0P4KXBJ51k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755434; c=relaxed/simple;
	bh=7rnrjjZhabphz48ZRLXoqGnFCoHX2nNlJpxQZq8SO3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIFTIUSa039M0NN9QwAqY6fOZ6wygHDELce4jsWvkXrh2WTKeDMDw38RMBrHZzptU2+ukpPDEXqn7TXW+ijY5tOKwUlDjN7uzcPVekfKhjFlweveZb1P60JsC35vhFU3zJaNkYlcp0h9Dbslc2onbS106T84iiEY7c7xlFCBhzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=IMwkyL7F; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="IMwkyL7F"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d90ba1d807so13413435ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755432; x=1790360232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0UuleHNrFJL7Ac1BNRBp4u482qJaS6x4l4kwP4ak8U=;
        b=IMwkyL7FTeyBhyjiZrp73OnCqdWeyKOJ4l7SgHhs4b9H7m9f7x43VfPN/XWU0c1XdF
         bOL8JD//rR8B5CLjVfT3cCEvcRLRwEeq1dXcKBptvvFjnQVpGhL5BmMDR9xryFIpom7U
         Y03OJBP2KPJ/j5d1zGI4UWD7Gt522uZv/VljsVsI6+iRU+oSyOJCAdSxTSe34OMEB0UN
         Ri2Zxkej0sXoI8ykwRxEqiA6mlS2fsrxszxRcCdkUjMfr6ehEzZyMEeisE9ZwypMAWAG
         ZRDXFC0tuTeH0Xce/Kyf5oeAY/OT+0d64K0rPeWqQBy3CwmI/0C/wZWpg4ycxEmywYn5
         pcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755432; x=1790360232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i0UuleHNrFJL7Ac1BNRBp4u482qJaS6x4l4kwP4ak8U=;
        b=Oj7+IoZoh89lJgSl9ixJZ/qMbQ7QmPwdtGLCERbCuxn5pyqM5Qi0AilxdML/dSuziP
         jMITHY5wSxv8geAO53LjbTEtgPBiPDZQTTbv+Tm0C6qAfK+Zp2kbN3mhDB36qx8RL6Y1
         oM5dU4O1fxkEPr8gN5JWtO0JiwUOXbvv4lk6EPsxMsiCHSsMK35i9bIJA8HQqn8Lc1dt
         b2IE1tWu9KDwhc1+lNnlBWGpjBg5DNkUX17iALKLm6ZNqnvUng18VnHBF2C+oKCC3tkw
         439/OGti4iFKku8FCUcNiT2RCl/1HhmKExeT0PAlANHOEICc+vk7Q/RaTNnsfgEJhazQ
         qFFg==
X-Forwarded-Encrypted: i=1; AKwUvBw2+inpXgaMpstlZlq4aYahZDS+OfnUWhzzbEjef0DkikyK5+/mawL/q4DfgoJuX/PGcSrLAZvTDdw/czY=@vger.kernel.org
X-Gm-Message-State: AFuF++kAANf7X8a9xREbFzod8chJBdtvQjAFNcMhzD0KqzggvWKsKC3/
	/1GK4eonzMfmJ5MWQQn3LqQo6ddySmcAqgvkZ6grP/xUYNBc6Sfqugn6YG8HzfiSxSo=
X-Gm-Gg: AYBFou2QC1w07Wl45P/F8+PiGAUbTiyWeGFQGKAVoFWPSXJRN+A0i3TUnNX3EROPLUl
	9aNmHQNp/F9R0tmEpa2f5su1Ze84H2h4gu65BsgxlQmK5RYcsbzmk/CZhMCY0uFGaaHiAq/Qyqq
	58Ow883+31U6fMLjfc1cznNTlVw4LcNLqTPgbG0Z/65IevfcM/vdQGAw10cfjuvOmIw6P7n90LJ
	3wQNZHhfCDs0LN5Bp0LUTTsHACT8RFuZjxEZgbcy/HmrKCVo53TdWARI9q3fGWsUMHYjyygj/zQ
	2yJTlFnh33/1IYxbjko6U04nUlVma2/3i+adFb0UAMOrtrHr1cy3szpJP1h67U5KlB99KAkMpdr
	9c1N40OuMtGgK1GkXKcclS810wslXaxC6FnQXKIagLoCV0JHoJo1dsTe/e2i+NRCvzH7yLxQObq
	QoMiKI9bU0iJDQC8kpI4cIyY478KfDpI3sBMiNdKkSvXn9sBAzaOig5C1TFlLA6G91SxX8fowk/
	CbDJRjxRtFBmRDbN2eM5A==
X-Received: by 2002:a17:90b:3b8d:b0:39e:4c7e:f03d with SMTP id 98e67ed59e1d1-39e54f0e5e7mr6453388a91.26.1789755431659;
        Fri, 18 Sep 2026 11:17:11 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:11 -0700 (PDT)
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
Subject: [PATCH 11/18] nvme-rdma: Use CCR to recover controller that hits an error
Date: Fri, 18 Sep 2026 11:14:11 -0700
Message-ID: <20260918181614.3947933-12-mkhalfella@purestorage.com>
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

An alive nvme controller that hits an error now will move to FENCING
state instead of RESETTING state. ctrl->fencing_work attempts CCR to
terminate inflight IOs. Regardless of the success or failure of CCR
operation the controller is transitioned to RESETTING state to continue
error recovery process.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/rdma.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 29ecbe71bb2e..9c50421d79c4 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -119,6 +119,7 @@ struct nvme_rdma_ctrl {
 
 	/* other member variables */
 	struct blk_mq_tag_set	tag_set;
+	struct work_struct	fencing_work;
 	struct work_struct	err_work;
 
 	struct nvme_rdma_qe	async_event_sqe;
@@ -992,6 +993,7 @@ static void nvme_rdma_stop_ctrl(struct nvme_ctrl *nctrl)
 {
 	struct nvme_rdma_ctrl *ctrl = to_rdma_ctrl(nctrl);
 
+	flush_work(&ctrl->fencing_work);
 	flush_work(&ctrl->err_work);
 	cancel_delayed_work_sync(&ctrl->reconnect_work);
 }
@@ -1153,6 +1155,22 @@ static void nvme_rdma_reconnect_ctrl_work(struct work_struct *work)
 	nvme_rdma_reconnect_or_remove(ctrl, ret);
 }
 
+static void nvme_rdma_fencing_work(struct work_struct *work)
+{
+	struct nvme_rdma_ctrl *rdma_ctrl = container_of(work,
+			struct nvme_rdma_ctrl, fencing_work);
+	struct nvme_ctrl *ctrl = &rdma_ctrl->ctrl;
+	unsigned long rem;
+
+	rem = nvme_fence_ctrl(ctrl);
+	if (rem)
+		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
+
+	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
+		queue_work(nvme_reset_wq, &rdma_ctrl->err_work);
+}
+
 static void nvme_rdma_error_recovery_work(struct work_struct *work)
 {
 	struct nvme_rdma_ctrl *ctrl = container_of(work,
@@ -1180,6 +1198,12 @@ static void nvme_rdma_error_recovery_work(struct work_struct *work)
 
 static void nvme_rdma_error_recovery(struct nvme_rdma_ctrl *ctrl)
 {
+	if (nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_FENCING)) {
+		dev_warn(ctrl->ctrl.device, "starting controller fencing\n");
+		queue_work(nvme_wq, &ctrl->fencing_work);
+		return;
+	}
+
 	if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_RESETTING))
 		return;
 
@@ -1990,13 +2014,15 @@ static enum blk_eh_timer_return nvme_rdma_timeout(struct request *rq)
 	struct nvme_rdma_ctrl *ctrl = queue->ctrl;
 	struct nvme_command *cmd = req->req.cmd;
 	int qid = nvme_rdma_queue_idx(queue);
+	enum nvme_ctrl_state state;
 
 	dev_warn(ctrl->ctrl.device,
 		 "I/O tag %d (%04x) opcode %#x (%s) QID %d timeout\n",
 		 rq->tag, nvme_cid(rq), cmd->common.opcode,
 		 nvme_fabrics_opcode_str(qid, cmd), qid);
 
-	if (nvme_ctrl_state(&ctrl->ctrl) != NVME_CTRL_LIVE) {
+	state = nvme_ctrl_state(&ctrl->ctrl);
+	if (state != NVME_CTRL_LIVE && state != NVME_CTRL_FENCING) {
 		/*
 		 * If we are resetting, connecting or deleting we should
 		 * complete immediately because we may block controller
@@ -2327,6 +2353,7 @@ static struct nvme_rdma_ctrl *nvme_rdma_alloc_ctrl(struct device *dev,
 
 	INIT_DELAYED_WORK(&ctrl->reconnect_work,
 			nvme_rdma_reconnect_ctrl_work);
+	INIT_WORK(&ctrl->fencing_work, nvme_rdma_fencing_work);
 	INIT_WORK(&ctrl->err_work, nvme_rdma_error_recovery_work);
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_rdma_reset_ctrl_work);
 
-- 
2.55.0

