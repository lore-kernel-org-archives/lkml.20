Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166411;
	b=wM9loUq+wVDPbPJ9/yEy/M13w0Jk1zKthdaX6owFecQs/d/raUuvKe7XeMu+a2MF1cxR
	 EOuk4P1gbZ52bbPsPacxSy2dlpQ3h4nB3pmi2Dl8QN8bC44plwAXlQtCUjriRsv1VfRkk
	 ykgViYH1Bh/iFYfaJ+TAss8SO8Ks68E96/H5vGq6Kof7swKa1loNmkiQB8X2KiMPp9DMn
	 yeBKJ0Ig7ik8clc+HFa5ZyJ+qRNlP5udqi6vRBYEZuHoZwbYCJsmdrZ0pvmTaVSpwQC+Z
	 ZvCtveFQuZlHBNeGvZ9kSaM8Pdmr6vOldvxovxtPYMLSd+QsW7De/tRY4ehPjy6ixgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WqK6mbkkkr10tJsOCL0yXCIykxjGMKDl1nexZ/2ocm0=;
	b=1+J1QKzvXtF/Ga8Mp8MDe2DCUWM3XPXBY1+MI12uYmfvfGwuEfgatFFWvr1iV60WYgwa
	 PCHIwAxuD+vkSGtWS7kddNdZ/YgCSo4IlwrLu6ta6vCdQQj770gyI6rfgIMD4MvYnCrzb
	 0bz0T5pY8tLLzutV3TgT2cBsNz/D9rEt1Y/TMtDhB1ASqW7CRSXzDZr/orQImKnQ+minG
	 5f2Tyg70eYzdaNoO8Bsq+Vmh636au0M56PN5wCBqN1iJBt88U5sD5pTJjOnTG7NgpaRte
	 k49PIr1xFxnZPlu9e6x7SVolRggsnbglRpORfWRRekkme4BaftLZx6488qt6CbjO69Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rKYCg9zE;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7C1606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B7C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rKYCg9zE
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so1327215e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166410; x=1794771210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WqK6mbkkkr10tJsOCL0yXCIykxjGMKDl1nexZ/2ocm0=;
        b=rKYCg9zEstncFeVERCI4gFaRQ4+MCWWde09Mvr9+128puGqE2s8SfEobtov/KyEz54
         lKEnboECfCv9T7JU2b8hdRtRhgG7mk2j63Mxv3eSdbTiihvgQcrCztzKAjiymEXcScGf
         CY/PvPu6mFVFphfy4Am1KNVwC1TiBzLDeCAurTFxKIox9XmcanxvhL73s1+FnTi+18J5
         NMoGngeJnsoGNs6gkFoACWjcn8sNC8SV7JauIEUrMWNp9Ja956iJVkhAaxZwdmueDjdS
         RZAb8DcjR+n2YMH2ZIz73XWr4uB+cupsIqS3u3uhnoNlP8zr790beIGIKQ65cRPnx//B
         WeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166410; x=1794771210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WqK6mbkkkr10tJsOCL0yXCIykxjGMKDl1nexZ/2ocm0=;
        b=0hX6y91VcRjqxo16uW63i9uPxGa/1LYVTbCSO0NJP4bYNx9EMH0kAOH1No8U7BR5b+
         1I+A3jrl2LF4N2hzP+AaifybGsI1W0GfSoaEl1780JDXqIycLSAb44XumqpMZrUGT594
         Jylya35GWO2SJi1BhRh2wkkKurH0LTPvBaiMrYXNKY0CSlf1XhhZo5qKnnPVJQcTccfD
         boKmeESm2s8sNBFS5xUzwifho5Ar4N7efzz7TNIChWpx/2hRjeKNAsESJ2EdIV7q4o88
         STjMvLbCbxS8CNPovRHJ+TdJ36g7So9JI76zICxIqI5Khbmua77RbgrhQHBwcKATp1ea
         I08A==
X-Forwarded-Encrypted: i=1; AL+hErHxE0Z6Ur2GacsHo1EdzwSw6z5z3v3zzhcLn4z+OiUjOTBhKKBl7W90JHi7yhScJza3RirfuwqGIz8VEN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+maSi5cKdheUd5ITx5yzZ3Y7TvGy5sH+eQCqhmd6KQR1Oa+kTM
	hM5GOVbs00BeyKcatFi3T/02cuphKLave9A46yt+/4noJ5qemAU0JddJ
