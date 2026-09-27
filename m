Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F35F395266
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553005; cv=none; b=Go8k7xoQKck0Cnr4Bn8x0TPOQC7pEXDSx9ELKD3ACZh365w6GrgSeyrHucueZ+20LcvkB8Xm+IVLzieB6hkeKaN9E/Rsmypa1djvVL2IuGR6V+utJR9pf1PKCtUmv7qwwyZ6c/dpQhAT1q0PIE2ZvX+fttI1ytKKkQjUOg5Iu0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553005; c=relaxed/simple;
	bh=zSch3CH7aHKWWdXQcgPPeGreR8gWvJFDxCVCCTbDMLA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Po+uyekfLYpO7edTeDyIxoVkHOwachgEwTU1nf/0dNCYNOAw8L8sK6SQfpvKrmh2U2bCP/Q7ZPa2vvSEnnMnfX0YtsBXdn+cwNP7yjMQULS2abKg4NEu2Ibt62ROO11Gd8dIeWhQxZA0V7CzqzFDn50Z+m0vtNv4lJxTU5q6tro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1xAyd5-000000000m7-13xw;
	Sun, 27 Sep 2026 23:49:59 +0000
Date: Mon, 28 Sep 2026 00:49:56 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Allen Chen <allen.chen@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v8 03/14] drm/bridge: it6505: balance and disable runtime PM
 on remove
Message-ID: <aa94f192ee4ac67bc51d0809fdd4a0e675050fef.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1790552614.git.daniel@makrotopia.org>

Runtime PM is enabled in probe but never disabled on remove, so
rebinding the driver warns "Unbalanced pm_runtime_enable!". The
extcon work also holds a usage reference while a display is
connected, which unbinding leaks; the count survives in struct
device, so after a rebind the device never runtime-suspends again.

Drop the usage reference held for a connected display and disable
runtime PM in remove().

Fixes: 10517777d302 ("drm/bridge: it6505: Adapt runtime power management framework")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v8: no changes

v7: no changes

v6: no changes

v5: also drop the usage ref held for a connected display; retitled

v4: new patch
---
 drivers/gpu/drm/bridge/ite-it6505.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 52d7d818a5ea3..9c4aae383c1c5 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3663,6 +3663,9 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	cancel_work_sync(&it6505->hdcp_wait_ksv_list);
 	cancel_delayed_work_sync(&it6505->hdcp_work);
 	cancel_work_sync(&it6505->extcon_wq);
+	if (it6505->extcon_state)
+		pm_runtime_put_sync(&client->dev);
+	pm_runtime_disable(&client->dev);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
 }
-- 
2.55.0
