Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCEE51AEC9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063013; cv=none; b=o/SySaknDSPjh1PJeCYnlzozP999TXGyXJQsjoGDFgVpv1fEAWaCqq85QP4hcqRNiXv9JpTUJZrF1nWGi77TCQgY6nnmymfIZCvK143AaJZe8URZu0B2DnGVbp0pExxCJisTUd7EIdPahg9GR1pb+O0azcv0XLZi4pJ8M04SwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063013; c=relaxed/simple;
	bh=YvPKvR3k8goQxkf8tDWUsDTJ1X7cwwMqAe7zy8YJqmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hwdsqt34mZy0UwkcY5ig3ODlNzKwcpEoSxUaaQ+wJmH5mpfbHVgIqsV+NjN1FdCmKMsL9Y6btvgMsgvWlvG+jLSk93gFbwbZjZWQ37aOIO3Mt4vVwn5P1/6ZuZLTs2W4PJKBssK3Jkr5wLxzKfMeYx2ekH+QaeSKeOt9xuZkoh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZRbWpj4y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZRbWpj4y"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48ADF2F8;
	Thu, 15 Oct 2026 13:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792062873;
	bh=YvPKvR3k8goQxkf8tDWUsDTJ1X7cwwMqAe7zy8YJqmM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZRbWpj4yXRt1q0Nej4RrT73tJwRwKei/4mFS4+cWFJMa3uBhhFcF0dpLfT30ycZ8u
	 OFmPZZu3tBDsEVY88s3lGOuik9E2gw3XVJMoI3SsBDPHFbXBUW6c63Uwu7oqf1m+D8
	 NvLv1LrfdmAg6kF6U9+uLzEPFxab/mYuPYFBLywI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 15 Oct 2026 14:16:00 +0300
Subject: [PATCH v5 09/13] drm/bridge: tc358762: Fix sync polarities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tc358762-fixes-v5-9-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
In-Reply-To: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=YvPKvR3k8goQxkf8tDWUsDTJ1X7cwwMqAe7zy8YJqmM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq0LYHMIxIwLJncouR4zT7ki6jZn1uKfsD531IE
 pAEHjUQyQeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCatC2BwAKCRD6PaqMvJYe
 9dyCEACAiD7z3zj1Ru1PevHY7ohFpcM85fmnK3NhTy9BO1JbBy7FnYYOONVRVxkZpp12gOhEWDj
 BVbUE3z4YAGIClZQ59neOHUBlcJ/c+P2DqjuL3cv2JBA5RQz/2Q31APADs2b3u6aFW6PlOP9nnd
 GNlv3xqlRhs81rqC17VZ+5tnb4UCsVA3HHS37owJJi/7hyIAidmCx5GxfEeto5sQlM6XOLgZfDw
 gKbB2AqB6HbmqZNtT+LdRtSM6WOUkvInMdyQ5pzw0b4JBnswOOhYNVzyEjqY4Bd9HCWp6EzOEp1
 AKF67o8PuJmld/FsWns4xc/33lxU65a+5DSEw/18q6jE+PaFvgOcCLOWVfiJzy+V3Xqna/eG/0E
 uqaAZ1CGCZcOpKV5Sw3QEwGYEuvmTkLdwEa4W7upzSehLIDsYh31AdbwhUnZxjh5O1ppTHA2B5X
 eP8EXzLJh624qLcb+FofxmMgV1m+Kibuzl8Xr580o5RFgGXBLBJoZXSB3JY4XB+ObXu2xWwIAbL
 aJxJ4DSoDYBO6ChGCnKrrd6tPjkEGkpapOC65fIfY7oubuCAzqtxMbNQ/g5sBeC0Sg1iwo9bHCk
 nHGWJgIof+0vjaUr3zCh1vG0wLohFx1iv5P9vKeY6FjEN2x2eCyIceFX7wdVLRgBsyHvK3ai1bY
 l5TY2DYGGiN+J3w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Setting LCDCTRL_HSYNC_POL and LCDCTRL_VSYNC_POL will make the respective
sync signal active high. The driver does this in inverse. Fix it.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 1fb5626a35ab..2baacef685a5 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -190,10 +190,10 @@ static int tc358762_init(struct tc358762 *ctx)
 
 	lcdctrl |= LCDCTRL_DCLK_POL;
 
-	if (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC)
+	if (ctx->mode.flags & DRM_MODE_FLAG_PHSYNC)
 		lcdctrl |= LCDCTRL_HSYNC_POL;
 
-	if (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC)
+	if (ctx->mode.flags & DRM_MODE_FLAG_PVSYNC)
 		lcdctrl |= LCDCTRL_VSYNC_POL;
 
 	tc358762_write(ctx, LCDCTRL, lcdctrl);

-- 
2.43.0

