Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC67C2ECD32
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755425; cv=none; b=Vl9J+5tLQabdWnj9K8JMHaL3EwB88nv189if93erjs/LRmWnKmff3XAfJXmigsnQ9eJhcJ6t57UmoDw+vG5SapE1N0FUNyN7xFp0iSzOq5Nl4tyHuLap94f/MXHIz6FhW4Qu4PWcviSWGbS/09HSClnvnzCaPHe+JZ71GrMsNSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755425; c=relaxed/simple;
	bh=A6iYgIlcaX5RIGEv5Q40/b2/HIHglvq8j8qJxL7H+l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJtz8c9Ro7dSPsA24ppQiMFPwZVTQoAJFrs4d2Zq3nRpKKRIMm2YWMOGKawlWDx8pA17CQP8fz2v+V3OOvyxcLEsEFnbX0uRmlYYIB0j5xfz7sYVCq4f2w44tptc+ehVtMz10cxSocLRJ7TMUEsJxiu489/COrTtgXu795O4Zgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=DoxMBfDD; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="DoxMBfDD"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91c22d27dso6989745ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755423; x=1790360223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ax76daz0K/pDtfH+NZe4NT0sGw0WCKRLANYGH5AA2/Q=;
        b=DoxMBfDDeOIz5T2Ix0CBLv0jBsnydBtdlrAR1iGGa1fvSzH80zLClAGeBVi00KZQiP
         paBSdycitZkOc9nW4Z+G1idd2lLaa/iyBUzG8hjo2WEGpgRssygXKQ3DX5TmilaZADb3
         ihWhwyE2ds469TFy2oI2i50fuVlBs7T4sBjfPxNp3hbMn2tS4EQyTunligOANNSQxDBO
         g3nRh80Wc23wZTbgBPsk6sS8UD1+rSo7EjViIAlhyQA/u7UVB4IQRGG52YlLopGg4NH8
         IZRwYctOsBoloM/Q6xVErbArYjOWMBA9iekYlUoV8M2z6ImX1Oyq6pkvJGKJ/g6uZgYh
         ThSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755423; x=1790360223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ax76daz0K/pDtfH+NZe4NT0sGw0WCKRLANYGH5AA2/Q=;
        b=gjzk/9zF+Z5afr1EAnWr5rJ5/xeIF5b7dWYSCl5G+68U0f3KTOi2oEIC2h9bOJdA08
         RSRSoo9hovJhjwe3QgggBfLGvIo/hnICxkklFOKZ5+Q1AN9kay8kQ/F0vMEC1KoSmLuW
         1rlajRBW5rvztAF7HrE+XJUCO0wWOJ6DV0A/Gv/NoxLGqpyTtnc17J3fDazc+NX8c8NI
         MzViGusvcwp6G4kGqPpSjBMkqPpyGgxWHQUsa8z5SOhen4eYo4xyfbpWvZ49DOeJ1LJ8
         APf0rOZxhaH3eS4D580QsLGFEybP1tV6DS48POVSog/G6pmeW3T5SO5uTlUnhkuNkFo8
         wyzA==
X-Forwarded-Encrypted: i=1; AKwUvBypMoU5d6L/cqrN34nHhb8QM4rj3rja7nP+42Rvc8tBzqoY+jP4YYMVJQvNE97czQr6FvHR3zvVtCGoB2g=@vger.kernel.org
X-Gm-Message-State: AFuF++nxCN9Z5OrPoKhbQr4p0plZ8Hg46GCFgqpeQKbMKfbOh9+ZPpUH
	0GjpUKa+DPVGLhpkB6xWIIwueRI0vM8oIMheLjktcs0KsHIoleDjor7EtsdszH8X0oQ=
X-Gm-Gg: AYBFou29FMgSGUsrSKpo71QWFVyWoMKRnhtIjJ4ZDextJMqpkbF7Q/BiePfTfU+QeZ9
	/VDsy2mbU7y7pK03W89bujV9GkdYAzyF9gHuu4ZIWQV8RTTyYoYMqVOfhXMAFUtNPO8P7DTOEfG
	IfAlKyuTfOcaIvode96oGNGvdGf9xPBsSLnMrT5O0G1m1GO+j6Zu+L8ikrecDVrVVbHs6gop7TB
	WN2Xnui4TGfvhBdCeRk6y0UY6BqpdLOmUBN3NalEl/sOb4LE+I/meFEqluN0HRC8JIC5tULAOgv
	bCQjMyyXVVr2zWMiN4/5ajGTnXJ7IMaEh3nUKY7Ydf9Ae24U/yANufI4UwlOOywzVu0H5+VRQEH
	1TtCORMOImRPR5l0xA6zvrBgt3I0vHMj9NLDCThQREF/S2MuKWznjc6Amre7Ht8N+rKJtf9h7nj
	PQ3g/mcEa6YlQcNcQB/VEaqxgxfrAGX9y0Cu9M+rWAL+ZJt2tXYQyLHy60rUY4+wt73VOv7pFuz
	NrOerEFxLU22hGhqaL6Kg==
