Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2653932E1
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857315; cv=none; b=OOZQCBgwmSm47RKY3KBZJDigxJp1PI9DrHc5SrINSU69Qb4fH/F38ueU0JJKIr9ObQc6pCYS0RRUiGV112lKpbCT89ppgCPdYRT3wWoTxCWXH6WuwuYfWIpp+d32HG1Kd1tb2UXDhWup2bA74LnZh/w+ZDlsiU9612M5tJqCOpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857315; c=relaxed/simple;
	bh=qoMnAtRxYw/yMDMQw3J+o8UT0NagGzZR4LuWPSf8zKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BROCwQ3UIzmD1eLrMJToWaVhtXvY6kbdbD1NaASu81G9GVCWz0AhEJmzfpyZCMp21SeSucfB0ooJqxW/W3A5i5/zpAusOb1BSIlFXxfMXr8nbkZ9w6UIGXsqoJSLgA66zgkZsoRrf6qmtf3d0igcIl0a9moQwDeHlZBor6DReJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tchfdf+s; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tchfdf+s"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso15451785ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857313; x=1790462113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9gMeYV87yGYpQQPZASfnk9+aNoHuNYCubc3YIOWvC9o=;
        b=Tchfdf+s+EfXEzPhsLyZr/ipR2K9+aDqxPN1pyKZ2OroZDlKgsijESxMpSP6bH+8cW
         LOjIXwB2gbY1ZaPoJzF3tl2+7Hn7F3jC5w/wQ3PzMUlGAce1At1hr8xxfWWEMpBS2/V8
         UZRIFm3Z5dFfVMAbyCWX71s+CMQSq8u9HJaDDAU+Jg7o9MuknrfHZezVrv2tsp32ufnT
         pZ3+FxVmbNKdBLHWde0vQt7+YNilMMi8RiBunklsYF8yFB21NNSKZ/eP00TTcEpbbJJB
         k6e85qBBszRZTS9fK3gi7262CTDOVPsyCUsGdulvdRbgNS5xyTItTQAUN0uhb58cqv0r
         B3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857313; x=1790462113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gMeYV87yGYpQQPZASfnk9+aNoHuNYCubc3YIOWvC9o=;
        b=ylBU7VCBrfon9JB9eaUpmv17kKXh3Q5/UC+TTy1xe+EGKkkRrN6mWNt7ot6P9661dj
         0j7aj+wK2pKkoqFzJ97fNK9r36ENz+liAyK4u6OFJpz05wOdi7F6tkbXy7RQLGuU41IE
         8tqLE9rxe9Oq3O/iY1wlKI8Ue5dDQlZYuLu40zsuaoAB0sD7hy8OnvDjBuEL968dxYR6
         DSIXF8iatDmKIgg+j4RKTl0WjK+JlS3328FmJBpSbryh+BptQEQ0jMQAyXT/1Azjv3R0
         3dpEn8bAry+KtJxKmz6XXSzowMTVdy77JWFyXlSbthwlIeebGP2qXSEoE7OHu4ZiBg7M
         J3fg==
X-Forwarded-Encrypted: i=1; AKwUvBxJ1bhIYhKkf6GinMAl2lPrcqcsVQFQuU0T6IhPVxJvq7mlKSVPOOXggluGEtA1RkPsZwAqEal5SMR//7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l1l0mtTKZzqJ5rQIuW6Cws0XM5cf51xGnoYiLGMuPyFvRUTkiM
	a2I6BGANYEpzcKEu+Jq5Sxb/t+MA8D+EmcOgeL73UtdO4aZHtNe2g5rgHiukZgZh
