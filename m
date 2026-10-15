Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672B74FB9C3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063009; cv=none; b=g3P0ntIAO5EXjmqZRqobE/yTYRwsAtkxCcuD7gG10DwULtk3ljk5BRFILk1BxQbJJlLCbeWxw42f9eZXebZ1XO+EsMFymz7VpwI0rz0SVadtSdIo6Pw6mzv29mLTmeyM/aIJEaYLuVzTpio0/9kOHdBr0rf25vpDZ2vrKZiWHAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063009; c=relaxed/simple;
	bh=fdg8eV/QDnydJFYV748UJ0GYkCe4BYsEnmoO5CBavJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tAXEnGqU5FSVfXi1dn59xeeI7uJpihYDUtToAnjj4rp8JuisUav6p7Fxfj1j6LGtVwFJu4QcaZ285VWs/lMxpKXHjXS1uA8+ss+/JlMbXis8L3mSKtRKq9rUK1GSTT3PxZzaAW4oAAxbrm5026ITIc1y76KVu3b40c/O8AOs0vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Iwj9r/vK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Iwj9r/vK"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DC47157F;
	Thu, 15 Oct 2026 13:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792062871;
	bh=fdg8eV/QDnydJFYV748UJ0GYkCe4BYsEnmoO5CBavJs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Iwj9r/vKQaUpVYf0Dn0y4+c7ISakMtRKiVCGq1gvuEU6/zHEHG7nhcN8nlq4IGE6C
	 gvgKO3MOjXan0Z2kRGEBCndLnIbB+XhwqPnQnEzYs4KG8zxNfkUUKD+/DtCydnEABy
	 rjVgrKqrz1eqG59/fGIG7eCEzOvEfLgAEi66WV3A=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 15 Oct 2026 14:15:58 +0300
Subject: [PATCH v5 07/13] drm/bridge: tc358762: Update comment about the
 number of lanes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tc358762-fixes-v5-7-7cd721a6451b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=fdg8eV/QDnydJFYV748UJ0GYkCe4BYsEnmoO5CBavJs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq0LYHH7U8w/F7jAXbT6GDiP5ya/i+WqIi7wKf/
 B87Io+SeXuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCatC2BwAKCRD6PaqMvJYe
 9R2lEACfytEUffqHntXsShVoibCaBEit2fn+1RVczBtgke2Dy6o3NASTjvs9jbCHmGxkVd4y+Vl
 snMZ5qlIJKn1dY8GSpm3n6qEdphwveKzfKuz+l89rtjdCSOZcDbKOe2mMJ5EldIaUaE5+ThFAHP
 qnm8WTzCtDXj+kR21ZEsreWQTKDQTR5IpJ8FqdhaVE9AiKjZVbC2b4bIwJS8Q++Bom2BE0VRkul
 k0i/zM90536YqYAWQ9b4/c2KMZOnEtc4QTRY7Ic8EMLOpjJgfuHJJsmtovId/RnVspz40oWKYhG
 jVpRFpuqJ4sXpm3GnfdVLHfQgKLXJA2JaxfsTLsJucgLnL1WymhyAHylQVsF60QcxSYlJsC7P8b
 7IqIor+tvSCu7TauYe5vLjx9OkiuHFHyXMF7R+USgIyR7hmaP4hkWZDiNg5WvonVxB8JhbTYRa5
 lX+kbS5f2Bmwdqv4Wg7euTMlNuPk9F5UFULHT5KVXWQHSiJcnkPQ4RI9MURItFhVxVD/TtP8MMl
 MpHfIBVvmbbx15R734t1Xlu35fQ1UH4ExyYhbjyEk2UtQ4wI6qiZnojU233RePw0aIWaycTzy0B
 kuX+YKEZRJEbMaLwkqvyK5JxUOKgwrxML4+svNHHOUcZhVaDhNB1CUgJhF9hUgq8RKEBV8lKeGO
 GdMtxRhvZ3Ue+5A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Update comment about the number of lanes.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 19f328b6e798..fd82274643db 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -305,7 +305,14 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	ctx->dev = dev;
 	ctx->pre_enabled = false;
 
-	/* TODO: Find out how to get dual-lane mode working */
+	/*
+	 * When using DSI clk for pixel clock (only mode supported in the driver),
+	 * the pclk is derived directly from the DSI byteclk via simple divider,
+	 * which is either 2 or 3.
+	 * The required divider can be calculated with bitspp / 8 / nlanes. Thus,
+	 * for RGB888, only nlanes = 1 works as nlanes = 2 would require divider
+	 * of 1.5.
+	 */
 	dsi->lanes = 1;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |

-- 
2.43.0

