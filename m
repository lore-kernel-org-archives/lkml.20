Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625561;
	b=WRvOB8Q4KALHaSytGQBeL3dxOccXzunEjigtRED16ggDNiNI0pKzRteGuqdkNybiV150
	 j+qEvOSJffdJgxEqv0LtG91ZjIPjaioXxRd6GPZnmRNH4wlO0IcdSE41/l/whSbjbUCu2
	 tTvamyDrkYlyC0WaYqO7JznOBu9sLbuCBzflLxruN3Tmzcp3M1cwiQu8N43wtX/eA2Wow
	 jDl+JQswQ7HBv8e54/ngTmxcU3G/L6BjStQvP89SHRZ/tb2DvwoYjt5aF1TrmR5Lh3MDV
	 u86z3a1ymOZAQAt5JyPEZXHRKcEKDU0xp2McYQ6UYboWcFr01CCYBVWxiXVNB5RiqAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KsxqtEqa+j7cIEzVTIS7e2jle9WDM5wz/EJVL2IR09M=;
	b=13kHG+MKVlRvLNEyR5Jkqiwvg4kxUnLu1iOKacg51px/Ieh++meRejcccDUjv3nX0hOd
	 bKrhg6XOnQiVPgnOvWcrXnaPZNKq3O9KzOw1877gXFSqaG9GYOihezQBnzyqkHOMAPY+l
	 /BNasQcim4nl1sk/t0yv5HandNB++gHAMa81WAec0VGVcKuLThZ0C7iF2ce0sdTKm52uG
	 eG0q2uC+scvw2WIYFq16Q+shdqSLUbne5DRieAjpjVAeM2AiAkS5RvquN7fh7QlP6CHA4
	 0xP6N4eq5sI/Rl1hD6/jllmGfCu+CpMs9JaRdes7xhDns3gaRw3aeGtLNNsT4fij4wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=H0oDUQOz;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2FF60A3825
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB2FF60A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=H0oDUQOz
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so979464c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625560; x=1795230360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsxqtEqa+j7cIEzVTIS7e2jle9WDM5wz/EJVL2IR09M=;
        b=H0oDUQOzchJlQD2UPYXvJOOoHgZOWufDl2AJSnwE4Bg2DEkXtBF67aSeiy7hQgncpo
         4+HAlRNBDIkaPzB3nzmNJ8rO2jmRyI3RG126NsLkLTR9/4nvlAZ/39k48JhuHG8vUD4u
         MG6MgnACZJP3PbgPCx9h6uXGjqU93Djk63qB3yrVGSUZHTZWNSE3T17osLh7Cpz/KiAp
         xg52VPsPeP13uSezTd+cHMfLAcX0ZYgG78f5DEHzI+95agpp1AFkeyWcB+wApBKpRwvs
         cc6+XSmYs51wRbOx/hMmKbYPvafI1yUpEesIghkbXhrNCOPj/zHjCkIRL6a5j2L9L1cD
         fW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625560; x=1795230360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KsxqtEqa+j7cIEzVTIS7e2jle9WDM5wz/EJVL2IR09M=;
        b=WoB9jLxkAnh21zzIa0cEu9Oj96jXXE3JaoM85MYoAKKpOFqz2yppKd6rXEbbeoCYPW
         sLe2zbZEVRkilh3PqdsBoVttpwVuiTnEkEPhWW9HXNxVa3EiJsHcgA+HePJMISEhy7TC
         U+OZJVBAxF22jFLHvmmMAaLaps4ys/pLvpvL5A3YIrSELTEztTuOJJFDA6L/uPajxmTF
         n3xbF4jXGfrHVSqFQy4Xy9ZX2UoZHX6MVC1mJ116zetmTVeH4o2b2WMaw6tAvnMEYVXg
         hYeidmnMh0awUvvd0thz09Pk+71HAP4XKVjezNAtUEu6XB30m1do12Pp7nmDR/c1pYFL
         4XiA==
X-Forwarded-Encrypted: i=1; AL+hErE/GLndq470dG8lheoNhZ67cZUqtbKJGrhhVrMLKKd73yy095resQnsXj41Swe+39rD82z0ScrVvK9ib6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ue/Eu1XyXmlsgRWMsPATWnFTiLQC5NmGqMXGNqVydK3qugKRA
	kIjb+MMBnuiLDZAh6BN1eT92qqyiQZ5+bQbJGKGsGnBQBEC17vsQkg+KRqJAJXsPl30=
