Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857AC480321
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780524; cv=none; b=cfjvCmCGIfEz15oKoYjiOGiD6U8I4p0STKz8ZrwmaGVtf9PYlYTVWAtoq19O3yrtt3O3lpSu6GaKXMLT57+TNkJUHu6OIQ0++YQ4ubTrwJlpIqBRJkewPwYUkF9itY9XDO80e6tqBqgIYefFZFMbWcOvWFo4L4yuY/EyeyyetQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780524; c=relaxed/simple;
	bh=dqSlFylxany87x//euHzcbSDmd7Vo7iZMPlqL/qDISc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=odmvCB/ZJSlqxAJU+Ti4xdk9py1aY0xP3HSMgbJ8VChed4TJNgyUDSYguI8uB0lGCTIyH5kwXeGG8M4wKYJXLEfXxQWRLhjxGoBQqk0gbToMewOg/B1/GfQ1Wq8w8KQBLRAABq3Bg6K6Jmj2AwWr42CLOZi0tuez5IZTyiz2E0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gvDol1jy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gvDol1jy"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD00415D2;
	Mon,  7 Sep 2026 13:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788780417;
	bh=dqSlFylxany87x//euHzcbSDmd7Vo7iZMPlqL/qDISc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gvDol1jyYFCKhMTSMBQNmHZeR+JqcUKemZQ+Km+5zxjxmnyXlC26m/4nPk1gCuXsI
	 57nVW9Aj81vkL5tRRqNOsskKY72lgQPDzb3WliyzJZOPRoM1sT9HgGpbJGFj440dCu
	 41VjJDbDD4nuWSIBcHx4SZSsPqlUaXp6JOSJ8cLs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 07 Sep 2026 14:28:04 +0300
Subject: [PATCH v4 09/13] drm/bridge: tc358762: Fix sync polarities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tc358762-fixes-v4-9-e3fc3ab5cd83@ideasonboard.com>
References: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
In-Reply-To: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
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
 bh=dqSlFylxany87x//euHzcbSDmd7Vo7iZMPlqL/qDISc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnp/UKX1xHlaMz60iTh9vxL5HCzPRfkAFhRrGE
 65xCGPXmieJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6f1AAKCRD6PaqMvJYe
 9T51EACjEYB5j3tCyRjgpdUcJLjt2yQoGUU+9ofoDcYU0ExMfCqwq7K+VQg2jpVYHLfJrmS1Lt6
 WuxKhJty2/KrDkugL+K/RNt+pRar8Xc9fhsxpwjfdnLdtCkWlVTALSz27VTSkFUbGTCgj3luvza
 1e7KBqgaqepi5pIvlz1wlaSzfODfC0aQCQ3tdVQ44htR9XHdOah5+JVuoQRkGe0c4ZAALtoyTYo
 ryHoqYjwhhG1VB29K0CBQV6d/Ltoy88RNY6P2RdWTQl6HMSvMQ0gQ2XTMQp8YU16NkJG3agYk41
 eBBWqRFyFdT56/Woh9Sh19svyE2fSGjydgLp3TOAE1Bi0njl+IYrJ7ePsVQtagOo5/yvtGASA46
 mgvcrP7CsCTcErlBKSUuzPJeZYRHTEeXm+JN5JZDyKL3i0VNMfREtoMwtVnWzo/DK22oHWrRqYm
 y+VNKuanIgKxBJsUxEgQal7zCWiQ2OcLOWTJxvWaGLqLImGwL6S4KxTPIV6WReNK0U340Eh21ZB
 sWsU8aKkSlRF+hrz+Ik2whX+GyFzsmnUT7QVnupGDifpC9CwYdUCQOHWY1Oq4E1+ghb5aBZoNJD
 Whnv0C3hiER5XADWf2JUdj2Rw9tkYEaK1SQpTjDjttEjy0lMNIlYePBsAreQiZkJgfoOEeknrZD
 ary8trEf3fw3ePQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Setting LCDCTRL_HSYNC_POL and LCDCTRL_VSYNC_POL will make the respective
sync signal active high. The driver does this in inverse. Fix it.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 797866265b41..3a2e6a97feb8 100644
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

