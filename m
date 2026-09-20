Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75212471425
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929047; cv=none; b=jw7jl/Mj7Tj/YBRXjW2ukrodU3dIwQqjZqOaWc5Xl/9SiE/gz+V85h/gf1AFr7LCD1Qq7WTpmjkoAgBjRtrW680Q4f5sw3VoTf5JoHelKFNvyzqR0RzWxu7ZMSUMFP8nQpvaHV/tvtfWKxt/ye/IGaJVer6ij9HQsQ3fFPdCkBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929047; c=relaxed/simple;
	bh=N3TrYKj63SGboRNWu/OysoGDNr/HzP5uaLhsWM3pZ+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=chTpW6q6eUmacC4zCmjEzMVuENH79lGzfr/w+fLT8dc8da2tCJ+dTuk2PSSAfwvGinWIIkSdMY/SwJyFtWeaX8bKiRcg/BMQ80BDuNxfi1mzUmXtJViuoTGhNmPlGy/9Wde3uRWXHmXPY62H+X6/H2lh3KHBsUR+tLPLfubsCoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=WV8jon/P; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="WV8jon/P"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2dd68a16955so30478315ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929043; x=1790533843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpEVTaDIEqTTyPgj4k8QhiOl8bbLm2x6tGVGdtqRrPM=;
        b=WV8jon/Py08qUgb3xmYF8N3oBfK7kRaKqasq9Kf8ArWHGiZiLsAuW03ubEalJ2aUHq
         LXCsV5AQL3MlKDc1e9qREETdLw3XA+WTyE6watNbdauxRQf7m6AUkmAmHZBQBPVBS3Xu
         8Wb2tyTwRdkjJkdt/8MotsJ8nqpuj5enQ/2uNGrG/rwdRtkpjkYBY8HQq/HAHfIX4Z1B
         YE1hN2r2WNH8Ym4vQz3sYhdx5MNHmeP5UCba4lK2TFZx0YfF/a/kKNjxTNvRL1P/cWBk
         /ULFAV/CHyFJb/8O3CiV92AyI+sYN3n15LvnjsJzYbzxs4NYpUaeQ45doFdD4OY+7AIt
         6Ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929043; x=1790533843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xpEVTaDIEqTTyPgj4k8QhiOl8bbLm2x6tGVGdtqRrPM=;
        b=XMCGNB5BQ/tJgx949BfKUMCLa8Z5RpBsx5XoSYFoAOdE3L8vW8MNr5J9CZndAF9nzf
         YFE2W0DnP/2Hv4rpLAUHku9IaGuUayDcQ1gNPJP1dAJ7ANHkkbUkEpbjMK9KmxWfepMf
         t2cKCEbx4czy5G3MR9or74Vn+VPGDDzsc7Er6xH7RKyPVGYxhQLNvm/fPja+thnUOlJM
         3k4xRBe7cFUIfhVLUP8EbjYd83Mk1xro1EkzOoej7Z30BPg5q+JQF7VunuHLGSvmrRnq
         +L/BszQvOgpGumtaIRWdmYoheIGEajRsgaKQZa03hVCzJWdRaWJvAgPA0S8Fltc+Azir
         iKWw==
X-Forwarded-Encrypted: i=1; AKwUvByWycuOID2d+vefdjRQ2JBviZEx1SipZvieTkkrhY48K36a2Y+QVdjhuaSozEMn9fc17kRR0dHj5iFPtLE=@vger.kernel.org
X-Gm-Message-State: AFuF++mqtbU3I9cVi7O84NYo2rHlQ176388i/L61PuJIbw45ZyGYpqt7
	C1qyjusS0AnImKgvRMEvabuRdpc678LSiZbvcdtll7WngLji9HbK2twRZhbSmYmfgU4=
X-Gm-Gg: AYBFou2qtbBau8k8fu7VhS5AWuMLDMAxSo7uVhPhYSEPM9SlQ6Gs1E9iFDvS7NehZ4R
	li4VqzhDBJT/4zOVGXZGXk7uGkZrOL3lRrCofP7JlfBuDZgBvq0rDaLcS35lEAyD8/7ZkGfkbG3
	QdOB7xlm/KK2NcV+RFpP6YCJIER/vzbI0tGrJ0pJSW8+oD92QodGFcMLAVtCsbb3+5HDKwxnor7
	JZzNj5iVn5+VoeyVotNYbh+1N9Yt6S625OLMrrkmheoSZp1iMIs3kOk9INarvDCaJ3Z5SPu4fq8
	a+LEAA1T8HVYAjMhFhtJMGCCS/Yq1nMNQ4AQbafkRhNLEmmja4aXqHMO4bRW0lwRA4GF2+mN1hv
	4R8wKCKOVmrbQr1jE0h2zAuNp44yxqYlxPE0e2UDr2gBMLuHfV+0RQ59k9TZimaZxSQVl9Zh6Ey
	OV5GmEy7UKOA7pfWod7QTtEGbFO72lw9LPiunH2CwkwXk5awSGdqRY1g2l
