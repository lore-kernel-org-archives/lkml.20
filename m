Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625562;
	b=Yp8ZDegCz7nyfTSVuIpWTDlseFTJwiJb8jxvx3mfFRn7twQADhLOVcYEMbviuRi/Bs4o
	 wzJGf2t1jnC30sg7irfACX7wGNuVeT3MJGAQh4IChilgUPM9z49XB9rjJUvfQ6U11M9va
	 dyc3i5AIUDWSQLeD5zEDVwQV3WazI7PGk+MpX4SXEYK/Boa4dhl8nSLqsxezN0j7N9wVC
	 actirJ15aIyymOdjDfTiT4OWGlzujV6PA4DA5Z83Zjq05uMklaBQlKzHUCQB75b91xmm+
	 jTaXLVHle1/hmfjKJhucaY7egvBXYPpaTPydoVxN3Z1oEc3FIZ+z1RPZSH0uh1e2F4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qu0QicR3v2Y9fiT7BuqjEd+nN52bTpIsNe3RHBYUUYQ=;
	b=SDM/IAeB2d4+dhuiCkZQteyEN9obtb4VCS+XGtx6s1xQ1Vg7vwTtIXUM3E9AxvmHDBST
	 mX6rYEphHAOX1p0ZqLfM1pEqmbszxRoNrrXNhM7yoWOTDmkh1pbUX50/u0eG/QigkJ7aa
	 7+FP06V2ptg1NWDuEQ/g902CeWAcjC/ooklV3N4n95d92UNcw8YTFngEdNn7u9ZzMjbfm
	 hBR1BIGOLHdqGFsLXlvoTNsgUvQ3CK69y0i94DdvyQf5hyYTuBhHdhsxtNbOJAnxPCqYJ
	 IY724YMZGLfZD+govqUbteKbMcKKnx/kf8AZmCJT78M8UabFFgdycm64WBQt+13j99w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Y1fVUFLm;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D1960A383D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D1960A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Y1fVUFLm
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b244fb7fffso1860766c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625561; x=1795230361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qu0QicR3v2Y9fiT7BuqjEd+nN52bTpIsNe3RHBYUUYQ=;
        b=Y1fVUFLmfQdX9ujj7+cmqz09zOwbaKhQqquol8CL/m8YoS88MtNufIIkV6k5RVDy43
         l+eSWLcz1p2+vQRBr22adaqMdGIDwx1P9f06Wi/ORCR9OTlnkKTjRd5Vp3iC0OG5F/9e
         DWmxPGud/tswNv9J89O1GDw3y2KcePhe+wK8XJbZqmVdqKPhes3L8qNc2toBLG0Z/utw
         dckNzj1H40QN9izIB7uD2VSJrDFhz4PaSdLnZBOUFik+M8WpBP5d5mfqnKm8xVzWJXa+
         9Cq+kCxxRL/QE/z1o0WsG2RQrB0p9vJuakcN5GmXyQvZKOvpCd7dbSJ43CvJ97cRHDXU
         f3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625561; x=1795230361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qu0QicR3v2Y9fiT7BuqjEd+nN52bTpIsNe3RHBYUUYQ=;
        b=uq/yk+BMG/sXhsW6nhtCVTLmUUirBJ2TLFuA7nJY74jbCDwP8cibkdXZvzs6uRSWXu
         k0aJs4Pi5TuHH89sFgLrR1m7RuajQpG67sGLwD1/9U48J4/qlTPY6folhUB1Zyu1PxMB
         lkXlRD9o+IwFfJfIGu024rkNZNyIDFU8n16T6tUIWxyTa371jT+b2+egK4OiWyyPuACx
         /5RutMZY23059hA34roJNL7myZAtgKa81pMJ9svQegCkuDFLlTaHltAETmN9lTIPC7sK
         T9AfN6W23zZtYKZQxSIGm9sxgGKxX1HL1l+dD53wWNcNlC9ErxJ4rEGgST1ljmqkQ8ch
         0e6w==
X-Forwarded-Encrypted: i=1; AL+hErE6vYXhLf0utHRs6PgisLxUYg/LtMKxhM42VJfEG+EbdNPjuhAEhAaaJQ0fa7+WfrMPIQvpxN/tYoN/nJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u7hVTTZPNufBNNI+F4zXnyKBXChqYAVln2kknkciWLx9+gppx
	AvRYDq6zXOGyIjEvdbh8ksKN4WZBIUUuHuy4XAES9cjhlikITeQZ9tc+KkF5TQjqJrc=
