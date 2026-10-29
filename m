Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259983;
	b=mhmrRq9hGOMoGuQvGk+o7yHSMcGOgJi7xlRqcfdFBBOT6At4zlqKAi5f4kwPSXYdSoFg
	 iONEqFamHk1JJUrChIfrw0OkRp4Bg1Num3GHWX0fSy0+MsVPjoyB4VhSIZXv5Gw/JT54C
	 UT2tL4MvTzmZn4vp5RkWcs7iTU57UOfe0v4CIFSgI6xORNwioZ8yWd+NQgar75M0pm5GO
	 umfZm9hxvxOuSfx9V53Kv/83Lht6aPUNIGO3jm5UKvZDk8mr0x6H2snXVDZj73W+erDSF
	 h9CyA05+2cnXldKrpRWJ9qu7N/p3JsVtHtkKIQRbz2e8TJoGLCAFKRYOlwRoLA+RrKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=ZSvDeKi7+o27GTfQGgjmJGrFhN+1wIZ8f+ftzRFMUhE=;
	b=KcTYdtB4AuIUyRoY3XfmfAAQw/CSpzWkDaCWqYG5iClJYG1z0DvO5KfjhlHM7nrbcY66
	 s7WZbXLgjCv7Hp6I1J93zdLf9jLIFcO02dFLEEwGFfl6QmCOtCNbh1xZDaJRM3b1hXF7c
	 TJs7WxCkt5pg9q6/ZHMOoCYXFRX4kfL6clbc3z5he9cbcT3DSLp9wB4cgxxbTYXOf81Y2
	 AkZtQqgW/tY0cDhLp/b8w2CSmYfpPgoyMarZ0Qe5iR2ONdf3QKzevbbt3qD7PDDH1IQCw
	 ODSr48R7q6Y3EDee6Zqo5hF62KORI6E5cVWhS73j/pbM5+E3LFNarRyAV98XFiCoOYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cinemaone.ch;
	spf=pass smtp.mailfrom=cinemaone.ch;
	dkim=pass header.d=cinemaone.ch header.i=@cinemaone.ch header.a=rsa-sha256 header.s=20250113 header.b=UG1qjDwt;
	arc=none smtp.remote-ip=185.125.25.10
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90DE606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90DE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cinemaone.ch header.i=@cinemaone.ch header.a=rsa-sha256 header.s=20250113 header.b=UG1qjDwt
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jFbrh3HQWz22PX;
	Thu, 29 Oct 2026 08:46:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cinemaone.ch;
	s=20250113; t=1793259972;
	bh=ZSvDeKi7+o27GTfQGgjmJGrFhN+1wIZ8f+ftzRFMUhE=;
	h=From:To:Cc:Subject:Date:From;
	b=UG1qjDwtYP5hNFVooicEYaOpbk4CAF6ZOKKlKWzH3tBZ4qxscPNTzzpczx/nBSQ+i
	 U8hCiaeQjMUp+iKHg5Q8vAyZwzbc8hh6eiZtEvVevHMzpLrtWQJotwe2Lle3NUR9lF
	 HNtfdGHcC4AyWmxIIpZR0PX+Bmy6upwMvE1tjG/HUVwyKsJCV+LaKZ5KUxK/EB4CJL
	 eTAJsEkibABvNTVB7OWzv4Q9YKOJckYRhUkeWuYQafMdG6iCGTB+7GT4raL5JI5/wR
	 nfhyEk9VVGRFDxtGlChKETTfXsWYBucM9+4wXSHhTpbt/B1mdnP4vOWQ2hmDLT+nyS
	 APoGZR+lucBdQ==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jFbrg4NkdzXGB;
	Thu, 29 Oct 2026 08:46:11 +0100 (CET)
From: Adrian Betschart <adrian.betschart@cinemaone.ch>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/amd/display: Apply the HDMI RGB range default only to HDMI signals
Date: Thu, 29 Oct 2026 08:45:58 +0100
Message-ID: <20261029074558.41383-1-adrian.betschart@cinemaone.ch>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Since eb5650d1f367, Broadcast RGB "Automatic" selects limited range on
CTA modes when display_info.is_hdmi is set. That flag comes from an HDMI
VSDB in the EDID and says nothing about the link, so a native
DisplayPort monitor whose EDID carries an HDMI VSDB now gets limited
range on CTA modes too. Monitors that ignore the DP range signal show
grey blacks, where 7.2 sent full range.

Require an HDMI signal as well, as the original commit intended. DP++
passive adapters drive an HDMI signal and keep the HDMI behaviour;
native DP, DP MST and active DP-to-HDMI converters get full range again.

Reported and analysed by Andrés Rodríguez in the issue below.

