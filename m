Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687184;
	b=Tf2V1QaDlPI97+iFzn+z60Q0Y2laVz4epdQMI4rU8nrKH+9WML7CKb3GOKb5Eus2FDzw
	 U6eG1RRcju78SZzyTL1jD8Clt2BPQ3hKa+qTpdsWsY+kZgtdtRhv0RR9I7jKxzrnz0YVy
	 KshvaLhYaCiDcqXL5TdbKSthxOzuYFqEoEqJEFbHN3R+6JP4NtMpB0mED918cuhxyQaMY
	 6y6H7MfvsMiOAPjjDef4a28EBB7dKpYM9dIZriNV/JN/bYSFES9sBInweXtcdQ7adLXA6
	 vgWSb7s82wpHEPkO15K5hRZpU6K2Fz4YjrVGvbzV+/iJAGZsTIwNnZ4dKhMyb6bIuvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687184;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=StysNLdbp3G1oFHxTS6FrcZ8MFyidPzjh/fRUss0P6c=;
	b=TM5YbZt1EJ3it/+9WjrDEXuGkKXMPly/dGQPFSxMfe1K8zkg191L1KhhuUWYC+8y8YfQ
	 FXj8HX9GO2YWRbH2RSx4/UliB2mxM+5YC+EU7e0TzEwWO3z2F991TDlA4D+RxvdH10UGn
	 RmSJoSQB1gYwDzsGMZC2kRPiniLAuO0rgU5bJpUQpSHkJw/8ykBwJbC28r4LaXdhuVLZb
	 hoQnUuW4viP0I5ZcwutdbqT0Qb0tXvOXCtXx+5b9WCtwlGAsa++X1nEwPt84cx63TflSy
	 wOGqVmEmhvJLTx/jhq+mMF93IEANl5YUIZwT1/IFlFLaXPsNZlCLqhvyHQqYK95lm9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ujno0Th7;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397DC606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 397DC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ujno0Th7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 24DDAC51458;
	Thu, 22 Oct 2026 16:40:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB4BD60763;
	Thu, 22 Oct 2026 16:39:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C322A10328E8D;
	Thu, 22 Oct 2026 18:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792687176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=StysNLdbp3G1oFHxTS6FrcZ8MFyidPzjh/fRUss0P6c=;
	b=Ujno0Th7EPhz/6QSKu7yGLMJZrd2QJ/XvLoNw35A0QIEae2DSTIDq++frzLK2PZoALfC8i
	QvgE8ja7WJejS7HaNrnv7kNTsPpPXoWqOnelNtzyyT4MSEwUyCk4sq4Rhbg7kOk2CZz0fA
	4SAx5bgTt5vlVcroIIqdkGQBcAmvHwYNKAV3Z/3HWXistz6m3ev7pA4kYY7YpacwlTMJ6F
	8QL9pPP6w7xaoLcEGgslkpOYt86ZRiCFQPZXJtbuVfpxVsjrpzXCbYGisEtbY0Prvrs6fs
	aUQXX2UoKIEvZV/2lpbz9w+wXwAQ4CrfauZdjESuIz6O0+CgQbZP56Mc2bs4GQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Thu, 22 Oct 2026 18:38:04 +0200
Subject: [PATCH v4 8/8] drm/mediatek: Use dp_connector helpers to expose
 link training state
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
Message-Id: <20261022-feat_link_cap-v4-8-a4f3f6e8cad9@bootlin.com>
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

Adopt the DRM core DisplayPort helpers by setting DRM_BRIDGE_OP_DP and
populating the bridge dp_link_caps at probe time. Report the sink
capabilities on hotplug, reset them on disconnect, and report the link
parameters once link training succeeds.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Not tested. I believed I had a board with this device, but it actually uses
an anx7625 bridge. I'm unable to test it; it would be appreciated if
someone else could, so the change isn't dropped.

Changes in v3:
- Sync and report sink capabilities from the HPD thread for DisplayPort,
  or in atomic_enable for eDP. Reset them on unplug, or atomic disable
  and only report link parameters after successful training.
- Add connection_mutex lock for DisplayPort in the IRQ thread.

Changes in v2:
- Remove voltage swing and pre emphasis properties.
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 61 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index f656b85b84212..b87e171d88d83 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1812,6 +1812,17 @@ static void mtk_dp_train_change_mode(struct mtk_dp *mtk_dp)
 	mtk_dp_reset_swing_pre_emphasis(mtk_dp);
 }
 
+static void mtk_dp_report_link_train(struct mtk_dp *mtk_dp)
+{
+	u32 rate, nlanes;
+	bool dsc = false;
+
+	rate = drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_rate);
+	nlanes = mtk_dp->train_info.lane_count;
+
+	drm_dp_set_cur_link_params(mtk_dp->conn, rate, nlanes, dsc);
+}
+
 static int mtk_dp_training(struct mtk_dp *mtk_dp)
 {
 	int ret;
@@ -2015,6 +2026,8 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 			ret = mtk_dp_training(mtk_dp);
 			if (ret)
 				drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
+			else
+				mtk_dp_report_link_train(mtk_dp);
 
 			mtk_dp->enabled = true;
 		}