X-Gm-Gg: AYBFou0h7p1raASBCGgBA+IIhNXVymhNGicIRv2+8UmPg2gt9XCW1st3a69yYNXQUVC
	6HE4dfqKNVByoabvUnv8Aedwd7LcGR2W079kBytvEBs3ML9y5hMQA6vqPm0y6pM5ELuLlaje4hJ
	ADZ7g9TC2J31YUkG4jFxnswrDCL/E2JSHxD9JnLKuEwQ2l13PqOBf+CDUd+5/fAXc2dxrAA8RPs
	hWCpHBIV8xWNQUAFGe5GCJONJfPIQj6l9WJtBAL/lTt4JTAsfVssoeORHDmkCAOpnNdmyhZ3sWH
	Kbk+04P0wCpIcql21DTvvomhiKYmlpYM+wNc7ehS07sY6CSVlpBrwBZ+QyWy8NmqdxyK40qICNS
	IyCwq2S9by5wecTeGOz+SXnGCbFDDjHy8CFhA7/1CkV+VR/Yh/i1K3pth3gRh8+RY2Ul7CMwLjW
	uwUTUmGNHwsXKh4OqbPrPJR3a2SeuRc+FUVg+9rJJKQ1tNWMSbDLJElgDyJXDN5tjgUdcqhVlf1
	tpDEMYDaDi2CiTfyJY2SUHdLcowCngP4AbcvuUxb0vMaxtcYdojiwzwxb9+o+lVbEia7kMr5kDe
	tEyScdq7PyLYaSDiiM6Zh5mG7VAw85caPBQoXn6lAqLN4Jv/YS2l
X-Received: by 2002:a05:7022:ed02:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b5031753eamr3862160c88.21.1794625559780;
        Fri, 13 Nov 2026 19:05:59 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:05:59 -0800 (PST)
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
Subject: [PATCH v7 10/17] nvme-tcp: Use CCR to recover controller that hits an error
Date: Fri, 13 Nov 2026 19:04:24 -0800
Message-ID: <20261114030454.2836543-11-mkhalfella@purestorage.com>
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

A LIVE controller that hits an error now moves to FENCING instead of
RESETTING. ctrl->fencing_work attempts CCR to terminate inflight IOs.
Regardless of the success or failure of the CCR operation, the
controller then moves to RESETTING to continue error recovery.

A request that times out while the controller is FENCING is not
completed. Its timer is rearmed, since inflight requests must not be
retried before the fence is over. nvme_tcp_stop_ctrl() flushes
fencing_work, so deleting a controller that is fencing waits for the
fence to finish.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@kernel.org>
---
 drivers/nvme/host/tcp.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 7ecc6c007f8d..244c6c50cf99 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -195,6 +195,7 @@ struct nvme_tcp_ctrl {
 	struct sockaddr_storage src_addr;
 	struct nvme_ctrl	ctrl;
 
+	struct work_struct	fencing_work;
 	struct work_struct	err_work;
 	struct delayed_work	connect_work;
 	struct nvme_tcp_request async_req;
@@ -651,6 +652,12 @@ static void nvme_tcp_init_recv_ctx(struct nvme_tcp_queue *queue)
 
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
 
@@ -2767,6 +2774,22 @@ static void nvme_tcp_reconnect_ctrl_work(struct work_struct *work)
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
@@ -2842,6 +2865,7 @@ static void nvme_reset_ctrl_work(struct work_struct *work)
 
 static void nvme_tcp_stop_ctrl(struct nvme_ctrl *ctrl)
 {
+	flush_work(&to_tcp_ctrl(ctrl)->fencing_work);
 	flush_work(&to_tcp_ctrl(ctrl)->err_work);
 	cancel_delayed_work_sync(&to_tcp_ctrl(ctrl)->connect_work);
 }
@@ -2944,17 +2968,19 @@ static enum blk_eh_timer_return nvme_tcp_timeout(struct request *rq)
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
-		 * If we are resetting, connecting or deleting we should
-		 * complete immediately because we may block controller
-		 * teardown or setup sequence
+		 * If fencing has finished or we are resetting, connecting,
+		 * or deleting we should complete immediately because we may
+		 * block controller teardown or setup sequence
 		 * - ctrl disable/shutdown fabrics requests
 		 * - connect requests
 		 * - initialization admin requests
@@ -2970,7 +2996,9 @@ static enum blk_eh_timer_return nvme_tcp_timeout(struct request *rq)
 
 	/*
 	 * LIVE state should trigger the normal error recovery which will
-	 * handle completing this request.
+	 * handle completing this request. In FENCING state the request must
+	 * not be completed before fencing has finished, so just rearm the
+	 * timer and let the error recovery pick it up.
 	 */
 	nvme_tcp_error_recovery(ctrl);
 	return BLK_EH_RESET_TIMER;
@@ -3209,6 +3237,7 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
 
 	INIT_DELAYED_WORK(&ctrl->connect_work,
 			nvme_tcp_reconnect_ctrl_work);
+	INIT_WORK(&ctrl->fencing_work, nvme_tcp_fencing_work);
 	INIT_WORK(&ctrl->err_work, nvme_tcp_error_recovery_work);
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_reset_ctrl_work);
 
-- 
2.56.0

