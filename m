Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C113051D511
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755437; cv=none; b=WN3KZKV/knTFkjiBhHK5eM412zVKbr9b1cTr+mqSuYos/QSP+RhPMoxvA0RVtW9g75ZUUlEglJTsD+1olLI/YPG+ykdP/PFpi21+itij61zkmoajavvkd1sD/4mTIZwSfrvoJPkSFQQZ6cuzmQjw0Ati9bNa8en+BpHuWW80s+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755437; c=relaxed/simple;
	bh=FZt6CXZo2bmv8xm8GIXDwWDNfGUWLjZWl34Anyu+s40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2bcc2U8OUGUpNAubJ6VdQXxquRcU1wH+4pJx1ampmEds8U2hHvJcidw/yZ3m05L6t4Oetaka1Ir6dgjo6TjuWRhhsO0+fcnpefKX8qiZNZfblRcr0Kf8cuxnNMld+oSXPSemkEFuhDHbBpnyEz5VrFiLQloghVeQTW3HZlzwCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=PQtCEkDg; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="PQtCEkDg"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef4so1099600a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755435; x=1790360235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UBOnOOrLTxtHRzBhBZsycN4YkbFFBvPMpRlDpWA+7GA=;
        b=PQtCEkDgjfk2NO1FMS7NogrPN3u/VleK/fOrhpSwsb8rDH5pw84VqPZ0iWmHpn1opG
         7el7HnMO7ZHBPIf8VjJgsABIiDjVgNF0EfkbFoxnoshfIrHpwB3Fyyb14vbhm4i3owBI
         5TGy5TvSIPK0uAJXb/cqbY48TRpwf7lRwMqMmvZ2LY1iCWBMHV6zZwBacznzXhOHsLHK
         qm2lXVrWlHsCuAbKBSZjcMzBt5XmEXwY8fIAgqzFAGdq5Qhe+Z6Vb7laV3b0A6JYjyJL
         ooSqbYSiOUWmwFw9q8SJ5h9es/N6eatLtR5FrMQ+B1IxDtEuh4XfWg+kokYJD/wZflKX
         rOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755435; x=1790360235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UBOnOOrLTxtHRzBhBZsycN4YkbFFBvPMpRlDpWA+7GA=;
        b=dhbR/SwVgVEw+AwVUz28dXuSe+QDpM8B2iAf4h8YcVKqJEBTL+mUDP8BaQpeUz5SpF
         ALustbxIKfzb5E/9/yAUQ5XnS0bfWjvSeEzdJ61KIPTrvMfRxKtaIDRXJWGmczq0u08f
         SWYyjJTsqg4PkFrDLNFe4phd2OVZkDXdcJHJ7Hk6CRik9yad7PveLBSI326w9zwn+JEf
         VJH12N5qR6e7Ta6kJ1J+vQsAY/c7d/XIQXFIs5KXFHcp0Rxv65dG/T+u/P3I/NtCBma/
         rQoGqittz40cX4M3uY4aIHR9ZK9QWQh51fKWeCr2F9SPboXOvFpupGtfqAY4ddxdqkdp
         2TGg==
X-Forwarded-Encrypted: i=1; AKwUvBzTGXEUc3n/64kWYI9h0gQXFLLOEvQpZ80YEmWe3fS/A9EWNp9O5otUZoEGflxt/FQA6exO6IfEy80e7YQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mxEhsJUYDnPMApxfG8qnfXG8AAqZ1T8/616OyACNkOzBmXHeFn
	i/TlyjI1dU/CDl4GD8gphsCh8WCYVHhfL0oZMRQWtRv6gYEwTJBDnWxjIJFzju3YuOk=
