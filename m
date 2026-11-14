Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625552;
	b=mGYgd8hSx74YGgBWo3MNt02I4IBcewb7joXIv1tBvn1ZE0ttzA+LR3Q9kgQCIihBX58R
	 w3UKshjyhW0DJsLbVwC8vvU0Y004dFnyqC3lme02B3VSAqPt7pFBi+9OvKAlHmeQpZbhF
	 sxMuRuhvvql0PMT6e9uWBLMmfbEMzsUo0+cBzt6Tk3jRG/2vaCWhdalF9zuOuhcYacU1K
	 7yrHqPHULWUVz0LZk9VGuqR1v+EKBHwQQJDtlQOwHu5nhkDyWeuf0TsPsABWQ0RIPRb2k
	 LsSTpsHVZwCdfBOCZZq9EKKVLZVqxscG6hDc+Ieb8+FCxfMhJjdVnEvHpUBkSnTy/bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CG9o4q0/p9eK6cHIz1jRq27t81avh0MFxut6HWEORa4=;
	b=qEkkG7gBK/JqQNoDcMf25DIzbuqneUgydjjHQgHt+tMcjWIFF7PejLn28VXT/BXb5UZQ
	 Dr9uc6D8ve7fYWCIQEkk+24db6r+F59o98GowTn3mFeTACPyRZ/TNe1ms1X8NC+Nmy1G3
	 QxRd35PatAIdlE9TyGYA2z2uqogEDIE2SlcoC8jO0087mVFpBqGk7mxem+D7HJYq/yF0u
	 WwKTiX2+gRKPKXugKD9aekc+m0m7mtuIiHEyWofOkNrOGEv7PjwiG8+yrgiC3nLDnuZQz
	 Yv2zIpkhvrVOYfJmXhwlf/snT6IfIc/9kQW+t3KQp8MmxZ+ZGjcBgQqkS9SCXL5gobw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="Up/XsLyR";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B67A606A8B9
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B67A606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Up/XsLyR
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15dd124bbe7so979343c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625552; x=1795230352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CG9o4q0/p9eK6cHIz1jRq27t81avh0MFxut6HWEORa4=;
        b=Up/XsLyRZtGUIXKSjGvuO0eVn1cVYq3iKXbzJLj11d0fmUZA1F/657VhBHP8BQPX0g
         Lwdw2XC1jfzOMcAg87IbVmJx5pZGpxC+RMp4fvkXZgRZLjdD4J1tW9lkCAJD090+0Knu
         jyPOSepLaJLWKlR1tHu48RLuyXKhQanjD2eputX2aGD131T5qyjEIotEAPwk7nUwQkpE
         JCNj+7/zlqchPYgJoh2eBEEse6USbZpojdGvnoba9T5Hub0bcQh9Y/6iWdczoWglgB8j
         jL7ftQyJRg7ubQuQh2k1T5B9tJIx6hfHgQACW2E2HWY6GT2GGhm75xQuO3QFue+CyPS4
         RrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625552; x=1795230352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CG9o4q0/p9eK6cHIz1jRq27t81avh0MFxut6HWEORa4=;
        b=cP5+kw++MEur+UwoydOUu5RKN6OYVveNR/Lb/uzQWBKZO6aTa/P/3IX9mDLVpU2IVT
         3Jp+fE7+sdsxuj/SH0OdHx1Nngs4SBP7iSdUUlIuUIgm7vD2DwVMFxz19Ias7QBb78dM
         rbNXXoY91l9NommLrIyL1Ykj6Y46jcLSlH5s91O7Su9QsZ8VzXslkkxovNf/tArk+qsq
         J7ttrQ77dh8hxSeZjQtOySF2av59efNwxc9mhewFOjNtVjiXN7zbQi7Z9MvGkDzHc/J5
         d0ORBZaOySOXLJiZFfgqcouIw4I/Fndng3y0B6PMS3NDDt8zgvb+hlusNO9gEazwF6Ow
         VhDg==
X-Forwarded-Encrypted: i=1; AL+hErHupV3+0OTSS6HV0STh7a84Y2VKLQwzMUXx2/lsvU6eQ5RBKgrYIJ/5g5mY0SevIJWmdIlqfUKxsVInHw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EhytUiheVgRkgoKWZE0jRFESPx0Ni8TVsO/vOw4/dR/xCE9qk
	lndkyqRs8MghmlCzDEmdje6bfC078t/DcOvy9INUsoS4MjMLOS1JSh3W8tMeOUwch6g=
