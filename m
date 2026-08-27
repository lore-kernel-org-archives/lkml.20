Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C1D367B74
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862806; cv=none; b=UQmGedSV9bOlz5Ql8DFREAssaAsZxjqeJQzUkUylgpgfPk9KFolRYwxvl4rc3K3DK3wkAcrsV0/3SWAiqA/GUYUBr8qv1mm5WgCNU7UXWky8PFLVQXH0hERohO7g+z/GSBO8S5hYHduN4hn6saSVh8gCADnu1E8ez51vmjdHVj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862806; c=relaxed/simple;
	bh=sQuQlp8R4ysVl7cElEjleVyXLS1sFHFr38pDZK4MvYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WnpnHCwFT0n8AxVjX3YVL6PJAmES7PTKZN59fxDWP7a5mVdA52AbOtTtHSdlL2dPUL7LOCod7drwLjVlrpAIo9b9T7gAT/DV6MvjFnT2UhQZKJNwizpHPrgMqoQgNuC7pIvOQimh/QrSeXRx6djqJyin3Yru4CBXhyd00Onpmi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVgsmmQQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVgsmmQQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C011F000E9;
	Thu, 27 Aug 2026 20:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787862800;
	bh=hzR9RLCyU76G62Dq90oauFYiDU2TqRfYxKeKOLu97co=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MVgsmmQQN6NIEXxq8eit9LyVhsZST9szrbp5fKhPIlVqHqfuXgLI6/REQXxzdo1Xl
	 yjy4jT1offVOLnZz+NPWnQW0AU1s3LURwQ1OQVZwdFLJ9ycLXuWv7eCfCd9tN26tZ2
	 P2KsFDK6fPhTiZXqc8ICFQuov/HUmdab5TiiFXD0LoF0vWqqSIdkzUvUdJg8uN/WxE
	 +hA87C/xJlQlJfzbmIG5sMc6CnkyBk5bDf1hx2xr6zbvhQksuicL82oMQDsMmBOuBJ
	 hwTbqNh4DQjfzDIIIaU3OyRltCOoyduhgsg4mkxfuKZqQYGo/ZfbwwROwinexQOj2G
	 rOXES/Qp5928A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 27 Aug 2026 15:33:03 -0500
Subject: [PATCH 04/11] accel: ethosu: Ensure SRAM size is 0 on mapping
 failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-ethosu-fixes-v1-4-346f9ea8791c@kernel.org>
References: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
In-Reply-To: <20260827-ethosu-fixes-v1-0-346f9ea8791c@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

On a mapping failure of the SRAM, the SRAM size is left as non-zero. The
probe will succeed as the error return is not checked since having SRAM is
not a hard requirement. The non-zero size allows jobs to access SRAM which
is left pointing to physical base address 0x0.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/accel/ethosu/ethosu_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
index d121fb0d7732..f1af7b3ea038 100644
--- a/drivers/accel/ethosu/ethosu_drv.c
+++ b/drivers/accel/ethosu/ethosu_drv.c
@@ -281,8 +281,6 @@ static int ethosu_device_suspend(struct device *dev)
 
 static int ethosu_sram_init(struct ethosu_device *ethosudev)
 {
-	ethosudev->npu_info.sram_size = 0;
-
 	ethosudev->srampool = of_gen_pool_get(ethosudev->base.dev->of_node, "sram", 0);
 	if (!ethosudev->srampool)
 		return 0;
@@ -293,6 +291,7 @@ static int ethosu_sram_init(struct ethosu_device *ethosudev)
 							     ethosudev->npu_info.sram_size,
 							     &ethosudev->sramphys);
 	if (!ethosudev->sram) {
+		ethosudev->npu_info.sram_size = 0;
 		dev_err(ethosudev->base.dev, "failed to allocate from SRAM pool\n");
 		return -ENOMEM;
 	}

-- 
2.53.0