X-Gm-Gg: AYBFou2T+6UPXjRJTZP0xXzMLLrJOapBlh2Q873IeA+RuFw4k3KgNpQGFA76jABtnx5
	aYOuI5ch/NOegHVP2Ln/dcOT4Okyoo/6XesT+bCfm70vOAN71SQjku1fG6RVHIwEJf6LGIzXGVY
	DIPK2bg10uiM+k4BVxUIqPKzwSZEX4F+XZopcpS9ghk37TM7epfcpHZ6GmApMpgG3ESBiNmDYAv
	cqrzuMPTn/QA1YBKL2W8jIqC8uSUtcU+PjyV9VwoQ10LoA692jzi1birif7iBYXhKm0hUg7/zjY
	n6eKv0QGRFHS5a2EQntEZNlzuMuxCjs/u9mORd6t7k91Z0A9UOmQ6dxOxE8xB/Qwl4faZzXgqbx
	DpxvQzk9pSBygmm7O7vmoKcdG7WWYGucMGUSLyRYPHaemeU6GeDS/JTQ0ocnHvTt2r+1qYEh4J6
	viM6duSvJNEea9iDY98Y4MGBDIlukuZ5KuFs5TPr3dwjEVMOnSqdFnrE71PxIi6lkIHgBRDo5Wt
	22bolOIadwXEoXER+Fjew==
X-Received: by 2002:a17:90b:2686:b0:39e:6c69:9b9c with SMTP id 98e67ed59e1d1-39e6c69b2bemr656537a91.65.1789755434694;
        Fri, 18 Sep 2026 11:17:14 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:14 -0700 (PDT)
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
Subject: [PATCH 14/18] nvme-fc: Use CCR to recover controller that hits an error
Date: Fri, 18 Sep 2026 11:14:14 -0700
Message-ID: <20260918181614.3947933-15-mkhalfella@purestorage.com>
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
 drivers/nvme/host/fc.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 5a530aa37641..42671cca439f 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -166,6 +166,7 @@ struct nvme_fc_ctrl {
 	struct blk_mq_tag_set	admin_tag_set;
 	struct blk_mq_tag_set	tag_set;
 
+	struct work_struct	fencing_work;
 	struct work_struct	ioerr_work;
 	struct delayed_work	connect_work;
 
@@ -990,6 +991,7 @@ static void nvme_fc_ctrl_put(struct nvme_fc_ctrl *);
 static int nvme_fc_ctrl_get(struct nvme_fc_ctrl *);
 
 static void nvme_fc_error_recovery(struct nvme_fc_ctrl *ctrl);
+static void nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl);
 
 static void
 __nvme_fc_finish_ls_req(struct nvmefc_ls_req_op *lsop)
@@ -1870,6 +1872,30 @@ __nvme_fc_fcpop_chk_teardowns(struct nvme_fc_ctrl *ctrl,
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
+	 * Tear the association down now so the LLDD can finish unregistering
+	 * the remoteport/localport while the fencing this controller.
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
@@ -1950,6 +1976,14 @@ nvme_fc_start_ioerr_recovery(struct nvme_fc_ctrl *ctrl, char *errmsg)
 		return;
 	}
 
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
@@ -2463,6 +2497,12 @@ nvme_fc_ctrl_get(struct nvme_fc_ctrl *ctrl)
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
@@ -3428,6 +3468,7 @@ static const struct nvme_ctrl_ops nvme_fc_ctrl_ops = {
 	.submit_async_event	= nvme_fc_submit_async_event,
 	.delete_ctrl		= nvme_fc_delete_ctrl,
 	.get_address		= nvmf_get_address,
+	.stop_ctrl		= nvme_fc_stop_ctrl,
 	.get_virt_boundary	= nvmf_get_virt_boundary,
 };
 
@@ -3547,6 +3588,7 @@ nvme_fc_alloc_ctrl(struct device *dev, struct nvmf_ctrl_options *opts,
 
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_fc_reset_ctrl_work);
 	INIT_DELAYED_WORK(&ctrl->connect_work, nvme_fc_connect_ctrl_work);
+	INIT_WORK(&ctrl->fencing_work, nvme_fc_fencing_work);
 	INIT_WORK(&ctrl->ioerr_work, nvme_fc_ctrl_ioerr_work);
 	spin_lock_init(&ctrl->lock);
 
-- 
2.55.0