X-Gm-Gg: AYBFou1tJWsGqprBZVE9FTfGWDxZt3pQmUX5/TURPkGCjMtkgD2Nbx4BrQs+LhyyejW
	x44762iVIuW5mhC9nx0dJ5+fwWKarzYUxqvbps/QGZWz7/yZJzxS/Axp6ko0ZhGvUVFMjmOf6VI
	gbL8xvWbEeUrwEBKAhzni3nEalYolUa8WenZvBlhcIzVfTi5cHdQ7sy7JsKYkNFB4iCNkOJToFK
	RCAFoZwgZjqxTG4DVhE4lElV2kJ4I6gDJRoEgsJ3djLEE1melLTLaOQfStSjqZ+WjSXOTijuPtA
	gfjMv7wxMVXJgqelVzUZru5Tmayw4scp2axy7glL4wvz7Ib892wFSdMACO8qSCoHU6SGUa7i2+D
	TP/E/n/fVP4/SIvjiFkD5OijAo5bKUNyMzOtLhXiD7IkhTrCoslcBegCe8n/40AzAqDwbb5OwzJ
	mSgAQ7R7uvdGR3vQqCOmU5oTQoDNPjj/t+OwXqK7Eqn/+vEsuC1spFOWKGGgmQeB/7wfTfVvCsu
	aqC822sn60/0BcGdVyI+lP4XnBJIpQ513Dwy6bJTJEZ+QUwXlKPBGx0pNblgoW2oA7xXprH1WiS
	sYoyNKxvYG5MDI/TUBUsGzWAqhEFCRxdVTbqx0pZs/9/zzu/EtWgPQMScLkYjn+D93QRNmEKmw=
	=
X-Received: by 2002:a05:701b:290a:b0:16c:3408:760b with SMTP id a92af1059eb24-1b503121292mr3585620c88.32.1794625560977;
        Fri, 13 Nov 2026 19:06:00 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:06:00 -0800 (PST)
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
Subject: [PATCH v7 11/17] nvme-rdma: Use CCR to recover controller that hits an error
Date: Fri, 13 Nov 2026 19:04:25 -0800
Message-ID: <20261114030454.2836543-12-mkhalfella@purestorage.com>
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

A LIVE controller that hits an error now moves to FENCING instead of
RESETTING. ctrl->fencing_work attempts CCR to terminate inflight IOs.
Regardless of the success or failure of the CCR operation, the
controller then moves to RESETTING to continue error recovery.

A request that times out while the controller is FENCING is not
completed. Its timer is rearmed, since inflight requests must not be
retried before the fence is over. nvme_rdma_stop_ctrl() flushes
fencing_work, so deleting a controller that is fencing waits for the
fence to finish.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/rdma.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 32189fdfc0f5..da1ec2dd6205 100644
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
 
@@ -1991,17 +2015,19 @@ static enum blk_eh_timer_return nvme_rdma_timeout(struct request *rq)
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
-		 * If we are resetting, connecting or deleting we should
-		 * complete immediately because we may block controller
-		 * teardown or setup sequence
+		 * If fencing has finished or we are resetting, connecting,
+		 * or deleting we should complete immediately because we may
+		 * block controller teardown or setup sequence
 		 * - ctrl disable/shutdown fabrics requests
 		 * - connect requests
 		 * - initialization admin requests
@@ -2017,7 +2043,9 @@ static enum blk_eh_timer_return nvme_rdma_timeout(struct request *rq)
 
 	/*
 	 * LIVE state should trigger the normal error recovery which will
-	 * handle completing this request.
+	 * handle completing this request. In FENCING state the request must
+	 * not be completed before fencing has finished, so just rearm the
+	 * timer and let the error recovery pick it up.
 	 */
 	nvme_rdma_error_recovery(ctrl);
 	return BLK_EH_RESET_TIMER;
@@ -2328,6 +2356,7 @@ static struct nvme_rdma_ctrl *nvme_rdma_alloc_ctrl(struct device *dev,
 
 	INIT_DELAYED_WORK(&ctrl->reconnect_work,
 			nvme_rdma_reconnect_ctrl_work);
+	INIT_WORK(&ctrl->fencing_work, nvme_rdma_fencing_work);
 	INIT_WORK(&ctrl->err_work, nvme_rdma_error_recovery_work);
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_rdma_reset_ctrl_work);
 
-- 
2.56.0

