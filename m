Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D083CA4A9
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929031; cv=none; b=UnMrfVeKQIWE320vPwzOtWnmTJzQdFJvfypnpm7EzNHDJRenPw5LiahJzWNaPJZHZPjX1jwvbGF4JEMII2+RzuMiW7JkjiByneKzilKUCqKV1t55N1/+qBJo6XaRKj861p/gsUKUD7DeAemp+aW8WxDopF+0dX7wkuyJc9nnoMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929031; c=relaxed/simple;
	bh=2stUjESmFaR5coRGRUUfSmg/ht71Le2TPTcOeb0WB+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIYLtsdw7FkYrtt4rPtPCzufL3SZQsV61wDYxUdgQQJ68p7X61+BmfJBVpBkhsDcsuwvWjaZIDP/v+/F8pC54YEExhiADkFg2S74pYoIqxgarvrAJv1e6J9ZbFlOjiC52rk0mdrZadQ6illy7OYpaV2aTPGzB8XQ1tKATn2RKU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=QJmWwwMS; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="QJmWwwMS"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so1565614a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929029; x=1790533829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oy2h80BFMwGiM7nqEwALNuYmImDNZDmz38YPaRdaUi0=;
        b=QJmWwwMSb6ZFGvdnWbu3Uw2W4UXwe1shEu+w/n7ZDY68IksTYBBIoX1GAa4Qr0dApd
         PR4SEnNhQuxcp22jjnEPZOQSMID14ZmCKgsIfAqJsDamC3RZzJhjy+TOg6UbtvC4yVAe
         X3O69foiD3FVTc9L8P443kA0kNFFWFKDaB9+tNueDAmiFfTy/bQLIyFWTyKRd4z/Iujx
         iBW283LjayGIV2P6h9TH9baFp6MVDclznbz86oHr5yROShBCj5oay2LnYKFziJaxUASo
         FiwdzwB353L4t4IM4N1AJW8jpdWPv3egC80HmMiKcDKEnvx4KYn0f7d8KWbulOcWVZ0J
         HEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929029; x=1790533829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oy2h80BFMwGiM7nqEwALNuYmImDNZDmz38YPaRdaUi0=;
        b=NLOOP5B1xq2AwJ81NAhAO4zCCvqbsgEu0LW4isybCMVoQq2XqjlSzHyYc1gzMK+RtL
         mZR7ZT8JkxbbNlvrGEsaO7vWINh/7RrmHBPph0aS25KIM63yNVCOVSxh24XbonSMZG0z
         CunsOiB//eR3WZPEpDTcO7sTjcc565ZNfnF1ZOfg8erwAQNG7dn6FivDCYV2V1/EelfM
         XHRmlArw/cid/b825pNPYY1+U7VwcyBN98MrWW7W7om98Ea/bhNdIuFyQ5LnLdE5KzJU
         JuJhwVNTzZQo7LFDI8361UhI2Bf5CibSCcDysP7t/d/ILQQbokYCLiwKM8eZghItIFOW
         vf9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxVgY2zS1Aj4Zph49DJt8Z7DQ5iHc/F0/02cL/teEwkAwQ9fCuYzgXnhVWLzkxYHgfd5kG8Sw+vdaf5JBM=@vger.kernel.org
X-Gm-Message-State: AFuF++nSksCukk35pblmTYuN3SmZa0Bv16xJDntcyceG0eIRYLO1r6M5
	VQLw4l82UfmKLL8A3PUZHv/1nXALsvGYFydz+eams0FTxIwSsHM++H+7T2J8r1u0V9E=
X-Gm-Gg: AYBFou39PVJLHLMitLiA97jRt4H4orqtJVwRuRXAyw1M+PmUFRKxnYb6dR3xipXvcIm
	NE9lza9aC7xz3rjbyA0gTNvdxqtYgnAA79043zlnNgf+ob3YzSdBlc1++lyidmFpWgSxhXLFDST
	5v7mV72xru8Gzd+xHxh7Nw+UrjoDadbVMHzyvdTxFtsk9SDJ+YDNsZnUjV+xnEtAy8K1KUhfU0K
	CWvqs6M6KisP5ZT9fBLCGXnsY5ndGVBHoGF0FW0dNOtV/ODDqh5JMrq9yOB3FvnChjctSPFUscB
	clpMEx7Wig/Fnbi7ntDIykDPEO+vDkT+t+t9X0VLNL79dka1G9VJxxs6ZhhTaULxOmKqQyBm3Qb
	Dx68sxXIP+jsnUFYOxhqvDzqVfk1iDLXO60aWdiPbY3MHGdY+5NNMpgzu1laDwPCbkQUryXR3Jn
	ym3mTN7dIqRPRPu2yr5XXA6ZfV53PME6t071XHeCqyOlv1/HiQf2zsooq4
X-Received: by 2002:a17:90b:57e8:b0:39e:4c7f:8b19 with SMTP id 98e67ed59e1d1-39e54d458b7mr14289543a91.30.1789929028929;
        Sun, 20 Sep 2026 11:30:28 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:28 -0700 (PDT)
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
Subject: [PATCH v6 09/18] nvme: Implement cross-controller reset completion
Date: Sun, 20 Sep 2026 11:28:07 -0700
Message-ID: <20260920182936.2317916-10-mkhalfella@purestorage.com>
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