X-Received: by 2002:a17:90b:3fcc:b0:39d:e523:8f3e with SMTP id 98e67ed59e1d1-39e54d36e33mr6919225a91.3.1789755422583;
        Fri, 18 Sep 2026 11:17:02 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:02 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 03/18] nvmet: Implement CCR nvme command
Date: Fri, 18 Sep 2026 11:14:03 -0700
Message-ID: <20260918181614.3947933-4-mkhalfella@purestorage.com>
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

Defined by TP8028 Rapid Path Failure Recovery, CCR (Cross-Controller
Reset) command is an nvme command issued to source controller by
initiator to reset impacted controller. Implement CCR command for linux
nvme target.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/target/admin-cmd.c | 76 ++++++++++++++++++++++++++++++++
 drivers/nvme/target/core.c      | 78 +++++++++++++++++++++++++++++++++
 drivers/nvme/target/nvmet.h     | 13 ++++++
 include/linux/nvme.h            | 23 ++++++++++
 4 files changed, 190 insertions(+)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index bf7c5f5927e3..21538e7c83be 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -378,6 +378,7 @@ static void nvmet_get_cmd_effects_admin(struct nvmet_ctrl *ctrl,
 	log->acs[nvme_admin_get_features] =
 	log->acs[nvme_admin_async_event] =
 	log->acs[nvme_admin_keep_alive] =
+	log->acs[nvme_admin_cross_ctrl_reset] =
 		cpu_to_le32(NVME_CMD_EFFECTS_CSUPP);
 }
 
@@ -1613,6 +1614,78 @@ void nvmet_execute_keep_alive(struct nvmet_req *req)
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
@@ -1690,6 +1763,9 @@ u16 nvmet_parse_admin_cmd(struct nvmet_req *req)
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
index 4c8f30c5ff7e..f5d7cb9c943a 100644
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
@@ -1415,6 +1429,7 @@ static void nvmet_start_ctrl(struct nvmet_ctrl *ctrl)
 	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
 		ctrl->ciu = ((u8)(ctrl->ciu + 1)) ? : 1;
 		ctrl->cirn = get_random_u64();
+		nvmet_ctrl_cleanup_ccrs(ctrl, false);
 	}
 	ctrl->csts = NVME_CSTS_RDY;
 
@@ -1520,6 +1535,37 @@ struct nvmet_ctrl *nvmet_ctrl_find_get(const char *subsysnqn,
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
+		/* Avoid racing with a controller that is becoming ready */
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
@@ -1645,6 +1691,7 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
 		subsys->clear_ids = 1;
 #endif
 
+	INIT_LIST_HEAD(&ctrl->ccr_list);
 	INIT_WORK(&ctrl->async_event_work, nvmet_async_event_work);
 	INIT_LIST_HEAD(&ctrl->async_events);
 	INIT_RADIX_TREE(&ctrl->p2p_ns_map, GFP_KERNEL);
@@ -1760,12 +1807,43 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
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
index e3e414ef68d3..3c70ef13c9b4 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -273,6 +273,7 @@ struct nvmet_ctrl {
 	u32			kato;
 	u64			cirn;
 
+	struct list_head	ccr_list;
 	struct nvmet_port	*port;
 
 	u32			aen_enabled;
@@ -319,6 +320,13 @@ struct nvmet_ctrl {
 	struct nvmet_pr_log_mgr pr_log_mgr;
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
 
@@ -584,6 +592,7 @@ void nvmet_req_free_sgls(struct nvmet_req *req);
 void nvmet_execute_set_features(struct nvmet_req *req);
 void nvmet_execute_get_features(struct nvmet_req *req);
 void nvmet_execute_keep_alive(struct nvmet_req *req);
+void nvmet_execute_cross_ctrl_reset(struct nvmet_req *req);
 
 u16 nvmet_check_cqid(struct nvmet_ctrl *ctrl, u16 cqid, bool create);
 u16 nvmet_check_io_cqid(struct nvmet_ctrl *ctrl, u16 cqid, bool create);
@@ -626,6 +635,10 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args);
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
index cbaf02b0cf07..7e6150d9494a 100644
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
2.55.0

