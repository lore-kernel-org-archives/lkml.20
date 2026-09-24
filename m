Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854784B66E6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275248; cv=none; b=aoqFNcRxGpOAYYCgZE0arBTU3mG3ofxVR7GP2nOG9GjlAieDuPIAkmQYN4bQ269iWJfue7NlAWp1RyrxLSKX4YZc94Tk1lac2Cb9Wu469R5j0mu0GDJrcgZPCt6MkcDw/1y8W2mZ/wOzb+H3wQgfjOD0nFWPwGmH4Uv+6Yr2MZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275248; c=relaxed/simple;
	bh=/NxBFRq9MCXYZotE8T9L8SsjEyMqxu9pgK9KbZZXElU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djpXDQShAc0V7I4lTzqbTLEiyCn94a0nkPOSc+1hzzkEUX+0JgaayrTxrPfIbsOtS5SCxAFNbVeRuKLj+9j0ymdz5tsY3qqF5clO0hYl+NS8qwRGHBBHysWgCrThQkMG++STyd/EWmz5UmgHJtjDpVoGfCQpsDF8nh+KIGvxBUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x9oN6-000000007Jy-3Agj;
	Thu, 24 Sep 2026 18:40:40 +0000
Date: Thu, 24 Sep 2026 19:40:37 +0100
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
	Allen Chen <allen.chen@ite.com.tw>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v7 05/14] drm/bridge: it6505: complete poweroff even if
 disabling regulators fails
Message-ID: <b6053ef6184ce92d4285a91f6b40795b89eefb2b.1790275151.git.daniel@makrotopia.org>
References: <cover.1790275151.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1790275151.git.daniel@makrotopia.org>

it6505_poweroff() returns early when regulator_disable() fails,
leaving it6505->powered set with the IRQ already disabled. The next
it6505_poweron() then takes its early return and never re-enables the
IRQ, leaving the bridge deaf to hotplug and link training interrupts.
The regulator core keeps the consumer's enable count on a failed
disable either way, so bailing out only adds a wedged bridge on top of
the leaked reference. Log the error and complete the power-off state
transition instead.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v7: no changes

v6: note that the regulator reference is leaked either way

v5: new patch
---
 drivers/gpu/drm/bridge/ite-it6505.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 19bab8d65e22..b9e5ce36f556 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2814,13 +2814,15 @@ static int it6505_poweroff(struct it6505 *it6505)
 	if (pdata->pwr18) {
 		err = regulator_disable(pdata->pwr18);
 		if (err)
-			return err;
+			dev_err(dev, "cannot disable pwr18 regulator: %d",
+				err);
 	}
 
 	if (pdata->ovdd) {
 		err = regulator_disable(pdata->ovdd);
 		if (err)
-			return err;
+			dev_err(dev, "cannot disable ovdd regulator: %d",
+				err);
 	}
 
 	it6505->powered = false;
-- 
2.55.0
