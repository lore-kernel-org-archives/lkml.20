Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472000;
	b=hpVpg9bxWKlKLIEkn5Mb/im6HjPvHcLHk2tr789fdJIPb4iWZOhM0OjGPUn26DEySYUS
	 Tqgl3mhrX7eYXwRmrEnJgB58jyEOTAoCYhLG9Sxlz5mjX7SWbGQxjdOgEoKgfsFcAn8Vk
	 BQkNBcNu3KmrgIJ7eIZACAWM9H/vnSjD3GLMauQvZhIB3cVQEfBpVMiJCdk7be4tRaU3F
	 taKz4I5LW2VCU9AtB+1TCFYCqBSK3pOETD69vEytt404s9KXihPei0D0cM6a1VxaLEQ+Z
	 CSujKO3u6OagVkR80fB4hBHia0A6vXDjT8vzuYCdJ3DcDVBQjHAP8SpWAv3+BoVpqow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472000;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=a8GD79z6ryFAq01siFbSOm1F4JOpsxAS2CMyl087c3U=;
	b=Frk+dzXHsvqkE1aJglmhj7vD3bwKDXZ4+U1sfBjN0UALY8iQK6c7X4sU2AgPQ48Y2bb3
	 OKcwIZVn8+9IcMTmIyLhHO9ZwHtE5VFWt9qMmc1QmsodVQFxhtBCutluizh0HRIyTZuZN
	 J+a7jeps1zJjCW2SC0zzqV/o2nSIpbwLV3tZXgBxqgXnSWkiP3oqeKkEcX7pcwyXIgr9Y
	 dvV/R9wfBBGbLfgr7T8pUr+mwd2C7IYvEL002WQLaGyUIThROMml4lUFl6+WPO07n8qjG
	 KWsxz1gO54yA/deii9D543Z3LbFuyZ8/aZhyub/Lm4LiAZm9syw/qI0X8wjXsIa962A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Iy0rex4e;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D2D606A33E;
	Thu, 12 Nov 2026 08:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16D2D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Iy0rex4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794471998;
	bh=ySZM9u+1PfvUuzNsiaIgfU+AxijVq6u7jV0SP9waBT4=;
	h=From:To:Cc:Subject:Date:From;
	b=Iy0rex4e8Bocv9+F5z9wlV45tFxmf67S1FfLLkJd5/u66zGOWE0RZyAPKRy8jT6mg
	 4CvHMrLW7yOdAFztOybh8SF7qaFcdDsv+EHEMu4Xk+7S7WPokw10SrRX9JaoAtA9pR
	 fFjhUoACii1vr8MiX+WQR1yEio6dCxENxfO4i5efrwcjeYwacVkZNeZ0OUXA7aw/cm
	 9/El6JrdkDaLad0xCnSEVBtSEZh+pi1zUx1T3MZ50kQBdCdMo/xj9IakdIlNyzotKg
	 h1hsWq53YAPSnusR5hjzRnTcvGWMDDCXSNwfHVG048jLUe7mvDcxaKQREqVIXiVcsp
	 Uxvf2CYYARV1g==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E1E5517E00AF;
	Thu, 12 Nov 2026 09:26:37 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2] media: codecs: vp9: Add tile_info control
Date: Thu, 12 Nov 2026 09:26:31 +0100
Message-ID: <20261112082631.40863-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some hardware accelerators needs to know tiles location and size
in the bitstream.
Tiles size are coded inside the bitstream so it is up to the
userland to provide theses information by calling
V4L2_CID_STATELESS_VP9_TILE_INFO_ENTRY control.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
The userland implementation in GStreamer for this control could be
found here:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/13038

This will be use by Verisilicon VC9000D driver which isn't upstream yet
because some improvements in Verisilicon core are needed before.
At least it needs these series to be merged first:
- Create AV1 helper library: 
  https://patchwork.linuxtv.org/project/linux-media/list/?series=30160
- media: verisilicon: remove unused variant and code clean up:
  https://patchwork.linuxtv.org/project/linux-media/list/?series=31435
- media: verisilicon: simplify auxiliary buffers allocation:
  https://patchwork.linuxtv.org/project/linux-media/list/?series=30541


changes in v2:
- add __user before p_vp9_tile_info_entry declaration in v4l2_ext_control
  structure.
- fix invalid symbol in documentation.

 .../media/v4l/ext-ctrls-codec-stateless.rst   | 42 +++++++++++++++++++
 .../media/v4l/videodev2.h.rst.exceptions      |  1 +
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++
 .../media/v4l/vidioc-queryctrl.rst            |  6 +++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  8 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  5 +++
 include/media/v4l2-ctrls.h                    |  2 +
 include/uapi/linux/v4l2-controls.h            | 27 ++++++++++++
 include/uapi/linux/videodev2.h                |  2 +
 9 files changed, 97 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
