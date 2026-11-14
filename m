Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625566;
	b=t/OZW0fwD3cUOyGjgeGZet4GMburmQQcVCk3ZDx1H6FZGPwpfT1paf55bgVqtq2nNpxD
	 QXl5cPfj0pe6pXqbggAhnUqWS05YuT76H3irf617KdKCqx0F71dyUy80SqV35JSpuZoZp
	 eNkEZUZieEcvcCjQHg8fYuQAw8oMVc/D1KEdKkl5rf+DZUPZk+81RroN2Zm2poMknBUEp
	 2ddfpFhL0ZUeOsDS1E+KYxmBCbD2somC/PP61PtduL7g/urZ4JfhPTbnU9owfoBLaoRSb
	 pVCzyBxFasn9XHp3OzI5k+yTVF1gHSjhJNADNcClQ2yefwEb+2j3a6t+5hov9mRllLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BYo0W6AgTAD4HePkGTCtZZdNoeTJeu4/QhvV0yiNWAE=;
	b=AoBVxem6T8vsr+Pgaz8rNcjEDCB7AicJiNaEKu8v9bRNKkCy8VseulLcycPpRJjjOtRE
	 i2LMhYKQiD5c7vhr38XTcY8CeNBacd8dCeqoC9t2Wk2wPqi8tRWVxjfrzx02gIYdiOSyD
	 IwzxcxxqgtdfRzC9/74mYpL4SuI9UTLzXsM8sel0eVIjXY10+d7gv24Feb1yBkoCbqupb
	 8TcxmzTQa005N0EXXAyYN7T3ObRdUhhj23sGeRClWhO/WxM+HWlYJMAlZMsqwd0+tICY9
	 vYRdWZNDW2CLRsRD+y0YUolZ4sHsoQDNkzrlswQIuBGvmAx9qpOKU7lDmYsH7JdjFhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=OPfv8jZo;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597B960A6F59
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 597B960A6F59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=OPfv8jZo
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so1861462c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625565; x=1795230365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYo0W6AgTAD4HePkGTCtZZdNoeTJeu4/QhvV0yiNWAE=;
        b=OPfv8jZo8bg2QaahMI1hf3KiHRU6UJOlIwdYIbQEPlljsnjKPUy1hQFJ4u8c/3xhA3
         uSujFik/WIqT7F/QbmwF2dyFA7nn9O3berqMu5B/qgrFnOZIUmpW4c3i44YiCuxc7vLh
         SQMLodvlah6ag7SLTkY4GAmTtVG2cWiAk4wyF5Y643uXRpb/DxWFVsyjUjHuDV2plMtU
         NvE/k5waElYbT0q+Im70/MVMsyKljv4cD/qIbOl/PGhhCXS0591rVRHXgXpNgXAlUetv
         YKH8oVFGUwtnvaOEpDd8nX+q22EEiAx7lTVUPvUSJ2h3H1vKarO6hE7xtGWDKuQo8DD6
         sZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625565; x=1795230365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BYo0W6AgTAD4HePkGTCtZZdNoeTJeu4/QhvV0yiNWAE=;
        b=FEQb1HA0AI9cXmxqSo+vwVVGWo9mS3rIgkAO65SQ4JGmXzTiaquHaOrxXv7fkD1Pg2
         8OMZyIgJ8qSytZ9kV3jfTzrBbZvPxFNTGIudq+pbVtHBwMw0MoQHdNIG00+QFEgtGCfk
         H+Z4n2fYNWqKK/KqSIOpg371PBsSKQiSiWR6z1qa0kgMhs+AF17J3EulSAgIl/u6ZgpA
         1ZhQz3GXIL9i5p3ZI1ogwz7WOBqpbeFEpwejAoW6nmIJ1sjdVCs0bpwnbUus8HkcP3ap
         FJofe80RC4Cbkn/wGajuOqRxFzh/sV2YWByhRy/ICGlOnGqfVqC/vMXLz7yz9ouNqyUN
         DMSg==
X-Forwarded-Encrypted: i=1; AL+hErFH9rhXDMJ5BmMVzIccERy66UHN4qOR/uUjmHoVnUjspnXyY3k+qU9tkAHfoSsVIXioF6Gx3COTFEYiyn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cpx6JZGAPw/iWq5VcRvjQXW25kdU4uDpVLRxV+SfZw8MAML7v
	3ZvnjGBaTRpvijq3UYlu+rTDcigUkGC2pn+q0UHbEufJEBbdbs9vST8ejwcX7ooAego=
