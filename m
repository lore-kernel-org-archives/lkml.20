Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956334;
	b=MbZvyiKChQH1oA+nPZ+3YJQUsjxehqZQplB2yr/XFiN7SMfBm56mwi2K65mhey4DmDGF
	 GJ2/zWTEvCqfJ/GXy6t94rm6wtTo0BfKZ0OjUYmhBNtF5YpqCA25+xs2Qplw8/bVD/ZaG
	 /D2lgQ/GFNUbdusr9a2Ru/lwK3LnhVu90oSOpOUylBJq4kmzY91MRvZyL+lAf098aFPaG
	 uO7Q9BGX633Gq8HKziFs5LuI4kjOUs9+mMHBvDRH6sPBCyI8sAYFxY8o2vxEx4pmkELuY
	 EcwPz2PkwTTL1iLLrlZ8pdFkNItjLBby53QQXBcYO20FvdqQNTJ7yYPwdAvA4NDieWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956334;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=yCzqTTjCA/xz+bp75RrRVnVXRD4Rb/uY3VGf4E8buBE=;
	b=qae+C4PwpIY34ha2bLWqE+s17QPMKRtDpO+Fzr9EK8Zy/i7c/h22tucIvhSRLqK3lgpF
	 in7fGE1EB/nrpoTEtAmdrDec+mSlWrzuVPs5r16RTUEVmul0D+v/+2d+XY9IAtdpU1KYt
	 aVkaL0Azh8qWDhxlp9doztvNu/NGhN8J0T7YNMlU24Tx7wbqj+YQIF2WxWuP/YjXSWv+2
	 CG1JOuUS6187du4Xf88KJCMrGKKHlV0A0MpHPmzdZ05p+l2oqV/6Qp7OB6HmyP8qrgbz5
	 w40RGb4E3yzhes3yr3qBXBjvLpsAX/Yzlmqne65sFyS+ZPKLo6u7T7WJv/QlH5+1l3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=GRbt1ZB+;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F287B60A3810;
	Sun, 25 Oct 2026 19:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F287B60A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=GRbt1ZB+
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJP8Em519288
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:25:18 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJP8Em519288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956320;
	bh=yCzqTTjCA/xz+bp75RrRVnVXRD4Rb/uY3VGf4E8buBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GRbt1ZB+pdwWl0EQSy4X3nRnhgPBciUSYtjj3LRkqbh7wgNwoR3S5AoZetyHtHcUv
	 2ytRWTW3aMzH/YU2gRlzzOkEKqLm5wBeljTyloiqt3CyCOD3TmyQazGbYoZ/7SdoBF
	 CcN1u4ijR8zJNK42FdgW8Caep68PxkuFi6RX/D78=
From: christian.koever-draxl@student.uibk.ac.at
To: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 04/11] media: amlogic: vdec: h264: decode Main and High profile bit-exact
Date: Sun, 25 Oct 2026 20:25:00 +0100
Message-ID: <20261025192507.210058-5-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
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
X-Spam-Score: () -14.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Fix the H.264 path so that Baseline, Main and High streams, CAVLC and
CABAC, I/P/B pictures, weighted prediction and the 8x8 transform decode
bit-exact against the reference decoder:

- the microcode parses the slice header itself and wants SPS/PPS NAL
  units in the bitstream, so rebuild them from the stateless controls
  and prepend them to every buffer
- write the PPS table with se(v) coding where the microcode expects it
- pass the scaling lists, without which High profile never starts
- take the reference-list length from the slice header unless the PPS
  default applies, and stop reordering once the list is full

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/media/platform/amlogic/vdec/Makefile  |   2 +-
 drivers/media/platform/amlogic/vdec/h264.c    | 477 ++++++++++++++++--
 drivers/media/platform/amlogic/vdec/h264.h    |   7 +
 .../platform/amlogic/vdec/h264_headers.c      | 249 +++++++++
 4 files changed, 685 insertions(+), 50 deletions(-)
 create mode 100644 drivers/media/platform/amlogic/vdec/h264_headers.c

diff --git a/drivers/media/platform/amlogic/vdec/Makefile b/drivers/media/platform/amlogic/vdec/Makefile
index f9c35e9ac902..5a2cf8e6814e 100644
--- a/drivers/media/platform/amlogic/vdec/Makefile
+++ b/drivers/media/platform/amlogic/vdec/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o aml_vdec_tee_fw.o
+aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o h264_headers.o aml_vdec_tee_fw.o
 
 obj-$(CONFIG_VIDEO_AMLOGIC_VDEC) += aml-vdec-drv.o
diff --git a/drivers/media/platform/amlogic/vdec/h264.c b/drivers/media/platform/amlogic/vdec/h264.c
index 7584d5eb20ec..7f1ebd7588f5 100644
--- a/drivers/media/platform/amlogic/vdec/h264.c
+++ b/drivers/media/platform/amlogic/vdec/h264.c
@@ -11,8 +11,54 @@
 
 #define INVALID_POC 0xffffffff
 
+/*
+ * Every signed field in the SPS and PPS parameter tables is se(v)-coded in the
+ * bitstream, and the microcode decodes what the host writes the same way: it
+ * applies the se(v) mapping to the value it reads out of the table.  So a
+ * signed value has to be written back as its *code number*, not as two's
+ * complement.
+ *
+ * Measured, by writing known bytes and reading PIC_INIT_QP_MINUS26 back out of
+ * the microcode's LMEM: 0x00 -> 0, 0x01 -> +1, 0x10 -> -8, 0xf0 -> -120.  That
+ * is exactly k -> (k & 1) ? (k + 1) / 2 : -(k / 2).
+ *
+ * Writing two's complement instead - which is what this driver did, and what
+ * mainline's h264 patch does - turned pic_init_qp_minus26 = -16 into -120, so
+ * every slice decoded at a quantiser around 100 below the right one.  That is
+ * the whole of the "residual scaling is wrong and it tracks QP" defect: a
+ * QP-10 stream came out at 5.3 dB and now comes out at 25.9 dB.
+ */
+static u16 se_code(int v)
+{
+	return v > 0 ? (2 * v - 1) : (-2 * v);
+}
+
+static void write_scaling_lists(void *slot,
+				const struct v4l2_ctrl_h264_scaling_matrix *sm,
+				int num_8x8)
+{
+	u8 *b = slot;
+	int i, j;
+
+	if (!sm)
+		return;
+	for (i = 0; i < 6; i++)
+		for (j = 0; j < 16; j++)
+			*b++ = sm->scaling_list_4x4[i][j];
+	for (i = 0; i < num_8x8; i++)
+		for (j = 0; j < 64; j++)
+			*b++ = sm->scaling_list_8x8[i][j];
+}
+
 #define H264_SLICE_HEADER_DONE		0x1
 #define H264_SLICE_DATA_DONE		0x2
+/*
+ * The newer video_ucode packages (v0.3.31, from the 2025 vendor image) ask the
+ * host to acknowledge a configuration step before they will decode, and end a
+ * frame-based picture with BUFEMPTY rather than PIC_DATA_DONE.
+ */
+#define H264_CONFIG_REQUEST		0x11
+#define H264_DECODE_BUFEMPTY		0x20
 
 #define H264_MAX_COL_BUF			32
 #define H264_MAX_CANVAS_POS			26
