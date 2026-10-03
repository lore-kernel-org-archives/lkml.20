Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C1F31A572;
	Sat,  3 Oct 2026 20:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057703; cv=none; b=QNC/ccYCRIHrIKOqaW/4bgYVqSTG2KF3misgpsUp/CqhiDJPlW4srjJcE9lVecSA2UH1+ct7growmyCCNxpX9Nm4jZ1yJKXRoDT1vS3nA5iseiC98pOGRKzZpn+yb0pcHQPiSvKvT4W3HOIbrimQsbMqQEEChM9VbgOl9Jv0GSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057703; c=relaxed/simple;
	bh=oY5tiLHUC/1FnTeMPIEbtRV7x6N8w3ZJ21Vr3ALyPbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j7TR69FyN0oqYpk5w18N65zq5GLfLoJVP6UeC8cFojP1dbLT4Zd4Jlrp/g3HnJ53shTVpfsrpU0LinuEJ8b/yjEyTC7+XlXVIPs4eIB0kpkXqhPuKgEc1OZRoP8atoihvzIfBtOlmWGlkrnsnW9VnQNsUsWH+LUeugCe/yukKzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=zgkxqL8p; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="zgkxqL8p"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791057696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aD28cj3L4bP16bv1SX5AbEY1u/TeDOJmTI3lqvzpdB0=;
	b=zgkxqL8pm7Y0xGAGOr4pq7/MAekzWZvjKJUmlQTrCA1jtbY2tB6voTZaoLojnKt9Ort18a
	O+j0hNRpC4aSSkWvaovUfvdyjQg8Gj1Cxo91SUbRrTcms7/h+MuHqHY0WxHHvYc35TnzSz
	UtQi2Rd7SQZb0zfyKh3PKvP2cvgkHFMLr0djytusbHpm5VKIj0zmpzZAAforcHSaVx39mW
	b52PsRR8ChhHgJESto11dTWQCqZ86tI2Sw4PRlh1Eniz7WY6jVU22ChrflwrSr6qSmPDqQ
	ZTZwcHS1pi0ibRXLxgl/gXC6Y7/TVPfPmFwI4YUpG3cy6FANGFnYuLRFdSz69g==
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 2/3] drm/panfrost: Enable the GPU timestamp counter on MT8188
Date: Sat,  3 Oct 2026 22:01:31 +0200
Message-ID: <20261003200132.866240-3-michal@nozomi.space>
In-Reply-To: <20261003200132.866240-1-michal@nozomi.space>
References: <20261003200132.866240-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On MediaTek SoCs the GPU timestamp counter is fed by the SoC system timer
only once the TOP_TSVALUEB enable bits are set in the MFGCFG block. The
setting is lost whenever the GPU power domain is turned off.

Without it, GPU_TIMESTAMP reads zero, so the SYSTEM_TIMESTAMP query and
timestamps written by jobs are always zero, which breaks timestamp
queries in userspace drivers.

Look up the MFGCFG block from the mediatek,mfgcfg phandle and set the
bits from the vendor quirk hook, which runs on every power-up, as the
downstream kbase driver does. Without the phandle nothing changes.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  1 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 39 ++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  1 +
 4 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 1fe1554f2652b..0a73939a023c3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -134,6 +134,7 @@ struct panfrost_device {
 	int mmu_irq;
 
 	void __iomem *iomem;
+	struct regmap *mtk_mfgcfg;
 	struct clk *clock;
 	struct clk *bus_clock;
 	struct clk *bus_ace_clock;
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 70c05210ea846..e811652e2384d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -1133,6 +1133,7 @@ static const struct panfrost_compatible mediatek_mt8188_data = {
 	.pm_domain_names = mediatek_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
+	.vendor_quirk = panfrost_gpu_mt8188_quirk,
 };
 
 static const struct panfrost_compatible mediatek_mt8192_data = {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 29ac0dce5ff89..971abc9cc222c 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -9,8 +9,11 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 
 #include <drm/drm_print.h>
 
@@ -114,6 +117,40 @@ void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev)
 	gpu_write(pfdev, GPU_PWR_OVERRIDE1, 0xfff | (0x20 << 16));
 }
 
+#define MTK_MFG_TIMESTAMP			0x130
+#define   MTK_MFG_TIMESTAMP_TOP_TSVALUEB_EN	0x3
+
+void panfrost_gpu_mt8188_quirk(struct panfrost_device *pfdev)
+{
+	/*
+	 * The GPU timestamp counter only counts once MFGCFG routes the SoC
+	 * system timer to it. The setting is lost whenever the GPU power
+	 * domain is turned off, so it has to be restored on every power-up.
+	 */
+	if (pfdev->mtk_mfgcfg)
+		regmap_write(pfdev->mtk_mfgcfg, MTK_MFG_TIMESTAMP,
+			     MTK_MFG_TIMESTAMP_TOP_TSVALUEB_EN);
+}
+
+static void panfrost_gpu_get_mtk_mfgcfg(struct panfrost_device *pfdev)
+{
+	struct device_node *np;
+	struct regmap *regmap;
+
+	np = of_parse_phandle(pfdev->base.dev->of_node, "mediatek,mfgcfg", 0);
+	if (!np)
+		return;
+
+	regmap = device_node_to_regmap(np);
+	of_node_put(np);
+	if (IS_ERR(regmap)) {
+		dev_warn(pfdev->base.dev, "failed to get MFGCFG: %pe\n", regmap);
+		return;
+	}
+
+	pfdev->mtk_mfgcfg = regmap;
+}
+
 static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
 {
 	u32 quirks = 0;
@@ -519,6 +556,8 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
 {
 	int err;
 
+	panfrost_gpu_get_mtk_mfgcfg(pfdev);
+
 	err = panfrost_gpu_soft_reset(pfdev);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index b4fef11211d5f..2b974576b96e9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -23,5 +23,6 @@ unsigned long long panfrost_cycle_counter_read(struct panfrost_device *pfdev);
 unsigned long long panfrost_timestamp_read(struct panfrost_device *pfdev);
 
 void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev);
+void panfrost_gpu_mt8188_quirk(struct panfrost_device *pfdev);
 
 #endif
-- 
2.55.0

