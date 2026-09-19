Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F7137B413
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857312; cv=none; b=TyrNN1rlHGu2/pyf5LesoHER11mzJfS4IwkepBmi4oKfcvwKuy+hcL8GENlHZVt5G4dMrEsCIBfiv7OrxUNmOnxoltLPYxKRtYb1Dg7ny1j88j/35F5wEAVPd18MgCTV7iU7sedOWvyKSRltGg9IG+CRJtFn3fWj5jQMl5Alp8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857312; c=relaxed/simple;
	bh=NzT3vPoTnV4Zvo9x3zmkgr01miXx3QB+DWBlEm5te5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kuKZAhhnM11CyWfCv2Nzxu1ueGpXdb2RK7ctjmrNQkjAn7QgQIWBYLURA7zKM9sigI1mNwwoJWPmoIwB4Gvu7PNmlUTk9GneL8pRXTxpP4t0lSsooDfoZoBskmX4z5NV+SEH7U6POdM6PjW+H82RqkzKFVH0Q9mM1ekCdHbQ5jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9qkjZLF; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9qkjZLF"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so281003a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857310; x=1790462110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFdVy9z4gml9NW4o7NwoYCSiD0u0I9A6db4IeROCKCY=;
        b=R9qkjZLFYUQQRrPGi0qcAvFzH3VlJyNvRVT4Blzl5MnMAhD4cyP5NLDI6bTN9cu4Vt
         7CUlKecdcr6LDPLpCv6V7LGqRPOmraAllqJuCY84VukXpWgD9rO0tVwuTi21dvF/Fu5Y
         MvW3DviiyzuzgOJvB9nGdMBNa2zz+fUGU2HQoxdMI+XHnsdNeOxrGXBj2OsrkBxhreLo
         06NxerqMdUwj0MRkIYGVquLtCSijDhuyz/gVyY1pQoLXJ/5kksb7gxunZER1GAwwWo0f
         8r0xH/5cHLxj1NzmsIoXVgRS5gHYam+WzgUPakTBqHhIaYwDRzS5mPNUpSk62HIRao7j
         51DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857310; x=1790462110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFdVy9z4gml9NW4o7NwoYCSiD0u0I9A6db4IeROCKCY=;
        b=piAFFESuHBS4oCuKbkscNr5g/Z5VMvVcLaaZsjWdNF1921Do5kI4OE3mnaMeGzzgVw
         +IONkbo1ulcT4QH5RCuoTKR/pW/IFOFjBKpiGoHXSKg5mbdVzk2/ySch1VbKCnZ2nJw4
         95H7x2zrYwJdEfXciIUCI/FkI3TBGza8CP0r/TMaVU80byBhbHhqYuU/NlPUU3bNzRHt
         DqAN+8aLXG2PoKU4SpdYZC02/t+2GGDNsdTyKXFCbT3Tej9CS11bl0jd/DT4aSH6X2tN
         MXlQcoekbWW7h935lT2AK4SqkVolp7h4djKy8GVzqmFLvv1flAs+WWEEbQj3t+b6wlTM
         bWDw==
X-Forwarded-Encrypted: i=1; AKwUvBwvK0rQABGyuYAg6GH5WkSjcsoAj0sQmIoo+AbciFdPzLiKsdX7bl74gsCJ5XyQeEG1M1RYYoduynzIrvM=@vger.kernel.org
X-Gm-Message-State: AFuF++lIBDzqE7SvzcSNAXqotoyTfh+38S58LH15CeDir17HG0ZwRYV8
	lyFYnbJuPKi7EI5qIdIFKCc8/T137wUSeG2Ee3YMGIf5NJw27PhoRaGW
X-Gm-Gg: AYBFou1O9nvChbkIdnQwg81wwN2rRUComsL1IS/Q4FMR5yUIC2CL1hkiR55NyZsf90w
	Wef6VqF5JoEdSvkfbXWE1E0fLpXdjUs+J8T9XSz7K4R6ZdRZVGd+EIh5YEwjeftu8hGrQSS+dCW
	JwT780sK7QVmosivNNMgiOrhg5LCmFmh3tPGl9/dd0vlrQ+5/PG7WZ9igXOpEt2yTyzQecFHiMj
	f3Du5bvvY9mv6c3MtN4Fibs4g3TNA4JOFAPAGYTZq2pg9bXsV6EmJ+C+3hn7aB/lsLxLwPrfgYw
	JvXyAx9z6kzdMZjxOWX4/N2SdJ5F/QZwgAROJOxY39LrFLHm1hGs59UVjMm9Hotdlx8P1osW3bu
	6W5q3JBEr69+LBLsSCoB1y97XyY8h2UPRfIS3/zIJYS3VJTB36kvHCU7cNLIOSTvTm8I6xeq+Ht
	K7GNvjZpu9gQQ6SR0lrucbtFEGRp6XozQGdnD045TPRf0OqeE5dr6fGbCGER8lEnYki7zm1Gktc
	sEDcvZRnDu7OXnn6rZhYXNJu1iD+mkbXAUGtT133+N9ZBaTH4jee2w5GiiUPtrvtruBVzxLBbVY
	CC8SV1sgTw==
