Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096C243F4CF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432025; cv=none; b=H6O7uhmYddC3lVCYKTjMwNq7Aoa/kmTfxSFFv8zZtKrx3ZBtJ8cqZt5IxbhdgrTZHCtVult7U1C6hfI1Xt5J/yovQ7HhnBZda7VlY9wDC/M8JLJ1AEZyKZS/lU3ADmgoAr2IlJR9uf0wXG4D6e9cYbSLXirmUbhwUzdRBfwHvBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432025; c=relaxed/simple;
	bh=QiOyqGOBzrommv9olJ09XjDK/eJRu4HV8JH+bXQB4BM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PWfUyPokJGZLMo+bv1H5a7yiRkzf1lo3VrwVVm1BKw9sKoTqS83D2iuedMAUQQIlQ7UM7rwvkP8jwqGQTpqWB7UBmQ4hXhGEGYDPsTRFJEWY28aEZIkUujtzyiReiAGzE4EKhu6kUvJmTqAiM+r/hAoeFAFVFtpPEJ12jTE4rNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: dafe0ce2a78311f19a56ed5b684f684d-20260903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d4e2fd6f-218a-48b2-b292-b22acc3eb1ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:e751f361d4ea0866ec4817b170e931cf,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dafe0ce2a78311f19a56ed5b684f684d-20260903
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2124869959; Thu, 03 Sep 2026 18:40:18 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: maz@kernel.org,
	lpieralisi@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH v2] irqchip/gic-v5: Install root IRQ handler last in gicv5_init_common()
Date: Thu,  3 Sep 2026 18:40:14 +0800
Message-Id: <20260903104014.587068-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_handle_irq() cannot be undone: once a handler is installed, any
further call returns -EBUSY, so the set_handle_irq(NULL) in the error
path has never worked.  Drop it, and install the root handler only
after gicv5_irs_enable() has succeeded.

set_handle_irq() only fails if another root handler is already
installed, which cannot happen on a GICv5 system.  Should it ever
fail, the system is unusable: panic instead of unwinding.

Link: https://lore.kernel.org/r/87fqzrmywu.wl-maz@kernel.org
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/irqchip/irq-gic-v5.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index ac2d423b1723..c365f8150300 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -1166,21 +1166,18 @@ static int __init gicv5_init_common(struct fwnode_handle *parent_domain)
 	if (ret)
 		goto out_int;
 
-	ret = set_handle_irq(gicv5_handle_irq);
+	ret = gicv5_irs_enable();
 	if (ret)
 		goto out_int;
 
-	ret = gicv5_irs_enable();
-	if (ret)
-		goto out_handle;
+	if (set_handle_irq(gicv5_handle_irq))
+		panic("GICv5: unable to install root IRQ handler\n");
 
 	gicv5_smp_init();
 
 	gicv5_irs_its_probe();
 	return 0;
 
-out_handle:
-	set_handle_irq(NULL);
 out_int:
 	gicv5_cpu_disable_interrupts();
 	gicv5_free_domains();
-- 
2.25.1

