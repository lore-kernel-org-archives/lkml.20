Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D0A45198A
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791056906; cv=none; b=Ru0Rnr0sA95krXDaKmUclf3bTMGnqWmz+IhIdzpfYwH4THsprwcOVM0J9D1qhFrMhakm6U3iIij75nChXzLwLw5UYkSw1x+8oHcP3968uRepeoarJx76Pl5bY0A7OxE3aMxbr6SlwL8WtcAXnrgQf5uBFRrb2WN/WhEwHsZiQR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791056906; c=relaxed/simple;
	bh=dpK5EQ/O9a+lxpOGZYiCNO0KEG154xq1ut8idgTMEgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mktJoMIzYfrcQf4GhM/UpIJRC0M9WYXn0OlxcvEMJoJc+DRSUSCAra0gWtfG2x1vic/Z8OyjnfMTpNjDnEjh9J751xI1jX1vrcwLKGvcIoYuZ4OJCTkd8orabIaugzYACrmUg/D7MOQWobL30aQAor9UvXIUF5EZmtKOZ7dW9D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=wIkzRjuc; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="wIkzRjuc"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791056902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HraEEpEdGVBYWTLlBqG2kmzgWAR+SK/1EVJ+uvOgSpY=;
	b=wIkzRjucwI/Q3t/e3cn/+zZMST/g8VusHITpgQ4TDb6Qx+SCPp4DHd/VX6q+C30NwCmeBy
	pu8FtUKJOlVzOFvbmRxkdrpljIbB8L0MrGWLU9UAAGeegd7slaJErJHW/S+y/I9fsKJn/M
	tcJ5NAlY/yL3lZHwthVJKL79UuVmzbcPzw/T+eAnhiNE342kJRhjmi0zvXryK4M4bN04sN
	8QY/Ziw8twCYLxyrETSh3+BG5vkGSCJqGV+/FYhLirEe0FgzddpRMDO3BrEQuvSSLmSUWD
	bQ11j2/aFoJQNIbPdHuEpuQrNL5vgiTYZGiucEdijMryMVCZh89rC+6M+40bLw==
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH] drm/panfrost: Unprepare clocks on system suspend
Date: Sat,  3 Oct 2026 21:48:20 +0200
Message-ID: <20261003194820.840641-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With GPU_PM_CLK_DIS, system suspend only disables the GPU clocks, which
leaves them prepared. Some providers power a clock down only in
unprepare: MediaTek PLLs are switched off in mtk_pll_unprepare(). On
MT8188 this keeps MFGPLL running through suspend, and TF-A refuses the
26 MHz-off state because of it:

  suspend: bus26m total blocked = 0x40040000

The SoC then only reaches a shallower sleep state, never signals sleep
to the EC, and the EC reports a sleep hang and wakes the system.

Use clk_disable_unprepare() on suspend and clk_prepare_enable() on
resume. Both run in process context, so preparing is allowed.

Fixes: 56e76c017918 ("drm/panfrost: Implement ability to turn on/off GPU clocks in suspend")
Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 485349faf2511..3f1a8109a79a4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -507,12 +507,12 @@ static int panfrost_device_resume(struct device *dev)
 	}
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
-		ret = clk_enable(pfdev->clock);
+		ret = clk_prepare_enable(pfdev->clock);
 		if (ret)
 			goto err_clk;
 
 		if (pfdev->bus_clock) {
-			ret = clk_enable(pfdev->bus_clock);
+			ret = clk_prepare_enable(pfdev->bus_clock);
 			if (ret)
 				goto err_bus_clk;
 		}
@@ -526,10 +526,10 @@ static int panfrost_device_resume(struct device *dev)
 
 err_resume:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_clock)
-		clk_disable(pfdev->bus_clock);
+		clk_disable_unprepare(pfdev->bus_clock);
 err_bus_clk:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
-		clk_disable(pfdev->clock);
+		clk_disable_unprepare(pfdev->clock);
 err_clk:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_VREG_OFF))
 		dev_pm_opp_set_opp(dev, NULL);
@@ -545,11 +545,15 @@ static int panfrost_device_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	/*
+	 * Unprepare as well: some clock providers, e.g. MediaTek PLLs, only
+	 * power down in unprepare, and a running GPU PLL blocks system sleep.
+	 */
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
 		if (pfdev->bus_clock)
-			clk_disable(pfdev->bus_clock);
+			clk_disable_unprepare(pfdev->bus_clock);
 
-		clk_disable(pfdev->clock);
+		clk_disable_unprepare(pfdev->clock);
 	}
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_VREG_OFF))

base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
-- 
2.55.0

