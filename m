Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A30247252E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929038; cv=none; b=ln5NdLyi1OWymC0+KB/xznC/ze8uv+/8G5OMe/KBhY22zPu1uNWMhWPvjSUjkX3KktToDQEvr+S+8NKhdgAwifgr0NT0DprO9Rnxch6vMnoDdnjGlLlpNvyuClFpamXBZT2nwTXZ6xckHOCNy6GS6PrmpmP5dhb2bMipdpkvrh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929038; c=relaxed/simple;
	bh=7rnrjjZhabphz48ZRLXoqGnFCoHX2nNlJpxQZq8SO3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEbyDDvMFuNjgXs//I3w15V/LRgyYAbkgtDYRjTgVqB1Jg32LSbiXYuhL928uhmmU2cF9zgcU9TiSs+2T/RjY/R8H3HnMKGYvhRnNvuLEKJ6TMkf5G7qrtupjFhqXGmHAaPyq4MGiNqES6/VmzmULxMSkQnS+bLeFqVhoVrTU4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=DSV6+/aq; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="DSV6+/aq"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so1990721a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929033; x=1790533833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0UuleHNrFJL7Ac1BNRBp4u482qJaS6x4l4kwP4ak8U=;
        b=DSV6+/aqO1JFjC4/VgVC/7jNryxhKWO+OshOMy65CqL8+BnKzTHbUNQ9lE1bqLkHRT
         fmMMuwSAvs512y3ivBr4NTvd7oysxOnHSnLAyke3z95tadDupn/DQzcGEkPK+q7C7kcR
         NXnNWa7EwPmiT47NAX3puasJZj2OA3gA2Y4Jw4EsIawy5O7M9I8eHfNlp5FeQNLi9y1s
         p9lRQqUMgQlW0GHwrTLEwJ2FPKHPak13NiEfIb3N+kRkObc1S4dmkFxQuhHv7BuIM4iL
         YNRLpT5b9VpR59UwjChZA3v/2n2J3SN5VEeEsDSQzW4A0zOIiaIOlJ7ocFpJ/oFGHAkj
         L6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929033; x=1790533833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i0UuleHNrFJL7Ac1BNRBp4u482qJaS6x4l4kwP4ak8U=;
        b=ycNq4witu3+LRTRbcy8bmY2SVgW2LmXM0O8LeRDSSfQ0SH7kd9OdiBW+maRHhhqdyq
         VuRHNJWvol/H49NlEJumyBUern2q5XlcuCbi/573e19C6pvDhWgFCL0LJ3BQsvQ/9a59
         yNRC+dgomiad1kPOm/IiglW8Ffbwg2PE+Pjh60pCqVO6ZhViMvDl9G7rfat+qvSBKTn1
         5y/sqx/R8BZpP89NXnqERzbVE7FOONJvxzZWHf8u8QI/skAgcIdYyP/JgdCd0GYgwN5z
         vBXzzZaZZBO/PsCjZ50hCDxP7lbMepVWPCKmG9PUCQ8t/zCsdJcmrKGfKED2SnP6nmO6
         jv8A==
X-Forwarded-Encrypted: i=1; AKwUvBzZkHHqYnI/adiFTb+77TuUKHzov8r443qtZh8AVp3WAG5Tq5yDgTKTyfOr8uT/IVFEIsJj93X+BmykLnI=@vger.kernel.org
X-Gm-Message-State: AFuF++n4K0lPOxkFR/EF12Rhtx14uN6mJcl2sezRSyM46oF5nHmcJc3C
	oYteYrhnA0lARnKtLTQ7bNjntkBdzu9c3Yj0at1DgY13/GBnTmPRZseYs59OTQPNHgg=
X-Gm-Gg: AYBFou1ZGAHgyp3bk4Vnt+O0C+HJyGCt8oYPU5QADpoL7wEn1RwtpqgJv6cdfgHVZ0S
	dyC7FcM6pY0DKbKgrSGkBIyP0EWfn9B6no1Tw1QV3sJ8JpUyu9gMDWrczgNmV5qyeWHHLio5kq/
	8JWI5uN0gmicL6rfRN6MgWqUGt9L1YI7HYO/ibIXXgomQ8Xybn3XoYfYgx7/TWccKlnD948VaMA
	YNZ6OOg0499iZ1+zRTEJvs7AfALVjZWcyatINxYNTyNLef7F543GIIrLAyGaUHza6goVcc0F5W/
	5sLrAKt+I9Ooj+7+Sh0tMqAj3722qSigT9ZyEPSbrD7Mn8jbP0dJP0V7gVhDZHHX5KzEpTquV6s
	qLe/AtSjgltwYq+dW/ca+HBEZrkz8LPLnNfAXQaAPzI1NT2dFoibY7BGOyMbaNJXGkOyhw3LtUq
	IquNX/+Nx40Au/HF3sCm5nJBGhrtdcfgRArPxdfUWvCxEpeuwDfI192rfW
X-Received: by 2002:a05:6a20:2586:b0:3dd:85a8:4c66 with SMTP id adf61e73a8af0-3dd8c5db1e1mr13018748637.45.1789929033190;
        Sun, 20 Sep 2026 11:30:33 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:32 -0700 (PDT)
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
Subject: [PATCH v6 11/18] nvme-rdma: Use CCR to recover controller that hits an error
Date: Sun, 20 Sep 2026 11:28:09 -0700
Message-ID: <20260920182936.2317916-12-mkhalfella@purestorage.com>
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

