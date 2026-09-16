Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B0A4E3ED9;
	Wed, 16 Sep 2026 11:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556938; cv=none; b=m3EfzrCjlza9UUfmb8XGcmCTxnvnNywFxft42nzV7R/ZLd4cZOzgJqWdYr1JktAnx0OVqnJ68t2JbZ9Cmz89lreIWM4XSBY7lixFwyBdWdpZ1cNGJR0DkM3XE+eF/eWIPlA0LK1aYHt8efEDM/1snAopB0548OMiw1pEcXzqAis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556938; c=relaxed/simple;
	bh=FmtTJ8kwMc6WW5YNQJF8Y+ogaSCb7Fw0hCwLl9pIUn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMyJT9E2T+hjPTohAqZnzp0i9eXebfFLnTdohIBol8mupZMwjNlY+CIxYmzdckUBaPPhCSOvO9PeGROu2Ibq7wjGCZL3VE/QX5FPSKLkEMeb5NHkHgWiXxV+RtdUCXZm+BX7zWkKTIPvhMyKuucin1VGTMHHdAGVFw/ALigVgHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h7Zk4tmZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h7Zk4tmZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789556919;
	bh=FmtTJ8kwMc6WW5YNQJF8Y+ogaSCb7Fw0hCwLl9pIUn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h7Zk4tmZ3PYEBkf8Z9IH+nht2sTEVRa8JibSt1daPk+TJZnFTrcW4hFKR5jTVdSMD
	 /aI6mOZaZ7K+tTV/6xkx+L01DfaG7aXuFCOXYIdtCZOzcMgopwQ/bzeNVbJzH+Vrge
	 JkoZDa11clB4DqWMgAacEKg+jqbfbfZouWq9Kr0s+o69Z26oX2L61nlk1U8KWS4eRD
	 erZHcSmEXoFgw/Rz+PpnAb7tHlySELJ+nc9/xkLKkwIvoav2CCSxB9T7F4c1Y8N7K2
	 gujXQQVpLSxH+ukHiOMoKJZbr2Qi8UP7p16OUgOJ5hMdCYAAB6ccABbCYtHN2fAfBA
	 pw3DmCq5NoV/Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 915CA17E0C7E;
	Wed, 16 Sep 2026 13:08:38 +0200 (CEST)
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
Subject: [PATCH v9 11/13] drm/mediatek: mtk_dsi: Enable PM Runtime on probe
Date: Wed, 16 Sep 2026 13:08:23 +0200
Message-ID: <20260916110825.102631-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
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
index 3b33419aee2d..4863d910511e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1735,6 +1735,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
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

