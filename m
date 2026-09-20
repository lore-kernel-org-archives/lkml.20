Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE94471425
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929025; cv=none; b=ZSjkHnY0BmpMq0HPwngAs+EAEADqREIN9P5rvhskIRbsHEBaSX/N9/oH4bhVl29DRM0uShO2CSYkzFCpiiX76fTcwZAcDsf2SJR+ruOzIsZvL82RJAh7iiypE8FmKb49xvsKxu352SUebuZFXFH2r/C7zpg2t7o3erXu0FU8tSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929025; c=relaxed/simple;
	bh=RIVoOlmqZFMJOUfhjvyFuQR9GESlJzJLW8eoZZQuGKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=byPqCjdl9jWX+aXkAoeW8mx8QOVVN89zEhcWCQhY0g3VklzY8rutvFBEhe9ee+DvhEG2iI+qytHThjZuIaYQfUjDCGZENelc3ywJucfUciMpSVywPIYQxcD9ua6mAa1nAmXp2rEG2T4GuvyjxKisqgoZdi3Q8KNlCPYDHKvJbWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=YQ+NdpuU; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="YQ+NdpuU"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so1295322a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929023; x=1790533823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcg806D5vzEHCLipGmbi/V7P1l0j+1hngUNt1RnsJGI=;
        b=YQ+NdpuUIk9/7P7qEFmdPsi6r/+oQ/iCWv6ABPfKfIoqFVHvSTHF5u/Ssh1+1rWgJD
         v7ieEUqr5Mrw5wox55CB0ESBWZHGyJ6XbuWg7/zAsHZ+4p/1ay/AHf5l9ZXsnWbJnv9q
         neGGx8YAxbg05FPCAa8i/oPzU/vqe4QQA5qg8sTr1vcej691U/LaFQHehFMZclsIU7sV
         mp2fg9ORgDEGvxg1H5jvbNfzn2KPUIZJMOZKGxb3WMJGeS3NNLKj4gAQw160XlM5bpk3
         WkbO+FnQed0qxuHD2LvIqUcsVnh2l+5Wm6W74H4ZkMDOjpD0x2Tz4A4VCuFTWIWjoYGF
         rfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929023; x=1790533823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcg806D5vzEHCLipGmbi/V7P1l0j+1hngUNt1RnsJGI=;
        b=DVNMQFcQ5ta0lX96a1EtJtsiVRnbBzUFjtB0i+eQaj0Nfulqy27wnd4Q5WQ2ZMPkjZ
         sc9qJwTS6chzqr8EhcjP6djbWiGeqDTPy7Xfjj11dI8XITpqRdgVZLmiLEBIH7CmRq/S
         JA/ybEXyRzd8et2gBmzSu+G+KyVaDy0g9OfT6tvItWBn8AODqUIp7wDay8VQQg4j3XNm
         DOlEsGR0blTbVkkA3a8Fk2IGaFfT+lEYMBWA6hVrjIYAbFi+eIEuU+89OB751KWUwSVs
         E0Qh+0S8ySWHIBni9RfygpcnbSDlAdEp4XROmTGcinWuUg93OOp3y/tEPY5KUxWvdWd+
         l5Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxaBIXENjzYlNCgpP0GAL1d2CWYPQ147QnzSO88XEBNNGWnufl95Xla8PqXIcn2rsbvoIvuNYqwezG6hgk=@vger.kernel.org
X-Gm-Message-State: AFuF++l27QBgQISWoRz4fLwn1mfKv/v79+37Z4wpAjd6Cwv4vmzrQOBN
	u1ZVzIAZftT+6PA4O0X7fz7uSAdyiHnSESenbkdaP4/GA8/TG5xatJauRcypo1+j4Ac=
X-Gm-Gg: AYBFou1MKJPE4xJCVqJ5trGEN9QxXtAIXPMPMP6/rNUKy46wQvDoKYhCyAXh5jyGMeq
	rFxwu5NcUb+J8PnRCNgThi2UAx9w7fxcbKkJl6XXyGUQ6mGiNGTVzGFHvWuhDKXihIQyywwEoEL
	2auIIMOT8baIioF3D8z8coJyg3XaNymrqWC3xEDlZsWNwha6gNApCERk9gDi7DueBmLhHjKqzHt
	zaceTFNt/6GbTn2XFw9QmpDCewkt03jE3o8rEqSOBpRbaMXtNeQBTSESUre8seIs/oPUZmeOgLg
	kUXgr2jyu6kUUvPWQrNAn13taarmeo9EAjvETi2iROIKO7BAaf9bNHpWjGp4ofcHeO+Vd2IOYJS
	SSeoHZBsArysv4Kixyu+kF9OPWvRfBKV8t6yRE08EdEJNPx9YvNd+ug6ZIRrMpPQbt7umOyW/A6
	q0BAbAo1Cx5ZnZdIV+e9g9H3VlMfyCOMK7SEjtLesy7uTAHk2xpjFOu5gz
X-Received: by 2002:a17:90b:1e42:b0:3a0:345a:3620 with SMTP id 98e67ed59e1d1-3a0345a48a4mr3412173a91.45.1789929022908;
        Sun, 20 Sep 2026 11:30:22 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:22 -0700 (PDT)
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
Subject: [PATCH v6 05/18] nvmet: Send an AEN on CCR completion
Date: Sun, 20 Sep 2026 11:28:03 -0700
Message-ID: <20260920182936.2317916-6-mkhalfella@purestorage.com>
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

