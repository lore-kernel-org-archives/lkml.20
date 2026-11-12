Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467825;
	b=KKdDLopAw4yHE8ZOo7a/HjPN+1L8JO4Y3l6+Jx3Vm5S4UTC59MZkMstUFShsfoMwtQlQ
	 Mkjs36mIw/ZUWkq3Z0FPT+kL1pk8f4ZtxDL9AsfyAAzqQzoR8HlSnwLYROeoZP5X4oDUF
	 HaFvAIYYN/3R/DMEXX+1uzL1WdiNBzqJKpfDvi2tQY5h8e0XuKNdApfWAnlP6TqpRFABX
	 VHhwPlX60rYzlN1EUzgR1mTBOIVvMnHx8Po5oVqHFkViYm7eUe9+dR/Gr9AAPfduYYSHW
	 b35I0Hz/Iyu6iK9OGJczJncTacWcTsBehK3TdSEShTQBayS7sq85eoo0K52/Ti54K4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467825;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3iqRR19uU32j8I8V4oRDv2c+hS8Eg989Vpr5g8aThUk=;
	b=F2Oo1ZVJubYxn2mOPCjy+3qSD6pbMSa8RupP/sj4XaRSPesPQKQ9DchX5ux1j+YhLN0H
	 8+SzFxBdS50V5ODn6ija5Y9UuKKNi8mI0BQtGy6BMa0SnVFqi7SyIDG+J4WotNX1Lhxl2
	 oQKFOaeQT1xlWqhqThh5bR8kUQNTEFHkAqJxB+VmX4/x9uZDFSt6MhJk0rBy4fPj9tY+V
	 r/g9SPdpB902cHsfA36U4Qiccr8bAe4MKZ1wBAa1zXWMt194p2KwbHg4PplnIHOM7UzeE
	 HkDnXDoRFU08kQOWBi8DSTPIZHi+y8HUiNuicL6KWnaZ4lHJSi1dD4U1sZTmtoi+xDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Bwu8gnLa;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF63760A2604
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF63760A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Bwu8gnLa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Bwu8gnLaF/5uqKROlTVzrWRao1OHGqCrnYBKvpGXGmYHo6gZP5A3HcV1okW/xTRLnWglysak91md/
	 NPLKk33Jrexkx9GgDTIAnD0RYPlf+9FD93MnP0r8ta+e92vTESNX9XOwXqJ5EhvIt8oNROS+xS2qIa
	 MfK/mZMv6b5eEC6A=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af567ec2f3-1b26d;
	Thu, 12 Nov 2026 15:17:03 +0800 (CST)
X-RM-TRANSID:2ee26af567ec2f3-1b26d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af567ee524-f6923;
	Thu, 12 Nov 2026 15:17:03 +0800 (CST)
X-RM-TRANSID:2ee86af567ee524-f6923
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: dinguyen@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] firmware: stratix10-svc: Keep the firmware node referenced during init
Date: Thu, 12 Nov 2026 15:17:02 +0800
Message-ID: <20261112071702.154496-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

of_find_matching_node() releases its starting-node reference while
walking the tree. stratix10_svc_init() passes fw_np as that starting
node and later reuses it for of_platform_populate() without retaining
a reference of its own.

Give the iterator a separate reference and keep the firmware lookup
reference until initialization finishes. Use scoped cleanup to also
release it on the no-match and population-error paths.

Fixes: 7ca5ce896524 ("firmware: add Intel Stratix10 service layer driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/firmware/stratix10-svc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index ef9d39c9ff01..0df1786b2e51 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -2589,15 +2589,15 @@ static struct platform_driver stratix10_svc_driver = {
 
 static int __init stratix10_svc_init(void)
 {
-	struct device_node *fw_np;
+	struct device_node *fw_np __free(device_node) =
+		of_find_node_by_name(NULL, "firmware");
 	struct device_node *np;
 	int ret;
 
-	fw_np = of_find_node_by_name(NULL, "firmware");
 	if (!fw_np)
 		return -ENODEV;
 
-	np = of_find_matching_node(fw_np, stratix10_svc_drv_match);
+	np = of_find_matching_node(of_node_get(fw_np), stratix10_svc_drv_match);
 	if (!np)
 		return -ENODEV;
 
-- 
2.51.0