X-Gm-Gg: AYBFou1UFx5Xe5ASwXWuqICAT5mba1n6Mfn8BQSuIb9ydz2786Z+QNCBHPk1tt6sM25
	zdKPGIZFC7Foy/7TN30sgHrV3iEf5zKbGlkW26G3peeaD4HoefhpaTiDIcAI87rcUtUhr0IPt3p
	gTcITEKEh8Le7tfEACoqHIofDVZp+5CktoLmqCGhGhBkRHJ0hQ0vh4wWhHCXhLb1wC1inEGxHi2
	6nA1W45RZfcxh69p6z+EOyNS0mljBf8bGxZvMLwQslinvsF4uTb2gerZPT6iCBvvVdyHMAhSVMq
	rbQd23wuN1X0ktvXfPJki5LRtm36XFXlsaS3WDPa/0O2WsxTxBtFlrYWU7GjQ2nClbkLegZH/cT
	LnUY77l0T86gni+llMRRKyxSP17HJw7+DhxUVIvhwbD7qfre/dLiKfz3fGjDWZVgvUExBurr6xd
	m6H2Lv5BJGpjFBndgFflZ+Q3ntef9jmAKWcbAUU8l1r9TuMmL2NcvvqbIyr30lSUxwyKe+rFq40
	gXVH8A2atka38tt8IdHGd4um6e//Mesv4DaGB+Ff+q0hODloUBcVjuTDL5efuMXvwlYDawc+a9t
	77CgHKfdQXlaWdlv8YLr61xlPNxsAYjDmoBKUSRofe4ey0Z/s++HXCy1R1WOLYcXA4PjDsNSiw=
	=
X-Received: by 2002:a05:701b:2810:b0:1a3:65d7:efae with SMTP id a92af1059eb24-1b5030f2c84mr3776124c88.21.1794625564996;
        Fri, 13 Nov 2026 19:06:04 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:06:04 -0800 (PST)
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
Subject: [PATCH v7 14/17] nvme-fc: Use CCR to recover controller that hits an error
Date: Fri, 13 Nov 2026 19:04:28 -0800
Message-ID: <20261114030454.2836543-15-mkhalfella@purestorage.com>
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

nvme_fc_fencing_work() tears down the association before fencing so
the LLDD can finish unregistering the remoteport/localport. With this
patch alone that still completes the inflight requests at the start of
the fence, which matches the behavior before this series. The next
patch holds them until fencing has finished.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/fc.c | 69 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 0ba621649afe..095adc9011cc 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -166,6 +166,7 @@ struct nvme_fc_ctrl {
 	struct blk_mq_tag_set	admin_tag_set;
 	struct blk_mq_tag_set	tag_set;
 
+	struct work_struct	fencing_work;
 	struct work_struct	ioerr_work;
 	struct delayed_work	connect_work;
 
@@ -1877,6 +1878,33 @@ __nvme_fc_fcpop_chk_teardowns(struct nvme_fc_ctrl *ctrl,
 	}
 }
 
+static void nvme_fc_fencing_work(struct work_struct *work)
+{
+	struct nvme_fc_ctrl *fc_ctrl =
+			container_of(work, struct nvme_fc_ctrl, fencing_work);
+	struct nvme_ctrl *ctrl = &fc_ctrl->ctrl;
+	unsigned long rem;
+
+	/*
+	 * Tear down the association before fencing starts. Fencing can take
+	 * a long time and the LLDD can't finish unregistering the
+	 * remoteport/localport until all associations on it are gone.
+	 * Inflight requests are held and only completed once fencing has
+	 * finished.
+	 */
+	nvme_stop_keep_alive(ctrl);
+	cancel_work_sync(&ctrl->async_event_work);
+	nvme_fc_delete_association(fc_ctrl);
+
+	rem = nvme_fence_ctrl(ctrl);
+	if (rem)
+		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
+
+	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
+		queue_work(nvme_reset_wq, &fc_ctrl->ioerr_work);
+}
+
 static void
 nvme_fc_ctrl_ioerr_work(struct work_struct *work)
 {
@@ -1921,11 +1949,20 @@ char *nvme_fc_io_getuuid(struct nvmefc_fcp_req *req)
 EXPORT_SYMBOL_GPL(nvme_fc_io_getuuid);
 
 /*
- * Start recovery only if this caller can claim it with a state change.
+ * Start recovery only if this caller can claim it with a state change:
+ * FENCING from LIVE, or RESETTING otherwise.
  */
 static void
 nvme_fc_start_ioerr_recovery(struct nvme_fc_ctrl *ctrl, char *errmsg)
 {
+	if (nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_FENCING)) {
+		dev_warn(ctrl->ctrl.device,
+			 "NVME-FC{%d}: starting controller fencing %s\n",
+			 ctrl->cnum, errmsg);
+		queue_work(nvme_wq, &ctrl->fencing_work);
+		return;
+	}
+
 	if (nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_RESETTING)) {
 		dev_warn(ctrl->ctrl.device, "NVME-FC{%d}: starting error recovery %s\n",
 			 ctrl->cnum, errmsg);
@@ -2439,6 +2476,12 @@ nvme_fc_ctrl_get(struct nvme_fc_ctrl *ctrl)
 	return kref_get_unless_zero(&ctrl->ref);
 }
 
