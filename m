Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798800;
	b=vTTK79zDzQiQEtPbOBMNwX+rbqnjuqqv7/7hlcchfH6GZXnhfrqWNX6VnIcRo5Y169dy
	 SNoNPiKqwzO2baZnxdzZ9k/Ko60DIeLpZpOMp0//clh9cFocMnbrX+2e7ZgSiwhpTFy74
	 sMu8HsgdsUuq5osA97wmG6TFGx5e2GOVPyFF26cHDyHLck1Vl+fcCpGM6WtAfWJYA8kRE
	 dTaoZum9M+pAAJ1GI/h6Rh8E6hCQJv/mQA7mpOZUH62/zNmc3cDLah9TaI/t6gZ7Jiq+M
	 okqyspWbBFmtjjPPUosSUzQwJARjRLyFgmCJ8qO2UnawVmIwZrS3WYldVWLYkY5PJVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798800;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=Ik+9As5zWEcnd1lAIe1HIcwapOrmjAd0LfPgVKhdxYI=;
	b=ZvmTEwOCOy9O9V7KSlH9NNjvsSyyUTF2CDoKkvW8r4YbX3u+xM8+dJRqkt438nZVsHrd
	 TJfjnK98dMbVViOMkKPH/CzfBvvNPMVvxl9mygHli7CenDgwYbKPdxhBlfOnCGK6hMTW1
	 N5J5wh4wn4KsDdt5d3C6EUr1T09vg9q+8Vwh/aGjcXDb6+JKj0R6WON1RSqePSXEkA+Xe
	 C1w7h5Bj0SXMWcdpHR8k3MmPYjkdrYdg3e1u7RGw/3Pu0MBTr/zj//sTV73CDcCiKQ3rs
	 S/L1PD84x3MmsQXAOyBFjJdkvLPErlcsKsgjSvFek0+COy7pNSj1uy9ur9JrRgB+y6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ZVsJ+f+x;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45343606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45343606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ZVsJ+f+x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793798798;
	bh=3VGBjuDZL44zL70KHrZsYKKN7DSrcaF1kiG0fCuaNZo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZVsJ+f+xpeCaD5tMSD15u5CA1x0UCLzL2K+tHR4B6PjfPBC+wSmOcys6XQa9zSHb0
	 5e8pgzELClB40c8m2alRnZTGoWXV4EkjQI5MUBBTXMjv8W97CroghOjdmOU4lFRCdi
	 qFXMyrHh9Ba6qS/h/CVFUF561HUV+jqErM9ZBOo2N8ltcWV672FFnvl8Tz+RGiaW0x
	 70109CpEkUvAEa92gobummi/3M4nqPV6DqppjmAS3zDGa0tYRZ8NtS33mxN/0aneMo
	 WuWP5oyYitZQGM9ko7f9iEwD5MSM5B5vvKiIQBFIjzfcwCGVDC/g/CRPTXvq/bj1pa
	 vNG6isDZr3V7g==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81E2E17E066C;
	Wed, 04 Nov 2026 14:26:38 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 04 Nov 2026 15:26:22 +0200
Subject: [PATCH 3/3] drm/display: hdmi: Reset sink scrambling on
 non-scrambled modesets
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
Message-Id: <20261104-hdmi-scdc-scramb-fixes-v1-3-16a9bb3d64a6@collabora.com>
References: <20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com>
In-Reply-To: <20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

drm_connector_hdmi_disable_scrambling() only clears the sink SCDC status
when the connector is known to be connected.  That is never true when a
source driver disables scrambling at boot to clean up after the
firmware, as vc4 does from vc4_crtc_disable_at_boot(), where
connector->status is still unknown and no EDID has been read.

A sink left scrambling by the firmware thus keeps both Scrambling_Enable
and the 1/40 TMDS bit clock ratio set.  If the first modeset picks a
mode below 340 MHz, no disable happens in between, since the CRTC was
never active in atomic state, and drm_connector_hdmi_enable_scrambling()
returns early, leaving the sink trying to descramble an unscrambled
stream.

Instead of blind SCDC writes at boot towards a possibly absent sink,
reset the sink status from drm_connector_hdmi_enable_scrambling() when
no scrambling is required.  By then the sink has been probed, and HDMI
2.0 expects a scrambling capable sink to have Scrambling_Enable cleared
below 340 MHz anyway.  The reset runs regardless of source scrambler
support, since the firmware may have left the sink scrambling.

