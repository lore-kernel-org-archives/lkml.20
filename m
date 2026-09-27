Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3938B395266
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553020; cv=none; b=doY3LF2Sq1SvBdnAZ+U6WdlYIrvyW/rT9zjHXri3dd9KesvcFJ57Es+noxU7vAR5ArTgsLT2AwWuiE9bCoKsyArdo2ClfGsrlg5NIUktt/VUJhPtobHAVmryNsKoZPpz3BCx0gZejERbvo6T3ZwF8PUyHKjcVGRPOZsM3K3sBEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553020; c=relaxed/simple;
	bh=pm0CAgO3zpOx4zivqkxgRC7YU4gajF28aJSyC3keH8E=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcqsirNdu2rHjVEyEXSwlpku5pluXu1oNySXgMDW3ASz46x8MIBX6HdYXlg2xmqWAjA4Bg+LZhRnsE59gjcGD+GUKIqpj0j/jHPm+x+V1oQNfdSpsNpT0/nWch6O/XbAklzfD95wVIpRdxCVhYHCtu1ggM2zwiIAA64TCCetJ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1xAydK-000000000nx-0Xh8;
	Sun, 27 Sep 2026 23:50:14 +0000
Date: Mon, 28 Sep 2026 00:50:10 +0100
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
Subject: [PATCH v8 05/14] drm/bridge: it6505: complete poweroff even if
 disabling regulators fails
Message-ID: <94daa219c80275afc8d2dd85df72c602f0d3e646.1790552614.git.daniel@makrotopia.org>
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
v8: terminate the messages with a newline

v7: no changes

v6: note that the regulator reference is leaked either way

v5: new patch
---
 drivers/gpu/drm/bridge/ite-it6505.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 7a0702e441ad7..6fd8f5ba9acca 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2814,13 +2814,15 @@ static int it6505_poweroff(struct it6505 *it6505)
 	if (pdata->pwr18) {
 		err = regulator_disable(pdata->pwr18);
 		if (err)
-			return err;
+			dev_err(dev, "cannot disable pwr18 regulator: %d\n",
+				err);
 	}
 
 	if (pdata->ovdd) {
 		err = regulator_disable(pdata->ovdd);
 		if (err)
-			return err;
+			dev_err(dev, "cannot disable ovdd regulator: %d\n",
+				err);
 	}
 
 	it6505->powered = false;
-- 
2.55.0
