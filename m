Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4168A2FE56A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553012; cv=none; b=UesEcT/tzgt4XYMZg+Kwg/ehs3IK8VN6Crj3Hs6ko5dLHKfd+k3N7n9SS1ZWYZAYd0IjPys0GnWPGaTL5x3KeIfJspqAQE9wWRTSptJ1A5/eqA0tV/hz6N9qsvDduT9Rvbgep/u7gxwntlBWNsKY11yvC47JBP8SiRiEpMkItVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553012; c=relaxed/simple;
	bh=NIBquWVil2+1fKI+IhAQuokd/i/WXz2KibF0G9gVdtw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlhhlcHWVj7RIcEA6mdIjm41qt8UUIzVmZiAIMQZVfmCZruaEfSXKqzgZkSjLTORFyWz2os25vyJnFXKvs/oufigkgPLBjkZveVS2CDJha4HvubfySBMr9H/kpmZSCVLHzSQY6qwQdJJYkaSZMzN/1RILgxuTnbDHKcl+5wAzkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1xAydC-000000000n7-2Fho;
	Sun, 27 Sep 2026 23:50:06 +0000
Date: Mon, 28 Sep 2026 00:50:03 +0100
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
Subject: [PATCH v8 04/14] drm/bridge: it6505: unregister DP AUX adapter on
 bridge detach
Message-ID: <ae0941be8fb5e20a309f2e30b5e2d8818168aa38.1790552614.git.daniel@makrotopia.org>
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

The DP AUX adapter is registered in .attach() but only unregistered
in i2c remove(). Unbinding and rebinding the DRM device while the
i2c driver stays bound registers the adapter a second time, which
fails. Also unregister it in .detach() and on the .attach() error
path, which so far leaked the registration. remove() keeps its call,
which waits for in-flight AUX device users before devres frees the
regmap; drm_dp_aux_unregister() does nothing for an adapter that is
already unregistered.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Assisted-by: LLM
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v8: keep the unregister in remove() so an i2c unbind waits for
    in-flight AUX device users before the regmap is freed

v7: no changes

v6: no changes

v5: new patch
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 9c4aae383c1c5..7a0702e441ad7 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3096,6 +3096,7 @@ static int it6505_bridge_attach(struct drm_bridge *bridge,
 		ret = it6505_use_notifier_module(it6505);
 		if (ret < 0) {
 			dev_err(dev, "use notifier module failed");
+			drm_dp_aux_unregister(&it6505->aux);
 			return ret;
 		}
 	}
@@ -3109,6 +3110,7 @@ static void it6505_bridge_detach(struct drm_bridge *bridge)
 
 	flush_work(&it6505->link_works);
 	it6505_remove_notifier_module(it6505);
+	drm_dp_aux_unregister(&it6505->aux);
 }
 
 static enum drm_mode_status
-- 
2.55.0