X-Gm-Gg: AYBFou2XLtwAfkMtlfLivnNPc8IptP4meYfnzK4nHq1k6GrbRSMuDCRAOEbpK5KoNrv
	xjAH6aE2d4w6fiAQ6InvmtXvPExkA59idU9b2vjNYxl65taKqsjdDvHJXL6rbEiB+8hDzn3DBVe
	MeIcT3zx2ch0sAtI78fCE94OJDY5HLIfxaLQ/lD4REiHnxeRPwTas1nIqR8OEpyzFskQj+ake5O
	YaqRrFZ4eP0eZar7BbqxJGhbeZFKFeicraU2BE4mJs3pZipcLva18ZqjV0Cf/d0c8wSHXGArVXJ
	zHbtxt4IjUS2dN+wDia+O3buZqMdv2fnOw9Ew3baqS+sXdtdLpe9oL781T+OkGdCIaiO/vynL/k
	8Qfn0r7H2pTcgkp9i0wweOxDFWVeH9r0RVPFWz2xY3cM6n+AW0m18wflJw7LR7mIlHSMLyDX3B9
	d7N983ltotI7N0/5hOQv4nDsO9TUh1Q9mTBlTd97kJxX4bTd3Uk79EFz7b1mGOLBSJT0GMmC/w8
	Ly3iUANQXJtE1sCxcHgYzq+fM7DY/TMmOJ9abo+YTdCn06jgy7J9PEHaCENvaWQ584AuESXvuEH
	4jOBCeXxDlZ/7rTpew6Pv87QERrs7/JDBjwwmPOJhvaJOLw8IKXycA==
X-Received: by 2002:a05:7022:f519:b0:167:d73a:e994 with SMTP id a92af1059eb24-1b50317545bmr4203966c88.24.1794625551135;
        Fri, 13 Nov 2026 19:05:51 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:05:50 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH v7 03/17] nvmet: Implement CCR nvme command
Date: Fri, 13 Nov 2026 19:04:17 -0800
Message-ID: <20261114030454.2836543-4-mkhalfella@purestorage.com>
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

Defined by TP8028 Rapid Path Failure Recovery, CCR (Cross-Controller
Reset) command is an nvme command issued to source controller by
initiator to reset impacted controller. Implement CCR command for linux
nvme target.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/target/admin-cmd.c | 76 ++++++++++++++++++++++++++++++
 drivers/nvme/target/core.c      | 83 +++++++++++++++++++++++++++++++++
 drivers/nvme/target/nvmet.h     | 13 ++++++
 include/linux/nvme.h            | 23 +++++++++
 4 files changed, 195 insertions(+)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index 5710ae53eb83..3df9db454db9 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -378,6 +378,7 @@ static void nvmet_get_cmd_effects_admin(struct nvmet_ctrl *ctrl,
 	log->acs[nvme_admin_get_features] =
 	log->acs[nvme_admin_async_event] =
 	log->acs[nvme_admin_keep_alive] =
+	log->acs[nvme_admin_cross_ctrl_reset] =
 		cpu_to_le32(NVME_CMD_EFFECTS_CSUPP);
 }
 
@@ -1629,6 +1630,78 @@ void nvmet_execute_keep_alive(struct nvmet_req *req)
 	nvmet_req_complete(req, status);
 }
 