X-Gm-Gg: AYBFou3Vr/ijy5G14/Z0ZcwYY0quDMnSViN8RT4fbbBMJiVTB4oNjJuwoq1rPFYfZhm
	777lKiC9QYfeLJG78pbr4p7rODJGhTPGinL5bDWZpMnGz0Fo2kDpbcJrhGxPtAbI1uXibbKSvul
	0NV1vv85goicvYg5yR9PHIozVx1ER8yyTbR4neGJ6H6k699i7VPni7nShc+9NcK7tYR28mNA1gB
	YMmSx2P+MEU2Pw+F2zmJ7VAzsHywfoVDEtCW3NHG0eLqGWqoh5BpCq4ws1DFjCUakDXia+Z8vfs
	42LtnK80hcwBF2TT1s0oYofh0ytBJh4VT7tDlI77mNDj01BeNJlAWW1jG1wcrRzTeES8R4UinqV
	AJCj63dl7DcImoqZaXmmgHSs8URmitcpFQLDct2IkeRddUOz/+c31wfQrX/6UHLCroUv48oIflr
	5mZzK1NB8ue97K319//0a5HAqH+cnjMzMoSmk84okV0N5+ubobXbWfyjsXqlYkU1vVJm96LtsGK
	ZXJseueoj4ptOwCRt6baHHcknLr+c+6ZX+4Qiqzi9npJh4alNEOBkA8B9q7BSTXDjvl038BQlJs
	mBLS2HgqsLP14tqW7NAfEOwhi1Ha1GG0dAMFPBB/Qw==
X-Received: by 2002:a05:600c:8b70:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4b963c73ab1mr41078225e9.12.1794166409692;
        Sun, 08 Nov 2026 11:33:29 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbfa121sm105422115e9.1.2026.11.08.11.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:33:28 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Sun, 08 Nov 2026 19:33:10 +0000
Subject: [PATCH 2/4] drm/vkms: precompute the gamma LUT for every channel
 value
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
Message-Id: <20261108-lut-v1-2-f762d70ae4cd@gmail.com>
References: <20261108-lut-v1-0-f762d70ae4cd@gmail.com>
In-Reply-To: <20261108-lut-v1-0-f762d70ae4cd@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Oarora Etimis <oaroraetimis@gmail.com>
X-Mailer: b4 0.15.2

apply_lut() interpolates every channel of every pixel: three calls to
apply_lut_to_channel_value(), each computing a fixed-point LUT index and
lerping the two neighbouring entries. In virtme-ng with two CPUs, that
makes kms_plane@pixel-format-source-clamping take 78.9-83.8 s and
kms_plane@pixel-format 160.1-167.8 s over ten runs.

A channel value is a u16, so a channel has only 65536 possible inputs.
Compute them once per LUT change into three tables of 65536 u16, in one
allocation of 384 KiB, and let apply_lut() index them by the channel value
itself; composing a pixel then costs three reads. The two subtests drop to
4.87-4.90 s and 9.70-9.84 s.

Entries come from the same apply_lut_to_channel_value(), so the composed
output stays bit-identical to the per-pixel path.

The tables are built in vkms_composer_worker(), outside the composer lock,
on a frame with a CRC pending whose blob differs from the one they were
built from. Holding a reference on that blob keeps its address from being
recycled, so comparing pointers stays a valid identity test for contents
that are immutable once published. They are allocated with kvmalloc() in
vkms_crtc_init() and freed by a device action that also drops the blob
reference - registered before the workqueue, so the workqueue is destroyed
first.

When there is no LUT the tables keep their previous contents; apply_lut()
returns on the NULL base before indexing them.

This patch depends on patch 1: it declares gamma_lut and clears
lut_length when there is no LUT. Applied alone, this patch does not
compile, and the rebuild check would build from a NULL base.

Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 37 ++++++++++++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_composer.h |  3 +++
 drivers/gpu/drm/vkms/vkms_crtc.c     | 24 +++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h      |  6 ++++++
 4 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 1d5658bbd493..5bbc34113250 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -111,21 +111,37 @@ VISIBLE_IF_KUNIT u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut
 }
 EXPORT_SYMBOL_IF_KUNIT(apply_lut_to_channel_value);
 
+/*
+ * Precompute the LUT for every 16-bit channel value, so that composing a
+ * pixel becomes one table lookup instead of an interpolation.
+ */
+VISIBLE_IF_KUNIT void build_lut_table(const struct vkms_color_lut *lut, u16 *lut_table)
+{
+	enum lut_channel channel;
+	int i;
+
+	for (channel = LUT_RED; channel < LUT_RESERVED; channel++) {
+		for (i = 0; i < LUT_TABLE_ENTRIES; i++)
+			lut_table[channel * LUT_TABLE_ENTRIES + i] =
+				apply_lut_to_channel_value(lut, i, channel);
+	}
+}
+EXPORT_SYMBOL_IF_KUNIT(build_lut_table);
 
 static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
 {
-	if (!crtc_state->gamma_lut.base)
-		return;
+	const struct vkms_output *out = drm_crtc_to_vkms_output(crtc_state->base.crtc);
+	const u16 *table = out->gamma_lut_table;
 
-	if (!crtc_state->gamma_lut.lut_length)
+	if (!crtc_state->gamma_lut.base || !crtc_state->gamma_lut.lut_length)
 		return;
 
 	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
 		struct pixel_argb_u16 *pixel = &output_buffer->pixels[x];
 
-		pixel->r = apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel->r, LUT_RED);
-		pixel->g = apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel->g, LUT_GREEN);
-		pixel->b = apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel->b, LUT_BLUE);
+		pixel->r = table[LUT_RED * LUT_TABLE_ENTRIES + pixel->r];
+		pixel->g = table[LUT_GREEN * LUT_TABLE_ENTRIES + pixel->g];
+		pixel->b = table[LUT_BLUE * LUT_TABLE_ENTRIES + pixel->b];
 	}
 }
 
