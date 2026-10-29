Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246327;
	b=RVAJkS8A+7UkzzSOrXWp5l2AtThBYnq3J7KGsGyJJvwI1uRbRbx8JABGHD+rYX4zfrAX
	 MCu/2xwxneGvLPhh+BDPpEjCr6amDbNGH343GSxDOEdjNuIH1gkF5X4Z+4kecrIMhGnVf
	 xDasuUnN5akY6SKlOXZF07FWX9Kf5Rt5UdYml8Wuk2V+KA+5IuD27d+8mpfLCaD2vamc5
	 yHSUw9qbPmVy2FB3pNQHLml7EXy5+HjAFU7D8qnY3woYdXW2JtK2QE9GLptEI7awiBUvW
	 JFFvnpCLOsGul2onRpoJRe/h2eziL3g4/A689KQb4vC0k5z3Irn20H+bLFAZJJRhZXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246327;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=UnM7fa5OKLFUdUnybFpPlf988tB6PtOKfhUOyiZJJwE=;
	b=pgTM8VXM9757OSqp6FhrzlE2SMeM+vGZCWjVh5dj8rFyG5IvT8Edea6kSVz2Vp+gXoJ/
	 4QmB3tA4/Zf1KXtwC7eTtiPxrh50kCeq31JUSfqVb9jrglY/TPR2i+Jq3f6VLJGYYA0Aj
	 C9HvH8cllbB2iyXOo3SZxA6TDbZwFIHP2d/RDw2exW4LcsfW66mMflM/R70tLZvLnLANw
	 msR9sjXrO05r7Ij6Nh30qTNBbU8eH2bAhVBqLM+Q4W12Fxu0qFAlcxnUS3sJxUH50fHru
	 Icn8lds+0j3GjOIpYMlDxUTjwJ8iDr5R82oG7Q8P5VVUIBPWgywxi2gcWkIHytwT0rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECF160A2608;
	Thu, 29 Oct 2026 03:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DECF160A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1793246302t2d94c815
X-QQ-Originating-IP: be9AWq515d0NkUO2lVpeELwqymAoS6ySv6EO4sLC7Ss=
Received: from [192.168.30.244] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 11:58:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2440577118377942026
EX-QQ-RecipientCnt: 17
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 29 Oct 2026 11:58:08 +0800
Subject: [PATCH 3/5] media: iris: Add deblocking filter controls for HFI
 gen2
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
Message-Id: <20261029-iris-va-fixes-v1-3-44a2783f782b@radxa.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11272; i=sophon@radxa.com;
 h=from:subject:message-id; bh=TfGAwh8dmX2rtisZflaZFdHzUfUXyGKRO6UicVYOIt0=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFmPjgR9CLnOlBD/qmZ6pGfUN93NegXWxqmF53L7AxdVq
 7nqzC3oKGVhEONikBVTZFGIZ5jLXpl77alYqR7MHFYmkCEMXJwCMJHfUYwMzx+tlnsp5izYsFG2
 TG/v+7VXxEuCD0apNthKhEfqOkrKMfx3mchWZZyQUFLimv8ueqmQ2u5f2YahEg5FzSkfA/fl32E
 FAA==
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MgTczLBQz4rS99im7eqDFd7rN54PVQqKkKtFdAi7I4evsVrFbzcxfrNx
	LMDNe9v98p5TLuIyfjZAJ8LxvfiR16AfkYhofpCjvLEGpePKNkm0bapOcwWrJCPrRbfMmCb
	KcQRregQnfGMhhFDVfmfBQ24JWrE19A7n6vWtz968Hrra0RmUnIhkvdGA24EIv+en1rHSrU
	q6Am/TEsC4VMdndoCTVEwu7UZb1y+1CCX3f8c8AjQ8LYJf93jv6zQHEngXDPtgdgDCWTsRB
	5LxiOvrOtmiUYXyElYM/fgihs/D6R/CwB41ydgWfGI1rkiHsN+aN/9gyDEcdW6XuZjYgTvK
	1hnYVly8zyRavlrZiNTHiCPySdyPaltLGYkoWIiInNdzjffMCbsCYq59qAjTNVHg6QBe4B/
	3omOMBigsJjuojOlzNyysreAWp+tIFv1YlGdiUyUt2QiMcDf0k+cRPqFh9zknrC+KuDdSi+
	x70yLTt18nVYo+tbLf1eqdJ16lrdHTn0XiMGCLVa+IY1QLrW2Io/ZqPxgRqrqWLTRXyCjVx
	rUz8VdklhnTfr8uDDPNP3WK4cr+sCYaNv8yC8+qgPYanTGOq1Ojh9y6VTRIqAJ/RXgd+fvM
	bpggvI0o18A4m+Xw7X8ab/PbHm6qbpI3UeGhfICDRBSemxVa4jcA0+CCH+9W6nhSWve6hcE
	Mvc75+hkRFqqHSqrHwz7I9KOoewnIY9on3b8oeiXQg4rd2kVXf6G+7ykbp1WBnThKRCDvF0
	gmu7OUd6hjhc/6SpYDYaXV23TxZGAaIPs949ocmmdlTru2Kf64V8m6zio4+kjt3Iq5eVudZ
	VStFfCbmRGm1LAHZhXztuUJMnQk6VGBFwghes/06Hheek14/OLlTtPPxfELJuiNfIlyaIt6
	r7ngHI6pkI+gSlg8cIBrRmcd7L40RwYt/NZ/Lu+dy1O9ILPBxm8UWlcxjHzPEeKeRtT+4R0
	Mw0IkbLcSikyWgm095NHWbtJdAGvhhOkTMo8KAThUloEdvxwvJehD7Eoh1TLyr9Rrxi67EU
	IeSFyy7mr6uS1DypbGAjzxADc54U1AU5gu525n9g==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