@@ -29,7 +75,7 @@ struct vdec_h264_stateless_ctrl_ref {
 	const struct v4l2_ctrl_h264_pps *pps;
 };
 
-enum SliceType {
+enum aml_h264_slice_type {
 	P_SLICE = 0,
 	B_SLICE = 1,
 	I_SLICE = 2,
@@ -85,16 +131,16 @@ union param {
 		unsigned short num_ref_idx_l0_active_minus1;
 		unsigned short num_ref_idx_l1_active_minus1;
 
-		unsigned short PrevPicOrderCntLsb;
-		unsigned short PreviousFrameNum;
+		unsigned short prev_pic_order_cnt_lsb;
+		unsigned short previous_frame_num;
 
 		/* 32 bits variables */
 		unsigned short delta_pic_order_cnt_bottom[2];
 		unsigned short delta_pic_order_cnt_0[2];
 		unsigned short delta_pic_order_cnt_1[2];
 
-		unsigned short PrevPicOrderCntMsb[2];
-		unsigned short PrevFrameNumOffset[2];
+		unsigned short prev_pic_order_cnt_msb[2];
+		unsigned short prev_frame_num_offset[2];
 
 		unsigned short frame_pic_order_cnt[2];
 		unsigned short top_field_pic_order_cnt[2];
@@ -148,9 +194,10 @@ struct h264_decode_buf_spec {
 	u32 dpb_index;
 	int poc;
 	int col_buf_index;
-	u8 y_canvas_index;
-	u8 u_canvas_index;
-	u8 v_canvas_index;
+	/* signed: -1 means "no canvas held"; a u8 made that sentinel 255 */
+	s16 y_canvas_index;
+	s16 u_canvas_index;
+	s16 v_canvas_index;
 	u8 used;
 	u8 long_term_flag;
 	dma_addr_t y_dma_addr;
@@ -222,6 +269,15 @@ struct aml_h264_ctx {
 	u32 max_num_ref_frames;
 
 	struct vdec_h264_stateless_ctrl_ref ctrl_ref;
+
+	/*
+	 * Staging buffer for the in-band SPS/PPS path: the OUTPUT buffer is
+	 * normally handed to the stream FIFO directly, so prepending anything
+	 * needs a buffer of our own.
+	 */
+	void *stage_vaddr;
+	dma_addr_t stage_paddr;
+	size_t stage_size;
 };
 
 static inline int get_flag(u32 flag, u32 mask)
@@ -236,9 +292,9 @@ static inline void write_lmem(unsigned short *base, u32 offset, u32 value)
 
 static inline uint32_t spec2canvas(struct h264_decode_buf_spec *buf_spec)
 {
-	return (buf_spec->v_canvas_index << 16) |
-		(buf_spec->u_canvas_index << 8) |
-		(buf_spec->y_canvas_index << 0);
+	return ((buf_spec->v_canvas_index & 0xff) << 16) |
+		((buf_spec->u_canvas_index & 0xff) << 8) |
+		((buf_spec->y_canvas_index & 0xff) << 0);
 }
 
 static struct h264_decode_buf_spec *find_spec_by_dpb_index(struct aml_h264_ctx
@@ -262,14 +318,67 @@ static struct h264_decode_buf_spec *find_spec_by_dpb_index(struct aml_h264_ctx
 	return NULL;
 }
 
+/*
+ * Copy the buffer into the staging area behind freshly built SPS and PPS
+ * NALs.  Returns the new payload size, or a negative error to fall back to
+ * feeding the OUTPUT buffer as it stands.
+ */
+static int h264_stage_with_headers(struct aml_h264_ctx *h264_ctx,
+				   struct vb2_buffer *vb, u32 payload_size)
+{
+	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct vdec_h264_stateless_ctrl_ref *ctrls = &h264_ctx->ctrl_ref;
+	size_t want = ALIGN(payload_size + SZ_4K + VLD_PADDING_SIZE, SZ_64K);
+	void *src_v = vb2_plane_vaddr(vb, 0);
+	int n = 0, r;
+
+	if (!ctrls->sps || !ctrls->pps || !src_v)
+		return -EINVAL;
+
+	if (h264_ctx->stage_vaddr && h264_ctx->stage_size < want) {
+		dma_free_coherent(hw->dev, h264_ctx->stage_size,
+				  h264_ctx->stage_vaddr, h264_ctx->stage_paddr);
+		h264_ctx->stage_vaddr = NULL;
+	}
+	if (!h264_ctx->stage_vaddr) {
+		h264_ctx->stage_vaddr = dma_alloc_coherent(hw->dev, want,
+							   &h264_ctx->stage_paddr,
+							   GFP_KERNEL);
+		if (!h264_ctx->stage_vaddr)
+			return -ENOMEM;
+		h264_ctx->stage_size = want;
+	}
+
+	r = aml_h264_build_sps(h264_ctx->stage_vaddr, SZ_2K, ctrls->sps);
+	if (r < 0)
+		return r;
+	n = r;
+	r = aml_h264_build_pps(h264_ctx->stage_vaddr + n, SZ_2K, ctrls->pps,
+			       ctrls->scaling, ctrls->sps->chroma_format_idc);
+	if (r < 0)
+		return r;
+	n += r;
+
+	if (n + payload_size + VLD_PADDING_SIZE > h264_ctx->stage_size)
+		return -ENOSPC;
+	memcpy(h264_ctx->stage_vaddr + n, src_v, payload_size);
+	memset(h264_ctx->stage_vaddr + n + payload_size, 0, VLD_PADDING_SIZE);
+
+	dev_dbg(hw->dev, "h264: payload %u + %d bytes of SPS/PPS\n",
+		payload_size, n);
+	return n + payload_size;
+}
+
 static int h264_prepare_input(struct aml_vdec_ctx *ctx)
 {
 	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct aml_h264_ctx *h264_ctx = ctx->codec_priv;
 	struct vb2_v4l2_buffer *src;
 	struct vb2_buffer *vb;
 	dma_addr_t src_dma;
 	u32 payload_size;
-	int dummy;
+	int dummy, n;
 
 	src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	if (!src) {
@@ -280,6 +389,12 @@ static int h264_prepare_input(struct aml_vdec_ctx *ctx)
 	payload_size = vb2_get_plane_payload(vb, 0);
 	src_dma = vb2_dma_contig_plane_dma_addr(vb, 0);
 
+	n = h264_stage_with_headers(h264_ctx, vb, payload_size);
+	if (n > 0) {
+		src_dma = h264_ctx->stage_paddr;
+		payload_size = n;
+	}
+
 	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CONTROL, 0);
 	/* reset VLD fifo for all vdec */
 	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET0,
@@ -288,8 +403,16 @@ static int h264_prepare_input(struct aml_vdec_ctx *ctx)
 	regmap_write(hw->map[DOS_BUS], POWER_CTL_VLD, 1 << 4);
 
 	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_START_PTR, src_dma);
+	/*
+	 * The end pointer bounds the FIFO itself, not this frame: the write
+	 * pointer below is payload_size + VLD_PADDING_SIZE past the start, so
+	 * ending the FIFO at the payload leaves WP outside it and the ucode
+	 * waits forever for data (decoder timeout, pc stuck around 0x796).
+	 */
 	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_END_PTR,
-		     (src_dma + payload_size));
+		     src_dma == h264_ctx->stage_paddr ?
+		     (src_dma + h264_ctx->stage_size - VDEC_FIFO_ALIGN) :
+		     (src_dma + vb2_plane_size(vb, 0) - VDEC_FIFO_ALIGN));
 	regmap_write(hw->map[DOS_BUS], VLD_MEM_VIFIFO_CURR_PTR,
 		     round_down(src_dma, VDEC_FIFO_ALIGN));
 
@@ -329,7 +452,17 @@ static void config_sps_params(struct aml_h264_ctx *h264_ctx,
 	unsigned short data_tmp[0x100];
 	int i, ii;
 
-	memset(sps_base, 0, 0x100);
+	/*
+	 * Both of these were wrong and the microcode read the difference.
+	 *
+	 * data_tmp is copied out in full - all 0x100 entries - but only the
+	 * first dozen or so are ever assigned, so every parameter past the
+	 * ones below was whatever the stack happened to hold.  And the
+	 * memset() cleared 0x100 *bytes* of a buffer that is 0x100 *entries*
+	 * wide, so it did not even cover the half of it that is written.
+	 */
+	memset(data_tmp, 0, sizeof(data_tmp));
+	memset(sps_base, 0, 0x100 * sizeof(*sps_base));
 
 	h264_ctx->frame_width = (sps->pic_width_in_mbs_minus1 + 1) << 4;
 	h264_ctx->frame_height = (sps->pic_height_in_map_units_minus1 + 1) << 4;
@@ -366,6 +499,13 @@ static void config_sps_params(struct aml_h264_ctx *h264_ctx,
 			GET_SPS_OFFSET_FOR_TOP_BOT_FIELD_LOW(sps->offset_for_top_to_bottom_field);
 		data_tmp[offset++] =
 			GET_SPS_OFFSET_FOR_TOP_BOT_FIELD_HIGH(sps->offset_for_top_to_bottom_field);
+		/*
+		 * offset_for_non_ref_pic and offset_for_top_to_bottom_field
+		 * are se(v) in the bitstream too, but they are written here as
+		 * a 32-bit value split over two entries, so whether the
+		 * microcode se(v)-decodes them is untested - pic_order_cnt_type
+		 * 1 is rare and no stream to hand uses it.
+		 */
 		data_tmp[offset++] = sps->num_ref_frames_in_pic_order_cnt_cycle;
 	}
 
@@ -390,6 +530,9 @@ static void config_sps_params(struct aml_h264_ctx *h264_ctx,
 		for (ii = 0; ii < 4; ii++)
 			sps_base[i + 3 - ii] = data_tmp[i + ii];
 	}
+	write_scaling_lists((u8 *)sps_base + 0x100,
+			    h264_ctx->ctrl_ref.scaling,
+				    sps->chroma_format_idc == 3 ? 6 : 2);
 
 	frame_size = (sps->pic_width_in_mbs_minus1 + 1) * (sps->pic_height_in_map_units_minus1 + 1);
 	cfg_tmp = (get_flag(sps->flags, V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) << 31) |
@@ -430,7 +573,9 @@ static void config_pps_params(struct aml_h264_ctx *h264_ctx,
 	u32 max_list_size;
 	int i, ii;
 
-	memset(pps_base, 0, 0x100);
+	/* Same two bugs as config_sps_params(); see the comment there. */
+	memset(data_tmp, 0, sizeof(data_tmp));
+	memset(pps_base, 0, 0x100 * sizeof(*pps_base));
 
 	data_tmp[offset++] = PARAM_BASE_VAL;
 
@@ -451,11 +596,12 @@ static void config_pps_params(struct aml_h264_ctx *h264_ctx,
 		GET_PPS_NUM_IDX_REF_L1_MINUS1(pps->num_ref_idx_l1_default_active_minus1) |
 		GET_PPS_NUM_IDX_REF_L0_MINUS1(pps->num_ref_idx_l0_default_active_minus1);
 
-	data_tmp[offset++] = GET_PPS_INIT_QS_MINUS26(pps->pic_init_qs_minus26) |
-	    GET_PPS_INIT_QP_MINUS26(pps->pic_init_qp_minus26);
+	data_tmp[offset++] =
+		GET_PPS_INIT_QS_MINUS26(se_code(pps->pic_init_qs_minus26)) |
+		GET_PPS_INIT_QP_MINUS26(se_code(pps->pic_init_qp_minus26));
 
 	data_tmp[offset] =
-	    GET_PPS_CHROMA_QP_INDEX_OFFSET(pps->chroma_qp_index_offset) |
+	    GET_PPS_CHROMA_QP_INDEX_OFFSET(se_code(pps->chroma_qp_index_offset)) |
 	    GET_PPS_DEBLOCK_FILTER_CTRL_PRESENT_FLAG
 				(get_flag(pps->flags,
 					  V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT)) |
@@ -465,20 +611,29 @@ static void config_pps_params(struct aml_h264_ctx *h264_ctx,
 	    GET_PPS_REDUNDANT_PIC_CNT_PRESENT_FLAG
 	    (get_flag(pps->flags,
 		      V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT));
+	/*
+	 * Bit 11 is "the PPS carries its trailing part" - transform_8x8_mode,
+	 * pic_scaling_matrix_present and second_chroma_qp_index_offset.  Only
+	 * set it when the stream really has one, or the microcode reads
+	 * entries this table has no business supplying.
+	 */
 	if (get_flag(pps->flags, V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE |
 	     V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT))
 		data_tmp[offset] |= (1 << 11);
 	offset++;
 
-	data_tmp[offset++] =
-		GET_PPS_SCALING_MATRIX_PRESENT_FLAG(get_flag
-						    (pps->flags,
-						    V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT)) |
-		GET_PPS_TRANSFORM_8X8_FLAG(get_flag(pps->flags,
-						    V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE));
+	{
+		bool t8x8 = get_flag(pps->flags,
+				     V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE);
+		bool lists = get_flag(pps->flags,
+				      V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT);
+
+		data_tmp[offset++] = GET_PPS_SCALING_MATRIX_PRESENT_FLAG(lists) |
+				     GET_PPS_TRANSFORM_8X8_FLAG(t8x8);
+	}
 
 	data_tmp[offset++] =
-		GET_PPS_GET_SECOND_CHROMA_QP_OFFSET(pps->second_chroma_qp_index_offset);
+		GET_PPS_GET_SECOND_CHROMA_QP_OFFSET(se_code(pps->second_chroma_qp_index_offset));
 
 	max_list_size = (pps->num_ref_idx_l1_default_active_minus1 + 1) +
 	    (pps->num_ref_idx_l0_default_active_minus1 + 1);
@@ -494,6 +649,8 @@ static void config_pps_params(struct aml_h264_ctx *h264_ctx,
 		for (ii = 0; ii < 4; ii++)
 			pps_base[i + 3 - ii] = data_tmp[i + ii];
 	}
+	write_scaling_lists((u8 *)pps_base + 0x100,
+			    h264_ctx->ctrl_ref.scaling, 2);
 }
 
 static void h264_config_params(struct aml_vdec_ctx *ctx)
@@ -516,18 +673,41 @@ static void h264_config_params(struct aml_vdec_ctx *ctx)
 	config_pps_params(h264_ctx, p_pps_base, pps);
 }
 
+static void init_buf_spec_canvas(struct h264_decode_buf_spec *buf_spec)
+{
+	buf_spec->y_canvas_index = -1;
+	buf_spec->u_canvas_index = -1;
+	buf_spec->v_canvas_index = -1;
+}
+
 static void config_decode_canvas(struct aml_vdec_hw *hw,
 				 struct h264_decode_buf_spec *buf_spec,
 				 u32 mb_width, u32 mb_height)
 {
 	int canvas_alloc_result = 0;
 	int blkmode = 0x0;
+	u8 y_index, u_index;
+
+	/* already configured for this frame - do not leak another pair */
+	if (buf_spec->y_canvas_index >= 0 && buf_spec->u_canvas_index >= 0)
+		return;
 
-	canvas_alloc_result = meson_canvas_alloc(hw->canvas, &buf_spec->y_canvas_index);
-	canvas_alloc_result = meson_canvas_alloc(hw->canvas, &buf_spec->u_canvas_index);
-	buf_spec->v_canvas_index = buf_spec->u_canvas_index;
+	canvas_alloc_result = meson_canvas_alloc(hw->canvas, &y_index);
+	if (canvas_alloc_result) {
+		dev_err(hw->dev, "no canvas for y plane\n");
+		return;
+	}
+	canvas_alloc_result = meson_canvas_alloc(hw->canvas, &u_index);
+	if (canvas_alloc_result) {
+		dev_err(hw->dev, "no canvas for uv plane\n");
+		meson_canvas_free(hw->canvas, y_index);
+		return;
+	}
+	buf_spec->y_canvas_index = y_index;
+	buf_spec->u_canvas_index = u_index;
+	buf_spec->v_canvas_index = u_index;
 
-	if (!canvas_alloc_result) {
+	{
 		/* config y canvas */
 		meson_canvas_config(hw->canvas,
 				    buf_spec->y_canvas_index, buf_spec->y_dma_addr,
@@ -750,15 +930,26 @@ static int get_ref_list_size(struct aml_h264_ctx *h264_ctx, int cur_list)
 	unsigned short override_flag = h264_ctx->dpb_param.l.data[REF_IDC_OVERRIDE_FLAG];
 	int num_ref_idx_lx_active_minus1;
 
+	/*
+	 * The microcode parses the slice header, so its count already accounts
+	 * for num_ref_idx_active_override_flag and is the one to use.  Reading
+	 * the PPS default unless REF_IDC_OVERRIDE_FLAG happened to be set left
+	 * the list an entry short on every slice that overrides - x264's
+	 * weightp=2 with more than one reference does exactly that, and the
+	 * last reordering command was then dropped.
+	 */
 	if (cur_list == 0) {
 		num_ref_idx_lx_active_minus1 =
-			h264_ctx->ctrl_ref.pps->num_ref_idx_l0_default_active_minus1;
-		if (override_flag)
+			h264_ctx->dpb_param.dpb.num_ref_idx_l0_active_minus1;
+		if (!override_flag && !num_ref_idx_lx_active_minus1)
 			num_ref_idx_lx_active_minus1 =
-				h264_ctx->dpb_param.dpb.num_ref_idx_l0_active_minus1;
+				h264_ctx->ctrl_ref.pps->num_ref_idx_l0_default_active_minus1;
 	} else {
 		num_ref_idx_lx_active_minus1 =
-			h264_ctx->ctrl_ref.pps->num_ref_idx_l1_default_active_minus1;
+			h264_ctx->dpb_param.dpb.num_ref_idx_l1_active_minus1;
+		if (!override_flag && !num_ref_idx_lx_active_minus1)
+			num_ref_idx_lx_active_minus1 =
+				h264_ctx->ctrl_ref.pps->num_ref_idx_l1_default_active_minus1;
 	}
 	dev_dbg(&ctx->dev->plat_dev->dev, "%s get list %d size %d\n",
 		__func__, cur_list, num_ref_idx_lx_active_minus1 + 1);
@@ -848,6 +1039,14 @@ static void reorder_short_term(struct slice *curr_slice, int cur_list,
 		return;
 	}
 
+	/*
+	 * There used to be a "the picture is already at this index, nothing to
+	 * do" short cut here.  It is not equivalent: 8.2.4.3.1 always inserts
+	 * and then drops the *later* copy, which is what lets one picture
+	 * appear twice in a list - and that is exactly what x264's weightp=2
+	 * does with more than one reference frame.  Taking the short cut left
+	 * the list one entry short and every P frame after the third drifted.
+	 */
 	if (*ref_idx_lx == get_refidx_by_picnum(h264_ctx, pic_num_lx, cur_list)) {
 		dev_dbg(&ctx->dev->plat_dev->dev, "no need to move pic lx %d\n", *ref_idx_lx);
 		*ref_idx_lx = *ref_idx_lx + 1;
@@ -981,6 +1180,16 @@ static void reorder_pics(struct aml_h264_ctx *h264_ctx,
 
 	pic_num_lx_pred = curr_pic_num;
 	for (i = 0; i < REORDERING_COMMAND_MAX_SIZE && modification_of_pic_nums_idc[i] != 3; i++) {
+		/*
+		 * The microcode's command buffer is not always terminated with
+		 * a 3, and the zeros after the real commands parse as more
+		 * "insert the picture one below the last" commands.  A stream
+		 * can only reorder as many entries as the list has, so stop
+		 * there rather than trusting the terminator.
+		 */
+		if (ref_idx_lx >= get_ref_list_size(h264_ctx, cur_list))
+			break;
+
 		if (modification_of_pic_nums_idc[i] > 3) {
 			dev_info(&ctx->dev->plat_dev->dev, "error, Invalid modification_of_pic_nums_idc command\n");
 			break;
@@ -1008,13 +1217,35 @@ static void reorder_pics(struct aml_h264_ctx *h264_ctx,
 	}
 }
 
+static void dump_ref_list(struct aml_h264_ctx *h264_ctx, int list,
+			  const char *when)
+{
+	struct aml_vdec_ctx *ctx = h264_ctx->v4l2_ctx;
+	struct h264_decode_buf_spec *l = list ? h264_ctx->ref_list1 :
+					       h264_ctx->ref_list0;
+	char buf[128];
+	int i, n = 0;
+
+	for (i = 0; i < 16 && l[i].dpb; i++)
+		n += scnprintf(buf + n, sizeof(buf) - n, "%d(lt%d) ",
+			       l[i].dpb->pic_num, l[i].long_term_flag);
+	buf[n] = 0;
+	dev_dbg(&ctx->dev->plat_dev->dev,
+		"h264 reflist%d %s size %d frame_num %d: %s\n",
+		 list, when, h264_ctx->list_size[list],
+		 h264_ctx->mslice.frame_num, buf);
+}
+
 static void copy_ref_list(struct aml_h264_ctx *h264_ctx, int curr_list)
 {
 	if (curr_list == 0)
 		memcpy(h264_ctx->ref_list0_unreordered, h264_ctx->ref_list0,
 		       sizeof(h264_ctx->ref_list0));
 	else
-		memcpy(h264_ctx->ref_list1_unreordered, h264_ctx->ref_list0,
+		/* This copied ref_list0, so list 1 reordering never had its
+		 * own unreordered list to search.
+		 */
+		memcpy(h264_ctx->ref_list1_unreordered, h264_ctx->ref_list1,
 		       sizeof(h264_ctx->ref_list1));
 }
 
@@ -1048,8 +1279,10 @@ static void h264_reorder_reflists(struct aml_h264_ctx *h264_ctx)
 	if (curr_slice->slice_type != I_SLICE &&
 	    curr_slice->slice_type != SI_SLICE &&
 	    curr_slice->ref_pic_list_reordering_flag[0] != 0) {
+		dump_ref_list(h264_ctx, 0, "before");
 		copy_ref_list(h264_ctx, 0);
 		reorder_pics(h264_ctx, curr_slice, 0);
+		dump_ref_list(h264_ctx, 0, "after ");
 	}
 
 	if (curr_slice->slice_type == B_SLICE &&
@@ -1074,6 +1307,17 @@ static void h264_config_ref_lists(struct aml_vdec_ctx *ctx)
 	struct v4l2_h264_reference v4l2_b1_reflist[V4L2_H264_REF_LIST_LEN];
 	struct slice *curr_slice = &h264_ctx->mslice;
 
+	dev_dbg(&ctx->dev->plat_dev->dev,
+		"%s raw_slice_type %d mapped %d decode->flags 0x%x nal_ref_idc %d\n",
+		__func__, h264_ctx->dpb_param.l.data[SLICE_TYPE],
+		curr_slice->slice_type, decode->flags, decode->nal_ref_idc);
+	dev_dbg(&ctx->dev->plat_dev->dev,
+		"%s qp: ctrl pic_init_qp_minus26 %d packed 0x%04x ucode rpm 0x%04x chroma_off %d\n",
+		__func__, ctrls->pps->pic_init_qp_minus26,
+		GET_PPS_INIT_QP_MINUS26(ctrls->pps->pic_init_qp_minus26),
+		h264_ctx->dpb_param.l.data[PIC_INIT_QP_MINUS26],
+		ctrls->pps->chroma_qp_index_offset);
+
 	if (decode->flags == V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC)
 		return;
 
@@ -1169,8 +1413,12 @@ static void clear_unused_col_buf(struct aml_h264_ctx *h264_ctx,
 
 	/* flush all col buffers when IDR */
 	if (decode->flags == V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC) {
-		/* 32 : max index of co-locate buffer */
-		for (i = 0; i < 32; i++)
+		/*
+		 * Only the buffers that exist.  Sweeping all 32 slots made
+		 * release_colocate_buf() complain once per unused index on
+		 * every IDR - 56 dev_err lines for a 44-frame clip.
+		 */
+		for (i = 0; i < h264_ctx->colocated_buf_num; i++)
 			release_colocate_buf(h264_ctx, i);
 		for (i = 0; i < (V4L2_H264_NUM_DPB_ENTRIES + 1); i++)
 			release_canvas_pos(h264_ctx, i);
@@ -1236,8 +1484,15 @@ static void h264_config_decode_spec(struct aml_vdec_hw *hw, struct aml_vdec_ctx
 	for (i = 0; i < V4L2_H264_NUM_DPB_ENTRIES; i++) {
 		struct v4l2_h264_dpb_entry *dpb = &decode->dpb[i];
 
+		/*
+		 * Skip, do not stop.  The DPB is a flat array and nothing in
+		 * the uAPI says the active entries come first - GStreamer
+		 * happens to pack them that way, libva-v4l2 does not, and
+		 * breaking on the first inactive slot then finds no references
+		 * at all and decodes every P frame against nothing.
+		 */
 		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
-			break;
+			continue;
 
 		buf_spec_l0 = find_spec_by_dpb_index(h264_ctx, i, 0);
 		if (buf_spec_l0) {
@@ -1713,12 +1968,22 @@ static irqreturn_t h264_threaded_isr_func(int irq, void *priv)
 {
 	u32 dec_status;
 	struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
+	/*
+	 * The context whose job is on the hardware, not whichever was opened
+	 * last: dev->dec_ctx follows every open() of any codec, so with a
+	 * second client around it points at a context with no job at all.
+	 */
 	struct aml_h264_ctx *h264_ctx = (struct aml_h264_ctx *)dev->dec_hw->curr_ctx;
-	struct aml_vdec_ctx *ctx = (struct aml_vdec_ctx *)dev->dec_ctx;
-	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
-	unsigned short *p = (unsigned short *)h264_ctx->lmem_addr;
+	struct aml_vdec_ctx *ctx;
+	struct aml_vdec_hw *hw = dev->dec_hw;
+	unsigned short *p;
 	int i, ii;
 
+	if (!h264_ctx)
+		return IRQ_HANDLED;
+	ctx = h264_ctx->v4l2_ctx;
+	p = (unsigned short *)h264_ctx->lmem_addr;
+
 	regmap_read(hw->map[DOS_BUS], DPB_STATUS_REG, &dec_status);
 	h264_ctx->dec_status = dec_status;
 	dev_dbg
@@ -1744,9 +2009,23 @@ static irqreturn_t h264_threaded_isr_func(int irq, void *priv)
 		get_canvas_index(hw, ctx);
 
 		if (h264_config_decode_buf(hw, ctx) < 0) {
+			/*
+			 * Drop this picture's state and let the microcode
+			 * carry on - it usually does, and the slice-data
+			 * interrupt behind this one finishes the job.
+			 *
+			 * Deliberately no int_cond/wake here.  Waking
+			 * aml_h264_dec_run() makes it return success while the
+			 * job is still running, so if the microcode does *not*
+			 * come back the job is never finished at all: the next
+			 * VIDIOC_STREAMOFF then blocks for ever in
+			 * v4l2_m2m_cancel_job(), the RCU grace period stalls
+			 * behind it, and within a minute every task that
+			 * touches a V4L2 node or a cgroup is in D state and the
+			 * machine is unusable.  Staying asleep lets the decode
+			 * timeout fire and cancel the job properly.
+			 */
 			h264_release_decode_spec(hw, ctx);
-			ctx->int_cond = 1;
-			wake_up_interruptible(&ctx->queue);
 			goto irq_handled;
 		}
 		if (h264_ctx->new_pic_flag == 1) {
@@ -1758,20 +2037,70 @@ static irqreturn_t h264_threaded_isr_func(int irq, void *priv)
 			dev_dbg(&dev->plat_dev->dev, "action decode new slice\n");
 		}
 		break;
+	case H264_CONFIG_REQUEST:
+		/*
+		 * The ucode wants the picture configured before it will start:
+		 * same work as the slice-header path, acknowledged with
+		 * CONFIG_DONE instead of a decode action.
+		 */
+		for (i = 0; i < 0x400; i += 4)
+			for (ii = 0; ii < 4; ii++)
+				h264_ctx->dpb_param.l.data[i + ii] = p[i + 3 - ii];
+		save_reg_status(h264_ctx);
+		h264_get_slice_params(h264_ctx);
+		h264_config_decode_spec(hw, ctx);
+		h264_reorder_reflists(h264_ctx);
+		get_canvas_index(hw, ctx);
+		if (h264_config_decode_buf(hw, ctx) < 0) {
+			/*
+			 * Drop this picture's state and let the microcode
+			 * carry on - it usually does, and the slice-data
+			 * interrupt behind this one finishes the job.
+			 *
+			 * Deliberately no int_cond/wake here.  Waking
+			 * aml_h264_dec_run() makes it return success while the
+			 * job is still running, so if the microcode does *not*
+			 * come back the job is never finished at all: the next
+			 * VIDIOC_STREAMOFF then blocks for ever in
+			 * v4l2_m2m_cancel_job(), the RCU grace period stalls
+			 * behind it, and within a minute every task that
+			 * touches a V4L2 node or a cgroup is in D state and the
+			 * machine is unusable.  Staying asleep lets the decode
+			 * timeout fire and cancel the job properly.
+			 */
+			h264_release_decode_spec(hw, ctx);
+			goto irq_handled;
+		}
+		/*
+		 * The microcode raises this for profile_idc >= 100 with
+		 * TARGET_NUM_SCALING_LIST set, and will not go on to parse a
+		 * slice header until it is satisfied - so High profile never
+		 * decodes.  Acknowledging is all this driver knows how to do;
+		 * see the note in config_pps_params().
+		 */
+		dev_dbg(&dev->plat_dev->dev,
+			"config request, scaling lists %d\n",
+			h264_ctx->dpb_param.l.data[TARGET_NUM_SCALING_LIST]);
+		regmap_write(hw->map[DOS_BUS], DPB_STATUS_REG, H264_ACTION_CONFIG_DONE);
+		dev_dbg(&dev->plat_dev->dev, "action config done\n");
+		break;
 	case H264_SLICE_DATA_DONE:
+	case H264_DECODE_BUFEMPTY:
 		h264_release_decode_spec(hw, ctx);
 		h264_ctx->decode_pic_count++;
 		ctx->int_cond = 1;
+		ctx->job_finished = true;
 		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
 						 VB2_BUF_STATE_DONE);
-		wake_up_interruptible(&ctx->queue);
+		wake_up(&ctx->queue);
 		break;
 	default:
 		h264_release_decode_spec(hw, ctx);
 		ctx->int_cond = 1;
+		ctx->job_finished = true;
 		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
 						 VB2_BUF_STATE_ERROR);
-		wake_up_interruptible(&ctx->queue);
+		wake_up(&ctx->queue);
 		break;
 	}
 irq_handled:
@@ -1896,6 +2225,14 @@ int aml_h264_init(void *priv)
 		return -ENOMEM;
 
 	h264_ctx->v4l2_ctx = ctx;
+	init_buf_spec_canvas(&h264_ctx->curr_spec);
+	for (ret = 0; ret < V4L2_H264_NUM_DPB_ENTRIES + 1; ret++) {
+		init_buf_spec_canvas(&h264_ctx->ref_list0[ret]);
+		init_buf_spec_canvas(&h264_ctx->ref_list1[ret]);
+		init_buf_spec_canvas(&h264_ctx->ref_list0_unreordered[ret]);
+		init_buf_spec_canvas(&h264_ctx->ref_list1_unreordered[ret]);
+	}
+	ret = 0;
 	dec_hw = vdec_get_hw(ctx->dev);
 	if (!dec_hw)
 		return -1;
@@ -1923,8 +2260,8 @@ int aml_h264_init(void *priv)
 	h264_ctx->workspace_offset = h264_ctx->cma_alloc_addr + DCAC_READ_MARGIN;
 	h264_ctx->workspace_vaddr = h264_ctx->cma_alloc_vaddr + DCAC_READ_MARGIN;
 
+	/* curr_ctx is bound per job in aml_h264_dec_run(), not here. */
 	ctx->codec_priv = h264_ctx;
-	dec_hw->curr_ctx = h264_ctx;
 	h264_ctx->col_buf_alloc_size = 0;
 	h264_ctx->init_flag = 0;
 	h264_ctx->new_pic_flag = 0;
@@ -1960,6 +2297,12 @@ void aml_h264_exit(void *priv)
 	if (ctx->dos_clk_en)
 		aml_stop_vdec_hw(dec_hw);
 
+	if (h264_ctx->stage_vaddr) {
+		dma_free_coherent(dec_hw->dev, h264_ctx->stage_size,
+				  h264_ctx->stage_vaddr, h264_ctx->stage_paddr);
+		h264_ctx->stage_vaddr = NULL;
+	}
+
 	if (h264_ctx->collated_cma_vaddr) {
 		dma_free_coherent(dec_hw->dev, h264_ctx->col_buf_alloc_size,
 				  h264_ctx->collated_cma_vaddr,
@@ -1983,8 +2326,9 @@ void aml_h264_exit(void *priv)
 				  h264_ctx->cma_alloc_vaddr,
 				  h264_ctx->cma_alloc_addr);
 
+	if (dec_hw->curr_ctx == h264_ctx)
+		dec_hw->curr_ctx = NULL;
 	kfree(ctx->codec_priv);
-	dec_hw->curr_ctx = NULL;
 	ctx->codec_priv = NULL;
 }
 
@@ -1996,6 +2340,12 @@ static void config_decode_mode(struct aml_vdec_ctx *ctx)
 	regmap_write(hw->map[DOS_BUS], H264_DECODE_MODE, 0x1);	/*decode mode framebase */
 	regmap_write(hw->map[DOS_BUS], HEAD_PADDING_REG, 0);
 	regmap_write(hw->map[DOS_BUS], H264_DECODE_SEQINFO, h264_ctx->seq_info);
+	/*
+	 * Always 1.  The vendor writes 0 for the first run of an instance,
+	 * but that tells the microcode to initialise itself from SPS/PPS in
+	 * the bitstream - which the stateless API never delivers - and every
+	 * stream then decodes to nothing.
+	 */
 	regmap_write(hw->map[DOS_BUS], INIT_FLAG_REG, 1);
 }
 
@@ -2007,6 +2357,11 @@ int aml_h264_dec_run(void *priv)
 	int ret = -1;
 	int i;
 
+	dec_hw->curr_ctx = h264_ctx;
+	/* The legacy core's interrupt is shared with MPEG-2: claim it per job. */
+	dec_hw->hw_ops.irq_handler = h264_isr;
+	dec_hw->hw_ops.irq_threaded_func = h264_threaded_isr_func;
+
 	ret = aml_h264_get_stateless_ctrl_ref(h264_ctx);
 	if (ret < 0) {
 		dev_err(&ctx->dev->plat_dev->dev, "not ctrl ref for h264 decoder\n");
@@ -2042,13 +2397,37 @@ int aml_h264_dec_run(void *priv)
 
 	regmap_write(dec_hw->map[DOS_BUS], DPB_STATUS_REG, H264_ACTION_SEARCH_HEAD);
 
-	ret = wait_event_interruptible_timeout(ctx->queue, ctx->int_cond,
-					       msecs_to_jiffies(DECODER_TIMEOUT_MS));
+	/*
+	 * Uninterruptible on purpose: a signal must not abandon a decode the
+	 * hardware is still running - see the note in vp9.c.
+	 */
+	ret = wait_event_timeout(ctx->queue, ctx->int_cond,
+				 msecs_to_jiffies(DECODER_TIMEOUT_MS));
 	ctx->int_cond = 0;
 	if (!ret) {
 		ret = -1;
 		dev_err(&ctx->dev->plat_dev->dev, "dec timeout=%u\n", DECODER_TIMEOUT_MS);
-		for (i = 0; i < 16; i++) {	/* 16 : show ucode PC 16 times when timeout */
+		dev_err(&ctx->dev->plat_dev->dev,
+			"vififo start %08x curr %08x end %08x wp %08x rp %08x level %08x avail %08x ctrl %08x\n",
+			read_dos_reg(dec_hw, VLD_MEM_VIFIFO_START_PTR),
+			read_dos_reg(dec_hw, VLD_MEM_VIFIFO_CURR_PTR),
+			read_dos_reg(dec_hw, VLD_MEM_VIFIFO_END_PTR),
+			read_dos_reg(dec_hw, VLD_MEM_VIFIFO_WP),
+			read_dos_reg(dec_hw, VLD_MEM_VIFIFO_RP),
+			read_dos_reg(dec_hw, VLD_MEM_VIFIFO_LEVEL),
+			read_dos_reg(dec_hw, VLD_MEM_VIFIFO_BYTES_AVAIL),
+			read_dos_reg(dec_hw, VLD_MEM_VIFIFO_CONTROL));
+		dev_err(&ctx->dev->plat_dev->dev,
+			"dpb_status %08x bitcnt %08x shift %08x mby_mbx %08x scratch0 %08x scratch1 %08x scratchF %08x scratchG %08x\n",
+			read_dos_reg(dec_hw, DPB_STATUS_REG),
+			read_dos_reg(dec_hw, VIFF_BIT_CNT),
+			read_dos_reg(dec_hw, VLD_SHIFT_STATUS),
+			read_dos_reg(dec_hw, MBY_MBX),
+			read_dos_reg(dec_hw, AV_SCRATCH_0),
+			read_dos_reg(dec_hw, AV_SCRATCH_1),
+			read_dos_reg(dec_hw, AV_SCRATCH_F),
+			read_dos_reg(dec_hw, AV_SCRATCH_G));
+		for (i = 0; i < 4; i++) {	/* show ucode PC a few times when timeout */
 			dev_info(&ctx->dev->plat_dev->dev, "decoder timeout, pc 0x%x\n",
 				 read_dos_reg(dec_hw, MPC_E));
 			usleep_range(10, 20);
diff --git a/drivers/media/platform/amlogic/vdec/h264.h b/drivers/media/platform/amlogic/vdec/h264.h
index 830ab3241a1e..f12150f9f5b0 100644
--- a/drivers/media/platform/amlogic/vdec/h264.h
+++ b/drivers/media/platform/amlogic/vdec/h264.h
@@ -296,4 +296,11 @@ int aml_h264_init(void *priv);
 void aml_h264_exit(void *priv);
 int aml_h264_dec_run(void *priv);
 
+int aml_h264_build_sps(u8 *out, size_t out_size,
+		       const struct v4l2_ctrl_h264_sps *sps);
+int aml_h264_build_pps(u8 *out, size_t out_size,
+		       const struct v4l2_ctrl_h264_pps *pps,
+		       const struct v4l2_ctrl_h264_scaling_matrix *sm,
+		       u8 chroma_format_idc);
+
 #endif
diff --git a/drivers/media/platform/amlogic/vdec/h264_headers.c b/drivers/media/platform/amlogic/vdec/h264_headers.c
new file mode 100644
index 000000000000..a8450a672172
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/h264_headers.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Rebuild H.264 SPS and PPS NAL units from the V4L2 stateless controls.
+ *
+ * The stateless API hands the decoder slice NALs and puts the parameter sets
+ * in controls, so the microcode never sees an SPS or a PPS.  For most streams
+ * that is fine - the driver writes the parameters into the microcode's own
+ * tables - but for profile_idc >= 100 the microcode answers every buffer with
+ * H264_CONFIG_REQUEST, asking for scaling lists it expects to have parsed
+ * itself, and never gets as far as a slice header.  Handing it real headers is
+ * the way out: it is the mode the microcode was written for.
+ *
+ * The same shape as av1_build_sequence_obu() in av1.c.
+ */
+
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <media/v4l2-ctrls.h>
+
+#include "h264.h"
+
+struct h264_bw {
+	u8 *buf;
+	size_t size;
+	size_t bit;
+	bool overflow;
+};
+
+static void bw_bit(struct h264_bw *bw, u32 v)
+{
+	size_t byte = bw->bit >> 3;
+	int shift = 7 - (bw->bit & 7);
+
+	if (byte >= bw->size) {
+		bw->overflow = true;
+		return;
+	}
+	if (shift == 7)
+		bw->buf[byte] = 0;
+	if (v & 1)
+		bw->buf[byte] |= 1 << shift;
+	bw->bit++;
+}
+
+static void bw_bits(struct h264_bw *bw, u32 v, int n)
+{
+	while (n--)
+		bw_bit(bw, v >> n);
+}
+
+static void bw_ue(struct h264_bw *bw, u32 v)
+{
+	int bits = 0;
+	u32 t = v + 1;
+
+	while (t >> ++bits)
+		;
+	bw_bits(bw, 0, bits - 1);
+	bw_bits(bw, v + 1, bits);
+}
+
+static void bw_se(struct h264_bw *bw, int v)
+{
+	bw_ue(bw, v > 0 ? (2 * v - 1) : (-2 * v));
+}
+
+static void bw_trailing(struct h264_bw *bw)
+{
+	bw_bit(bw, 1);
+	while (bw->bit & 7)
+		bw_bit(bw, 0);
+}
+
+/*
+ * scaling_list(), 7.3.2.1.1.1.  The control carries the matrix already
+ * resolved by the fall-back rules, so every list is written out in full as a
+ * chain of delta_scale values that reproduces it exactly.
+ */
+static void bw_scaling_list(struct h264_bw *bw, const u8 *list, int n)
+{
+	int last = 8, j;
+
+	for (j = 0; j < n; j++) {
+		int delta = (int)list[j] - last;
+
+		while (delta > 127)
+			delta -= 256;
+		while (delta < -128)
+			delta += 256;
+		bw_se(bw, delta);
+		last = list[j];
+	}
+}
+
+/* Annex B: start code, NAL header, then the RBSP with 0x03 escaping. */
+static int emit_nal(u8 *out, size_t out_size, u8 nal_hdr,
+		    const u8 *rbsp, size_t rbsp_len)
+{
+	size_t n = 0, i;
+	int zeros = 0;
+
+	if (out_size < rbsp_len + 8)
+		return -ENOSPC;
+
+	out[n++] = 0;
+	out[n++] = 0;
+	out[n++] = 0;
+	out[n++] = 1;
+	out[n++] = nal_hdr;
+
+	for (i = 0; i < rbsp_len; i++) {
+		if (zeros == 2 && rbsp[i] <= 3) {
+			if (n + 2 > out_size)
+				return -ENOSPC;
+			out[n++] = 3;
+			zeros = 0;
+		}
+		if (n + 1 > out_size)
+			return -ENOSPC;
+		out[n++] = rbsp[i];
+		zeros = rbsp[i] ? 0 : zeros + 1;
+	}
+	return n;
+}
+
+int aml_h264_build_sps(u8 *out, size_t out_size,
+		       const struct v4l2_ctrl_h264_sps *sps)
+{
+	u8 rbsp[64];
+	struct h264_bw bw = { .buf = rbsp, .size = sizeof(rbsp) };
+	int i;
+
+	bw_bits(&bw, sps->profile_idc, 8);
+	bw_bits(&bw, sps->constraint_set_flags, 6);
+	bw_bits(&bw, 0, 2);			/* reserved_zero_2bits */
+	bw_bits(&bw, sps->level_idc, 8);
+	bw_ue(&bw, sps->seq_parameter_set_id);
+
+	if (sps->profile_idc >= 100) {
+		bw_ue(&bw, sps->chroma_format_idc);
+		if (sps->chroma_format_idc == 3)
+			bw_bit(&bw, !!(sps->flags &
+				       V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE));
+		bw_ue(&bw, sps->bit_depth_luma_minus8);
+		bw_ue(&bw, sps->bit_depth_chroma_minus8);
+		bw_bit(&bw, !!(sps->flags &
+			       V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS));
+		/*
+		 * seq_scaling_matrix_present_flag = 0.  The resolved matrix
+		 * goes in the PPS instead, which overrides the sequence one,
+		 * so one place to write it is enough.
+		 */
+		bw_bit(&bw, 0);
+	}
+
+	bw_ue(&bw, sps->log2_max_frame_num_minus4);
+	bw_ue(&bw, sps->pic_order_cnt_type);
+	if (sps->pic_order_cnt_type == 0) {
+		bw_ue(&bw, sps->log2_max_pic_order_cnt_lsb_minus4);
+	} else if (sps->pic_order_cnt_type == 1) {
+		bw_bit(&bw, !!(sps->flags &
+			       V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO));
+		bw_se(&bw, sps->offset_for_non_ref_pic);
+		bw_se(&bw, sps->offset_for_top_to_bottom_field);
+		bw_ue(&bw, sps->num_ref_frames_in_pic_order_cnt_cycle);
+		for (i = 0; i < sps->num_ref_frames_in_pic_order_cnt_cycle; i++)
+			bw_se(&bw, sps->offset_for_ref_frame[i]);
+	}
+
+	bw_ue(&bw, sps->max_num_ref_frames);
+	bw_bit(&bw, !!(sps->flags &
+		       V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED));
+	bw_ue(&bw, sps->pic_width_in_mbs_minus1);
+	bw_ue(&bw, sps->pic_height_in_map_units_minus1);
+	bw_bit(&bw, !!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY));
+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+		bw_bit(&bw, !!(sps->flags &
+			       V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD));
+	bw_bit(&bw, !!(sps->flags & V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE));
+	/*
+	 * No cropping and no VUI.  The control carries neither, and both are
+	 * the client's business: the driver sizes buffers from the picture
+	 * size it was given, not from what the microcode parses here.
+	 */
+	bw_bit(&bw, 0);			/* frame_cropping_flag */
+	bw_bit(&bw, 0);			/* vui_parameters_present_flag */
+	bw_trailing(&bw);
+
+	if (bw.overflow)
+		return -ENOSPC;
+	return emit_nal(out, out_size, 0x67, rbsp, bw.bit >> 3);
+}
+
+int aml_h264_build_pps(u8 *out, size_t out_size,
+		       const struct v4l2_ctrl_h264_pps *pps,
+		       const struct v4l2_ctrl_h264_scaling_matrix *sm,
+		       u8 chroma_format_idc)
+{
+	u8 rbsp[512];
+	struct h264_bw bw = { .buf = rbsp, .size = sizeof(rbsp) };
+	bool t8x8 = !!(pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE);
+	int n8x8, i;
+
+	bw_ue(&bw, pps->pic_parameter_set_id);
+	bw_ue(&bw, pps->seq_parameter_set_id);
+	bw_bit(&bw, !!(pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE));
+	bw_bit(&bw, !!(pps->flags &
+		       V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT));
+	/*
+	 * num_slice_groups_minus1 is forced to 0: slice groups need a slice
+	 * group map the stateless API does not carry, and no encoder in use
+	 * emits them.
+	 */
+	bw_ue(&bw, 0);
+	bw_ue(&bw, pps->num_ref_idx_l0_default_active_minus1);
+	bw_ue(&bw, pps->num_ref_idx_l1_default_active_minus1);
+	bw_bit(&bw, !!(pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED));
+	bw_bits(&bw, pps->weighted_bipred_idc, 2);
+	bw_se(&bw, pps->pic_init_qp_minus26);
+	bw_se(&bw, pps->pic_init_qs_minus26);
+	bw_se(&bw, pps->chroma_qp_index_offset);
+	bw_bit(&bw, !!(pps->flags &
+		       V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT));
+	bw_bit(&bw, !!(pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED));
+	bw_bit(&bw, !!(pps->flags & V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT));
+
+	/* The trailing part, always present so the scaling lists can go in. */
+	bw_bit(&bw, t8x8);
+	if (sm) {
+		bw_bit(&bw, 1);		/* pic_scaling_matrix_present_flag */
+		n8x8 = t8x8 ? (chroma_format_idc == 3 ? 6 : 2) : 0;
+		for (i = 0; i < 6; i++) {
+			bw_bit(&bw, 1);	/* pic_scaling_list_present_flag */
+			bw_scaling_list(&bw, sm->scaling_list_4x4[i], 16);
+		}
+		for (i = 0; i < n8x8; i++) {
+			bw_bit(&bw, 1);
+			bw_scaling_list(&bw, sm->scaling_list_8x8[i], 64);
+		}
+	} else {
+		bw_bit(&bw, 0);
+	}
+	bw_se(&bw, pps->second_chroma_qp_index_offset);
+	bw_trailing(&bw);
+
+	if (bw.overflow)
+		return -ENOSPC;
+	return emit_nal(out, out_size, 0x68, rbsp, bw.bit >> 3);
+}
-- 
2.56.0

