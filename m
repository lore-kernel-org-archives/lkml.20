Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660179;
	b=IpmjqKCLhqXi0jC/vDi/QSyrgfueW09MyhrBz6HHfmK+bxsVpDMZuZBRFBbxCgZ7LTq9
	 lJBbteorKToutDs4aiHy11i35102BE3KDGRTcy3Ur+WzFm/TBoy23Du1nX1UAxa5XTK1W
	 V87f2tYsGeP0UZLflCouleUpUKUDWxlIZA2Cs5mKxdU9ixVjYl6zwlSD1N5LW1oUDN1LZ
	 gUTTnE9GbMliNskJKCvJiTpbFo98mGpo5c9KfeGBskBY1GfzVHg4Djvb6Fx0GDBJ9c4jG
	 7unYPQbGK/YytD4RpUNB7aKvpTFtnP971L+Yy6WJww6N6rpiadd5Q+aKGPAVHnHVgHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660179;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=B+avzulW9R4prrOP717hMzLFT626LlwP3IQu+hV7beU=;
	b=twxDIw8o2kUN4Wzd5J6MFfiahUcFwlGj1s77YQTydqVqAL04WX2sWVe6c7trOD67b9aX
	 PVyxmcc7aIOeIquTLu7bhl6LW7CIYrgb3H9ZNy/2gXrnfXzAbLjqRHapOyDDUG0tI5lVD
	 RG1mJ1uCv/K1P0In9fc4ieQLQcTXVc3Q+ka90c2FJe9CMIBUmx8v25cPktzZCZTM6XX25
	 qaDnJFunQUmzorv2o2i9beKFd/TfK2XsRNKl/Ld42d66ceisKpc851o88cuO4JNu5FAcI
	 Ph4G5kLM4oXQSdzk0fWH68upKIUqwVwcMLCnnCygyq6XCuTF+eu2qhGwr0yedeqVxMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="nCw7ayW/";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6183960A260A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6183960A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=nCw7ayW/
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261022090936euoutp02a039a6af949f09a0c81d85d979edbd1f~gzu7Es66a0646506465euoutp02Y
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:09:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261022090936euoutp02a039a6af949f09a0c81d85d979edbd1f~gzu7Es66a0646506465euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792660176;
	bh=B+avzulW9R4prrOP717hMzLFT626LlwP3IQu+hV7beU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=nCw7ayW/aMRNiOI4VJGzl0O/pQvOZgPSvR9s8dLwKoCu35jbGWQO170o95eIGdYkS
	 NtFXWHsQwxrwUrjnu86VrwnNrn5JSXZMUQnDRSk1A7Ui375EcFUnWYHVOD5Io/T31w
	 ugFSW2I4r0Us2sKYxXKz6o8Y4nfKG+sMi/CJg4rw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261022090935eucas1p2d0d630d442257b6c6e92cd5a46d72e5a~gzu6giERh0750807508eucas1p2e;
	Thu, 22 Oct 2026 09:09:35 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261022090935eusmtip1a96a52af195831af9d9ea4b6034c9413~gzu6DkAYd1570615706eusmtip1P;
	Thu, 22 Oct 2026 09:09:35 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Srinivas Kandagatla
	<srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] ASoC: codecs: wsa881x: Fix shared powerdown GPIO handling
Date: Thu, 22 Oct 2026 11:09:22 +0200
Message-ID: <20261022090923.769464-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261022090935eucas1p2d0d630d442257b6c6e92cd5a46d72e5a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261022090935eucas1p2d0d630d442257b6c6e92cd5a46d72e5a
X-EPHeader: CA
X-CMS-RootMailID: 20261022090935eucas1p2d0d630d442257b6c6e92cd5a46d72e5a
References: <CGME20261022090935eucas1p2d0d630d442257b6c6e92cd5a46d72e5a@eucas1p2.samsung.com>

