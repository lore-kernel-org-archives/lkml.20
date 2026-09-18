Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3627E411F80
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755427; cv=none; b=SF/VFMEDmEjTqr8mx7vsWanH5mE8ifk89+ltZC+NjLwAZuJM0TZ84D+toWWm3XEmIiSrMRb+xgcHy78h1vIpB5xUDsCJ2+xz5kepft374bn6HwrQ3AUhK8hSbCTyVsWGtVGE7UYRsMbaQ/diaraRZ052alCdPDLGZ7HgfqYFANw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755427; c=relaxed/simple;
	bh=VQDHW9FxpODr/6qNaLXLya3/nUiKniaCJvNe7qJ4yBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMnydKDk0JAg4PsEWxtZajYFE3ZXFsqNJFaq8GJRt+NFGeWI2HfOgLgjSYB9BdvMXzhPY1iJZv30b7mAkhH9vyvJRFvIzuWBOc9f/PjF3tPJ4WpHPPcs8WbbG9qiqQHZd6qB3VUvV0+NE7kVD3pnvv3thbPHDerFnlUvBpItOHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ABj7IW6X; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ABj7IW6X"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39e588a7a12so800168a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755424; x=1790360224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XucfLuTS9otn5RCUHBJMmZsLBhJtMpUV15kULQxOZKo=;
        b=ABj7IW6XvzydpSMBXV0TmaVIR3rzZmABl0HzLsVYS+OkIbH6NrC7jNI6Sq7tDaBERy
         nIB5wi7rJFPoZY9FpPKgySQT4ZEkDvmXS8UG6sifQxM4mDclbhrnvOZkSnlQa29fiaJ5
         v7jPboevXufKSW5SAP1h5sgj89+BOpiOMCl3Q2K2sMsc0OC39hON0O91+6ZXpbzsXs+a
         njoSf0LbdIXaKTrCQ3qYZqVdYmLLoCLd05QrsmMJNUsgYov4DQGcttg0mw+rANvmEE/x
         9qObeVZ4exioUnKQvKbdY1Noh66J8XfJHDtr02tKOjdTfniqyOYbI3TLGWsiVhcNcxEj
         ZXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755424; x=1790360224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XucfLuTS9otn5RCUHBJMmZsLBhJtMpUV15kULQxOZKo=;
        b=chu/n7sLScBSBohRfdDvZGwxevYWA1aDB20PXwj+XmRPSFFIEtt4veTlDAlNW1tz6I
         9hXKsQEOSgOM5jVPbZi9raiEfZAVTFEeK0ybxKso5n7IcRk6m/6l1aHZo2oazYu8Mre3
         R0i7cA+wHZt66jlH3N6yS/6zNTVn9SMuBpzoaDh/Vu589Ja1WZZ4hzEZp6Bj2EyXA0tO
         IJMAoBY7e3ZRM8r/XluaganEfX4rlXtfshW0eVL0IlH+cB8jHnQKQ75wkzmLZ5mmqRTg
         PTS3ND4QzzmBNyB6Q1Pv0HFaWQlzE/We91uQ6oNV36fXb0dXSXhi9TZDeCPmEktatc8w
         v4Yw==
X-Forwarded-Encrypted: i=1; AKwUvByhfHeSjUrSQ+p7Coy7UUopepQPmtJpHJeCkod7PrgXMJcJuFtHJnG7KSSpLRaJRkbR4oASiuAl6eASGZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ma5nb0wPPkTryJ+G7sm+tSFa1j6szXxsEluhQuJ+qI1j/JhHj6
	vU6oqXIimTQDu45R2XdMDMJ6AYWIcIrsyFsjcveoRJBOuhzlMCfpFGy9eVD0q6fs83A=
X-Gm-Gg: AYBFou0klXDwlBpVN9sFwMiRi15sLR1I9XBa7vlrqpy/irU3ud/arc5+JbFl0rGLDKZ
	HHWQW8VEdkYqOjAYpvc38Azo4DEj66LB5owOz/2ldW3bn6OeW3TUPFcs/DH2VdVC4ZzjVC1CKt6
	Cprjj+4lzdwvM0F8PqMpHZpXNNbI3IQRZpD2HND5E0/ABe8LIzgDkDNuVwQBUIpw8XqCS8QB8m6
	SPVm0z61BcW6rJ9GECxV0/Uf+0FP6t/y5w7xN6CQYa1FiRY7/aZZuhGl3SIDjtC2A7pHyxHyIXe
	YtMbSP3aw0e+OZK71yX4DujdUtbzpQ3u3RWnnHqcKmPcWabxPJN7fJh9pzZ0wR/NZ0hC6oYdzU3
	rx5OsG4cTi0tUTRviLqnJo7FUr/eYITX5VyepCn2rmnRMSC5yd6o6PnVmzQooYEMbqFFQOb6HKa
	wJkJiGWwpjjZq+1VciWuLLvd7oReFDD0lBlGCfdMGtkwuhhAc8lg8X0YRruh8kh1HBjNPIWqr1J
	04k3W+KL/4P5H0PLtaV0g==
X-Received: by 2002:a17:90b:3c92:b0:39e:542d:a8c5 with SMTP id 98e67ed59e1d1-39e542da9ecmr4678007a91.7.1789755424265;
        Fri, 18 Sep 2026 11:17:04 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:03 -0700 (PDT)
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
Subject: [PATCH 04/18] nvmet: Implement CCR logpage
Date: Fri, 18 Sep 2026 11:14:04 -0700
Message-ID: <20260918181614.3947933-5-mkhalfella@purestorage.com>
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