+void nvmet_execute_cross_ctrl_reset(struct nvmet_req *req)
+{
+	struct nvmet_ctrl *ictrl, *sctrl = req->sq->ctrl;
+	struct nvme_command *cmd = req->cmd;
+	struct nvmet_ccr *ccr, *new_ccr;
+	int ccr_active, ccr_total;
+	u16 cntlid, status = NVME_SC_SUCCESS;
+
+	if (!nvmet_check_transfer_len(req, 0))
+		return;
+
+	cntlid = le16_to_cpu(cmd->ccr.icid);
+	if (sctrl->cntlid == cntlid) {
+		req->error_loc =
+			offsetof(struct nvme_cross_ctrl_reset_cmd, icid);
+		status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
+		goto out;
+	}
+
+	/* Find and get impacted controller */
+	ictrl = nvmet_ctrl_find_get_ccr(sctrl->subsys, sctrl->hostnqn,
+					cmd->ccr.ciu, cntlid,
+					le64_to_cpu(cmd->ccr.cirn));
+	if (!ictrl) {
+		/* Immediate Reset Successful */
+		nvmet_set_result(req, 1);
+		status = NVME_SC_SUCCESS;
+		goto out;
+	}
+
+	ccr_total = ccr_active = 0;
+	mutex_lock(&sctrl->lock);
+	list_for_each_entry(ccr, &sctrl->ccr_list, entry) {
+		if (ccr->ctrl == ictrl) {
+			status = NVME_SC_CCR_IN_PROGRESS | NVME_STATUS_DNR;
+			goto out_unlock;
+		}
+
+		ccr_total++;
+		if (ccr->ctrl)
+			ccr_active++;
+	}
+
+	if (ccr_active >= NVMF_CCR_LIMIT) {
+		status = NVME_SC_CCR_LIMIT_EXCEEDED;
+		goto out_unlock;
+	}
+	if (ccr_total >= NVMF_CCR_PER_PAGE) {
+		status = NVME_SC_CCR_LOGPAGE_FULL;
+		goto out_unlock;
+	}
+
+	new_ccr = kmalloc_obj(*new_ccr, GFP_KERNEL);
+	if (!new_ccr) {
+		status = NVME_SC_INTERNAL;
+		goto out_unlock;
+	}
+
+	new_ccr->ciu = cmd->ccr.ciu;
+	new_ccr->icid = cntlid;
+	new_ccr->ctrl = ictrl;
+	list_add_tail(&new_ccr->entry, &sctrl->ccr_list);
+
+out_unlock:
+	mutex_unlock(&sctrl->lock);
+	if (status == NVME_SC_SUCCESS)
+		nvmet_ctrl_fatal_error(ictrl);
+	nvmet_ctrl_put(ictrl);
+out:
+	nvmet_req_complete(req, status);
+}
+
 u32 nvmet_admin_cmd_data_len(struct nvmet_req *req)
 {
 	struct nvme_command *cmd = req->cmd;
@@ -1706,6 +1779,9 @@ u16 nvmet_parse_admin_cmd(struct nvmet_req *req)
 	case nvme_admin_keep_alive:
 		req->execute = nvmet_execute_keep_alive;
 		return 0;
+	case nvme_admin_cross_ctrl_reset:
+		req->execute = nvmet_execute_cross_ctrl_reset;
+		return 0;
 	default:
 		return nvmet_report_invalid_opcode(req);
 	}
diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 9c9ad4d9b292..86018e0fb158 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -117,6 +117,20 @@ u16 nvmet_zero_sgl(struct nvmet_req *req, off_t off, size_t len)
 	return 0;
 }
 
+void nvmet_ctrl_cleanup_ccrs(struct nvmet_ctrl *ctrl, bool all)
+{
+	struct nvmet_ccr *ccr, *tmp;
+
+	lockdep_assert_held(&ctrl->lock);
+
+	list_for_each_entry_safe(ccr, tmp, &ctrl->ccr_list, entry) {
+		if (all || ccr->ctrl == NULL) {
+			list_del(&ccr->entry);
+			kfree(ccr);
+		}
+	}
+}
+
 static u32 nvmet_max_nsid(struct nvmet_subsys *subsys)
 {
 	struct nvmet_ns *cur;
@@ -1432,6 +1446,7 @@ static void nvmet_start_ctrl(struct nvmet_ctrl *ctrl)
 	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
 		ctrl->ciu = ((u8)(ctrl->ciu + 1)) ? : 1;
 		ctrl->cirn = get_random_u64() ? : 1;
+		nvmet_ctrl_cleanup_ccrs(ctrl, false);
 	}
 	ctrl->csts = NVME_CSTS_RDY;
 
@@ -1537,6 +1552,42 @@ struct nvmet_ctrl *nvmet_ctrl_find_get(const char *subsysnqn,
 	return ctrl;
 }
 
