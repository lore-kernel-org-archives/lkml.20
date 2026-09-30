Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C650A51CF6E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793048; cv=none; b=O1er6OaG3IWpcDf/t70BSu46xMAkJLSupS1dEutcNEKiEDCa5p9aQboVCMzlkFoOmATtOCaSR1NjOj8+GH4BnVIf8U1kvd2o73QwYIDADvSdskdI9Oq8NnSr28teNWR0lSEJ4xb3g2WVKaW3uWyu2uwETTIBB+HA6YrENQNuorc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793048; c=relaxed/simple;
	bh=qhDIKatvc8QjYzDdfJRdI//vvXfzsp3LwrBw+VlkXP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aReQM1nckl65jnAFWhBvRNI58Q4Ix7glAwB+02V2UtzWn04VUqwfRheESdwXXqC9jyL6b3T6icDP24nCuJw6pJK47sTm1prh6kMCkTzMmC0rcLg7RFQ6C6t9Wbz/0LdL0eitxVR4cUN7OwR08tzW5N4NUmux2puD+15mw30jWqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LVThRJZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOnJ5RIq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LVThRJZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOnJ5RIq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHeeZM1198586
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmkpKbva0YRJZzRy25xoes8lWSIWCREJBbQ88dr+fyg=; b=LVThRJZFiJsf0uet
	A6i5OYFe5rlalKljoZVhCsqswkxRZBfHNz/biMOVit80qC3FQevQ/iElM/NqiUr2
	7FraWWbv2OZKtEaMp7GDzE5zUyjKeQkRTvyKsQvHjoGF4L3rsOWeB0aYVeVeZgzy
	1uPNfqGsbaXrPX10CqsAFhv6X1G505bvMFK6fliwLUMT31+zkhsaGWe7liCiBmcw
	cZwW5shQ4EW4asCA8YOiuLKFGmn5nWXr2hzQCakuGksuxUBDq7HOM49Dmu1mRjdb
	5E/vbpvcqG4WDtKqE+/AyvAU45egN2tua4ltgIhp5ODAYvwr9nXqwGwxEDN0cOLr
	R+r6Ww==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136the8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:30:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34437a03f3fso386334eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790793044; x=1791397844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AmkpKbva0YRJZzRy25xoes8lWSIWCREJBbQ88dr+fyg=;
        b=jOnJ5RIq5qZQzYfTzbVNZJ2wGP6b3ny4wndoHNxZvOK/qAs7n3XLeeZF6rVqIe45vk
         IoAhH2AFvKXzRBDRRnC+6Uu6oHxoba6kG8maeyxc4qYRNVGSXjmh6g1xx0gQsb8ImJvU
         VIoJpFvE8y0ldZviSAYmv1wuNt4GZu68Ku+X2UEDixv9lTbdTlzpw+oNyP7JbEa4Evni
         hkbHDrnyEd0NOZ6qdduZlQ32JQEGn3hcIQ6IMVRijqfYJoXBNAbI0Da3ao2/pN+24G6z
         kF3Bdq4Sp9USeWi4ZarpOmE3bqNCH+u3pNx6brP/tXRJnMy05YGveI8ecPuAhQUI85yB
         iG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793044; x=1791397844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AmkpKbva0YRJZzRy25xoes8lWSIWCREJBbQ88dr+fyg=;
        b=BNkBXTDIhYMgO6lyVbesS+UkKN0PCjcxHlixvcUeB9x1R2xsG2QhLdyvouVGJ/1iOk
         1Uu0Wp+EgP0POEX0CKheHEwDnICC8eJL/6jmvyo2hj4Vn11THkYLeI8oJMYv/ZcxuDv3
         NJJx5wiV9KSX1L5cqAJymSlb+qBVPYJwRClXFrSj6bQig83KhSWXz7clUbdwO7EuAOL/
         uUpF+SmleRo1oHL6Cbg3UyYFlOpZejO2mw/2L9n8qATHf6jGe0dLMA+i2HN6ZM07yEjd
         hbirrmKzPyQGrfo9iUcnl4X/jJk1B5Pxl6OJeegK5sF24ltH0ZuzcXCF6RvWGoZhuqrF
         1tSA==
X-Forwarded-Encrypted: i=1; AKwUvBy7kFij32ta2cq3Pmr3jZmBg0pMZatvaV8D8NJw8jWeoAU5J5msSntKTv/csD4q7zSx/jQiHYs+xQtt8pc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxDyhj0Ny2CriAxA/VFKVAYZhvDtCCdN/AETbdQAqgC73Q1whG
	Z2LBeo5Zfcv1/S9xJPHvAbdxbgtl90Lb9+Vk8KKSN/HKVmXTkf9erNc3hHnmGErf0EJ17PKKtAM
	h1AwoWUG6q7Z3LwE3C0E6xN1upHfealkCeT/OYxE3fq8JGb6sz/R+MM2SE8rWSTGgTz0=
