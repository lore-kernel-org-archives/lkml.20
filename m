Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA36E2116F4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787798760; cv=none; b=Hj2SdzZcP4PQr2rgkeEYeynNWMbOhM3g1WVR7Vo32aZmOMWH+QbjaKsTiz89/fYlanc93VHWpKIi3rDRDSzdFeEkCG7/ynfZ1fySosCQ1/dd8cwqzPIKT8H4xi5khs9OV2O12DzahibIHRy3e2EymC5/w+x4+oSDTRaeKcbBym4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787798760; c=relaxed/simple;
	bh=kVjLJTnJ5maTFqok+1OJSTLHeI+c0xNm3o+qOFbIEBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dDP/cBemXZnQqdtqIvfZOpwDOiuEyM1yYgTVSTF4iZL2FyebRpy+OKlUKe12XUeW9/PYwp3lePcUMOltU9Pu3v9GPIcZm6RM32yG+f9q4cXmjR82LQ+nxPOYYl/FUHFZCPee/WGS/QI2uCW+CmAWFFjYcpR6Ofhqx1F3ZAs8X+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6bb35936a1c111f19a56ed5b684f684d-20260827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ba88b4f8-c0a9-480c-911b-8324a38a3f7d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:9e8c55e655d10901818f6f3b5e4886fc,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6bb35936a1c111f19a56ed5b684f684d-20260827
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 923733502; Thu, 27 Aug 2026 10:45:53 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, hare@suse.de, dwagner@suse.de, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v2 1/1] nvme-tcp: fix wrong status on deferred digest error
Date: Thu, 27 Aug 2026 09:05:00 +0800
Message-ID: <1.nvme-tcp-req-status.v2.git.liuxixin@kylinos.cn>
In-Reply-To: <cover.nvme-tcp-req-status.v2.git.liuxixin@kylinos.cn>
References: <cover.nvme-tcp-req-status.v1.git.liuxixin@kylinos.cn> <cover.nvme-tcp-req-status.v2.git.liuxixin@kylinos.cn>
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

On the rsp path, shift left when a deferred host error is stored,
otherwise use cqe->status.

Fixes: 1ba2e507f55c ("nvme-tcp: Do not reset transport on data digest errors")
Signed-off-by: Xixin Liu <liuxixin@kylinos.cn>
---
 drivers/nvme/host/tcp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -617,6 +617,7 @@ static int nvme_tcp_process_nvme_cqe(struct nvme_tcp_queue *queue,
 {
 	struct nvme_tcp_request *req;
 	struct request *rq;
+	__le16 status;
 
 	rq = nvme_find_rq(nvme_tcp_tagset(queue), cqe->command_id);
 	if (!rq) {
@@ -628,10 +629,12 @@ static int nvme_tcp_process_nvme_cqe(struct nvme_tcp_queue *queue,
 	}
 
 	req = blk_mq_rq_to_pdu(rq);
 	if (req->status == cpu_to_le16(NVME_SC_SUCCESS))
-		req->status = cqe->status;
+		status = cqe->status;
+	else
+		status = cpu_to_le16(le16_to_cpu(req->status) << 1);
 
-	if (!nvme_try_complete_req(rq, req->status, cqe->result))
+	if (!nvme_try_complete_req(rq, status, cqe->result))
 		nvme_complete_rq(rq);
 	queue->nr_cqe++;
 
-- 
2.53.0