HFI gen2 encoders do not expose deblocking filter controls, preventing
applications from configuring the filter mode and offsets.

Add the standard V4L2 H.264 and HEVC loop filter controls.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  85 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 116 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   8 ++
 .../platform/qcom/iris/iris_platform_common.h      |   6 ++
 5 files changed, 216 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 1dbea37c93c3..a9b8124aca56 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -55,6 +55,18 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return GOP_SIZE;
 	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
 		return ENTROPY_MODE;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
+		return DEBLOCK_MODE_H264;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:
+		return DEBLOCK_ALPHA_H264;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:
+		return DEBLOCK_BETA_H264;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
+		return DEBLOCK_MODE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2:
+		return DEBLOCK_TC_HEVC;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:
+		return DEBLOCK_BETA_HEVC;
 	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
 		return MIN_FRAME_QP_H264;
 	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
@@ -210,6 +222,18 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_GOP_SIZE;
 	case ENTROPY_MODE:
 		return V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE;
+	case DEBLOCK_MODE_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE;
+	case DEBLOCK_ALPHA_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA;
+	case DEBLOCK_BETA_H264:
+		return V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA;
+	case DEBLOCK_MODE_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE;
+	case DEBLOCK_TC_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2;
+	case DEBLOCK_BETA_HEVC:
+		return V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2;
 	case MIN_FRAME_QP_H264:
 		return V4L2_CID_MPEG_VIDEO_H264_MIN_QP;
 	case MIN_FRAME_QP_HEVC:
@@ -884,6 +908,67 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
 				     &entropy_mode, sizeof(u32));
 }
 
