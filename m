Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BEB443C39;
	Mon, 14 Sep 2026 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387104; cv=none; b=klBlg5eL91BiGyeMTx6wMOg+g2sXnFprN6DJ/1WKbiQKo6pPYDYwoi4QfXIi3NVjTS6NDqGfvkwFIsg3ealTWHxRinxRvc7Uoqv8/xr6ziMtmGnHHcnK5IAOQlGnHnoSYdB9ip9okG/t2UcEuVLEdesFP/wXv7c/t84E9V8YejY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387104; c=relaxed/simple;
	bh=qyYNtF6Szv6pA6AN5mfvaTW4lHJbi9aApiqokgMWKXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8Y568LOohBtDbnycqc8l9qzLtn4phBBHyHjeaYxBX6qzS+6d7JME/JFIg94UCwm4U6MHrz0qbxwVzy/T9cXn+4fr4XiBfQyyLfvgzL7YAsi67+cu+4KzkN0yMujwhJ3KDQkWfAXx07Q5s2ORH7IhjVET/MEQuiAoA0HYvcHj6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YksS3IlZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YksS3IlZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789387099;
	bh=qyYNtF6Szv6pA6AN5mfvaTW4lHJbi9aApiqokgMWKXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YksS3IlZd4rVuwZdzbjgVB/yasXhw+vs0PRd4z2N5oyZ/ZVC2auJuqjMMzEIhT0oc
	 T9GCCIzfF/NUFt963PSe8wGAxf2iStu0EsSJJ9zQGs+4yb9b252sZ0lmESWlN8rc6j
	 llSL+zXQd/5LNEWDYyYeXycyCEptq2/dtMW8ks47WNx9awOB7pWYwhw/rGmjSdZ5Y7
	 sooaUfyDExrnJWGEQuAiXM/h5J7pfkXv8NyghT0BEuMBd6Rakh7aosx+7O8M4J41uM
	 WbQR6rmTIQLtXJXZnmN+D6Kla/HxfdoWQteC4dXI+Vq0lb4GXvSJxu0480R1dZyOzG
	 zeDDHg+IYOnMw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF6A017E0CF4;
	Mon, 14 Sep 2026 13:58:18 +0200 (CEST)
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
Subject: [PATCH v7 04/13] drm/mediatek: mtk_dsi: Cleanup encoder if reset fails during bind
Date: Mon, 14 Sep 2026 13:58:03 +0200
Message-ID: <20260914115812.22751-5-angelogioacchino.delregno@collabora.com>
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
index 97b8a91874f5..0b167b4411e5 100644
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