Fixes: eb5650d1f367 ("drm/amd/display: Default HDMI RGB output to limited range on CTA modes")
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/6052
Cc: stable@vger.kernel.org # 7.3
Signed-off-by: Adrian Betschart <adrian.betschart@cinemaone.ch>
Assisted-by: Claude Code:claude-opus-5-5
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +--
 .../display/amdgpu_dm/amdgpu_dm_connector.c   | 16 ++--
 .../display/amdgpu_dm/amdgpu_dm_connector.h   |  3 +-
 .../tests/amdgpu_dm_connector_test.c          | 90 ++++++++++++++-----
 4 files changed, 89 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index dfbc384fbbdb..4f6d31812447 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5216,9 +5216,11 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_commit *state)
 		scaling_changed = is_scaling_state_different(dm_new_con_state,
 							     dm_old_con_state);
 
-		if ((new_con_state->hdmi.broadcast_rgb != old_con_state->hdmi.broadcast_rgb) &&
-			(dm_old_crtc_state->stream->output_color_space !=
-				amdgpu_dm_get_output_color_space(&dm_new_crtc_state->stream->timing, new_con_state)))
+		if (new_con_state->hdmi.broadcast_rgb != old_con_state->hdmi.broadcast_rgb &&
+		    dm_old_crtc_state->stream->output_color_space !=
+		    amdgpu_dm_get_output_color_space(&dm_new_crtc_state->stream->timing,
+						     new_con_state,
+						     dm_new_crtc_state->stream->signal))
 			output_color_space_changed = true;
 
 		abm_changed = dm_new_crtc_state->abm_level !=
