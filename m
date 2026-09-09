Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF065476E8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953689; cv=none; b=K/vDsh/CTnqjNEPucfbNgVxBjX6+lOAO63IDLTjZXK6sHUiq3+KodiFuZb8VsI9P1u8vxbAJ4oNkmWQ9rRDG0KnQofa4B9UBs5o5pesY4JzPrW1im3FU718a8/PAbmC5Wu/uib0lcWT4uils7DeXS4Yo7phc5kc0ovxQvu68QyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953689; c=relaxed/simple;
	bh=i5rCAJJ4lUM5B9U8gdhmC7pi1ZkpSlnHKxSnEv/K5Sk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b7cNpQJBC4yb/E4XMUJK9zqW52sj7+KXzGqGzvYiowNqBxF2wzWSrRHEWPjIdlitc3zFWCU2Y32CEz2r5c/fse/duAgdfhDOyfSlwlD+QtG6m08t7fAut3sRz+oXawm/iCImCsSrSqxtFmi0tkcqgDhUGh6GAkV6Aa4RVmTHpp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7185dec0ac4211f19a56ed5b684f684d-20260909
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7454ac3d-e036-453f-ba46-7eae63bbf16e,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:6319cc90a138abd1a3945b5be689e5f6,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7185dec0ac4211f19a56ed5b684f684d-20260909
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 274181624; Wed, 09 Sep 2026 19:34:39 +0800
From: Hongling Zeng <zenghongling@kylinos.cn>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	johan@kernel.org,
	kishon@kernel.org,
	rogerq@ti.com
Cc: linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhongling0719@126.com,
	Hongling Zeng <zenghongling@kylinos.cn>
Subject: [PATCH v7 3/4] phy: ti-pipe3: Fix EPROBE_DEFER handling for clock  resources
Date: Wed,  9 Sep 2026 19:34:32 +0800
Message-Id: <20260909113433.1287454-4-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260909113433.1287454-1-zenghongling@kylinos.cn>
References: <20260909113433.1287454-1-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ti_pipe3_get_clk() has two issues with -EPROBE_DEFER error handling:

1. When devm_clk_get() for sysclk fails, the function returns -EINVAL
   instead of propagating the actual error code. This masks -EPROBE_DEFER
   to -EINVAL, breaking the probe deferral mechanism and causing permanent
   driver initialization failure on systems with non-deterministic probe
   ordering.

2. For SATA PHY refclk, the function ignores all errors to support older
   DTBs missing the refclk property. However, this incorrectly ignores
   -EPROBE_DEFER as well, causing the driver to proceed without waiting
   for the clock provider to become available.

Fix both issues:
- Return PTR_ERR(phy->sys_clk) instead of -EINVAL to propagate all
  error codes including -EPROBE_DEFER
- Use devm_clk_get_optional() for SATA refclk to handle optional
  clocks while propagating -EPROBE_DEFER and other errors

Fixes: a70143bbef6b ("drivers: phy: usb3/pipe3: Adapt pipe3 driver to Generic PHY Framework")
Fixes: 7f33912d2978 ("phy: ti-pipe3: Fix SATA across suspend/resume")
Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
---
Change in v7:
 -Use dev_err_probe() for refclk and sysclk acquisition failures.
---
 drivers/phy/ti/phy-ti-pipe3.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
index 021657cbce48..a67f5da43c83 100644
--- a/drivers/phy/ti/phy-ti-pipe3.c
+++ b/drivers/phy/ti/phy-ti-pipe3.c
@@ -608,14 +608,21 @@ static int ti_pipe3_get_clk(struct ti_pipe3 *phy)
 	struct clk *clk;
 	struct device *dev = phy->dev;
 
-	phy->refclk = devm_clk_get(dev, "refclk");
+	/*
+	 * refclk is optional for SATA PHY to support older DTBs, but
+	 * required for other modes. Use devm_clk_get_optional() for SATA
+	 * which returns NULL for -ENOENT, allowing us to propagate all
+	 * other errors including -EPROBE_DEFER.
+	 */
+	if (phy->mode == PIPE3_MODE_SATA)
+		phy->refclk = devm_clk_get_optional(dev, "refclk");
+	else
+		phy->refclk = devm_clk_get(dev, "refclk");
+
 	if (IS_ERR(phy->refclk)) {
 		dev_err(dev, "unable to get refclk\n");
-		/* older DTBs have missing refclk in SATA PHY
-		 * so don't bail out in case of SATA PHY.
-		 */
-		if (phy->mode != PIPE3_MODE_SATA)
-			return PTR_ERR(phy->refclk);
+		return dev_err_probe(dev, PTR_ERR(phy->refclk),
+				"unable to get refclk\n");
 	}
 
 	if (phy->mode != PIPE3_MODE_SATA) {
@@ -631,8 +638,8 @@ static int ti_pipe3_get_clk(struct ti_pipe3 *phy)
 	if (phy->mode != PIPE3_MODE_PCIE || phy->phy_power_syscon) {
 		phy->sys_clk = devm_clk_get(dev, "sysclk");
 		if (IS_ERR(phy->sys_clk)) {
-			dev_err(dev, "unable to get sysclk\n");
-			return -EINVAL;
+			return dev_err_probe(dev, PTR_ERR(phy->sys_clk),
+					"unable to get sysclk\n");
 		}
 	}
 
-- 
2.25.1

