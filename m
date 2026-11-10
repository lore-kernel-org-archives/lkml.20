Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324513;
	b=3aT4V1Yf774GqES8UTO9G3Amzb2ewDMMBNdDqE7KeDixfH4kBI8tTX9M/V2WXgR+1iCI
	 OQWLkte6HTiHVLMzl2nmCf6dzttEhgSvcR4JboUc93krackHazZkzySduBNeivmnwNxB/
	 ns2GolMOjt02inI8POGftmOTt7Gl8eQemoqiMnMizDJaTCmrkf7jZfFHnWIJd+QTclQ8s
	 zE2/8f8wMTnJ/iXxCvk3QTy0ouSKPVviiLPfhEw6sTFEqIf6gA/UYbtvvXN7P4LTHsaGj
	 almIBUn7QEc+LRF+c8vTV+qVdVSQsUUgG8E6r4Ocf54+4a2vV3jn5+CThuWddqKaBHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324513;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=o6QztJNcMLb+3r+A/33tYDWhHoFXbgz4LvPYWOb+ua8=;
	b=xZVeHgiViEnhBc0cF4b/z0RQMOry34NBDNqTnRgES40qLh/gcrsQvW9jIkggRbGo2AfF
	 D2K5wMJC7IDkFRYDtMMWQPxwgBs1dt0B1x75Heabiohv/7V5UhmB3e7AKXf5RFE3nhNfk
	 qOeqvxi4CerwlTOSK6La180GgO05JYve7N3Bpi4QHXeCb2/pcbJ1MN7SoGySphLUqjY/V
	 EgTpDuB3pl1cUDYbYOnPrwRybB+hCHyBsf5AG4vFz79AMmnyqlro1/wpPABpH1CVXTAIb
	 WDZqucPPZfFIDaS1Gz5leYkSch3N65z8J0kgUQ/6jqbZ6QTEesk3Z9m1Ismg2CLbTEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Zs4Hgng4;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0345B606A31C;
	Tue, 10 Nov 2026 15:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0345B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Zs4Hgng4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794324511;
	bh=jO4u7WBmBDYq8GnBWne/sGH31cOQS9UMls67gM39wcg=;
	h=From:To:Cc:Subject:Date:From;
	b=Zs4Hgng49EW72YQW0r6BfuksYOtEDmwGLTab4TFuK38YNEu1T8U0b6+btt3b+ZYGB
	 5YZiUES3UWQSRwhffH1jSKyxnFzlH7CLr8O/BDkahhdvPDW0wVJt/yjK8KCW+xHZXc
	 Ea9R5lQC/vIQFFg5OdNRBG/nbiEcLb9tVAGx9RoPRnUjHyoXqvvkeSvyaD+wweEvKj
	 iHdcUN7PT2GLLvfjgpSjGBm6L3SWU42hr3k5Ucy4K2H0xLcf7JeRuLPgx5EpmmhIt5
	 T+zXH/rpFPhxH1CTybWVg/+rubC+kAdbUMum226SjueczJpjkmAHV1F+KfN+e+E5Qs
	 63DspjmpILZCw==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 172CF17E080B;
	Tue, 10 Nov 2026 16:28:31 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v1] media: codecs: vp9: Add tile_info control
Date: Tue, 10 Nov 2026 16:28:26 +0100
Message-ID: <20261110152826.128259-1-benjamin.gaignard@collabora.com>
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
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 42 +++++++++++++++++++
 .../media/v4l/vidioc-g-ext-ctrls.rst          |  4 ++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  8 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  5 +++
 include/media/v4l2-ctrls.h                    |  2 +
 include/uapi/linux/v4l2-controls.h            | 27 ++++++++++++
 include/uapi/linux/videodev2.h                |  2 +
 7 files changed, 90 insertions(+)

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
index 5373dba640fa..b4338af93a39 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1903,6 +1903,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_mpeg2_quantisation __user *p_mpeg2_quantisation;
 		struct v4l2_ctrl_vp9_compressed_hdr __user *p_vp9_compressed_hdr_probs;
 		struct v4l2_ctrl_vp9_frame __user *p_vp9_frame;
+		struct v4l2_ctrl_vp9_tile_info_entry *p_vp9_tile_info_entry;
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

