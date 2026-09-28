Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234FE47ECC2;
	Mon, 28 Sep 2026 21:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631621; cv=none; b=WtAw48ErXQXBjtErNgwgjbmu5lkjE11DXgJ26UYXLzyPIZUJl7BfWFHE6dhBaPpzPSBggVtWQXvhQJGlM6xe9eTVdLriz2XwekUt3EByQanEMp+2xWRWHoTmq17d4yV1ZP+xj5gpbDQ5d10n+jI8Vs3IkEJbGGMsdcuFW7CF9jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631621; c=relaxed/simple;
	bh=hfWhZM8U4fHGzeHFh+7EPIxb+hMMONGvK32WzSGxb98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gt/el/BBf1KYP08qXzPTVWxEZESzLpIwyQvKLeDuSYIwsk0BiaQn/x6HtlrHo7MbV8DNAIa++XCnlfXT1+VwdQH37oUH590U2pT7zYIIEtJ2kF0w9zF4e2+AsJS+9q4dpROG1VQLjb8n0mZZxJEizMzi/q1szjW7ZOz3KIysEHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M84mozde; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M84mozde"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CED78C4AF0B;
	Mon, 28 Sep 2026 21:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790631620;
	bh=hfWhZM8U4fHGzeHFh+7EPIxb+hMMONGvK32WzSGxb98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M84mozdeKjtCOyr6oLE77Qy6BiwLlsMpOzRSCk1SZXoFOgy1EColLDVANFH0kHDNQ
	 I+fL4GY8R3LEFES8gHqCeG26yvMhEgohPEL1U/ubbiCcxbdGuZKRMcDYCPB0pVk36y
	 UZzAw+yEk+UaERNz+KFIukjghlbXHOEA+nWUCPnKYRSYCYAe2ZA2ykcmwq71hmhJln
	 DgySbc/Ey1rPFPF+F6BoMChYj3c9fCJ9kMVqNFnTBxTh9LRK5xIGUXUM4oPW3FVn+X
	 D4PqljYwE/N0PbWt8c+cUbdQUDphtH/BWSbSMyFq92FvHhkRH3q/4CyFswUNpDVz21
	 qEi5wUIhsijpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3F1CA5FAA;
	Mon, 28 Sep 2026 21:40:20 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 28 Sep 2026 23:40:14 +0200
Subject: [PATCH 1/2] media: venus: vdec: signal EOS with a real buffer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-venus-vdec-eos-v1-1-6e9eb3ce9849@ixit.cz>
References: <20260928-venus-vdec-eos-v1-0-6e9eb3ce9849@ixit.cz>
In-Reply-To: <20260928-venus-vdec-eos-v1-0-6e9eb3ce9849@ixit.cz>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6504; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vCDdWAkbsGplSJCtuWEBTF+CELMSDAJ/2MZQs/NI1LM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqut7DsykiwDggyihecp+I/KzbUNEn3HjRyWeR7
 k05HR1pDniJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarrewwAKCRBgAj/E00kg
 co44D/oC2jGtewy5Jdth2XbeWf2h093GckURNLY6sg2sLU1Eon44e+93z/LirSQAcLwZbwF2G9g
 G8BgTqJwb0rnmqjdB+akSeZCBa+IfscFt3t/g8XE+rD7Nub71liz63tNCIqqlSPRpBVgOIyUGzV
 E4w4pZJAmDgkTp/I1Mes2aA6Lj58a8kmG2uDOxY5+KLMgRIFMr0yP3mxQTIVul/CVmLyZjakDhQ
 B9dMAARCU6otiBX9jQzKqjp2wpJ9hPlV+vtveTL3w0NliPmVSgK1BUyVboFj+ftGhcgE9dBr5FE
 wsT7N9WKY9XP8yufBdFXVmZIvzIvQBUJ3hUPf7nOip6ioj2b8VaQlVQezT3rnIQAGF4LyWD0LtH
 UaYxRQbpmdV5BYmY4q6YDUfwMQTEWBPmJ9MGn9tLNeE7TFGgpAdFmdiLclKcrRObKOUK7rYwWCC
 XCLWPk0FRWmh+WcnBL2u6lNId0Xp1L2+jW4BMPvtv7adsmFdo/tsy4EBFjO4sAuj48yGgOnqdWK
 /hf37Q8sNk5+Gq7ExeO+vSgH5BkOH3ZAZAGso7IPYYaAEo9DXWFF/y9dIzRhNS34j87bysmJCHT
 uG/KMsq0niEZidJU5ZztYs/IcT9uZqi3uNW9M2UadoEu9u/cUcFZBuahXowwGhgvxdxXtiZSI74
 niE4EGJQetErMDw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The decoder tells the firmware about the end of the stream with an empty
buffer command whose address is a dummy (0xdeadb000), because the host
has no input buffer to name. The SDM845 (Venus v4) firmware validates
that address and rejects it:

  IsBufferProtected(1087): VenusCoreCtrl: CP_UNKNOWN, buffer straddles
  CP & non-CP regions
  vDec_EmptyBuffer(1932): Invalidate buffer in ETB

and raises HFI_ERR_SESSION_FATAL, reported by the driver as

  qcom-venus aa00000.video-codec: session error: event id:1001 (deadb000)

