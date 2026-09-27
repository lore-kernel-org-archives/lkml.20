Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96286395266
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553074; cv=none; b=GIAGltf8/Jj28SXLd0RthBHAsPdtxjvXZnxrFwnSH8MHNqa81XhUxj/I2RIZBJmzDCPUPCUWL7yRr3h25ffnm0hbgHz1Y/c6BQNWcfsYFL9xLP5aUBB5pYt9NfI7QevPlFXsgyhCVsoFLxtjFaCFshOYqIxi3TimuToIYCG0W0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553074; c=relaxed/simple;
	bh=hVcZEwOItRfTkH+M//Mjl15a32ibSK5gw8C7uwUkhgU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHeGDFykVVBynMHv2PT31/eUPiPWg2tU8/KMvN28k94wQZ0EGv48aqLv7d9/CfRrrIdnvgP0IyjVjstFUDaSH/zxXEwWfWvtZW+dfpaHBNfRtlfVBHDPNw9h7gNSI2bQaudPlq2EUSA7Lqw9JVnUknzfXKEo0xegwDDsZYeN70k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1xAyeB-000000000tP-3H3H;
	Sun, 27 Sep 2026 23:51:07 +0000
Date: Mon, 28 Sep 2026 00:51:04 +0100
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
Subject: [PATCH v8 11/14] drm/bridge: it6505: reject a too short
 link-frequencies property
Message-ID: <622ec77535273c2d203aade2d7a9fda7b02676b1.1790552614.git.daniel@makrotopia.org>
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

of_property_read_variable_u64_array() is asked for a minimum array
size of zero, so a link-frequencies property shorter than one u64 --
a 32-bit value written by mistake, say -- returns 0 without storing
anything. it6505_parse_dt() reads that as success and derives
max_dpi_pixel_clock from an uninitialised stack variable. Ask for one
element so a short property lands in the existing error path.

Fixes: 380d920b582d ("drm/bridge: add it6505 driver to read data-lanes and link-frequencies from dt")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v8: no changes

v7: no changes

v6: new patch
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 848e9a650b9ff..ea65ca051cb9e 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3392,7 +3392,7 @@ static void it6505_parse_dt(struct it6505 *it6505)
 	if (ep) {
 		len = of_property_read_variable_u64_array(ep,
 							  "link-frequencies",
-							  &link_frequencies, 0,
+							  &link_frequencies, 1,
 							  1);
 		if (len >= 0) {
 			do_div(link_frequencies, 1000);
-- 
2.55.0
