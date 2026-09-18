Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC93B51FCBF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755441; cv=none; b=mAUdTDS4zhaTW3x4OQu7GHz546x1xY2dMO1RjpwRopQvefUl2UQjj8SMyT7U7xmJg0b32O5GKUjxMFwflU8B52XDXJ3XXVSiyJdsn3s0t+wruVNvh6zS6v7D3RjeGHOz6ag7B4EaNfqPG9jKIkfwqKGCZMZkmJIVGPehqXCukyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755441; c=relaxed/simple;
	bh=D0ry5I2UO5EoVVglgccRISGqcp8rRYeGB8BrHvdM5pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k0D+3zOuCsWHc7bGmiwkX7bai3ZMPOOiR8XmVPnPweTOQ/fyFZR06guPakIW5H1+luqW8gNMbvI3tS1taMzLkPdp4pw6XDrFJ/XR5p4WrGJJpf0PxKrSWOOll2vqjeXNonCGtGIeGzKejUoaZao/BJV57Q7qMUxuHHq4KdosoS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=aIyTwY2N; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="aIyTwY2N"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc50b9e8a45so635970a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755439; x=1790360239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dih43qxI5dfgAB3392PAv6zbxSUobiO7FmfsRmituIk=;
        b=aIyTwY2NHWsrV2FaRalS6mA+gBKXQ+FQPxtDBLhUokoMfvw7tTaouGjcqXp1yg8A2z
         HO1lwntxzV7k7loB4DCBbvD+qTsQQmN+t6IFr13KIooC2ACoBK18Wq3Fp2eEkllmdnwh
         jO0ARacSk9HS9iJTr3CfDwukuHNxpi6IPKCLsegq59yymtTQnOQ/GUtEOortsImyhxy0
         8wcafcs76bf3/1Xw8Y2BM1vUe5CoNg7KtDUNFYXUBsHVyQNKCWxEQ8xWMOYff8no3NcT
         LV/XZgB2DXjxuZ14GCwQ5y2X2RF5HKQ2CjBtvAtYX1ouXKPhzRsGG5ov68OKEXQQnbPG
         3pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755439; x=1790360239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dih43qxI5dfgAB3392PAv6zbxSUobiO7FmfsRmituIk=;
        b=UrhYpc+lwIylfxxC4MpIO4/g6t1ya1QFWDZQY6KPFRolNKvXAuxSCClqmP5CywVZNn
         zvAhP/OsZyXe1zjkqeWSNukbGfA6MdXGsj1iN8LTOdhiCnem8ZoVL55RWVZTPqFBlCqN
         A5vlg2nsO5dDHkl8PphalNZdgx7cAalqvXPtzB78Hc4tciNitv0xwTipvwyUWwy/NoMV
         KaP6EsdL4WnpryrEMQ2EoHbYQpkQQwCTBwZAXfl/EeLFj3fwGHej9PsPlNU1SqKNmclA
         tFJ0RZVWQjxKp6eQcGb65SA7tQ8pJagTKO6rmTduc9htyYWtgTdvLMvt46PYcZjJk9Rw
         IPzg==
X-Forwarded-Encrypted: i=1; AKwUvBxGdyvMWTv4uzP5c2xjl5CXgbrs+M6n8vKMxjXKiWx4ml+5EAbRVcvH7ZFCv2n+FIQQkCNHZyIt+b3vvvk=@vger.kernel.org
X-Gm-Message-State: AFuF++mqPEYwoovXA/SYFew2Vaoevrqd8Nb0j8Q5Kdr9vhzudQQA/2s+
	dl32QAu5aHaRnBrV7Lkja8Org3GC4Do/DnR4d+LJA6wRiz3pdwE7APY8ARs/TdKw+/I=
X-Gm-Gg: AYBFou3Qvc95h4U6vqb/Nl1hzJgMDLCjQJFb0a8eyp6cBCfMECajPqr0GTpcPBy5ey7
	PePY0lO7WfQ75iF0mbt9qQnwUZqApUfZ4E+9Kf0Xq+UoNo6kuycda9ZgzVd43GovB4vy3kvdwR/
	DCo/ahqRpdXEZMsdarVVjEryyAqfh98HhHRzqEt9c6KN7EP8aaKk9gyVAT0MG6cOYk19zGv5Exn
	YgxPMxuN+ARldVmLcKJxr+ufyH/04dXplHTm9eZfW0yiWV9VYFHUB2+/DlaLrybD1Q6z7Hvjayd
	hSRHbgfBbhs2XUt382SHnpzuRLWPxsNn4Fkiyl+K8Dsr6/EV/eXd15yInf2XcQCzTbnSK00SlVG
	jyvStjLXjhzajYKM+eMM5RxKv3Yr23pjmuGmU3riEDy300+V509Hb03kVfE77KSgFtp6M5qQxwv
	65qrho9407fLVaftyQjllom3jT70wYf3gdhVDtQmoznF+hKkeV+NSKwMh6WcrxxatNkqRLc2fTr
	Twirp4AqnaGjciCRMcz8Bk=
X-Received: by 2002:a17:90b:4a03:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39e54d38c48mr11469185a91.8.1789755438885;
        Fri, 18 Sep 2026 11:17:18 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:18 -0700 (PDT)
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
Subject: [PATCH 18/18] nvme: let controller deletion wait out a fencing window
Date: Fri, 18 Sep 2026 11:14:18 -0700
Message-ID: <20260918181614.3947933-19-mkhalfella@purestorage.com>
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

