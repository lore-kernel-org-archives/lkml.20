Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D86D3839AC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789064126; cv=none; b=KlsNYxAvnN0OeiEdrI/Daj+xw/lIToI04nNYTxymWbTG146E0vOhGENcx2rkIIOy4bfVYNrVP5v30w5m/zaXHUlq1Ppop0avQV4oxWr/ieWCTGyAyTkk0ZF8O0+Yu6YtO/iVnBUKYmrL/br42WdxB+gmlRcH3xU5eeXEBHDvRhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789064126; c=relaxed/simple;
	bh=dV0xUmaePkePL8fkwAHkhMc3mksjvy3PiTvriSnZ/o0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dz3mmC9J2jYwYpoRkPF44fwbOrnx3Xbimlsd8IfGkWjGKQByqi5qp8+MLB+bdIeT9KKlm5oRbvpr+KctvHoMgC9RlVuiTNctod+9fMbi/gksJHAZM7UM1VYgFwxdKTZCh+SCCbJyX4d92+NBbRu/jz7tVay1erMziiWSovdihd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch; spf=pass smtp.mailfrom=cinemaone.ch; dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b=CaVJgGpl; arc=none smtp.client-ip=45.157.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cinemaone.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cinemaone.ch header.i=@cinemaone.ch header.b="CaVJgGpl"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hgm7C3yXvzyHb;
	Thu, 10 Sep 2026 20:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cinemaone.ch;
	s=20250113; t=1789064119;
	bh=RZefKOnVfiL9JNII1ZYlmPnKnTh94CstW5go0Osd9Xg=;
	h=From:To:Cc:Subject:Date:From;
	b=CaVJgGpl1eBzB9wnSMes3HiZ+tX/fAtXsEPvdA5HSzKCgQ5flcLi461UIDkE+g5St
	 DR+Q2Xg14CYWzZM0vZpGj2FytrNkTmnUGZysDnVj4bWFLUZZvsbS3Adhca08BfkdFG
	 Pf4sSv5Mf02VNL2eRMdGBuhm3p/xqvMhDfrSShPDuwbaC8N7WMw1tLBeq344pNJCgt
	 ZB7VJCl+kRtfwP0cvnoQA3ZD4aiGJ1BlJze5xskiMFtumP+42oe1Ry1qVU/EX71gZW
	 9XKGZPVHccWTnq8aoPFgP+S90GcDeHYxRbd+tWH9Vy58tHGRrjMLisHYTibHbX6bCT
	 smb1VRqafm2TA==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hgm7B3jv5zf3K;
	Thu, 10 Sep 2026 20:15:18 +0200 (CEST)
From: Adrian Betschart <adrian.betschart@cinemaone.ch>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Satyajit Roy <sroy14@alum.utk.edu>,
	Alex Hung <alex.hung@amd.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Default HDMI RGB output to limited range on CTA modes
Date: Thu, 10 Sep 2026 20:15:17 +0200
Message-ID: <20260910181517.68781-1-adrian.betschart@cinemaone.ch>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

With the Broadcast RGB property at Automatic, amdgpu_dm_get_output_color_space()
selects COLOR_SPACE_SRGB for RGB output, so DC neither compresses the pixels
nor, without a QS-capable sink, signals full range in the AVI InfoFrame. A sink
that follows CTA-861 treats the default quantization of a CTA video format as
limited and expands 16-235 to 0-255: everything below 16 is crushed to black,
everything above 235 clips.

Follow the CTA-861 default for Automatic instead, as the DRM HDMI state helper
(hdmi_is_limited_range()) and i915 do: limited range on an HDMI sink for CTA
modes other than 640x480, full range elsewhere. Full and Limited keep their
explicit meaning. The same rule applies to the BT.2020 RGB branch. With
commit a56a50074 ("drm/amd/display: Propagate HDMI RGB quantization
selectability") the AVI InfoFrame then carries the matching Q value on
sinks that support selection.

Measured on a Radeon RX 7600 (DCN 3.2.1) driving a JVC DLA-RS4100 at
1920x1080p24 RGB 12 bpc: the sink reports the signal as limited range while
the picture shows crushed shadows; rendering limited range in the client makes
it match a reference source.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/5796
Signed-off-by: Adrian Betschart <adrian.betschart@cinemaone.ch>
Assisted-by: Claude Code:claude-fable-5-1
---
 .../display/amdgpu_dm/amdgpu_dm_connector.c   | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
index 0b446133e..13cbe099c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_connector.c
@@ -734,6 +734,24 @@ get_aspect_ratio(const struct drm_display_mode *mode_in)
 }
 EXPORT_IF_KUNIT(get_aspect_ratio);
 
+/*
+ * CTA-861 5.1: RGB video formats default to limited range except 640x480 (VIC 1).
+ * With Broadcast RGB left at Automatic follow that default, as i915 does.
+ */
+static bool rgb_output_is_limited_range(const struct dc_crtc_timing *dc_crtc_timing,
+					const struct drm_connector_state *connector_state)
+{
+	switch (connector_state->hdmi.broadcast_rgb) {
+	case DRM_HDMI_BROADCAST_RGB_FULL:
+		return false;
+	case DRM_HDMI_BROADCAST_RGB_LIMITED:
+		return true;
+	default:
+		return connector_state->connector->display_info.is_hdmi &&
+		       dc_crtc_timing->vic > 1;
+	}
+}
+
 enum dc_color_space
 amdgpu_dm_get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 				 const struct drm_connector_state *connector_state)
@@ -759,7 +777,7 @@ amdgpu_dm_get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 	case DRM_MODE_COLORIMETRY_BT2020_RGB:
 	case DRM_MODE_COLORIMETRY_BT2020_YCC:
 		if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB) {
-			if (connector_state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_LIMITED)
+			if (rgb_output_is_limited_range(dc_crtc_timing, connector_state))
 				color_space = COLOR_SPACE_2020_RGB_LIMITEDRANGE;
 			else
 				color_space = COLOR_SPACE_2020_RGB_FULLRANGE;
@@ -771,7 +789,7 @@ amdgpu_dm_get_output_color_space(const struct dc_crtc_timing *dc_crtc_timing,
 	default:
 		if (dc_crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB) {
 			color_space = COLOR_SPACE_SRGB;
-			if (connector_state->hdmi.broadcast_rgb == DRM_HDMI_BROADCAST_RGB_LIMITED)
+			if (rgb_output_is_limited_range(dc_crtc_timing, connector_state))
 				color_space = COLOR_SPACE_SRGB_LIMITED;
 		/*
 		 * 27030khz is the separation point between HDTV and SDTV
-- 
2.55.0

