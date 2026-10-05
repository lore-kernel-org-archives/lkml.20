Received: from smtp-outgoing-1703.laposte.net (smtp-outgoing-1703.laposte.net [160.92.124.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AD24C2279
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213381; cv=none; b=nCzLenBR/R/aa9vDW92LCTDjA+jdhJSESRbJ2cS21Z/zOpGXapwbY6yHRb5n3mEmuy55WuspcmbTQV/JQTVSNBbfy5MfU5OyO3lAl2Z+M/troDa9Z/x2I4gC7UeE60Qdqrd6geWTu52XtOsuJfy3x84X7OyPrlwQ0FAye6IexPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213381; c=relaxed/simple;
	bh=mwSqGECjjzYeCK3h1RVZUOGsE2Dq5MbWntTGq4wdKZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F8FsXj1bOBfET2BMDHtfsc+/QAxmTHvQU6jqG4VPz9dGaD1xnJI8yygJJhFJ3Pp9nAgyEHAmwEJqFaFuqzy3MZYT+ndewSFh5ccx8vwJqB+DnprHc/zwKuzSlzgvK4yTUhi7pAWG6TuITfokU7YUvFTfb08ZGbRtRNSRbYKY6Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=RMmB/TZO; arc=none smtp.client-ip=160.92.124.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="RMmB/TZO"
X-mail-filterd: {"version":"1.9.7","queueID":"4hz0JF2Kjxz10MQ4","contextId":
 "b50483b3-7d83-4a0a-97f7-941ae70e4e73"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0120.laposte.net (SMTP Server) with ESMTP id 4hz0JF2Kjxz10MQ4;
	Mon,  5 Oct 2026 15:15:57 +0200 (CEST)
X-mail-filterd: {"version":"1.9.7","queueID":"4hz0JD05tVz10MQQ","contextId":
 "02ec6e50-2b08-4dd9-bba8-c0611820d82d"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from PAR-95296130.bcg.com (unknown [147.161.232.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0120.laposte.net (SMTP Server) with ESMTPSA id 4hz0JD05tVz10MQQ;
	Mon,  5 Oct 2026 15:15:55 +0200 (CEST)
From: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Saim Shujah <saimzst@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jean-Francois Bobier <jean-francois.bobier@laposte.net>
Subject: [PATCH] drm/display: let a bridge configure sink audio from hw_params
Date: Mon,  5 Oct 2026 15:15:45 +0200
Message-ID: <20261005131545.23219-1-jean-francois.bobier@laposte.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1791213377; bh=mwSqGECjjzYeCK3h1RVZUOGsE2Dq5MbWntTGq4wdKZc=; h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding; b=RMmB/TZOe0N0/LE0+oFP7fcaOF6uLKKUknGRU6Qt09w4i8WF8eqqeSU7dznJaAVgKWIeRQKqm0jDvaozZ/JcgxwWoqSpgmOdhyFToc8zjFAvZqBsk/O/CyrJJYXFq9CXR+4+CavznqPBALCgX1yIGryg6A5PlIY4JOn26Be5Dca8ymRsN+ywsh5hSDZANVohVdstOfl8UftkfleRX4s9RpMjmrvh1q6l4BXRdq+U68oTwlg0KzoaTKWKFXZdSFabrgBr2r4271/dtSBPuGCZUbM6PrjBYF2L7+u36m3nwL3rzSIxD2jvmFw7Hz+8Grv8Dpm//kqRnoT8KQ63JZHITg==;

drm_connector_hdmi_audio_ops implements .prepare and not .hw_params, so
every bridge using the HDMI audio helper configures its sink's audio path
from the codec DAI's prepare callback.

That is too late when the CPU side of the DAI link cannot start until the
sink's audio clock is already running. ASoC's snd_soc_pcm_dai_prepare()
walks CPU DAIs before codec DAIs and returns on the first error, so such
a CPU DAI fails and aborts the loop before the bridge's prepare is
reached -- the clock it was waiting for is enabled by a callback that the
failure prevents from running.

Qualcomm's LPASS is one such CPU side. On an sm8250 board with the
DisplayPort controller bound to the DISPLAY_PORT_RX AFE port, starting
playback gives:

  qcom-q6afe: AFE enable for port 0x6020 failed -110
  q6afe-dai: ASoC error (-110): at snd_soc_dai_prepare() on DISPLAY_PORT_=
RX_0

and an ftrace of the attempt shows msm_dp_audio_prepare() is never
called at all -- only msm_dp_audio_shutdown(), from the teardown path.

Add a .hw_params to the helper that runs the same configuration, and a
drm_bridge flag to select it. hw_params runs for every DAI in the link
before any of them is prepared, so the clock is up by the time the CPU
DAI starts its port. Both callbacks receive identical parameters, so the
configuration itself is unchanged.

The flag defaults to off: a bridge that does not set it keeps being
configured from prepare exactly as before, and the new hw_params returns
without touching it. Note that providing .hw_params at all means
hdmi_codec_hw_params() no longer returns early for these connectors, so
it now runs hdmi_codec_fill_codec_params() and the IEC958 channel status
fill before the (inert) callback. Both are computed into an on-stack
hdmi_codec_params that is then discarded, and the one shared value it
writes, daifmt->bit_fmt, is set by hdmi_codec_prepare() to the same value
immediately afterwards.

One more side effect worth disclosing: hdmi_codec_fill_codec_params()
also writes hcp->chmap_idx, which is not on-stack -- it persists on the
hdmi-codec device and is reused by the next call to
hdmi_codec_get_ch_alloc_table_idx(). hdmi_codec_prepare() recomputes it
immediately afterwards from the same channel count, so the value itself
does not go stale. But hdmi_codec_hw_params() now reaching this code at
all means that a channel count the sink's ELD does not advertise -- the
error path in hdmi_codec_get_ch_alloc_table_idx() -- is reported from
hw_params() instead of prepare(), for every bridge sharing
drm_connector_hdmi_audio_ops, not only the ones that set
hdmi_audio_prepare_early. That changes when a bad channel count is
reported, not whether it is, but it is a change to seven bridges this
patch has no other reason to touch, and worth a maintainer's opinion.

Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
---
 .../gpu/drm/display/drm_bridge_connector.c    |  3 +++
 .../gpu/drm/display/drm_hdmi_audio_helper.c   | 23 +++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_drm.c               |  8 +++++++
 include/drm/drm_bridge.h                      | 17 ++++++++++++++
 include/drm/drm_connector.h                   |  8 +++++++
 5 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
index 8b54069fa..51293181b 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -1048,6 +1048,9 @@ struct drm_connector *drm_bridge_connector_init(str=
uct drm_device *drm,
 						    bridge->hdmi_audio_dai_port);
 		if (ret)
 			return ERR_PTR(ret);
+
+		connector->hdmi_audio.prepare_early =3D
+			bridge->hdmi_audio_prepare_early;
 	}
=20
 	if (bridge_connector->bridge_hdmi_cec &&
diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_audio_helper.c
index 7d78b02c1..3ed5d73f1 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -34,6 +34,28 @@ static int drm_connector_hdmi_audio_prepare(struct dev=
ice *dev, void *data,
 	const struct drm_connector_hdmi_audio_funcs *funcs =3D
 		connector->hdmi_audio.funcs;
=20
+	if (connector->hdmi_audio.prepare_early)
+		return 0;
+
+	return funcs->prepare(connector, fmt, hparms);
+}
+
+/*
+ * Only used by connectors that asked for it; everyone else keeps being
+ * configured from prepare() and this returns without doing anything. Se=
e
+ * &drm_bridge.hdmi_audio_prepare_early for why a connector would want i=
t.
+ */
+static int drm_connector_hdmi_audio_hw_params(struct device *dev, void *=
data,
+					      struct hdmi_codec_daifmt *fmt,
+					      struct hdmi_codec_params *hparms)
+{
+	struct drm_connector *connector =3D data;
+	const struct drm_connector_hdmi_audio_funcs *funcs =3D
+		connector->hdmi_audio.funcs;
+
+	if (!connector->hdmi_audio.prepare_early)
+		return 0;
+
 	return funcs->prepare(connector, fmt, hparms);
 }
=20
@@ -130,6 +152,7 @@ EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify=
);
=20
 static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops =3D {
 	.audio_startup =3D drm_connector_hdmi_audio_startup,
+	.hw_params =3D drm_connector_hdmi_audio_hw_params,
 	.prepare =3D drm_connector_hdmi_audio_prepare,
 	.audio_shutdown =3D drm_connector_hdmi_audio_shutdown,
 	.mute_stream =3D drm_connector_hdmi_audio_mute_stream,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_=
drm.c
index c1e4147bf..52c90937f 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -327,6 +327,14 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display=
, struct drm_device *dev,
 		bridge->hdmi_audio_dev =3D &msm_dp_display->pdev->dev;
 		bridge->hdmi_audio_max_i2s_playback_channels =3D 8;
 		bridge->hdmi_audio_dai_port =3D -1;
+		/*
+		 * The LPASS/ADSP side of the DAI link will not start its AFE
+		 * port until this controller's audio clock is running, and
+		 * ASoC prepares CPU DAIs before codec DAIs, so configuring
+		 * from prepare() is too late -- the CPU DAI times out and
+		 * aborts the link before we are called at all.
+		 */
+		bridge->hdmi_audio_prepare_early =3D 1;
 	}
=20
 	rc =3D devm_drm_bridge_add(dev->dev, bridge);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 58fff047f..e8fb944f3 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1128,6 +1128,23 @@ struct drm_bridge {
 	 */
 	unsigned int hdmi_audio_spdif_playback : 1;
=20
+	/**
+	 * @hdmi_audio_prepare_early: configure the sink's audio path from the
+	 * ASoC hw_params callback rather than from prepare.
+	 *
+	 * Both callbacks receive identical parameters, so for most bridges it
+	 * makes no difference and the default (prepare) is right. It matters
+	 * when the CPU side of the DAI link cannot start until the sink's
+	 * audio clock is already running: ASoC walks CPU DAIs before codec
+	 * DAIs and stops at the first error, so a CPU DAI that fails waiting
+	 * for that clock aborts the loop before this bridge's prepare is ever
+	 * reached. Qualcomm's LPASS/ADSP is one such CPU side.
+	 *
+	 * Setting this moves the configuration to hw_params, which runs for
+	 * every DAI in the link before any of them is prepared.
+	 */
+	unsigned int hdmi_audio_prepare_early : 1;
+
 	/**
 	 * @hdmi_audio_dai_port: sound DAI port for either of
 	 * @DRM_BRIDGE_OP_HDMI_AUDIO and @DRM_BRIDGE_OP_DP_AUDIO, -1 if it is
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index a0cf0268d..ae3d1382f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2027,6 +2027,14 @@ struct drm_connector_hdmi_audio {
 	 * The port in DT that is used for the Codec DAI.
 	 */
 	int dai_port;
+
+	/**
+	 * @prepare_early:
+	 *
+	 * Call @funcs->prepare from the ASoC hw_params callback instead of
+	 * from prepare. See &drm_bridge.hdmi_audio_prepare_early.
+	 */
+	bool prepare_early;
 };
=20
 /*
--=20
2.55.0

