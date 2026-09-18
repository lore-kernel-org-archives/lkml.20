Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B061151DDFC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755433; cv=none; b=b5UyeMt0hImsrT2U2QCrBCOvCVt3TZcBQJxKbZIfBn7q6Cxb5+vsKv5fWTmqtarSkQm60l/kvA4kRKovZxWhU8ZaZf1YatbqN8/tNVMaO2djXWcMb9BMysl7Ize3PWpwneAduPLlbIcPGp2N5Xxm1l4qtvNs3FQzAJga+PskfWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755433; c=relaxed/simple;
	bh=HFUI+vwDH7eJ577FDlmpoi8q2nXZKzYpl023jQ7aoks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYp/gu63dtgtZeD+J9oFWz9K2F2kMQHRPlQP+5xuEP+Y/PS17RuRA60A8vRMsw7JUWo1pQ7khzC9aH92thjOB6DkN9dwMNgxUoQVfYQtDs2C/xIXceSPL95taqUZy8kxOHmJPvNwIAwlZZxmYEjTRjgxlsBLyMKxd7jjoZ/hnIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=L9xI4twL; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="L9xI4twL"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso1026488a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755431; x=1790360231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEWXTR1kghd8H69+9xfipKsLZLRrTMB1ZhrH2/JIMpI=;
        b=L9xI4twLXn+I43o5+yRbfj7eVqGxcvomHlTy/iDryKZwKdijSAG52Wq6nEUfhqr419
         3A11UcFfsb5dnyhg/NdIjJi67tH9ghkrzCOMJzYLPc3EQeWemzJ2lb5bjkL6zGhx+6Xo
         goEIpjUNxuuKQMYympvT52rmOi7Q88ZflyrpWfn3/HYqo0Be88mJ6pHByOFk+E3f93S1
         G1dcH3uj6zrW+uIHObvYW9LtrX07ASQr8CgWjfwAHr1veYCnjDZqJD5FJbhCn3tpMfOH
         JQAhxfivRT06GuXr8e8INtIByFVlUmPx4E1cIhlAHlXySzxigKk0OfbgmFOCibZHdnpa
         7RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755431; x=1790360231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UEWXTR1kghd8H69+9xfipKsLZLRrTMB1ZhrH2/JIMpI=;
        b=w1YEn3z4+znpoyKiG3gIpCiALFtUIeDNocO0tk7TetfQeVE13dklOll3fysfjsH8Sv
         3NEgsqG/a68mnpSkogVDW+eD1OJcRnNTyKgurmS/tmW1ewef+XX7eoundc5/5QXZlyVR
         aL4H1OMG958o6Sava6qIf3FtLYfs78cubvN0mmczDDxSfdYQ0RcCtszexo7NLLtJeYUo
         u3dgvIpkzcBG0D7PK9SiuTVKrlJUJzIWbm+V1gbdbQhIdNq2Ga98LlpmL/vVST6Rq/D2
         vDfofMHjkEcsIAHtNGcAN+VQo10QYaZ2mbKmkaRqfZdYEGlD4tJLoVpru67BAEK+j21k
         epjA==
X-Forwarded-Encrypted: i=1; AKwUvBypql2kZCGvQMGFOMTy9vz2zbITIuV3Q2p6WxpvWUP27eF7ENxtyd51OInJKEWhUFISjbBJfyRR1102BHA=@vger.kernel.org
X-Gm-Message-State: AFuF++kU7OD3ko8CEqSSTGnIuMRCTv7CvwsWovJ2myX94XKdgMuBNORc
	BNIt4jtJDEvh1a7kjiI8e3q0XZ29O1C7Hia2x3wTtyUrxVq8ipYfNRHLC7tInZGrrts=
X-Gm-Gg: AYBFou23OHq+mW/B0CQ+endZZxzOt9fWzzQ4fbtPCUKoZ/41/K060QE48XnD4TcIh8r
	sZXy6cdrFHk1xSDmLlnlSJaaaU2e1+28sEYEHpqYuht3eefjWNHg1i2cgvJ37q/wyketY55E3jk
	lyw4U8rgriMxQlabLYGX2UDKZLeoN7ucDeB9WPLltbT910Rwkd3gD+jyAATGE3dp+b+TFA52Gye
	PB5DK6tglHtupNcM6pthiv4p/t6YFZmxHacBDlwP3ypbSUFQYCalrSIbSXDZCAj0KXk3fu//p9w
	3zEgpsfLHMmqHBwwjAt7FmpXguqLhqz6+Hoe+jv/cOkjrYhJCHO7hKUB5Y9LHxG6MofJ2hqrCy8
	CMNPSIzyXu15RGbe5cBwBd7OBEqwg0ZTDY9NDvexUQWALBkgWBZ+/qqRY3QN3OXe0HuCxegtfV7
	ysxQw8blNMgMoUx0uoZ9+SL8aTziAU14quQ/8GO/RUBWuExULFZucIIGe6iUoH6kWoYklrnN4i0
	GdVL9kq2NSWWUEi1c+iXg==
