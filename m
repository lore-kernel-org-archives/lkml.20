Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625559;
	b=Xys688qecNM7b7dfPxMO/RhFiuCNI4nxOAzqnjX2Y8qZp9+l7QTDxsK+9edzSIuPSXxE
	 FJk1scLdArVmhGhKpPVnJ/xlSuq78X1cH9vBAeGLrv4fq2OFuN0xRPQmZEvHoMaSZ0GL+
	 3BGXdtNVWbHmlvB2IVdarae4/QcYH9YtRX3C08UJx78QRwg0RCPEZfHLvqomRPiaZu9OO
	 CwKdptOWpmreigStoJBSuo0dJ+i5G8tw73fjJeToxxxoJIGX9dwp/5fb84NKQoy478Xwr
	 tzeDhparoeNS1kjOiN/bGJuf6bfFdhwlvJ45r6W7ibCplpNfq0TexIinINzvRAm/d3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7LHt1YY/w84/xvL9CnbL7Z5Lkjghg3PipRVormCwSLk=;
	b=TEy8s8vCL6L29iK/w+dyQVg9DFKHGpu2NJXZfoA2lOqCw0DK/3XmULx04iXnWgEbq4CW
	 3flguetnBiPcP1E4IgXS1Eicq7F98bEYqWPICgG+sDKjQzMaWLit7MT4KP9hhh7kmBBW7
	 BZZNwTwsKLgUg9vOpvv1ksd5VQtfYkw4xCabdVg5cYNdx5ZTEqbceA0ID6zwW1OyGbbtL
	 yt3yNCgW26OHHC1BJFlJTtAsbmI8Pxw5bLkjrnLWHHCZYkLQVT7HMyTnDPBtlZ2xT1MPB
	 no63tO1XhvnicdxakvEv0EAqBvh7bIO7QajMN5rQr7U29b6hB8/wHSLyWyFBicbtcHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=FgZpRdm6;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DA8606A8A7
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2DA8606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=FgZpRdm6
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15dd124bbe7so979429c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625558; x=1795230358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LHt1YY/w84/xvL9CnbL7Z5Lkjghg3PipRVormCwSLk=;
        b=FgZpRdm6dSnUpHhgk6HveTrxeGRgg4+V/ZC/NjerIn2HBZyXnGBMQhrph4hp8ZSc34
         O9Y/W6YII4ObK1AFbK6ac90iTjFsXBhaNahFb1NruFe+I5dMOVAdgrHpP3gv2ygbzlPK
         hjJV2SS8o+UZTFCK9HOsH9PEDKqTgjFC0/b64VWbKV/JOJbnyfsNXaMSUdR1N9GP4CRQ
         43G4MfsJb/PS498wj92bAj3V00ADOmnsccakpmLHyt1xc//iAIkau/CzMAcVFe8iKViL
         Uijo8WiDznej1BfoiCGSL1bd3FTUyQDSpl8NDQ0xAtpua6XNBe356OZAqOqrQIGcaILX
         qS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625558; x=1795230358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7LHt1YY/w84/xvL9CnbL7Z5Lkjghg3PipRVormCwSLk=;
        b=wmQt8drteN0o5Qt3x448XToLtnUsVogA8fBRWiepGh78rLL7WkLiJVm3/w8Ngl3y3k
         RyPL1AhSmFhHDOtj36y9+8LMbK2MuKbKtmoFX7XGSJ8wav+oaUlKGyQeRjj+NlfUYoZs
         cYwSszN6NsR/e5snGotVs6v90P+dBa0/duzAcuFpGbTDToGgBKzPE2eAbRCh5DTJ+HXN
         Ab0f7hz4GEqW+YeUKnWY1ex8GFw1ghl6x2EsZPCxCX4bkOscqQ7sMGx/qOXKhNS9eE4Z
         IQo7eBItJ8va/BtG+J7wcaY1msuUIQPi6TSkpsKyjNt0pdnD11yWMonSTVA+WkCCrcy1
         a19A==
X-Forwarded-Encrypted: i=1; AL+hErGJlUUDSKUh5iJnPF4mSiEDGzyYEt4HN/Qhqdrr+0vG/QFSPvA1bJntqMdsr8hHkwxFc09jnFCCyV86IdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YpxvEBul1x6Tk4ALT9CYWyQlMYi3YWeyCHpjWIGPGsQ9OPZCp
	57ZJDQLbZVez1noLCakS79CL+yGetQO/1PRWDTfGIBepXnM0H2oJ7d9NFbzgIrR21mk=
