Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98CF179A3;
	Wed,  9 Sep 2026 02:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788919833; cv=none; b=uq8+VoNbdL02vOcp002oIiUtLNjICr7pVo5HBpQajQNju3/4XiV+/8KIZ9f+iE82PZNp2x2ho97MgJNia5hoCAfC6uPzjLi5qXHAQ4wfx5jhNw5qXC+gEy0dCbsmADeqm2eEWQIt9lrHY5vxoisF5S+ve6CXrfSE+40kBGGQa2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788919833; c=relaxed/simple;
	bh=g3Ea4k9nAvXGjzhNYBnEARC1XmiIc4V4OZYrptIGcsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FddzdVQOV4xYAWwzE43r028ITs3DJAt8qlhZZEbAww/KCsNzoFC2rBzec1+GntR8Tf3CHXtHSNT3X9IAwoD1WzeLsBqmqJv2YNcWeD1H1YpR6lKvbqI+dGhFyeO2k7dl+4vgRWsJ8g2GD90mInl+yyCmMSGyBMU90vozWifq8z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9b3491deabf311f19a56ed5b684f684d-20260909
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:395ff580-4c19-475b-9e6d-bcc09d1ad401,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:248f661811a9764546178ebf6d39a347,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9b3491deabf311f19a56ed5b684f684d-20260909
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1780386430; Wed, 09 Sep 2026 10:10:19 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: Thinh.Nguyen@synopsys.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huang Wei <huangwei@kylinos.cn>,
	kakapapa2 <kakapapa2@gmail.com>
Subject: [PATCH v2] usb: dwc2: debugfs: fix memory leak of hsotg->regset
Date: Wed,  9 Sep 2026 10:10:14 +0800
Message-Id: <20260909021014.906548-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260807100400.3179625-1-huangwei@kylinos.cn>
References: <20260807100400.3179625-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hsotg->regset is allocated in dwc2_debugfs_init() using devm_kzalloc(),
which ties its lifetime to the device (struct dwc2_hsotg) rather than
to the debugfs entries it serves. dwc2_debugfs_exit() removes the
debugfs directory but leaves hsotg->regset allocated until the device
itself is removed, so the pointer dangles for the remainder of the
device lifetime.

Switch to kzalloc() and free it explicitly in dwc2_debugfs_exit() so
the regset lifetime matches the debugfs lifetime. Set the pointer to
NULL after freeing to avoid a stale dangling pointer.

Reported-by: kakapapa2 <kakapapa2@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219977
Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Huang Wei <huangwei@kylinos.cn>

---
Changes in v2:
- Rework the commit message per Thinh Nguyen: the issue is an
  allocation lifetime mismatch with the debugfs lifetime, not a
  traditional memory leak (the devm_kzalloc() allocation is
  eventually reclaimed by devres). Drop the misleading reference to the
  dwc3 regset commit, which addressed a separate problem.
---
 drivers/usb/dwc2/debugfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/debugfs.c b/drivers/usb/dwc2/debugfs.c
index 3116ac72747f..2ecbf6523aaa 100644
--- a/drivers/usb/dwc2/debugfs.c
+++ b/drivers/usb/dwc2/debugfs.c
@@ -9,6 +9,7 @@
 #include <linux/spinlock.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
+#include <linux/slab.h>
 #include <linux/uaccess.h>
 
 #include "core.h"
@@ -787,8 +788,7 @@ int dwc2_debugfs_init(struct dwc2_hsotg *hsotg)
 	/* Add gadget debugfs nodes */
 	dwc2_hsotg_create_debug(hsotg);
 
-	hsotg->regset = devm_kzalloc(hsotg->dev, sizeof(*hsotg->regset),
-								GFP_KERNEL);
+	hsotg->regset = kzalloc_obj(*hsotg->regset, GFP_KERNEL);
 	if (!hsotg->regset) {
 		ret = -ENOMEM;
 		goto err;
@@ -810,4 +810,6 @@ void dwc2_debugfs_exit(struct dwc2_hsotg *hsotg)
 {
 	debugfs_remove_recursive(hsotg->debug_root);
 	hsotg->debug_root = NULL;
+	kfree(hsotg->regset);
+	hsotg->regset = NULL;
 }
-- 
2.25.1

