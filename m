Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2E751B16C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063016; cv=none; b=gaUDZkOGkCtfqG5f1ciNEgR2vX53HN5JXfgO/GPNqtdt7xeSOqL0UnZZmqkm4RkpaPSniya2c6oZokayYpwlv986jaEFp9koob/885cYRrJKHkmccNO4Qq1b3XQ4MHhNagINaXtuncrxJUKH/wbq1ZybTT6lsMxc9tMafHdgxPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063016; c=relaxed/simple;
	bh=qmTK+sh07qLJDCir3+0uUEb8MHWxjI292apJ2o9aOxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPIxNSGewvzmL3qqmCc0IJ5X9E1Ex2P37Z2vZzkHS4MV6Dp62HcpHUpC3N2FHCSWN2GkQmpFooZd5TgyqHfx1/EUVNBJVJa7O+s/1rzNfNs1tlLsq9kpwUunEzJp9eSrb7MxB55gkKKo41c9FO8VHE26nENq+KYT5K3Dmmcxej8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=o2jk8nVe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="o2jk8nVe"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DA4D22B;
	Thu, 15 Oct 2026 13:14:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792062874;
	bh=qmTK+sh07qLJDCir3+0uUEb8MHWxjI292apJ2o9aOxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o2jk8nVe616BtxvscrQadbPEhIPNdsI4Tuj6taP6E1sHJRqIy26/W4ZK/YKUgjgbx
	 srkgtg6HA4t23BVcUNaBJPdLRDo45KtU4NFYgeh2cPCuU4/gnTogWN1il2aF7izigt
	 OmYvEZdLXzcwPRoKN2DQfrTm7/YUBrNxrfNAIqxk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 15 Oct 2026 14:16:01 +0300
Subject: [PATCH v5 10/13] drm/bridge: tc358762: Move tc358762_init() into
 tc358762_enable()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tc358762-fixes-v5-10-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
In-Reply-To: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
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
 bh=qmTK+sh07qLJDCir3+0uUEb8MHWxjI292apJ2o9aOxA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq0LYIrhHDdtR0s1y6WKq98IMmeAvwT+XtYFDS2
 4elMVpSl8GJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCatC2CAAKCRD6PaqMvJYe
 9ejvD/9QU/vcabRDDYcEpJ1I0vi7xOR/7j32+wVf2mhbPxv9j6fKEMQazLE8cIQF/Lv+6UplPr+
 QtZYwXen9IDIn28gXR7+AX7+1vT97WILGp7C1aCQdxPr8pMCQmq3u+Nz6AtfXK6TwLPdN+xz1T8
 OJaHdg6cbHStZr9zUkECH3f7mY15nZ2mGv2CbyRZKllUOodd/j5itAThvyxUJozX4Ek27hsR3bP
 R/VNECqcOenXYeDMGNwZdYQ96nY0Q03BmxkKh5rV0jfG2bqTiwN1teJ9wSmMtAXzodH3mqaJxv4
 Mx3fqUAVhJR015foo89xu0BxxS4FmR1/PbQaLTJIx09v0yIL8S9IRS+iTBUfi9falwdeFnffu5C
 MzogUonEj0P4hqJBBUb6obLGG7dd1BoRhSyi/+eM5sfJ2eKq/YezTaFLNIetidg5J1r5z2kd53C
 4PyKqwkHywZfz8yhs65tm25kChILABYxAEWAwQjDw6A00ip+Ak2Mmg7ezdfxje8BN9QAUzG+woN
 xGWludPhg25O2kMRnyaaKUTX8w7Ojq7GQplx/J+flnfLQ84Duzbq0hwhulGOHv6eyfwx2fDWQal
 TN7E1bo1nq89/7IzYzsdjPSYa0kt6FLn+kS0T6smb4k738ZLpunOaqzHlVIA4s9pb4faqheGBUI
 8u9eW/cCM/vPPbg==
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
index 2baacef685a5..a91cf159ba27 100644
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