Both queues are then put into an error state, so the drain never
completes and every V4L2_DEC_CMD_STOP ends the stream with an error:
GStreamer's poll() fails at end of file, ffmpeg aborts.

Allocate a small buffer the first time a decoder instance is drained and
use its device address for the EOS command, so the firmware gets an
address that is mapped and outside the protected regions. The firmware
then drains normally: all frames are returned and the last capture
buffer carries V4L2_BUF_FLAG_LAST. The NULL address used by old IRIS2
firmware is left alone.

Assisted-by: LLM
Fixes: beac82904a87 ("media: venus: make decoder compliant with stateful codec API")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/venus/core.h |  4 ++++
 drivers/media/platform/qcom/venus/vdec.c | 31 ++++++++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 46705a6667762..136bbeb3da156 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -452,16 +452,18 @@ enum venus_inst_modes {
  * @hprop:	a union used as a holder by get property
  * @core_acquired:	the Core has been acquired
  * @bit_depth:		current bitstream bit-depth
  * @pic_struct:		bitstream progressive vs interlaced
  * @next_buf_last: a flag to mark next queued capture buffer as last
  * @drain_active:	Drain sequence is in progress
  * @flags:	bitmask flags describing current instance mode
  * @dpb_ids:	DPB buffer ID's
+ * @eos_va:	kernel cookie of the buffer used to signal decoder EOS
+ * @eos_da:	device address of the buffer used to signal decoder EOS
  */
 struct venus_inst {
 	struct list_head list;
 	struct mutex lock;
 	struct venus_core *core;
 	struct clock_data clk_data;
 	struct list_head dpbbufs;
 	struct list_head internalbufs;
@@ -523,16 +525,18 @@ struct venus_inst {
 	union hfi_get_property hprop;
 	unsigned int core_acquired: 1;
 	unsigned int bit_depth;
 	unsigned int pic_struct;
 	bool next_buf_last;
 	bool drain_active;
 	enum venus_inst_modes flags;
 	struct ida dpb_ids;
+	void *eos_va;
+	dma_addr_t eos_da;
 };
 
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
 #if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
 #else
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6a43ea191da15..74591c7a820f5 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1,31 +1,35 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
  * Copyright (C) 2017 Linaro Ltd.
  */
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
 #include "hfi_venus_io.h"
 #include "hfi_parser.h"
 #include "core.h"
 #include "helpers.h"
 #include "vdec.h"
 #include "pm_helpers.h"
 
+#define VDEC_EOS_BUF_SIZE	SZ_4K
+
 /*
  * Three resons to keep MPLANE formats (despite that the number of planes
  * currently is one):
  * - the MPLANE formats allow only one plane to be used
  * - the downstream driver use MPLANE formats too
  * - future firmware versions could add support for >1 planes
  */
 static const struct venus_format vdec_formats[] = {
@@ -569,20 +573,38 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 		fdata.buffer_type = HFI_BUFFER_INPUT;
 		fdata.flags |= HFI_BUFFERFLAG_EOS;
 
 		/* Send NULL EOS addr for only IRIS2 (SM8250),for firmware <= 1.0.87.
 		 * SC7280 also reports "1.0.<hash>" parsed as 1.0.0; restricting to IRIS2
 		 * avoids misapplying this quirk and breaking VP9 decode on SC7280.
 		 */
 
-		if (IS_IRIS2(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
+		if (IS_IRIS2(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87)) {
 			fdata.device_addr = 0;
-		else
-			fdata.device_addr = 0xdeadb000;
+		} else {
+			/*
+			 * Firmware may validate the address of the EOS buffer,
+			 * so hand it a real one rather than a made-up address.
+			 */
+			if (!inst->eos_va) {
+				inst->eos_va = dma_alloc_attrs(inst->core->dev,
+							       VDEC_EOS_BUF_SIZE,
+							       &inst->eos_da,
+							       GFP_KERNEL,
+							       DMA_ATTR_NO_KERNEL_MAPPING);
+				if (!inst->eos_va) {
+					ret = -ENOMEM;
+					goto unlock;
+				}
+			}
+
+			fdata.device_addr = inst->eos_da;
+			fdata.alloc_len = VDEC_EOS_BUF_SIZE;
+		}
 
 		ret = hfi_session_process_buf(inst, &fdata);
 
 		if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING) {
 			inst->codec_state = VENUS_DEC_STATE_DRAIN;
 			inst->drain_active = true;
 		}
 	} else if (cmd->cmd == V4L2_DEC_CMD_START &&
@@ -1758,16 +1780,19 @@ static int vdec_open(struct file *file)
 static int vdec_close(struct file *file)
 {
 	struct venus_inst *inst = to_inst(file);
 
 	vdec_pm_get(inst);
 	cancel_work_sync(&inst->delayed_process_work);
 	venus_close_common(inst, file);
 	ida_destroy(&inst->dpb_ids);
+	if (inst->eos_va)
+		dma_free_attrs(inst->core->dev, VDEC_EOS_BUF_SIZE, inst->eos_va,
+			       inst->eos_da, DMA_ATTR_NO_KERNEL_MAPPING);
 	vdec_pm_put(inst, false);
 
 	kfree(inst);
 	return 0;
 }
 
 static const struct v4l2_file_operations vdec_fops = {
 	.owner = THIS_MODULE,

-- 
2.55.0


