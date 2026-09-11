Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9295344C673
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112459; cv=none; b=gcgBCFdn5Ibua9CMSC15EwZuINPIbF5XZmHpYkY9bk5wvPnoR7WGhdr3lsW8V4atj+ggLDaVlcyEBRMi9lKIXvaWK/kBvPEdrh3OT9t9CjFnI91KzdJteIXqRJi7HY+EeohpexoC2AAGHprUSyDItBt8nUNCfNdzERaXTvoluJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112459; c=relaxed/simple;
	bh=gE/jHP8gTYltHtoq9vjJf5UmZ3FyBmWyEI0DU0Oipdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=boq59GuVoU787fZSX02lv137LGRm6RRz8k/Ji8k1w1MAhFDIG/RqWmMqZb8TTnlmLpciuNa02ls8POypOj4M4qUU2Br0QKjR1Zp7dfUIXBH7mN2qbJAm9qCecarm5XlqZRPK+2BiiaIP+ahXiDMv7Nxm7o2GG6Yi7lHRqVXZy9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IPvibgt5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IPvibgt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789112450;
	bh=gE/jHP8gTYltHtoq9vjJf5UmZ3FyBmWyEI0DU0Oipdg=;
	h=From:To:Cc:Subject:Date:From;
	b=IPvibgt5syh3io60FRSLggF3IfOY+RTY1kaEhmIJ2kFJYD1XTxnRzUw70IKMIOIvE
	 HN6GXoRnzB+M5ksMQgeg0bPaC+yRyIFWvm8JjCJCRgQF4xFrAZpcagbSYp5s2RxbwW
	 6J9WP6WArQyX7EWu/YGDijCy5eR1wa6DigP+4+pH3nnzwz330gQesNCmDc+2LEqM7c
	 VN2ksnKCRZuIQfwdw0K0kzHmDSEyA90NYZzj7LULnSUnSbBgICRfZVfEOj2crc3uRz
	 FoPzPJO/VCnIyRGvZimLW2FjpEi27gX9uFDZ+GvJvEr5AR6KUIgQnlWxTnyEQMWlxS
	 Q0cPu1PWP7XIQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 27C0317E080A;
	Fri, 11 Sep 2026 09:40:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: vkoul@kernel.org
Cc: chunfeng.yun@mediatek.com,
	p.zabel@pengutronix.de,
	chunkuang.hu@kernel.org,
	neil.armstrong@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	granquet@baylibre.com,
	justin.yeh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 0/2] MediaTek MT8195 HDMI PHY Fixes
Date: Fri, 11 Sep 2026 09:40:13 +0200
Message-ID: <20260911074015.9994-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
 - Fixed commit description of patch [2/2] (Mani)

This series adds two fixes for the MT8195-class HDMI PHY, found in
MT8195, MT8188 and Genio variants.

This is fixing PLL calculation, and TMDS clock dividers, to achieve
all of the modes requiring data rates higher than 3.4Gbps, with the
successfully tested target being 3840x2160@60Hz.

This was tested on MT8395 MediaTek Genio 1200, Radxa NIO-12L and on
MT8390 MediaTek Genio 700, with 3 different HDMI displays (two TVs
and a 4k LG workstation display).

AngeloGioacchino Del Regno (2):
  phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc divisor overflow
  phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit ratio setting

 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 4 ++--
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.55.0

