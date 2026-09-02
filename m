Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DBD3655DA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341158; cv=none; b=e139Ro9qBGLF+99pTY/KUb3N50dfc+L6zmhCz5szDYPg5k2ybFfV7XWMq8Kll0IaxRaBtqSxw8TWN5FNbc3KzO/bH7cZ9W/6soeE6UBArE2HJD2p0+Bb/H22I6EWr0CObKUKzm5V8b4VemVFt+QIE6IggCGjm+xojQVf7IJAEqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341158; c=relaxed/simple;
	bh=nR70CQWGAB/I2oXrVGFleWpAU7mucIBa++SB44ycBTc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fPO2InuqjBr07FMYyDIamc8cF5736CtU4tapSOptyn5dekIkcxioV0nKrtnMZMgL+/7S8weeEJDnfuEjyMQE8nYuXvbKwiX1qYG0jYkrQ0T05fpdgSBMOrPaqKpESj/IAqM7c1uy8OTfsDucIhWts1CRJ7gcHWSUNYrJ+BN2WIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 494fc44ea6b011f19a56ed5b684f684d-20260902
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1aec21a2-5ee0-4316-916a-9e4ab121b2a8,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:6af3197587e580f221bb4a0521b31088,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 494fc44ea6b011f19a56ed5b684f684d-20260902
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 134308484; Wed, 02 Sep 2026 17:25:49 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	gonglinkai@kylinos.cn
Subject: [PATCH] mailbox: arm_mhuv2: time out if the receiver never comes up
Date: Wed,  2 Sep 2026 17:25:45 +0800
Message-Id: <20260902092545.2542183-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mhuv2_tx_init() waits forever for access_ready. Fail probe
after 1s instead of hanging boot.

Fixes: 5a6338cce9f4 ("mailbox: arm_mhuv2: Add driver")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/mailbox/arm_mhuv2.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
index f035284944c0..1cf4282e1583 100644
--- a/drivers/mailbox/arm_mhuv2.c
+++ b/drivers/mailbox/arm_mhuv2.c
@@ -27,6 +27,7 @@
 
 #include <linux/amba/bus.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/mailbox_controller.h>
 #include <linux/mailbox/arm_mhuv2_message.h>
 #include <linux/module.h>
@@ -968,6 +969,7 @@ static int mhuv2_tx_init(struct amba_device *adev, struct mhuv2 *mhu,
 {
 	struct device *dev = mhu->mbox.dev;
 	int ret, i;
+	u32 val;
 
 	mhu->frame = SENDER_FRAME;
 	mhu->mbox.ops = &mhuv2_sender_ops;
@@ -1011,8 +1013,11 @@ static int mhuv2_tx_init(struct amba_device *adev, struct mhuv2 *mhu,
 out:
 	/* Wait for receiver to be ready */
 	writel_relaxed(0x1, &mhu->send->access_request);
-	while (!readl_relaxed(&mhu->send->access_ready))
-		continue;
+	if (readl_relaxed_poll_timeout(&mhu->send->access_ready, val, val,
+				       100, 1000000)) {
+		dev_err(dev, "receiver not ready\n");
+		return -ETIMEDOUT;
+	}
 
 	return 0;
 }
-- 
2.25.1

