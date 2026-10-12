Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA2B4AD7DB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821615; cv=none; b=A9/uUqaube1v0iRCIWvVEWn6sjgREBS8iGRDvkYftmW4lvBwVU2/578pHJPyaxBKJW6tW6/mWzvLufBXw2pE8VmBQNS88xCixMa3MWrXNgrfHVKVnDSuXcHKZOjHRlsCusiiNgmB8TiSFiwj+kt7x35XGLO7WLqUYdQpdMHfeKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821615; c=relaxed/simple;
	bh=mRVuLrRypkEWhO6R0jqCs1LjAdbCnuRcJMMG86l2Ptk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TpGDBJth7gmBByaiXBjUwCWQdz6shQ2zLS8K4Fph6DBjbFqyUZ/GYw7ND8Go+kkdNQjpkHzxFNWHs0vKL2uXTYr+Mrblm1zbJ31P6OCFp/lNqpNzRPcSXhYAiJdpASNVdEsPKAZzO1EeHS14oRCgWNzd7G+d/oWUppJvK9pT2zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S4AsXCy4; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S4AsXCy4"
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f2040e10d8so2062193b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791821611; x=1792426411; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcHBR6w/r+iCaRB31VpskZaNfVjVZKluZi2Tp8yT4OI=;
        b=S4AsXCy4hOzsLvtcyUfmfrqZld/XJWVaXrsyUnhL5lUuHRD/d8V+7ncI8FJJ5AjWDC
         w/GNQQwCWTYC+GMKiqUK19hhCPVS6Ge9cxBIy63cADy5XniRnnw6j8JvvD7tXwhm+h6o
         NdmuBj9golR8QdsTV0p2UGC464L9oJpXkihWp75KgiDze2ZsVV0MnesGq4OUKpLqRvnc
         xsMtxU2mF/0+RwPm4C6s6m4pox6UH4gvrBnuO0Ajee5LSsBrtMykxz9FOPWrt+0mqStk
         R7f9Xg+nhdPdyvc1ulGtIK/wK/jWXJ+vB5NiqPcpHoTbumNyd7jf7nmzZKNxKEridTwt
         LXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821611; x=1792426411;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcHBR6w/r+iCaRB31VpskZaNfVjVZKluZi2Tp8yT4OI=;
        b=PbHmGU+q/C7AFQ/nfZnQcmDsw/9bKytmtoM8kWpgT2Lz6CRxexp3Kb735A1KXdHuCq
         mZRQiA81403bulm74hz0W3dCPnNpFN+REtftXiPfN4jIGY0VkGOBugsJD+KJmGqW02Nj
         bw7/wMwpeKmMaDRQKtJP/20+UxK2r7bbcSZhHhjLF0K/cf/NNStTfHxumLXO93H+hAjw
         mU7SI6hmnWvVJN6VKj+ZkixAKddvBc83hvf0LXEPKwUSieuLwNVFbMYkKtWLfHpOLPgU
         lmJjUoyr0pD9YtXHe383GwrUbKYAVmat/EHCLmMNyrjZhHVInQ4lpjhgSSwTnKT56IM7
         /C8g==
X-Forwarded-Encrypted: i=1; AKwUvBwebvmBA0pg/gNcWUmF1xf7wttDMi3lI2e5EB0lvLpmaNIywb9ct/izX2pEYLOmrq7CVwLQ4MlxbXncz9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrx928BLBtDDneBP7fFfoCutF+840W4u+oSI6ADMpl8UNNUNvh
	TkO6rLLkCOhMLuBfhnrWX3Bo8RK+eJTyUPMuQ9pOiMRwIj2iWrbFcB6iE62VdnbRXY1uj20HQtN
	7JCsQa+4DEl+iY6htJMS/KejmpDytCa/o/w==
