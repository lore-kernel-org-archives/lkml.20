Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553D43BC680
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553051; cv=none; b=oPFlwUY8boZKzbrRzmcyMu18tjBBMRqaOtkcFMWDg2wu6nPWKyFksxs14NGEJ0h6OWaPsjqvBJfC3eOP2bMhAjwrsQ2iEBh6UlcsuC8DmPd87cn+aTuZvztFo72xwL5SGuwNYMgQ1oWK3DHyvsD2/i4w0kkNY6r2hE8nWTvXNyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553051; c=relaxed/simple;
	bh=guM+89qe+J2R93DYUz5KnjcRl4ew4cjwoePFF6oF95w=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXEOjYEcFvSvQNgFMvDqQTJ1C/QuL2Ls1gkeA29ByAi0DLqkApzufxgl6rAUAQvGqs6x4jHqkFU6fmvSCop8u4Z2ENzZzmJbHYjDSGggmCkJcaUa3SqJVjaAVYrr/aRUy4gLnQBBRAMuE4+AJ3zlpHiB0iPYQa7la61u9AidqNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1xAydp-000000000r0-12cY;
	Sun, 27 Sep 2026 23:50:45 +0000
Date: Mon, 28 Sep 2026 00:50:42 +0100
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
Subject: [PATCH v8 09/14] drm/bridge: it6505: guard against zero channel
 count in audio infoframe
Message-ID: <f6dec78d013b5fbda56fdcc40f1d2cff96c219ba.1790552614.git.daniel@makrotopia.org>
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

it6505->audio.channel_count stays 0 until link training or a valid
hw_params call has run, but it6505_enable_audio() can be reached
before that from the audio-FIFO-error IRQ, making
it6505_enable_audio_infoframe() index the 8-entry audio_info_ca[]
table with -1. Bail out while the channel count is not yet known.

Also fix the debug print on the invalid-channel-count path, which
logged the previously cached count instead of the rejected one.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
v8: no changes

v7: no changes

v6: no changes

v5: no changes

v4: no changes, collected Chen-Yu Tsai's Reviewed-by

v3: new patch
---
 drivers/gpu/drm/bridge/ite-it6505.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 0d21014324167..3f17024116e14 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1577,6 +1577,9 @@ static void it6505_enable_audio_infoframe(struct it6505 *it6505)
 	struct device *dev = it6505->dev;
 	u8 audio_info_ca[] = { 0x00, 0x00, 0x01, 0x03, 0x07, 0x0B, 0x0F, 0x1F };
 
+	if (!it6505->audio.channel_count)
+		return;
+
 	DRM_DEV_DEBUG_DRIVER(dev, "infoframe channel_allocation:0x%02x",
 			     audio_info_ca[it6505->audio.channel_count - 1]);
 
@@ -3012,7 +3015,7 @@ static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
 
 	if (params->cea.channels <= 1 || params->cea.channels > 8) {
 		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
-				     it6505->audio.channel_count);
+				     params->cea.channels);
 		return -EINVAL;
 	}
 
-- 
2.55.0
