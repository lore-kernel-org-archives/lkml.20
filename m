Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792633114;
	b=hkl7QHUTtEAkQrghIad1hhUn0M7wjs/skhCwM+zLuX20Fh2cZrhVGMJtTUJ84sN8lQia
	 w0FMbq7dLpMHMw0jhYc6nstLPbp+s54XOpwrvhZepjoGKVKjwyhQC3A9JEJNQ517wW4LW
	 aVTuw8DX5XIYvUKgJmbB/5GO6lGuvYn4e4DWYMuSq4yf2TtYE8cRmS5ZlxspOt4VPhVgF
	 CksWeLuJNjfBeCi1eGKiZMz3/Cz76xhfTs0wLeHxLa60xywFUCFLYYzuXAwz/3CqZaRFH
	 +cjQyvtgYlO8VRO2k7VkWcQrL8OLk8bjr5bw9UT7cbiWL8E+eJuAjNfnoYuMuHcGXzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633114;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dw6OnE/iEbrM3KEKTPWsKKRmaok1xT5lXo79wCrJO3k=;
	b=VX3nOy2ltK8N1c1/ITP1DQsY9jEvuWfwXIOYjYcpTiQjragBTQzfgwZ1q4uZKnw/wL1t
	 E1h/wB7P9KvgXv2oZWeJWTUD6C9C2xtcHqQw/H23lu+DAx3uAdM8QrZ3m9AzlXiYvQNM5
	 4kKQJBVSpIas6hGR+TYHHlFyQb0eKLR6NKj4O6jqKVTr4BNjIlcMMO8YTQoC1GR0YPCjD
	 kJ3SxL0TOrQL9qoj6gylCu+pC8WnoGIQX4seA+oNEsBr4Gp7FA6QmdBtUKTj+Ktd3IHFj
	 cTw9S8B/pbyZWzo+p+Ca5YYr1547+DvoVPDobTa/OeOkIxt2qW5+brZEExAXcsT1dRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E24606A319;
	Thu, 22 Oct 2026 01:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E24606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 46340bb4cdb911f19a56ed5b684f684d-20261022
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c2a4fb52-7a91-4468-b49e-68eaca3bf4ee,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:e7c7dc395258a4b0acc64997d7a5d6f7,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 46340bb4cdb911f19a56ed5b684f684d-20261022
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1893543814; Thu, 22 Oct 2026 09:38:25 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH] media: dm1105: fix rc_dev leak on probe error paths
Date: Thu, 22 Oct 2026 09:38:11 +0800
Message-Id: <20261022013811.27947-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

dm1105_ir_init() registers an rc_dev that must be cleaned up by
dm1105_ir_exit().  However, in dm1105_probe() the return value of
dm1105_ir_init() is ignored, and neither the workqueue nor the
request_irq error path calls dm1105_ir_exit().  If IR initialization
succeeds but a later step (create_singlethread_workqueue or
request_irq) fails, the registered rc_dev is leaked.

Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
---
 drivers/media/pci/dm1105/dm1105.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/dm1105/dm1105.c b/drivers/media/pci/dm1105/dm1105.c
index ae4544042a74..9d49e95c8182 100644
--- a/drivers/media/pci/dm1105/dm1105.c
+++ b/drivers/media/pci/dm1105/dm1105.c
@@ -1125,14 +1125,16 @@ static int dm1105_probe(struct pci_dev *pdev,
 	if (ret < 0)
 		goto err_dvb_net;
 
-	dm1105_ir_init(dev);
+	ret = dm1105_ir_init(dev);
+	if (ret)
+		goto err_dvb_net;
 
 	INIT_WORK(&dev->work, dm1105_dmx_buffer);
 	sprintf(dev->wqn, "%s/%d", dvb_adapter->name, dvb_adapter->num);
 	dev->wq = create_singlethread_workqueue(dev->wqn);
 	if (!dev->wq) {
 		ret = -ENOMEM;
-		goto err_dvb_net;
+		goto err_dm1105_ir_exit;
 	}
 
 	ret = request_irq(pdev->irq, dm1105_irq, IRQF_SHARED,
@@ -1144,6 +1146,8 @@ static int dm1105_probe(struct pci_dev *pdev,
 
 err_workqueue:
 	destroy_workqueue(dev->wq);
+err_dm1105_ir_exit:
+	dm1105_ir_exit(dev);
 err_dvb_net:
 	dvb_net_release(&dev->dvbnet);
 err_disconnect_frontend:

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.25.1