X-Received: from jagd20-n2.prod.google.com ([2002:a05:6639:14:20b0:612:1b1a:654c])
 (user=johnsingleton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6617:b0:4d6:90f3:74b4 with SMTP id 5614622812f47-50c55b85e7emr8608012b6e.52.1791821609588;
 Mon, 12 Oct 2026 09:13:29 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:13:22 +0000
In-Reply-To: <20261012161322.930099-1-johnsingleton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261012161322.930099-1-johnsingleton@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012161322.930099-3-johnsingleton@google.com>
Subject: [PATCH 3/3] staging: media: atomisp: Fix parameter indentation and
 block comments
From: John Singleton <johnsingleton@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, John Singleton <johnsingleton@google.com>
Content-Type: text/plain; charset="UTF-8"

Replace leading spaces with tabs in function parameter lists and
format multi-line comments according to kernel coding style.

Signed-off-by: John Singleton <johnsingleton@google.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  21 +--
 .../media/atomisp/pci/atomisp_compat_css20.c  | 136 +++++++++---------
 .../media/atomisp/pci/atomisp_subdev.c        |   2 +-
 3 files changed, 83 insertions(+), 76 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index a7c28c261320..9483113f6c44 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1883,8 +1883,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
  * Function to check the zoom region whether is effective
  */
 static bool atomisp_check_zoom_region(
-    struct atomisp_sub_device *asd,
-    struct ia_css_dz_config *dz_config)
+	struct atomisp_sub_device *asd,
+	struct ia_css_dz_config *dz_config)
 {
 	struct atomisp_resolution  config;
 	bool flag = false;
@@ -1918,8 +1918,8 @@ static bool atomisp_check_zoom_region(
 }
 
 void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param)
