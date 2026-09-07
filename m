Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF48B478E5E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780527; cv=none; b=QIWg7+1kzAKYv0dhXFPrEAxypUydqYqq6a+KbpfKdnG8UxwQneLtXucOzUeO6xv84yh1fAa/beGKxiTtXTWBF9cAFael+ACt/qccNiAe0sdTwq8v5OLRT5P2l/PD4LoU7GF37p+EpqiKyDcPQU1JssI39Hlpj/PdQDpx1bQnkI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780527; c=relaxed/simple;
	bh=geHLfYA2B85iISTDkkTHsQ6ZYOxadw3UAz6UOplTIUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mVGf92AYaT43qtYIa/m/fnzGVfgklA+JLSBI7VG5ihvdsSaii6X0P6Ucyk9MRIrZQL46/eM8fKFZu6vwXbEPm8646B8DK33ftUo3H6WTuVFz78d36/VsnXE71JUiZ+tNiIjrqUOufpf7JkqHitRF4kMd8BPXOtJiOOA7fEzabjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Re7NzjI1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Re7NzjI1"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A47A115B2;
	Mon,  7 Sep 2026 13:26:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788780418;
	bh=geHLfYA2B85iISTDkkTHsQ6ZYOxadw3UAz6UOplTIUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Re7NzjI1k8zbwLupY0t5bVMR34iLAZT7NnEWj0mMehtjF0iS9r+NBTzCbKF1oyqoC
	 1YsZNGdtgLGB3ug2ho2VvuGJmSt5zk3rVsmOZuMX5AUGBozXVfVcbpStb73EPzB8LS
	 pRtkufEsPac2yaOQRbn2rWj30jBB/kMvjAPOEzpY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 07 Sep 2026 14:28:05 +0300
Subject: [PATCH v4 10/13] drm/bridge: tc358762: Move tc358762_init() into
 tc358762_enable()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tc358762-fixes-v4-10-e3fc3ab5cd83@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3802;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=geHLfYA2B85iISTDkkTHsQ6ZYOxadw3UAz6UOplTIUk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnp/Uraz2c5ZP8i+NfRLGzd5d1bEedwf/L6uNx
 OqVWdyqvbaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6f1AAKCRD6PaqMvJYe
 9eGmEACi1+Rx9O7mkOTPoRqjbJ2hMjpXDQ8J8eEBKSVBFVLktFdB6XGzKUr+yIptyslgcBzVNPt
 COezNaZOTgL+1dWHG5LQL2kRjTMRB5qBBU5wI5NkPKy91P9UsRQSNkIfYJc0pu1eYoViYLXTci9
 hhdqYjvObrTR9t/xDHHuhiPE9yNS+TqLJfom7REbg0prebTyK33uslZSBdThz7b6t43u3GBjHfQ
 CbAfu1S8TDyLeYYKGzDuO/TszvCzItYO/bg6UGeORAAUbQnXvKRDVtNOkvu8U7mgL3Liyo308gk
 meZPAxCwvgjDtgvlUfL74+04J8P6iXBxnJA27RuQV/1p/ma2xR9Z+h4arLiNsK2YQQR8aVw+r0T
 chE6v5BLdXTWn5QL2BWY7c3/mayij+Kjh6planEKCrKAMKW7zBme+IXJ2AtSD9JoaClDraQYGhq
 koMX15QNTocO97C78/GauRDUBVZIxGgMb5++KCHRRTCK84ZaNqdac89vFOkRe68Mfez9U7UJWWO
 YmxQ8Fyumo1vULgx+e43ATWnB/DWKNfVgBF+emlzdBuj59pHeF7OnKahwTnUFUbz7js4YW0ju1Q
 n4Ysx96+DIGf1+QvmuxewRGGH/N+s0A+nbmxPq+AQkwx4bwmBE8GGFJxOwIfN9n/M30J+5syoPU
 HRzXMxn2/AKzXzg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The only thing tc358762_enable() does is call tc358762_init(). Inline