+static void
+nvme_fc_stop_ctrl(struct nvme_ctrl *nctrl)
+{
+	flush_work(&to_fc_ctrl(nctrl)->fencing_work);
+}
+
 /*
  * All accesses from nvme core layer done - can now free the
  * controller. Called after last nvme_put_ctrl() call
@@ -2554,6 +2597,7 @@ static enum blk_eh_timer_return nvme_fc_timeout(struct request *rq)
 	u16 qnum = op->queue->qnum;
 	struct nvme_fc_cmd_iu *cmdiu = &op->cmd_iu;
 	struct nvme_command *sqe = &cmdiu->sqe;
+	enum nvme_ctrl_state state;
 
 	dev_info(ctrl->ctrl.device,
 		"NVME-FC{%d.%d}: io timeout: opcode %d fctype %d (%s) w10/11: "
@@ -2562,15 +2606,16 @@ static enum blk_eh_timer_return nvme_fc_timeout(struct request *rq)
 		nvme_fabrics_opcode_str(qnum, sqe),
 		sqe->common.cdw10, sqe->common.cdw11);
 
-	if (nvme_ctrl_state(&ctrl->ctrl) != NVME_CTRL_LIVE) {
+	state = nvme_ctrl_state(&ctrl->ctrl);
+	if (state != NVME_CTRL_LIVE && state != NVME_CTRL_FENCING) {
 		/*
-		 * The association is being set up, being torn down or is
-		 * already gone, so recovery cannot be started from here.
-		 * Abort the command so the connect or teardown it would
-		 * block can make progress. It completes through
-		 * nvme_fc_fcpio_done() once the LLDD has finished the
-		 * abort, and the abort is counted so a teardown that
-		 * follows waits for it.
+		 * The fence is over or the association is being set up,
+		 * being torn down or is already gone, so recovery cannot
+		 * be started from here. Abort the command so the connect
+		 * or teardown it would block can make progress. It
+		 * completes through nvme_fc_fcpio_done() once the LLDD has
+		 * finished the abort, and the abort is counted so a
+		 * teardown that follows waits for it.
 		 */
 		__nvme_fc_abort_op(ctrl, op);
 		return BLK_EH_DONE;
@@ -2578,7 +2623,9 @@ static enum blk_eh_timer_return nvme_fc_timeout(struct request *rq)
 
 	/*
 	 * A LIVE controller starts error recovery, which tears the
-	 * association down and completes this request.
+	 * association down and completes this request. While FENCING the
+	 * request must not be completed before the fence is over, so only
+	 * rearm the timer; the fence completes it.
 	 */
 	nvme_fc_start_ioerr_recovery(ctrl, "io timeout");
 	return BLK_EH_RESET_TIMER;
@@ -3397,6 +3444,7 @@ static const struct nvme_ctrl_ops nvme_fc_ctrl_ops = {
 	.submit_async_event	= nvme_fc_submit_async_event,
 	.delete_ctrl		= nvme_fc_delete_ctrl,
 	.get_address		= nvmf_get_address,
+	.stop_ctrl		= nvme_fc_stop_ctrl,
 	.get_virt_boundary	= nvmf_get_virt_boundary,
 };
 
@@ -3516,6 +3564,7 @@ nvme_fc_alloc_ctrl(struct device *dev, struct nvmf_ctrl_options *opts,
 
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_fc_reset_ctrl_work);
 	INIT_DELAYED_WORK(&ctrl->connect_work, nvme_fc_connect_ctrl_work);
+	INIT_WORK(&ctrl->fencing_work, nvme_fc_fencing_work);
 	INIT_WORK(&ctrl->ioerr_work, nvme_fc_ctrl_ioerr_work);
 	spin_lock_init(&ctrl->lock);
 
-- 
2.56.0