+	struct atomisp_sub_device *asd,
+	struct atomisp_css_params *css_param)
 {
 	if (css_param->update_flag.wb_config)
 		asd->params.config.wb_config = &css_param->wb_config;
@@ -2518,9 +2518,10 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			/* If the grid info in the argument differs from the
+			 * current grid info, we tell the caller to reset the
+			 * grid size and try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -3893,9 +3894,9 @@ enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
 }
 
 static inline int atomisp_set_sensor_mipi_to_isp(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    struct camera_mipi_info *mipi_info)
+	struct atomisp_sub_device *asd,
+	enum atomisp_input_stream_id stream_id,
+	struct camera_mipi_info *mipi_info)
 {
 	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 0ee52637ea30..73edf3dfab5c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -532,9 +532,9 @@ void atomisp_destroy_pipes_stream(struct atomisp_sub_device *asd)
 }
 
 static void __apply_additional_pipe_config(
-    struct atomisp_sub_device *asd,
-    struct atomisp_stream_env *stream_env,
-    enum ia_css_pipe_id pipe_id)
+	struct atomisp_sub_device *asd,
+	struct atomisp_stream_env *stream_env,
+	enum ia_css_pipe_id pipe_id)
 {
 	struct atomisp_device *isp = asd->isp;
 
@@ -552,14 +552,16 @@ static void __apply_additional_pipe_config(
 	switch (pipe_id) {
 	case IA_CSS_PIPE_ID_CAPTURE:
 		/* enable capture pp/dz manually or digital zoom would
-		 * fail*/
+		 * fail
+		 */
 		if (stream_env->pipe_configs[pipe_id].
 		    default_capture_config.mode == IA_CSS_CAPTURE_MODE_RAW)
 			stream_env->pipe_configs[pipe_id].enable_dz = false;
 		break;
 	case IA_CSS_PIPE_ID_VIDEO:
 		/* enable reduced pipe to have binary
-		 * video_dz_2_min selected*/
+		 * video_dz_2_min selected
+		 */
 		stream_env->pipe_extra_configs[pipe_id]
 		.enable_reduced_pipe = true;
 		stream_env->pipe_configs[pipe_id]
@@ -1305,7 +1307,8 @@ int atomisp_css_get_grid_info(struct atomisp_sub_device *asd,
 
 	/* If the grid info has not changed and the buffers for 3A and
 	 * DIS statistics buffers are allocated or buffer size would be zero
-	 * then no need to do anything. */
+	 * then no need to do anything.
+	 */
 	if (((!memcmp(&old_info, &asd->params.curr_grid_info, sizeof(old_info))
 	      && asd->params.s3a_user_stat && asd->params.dvs_stat)
 	     || asd->params.curr_grid_info.s3a_grid.width == 0
@@ -1392,7 +1395,8 @@ int atomisp_alloc_metadata_output_buf(struct atomisp_sub_device *asd)
 	int i;
 
 	/* We allocate the cpu-side buffer used for communication with user
-	 * space */
+	 * space
+	 */
 	for (i = 0; i < ATOMISP_METADATA_TYPE_NUM; i++) {
 		asd->params.metadata_user[i] = kvmalloc(
 						   asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].
@@ -1554,10 +1558,10 @@ int atomisp_css_set_default_isys_config(struct atomisp_sub_device *asd,
 }
 
 void atomisp_css_isys_two_stream_cfg_update_stream1(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    enum atomisp_input_format input_format,
-    unsigned int width, unsigned int height)
+	struct atomisp_sub_device *asd,
+	enum atomisp_input_stream_id stream_id,
+	enum atomisp_input_format input_format,
+	unsigned int width, unsigned int height)
 {
 	struct ia_css_stream_config *s_config =
 		    &asd->stream_env[stream_id].stream_config;
@@ -1572,10 +1576,10 @@ void atomisp_css_isys_two_stream_cfg_update_stream1(
 }
 
 void atomisp_css_isys_two_stream_cfg_update_stream2(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    enum atomisp_input_format input_format,
-    unsigned int width, unsigned int height)
+	struct atomisp_sub_device *asd,
+	enum atomisp_input_stream_id stream_id,
+	enum atomisp_input_format input_format,
+	unsigned int width, unsigned int height)
 {
 	struct ia_css_stream_config *s_config =
 		    &asd->stream_env[stream_id].stream_config;
@@ -1592,9 +1596,9 @@ void atomisp_css_isys_two_stream_cfg_update_stream2(
 }
 
 int atomisp_css_input_set_effective_resolution(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    unsigned int width, unsigned int height)
+	struct atomisp_sub_device *asd,
+	enum atomisp_input_stream_id stream_id,
+	unsigned int width, unsigned int height)
 {
 	struct ia_css_stream_config *s_config =
 		    &asd->stream_env[stream_id].stream_config;
@@ -1613,8 +1617,8 @@ void atomisp_css_video_set_dis_envelope(struct atomisp_sub_device *asd,
 }
 
 void atomisp_css_input_set_two_pixels_per_clock(
-    struct atomisp_sub_device *asd,
-    bool two_ppc)
+	struct atomisp_sub_device *asd,
+	bool two_ppc)
 {
 	int i;
 
@@ -1725,14 +1729,14 @@ void atomisp_css_preview_enable_online(struct atomisp_sub_device *asd,
 }
 
 int atomisp_css_input_configure_port(
-    struct atomisp_sub_device *asd,
-    enum mipi_port_id port,
-    unsigned int num_lanes,
-    unsigned int timeout,
-    unsigned int mipi_freq,
-    enum atomisp_input_format metadata_format,
-    unsigned int metadata_width,
-    unsigned int metadata_height)
+	struct atomisp_sub_device *asd,
+	enum mipi_port_id port,
+	unsigned int num_lanes,
+	unsigned int timeout,
+	unsigned int mipi_freq,
+	enum atomisp_input_format metadata_format,
+	unsigned int metadata_width,
+	unsigned int metadata_height)
 {
 	int i;
 	struct atomisp_stream_env *stream_env;
@@ -1822,8 +1826,8 @@ void atomisp_css_stop(struct atomisp_sub_device *asd, bool in_reset)
 }
 
 void atomisp_css_continuous_set_num_raw_frames(
-     struct atomisp_sub_device *asd,
-     int num_frames)
+	struct atomisp_sub_device *asd,
+	int num_frames)
 {
 	if (asd->enable_raw_buffer_lock->val) {
 		asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
@@ -1850,8 +1854,8 @@ void atomisp_css_continuous_set_num_raw_frames(
 }
 
 static enum ia_css_pipe_mode __pipe_id_to_pipe_mode(
-    struct atomisp_sub_device *asd,
-    enum ia_css_pipe_id pipe_id)
+	struct atomisp_sub_device *asd,
+	enum ia_css_pipe_id pipe_id)
 {
 	struct atomisp_device *isp = asd->isp;
 	struct camera_mipi_info *mipi_info = atomisp_to_sensor_mipi_info(
@@ -2357,10 +2361,10 @@ int atomisp_css_video_configure_output(struct atomisp_sub_device *asd,
 }
 
 int atomisp_css_video_configure_viewfinder(
-    struct atomisp_sub_device *asd,
-    unsigned int width, unsigned int height,
-    unsigned int min_width,
-    enum ia_css_frame_format format)
+	struct atomisp_sub_device *asd,
+	unsigned int width, unsigned int height,
+	unsigned int min_width,
+	enum ia_css_frame_format format)
 {
 	__configure_vf_output(asd, width, height, min_width, format,
 			      IA_CSS_PIPE_ID_VIDEO);
@@ -2368,67 +2372,67 @@ int atomisp_css_video_configure_viewfinder(
 }
 
 int atomisp_css_capture_configure_viewfinder(
-    struct atomisp_sub_device *asd,
-    unsigned int width, unsigned int height,
-    unsigned int min_width,
-    enum ia_css_frame_format format)
+	struct atomisp_sub_device *asd,
+	unsigned int width, unsigned int height,
+	unsigned int min_width,
+	enum ia_css_frame_format format)
 {
 	__configure_vf_output(asd, width, height, min_width, format, IA_CSS_PIPE_ID_CAPTURE);
 	return 0;
 }
 
 int atomisp_css_video_get_viewfinder_frame_info(
-    struct atomisp_sub_device *asd,
-    struct ia_css_frame_info *info)
+	struct atomisp_sub_device *asd,
+	struct ia_css_frame_info *info)
 {
 	return __get_frame_info(asd, ATOMISP_INPUT_STREAM_GENERAL, info,
 				ATOMISP_CSS_VF_FRAME, IA_CSS_PIPE_ID_VIDEO);
 }
 
 int atomisp_css_capture_get_viewfinder_frame_info(
-    struct atomisp_sub_device *asd,
-    struct ia_css_frame_info *info)
+	struct atomisp_sub_device *asd,
+	struct ia_css_frame_info *info)
 {
 	return __get_frame_info(asd, ATOMISP_INPUT_STREAM_GENERAL, info,
 				ATOMISP_CSS_VF_FRAME, IA_CSS_PIPE_ID_CAPTURE);
 }
 
 int atomisp_css_copy_get_output_frame_info(
-    struct atomisp_sub_device *asd,
-    unsigned int stream_index,
-    struct ia_css_frame_info *info)
+	struct atomisp_sub_device *asd,
+	unsigned int stream_index,
+	struct ia_css_frame_info *info)
 {
 	return __get_frame_info(asd, stream_index, info,
 				ATOMISP_CSS_OUTPUT_FRAME, IA_CSS_PIPE_ID_COPY);
 }
 
 int atomisp_css_preview_get_output_frame_info(
-    struct atomisp_sub_device *asd,
-    struct ia_css_frame_info *info)
+	struct atomisp_sub_device *asd,
+	struct ia_css_frame_info *info)
 {
 	return __get_frame_info(asd, ATOMISP_INPUT_STREAM_GENERAL, info,
 				ATOMISP_CSS_OUTPUT_FRAME, IA_CSS_PIPE_ID_PREVIEW);
 }
 
 int atomisp_css_capture_get_output_frame_info(
-    struct atomisp_sub_device *asd,
-    struct ia_css_frame_info *info)
+	struct atomisp_sub_device *asd,
+	struct ia_css_frame_info *info)
 {
 	return __get_frame_info(asd, ATOMISP_INPUT_STREAM_GENERAL, info,
 				ATOMISP_CSS_OUTPUT_FRAME, IA_CSS_PIPE_ID_CAPTURE);
 }
 
 int atomisp_css_video_get_output_frame_info(
-    struct atomisp_sub_device *asd,
-    struct ia_css_frame_info *info)
+	struct atomisp_sub_device *asd,
+	struct ia_css_frame_info *info)
 {
 	return __get_frame_info(asd, ATOMISP_INPUT_STREAM_GENERAL, info,
 				ATOMISP_CSS_OUTPUT_FRAME, IA_CSS_PIPE_ID_VIDEO);
 }
 
 int atomisp_css_preview_configure_pp_input(
-    struct atomisp_sub_device *asd,
-    unsigned int width, unsigned int height)
+	struct atomisp_sub_device *asd,
+	unsigned int width, unsigned int height)
 {
 	struct atomisp_stream_env *stream_env =
 		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
@@ -2442,16 +2446,16 @@ int atomisp_css_preview_configure_pp_input(
 }
 
 int atomisp_css_capture_configure_pp_input(
-    struct atomisp_sub_device *asd,
-    unsigned int width, unsigned int height)
+	struct atomisp_sub_device *asd,
+	unsigned int width, unsigned int height)
 {
 	__configure_capture_pp_input(asd, width, height, IA_CSS_PIPE_ID_CAPTURE);
 	return 0;
 }
 
 int atomisp_css_video_configure_pp_input(
-    struct atomisp_sub_device *asd,
-    unsigned int width, unsigned int height)
+	struct atomisp_sub_device *asd,
+	unsigned int width, unsigned int height)
 {
 	struct atomisp_stream_env *stream_env =
 		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
@@ -2613,8 +2617,9 @@ int atomisp_css_set_dis_coefs(struct atomisp_sub_device *asd,
 {
 	if (atomisp_compare_dvs_grid(asd, &coefs->grid_info) != 0)
 		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		 * grid info, we tell the caller to reset the grid size and
+		   try again.
+		 */
 		return -EAGAIN;
 
 	if (!coefs->hor_coefs.odd_real ||
@@ -3039,8 +3044,9 @@ int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
 
 	if (atomisp_compare_dvs_grid(asd, &stats->dvs2_stat.grid_info) != 0)
 		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		 * grid info, we tell the caller to reset the grid size and
+		   try again.
+		 */
 		return -EAGAIN;
 
 	spin_lock_irqsave(&asd->dis_stats_lock, flags);
@@ -3104,7 +3110,7 @@ int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
 }
 
 struct ia_css_shading_table *atomisp_css_shading_table_alloc(
-    unsigned int width, unsigned int height)
+	unsigned int width, unsigned int height)
 {
 	return ia_css_shading_table_alloc(width, height);
 }
@@ -3394,7 +3400,7 @@ void atomisp_en_dz_capt_pipe(struct atomisp_sub_device *asd, bool enable)
 }
 
 struct ia_css_dvs_grid_info *atomisp_css_get_dvs_grid_info(
-    struct ia_css_grid_info *grid_info)
+	struct ia_css_grid_info *grid_info)
 {
 	if (!grid_info)
 		return NULL;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 9de9cd884d99..700fcf88a886 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -96,7 +96,7 @@ const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code)
 }
 
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-    enum atomisp_input_format atomisp_in_fmt)
+	enum atomisp_input_format atomisp_in_fmt)
 {
 	int i;
 
-- 
2.56.0.385.gd3acb90ef8-goog