X-Gm-Gg: AYBFou3bUBtnd9pEoJBjvC35SD4CExSnW0C8ZRzsEVm09HSCFMCW3LIARKGECfI+SVY
	KbMdMiETo3DaU9m2jtZuAV/WlMrZ49CMLoNi+BUgMPKQGzyjVC72kDTKBwZuAin4epfN4AG4ca2
	bvbJ/HgohJAoTdXRSp95GrgHwO6py7CoK4BfQefkeY7CkflKskpkWRkltLwNZbOXLSlqsLpbv3P
	ylw/MLDEkYq6+SSFHnn6lLLsUVfSP3k8dT3te/lkCS7u6+NgYhVKA+rE1sNAL49f6VBJHxe+o4W
	xYv/edrmOCl7jWRNmvIpXo8dYW7y1jy6tu+50kI56Jn+kx6v8/usu2kJWkhMqOQ5tpin/C08vq6
	0J7wczlSW1An/8FESkLOG6F3IS5C+KwJWyi/0tjizD85c876IMAuPpQzgZU+JtLyaWpRtu63vWV
	4CLwDadRBTgR9Jdr1OkHQtJcneBhKWEwYe0tOyMyuu4pRpVgiyQyd36Oq1hN2PSAyf0BFBe5ZBk
	amYBVgCZZhq9G7Vjehk3cE8bCzBHocCkBYUDJIqzn49FYjFaVCPYKgMf1ZTzPsKtA3OvjChquhl
	SLY0ZRFP6JDKeOgzEROQdogE9N5tbcQqROhTQdAI7JYiDM5mPWbf
X-Received: by 2002:a05:701b:4648:b0:19b:1202:77f8 with SMTP id a92af1059eb24-1b503192303mr4228556c88.32.1794625557274;
        Fri, 13 Nov 2026 19:05:57 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:05:56 -0800 (PST)
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
Subject: [PATCH v7 08/17] nvme: Implement cross-controller reset recovery
Date: Fri, 13 Nov 2026 19:04:22 -0800
Message-ID: <20261114030454.2836543-9-mkhalfella@purestorage.com>
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

A host that has more than one path connecting to an nvme subsystem
typically has an nvme controller associated with every path. This is
mostly applicable to nvmeof. If one path goes down, inflight IOs on that
path should not be retried immediately on another path because this
could lead to data corruption as described in TP4129. TP8028 defines
cross-controller reset mechanism that can be used by host to terminate
IOs on the failed path using one of the remaining healthy paths. Only
after IOs are terminated, or long enough time passes as defined by
TP4129, inflight IOs should be retried on another path. Implement core
cross-controller reset shared logic to be used by the transports.

nvme_fence_ctrl() picks a LIVE controller in the same subsystem that
has CCR capacity left, sends CCR for the impacted controller and waits
for the completion AEN. If CCR fails, it tries the next controller
until the fence timeout expires. It returns 0 on success and the time
left otherwise, which the caller can spend on time-based recovery.

Add nvme_fence_timeout_ms(), which bounds the time spent fencing a
controller. It is derived from the keep-alive timeout: 2 * KATO, or
3 * KATO if traffic based keep-alive is enabled.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
---
 drivers/nvme/host/constants.c |   1 +
 drivers/nvme/host/core.c      | 152 ++++++++++++++++++++++++++++++++++
 drivers/nvme/host/nvme.h      |  17 ++++
 3 files changed, 170 insertions(+)

diff --git a/drivers/nvme/host/constants.c b/drivers/nvme/host/constants.c
index dc90df9e13a2..f679efd5110e 100644
--- a/drivers/nvme/host/constants.c
+++ b/drivers/nvme/host/constants.c
@@ -46,6 +46,7 @@ static const char * const nvme_admin_ops[] = {
 	[nvme_admin_virtual_mgmt] = "Virtual Management",
 	[nvme_admin_nvme_mi_send] = "NVMe Send MI",
 	[nvme_admin_nvme_mi_recv] = "NVMe Receive MI",
+	[nvme_admin_cross_ctrl_reset] = "Cross Controller Reset",
 	[nvme_admin_dbbuf] = "Doorbell Buffer Config",
 	[nvme_admin_format_nvm] = "Format NVM",
 	[nvme_admin_security_send] = "Security Send",
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 4be3ce2e72a7..27c33dc49175 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -576,6 +576,157 @@ void nvme_cancel_admin_tagset(struct nvme_ctrl *ctrl)
 }
 EXPORT_SYMBOL_GPL(nvme_cancel_admin_tagset);
 
