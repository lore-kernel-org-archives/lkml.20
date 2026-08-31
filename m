Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514D325B08A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141654; cv=none; b=hcCPpBvBybo0N3E1f531aIgO/hCdMyv1gRmQ5J/c1M5L/G9Bd2zsuykxkLijG8wrR1nCXldrhhYmiHk8QPJfPdHBCHSLDX1Akbc8pN3P5w5wEx4VJepalKjeUhvszsuSDKtbRfShoHBuF+rtoYkdG7iSliYeLvNLB4JR5cjSVhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141654; c=relaxed/simple;
	bh=S723R4plkdEt4YAzAoTi3ObGgFb6Is1kUVq9YawbBdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ex3ZQnXuDI7/x2FIJ6GN4ZzSi2cuigrEuTWWfOjQ90/hU3BpnfA6tqmIwB3yR2jaZFQrXxIsfmfpRUf3rOlotm783KEAAv89p/5tNBkvvG6bouFAVYc7IYOIgn41r+KUqqIYD2XsCOGs6LfMXu6xm/8unYfkf8X3bGkMsliER+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c764ec92a4df11f19a56ed5b684f684d-20260831
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:8d3a2742-6bee-4e8a-82b2-cc399daf22b3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:a63a8ec35f7506c60f878af16df13271,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c764ec92a4df11f19a56ed5b684f684d-20260831
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1718384454; Mon, 31 Aug 2026 10:00:45 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, hare@suse.de, dwagner@suse.de, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v3 1/1] nvme-tcp: fix wrong status on deferred digest error
Date: Mon, 31 Aug 2026 10:10:00 +0800
Message-ID: <1.nvme-tcp-req-status.v3.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.nvme-tcp-req-status.v3.git.liuxixin@kylinos.cn>
References: <cover.nvme-tcp-req-status.v2.git.liuxixin@kylinos.cn> <cover.nvme-tcp-req-status.v3.git.liuxixin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py

A C2HData digest error stores a host status code in req->status. Without
DATA_SUCCESS completion goes through the rsp path, which passed that host
value straight into complete as CQE Status wire encoding.

On the rsp path, pick host status from the CQE status field or from the
stored deferred error, then complete through nvme_tcp_end_request with
the CQE result.

Fixes: 1ba2e507f55c ("nvme-tcp: Do not reset transport on data digest errors")
Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/nvme/host/tcp.c | 36 +++++++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 15 deletions(-)

--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -612,11 +612,19 @@ static void nvme_tcp_error_recovery(struct nvme_ctrl *ctrl)
 	queue_work(nvme_reset_wq, &to_tcp_ctrl(ctrl)->err_work);
 }
 
+static inline void nvme_tcp_end_request(struct request *rq, u16 status,
+					union nvme_result result)
+{
+	if (!nvme_try_complete_req(rq, cpu_to_le16(status << 1), result))
+		nvme_complete_rq(rq);
+}
+
 static int nvme_tcp_process_nvme_cqe(struct nvme_tcp_queue *queue,
 		struct nvme_completion *cqe)
 {
 	struct nvme_tcp_request *req;
 	struct request *rq;
+	u16 status;
 
 	rq = nvme_find_rq(nvme_tcp_tagset(queue), cqe->command_id);
 	if (!rq) {
@@ -629,10 +637,11 @@ static int nvme_tcp_process_nvme_cqe(struct nvme_tcp_queue *queue,
 
 	req = blk_mq_rq_to_pdu(rq);
 	if (req->status == cpu_to_le16(NVME_SC_SUCCESS))
-		req->status = cqe->status;
+		status = le16_to_cpu(cqe->status) >> 1;
+	else
+		status = le16_to_cpu(req->status);
 
-	if (!nvme_try_complete_req(rq, req->status, cqe->result))
-		nvme_complete_rq(rq);
+	nvme_tcp_end_request(rq, status, cqe->result);
 	queue->nr_cqe++;
 
 	return 0;
@@ -893,14 +902,6 @@ static int nvme_tcp_recv_pdu(struct nvme_tcp_queue *queue, struct sk_buff *skb,
 	return -EINVAL;
 }
 
-static inline void nvme_tcp_end_request(struct request *rq, u16 status)
-{
-	union nvme_result res = {};
-
-	if (!nvme_try_complete_req(rq, cpu_to_le16(status << 1), res))
-		nvme_complete_rq(rq);
-}
-
 static int nvme_tcp_recv_data(struct nvme_tcp_queue *queue, struct sk_buff *skb,
 			      unsigned int *offset, size_t *len)
 {
@@ -961,8 +962,9 @@ static int nvme_tcp_recv_data(struct nvme_tcp_queue *queue, struct sk_buff *skb,
 			queue->ddgst_remaining = NVME_TCP_DIGEST_LENGTH;
 		} else {
 			if (pdu->hdr.flags & NVME_TCP_F_DATA_SUCCESS) {
-				nvme_tcp_end_request(rq,
-						le16_to_cpu(req->status));
+				union nvme_result res = {};
+
+				nvme_tcp_end_request(rq, le16_to_cpu(req->status), res);
 				queue->nr_cqe++;
 			}
 			nvme_tcp_init_recv_ctx(queue);
@@ -1009,7 +1011,9 @@ static int nvme_tcp_recv_ddgst(struct nvme_tcp_queue *queue,
 					pdu->command_id);
 		struct nvme_tcp_request *req = blk_mq_rq_to_pdu(rq);
 
-		nvme_tcp_end_request(rq, le16_to_cpu(req->status));
+		union nvme_result res = {};
+
+		nvme_tcp_end_request(rq, le16_to_cpu(req->status), res);
 		queue->nr_cqe++;
 	}
 
@@ -1124,8 +1128,10 @@ static void nvme_tcp_fail_request(struct nvme_tcp_request *req)
 		nvme_complete_async_event(&req->queue->ctrl->ctrl,
 				cpu_to_le16(NVME_SC_HOST_PATH_ERROR), &res);
 	} else {
+		union nvme_result res = {};
+
 		nvme_tcp_end_request(blk_mq_rq_from_pdu(req),
-				NVME_SC_HOST_PATH_ERROR);
+				NVME_SC_HOST_PATH_ERROR, res);
 	}
 }
 
-- 
2.53.0