X-Received: by 2002:a17:90b:5144:b0:3a0:2c7d:edd4 with SMTP id 98e67ed59e1d1-3a02c7e2fa4mr1832246a91.7.1789857310047;
        Sat, 19 Sep 2026 15:35:10 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02f6f2383sm2241219a91.5.2026.09.19.15.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:35:09 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: louis.chauvet@bootlin.com,
	hamohammed.sa@gmail.com,
	melissa.srw@gmail.com,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vkms: fix empty gamma/degamma LUT divide-by-zero and plane format bounds
Date: Sat, 19 Sep 2026 22:35:09 +0000
Message-ID: <20260919223509.3888763-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drivers/gpu/drm/vkms/ (vkms_composer.c, vkms_drv.c, vkms_formats.c),
guard against lut_length <= 1 before computing drm_int2fixp(lut_length -
1) and dividing in apply_lut(), and validate plane/cursor dimensions
before blending.

Fixes: a4e7e98e90eb ("drm/vkms: Rename vkms_crc.c into vkms_composer.c")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 83d217085ad0..3f933f3c137c 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -328,6 +328,10 @@ static void clamp_line_coordinates(enum pixel_read_direction direction,
 	switch (direction) {
 	case READ_LEFT_TO_RIGHT:
 	case READ_RIGHT_TO_LEFT:
+		if (*src_y_start < 0 || *src_y_start >= current_plane->frame_info->fb->height) {
+			*pixel_count = 0;
+			break;
+		}
 		if (*src_x_start < 0) {
 			*pixel_count += *src_x_start;
 			*dst_x_start -= *src_x_start;
@@ -339,6 +343,10 @@ static void clamp_line_coordinates(enum pixel_read_direction direction,
 		break;
 	case READ_BOTTOM_TO_TOP:
 	case READ_TOP_TO_BOTTOM:
+		if (*src_x_start < 0 || *src_x_start >= current_plane->frame_info->fb->width) {
+			*pixel_count = 0;
+			break;
+		}
 		if (*src_y_start < 0) {
 			*pixel_count += *src_y_start;
 			*dst_x_start -= *src_y_start;
@@ -619,13 +627,14 @@ void vkms_composer_worker(struct work_struct *work)
 	crtc_state->frame_end = 0;
 	crtc_state->crc_pending = false;
 
-	if (crtc->state->gamma_lut) {
+	if (crtc_state->base.gamma_lut) {
 		s64 max_lut_index_fp;
 		s64 u16_max_fp = drm_int2fixp(0xffff);
 
-		crtc_state->gamma_lut.base = (struct drm_color_lut *)crtc->state->gamma_lut->data;
+		crtc_state->gamma_lut.base =
+			(struct drm_color_lut *)crtc_state->base.gamma_lut->data;
 		crtc_state->gamma_lut.lut_length =
-			crtc->state->gamma_lut->length / sizeof(struct drm_color_lut);
+			crtc_state->base.gamma_lut->length / sizeof(struct drm_color_lut);
 		max_lut_index_fp = drm_int2fixp(crtc_state->gamma_lut.lut_length - 1);
 		crtc_state->gamma_lut.channel_value2index_ratio = drm_fixp_div(max_lut_index_fp,
 									       u16_max_fp);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 5a640b531d88..2db3971f72c3 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -112,7 +112,7 @@ static int vkms_atomic_check(struct drm_device *dev, struct drm_atomic_commit *s
 		if (!new_crtc_state->gamma_lut || !new_crtc_state->color_mgmt_changed)
 			continue;
 
-		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut *)
+		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut)
 		    > VKMS_LUT_SIZE)
 			return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index dfb8e13cba87..c688b7a5f415 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -49,8 +49,7 @@ static void packed_pixels_offset(const struct vkms_frame_info *frame_info, int x
 										  plane_index);
 	*rem_x = x % drm_format_info_block_width(format, plane_index);
 	*rem_y = y % drm_format_info_block_height(format, plane_index);
-	*offset = fb->offsets[plane_index] +
-		  block_y * block_pitch +
+	*offset = block_y * block_pitch +
 		  block_x * format->char_per_block[plane_index];
 }
 
@@ -78,7 +77,7 @@ static void packed_pixels_addr(const struct vkms_frame_info *frame_info,
 	int offset;
 
 	packed_pixels_offset(frame_info, x, y, plane_index, &offset, rem_x, rem_y);
-	*addr = (u8 *)frame_info->map[0].vaddr + offset;
+	*addr = (u8 *)frame_info->map[plane_index].vaddr + offset;
 }
 
 /**
@@ -139,7 +138,7 @@ static void packed_pixels_addr_1x1(const struct vkms_frame_info *frame_info,
 
 	packed_pixels_offset(frame_info, x, y, plane_index, &offset, &rem_x,
 			     &rem_y);
-	*addr = (u8 *)frame_info->map[0].vaddr + offset;
+	*addr = (u8 *)frame_info->map[plane_index].vaddr + offset;
 }
 
 /**
