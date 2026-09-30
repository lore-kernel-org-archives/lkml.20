Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7B14E4C50;
	Wed, 30 Sep 2026 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772285; cv=none; b=AsS1lUE6y6dA7oo1e1i9wzAfwz8mKkE4GSNDTjwHDQ7AirhuM7rDEKjsSG+GmalSwW5tzdi6KFBQp27CkFCv2BaoLBxDrIrBKrQaAyL/dbJEbpoTfMN5gu859vETpFBwnFljxJ08hrjJct9U4AZ9df5YoCED14KHq8Xr+UCrMks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772285; c=relaxed/simple;
	bh=e4hz6d7zJa4YX8tzhNQaTqN1PBFr7mjK8xvaDaSt5y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z15e+doX0wHCPRu/S/EG7sQ3wwogkio4twhM6Bry+uVeE4nLe0sWr7Q9H/NDu4q5Ma91c/W8AUzPwtTnun6tgpb15vLCAZhR06wROxNrNFw9qNHtk8hQmvrf0Gu1Mjwg4Wj6YibVPJL1aaJS7Ywvoq6Mi4EKXpwmUiD1pMZhC8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1790772171t3f14f698
X-QQ-Originating-IP: kJrvdrvSrDyx+pNNfkFw4vp+d6T7Q/uT5yBR5r5hmcM=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Sep 2026 20:42:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3594575140432455932
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 30 Sep 2026 20:41:56 +0800
Subject: [PATCH 12/13] drm/msm/dp: Serialize video test state changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-msm-dp-hdr10-v1-12-dbbf8b2b42bc@radxa.com>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
In-Reply-To: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9106; i=sophon@radxa.com;
 h=from:subject:message-id; bh=e4hz6d7zJa4YX8tzhNQaTqN1PBFr7mjK8xvaDaSt5y0=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFl7mZf/1X5fda5w6oa0Kx/PKkdXLGGNz3FYE1eR/NXf2
 eSLbbxpRykLgxgXg6yYIotCPMNc9srca0/FSvVg5rAygQxh4OIUgInszGBkWFJ/auXNd6YJfXJL
 ozI7PbMfpddWFcryuTfP7Vo5n/XcNkaGZymKJwocBeac2Rmatb7ip1iA5cWYF+cvHFt/RKlf6fV
 tFgA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MxZCU/CcMqmTrnzirSVABKB8y/6jEilsfmpOdOvc24qRTdP8iUbBE9Ew
	j6FBncFjPDuNOWHD3j/dUqhefIy+zlMKveD/UkonSJHmz20xDlko05b+OMRVo9vB8QSEquw
	GWvB/rXDVrB9MIX3LYTjCUNgS3Iws9/gZtJDkdIOregjjcyOBp7AyBSqswmwfKyv6Fw4oqV
	GkLUz/94JYDzIksdsc3rv520I73iaOEnbyI2zyoIwIgmkN3GY5SeXy0AHCf/jDdoe6897t3
	NTYYxsTGS19il6kYOJMOlTIV4t10RSgJC6M20FGRto5V5Omus/GzJPEoHnxGxBGYd8xeDOY
	mMkViy6l0YA6HD53nbsZWa4viielcvnDJuEDuoeSHZdmePhrGp6oFRXjBoV79SzQ9KHNhvs
	df5HP6X20MLw7Vg2aZ4O/UBRl7c9sklnRLQcpuuYuTbU/EnxgD6YKrzT8MgWmhDdKHp36VG
	GTTFTuyXOffk+1/xyW47QLdP8i2CazoMNlb7Wtw+8xlCfz/RYBiPw0JkjLIAYQuQPUeJ4H+
	Vp94chyYC08X4oFH3t9eXrRQu1bsvft8SntgkIs39g7M1d0apebnP/7NaGBG/+/EH/XhmcV
	fgsdkCzA6A3xhIY35/rsiYLsqVvnve+VGrbsBvAVxP9n2FQMIwPE6j5b+ELT2hroHo7Bso/
	neLOOTZ/dqd3eNC7Ll/v+YU9lyJ8ZABEjIDos7z1eFGc+BEJkpG0HJML+3M14ushFmPLKjz
	IROCu1oecW3fC+PBxr56O96Hx9hKWU79SAJIt5SI8ZhuSf+wLGwtd+mzk/4PXR8AUTAibWT
	f0yjW5dAMP2QtUAehdGgIOkZdYCDPxSD3xBmxpL947I+u1102O29Q+ydp2Z710fv8rAdDxq
	vXhPEPr5XXB/WkEX0PQDcTKIKbKuZZdgB+PYANqmKokYlgIoPpn4hoS/WHJIyYqLW1cR28a
	FnpqzKtMXHul6prN174nQvHBHktJpJQYAk5lJZ/W/6UGJ7Noa8BCwJL+y9p1htbfy6mTR59
	r4fJCSqEmIhjKTpLWIlxmJ19IM3zA0vPs1Eml6TzEjrW5mLTr8ArgF6fzm5qVWVoj2mBBHf
	g==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

