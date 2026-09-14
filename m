Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B407447805;
	Mon, 14 Sep 2026 11:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387114; cv=none; b=oar277ZV02swRItn9M9b7/xWGGRp6oRR8BESwN++T+MFjaKBTyp7FlaazhabAaAcXfEludvwrR5XiysGKl0qh0LNHHzZonop7ELIXJat7ruODlLp7uClJ+VhHlVuYH2rZyEhXNJE3Fy/VaJibF3Kd9n4fvgzTs1YkeFB5uhNbI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387114; c=relaxed/simple;
	bh=fTieI8NXtjf84c6bHqlL+x2GwkSSrjWo1eGphSfuE7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRNw/1CdgpcLKAg6vOOBNFF5TYRNkITSOjYhrG1vcTc95vtvqUfm0O3phksdDsAFW0jGNqeFuDyWXDHQd9GpqLePdYuPtNd5azzbndEZMTrrpWmvnFiqXVF8yK6nndGDeB3Wo69P3lisK/EUDSNe28Naxj00A16m7mo7XbFJOes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f+vlF9Bc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f+vlF9Bc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789387106;
	bh=fTieI8NXtjf84c6bHqlL+x2GwkSSrjWo1eGphSfuE7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f+vlF9Bc5/maoVeqW7q3XCX4T3QsKwCSEbFhY/QomhWYcxPpmA0WoiGFJtQvPtj67
	 lr/5nf25LzNkPtva0bn6sfFHrza8DghjplYFpjGSB5rM1F0q0msVxzwGU6cnzGUENf
	 fE34NXRdDy6YX5RCvkEGOqpCdQi38rD1DJz93g8zhHsIRxHSZMyTsssg42IKqGpgBB
	 85PYWanwJR1p/8fMCjTDuYN34FCaOlVi6D//Qu2FtAMQ24CfSiWdRfm50HMffmpH3/
	 Q95anjKKhOlM6s1s4djmMq1aFy7AZIcZjVmMnpy9KueWdwhumdPJEpDa5704CvT00c
	 R+WIibu9pQ7jQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EC2F17E08A1;
	Mon, 14 Sep 2026 13:58:25 +0200 (CEST)
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
Subject: [PATCH v7 11/13] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Date: Mon, 14 Sep 2026 13:58:10 +0200
Message-ID: <20260914115812.22751-12-angelogioacchino.delregno@collabora.com>
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