X-Received: by 2002:a17:90b:5403:b0:39f:6c3d:d4ed with SMTP id 98e67ed59e1d1-39f6c3dd7eemr4747809a91.30.1789929042496;
        Sun, 20 Sep 2026 11:30:42 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:42 -0700 (PDT)
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
Subject: [PATCH v6 17/18] nvme: Add support for CQT to nvme host
Date: Sun, 20 Sep 2026 11:28:15 -0700
Message-ID: <20260920182936.2317916-18-mkhalfella@purestorage.com>
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

TP4129 KATO Corrections and Clarifications defined CQT (Command Quiesce
Time) which is used along with KATO (Keep Alive Timeout) to set an upper
limit for attempting Cross-Controller Recovery. Add ctrl->cqt, read its
value from controller identify response, expose it via sysfs, and have
nvme_fence_timeout_ms() account for it.

Use CQT to drive time-based recovery in fc, rdma, and tcp transports.
Add a fenced_work delayed work to each transport controller. If CCR
fails, fencing_work switches to error recovery immediately if CQT is not
supported. Otherwise it schedules fenced_work after the remaining fence
timeout, which also switches to error recovery when scheduled.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/core.c  |  1 +
 drivers/nvme/host/fc.c    | 33 +++++++++++++++++++++++++++++++--
 drivers/nvme/host/nvme.h  |  5 +++--
 drivers/nvme/host/rdma.c  | 32 ++++++++++++++++++++++++++++++--
 drivers/nvme/host/sysfs.c |  2 ++
 drivers/nvme/host/tcp.c   | 32 ++++++++++++++++++++++++++++++--
 6 files changed, 97 insertions(+), 8 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 5509b58b51db..dc44e3af5f14 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3844,6 +3844,7 @@ static int nvme_init_identify(struct nvme_ctrl *ctrl)
 	ctrl->ciu = id->ciu;
 	ctrl->cirn = le64_to_cpu(id->cirn);
 	ctrl->ccrl = id->ccrl;
+	ctrl->cqt = le16_to_cpu(id->cqt);
 
 	ctrl->oacs = le16_to_cpu(id->oacs);
 	ctrl->oncs = le16_to_cpu(id->oncs);
diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index a6e0fa2dc341..3db111accd0c 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -167,6 +167,7 @@ struct nvme_fc_ctrl {
 	struct blk_mq_tag_set	tag_set;
 
 	struct work_struct	fencing_work;
+	struct delayed_work	fenced_work;
 	struct work_struct	ioerr_work;
 	struct delayed_work	connect_work;
 
@@ -1882,6 +1883,19 @@ __nvme_fc_fcpop_chk_teardowns(struct nvme_fc_ctrl *ctrl,
 	return ret;
 }
 
+static void nvme_fc_fenced_work(struct work_struct *work)
+{
+	struct nvme_fc_ctrl *fc_ctrl = container_of(to_delayed_work(work),
+					struct nvme_fc_ctrl, fenced_work);
+	struct nvme_ctrl *ctrl = &fc_ctrl->ctrl;
+
+	dev_info(ctrl->device, "Time-based recovery finished\n");
+	nvme_fc_flush_held_requests(fc_ctrl);
+	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
+		queue_work(nvme_reset_wq, &fc_ctrl->ioerr_work);
+}
+
 static void nvme_fc_fencing_work(struct work_struct *work)
 {
 	struct nvme_fc_ctrl *fc_ctrl =
@@ -1899,9 +1913,22 @@ static void nvme_fc_fencing_work(struct work_struct *work)
 		__nvme_fc_teardown_association(fc_ctrl);
 
 	rem = nvme_fence_ctrl(ctrl);
-	if (rem)
-		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
+	if (!rem)
+		goto done;
 
+	if (!ctrl->cqt) {
+		dev_info(ctrl->device,
+			 "CCR failed, CQT not supported, skip time-based recovery\n");
+		goto done;
+	}
+
+	dev_info(ctrl->device,
+		 "CCR failed, switch to time-based recovery, timeout = %ums\n",
+		 jiffies_to_msecs(rem));
+	queue_delayed_work(nvme_wq, &fc_ctrl->fenced_work, rem);
+	return;
+
+done:
 	nvme_fc_flush_held_requests(fc_ctrl);
 	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
 	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
@@ -2541,6 +2568,7 @@ static void
 nvme_fc_stop_ctrl(struct nvme_ctrl *nctrl)
 {
 	flush_work(&to_fc_ctrl(nctrl)->fencing_work);
+	flush_delayed_work(&to_fc_ctrl(nctrl)->fenced_work);
 }
 
 /*
@@ -3661,6 +3689,7 @@ nvme_fc_alloc_ctrl(struct device *dev, struct nvmf_ctrl_options *opts,
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_fc_reset_ctrl_work);
 	INIT_DELAYED_WORK(&ctrl->connect_work, nvme_fc_connect_ctrl_work);
 	INIT_WORK(&ctrl->fencing_work, nvme_fc_fencing_work);
+	INIT_DELAYED_WORK(&ctrl->fenced_work, nvme_fc_fenced_work);
 	INIT_WORK(&ctrl->ioerr_work, nvme_fc_ctrl_ioerr_work);
 	spin_lock_init(&ctrl->lock);
 
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 7096f1e4f84e..bcecaaf06f7e 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -401,6 +401,7 @@ struct nvme_ctrl {
 	u32 max_zone_append;
 #endif
 	u16 crdt[3];
+	u16 cqt;
 	u16 oncs;
 	u8 dmrl;
 	u8 ciu;
@@ -1360,8 +1361,8 @@ static inline bool nvme_multi_css(struct nvme_ctrl *ctrl)
 static inline unsigned long nvme_fence_timeout_ms(struct nvme_ctrl *ctrl)
 {
 	if (ctrl->ctratt & NVME_CTRL_ATTR_TBKAS)
-		return 3 * ctrl->kato * 1000;
-	return 2 * ctrl->kato * 1000;
+		return 3 * ctrl->kato * 1000 + ctrl->cqt;
+	return 2 * ctrl->kato * 1000 + ctrl->cqt;
 }
 
 #endif /* _NVME_H */
diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 9c50421d79c4..8ff5aa312377 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -120,6 +120,7 @@ struct nvme_rdma_ctrl {
 	/* other member variables */
 	struct blk_mq_tag_set	tag_set;
 	struct work_struct	fencing_work;
+	struct delayed_work	fenced_work;
 	struct work_struct	err_work;
 
 	struct nvme_rdma_qe	async_event_sqe;
@@ -994,6 +995,7 @@ static void nvme_rdma_stop_ctrl(struct nvme_ctrl *nctrl)
 	struct nvme_rdma_ctrl *ctrl = to_rdma_ctrl(nctrl);
 
 	flush_work(&ctrl->fencing_work);
+	flush_delayed_work(&ctrl->fenced_work);
 	flush_work(&ctrl->err_work);
 	cancel_delayed_work_sync(&ctrl->reconnect_work);
 }
@@ -1155,6 +1157,18 @@ static void nvme_rdma_reconnect_ctrl_work(struct work_struct *work)
 	nvme_rdma_reconnect_or_remove(ctrl, ret);
 }
 
+static void nvme_rdma_fenced_work(struct work_struct *work)
+{
+	struct nvme_rdma_ctrl *rdma_ctrl = container_of(to_delayed_work(work),
+					   struct nvme_rdma_ctrl, fenced_work);
+	struct nvme_ctrl *ctrl = &rdma_ctrl->ctrl;
+
+	dev_info(ctrl->device, "Time-based recovery finished\n");
+	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
+		queue_work(nvme_reset_wq, &rdma_ctrl->err_work);
+}
+
 static void nvme_rdma_fencing_work(struct work_struct *work)
 {
 	struct nvme_rdma_ctrl *rdma_ctrl = container_of(work,
@@ -1163,9 +1177,22 @@ static void nvme_rdma_fencing_work(struct work_struct *work)
 	unsigned long rem;
 
 	rem = nvme_fence_ctrl(ctrl);
-	if (rem)
-		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
+	if (!rem)
+		goto done;
+
+	if (!ctrl->cqt) {
+		dev_info(ctrl->device,
+			 "CCR failed, CQT not supported, skip time-based recovery\n");
+		goto done;
+	}
+
+	dev_info(ctrl->device,
+		 "CCR failed, switch to time-based recovery, timeout = %ums\n",
+		 jiffies_to_msecs(rem));
+	queue_delayed_work(nvme_wq, &rdma_ctrl->fenced_work, rem);
+	return;
 
+done:
 	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
 	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
 		queue_work(nvme_reset_wq, &rdma_ctrl->err_work);
@@ -2354,6 +2381,7 @@ static struct nvme_rdma_ctrl *nvme_rdma_alloc_ctrl(struct device *dev,
 	INIT_DELAYED_WORK(&ctrl->reconnect_work,
 			nvme_rdma_reconnect_ctrl_work);
 	INIT_WORK(&ctrl->fencing_work, nvme_rdma_fencing_work);
+	INIT_DELAYED_WORK(&ctrl->fenced_work, nvme_rdma_fenced_work);
 	INIT_WORK(&ctrl->err_work, nvme_rdma_error_recovery_work);
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_rdma_reset_ctrl_work);
 
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 3a12b07149d2..e8dad4722347 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -486,6 +486,7 @@ nvme_show_int_function(numa_node);
 nvme_show_int_function(queue_count);
 nvme_show_int_function(sqsize);
 nvme_show_int_function(kato);
+nvme_show_int_function(cqt);
 
 static ssize_t nvme_sysfs_ciu_show(struct device *dev,
 					  struct device_attribute *attr,
@@ -966,6 +967,7 @@ static struct attribute *nvme_dev_attrs[] = {
 	&dev_attr_sqsize.attr,
 	&dev_attr_ciu.attr,
 	&dev_attr_cirn.attr,
+	&dev_attr_cqt.attr,
 	&dev_attr_hostnqn.attr,
 	&dev_attr_hostid.attr,
 	&dev_attr_ctrl_loss_tmo.attr,
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index febbe8954473..7b1d9e2cb00d 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -168,6 +168,7 @@ struct nvme_tcp_ctrl {
 	struct nvme_ctrl	ctrl;
 
 	struct work_struct	fencing_work;
+	struct delayed_work	fenced_work;
 	struct work_struct	err_work;
 	struct delayed_work	connect_work;
 	struct nvme_tcp_request async_req;
@@ -2565,6 +2566,18 @@ static void nvme_tcp_reconnect_ctrl_work(struct work_struct *work)
 	nvme_tcp_reconnect_or_remove(ctrl, ret);
 }
 
+static void nvme_tcp_fenced_work(struct work_struct *work)
+{
+	struct nvme_tcp_ctrl *tcp_ctrl = container_of(to_delayed_work(work),
+					 struct nvme_tcp_ctrl, fenced_work);
+	struct nvme_ctrl *ctrl = &tcp_ctrl->ctrl;
+
+	dev_info(ctrl->device, "Time-based recovery finished\n");
+	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
+		queue_work(nvme_reset_wq, &tcp_ctrl->err_work);
+}
+
 static void nvme_tcp_fencing_work(struct work_struct *work)
 {
 	struct nvme_tcp_ctrl *tcp_ctrl = container_of(work,
@@ -2573,9 +2586,22 @@ static void nvme_tcp_fencing_work(struct work_struct *work)
 	unsigned long rem;
 
 	rem = nvme_fence_ctrl(ctrl);
-	if (rem)
-		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
+	if (!rem)
+		goto done;
+
+	if (!ctrl->cqt) {
+		dev_info(ctrl->device,
+			 "CCR failed, CQT not supported, skip time-based recovery\n");
+		goto done;
+	}
 
+	dev_info(ctrl->device,
+		 "CCR failed, switch to time-based recovery, timeout = %ums\n",
+		 jiffies_to_msecs(rem));
+	queue_delayed_work(nvme_wq, &tcp_ctrl->fenced_work, rem);
+	return;
+
+done:
 	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
 	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
 		queue_work(nvme_reset_wq, &tcp_ctrl->err_work);
@@ -2657,6 +2683,7 @@ static void nvme_reset_ctrl_work(struct work_struct *work)
 static void nvme_tcp_stop_ctrl(struct nvme_ctrl *ctrl)
 {
 	flush_work(&to_tcp_ctrl(ctrl)->fencing_work);
+	flush_delayed_work(&to_tcp_ctrl(ctrl)->fenced_work);
 	flush_work(&to_tcp_ctrl(ctrl)->err_work);
 	cancel_delayed_work_sync(&to_tcp_ctrl(ctrl)->connect_work);
 }
@@ -3023,6 +3050,7 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
 	INIT_DELAYED_WORK(&ctrl->connect_work,
 			nvme_tcp_reconnect_ctrl_work);
 	INIT_WORK(&ctrl->fencing_work, nvme_tcp_fencing_work);
+	INIT_DELAYED_WORK(&ctrl->fenced_work, nvme_tcp_fenced_work);
 	INIT_WORK(&ctrl->err_work, nvme_tcp_error_recovery_work);
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_reset_ctrl_work);
 
-- 
2.55.0

