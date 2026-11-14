Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625560;
	b=OWhwAsQpPIkTBLBBOsAAbk2DkTQ4s7JPvNQKII2gn2LQ7IIYLwCUX5l9dAu1wPNvcUEu
	 mMCSVPVI2pErL4o16/+aybXG0CuGOMgk8H/vTiu1eb0U++qu7g7QRfXu46tW1YBIKebA/
	 TatZJhyqfNsLDBE96LIENuBJCoKFOBqX9z//CQKMIyx18hqOiqUK0nN48owZ0pavDsa4r
	 yeQJ4T3MzhzhUVq/p9iOmHdH7XepS0f4W+80uXWMSSn2tS2xG0aHdAadiFazk6+LS8Spx
	 k8v+mMZ5A2y99RG82GXE+f2pBaDCJuKxKk763MQ/xTXL9o5HPciyPs0j1nQOHM9yhWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wSUXvDC3JpdgMCqnkPNeUW4Ct+22Vkllsjv4sxasVtM=;
	b=USOj2V4Ii8GulPg7Jia+q2zLTycj9hsCkGLmHc469momfOoxrTsmva51BEr5OX9rV3iy
	 cBfkx3TSnrB4aUXmXQVdYr1tZyKpblj9y7RQR7mdbb9gx+nt5DoeK79TbEDnjke0VtZf4
	 Syd1Y2UX+/822Gb7F1D4jLbdgcxUgAlqRYmbWNnHGGzKolf08QADJKnjBILHy+ApjUbuo
	 B02hReGl0O5pjEcnKfJkq/SL1JerI7LeXvhMLcfC4lK3Xs43FTh1Yb8nSh3baFwWN3QGa
	 lNc2d4QES76QXSQ1YSNSUvB3WJnyaGV5xM4DRvnmB4szqcULdPVgIPBil1BDFqljlGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=bk26EAJb;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAFB60A382F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AAFB60A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=bk26EAJb
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b244fb7fffso1860737c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625559; x=1795230359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSUXvDC3JpdgMCqnkPNeUW4Ct+22Vkllsjv4sxasVtM=;
        b=bk26EAJbaASC7qQu8F5w/kbqLY8JMDxg5uxFyseosLbVkNuF4oahjRNS6lWpStT8tW
         NLMGXlLFZTxDWxU074emaI1w1DXmbyn2Yw8MpS6WxWtdG3ppqzQdAYZEjbTZARpZBuQ/
         n9gG7B/Kw0JRd8MTQKbXQr34MQFXdqpr8tFRfeSBymr9YYgvov8MSSZ7YVTp4NvgTELS
         rTUvJDSdKmqCiNe++tLoE1u8xjpChVtNLpRYrlhp9wOn1+oXpjOyLM7cR49U6XlPjlve
         4G5AdgyHYITVIdglEseOGD8jfsYqomojiyFnWFUiVi8Z7aE1menNbaToYw6Q0/0c+Hbs
         JICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625559; x=1795230359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSUXvDC3JpdgMCqnkPNeUW4Ct+22Vkllsjv4sxasVtM=;
        b=tdCOJaSSBAsftjXYAAQnkd4Ajncy+uoYI29SSFYy11IbEqgTzgy2rgbDhJMgosEN8R
         q4J4wD/jlTlJfv+RtZM8PYU6G7p1wlpvHzVvpCH0wMhi4RvEGUMBIl0mli9POcRSLwxY
         rARIJZD0j7zMw9TXsO464N+PthuD9nGA4ZPqXVriVGjYPhLivLop+CV3CwRTbdyWgmcp
         zl67u3dV9TWkHJM4Z2ZRn2dOP8ZFLmsFucZ8WsnjLwtYrBfEvD9edpdvvN0vZoVepSkg
         pctTtGQvXRP/f7ydVUvfZMQ7o1IF6xeQmw7wocF+KJ/vRwSZ9+/D6ouSMdwD2U0MaS8F
         kryQ==
X-Forwarded-Encrypted: i=1; AL+hErF7k23fQQjX7ZCGU/KfEnblOXSkAGeclCNeDHuPZTjjPTjvbsKGbdyJ77fU7TQSliR0XAOnBRnm98rIm1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dso3jIoOpCdhQac6Nko2puzkZfOr5aoXK55v1uxNWTNGzEvf5
	gHrRfRNzn2n+XUo3tvT5puYDMA7vi11kUmFsher7daFzAEWr3bXtVGjO47bKzEdLMt0=
