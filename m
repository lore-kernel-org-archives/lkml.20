Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DC83264C2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335663; cv=none; b=oHk+uvZVftJ8YZ13lazsPiW1fUEvX+jS/+WYTsL+DGKVtrc2tAn0FCRnvFMvs41PXCbYbJARKZMKbI1cUMSHBh+PcfvjHPtZcIYRA7rd3ujhGO+HG9+N8XTBAKbOerso0koFmfdNzLXrn4f0EA9TDbKpmIPNiDCNjdCvmUsSLSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335663; c=relaxed/simple;
	bh=RKUC5ToPoclB8VvfzMFi1+TZHCCFFU5HHGjN41y4YGo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sPCizRzU0/i0W695OSYiztuP18lR0+TGjsecb0B2B0jRzWQ17stPa2iZUocJJ8RUsjfHomA1mgGRDpdlTSD3oupkZeKZJ02gpLUIRASfZwaIQw/XZNeb6SROEPpgMGJTJTALwiga5RC8wHCBm4rhDwD+cdqd/d3wwf3c3toxNF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7b75e4c4a6a311f19a56ed5b684f684d-20260902
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:c287a63a-ebb8-4164-ace3-fba431d9f755,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-INFO: VERSION:1.3.19,REQID:c287a63a-ebb8-4164-ace3-fba431d9f755,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:2a8f46a701415bdbd16dba932fe0963c,BulkI
	D:2609021554138O6GZT3M,BulkQuantity:0,SF:17|19|38|66|78|102|127|850|865|89
	8,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7b75e4c4a6a311f19a56ed5b684f684d-20260902
X-User: wangxuewen@kylinos.cn
Received: from localhost.localdomain [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 830672590; Wed, 02 Sep 2026 15:54:10 +0800
From: Xuewen Wang <wangxuewen@kylinos.cn>
To: haver@linux.ibm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v1] misc: genwqe: free DDCB wait queues
Date: Wed,  2 Sep 2026 15:54:05 +0800
Message-Id: <20260902075405.944687-1-wangxuewen@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

free_ddcb_queue() does not release the per-DDCB wait queues,
which leaks memory whenever the service layer is released.

Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 drivers/misc/genwqe/card_ddcb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/misc/genwqe/card_ddcb.c b/drivers/misc/genwqe/card_ddcb.c
index 969178573940..c7261b5883c5 100644
--- a/drivers/misc/genwqe/card_ddcb.c
+++ b/drivers/misc/genwqe/card_ddcb.c
@@ -1103,6 +1103,9 @@ static void free_ddcb_queue(struct genwqe_dev *cd, struct ddcb_queue *queue)
 
 	queue_size = roundup(queue->ddcb_max * sizeof(struct ddcb), PAGE_SIZE);
 
+	kfree(queue->ddcb_waitqs);
+	queue->ddcb_waitqs = NULL;
+
 	kfree(queue->ddcb_req);
 	queue->ddcb_req = NULL;
 
-- 
2.25.1

