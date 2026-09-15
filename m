Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8552747CC7F;
	Tue, 15 Sep 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461728; cv=none; b=MqXfACBi3gjfC+1ioUVNHkoKuMWvimyaE/bCLR7BtLl8ji7VQ3gM8k5vT+FZR1wPRL601ogRvvaDlB13fFAl4IC0tQWpuN8fvooCkkTZvhGFayUAaK4lPv32HbACv4jbTmGsAgzlRXqA6VEq/HTVrfd6GlYyishmfRtLkQe9YCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461728; c=relaxed/simple;
	bh=qyYNtF6Szv6pA6AN5mfvaTW4lHJbi9aApiqokgMWKXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIo2W8HuxgtR7AvmJwPz7o++6xfkSrtE34HlzGgb2A30Pf3ILrN04d8W9bjTj7Nu553WbQRWToy2krqm2DdtN0HcOGxlhmSFaJcFPyU/yQK0lSy6iCILillUYl3Hc8ajysj8D5VSJFMpKihdq5+oKDIPbRRCDd83trMJVHTmNyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h+ukPA2w; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h+ukPA2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789461724;
	bh=qyYNtF6Szv6pA6AN5mfvaTW4lHJbi9aApiqokgMWKXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h+ukPA2w+O/JtIcUTUZ5KiiWlpnmHXb5do22l6ZTC0C2NGJXYKj9RzAn359prDzdF
	 f5YsnfXuEuZNPoHQQN5rpRXbIAB09ZaXeVdkOMCxd0KKWR4USiOB0CzAI0PZir/ewn
	 x5VANATbcIb4cIMdoelSqRYy9r4hopLVRQSr7iRCYcHOMLrkRAFjXpa3xG/Usgi8gK
	 6GGPd3hlq/u4UDOKINxV6FsjzeNHk19UA9xbqREs28l8Z3TlxPHwr/seAeQ5QiZ6JT
	 ATGnjLgdZDIS7CLBPiiOAVA15WGAxveK5BvL0q+cXoyamb+oteWIDLkmSxiC2AhqIe
	 3CroR9g7hrMVg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2394517E1168;
	Tue, 15 Sep 2026 10:42:03 +0200 (CEST)
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
Subject: [PATCH v8 04/13] drm/mediatek: mtk_dsi: Cleanup encoder if reset fails during bind
Date: Tue, 15 Sep 2026 10:41:39 +0200
Message-ID: <20260915084148.11385-5-angelogioacchino.delregno@collabora.com>
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