+struct nvmet_ctrl *nvmet_ctrl_find_get_ccr(struct nvmet_subsys *subsys,
+					   const char *hostnqn, u8 ciu,
+					   u16 cntlid, u64 cirn)
+{
+	struct nvmet_ctrl *ctrl, *ictrl = NULL;
+	bool found = false;
+
+	mutex_lock(&subsys->lock);
+	list_for_each_entry(ctrl, &subsys->ctrls, subsys_entry) {
+		if (ctrl->cntlid != cntlid)
+			continue;
+		if (strncmp(ctrl->hostnqn, hostnqn, NVMF_NQN_SIZE))
+			continue;
+
+		/*
+		 * Enabling the controller regenerates ciu and cirn under
+		 * ctrl->lock. Hold the lock so that a controller becoming
+		 * ready concurrently is matched against either the old or
+		 * the new instance, never a mix of both.
+		 */
+		mutex_lock(&ctrl->lock);
+		if (ctrl->ciu == ciu && ctrl->cirn == cirn)
+			found = true;
+		mutex_unlock(&ctrl->lock);
+
+		if (found) {
+			if (kref_get_unless_zero(&ctrl->ref))
+				ictrl = ctrl;
+			break;
+		}
+	}
+	mutex_unlock(&subsys->lock);
+
+	return ictrl;
+}
+
 u16 nvmet_check_ctrl_status(struct nvmet_req *req)
 {
 	if (unlikely(!(req->sq->ctrl->cc & NVME_CC_ENABLE))) {
@@ -1676,6 +1727,7 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
 	}
 #endif
 
+	INIT_LIST_HEAD(&ctrl->ccr_list);
 	INIT_WORK(&ctrl->async_event_work, nvmet_async_event_work);
 	INIT_LIST_HEAD(&ctrl->async_events);
 	INIT_RADIX_TREE(&ctrl->p2p_ns_map, GFP_KERNEL);
@@ -1791,12 +1843,43 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
 }
 EXPORT_SYMBOL_GPL(nvmet_alloc_ctrl);
 