X-Gm-Gg: AYBFou3c4MiVGCzK7y0C3akN72V9InCPNmvFdbaiye/FDh/FCskv4uCEz1exCruqNU5
	lMzAxk5fTt2bTaiWC9Icnwkz4QjjCvukSYbHgUtMmeObTCSwYVUjAs3ijBiupLQx3X/A+mkPoc3
	3o5tg8GueOLs3XcIkVHO7nXDgo38CwTFjA7k0rwHAWOBB9S0A0ihAmAYKi/H8AwtTquVu2Qp098
	T8Ri8mpY1HNH4rbgoDF7AQEJHGd08VNkpHxYGfncYtHyvdo7HVjKeo2j+BC4LBmI4C7UC4U0NlX
	wn2IV0mQ2bPE1T4pPgmf1P5+stTwukKzi2ycSQzi+mEwueJLUcxoyKarhwmYweWRCc+BCRD4rYb
	x/CPKjObqS/OPBiOW5NIpQxMpgmvNf+REkmsgwhmPNOqJoNPYyaCQjqpTgyj4YrBH9+SXh6Xc87
	F1bcEvkMpcTsDST5bxyIXoEKmT7EBg8wIDh2gnN2ocGl2yrfOdjpqzGMYEnKdyXUQIrCkw2gMIY
	fnEGRxCnO8srrZ0eJFGcBD0Z7AB7C5e5hpx/b2Rd+lQk+kGQ0jcFNIIdPnG7BMzTtwq+QRBUFYL
	zvZ+0Fnk7rbbw+RPO9qLu3iW6wi8020t0LjdLoITv3WxgtVgv6ft
X-Received: by 2002:a05:7022:ea8a:b0:1b5:1a7a:2ebc with SMTP id a92af1059eb24-1b51a7a2ff9mr432861c88.16.1794625558632;
        Fri, 13 Nov 2026 19:05:58 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:05:58 -0800 (PST)
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
Subject: [PATCH v7 09/17] nvme: Implement cross-controller reset completion
Date: Fri, 13 Nov 2026 19:04:23 -0800
Message-ID: <20261114030454.2836543-10-mkhalfella@purestorage.com>
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

An nvme source controller that issues CCR command expects to receive an
NVME_AER_NOTICE_CCR_COMPLETED when pending CCR succeeds or fails. Add
ctrl->ccr_work to read NVME_LOG_CCR logpage and wake up threads waiting
on CCR completion.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/core.c | 51 +++++++++++++++++++++++++++++++++++++++-
 drivers/nvme/host/nvme.h |  1 +
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 27c33dc49175..54b83092a9e8 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -1961,7 +1961,8 @@ EXPORT_SYMBOL_GPL(nvme_set_queue_count);
 
 #define NVME_AEN_SUPPORTED \
 	(NVME_AEN_CFG_NS_ATTR | NVME_AEN_CFG_FW_ACT | \
-	 NVME_AEN_CFG_ANA_CHANGE | NVME_AEN_CFG_DISC_CHANGE)
+	 NVME_AEN_CFG_ANA_CHANGE | NVME_AEN_CFG_CCR_COMPLETE | \
+	 NVME_AEN_CFG_DISC_CHANGE)
 
 static void nvme_enable_aen(struct nvme_ctrl *ctrl)
 {
@@ -5060,6 +5061,48 @@ static void nvme_get_fw_slot_info(struct nvme_ctrl *ctrl)
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
@@ -5136,6 +5179,9 @@ static bool nvme_handle_aen_notice(struct nvme_ctrl *ctrl, u32 result)
 	case NVME_AER_NOTICE_DISC_CHANGED:
 		ctrl->aen_result = result;
 		break;
+	case NVME_AER_NOTICE_CCR_COMPLETED:
+		queue_work(nvme_wq, &ctrl->ccr_work);
+		break;
 	default:
 		dev_warn(ctrl->device, "async event result %08x\n", result);
 	}
@@ -5324,6 +5370,7 @@ void nvme_stop_ctrl(struct nvme_ctrl *ctrl)
 	nvme_stop_failfast_work(ctrl);
 	flush_work(&ctrl->async_event_work);
 	cancel_work_sync(&ctrl->fw_act_work);
+	cancel_work_sync(&ctrl->ccr_work);
 	if (ctrl->ops->stop_ctrl)
 		ctrl->ops->stop_ctrl(ctrl);
 }
@@ -5362,6 +5409,7 @@ EXPORT_SYMBOL_GPL(nvme_start_ctrl);
 
 void nvme_uninit_ctrl(struct nvme_ctrl *ctrl)
 {
+	cancel_work_sync(&ctrl->ccr_work);
 	nvme_stop_keep_alive(ctrl);
 	nvme_hwmon_exit(ctrl);
 	nvme_fault_inject_fini(&ctrl->fault_inject);
@@ -5434,6 +5482,7 @@ int nvme_init_ctrl(struct nvme_ctrl *ctrl, struct device *dev,
 	ctrl->quirks = quirks;
 	ctrl->numa_node = NUMA_NO_NODE;
 	INIT_WORK(&ctrl->scan_work, nvme_scan_work);
+	INIT_WORK(&ctrl->ccr_work, nvme_ccr_work);
 	INIT_WORK(&ctrl->async_event_work, nvme_async_event_work);
 	INIT_WORK(&ctrl->fw_act_work, nvme_fw_act_work);
 	INIT_WORK(&ctrl->delete_work, nvme_delete_ctrl_work);
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 261955538efe..884541644240 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -438,6 +438,7 @@ struct nvme_ctrl {
 	struct nvme_id_power_state psd[32];
 	struct nvme_effects_log *effects;
 	struct work_struct scan_work;
+	struct work_struct ccr_work;
 	struct work_struct async_event_work;
 	struct delayed_work ka_work;
 	struct delayed_work failfast_work;
-- 
2.56.0

