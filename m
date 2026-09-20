Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB5B472F76
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929025; cv=none; b=BpalB+7abpZCFH9L4/V10mt7aGLWYX+0vGBwUJTFaiYDHYP34pWNZRJs3efH0oNncNtSmn9YavWRZKn0QsBvecG7ZEJEslunuCTx91XEZdi79omDQ5F0ttPsKE5rRNEKx6UOFoRAJA55/MMk6/tOmAIZ2bBkpiL+qwX3sIgKQX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929025; c=relaxed/simple;
	bh=VQDHW9FxpODr/6qNaLXLya3/nUiKniaCJvNe7qJ4yBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMaEJZgQKX3NNNJECpVD9KJCQqr5S/QCrPWOFXlyxzbb1ziOorjnol9FuDIks02LTMUNkoxswoLAMQTaoV+wv+2HJCRMaNde5HgV0yiBMJ6lQ16EvyJlg83HM2fy9Chvj/xmGgDP4BocHfOY3f+UYdesRXqGEf1QsHeT/RLhyB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=BfPiJq3k; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="BfPiJq3k"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc433d52421so1238399a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929021; x=1790533821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XucfLuTS9otn5RCUHBJMmZsLBhJtMpUV15kULQxOZKo=;
        b=BfPiJq3kXxH+z+4swL+x91YJsV9G6meHg2FaRcuDsjbH2PuX6bPiJC75DglAdr0TiF
         N0ZQ6d4XAjLLRYZBmv6uI7eaIs+W2B0Yt5WUq+gzEVkJeGvJXXr82uemvsiBcqn00LeG
         p01nV//tehqD24q8R+G5Py4txxuVAUJqREjlJektdRmEZwq2wVTpFREl0WwiKvW9NR9o
         Jjvi/DNWokR5uRiyKLK9P5ylZcVDd/5Q+Ru48ANiub7WCiqQr2ey71CaXB+4kP0SeLXN
         Y0h94w1aOfDpCm5VDG5p+6lzEhrny77RU/9Oq4H+bm8+Gw8WiyBNaFJXEZCY7fP+RTvT
         MD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929021; x=1790533821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XucfLuTS9otn5RCUHBJMmZsLBhJtMpUV15kULQxOZKo=;
        b=PmxWNhkNelAQcC/WlUfvp9AmKT3ngqDcVeMrt/ynmaCU/WzW3H4E6NmO49Hz/SEBKU
         QsG7kXLEEJfVkr62io+3zVX5ZJZ744/Swse8g8o5tnpkXpEWYODrLsOyUivWpOfMv8U9
         S87Gw2o73weyxDHFN9MEaVCHzpy78zmROboGhWm+XgElCPxoXn7tjXys6+XIt7lKw8j/
         UkOXLHjdkvJTbnMCbXSZXwugtQIqK/7lhuR1V8O/UCuKqnxJvavEZA0VUvqBbtJzOLzF
         YWv85/+yYkyMYpgs4fgboIeENYm/fs5HJ/AIpuZW743AP7sMLjz0SjYHKMKKDKooJE90
         eR/g==
X-Forwarded-Encrypted: i=1; AKwUvBwt+N8W1p2pv6hnB0j2JX+Ppze+vOxQ5B19kKfY5dMCVR1IbvYrcmphK+zaFYe+iZ83cDxCTYKeAew94Eg=@vger.kernel.org
X-Gm-Message-State: AFuF++lLUKszSGDPo9ehWnpW9dvVsb68Yv37axZbnkx21Mzc352LfbFU
	VYK8v4dq3hrvdRFkhQk8VWFX0GJA0iTnRfz7VaCGfZr4PbvGcjvKMHwRigMxrbePCy8=
X-Gm-Gg: AYBFou0Fm6mGtO4mCK87fMTVSNafFZJ+ektdAec/x56kIXEmwFxdPhnFMYm6vZq1R39
	Z2b1JCLvAj+1JQfrflwKp5byfohc1egvuMAcv7tmiz33miookXMGRhbAJr/KKFP/ZgvBKxMjffi
	oUgUGCPV5ZKwHzZLXaz/aanZfqxefyPdHB/IPQ0yhhzofAgRoGjkgmeSMZG05gdUxzQdNbxN2px
	JDT/IInKvpBxo9hzgOfLUACnbTqZi1KFxZTrF/873+6j90ZIiMdG79Rr7daAQP7zvwmISoLbH/W
	hk5p5D0QBVNwo8gTNGxV1IMDMFYURH81eWYF/1/D+fQFPVdSgxBOmnw8njXDRWp/p7RnEFwt3l4
	q9ndTsvcGlwG4oJOLLT5R6zIunUE/RE4doGO6JhGRCWfFg2ixQVbWbcuX/m+EiiaNmc5P4wKYWR
	yyBbGC7OKLox9WzeDmH9EpsaJogtoy0xQBtY9Y+LTCPfh0yBqncCAgte//wA==
X-Received: by 2002:a05:6a21:648b:b0:3bf:b84c:2984 with SMTP id adf61e73a8af0-3dd8c37d00emr15026114637.11.1789929021398;
        Sun, 20 Sep 2026 11:30:21 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:20 -0700 (PDT)
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
Subject: [PATCH v6 04/18] nvmet: Implement CCR logpage
Date: Sun, 20 Sep 2026 11:28:02 -0700
Message-ID: <20260920182936.2317916-5-mkhalfella@purestorage.com>
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

