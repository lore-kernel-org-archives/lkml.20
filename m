Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AAE51DDEA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755432; cv=none; b=IXkF0EWw4Khc/F0CqBJEIlquU0xOe8yZhsB3hhKcX0cAzZFTdN9iVrkgfnRcAqSer5/2mtA/IONAF+JzsfOlg0TAcrKTRxSBBMsXaWC7Tb+H6c+YH0I9JUj3cC/g2D8MPD5/GYMyRxoUW7/n2YgirLmPy/iPX/ztcdWtAv88P/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755432; c=relaxed/simple;
	bh=2stUjESmFaR5coRGRUUfSmg/ht71Le2TPTcOeb0WB+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NA2hHjSnchuzQdKwPymRF0TH2ieC5sS2G4MdcaCPjiv11PJfMkZEYC1Rj9k358AmCuowmzG5EwI/4KWIrKVA3aCuhDKypSXRFv1iiiuf/R0tG3iQIz4BOFvHxAqvDYWMMJVQRP5ufHlP8/ugcBdRRcdyHRpt4whEcHZDYWXjgEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=KkncAB1N; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="KkncAB1N"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso1193797a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755430; x=1790360230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oy2h80BFMwGiM7nqEwALNuYmImDNZDmz38YPaRdaUi0=;
        b=KkncAB1N4mqmEw0gleA6WDsMv1rBWGhnzOAH6WfRbrCS8VXlapCD3YOw6DWWIz40we
         QMJCfuOBx2ngUd/6so4n7SDSwQvAKGraGL+OMyZ6foSh95Tnp3iySJeW3DStlKhzxAM8
         qoTNl9wbOP6dcWeruHGULMPH2+FcMRC2os0CWuzQs8+dyIusVMxCo/NME3xhqW2jqhXk
         0m4y8Gt/8jbEssTPOAQHhcacZ7pcC4UmLDCCdA5QQV8uwH8mRwXCQPiXvKA3jcsYR/o1
         mSvRJjKgj61Bx7KorBBphZbZlyaKjiFsLSTk/Kc0bP9r2uNJqLOGYPm0lE762nnMgJMW
         RGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755430; x=1790360230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oy2h80BFMwGiM7nqEwALNuYmImDNZDmz38YPaRdaUi0=;
        b=RoIea/mDu2YPfVMmX+T2iI5MiCCmSdo2NVC7jhaSWYqV9oE6QuT1fMEE+5SVjiNaS5
         nzaOpRC09+Mchow3rNGM+iAlQGLqubbWKvdzgh0AJumNg6QR0hfzvfmroMBJpGE+7uF2
         x8y60r8MlyiHAkRHoA7WldWFtw2IXTT6zXPVfbGoo4ERFzScsg5KyOnmM0JQI68suWw4
         QNFsgVAX5fQuKP84ppaF0vW2Ds0wvRENUIsOOIucpZLL9vSV8BjGfPx0MATmwrJBh9G7
         2nxux4eYs1HOVuwRKhYm1SQNTcJJWJtdBcQXF2Q1/G+UW54vyc6jD757nERH8s98qMbW
         qJyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzk6UQzWgGvfpL4gpgjThtx9XY/+ocJwwDwDvfKDD6iqDLwE5J6FTo57JOR/vdCi5Wxqhng0nKnHyZf7Jo=@vger.kernel.org
X-Gm-Message-State: AFuF++lOzNDUy7xRTdwJIYDsvTIROiQApvejWDc1Y7koHKVt0nx2tDbR
	5EcOkUlCbjcjG3cnm5+Rdlp73Q5T/VtRVeuOhO0yq5wpbgpYXjdkWFx8Z3WrulBPvXQ=
X-Gm-Gg: AYBFou3ogDb5l9ZXGKhJpmKEz5guDEuB4sbQ7nU/MX3f9TZFxAcupVzYLwZaS+RpI+r
	au32sMXGSqTaYFOpBUhlsRHNQ45wJlxPKte0rxUD9iHe6NGJOdmp4aAnlSYXT6OhWxRZfZeqnHX
	pbNkOnh9+JWGcWgMaxa7KH6LmlskFP7Fpud4605cuLG7KwkMkQEN4ZWTlVqnO37PwuEb0BvInN7
	w6Cafg/R9fC7vS9fCXiqp4uvTd+aY6yICk5UGvPc4Th89MpK810+a3b0un3KQqXIIPOz2OtSFrX
	mieHyXYLlPoi5LcTrdpgObdbmDe22xuQP8ocpUJSSHxKFTV8xeuh/5YACkpy6wXw/w3qxIm2o/d
	HL4tXrIe4gSMkhD1J1hqFvFQYWK6PozHdb3m4I7Y5ZccVTG1ME5yxkAiiOtqbt0UuXWCEv1K+lM
	weLNosIzdZlUxdAO82UxbN3fbyhs5Q6FW090B3D3bu6fKsXocBv0t9xzc3MnhqcwC5I2eDiOCOR
	/lHug0zAPtk57roHCKGtg==
X-Received: by 2002:a17:90b:57e8:b0:39e:6c69:7774 with SMTP id 98e67ed59e1d1-39e6c697961mr1142954a91.29.1789755429684;
        Fri, 18 Sep 2026 11:17:09 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:09 -0700 (PDT)
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
Subject: [PATCH 09/18] nvme: Implement cross-controller reset completion
Date: Fri, 18 Sep 2026 11:14:09 -0700
Message-ID: <20260918181614.3947933-10-mkhalfella@purestorage.com>
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

