Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4558823E35F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787791274; cv=none; b=AMc1Z9tahr658OiSB2xK6r8tVJH+2XaNtk8r9qATnntP2SHTstnMVYFmYwYrXBlGj9/V5SgeQDx1qM+3FJZM6xH5VC7e/5wCcdUxuapKc6wnvaA92UWLpMPenwOA6x5RAvhaXZFZh2KLtg+mxU7Fw/bOE0M16EY2lE5e2/DUzUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787791274; c=relaxed/simple;
	bh=aPjrspuVf6REiDPNrGWA6Y4h12fdT/+f+Lv0+U2toT0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=lyiouLYHBsUWBC0gUeRDMJ2yxuAMdm7q7HvN2rDHvumZrvLmSbAWitBEQqpP8H+cMRknQtDDsyrDBwH2fi5K5QlyCKR//flLKxqDzvHlMQS40AyShobOXbHQ3ugW03JtnVmv6LbAJ6TCmP4eUByzuy8oopXPKEF3r/oTgZDzmOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: fb4777eca1af11f19a56ed5b684f684d-20260827
X-CID-CACHE: Type:Local,Time:202608270828+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:418e6f96-9601-4adb-8013-cdd6ffcece4f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:7db8b62,CLOUDID:537ccb60ea429f4a8a6e81242d2c0f82,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:2,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fb4777eca1af11f19a56ed5b684f684d-20260827
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 720418440; Thu, 27 Aug 2026 08:41:03 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	andy@kernel.org,
	geert@linux-m68k.org,
	fourier.thomas@gmail.com,
	bhelgaas@google.com,
	u.kleine-koenig@baylibre.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] auxdisplay: arm-charlcd: Use DEFINE_SIMPLE_DEV_PM_OPS for power management
Date: Thu, 27 Aug 2026 08:40:48 +0800
Message-Id: <20260827004048.2817485-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manually defined dev_pm_ops structure with the
DEFINE_SIMPLE_DEV_PM_OPS macro to simplify the power management
code, pm_sleep_ptr() to safely drop the references without
triggering compiler warnings. This macro automatically handles
CONFIG_PM_SLEEP configuration and generates freeze/thaw/poweroff/restore
callbacks, reducing boilerplate code.

Signed-off-by: Li Jun <lijun01@kylinos.cn>

---
Changes:
-Replace SIMPLE_DEV_PM_OPS() in v1 v2 with DEFINE_SIMPLE_DEV_PM_OPS() for pm.
-Corrected grammar errors in v1 v3 comment.
-Add a description of pm_sleep_ptr() in v5.
-Add pm_sleep_ptr(&charlcd_pm_ops) for charlcd_driver.
---
 drivers/auxdisplay/arm-charlcd.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/auxdisplay/arm-charlcd.c b/drivers/auxdisplay/arm-charlcd.c
index 70efda4f767e..ea684f3446c3 100644
--- a/drivers/auxdisplay/arm-charlcd.c
+++ b/drivers/auxdisplay/arm-charlcd.c
@@ -306,10 +306,7 @@ static int charlcd_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops charlcd_pm_ops = {
-	.suspend = charlcd_suspend,
-	.resume = charlcd_resume,
-};
+static DEFINE_SIMPLE_DEV_PM_OPS(charlcd_pm_ops, charlcd_suspend, charlcd_resume);
 
 static const struct of_device_id charlcd_match[] = {
 	{ .compatible = "arm,versatile-lcd", },
@@ -319,7 +316,7 @@ static const struct of_device_id charlcd_match[] = {
 static struct platform_driver charlcd_driver = {
 	.driver = {
 		.name = DRIVERNAME,
-		.pm = &charlcd_pm_ops,
+		.pm = pm_sleep_ptr(&charlcd_pm_ops),
 		.suppress_bind_attrs = true,
 		.of_match_table = charlcd_match,
 	},
-- 
2.25.1