@@ -2145,9 +2158,12 @@ mtk_dp_bdg_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	enum drm_connector_status ret = connector_status_disconnected;
 	bool enabled = mtk_dp->enabled;
+	int err;
 
-	if (!mtk_dp->train_info.cable_plugged_in)
+	if (!mtk_dp->train_info.cable_plugged_in) {
+		drm_dp_sink_reset_caps(connector);
 		return ret;
+	}
 
 	if (!enabled)
 		mtk_dp_aux_panel_poweron(mtk_dp, true);
@@ -2160,9 +2176,18 @@ mtk_dp_bdg_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 	 * whether we connect to a sink device.
 	 */
 
-	if (drm_dp_read_sink_count(&mtk_dp->aux) > 0)
+	if (drm_dp_read_sink_count(&mtk_dp->aux) > 0) {
 		ret = connector_status_connected;
 
+		err = drm_dp_sink_sync_caps(connector, &mtk_dp->aux, NULL);
+		if (err)
+			drm_dbg_kms(mtk_dp->aux.drm_dev,
+				    "%s: error sink caps synchronisation (%d)\n",
+				    mtk_dp->aux.name, err);
+	} else {
+		drm_dp_sink_reset_caps(connector);
+	}
+
 	if (!enabled)
 		mtk_dp_aux_panel_poweron(mtk_dp, false);
 
@@ -2390,6 +2415,12 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (mtk_dp->data->bridge_type == DRM_MODE_CONNECTOR_eDP) {
 		mtk_dp_aux_panel_poweron(mtk_dp, true);
 
+		ret = drm_dp_sink_sync_caps(mtk_dp->conn, &mtk_dp->aux, NULL);
+		if (ret)
+			drm_dbg_kms(mtk_dp->aux.drm_dev,
+				    "%s: error sink caps synchronisation (%d)\n",
+				    mtk_dp->aux.name, ret);
+
 		/* Training */
 		ret = mtk_dp_training(mtk_dp);
 		if (ret) {
@@ -2398,6 +2429,8 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		}
 	}
 
+	mtk_dp_report_link_train(mtk_dp);
+
 	ret = mtk_dp_video_config(mtk_dp);
 	if (ret)
 		goto power_off_aux;
@@ -2435,6 +2468,7 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	if (mtk_dp->data->bridge_type == DRM_MODE_CONNECTOR_eDP) {
 		mtk_dp->enabled = false;
 		mtk_dp_aux_panel_poweron(mtk_dp, false);
+		drm_dp_sink_reset_caps(mtk_dp->conn);
 	}
 
 	mtk_dp_update_plugged_status(mtk_dp);
@@ -2740,11 +2774,14 @@ static int mtk_dp_edp_link_panel(struct drm_dp_aux *mtk_aux)
 	return 0;
 }
 
+static int mtk_dp_rates[] = {162000, 270000, 540000, 810000};
+
 static int mtk_dp_probe(struct platform_device *pdev)
 {
+	struct drm_connector_dp_link_caps *source_caps;
 	struct mtk_dp *mtk_dp;
 	struct device *dev = &pdev->dev;
-	int ret;
+	int ret, i, max_rate;
 
 	mtk_dp = devm_drm_bridge_alloc(dev, struct mtk_dp, bridge,
 				       &mtk_dp_bridge_funcs);
@@ -2758,6 +2795,20 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to parse dt\n");
 
+	source_caps = devm_kzalloc(dev, sizeof(*source_caps), GFP_KERNEL);
+	if (!source_caps)
+		return -ENOMEM;
+
+	source_caps->nlanes = mtk_dp->max_lanes;
+	source_caps->link_rates = mtk_dp_rates;
+
+	max_rate = drm_dp_bw_code_to_link_rate(mtk_dp->max_linkrate);
+	for (i = 0; i < ARRAY_SIZE(mtk_dp_rates); i++)
+		if (mtk_dp_rates[i] > max_rate)
+			break;
+
+	source_caps->nlink_rates = i;
+
 	/*
 	 * Request the interrupt and install service routine only if we are
 	 * on full DisplayPort.
@@ -2809,6 +2860,8 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
+	mtk_dp->bridge.dp_link_caps = source_caps;
+	mtk_dp->bridge.ops = DRM_BRIDGE_OP_DP;
 
 	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
 		/*
@@ -2849,7 +2902,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 			}
 		}
 	} else {
-		mtk_dp->bridge.ops = DRM_BRIDGE_OP_DETECT |
+		mtk_dp->bridge.ops |= DRM_BRIDGE_OP_DETECT |
 				     DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 		ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
 		if (ret)

-- 
2.43.0

