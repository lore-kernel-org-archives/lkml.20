Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141AB4EA362;
	Wed, 16 Sep 2026 11:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556928; cv=none; b=lpzMma3lUe7eYILBe2JACRkrF1PwaDwShR1LWjrkudhedD0jpGUiV32CwRNUuGytbW6IXSDzoCU92fh6BL3l2g284mrBMN/JWi1VZQQ9qcxJ5nUU/WVmKLolIx7eK9QqWi8klDJERX4mWiW5vB4ldQhZZC5y2of25BrhKJL90R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556928; c=relaxed/simple;
	bh=IOra0Av6gxMDSD0lippEBFlcuQ2SmjjMSqcRMB0XwNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SUAo0+QAzYbLt9YY63kf7eX2DIMAu3N9qXfhqeGuth0rshdMQ9iKd/XDLwbjSNNv1B04Z2BcKY+8BMbGRrYe0jhGJTawq9eLmwf1dYOo8lgeYLqDM9Q7ENDrunCpbsAHK+aaQX+Y47uu0cBCg+amcR7P6b8ISMnzdTuDz4ybWcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NbvVHDEg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NbvVHDEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789556912;
	bh=IOra0Av6gxMDSD0lippEBFlcuQ2SmjjMSqcRMB0XwNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NbvVHDEgNz4o4l8PAXtobZkZFbr4btAFhsUmoqfEgbBRwOl8e+HkZFO0H+8Z2nzYq
	 4o5dZkq5oBx4AXbnPXtA153hvbduf31EJYvGqoj0DD+PmDL3xm4wdR16uWKvOO+0mi
	 6AKI4MPkdmzfVc6AJ7I8U728yLbaxgmokYov+UBuCvtPycgwLmfR49I2IUdGezTfqs
	 198+haU+sK3Wqcq+bGRBvddRxZ0alwJsUhJzFl7oQOu++R9hpqpQr0f690gSxpqssQ
	 B0O006ThM/djvAFVjpFqQPf+r8guHvD0ko0FpV+7t8xC572uxSNpMznod03mKLIxiM
	 Nh0JhEvWW0xIg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 06BBA17E1289;
	Wed, 16 Sep 2026 13:08:31 +0200 (CEST)
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
Subject: [PATCH v9 04/13] drm/mediatek: mtk_dsi: Cleanup encoder if reset fails during bind
Date: Wed, 16 Sep 2026 13:08:16 +0200
Message-ID: <20260916110825.102631-5-angelogioacchino.delregno@collabora.com>
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

When binding the dsi component, the .bind() callback initializes
the encoder, and then will optionally trigger resets.

Should that last operation fail, binding will as well fail but
the encoder is never removed from the DRM encoder list and if
the driver gets removed afterwards, this may crash the kernel
because of an use-after-free condition.

In order to avoid that, cleanup the encoder upon reset failure.

Fixes: 605c83753d97 ("drm/mediatek: mtk_dsi: Reset the dsi0 hardware")
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5c3b1f2d6ff6..28ba532210ff 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1095,7 +1095,13 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	return device_reset_optional(dev);
+	ret = device_reset_optional(dev);
+	if (ret) {
+		drm_encoder_cleanup(&dsi->encoder);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void mtk_dsi_unbind(struct device *dev, struct device *master,
-- 
2.55.0