the tc358762_init() into tc358762_enable(), for simplicity and to make
it easier to improve the tc358762_enable() in the following commits. No
functional change.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 104 ++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 3a2e6a97feb8..ff7913441752 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -138,9 +138,56 @@ static inline struct tc358762 *bridge_to_tc358762(struct drm_bridge *bridge)
 	return container_of(bridge, struct tc358762, bridge);
 }
 
-static int tc358762_init(struct tc358762 *ctx)
+static void tc358762_post_disable(struct drm_bridge *bridge,
+				  struct drm_atomic_commit *state)
+{
+	struct tc358762 *ctx = bridge_to_tc358762(bridge);
+	int ret;
+
+	/*
+	 * The post_disable hook might be called multiple times.
+	 * We want to avoid regulator imbalance below.
+	 */
+	if (!ctx->pre_enabled)
+		return;
+
+	ctx->pre_enabled = false;
+
+	/* Turn off the DPI output */
+	tc358762_write(ctx, LCDCTRL, 0);
+
+	if (ctx->reset_gpio)
+		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+
+	ret = regulator_disable(ctx->regulator);
+	if (ret < 0)
+		dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
+}
+
+static void tc358762_pre_enable(struct drm_bridge *bridge,
+				struct drm_atomic_commit *state)
 {
+	struct tc358762 *ctx = bridge_to_tc358762(bridge);
+	int ret;
+
+	ret = regulator_enable(ctx->regulator);
+	if (ret < 0)
+		dev_err(ctx->dev, "error enabling regulators (%d)\n", ret);
+
+	if (ctx->reset_gpio) {
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		usleep_range(5000, 10000);
+	}
+
+	ctx->pre_enabled = true;
+}
+
+static void tc358762_enable(struct drm_bridge *bridge,
+			    struct drm_atomic_commit *state)
+{
+	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 	u32 lcdctrl;
+	int ret;
 
 	/*
 	 * DPIENABLE has reset default of 1. Make sure we don't output on
@@ -203,60 +250,7 @@ static int tc358762_init(struct tc358762 *ctx)
 
 	msleep(100);
 
-	return tc358762_clear_error(ctx);
-}
-
-static void tc358762_post_disable(struct drm_bridge *bridge,
-				  struct drm_atomic_commit *state)
-{
-	struct tc358762 *ctx = bridge_to_tc358762(bridge);
-	int ret;
-
-	/*
-	 * The post_disable hook might be called multiple times.
-	 * We want to avoid regulator imbalance below.
-	 */
-	if (!ctx->pre_enabled)
-		return;
-
-	ctx->pre_enabled = false;
-
-	/* Turn off the DPI output */
-	tc358762_write(ctx, LCDCTRL, 0);
-
-	if (ctx->reset_gpio)
-		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-
-	ret = regulator_disable(ctx->regulator);
-	if (ret < 0)
-		dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
-}
-
-static void tc358762_pre_enable(struct drm_bridge *bridge,
-				struct drm_atomic_commit *state)
-{
-	struct tc358762 *ctx = bridge_to_tc358762(bridge);
-	int ret;
-
-	ret = regulator_enable(ctx->regulator);
-	if (ret < 0)
-		dev_err(ctx->dev, "error enabling regulators (%d)\n", ret);
-
-	if (ctx->reset_gpio) {
-		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-		usleep_range(5000, 10000);
-	}
-
-	ctx->pre_enabled = true;
-}
-
-static void tc358762_enable(struct drm_bridge *bridge,
-			    struct drm_atomic_commit *state)
-{
-	struct tc358762 *ctx = bridge_to_tc358762(bridge);
-	int ret;
-
-	ret = tc358762_init(ctx);
+	ret = tc358762_clear_error(ctx);
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
 }

-- 
2.43.0

