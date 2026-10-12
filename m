Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E23499F1D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817909; cv=none; b=kYEqXFoptqjFiFYB3PUzQU4Xgl9VS/fttVlYsaXx/HX4tR8XtBimyeGIVgFn1x3bKQw3BghGLnlBiKo2hxXsHd2HWb/UTlFkB0iDd7MGQ/J3GjbUqtNrSp4vXPQFLD5WXqlhaPIxOcZtLQS75aP1M6TE5KWfzRWU5naitPZU8nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817909; c=relaxed/simple;
	bh=pT2dGQ3EU3E2MA1jekoWPuR7m2u1zXj86NvjTBIEjrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YePxRt322Jh2HvliZWpjh24wDwPH/Egxdi1EbXHQXe1jXzboSj7kQIn6TnYnaFmLVJ/gAOUsqzkxWqm67I3b5moqiPE9NZrIiG4RQjQo1VWXcO85E9kHdsJJIunGEoiQKB7ywVQEB+NMsvhZdfZfqtzvNTCCOQ6pMFmmCLnawqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MSu2ML6c; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MSu2ML6c"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 83C8D1A11E9;
	Mon, 12 Oct 2026 15:11:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EB3B601A6;
	Mon, 12 Oct 2026 15:11:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A117911D7012D;
	Mon, 12 Oct 2026 17:11:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791817900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bk2x82OfVzEX8vQFg5r5k8G6Ahg8Yo7o0Nce1j8gVcc=;
	b=MSu2ML6c1w653SFQ6BnfRaoqijHfRCycjnFvgpioFNeDI5rHTcfGoA1H3VQFtOqqy2iJCI
	mkTya1N4+QcXVSQ46ka2NJp7OyGdIHni8M1wW8JHNGcpYhzqLd6ew6ymAqwuwtPBT7Sn9o
	BGd7kQUUuRQGr2wm+rlRNmSVcnChy4LodeQQq7IkFdejdSPlijT7EexmD4UOz27rcBQAI8
	fke1xnFH0582bVkdNCoq79f6OKUFndSZuGA6mNrTN3Fj/sPryTktSnfSPYSbKaUxl2TZ+N
	BnsQbVWO8D5kjgVQiid31iX9sA7bXPISW++lraYHUlgzyqqDzLD5w/kA9bYvmA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 12 Oct 2026 17:10:57 +0200
Subject: [PATCH RFC v3 2/8] drm: Move DSC capability reading helper out of
 i915
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-feat_link_cap-v3-2-7517f4aba0f3@bootlin.com>
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

In preparation for adding generic DRM properties to report source and
sink capabilities, move the DSC capability reading helper out of the
i915 driver into the generic DRM helpers.

No functional change intended.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Change in v3:
- New patch
---
 drivers/gpu/drm/display/drm_dp_helper.c | 30 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c | 28 ++++------------------------
 include/drm/display/drm_dp_helper.h     |  2 ++
 3 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 8ef096a0138e4..93cf43d166c6e 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -5149,3 +5149,33 @@ int drm_dp_read_edp_sink_rates(struct drm_dp_aux *aux, u8 edp_dpcd_rev,
 	return num_sink_rates;
 }
 EXPORT_SYMBOL_GPL(drm_dp_read_edp_sink_rates);
+
+/**
+ * drm_dp_read_dsc_dpcd() - read the DSC capabilities from the DPCD
+ * @aux: DisplayPort AUX channel
+ * @dsc_dpcd: Buffer to store the DSC capabilities read from the DPCD
+ *
+ * Attempts to read the sink DSC capabilities from the DPCD of @aux.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+int drm_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
+			 u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
+{
+	int ret;
+
+	ret = drm_dp_dpcd_read_data(aux, DP_DSC_SUPPORT, dsc_dpcd,
+				    DP_DSC_RECEIVER_CAP_SIZE);
+	if (ret) {
+		drm_dbg_kms(aux->drm_dev,
+			    "Could not read DSC DPCD register 0x%x Error: %pe\n",
+			    DP_DSC_SUPPORT, ERR_PTR(ret));
+		return ret;
+	}
+
+	drm_dbg_kms(aux->drm_dev, "DSC DPCD: %*ph\n",
+		    DP_DSC_RECEIVER_CAP_SIZE,
+		    dsc_dpcd);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_dp_read_dsc_dpcd);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index da73ad11e9cac..830fe6eda17d7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4430,26 +4430,6 @@ static bool intel_dp_get_sst_split_sdp_status(u8 dprx)
 	return dprx & DP_SST_SPLIT_SDP_CAP;
 }
 
-static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
-				  u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
-{
-	int ret;
-
-	ret = drm_dp_dpcd_read_data(aux, DP_DSC_SUPPORT, dsc_dpcd,
-				    DP_DSC_RECEIVER_CAP_SIZE);
-	if (ret) {
-		drm_dbg_kms(aux->drm_dev,
-			    "Could not read DSC DPCD register 0x%x Error: %pe\n",
-			    DP_DSC_SUPPORT, ERR_PTR(ret));
-		return ret;
-	}
-
-	drm_dbg_kms(aux->drm_dev, "DSC DPCD: %*ph\n",
-		    DP_DSC_RECEIVER_CAP_SIZE,
-		    dsc_dpcd);
-	return 0;
-}
-
 static void init_dsc_overall_throughput_limits(struct intel_connector *connector, bool is_branch)
 {
 	u8 branch_caps[DP_DSC_BRANCH_CAP_SIZE];
@@ -4498,8 +4478,8 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 	if (dpcd_rev < DP_DPCD_REV_14)
 		return;
 
-	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
-				   connector->dp.dsc_dpcd) < 0)
+	if (drm_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
+				 connector->dp.dsc_dpcd) < 0)
 		return;
 
 	if (drm_dp_dpcd_readb(connector->dp.dsc_decompression_aux, DP_FEC_CAPABILITY,
@@ -4530,8 +4510,8 @@ static void intel_edp_get_dsc_sink_cap(u8 edp_dpcd_rev, struct intel_connector *
 	if (edp_dpcd_rev < DP_EDP_14)
 		return;
 
-	if (intel_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
-				   connector->dp.dsc_dpcd) < 0)
+	if (drm_dp_read_dsc_dpcd(connector->dp.dsc_decompression_aux,
+				 connector->dp.dsc_dpcd) < 0)
 		return;
 
 	if (connector->dp.dsc_dpcd[0] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index d7f4c6f2ba4c7..7bc3b36f38b82 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -215,6 +215,8 @@ drm_dp_is_branch(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 }
 
 /* DP/eDP DSC support */
+int drm_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
+			 u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
 u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
 u32 drm_dp_dsc_slice_count_to_mask(int slice_count);
 u32 drm_dp_dsc_sink_slice_count_mask(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],

-- 
2.43.0