An nvme source controller that issues CCR command expects to receive an
NVME_AER_NOTICE_CCR_COMPLETED when pending CCR succeeds or fails. Add
ctrl->ccr_work to read NVME_LOG_CCR logpage and wakeup threads waiting
on CCR completion.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/core.c | 50 +++++++++++++++++++++++++++++++++++++++-
 drivers/nvme/host/nvme.h |  1 +
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index c8e3129d84a8..5509b58b51db 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1959,7 +1959,8 @@ EXPORT_SYMBOL_GPL(nvme_set_queue_count);
 
 #define NVME_AEN_SUPPORTED \
 	(NVME_AEN_CFG_NS_ATTR | NVME_AEN_CFG_FW_ACT | \
-	 NVME_AEN_CFG_ANA_CHANGE | NVME_AEN_CFG_DISC_CHANGE)
+	 NVME_AEN_CFG_ANA_CHANGE | NVME_AEN_CFG_CCR_COMPLETE | \
+	 NVME_AEN_CFG_DISC_CHANGE)
 
 static void nvme_enable_aen(struct nvme_ctrl *ctrl)
 {
@@ -5023,6 +5024,48 @@ static void nvme_get_fw_slot_info(struct nvme_ctrl *ctrl)
 	kfree(log);
 }
 
+static void nvme_ccr_work(struct work_struct *work)
+{
+	struct nvme_ctrl *ctrl = container_of(work, struct nvme_ctrl, ccr_work);
+	struct nvme_ccr_entry *ccr;
+	struct nvme_ccr_log_entry *entry;
+	struct nvme_ccr_log *log;
+	int num_entries, ret, i;
+	unsigned long flags;
+
+	log = kmalloc_obj(*log);
+	if (!log)
+		return;
+
+	ret = nvme_get_log(ctrl, 0, NVME_LOG_CCR, 0x01,
+			   0x00, log, sizeof(*log), 0);
+	if (ret)
+		goto out;
+
+	spin_lock_irqsave(&ctrl->lock, flags);
+	num_entries = min(le16_to_cpu(log->ne), NVMF_CCR_PER_PAGE);
+	for (i = 0; i < num_entries; i++) {
+		entry = &log->entries[i];
+		if (entry->ccrs == NVME_CCR_STATUS_IN_PROGRESS)
+			continue;
+
+		list_for_each_entry(ccr, &ctrl->ccr_list, list) {
+			struct nvme_ctrl *ictrl = ccr->ictrl;
+
+			if (ictrl->cntlid != le16_to_cpu(entry->icid) ||
+			    ictrl->ciu != entry->ciu)
+				continue;
+
+			/* Complete matching entry */
+			ccr->ccrs = entry->ccrs;
+			complete(&ccr->complete);
+		}
+	}
+	spin_unlock_irqrestore(&ctrl->lock, flags);
+out:
+	kfree(log);
+}
+
 static void nvme_fw_act_work(struct work_struct *work)
 {
 	struct nvme_ctrl *ctrl = container_of(work,
@@ -5099,6 +5142,9 @@ static bool nvme_handle_aen_notice(struct nvme_ctrl *ctrl, u32 result)
 	case NVME_AER_NOTICE_DISC_CHANGED:
 		ctrl->aen_result = result;
 		break;
+	case NVME_AER_NOTICE_CCR_COMPLETED:
+		queue_work(nvme_wq, &ctrl->ccr_work);
+		break;
 	default:
 		dev_warn(ctrl->device, "async event result %08x\n", result);
 	}
@@ -5287,6 +5333,7 @@ void nvme_stop_ctrl(struct nvme_ctrl *ctrl)
 	nvme_stop_failfast_work(ctrl);
 	flush_work(&ctrl->async_event_work);
 	cancel_work_sync(&ctrl->fw_act_work);
+	cancel_work_sync(&ctrl->ccr_work);
 	if (ctrl->ops->stop_ctrl)
 		ctrl->ops->stop_ctrl(ctrl);
 }
@@ -5412,6 +5459,7 @@ int nvme_init_ctrl(struct nvme_ctrl *ctrl, struct device *dev,
 	ctrl->quirks = quirks;
 	ctrl->numa_node = NUMA_NO_NODE;
 	INIT_WORK(&ctrl->scan_work, nvme_scan_work);
+	INIT_WORK(&ctrl->ccr_work, nvme_ccr_work);
 	INIT_WORK(&ctrl->async_event_work, nvme_async_event_work);
 	INIT_WORK(&ctrl->fw_act_work, nvme_fw_act_work);
 	INIT_WORK(&ctrl->delete_work, nvme_delete_ctrl_work);
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 8da75a15ac04..7096f1e4f84e 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -431,6 +431,7 @@ struct nvme_ctrl {
 	struct nvme_effects_log *effects;
 	struct xarray cels;
 	struct work_struct scan_work;
+	struct work_struct ccr_work;
 	struct work_struct async_event_work;
 	struct delayed_work ka_work;
 	struct delayed_work failfast_work;
-- 
2.55.0