+static struct nvme_ctrl *nvme_find_ctrl_ccr(struct nvme_ctrl *ictrl,
+					    u32 min_cntlid)
+{
+	struct nvme_subsystem *subsys = ictrl->subsys;
+	struct nvme_ctrl *ctrl, *sctrl = NULL;
+	unsigned long flags;
+	int ccr_used;
+
+	mutex_lock(&nvme_subsystems_lock);
+	list_for_each_entry(ctrl, &subsys->ctrls, subsys_entry) {
+		if (ctrl->cntlid < min_cntlid)
+			continue;
+
+		spin_lock_irqsave(&ctrl->lock, flags);
+		if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE) {
+			spin_unlock_irqrestore(&ctrl->lock, flags);
+			continue;
+		}
+
+		ccr_used = atomic_inc_return(&ctrl->ccr_used);
+		if (ccr_used > ctrl->ccrl) {
+			atomic_dec(&ctrl->ccr_used);
+			spin_unlock_irqrestore(&ctrl->lock, flags);
+			continue;
+		}
+
+		/*
+		 * We got a good candidate source controller that is locked and
+		 * LIVE. However, no guarantee ctrl will not be deleted after
+		 * ctrl->lock is released. Get a ref of both ctrl and admin_q
+		 * so they do not disappear until we are done with them.
+		 */
+		WARN_ON_ONCE(!blk_get_queue(ctrl->admin_q));
+		nvme_get_ctrl(ctrl);
+		spin_unlock_irqrestore(&ctrl->lock, flags);
+		sctrl = ctrl;
+		break;
+	}
+	mutex_unlock(&nvme_subsystems_lock);
+	return sctrl;
+}
+
+static void nvme_put_ctrl_ccr(struct nvme_ctrl *sctrl)
+{
+	atomic_dec(&sctrl->ccr_used);
+	blk_put_queue(sctrl->admin_q);
+	nvme_put_ctrl(sctrl);
+}
+
+static int nvme_issue_wait_ccr(struct nvme_ctrl *sctrl, struct nvme_ctrl *ictrl,
+			       unsigned long deadline)
+{
+	struct nvme_ccr_entry ccr = { };
+	union nvme_result res = { 0 };
+	struct nvme_command c = { };
+	unsigned long flags, now, tmo = 0;
+	bool completed = false;
+	int ret = 0;
+	u32 result;
+
+	init_completion(&ccr.complete);
+	ccr.ictrl = ictrl;
+
+	spin_lock_irqsave(&sctrl->lock, flags);
+	list_add_tail(&ccr.list, &sctrl->ccr_list);
+	spin_unlock_irqrestore(&sctrl->lock, flags);
+
+	c.ccr.opcode = nvme_admin_cross_ctrl_reset;
+	c.ccr.ciu = ictrl->ciu;
+	c.ccr.icid = cpu_to_le16(ictrl->cntlid);
+	c.ccr.cirn = cpu_to_le64(ictrl->cirn);
+	ret = __nvme_submit_sync_cmd(sctrl->admin_q, &c, &res,
+				     NULL, 0, NVME_QID_ANY, 0);
+	if (ret) {
+		ret = -EIO;
+		goto out;
+	}
+
+	result = le32_to_cpu(res.u32);
+	if (result & 0x01) /* Immediate Reset Successful */
+		goto out;
+
+	now = jiffies;
+	if (time_before(now, deadline))
+		tmo = min_t(unsigned long,
+			    secs_to_jiffies(ictrl->kato), deadline - now);
+
+	if (!wait_for_completion_timeout(&ccr.complete, tmo)) {
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	completed = true;
+
+out:
+	spin_lock_irqsave(&sctrl->lock, flags);
+	list_del(&ccr.list);
+	spin_unlock_irqrestore(&sctrl->lock, flags);
+	if (completed) {
+		if (ccr.ccrs == NVME_CCR_STATUS_SUCCESS)
+			return 0;
+		return -EREMOTEIO;
+	}
+	return ret;
+}
+
+unsigned long nvme_fence_ctrl(struct nvme_ctrl *ictrl)
+{
+	unsigned long now, deadline, timeout;
+	struct nvme_ctrl *sctrl;
+	u32 min_cntlid = 0;
+	int ret;
+
+	timeout = nvme_fence_timeout_ms(ictrl);
+	dev_info(ictrl->device, "attempting CCR, timeout %lums\n", timeout);
+
+	now = jiffies;
+	deadline = jiffies + msecs_to_jiffies(timeout);
+	while (time_before(now, deadline)) {
+		sctrl = nvme_find_ctrl_ccr(ictrl, min_cntlid);
+		if (!sctrl) {
+			dev_dbg(ictrl->device,
+				"failed to find source controller\n");
+			return deadline - now;
+		}
+
+		ret = nvme_issue_wait_ccr(sctrl, ictrl, deadline);
+		if (!ret) {
+			dev_info(ictrl->device, "CCR succeeded using %s\n",
+				 dev_name(sctrl->device));
+			nvme_put_ctrl_ccr(sctrl);
+			return 0;
+		}
+
+		/*
+		 * CCR command or CCR operation failed on this path.
+		 * Try another path as long as we have time.
+		 */
+		dev_err(ictrl->device, "CCR failed using %s, ret = %d\n",
+			dev_name(sctrl->device), ret);
+		min_cntlid = sctrl->cntlid + 1;
+		nvme_put_ctrl_ccr(sctrl);
+		now = jiffies;
+	}
+
+	/* Fencing timed out call it done */
+	dev_info(ictrl->device, "fencing timeout\n");
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nvme_fence_ctrl);
+
 bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
 		enum nvme_ctrl_state new_state)
 {
@@ -5277,6 +5428,7 @@ int nvme_init_ctrl(struct nvme_ctrl *ctrl, struct device *dev,
 
 	mutex_init(&ctrl->scan_lock);
 	INIT_LIST_HEAD(&ctrl->namespaces);
+	INIT_LIST_HEAD(&ctrl->ccr_list);
 	ctrl->dev = dev;
 	ctrl->ops = ops;
 	ctrl->quirks = quirks;
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index cb9fca419935..261955538efe 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -349,6 +349,13 @@ enum nvme_ctrl_flags {
 	NVME_CTRL_FROZEN		= 6,
 };
 
+struct nvme_ccr_entry {
+	struct list_head list;
+	struct completion complete;
+	struct nvme_ctrl *ictrl;
+	u8 ccrs;
+};
+
 struct nvme_ctrl {
 	bool comp_seen;
 	bool identified;
@@ -366,6 +373,7 @@ struct nvme_ctrl {
 	struct blk_mq_tag_set *tagset;
 	struct blk_mq_tag_set *admin_tagset;
 	struct list_head namespaces;
+	struct list_head ccr_list;
 	struct mutex namespaces_lock;
 	struct srcu_struct srcu;
 	struct device ctrl_device;
@@ -410,6 +418,7 @@ struct nvme_ctrl {
 	u16 sqsize;
 	u32 max_namespaces;
 	atomic_t abort_limit;
+	atomic_t ccr_used;
 	u8 ccrl;
 	u8 vwc;
 	u32 vs;
@@ -912,6 +921,7 @@ blk_status_t nvme_host_path_error(struct request *req);
 bool nvme_cancel_request(struct request *req, void *data);
 void nvme_cancel_tagset(struct nvme_ctrl *ctrl);
 void nvme_cancel_admin_tagset(struct nvme_ctrl *ctrl);
+unsigned long nvme_fence_ctrl(struct nvme_ctrl *ctrl);
 bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
 		enum nvme_ctrl_state new_state);
 int nvme_disable_ctrl(struct nvme_ctrl *ctrl, bool shutdown);
@@ -1359,4 +1369,11 @@ static inline bool nvme_multi_css(struct nvme_ctrl *ctrl)
 	return (ctrl->ctrl_config & NVME_CC_CSS_MASK) == NVME_CC_CSS_CSI;
 }
 
+static inline unsigned long nvme_fence_timeout_ms(struct nvme_ctrl *ctrl)
+{
+	if (ctrl->ctratt & NVME_CTRL_ATTR_TBKAS)
+		return 3 * ctrl->kato * 1000;
+	return 2 * ctrl->kato * 1000;
+}
+
 #endif /* _NVME_H */
-- 
2.56.0