index d7a3b8ef03a7..effd3eb47e29 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -2050,6 +2050,48 @@ This structure contains all loop filter related parameters. See sections
       - When set, the bitstream contains additional syntax elements that
         specify which mode and reference frame deltas are to be updated.
 
+``V4L2_CID_STATELESS_VP9_TILE_INFO_ENTRY (struct)``
+    Specifies VP9 Tile Info entry as describe in section 6.4 "Decode tile syntax"
+    of :ref:`vp9`.
+    MiRowStart, MiRowEnd, MiColStart and MiColEnd can be retrieved from struct
+    v4l2_ctrl_vp9_frame using tile_row and tile_col.
+
+.. c:type:: v4l2_ctrl_vp9_tile_info_entry
+
+.. raw:: latex
+
+    \small
+
+.. tabularcolumns:: |p{1.2cm}|p{9.2cm}|p{6.9cm}|
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_vp9_tile_info_entry
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``tile_offset``
+      - Specifies the offset from the tile data after frame header,
+        i.e. where the coded tile data actually starts.
+    * - __u32
+      - ``tile_size``
+      - Specifies the size in bytes of the coded tile.
+        Equivalent to "tile_size" in :ref:`vp9`
+    * - __u32
+      - ``tile_row``
+      - Specifies the row of the current tile.
+        Equivalent to "tileRow" in :ref:`vp9`
+    * - __u32
+      - ``tile_col``
+      - Specifies the col of the current tile.
+        Equivalent to "tileCol" in :ref:`vp9`
+
+.. raw:: latex
+
+    \normalsize
+
 .. _v4l2-codec-stateless-hevc:
 
 ``V4L2_CID_STATELESS_HEVC_SPS (struct)``
diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index 6182b4e2d2ee..5e411cdb0469 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -161,6 +161,7 @@ replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_FRAME :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HDR10_CLL_INFO :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`V4L.v4l2_ctrl_type`
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index d78328152b75..836b227c10c9 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -258,6 +258,10 @@ still cause this situation.
       - ``p_vp9_frame``
       - A pointer to a struct :c:type:`v4l2_ctrl_vp9_frame`. Valid if this
         control is of type ``V4L2_CTRL_TYPE_VP9_FRAME``.
+    * - struct :c:type:`v4l2_ctrl_vp9_tile_info_entry` *
+      - ``p_vp9_tile_info_entry``
+      - A pointer to a struct :c:type:`v4l2_ctrl_vp9_tile_info_entry`. Valid if this
+        control is of type ``V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY``.
     * - struct :c:type:`v4l2_ctrl_hdr10_cll_info` *
       - ``p_hdr10_cll``
       - A pointer to a struct :c:type:`v4l2_ctrl_hdr10_cll_info`. Valid if this control is
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 82c8b52e771c..bfef51f70c42 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -555,6 +555,12 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_vp9_frame`, containing VP9
 	frame decode parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_vp9_tile_info_entry`, containing VP9
+        tile info for stateless video decoders.
     * - ``V4L2_CTRL_TYPE_AV1_SEQUENCE``
       - n/a
       - n/a
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6e751a043a21..a426a716f3d4 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -425,6 +425,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_VP9_FRAME:
 		pr_cont("VP9_FRAME");
 		break;
+	case V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY:
+		pr_cont("VP9_TILE_INFO_ENTRY");
+		break;
 	case V4L2_CTRL_TYPE_HEVC_SPS:
 		pr_cont("HEVC_SPS");
 		break;
@@ -1415,6 +1418,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 
 	case V4L2_CTRL_TYPE_VP9_FRAME:
 		return validate_vp9_frame(p);
+	case V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY:
+		break;
 	case V4L2_CTRL_TYPE_AV1_FRAME:
 		return validate_av1_frame(p);
 	case V4L2_CTRL_TYPE_AV1_SEQUENCE:
@@ -2135,6 +2140,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_VP9_FRAME:
 		elem_size = sizeof(struct v4l2_ctrl_vp9_frame);
 		break;
+	case V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY:
+		elem_size = sizeof(struct v4l2_ctrl_vp9_tile_info_entry);
+		break;
 	case V4L2_CTRL_TYPE_AV1_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_av1_sequence);
 		break;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index e062f2088490..f7a98925027b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1228,6 +1228,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
 	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:	return "VP9 Probabilities Updates";
 	case V4L2_CID_STATELESS_VP9_FRAME:			return "VP9 Frame Decode Parameters";
