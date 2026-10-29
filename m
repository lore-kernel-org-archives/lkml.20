Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246317;
	b=oKfkF5Qu0IrACUXYqIu780ZiP5du0D1yixbrM5kTvjDCeUg089obfVFSqCQKe2Vvx1Ob
	 N1RVNeIr1VVWK1RNdk7mqymVVjeLSzFWz5gholK7CmfWwyWmS6szyhAJ7ov3S3l20Sx2a
	 0+pHw8oKMnsJclRCFuwZnlONRCSeaVp2Imly/n9kHJ0DvoZ7OW1u8oawx02sPZptAh0hf
	 k8mCNwqVkDMuYEJJnKpZoFF/NntZdHlw1XZf2A8B64wLwPGfpsuIrDpDzf+FTdpW7/pHH
	 zxjsd7LHqffOW3sL2+UCG+GeaRHlHxDtMUg6/kaIP7h5JHdfggaGotuo9C1B+qRhz5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246317;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=IitDQFhKtqgRpu8GE5V4w5Y0rKV7sHqb+Hx4/EnSUE8=;
	b=sz3fpj/V040dKxfS0cQx2+elRZ/grwB/PsKqEWlJwMI1QcPmFVOd0vwyiNXZPk9Hx4LT
	 DVoP9ovTIb4Ybkr9+Qw5LvTUYUyEW8h2yjSz73GrrSh6CuPiG7YA2CODskl3XzcMjl7pC
	 5ugwSL2hRvd9C19pgEQ998CabGGjApTPI4CZzmjS2H9aMFTF/ppm/kFZPcdoMvdnEsLsH
	 wHo9uKNGARATuWecZgSHlZMiEHL3QFbOvt9YzK/zOhfsSZnF/Qrwo8A4GrDqEeoJ6/wxq
	 jOYCv5G6XGSQhLg6ZyaAhY6EiJQ0CRQsuK1e15athy9obdLL2cY0FVlywW+SPR0wUpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505EF606A31C;
	Thu, 29 Oct 2026 03:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1793246295t5130f8d4
X-QQ-Originating-IP: S90WTqvWebEBUkiR360y1QFuVLJH+DfVWt/R83M8Km0=
Received: from [192.168.30.244] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 11:58:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13390263904353373324
EX-QQ-RecipientCnt: 17
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 29 Oct 2026 11:58:06 +0800
Subject: [PATCH 1/5] media: iris: support decode-order output on HFI gen2
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
Message-Id: <20261029-iris-va-fixes-v1-1-44a2783f782b@radxa.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
In-Reply-To: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>, 
 Deepak Sikri <sikrid@qti.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Loic Minier <loic.minier@oss.qualcomm.com>, 
 Jason Pettit <jason.pettit@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6741; i=sophon@radxa.com;
 h=from:subject:message-id; bh=tqSgnD3fJj87t7jJTY0ry9Nz8SsCcXKGxAL9rdreVT0=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFmPjgQdrz594InEv0m5pww2v18hEHlZ6Unw0XAXmZmxq
 1qNP6xe21HKwiDGxSArpsiiEM8wl70y99pTsVI9mDmsTCBDGLg4BWAi154x/GY15mmo27nIxt7n
 8fzdM87K+Qmu/7cv9ngXa9KydQzxhT4M/30+Vbnmmngq2OfZHIhalsGkWOWzJOx3m/v5d1Hqni2
 rGQE=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MB1Li/8byKSylejSfikcV8K+gPmjAQew7ZlvM4J1Ft5Oksh/qceseejd
	sl1vlM7CQAylSTwQgC1NwpX1Fd/UsVprX09Kt9Aansz9NxmxAMoNdLAJdWZfpzWpfbnEjvG
	pPDAXzyJbwBpIlbbHPyie8pM3TYAmZkC12kvlGm6jkhFuyBi/GQIII0lGH18j4r5X+EL89d
	IHlvpezWMeIFV4jata5if+/+WOAN9zPiiHlUdy1cxr5KE1W3IISYeMwo8zL/wplSQcIAzsm
	YeJ+SnDwWmmrmhYUWYemO1a5e9IoBTCuxz3hDZTmvB6KgRUwckhfZESz2Vkna0xgrDr9WFv
	mqDBgAs4sTV0zNA8YAHuKDtx5FLerZIPnl4CaGQQtXtldZckUDcrgGm/XJrRuIcTc1ScqWT
	MmES5ehdqgKDShj+C5cAoFS6SrLWwrAV6Re1wYKz6DWvsiZytMBpcXc1f5CasYm3Bd3XyzW
	qoMeIfr+0YqLTW8diaWizna9hFU38bBhHEZU1zITeJhj0rdxA20RihV8zOCzgKWPBueLjwW
	7uvzJg/JconGK01/EllR1JsjkEMN9VhkeWPONGlZ5wHVEBCb3011f7lxic5HIXepH8MV7sk
	mMBzJD0NkA2Fq9bZHIFbSXoWS8RIu6rt82EIfAiF1kq0bTVo8h8Haa9KwxH5mhn9sZYbrWg
	PPkBvR49cYhUTQqwGTvkoHkQsuezvnN9TUuAe+yehm8o90xYChftXxukPgYM0tApIB77C5N
	quiHmIZgN6MKOKwsTdb+MHHvzYLubsDwWs3O1P1mwzFHAq7ZhnO9XXdTkrUZ91GnisWPe4h
	gdAGkWOXJ7wT/Em5ildXl1ieNQXap+8iUaPIlBxHepkwi7KB0Uuo9OqIgrNSbQg/JaYAu3r
	/CizmfB2sQxH9qzjaEiFRm3GqCvkq1fc1JKiqOzhJt1kQEYQ/U6pI/yS8Rfu6p5cAWtWMxq
	zyV6Xw4zUxXOhn7eb+NfoFOtG6UKsKh2OckB8SCi5Fq5Tal1GccVoR57AxC1LRaEXUK8B7q
	bxLgdpVnBznv/FZ9RAOYl/nFcPNgM=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Synchronous per-picture clients such as VA-API can stall when firmware
