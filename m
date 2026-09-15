Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9D7481233;
	Tue, 15 Sep 2026 08:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461743; cv=none; b=DM8mBSsb3Vd1UUB6KVl5Zs+d90CfXkCB42PF6R0qWxgNly5lJ5XjMzrrk2ovNFUZ2/2oJx3imzMpqaP0YfappSLEpP/a1bbGcpodD+hTV5MO8GsY0dwp5aWekM7TOkD8BddUBEU/SB2EXIpyq54LkuU9yyh+eKYerZ4CKA87qc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461743; c=relaxed/simple;
	bh=fTieI8NXtjf84c6bHqlL+x2GwkSSrjWo1eGphSfuE7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2aj8kbYGXJFtG8rJUcvLqoVyb9QjaS+fozwfwx5G9UmeiKo9eF+0zBtj2zxC4T53LhxLlUz2uAO74kanaZsF77OLA9nLq+FktkNx6+UGYuXy/GCnUDhi4hN9FwEysyhHFJJeziiZJR+oSWKLcsXh5xc6W4YPsbxG9YFXZoJvxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gFcdnO/9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gFcdnO/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789461737;
	bh=fTieI8NXtjf84c6bHqlL+x2GwkSSrjWo1eGphSfuE7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gFcdnO/9Sni43ITNgywyZ8NzX+2O49XhxQ/QwaxM5QuC9LvxO7YLbreALrmbBCUIl
	 Rw0HEztPkpcgaf8id3vQ1pusZ5qV+n7XimPyStoyEAFaaLbq2RXPJ70fctvm2kbiz9
	 Gj0a4dySJlfFhpkbcFc5A+/Cnp0URkrn3oNXm7P3a4EtOetZwiDidXH8DeFFA1RdVr
	 Uu+LGmrw0Vqnxk19/Zu4+f8g4BDPu0ycwcMvmG3u6dy/3RDFtK1AJJTBqIKSHKnArS
	 HM6ZuF61G2VsXCcU7R5zx/FkJEtjOYNpRV/Gh1FRMcDCILKSXTHxV5P2xm52Q6VOvs
	 5VuVKbI7Wg3LQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D44C217E10D8;
	Tue, 15 Sep 2026 10:42:15 +0200 (CEST)
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
	jason-jh.lin@mediatek.com,
	CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v8 11/13] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Date: Tue, 15 Sep 2026 10:41:46 +0200
Message-ID: <20260915084148.11385-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
References: <20260915084148.11385-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable PM Runtime at the end of mtk_dsi_probe() so that the
mediatek-drm mtk_ddp_comp_power_on() function is able to do
pm_runtime_resume_and_get() and, analogously, the function
mtk_ddp_comp_power_off() to pm_runtime_put() for the DSI
device.

This makes sure that the power domains for the DSI IP are
turned on and off when necessary.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d930cb3c4d74..b668814b9200 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1734,6 +1734,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
-- 
2.55.0