X-Gm-Gg: AYBFou0jAwpE08HQWNkxqMcYWs3F8uOF7SUt2KG1ES2QHl4yO+v7FM3kGiTmQKWsp5m
	QZl38azN53XyBTBxlH4QU/XrEfDQNykAeZ5qxxgJ8mu6WE+K+nQwggt+qAaGAVWTn8a0KxlfmB4
	GnoU9D0o+xYC55Gri2Ke7mJmS6VqnjXUkdbBpccPsUVU12eJSkKWrJTSG587GgUfjrZtcfU0nw2
	tvR2iP9ZGbDT3P+2Jk68MVhK3WTq9B38qhVl0+VJCx4knMyN2d6lfD/0y7+RXPxFtt6LwZK1Qzc
	0aCA6Bk5aaVwtrPnV0u5KAXS7cqNjcZcykcG8Y0SSwv49USUBZ0DusMeEFHEw0im/rYjEeESGgx
	n78Q1araPUpr4UL4QzhJdr8fNSfJATplJW/jrgEJrJz5nd3OPcX+6LCTTaNKE
X-Received: by 2002:a05:7300:4fa9:b0:33e:8552:6e06 with SMTP id 5a478bee46e88-34cd6003e42mr3630531eec.0.1790793043448;
        Wed, 30 Sep 2026 11:30:43 -0700 (PDT)
X-Received: by 2002:a05:7300:4fa9:b0:33e:8552:6e06 with SMTP id 5a478bee46e88-34cd6003e42mr3630496eec.0.1790793042682;
        Wed, 30 Sep 2026 11:30:42 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db491fae1sm750926eec.24.2026.09.30.11.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:30:42 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:30:26 -0700
Subject: [PATCH v8 3/5] media: iris: Add ROI delta QP control support for
 HFI Gen2 encoders
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-enc_roi_enable-v8-3-2c908f30e963@oss.qualcomm.com>
References: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
In-Reply-To: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790793031; l=7477;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=qhDIKatvc8QjYzDdfJRdI//vvXfzsp3LwrBw+VlkXP8=;
 b=oW2TdZGxRzasziKGQl1JvdVV9UJp4AChStyiudTAMn89e1dKlawbIqgTL78p3WRgOz3tFZTFa
 JFg1WohsIhpAnY30q+6hE5BtnIDt6D/mJVVqgnfv2pKXLbiMoTjIOoj
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfXwJO/uAOcn2jn
 pgTChFfaRDVeudtMhneH42IruiFBl7gvw8RduwAJenNfTE9ifyXgVarZPiOt1d5nuM3Zear9dO9
 l9yRcli19srZU38nBKRHht6j9cUZbBg=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abd5554 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=uxVkaJQCnwIzyWVbueAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: kwGIS84DzajKDffqyAfXSeEV1yjUYrx2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NSBTYWx0ZWRfXxjEBB4Vj1lHL
 CLfXFi9d6I/vP37e379VQlkRyBeT6E+oohS9kET6hTePSqe1m19dsOj+H+nV4VpLQ1tAU4ivgPU
 dJCbNUH5FrQnF3abpfbc+pRZuZIbWF5o3ut5XgkchMvPuCjMet04wYl1PwG8TxzhiV1j6lGHpV1
 6nchWj7lWOxY1f/c/jPcNUzL4fGg6tLi3Y/Pc70CBLddpixsZvfGNS3eL6o/ATwCFfo30Dnpma3
 e8Zov1hR3FWeKvZ+bju9hSfU6xFBYqGZCGGy1P3c53iJ4a65wqd3E5S3fcgkzrw8HNJltd198Bo
 Gsgigu8ix6WBweGIyyUX/38AkPEw/8b/GTf3wVA9EfOuTnbS6PO5a728HmpYj/wz8ElyIdwrySz
 Ziu5a3I112o0QTX/3OeLzzajXgXhEsu/Zyp/oxrdTNazg+Lg6y665cLtcoGpqtQlpD4QGVvQx2m
 DI6IvouFvQ9iO1UsYxg==
X-Proofpoint-GUID: kwGIS84DzajKDffqyAfXSeEV1yjUYrx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300075

Add ROI support to the Iris encoder driver for HFI Gen2 based targets.

- Add control infrastructure, ROI_PARAMS and MB_SIZE capability IDs to
  platform_inst_fw_cap_type. Extend struct platform_inst_fw_cap with
  p_array and elems fields to hold a pointer to the per-frame
  delta QP array and its element count, set during s_ctrl.
- Register V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP as a dynamic S8
  array control (max dims = 139264 entries, supporting resolution of
  8192x4352 at 16x16 MB granularity).
  Register V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE as a read-only U8
  control; g_volatile_ctrl returns 32 for HEVC and 16 for H.264.
- Define HFI_PROP_ROI_INFO and hook ROI_PARAMS to iris_set_roi_params().

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 70 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 13 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 4 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index bf17d310eac081ffd3a4ad4842c2255ad798d4d8..9f84d28d00ab25555f1d2259f7ef0ed0786a0271 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -156,6 +156,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER5_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
 		return REQUEST_SYNC_FRAME;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		return ROI_PARAMS;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		return MB_SIZE;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -301,6 +305,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
 	case REQUEST_SYNC_FRAME:
 		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
