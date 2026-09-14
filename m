Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF24447806;
	Mon, 14 Sep 2026 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387111; cv=none; b=S1K/lrlZ9xgzVos/vaMZC3duvmVt1egIjj1RfZAX3LQlVP+9DkP2t0csvjIQz7ao1ScQXLEMZCGYcV32mSQoZYPLgN3PSFT3E1kFAEaTM+f4j1Evf91uDWgs2F2L4Uh2lu7kaj97LKfExRE6tQBGE7YvVPXIPWGr9uKKTYKTZ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387111; c=relaxed/simple;
	bh=6EHds//n4+NFmxl71I9PCgmjYbS9lTfCOyADVHqg2XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPwo5D+dwSDW4j7FaMjpp+BwEmyNvv01VqR6QW0awgkwG3zgIEFQsuY25bG0Tgcw1Mq+VxPKqO3d8IFJU676R+GWR7x9tF/DEisJgZw6Avm3FSkcTbeDmus4TdozfQBq0nKXoQILIlGZW1TUWzjvxBnqDqCQHjwPS4oy5KWdC34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=n+w8xU/3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n+w8xU/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789387103;
	bh=6EHds//n4+NFmxl71I9PCgmjYbS9lTfCOyADVHqg2XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n+w8xU/3wYcBsIH8YYH+TPjzVvO/U//6nkBacIDaKMNd/pBdeKRC57ST2v705dMU0
	 pmMBq+e4EdMU09IbakOHGy7J0Mrr13MXhmWeEwp+psqEiVHOQbuVlydZObNm0R5ZBO
	 TYTl+PrZw326+Zhz9YRkMGG9ZqXaQgjj2cWNYRb7RbXlr1LD9kgKYVl1y5mp21FoYy
	 CUB/7RQpq+DEYjzkNR/cWbiMbEYWu6Tqb3jNGkjW0f370yxYPajev9TPT0VzEBPApq
	 Se/XYnHCzIr0r5q00t4ikEupwsbwaXNdt+PFEz8mkzoSzgxUgnuV+ZFc5QqvGCMOzi
	 MUyyvjAYOLrOA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E89017E0D7F;
	Mon, 14 Sep 2026 13:58:22 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v7 08/13] drm/mediatek: mtk_dsi: Add support for MT8189
Date: Mon, 14 Sep 2026 13:58:07 +0200
Message-ID: <20260914115812.22751-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
References: <20260914115812.22751-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the DSI IP found in the MT8189 SoC: this one is
similar to the IPs found in the most recent already supported SoCs
with the only difference being that it supports a higher link rate
of 2.5Gbps instead of 1.5Gbps.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index bd2d17017bd2..08f6be311dd1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -826,6 +826,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8188-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8189-dsi",
+	  .data = (void *)MTK_DSI },
 	{ }
 };
 
-- 
2.55.0

