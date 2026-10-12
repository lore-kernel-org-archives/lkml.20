Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F25496D3D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817927; cv=none; b=lEhSos0nUx00xRdp11kSSG2C8GWAzGongkIkWNA2yQZNrdSHORRoS1+ErKB5R6XHdqZzyT2eqNBzZpin2azyb7cRZnHdqw3cqpG6SGAW4oyiRT/b/N6aSXt/cKsHCV7VwOtz13zQjEjYyHfCn2DBZZNNrc3TUYOyK2oY/DisZkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817927; c=relaxed/simple;
	bh=pKu5JbcE8MslrQ/sltRMpK10/DJ6pH52x+AkUYNvYo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/SbKkc40E6K07apsbtj2xXaMv+9CTBYZ6aQmSrfCMz3+mBCXCKlTyY2IwtFfHyoEbp1A5PIo5CBvJywQJ13JoBMj+MVwddB1+KxonCcvUMz5jvfxhoLBS5Wduzeb4o19Pudk+HvSaDguuYXe+xf7Y8WiP9Ivlii9wTSmr46v98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tajA2AOZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tajA2AOZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A69F51A11EC;
	Mon, 12 Oct 2026 15:12:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 583E0601A6;
	Mon, 12 Oct 2026 15:12:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B92B11D7012D;
	Mon, 12 Oct 2026 17:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791817921; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EEytYnhdWFiA2ae8nKxRpdzwI0LpmuZtpTntf4QDUmg=;
	b=tajA2AOZ1+e1517AHIPILpHudJSpJhJ9UR4Om0MFh4FN9lYx8LwXkeeGy08aNpRw51ph4B
	ddNrBct6etIZP8PxM1KFSmWw82xw47ViwHQW/vcjsjaztFyZYb6ZB38UpVbSsByx8St8or
	iNoWxPmHYIp4EvL27Xly6QdsBDDMYP3MB5lbwAQN7jO3W7crI6+GJmu2RTU93R7m21wIs9
	fAt/INyEbHXZLlO4Y0m2VoSHI4sYOTK2H0dLm3o0RYDN1BIkWEDrpLGABicM7PESy6qvBh
	dX3FgbLpBExRk1hEFHUSXOMM+dYmZ8ELja2O+rUp48gD2bReKrVyrwBR5TtAaA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 12 Oct 2026 17:11:00 +0200
Subject: [PATCH RFC v3 5/8] drm/i915/display/dp: Use dp_connector helpers
 to expose link training state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-feat_link_cap-v3-5-7517f4aba0f3@bootlin.com>
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

Adopt the new DRM core DisplayPort helpers, which expose source and sink
capabilities along with the maximum and current link parameters to
userspace through the dp_link/ sysfs attributes.

Keep the sink's supported link rates unclamped in the new
dpcd_sink_rates/num_dpcd_sink_rates fields, rather than limiting them to
the rates the source supports.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Changes in v3:
- Move the call to new helpers around.
- Use real sink rates instead of the modified ones.

Changes in v2:
- Remove voltage swing and pre emphasis properties.
---
 drivers/gpu/drm/i915/display/intel_display_types.h |  2 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 55 +++++++++++++++++++++-
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 14 ++++++
 3 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 5f0fe18c0614e..025523ae58e6c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1845,6 +1845,8 @@ struct intel_dp {
 	/* sink rates as reported by DP_MAX_LINK_RATE/DP_SUPPORTED_LINK_RATES */
 	int num_sink_rates;
 	int sink_rates[DP_MAX_SUPPORTED_RATES];
+	int num_dpcd_sink_rates;
+	int dpcd_sink_rates[DP_MAX_SUPPORTED_RATES];
 	bool use_rate_select;
 	/* Max sink lane count as reported by DP_MAX_LANE_COUNT */
 	int max_sink_lane_count;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b769723a1c0fd..6af59e75bd666 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -189,6 +189,7 @@ static void intel_dp_set_default_sink_rates(struct intel_dp *intel_dp)
 {
 	intel_dp->sink_rates[0] = 162000;
 	intel_dp->num_sink_rates = 1;
+	intel_dp->num_dpcd_sink_rates = 0;
 }
 
 /* update sink rates from dpcd */
@@ -203,10 +204,14 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
 						     intel_dp->lttpr_common_caps,
 						     &intel_dp->desc,
 						     intel_dp->tunnel,
-						     intel_dp->sink_rates);
+						     intel_dp->dpcd_sink_rates);
 	if (num_sink_rates < 0)
 		num_sink_rates = 0;
 
