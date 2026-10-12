Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA751429825
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816531; cv=pass; b=Fh7zH1MKBaNbgt0e9md3u9uzC+vjPhqByoHMxtz7qDLI6ZsxBnpX7lC9zDi/jkgRyEDFPFlokRAecFJQZBUpNrDSqUlurmoystZ2+0+QfPY3C6j3wGRV5E114RnK9plgj3hWbGHAU3juoIx2RHNQ3h8+OzKzrX+XZvG9nW1FcE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816531; c=relaxed/simple;
	bh=lnZA3WBfFFBXieQiXa+jWZXXOpFpf8LSvl0zyNsSIDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjM1IJhJ5pgwCZnisEi696IuH8tNc75Rv3+4oOeUqA5pyVXs6BueQNtTTWClXQTYPx1YKY6Gl9W3LXn0RJygyh9G7DwXTrN7FEZKw8Ts1DE1k0s1VW6+GGooVQKJPRfJaMCUTGQss6ehQIhQHIKOJJDvwxqWHNsaVuBbQCS9nfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=Prr7eADW; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Prr7eADW"
ARC-Seal: i=1; a=rsa-sha256; t=1791816504; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HqlF2hm9KlrRgs9WgIAw8hLiEdmgrFoavirKzhBbaqa2W5TvrP2LhZil2c4O/4019NPfbZ2ihseZ08OPKWCqcZjhangPxdYx4FDpeu4OQvy7+0mlf08luIjhabvPDNU51NtA3wcI8o+1/hFZVajAk9vUquYTOCdYCj6OS+IhUmA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791816504; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Cz7nlaO9ug15k4wyc2p1bB4V9NQP7yWcZzYPbXi+vXY=; 
	b=GA0UhGmANqVoUPNhON5n/1ID8qsLkg9JYzU8MhIzOuZ+0xTDuLvewraL4otK3lqXZ6oBcELU8OP+HY9bOADmQy8nzwXo/ChOAXugmMHZ0igbKRDSJL4zV9rYsPyQl5hqhR5bBgR/ZQpIrO2FkA4qMHyMwp0TioozYpVl1akyxpo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791816504;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Cz7nlaO9ug15k4wyc2p1bB4V9NQP7yWcZzYPbXi+vXY=;
	b=Prr7eADWnXBLkB7g6K1lDWZnK1sUG62VJbALJf5/dOZ6jVGIJkdpTabYK0m84egx
	ypNBZl3Yn0WbU99nrOUKGNDBBmlmLbiP90Aj0ekbzkgMyBo9zckQEcH8HIB5wVFiRTi
	29zL2Xa3PPMzQyZVcAgnfhwfFLzTo3i74PeDpyDE=
Received: by smtp.zohomail.com with SMTPS id 1791816503460190.88284386386567;
	Mon, 12 Oct 2026 07:48:23 -0700 (PDT)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Date: Mon, 12 Oct 2026 15:47:56 +0100
Subject: [PATCH v15 04/15] drm/panfrost: Skip NULL checks for clock
 enable/disabling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261012-claude-fixes-v15-4-bc0a6c498553@collabora.com>
References: <20261012-claude-fixes-v15-0-bc0a6c498553@collabora.com>
In-Reply-To: <20261012-claude-fixes-v15-0-bc0a6c498553@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 "Marty E. Plummer" <hanetzer@startmail.com>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Eric Anholt <eric@anholt.net>, 
 Robin Murphy <robin.murphy@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Collabora Kernel Team <kernel@collabora.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=lnZA3WBfFFBXieQiXa+jWZXXOpFpf8LSvl0zyNsSIDw=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqzPMafxNGkfH0L267PtL+uUAH/Lms6R861DCoH
 /cZT5UMtCWJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaszzGgAKCRAOJn5M7lND
 PQGCDAC8R1euhuNek7WtIQ2XQFsK/Y4zsYdhXgK7tFQqZU1uGxHdHT1nLItLaRhlf/llyanUvTu
 0qCbwsWz8LI7XinCHErA124fNaMb1mEtojx/3PCSGX/XOWuh6JwHq3tPo/GsViPOgkXC/RkCOJ+
 +cJgUqpSxyb7gLqGeTVv31kcSRVofueNfPhCFKUG2LXU7vH3DaF01EnjH7ErlBLRglt0GAB1wEY
 X8z9hda0tFEkeBMmvQ+UZp+Qda73TuYBkX8WiBEBCe4+e2cjkgkj9Vxzj3j3YtLMGlrs/rUS2cW
 U8PdnHFq8EFJQWBpIduISl5S8F5w+GAtdcrb0PmYYttfMgZuHap42WYvJA7C4AX9Ci6HZoZOe95
 NRk6OsGmNv4SLyyGap/qjljyJdOkRLGiU61ZlK8AuCbUvyYLqzKzs9oLtFTs9PmegCckr+VpRU2
 mKb6TccqBq8jLezKNX8NDiADN9zOFe3h8aekDtF6KYFu10ao2vZyrhbXr2qTTlM8oVqaw=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

The clk_* API can deal with NULL clock objects, so we can do away with NULL
checks in client code.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 5bf528f41278..b3a53504bd01 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -510,11 +510,9 @@ static int panfrost_device_resume(struct device *dev)
 		if (ret)
 			goto err_clk;
 
-		if (pfdev->bus_clock) {
-			ret = clk_enable(pfdev->bus_clock);
-			if (ret)
-				goto err_bus_clk;
-		}
+		ret = clk_enable(pfdev->bus_clock);
+		if (ret)
+			goto err_bus_clk;
 	}
 
 	ret = pm_runtime_force_resume(dev);
@@ -524,7 +522,7 @@ static int panfrost_device_resume(struct device *dev)
 	return 0;
 
 err_resume:
-	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_clock)
+	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
 		clk_disable(pfdev->bus_clock);
 err_bus_clk:
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
@@ -545,9 +543,7 @@ static int panfrost_device_suspend(struct device *dev)
 		return ret;
 
 	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
-		if (pfdev->bus_clock)
-			clk_disable(pfdev->bus_clock);
-
+		clk_disable(pfdev->bus_clock);
 		clk_disable(pfdev->clock);
 	}
 

-- 
2.55.0