Factor the reset out into a helper also used by the disable and error
paths, gated only on drm_scdc_sink_supports_scrambling(), which suffices
because drm_display_info is zeroed until the first EDID read and reset
on disconnect, making the connector->status check redundant.  As the
helper now runs on every non-scrambled modeset, read SCDC_TMDS_CONFIG
first and only clear the bits actually set, so the common case costs a
single DDC read.

Fixes: d653818324ed ("drm/display: hdmi: Add HDMI 2.0 scrambling management helpers")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c | 45 ++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index 974d5de6d380..278cfda38e18 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -470,6 +470,28 @@ static bool drm_scdc_sink_supports_scrambling(struct drm_connector *connector)
 	       info->hdmi.scdc.scrambling.supported;
 }
 
+static void drm_connector_hdmi_reset_sink_scrambling(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	u8 config;
+	int ret;
+
+	if (!connector->ddc || !drm_scdc_sink_supports_scrambling(connector))
+		return;
+
+	ret = drm_scdc_readb(connector->ddc, SCDC_TMDS_CONFIG, &config);
+	if (ret) {
+		drm_dbg_kms(dev, "Failed to read TMDS config: %d\n", ret);
+		return;
+	}
+
+	if (config & SCDC_SCRAMBLING_ENABLE)
+		drm_scdc_set_scrambling(connector, false);
+
+	if (config & SCDC_TMDS_BIT_CLOCK_RATIO_BY_40)
+		drm_scdc_set_high_tmds_clock_ratio(connector, false);
+}
+
 static int drm_connector_hdmi_try_scrambling_setup(struct drm_connector *connector)
 {
 	bool done;
@@ -522,6 +544,11 @@ static void drm_connector_hdmi_scdc_work(struct work_struct *work)
  * the sink side and retry the operation, as some displays refuse to set the
  * scrambling bit right away.
  *
+ * When @conn_state doesn't require scrambling, the sink-side SCDC status is
+ * reset instead, so that a sink left scrambling by a state the driver did not
+ * control, e.g. set up by the firmware before boot, doesn't end up out of sync
+ * with the source.
+ *
  * The work item is cancelled by drm_connector_hdmi_disable_scrambling(), hence
  * source drivers must ensure the display pipeline is shut down on unbind, e.g.
  * via drm_atomic_helper_shutdown(). Otherwise the work may outlive the driver's
@@ -541,8 +568,14 @@ int drm_connector_hdmi_enable_scrambling(struct drm_connector *connector,
 	if (!conn_state)
 		return -EINVAL;
 
-	if (!conn_state->hdmi.scrambler_needed)
+	if (!conn_state->hdmi.scrambler_needed) {
+		/*
+		 * Resync the sink here, where it is known to be connected
+		 * and its capabilities have been parsed.
+		 */
+		drm_connector_hdmi_reset_sink_scrambling(connector);
 		return 0;
+	}
 
 	if (!drm_connector_hdmi_scrambler_supported(connector)) {
 		drm_dbg_kms(dev, "Source doesn't support scrambling.\n");
@@ -581,8 +614,7 @@ int drm_connector_hdmi_enable_scrambling(struct drm_connector *connector,
 		WRITE_ONCE(hdmi->scrambler_enabled, false);
 		cancel_delayed_work_sync(&hdmi->scdc_work);
 
-		drm_scdc_set_scrambling(connector, false);
-		drm_scdc_set_high_tmds_clock_ratio(connector, false);
+		drm_connector_hdmi_reset_sink_scrambling(connector);
 	}
 
 	return ret;
@@ -619,12 +651,7 @@ int drm_connector_hdmi_disable_scrambling(struct drm_connector *connector)
 	if (hdmi->scdc_work_initialized)
 		cancel_delayed_work_sync(&hdmi->scdc_work);
 
-	if (connector->ddc &&
-	    connector->status == connector_status_connected &&
-	    drm_scdc_sink_supports_scrambling(connector)) {
-		drm_scdc_set_scrambling(connector, false);
-		drm_scdc_set_high_tmds_clock_ratio(connector, false);
-	}
+	drm_connector_hdmi_reset_sink_scrambling(connector);
 
 	return hdmi->funcs->scrambler_disable(connector);
 }

-- 
2.55.0