@@ -653,6 +669,15 @@ void vkms_composer_worker(struct work_struct *work)
 	if (!crc_pending)
 		return;
 
+	/* Rebuild only when the LUT differs from the one the table was built from. */
+	if (gamma_lut != out->gamma_lut_blob) {
+		if (crtc_state->gamma_lut.lut_length)
+			build_lut_table(&crtc_state->gamma_lut, out->gamma_lut_table);
+
+		drm_property_blob_put(out->gamma_lut_blob);
+		out->gamma_lut_blob = gamma_lut ? drm_property_blob_get(gamma_lut) : NULL;
+	}
+
 	if (wb_pending)
 		ret = compose_active_planes(active_wb, crtc_state, &crc32);
 	else
diff --git a/drivers/gpu/drm/vkms/vkms_composer.h b/drivers/gpu/drm/vkms/vkms_composer.h
index 04dd5646f672..b0ee93ba6dbe 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.h
+++ b/drivers/gpu/drm/vkms/vkms_composer.h
@@ -17,11 +17,14 @@ enum lut_channel {
 	LUT_RESERVED
 };
 
+#define LUT_TABLE_ENTRIES	(1U << 16)
+
 #if IS_ENABLED(CONFIG_KUNIT)
 u16 lerp_u16(u16 a, u16 b, s64 t);
 s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value);
 u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
 			       enum lut_channel channel);
+void build_lut_table(const struct vkms_color_lut *lut, u16 *lut_table);
 void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix);
 #endif
 
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index fe17f49305a9..c6ac90fbca2b 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -11,6 +11,7 @@
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
 
+#include "vkms_composer.h"
 #include "vkms_drv.h"
 
 static bool vkms_crtc_handle_vblank_timeout(struct drm_crtc *crtc)
@@ -203,6 +204,14 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 	.handle_vblank_timeout = vkms_crtc_handle_vblank_timeout,
 };
 
+static void vkms_release_gamma_lut(struct drm_device *dev, void *data)
+{
+	struct vkms_output *out = data;
+
+	kvfree(out->gamma_lut_table);
+	drm_property_blob_put(out->gamma_lut_blob);
+}
+
 struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *primary,
 				   struct drm_plane *cursor)
 {
@@ -235,6 +244,21 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
 	spin_lock_init(&vkms_out->lock);
 	spin_lock_init(&vkms_out->composer_lock);
 
+	/*
+	 * Allocate before composer_workq: drmm frees in reverse order, so the
+	 * workqueue (and any running worker) is destroyed before this table is
+	 * freed.
+	 */
+	vkms_out->gamma_lut_table = kvmalloc_array(LUT_RESERVED * LUT_TABLE_ENTRIES,
+						   sizeof(*vkms_out->gamma_lut_table),
+						   GFP_KERNEL | __GFP_ZERO);
+	if (!vkms_out->gamma_lut_table)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drmm_add_action_or_reset(dev, vkms_release_gamma_lut, vkms_out);
+	if (ret)
+		return ERR_PTR(ret);
+
 	vkms_out->composer_workq = drmm_alloc_ordered_workqueue(dev, "vkms_composer", 0);
 	if (IS_ERR(vkms_out->composer_workq))
 		return ERR_CAST(vkms_out->composer_workq);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 381483aa4fb0..065a7b07b4ab 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -214,6 +214,10 @@ struct vkms_crtc_state {
  *		      writeback)
  * @composer_state: Protected by @lock, current state of this VKMS output
  * @composer_lock: Lock used internally to protect @composer_state members
+ * @gamma_lut_table: Precomputed gamma LUT indexed by the 16-bit channel value. Allocated
+ *		     in vkms_crtc_init() and freed with the device.
+ * @gamma_lut_blob: Blob @gamma_lut_table was built from. Holds a reference so that the
+ *		    blob cannot be freed and reused at the same address with other contents.
  */
 struct vkms_output {
 	struct drm_crtc crtc;
@@ -226,6 +230,8 @@ struct vkms_output {
 	struct vkms_crtc_state *composer_state;
 
 	spinlock_t composer_lock;
+	u16 *gamma_lut_table;
+	struct drm_property_blob *gamma_lut_blob;
 };
 
 struct vkms_config;

-- 
2.55.0