The debugfs test control writes video_test directly, racing HPD handling
and mode programming. Reading the test flag and its requested depth in
separate calls also allows those values to change between the reads.

Route test state access through the display and use plugged_lock for both
HPD and debugfs updates. Hold the same lock while selecting the test depth
and installing the mode. Pass the display instance to debugfs for access
to its connector and the serialized test controls.

Preserve the existing SDR test behavior. The shared setter provides the
entry point for rejecting incompatible tests when HDR is added.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_debug.c   | 27 ++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_debug.h   |  8 +++++---
 drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
 4 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 00fb1a7ba40e..c26b356f998a 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -21,7 +21,7 @@
 struct msm_dp_debug_private {
 	struct msm_dp_link *link;
 	struct msm_dp_panel *panel;
-	struct drm_connector *connector;
+	struct msm_dp *dp;
 };
 
 static int msm_dp_debug_show(struct seq_file *seq, void *p)
@@ -89,7 +89,7 @@ DEFINE_SHOW_ATTRIBUTE(msm_dp_debug);
 static int msm_dp_test_data_show(struct seq_file *m, void *data)
 {
 	const struct msm_dp_debug_private *debug = m->private;
-	const struct drm_connector *connector = debug->connector;
+	const struct drm_connector *connector = debug->dp->connector;
 	u32 bpc;
 
 	if (connector->status == connector_status_connected) {
@@ -111,7 +111,7 @@ DEFINE_SHOW_ATTRIBUTE(msm_dp_test_data);
 static int msm_dp_test_type_show(struct seq_file *m, void *data)
 {
 	const struct msm_dp_debug_private *debug = m->private;
-	const struct drm_connector *connector = debug->connector;
+	const struct drm_connector *connector = debug->dp->connector;
 
 	if (connector->status == connector_status_connected)
 		seq_printf(m, "%02x", DP_TEST_LINK_VIDEO_PATTERN);
@@ -133,7 +133,7 @@ static ssize_t msm_dp_test_active_write(struct file *file,
 	int val = 0;
 
 	debug = ((struct seq_file *)file->private_data)->private;
-	connector = debug->connector;
+	connector = debug->dp->connector;
 
 	if (len == 0)
 		return 0;
@@ -154,10 +154,11 @@ static ssize_t msm_dp_test_active_write(struct file *file,
 		/* To prevent erroneous activation of the compliance
 		 * testing code, only accept an actual value of 1 here
 		 */
-		if (val == 1)
-			debug->panel->video_test = true;
-		else
-			debug->panel->video_test = false;
+		status = msm_dp_display_set_video_test(debug->dp, val == 1);
+		if (status) {
+			kfree(input_buffer);
+			return status;
+		}
 	}
 	kfree(input_buffer);
 
@@ -168,10 +169,10 @@ static ssize_t msm_dp_test_active_write(struct file *file,
 static int msm_dp_test_active_show(struct seq_file *m, void *data)
 {
 	struct msm_dp_debug_private *debug = m->private;
-	struct drm_connector *connector = debug->connector;
+	struct drm_connector *connector = debug->dp->connector;
 
 	if (connector->status == connector_status_connected) {
-		if (debug->panel->video_test)
+		if (msm_dp_display_check_video_test(debug->dp))
 			seq_puts(m, "1");
 		else
 			seq_puts(m, "0");
@@ -200,12 +201,12 @@ static const struct file_operations test_active_fops = {
 
 int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 		  struct msm_dp_link *link,
-		  struct drm_connector *connector,
+		  struct msm_dp *dp,
 		  struct dentry *root, bool is_edp)
 {
 	struct msm_dp_debug_private *debug;
 
-	if (!dev || !panel || !link) {
+	if (!dev || !panel || !link || !dp || !dp->connector) {
 		DRM_ERROR("invalid input\n");
 		return -EINVAL;
 	}
@@ -216,7 +217,7 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 
 	debug->link = link;
 	debug->panel = panel;
-	debug->connector = connector;
+	debug->dp = dp;
 
 	debugfs_create_file("dp_debug", 0444, root,
 			debug, &msm_dp_debug_fops);
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index a90083fec856..430891e110fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -9,6 +9,8 @@
 #include "dp_panel.h"
 #include "dp_link.h"
 
+struct msm_dp;
+
 #if defined(CONFIG_DEBUG_FS)
 
 /**
@@ -17,7 +19,7 @@
  * @dev: device instance of the caller
  * @panel: instance of panel module
  * @link: instance of link module
- * @connector: double pointer to display connector
+ * @dp: display instance owning the connector and video test state
  * @root: connector's debugfs root
  * @is_edp: set for eDP connectors / panels
  * return: pointer to allocated debug module data
@@ -27,7 +29,7 @@
  */
 int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 		  struct msm_dp_link *link,
-		  struct drm_connector *connector,
+		  struct msm_dp *dp,
 		  struct dentry *root,
 		  bool is_edp);
 
@@ -36,7 +38,7 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 static inline
 int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 		  struct msm_dp_link *link,
-		  struct drm_connector *connector,
+		  struct msm_dp *dp,
 		  struct dentry *root,
 		  bool is_edp)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 65ac35e41ed8..ec65800f629a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -426,10 +426,20 @@ static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
 	dp->core_initialized = false;
 }
 
+static int msm_dp_display_set_video_test_locked(struct msm_dp_display_private *dp,
+						bool enable)
+{
+	lockdep_assert_held(&dp->plugged_lock);
+
+	dp->panel->video_test = enable;
+	return 0;
+}
+
 static void msm_dp_display_handle_video_request(struct msm_dp_display_private *dp)
 {
 	if (dp->link->sink_request & DP_TEST_LINK_VIDEO_PATTERN) {
-		dp->panel->video_test = true;
+		if (msm_dp_display_set_video_test_locked(dp, true))
+			dp->link->test_response = DP_TEST_NAK;
 		msm_dp_link_send_test_response(dp->link);
 	}
 }
@@ -671,8 +681,10 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (msm_dp_display_check_video_test(msm_dp_display))
-		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
+	guard(mutex)(&dp->plugged_lock);
+
+	if (dp->panel->video_test)
+		bpp = msm_dp_link_bit_depth_to_bpp(dp->link->test_video.test_bit_depth);
 	else
 		bpp = state->bpp;
 
@@ -940,22 +952,20 @@ bool msm_dp_display_check_video_test(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	guard(mutex)(&msm_dp_display->plugged_lock);
+
 	return msm_dp_display->panel->video_test;
 }
 
-int msm_dp_display_get_test_bpp(struct msm_dp *dp)
+int msm_dp_display_set_video_test(struct msm_dp *dp, bool enable)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
-	if (!dp) {
-		DRM_ERROR("invalid params\n");
-		return 0;
-	}
-
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	return msm_dp_link_bit_depth_to_bpp(
-		msm_dp_display->link->test_video.test_bit_depth);
+	guard(mutex)(&msm_dp_display->plugged_lock);
+
+	return msm_dp_display_set_video_test_locked(msm_dp_display, enable);
 }
 
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
@@ -1505,7 +1515,7 @@ void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *r
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 	dev = &dp->msm_dp_display.pdev->dev;
 
-	rc = msm_dp_debug_init(dev, dp->panel, dp->link, dp->msm_dp_display.connector, root, is_edp);
+	rc = msm_dp_debug_init(dev, dp->panel, dp->link, msm_dp_display, root, is_edp);
 	if (rc)
 		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 6a77e5952530..ac64c1d3227a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -30,7 +30,7 @@ struct msm_dp {
 
 int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
 bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
-int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
+int msm_dp_display_set_video_test(struct msm_dp *dp, bool enable);
 void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display);
 void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display);
 void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);

-- 
2.55.0