holds decoded pictures for display reordering while the client waits for
the current picture before submitting more input.

Expose the decoder display-delay controls on HFI gen2, with a zero delay
selecting decode-order output. Keep display-order output as the default.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c        |  8 ++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c     | 20 ++++++++++++++++++++
 .../media/platform/qcom/iris/iris_hfi_gen2_command.c | 18 ++++++++++++++++++
 .../media/platform/qcom/iris/iris_hfi_gen2_defines.h |  1 +
 .../media/platform/qcom/iris/iris_platform_common.h  |  2 ++
 5 files changed, 49 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 4f2633bbb49f..1dbea37c93c3 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -155,6 +155,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
+		return DISPLAY_DELAY_ENABLE;
+	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
+		return DISPLAY_DELAY;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
 		return REQUEST_SYNC_FRAME;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
@@ -306,6 +310,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case DISPLAY_DELAY_ENABLE:
+		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE;
+	case DISPLAY_DELAY:
+		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY;
 	case REQUEST_SYNC_FRAME:
 		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
 	case SLICE_MODE:
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..65af61b63a29 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -842,6 +842,22 @@ static const struct platform_inst_fw_cap inst_fw_cap_milos_enc[] = {
 };
 
 static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
+	{
+		.cap_id = DISPLAY_DELAY_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_DECODE_ORDER_OUTPUT,
+		.flags = CAP_FLAG_INPUT_PORT,
+	},
+	{
+		.cap_id = DISPLAY_DELAY,
+		.min = 0,
+		.max = 0,
+		.step_or_mask = 1,
+		.value = 0,
+	},
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
@@ -1818,6 +1834,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
+	HFI_PROP_DECODE_ORDER_OUTPUT,
 	HFI_PROP_BITSTREAM_RESOLUTION,
 	HFI_PROP_CROP_OFFSETS,
 	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
@@ -1830,6 +1847,7 @@ static const u32 sm8550_vdec_input_config_params_default[] = {
 };
 
 static const u32 sm8550_vdec_input_config_param_hevc[] = {
+	HFI_PROP_DECODE_ORDER_OUTPUT,
 	HFI_PROP_BITSTREAM_RESOLUTION,
 	HFI_PROP_CROP_OFFSETS,
 	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
@@ -1841,6 +1859,7 @@ static const u32 sm8550_vdec_input_config_param_hevc[] = {
 };
 
 static const u32 sm8550_vdec_input_config_param_vp9[] = {
+	HFI_PROP_DECODE_ORDER_OUTPUT,
 	HFI_PROP_BITSTREAM_RESOLUTION,
 	HFI_PROP_CROP_OFFSETS,
 	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
@@ -1850,6 +1869,7 @@ static const u32 sm8550_vdec_input_config_param_vp9[] = {
 };
 
 static const u32 sm8550_vdec_input_config_param_av1[] = {
+	HFI_PROP_DECODE_ORDER_OUTPUT,
 	HFI_PROP_BITSTREAM_RESOLUTION,
 	HFI_PROP_CROP_OFFSETS,
 	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07..a285e6fc8728 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -665,6 +665,23 @@ static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
 						  sizeof(u32));
 }
 
+static int iris_hfi_gen2_set_decode_order_output(struct iris_inst *inst, u32 plane)
+{
+	struct platform_inst_fw_cap *cap = &inst->fw_caps[DISPLAY_DELAY_ENABLE];
+	u32 decode_order = cap->value;
+
+	/* Leave the firmware default unchanged unless userspace sets the control. */
+	if (!(cap->flags & CAP_FLAG_CLIENT_SET))
+		return 0;
+
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_DECODE_ORDER_OUTPUT,
+						  HFI_HOST_FLAGS_NONE,
+						  HFI_PORT_BITSTREAM,
+						  HFI_PAYLOAD_U32,
+						  &decode_order, sizeof(decode_order));
+}
+
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_firmware_data *fdata = inst->core->iris_firmware_data;
@@ -691,6 +708,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
 		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
+		{HFI_PROP_DECODE_ORDER_OUTPUT,        iris_hfi_gen2_set_decode_order_output    },
 	};
 
 	if (inst->domain == DECODER) {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 2b8b057d35a9..e89ed4075526 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -130,6 +130,7 @@ enum hfi_flip {
 
 #define HFI_PROP_FLIP				0x0300014c
 #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
+#define HFI_PROP_DECODE_ORDER_OUTPUT		0x0300015b
 #define HFI_PROP_PICTURE_TYPE			0x03000162
 #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375..aa8cd2e1b3f1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -211,6 +211,8 @@ enum platform_inst_fw_cap_type {
 	SLICE_MODE,
 	SLICE_MAX_BYTES,
 	SLICE_MAX_MB,
+	DISPLAY_DELAY_ENABLE,
+	DISPLAY_DELAY,
 	INST_FW_CAP_MAX,
 };
 

-- 
2.56.0