+int iris_set_deblock_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 mode = inst->fw_caps[cap_id].value;
+	u32 alpha_tc, beta, hfi_value;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		if (cap_id != DEBLOCK_MODE_H264)
+			return 0;
+
+		switch (mode) {
+		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED:
+			mode = HFI_DEBLOCK_ALL_BOUNDARY;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED:
+			mode = HFI_DEBLOCK_DISABLE;
+			break;
+		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
+			mode = HFI_DEBLOCK_DISABLE_AT_SLICE_BOUNDARY;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		alpha_tc = inst->fw_caps[DEBLOCK_ALPHA_H264].value + 6;
+		beta = inst->fw_caps[DEBLOCK_BETA_H264].value + 6;
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		if (cap_id != DEBLOCK_MODE_HEVC)
+			return 0;
+
+		switch (mode) {
+		case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED:
+			mode = HFI_DEBLOCK_ALL_BOUNDARY;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED:
+			mode = HFI_DEBLOCK_DISABLE;
+			break;
+		case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
+			mode = HFI_DEBLOCK_DISABLE_AT_SLICE_BOUNDARY;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		alpha_tc = inst->fw_caps[DEBLOCK_TC_HEVC].value + 6;
+		beta = inst->fw_caps[DEBLOCK_BETA_HEVC].value + 6;
+	} else {
+		return 0;
+	}
+
+	/* Firmware expects offsets biased by 6, with alpha or HEVC tc in bits 23:16. */
+	hfi_value = alpha_tc << 16 | beta << 8 | mode;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_32_PACKED,
+					     &hfi_value, sizeof(hfi_value));
+}
+
 int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 08db80744420..82437f4e19c1 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -29,6 +29,7 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_deblock_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 65af61b63a29..a271858fd06a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -357,6 +357,64 @@ static const struct platform_inst_fw_cap inst_fw_cap_milos_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_entropy_mode_gen2,
 	},
+	{
+		.cap_id = DEBLOCK_MODE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
+		.max = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
+		.step_or_mask =
+			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED) |
+			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED) |
+			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
+		.value = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
+		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_deblock_gen2,
+	},
+	{
+		.cap_id = DEBLOCK_ALPHA_H264,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = DEBLOCK_BETA_H264,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = DEBLOCK_MODE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
+		.max = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
+		.step_or_mask =
+			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED) |
+			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED) |
+			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
+		.value = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED,
+		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_deblock_gen2,
+	},
+	{
+		.cap_id = DEBLOCK_TC_HEVC,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = DEBLOCK_BETA_HEVC,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
 	{
 		.cap_id = MIN_FRAME_QP_H264,
 		.min = MIN_QP_8BIT,
@@ -1309,6 +1367,64 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_entropy_mode_gen2,
 	},
+	{
+		.cap_id = DEBLOCK_MODE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
+		.max = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
+		.step_or_mask =
+			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED) |
+			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED) |
+			BIT(V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
+		.value = V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED,
+		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_deblock_gen2,
+	},
+	{
+		.cap_id = DEBLOCK_ALPHA_H264,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = DEBLOCK_BETA_H264,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = DEBLOCK_MODE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED,
+		.max = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY,
+		.step_or_mask =
+			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED) |
+			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED) |
+			BIT(V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY),
+		.value = V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED,
+		.hfi_id = HFI_PROP_DEBLOCKING_MODE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_deblock_gen2,
+	},
+	{
+		.cap_id = DEBLOCK_TC_HEVC,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = DEBLOCK_BETA_HEVC,
+		.min = -6,
+		.max = 6,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
 	{
 		.cap_id = MIN_FRAME_QP_H264,
 		.min = MIN_QP_8BIT,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index e89ed4075526..04e5429328eb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -57,6 +57,14 @@
 #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
 #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
 
+enum hfi_deblock_mode {
+	HFI_DEBLOCK_ALL_BOUNDARY			= 0x0,
+	HFI_DEBLOCK_DISABLE			= 0x1,
+	HFI_DEBLOCK_DISABLE_AT_SLICE_BOUNDARY	= 0x2,
+};
+
+#define HFI_PROP_DEBLOCKING_MODE			0x03000129
+
 enum hfi_rate_control {
 	HFI_RC_VBR_CFR		= 0x00000000,
 	HFI_RC_CBR_CFR		= 0x00000001,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index aa8cd2e1b3f1..75e56d10f5d0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -158,6 +158,12 @@ enum platform_inst_fw_cap_type {
 	FRAME_RC_ENABLE,
 	GOP_SIZE,
 	ENTROPY_MODE,
+	DEBLOCK_MODE_H264,
+	DEBLOCK_ALPHA_H264,
+	DEBLOCK_BETA_H264,
+	DEBLOCK_MODE_HEVC,
+	DEBLOCK_TC_HEVC,
+	DEBLOCK_BETA_HEVC,
 	MIN_FRAME_QP_H264,
 	MIN_FRAME_QP_HEVC,
 	MAX_FRAME_QP_H264,

-- 
2.56.0

