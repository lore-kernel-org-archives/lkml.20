Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCA4472F91
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929048; cv=none; b=M62KH2txcbEpYES4ERmMdemJx58kI/5kTKyt81xFAVpmt/kPpcBIx2spLWy5WjNToCzcacwywvTC0dFgb2qFbVDkY+f3G+NcXRwZJbjJgu6EV0BGWd/i1H5Ufy9Z97FbxrGxnMU9TzCL2VaKZ7JGdwfEojNKs61ivw1qs29iBpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929048; c=relaxed/simple;
	bh=D0ry5I2UO5EoVVglgccRISGqcp8rRYeGB8BrHvdM5pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXk++jymnvd4o//JGYtGqIcoaUtkQmpoEGDZH9cBZCwbbYClQulQFFEeLHF6Cv6EDtxAOErpTu3HcSNW4DfZ1HUNqX2M1TWcwLPyH8Jntn2Za38MvnE1imAbpD5xBdmqo5emSvYoSFDs7t67YW9oAF6f9/rw4hU8GF4CWdGsDPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=b7Kv2s4i; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="b7Kv2s4i"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba92so2066037a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929044; x=1790533844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dih43qxI5dfgAB3392PAv6zbxSUobiO7FmfsRmituIk=;
        b=b7Kv2s4irQ0uVsPDS6sk40c+rpdFh4q/hGkz/mtFHPJGQplhQitwn8OCX8HF0HLWpJ
         RS4VWs/tTtLqCpNFM3cKoLbvBEj6zJFwlpfp2v2dvPvF0bSzNsGhBELB9JzayXvAHdyq
         KNqxexqRYAUV+nYCn8vk9xfwUjOsrjLL6vJAs+8l1jz9fwOnOCGL1ZAMy+gzzavICQxK
         sfyjVDkCpWSZz+A1Vv0im3a4G8ZhMBQoL0YNfjdRL8d/6qsCXTOonLIIBImIVSJtC6C4
         LCJXluMLx4T4Tx4CLDzK8zXYHTMy+XeojBYKgBIf4KnEEpc3d4V3DssKwd+dCoXX1lCv
         Q1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929044; x=1790533844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dih43qxI5dfgAB3392PAv6zbxSUobiO7FmfsRmituIk=;
        b=CTWedT9T8P1mZPGdcxcFvUBHaiT6kc6Ml0lCnDt4BcqgWtfN9hMmjUuFtdtMGbcM2t
         PtJajDJ+TUdHbv3x3zAExApezCgjDOiEhU/LbL2TObgkYJWQ/0ppGckmlwzeD1rTZN0I
         uCDZBT5krc0pcQqEGsdQp+hSH5vMzlMgfeSnoKctUT6wzL81vmYGbGaVV9sc++ew1wtE
         4aRAJg+t6PhFOwQitTCxfKYGD/A/pK5kh3WfaUBB8JZwx3btjiw4vONUZFFuS5X3aT/o
         ZIl0iJiEdzMwaQ10TYtabUjM11lPiPIBSZr0AVqRpJ6UTSxU/kfdlPapcpur8W/zYRR1
         gfcA==
X-Forwarded-Encrypted: i=1; AKwUvBwUJaGfySYpHhs/4bKEH23myjCcgKHO2eIySsenaTkH0SVNebo0iZJCs6XkeqiTsosoyuqT7Wuamc1LeCs=@vger.kernel.org
X-Gm-Message-State: AFuF++lMgeeYA9Ohgh3bPG2GxXGfGjRikoJQwCvMwjUlYcqaQdtGMwUW
	OPKqIvQC9NBUOEjxr52lYW51Zl38nO0VBcR2Un5dzy03iMJjs26i1a7NIrJSrwJXzYc=
X-Gm-Gg: AYBFou1fi2rPgtOzeHy8XK9I/+oGdmI9MsCQRXsfc33daR7J8dwHeMSmanUcTIxI7Qz
	QlXUsEoTo/7okUU01Dz89QrddV2ag2oH30JzgFaK0BDttxX5o7gF7FhyeM6ewBCfaX1hvRAbDtJ
	1jd12PvFhZkkIO6LO/SdBVHkBDJfpoKQLfRsJbRHlBZpVBr8UdHd6RTmX5NLgAg73PSyLqt01wk
	31I4Ew3dR1waIMRw0162gscVTAaP59kHh3Z4bGZ21cmLUnLjHQOaLXPZwsWngojWLfRdxR/vUb7
	BNnQX5d0Z1SS4wDoLPvWUMJnEZp74uMo22clrSRfKL2aKQOhkufwYu7EestumgKFqNuD/TA14UJ
	OGkmLGqd/+IhuTxicsHw0oi5ZX/fWMLiBtxL6kXht0e9PQ0PvDXaMkGL2edIbbUMfkHy44gdu82
	54oNz7/u7A33MaZ0ZbOCHxgifIoeIYt68NcGB81S4kgrci8wI9eVEDfx1i
X-Received: by 2002:a17:90a:d00e:b0:39d:fd82:de0c with SMTP id 98e67ed59e1d1-39e54aeed0emr12729347a91.2.1789929043967;
        Sun, 20 Sep 2026 11:30:43 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:43 -0700 (PDT)
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
Subject: [PATCH v6 18/18] nvme: let controller deletion wait out a fencing window
Date: Sun, 20 Sep 2026 11:28:16 -0700
Message-ID: <20260920182936.2317916-19-mkhalfella@purestorage.com>
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

DELETING is not reachable from FENCING or FENCED, so during a fencing
window nvme_delete_ctrl() fails with -EBUSY. Its callers assume
deleting a live controller cannot fail: a sysfs disconnect is silently
dropped after the delete_controller node is already gone, rdma device
removal returns with the controller still holding resources on the
outgoing device, and module unload leaks live controllers.

