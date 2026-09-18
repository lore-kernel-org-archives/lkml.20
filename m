Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFB351D509
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755427; cv=none; b=GYOeAScH0C8KAnJXLC75UOyM1ToAWkzwJoS190IiL51DYnMyEHrU6lxiCEVNjQEONA/4nyxex8UxjDF88TY6fffYjDCeXVH5WdX9+RkniM/PtdrjAYbPYj2ang5STMc3Ef8//OFYGDPDb0BjZ6vVLHcmhOWHYVRPRZq9VKA4RfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755427; c=relaxed/simple;
	bh=RIVoOlmqZFMJOUfhjvyFuQR9GESlJzJLW8eoZZQuGKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJ/aleF5/7v2xrChMSmwgMI0Vet6nG1e7lEbhD5N4TUwqfpFsinJTEs0xsMa/nOcpaQ3aJWg6JTKDidxjdDlRSi9Ya0gZm35bvTPl5nwdRsIlcOGPVdJkNBeaT/092NImqIR4tgiq30NdIEbEHdorBL/f0YU/ojhZ9HID8ss6+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=DnFgGCHv; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="DnFgGCHv"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398cb5615deso1201309a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755425; x=1790360225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcg806D5vzEHCLipGmbi/V7P1l0j+1hngUNt1RnsJGI=;
        b=DnFgGCHvJ9HlYG+oLRQ4UU3+XtKyAWYIA1seTx1vYWf3uMQELFd6WG5L/UHZzsgpDA
         qfG5nSLZVTpvliedYZqm7szjLFmCe6DTGP6UNvEchMmP9PehAmIOiATX5zVgG2NjXzhB
         ZcmSNFNXEMSU4lZy9xX3s9B5tPnKnfPBYZpc6a5ymo+7CCwCzwflxOx2rYd08cYLiB3m
         HGMnjMMlWs5fbc4IgCea1UnhhbS8HYZ84Maut6qpEheARm4aKzr0Jp8Eyhtm7XglO8DA
         /zSDat+z7cBak3sn3v5E3aD1Lqf9d8+vTJ5y340q9JbkTp2XCvy9245uGMlpjLe6HYxF
         KFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755425; x=1790360225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcg806D5vzEHCLipGmbi/V7P1l0j+1hngUNt1RnsJGI=;
        b=FY+haeLEogXuAZFVByE4wfrWln13rnwMEcAcmGiT2qgPG3esn5aHbVoUKGe7TSdUzD
         s+bLsB0FzI4N5v/DpgfWwGfvXrh1u6apOdNp1yZuPEp64ngiFmOxLnC7QRbv3PrhzDKA
         qetoWWieaJDXIFJbr0UjqjCqz1ftghTiDxms0DaoRt+E6nga6DUiTrcG/kRci6NhFyLf
         jtubLGEG5xkwdO+fiHRROqZKyDTLRchfDoZieHEYPKPhbiMq3V8lGqtVD42ZDBK1EvXL
         3gc+ACX1eCwI5CFBY75Ul3fGYqZYWZ+lsdqiTAUyMtK65O5xUKsSt3gsctImQg9qOCfL
         vtqw==
X-Forwarded-Encrypted: i=1; AKwUvBwE4PqKvcf3LKZJwPRaeThviyWCAFr3R53tvDXalrDUvy9Wsn97Dg8eVNfE+qJ4p+YlbmA44Ol+vwPdr0A=@vger.kernel.org
X-Gm-Message-State: AFuF++kFuRjqazz7n0CD0H+UzEnzT16R6kAV7mvALLax/LFPlnxbhgGO
	Grvv5p8CKFbFRSEEGj9b5YrSJqvbV7Ep4TYFLJ6CoSSqvGHqtztMD8Xq24gqZIIrDIY=
X-Gm-Gg: AYBFou1Ux1sdBvQWBtacsk1lGY70Gxy4EAinh2jauOQeP/qkjXRobcVaFRo1hHb8e2M
	fXf0g4MjuB4BKYoMgONLv5lSv7FN/rwCN4QML14LeKz+s2ZbOT98MCo8AOD0bI0nTYdj1QiVDPK
	7ovYx0W6magTLs8KJWp5f+WPFmiHPaUymSNuGMlJXWhWS1RKtpjYCrU0TEQR1yHcJmiVAZYID8g
	n7ylCIeN6BMPZoFIpOBdewXsVd3XCujQ5rPN1hFvzolE5cbhBdm3UD2Vv7UUS0kd6ij5gK8IrtJ
	L0OgiRFQpwJBMqufzgaFt5YEnCz+/CCxuCOwvzUwlQw2ihw/JoxSg9slYa773cfAbL/dlrzx4rV
	85ti7WoJuG0zP1KpACDZC9i/JlbDu1f53+9d/Du8Kp4uTieySKebJzh2kyo6D0n18UYHOY3u5xh
	MyPtKCTfmJlBxD6K3eDKdEVckUiLZMIn8zkurhA5PttfehET64dF5xRn1I8qv5P2W9q/lA/t3K2
	MQvQMhcnQVqwjZzxKxoiQ==
X-Received: by 2002:a17:90a:3f10:b0:39e:5cd8:2140 with SMTP id 98e67ed59e1d1-39e5cd825f0mr3188400a91.20.1789755425376;
        Fri, 18 Sep 2026 11:17:05 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:04 -0700 (PDT)
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
Subject: [PATCH 05/18] nvmet: Send an AEN on CCR completion
Date: Fri, 18 Sep 2026 11:14:05 -0700
Message-ID: <20260918181614.3947933-6-mkhalfella@purestorage.com>
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

