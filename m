Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956341;
	b=2jQNRbCtthzyjAvZiJOHLqnlEQup7Ed6HHAGITIt6D89Z9NqkdFQDqX6e+atFI8Eenez
	 RYVLV2f9fv5+hOxNwU2a1F7TUo3LVB7w5BlVhKVfRSlXujPrpLgZOBRSUk9BItgVn3QoK
	 Ls+I/GnpCtU4F/5sblEtsgwIXTYoIdDnv43ltIOAdmCY+VF6LX6ODsSSPhgxp9UENEJ65
	 aa5yldORG45mMzld8FeVX6CYsbxkMGShVNbQoNrj4jF5/JPgVkKQFot4jNkoHOs6Ce8Yk
	 uEecF13IFp2HkUUugBphwFGJgnxmz138dCcTbB7x23N3JKSKnh7xU1sZR6CD2YQSlSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956341;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=kDVqZjPYcCKzQ4+N+nIRjBtDVMwsIGZdDaFc6tSupmo=;
	b=g+1DD6GirbZAu/czMhcDTdB/if8YYQ7eHBORu9H6lFRs5GLtgmgX6eomIOI95XpPqdob
	 fkkHd3NlEtZLzNf/I4U/+TXBYob29bvh+5Nt7UAJuwVUPMBKVUgnNsYCdvGfyN221lLl6
	 TWCE2QAUp83c8/cC+paOQsoOH9uI8xQHWIbGrhZ1CwkyBmMVLIIq6CYOpz+OjFKkykRE6
	 aqZy2N/uihOg5rE+PbD5OTgAw3kpdVsNxffNKh8EaeTgouIyJ1l3WwJHon3QO+aJJxiLz
	 jvvBEPIWt9dnT1+HxGpyDOcam3Jc10LK9i9qK6giGmR/TOvphZdsHryJBbeatwxQ66w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=bNBANYla;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F7360A260D;
	Sun, 25 Oct 2026 19:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F7360A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=bNBANYla
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJP8Ep519288
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:25:24 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJP8Ep519288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956327;
	bh=kDVqZjPYcCKzQ4+N+nIRjBtDVMwsIGZdDaFc6tSupmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bNBANYlaiPQ3iluhRvXyBk83LEBD9p6jUql4YceSa/bb+7gUNyPVR5TM5YUcuQRYb
	 Gkl8FsjZpKzrrWxUK/LMFIZhwtNifLhVXQdn1AmsTdC+BwzaxuPtPk07ceRy8WKeY9
	 iTQFdV8rQ0gAcTMMde+iL3FOQuL+9bwmecz4Vbko=
From: christian.koever-draxl@student.uibk.ac.at
To: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 07/11] media: amlogic: vdec: add AV1 decoding on the HEVC core
Date: Sun, 25 Oct 2026 20:25:03 +0100
Message-ID: <20261025192507.210058-8-christian.koever-draxl@student.uibk.ac.at>
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

Decode AV1 main profile, 8- and 10-bit (10-bit output as rounded 8-bit
NV12), key and inter frames including temporal motion vectors, up to
4096x2304. The microcode expects whole OBUs behind a 20-byte AMLV
header, so the frame header OBU is rebuilt from the stateless controls;
reference slots are tracked from reference_frame_ts. The decoder writes
straight into the CAPTURE buffer through its double-write path, and the
compressed reference body sits behind the frame MMU.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/media/platform/amlogic/vdec/Makefile  |    2 +-
 .../media/platform/amlogic/vdec/aml_vdec.c    |   24 +
 .../platform/amlogic/vdec/aml_vdec_platform.c |   17 +
 drivers/media/platform/amlogic/vdec/av1.c     | 3140 +++++++++++++++++
 drivers/media/platform/amlogic/vdec/av1.h     |  308 ++
 5 files changed, 3490 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/amlogic/vdec/av1.c
 create mode 100644 drivers/media/platform/amlogic/vdec/av1.h

diff --git a/drivers/media/platform/amlogic/vdec/Makefile b/drivers/media/platform/amlogic/vdec/Makefile
index c5eda54598f6..4eb7601f61a3 100644
--- a/drivers/media/platform/amlogic/vdec/Makefile
+++ b/drivers/media/platform/amlogic/vdec/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o h264_headers.o mpeg12.o mjpeg.o aml_vdec_tee_fw.o
+aml-vdec-drv-objs := aml_vdec.o aml_vdec_drv.o aml_vdec_hw.o aml_vdec_platform.o h264.o h264_headers.o av1.o mpeg12.o mjpeg.o aml_vdec_tee_fw.o
 
 obj-$(CONFIG_VIDEO_AMLOGIC_VDEC) += aml-vdec-drv.o
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec.c b/drivers/media/platform/amlogic/vdec/aml_vdec.c
index c383dd642586..6892430c9569 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec.c
@@ -66,6 +66,27 @@ static const struct aml_vdec_v4l2_ctrl controls[] = {
 			.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
 			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
 		},