@@ -5240,8 +5242,10 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_commit *state)
 		}
 
 		if (output_color_space_changed) {
-			dm_new_crtc_state->stream->output_color_space
-				= amdgpu_dm_get_output_color_space(&dm_new_crtc_state->stream->timing, new_con_state);
+			dm_new_crtc_state->stream->output_color_space =
+				amdgpu_dm_get_output_color_space(&dm_new_crtc_state->stream->timing,
+								 new_con_state,
+								 dm_new_crtc_state->stream->signal);
 
 			stream_update.output_color_space = &dm_new_crtc_state->stream->output_color_space;
 		}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index bc5745a5ba37..f663daf19d6a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -739,7 +739,8 @@ EXPORT_IF_KUNIT(get_aspect_ratio);
  * With Broadcast RGB left at Automatic follow that default, as i915 does.
  */
 static bool rgb_output_is_limited_range(const struct dc_crtc_timing *dc_crtc_timing,
-					const struct drm_connector_state *connector_state)
+					const struct drm_connector_state *connector_state,
+					enum signal_type signal)
 {
 	switch (connector_state->hdmi.broadcast_rgb) {
 	case DRM_HDMI_BROADCAST_RGB_FULL:
@@ -747,14 +748,16 @@ static bool rgb_output_is_limited_range(const struct dc_crtc_timing *dc_crtc_tim
 	case DRM_HDMI_BROADCAST_RGB_LIMITED:
 		return true;
 	default:
-		return connector_state->connector->display_info.is_hdmi &&
+		return dc_is_hdmi_signal(signal) &&
+		       connector_state->connector->display_info.is_hdmi &&
 		       dc_crtc_timing->vic > 1;
 	}
 }
 
 enum dc_color_space
 amdgpu_dm_get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
-				 const struct drm_connector_state *connector_state)
+				 const struct drm_connector_state *connector_state,
+				 enum signal_type signal)
 {
 	enum dc_color_space color_space = COLOR_SPACE_SRGB;
 
@@ -777,7 +780,7 @@ amdgpu_dm_get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 	case DRM_MODE_COLORIMETRY_BT2020_RGB:
 	case DRM_MODE_COLORIMETRY_BT2020_YCC:
 		if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB) {
-			if (rgb_output_is_limited_range(dc_crtc_timing, connector_state))
+			if (rgb_output_is_limited_range(dc_crtc_timing, connector_state, signal))
 				color_space = COLOR_SPACE_2020_RGB_LIMITEDRANGE;
 			else
 				color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
@@ -789,7 +792,7 @@ amdgpu_dm_get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 	default:
 		if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB) {
 			color_space = COLOR_SPACE_SRGB;
-			if (rgb_output_is_limited_range(dc_crtc_timing, connector_state))
+			if (rgb_output_is_limited_range(dc_crtc_timing, connector_state, signal))
 				color_space = COLOR_SPACE_SRGB_LIMITED;
 		/*
 		 * 27030khz is the separation point between HDTV and SDTV
@@ -983,7 +986,8 @@ STATIC_IFN_KUNIT void fill_stream_properties_from_drm_display_mode(
 	if (is_hdmi_ep)
 		adjust_colour_depth_from_display_info(timing_out, info);
 
-	stream->output_color_space = amdgpu_dm_get_output_color_space(timing_out, connector_state);
+	stream->output_color_space = amdgpu_dm_get_output_color_space(timing_out, connector_state,
+								      stream->signal);
 	stream->content_type = get_output_content_type(connector_state);
 }
 EXPORT_IF_KUNIT(fill_stream_properties_from_drm_display_mode);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.h
index 7bfbb6853833..496d2037e0c0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.h
@@ -129,7 +129,8 @@ int amdgpu_dm_fill_hdr_info_packet(const struct drm_connector_state *state,
 
 enum dc_color_space
 amdgpu_dm_get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
-		       const struct drm_connector_state *connector_state);
+		       const struct drm_connector_state *connector_state,
+		       enum signal_type signal);
 
 struct drm_display_mode *
 amdgpu_dm_get_highest_refresh_rate_mode(struct amdgpu_dm_connector *aconnector,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
index acde20241f43..f2d9798667d8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
@@ -422,7 +422,8 @@ static void dm_test_output_color_space_default_rgb_full(struct kunit *test)
 	state.colorspace = DRM_MODE_COLORIMETRY_DEFAULT;
 	state.hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_SRGB);
 }
 
@@ -439,7 +440,8 @@ static void dm_test_output_color_space_default_rgb_limited(struct kunit *test)
 	state.colorspace = DRM_MODE_COLORIMETRY_DEFAULT;
 	state.hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_LIMITED;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_SRGB_LIMITED);
 }
 
@@ -457,7 +459,8 @@ static void dm_test_output_color_space_default_ycbcr709(struct kunit *test)
 	timing.flags.Y_ONLY = 0;
 	state.colorspace = DRM_MODE_COLORIMETRY_DEFAULT;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_YCBCR709);
 }
 
@@ -476,7 +479,8 @@ static void dm_test_output_color_space_default_ycbcr601_limited(struct kunit *te
 	timing.flags.Y_ONLY = 1;
 	state.colorspace = DRM_MODE_COLORIMETRY_DEFAULT;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_YCBCR601_LIMITED);
 }
 
@@ -492,7 +496,8 @@ static void dm_test_output_color_space_bt601_y_only(struct kunit *test)
 	timing.flags.Y_ONLY = 1;
 	state.colorspace = DRM_MODE_COLORIMETRY_BT601_YCC;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_YCBCR601_LIMITED);
 }
 
@@ -508,7 +513,8 @@ static void dm_test_output_color_space_bt601(struct kunit *test)
 	timing.flags.Y_ONLY = 0;
 	state.colorspace = DRM_MODE_COLORIMETRY_BT601_YCC;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_YCBCR601);
 }
 
@@ -524,7 +530,8 @@ static void dm_test_output_color_space_bt709(struct kunit *test)
 	timing.flags.Y_ONLY = 0;
 	state.colorspace = DRM_MODE_COLORIMETRY_BT709_YCC;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_YCBCR709);
 }
 
@@ -540,7 +547,8 @@ static void dm_test_output_color_space_bt709_y_only(struct kunit *test)
 	timing.flags.Y_ONLY = 1;
 	state.colorspace = DRM_MODE_COLORIMETRY_BT709_YCC;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_YCBCR709_LIMITED);
 }
 
@@ -555,7 +563,8 @@ static void dm_test_output_color_space_oprgb(struct kunit *test)
 
 	state.colorspace = DRM_MODE_COLORIMETRY_OPRGB;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_ADOBERGB);
 }
 
@@ -573,7 +582,8 @@ static void dm_test_output_color_space_bt2020_rgb(struct kunit *test)
 	timing.pixel_encoding = PIXEL_ENCODING_RGB;
 	state.colorspace = DRM_MODE_COLORIMETRY_BT2020_RGB;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_2020_RGB_FULLRANGE);
 }
 
@@ -590,7 +600,8 @@ static void dm_test_output_color_space_bt2020_rgb_limited(struct kunit *test)
 	state.colorspace = DRM_MODE_COLORIMETRY_BT2020_RGB;
 	state.hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_LIMITED;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_2020_RGB_LIMITEDRANGE);
 }
 
@@ -611,7 +622,8 @@ static void dm_test_output_color_space_default_rgb_auto_hdmi_cta(struct kunit *t
 	state.colorspace = DRM_MODE_COLORIMETRY_DEFAULT;
 	state.hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_SRGB_LIMITED);
 }
 
@@ -632,7 +644,8 @@ static void dm_test_output_color_space_default_rgb_auto_hdmi_vga(struct kunit *t
 	state.colorspace = DRM_MODE_COLORIMETRY_DEFAULT;
 	state.hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_SRGB);
 }
 
@@ -652,7 +665,31 @@ static void dm_test_output_color_space_default_rgb_auto_dp_cta(struct kunit *tes
 	state.colorspace = DRM_MODE_COLORIMETRY_DEFAULT;
 	state.hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_DISPLAY_PORT),
+			(int)COLOR_SPACE_SRGB);
+}
+
+/**
+ * dm_test_output_color_space_default_rgb_auto_dp_hdmi_vsdb - Automatic on DP stays full range
+ * even when the EDID has an HDMI VSDB
+ * @test: The KUnit test context
+ */
+static void dm_test_output_color_space_default_rgb_auto_dp_hdmi_vsdb(struct kunit *test)
+{
+	struct dc_crtc_timing timing = {};
+	struct drm_connector_state state = {};
+	struct drm_connector *connector = kunit_kzalloc(test, sizeof(*connector), GFP_KERNEL);
+
+	connector->display_info.is_hdmi = true;
+	timing.pixel_encoding = PIXEL_ENCODING_RGB;
+	timing.vic = 118;
+	state.connector = connector;
+	state.colorspace = DRM_MODE_COLORIMETRY_DEFAULT;
+	state.hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
+
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_DISPLAY_PORT),
 			(int)COLOR_SPACE_SRGB);
 }
 
