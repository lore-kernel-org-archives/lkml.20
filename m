Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBAE5476D7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956803; cv=none; b=pphFjpI0d7AIzmlcShg9ZwvNJmC0664Td99F+CRUjfEeqwmE61FO66fVyj6EHKW5DAkK2vbgU+gO13Kr8lOZDMvSXrOsApCmH0R4xdbQw3VkSQ/RlGi8EUdahiEb2tXGhh6YBRbGazgLEguREzq1V1eSfrtcDHVWWCUv/GDzou8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956803; c=relaxed/simple;
	bh=QjmgqkyuPd5234D+NIzIfiwis45KG+5r/CGlxn04BUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qk4mW7j3i/GnesYlcypu8b4QpttHQ9Yy3JG5XDODIGtlIWbqsRz/zGmZxLMe5GwctzPpCdmu518ZJ42A+ufepd4TOo9/qzo2/g2n7c3L6DkL65C0jEh9vL18s5p6sN3Uf6Of/qOtAbN2puLVbR2bPVbD095J6rtYcGmPOaPukbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b23b6a64ac4911f19a56ed5b684f684d-20260909
X-CID-CACHE: Type:Local,Time:202609091934+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9bf18910-64af-4589-9f46-c444e561145c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:6ddb920411906f269bd75c585bf675a1,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b23b6a64ac4911f19a56ed5b684f684d-20260909
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1052706627; Wed, 09 Sep 2026 20:26:34 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	johan@kernel.org,
	kishon@kernel.org,
	rogerq@ti.com
Cc: linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Sashiko AI <sashiko@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v8 1/4] phy: ti-pipe3: Fix ignored clock enable return value  in init
Date: Wed,  9 Sep 2026 20:26:27 +0800
Message-Id: <20260909122630.1313205-2-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260909122630.1313205-1-zenghongling@kylinos.cn>
References: <20260909122630.1313205-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ti_pipe3_init() ignores the return value of ti_pipe3_enable_clocks(),
which can lead to:

1. Unclocked hardware access if clock enable fails
2. Unbalanced clock disables in error paths

ti_pipe3_enable_clocks() returns an error code when clock enable fails
and rolls back any partially enabled clocks. If we ignore this error
and continue, we access hardware without proper clocking, which can
cause bus errors.

Additionally, if we reach error paths later in the function and call
ti_pipe3_disable_clocks(), we'll be disabling already-disabled clocks,
causing unbalanced disable warnings.

Fix this by checking the return value of ti_pipe3_enable_clocks()
and returning early if it fails.

Fixes: 234738ea3390 ("phy: ti-pipe3: move clk initialization to a separate function")
Reported-by: Sashiko AI <sashiko@kernel.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
Change in v7:
 -Remove the now-redundant initialization of ret, as suggested by Mani.
---
 drivers/phy/ti/phy-ti-pipe3.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
index b5543b5c674c..0e3bc9218733 100644
--- a/drivers/phy/ti/phy-ti-pipe3.c
+++ b/drivers/phy/ti/phy-ti-pipe3.c
@@ -498,9 +498,12 @@ static int ti_pipe3_init(struct phy *x)
 {
 	struct ti_pipe3 *phy = phy_get_drvdata(x);
 	u32 val;
-	int ret = 0;
+	int ret;
+
+	ret = ti_pipe3_enable_clocks(phy);
+	if (ret)
+		return ret;
 
-	ti_pipe3_enable_clocks(phy);
 	/*
 	 * Set pcie_pcs register to 0x96 for proper functioning of phy
 	 * as recommended in AM572x TRM SPRUHZ6, section 18.5.2.2, table
-- 
2.25.1