X-Received: by 2002:a17:90b:4cc3:b0:39e:6a7f:eeee with SMTP id 98e67ed59e1d1-39e6a7ff08amr1968530a91.19.1789755430699;
        Fri, 18 Sep 2026 11:17:10 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:10 -0700 (PDT)
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
Subject: [PATCH 10/18] nvme-tcp: Use CCR to recover controller that hits an error
Date: Fri, 18 Sep 2026 11:14:10 -0700
Message-ID: <20260918181614.3947933-11-mkhalfella@purestorage.com>
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

An alive nvme controller that hits an error now will move to FENCING
state instead of RESETTING state. ctrl->fencing_work attempts CCR to
terminate inflight IOs. Regardless of the success or failure of CCR
operation the controller is transitioned to RESETTING state to continue
error recovery process.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/tcp.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 921934028e0b..febbe8954473 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -167,6 +167,7 @@ struct nvme_tcp_ctrl {
 	struct sockaddr_storage src_addr;
 	struct nvme_ctrl	ctrl;
 
+	struct work_struct	fencing_work;
 	struct work_struct	err_work;
 	struct delayed_work	connect_work;
 	struct nvme_tcp_request async_req;
@@ -616,6 +617,12 @@ static void nvme_tcp_init_recv_ctx(struct nvme_tcp_queue *queue)
 
 static void nvme_tcp_error_recovery(struct nvme_ctrl *ctrl)
 {
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCING)) {
+		dev_warn(ctrl->device, "starting controller fencing\n");
+		queue_work(nvme_wq, &to_tcp_ctrl(ctrl)->fencing_work);
+		return;
+	}
+
 	if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
 		return;
 
@@ -2558,6 +2565,22 @@ static void nvme_tcp_reconnect_ctrl_work(struct work_struct *work)
 	nvme_tcp_reconnect_or_remove(ctrl, ret);
 }
 
+static void nvme_tcp_fencing_work(struct work_struct *work)
+{
+	struct nvme_tcp_ctrl *tcp_ctrl = container_of(work,
+			struct nvme_tcp_ctrl, fencing_work);
+	struct nvme_ctrl *ctrl = &tcp_ctrl->ctrl;
+	unsigned long rem;
+
+	rem = nvme_fence_ctrl(ctrl);
+	if (rem)
+		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
+
+	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
+		queue_work(nvme_reset_wq, &tcp_ctrl->err_work);
+}
+
 static void nvme_tcp_error_recovery_work(struct work_struct *work)
 {
 	struct nvme_tcp_ctrl *tcp_ctrl = container_of(work,
@@ -2633,6 +2656,7 @@ static void nvme_reset_ctrl_work(struct work_struct *work)
 
 static void nvme_tcp_stop_ctrl(struct nvme_ctrl *ctrl)
 {
+	flush_work(&to_tcp_ctrl(ctrl)->fencing_work);
 	flush_work(&to_tcp_ctrl(ctrl)->err_work);
 	cancel_delayed_work_sync(&to_tcp_ctrl(ctrl)->connect_work);
 }
@@ -2731,13 +2755,15 @@ static enum blk_eh_timer_return nvme_tcp_timeout(struct request *rq)
 	struct nvme_tcp_cmd_pdu *pdu = nvme_tcp_req_cmd_pdu(req);
 	struct nvme_command *cmd = &pdu->cmd;
 	int qid = nvme_tcp_queue_id(req->queue);
+	enum nvme_ctrl_state state;
 
 	dev_warn(ctrl->device,
 		 "I/O tag %d (%04x) type %d opcode %#x (%s) QID %d timeout\n",
 		 rq->tag, nvme_cid(rq), pdu->hdr.type, cmd->common.opcode,
 		 nvme_fabrics_opcode_str(qid, cmd), qid);
 
-	if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE) {
+	state = nvme_ctrl_state(ctrl);
+	if (state != NVME_CTRL_LIVE && state != NVME_CTRL_FENCING) {
 		/*
 		 * If we are resetting, connecting or deleting we should
 		 * complete immediately because we may block controller
@@ -2996,6 +3022,7 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
 
 	INIT_DELAYED_WORK(&ctrl->connect_work,
 			nvme_tcp_reconnect_ctrl_work);
+	INIT_WORK(&ctrl->fencing_work, nvme_tcp_fencing_work);
 	INIT_WORK(&ctrl->err_work, nvme_tcp_error_recovery_work);
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_reset_ctrl_work);
 
-- 
2.55.0