+	case V4L2_CID_STATELESS_VP9_TILE_INFO_ENTRY:		return "VP9 Tile Info Entry";
 	case V4L2_CID_STATELESS_HEVC_SPS:			return "HEVC Sequence Parameter Set";
 	case V4L2_CID_STATELESS_HEVC_PPS:			return "HEVC Picture Parameter Set";
 	case V4L2_CID_STATELESS_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
@@ -1602,6 +1603,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_AV1_SEQUENCE:
 		*type = V4L2_CTRL_TYPE_AV1_SEQUENCE;
 		break;
+	case V4L2_CID_STATELESS_VP9_TILE_INFO_ENTRY:
+		*type = V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
 	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:
 		*type = V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY;
 		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index cec9217d97ac..286e72a00a9d 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -45,6 +45,7 @@ struct video_device;
  * @p_h264_pred_weights:	Pointer to a struct v4l2_ctrl_h264_pred_weights.
  * @p_vp8_frame:		Pointer to a VP8 frame params structure.
  * @p_vp9_compressed_hdr_probs:	Pointer to a VP9 frame compressed header probs structure.
+ * @p_vp9_tile_info_entry:	Pointer to a VP9 tile info structure.
  * @p_vp9_frame:		Pointer to a VP9 frame params structure.
  * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
  * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
@@ -83,6 +84,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
 	struct v4l2_ctrl_vp9_compressed_hdr *p_vp9_compressed_hdr_probs;
 	struct v4l2_ctrl_vp9_frame *p_vp9_frame;
+	struct v4l2_ctrl_vp9_tile_info_entry *p_vp9_tile_info_entry;
 	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_area *p_area;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..8eb8da0073cd 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2642,6 +2642,8 @@ struct v4l2_ctrl_hevc_ext_sps_lt_rps {
 
 /* Stateless VP9 controls */
 
+#define V4L2_VP9_MAX_TILE_COUNT			512
+
 #define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED	0x1
 #define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE	0x2
 
@@ -2924,6 +2926,31 @@ struct v4l2_ctrl_vp9_compressed_hdr {
 	struct v4l2_vp9_mv_probs mv;
 };
 
+#define V4L2_CID_STATELESS_VP9_TILE_INFO_ENTRY (V4L2_CID_CODEC_STATELESS_BASE + 302)
+/**
+ * struct v4l2_ctrl_vp9_tile_info_entry - VP9 Tile Info entry
+ *
+ * Represents a single VP9 tile inside. Note that MiRowStart,
+ * MiRowEnd, MiColStart and MiColEnd can be retrieved from struct
+ * v4l2_ctrl_vp9_frame using tile_row and tile_col.
+ * See section 6.4 "Decode tile syntax" for more details.
+ *
+ * @tile_offset: offset from the tile data after frame header,
+ * i.e. where the coded tile data actually starts.
+ * @tile_size: specifies the size in bytes of the coded tile. Equivalent to
+ * "tile_size" in the VP9 Specification.
+ * @tile_row: specifies the row of the current tile. Equivalent to "tileRow" in
+ * the VP9 Specification.
+ * @tile_col: specifies the col of the current tile. Equivalent to "tileCol" in
+ * the VP9 Specification.
+ */
+struct v4l2_ctrl_vp9_tile_info_entry {
+	__u32 tile_offset;
+	__u32 tile_size;
+	__u32 tile_row;
+	__u32 tile_col;
+};
+
 /* Stateless AV1 controls */
 
 #define V4L2_AV1_TOTAL_REFS_PER_FRAME	8
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fa..b010be9437a7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1903,6 +1903,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_mpeg2_quantisation __user *p_mpeg2_quantisation;
 		struct v4l2_ctrl_vp9_compressed_hdr __user *p_vp9_compressed_hdr_probs;
 		struct v4l2_ctrl_vp9_frame __user *p_vp9_frame;
+		struct v4l2_ctrl_vp9_tile_info_entry __user *p_vp9_tile_info_entry;
 		struct v4l2_ctrl_hevc_sps __user *p_hevc_sps;
 		struct v4l2_ctrl_hevc_pps __user *p_hevc_pps;
 		struct v4l2_ctrl_hevc_slice_params __user *p_hevc_slice_params;
@@ -1984,6 +1985,7 @@ enum v4l2_ctrl_type {
 
 	V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR	= 0x0260,
 	V4L2_CTRL_TYPE_VP9_FRAME		= 0x0261,
+	V4L2_CTRL_TYPE_VP9_TILE_INFO_ENTRY	= 0x0262,
 
 	V4L2_CTRL_TYPE_HEVC_SPS			= 0x0270,
 	V4L2_CTRL_TYPE_HEVC_PPS			= 0x0271,
-- 
2.53.0