+	intel_dp->num_dpcd_sink_rates = num_sink_rates;
+	memcpy(intel_dp->sink_rates, intel_dp->dpcd_sink_rates,
+	       sizeof(int) * num_sink_rates);
+
 	/*
 	 * Don't limit the rates of sinks with the 3.24 Gbps DPCD quirk
 	 * (needed, e.g., for Apple MBP 2017, 15 inch eDP Retina panels),
@@ -4646,10 +4651,14 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
 
 	num_sink_rates = drm_dp_read_edp_sink_rates(&intel_dp->aux,
 						    intel_dp->edp_dpcd[0],
-						    intel_dp->sink_rates);
+						    intel_dp->dpcd_sink_rates);
 	if (num_sink_rates < 0)
 		num_sink_rates = 0;
 
+	intel_dp->num_dpcd_sink_rates = num_sink_rates;
+	memcpy(intel_dp->sink_rates, intel_dp->dpcd_sink_rates,
+	       sizeof(int) * num_sink_rates);
+
 	/*
 	 * Some platforms cannot reliably drive HBR3 rates due to PHY limitations,
 	 * even if the sink advertises support. Reject any sink rates above HBR2 on
@@ -6188,6 +6197,20 @@ void intel_dp_dpcd_set_probe(struct intel_dp *intel_dp, bool force_on_external)
 			      intel_dp_needs_dpcd_probe(intel_dp, force_on_external));
 }
 
+static void intel_dp_set_sink_caps(struct intel_connector *connector,
+				   struct intel_dp *intel_dp)
+{
+	struct drm_connector_dp_link_caps link_caps;
+
+	link_caps.nlanes = drm_dp_get_max_lane_count(intel_dp->dpcd,
+						     intel_dp->lttpr_common_caps);
+	link_caps.link_rates = intel_dp->dpcd_sink_rates;
+	link_caps.nlink_rates = intel_dp->num_dpcd_sink_rates;
+	link_caps.dsc = drm_dp_sink_supports_dsc(connector->dp.dsc_dpcd);
+
+	drm_dp_sink_set_caps(&connector->base, &link_caps);
+}
+
 static int
 intel_dp_detect(struct drm_connector *_connector,
 		struct drm_modeset_acquire_ctx *ctx,
@@ -6259,6 +6282,8 @@ intel_dp_detect(struct drm_connector *_connector,
 
 		intel_dp_tunnel_uhbr_lanes_wa_reset(intel_dp);
 
+		drm_dp_sink_reset_caps(_connector);
+
 		goto out_unset_edid;
 	}
 
@@ -6290,6 +6315,8 @@ intel_dp_detect(struct drm_connector *_connector,
 
 	intel_dp_print_rates(intel_dp);
 
+	intel_dp_set_sink_caps(connector, intel_dp);
+
 	if (intel_dp->is_mst) {
 		/*
 		 * If we are in MST mode then this connector
@@ -7037,11 +7064,14 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 			struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(dig_port);
+	struct drm_connector_dp_link_caps link_caps;
 	struct intel_dp *intel_dp = &dig_port->dp;
 	struct intel_encoder *encoder = &dig_port->base;
 	struct drm_device *dev = encoder->base.dev;
 	enum port port = encoder->port;
+	int *rates;
 	int type;
+	int ret;
 
 	if (drm_WARN(dev, dig_port->max_lanes < 1,
 		     "Not enough lanes (%d) for DP on [ENCODER:%d:%s]\n",
@@ -7116,6 +7146,27 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 	intel_dp_set_common_link_params(intel_dp);
 	intel_dp_reset_link_params(intel_dp);
 
+	rates = kmemdup_array(intel_dp->source_rates,
+			      intel_dp->num_source_rates,
+			      sizeof(*rates),
+			      GFP_KERNEL);
+	if (!rates) {
+		intel_dp_aux_fini(intel_dp);
+		goto fail;
+	}
+
+	link_caps.nlanes = dig_port->max_lanes;
+	link_caps.nlink_rates = intel_dp->num_source_rates;
+	link_caps.link_rates = rates;
+	link_caps.dsc = HAS_DSC(display);
+
+	ret = drm_dp_source_set_caps(&connector->base, &link_caps);
+	if (ret)
+		drm_dbg_kms(display->drm,
+			    "failed to set source link rates, skipping.\n");
+
+	kfree(rates);
+
 	/* init MST on ports that can support it */
 	intel_dp_mst_encoder_init(dig_port, connector->base.base.id);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index cb92cff906146..c77cb124f1419 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1758,6 +1758,18 @@ static void link_recovery_reset(struct intel_dp_link_training *link_training)
 	link_training->recovery_state = INTEL_DP_LINK_RECOVERY_IDLE;
 }
 
+static void intel_dp_report_link_train(struct intel_dp *intel_dp)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+
+	if (!connector)
+		return;
+
+	drm_dp_set_cur_link_params(&connector->base, intel_dp->link_rate,
+				   intel_dp->lane_count,
+				   connector->dp.dsc_decompression_enabled);
+}
+
 /**
  * intel_dp_stop_link_train - stop link training
  * @intel_dp: DP struct
@@ -1787,6 +1799,8 @@ void intel_dp_stop_link_train(struct intel_dp *intel_dp,
 	intel_dp_program_link_training_pattern(intel_dp, crtc_state, DP_PHY_DPRX,
 					       DP_TRAINING_PATTERN_DISABLE);
 
+	intel_dp_report_link_train(intel_dp);
+
 	if (intel_dp_is_uhbr(crtc_state)) {
 		ret = poll_timeout_us(ret = intel_dp_128b132b_intra_hop(intel_dp, crtc_state),
 				      ret == 0,

-- 
2.43.0