Fencing is time-bounded and always ends in a state that allows
deletion. Add nvme_delete_ctrl_wait(), which waits on ctrl->state_wq
for the fencing window to end and retries, and use it in the tcp/rdma
module exit paths and rdma device removal. Make nvme_delete_ctrl_sync()
wait the same way so a sysfs disconnect during fencing is delayed
instead of dropped.

nvme-fc's remoteport unregister with dev_loss_tmo == 0 keeps the
non-waiting call since it runs under rport->lock; it does not need to
wait, as dev_loss_end has already expired and the reconnect path
deletes the controller once fencing completes.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/core.c | 41 ++++++++++++++++++++++++++++++++++++++--
 drivers/nvme/host/nvme.h |  1 +
 drivers/nvme/host/rdma.c |  4 ++--
 drivers/nvme/host/tcp.c  |  2 +-
 4 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index dc44e3af5f14..ca7f083702f5 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -271,6 +271,38 @@ int nvme_delete_ctrl(struct nvme_ctrl *ctrl)
 }
 EXPORT_SYMBOL_GPL(nvme_delete_ctrl);
 
+static bool nvme_ctrl_fencing(struct nvme_ctrl *ctrl)
+{
+	enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
+
+	return state == NVME_CTRL_FENCING || state == NVME_CTRL_FENCED;
+}
+
+static void nvme_wait_fencing_done(struct nvme_ctrl *ctrl)
+{
+	wait_event(ctrl->state_wq, !nvme_ctrl_fencing(ctrl));
+}
+
+/*
+ * Like nvme_delete_ctrl(), but waits for a fencing window to end
+ * instead of failing with -EBUSY. May sleep; callers that cannot
+ * sleep must use nvme_delete_ctrl() and handle the failure.
+ */
+int nvme_delete_ctrl_wait(struct nvme_ctrl *ctrl)
+{
+	int ret;
+
+	might_sleep();
+
+	for (;;) {
+		ret = nvme_delete_ctrl(ctrl);
+		if (!ret || !nvme_ctrl_fencing(ctrl))
+			return ret;
+		nvme_wait_fencing_done(ctrl);
+	}
+}
+EXPORT_SYMBOL_GPL(nvme_delete_ctrl_wait);
+
 void nvme_delete_ctrl_sync(struct nvme_ctrl *ctrl)
 {
 	/*
@@ -278,8 +310,13 @@ void nvme_delete_ctrl_sync(struct nvme_ctrl *ctrl)
 	 * since ->delete_ctrl can free the controller.
 	 */
 	nvme_get_ctrl(ctrl);
-	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_DELETING))
-		nvme_do_delete_ctrl(ctrl);
+	while (!nvme_change_ctrl_state(ctrl, NVME_CTRL_DELETING)) {
+		if (!nvme_ctrl_fencing(ctrl))
+			goto out_put;
+		nvme_wait_fencing_done(ctrl);
+	}
+	nvme_do_delete_ctrl(ctrl);
+out_put:
 	nvme_put_ctrl(ctrl);
 }
 
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index bcecaaf06f7e..bf8c2bf91ad3 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -1026,6 +1026,7 @@ void nvme_stop_keep_alive(struct nvme_ctrl *ctrl);
 int nvme_reset_ctrl(struct nvme_ctrl *ctrl);
 int nvme_reset_ctrl_sync(struct nvme_ctrl *ctrl);
 int nvme_delete_ctrl(struct nvme_ctrl *ctrl);
+int nvme_delete_ctrl_wait(struct nvme_ctrl *ctrl);
 void nvme_queue_scan(struct nvme_ctrl *ctrl);
 int nvme_get_log(struct nvme_ctrl *ctrl, u32 nsid, u8 log_page, u8 lsp, u8 csi,
 		void *log, size_t size, u64 offset);
diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index 8ff5aa312377..ce37e3eafeae 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -2483,7 +2483,7 @@ static void nvme_rdma_remove_one(struct ib_device *ib_device, void *client_data)
 	list_for_each_entry(ctrl, &nvme_rdma_ctrl_list, list) {
 		if (ctrl->device->dev != ib_device)
 			continue;
-		nvme_delete_ctrl(&ctrl->ctrl);
+		nvme_delete_ctrl_wait(&ctrl->ctrl);
 	}
 	mutex_unlock(&nvme_rdma_ctrl_mutex);
 
@@ -2523,7 +2523,7 @@ static void __exit nvme_rdma_cleanup_module(void)
 
 	mutex_lock(&nvme_rdma_ctrl_mutex);
 	list_for_each_entry(ctrl, &nvme_rdma_ctrl_list, list)
-		nvme_delete_ctrl(&ctrl->ctrl);
+		nvme_delete_ctrl_wait(&ctrl->ctrl);
 	mutex_unlock(&nvme_rdma_ctrl_mutex);
 	flush_workqueue(nvme_delete_wq);
 }
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 7b1d9e2cb00d..9331a3e0bd9a 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -3208,7 +3208,7 @@ static void __exit nvme_tcp_cleanup_module(void)
 
 	mutex_lock(&nvme_tcp_ctrl_mutex);
 	list_for_each_entry(ctrl, &nvme_tcp_ctrl_list, list)
-		nvme_delete_ctrl(&ctrl->ctrl);
+		nvme_delete_ctrl_wait(&ctrl->ctrl);
 	mutex_unlock(&nvme_tcp_ctrl_mutex);
 	flush_workqueue(nvme_delete_wq);
 
-- 
2.55.0

