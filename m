Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67555528454
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913738; cv=none; b=nmEzxJBLowsi55+icUm++DEX7lAB+wPcoZS+EohEU1C2J0A2lq1bGtyKyR6ZKJ5YQukmVgmWWsW3KjVuTytiyGb/ZRbGOZMGrri0XLtjA2NcUxBgfXOJlhOrBC0P0jCNNn3VjlKuY/krG423u7DRjFXYG3yXO5LHzqaiMKPA4qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913738; c=relaxed/simple;
	bh=PGlNX6+O54ePqbbI0loZvGRJwAFrvtoaXpwp3MBnjXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfqvULprgNtE8tF7qoLj7tqicrqEeS/tEVlvo4igJPxGd79ZVGrTnNAZn9sX7HcAbibrmzh4ogTwZG+X/7iG4mLIgtgUd0pVNKTfWa03JWRTFzauekZseGNZv8h4l3A31TKQv/C5eckFJK+5nOTz+fOtCQyZlxwzb9lU6V4/BU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j8pBgwxt; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I7a1ficV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j8pBgwxt";
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I7a1ficV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F1D6E1A1216
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:48:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1BF560362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:48:54 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 58B7611D71873; Tue, 13 Oct 2026 19:48:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913734; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hsr4q6N64Fcf6mYkwtlmKaY913OD6ROMQBz3nI6nZSA=;
	b=j8pBgwxtzK+wP5cAd2pPTM/MeqMHgbOzbKrItbfv8uw+Q2DeJ+8ja+PulJCYqv+Mu/59VQ
	w5PF2nHSw3BSKVECqb22HZo0huu57Ngsr7rdYy/vU0fwZS4Awi+mHO2/ELFhfr/Z3psDa+
	OUcwPXOHIUV7JZtWTq0Y5qiiqhHZYMvyOo/thXUeCXi15nzcWTTrfFqqD4QhTV9R2uBYUt
	wmfw4tA9NQSHMB+xQ5I0FtjX0WO4vfpTPgGyikEtNyCm+Cr3unWPYGV9WZyymvhnyaPUrk
	94eW3vt5wkwAOLA1B+ILLXXZEvm9EUvhekj+dJfwBexKYSkgBVMTulfTvWsuqA==
Authentication-Results: mail.galae.net;
	none
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id EIpuH8j4zGoogBEAtaWaaQ
	(envelope-from <kory.maincent@bootlin.com>)
	for <kory.maincent@bootlin.com>; Mon, 12 Oct 2026 17:12:08 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52BBF11D70CC0;
	Mon, 12 Oct 2026 17:12:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791817926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hsr4q6N64Fcf6mYkwtlmKaY913OD6ROMQBz3nI6nZSA=;
	b=I7a1ficVVdXqQhn4g9Q+0hbsycz4p4gNccwb07fbYPLvJVjsl4tPdCQFTQhWfUqUdYgfgH
	8pmfYdPFIA9HDbXnRaIqxUIjBYSLzUKbycpsFXgHNEQGCOOwnR1KK3ulVffmrFsz00cH85
	RamtkeujxQJSN/PbhNpQvzeYPIaLNwVxudVf93sRRfACKmeY27pzc3qZFu6l7NmYagkefv
	vkvirJ/KB6JrumGCIPAEx5+3JMLY+VgcH8bj8aceXyMrLFHkaSK4GiYqQtBIKtthcOYszI
	hiW5rXs5YiSA2IyyZDL7CHDcDTAR2VmtYGYUT2R60VBQkJoNUfZ971AKINtT0A==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 12 Oct 2026 17:11:01 +0200
Subject: [PATCH RFC v3 6/8] drm/bridge: Expose link training state via new
 DRM_BRIDGE_OP_DP flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-feat_link_cap-v3-6-7517f4aba0f3@bootlin.com>
References: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
In-Reply-To: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
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
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 58B7611D71873
X-Spamd-Result: default: False [0.32 / 30.00];
	BAYES_HAM(-2.18)[89.07%];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[26];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	BCC(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	FORWARDED(0.00)[kory.maincent@bootlin.com];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,linaro.org,ideasonboard.com,kwiboo.se,bootlin.com,pengutronix.de,collabora.com];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:mid,bootlin.com:email];
	PREVIOUSLY_DELIVERED(0.00)[kory.maincent@bootlin.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]

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