On Qualcomm RB5 both WSA8815 speaker amplifiers share a single powerdown
GPIO (TLMM 130), which is handled by the shared GPIO proxy. Since commit
b30973e8c392 ("gpio: shared: make the voting mechanism adaptable") the
proxy treats the value set by the first user on request as the default
and lets any single user vote for the opposite value.

The driver requests the GPIO de-asserted (GPIOD_OUT_LOW), so powering the
amplifier up became the default and asserting powerdown became the
winning vote. Once both amplifiers are runtime suspended, resuming them
deadlocks: the first one releases its powerdown vote and waits for
SoundWire enumeration, but the line stays asserted, because the second
amplifier is still suspended and votes for powerdown. The wait times out
and playback fails:

  wsa881x-codec sdw:1:0:0217:2110:00:3: Initialization not complete
  wsa881x-codec sdw:1:0:0217:2110:00:3: ASoC error (-110): at snd_soc_pcm_component_pm_runtime_get() on sdw:1:0:0217:2110:00:3

Request the GPIO asserted, so that powerdown is the default state and
the line is de-asserted as long as any amplifier needs to be powered,
then de-assert it to power up the amplifier as before.

Also use gpiod_set_value_cansleep() instead of gpiod_direction_output()
in the runtime PM callbacks. The line is already configured as an output
and the proxy resets its default value when the direction is set while
it has only a single user, which can happen if the other amplifiers have
not been probed yet.

Fixes: bfa336cee332 ("ASoC: wsa881x: Move custom workaround to gpiolib-of")
Fixes: b30973e8c392 ("gpio: shared: make the voting mechanism adaptable")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
The patch has been prepared with LLM assistance and tested on the real
Qualcomm RB5 board.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 sound/soc/codecs/wsa881x.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 47ac3e4985a5..4f3e6bc29c7e 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1115,11 +1115,19 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	if (!wsa881x)
 		return -ENOMEM;
 
-	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_LOW);
+	/*
+	 * The powerdown GPIO may be shared between several amplifiers. Request
+	 * it asserted, so the shared GPIO proxy treats powerdown as the default
+	 * state and keeps the line de-asserted as long as any amplifier needs
+	 * it, then power up this amplifier.
+	 */
+	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(wsa881x->sd_n))
 		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
 				     "Shutdown Control GPIO not found\n");
 
+	gpiod_set_value_cansleep(wsa881x->sd_n, 0);
+
 	dev_set_drvdata(dev, wsa881x);
 	wsa881x->slave = pdev;
 	wsa881x->dev = dev;
@@ -1154,7 +1162,7 @@ static int wsa881x_runtime_suspend(struct device *dev)
 	struct regmap *regmap = dev_get_regmap(dev, NULL);
 	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
 
-	gpiod_direction_output(wsa881x->sd_n, 1);
+	gpiod_set_value_cansleep(wsa881x->sd_n, 1);
 
 	regcache_cache_only(regmap, true);
 	regcache_mark_dirty(regmap);
@@ -1169,11 +1177,11 @@ static int wsa881x_runtime_resume(struct device *dev)
 	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
 	int ret;
 
-	gpiod_direction_output(wsa881x->sd_n, 0);
+	gpiod_set_value_cansleep(wsa881x->sd_n, 0);
 
 	ret = sdw_slave_wait_for_init(slave, WSA881X_PROBE_TIMEOUT);
 	if (ret) {
-		gpiod_direction_output(wsa881x->sd_n, 1);
+		gpiod_set_value_cansleep(wsa881x->sd_n, 1);
 		return ret;
 	}
 
@@ -1182,7 +1190,7 @@ static int wsa881x_runtime_resume(struct device *dev)
 	if (ret) {
 		regcache_cache_only(regmap, true);
 		regcache_mark_dirty(regmap);
-		gpiod_direction_output(wsa881x->sd_n, 1);
+		gpiod_set_value_cansleep(wsa881x->sd_n, 1);
 		return ret;
 	}
 
-- 
2.43.0

