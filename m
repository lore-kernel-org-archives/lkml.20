Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC76550DC7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956802; cv=none; b=My5dnuvjeR5xybfF9dFyU1Aacir2RqjLOL/XsKScAbTfL+o2GZ9XuH4kTS6euQ0+pM9OWp1tPqUPfcEyeY47NzYOeMbKYlu25PPc1rNHCgh16SZyqzoZxneKagCfIXKoMhid9GEsomkRmNeUSYK+pGrUpANjIvuZ4iu39Dp2OPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956802; c=relaxed/simple;
	bh=uvA6GvMpPW0fQ0EZ28xRo1FkC/RVZzWGXpGEHPeNWvc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TC5xZ3e72rht3T3H71HpA1TWWfzJ8ZHJN3rfw5QfMWj0JG657AoI93nSk23AE3T18v1C+DBg8P5FZHouTDcEp6I4PA94DMv2H0KmS6skK3/06wbbDsgA3LSFLjjPE8Q+BKX9hfuKi/zdmXOnitX+g0nwlV1CsoCzhgqA9hNG8QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b1d520baac4911f19a56ed5b684f684d-20260909
X-CID-CACHE: Type:Local,Time:202609091934+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:84d869d0-09e5-4e49-a498-7bc6c83b2e9a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:ac8830c64cb0a11c555b75bd55872250,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:-3,I
	P:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b1d520baac4911f19a56ed5b684f684d-20260909
X-User: zenghongling@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <zenghongling@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 138356991; Wed, 09 Sep 2026 20:26:34 +0800
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
Subject: [PATCH v8 0/4] phy: ti-pipe3: Fix clock resource handling issues
Date: Wed,  9 Sep 2026 20:26:26 +0800
Message-Id: <20260909122630.1313205-1-zenghongling@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes multiple clock resource handling issues in the
ti-pipe3 PHY driver.

Patch 1 fixes a critical issue where ti_pipe3_init() was ignoring the
return value of ti_pipe3_enable_clocks(), which could lead to unclocked
hardware access and unbalanced clock disables.

Patch 2 fixes a clock resource leak when probe fails after enabling
the SATA refclk. The error path now properly disables the clock and
cleans up runtime PM resources.

Patch 3 fixes EPROBE_DEFER handling to prevent masking probe deferral
errors. It uses devm_clk_get_optional() for SATA refclk to properly
handle optional clocks while still propagating -EPROBE_DEFER and other
error codes.

Patch 4 fixes a clock leak in the init error path when regmap_update_bits()
fails in PCIe mode, adding proper clock cleanup consistent with other
error paths.

These fixes ensure proper resource cleanup on probe and init failures,
and prevent permanent driver initialization failures due to incorrect
error handling.

Hongling Zeng (4):
  phy: ti-pipe3: Fix ignored clock enable return value in init
  phy: ti: pipe3: Fix clock resource leak on probe errors
  phy: ti-pipe3: Fix EPROBE_DEFER handling for clock resources
  phy: ti-pipe3: Fix clock leak in init error path

 drivers/phy/ti/phy-ti-pipe3.c | 58 ++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 12 deletions(-)

--
2.25.1
