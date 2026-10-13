Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7233E387346
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924750; cv=none; b=r69JFkcH4fvMLnWOPxpJ53NDcNWAUt4uqnyy2XmvwHVSecrkLoWkEPL6BmJfltU5QHD9eTlRG53y33DEEwmqldzmN0VNDQkYgMQgE42Y0hIUpYbvxi3mwg1DDKTLKF89TlhxPbsCwtXfpF0NYXedzjNrkCB+yMzQqTSNPYJG730=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924750; c=relaxed/simple;
	bh=jIpGYPB3y1ibhfQMHMMlhUm7Zl1BEuJiTDc5SRMOU9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CFDQ+CfiaS/tDK9z88Ms/UX8rbsyr+189/zlLj3KbXshZUgD6qNK+/u3GM2oGSQ/VqRjzoewQ/ju5r/+pVOv5WeaDXs72wfxGN24ujARNyDjon6Na6jJFMZUblrpkKbGq2s+PdpPbWyzIqDV7qB26jMQ0iBxW3T2NxV6wa9ugCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuylGn7O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuylGn7O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759EC1F000FF;
	Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791924749;
	bh=6oT9E6s6MCkA9XNHZl5mkeyuQSVQ4G+XwlOZb9Cug/g=;
	h=From:To:Cc:Subject:Date;
	b=QuylGn7OZd3Aec19LQ6+zeNF+SYSn5Xh6ddiW//0lKL7wi9Adt7GjoMNBNta2Gvlf
	 +5NNhmjMZsCli3ddkosxLgNdVGfMyPq7856+q7Moaq9I9+5uUO5u7ASHLzd8jpp8vL
	 mXblEoGVORua1I2oZNnlJqLnYu+U0UaPXF+WC5A5oL1Q0+smmGR2mTplIWk0Yu4VqO
	 vwUYJc7gQQbLrovqQpKiQlEQNNHV7TiK4/oYesYWmF2vWfOCB7s0ox9FETRmzrTh6m
	 b13agAT70O6bNN02nmJVfBvt9o+ii6La+0iyPH0Ek53puBHBQFuMhXMeaGtLhqL4EA
	 9vmhTbmvrLyOg==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Chenyu Chen <chen-yu.chen@amd.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/edid: reduce update_display_info() stack usage
Date: Tue, 13 Oct 2026 22:51:40 +0200
Message-ID: <20261013205223.2396822-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The drm_parse_cea_ext() calls into nine individual parser functions
based on the data format. If all of those get inlined and KASAN_STACK
is enabled, this can explode the combined stack usage beyond a
reasonable amount:

drivers/gpu/drm/drm_edid.c: In function 'update_display_info':
drivers/gpu/drm/drm_edid.c:7040:1: error: the frame size of 1888 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
 7040 | }
      | ^

Mark all of the individual parser functions as noinline_for_stack
to avoid this and keep their stack frames separate. This reduces
the stack usage for update_display_info/drm_parse_cea_ext to
a more manageable 744 bytes, while each parser only adds at most
200 bytes on top.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/drm_edid.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3148038747b6..913a8bbe8894 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5341,8 +5341,9 @@ static int edid_hfeeodb_extension_block_count(const struct edid *edid)
  * etc). For example, if the bit 0 in bitmap is set, first mode in VDB can
  * support YCBCR420 output too.
  */
-static void parse_cta_y420cmdb(struct drm_connector *connector,
-			       const struct cea_db *db, u64 *y420cmdb_map)
+static noinline_for_stack void
+parse_cta_y420cmdb(struct drm_connector *connector, const struct cea_db *db,
+		   u64 *y420cmdb_map)
 {
 	struct drm_display_info *info = &connector->display_info;
 	int i, map_len = cea_db_payload_len(db) - 1;
@@ -5515,7 +5516,7 @@ static uint8_t hdr_metadata_type(const u8 *edid_ext)
 		BIT(HDMI_STATIC_METADATA_TYPE1);
 }
 
-static void
+static noinline_for_stack void
 drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db)
 {
 	struct hdr_static_metadata *hdr_metadata =
@@ -6070,7 +6071,8 @@ drm_default_rgb_quant_range(const struct drm_display_mode *mode)
 EXPORT_SYMBOL(drm_default_rgb_quant_range);
 
 /* CTA-861 Video Data Block (CTA VDB) */
-static void parse_cta_vdb(struct drm_connector *connector, const struct cea_db *db)
+static noinline_for_stack void
+parse_cta_vdb(struct drm_connector *connector, const struct cea_db *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 	int i, vic_index, len = cea_db_payload_len(db);
@@ -6136,8 +6138,8 @@ static bool cta_vdb_has_vic(const struct drm_connector *connector, u8 vic)
 }
 
 /* CTA-861-H YCbCr 4:2:0 Video Data Block (CTA Y420VDB) */
-static void parse_cta_y420vdb(struct drm_connector *connector,
-			      const struct cea_db *db)
+static noinline_for_stack void
+parse_cta_y420vdb(struct drm_connector *connector, const struct cea_db *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 	struct drm_hdmi_info *hdmi = &info->hdmi;
@@ -6155,7 +6157,8 @@ static void parse_cta_y420vdb(struct drm_connector *connector,
 	}
 }
 
-static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
+static noinline_for_stack void
+drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 
@@ -6310,8 +6313,8 @@ static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
 }
 
 /* Sink Capability Data Structure */
-static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
-				      const u8 *hf_scds)
+static noinline_for_stack void
+drm_parse_hdmi_forum_scds(struct drm_connector *connector, const u8 *hf_scds)
 {
 	struct drm_display_info *info = &connector->display_info;
 	struct drm_hdmi_info *hdmi = &info->hdmi;
@@ -6451,7 +6454,7 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 }
 
 /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
-static void
+static noinline_for_stack void
 drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 {
 	struct drm_display_info *info = &connector->display_info;
@@ -6486,8 +6489,8 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
  * See EDID extension for head-mounted and specialized monitors, specified at:
  * https://docs.microsoft.com/en-us/windows-hardware/drivers/display/specialized-monitors-edid-extension
  */
-static void drm_parse_microsoft_vsdb(struct drm_connector *connector,
-				     const u8 *db)
+static noinline_for_stack void
+drm_parse_microsoft_vsdb(struct drm_connector *connector, const u8 *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 	u8 version = db[4];
@@ -6558,8 +6561,8 @@ static void drm_parse_amd_vsdb_v3(struct drm_display_info *info,
 	info->amd_vsdb.max_frame_rate = max_frame_rate;
 }
 
-static void drm_parse_amd_vsdb(struct drm_connector *connector,
-			       const struct cea_db *db)
+static noinline_for_stack void
+drm_parse_amd_vsdb(struct drm_connector *connector, const struct cea_db *db)
 {
 	struct drm_display_info *info = &connector->display_info;
 	const u8 *data = cea_db_data(db);
-- 
2.53.0