X-Gm-Gg: AYBFou0T9DuB1fi/Tt8VsTr+wFg3eRHOh2hmlJpVRfK2SDorvqB2g/7j36mQpz9FiMw
	42G1ihxp6FznpIH+L/ldBm1YfGP//Q9V9P1slXipkRlZ9gb4GJDYWtRRjmPXXR0m/J3vdZolwI9
	ydLFc0wPRdaxihPtDevwjFajUr7lcThhphWIVtBuKOTqPLidzKNnvtTvYsEhCClM9FKwEGHHIUh
	SlHuOvLYnw8Wc42vntSG8l6cA+PMfzREawaDC3sqP22/siTz7bguGDWL2lXrpilQVv1iqYIoT0v
	wxCG8k/0XFT/JZsdwxJ9fmgXxaEGpMhhFdjnF7Ls544ww5HaNwudDNVy14IbNlqIjn43lqbhVsV
	49nbhvA9Mh8y2wBAdMRIBWoKPw7Esr+JrhCG4opYf9R0UMdyFAhhLVps9YPS7538LzAUIs40glI
	BA1aRuDjvT/KfkTI3wkhWvEx4CElDWt6/nAb8wlhTHmpYVQfXopMiE05Q0ob3Ewv+GxdgynX4+s
	aAgsS6Os0TgRt3BPYt/AktqOGD3vJZ5McCkXzM4KZqOKFN2u9CargZC7OD1gitHHe3DV+1jPe1K
	MEnqcrKHRHWIU/Di0AFKcw==
X-Received: by 2002:a17:903:8c8:b0:2dd:c053:ec71 with SMTP id d9443c01a7336-2ddc054099amr55383325ad.36.1789857313346;
        Sat, 19 Sep 2026 15:35:13 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b670csm13351275ad.6.2026.09.19.15.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:35:13 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: hansg@kernel.org,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vboxvideo: validate VBVA ring buffer offsets and cursor dimensions
Date: Sat, 19 Sep 2026 22:35:12 +0000
Message-ID: <20260919223512.3889313-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drivers/gpu/drm/vboxvideo/ (vbox_main.c, vbox_mode.c, vbva_base.c),
validate VBVA ring buffer offsets against buffer_length and check cursor
dimensions before copying cursor data into HGSMI buffers.

Fixes: 131abc56e1ba ("drm/vboxvideo: Move the vboxvideo driver out of staging")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index aa6664542b20..8cf326661b57 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -115,6 +115,10 @@ int vbox_hw_init(struct vbox_private *vbox)
 
 	DRM_INFO("VRAM %08x\n", vbox->full_vram_size);
 
+	if (vbox->full_vram_size < VBVA_ADAPTER_INFORMATION_SIZE +
+				   vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE)
+		return -EINVAL;
+
 	ret = pcim_request_region(pdev, 0, "vboxvideo");
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 3c41238a8268..9a1d9e1aa92b 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -141,7 +141,8 @@ static bool vbox_set_up_input_mapping(struct vbox_private *vbox)
 
 		if (!fb1) {
 			fb1 = fb;
-			if (fb1 == vbox->ddev.fb_helper->fb)
+			if (vbox->ddev.fb_helper &&
+			    fb1 == vbox->ddev.fb_helper->fb)
 				break;
 		} else if (fb != fb1) {
 			single_framebuffer = false;
@@ -363,7 +364,8 @@ static int vbox_cursor_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	if (width > VBOX_MAX_CURSOR_WIDTH || height > VBOX_MAX_CURSOR_HEIGHT ||
-	    width == 0 || height == 0)
+	    width == 0 || height == 0 ||
+	    width != new_state->fb->width || height != new_state->fb->height)
 		return -EINVAL;
 
 	return 0;
