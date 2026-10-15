Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46BE4FDA68
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063007; cv=none; b=UyN8NsyONe/4IvHsLIee9zaS1lEZpEaDNrA0F1ZG62+VGEUbE5joEeP2dZZOcTnyGPr7dnD8n876/eCA5Vbl0rZHWSgUqdog6rpGvMSZGGlIraYEWTnhzq12ZflBlLunVQ7u2dYQwPATssZrHNQCjWUSZ7KUhK1Y5egCOBQl8Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063007; c=relaxed/simple;
	bh=Ce/IUl8m0EIXqaAmMjx6Mj55YSBD7+khbCWc5Mp8TZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQ/o+UqHkPGhVpwlEm2XBR+QEIaoG43dIBV/DcCEyeaK4+dXIStJYnorVTjJv0a2BGgOPsujnXrn4/wBTzSDnpYuu3WqwmhZGFIT1oLBFUpYKsQk03JrCrPrCeOy8Mx1teTRMkQ1FOLHQIMKzSBO9TrM3MVv48ZmEFD+1eoW+fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X6sLe+jV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X6sLe+jV"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 408521552;
	Thu, 15 Oct 2026 13:14:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792062870;
	bh=Ce/IUl8m0EIXqaAmMjx6Mj55YSBD7+khbCWc5Mp8TZY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X6sLe+jV6y++wZL5uy+GSJPLMRY9MawpYnGuLuBaZwWvgwqZNsvUdu9W1a2zMnU+t
	 zg+rqS7Vd55zzPTYSNgMzJyolbfiULkT79/pSXAiiilRrHjPkToBJVAFGxZXj1O+xc
	 2MmATU2lbNSfD01xXW6yOh/+jbKqxVOuW1cF8whU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 15 Oct 2026 14:15:57 +0300
Subject: [PATCH v5 06/13] drm/bridge: tc358762: Improve DPI enable handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tc358762-fixes-v5-6-7cd721a6451b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Ce/IUl8m0EIXqaAmMjx6Mj55YSBD7+khbCWc5Mp8TZY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq0LYGbzQc28JrSZFi0DhYt8mcNpjIK+Km61l+j
 j+uoGPD4eGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCatC2BgAKCRD6PaqMvJYe
 9QSLD/4nZNbNw4NeanW0sJhDejFKjKRqRxNb4seo8652MzisVSsHHGjbdJYmmVWcj5nu2UHV89d
 cyEPx3CTwI5uObmkeVVSZZDSBKO/c+4XenqzMfcit51CL9KtcFQRIPESKfoLzvgpNkUw67y1zHU
 0cHHQvG+Fz44xBi59lexhHoatexsX4iodQh6SRx3QLdNJoNgGnDhO9m+jv/tkwE+lb7u0MGQaay
 AZNAKuIAjxaNCogNPEbJtiSNUnsxURg4t+FvHxdJguL0oJBmFnKFslWmnmhfxRxy/KzDyidXOeb
 Q7ufTLj78ms4g1ITpF6ZCrIQngjnVKZFbpPmvbT0qiyrDV3tdMLgUvlRg8+I+fKsgOz9jxaqf5v
 6TBhkBFK7J9malgIEdLbxByOu9thLEZm1OTfGfRf7yMfKEuj6MEqMoMAVas4zBPvS430g7RoVzp
 GNeLkEQL+cE39adGjibdmrSUkW8Bj+hf6IRbv7Zz3wlpK1gGngzcMkrLvC3xMUbme6LbpuwEOF6
 LMVhuKZq1vu9+esKJA82cz7Bodce4qNDgHb/SM+VqQhLykaaQUUBCloq+bYHSGojfrPkoDB11UO
 /MNlFUQprpBmyhzvWZoWmk3GzHNKQhEnfMGT83jZOi9lBKxEjDmuInrqI5YlzN5boUtjAWCv+w5
 sfROr1cNezS7HKw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The HW reset defaults has DPIENABLE bit as set. In the current driver we
configure and enable various things while DPIENABLE is set. This results
in a temporary DPI output with wrong timings, which may cause artifacts
on the panel.

Fix this by clearing DPIEANBLE as the first thing when we start to
enable the display. DPIENABLE is set later with the rest of the LCDCTRL
configuration, and at that time we have done all the other
configurations.

Also, for symmetry and possibly improving the DPI output at disable
time, explicitly disable DPIENABLE when disabling the bridge.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 91bc79d36a74..19f328b6e798 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -134,6 +134,12 @@ static int tc358762_init(struct tc358762 *ctx)
 {
 	u32 lcdctrl;
 
+	/*
+	 * DPIENABLE has reset default of 1. Make sure we don't output on
+	 * DPI until we have finished the coniguration.
+	 */
+	tc358762_write(ctx, LCDCTRL, 0);
+
 	tc358762_write(ctx, SYSCTRL,
 		       FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
 		       FIELD_PREP(SYSCTRL_DPISTB_IO_MASK, SYSCTRL_DPISTB_IO_4MA) |
@@ -185,6 +191,9 @@ static void tc358762_post_disable(struct drm_bridge *bridge,
 
 	ctx->pre_enabled = false;
 
+	/* Turn off the DPI output */
+	tc358762_write(ctx, LCDCTRL, 0);
+
 	if (ctx->reset_gpio)
 		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 

-- 
2.43.0