+static void nvmet_ctrl_complete_pending_ccr(struct nvmet_ctrl *ctrl)
+{
+	struct nvmet_subsys *subsys = ctrl->subsys;
+	struct nvmet_ctrl *sctrl;
+	struct nvmet_ccr *ccr;
+
+	lockdep_assert_held(&subsys->lock);
+
+	/* Cleanup all CCRs issued by ctrl as source controller */
+	mutex_lock(&ctrl->lock);
+	nvmet_ctrl_cleanup_ccrs(ctrl, true);
+	mutex_unlock(&ctrl->lock);
+
+	/*
+	 * Find all CCRs targeting ctrl as impacted controller and
+	 * set ccr->ctrl to NULL. This tells the source controller
+	 * that CCR completed successfully.
+	 */
+	list_for_each_entry(sctrl, &subsys->ctrls, subsys_entry) {
+		mutex_lock(&sctrl->lock);
+		list_for_each_entry(ccr, &sctrl->ccr_list, entry) {
+			if (ccr->ctrl == ctrl) {
+				ccr->ctrl = NULL;
+				break;
+			}
+		}
+		mutex_unlock(&sctrl->lock);
+	}
+}
+
 static void nvmet_ctrl_free(struct kref *ref)
 {
 	struct nvmet_ctrl *ctrl = container_of(ref, struct nvmet_ctrl, ref);
 	struct nvmet_subsys *subsys = ctrl->subsys;
 
 	mutex_lock(&subsys->lock);
+	nvmet_ctrl_complete_pending_ccr(ctrl);
 	nvmet_ctrl_destroy_pr(ctrl);
 	nvmet_release_p2p_ns_map(ctrl);
 	list_del(&ctrl->subsys_entry);
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index fba4d320f907..5b8d87454772 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -279,6 +279,7 @@ struct nvmet_ctrl {
 	u64			cirn;
 	bool			tbkas;
 
+	struct list_head	ccr_list;
 	struct nvmet_port	*port;
 
 	u32			aen_enabled;
@@ -338,6 +339,13 @@ struct nvmet_passthru {
 	unsigned int		clear_ids;
 };
 
+struct nvmet_ccr {
+	struct nvmet_ctrl	*ctrl;
+	struct list_head	entry;
+	u16			icid;
+	u8			ciu;
+};
+
 struct nvmet_subsys {
 	enum nvme_subsys_type	type;
 
@@ -601,6 +609,7 @@ void nvmet_req_free_sgls(struct nvmet_req *req);
 void nvmet_execute_set_features(struct nvmet_req *req);
 void nvmet_execute_get_features(struct nvmet_req *req);
 void nvmet_execute_keep_alive(struct nvmet_req *req);
+void nvmet_execute_cross_ctrl_reset(struct nvmet_req *req);
 
 u16 nvmet_check_cqid(struct nvmet_ctrl *ctrl, u16 cqid, bool create);
 u16 nvmet_check_io_cqid(struct nvmet_ctrl *ctrl, u16 cqid, bool create);
@@ -643,6 +652,10 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args);
 struct nvmet_ctrl *nvmet_ctrl_find_get(const char *subsysnqn,
 				       const char *hostnqn, u16 cntlid,
 				       struct nvmet_req *req);
+struct nvmet_ctrl *nvmet_ctrl_find_get_ccr(struct nvmet_subsys *subsys,
+					   const char *hostnqn, u8 ciu,
+					   u16 cntlid, u64 cirn);
+void nvmet_ctrl_cleanup_ccrs(struct nvmet_ctrl *ctrl, bool all);
 void nvmet_ctrl_put(struct nvmet_ctrl *ctrl);
 u16 nvmet_check_ctrl_status(struct nvmet_req *req);
 ssize_t nvmet_ctrl_host_traddr(struct nvmet_ctrl *ctrl,
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index a3c1b1713b4f..d31c9648af43 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -22,6 +22,7 @@
 #define NVMF_TSAS_SIZE		256
 
 #define NVMF_CCR_LIMIT		4
+#define NVMF_CCR_PER_PAGE	511
 
 #define NVME_DISC_SUBSYS_NAME	"nqn.2014-08.org.nvmexpress.discovery"
 
@@ -1233,6 +1234,22 @@ struct nvme_zone_mgmt_recv_cmd {
 	__le32			cdw14[2];
 };
 
+struct nvme_cross_ctrl_reset_cmd {
+	__u8			opcode;
+	__u8			flags;
+	__u16			command_id;
+	__le32			nsid;
+	__le64			rsvd2[2];
+	union nvme_data_ptr	dptr;
+	__le16			icid;
+	__u8			ciu;
+	__u8			rsvd10;
+	__le32			cdw11;
+	__le64			cirn;
+	__le32			cdw14;
+	__le32			cdw15;
+};
+
 struct nvme_io_mgmt_recv_cmd {
 	__u8			opcode;
 	__u8			flags;
@@ -1331,6 +1348,7 @@ enum nvme_admin_opcode {
 	nvme_admin_virtual_mgmt		= 0x1c,
 	nvme_admin_nvme_mi_send		= 0x1d,
 	nvme_admin_nvme_mi_recv		= 0x1e,
+	nvme_admin_cross_ctrl_reset	= 0x38,
 	nvme_admin_dbbuf		= 0x7C,
 	nvme_admin_format_nvm		= 0x80,
 	nvme_admin_security_send	= 0x81,
@@ -1364,6 +1382,7 @@ enum nvme_admin_opcode {
 		nvme_admin_opcode_name(nvme_admin_virtual_mgmt),	\
 		nvme_admin_opcode_name(nvme_admin_nvme_mi_send),	\
 		nvme_admin_opcode_name(nvme_admin_nvme_mi_recv),	\
+		nvme_admin_opcode_name(nvme_admin_cross_ctrl_reset),	\
 		nvme_admin_opcode_name(nvme_admin_dbbuf),		\
 		nvme_admin_opcode_name(nvme_admin_format_nvm),		\
 		nvme_admin_opcode_name(nvme_admin_security_send),	\
@@ -2022,6 +2041,7 @@ struct nvme_command {
 		struct nvme_dbbuf dbbuf;
 		struct nvme_directive_cmd directive;
 		struct nvme_io_mgmt_recv_cmd imr;
+		struct nvme_cross_ctrl_reset_cmd ccr;
 	};
 };
 
@@ -2186,6 +2206,9 @@ enum {
 	NVME_SC_PMR_SAN_PROHIBITED	= 0x123,
 	NVME_SC_ANA_GROUP_ID_INVALID	= 0x124,
 	NVME_SC_ANA_ATTACH_FAILED	= 0x125,
+	NVME_SC_CCR_IN_PROGRESS		= 0x13f,
+	NVME_SC_CCR_LOGPAGE_FULL	= 0x140,
+	NVME_SC_CCR_LIMIT_EXCEEDED	= 0x141,
 
 	/*
 	 * I/O Command Set Specific - NVM commands:
-- 
2.56.0

