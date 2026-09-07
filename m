Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35400883F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 02:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788748860; cv=none; b=XUCIqG4P2PNf6j62IRVF9B758Y3zJvGVY5E+CbBaf/LejqF3gRCLl9LN3dbm/EH0DxNVigUH9xmj7Zt9tbOsJ0cHLBcuAkTmysYQTcCAC4C2hCYR6lSLqHXNcns0jY/W9B8Aj4YR9tLb9UcCsarN2pDky/i6JzbJSgZorhuuMFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788748860; c=relaxed/simple;
	bh=Sdpmm4USBwTc2lfO8GWcMv9ClmyaQpZNKVaNDnmOFzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hRP80WBucxtcDS6aHNQDv/sVAcPsNUyu4x0g+5HzdQq8jMoYCcJnRFrW/9JwBWSYpf3qYBPm8ImKHDQxC4Vwri6lXl5aQsFVYZaoVHox0c+ZYShMa7iHcWlmYj60aLwRC5h+M05VZgP7xoq4AqNq4l1TSTcNRpDrzPd7LhxBaB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8a8b6e28aa6511f19a56ed5b684f684d-20260907
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:26e37412-11e1-40a2-8790-cd5f3e9925a0,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:a4d74d2ac240b2f0d156a9a3b3e58631,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8a8b6e28aa6511f19a56ed5b684f684d-20260907
X-User: fuqingshuang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fuqingshuang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 651630990; Mon, 07 Sep 2026 10:40:51 +0800
From: Qingshuang Fu <fuqingshuang@kylinos.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: [PATCH v3 2/3] irqchip/lan966x-oic: Drop redundant IRQ_DOMAIN_FLAG_DESTROY_GC
Date: Mon,  7 Sep 2026 10:40:45 +0800
Message-Id: <20260907024046.28845-3-fuqingshuang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260907024046.28845-1-fuqingshuang@kylinos.cn>
References: <20260907024046.28845-1-fuqingshuang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that __irq_domain_instantiate() automatically sets
IRQ_DOMAIN_FLAG_DESTROY_GC when dgc_info is provided, the explicit
flag in the irq_domain_info is redundant.  Remove it.

Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 drivers/irqchip/irq-lan966x-oic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-lan966x-oic.c b/drivers/irqchip/irq-lan966x-oic.c
index 8af08d0e4182..5122f3f1b353 100644
--- a/drivers/irqchip/irq-lan966x-oic.c
+++ b/drivers/irqchip/irq-lan966x-oic.c
@@ -220,7 +220,6 @@ static int lan966x_oic_probe(struct platform_device *pdev)
 	};
 	struct irq_domain_info d_info = {
 		.fwnode		= of_fwnode_handle(pdev->dev.of_node),
-		.domain_flags	= IRQ_DOMAIN_FLAG_DESTROY_GC,
 		.size		= LAN966X_OIC_NR_IRQ,
 		.hwirq_max	= LAN966X_OIC_NR_IRQ,
 		.ops		= &irq_generic_chip_ops,
-- 
2.25.1