@@ -673,7 +710,8 @@ static void dm_test_output_color_space_default_rgb_full_hdmi_cta(struct kunit *t
 	state.colorspace = DRM_MODE_COLORIMETRY_DEFAULT;
 	state.hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_FULL;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_SRGB);
 }
 
@@ -694,7 +732,8 @@ static void dm_test_output_color_space_bt2020_rgb_auto_hdmi_cta(struct kunit *te
 	state.colorspace = DRM_MODE_COLORIMETRY_BT2020_RGB;
 	state.hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_AUTO;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_2020_RGB_LIMITEDRANGE);
 }
 
@@ -710,7 +749,8 @@ static void dm_test_output_color_space_bt2020_ycc(struct kunit *test)
 	timing.pixel_encoding = PIXEL_ENCODING_YCBCR422;
 	state.colorspace = DRM_MODE_COLORIMETRY_BT2020_YCC;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_2020_YCBCR_LIMITED);
 }
 
@@ -729,7 +769,8 @@ static void dm_test_output_color_space_default_ycbcr709_y_only(struct kunit *tes
 	timing.flags.Y_ONLY = 1;
 	state.colorspace = DRM_MODE_COLORIMETRY_DEFAULT;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_YCBCR709_LIMITED);
 }
 
@@ -748,7 +789,8 @@ static void dm_test_output_color_space_default_ycbcr601(struct kunit *test)
 	timing.flags.Y_ONLY = 0;
 	state.colorspace = DRM_MODE_COLORIMETRY_DEFAULT;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_YCBCR601);
 }
 
@@ -767,7 +809,8 @@ static void dm_test_output_color_space_bt2020_ycc_rgb_encoding(struct kunit *tes
 	timing.pixel_encoding = PIXEL_ENCODING_RGB;
 	state.colorspace = DRM_MODE_COLORIMETRY_BT2020_YCC;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_2020_RGB_FULLRANGE);
 }
 
@@ -785,7 +828,8 @@ static void dm_test_output_color_space_bt2020_ycc_rgb_encoding_limited(struct ku
 	state.colorspace = DRM_MODE_COLORIMETRY_BT2020_YCC;
 	state.hdmi.broadcast_rgb = DRM_HDMI_BROADCAST_RGB_LIMITED;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_2020_RGB_LIMITEDRANGE);
 }
 
@@ -802,7 +846,8 @@ static void dm_test_output_color_space_bt2020_rgb_ycc_encoding(struct kunit *tes
 	timing.pixel_encoding = PIXEL_ENCODING_YCBCR444;
 	state.colorspace = DRM_MODE_COLORIMETRY_BT2020_RGB;
 
-	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state),
+	KUNIT_EXPECT_EQ(test, (int)amdgpu_dm_get_output_color_space(&timing, &state,
+								    SIGNAL_TYPE_HDMI_TYPE_A),
 			(int)COLOR_SPACE_2020_YCBCR_LIMITED);
 }
 
@@ -10058,6 +10103,7 @@ static struct kunit_case amdgpu_dm_connector_tests[] = {
 	KUNIT_CASE(dm_test_output_color_space_default_rgb_auto_hdmi_cta),
 	KUNIT_CASE(dm_test_output_color_space_default_rgb_auto_hdmi_vga),
 	KUNIT_CASE(dm_test_output_color_space_default_rgb_auto_dp_cta),
+	KUNIT_CASE(dm_test_output_color_space_default_rgb_auto_dp_hdmi_vsdb),
 	KUNIT_CASE(dm_test_output_color_space_default_rgb_full_hdmi_cta),
 	KUNIT_CASE(dm_test_output_color_space_bt2020_rgb_auto_hdmi_cta),
 	KUNIT_CASE(dm_test_output_color_space_bt2020_ycc),
-- 
2.56.0