Defined by TP8028 Rapid Path Failure Recovery, CCR (Cross-Controller
Reset) log page contains an entry for each CCR request submitted to
source controller. Implement CCR logpage for nvme linux target.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/target/admin-cmd.c | 44 +++++++++++++++++++++++++++++++++
 include/linux/nvme.h            | 29 ++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
index 21538e7c83be..a60b2f271e98 100644
--- a/drivers/nvme/target/admin-cmd.c
+++ b/drivers/nvme/target/admin-cmd.c
@@ -220,6 +220,7 @@ static void nvmet_execute_get_supported_log_pages(struct nvmet_req *req)
 	logs->lids[NVME_LOG_FEATURES] = cpu_to_le32(NVME_LIDS_LSUPP);
 	logs->lids[NVME_LOG_RMI] = cpu_to_le32(NVME_LIDS_LSUPP);
 	logs->lids[NVME_LOG_RESERVATION] = cpu_to_le32(NVME_LIDS_LSUPP);
+	logs->lids[NVME_LOG_CCR] = cpu_to_le32(NVME_LIDS_LSUPP);
 
 	status = nvmet_copy_to_sgl(req, 0, logs, sizeof(*logs));
 	kfree(logs);
@@ -608,6 +609,47 @@ static void nvmet_execute_get_log_page_features(struct nvmet_req *req)
 	nvmet_req_complete(req, status);
 }
 
+static void nvmet_execute_get_log_page_ccr(struct nvmet_req *req)
+{
+	struct nvmet_ctrl *ctrl = req->sq->ctrl;
+	struct nvmet_ccr *ccr;
+	struct nvme_ccr_log *log;
+	int index = 0;
+	u16 status;
+
+	log = kzalloc_obj(*log);
+	if (!log) {
+		status = NVME_SC_INTERNAL;
+		goto out;
+	}
+
+	mutex_lock(&ctrl->lock);
+	list_for_each_entry(ccr, &ctrl->ccr_list, entry) {
+		u8 flags = NVME_CCR_FLAGS_VALIDATED | NVME_CCR_FLAGS_INITIATED;
+		u8 ccr_status = ccr->ctrl ? NVME_CCR_STATUS_IN_PROGRESS :
+					NVME_CCR_STATUS_SUCCESS;
+
+		log->entries[index].icid = cpu_to_le16(ccr->icid);
+		log->entries[index].ciu = ccr->ciu;
+		log->entries[index].acid = cpu_to_le16(0xffff);
+		log->entries[index].ccrs = ccr_status;
+		log->entries[index].ccrf = flags;
+		index++;
+	}
+
+	/* Cleanup completed CCRs if requested */
+	if (req->cmd->get_log_page.lsp & 0x1)
+		nvmet_ctrl_cleanup_ccrs(ctrl, false);
+	mutex_unlock(&ctrl->lock);
+
+	log->ne = cpu_to_le16(index);
+	nvmet_clear_aen_bit(req, NVME_AEN_BIT_CCR_COMPLETE);
+	status = nvmet_copy_to_sgl(req, 0, log, sizeof(*log));
+	kfree(log);
+out:
+	nvmet_req_complete(req, status);
+}
+
 static void nvmet_execute_get_log_page(struct nvmet_req *req)
 {
 	if (!nvmet_check_transfer_len(req, nvmet_get_log_page_len(req->cmd)))
@@ -641,6 +683,8 @@ static void nvmet_execute_get_log_page(struct nvmet_req *req)
 		return nvmet_execute_get_log_page_rmi(req);
 	case NVME_LOG_RESERVATION:
 		return nvmet_execute_get_log_page_resv(req);
+	case NVME_LOG_CCR:
+		return nvmet_execute_get_log_page_ccr(req);
 	}
 	pr_debug("unhandled lid %d on qid %d\n",
 	       req->cmd->get_log_page.lid, req->sq->qid);
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index 7e6150d9494a..70dd0770e032 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -1440,6 +1440,7 @@ enum {
 	NVME_LOG_ANA		= 0x0c,
 	NVME_LOG_FEATURES	= 0x12,
 	NVME_LOG_RMI		= 0x16,
+	NVME_LOG_CCR		= 0x1e,
 	NVME_LOG_FDP_CONFIGS	= 0x20,
 	NVME_LOG_DISC		= 0x70,
 	NVME_LOG_RESERVATION	= 0x80,
@@ -1466,6 +1467,34 @@ enum {
 	NVME_FIS_CSCPE	= 1 << 21,
 };
 
+/* NVMe Cross-Controller Reset Status */
+enum {
+	NVME_CCR_STATUS_IN_PROGRESS,
+	NVME_CCR_STATUS_SUCCESS,
+	NVME_CCR_STATUS_FAILED,
+};
+
+/* NVMe Cross-Controller Reset Flags */
+enum {
+	NVME_CCR_FLAGS_VALIDATED	= 0x01,
+	NVME_CCR_FLAGS_INITIATED	= 0x02,
+};
+
+struct nvme_ccr_log_entry {
+	__le16			icid;
+	__u8			ciu;
+	__u8			rsvd3;
+	__le16			acid;
+	__u8			ccrs;
+	__u8			ccrf;
+};
+
+struct nvme_ccr_log {
+	__le16				ne;
+	__u8				rsvd2[6];
+	struct nvme_ccr_log_entry	entries[NVMF_CCR_PER_PAGE];
+};
+
 /* NVMe Namespace Write Protect State */
 enum {
 	NVME_NS_NO_WRITE_PROTECT = 0,
-- 
2.55.0