@@ -380,6 +382,7 @@ static void copy_cursor_image(u8 *src, u8 *dst, u32 width, u32 height,
 	size_t line_size = (width + 7) / 8;
 	u32 i, j;
 
+	memset(dst, 0, mask_size);
 	memcpy(dst + mask_size, src, width * height * 4);
 	for (i = 0; i < height; ++i)
 		for (j = 0; j < width; ++j)
diff --git a/drivers/gpu/drm/vboxvideo/vbva_base.c b/drivers/gpu/drm/vboxvideo/vbva_base.c
index 36bc9824ec3f..3a752be06f4e 100644
--- a/drivers/gpu/drm/vboxvideo/vbva_base.c
+++ b/drivers/gpu/drm/vboxvideo/vbva_base.c
@@ -21,18 +21,35 @@
 
 static u32 vbva_buffer_available(const struct vbva_buffer *vbva)
 {
-	s32 diff = vbva->data_offset - vbva->free_offset;
+	u32 data_len = READ_ONCE(vbva->data_len);
+	u32 data_offset = READ_ONCE(vbva->data_offset);
+	u32 free_offset = READ_ONCE(vbva->free_offset);
+	s32 diff;
 
-	return diff > 0 ? diff : vbva->data_len + diff;
+	if (!data_len || data_offset >= data_len || free_offset >= data_len)
+		return 0;
+
+	diff = data_offset - free_offset;
+
+	return diff > 0 ? diff : data_len + diff;
 }
 
 static void vbva_buffer_place_data_at(struct vbva_buf_ctx *vbva_ctx,
 				      const void *p, u32 len, u32 offset)
 {
 	struct vbva_buffer *vbva = vbva_ctx->vbva;
-	u32 bytes_till_boundary = vbva->data_len - offset;
-	u8 *dst = &vbva->data[offset];
-	s32 diff = len - bytes_till_boundary;
+	u32 data_len = READ_ONCE(vbva->data_len);
+	u32 bytes_till_boundary;
+	u8 *dst;
+	s32 diff;
+
+	if (data_len > vbva_ctx->buffer_length - sizeof(*vbva) ||
+	    offset >= data_len || len > data_len)
+		return;
+
+	bytes_till_boundary = data_len - offset;
+	dst = &vbva->data[offset];
+	diff = len - bytes_till_boundary;
 
 	if (diff <= 0) {
 		/* Chunk will not cross buffer boundary. */
@@ -93,6 +110,9 @@ bool vbva_write(struct vbva_buf_ctx *vbva_ctx, struct gen_pool *ctx,
 		vbva_buffer_place_data_at(vbva_ctx, p, chunk,
 					  vbva->free_offset);
 
+		if (!vbva->data_len)
+			return false;
+
 		vbva->free_offset = (vbva->free_offset + chunk) %
 				    vbva->data_len;
 		record->len_and_flags += chunk;
@@ -165,7 +185,7 @@ bool vbva_buffer_begin_update(struct vbva_buf_ctx *vbva_ctx,
 			      struct gen_pool *ctx)
 {
 	struct vbva_record *record;
-	u32 next;
+	u32 free_idx, next;
 
 	if (!vbva_ctx->vbva ||
 	    !(vbva_ctx->vbva->host_flags.host_events & VBVA_F_MODE_ENABLED))
@@ -173,7 +193,11 @@ bool vbva_buffer_begin_update(struct vbva_buf_ctx *vbva_ctx,
 
 	WARN_ON(vbva_ctx->buffer_overflow || vbva_ctx->record);
 
-	next = (vbva_ctx->vbva->record_free_index + 1) % VBVA_MAX_RECORDS;
+	free_idx = READ_ONCE(vbva_ctx->vbva->record_free_index);
+	if (free_idx >= VBVA_MAX_RECORDS)
+		return false;
+
+	next = (free_idx + 1) % VBVA_MAX_RECORDS;
 
 	/* Flush if all slots in the records queue are used */
 	if (next == vbva_ctx->vbva->record_first_index)
@@ -183,7 +207,7 @@ bool vbva_buffer_begin_update(struct vbva_buf_ctx *vbva_ctx,
 	if (next == vbva_ctx->vbva->record_first_index)
 		return false;
 
-	record = &vbva_ctx->vbva->records[vbva_ctx->vbva->record_free_index];
+	record = &vbva_ctx->vbva->records[free_idx];
 	record->len_and_flags = VBVA_F_RECORD_PARTIAL;
 	vbva_ctx->vbva->record_free_index = next;
 	/* Remember which record we are using. */