+	case ROI_PARAMS:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP;
+	case MB_SIZE:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE;
 	default:
 		return 0;
 	}
@@ -327,6 +335,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	inst->fw_caps[cap_id].value = ctrl->val;
 
+	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CUSTOM) {
+		if (cap_id == ROI_PARAMS) {
+			inst->fw_caps[cap_id].p_array =
+				(const void *)ctrl->p_new.p;
+			inst->fw_caps[cap_id].elems = ctrl->new_elems;
+		}
+	}
+
 	if (vb2_is_streaming(q)) {
 		if (cap[cap_id].set)
 			cap[cap_id].set(inst, cap_id);
@@ -335,8 +351,53 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int iris_get_roi_mb_size(struct iris_inst *inst)
+{
+	return inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+}
+
+static int iris_op_g_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
+	enum platform_inst_fw_cap_type cap_id;
+
+	cap_id = iris_get_cap_id(ctrl->id);
+	if (!iris_valid_cap_id(cap_id))
+		return -EINVAL;
+
+	if (cap_id == MB_SIZE)
+		ctrl->val = iris_get_roi_mb_size(inst);
+
+	return 0;
+}
+
 static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 	.s_ctrl = iris_op_s_ctrl,
+	.g_volatile_ctrl = iris_op_g_ctrl,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_cfg = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP,
+	.name = "Enc Mb ROI Delta QP",
+	.type = V4L2_CTRL_TYPE_S8,
+	.dims = {139264}, /* Max MBPF = 8192 * 4352 / 256 */
+	.min = -31,
+	.max = 30,
+	.def = 0,
+	.step = 1,
+	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+};
+
+static const struct v4l2_ctrl_config roi_mbqp_size = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE,
+	.name = "ROI Mb size",
+	.type = V4L2_CTRL_TYPE_U8,
+	.min = 16,
+	.max = 32,
+	.def = 16,
+	.step = 1,
 };
 
 int iris_ctrls_init(struct iris_inst *inst)
@@ -361,7 +422,7 @@ int iris_ctrls_init(struct iris_inst *inst)
 		return ret;
 
 	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
-		struct v4l2_ctrl *ctrl;
+		struct v4l2_ctrl *ctrl = NULL;
 
 		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
 		if (!v4l2_id)
@@ -379,6 +440,13 @@ int iris_ctrls_init(struct iris_inst *inst)
 						      cap[idx].max,
 						      ~(cap[idx].step_or_mask),
 						      cap[idx].value);
+		} else if (cap[idx].flags & CAP_FLAG_CUSTOM) {
+			if (cap[idx].cap_id == ROI_PARAMS)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_cfg, NULL);
+			if (cap[idx].cap_id == MB_SIZE)
+				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+							    &roi_mbqp_size, NULL);
 		} else {
 			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
 						 &iris_ctrl_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 3b8fbefb8b93576962abd3850215f7b7fb364930..d628bc6748438b19dac01cd11cb9f8da0b8500af 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1782,6 +1782,19 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_req_sync_frame,
 	},
+	{
+		.cap_id = ROI_PARAMS,
+		.step_or_mask = 1,
+		.p_array = NULL,
+		.hfi_id = HFI_PROP_ROI_INFO,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
+			 CAP_FLAG_DYNAMIC_ALLOWED,
+	},
+	{
+		.cap_id = MB_SIZE,
+		.step_or_mask = 1,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_CUSTOM,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index f43aea10090d8f1d6ae5c20547e5f6321b2ca203..08fc1036013de29e51747a6425ae7bb805ca3e0f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -133,6 +133,7 @@ enum hfi_flip {
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_ROI_INFO			0x03000173
 #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
 #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9748095091461ba13443c63955a42906fa4f050c..9910eb5514b3ae0a6b5349adb071d0a56375102c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -186,6 +186,8 @@ enum platform_inst_fw_cap_type {
 	LAYER5_BITRATE_HEVC,
 	REQUEST_SYNC_FRAME,
 	TIME_DELTA_BASED_RC,
+	ROI_PARAMS,
+	MB_SIZE,
 	INST_FW_CAP_MAX,
 };
 
@@ -197,6 +199,7 @@ enum platform_inst_fw_cap_flags {
 	CAP_FLAG_CLIENT_SET		= BIT(4),
 	CAP_FLAG_BITMASK		= BIT(5),
 	CAP_FLAG_VOLATILE		= BIT(6),
+	CAP_FLAG_CUSTOM			= BIT(7),
 };
 
 struct platform_inst_fw_cap {
@@ -206,6 +209,8 @@ struct platform_inst_fw_cap {
 	s64 step_or_mask;
 	s64 value;
 	u32 hfi_id;
+	const void *p_array;
+	u32 elems;
 	enum platform_inst_fw_cap_flags flags;
 	int (*set)(struct iris_inst *inst,
 		   enum platform_inst_fw_cap_type cap_id);

-- 
2.34.1