+	}, {
+		.codec_type = CODEC_TYPE_AV1,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_AV1_SEQUENCE,
+		},
+	}, {
+		.codec_type = CODEC_TYPE_AV1,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_AV1_FRAME,
+		},
+	}, {
+		.codec_type = CODEC_TYPE_AV1,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY,
+			.dims = { V4L2_AV1_MAX_TILE_COUNT },
+		},
+	}, {
+		.codec_type = CODEC_TYPE_AV1,
+		.cfg = {
+			.id = V4L2_CID_STATELESS_AV1_FILM_GRAIN,
+		},
 	}, {
 		.codec_type = CODEC_TYPE_MPEG2,
 		.cfg = {
@@ -87,6 +108,9 @@ static const struct aml_dec_type dec_type_name[] = {
 	{
 		.codec_type = CODEC_TYPE_H264,
 		.name = "H264",
+	}, {
+		.codec_type = CODEC_TYPE_AV1,
+		.name = "AV1",
 	}, {
 		.codec_type = CODEC_TYPE_MPEG2,
 		.name = "MPEG2",
diff --git a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
index d54b09b6bbc0..1e8193821aaf 100644
--- a/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
+++ b/drivers/media/platform/amlogic/vdec/aml_vdec_platform.c
@@ -6,6 +6,7 @@
 #include "aml_vdec_platform.h"
 #include "aml_vdec_hw.h"
 #include "h264.h"
+#include "av1.h"
 #include "mpeg12.h"
 #include "mjpeg.h"
 
@@ -21,6 +22,17 @@ static struct aml_video_fmt aml_s4_video_formats[] = {
 		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_1080P_MAX_W, 2,
 			AML_VDEC_MIN_H, AML_VDEC_1080P_MAX_H, 2},
 	},
+	{
+		.name = "AV1",
+		.fourcc = V4L2_PIX_FMT_AV1_FRAME,
+		.type = AML_FMT_DEC,
+		.align = 64,
+		.is_10_bit_support = 0,
+		.codec_type = CODEC_TYPE_AV1,
+		.num_planes = 1,
+		.stepwise = {AML_VDEC_MIN_W, AML_VDEC_4K_MAX_W, 2,
+			AML_VDEC_MIN_H, AML_VDEC_4K_MAX_H, 2},
+	},
 	{
 		.name = "MPEG-2",
 		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
@@ -103,6 +115,11 @@ const struct aml_codec_ops aml_S4_dec_ops[] = {
 		.exit = aml_h264_exit,
 		.run = aml_h264_dec_run,
 	},
+	[CODEC_TYPE_AV1] = {
+		.init = aml_av1_init,
+		.exit = aml_av1_exit,
+		.run = aml_av1_dec_run,
+	},
 	[CODEC_TYPE_MPEG2] = {
 		.init = aml_mpeg12_init,
 		.exit = aml_mpeg12_exit,
diff --git a/drivers/media/platform/amlogic/vdec/av1.c b/drivers/media/platform/amlogic/vdec/av1.c
new file mode 100644
index 000000000000..ddadc83c8d86
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/av1.c
@@ -0,0 +1,3140 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * AV1 bring-up for the S4 HEVC/AV1 core.
+ *
+ * This is not a decoder yet.  It allocates the microcode's working buffers,
+ * programs them, configures the stream front end and releases the AMRISC -
+ * i.e. it is Amlogic's vav1_prot_init() followed by amhevc_start(), and nothing
+ * more.  The milestone it exists to reach is the first mailbox 0 interrupt:
+ * until the workspace is programmed the microcode has nothing to do but idle,
+ * so silence from the mailbox proves nothing either way.
+ *
+ * Reference: media_modules branch khadas-vim1s-r (VIM1S is S905Y4, the same S4
+ * family), drivers/frame_provider/decoder_v4l/vav1/vav1.c - aom_config_work_
+ * space_hw(), aom_init_decoder_hw(), vav1_prot_init().
+ *
+ * Build-time choices made here, matching how that reference is actually
+ * compiled: MMU on, double-write MMU off, MV_USE_FIXED_BUF off (so no mpred_mv
+ * in the workspace) and USE_SPEC_BUF_FOR_MMU_HEAD off (so cm_header is empty
+ * and the compressed headers come from the MMU allocator instead).
+ */
+
+#include <linux/crc32.h>
+#include <linux/dma-mapping.h>
+#include <linux/fs.h>
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "aml_vdec_drv.h"
+#include "av1.h"
+
+/*
+ * Workspace layout, aom_workbuff_spec[1] of the reference - the 4096x2304
+ * entry - in the order init_buff_spec() lays them out.  sao_abv, sao_vb,
+ * sao_up and scalelut are zero-sized on AV1 and are simply absent here.
+ *
+ * The 1080p spec[0] is deliberately not used.  Several of these buffers are
+ * written by the hardware from the picture size it parsed, not from anything
+ * the host tells it, so a 4K stream arriving at a 1080p workspace overruns
+ * whatever follows it - and this is one allocation for the whole decoder, a
+ * few MB once, not per picture.  The 1080p values are kept in the comments
+ * for reference.
+ */
+#define AV1_IPP_SIZE            0x4000		/* 1080p: 0x1e00 */
+#define AV1_SHORT_TERM_RPS_SIZE 0x0800
+#define AV1_VPS_SIZE            0x0800
+#define AV1_SEG_MAP_SIZE        0x360000	/* 1080p: 0xbf400 */
+#define AV1_DAALA_TOP_SIZE      0x2000		/* 1080p: 0x0f00 */
+#define AV1_SWAP_BUF_SIZE       0x0800
+#define AV1_CDF_SIZE            0x80000
+#define AV1_CDF_SLOT_SIZE       0x8000
+#define AV1_GMC_SIZE            0x0800
+#define AV1_DBLK_PARA_SIZE      0x1a00		/* 1080p: 0x0d00 */
+#define AV1_DBLK_DATA_SIZE      0x52800		/* 1080p: 0x49000 */
+#define AV1_CDEF_DATA_SIZE      0x24a00		/* 1080p: 0x22400 */
+#define AV1_UPS_DATA_SIZE       0x6f000		/* 1080p: 0x36000 */
+/* 512 x 128 bits per frame buffer, and AV1 has REF_FRAMES + 1 + INTER_REFS. */
+#define AV1_FRAME_BUFFERS       16
+#define AV1_FGS_TABLE_SIZE      ((512 * 128 / 8) * AV1_FRAME_BUFFERS)
+#define AV1_MMU_VBH_SIZE        0x5000		/* 1080p: 0x3000 */
+#define AV1_MPRED_ABOVE_SIZE    0x5400		/* 1080p: 0x2800 */
+
+/* Separate small buffers the microcode DMAs to and from. */
+#define AV1_RPM_SIZE            (0x80 * 2)
+#define AV1_LMEM_SIZE           (0x400 * 2)
+#define AV1_PROB_SIZE           0x5000
+#define AV1_COUNT_SIZE          (0x300 * 4 * 4)
+/* One 32-bit page entry per 4 KiB page, MAX_FRAME_4K_NUM of them. */
+#define AV1_MMU_MAP_SIZE        (0x1200 * 4)
+/* Collocated motion vectors: MV_MEM_UNIT per superblock. */
+#define AV1_MV_MEM_UNIT         0x240
+#define AV1_MV_BUF_SIZE         0x26400
+/* Amlogic's own default: 16 KiB of prefix aux, no suffix. */
+#define AV1_AUX_PREFIX_SIZE     (16 * 1024)
+#define AV1_AUX_SUFFIX_SIZE     0
+
+/*
+ * The write pointer is deliberately parked this far past the payload, the same
+ * way the legacy VLD path uses VLD_PADDING_SIZE.  vdec.c calls it
+ * HEVC_PADDING_SIZE.
+ */
+#define HEVC_PADDING_SIZE       (1024 * 16)
+
+#define AV1_PARSER_CMD_NUMBER   37
+#define PARSER_CMD_SKIP_CFG_0   0x0000090b
+#define PARSER_CMD_SKIP_CFG_1   0x1b14140f
+#define PARSER_CMD_SKIP_CFG_2   0x001b1910
+
+static const u16 av1_parser_cmd[AV1_PARSER_CMD_NUMBER] = {
+	0x0401, 0x8401, 0x0800, 0x0402, 0x9002, 0x1423,
+	0x8CC3, 0x1423, 0x8804, 0x9825, 0x0800, 0x04FE,
+	0x8406, 0x8411, 0x1800, 0x8408, 0x8409, 0x8C2A,
+	0x9C2B, 0x1C00, 0x840F, 0x8407, 0x8000, 0x8408,
+	0x2000, 0xA800, 0x8410, 0x04DE, 0x840C, 0x840D,
+	0xAC00, 0xA000, 0x08C0, 0x08E0, 0xA40E, 0xFC00,
+	0x7C00
+};
+
+struct av1_workspace {
+	void *vaddr;
+	dma_addr_t paddr;
+	size_t size;
+
+	dma_addr_t ipp;
+	dma_addr_t short_term_rps;
+	dma_addr_t vps;
+	dma_addr_t seg_map;
+	dma_addr_t daala_top;
+	dma_addr_t swap_buf;
+	dma_addr_t cdf;
+	dma_addr_t gmc;
+	dma_addr_t dblk_para;
+	dma_addr_t dblk_data;
+	dma_addr_t cdef_data;
+	dma_addr_t ups_data;
+	dma_addr_t fgs_table;
+	dma_addr_t mmu_vbh;
+	dma_addr_t mpred_above;
+
+	void *side_vaddr;
+	dma_addr_t side_paddr;
+	size_t side_size;
+	dma_addr_t rpm;
+	dma_addr_t lmem;
+	dma_addr_t prob;
+	dma_addr_t count;
+	dma_addr_t mmu_map;
+	dma_addr_t aux;
+	dma_addr_t mv;
+	dma_addr_t cm_header[AV1_FRAME_BUFFERS];
+
+	void *body_vaddr;
+	dma_addr_t body_paddr;
+	size_t body_size;
+
+	/* Target of every frame-MMU entry past the current body. */
+	void *guard_vaddr;
+	dma_addr_t guard_paddr;
+
+	void *dw_vaddr;
+	dma_addr_t dw_paddr;
+	size_t dw_size;
+	u32 dw_width, dw_height;
+
+	void *stream_vaddr;
+	dma_addr_t stream_paddr;
+	size_t stream_size;
+	size_t payload;
+};
+
+/*
+ * Picture slots.  A key frame needs one buffer; anything inter needs the
+ * pictures it references to still be around, so each slot owns its own
+ * compressed body, its compressed-frame header and its collocated MV buffer.
+ * The canvas index the hardware uses to name a picture is simply the slot
+ * number - in MMU mode the reference sets mc_canvas_y = mc_canvas_u_v = index.
+ */
+/*
+ * AV1 keeps eight reference slots, and the picture being decoded needs a
+ * buffer of its own that none of them names - so eight is one too few and the
+ * slot search silently fails once all eight references are distinct.  That is
+ * exactly where a ten-frame stream started to go wrong at frame 8.
+ */
+#define AV1_SLOTS	10
+
+struct av1_slot {
+	/*
+	 * The compressed picture body, reached by the decoder only through
+	 * the page table av1_fill_mmu_map() builds.
+	 */
+	void *body_v;
+	dma_addr_t body_p;
+	void *hdr_v;
+	dma_addr_t hdr_p;
+	dma_addr_t mv_p;
+	void *mv_v;
+	/* The picture as the display sees it, one per slot so that a
+	 * show_existing_frame header can hand back an older one.
+	 */
+	void *dw_v;
+	dma_addr_t dw_p;
+	u32 order_hint;
+	/* State a later frame needs when it projects motion from this one. */
+	bool intra;
+	u8 frame_type;
+	u32 width, height;
+	u8 ref_order_hint[8];	/* of its own LAST..ALTREF, indexed by ref frame */
+	/* OUTPUT buffer timestamp of the frame decoded here; 0 when none. */
+	u64 ts;
+};
+
+static struct av1_slot av1_slots[AV1_SLOTS];
+static size_t av1_slot_body_size, av1_slot_mv_size, av1_slot_hdr_size;
+static size_t av1_slot_dw_size;
+static int av1_cur_slot;
+static u32 av1_last_width, av1_last_height;
+static int av1_prev_slot;
+/* False for a key frame and for any frame with PRIMARY_REF_NONE. */
+static bool av1_prev_valid;
+/* Slot a show_existing_frame header asked to be displayed again. */
+static int av1_shown_slot = -1;
+/* Slot that should be handed to the display next, -1 when there is none. */
+static int av1_out_slot = -1;
+static bool av1_cur_show;
+/*
+ * Set while userspace drives the decoder one frame per OUTPUT buffer, the way
+ * the V4L2 stateless API does.  Then the client - not this driver - owns
+ * display order: it keeps every decoded picture as a reference buffer and
+ * re-outputs one itself when a show_existing_frame header names it.  So every
+ * decoded picture has to be written to its CAPTURE buffer, hidden ones
+ * included.  The raw-OBU path is the opposite: it is handed whole temporal
+ * units and hands back pictures in display order, so a hidden frame produces
+ * no output buffer of its own.
+ */
+static bool av1_stateless;
+/*
+ * Where the double-write unit should lay the NV12 picture down.  Zero means
+ * "this picture's own slot buffer", which the raw-OBU path needs because a
+ * show_existing_frame header can ask for a picture decoded much earlier.  A
+ * stateless client gives every submitted frame - hidden ones included - its
+ * own CAPTURE buffer, so the hardware can write straight into it and the CPU
+ * never touches the picture at all.  That saves a 3 MB memcpy per frame and,
+ * at 4K, ten 12 MB slot buffers.
+ */
+static dma_addr_t av1_dw_target_y, av1_dw_target_c;
+
+/* Bytes the hardware may write at av1_dw_target_y, the CAPTURE buffer size. */
+static size_t av1_dw_target_size;
+/* AV1 keeps eight reference slots; each names one of our picture slots. */
+static int av1_ref_slot[8];
+static u32 av1_pending_refresh;
+/* OUTPUT timestamp of the frame being decoded, stateless path only. */
+static u64 av1_cur_ts;
+/* The picture slot each reference frame LAST..ALTREF resolves to, plus [0] = current. */
+static int av1_frame_slot[8];
+
+static struct av1_workspace av1_ws;
+
+/*
+ * Byte-order control for the stream shifter, HEVC_STREAM_CONTROL bits 6:4.
+ * vdec_enable_input() uses 7 for every frame-based target and that is the
+ * default here; it is exposed only because it is a three-bit documented field
+ * and the microcode's answer changes completely with it.
+ */
+/*
+ * HEVC_ASSIST_SCRATCH_I carries two names in Amlogic's headers, LMEM_DUMP_ADR
+ * and NAL_SEARCH_CTL, and the reference writes both: prot_init leaves 8 there
+ * ("check headers in ucode") and run() then overwrites it with the lmem
+ * address.
+ *
+ * That ambiguity was resolved the hard way: leaving a small constant there
+ * instead of the address oopsed the board, because for the AV1 microcode this
+ * register really is LMEM_DUMP_ADR and the hardware DMAs its local-memory dump
+ * to whatever address it holds - writing 0 aims that DMA at physical address 0.
+ * NAL_SEARCH_CTL is an HEVC-era leftover for this microcode.  Do not put a
+ * control value here.
+ */
+
+/* 32 bytes of compressed header per 128x64 block. */
+static u32 comp_header_size(u32 width, u32 height)
+{
+	return 32 * ((width + 127) >> 7) * ((height + 63) >> 6);
+}
+
+/* Main profile at 10 bit.  The double write still lays down rounded NV12. */
+static bool av1_ten_bit;
+
+/* 3200 bytes per 64x32 block at 8 bit (memory saving), 4096 at 10 bit. */
+static u32 comp_body_size(u32 width, u32 height)
+{
+	return (av1_ten_bit ? 4096 : 3200) * ((width + 63) >> 6) * ((height + 31) >> 5);
+}
+
+/*
+ * The compressed-header *allocation* is a fixed size per picture and has
+ * nothing to do with comp_header_size(), which only gives the length written
+ * to HEVC_CM_HEADER_LENGTH.  The reference allocates av1_get_header_size():
+ * 64 KiB up to 1080p, 288 KiB for 4K, 1152 KiB for 8K.  Allocating the
+ * computed length instead lets the hardware write off the end of the buffer -
+ * at 640x480 it filled 4 KiB where the formula says 1280 bytes, and the
+ * overrun landed in kernel page tables.
+ */
+#define AV1_HDR_SIZE_1080P	0x10000
+#define AV1_HDR_SIZE_4K		0x48000
+#define AV1_HDR_SIZE_8K		0x120000
+
+static size_t comp_hdr_alloc_size(u32 width, u32 height)
+{
+	if (width * height > 4096 * 2304)
+		return AV1_HDR_SIZE_8K;
+	if (width * height > 1920 * 1088)
+		return AV1_HDR_SIZE_4K;
+	return AV1_HDR_SIZE_1080P;
+}
+
+static void av1_free_slots(struct aml_vdec_hw *hw)
+{
+	int i;
+
+	for (i = 0; i < AV1_SLOTS; i++) {
+		if (av1_slots[i].body_v)
+			dma_free_coherent(hw->dev, av1_slot_body_size,
+					  av1_slots[i].body_v,
+					  av1_slots[i].body_p);
+		if (av1_slots[i].hdr_v)
+			dma_free_coherent(hw->dev, av1_slot_hdr_size,
+					  av1_slots[i].hdr_v,
+					  av1_slots[i].hdr_p);
+		if (av1_slots[i].mv_v)
+			dma_free_coherent(hw->dev, av1_slot_mv_size,
+					  av1_slots[i].mv_v, av1_slots[i].mv_p);
+		if (av1_slots[i].dw_v)
+			dma_free_noncoherent(hw->dev, av1_slot_dw_size,
+					     av1_slots[i].dw_v,
+					     av1_slots[i].dw_p,
+					     DMA_FROM_DEVICE);
+		memset(&av1_slots[i], 0, sizeof(av1_slots[i]));
+	}
+	av1_slot_body_size = 0;
+	av1_slot_mv_size = 0;
+	av1_slot_hdr_size = 0;
+	av1_slot_dw_size = 0;
+}
+
+static int av1_alloc_slots(struct aml_vdec_hw *hw, u32 width, u32 height)
+{
+	size_t body = ALIGN(comp_body_size(width, height), PAGE_SIZE);
+	/*
+	 * AV1_MV_MEM_UNIT is per 64x64 block whatever the superblock size.
+	 * Counting 128x128 superblocks gave a quarter of the buffer: 76 KiB
+	 * at 1080p where the reference allocates 0x20400, and the overrun
+	 * landed in whatever the allocator put next to it.
+	 */
+	size_t mv = ALIGN(DIV_ROUND_UP(width, 64) * DIV_ROUND_UP(height, 64) *
+			  AV1_MV_MEM_UNIT, PAGE_SIZE);
+	size_t hdr = comp_hdr_alloc_size(width, height);
+	size_t dw = av1_dw_target_y ? 0 : ALIGN(width * height * 3 / 2, SZ_64K);
+	int i;
+
+	if (av1_slots[0].body_v &&
+	    body == av1_slot_body_size &&
+	    mv == av1_slot_mv_size && hdr == av1_slot_hdr_size &&
+	    dw == av1_slot_dw_size)
+		return 0;
+
+	av1_free_slots(hw);
+	av1_slot_body_size = body;
+	av1_slot_mv_size = mv;
+	av1_slot_hdr_size = hdr;
+	av1_slot_dw_size = dw;
+
+	for (i = 0; i < AV1_SLOTS; i++) {
+		av1_slots[i].body_v = dma_alloc_coherent(hw->dev, body,
+							 &av1_slots[i].body_p,
+							 GFP_KERNEL);
+		if (!av1_slots[i].body_v) {
+			av1_free_slots(hw);
+			return -ENOMEM;
+		}
+		av1_slots[i].hdr_v = dma_alloc_coherent(hw->dev, hdr,
+							&av1_slots[i].hdr_p,
+							GFP_KERNEL);
+		av1_slots[i].mv_v = dma_alloc_coherent(hw->dev, mv,
+						       &av1_slots[i].mv_p,
+						       GFP_KERNEL);
+		/*
+		 * The double-write picture is the one buffer the CPU reads
+		 * in bulk, once per frame.  Coherent memory is uncached on
+		 * arm64, and a 3 MB uncached memcpy costs more than the
+		 * decode itself, so take cached memory and invalidate it by
+		 * hand before each read.
+		 */
+		if (dw)
+			av1_slots[i].dw_v =
+				dma_alloc_noncoherent(hw->dev, dw,
+						      &av1_slots[i].dw_p,
+						      DMA_FROM_DEVICE,
+						      GFP_KERNEL);
+		if (!av1_slots[i].hdr_v ||
+		    !av1_slots[i].mv_v || (dw && !av1_slots[i].dw_v)) {
+			av1_free_slots(hw);
+			return -ENOMEM;
+		}
+	}
+
+	dev_info(hw->dev,
+		 "av1: %d slots, body %zu KiB, hdr %zu KiB, mv %zu KiB, dw %zu KiB each\n",
+		 AV1_SLOTS, body / 1024, hdr / 1024, mv / 1024, dw / 1024);
+	return 0;
+}
+
+static void av1_free(struct aml_vdec_hw *hw)
+{
+	av1_free_slots(hw);
+	if (av1_ws.vaddr) {
+		dma_free_coherent(hw->dev, av1_ws.size, av1_ws.vaddr,
+				  av1_ws.paddr);
+		av1_ws.vaddr = NULL;
+	}
+	if (av1_ws.guard_vaddr) {
+		dma_free_coherent(hw->dev, PAGE_SIZE, av1_ws.guard_vaddr,
+				  av1_ws.guard_paddr);
+		av1_ws.guard_vaddr = NULL;
+	}
+	if (av1_ws.side_vaddr) {
+		dma_free_coherent(hw->dev, av1_ws.side_size, av1_ws.side_vaddr,
+				  av1_ws.side_paddr);
+		av1_ws.side_vaddr = NULL;
+	}
+	if (av1_ws.stream_vaddr) {
+		dma_free_coherent(hw->dev, av1_ws.stream_size,
+				  av1_ws.stream_vaddr, av1_ws.stream_paddr);
+		av1_ws.stream_vaddr = NULL;
+	}
+	if (av1_ws.dw_vaddr) {
+		dma_free_coherent(hw->dev, av1_ws.dw_size, av1_ws.dw_vaddr,
+				  av1_ws.dw_paddr);
+		av1_ws.dw_vaddr = NULL;
+	}
+	/* These alias the current slot; the slot pool owns the memory. */
+	av1_ws.body_vaddr = NULL;
+	av1_ws.body_paddr = 0;
+	av1_ws.body_size = 0;
+}
+
+static int av1_alloc(struct aml_vdec_hw *hw)
+{
+	dma_addr_t p;
+	size_t off;
+	int i;
+
+	if (av1_ws.vaddr)
+		return 0;
+
+	/*
+	 * One coherent allocation carved up in the reference's order.  Each
+	 * sub-buffer is page aligned, which the layout below happens to give
+	 * for free but is worth not relying on silently.
+	 */
+	av1_ws.size = ALIGN(AV1_IPP_SIZE + AV1_SHORT_TERM_RPS_SIZE +
+			    AV1_VPS_SIZE + AV1_SEG_MAP_SIZE +
+			    AV1_DAALA_TOP_SIZE + AV1_SWAP_BUF_SIZE +
+			    AV1_CDF_SIZE + AV1_GMC_SIZE + AV1_DBLK_PARA_SIZE +
+			    AV1_DBLK_DATA_SIZE + AV1_CDEF_DATA_SIZE +
+			    AV1_UPS_DATA_SIZE + AV1_FGS_TABLE_SIZE +
+			    AV1_MMU_VBH_SIZE + AV1_MPRED_ABOVE_SIZE,
+			    SZ_64K);
+
+	av1_ws.vaddr = dma_alloc_coherent(hw->dev, av1_ws.size, &av1_ws.paddr,
+					  GFP_KERNEL);
+	if (!av1_ws.vaddr)
+		return -ENOMEM;
+
+	p = av1_ws.paddr;
+	off = 0;
+#define CARVE(field, sz)	do {			\
+		av1_ws.field = p + off;			\
+		off += ALIGN(sz, SZ_4K);		\
+	} while (0)
+	CARVE(ipp, AV1_IPP_SIZE);
+	CARVE(short_term_rps, AV1_SHORT_TERM_RPS_SIZE);
+	CARVE(vps, AV1_VPS_SIZE);
+	CARVE(seg_map, AV1_SEG_MAP_SIZE);
+	CARVE(daala_top, AV1_DAALA_TOP_SIZE);
+	CARVE(swap_buf, AV1_SWAP_BUF_SIZE);
+	CARVE(cdf, AV1_CDF_SIZE);
+	CARVE(gmc, AV1_GMC_SIZE);
+	CARVE(dblk_para, AV1_DBLK_PARA_SIZE);
+	CARVE(dblk_data, AV1_DBLK_DATA_SIZE);
+	CARVE(cdef_data, AV1_CDEF_DATA_SIZE);
+	CARVE(ups_data, AV1_UPS_DATA_SIZE);
+	CARVE(fgs_table, AV1_FGS_TABLE_SIZE);
+	CARVE(mmu_vbh, AV1_MMU_VBH_SIZE);
+	CARVE(mpred_above, AV1_MPRED_ABOVE_SIZE);
+
+	av1_ws.side_size = ALIGN(AV1_RPM_SIZE + AV1_LMEM_SIZE + AV1_PROB_SIZE +
+				 AV1_COUNT_SIZE + AV1_MMU_MAP_SIZE +
+				 AV1_AUX_PREFIX_SIZE + AV1_AUX_SUFFIX_SIZE +
+				 AV1_MV_BUF_SIZE +
+				 AV1_FRAME_BUFFERS * SZ_4K, SZ_64K);
+	av1_ws.side_vaddr = dma_alloc_coherent(hw->dev, av1_ws.side_size,
+					       &av1_ws.side_paddr, GFP_KERNEL);
+	if (!av1_ws.side_vaddr) {
+		av1_free(hw);
+		return -ENOMEM;
+	}
+
+	av1_ws.guard_vaddr = dma_alloc_coherent(hw->dev, PAGE_SIZE,
+						&av1_ws.guard_paddr, GFP_KERNEL);
+	if (!av1_ws.guard_vaddr) {
+		av1_free(hw);
+		return -ENOMEM;
+	}
+
+	p = av1_ws.side_paddr;
+	off = 0;
+	CARVE(rpm, AV1_RPM_SIZE);
+	CARVE(lmem, AV1_LMEM_SIZE);
+	CARVE(prob, AV1_PROB_SIZE);
+	CARVE(count, AV1_COUNT_SIZE);
+	CARVE(mmu_map, AV1_MMU_MAP_SIZE);
+	CARVE(aux, AV1_AUX_PREFIX_SIZE + AV1_AUX_SUFFIX_SIZE);
+	CARVE(mv, AV1_MV_BUF_SIZE);
+	/*
+	 * One compressed-frame header per frame buffer.  At 320x240 each is
+	 * 384 bytes, but the address table wants them 32-byte granular and a
+	 * page each keeps the arithmetic obvious.
+	 */
+	for (i = 0; i < AV1_FRAME_BUFFERS; i++)
+		CARVE(cm_header[i], SZ_4K);
+#undef CARVE
+
+	dev_info(hw->dev,
+		 "av1: workspace %zu KiB at %pad, side %zu KiB at %pad\n",
+		 av1_ws.size / 1024, &av1_ws.paddr,
+		 av1_ws.side_size / 1024, &av1_ws.side_paddr);
+	return 0;
+}
+
+static void wr(struct aml_vdec_hw *hw, u32 reg, u32 val)
+{
+	regmap_write(hw->map[DOS_BUS], reg, val);
+}
+
+/* aom_config_work_space_hw(), front and back together. */
+static void av1_config_workspace(struct aml_vdec_hw *hw, u32 width, u32 height)
+{
+	u32 body = comp_body_size(width, height);
+	u32 header = comp_header_size(width, height);
+	u32 v;
+
+	wr(hw, HEVC_RPM_BUFFER, av1_ws.rpm);
+	wr(hw, LMEM_DUMP_ADR, av1_ws.lmem);
+
+	wr(hw, AOM_AV1_DAALA_TOP_BUFFER, av1_ws.daala_top);
+	wr(hw, AV1_GMC_PARAM_BUFF_ADDR, av1_ws.gmc);
+	wr(hw, HEVC_DBLK_CFG4, av1_ws.dblk_para);
+	wr(hw, HEVC_DBLK_CFG5, av1_ws.dblk_data);
+
+	wr(hw, HEVCD_IPP_LINEBUFF_BASE, av1_ws.ipp);
+	wr(hw, HEVC_DBLK_CFG4, av1_ws.dblk_para);
+	wr(hw, HEVC_DBLK_CFG5, av1_ws.dblk_data);
+	/* Default left-storage split; the 2x4k variant is for >4096x2304. */
+	wr(hw, HEVC_DBLK_CFG3, 0x404010);
+
+	/* bit 4: paged_mem_mode - the MMU path, which AV1 always uses. */
+	wr(hw, HEVCD_MPP_DECOMP_CTL1, BIT(4));
+	/*
+	 * CTL2 is the compressed body size in 32-byte units.  config_sao_hw()
+	 * writes it for every picture in both MMU and linear mode; leaving it
+	 * at zero is harmless while the block only writes, but the MC engine
+	 * reads references back through the same decompressor, so an inter
+	 * frame needs it.
+	 */
+	wr(hw, HEVCD_MPP_DECOMP_CTL2, body >> 5);
+	wr(hw, HEVC_CM_BODY_LENGTH, body);
+	wr(hw, HEVC_CM_HEADER_OFFSET, body);
+	wr(hw, HEVC_CM_HEADER_LENGTH, header);
+
+	wr(hw, HEVC_SAO_MMU_VH0_ADDR, av1_ws.mmu_vbh);
+	wr(hw, HEVC_SAO_MMU_VH1_ADDR, av1_ws.mmu_vbh + AV1_MMU_VBH_SIZE / 2);
+
+	v = read_dos_reg(hw, HEVC_SAO_CTRL5);
+	v |= BIT(10);		/* use HEVC_CM_HEADER_START_ADDR */
+	v &= ~BIT(15);		/* double-write MMU off */
+	wr(hw, HEVC_SAO_CTRL5, v);
+
+	wr(hw, LMEM_DUMP_ADR, av1_ws.lmem);
+	wr(hw, HEVC_SAO_MMU_DMA_CTRL, av1_ws.mmu_map);
+
+	/* Compressed collocated MV, T5D and later - S4 qualifies. */
+	v = read_dos_reg(hw, HEVC_MPRED_CTRL4);
+	v |= BIT(1);
+	wr(hw, HEVC_MPRED_CTRL4, v);
+}
+
+/*
+ * The frame MMU.  Compressed picture bodies are not written to a contiguous
+ * buffer: the decoder walks a page table whose entries are plain page frame
+ * numbers, one per 4 KiB of body, and HEVC_SAO_MMU_DMA_CTRL points at that
+ * table.  Mainline does exactly this in codec_hevc_fill_mmu_map() for VP9 and
+ * HEVC; the reference AV1 driver reaches the same result through its MMU box
+ * allocator, which hands out scattered pages.  Contiguous pages are used here
+ * because it makes the table trivially correct and one keyframe needs 125 KiB.
+ *
+ * Leaving this table zeroed - which is what the previous attempt did - gives
+ * the decoder page frame 0 for every page of the picture.  The front end still
+ * reads the stream, but nothing can be written back, and that is exactly the
+ * symptom that was observed: shift count advancing, RPM and LMEM staying empty.
+ */
+static int av1_fill_mmu_map(struct aml_vdec_hw *hw, u32 width, u32 height)
+{
+	u32 *map;
+	u32 pages, first, i;
+
+	/*
+	 * The picture being written is the current slot's body, not the old
+	 * single body buffer - that one went away when the slot pool landed.
+	 * Keep the workspace aliases pointing at it so the debug dump below
+	 * and this table cannot disagree again.
+	 */
+	struct av1_slot *slot = &av1_slots[av1_cur_slot];
+
+	av1_ws.body_vaddr = slot->body_v;
+	av1_ws.body_paddr = slot->body_p;
+	if (!slot->body_v)
+		return -EINVAL;
+	av1_ws.body_size = av1_slot_body_size;
+
+	pages = av1_ws.body_size / PAGE_SIZE;
+	if (!pages || pages * sizeof(u32) > AV1_MMU_MAP_SIZE)
+		return -EINVAL;
+
+	/*
+	 * The previous picture may have run past its body.  Whatever it wrote
+	 * there landed in the guard page, not in page frame 0 or in a body
+	 * freed by a resolution change.
+	 */
+	if (memchr_inv(av1_ws.guard_vaddr, 0, PAGE_SIZE)) {
+		dev_warn_ratelimited(hw->dev,
+				     "av1: frame MMU overflow past %zu KiB body\n",
+				     av1_ws.body_size / 1024);
+		memset(av1_ws.guard_vaddr, 0, PAGE_SIZE);
+	}
+
+	map = av1_ws.side_vaddr + (av1_ws.mmu_map - av1_ws.side_paddr);
+	first = av1_ws.body_paddr >> PAGE_SHIFT;
+	for (i = 0; i < pages; i++)
+		map[i] = first + i;
+	for (; i < AV1_MMU_MAP_SIZE / sizeof(u32); i++)
+		map[i] = av1_ws.guard_paddr >> PAGE_SHIFT;
+
+	dev_dbg(hw->dev,
+		"av1: mmu map %u pages from pfn %08x, body %zu KiB at %pad\n",
+		 pages, first, av1_ws.body_size / 1024, &av1_ws.body_paddr);
+	return 0;
+}
+
+/*
+ * The microcode keeps each picture's global motion in the GMC buffer, one
+ * 128-byte record per picture slot, and an inter frame reads its primary
+ * reference's record as PrevGmParams.  It only writes records for inter
+ * frames, though: after a key frame the slot still holds whatever was there
+ * - zeros on a fresh workspace - instead of the identity models the spec
+ * saves for an intra frame, and every global-motion parameter of the next
+ * frame is then decoded against the wrong reference.  Write the identity
+ * record here; the layout is what the microcode itself stores for a frame
+ * whose seven references all use identity, two identical 64-byte halves.
+ */
+#define AV1_GMC_RECORD		0x80
+
+static void av1_reset_gmc(int slot)
+{
+	static const u32 identity[16] = {
+		0, 0, 0, 0, 0, 0, 0, 0,
+		0x00000100, 0x00000001, 0, 0,
+		0x00010000, 0x00000100, 0x01000001, 0x00010000,
+	};
+	u8 *rec = av1_ws.vaddr + (av1_ws.gmc - av1_ws.paddr) +
+		  slot * AV1_GMC_RECORD;
+
+	if ((slot + 1) * AV1_GMC_RECORD > AV1_GMC_SIZE)
+		return;
+	memcpy(rec, identity, sizeof(identity));
+	memcpy(rec + sizeof(identity), identity, sizeof(identity));
+}
+
+/*
+ * init_pic_list_hw() plus config_aux_buf().  In MMU mode the address table
+ * holds each picture's compressed-header address shifted right by 5, and the
+ * canvas table is zeroed so it holds defined values.  Without this the
+ * microcode has nowhere to put a decoded picture.
+ */
+static void av1_config_pic_list(struct aml_vdec_hw *hw)
+{
+	int i;
+
+	/*
+	 * The table is written with AV1_FRAME_BUFFERS entries, the length the
+	 * reference uses and the length the verified key-frame configuration
+	 * used.  There are only AV1_SLOTS real pictures, so the tail repeats
+	 * slot 0; nothing addresses those indices.
+	 */
+	wr(hw, HEVCD_MPP_ANC2AXI_TBL_CONF_ADDR, BIT(1) | BIT(2));
+	for (i = 0; i < AV1_FRAME_BUFFERS; i++)
+		wr(hw, HEVCD_MPP_ANC2AXI_TBL_DATA,
+		   av1_slots[i < AV1_SLOTS ? i : 0].hdr_p >> 5);
+	wr(hw, HEVCD_MPP_ANC2AXI_TBL_CONF_ADDR, BIT(0));
+
+	wr(hw, HEVCD_MPP_ANC_CANVAS_ACCCONFIG_ADDR, (1 << 8) | BIT(0));
+	for (i = 0; i < 32; i++)
+		wr(hw, HEVCD_MPP_ANC_CANVAS_DATA_ADDR, 0);
+
+	wr(hw, HEVC_AUX_ADR, av1_ws.aux);
+	wr(hw, HEVC_AUX_DATA_SIZE,
+	   ((AV1_AUX_PREFIX_SIZE >> 4) << 16) | (AV1_AUX_SUFFIX_SIZE >> 4));
+}
+
+/* aom_init_decoder_hw(), front and back together. */
+static void av1_init_decoder(struct aml_vdec_hw *hw)
+{
+	u32 v;
+	int i;
+
+	v = read_dos_reg(hw, HEVC_PARSER_INT_CONTROL);
+	v &= 0x03ffffff;
+	v |= (3 << 29) |	/* stream_buffer_empty_int_ctl */
+	     (3 << 26) |	/* stream_fifo_empty_int_ctl */
+	     (1 << 24) |	/* stream_buffer_empty_int_amrisc_enable */
+	     (1 << 22) |	/* stream_fifo_empty_int_amrisc_enable */
+	     (1 << 7)  |	/* dec_done_int_cpu_enable */
+	     (1 << 4)  |	/* startcode_found_int_cpu_enable */
+	     (1 << 0);		/* parser_int_enable */
+	wr(hw, HEVC_PARSER_INT_CONTROL, v);
+
+	/* AV1 carries no emulation prevention, so only startcode check is on. */
+	v = read_dos_reg(hw, HEVC_SHIFT_STATUS);
+	v |= BIT(0);
+	wr(hw, HEVC_SHIFT_STATUS, v);
+
+	wr(hw, HEVC_SHIFT_CONTROL,
+	   (1 << 10) |	/* length_zero_startcode_en, AV1 */
+	   (1 << 9)  |	/* length_valid_startcode_en, AV1 */
+	   (3 << 6)  |	/* sft_valid_wr_position */
+	   (2 << 4)  |	/* emulate_code_length_sub_1 */
+	   (3 << 1)  |	/* start_code_length_sub_1: AV1 uses a 4-byte code */
+	   (1 << 0));	/* stream_shift_enable */
+
+	wr(hw, HEVC_CABAC_CONTROL, BIT(0));
+	wr(hw, HEVC_PARSER_CORE_CONTROL, BIT(0));
+	wr(hw, HEVC_DEC_STATUS_REG, 0);
+
+	/* Clear IQIT scale lookup so it holds defined values. */
+	wr(hw, HEVC_IQIT_SCALELUT_WR_ADDR, 0);
+	for (i = 0; i < 1024; i++)
+		wr(hw, HEVC_IQIT_SCALELUT_DATA, 0);
+
+	wr(hw, DECODE_MODE, DECODE_MODE_MULTI_FRAMEBASE);
+	wr(hw, HEVC_DECODE_SIZE, 0);
+	wr(hw, HEVC_DECODE_COUNT, 0);
+
+	wr(hw, HEVC_PARSER_CMD_WRITE, BIT(16));
+	for (i = 0; i < AV1_PARSER_CMD_NUMBER; i++)
+		wr(hw, HEVC_PARSER_CMD_WRITE, av1_parser_cmd[i]);
+	wr(hw, HEVC_PARSER_CMD_SKIP_0, PARSER_CMD_SKIP_CFG_0);
+	wr(hw, HEVC_PARSER_CMD_SKIP_1, PARSER_CMD_SKIP_CFG_1);
+	wr(hw, HEVC_PARSER_CMD_SKIP_2, PARSER_CMD_SKIP_CFG_2);
+
+	wr(hw, HEVC_PARSER_IF_CONTROL,
+	   (1 << 5) |	/* parser_sao_if_en */
+	   (1 << 2) |	/* parser_mpred_if_en */
+	   (1 << 0));	/* parser_scaler_if_en */
+
+	/* Reset IPP/MPP, then enable in AV1 mode (3 << 4). */
+	wr(hw, HEVCD_IPP_TOP_CNTL, BIT(0));
+	wr(hw, HEVCD_IPP_TOP_CNTL, (3 << 4) | BIT(1));
+}
+
+/* The tail of vav1_prot_init(): stream front end and mailbox. */
+static void av1_prot_init(struct aml_vdec_hw *hw)
+{
+	/*
+	 * Deliberately NOT enabling stream fetch here.  The reference reaches
+	 * it through vdec_enable_input(), which run() calls *after* the FIFO
+	 * pointers have been programmed.  Turning fetch on first lets the
+	 * shifter run against whatever pointers happen to be in the registers:
+	 * the read pointer then comes back a kilobyte into the buffer, the
+	 * microcode searches from there, finds no frame header in what is left
+	 * and answers AOM_NAL_DECODE_DONE - packet finished, nothing found.
+	 * aml_av1_feed() enables fetch, with the endian bits, once the pointers
+	 * are right.
+	 */
+	wr(hw, HEVC_SHIFT_STARTCODE, 0x00000001);
+	wr(hw, HEVC_SHIFT_EMULATECODE, 0x00000300);
+	wr(hw, HEVC_WAIT_FLAG, 1);
+
+	wr(hw, HEVC_ASSIST_MBOX0_CLR_REG, 1);
+	wr(hw, HEVC_ASSIST_MBOX0_MASK, 1);
+
+	wr(hw, HEVC_PSCALE_CTRL, 0);
+	wr(hw, DEBUG_REG1, 0);
+	/* Overwrites the lmem address written above - see the note in av1.h. */
+	wr(hw, NAL_SEARCH_CTL, 0x8);
+	wr(hw, DECODE_STOP_POS, 0);
+}
+
+/*
+ * Both codecs on the HEVC core keep their state in the same scratch
+ * registers, and they do not use the same ones: whatever the previous
+ * microcode left in a register this one does not program is read as a
+ * pointer or a command.  Decoding VP9 and then AV1 in one module lifetime
+ * timed out on every AV1 frame until these were cleared first.
+ *
+ * SCRATCH_0 (the status register) and SCRATCH_1 (the RPM buffer) are left
+ * alone - both are programmed unconditionally right after this.
+ */
+static void hevc_clear_scratch(struct aml_vdec_hw *hw)
+{
+	int i;
+
+	for (i = 2; i <= 0xf; i++)
+		regmap_write(hw->map[DOS_BUS], REG_ALIGN(0x30c0 + i), 0);
+}
+
+int aml_av1_bringup(struct aml_vdec_hw *hw, u32 width, u32 height)
+{
+	int ret;
+
+	hevc_clear_scratch(hw);
+	ret = av1_alloc(hw);
+	if (ret)
+		return ret;
+
+	/*
+	 * The MMU page table and the compressed body are deliberately NOT set
+	 * up here: this runs before anything has been parsed, so the size
+	 * passed in is only a guess.  They are sized from the microcode's own
+	 * parsed dimensions in aml_av1_config_picture() instead.  Sizing them
+	 * from a guess is how a 640x480 stream ends up with a page table built
+	 * for 320x240 and the decoder writing past the end of it.
+	 */
+	av1_config_workspace(hw, width, height);
+	av1_config_pic_list(hw);
+	av1_init_decoder(hw);
+	av1_prot_init(hw);
+
+	return 0;
+}
+
+/*
+ * The microcode does not eat a low-overhead OBU stream directly.  Amlogic's own
+ * V4L2 glue (vdec_av1_if.c, parser_frame()) rewrites it: every OBU gets a
+ * 20-byte header in front of it, and the OBU itself follows unchanged.
+ *
+ *   [0..3]   big endian (obu_size + 4)
+ *   [4..7]   ones complement of [0..3]
+ *   [8..11]  00 00 00 01      <- the start code HEVC_SHIFT_STARTCODE hunts for
+ *   [12..15] 'A' 'M' 'L' 'V'
+ *   [16..19] obu_size as a four-byte LEB128, continuation bits set
+ *
+ * where obu_size is the OBU's own header plus its size field plus its payload,
+ * plus four.  Without those start codes the shifter finds nothing and the
+ * microcode answers AOM_NAL_DECODE_DONE - packet consumed, no header seen -
+ * which is exactly what a raw OBU stream produced here.
+ */
+#define AV1_AMLV_HEADER_SIZE	20
+
+static int av1_read_leb128(const u8 *p, size_t avail, u64 *val, size_t *len)
+{
+	u64 v = 0;
+	size_t i;
+
+	for (i = 0; i < 8 && i < avail; i++) {
+		v |= (u64)(p[i] & 0x7f) << (i * 7);
+		if (!(p[i] & 0x80)) {
+			*val = v;
+			*len = i + 1;
+			return 0;
+		}
+	}
+	return -EINVAL;
+}
+
+static int av1_reframe(struct aml_vdec_hw *hw, const u8 *src, size_t len,
+		       u8 *dst, size_t dst_cap, size_t *out_len)
+{
+	size_t pos = 0, outp = 0, obus = 0;
+
+	while (pos < len) {
+		size_t hdr_len = 1, size_len = 0, consumed, total;
+		u64 payload;
+		u32 obu_size;
+		u8 h[AV1_AMLV_HEADER_SIZE] = { 0 };
+
+		bool synth = false;
+		u8 obu_hdr[2];
+		u8 leb[8];
+		size_t leb_len = 0;
+
+		if (src[pos] & 0x04)		/* obu_extension_flag */
+			hdr_len = 2;
+		if (pos + hdr_len > len)
+			return -EINVAL;
+
+		if (src[pos] & 0x02) {
+			if (pos + hdr_len >= len)
+				return -EINVAL;
+			if (av1_read_leb128(src + pos + hdr_len,
+					    len - pos - hdr_len,
+					    &payload, &size_len))
+				return -EINVAL;
+			consumed = hdr_len + size_len;
+			total = consumed + payload;
+			if (pos + total > len)
+				return -EINVAL;
+		} else {
+			/*
+			 * Low-overhead bitstream format: obu_has_size_field is
+			 * clear and the payload runs to the end of the buffer.
+			 * This is what the V4L2 stateless AV1 API delivers, and
+			 * what GStreamer's v4l2slav1dec sends.  Give the OBU an
+			 * explicit size so the microcode sees the same shape it
+			 * already handles.
+			 */
+			u64 v;
+
+			payload = len - pos - hdr_len;
+			obu_hdr[0] = src[pos] | 0x02;
+			if (hdr_len == 2)
+				obu_hdr[1] = src[pos + 1];
+			v = payload;
+			do {
+				leb[leb_len] = v & 0x7f;
+				v >>= 7;
+				if (v)
+					leb[leb_len] |= 0x80;
+				leb_len++;
+			} while (v && leb_len < sizeof(leb));
+			consumed = hdr_len + leb_len;
+			total = consumed + payload;
+			synth = true;
+		}
+
+		obu_size = total + 4;
+		if (outp + AV1_AMLV_HEADER_SIZE + total > dst_cap)
+			return -ENOSPC;
+
+		h[0] = (obu_size + 4) >> 24;
+		h[1] = (obu_size + 4) >> 16;
+		h[2] = (obu_size + 4) >> 8;
+		h[3] = (obu_size + 4);
+		h[4] = h[0] ^ 0xff;
+		h[5] = h[1] ^ 0xff;
+		h[6] = h[2] ^ 0xff;
+		h[7] = h[3] ^ 0xff;
+		h[11] = 1;
+		h[12] = 'A';
+		h[13] = 'M';
+		h[14] = 'L';
+		h[15] = 'V';
+		h[16] = (obu_size & 0x7f) | 0x80;
+		h[17] = ((obu_size >> 7) & 0x7f) | 0x80;
+		h[18] = ((obu_size >> 14) & 0x7f) | 0x80;
+		h[19] = (obu_size >> 21) & 0x7f;
+
+		dev_dbg(hw->dev,
+			"av1:   obu type %u at %zu, payload %llu%s\n",
+			 (src[pos] >> 3) & 0xf, pos, payload,
+			 synth ? " (size synthesised)" : "");
+
+		memcpy(dst + outp, h, AV1_AMLV_HEADER_SIZE);
+		outp += AV1_AMLV_HEADER_SIZE;
+		if (synth) {
+			memcpy(dst + outp, obu_hdr, hdr_len);
+			outp += hdr_len;
+			memcpy(dst + outp, leb, leb_len);
+			outp += leb_len;
+			memcpy(dst + outp, src + pos + hdr_len, payload);
+			outp += payload;
+			pos = len;
+		} else {
+			memcpy(dst + outp, src + pos, total);
+			outp += total;
+			pos += total;
+		}
+		obus++;
+	}
+
+	dev_dbg(hw->dev, "av1: reframed %zu OBUs, %zu -> %zu bytes\n",
+		obus, len, outp);
+	*out_len = outp;
+	return 0;
+}
+
+/*
+ * Hand the microcode one temporal unit and tell it to go.  This mirrors the
+ * frame-based branch of the reference's run() - stream FIFO, then
+ * HEVC_ACTION_DONE, shift count cleared, decode size, and only then the core is
+ * released by the caller.
+ *
+ * The FIFO end pointer bounds the *FIFO*, not the payload.  Ending it at the
+ * payload puts the write pointer outside the ring and the microcode waits
+ * forever; that exact mistake cost this driver weeks on the H.264 side.
+ */
+/*
+ * The sequence header, cached from the stream.
+ *
+ * The microcode is restarted for every OUTPUT buffer, and a restart loses
+ * everything it learned from the sequence header - a buffer carrying only a
+ * frame OBU then parses to a zero picture size.  Real streams repeat the
+ * sequence header rarely (often only once, before the first key frame), so
+ * remember it here and put it in front of every buffer that does not carry
+ * one of its own.
+ */
+static u8 av1_seq_obu[192];
+static size_t av1_seq_len;
+
+static void av1_cache_seq_header(const u8 *src, size_t len)
+{
+	size_t pos = 0;
+
+	while (pos < len) {
+		size_t hdr_len = 1, j;
+		u64 payload;
+		int type = (src[pos] >> 3) & 0xf;
+
+		if (src[pos] & 0x04)
+			hdr_len = 2;
+		if (!(src[pos] & 0x02)) {
+			/* no size field: this OBU runs to the end */
+			if (type == 1 && len - pos <= sizeof(av1_seq_obu)) {
+				av1_seq_len = len - pos;
+				memcpy(av1_seq_obu, src + pos, av1_seq_len);
+			}
+			return;
+		}
+		if (pos + hdr_len >= len)
+			return;
+		j = pos + hdr_len;
+		if (av1_read_leb128(src + j, len - j, &payload, &hdr_len))
+			return;
+		j += hdr_len;
+		if (j + payload > len)
+			return;
+		if (type == 1 && j + payload - pos <= sizeof(av1_seq_obu)) {
+			av1_seq_len = j + payload - pos;
+			memcpy(av1_seq_obu, src + pos, av1_seq_len);
+			return;
+		}
+		pos = j + payload;
+	}
+}
+
+static bool av1_has_seq_header(const u8 *src, size_t len)
+{
+	size_t pos = 0;
+
+	while (pos < len) {
+		size_t hdr_len = 1, j;
+		u64 payload;
+
+		if (((src[pos] >> 3) & 0xf) == 1)
+			return true;
+		if (src[pos] & 0x04)
+			hdr_len = 2;
+		if (!(src[pos] & 0x02) || pos + hdr_len >= len)
+			return false;
+		j = pos + hdr_len;
+		if (av1_read_leb128(src + j, len - j, &payload, &hdr_len))
+			return false;
+		pos = j + hdr_len + payload;
+	}
+	return false;
+}
+
+/*
+ * Build a sequence header OBU from V4L2_CID_STATELESS_AV1_SEQUENCE.
+ *
+ * The V4L2 stateless AV1 API hands the decoder a frame's OBU payload and keeps
+ * the sequence in a control, but this hardware parses the bitstream itself and
+ * cannot start without a real sequence header.  Writing one back out from the
+ * control is what bridges the two.  Follows AV1 spec 5.5.1; seq_level_idx and
+ * the operating point are not in the control, and nothing here depends on
+ * them, so they are written as zero.
+ */
+struct av1_bitwriter {
+	u8 *buf;
+	size_t cap;
+	size_t bit;
+};
+
+static void av1_wr_bits(struct av1_bitwriter *w, u32 val, int n)
+{
+	while (n--) {
+		size_t byte = w->bit >> 3;
+		int shift = 7 - (w->bit & 7);
+
+		if (byte >= w->cap)
+			return;
+		if ((val >> n) & 1)
+			w->buf[byte] |= 1 << shift;
+		else
+			w->buf[byte] &= ~(1 << shift);
+		w->bit++;
+	}
+}
+
+static int av1_bits_for(u32 v)
+{
+	int n = 1;
+
+	while (v >> n)
+		n++;
+	return n;
+}
+
+static size_t av1_build_sequence_obu(const struct v4l2_ctrl_av1_sequence *sq,
+				     u8 *out, size_t cap)
+{
+	struct av1_bitwriter w = { .buf = out + 2, .cap = cap - 2 };
+	u32 f = sq->flags;
+	bool reduced = false;
+	bool order_hint = f & V4L2_AV1_SEQUENCE_FLAG_ENABLE_ORDER_HINT;
+	bool mono = f & V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME;
+	int wbits = av1_bits_for(sq->max_frame_width_minus_1);
+	int hbits = av1_bits_for(sq->max_frame_height_minus_1);
+	size_t payload;
+
+	memset(out, 0, cap);
+
+	av1_wr_bits(&w, sq->seq_profile, 3);
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE), 1);
+	av1_wr_bits(&w, reduced, 1);
+
+	av1_wr_bits(&w, 0, 1);		/* timing_info_present_flag */
+	av1_wr_bits(&w, 0, 1);		/* initial_display_delay_present */
+	av1_wr_bits(&w, 0, 5);		/* operating_points_cnt_minus_1 */
+	av1_wr_bits(&w, 0, 12);		/* operating_point_idc[0] */
+	av1_wr_bits(&w, 0, 5);		/* seq_level_idx[0], <= 7 so no tier */
+
+	av1_wr_bits(&w, wbits - 1, 4);
+	av1_wr_bits(&w, hbits - 1, 4);
+	av1_wr_bits(&w, sq->max_frame_width_minus_1, wbits);
+	av1_wr_bits(&w, sq->max_frame_height_minus_1, hbits);
+
+	av1_wr_bits(&w, 0, 1);		/* frame_id_numbers_present_flag */
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK), 1);
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_ENABLE_FILTER_INTRA), 1);
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTRA_EDGE_FILTER), 1);
+
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTERINTRA_COMPOUND), 1);
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND), 1);
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_ENABLE_WARPED_MOTION), 1);
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_ENABLE_DUAL_FILTER), 1);
+	av1_wr_bits(&w, order_hint, 1);
+	if (order_hint) {
+		av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_ENABLE_JNT_COMP), 1);
+		av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_ENABLE_REF_FRAME_MVS), 1);
+	}
+	av1_wr_bits(&w, 1, 1);		/* seq_choose_screen_content_tools */
+	av1_wr_bits(&w, 1, 1);		/* seq_choose_integer_mv */
+	if (order_hint)
+		av1_wr_bits(&w, sq->order_hint_bits - 1, 3);
+
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_ENABLE_SUPERRES), 1);
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF), 1);
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_ENABLE_RESTORATION), 1);
+
+	/* color_config() */
+	av1_wr_bits(&w, sq->bit_depth > 8, 1);		/* high_bitdepth */
+	if (sq->seq_profile == 2 && sq->bit_depth > 8)
+		av1_wr_bits(&w, sq->bit_depth == 12, 1);
+	if (sq->seq_profile != 1)
+		av1_wr_bits(&w, mono, 1);
+	av1_wr_bits(&w, 0, 1);		/* color_description_present_flag */
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_COLOR_RANGE), 1);
+	if (!mono) {
+		bool ssx = f & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X;
+		bool ssy = f & V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y;
+
+		if (sq->seq_profile == 2 && sq->bit_depth == 12) {
+			av1_wr_bits(&w, ssx, 1);
+			if (ssx)
+				av1_wr_bits(&w, ssy, 1);
+		}
+		if (ssx && ssy)
+			av1_wr_bits(&w, 0, 2);	/* chroma_sample_position */
+		av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q), 1);
+	}
+
+	av1_wr_bits(&w, !!(f & V4L2_AV1_SEQUENCE_FLAG_FILM_GRAIN_PARAMS_PRESENT), 1);
+
+	av1_wr_bits(&w, 1, 1);		/* trailing one bit */
+	while (w.bit & 7)
+		av1_wr_bits(&w, 0, 1);
+
+	payload = w.bit >> 3;
+	if (payload > 127)
+		return 0;		/* would need a longer size field */
+
+	out[0] = 0x0a;			/* OBU_SEQUENCE_HEADER, has_size */
+	out[1] = payload;
+	return payload + 2;
+}
+
+static int av1_alloc_stream(struct aml_vdec_hw *hw, size_t size);
+static int av1_program_fifo(struct aml_vdec_hw *hw, u32 kick, size_t *unused);
+
+/*
+ * Emit one AMLV-framed OBU built from a header and a separate payload.  The
+ * V4L2 stateless API delivers the frame OBU's *payload* with the OBU header
+ * stripped, so the header has to be put back without copying the payload
+ * twice.
+ */
+static int av1_emit_obu(u8 *dst, size_t cap, const u8 *hdr, size_t hdr_len,
+			const u8 *payload, size_t payload_len, size_t *outp)
+{
+	u8 h[AV1_AMLV_HEADER_SIZE] = { 0 };
+	u32 obu_size = hdr_len + payload_len + 4;
+
+	if (*outp + AV1_AMLV_HEADER_SIZE + hdr_len + payload_len > cap)
+		return -ENOSPC;
+
+	h[0] = (obu_size + 4) >> 24;
+	h[1] = (obu_size + 4) >> 16;
+	h[2] = (obu_size + 4) >> 8;
+	h[3] = (obu_size + 4);
+	h[4] = h[0] ^ 0xff;
+	h[5] = h[1] ^ 0xff;
+	h[6] = h[2] ^ 0xff;
+	h[7] = h[3] ^ 0xff;
+	h[11] = 1;
+	h[12] = 'A';
+	h[13] = 'M';
+	h[14] = 'L';
+	h[15] = 'V';
+	h[16] = (obu_size & 0x7f) | 0x80;
+	h[17] = ((obu_size >> 7) & 0x7f) | 0x80;
+	h[18] = ((obu_size >> 14) & 0x7f) | 0x80;
+	h[19] = (obu_size >> 21) & 0x7f;
+
+	memcpy(dst + *outp, h, AV1_AMLV_HEADER_SIZE);
+	*outp += AV1_AMLV_HEADER_SIZE;
+	memcpy(dst + *outp, hdr, hdr_len);
+	*outp += hdr_len;
+	memcpy(dst + *outp, payload, payload_len);
+	*outp += payload_len;
+	return 0;
+}
+
+/*
+ * Feed one frame the way the V4L2 stateless API delivers it: the sequence
+ * header rebuilt from the control, then the frame OBU reassembled from its
+ * payload.
+ */
+int aml_av1_feed_frame(struct aml_vdec_hw *hw, const void *data, size_t size)
+{
+	u8 fh[8];
+	size_t hdr_len = 0, outp = 0, dummy;
+	u64 v = size;
+	int ret;
+
+	av1_stateless = true;
+
+	ret = av1_alloc_stream(hw, size);
+	if (ret)
+		return ret;
+
+	memset(av1_ws.stream_vaddr, 0, av1_ws.stream_size);
+
+	if (av1_seq_len) {
+		ret = av1_reframe(hw, av1_seq_obu, av1_seq_len,
+				  av1_ws.stream_vaddr,
+				  av1_ws.stream_size - HEVC_PADDING_SIZE,
+				  &outp);
+		if (ret)
+			return ret;
+	}
+
+	fh[hdr_len++] = 0x32;		/* OBU_FRAME, has_size_field */
+	do {
+		fh[hdr_len] = v & 0x7f;
+		v >>= 7;
+		if (v)
+			fh[hdr_len] |= 0x80;
+		hdr_len++;
+	} while (v && hdr_len < sizeof(fh));
+
+	ret = av1_emit_obu(av1_ws.stream_vaddr,
+			   av1_ws.stream_size - HEVC_PADDING_SIZE,
+			   fh, hdr_len, data, size, &outp);
+	if (ret)
+		return ret;
+
+	av1_ws.payload = outp;
+	dummy = 0;
+	return av1_program_fifo(hw, AOM_AV1_SEARCH_HEAD, &dummy);
+}
+
+bool aml_av1_have_sequence(void)
+{
+	return av1_seq_len != 0;
+}
+
+/* Rebuild the cached sequence header from the V4L2 control. */
+bool aml_av1_set_sequence(const void *ctrl)
+{
+	const struct v4l2_ctrl_av1_sequence *sq = ctrl;
+	size_t n;
+
+	if (!sq || !sq->max_frame_width_minus_1 || !sq->max_frame_height_minus_1)
+		return false;
+
+	n = av1_build_sequence_obu(sq, av1_seq_obu, sizeof(av1_seq_obu));
+	if (!n)
+		return false;
+	av1_seq_len = n;
+	return true;
+}
+
+bool av1_buf_has_sequence(const void *data, size_t size)
+{
+	return data && av1_has_seq_header(data, size);
+}
+
+static int av1_alloc_stream(struct aml_vdec_hw *hw, size_t size)
+{
+	/*
+	 * The reframed stream is 20 bytes per OBU larger than the input and
+	 * needs the FIFO padding after it, so size the buffer from the input
+	 * rather than fixing it: a large temporal unit would otherwise be
+	 * rejected outright.
+	 */
+	size_t need = ALIGN(size + size / 8 + HEVC_PADDING_SIZE +
+			    VLD_PADDING_SIZE, SZ_1M);
+
+	if (av1_ws.stream_vaddr && av1_ws.stream_size < need) {
+		dma_free_coherent(hw->dev, av1_ws.stream_size,
+				  av1_ws.stream_vaddr, av1_ws.stream_paddr);
+		av1_ws.stream_vaddr = NULL;
+	}
+	if (!av1_ws.stream_vaddr) {
+		av1_ws.stream_size = need;
+		av1_ws.stream_vaddr = dma_alloc_coherent(hw->dev,
+							 av1_ws.stream_size,
+							 &av1_ws.stream_paddr,
+							 GFP_KERNEL);
+		if (!av1_ws.stream_vaddr)
+			return -ENOMEM;
+	}
+	return 0;
+}
+
+static int av1_program_fifo(struct aml_vdec_hw *hw, u32 kick, size_t *unused)
+{
+	size_t dummy;
+	u32 v;
+
+	/*
+	 * Exactly what vdec.c does for a frame-based HEVC target: the FIFO
+	 * spans the whole block, the read pointer sits at the chunk and the
+	 * write pointer is parked a padding length past its end.
+	 */
+	dummy = av1_ws.payload + HEVC_PADDING_SIZE;
+	if (dummy >= av1_ws.stream_size)
+		dummy -= av1_ws.stream_size;
+
+	wr(hw, HEVC_STREAM_START_ADDR, av1_ws.stream_paddr);
+	wr(hw, HEVC_STREAM_END_ADDR,
+	   av1_ws.stream_paddr + av1_ws.stream_size);
+	wr(hw, HEVC_STREAM_RD_PTR, av1_ws.stream_paddr);
+	wr(hw, HEVC_STREAM_WR_PTR,
+	   round_down(av1_ws.stream_paddr + dummy, VDEC_FIFO_ALIGN));
+
+	/*
+	 * Endian control for the non-parser path.  Without these three bits the
+	 * shifter reads the buffer in the wrong byte order: it still consumes
+	 * bytes, so the shift count advances and everything looks alive, but
+	 * nothing the microcode sees parses and it reports HEVC_ACTION_DONE
+	 * within ten microseconds.  vdec_enable_input() sets them for every
+	 * frame-based HEVC target.
+	 */
+	v = read_dos_reg(hw, HEVC_STREAM_CONTROL);
+	v &= ~(7 << 4);
+	v |= (7 << 4) | BIT(0);
+	wr(hw, HEVC_STREAM_CONTROL, v);
+	v = read_dos_reg(hw, HEVC_STREAM_FIFO_CTL);
+	v |= BIT(29);
+	wr(hw, HEVC_STREAM_FIFO_CTL, v);
+
+	wr(hw, HEVC_DEC_STATUS_REG, kick);
+	wr(hw, HEVC_SHIFT_BYTE_COUNT, 0);
+	wr(hw, HEVC_DECODE_SIZE, av1_ws.payload);
+	wr(hw, HEVC_DECODE_COUNT, 0);
+	wr(hw, LMEM_DUMP_ADR, av1_ws.lmem);
+
+	dev_dbg(hw->dev, "av1: fed %zu bytes at %pad, fifo %zu KiB, kick %02x, endian %d\n",
+		av1_ws.payload, &av1_ws.stream_paddr,
+		 av1_ws.stream_size / 1024, kick, 7);
+	return 0;
+}
+
+int aml_av1_feed_buf(struct aml_vdec_hw *hw, const void *data, size_t size,
+		     u32 kick)
+{
+	size_t dummy = 0;
+	int ret;
+
+	av1_stateless = false;
+
+	/*
+	 * The reframed stream is 20 bytes per OBU larger than the input and
+	 * needs the FIFO padding after it, so size the buffer from the input
+	 * rather than fixing it: a large temporal unit would otherwise be
+	 * rejected outright.
+	 */
+	ret = av1_alloc_stream(hw, size);
+	if (ret)
+		return ret;
+
+	memset(av1_ws.stream_vaddr, 0, av1_ws.stream_size);
+
+	dev_dbg(hw->dev, "av1: feed %zu bytes, first 24: %*ph\n",
+		size, 24, (const u8 *)data);
+
+	if (av1_has_seq_header(data, size)) {
+		av1_cache_seq_header(data, size);
+		av1_ws.payload = 0;
+	} else if (av1_seq_len) {
+		ret = av1_reframe(hw, av1_seq_obu, av1_seq_len,
+				  av1_ws.stream_vaddr,
+				  av1_ws.stream_size - HEVC_PADDING_SIZE,
+				  &av1_ws.payload);
+		if (ret)
+			return ret;
+	} else {
+		av1_ws.payload = 0;
+	}
+
+	{
+		size_t n = 0;
+
+		ret = av1_reframe(hw, data, size,
+				  av1_ws.stream_vaddr + av1_ws.payload,
+				  av1_ws.stream_size - HEVC_PADDING_SIZE -
+					  av1_ws.payload, &n);
+		if (ret)
+			return ret;
+		av1_ws.payload += n;
+	}
+
+	return av1_program_fifo(hw, kick, &dummy);
+}
+
+/* The probe harness feeds a file; the V4L2 path feeds an OUTPUT buffer. */
+int aml_av1_feed(struct aml_vdec_hw *hw, const char *fw_name, u32 kick)
+{
+	const struct firmware *fw;
+	int ret;
+
+	ret = request_firmware(&fw, fw_name, hw->dev);
+	if (ret) {
+		dev_err(hw->dev, "av1: test stream %s not found (%d)\n",
+			fw_name, ret);
+		return ret;
+	}
+	ret = aml_av1_feed_buf(hw, fw->data, fw->size, kick);
+	release_firmware(fw);
+	return ret;
+}
+
+void aml_av1_dump_stream_state(struct aml_vdec_hw *hw)
+{
+	dev_info(hw->dev,
+		 "av1: fifo start %08x end %08x rd %08x wr %08x level %08x shifted %08x\n",
+		 read_dos_reg(hw, HEVC_STREAM_START_ADDR),
+		 read_dos_reg(hw, HEVC_STREAM_END_ADDR),
+		 read_dos_reg(hw, HEVC_STREAM_RD_PTR),
+		 read_dos_reg(hw, HEVC_STREAM_WR_PTR),
+		 read_dos_reg(hw, HEVC_STREAM_LEVEL),
+		 read_dos_reg(hw, HEVC_SHIFT_BYTE_COUNT));
+}
+
+/*
+ * The microcode's own output.  RPM is the parsed-parameter block it DMAs back
+ * after reading a frame header, LMEM its local memory dump.  Both are zero
+ * until it has actually parsed something, so this distinguishes "read the bytes
+ * and understood them" from "read the bytes and gave up".
+ */
+void aml_av1_dump_ucode_output(struct aml_vdec_hw *hw)
+{
+	const u32 *rpm, *lmem;
+	int i;
+
+	if (!av1_ws.side_vaddr)
+		return;
+
+	rpm = av1_ws.side_vaddr + (av1_ws.rpm - av1_ws.side_paddr);
+	lmem = av1_ws.side_vaddr + (av1_ws.lmem - av1_ws.side_paddr);
+
+	for (i = 0; i < 8; i++)
+		dev_info(hw->dev, "av1: rpm[%02d] %08x %08x %08x %08x\n",
+			 i * 4, rpm[i * 4], rpm[i * 4 + 1],
+			 rpm[i * 4 + 2], rpm[i * 4 + 3]);
+	for (i = 0; i < 4; i++)
+		dev_info(hw->dev, "av1: lmem[%02d] %08x %08x %08x %08x\n",
+			 i * 4, lmem[i * 4], lmem[i * 4 + 1],
+			 lmem[i * 4 + 2], lmem[i * 4 + 3]);
+}
+
+/*
+ * The microcode DMAs its parsed parameters into the RPM buffer with the entries
+ * reversed inside every group of four u16s - load_param() in the reference does
+ * params->l.data[i+ii] = rpm_ptr[i+3-ii].  Undo that and the block lines up with
+ * union param_u.
+ */
+/* frame_type from the last parsed header: 0 KEY, 1 INTER, 2 INTRA_ONLY, 3 S. */
+u32 aml_av1_frame_type(struct aml_vdec_hw *hw)
+{
+	const u16 *raw;
+
+	if (!av1_ws.side_vaddr)
+		return 0xffff;
+	raw = av1_ws.side_vaddr + (av1_ws.rpm - av1_ws.side_paddr);
+	/* index 14 unscrambles to raw[(14 & ~3) + 3 - (14 & 3)] = raw[13] */
+	return raw[13];
+}
+
+void aml_av1_dump_params(struct aml_vdec_hw *hw)
+{
+	static const struct { const char *name; int idx; } fields[] = {
+		{ "profile",          AV1_RPM_PROFILE },
+		{ "max_frame_width",  AV1_RPM_MAX_FRAME_WIDTH },
+		{ "max_frame_height", AV1_RPM_MAX_FRAME_HEIGHT },
+		{ "frame_type",       AV1_RPM_FRAME_TYPE },
+		{ "show_frame",       AV1_RPM_SHOW_FRAME },
+		{ "frame_width",      AV1_RPM_FRAME_WIDTH },
+		{ "frame_height",     AV1_RPM_FRAME_HEIGHT },
+		{ "bit_depth",        AV1_RPM_BIT_DEPTH },
+		{ "seq_flags",        AV1_RPM_SEQ_FLAGS },
+		{ "lf_sharpness",     AV1_RPM_LF_SHARPNESS },
+		{ "lf_mode_ref_delta", AV1_RPM_LF_MODE_REF_DELTA },
+		{ "lf_level_0",       AV1_RPM_LF_LEVEL_0 },
+		{ "lf_level_1",       AV1_RPM_LF_LEVEL_1 },
+		{ "lf_level_u",       AV1_RPM_LF_LEVEL_U },
+		{ "lf_level_v",       AV1_RPM_LF_LEVEL_V },
+		{ "segmentation_en",  AV1_RPM_SEGMENTATION_EN },
+	};
+	const u16 *raw;
+	u16 p[AV1_RPM_COUNT];
+	int i, j;
+
+	if (!av1_ws.side_vaddr)
+		return;
+
+	raw = av1_ws.side_vaddr + (av1_ws.rpm - av1_ws.side_paddr);
+	for (i = 0; i < AV1_RPM_COUNT; i += 4)
+		for (j = 0; j < 4; j++)
+			p[i + j] = raw[i + 3 - j];
+
+	for (i = 0; i < ARRAY_SIZE(fields); i++)
+		dev_info(hw->dev, "av1: param %-18s = %u (0x%x)\n",
+			 fields[i].name, p[fields[i].idx], p[fields[i].idx]);
+}
+
+/*
+ * Per-picture configuration, i.e. the reference's config_sao_hw() and the
+ * hardware half of config_dblk_hw(), specialised for what this bring-up
+ * actually produces: a single key frame, MMU on, double write off, NV12,
+ * linear memory map, no segmentation and no reference pictures.
+ *
+ * The loop filter is the only part that needs real arithmetic.  Its software
+ * side in the reference is long, but only twelve registers ever reach the
+ * hardware, and for a key frame the per-segment level table collapses onto the
+ * intra entry.
+ */
+
+#define AV1_MAX_LOOP_FILTER	63
+
+/* Superres upscaler fixed point, from av1_upscale_frame_init(). */
+#define RS_SUBPEL_BITS		6
+#define RS_SCALE_SUBPEL_BITS	14
+#define RS_SCALE_SUBPEL_MASK	((1 << RS_SCALE_SUBPEL_BITS) - 1)
+#define RS_SCALE_EXTRA_BITS	(RS_SCALE_SUBPEL_BITS - RS_SUBPEL_BITS)
+#define RS_SCALE_EXTRA_OFF	(1 << (RS_SCALE_EXTRA_BITS - 1))
+
+struct av1_lfthr { u8 mblim; u8 lim; };
+
+/*
+ * av1_loop_filter_init()/update_sharpness().  With sharpness 0 the inside limit
+ * is just the level, floored at 1, and the macroblock limit is 2*(lvl+2) on top
+ * of it.
+ */
+static void av1_build_lfthr(struct av1_lfthr *thr, u32 sharpness)
+{
+	int lvl;
+
+	for (lvl = 0; lvl <= AV1_MAX_LOOP_FILTER; lvl++) {
+		int inside = lvl >> ((sharpness > 0) + (sharpness > 4));
+
+		if (sharpness > 0 && inside > 9 - (int)sharpness)
+			inside = 9 - sharpness;
+		if (inside < 1)
+			inside = 1;
+
+		thr[lvl].lim = inside;
+		thr[lvl].mblim = 2 * (lvl + 2) + inside;
+	}
+}
+
+static int av1_clamp_lvl(int v)
+{
+	if (v < 0)
+		return 0;
+	if (v > AV1_MAX_LOOP_FILTER)
+		return AV1_MAX_LOOP_FILTER;
+	return v;
+}
+
+/*
+ * config_mc_buffer().  Entry 0 names the picture being decoded, entries 1..7
+ * are LAST_FRAME..ALTREF_FRAME.  For an intra frame every entry is the current
+ * picture, which is what the reference does too.  The whole table is written
+ * twice, at canvas offset 0 and 16, then the reference-info table gets each
+ * picture's dimensions and scale factors.
+ */
+/*
+ * Reference frame numbering, as the spec and the reference code use it.
+ */
+#define AV1_LAST_FRAME		1
+#define AV1_LAST2_FRAME		2
+#define AV1_GOLDEN_FRAME	4
+#define AV1_BWDREF_FRAME	5
+#define AV1_ALTREF2_FRAME	6
+#define AV1_ALTREF_FRAME	7
+#define AV1_MFMV_STACK_SIZE	3
+
+/* get_relative_dist(): signed distance between two wrapped order hints. */
+static int av1_rel_dist(u32 a, u32 b, u32 bits)
+{
+	int diff, m;
+
+	if (!bits)
+		return 0;
+
+	diff = (int)a - (int)b;
+	m = 1 << (bits - 1);
+	return (diff & (m - 1)) - (diff & m);
+}
+
+/*
+ * av1_setup_motion_field() and motion_field_projection(), reduced to what the
+ * hardware actually consumes.  The projection itself runs in the decoder; the
+ * host only has to say which reference frames to project from and, for each,
+ * the distance from that frame to each of its own references.
+ */
+struct av1_mfmv {
+	int id[8];		/* reference frame each entry projects from */
+	s8 offset[8][8];	/* [entry][ref frame] order-hint distance */
+	bool valid[8];		/* frame was inter and the same size */
+	int count;
+};
+
+static bool av1_mf_project(struct av1_mfmv *mf, int rf, u32 bits,
+			   u32 width, u32 height)
+{
+	int idx = mf->count++;
+	const struct av1_slot *b = &av1_slots[av1_frame_slot[rf]];
+	int j;
+
+	mf->id[idx] = rf;
+	memset(mf->offset[idx], 0, sizeof(mf->offset[idx]));
+	mf->valid[idx] = false;
+
+	/* An intra frame has no motion to project, nor has a resized one. */
+	if (b->intra || b->width != width || b->height != height)
+		return false;
+
+	for (j = AV1_LAST_FRAME; j <= AV1_ALTREF_FRAME; j++)
+		mf->offset[idx][j] = av1_rel_dist(b->order_hint,
+						  b->ref_order_hint[j], bits);
+	mf->valid[idx] = true;
+	return true;
+}
+
+static void av1_setup_motion_field(struct av1_mfmv *mf, u32 cur_hint, u32 bits)
+{
+	u32 width = av1_slots[av1_cur_slot].width;
+	u32 height = av1_slots[av1_cur_slot].height;
+	int ref_stamp = AV1_MFMV_STACK_SIZE - 1;
+	u32 oh[8];
+	int i;
+
+	memset(mf, 0, sizeof(*mf));
+	if (!bits)
+		return;
+
+	for (i = AV1_LAST_FRAME; i <= AV1_ALTREF_FRAME; i++)
+		oh[i] = av1_slots[av1_frame_slot[i]].order_hint;
+
+	/*
+	 * LAST is skipped when it is an overlay of GOLDEN - its altref hint
+	 * matching GOLDEN's own hint means it carries no new motion.
+	 */
+	if (av1_slots[av1_frame_slot[AV1_LAST_FRAME]].ref_order_hint[AV1_ALTREF_FRAME] !=
+	    oh[AV1_GOLDEN_FRAME])
+		av1_mf_project(mf, AV1_LAST_FRAME, bits, width, height);
+	ref_stamp--;
+
+	if (av1_rel_dist(oh[AV1_BWDREF_FRAME], cur_hint, bits) > 0 &&
+	    av1_mf_project(mf, AV1_BWDREF_FRAME, bits, width, height))
+		ref_stamp--;
+
+	if (av1_rel_dist(oh[AV1_ALTREF2_FRAME], cur_hint, bits) > 0 &&
+	    av1_mf_project(mf, AV1_ALTREF2_FRAME, bits, width, height))
+		ref_stamp--;
+
+	if (av1_rel_dist(oh[AV1_ALTREF_FRAME], cur_hint, bits) > 0 &&
+	    ref_stamp >= 0 &&
+	    av1_mf_project(mf, AV1_ALTREF_FRAME, bits, width, height))
+		ref_stamp--;
+
+	if (ref_stamp >= 0)
+		av1_mf_project(mf, AV1_LAST2_FRAME, bits, width, height);
+}
+
+/*
+ * av1_setup_skip_mode_allowed().  Skip mode needs two references that bracket
+ * the current picture, or failing that the two nearest forward ones.  It can
+ * only ever apply when the stream signals REFERENCE_MODE_SELECT, which in
+ * practice means alt-ref style encoding - a plain forward-only IPPP stream
+ * never reaches it, which is why leaving these bits zero went unnoticed.
+ */
+static void av1_skip_mode(const u16 *pr, u32 cur_hint, u32 oh_bits, bool inter,
+			  u32 *allowed, u32 *idx0, u32 *idx1)
+{
+	int hint[2] = { 0, 0 };
+	int idx[2] = { -1, -1 };
+	int i, h, d;
+
+	*allowed = 0;
+	*idx0 = 0;
+	*idx1 = 0;
+	if (!oh_bits || !inter || !(pr[AV1_RPM_REFERENCE_MODE] & 1))
+		return;
+
+	/* Nearest reference on each side of the current picture. */
+	for (i = 0; i < 7; i++) {
+		h = av1_slots[av1_frame_slot[AV1_LAST_FRAME + i]].order_hint;
+		d = av1_rel_dist(h, cur_hint, oh_bits);
+		if (d < 0) {
+			if (idx[0] < 0 ||
+			    av1_rel_dist(h, hint[0], oh_bits) > 0) {
+				hint[0] = h;
+				idx[0] = i;
+			}
+		} else if (d > 0) {
+			if (idx[1] < 0 ||
+			    av1_rel_dist(h, hint[1], oh_bits) < 0) {
+				hint[1] = h;
+				idx[1] = i;
+			}
+		}
+	}
+
+	if (idx[0] < 0)
+		return;
+
+	if (idx[1] < 0) {
+		/* Forward only: find the second nearest forward reference. */
+		int best = -1;
+
+		for (i = 0; i < 7; i++) {
+			h = av1_slots[av1_frame_slot[AV1_LAST_FRAME + i]].order_hint;
+			if (av1_rel_dist(h, hint[0], oh_bits) >= 0)
+				continue;
+			if (best < 0 || av1_rel_dist(h, hint[1], oh_bits) > 0) {
+				hint[1] = h;
+				best = i;
+			}
+		}
+		if (best < 0)
+			return;
+		idx[1] = best;
+	}
+
+	*allowed = 1;
+	*idx0 = min(idx[0], idx[1]);
+	*idx1 = max(idx[0], idx[1]);
+}
+
+static void av1_config_mc_buffer(struct aml_vdec_hw *hw, bool inter,
+				 const u16 *pr, u32 width, u32 height)
+{
+	int *slots = av1_frame_slot;
+	int i;
+
+	wr(hw, HEVCD_MPP_ANC_CANVAS_ACCCONFIG_ADDR, (0 << 8) | BIT(0));
+	for (i = 0; i < 8; i++)
+		wr(hw, HEVCD_MPP_ANC_CANVAS_DATA_ADDR,
+		   (av1_slots[slots[i]].order_hint << 24) |
+		   (slots[i] << 16) | (slots[i] << 8) | slots[i]);
+
+	wr(hw, HEVCD_MPP_ANC_CANVAS_ACCCONFIG_ADDR, (16 << 8) | BIT(0));
+	for (i = 0; i < 8; i++)
+		wr(hw, HEVCD_MPP_ANC_CANVAS_DATA_ADDR,
+		   (av1_slots[slots[i]].order_hint << 24) |
+		   (slots[i] << 16) | (slots[i] << 8) | slots[i]);
+
+	/*
+	 * The motion-compensation reference cache.  Nothing in this driver had
+	 * ever written it, so it kept whatever state the previously loaded
+	 * codec left behind - and a stale-enabled cache stalls the MC engine,
+	 * which is what the microcode was spinning on.  Mainline's VP9 codec
+	 * resets it and disables it outright on a key frame; do the same for
+	 * both frame types for now.  Enabling it needs the reference canvas
+	 * entries and only buys bandwidth, not correctness.
+	 */
+	wr(hw, HEVCD_MCRCC_CTL1, 0x2);
+	wr(hw, HEVCD_MCRCC_CTL1, 0x0);
+
+	/*
+	 * config_mpred_hw() packs the reference slot indices and order hints
+	 * into REF03..REF05.  Indices are 5 bits each, ALTREF(7) down to
+	 * ref 2 at bit positions 25, 20, 15, 10, 5, 0 of REF03; LAST(1)'s
+	 * index lands at bit 24 of REF04, followed by the order hints a byte
+	 * apart.  Only meaningful for an inter frame.
+	 */
+	{
+		u32 r3 = 0, r4 = 0, r5 = 0;
+
+		/*
+		 * config_mpred_hw() writes these for every frame, not only
+		 * inter ones - a key frame gets zeroes rather than whatever
+		 * the last picture left behind.
+		 */
+		if (inter) {
+			for (i = 7; i >= 2; i--)
+				r3 |= (slots[i] & 0x1f) << (25 - (7 - i) * 5);
+
+			r4 = (slots[1] & 0x1f) << 24;
+			r4 |= (av1_slots[slots[7]].order_hint & 0xff) << 16;
+			r4 |= (av1_slots[slots[6]].order_hint & 0xff) << 8;
+			r4 |= (av1_slots[slots[5]].order_hint & 0xff);
+
+			r5 = (av1_slots[slots[4]].order_hint & 0xff) << 24;
+			r5 |= (av1_slots[slots[3]].order_hint & 0xff) << 16;
+			r5 |= (av1_slots[slots[2]].order_hint & 0xff) << 8;
+			r5 |= (av1_slots[slots[1]].order_hint & 0xff);
+		}
+		wr(hw, HEVC_MPRED_L0_REF03_POC, r3);
+		wr(hw, HEVC_MPRED_L0_REF04_POC, r4);
+		wr(hw, HEVC_MPRED_L0_REF05_POC, r5);
+	}
+
+	/* auto-increment from index 0 */
+	wr(hw, AV1D_MPP_REFINFO_TBL_ACCCONFIG, BIT(2));
+	for (i = 0; i < 8; i++) {
+		wr(hw, AV1D_MPP_REFINFO_DATA, width);
+		wr(hw, AV1D_MPP_REFINFO_DATA, height);
+		wr(hw, AV1D_MPP_REFINFO_DATA, AV1_REF_NO_SCALE);
+		wr(hw, AV1D_MPP_REFINFO_DATA, AV1_REF_NO_SCALE);
+		wr(hw, AV1D_MPP_REFINFO_DATA, 0);
+	}
+
+	/*
+	 * No reference is ever scaled here - superres is off and every picture
+	 * in the stream is the same size - but both registers must be written
+	 * rather than left holding whatever the last codec put there.
+	 */
+	wr(hw, AV1D_MPP_REF_SCALE_ENBL, 0);
+	wr(hw, PARSER_REF_SCALE_ENBL, 0);
+}
+
+/*
+ * AV1 reference management, the part of av1_bufmgr_process() a plain IPPP
+ * stream actually needs: after a picture is decoded, every reference slot named
+ * in refresh_frame_flags starts pointing at it.
+ */
+/*
+ * config_next_ref_info_hw().  The microcode does not learn the reference map
+ * from any register - the host writes it into the parser's internal memory,
+ * twelve words at 0x11a0 on SC2 and later (0x1000 before that).  The layout
+ * comes from av1_get_next_used_ref_info():
+ *
+ *   word 0     order hints of reference slots 0..3, one byte each
+ *   word 1     order hints of reference slots 4..7
+ *   words 2..9 (width << 16) | height of reference slot (word - 2)
+ *   word 10    picture indices of reference slots 0..3, one byte each
+ *   word 11    picture indices of reference slots 4..7
+ *
+ * Without it an inter frame has no resolvable references and the microcode
+ * spins in its own wait loop instead of ever starting on an LCU.
+ */
+static void av1_config_next_ref_info(struct aml_vdec_hw *hw,
+				     u32 width, u32 height)
+{
+	u32 info;
+	int i, j;
+
+	wr(hw, HEVC_PARSER_MEM_WR_ADDR, 0x11a0);
+	for (i = 0; i < 12; i++) {
+		info = 0;
+		if (i < 2) {
+			for (j = 0; j < 4; j++)
+				info |= (av1_slots[av1_ref_slot[i * 4 + j]].order_hint & 0xff)
+					<< (j * 8);
+		} else if (i < 10) {
+			/* Every picture in the stream is the same size. */
+			info = (width << 16) | (height & 0xffff);
+		} else {
+			for (j = 0; j < 4; j++)
+				info |= (av1_ref_slot[(i - 10) * 4 + j] & 0xff)
+					<< (j * 8);
+		}
+		wr(hw, HEVC_PARSER_MEM_RW_DATA, info);
+	}
+}
+
+/*
+ * Re-apply the reference map.  The map lives in the parser's internal memory,
+ * which does not survive a microcode restart, so it has to be written again
+ * whenever the core is restarted for a new buffer.
+ */
+/*
+ * The stateless API states the reference map outright: reference_frame_ts[]
+ * names, for each of the eight slots, the OUTPUT buffer whose frame it holds.
+ * Take the map from there rather than from the refresh_frame_flags the
+ * microcode parsed.  A client that rebuilds the frame header - VA-API, which
+ * never carries refresh_frame_flags - cannot know that field when it has to
+ * submit the frame, and the map is exact either way.  Slots whose frame is
+ * not one of ours keep what they had.
+ */
+static void av1_apply_reference_ts(const struct v4l2_ctrl_av1_frame *f)
+{
+	int s, k;
+
+	for (s = 0; s < 8; s++) {
+		u64 ts = f->reference_frame_ts[s];
+
+		if (!ts)
+			continue;
+		for (k = 0; k < AV1_SLOTS; k++) {
+			if (av1_slots[k].ts == ts) {
+				av1_ref_slot[s] = k;
+				break;
+			}
+		}
+	}
+}
+
+void aml_av1_restore_refs(struct aml_vdec_hw *hw)
+{
+	if (av1_last_width && av1_last_height)
+		av1_config_next_ref_info(hw, av1_last_width, av1_last_height);
+}
+
+void aml_av1_frame_done(struct aml_vdec_hw *hw)
+{
+	int i;
+
+	for (i = 0; i < 8; i++)
+		if (av1_pending_refresh & (1 << i))
+			av1_ref_slot[i] = av1_cur_slot;
+
+	/*
+	 * A picture with show_frame clear is decoded now and displayed later,
+	 * when a show_existing_frame header names its slot.
+	 */
+	if (av1_cur_show || av1_stateless)
+		av1_out_slot = av1_cur_slot;
+
+	/* The map the next frame will resolve its references against. */
+	av1_config_next_ref_info(hw, av1_last_width, av1_last_height);
+}
+
+int aml_av1_config_picture(struct aml_vdec_hw *hw)
+{
+	struct av1_lfthr thr[AV1_MAX_LOOP_FILTER + 1];
+	const u16 *raw;
+	u16 pr[AV1_RPM_COUNT];
+	u32 width, height, lcu_size, lcu_total, uv_size, uv_h;
+	u32 data32, base[3], frame_type;
+	dma_addr_t dw_y, dw_c;
+	s8 ref_deltas[8], mode_deltas[2];
+	u32 oh_bits;
+	bool inter, mv_read = false;
+	int i, j, plane, ret;
+
+	if (!av1_ws.side_vaddr)
+		return -EINVAL;
+
+	raw = av1_ws.side_vaddr + (av1_ws.rpm - av1_ws.side_paddr);
+	for (i = 0; i < AV1_RPM_COUNT; i += 4)
+		for (j = 0; j < 4; j++)
+			pr[i + j] = raw[i + 3 - j];
+
+	width = pr[AV1_RPM_MAX_FRAME_WIDTH];
+	height = pr[AV1_RPM_MAX_FRAME_HEIGHT];
+	/*
+	 * Everything downstream sizes DMA from these: the MMU page table, the
+	 * compressed body, the picture slots.  If the microcode never saw a
+	 * sequence header they are whatever was left in the RPM, and building
+	 * a page table from that points the hardware at memory it does not
+	 * own - which resets the board outright, with no oops to read
+	 * afterwards.  Refuse instead.
+	 */
+	if (width < AV1_MIN_DIM || height < AV1_MIN_DIM ||
+	    width > AV1_MAX_DIM || height > AV1_MAX_DIM) {
+		dev_err(hw->dev, "av1: implausible picture size %ux%u, refusing\n",
+			width, height);
+		return -EINVAL;
+	}
+
+	/*
+	 * Unlike VP9, AV1 codes the bit depth in every sequence header, at
+	 * every profile.  12 bit is professional profile only.
+	 */
+	if (pr[AV1_RPM_BIT_DEPTH] != 8 && pr[AV1_RPM_BIT_DEPTH] != 10) {
+		dev_err_once(hw->dev, "av1: bit depth %u not supported (8 or 10 only)\n",
+			     pr[AV1_RPM_BIT_DEPTH]);
+		return -EINVAL;
+	}
+	av1_ten_bit = pr[AV1_RPM_BIT_DEPTH] == 10;
+
+	/* seq_flags bit 6 picks the superblock size. */
+	lcu_size = (pr[AV1_RPM_SEQ_FLAGS] >> 6) & 1 ? 128 : 64;
+	lcu_total = DIV_ROUND_UP(width, lcu_size) *
+		    DIV_ROUND_UP(height, lcu_size);
+	uv_size = lcu_total * lcu_size * lcu_size / 2;
+	uv_h = (uv_size + 0xffff) >> 16;
+
+	/*
+	 * show_existing_frame carries no picture data at all: it asks for a
+	 * reference slot to be output again.  Decoding it as if it were a real
+	 * frame writes over a live slot and corrupts the stream from there on.
+	 * The one piece of state it does carry is that re-showing a key frame
+	 * resets the whole reference map.
+	 */
+	if (pr[AV1_RPM_SHOW_EXISTING_FRAME] & 1) {
+		u32 idx = pr[AV1_RPM_EXISTING_FRAME_IDX] & 7;
+
+		av1_shown_slot = av1_ref_slot[idx];
+		av1_out_slot = av1_shown_slot;
+		if (av1_slots[av1_shown_slot].intra)
+			for (i = 0; i < 8; i++)
+				av1_ref_slot[i] = av1_shown_slot;
+		av1_pending_refresh = 0;
+		dev_dbg(hw->dev, "av1: show existing frame, slot %d\n",
+			av1_shown_slot);
+		return -EAGAIN;
+	}
+
+	frame_type = pr[AV1_RPM_FRAME_TYPE];
+	inter = (frame_type == 1);
+	av1_pending_refresh = pr[AV1_RPM_REFRESH_FRAME_FLAGS];
+	oh_bits = (pr[AV1_RPM_ENABLE_ORDER_HINT] & 0x1) ?
+		  (pr[AV1_RPM_ORDER_HINT_BITS_M1] & 0x7) + 1 : 0;
+	av1_last_width = width;
+	av1_last_height = height;
+
+	ret = av1_alloc_slots(hw, width, height);
+	if (ret)
+		return ret;
+
+	/*
+	 * config_pic_size(): av1_config_workspace() set the body length from
+	 * the pre-parse guess, at 8 bit.  The real size and depth are only
+	 * known now.
+	 */
+	data32 = comp_body_size(width, height);
+	wr(hw, HEVCD_MPP_DECOMP_CTL2, data32 >> 5);
+	wr(hw, HEVC_CM_BODY_LENGTH, data32);
+	wr(hw, HEVC_CM_HEADER_OFFSET, data32);
+	data32 = read_dos_reg(hw, HEVC_SAO_CTRL5);
+	if (av1_ten_bit)
+		data32 &= ~BIT(9);
+	else
+		data32 |= BIT(9);	/* 8 bit, memory saving */
+	wr(hw, HEVC_SAO_CTRL5, data32);
+
+	/*
+	 * The picture address table has to be written after the slots exist.
+	 * It used to be filled once during bring-up, when every hdr_p was
+	 * still zero, so every entry named physical address 0.  A key frame
+	 * never noticed because it reads no reference; an inter frame read its
+	 * references from address 0 and got a residual with no prediction
+	 * added to it.
+	 */
+	av1_config_pic_list(hw);
+
+	/*
+	 * A key frame resets the reference state and starts from slot 0.
+	 * Otherwise take a slot that no reference currently names, so decoding
+	 * into it cannot destroy a picture this frame still needs.
+	 */
+	if (frame_type == 0 && (pr[AV1_RPM_SHOW_FRAME] & 1)) {
+		/*
+		 * Only a *shown* key frame empties the reference map.  A hidden
+		 * key frame, or an intra-only one, keeps every reference alive
+		 * and must not decode over one of them.
+		 */
+		av1_cur_slot = 0;
+		for (i = 0; i < 8; i++)
+			av1_ref_slot[i] = 0;
+	} else {
+		for (i = 0; i < AV1_SLOTS; i++) {
+			int cand = (av1_cur_slot + 1 + i) % AV1_SLOTS;
+			int j;
+
+			for (j = 0; j < 8; j++)
+				if (av1_ref_slot[j] == cand)
+					break;
+			if (j == 8) {
+				av1_cur_slot = cand;
+				break;
+			}
+		}
+		if (i == AV1_SLOTS) {
+			/*
+			 * Never reached with AV1_SLOTS > 8, but decoding into
+			 * a picture something still references corrupts both,
+			 * so say so rather than do it quietly.
+			 */
+			dev_err(hw->dev, "av1: no free picture slot\n");
+			return -ENOBUFS;
+		}
+	}
+	av1_slots[av1_cur_slot].order_hint = pr[AV1_RPM_ORDER_HINT];
+	av1_slots[av1_cur_slot].ts = av1_cur_ts;
+
+	/*
+	 * The entropy context this picture starts from is the one saved by the
+	 * frame named by primary_ref_frame - av1_get_primary_ref_frame_buf(),
+	 * cm->prev_frame in the reference - not simply the previously decoded
+	 * picture.  Those are the same frame for as long as the encoder keeps
+	 * choosing LAST_FRAME, which is why using the last decoded picture
+	 * stays bit-exact for a while and then quietly drifts.  A key frame,
+	 * and any frame with PRIMARY_REF_NONE, starts from the defaults.
+	 */
+	if (inter && (pr[AV1_RPM_PRIMARY_REF_FRAME] & 7) != AV1_PRIMARY_REF_NONE) {
+		u32 prim = pr[AV1_RPM_PRIMARY_REF_FRAME] & 7;
+
+		av1_prev_slot =
+			av1_ref_slot[pr[AV1_RPM_REMAPPED_REF_IDX0 + prim] & 7];
+		av1_prev_valid = true;
+	} else {
+		av1_prev_slot = 0;
+		av1_prev_valid = false;
+	}
+
+	/* Resolve each reference frame to a picture slot once, for everything. */
+	av1_frame_slot[0] = av1_cur_slot;
+	for (i = 1; i < 8; i++)
+		av1_frame_slot[i] = inter ?
+			av1_ref_slot[pr[AV1_RPM_REMAPPED_REF_IDX0 + i - 1] & 7] :
+			av1_cur_slot;
+
+	/* What a later frame needs in order to project motion from this one. */
+	av1_slots[av1_cur_slot].intra = !inter;
+	if (!inter)
+		av1_reset_gmc(av1_cur_slot);
+	av1_slots[av1_cur_slot].frame_type = frame_type;
+	av1_cur_show = pr[AV1_RPM_SHOW_FRAME] & 1;
+	av1_slots[av1_cur_slot].width = width;
+	av1_slots[av1_cur_slot].height = height;
+	for (i = AV1_LAST_FRAME; i <= AV1_ALTREF_FRAME; i++)
+		av1_slots[av1_cur_slot].ref_order_hint[i] =
+			av1_slots[av1_frame_slot[i]].order_hint;
+
+	/* Now that the real picture size is known, size the MMU and body. */
+	ret = av1_fill_mmu_map(hw, width, height);
+	if (ret)
+		return ret;
+	wr(hw, HEVC_SAO_MMU_DMA_CTRL, av1_ws.mmu_map);
+
+	/* ---- output / SAO ---- */
+	data32 = read_dos_reg(hw, HEVC_SAO_CTRL9) | BIT(1);
+	wr(hw, HEVC_SAO_CTRL9, data32);
+
+	data32 = read_dos_reg(hw, HEVC_SAO_CTRL5);
+	data32 |= BIT(14);		/* av1 mode */
+	/* Double-write scaler (bits 23:16): 0 is 1:1. */
+	data32 &= ~(0xff << 16);
+	wr(hw, HEVC_SAO_CTRL5, data32);
+
+	wr(hw, HEVC_SAO_CTRL0, lcu_size == 128 ? 0x7 : 0x6);
+
+	wr(hw, HEVC_CM_BODY_START_ADDR, av1_slots[av1_cur_slot].body_p);
+	wr(hw, HEVC_CM_HEADER_START_ADDR, av1_slots[av1_cur_slot].hdr_p);
+	wr(hw, HEVC_FGS_TABLE_START, av1_ws.fgs_table);
+	wr(hw, HEVC_FGS_TABLE_LENGTH, (512 * 128 / 8) * 8);
+
+	wr(hw, HEVC_SAO_Y_LENGTH, (uv_h << 16) << 1);
+	wr(hw, HEVC_SAO_C_LENGTH, uv_h << 16);
+
+	/*
+	 * Double-write target: plain NV12, luma plane followed by interleaved
+	 * chroma, linear.  Allocated on first use now that the real picture
+	 * size is known.
+	 */
+	/*
+	 * The double-write output goes to this picture's own slot.  It used to
+	 * be one buffer shared by every picture, which only worked because the
+	 * caller copied each frame out as soon as it was decoded - a
+	 * show_existing_frame header asking for an older picture had nothing
+	 * left to hand back.
+	 */
+	av1_ws.dw_width = width;
+	av1_ws.dw_height = height;
+	if (av1_dw_target_y) {
+		/*
+		 * Writing straight into a CAPTURE buffer means the picture has
+		 * to fit it exactly: the double-write unit lays down a tightly
+		 * packed width x height NV12 frame and knows nothing about the
+		 * buffer behind the address.  A stream larger than the
+		 * negotiated format would run off the end.
+		 */
+		if ((size_t)width * height * 3 / 2 > av1_dw_target_size) {
+			dev_err(hw->dev,
+				"av1: %ux%u does not fit the %zu byte capture buffer\n",
+				width, height, av1_dw_target_size);
+			return -EINVAL;
+		}
+		dw_y = av1_dw_target_y;
+		dw_c = av1_dw_target_c;
+	} else {
+		dw_y = av1_slots[av1_cur_slot].dw_p;
+		dw_c = dw_y + width * height;
+	}
+	wr(hw, HEVC_SAO_Y_START_ADDR, dw_y);
+	wr(hw, HEVC_SAO_Y_WPTR, dw_y);
+	wr(hw, HEVC_SAO_C_START_ADDR, dw_c);
+	wr(hw, HEVC_SAO_C_WPTR, dw_c);
+
+	data32 = read_dos_reg(hw, HEVC_SAO_CTRL1);
+	data32 &= ~(3 << 12);				/* linear memory map */
+	data32 &= ~0xff0;
+	data32 |= (HEVC_CONFIG_LITTLE_ENDIAN >> 8) & 0xfff;
+	/*
+	 * Both writes on: the compressed picture still goes through the MMU,
+	 * and the hardware additionally lays down a plain NV12 copy at the
+	 * double-write addresses below.  bit0 disables compression, bit1
+	 * disables double write; neither is wanted here.
+	 */
+	data32 &= ~0x3;
+	data32 |= BIT(8);				/* NV12 */
+	data32 &= ~(3 << 14);
+	data32 |= (2 << 14);
+	wr(hw, HEVC_SAO_CTRL1, data32);
+
+	data32 = read_dos_reg(hw, HEVCD_IPP_AXIIF_CONFIG);
+	data32 &= ~0x30;				/* linear */
+	data32 &= ~0xf;
+	data32 |= HEVC_CONFIG_LITTLE_ENDIAN & 0xf;
+	data32 &= ~BIT(12);				/* NV12 */
+	data32 &= ~(3 << 8);
+	data32 |= (2 << 8);
+	wr(hw, HEVCD_IPP_AXIIF_CONFIG, data32);
+
+	/* bit 8 first (compressed) write, bit 9 double (uncompressed) write */
+	data32 = read_dos_reg(hw, HEVC_DBLK_CFGB);
+	data32 &= ~0x300;
+	data32 |= BIT(8) | BIT(9);
+	wr(hw, HEVC_DBLK_CFGB, data32);
+
+	/* ---- loop filter ---- */
+	av1_build_lfthr(thr, pr[AV1_RPM_LF_SHARPNESS]);
+	for (i = 0; i < 32; i++) {
+		u32 v = ((thr[i * 2 + 1].lim & 0x3f) << 8) |
+			 (thr[i * 2 + 1].mblim & 0xff);
+
+		v = (v << 16) | ((thr[i * 2].lim & 0x3f) << 8) |
+		    (thr[i * 2].mblim & 0xff);
+		wr(hw, HEVC_DBLK_CFG9, v);
+	}
+
+	/* 1st/2nd write both enable, AV1 video format */
+	wr(hw, HEVC_DBLK_CFGB, (0x57 << 8) | (0x4 << 0));
+
+	base[0] = pr[AV1_RPM_LF_LEVEL_0];
+	base[1] = pr[AV1_RPM_LF_LEVEL_U];
+	base[2] = pr[AV1_RPM_LF_LEVEL_V];
+
+	for (i = 0; i < 8; i++)
+		ref_deltas[i] = (s8)(i == 0 ? 1 : (i == 4 || i >= 6 ? -1 : 0));
+	mode_deltas[0] = 0;
+	mode_deltas[1] = 0;
+
+	/*
+	 * lfi->lvl[plane][seg][dir][ref][mode], flattened the way the hardware
+	 * wants it: 192 words, each packing the two directions and two modes for
+	 * one (plane, segment, ref).  Every block in a key frame is intra, so
+	 * only the INTRA_FRAME reference delta contributes.
+	 */
+	for (i = 0; i < 192; i++) {
+		u32 lvl;
+		int seg;
+		int ref = i & 7;
+		int scale, v;
+
+		plane = (i >> 6) & 3;
+		seg = (i >> 3) & 7;
+		(void)seg;
+
+		scale = 1 << (base[plane] >> 5);
+		v = av1_clamp_lvl(base[plane] + ref_deltas[ref] * scale);
+		lvl = ((v & 0x3f) << 24) | ((v & 0x3f) << 16) |
+		      ((v & 0x3f) << 8) | (v & 0x3f);
+		if (!pr[AV1_RPM_LF_LEVEL_0] && !pr[AV1_RPM_LF_LEVEL_1])
+			lvl = 0;
+		wr(hw, HEVC_DBLK_CFGA, lvl);
+	}
+
+	wr(hw, HEVC_DBLK_DBLK0,
+	   pr[AV1_RPM_LF_LEVEL_0] | (pr[AV1_RPM_LF_LEVEL_1] << 6) |
+	   (pr[AV1_RPM_LF_LEVEL_U] << 12) | (pr[AV1_RPM_LF_LEVEL_V] << 18));
+
+	for (i = 0; i < 10; i++)
+		wr(hw, HEVC_DBLK_DBLK1,
+		   i < 2 ? (u32)(u8)mode_deltas[i & 1]
+			 : (u32)(u8)ref_deltas[(i - 2) & 7]);
+
+	/* No segmentation here, so the per-segment filter info is all zero. */
+	for (i = 0; i < 8; i++)
+		wr(hw, HEVC_DBLK_DBLK2, 0);
+
+	data32 = read_dos_reg(hw, HEVC_DBLK_CFGB);
+	if (pr[AV1_RPM_LF_MODE_REF_DELTA] & 1)
+		data32 |= BIT(28);
+	else
+		data32 &= ~BIT(28);
+	data32 &= ~BIT(29);		/* segmentation off */
+	if (width >= 1280)
+		data32 |= BIT(4);
+	else
+		data32 &= ~(3 << 4);
+	wr(hw, HEVC_DBLK_CFGB, data32);
+
+	/*
+	 * Horizontal upscaler, av1_upscale_frame_init().  AV1's superres codes a
+	 * frame at reduced width and upscales on the way out; with superres off
+	 * the step is exactly one pixel and the origin is RS_SCALE_EXTRA_OFF.
+	 *
+	 * Leaving these registers alone is not harmless.  The upscaler runs
+	 * regardless, so an unprogrammed step smears the picture horizontally
+	 * and an unprogrammed origin displaces it - which is exactly the
+	 * horizontal-only detail loss and the eight pixel offset measured
+	 * against a software decode.  Both symptoms, one cause.
+	 */
+	{
+		u32 in_l = width, out_l = width;
+		u32 in_c = (width + 1) >> 1, out_c = (width + 1) >> 1;
+		u32 step_l = ((in_l << RS_SCALE_SUBPEL_BITS) + out_l / 2) / out_l;
+		u32 step_c = ((in_c << RS_SCALE_SUBPEL_BITS) + out_c / 2) / out_c;
+		s32 err_l = out_l * step_l - (in_l << RS_SCALE_SUBPEL_BITS);
+		s32 err_c = out_c * step_c - (in_c << RS_SCALE_SUBPEL_BITS);
+		u32 x0_l = (u32)((-(s32)((out_l - in_l) << (RS_SCALE_SUBPEL_BITS - 1)) +
+				  (s32)(out_l / 2)) / (s32)out_l +
+				 RS_SCALE_EXTRA_OFF - err_l / 2) &
+			   RS_SCALE_SUBPEL_MASK;
+		u32 x0_c = (u32)((-(s32)((out_c - in_c) << (RS_SCALE_SUBPEL_BITS - 1)) +
+				  (s32)(out_c / 2)) / (s32)out_c +
+				 RS_SCALE_EXTRA_OFF - err_c / 2) &
+			   RS_SCALE_SUBPEL_MASK;
+
+		wr(hw, HEVC_DBLK_UPS1, av1_ws.ups_data);
+		wr(hw, HEVC_DBLK_UPS2, x0_l);
+		wr(hw, HEVC_DBLK_UPS3, x0_c);
+		wr(hw, HEVC_DBLK_UPS4, step_l);
+		wr(hw, HEVC_DBLK_UPS5, step_c);
+		wr(hw, AV1_UPSCALE_X0_QN, (x0_c << 16) | x0_l);
+		wr(hw, AV1_UPSCALE_STEP_QN, (step_c << 16) | step_l);
+		dev_dbg(hw->dev,
+			"av1: upscale step %u/%u x0 %u/%u\n",
+			 step_l, step_c, x0_l, x0_c);
+	}
+
+	wr(hw, HEVC_DBLK_CDEF0, av1_ws.cdef_data);
+	data32 = read_dos_reg(hw, HEVC_DBLK_CDEF1) & 0xffffff00;
+	data32 |= 17;
+	wr(hw, HEVC_DBLK_CDEF1, data32);
+
+	/*
+	 * Motion prediction.  A key frame has no references and no previous
+	 * frame MVs, so this reduces to pointing the block at its above-row and
+	 * collocated-MV buffers and clearing use_prev_frame_mvs.  CTRL3 carries
+	 * the AV1 constants Amlogic uses from T5D onwards, which is what S4 is.
+	 */
+	wr(hw, HEVC_MPRED_CTRL3, 0x10151015);
+
+	/*
+	 * CTRL4 bits 19:12 are ref_frame_sign_bias, one per reference frame,
+	 * set when that reference lies *after* the current picture in output
+	 * order.  Nothing had ever written them, so they held whatever the
+	 * previously loaded codec left there.  A key frame and a forward-only
+	 * stream both want zeroes, which is why leaving them alone looked
+	 * harmless - but the temporal MV projection uses sign bias to decide
+	 * which way to scale a borrowed vector, so stale bits there are worse
+	 * than not projecting at all.
+	 */
+	data32 = read_dos_reg(hw, HEVC_MPRED_CTRL4);
+	data32 &= ~BIT(6);		/* use_prev_frame_mvs = 0 */
+	data32 &= ~(0xff << 12);
+	if (inter) {
+		for (i = AV1_LAST_FRAME; i <= AV1_ALTREF_FRAME; i++)
+			if (av1_rel_dist(av1_slots[av1_frame_slot[i]].order_hint,
+					 pr[AV1_RPM_ORDER_HINT], oh_bits) > 0)
+				data32 |= BIT(12 + i);
+	}
+	wr(hw, HEVC_MPRED_CTRL4, data32);
+	dev_dbg(hw->dev, "av1: mpred ctrl4 %08x\n", data32);
+
+	wr(hw, HEVC_MPRED_ABV_START_ADDR, av1_ws.mpred_above);
+	wr(hw, HEVC_MPRED_MV_WR_START_ADDR, av1_slots[av1_cur_slot].mv_p);
+	wr(hw, HEVC_MPRED_MV_WPTR, av1_slots[av1_cur_slot].mv_p);
+	/* One tile spanning the picture, so no row jump. */
+	wr(hw, HEVC_MPRED_MV_WR_ROW_JUMP, 0);
+	wr(hw, HEVC_MPRED_MV_RD_ROW_JUMP, 0);
+
+	/*
+	 * REF00 carries the current picture's order hint and the sequence-level
+	 * order-hint info.  config_mpred_hw() writes it for every frame, not
+	 * just inter ones.  The 0x10 pair in the low half is the compressed-MV
+	 * constant Amlogic uses from T5D onwards, matching CTRL3 above.
+	 */
+	data32 = (pr[AV1_RPM_ENABLE_ORDER_HINT] & 0x1) << 27;
+	data32 |= (pr[AV1_RPM_ORDER_HINT_BITS_M1] & 0x7) << 24;
+	data32 |= (pr[AV1_RPM_ORDER_HINT] & 0xff) << 16;
+	data32 |= (0x10 << 8) | 0x10;
+	wr(hw, HEVC_MPRED_L0_REF00_POC, data32);
+
+	/*
+	 * MV write is always on; MV read stays off until the temporal-MV
+	 * buffers (MV_RD_START_ADDR and the REF06..11 offsets) are programmed.
+	 * A stream that sets allow_ref_frame_mvs will decode without temporal
+	 * MV prediction rather than reading an unprogrammed address.
+	 */
+	/*
+	 * Temporal motion vectors.  When the frame allows reference-frame MVs
+	 * the decoder projects motion from up to three earlier frames; the host
+	 * names those frames, hands over their collocated-MV buffers and gives
+	 * the order-hint distance from each to each of its own references.
+	 */
+	{
+		static const u32 off_reg[6] = {
+			HEVC_MPRED_L0_REF06_POC, HEVC_MPRED_L0_REF07_POC,
+			HEVC_MPRED_L0_REF08_POC, HEVC_MPRED_L0_REF09_POC,
+			HEVC_MPRED_L0_REF10_POC, HEVC_MPRED_L0_REF11_POC,
+		};
+		u32 off_val[6] = {};
+		struct av1_mfmv mf;
+		int used[AV1_MFMV_STACK_SIZE] = {};
+		int nused = 0, pos = 24, reg = 0;
+
+		if (inter && (pr[AV1_RPM_ALLOW_REF_FRAME_MVS] & 0x1) &&
+		    oh_bits)
+			av1_setup_motion_field(&mf, pr[AV1_RPM_ORDER_HINT],
+					       oh_bits);
+		else
+			memset(&mf, 0, sizeof(mf));
+
+		data32 = 0;
+		for (i = 0; i < mf.count; i++) {
+			if (!mf.valid[i])
+				continue;
+			if (nused < AV1_MFMV_STACK_SIZE)
+				used[nused] = mf.id[i];
+			nused++;
+			for (j = AV1_LAST_FRAME; j <= AV1_ALTREF_FRAME; j++) {
+				data32 |= (mf.offset[i][j] & 0xff) << pos;
+				if (pos == 0) {
+					if (reg < 6)
+						off_val[reg++] = data32;
+					data32 = 0;
+					pos = 24;
+				} else {
+					pos -= 8;
+				}
+			}
+		}
+		if (pos != 24 && reg < 6)
+			off_val[reg] = data32;
+
+		off_val[5] |= nused | (used[0] << 2) | (used[1] << 5) |
+			      (used[2] << 8);
+		for (i = 0; i < 6; i++)
+			wr(hw, off_reg[i], off_val[i]);
+
+		/*
+		 * Collocated MV buffers, one per projected frame.  Start from
+		 * a real buffer rather than whatever address was left over, so
+		 * that a frame which allows reference MVs but has nothing
+		 * valid to project from still names mapped memory.
+		 */
+		wr(hw, HEVC_MPRED_MV_RD_START_ADDR,
+		   av1_slots[av1_frame_slot[AV1_LAST_FRAME]].mv_p);
+		wr(hw, HEVC_MPRED_MV_RPTR,
+		   av1_slots[av1_frame_slot[AV1_LAST_FRAME]].mv_p);
+		for (i = 0, j = 0; i < mf.count && j < AV1_MFMV_STACK_SIZE; i++) {
+			dma_addr_t mv;
+
+			if (!mf.valid[i])
+				continue;
+			mv = av1_slots[av1_frame_slot[mf.id[i]]].mv_p;
+			if (j == 0) {
+				wr(hw, HEVC_MPRED_MV_RD_START_ADDR, mv);
+				wr(hw, HEVC_MPRED_MV_RPTR, mv);
+			} else if (j == 1) {
+				wr(hw, HEVC_MPRED_L0_REF01_POC, mv);
+				wr(hw, HEVC_MPRED_MV_RPTR_1, mv);
+			} else {
+				wr(hw, HEVC_MPRED_L0_REF02_POC, mv);
+				wr(hw, HEVC_MPRED_MV_RPTR_2, mv);
+			}
+			j++;
+		}
+		/*
+		 * The reference enables the MV read path on allow_ref_frame_mvs
+		 * alone, not on whether any projection turned out usable.  A
+		 * frame whose only reference is a key frame projects nothing
+		 * and still needs the path on, because the temporal candidate
+		 * list is part of how its motion vectors are coded.
+		 */
+		mv_read = inter && (pr[AV1_RPM_ALLOW_REF_FRAME_MVS] & 0x1);
+	}
+
+	data32 = read_dos_reg(hw, HEVC_MPRED_CTRL0);
+	data32 &= ~(MPRED_CTRL0_MV_WR_EN | MPRED_CTRL0_MV_RD_EN);
+	data32 |= MPRED_CTRL0_MV_WR_EN;
+	if (mv_read)
+		data32 |= MPRED_CTRL0_MV_RD_EN;
+	wr(hw, HEVC_MPRED_CTRL0, data32);
+
+	/*
+	 * Only touched when inter support is enabled.  The verified key-frame
+	 * configuration never wrote the canvas or reference-info tables at all,
+	 * and writing them turned out to be enough on its own to wedge the
+	 * board - so the default path is left exactly as it was measured.
+	 */
+	av1_config_mc_buffer(hw, inter, pr, width, height);
+
+	/*
+	 * ---- CDF, segment map, segment features ----
+	 *
+	 * Both are per picture, not per stream: the workspace carves 0x8000 of
+	 * CDF and a sixteenth of the segment map for each of the 16 picture
+	 * slots.  A frame writes its own slot and reads the slot the previous
+	 * frame wrote, which is how the entropy context is carried forward.
+	 * Pointing read and write at the same base works for a key frame,
+	 * whose context is the default table, and is wrong for anything else.
+	 */
+	wr(hw, AOM_AV1_CDF_BUFFER_W, av1_ws.cdf + AV1_CDF_SLOT_SIZE * av1_cur_slot);
+	wr(hw, AOM_AV1_CDF_BUFFER_R, av1_ws.cdf + AV1_CDF_SLOT_SIZE * av1_prev_slot);
+	wr(hw, AV1_SEG_W_ADDR,
+	   av1_ws.seg_map + (AV1_SEG_MAP_SIZE / 16) * av1_cur_slot);
+	wr(hw, AV1_SEG_R_ADDR,
+	   av1_ws.seg_map + (AV1_SEG_MAP_SIZE / 16) * av1_prev_slot);
+	for (i = 0; i < 8; i++)
+		wr(hw, AOM_AV1_SEGMENT_FEATURE, 0x80000000 | (i << 22));
+
+	/*
+	 * Previous-picture state the microcode needs for skip mode.  Skip mode
+	 * itself is not signalled in the RPM, so it stays off; what matters
+	 * here is that the previous and current picture indices are named.
+	 * 0x1f is the reference's "no such picture" value.
+	 */
+	{
+		u32 sm_allowed, sm_idx0, sm_idx1;
+
+		av1_skip_mode(pr, pr[AV1_RPM_ORDER_HINT], oh_bits, inter,
+			      &sm_allowed, &sm_idx0, &sm_idx1);
+
+		/*
+		 * Bit 31 is the previous picture's segmentation state, which
+		 * is only meaningful once segmentation is supported; it stays
+		 * zero.  Bit 30 is prev_frame->intra_only, which is the
+		 * INTRA_ONLY frame type (2), not a key frame.
+		 */
+		/*
+		 * 0x1f says there is no previous frame, as the reference does
+		 * for PRIMARY_REF_NONE.  Naming slot 0 there instead made the
+		 * microcode load that slot's global-motion models as
+		 * PrevGmParams, and the frame decoded against them.
+		 */
+		data32 = (av1_prev_valid &&
+			  av1_slots[av1_prev_slot].frame_type == 2) << 30;
+		data32 |= (av1_prev_valid ? av1_prev_slot : 0x1f) << 24;
+		data32 |= (av1_cur_slot & 0x1f) << 16;
+		data32 |= sm_allowed << 8;
+		data32 |= (sm_idx1 & 0xf) << 4;
+		data32 |= sm_idx0 & 0xf;
+		wr(hw, AV1_SKIP_MODE_INFO, data32);
+	}
+
+	/* Cleared for each new compressed frame. */
+	wr(hw, PIC_END_LCU_COUNT, 0);
+
+	/*
+	 * Immediately before AOM_AV1_DECODE_SLICE the reference stores the
+	 * segment feature word for this picture through the parser's memory
+	 * port, at 0x11b0 plus the picture index on SC2 and later.
+	 * Segmentation is off here, so the value is zero.
+	 */
+	wr(hw, HEVC_PARSER_MEM_WR_ADDR, 0x11b0 + av1_cur_slot);
+	wr(hw, HEVC_PARSER_MEM_RW_DATA, 0);
+
+	dev_dbg(hw->dev,
+		"av1: pic %ux%u %s show %u slot %d refresh %02x refs %d%d%d%d%d%d%d lf %u/%u/%u/%u sharp %u\n",
+		 width, height, inter ? "inter" : "key", av1_cur_show, av1_cur_slot,
+		 av1_pending_refresh,
+		 av1_ref_slot[0], av1_ref_slot[1], av1_ref_slot[2],
+		 av1_ref_slot[3], av1_ref_slot[4], av1_ref_slot[5],
+		 av1_ref_slot[6],
+		 pr[AV1_RPM_LF_LEVEL_0], pr[AV1_RPM_LF_LEVEL_1],
+		 pr[AV1_RPM_LF_LEVEL_U], pr[AV1_RPM_LF_LEVEL_V],
+		 pr[AV1_RPM_LF_SHARPNESS]);
+	return 0;
+}
+
+void aml_av1_dump_output(struct aml_vdec_hw *hw)
+{
+	const u8 *body = av1_ws.body_vaddr;
+	const u8 *hdr;
+	size_t i, nz = 0, hdr_nz = 0;
+
+	if (!body || !av1_ws.side_vaddr)
+		return;
+
+	for (i = 0; i < av1_ws.body_size; i++)
+		if (body[i])
+			nz++;
+
+	/*
+	 * The compressed header goes to the current slot, not to the workspace
+	 * cm_header[] carve-out - that one is left over from before the slot
+	 * pool and nothing programs it into the hardware any more.
+	 */
+	hdr = av1_slots[av1_cur_slot].hdr_v;
+	if (!hdr)
+		return;
+	for (i = 0; i < av1_slot_hdr_size; i++)
+		if (hdr[i])
+			hdr_nz++;
+
+	dev_info(hw->dev,
+		 "av1: body %zu/%zu bytes non-zero, header %zu/%zu non-zero\n",
+		 nz, av1_ws.body_size, hdr_nz, av1_slot_hdr_size);
+	dev_info(hw->dev, "av1: body[0..15] %*ph\n", 16, body);
+	dev_info(hw->dev, "av1: hdr [0..15] %*ph\n", 16, hdr);
+}
+
+int aml_av1_save_nv12(struct aml_vdec_hw *hw, const char *path, bool append)
+{
+	const u8 *y;
+	size_t i, nz = 0;
+	struct file *f;
+	loff_t pos = 0;
+	size_t len;
+
+	/* Only write a frame the stream actually asked to be displayed. */
+	if (av1_out_slot < 0)
+		return -EAGAIN;
+	y = av1_slots[av1_out_slot].dw_v;
+	dma_sync_single_for_cpu(hw->dev, av1_slots[av1_out_slot].dw_p,
+				av1_slot_dw_size, DMA_FROM_DEVICE);
+	av1_out_slot = -1;
+	if (!y)
+		return -ENODEV;
+
+	len = av1_ws.dw_width * av1_ws.dw_height * 3 / 2;
+	for (i = 0; i < len; i++)
+		if (y[i])
+			nz++;
+	dev_info(hw->dev, "av1: nv12 %zu/%zu non-zero, Y[0..15] %*ph\n",
+		 nz, len, 16, y);
+
+	f = filp_open(path, O_WRONLY | O_CREAT |
+		      (append ? O_APPEND : O_TRUNC), 0644);
+	if (IS_ERR(f))
+		return PTR_ERR(f);
+	if (append)
+		pos = i_size_read(file_inode(f));
+	kernel_write(f, y, len, &pos);
+	filp_close(f, NULL);
+	dev_info(hw->dev, "av1: wrote %zu bytes of NV12 to %s\n", len, path);
+	return 0;
+}
+
+void aml_av1_teardown(struct aml_vdec_hw *hw)
+{
+	wr(hw, HEVC_ASSIST_MBOX0_MASK, 0);
+	av1_free(hw);
+}
+
+/* ------------------------------------------------------------------------
+ * V4L2 stateless decoder
+ *
+ * The microcode parses the frame header itself and reports what it found
+ * through the RPM buffer, so this layer does not have to translate the
+ * V4L2 AV1 controls into hardware state - it hands the core one temporal
+ * unit per OUTPUT buffer and runs the same status ping-pong the probe
+ * harness established.  The controls are still accepted, because the
+ * stateless API requires them and userspace sets them.
+ * ------------------------------------------------------------------------
+ */
+
+struct aml_av1_ctx {
+	struct aml_vdec_ctx *v4l2_ctx;
+	struct aml_vdec_hw *hw;
+	bool ucode_loaded;
+	bool started;
+	bool have_picture;
+	u32 rounds;
+};
+
+/* Copy one decoded picture into the CAPTURE buffer. */
+static void av1_copy_out(struct aml_av1_ctx *av1, struct vb2_v4l2_buffer *dst)
+{
+	struct v4l2_pix_format_mplane *pf =
+		&av1->v4l2_ctx->pix_fmt[AML_FMT_DST];
+	struct vb2_buffer *vb = &dst->vb2_buf;
+	u32 w = av1_ws.dw_width, h = av1_ws.dw_height;
+	u32 dst_stride = pf->plane_fmt[0].bytesperline ? : w;
+	u32 dst_h = pf->height ? : h;
+	const u8 *src;
+	u8 *y, *c;
+	u32 row;
+	int slot = av1_out_slot;
+
+	if (slot < 0)
+		return;
+	src = av1_slots[slot].dw_v;
+	av1_out_slot = -1;
+
+	/*
+	 * Zero copy: the hardware already wrote this picture into the CAPTURE
+	 * buffer.  Nothing to move, only the payload to declare.
+	 */
+	if (av1_dw_target_y) {
+		if (vb->num_planes >= 2) {
+			vb2_set_plane_payload(vb, 0, dst_stride * dst_h);
+			vb2_set_plane_payload(vb, 1, dst_stride * dst_h / 2);
+		} else {
+			vb2_set_plane_payload(vb, 0, dst_stride * dst_h * 3 / 2);
+		}
+		av1->have_picture = true;
+		return;
+	}
+
+	dma_sync_single_for_cpu(av1->hw->dev, av1_slots[slot].dw_p,
+				av1_slot_dw_size, DMA_FROM_DEVICE);
+	if (!src)
+		return;
+
+	/*
+	 * The decoder writes a tightly packed w x h picture; the capture
+	 * buffer may be wider and taller, because the format is aligned up.
+	 * Copy row by row rather than assuming the two agree - they do not:
+	 * a 320x240 stream gets a 320x256 capture buffer, so chroma starts a
+	 * stride times 16 rows further in than the source has it.
+	 */
+	y = vb2_plane_vaddr(vb, 0);
+	c = vb->num_planes >= 2 ? vb2_plane_vaddr(vb, 1)
+				: y + dst_stride * dst_h;
+	if (!y || !c)
+		return;
+
+	for (row = 0; row < h; row++)
+		memcpy(y + row * dst_stride, src + row * w, w);
+	for (row = 0; row < h / 2; row++)
+		memcpy(c + row * dst_stride, src + w * h + row * w, w);
+	aml_vdec_dst_cpu_written(av1->hw->dev, vb);
+
+	if (vb->num_planes >= 2) {
+		vb2_set_plane_payload(vb, 0, dst_stride * dst_h);
+		vb2_set_plane_payload(vb, 1, dst_stride * dst_h / 2);
+	} else {
+		vb2_set_plane_payload(vb, 0, dst_stride * dst_h * 3 / 2);
+	}
+	av1->have_picture = true;
+}
+
+static void av1_finish(struct aml_av1_ctx *av1, enum vb2_buffer_state state)
+{
+	struct aml_vdec_ctx *ctx = av1->v4l2_ctx;
+	struct vb2_v4l2_buffer *dst;
+	unsigned int i;
+
+	/*
+	 * A buffer holding only a hidden frame decodes fine and produces
+	 * nothing to show.  Say so with a zero payload - otherwise the
+	 * capture buffer goes back to userspace still describing whatever it
+	 * held last time, which reads as a repeat of an older picture.
+	 */
+	if (!av1->have_picture) {
+		dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+		if (dst)
+			for (i = 0; i < dst->vb2_buf.num_planes; i++)
+				vb2_set_plane_payload(&dst->vb2_buf, i, 0);
+	}
+
+	/*
+	 * Complete the request before the buffer is handed back.  Doing it
+	 * afterwards - which is what device_run() would do, since run() only
+	 * returns once this has already finished the job - binds the control
+	 * objects to a request that has already completed, and the media
+	 * controller warns about it.
+	 */
+	dst = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	if (dst && dst->vb2_buf.req_obj.req)
+		v4l2_ctrl_request_complete(dst->vb2_buf.req_obj.req,
+					   &ctx->ctrl_handler);
+
+	ctx->int_cond = 1;
+	ctx->job_finished = true;
+	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev_dec, ctx->m2m_ctx,
+					 state);
+	wake_up(&ctx->queue);
+}
+
+/*
+ * The decode state machine, driven by the mailbox.  This is the loop the
+ * probe harness ran by polling, moved into the threaded interrupt: the
+ * microcode posts a status, the host does what that status asks for and
+ * hands back the next command.
+ */
+static irqreturn_t av1_irq_thread(int irq, void *priv)
+{
+	struct aml_av1_ctx *av1 = priv;
+	struct aml_vdec_ctx *ctx = av1->v4l2_ctx;
+	struct aml_vdec_hw *hw = av1->hw;
+	u32 st = hw->hevc_irq_status & 0xff;
+	u32 next = AOM_AV1_SEARCH_HEAD;
+
+	if (++av1->rounds > 256) {
+		dev_err(hw->dev, "av1: runaway decode, giving up\n");
+		av1_finish(av1, VB2_BUF_STATE_ERROR);
+		return IRQ_HANDLED;
+	}
+
+	switch (st) {
+	case AOM_AV1_SEQ_HEAD_PARSER_DONE:
+		/* Sequence header only: keep looking for a frame. */
+		break;
+	case AOM_AV1_FRAME_HEAD_PARSER_DONE:
+	case AOM_AV1_FRAME_PARSER_DONE: {
+		int cfg = aml_av1_config_picture(hw);
+
+		if (cfg == 0) {
+			next = AOM_AV1_DECODE_SLICE;
+		} else if (cfg == -EAGAIN) {
+			/* show_existing_frame: output an earlier picture. */
+			struct vb2_v4l2_buffer *dst =
+				v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+
+			if (dst)
+				av1_copy_out(av1, dst);
+		} else {
+			dev_err(hw->dev, "av1: picture config failed (%d)\n",
+				cfg);
+			/*
+			 * A failed slot allocation has freed the picture
+			 * slots. Halt the microcode and bring the core up from
+			 * scratch on the next buffer: a plain restart would
+			 * point the core at the freed slots again, and its
+			 * DMA then lands in memory the kernel has handed out.
+			 */
+			regmap_write(hw->map[DOS_BUS], HEVC_MPSR, 0);
+			regmap_write(hw->map[DOS_BUS], HEVC_CPSR, 0);
+			aml_av1_teardown(hw);
+			av1->started = false;
+			av1_finish(av1, VB2_BUF_STATE_ERROR);
+			return IRQ_HANDLED;
+		}
+		break;
+	}
+	case AOM_AV1_DEC_PIC_END: {
+		struct vb2_v4l2_buffer *dst =
+			v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+
+		aml_av1_frame_done(hw);
+		if (dst)
+			av1_copy_out(av1, dst);
+		break;
+	}
+	case AOM_NAL_DECODE_DONE:
+	case HEVC_ACTION_DONE:
+	case AOM_DECODE_BUFEMPTY:
+	case AOM_SEARCH_BUFEMPTY:
+	case AOM_EOS:
+		/*
+		 * End of this buffer.  With one frame per OUTPUT buffer the
+		 * usual ending is BUFEMPTY - the microcode has consumed the
+		 * frame and wants more data - rather than NAL_DECODE_DONE.
+		 * A buffer that decoded a hidden frame produces no picture of
+		 * its own and still completes.
+		 */
+		av1_finish(av1, VB2_BUF_STATE_DONE);
+		return IRQ_HANDLED;
+	default:
+		dev_dbg(hw->dev, "av1: unhandled status %02x\n", st);
+		break;
+	}
+
+	regmap_write(hw->map[DOS_BUS], HEVC_ASSIST_MBOX0_CLR_REG, 1);
+	regmap_write(hw->map[DOS_BUS], HEVC_DEC_STATUS_REG, next);
+	return IRQ_HANDLED;
+}
+
+int aml_av1_init(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_vdec_hw *hw = vdec_get_hw(ctx->dev);
+	struct aml_av1_ctx *av1;
+
+	if (!hw)
+		return -ENODEV;
+
+	av1 = kzalloc_obj(*av1);
+	if (!av1)
+		return -ENOMEM;
+
+	av1->v4l2_ctx = ctx;
+	av1->hw = hw;
+
+	/* One client on the HEVC core at a time - see the note in vp9.c. */
+	if (cmpxchg(&hw->hevc_priv, NULL, av1)) {
+		dev_info(&ctx->dev->plat_dev->dev,
+			 "av1: HEVC core already in use, refusing second instance\n");
+		kfree(av1);
+		return -EBUSY;
+	}
+
+	ctx->codec_priv = av1;
+	hw->hevc_irq_thread_fn = av1_irq_thread;
+	return 0;
+}
+
+void aml_av1_exit(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_av1_ctx *av1 = ctx->codec_priv;
+
+	if (!av1)
+		return;
+
+	av1->hw->hevc_irq_thread_fn = NULL;
+	av1->hw->hevc_priv = NULL;
+	if (av1->started) {
+		regmap_write(av1->hw->map[DOS_BUS], HEVC_MPSR, 0);
+		aml_av1_teardown(av1->hw);
+		/*
+		 * Deliberately not hvdec_disable(): powering the HEVC core
+		 * down here leaves it in a state the next context's bring-up
+		 * does not recover from, and every frame of the *second*
+		 * decode session on this core then times out - whichever
+		 * codec it is.  The domain is left up until the module is
+		 * unloaded.
+		 */
+	}
+	kfree(av1);
+	ctx->codec_priv = NULL;
+}
+
+/*
+ * Point the double-write unit at the CAPTURE buffer this frame will be handed
+ * back in.  Only safe when the buffer is laid out exactly the way the hardware
+ * writes: stride equal to the picture width, chroma immediately after luma.
+ * Anything else falls back to the slot buffer and the row-by-row copy.
+ */
+static void av1_set_dw_target(struct aml_vdec_ctx *ctx)
+{
+	struct v4l2_pix_format_mplane *pf = &ctx->pix_fmt[AML_FMT_DST];
+	struct vb2_v4l2_buffer *dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	struct vb2_buffer *vb;
+
+	av1_dw_target_y = 0;
+	av1_dw_target_c = 0;
+	av1_dw_target_size = 0;
+	if (!dst)
+		return;
+	vb = &dst->vb2_buf;
+
+	if (pf->plane_fmt[0].bytesperline != pf->width)
+		return;
+
+	av1_dw_target_y = vb2_dma_contig_plane_dma_addr(vb, 0);
+	if (!av1_dw_target_y)
+		return;
+	if (vb->num_planes >= 2) {
+		av1_dw_target_c = vb2_dma_contig_plane_dma_addr(vb, 1);
+		av1_dw_target_size = vb2_plane_size(vb, 0) +
+				     vb2_plane_size(vb, 1);
+		if (!av1_dw_target_c) {
+			av1_dw_target_y = 0;
+			return;
+		}
+	} else {
+		av1_dw_target_c = av1_dw_target_y +
+				  (dma_addr_t)pf->width * pf->height;
+		av1_dw_target_size = vb2_plane_size(vb, 0);
+	}
+}
+
+int aml_av1_dec_run(void *priv)
+{
+	struct aml_vdec_ctx *ctx = priv;
+	struct aml_av1_ctx *av1 = ctx->codec_priv;
+	struct aml_vdec_hw *hw = av1->hw;
+	struct vb2_v4l2_buffer *src;
+	struct vb2_buffer *vb;
+	struct v4l2_ctrl *seq_ctrl;
+	int ret;
+
+	src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	if (!src)
+		return -EINVAL;
+	vb = &src->vb2_buf;
+
+	ret = hvdec_enable(hw);
+	if (ret)
+		return ret;
+	dos_enable_hevc(hw);
+
+	if (!av1->ucode_loaded) {
+		/*
+		 * As for VP9: after a 10-bit stream the core decodes the next
+		 * 8-bit one to garbage until its memories are cycled.
+		 * av1_ten_bit still holds the last stream's depth here.
+		 */
+		if (av1_ten_bit)
+			hw->hevc_dirty = true;
+		av1_ten_bit = false;
+		hvdec_switch_codec(hw, CODEC_TYPE_AV1);
+
+		/*
+		 * Halts the AMRISC first: the other codec on this core may
+		 * still be running - VP9 and AV1 share it - and loading over a
+		 * running microcode leaves the core timing out every frame.
+		 */
+		ret = hevc_load_fw(hw, CODEC_TYPE_AV1, AV1_FW_FORMAT_MMU, AV1_FW_CORE_HEVC, "av1");
+		if (ret) {
+			hvdec_disable(hw);
+			return ret;
+		}
+		av1->ucode_loaded = true;
+	}
+
+	if (!av1->started) {
+		ret = aml_av1_bringup(hw, ctx->pix_fmt[AML_FMT_SRC].width,
+				      ctx->pix_fmt[AML_FMT_SRC].height);
+		if (ret) {
+			hvdec_disable(hw);
+			return ret;
+		}
+	}
+
+	/*
+	 * Two shapes of OUTPUT buffer have to work.
+	 *
+	 * The stateless API keeps the sequence in a control and hands over the
+	 * frame OBU's *payload*, header stripped - that is what GStreamer's
+	 * v4l2slav1dec sends.  Rebuild the sequence header from the control
+	 * and put the frame's OBU header back.
+	 *
+	 * Without that control the buffer is taken to be a plain OBU stream,
+	 * carrying its own sequence header, which is what a simple client
+	 * feeding temporal units does.  The microcode parses the bitstream
+	 * either way, so it has to end up with real OBUs.
+	 */
+	seq_ctrl = v4l2_ctrl_find(&ctx->ctrl_handler,
+				  V4L2_CID_STATELESS_AV1_SEQUENCE);
+	if (seq_ctrl && aml_av1_set_sequence(seq_ctrl->p_cur.p)) {
+		struct v4l2_ctrl *frame_ctrl =
+			v4l2_ctrl_find(&ctx->ctrl_handler,
+				       V4L2_CID_STATELESS_AV1_FRAME);
+
+		av1_cur_ts = vb->timestamp;
+		if (frame_ctrl)
+			av1_apply_reference_ts(frame_ctrl->p_cur.p);
+		av1_set_dw_target(ctx);
+		ret = aml_av1_feed_frame(hw, vb2_plane_vaddr(vb, 0),
+					 vb2_get_plane_payload(vb, 0));
+	} else {
+		av1_dw_target_y = 0;
+		av1_dw_target_c = 0;
+		av1_dw_target_size = 0;
+		if (!aml_av1_have_sequence() &&
+		    !av1_buf_has_sequence(vb2_plane_vaddr(vb, 0),
+					  vb2_get_plane_payload(vb, 0))) {
+			dev_err_once(hw->dev,
+				     "av1: no sequence header, and no usable sequence control\n");
+			return -EINVAL;
+		}
+		ret = aml_av1_feed_buf(hw, vb2_plane_vaddr(vb, 0),
+				       vb2_get_plane_payload(vb, 0),
+				       AOM_AV1_SEARCH_HEAD);
+	}
+	if (ret)
+		return ret;
+
+	av1->rounds = 0;
+	av1->have_picture = false;
+	ctx->int_cond = 0;
+	atomic_set(&hw->hevc_irq_count, 0);
+
+	/*
+	 * The microcode runs for the life of the stream: it is started once
+	 * and afterwards simply told to look for the next frame header.
+	 * Restarting it per buffer - or powering the core down between
+	 * buffers - loses its state, and every buffer after the first then
+	 * times out with the program counter parked at 1 or 2.
+	 */
+	if (av1->started) {
+		/*
+		 * The microcode reports NAL_DECODE_DONE when it runs out of
+		 * data and parks in its search loop; handing it another
+		 * SEARCH_HEAD there does not make it look at a refilled FIFO.
+		 * Restart it instead.  Everything that has to persist between
+		 * buffers - the picture slots, their compressed data, the CDF
+		 * contexts - lives in DRAM and is re-pointed for every
+		 * picture, so a restart costs only the parser's reference map.
+		 */
+		regmap_write(hw->map[DOS_BUS], HEVC_MPSR, 0);
+		regmap_write(hw->map[DOS_BUS], HEVC_CPSR, 0);
+	}
+	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET3, BIT(12) | BIT(11));
+	regmap_write(hw->map[DOS_BUS], DOS_SW_RESET3, 0);
+	if (av1->started)
+		aml_av1_restore_refs(hw);
+	regmap_write(hw->map[DOS_BUS], HEVC_ASSIST_MBOX0_CLR_REG, 1);
+	regmap_write(hw->map[DOS_BUS], HEVC_DEC_STATUS_REG, AOM_AV1_SEARCH_HEAD);
+	regmap_write(hw->map[DOS_BUS], HEVC_MPSR, 1);
+	av1->started = true;
+
+	/*
+	 * Uninterruptible on purpose: a signal must not abandon a decode the
+	 * hardware is still running - see the note in vp9.c.
+	 */
+	ret = wait_event_timeout(ctx->queue, ctx->int_cond,
+				 msecs_to_jiffies(AV1_TIMEOUT_MS));
+	if (!ret) {
+		/*
+		 * Report the failure and let device_run() cancel the job.
+		 * Finishing it here as well was a double completion: the
+		 * caller runs its own error path on a negative return, and
+		 * the media core warns about the second one.
+		 */
+		dev_err(hw->dev, "av1: decode timeout, status %02x pc %08x\n",
+			hw->hevc_irq_status,
+			read_dos_reg(hw, HEVC_MPC_E));
+		hw->hevc_dirty = true;
+		ret = -ETIMEDOUT;
+	} else {
+		ret = 0;
+	}
+	ctx->int_cond = 0;
+	return ret;
+}
diff --git a/drivers/media/platform/amlogic/vdec/av1.h b/drivers/media/platform/amlogic/vdec/av1.h
new file mode 100644
index 000000000000..97ddbbe61f21
--- /dev/null
+++ b/drivers/media/platform/amlogic/vdec/av1.h
@@ -0,0 +1,308 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * AV1 bring-up for the S4 HEVC/AV1 core.
+ *
+ * Register addresses are taken from Amlogic's own headers - khadas/linux
+ * branch khadas-vim1s-r, include/linux/amlogic/media/registers/regs/hevc_regs.h
+ * (VIM1S is S905Y4, the same S4 family) - and cross-checked against mainline
+ * drivers/staging/media/meson/vdec/hevc_regs.h, which byte-addresses the same
+ * block (HEVC_ASSIST_SCRATCH_0 0xc300 there == word 0x30c0 here).
+ *
+ * The sequence this file implements is Amlogic's vav1_prot_init(), from
+ * media_modules branch khadas-vim1s-r,
+ * drivers/frame_provider/decoder_v4l/vav1/vav1.c.
+ */
+
+#ifndef AML_VDEC_AV1_H_
+#define AML_VDEC_AV1_H_
+
+#include "aml_vdec_hw.h"
+
+/* Assist block */
+#define HEVC_ASSIST_MMU_MAP_ADDR     REG_ALIGN(0x3009)
+#define HEVC_ASSIST_SCRATCH_2        REG_ALIGN(0x30c2)
+#define HEVC_ASSIST_SCRATCH_5        REG_ALIGN(0x30c5)
+#define HEVC_ASSIST_SCRATCH_8        REG_ALIGN(0x30c8)
+#define HEVC_ASSIST_SCRATCH_9        REG_ALIGN(0x30c9)
+#define HEVC_ASSIST_SCRATCH_7        REG_ALIGN(0x30c7)
+#define HEVC_ASSIST_SCRATCH_L        REG_ALIGN(0x30d5)
+#define HEVC_ASSIST_SCRATCH_E        REG_ALIGN(0x30ce)
+#define HEVC_ASSIST_SCRATCH_G        REG_ALIGN(0x30d0)
+#define HEVC_ASSIST_SCRATCH_H        REG_ALIGN(0x30d1)
+#define HEVC_ASSIST_SCRATCH_I        REG_ALIGN(0x30d2)
+#define HEVC_ASSIST_SCRATCH_J        REG_ALIGN(0x30d3)
+#define HEVC_ASSIST_SCRATCH_K        REG_ALIGN(0x30d4)
+#define HEVC_ASSIST_SCRATCH_M        REG_ALIGN(0x30d6)
+#define HEVC_ASSIST_SCRATCH_N        REG_ALIGN(0x30d7)
+
+/*
+ * Amlogic overloads the scratch file rather than giving these registers real
+ * names, and the aliases collide: LMEM_DUMP_ADR and NAL_SEARCH_CTL are both
+ * scratch I.  vav1_prot_init() writes the constant 8 there and run() then
+ * overwrites it with the lmem address, so the address is what the microcode
+ * actually sees.
+ *
+ * For the AV1 microcode scratch I is LMEM_DUMP_ADR and nothing else: it DMAs
+ * its local-memory dump to whatever address the register holds.  Leaving a
+ * small control value there aims that DMA at low physical memory and oopses the
+ * board - measured.  NAL_SEARCH_CTL is a leftover name from the HEVC microcode.
+ */
+#define HEVC_DEC_STATUS_REG          HEVC_ASSIST_SCRATCH_0
+/* PIC_END_LCU_COUNT aliases scratch 2 in the reference. */
+#define PIC_END_LCU_COUNT            HEVC_ASSIST_SCRATCH_2
+#define HEVC_RPM_BUFFER              HEVC_ASSIST_SCRATCH_1
+#define AOM_AV1_DAALA_TOP_BUFFER     HEVC_ASSIST_SCRATCH_5
+#define HEVC_WAIT_FLAG               HEVC_ASSIST_SCRATCH_E
+#ifndef DEBUG_REG1
+#define DEBUG_REG1                   HEVC_ASSIST_SCRATCH_G
+#endif
+#ifndef LMEM_DUMP_ADR
+#define LMEM_DUMP_ADR                HEVC_ASSIST_SCRATCH_I
+#endif
+#ifndef NAL_SEARCH_CTL
+#define NAL_SEARCH_CTL               HEVC_ASSIST_SCRATCH_I
+#endif
+#define DECODE_MODE                  HEVC_ASSIST_SCRATCH_J
+#define DECODE_STOP_POS              HEVC_ASSIST_SCRATCH_K
+#define HEVC_DECODE_COUNT            HEVC_ASSIST_SCRATCH_M
+#define HEVC_DECODE_SIZE             HEVC_ASSIST_SCRATCH_N
+#define HEVC_AUX_ADR                 HEVC_ASSIST_SCRATCH_L
+#define HEVC_AUX_DATA_SIZE           HEVC_ASSIST_SCRATCH_7
+
+/*
+ * Commands the host leaves in HEVC_DEC_STATUS_REG, and the status values the
+ * microcode writes back into the same register.
+ */
+#define AOM_AV1_DEC_IDLE             0
+#define AOM_AV1_DECODE_SLICE         5
+#define AOM_AV1_SEARCH_HEAD          6
+#define AOM_AV1_HEAD_PARSER_DONE     0xf0
+#define AOM_AV1_SEQ_HEAD_PARSER_DONE 0xf2
+#define AOM_AV1_FRAME_HEAD_PARSER_DONE 0xf3
+#define AOM_AV1_FRAME_PARSER_DONE    0xf4
+#define AOM_AV1_DEC_PIC_END          0xe0
+
+/* Microcode status values written into HEVC_DEC_STATUS_REG. */
+#define HEVC_ACTION_DONE             0xff
+#define AOM_DECODE_BUFEMPTY          0x20
+#define AOM_DECODE_TIMEOUT           0x21
+#define AOM_SEARCH_BUFEMPTY          0x22
+#define AOM_DECODE_OVER_SIZE         0x23
+#define AOM_EOS                      0x24
+#define AOM_NAL_DECODE_DONE          0x25
+
+#define DECODE_MODE_MULTI_FRAMEBASE  ((0x80 << 24) | 2)
+
+/* Parser / stream front end */
+#define HEVC_STREAM_CONTROL          REG_ALIGN(0x3101)
+#define HEVC_STREAM_FIFO_CTL         REG_ALIGN(0x3107)
+#define HEVC_SHIFT_CONTROL           REG_ALIGN(0x3108)
+#define HEVC_SHIFT_STARTCODE         REG_ALIGN(0x3109)
+#define HEVC_SHIFT_EMULATECODE       REG_ALIGN(0x310a)
+#define HEVC_SHIFT_STATUS            REG_ALIGN(0x310b)
+#define HEVC_CABAC_CONTROL           REG_ALIGN(0x3110)
+#define HEVC_PARSER_CMD_WRITE        REG_ALIGN(0x3112)
+#define HEVC_PARSER_CORE_CONTROL     REG_ALIGN(0x3113)
+#define HEVC_PARSER_INT_CONTROL      REG_ALIGN(0x3120)
+#define HEVC_PARSER_IF_CONTROL       REG_ALIGN(0x3122)
+#define HEVC_PARSER_MEM_WR_ADDR      REG_ALIGN(0x312d)
+#define HEVC_PARSER_MEM_RW_DATA      REG_ALIGN(0x312e)
+#define HEVC_PARSER_CMD_SKIP_0       REG_ALIGN(0x3128)
+#define HEVC_PARSER_CMD_SKIP_1       REG_ALIGN(0x3129)
+#define HEVC_PARSER_CMD_SKIP_2       REG_ALIGN(0x312a)
+
+/* MPRED, IPP, deblock, SAO, compression */
+#define HEVC_MPRED_CTRL0             REG_ALIGN(0x3201)
+#define HEVC_MPRED_ABV_START_ADDR    REG_ALIGN(0x3212)
+#define HEVC_MPRED_MV_WR_START_ADDR  REG_ALIGN(0x3213)
+#define HEVC_MPRED_MV_WPTR           REG_ALIGN(0x3215)
+#define HEVC_MPRED_MV_WR_ROW_JUMP    REG_ALIGN(0x3217)
+#define HEVC_MPRED_MV_RD_ROW_JUMP    REG_ALIGN(0x3218)
+#define HEVC_MPRED_MV_RD_START_ADDR  REG_ALIGN(0x3214)
+#define HEVC_MPRED_MV_RPTR           REG_ALIGN(0x3216)
+#define HEVC_MPRED_CURR_LCU          REG_ALIGN(0x3219)
+#define HEVC_MPRED_CTRL3             REG_ALIGN(0x321d)
+/*
+ * L0_REF00..0F occupy 0x3220..0x322f: mainline's hevc_regs.h has
+ * HEVC_MPRED_L0_REF00_POC at byte 0xc880 and L1_REF00_POC at 0xc8c0, so the
+ * L0 bank is 16 registers long.  config_mpred_hw() uses REF00 for the current
+ * order hint and REF03..05 for the reference slot indices and their hints.
+ */
+#define HEVC_MPRED_L0_REF00_POC      REG_ALIGN(0x3220)
+#define HEVC_MPRED_L0_REF01_POC      REG_ALIGN(0x3221)
+#define HEVC_MPRED_L0_REF02_POC      REG_ALIGN(0x3222)
+#define HEVC_MPRED_L0_REF03_POC      REG_ALIGN(0x3223)
+#define HEVC_MPRED_L0_REF04_POC      REG_ALIGN(0x3224)
+#define HEVC_MPRED_L0_REF05_POC      REG_ALIGN(0x3225)
+#define HEVC_MPRED_L0_REF06_POC      REG_ALIGN(0x3226)
+#define HEVC_MPRED_L0_REF07_POC      REG_ALIGN(0x3227)
+#define HEVC_MPRED_L0_REF08_POC      REG_ALIGN(0x3228)
+#define HEVC_MPRED_L0_REF09_POC      REG_ALIGN(0x3229)
+#define HEVC_MPRED_L0_REF10_POC      REG_ALIGN(0x322a)
+#define HEVC_MPRED_L0_REF11_POC      REG_ALIGN(0x322b)
+#define HEVC_MPRED_MV_RPTR_1         REG_ALIGN(0x3263)
+#define HEVC_MPRED_MV_RPTR_2         REG_ALIGN(0x3264)
+
+#define MPRED_CTRL0_MV_WR_EN         BIT(10)
+#define MPRED_CTRL0_MV_RD_EN         BIT(11)
+#define HEVC_MPRED_CTRL4             REG_ALIGN(0x324c)
+#define HEVCD_IPP_TOP_CNTL           REG_ALIGN(0x3400)
+#define HEVCD_IPP_LINEBUFF_BASE      REG_ALIGN(0x3409)
+/*
+ * Frame-buffer address table.  TBL_DATA is not in the vendor header shipped
+ * with this branch; mainline's hevc_regs.h names it 0xd190, i.e. word 0x3464,
+ * one past the RDATA port.
+ */
+#define HEVCD_MPP_ANC2AXI_TBL_CONF_ADDR   REG_ALIGN(0x3460)
+#define HEVCD_MPP_ANC2AXI_TBL_DATA        REG_ALIGN(0x3464)
+#define HEVCD_MPP_ANC_CANVAS_ACCCONFIG_ADDR REG_ALIGN(0x34c0)
+#define HEVCD_MPP_ANC_CANVAS_DATA_ADDR    REG_ALIGN(0x34c1)
+#define AV1_SKIP_MODE_INFO           REG_ALIGN(0x316c)
+#define PARSER_REF_SCALE_ENBL        REG_ALIGN(0x316b)
+#define AV1D_MPP_REF_SCALE_ENBL      REG_ALIGN(0x3441)
+/* Motion-compensation reference cache: mainline hevc_regs.h 0xd3c0..0xd3c8. */
+#define HEVCD_MCRCC_CTL1             REG_ALIGN(0x34f0)
+#define HEVCD_MCRCC_CTL2             REG_ALIGN(0x34f1)
+#define HEVCD_MCRCC_CTL3             REG_ALIGN(0x34f2)
+#define HEVCD_MPP_DECOMP_CTL1        REG_ALIGN(0x34c2)
+#define HEVCD_MPP_DECOMP_CTL2        REG_ALIGN(0x34c3)
+#define HEVC_DBLK_CFG3               REG_ALIGN(0x3503)
+#define HEVC_DBLK_CFG4               REG_ALIGN(0x3504)
+#define HEVC_DBLK_CFG5               REG_ALIGN(0x3505)
+#define HEVC_SAO_CTRL5               REG_ALIGN(0x3623)
+#define HEVC_CM_BODY_LENGTH          REG_ALIGN(0x3627)
+#define HEVC_CM_HEADER_LENGTH        REG_ALIGN(0x3629)
+#define HEVC_CM_HEADER_OFFSET        REG_ALIGN(0x362b)
+#define HEVC_SAO_MMU_VH0_ADDR        REG_ALIGN(0x363a)
+#define HEVC_SAO_MMU_VH1_ADDR        REG_ALIGN(0x363b)
+#define HEVC_SAO_MMU_DMA_CTRL        REG_ALIGN(0x363e)
+#define HEVC_IQIT_SCALELUT_WR_ADDR   REG_ALIGN(0x3702)
+#define HEVC_IQIT_SCALELUT_DATA      REG_ALIGN(0x3704)
+#define HEVC_PSCALE_CTRL             REG_ALIGN(0x3911)
+
+/* Stream FIFO the microcode fetches from */
+#define HEVC_STREAM_START_ADDR       REG_ALIGN(0x3102)
+#define HEVC_STREAM_END_ADDR         REG_ALIGN(0x3103)
+#define HEVC_STREAM_WR_PTR           REG_ALIGN(0x3104)
+#define HEVC_STREAM_RD_PTR           REG_ALIGN(0x3105)
+#define HEVC_STREAM_LEVEL            REG_ALIGN(0x3106)
+#define HEVC_SHIFT_BYTE_COUNT        REG_ALIGN(0x310d)
+
+/* SAO / output */
+#define HEVC_SAO_CTRL0               REG_ALIGN(0x3601)
+#define HEVC_SAO_CTRL1               REG_ALIGN(0x3602)
+#define HEVC_SAO_CTRL9               REG_ALIGN(0x362d)
+#define HEVC_SAO_Y_START_ADDR        REG_ALIGN(0x360b)
+#define HEVC_SAO_Y_LENGTH            REG_ALIGN(0x360c)
+#define HEVC_SAO_C_START_ADDR        REG_ALIGN(0x360d)
+#define HEVC_SAO_C_LENGTH            REG_ALIGN(0x360e)
+#define HEVC_SAO_Y_WPTR              REG_ALIGN(0x360f)
+#define HEVC_SAO_C_WPTR              REG_ALIGN(0x3610)
+#define HEVC_CM_BODY_START_ADDR      REG_ALIGN(0x3626)
+#define HEVC_CM_HEADER_START_ADDR    REG_ALIGN(0x3628)
+#define HEVCD_IPP_AXIIF_CONFIG       REG_ALIGN(0x340b)
+#define HEVC_FGS_TABLE_START         REG_ALIGN(0x3666)
+#define HEVC_FGS_TABLE_LENGTH        REG_ALIGN(0x3667)
+
+/* Deblock / CDEF */
+#define HEVC_DBLK_CFG9               REG_ALIGN(0x3509)
+#define HEVC_DBLK_CFGA               REG_ALIGN(0x350a)
+#define HEVC_DBLK_CFGB               REG_ALIGN(0x350b)
+#define HEVC_DBLK_CDEF0              REG_ALIGN(0x3515)
+#define HEVC_DBLK_CDEF1              REG_ALIGN(0x3516)
+#define HEVC_DBLK_UPS1               REG_ALIGN(0x351c)
+#define HEVC_DBLK_UPS2               REG_ALIGN(0x351d)
+#define HEVC_DBLK_UPS3               REG_ALIGN(0x351e)
+#define HEVC_DBLK_UPS4               REG_ALIGN(0x351f)
+#define HEVC_DBLK_UPS5               REG_ALIGN(0x3520)
+#define AV1_UPSCALE_X0_QN            REG_ALIGN(0x316e)
+#define AV1_UPSCALE_STEP_QN          REG_ALIGN(0x316f)
+#define HEVC_DBLK_DBLK0              REG_ALIGN(0x3523)
+#define HEVC_DBLK_DBLK1              REG_ALIGN(0x3524)
+#define HEVC_DBLK_DBLK2              REG_ALIGN(0x3525)
+
+/* AV1-specific */
+#define AV1_GMC_PARAM_BUFF_ADDR      REG_ALIGN(0x316d)
+#define AV1_QUANT_WR                 REG_ALIGN(0x3146)
+#define AV1_SEG_W_ADDR               REG_ALIGN(0x3165)
+#define AV1_SEG_R_ADDR               REG_ALIGN(0x3166)
+#define AOM_AV1_CDF_BUFFER_W         HEVC_ASSIST_SCRATCH_8
+#define AOM_AV1_CDF_BUFFER_R         HEVC_ASSIST_SCRATCH_9
+#define AOM_AV1_SEGMENT_FEATURE      AV1_QUANT_WR
+#define AV1D_MPP_REFINFO_TBL_ACCCONFIG REG_ALIGN(0x3442)
+#define AV1D_MPP_REFINFO_DATA          REG_ALIGN(0x3443)
+#define AV1_REF_NO_SCALE             BIT(14)
+
+/* Amlogic's endian presets, from vav1.c */
+#define HEVC_CONFIG_LITTLE_ENDIAN    ((0xff0 << 8) | 0xf)
+
+int aml_av1_bringup(struct aml_vdec_hw *hw, u32 width, u32 height);
+int aml_av1_feed(struct aml_vdec_hw *hw, const char *fw_name, u32 kick);
+int aml_av1_feed_buf(struct aml_vdec_hw *hw, const void *data, size_t size,
+		     u32 kick);
+int aml_av1_config_picture(struct aml_vdec_hw *hw);
+void aml_av1_dump_stream_state(struct aml_vdec_hw *hw);
+void aml_av1_dump_ucode_output(struct aml_vdec_hw *hw);
+void aml_av1_dump_params(struct aml_vdec_hw *hw);
+u32 aml_av1_frame_type(struct aml_vdec_hw *hw);
+void aml_av1_frame_done(struct aml_vdec_hw *hw);
+void aml_av1_restore_refs(struct aml_vdec_hw *hw);
+void aml_av1_dump_output(struct aml_vdec_hw *hw);
+int aml_av1_save_nv12(struct aml_vdec_hw *hw, const char *path, bool append);
+
+/*
+ * Indices into the unscrambled RPM block, counted from union param_u in
+ * av1_global.h (INTER_REFS_PER_FRAME 7, REF_FRAMES 8).
+ */
+#define AV1_RPM_PROFILE              0
+#define AV1_RPM_ORDER_HINT_BITS_M1   9
+#define AV1_RPM_ENABLE_ORDER_HINT   10
+#define AV1_RPM_ALLOW_REF_FRAME_MVS 29
+#define AV1_RPM_REF_ORDER_HINT0     48
+#define AV1_RPM_MAX_FRAME_WIDTH      4
+#define AV1_RPM_MAX_FRAME_HEIGHT     5
+#define AV1_RPM_FRAME_TYPE          14
+#define AV1_RPM_REFRESH_FRAME_FLAGS 17
+#define AV1_RPM_ORDER_HINT          21
+#define AV1_RPM_PRIMARY_REF_FRAME   22
+#define AV1_PRIMARY_REF_NONE         7
+#define AV1_RPM_REMAPPED_REF_IDX0   34
+#define AV1_RPM_SHOW_FRAME          15
+#define AV1_RPM_REFERENCE_MODE      28
+#define AV1_RPM_SHOW_EXISTING_FRAME 13
+#define AV1_RPM_EXISTING_FRAME_IDX  33
+#define AV1_RPM_FRAME_WIDTH         24
+#define AV1_RPM_FRAME_HEIGHT        27
+#define AV1_RPM_BIT_DEPTH           56
+#define AV1_RPM_SEQ_FLAGS           57
+#define AV1_RPM_LF_SHARPNESS        60
+#define AV1_RPM_LF_MODE_REF_DELTA   61
+#define AV1_RPM_LF_REF_DELTAS_0     62
+#define AV1_RPM_LF_MODE_DELTAS_0    70
+#define AV1_RPM_LF_LEVEL_0          72
+#define AV1_RPM_LF_LEVEL_1          73
+#define AV1_RPM_LF_LEVEL_U          74
+#define AV1_RPM_LF_LEVEL_V          75
+#define AV1_RPM_SEGMENTATION_EN     76
+#define AV1_RPM_COUNT              128
+void aml_av1_teardown(struct aml_vdec_hw *hw);
+
+#define AV1_TIMEOUT_MS 1000
+
+/* Sanity bounds on a parsed picture size, see aml_av1_config_picture(). */
+#define AV1_MIN_DIM 16
+#define AV1_MAX_DIM 4096
+
+/* Secure microcode load: AV1 in MMU mode, on the HEVC core. */
+#define AV1_FW_FORMAT_MMU  0x4156314d	/* 'M1VA' */
+#define AV1_FW_CORE_HEVC   2
+
+int aml_av1_init(void *priv);
+void aml_av1_exit(void *priv);
+int aml_av1_dec_run(void *priv);
+bool aml_av1_have_sequence(void);
+int aml_av1_feed_frame(struct aml_vdec_hw *hw, const void *data, size_t size);
+bool aml_av1_set_sequence(const void *ctrl);
+bool av1_buf_has_sequence(const void *data, size_t size);
+
+#endif
-- 
2.56.0

