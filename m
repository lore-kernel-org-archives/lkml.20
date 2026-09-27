Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A15420D4FC
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553081; cv=none; b=f6ilgzTF1VCX+tupsbCpYegDWNGqm7fmp7HSFeY7F3Aw9pFI4oKpDSaH2HIKsyLm5DfXYNtTHwr1kCuY6kyEwBwD5IsUW5BqY0+qMYcet/o9EDWdBf5dk4YR+3gd5rYsLNOufEzYoYHOtQUBa/fPdqMfwN8hZa1ZziE1teh3Pf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553081; c=relaxed/simple;
	bh=kmC9hSP/bIFy5QbLol1wNDlOsT/B/dyutfje+dnJ9OQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHiPDv0iwiaxYu5cMlXVbuBJbvTeY4jG8DKp60L0nvwR6g0P6Q/H58vOQTcQGjKA+EWlHQNBF0jS2wiw8FmNZV1ZIxU+q/1yRVhihBDyraPvBSeG1bZnC+WhQ4siew8ItJc4JqW7DUWRAH6jWyoUbAZOg7/z9Oqd2Wx2cEV+fRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1xAyeJ-000000000tt-3P3r;
	Sun, 27 Sep 2026 23:51:15 +0000
Date: Mon, 28 Sep 2026 00:51:12 +0100
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
Subject: [PATCH v8 12/14] drm/bridge: it6505: don't write an error code back
 to the reset register
Message-ID: <b79fcdac09d24ded63960f83d9d45268b02081ed.1790552614.git.daniel@makrotopia.org>
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

it6505_audio_input() saves REG_RESET_CTRL, pulses AUDIO_RESET and
writes the saved value back. it6505_read() returns a negative errno on
i2c failure, which regmap truncates to eight bits on the way out:
-EIO turns into 0xfb, holding video, audio, AUX and HDCP in reset. A
failed REG_AUDIO_INPUT_FREQ read is just as wrong, as any negative
value passes the != 0xFF test and reports an audio clock that was
never sampled. Bail out before touching the register and only report
audio input for a usable readback.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v8: no changes

v7: no changes

v6: new patch
---
 drivers/gpu/drm/bridge/ite-it6505.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index ea65ca051cb9e..73d7236733314 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1516,12 +1516,15 @@ static bool it6505_audio_input(struct it6505 *it6505)
 	int reg05, regbe;
 
 	reg05 = it6505_read(it6505, REG_RESET_CTRL);
+	if (reg05 < 0)
+		return false;
+
 	it6505_set_bits(it6505, REG_RESET_CTRL, AUDIO_RESET, 0x00);
 	usleep_range(3000, 4000);
 	regbe = it6505_read(it6505, REG_AUDIO_INPUT_FREQ);
 	it6505_write(it6505, REG_RESET_CTRL, reg05);
 
-	return regbe != 0xFF;
+	return regbe > 0 && regbe != 0xFF;
 }
 
 static void it6505_setup_audio_channel_status(struct it6505 *it6505)
-- 
2.55.0
