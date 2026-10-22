Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687166;
	b=HZkonjqBSPKmZC1wshfheRCjPj5rM2Wt6YjrUJIrzIPEUE3imCEbO5yR59e9kNiar42a
	 h14l7soT0klYM8TKC0eGJrAeGeXs+sG86D0pguamDmaERFdPo90Rrie7afqZtnDd0yL6S
	 aT+F57BkwVzdVRdzYCkY+WR23YztO6g3ypsTRZFO612opB5F2hApTJ2jj0X0mvOyRMweU
	 L22Klksj2j5RcKDvK48q2tXqXu1SUcGXYfwTbEO8OxEqH1Lyqz5axJJdtKX7r0mQjOr4s
	 TTBJY4lFNpAc9eLJepyX7yVPHZhXTivoZRK+MdfsMxq/Fnm23C57Dg/YWQuC1bmf+XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687166;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=hsr4q6N64Fcf6mYkwtlmKaY913OD6ROMQBz3nI6nZSA=;
	b=ygGkrn2yKrYm71gSXcxXnptVwZPORU5nOSnli0RopL9zJ6kIavNKYwU+pGV9d3I3mzJT
	 bcJzQjqJnetzL60HCTPpTfDlZ5G7PRc+zRocJxlgK+zwUUG1d6UmBmxzYVBB49dvklCOS
	 w2TNsyJVxa6wN+82EwNMpBBlvRMunbJmVkvTKZMG+OW7ZoEVcN8UrrR65BNaiQQeD138S
	 gieeaTfBTN9XYCuZQZssCnbMN4p8+DC5BMTHq3lVH/2NTv6/PIokOqUL1fdJQrBBh6jr7
	 1RC874InjDZqeGAIzO5uXYuRU+VTWxSuRflCQVdvslE6Z7bDtdQn2oogzvbtr9SwnhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Osoh/pow";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3206606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3206606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Osoh/pow
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7B763C5847E;
	Thu, 22 Oct 2026 16:40:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10EF060763;
	Thu, 22 Oct 2026 16:39:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CCA3910328EDB;
	Thu, 22 Oct 2026 18:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792687158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hsr4q6N64Fcf6mYkwtlmKaY913OD6ROMQBz3nI6nZSA=;
	b=Osoh/powtRvm8laxTWwHQorj/7S0Orjw58SZ1kmNiwaDR47d2tW0qs6r0IVHwGXsquGzD/
	e3Qe8SYUZWDZsX3UkRsX4Km96dbjSalHiWhjxxsyNblndh8zmGDTl1tb1WNnt2jwYyhwqG
	sIUVDrfvqyggTX4PsZt5IUEqrUkvO+sdOPDCkOM9qpp4nNtJc15tw8+wAldAl7ApJgiNnD
	2frRP1gtvG/ggq6MgDoSOvpZ5fTBkSb3o/v6jBbvSJkuKrdM1FIA8fod0KaTJbZi/Hhb5o
	PyhFPjxlkk43+e1JfXlkJk888aQiMXmYVQfP6kj3Wo+NM0rl85HWG/zDLGxAEQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 22 Oct 2026 18:38:02 +0200
Subject: [PATCH v4 6/8] drm/bridge: Expose link training state via new
 DRM_BRIDGE_OP_DP flag
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-feat_link_cap-v4-6-a4f3f6e8cad9@bootlin.com>
References: <20261022-feat_link_cap-v4-0-a4f3f6e8cad9@bootlin.com>
In-Reply-To: <20261022-feat_link_cap-v4-0-a4f3f6e8cad9@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3

Introduce DRM_BRIDGE_OP_DP, a new bridge operation flag for bridges
that provide DisplayPort connector operations with link training support.
Bridges advertising this flag must fill the dp_link_caps field in
struct drm_bridge with their link capabilities.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v3:
- Mone on from drmm_connector_dp_init() to drm_dp_source_set_caps().

Change in v2:
- New patch
---
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 29 ++++++++++++++++++++++++++
 include/drm/drm_bridge.h                       | 13 ++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index df09cf9a8ca19..ce2f6d62c76d0 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -19,6 +19,7 @@ config DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select DRM_DISPLAY_HDMI_CEC_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
+	select DRM_DISPLAY_DP_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 81f3e26f6fdf5..5b58e86da6259 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -26,6 +26,7 @@
 #include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
+#include <drm/display/drm_dp_helper.h>
 
 /**
  * DOC: overview
@@ -109,6 +110,13 @@ struct drm_bridge_connector {
 	 * HDMI Audio infrastructure, if any (see &DRM_BRIDGE_OP_HDMI_AUDIO).
 	 */
 	struct drm_bridge *bridge_hdmi_audio;
+	/**
+	 * @bridge_dp:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * DisplayPort connector infrastructure, if any (see &DRM_BRIDGE_OP_DP).
+	 */
+	struct drm_bridge *bridge_dp;
 	/**
 	 * @bridge_dp_audio:
 	 *
@@ -835,6 +843,7 @@ static void drm_bridge_connector_put_bridges(struct drm_device *dev, void *data)
 	drm_bridge_put(bridge_connector->bridge_hdmi_audio);
 	drm_bridge_put(bridge_connector->bridge_dp_audio);
 	drm_bridge_put(bridge_connector->bridge_hdmi_cec);
+	drm_bridge_put(bridge_connector->bridge_dp);
 }
 
 /**
@@ -968,6 +977,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_hdmi_audio = drm_bridge_get(bridge);
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_DP) {
+			if (bridge_connector->bridge_dp)
+				return ERR_PTR(-EBUSY);
+			if (!bridge->dp_link_caps)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_dp = drm_bridge_get(bridge);
+		}
+
 		if (bridge->ops & DRM_BRIDGE_OP_DP_AUDIO) {
 			if (bridge_connector->bridge_dp_audio)
 				return ERR_PTR(-EBUSY);
@@ -1079,6 +1097,17 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       connector_type, ddc);
 		if (ret)
 			return ERR_PTR(ret);
+	} else if (bridge_connector->bridge_dp) {
+		ret = drmm_connector_init(drm, connector,
+					  &drm_bridge_connector_funcs,
+					  connector_type, ddc);
+		if (ret)
+			return ERR_PTR(ret);
+
+		ret = drm_dp_source_set_caps(connector,
+					     bridge_connector->bridge_dp->dp_link_caps);
+		if (ret)
+			return ERR_PTR(ret);
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d2..d1430b2b72518 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1021,6 +1021,14 @@ enum drm_bridge_ops {
 	 * &drm_bridge_funcs->hdmi_clear_spd_infoframe callbacks.
 	 */
 	DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME = BIT(10),
+	/**
+	 * @DRM_BRIDGE_OP_DP: The bridge provides DisplayPort connector
+	 * operations, including link training support. Bridges that set
+	 * this flag must provide DisplayPort-related information and
+	 * fill the &drm_bridge->dp_link_caps link training
+	 * capabilities.
+	 */
+	DRM_BRIDGE_OP_DP = BIT(11),
 };
 
 /**
@@ -1214,6 +1222,11 @@ struct drm_bridge {
 	 */
 	void *hpd_data;
 
+	/**
+	 * @dp_link_caps: DisplayPort link capabilities
+	 */
+	const struct drm_connector_dp_link_caps *dp_link_caps;
+
 	/**
 	 * @next_bridge: Pointer to the following bridge, automatically put
 	 * when this bridge is freed (i.e. at destroy time). This is for

-- 
2.43.0