When an impacted controller that is the target of pending CCRs is torn
down, send an AEN to each source controller that issued a CCR against
it. The notification points to the CCR log page that the source
controller can read to check which CCR operation completed.

Split nvmet_add_async_event() into a locked helper so the AEN can be
queued while ctrl->lock is already held.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/target/core.c  | 25 ++++++++++++++++++++++---
 drivers/nvme/target/nvmet.h |  3 ++-
 include/linux/nvme.h        |  3 +++
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index f5d7cb9c943a..69491e8e52ba 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -205,7 +205,7 @@ static void nvmet_async_event_work(struct work_struct *work)
 	nvmet_async_events_process(ctrl);
 }
 
-void nvmet_add_async_event(struct nvmet_ctrl *ctrl, u8 event_type,
+static void nvmet_add_async_event_locked(struct nvmet_ctrl *ctrl, u8 event_type,
 		u8 event_info, u8 log_page)
 {
 	struct nvmet_async_event *aen;
@@ -218,13 +218,19 @@ void nvmet_add_async_event(struct nvmet_ctrl *ctrl, u8 event_type,
 	aen->event_info = event_info;
 	aen->log_page = log_page;
 
-	mutex_lock(&ctrl->lock);
 	list_add_tail(&aen->entry, &ctrl->async_events);
-	mutex_unlock(&ctrl->lock);
 
 	queue_work(nvmet_aen_wq, &ctrl->async_event_work);
 }
 
+void nvmet_add_async_event(struct nvmet_ctrl *ctrl, u8 event_type,
+		u8 event_info, u8 log_page)
+{
+	mutex_lock(&ctrl->lock);
+	nvmet_add_async_event_locked(ctrl, event_type, event_info, log_page);
+	mutex_unlock(&ctrl->lock);
+}
+
 static void nvmet_add_to_changed_ns_log(struct nvmet_ctrl *ctrl, __le32 nsid)
 {
 	u32 i;
@@ -1807,6 +1813,18 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
 }
 EXPORT_SYMBOL_GPL(nvmet_alloc_ctrl);
 
+static void nvmet_ctrl_notify_ccr(struct nvmet_ctrl *ctrl)
+{
+	lockdep_assert_held(&ctrl->lock);
+
+	if (nvmet_aen_bit_disabled(ctrl, NVME_AEN_BIT_CCR_COMPLETE))
+		return;
+
+	nvmet_add_async_event_locked(ctrl, NVME_AER_NOTICE,
+				     NVME_AER_NOTICE_CCR_COMPLETED,
+				     NVME_LOG_CCR);
+}
+
 static void nvmet_ctrl_complete_pending_ccr(struct nvmet_ctrl *ctrl)
 {
 	struct nvmet_subsys *subsys = ctrl->subsys;
@@ -1830,6 +1848,7 @@ static void nvmet_ctrl_complete_pending_ccr(struct nvmet_ctrl *ctrl)
 		list_for_each_entry(ccr, &sctrl->ccr_list, entry) {
 			if (ccr->ctrl == ctrl) {
 				ccr->ctrl = NULL;
+				nvmet_ctrl_notify_ccr(sctrl);
 				break;
 			}
 		}
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index 3c70ef13c9b4..88fa11aa0587 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -44,7 +44,8 @@
  * Supported optional AENs:
  */
 #define NVMET_AEN_CFG_OPTIONAL \
-	(NVME_AEN_CFG_NS_ATTR | NVME_AEN_CFG_ANA_CHANGE)
+	(NVME_AEN_CFG_NS_ATTR | NVME_AEN_CFG_ANA_CHANGE | \
+	 NVME_AEN_CFG_CCR_COMPLETE)
 #define NVMET_DISC_AEN_CFG_OPTIONAL \
 	(NVME_AEN_CFG_DISC_CHANGE)
 
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index 70dd0770e032..3757d11ffea3 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -871,12 +871,14 @@ enum {
 	NVME_AER_NOTICE_FW_ACT_STARTING = 0x01,
 	NVME_AER_NOTICE_ANA		= 0x03,
 	NVME_AER_NOTICE_DISC_CHANGED	= 0xf0,
+	NVME_AER_NOTICE_CCR_COMPLETED	= 0xf4,
 };
 
 enum {
 	NVME_AEN_BIT_NS_ATTR		= 8,
 	NVME_AEN_BIT_FW_ACT		= 9,
 	NVME_AEN_BIT_ANA_CHANGE		= 11,
+	NVME_AEN_BIT_CCR_COMPLETE	= 20,
 	NVME_AEN_BIT_DISC_CHANGE	= 31,
 };
 
@@ -884,6 +886,7 @@ enum {
 	NVME_AEN_CFG_NS_ATTR		= 1 << NVME_AEN_BIT_NS_ATTR,
 	NVME_AEN_CFG_FW_ACT		= 1 << NVME_AEN_BIT_FW_ACT,
 	NVME_AEN_CFG_ANA_CHANGE		= 1 << NVME_AEN_BIT_ANA_CHANGE,
+	NVME_AEN_CFG_CCR_COMPLETE	= 1 << NVME_AEN_BIT_CCR_COMPLETE,
 	NVME_AEN_CFG_DISC_CHANGE	= 1 << NVME_AEN_BIT_DISC_CHANGE,
 };
 
-- 
2.55.0

