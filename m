Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D96F41442B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792191657; cv=none; b=YwsMZUhySFJcZh+ORY2Ho5Z2dLJq4vFEtamR16I++LkRDoL56VW6iIjbXhfoRwOM7IW6M7sZD86MCc6GkEO4A8UoVDJBhROW2yvvyNyDBYCum+aNcTX8bPqTt3PoyI0iFWANSEu/VSpM2t4JNSigCG2Kpp11CEwYm8UobtvsB2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792191657; c=relaxed/simple;
	bh=8cliKGujAsEvjvsrbUuExzfZuUK3fVzZza838R+xj44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cS0usX19XcIlVddyfuLHdTNjgetb6E4PY0rJZopbLcLXAo3SKvZczELC6xhnftHtaYBwVCWdOcPX8Yyq5xC7hYW1vm1MbC+v0mpNyIc2SM7eXwrJ5DcXJLxJDsG6zyBA9TYhTTaB6VTNO/2JinEmBRlp92s8mr265bCQlGXDVqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbSpk3So; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UabA43N9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbSpk3So";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UabA43N9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GJeo1O3725291
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=; b=mbSpk3Soqa/aD+d3
	aulHpIgrBsgRWbHsqxuDvfexfRDzJqHnz9s5BcIUMsD4XACpmxytuQM8P/04Fc6x
	CrY5tLNjqiOkRgXUJhRisCkQdR4L1hSLrBa0UnCRdLYs7rOSYmzuFuiMI6EYTvdI
	tAeIla5Yrq3z8EINdAtEWnKrLT6P8KJ0sA8x/iKsAEXydlnjXwQO4L5YVzWtaVbC
	CpR5EDmDh70SnuZyf2Fad8tsfPwf8VtraG7AVTGzvSreGqoHk3pk2ng17fctH7EK
	Am50nV6Eqd9C3fOJFFzI6KX5Wl25Cj0hEkf/HFQHcHzHa5oCebSAVyzd4uMthArm
	I/Zf+Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbq451bxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:00:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c813a2e14so34960eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792191654; x=1792796454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=;
        b=UabA43N9NLzfCxYUyPvgzmuFpOmPmmMdvl5XTdEKpBxtO6CKb91UoVRvlfMkAcVFKs
         H8dvkAP6japGw5SkF9cXiY6wdYEqA4rQf/GRLqnwJaEhFcHNFyIOrnj/xbh/QDzeN1S5
         oeS3u1fk78LNmAEpmo8CTNM7OkWaxqS1YbwKsf/Hm3c4FulUIq8R+6WGd0uQ3FTQCah9
         MIjaxnoexELcTU5BESw1gyTczcOkQvkUkmPE/7nnmIRYagP6lYerJtdqOxyHuBeNUQ60
         8g1BHiNOxINhFAfnc+CoKhDGAWlB4EnIyDo5P4pnBkcKfm+ki0ou3mQZZFi6L0RxhMDI
         nUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792191654; x=1792796454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkyE659lzmHmkedIaFTPtXRPbQd0UeH/8KjUFYs797g=;
        b=nxD9tPM22jAlSPGhxWHQZn5jakztkOouhagOqNRh9Arh/YoXrKzLRjXT6TWjw2+BrS
         m2bpEUebcbg0CvzAkjAdVY48I1yktTLUNLGuGTAxxNAU7xZhG8a5MqbqEDTs5EWOOey2
         k7nGmtKb3OxIUzRPQSJZETwoL3ekxpOdsS02oBsi6OuIwXwtey8DNdxL98tyPH6GAyfJ
         uwYxO1Lk4r3N2GZhoAYvAx4TkTXZSM3Xz/o/dKK+nLqXu7hFAFqLdS6AS+PGVjBzgnlr
         3An6zyV7K+Gi3WDy1NvwTwn8uHT0AstkAscdonh8p+FcziRPCEEb3LTxuJQZrKBuALag
         TELQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKFNiTuwpaVb6HNJp70nflr3nwbjnTRaKbKsPsPFeLQ+LzX8oheu8ykEqSYDeg7uVpygL8vlpmWfpBziE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDKOvGNjpByDr+nNSvn8ys1rCliat+HvW4cSiKqgZItqS1Oh4z
	btxUmNQ7xlXlasrkJED4l05cpOOdRp9AkRbjloD2ZbKUuQiyqiRXWHweEqJTQb0/9xMcndc87Qk
	WIrz3n06r5RqqvqFNSYO3lOYXybAr6snT6MfHbWykq0oxq3uEpr33ukgXD2T+gn50Qcg=
X-Gm-Gg: AYBFou3gqTy1g5xV0UD37VeVkCSH1ZkLH67XvGmrRzcfKENqxEsHYCM0QfEcYxNGz09
	t5SNOGjzxk2XM9mQOCVS64UwtPsB1PSzkOA/BZrKHtRaf8pOIB4ONa9WJnGbarVgq6ZJY7zk8Eq
	UrAChelmCdKblURdcffFvDlGMdOE3UR+8NlAgp97IM1gPXnoU1EvJJ9OmgtfRT86e6Kfuv7i1Ec
	eF1ytzLSF580hShVVUj9gQqOIK8Z8/DPg3hN5PZqBatuu8NILOn6E7L4C6qvBqSsQmWBPE9qVls
	K81Unhe2B3iybbSm0sM4aC5qvaQdumOb6wTnad8nB2QaLp5+unef2EiMVyqhvBjg0lhZNBPbw/F
	lP9cDiqa0D/4mycSiH1g9+/Q8JzCeCyP/TqDWG3x8pMVj8WXeAoikivYLk6c=
X-Received: by 2002:a05:693c:20d2:10b0:35f:8c5d:5938 with SMTP id 5a478bee46e88-3619ffc5b52mr2422538eec.1.1792191653815;
        Fri, 16 Oct 2026 16:00:53 -0700 (PDT)
X-Received: by 2002:a05:693c:20d2:10b0:35f:8c5d:5938 with SMTP id 5a478bee46e88-3619ffc5b52mr2422475eec.1.1792191652973;
        Fri, 16 Oct 2026 16:00:52 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm9379101eec.18.2026.10.16.16.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:00:52 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:00:34 -0700
Subject: [PATCH v10 3/5] media: iris: Add ROI delta QP control support for
 HFI Gen2 encoders
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-enc_roi_enable-v10-3-bc5bd37b6f3e@oss.qualcomm.com>
References: <20261016-enc_roi_enable-v10-0-bc5bd37b6f3e@oss.qualcomm.com>
In-Reply-To: <20261016-enc_roi_enable-v10-0-bc5bd37b6f3e@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792191637; l=7490;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=8cliKGujAsEvjvsrbUuExzfZuUK3fVzZza838R+xj44=;
 b=xzHwEwdOCMoY8YdH56u/jhRsna4yG9yh8itbo5irs7oA6u8u0P8hJMX5GLOnqfd96zls9p5K8
 qCfq9at9+12DF31kqVWE3JgtRV8k1XBMojKVANul8dDiQ2U6DyBYOWY
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: pldvca1sB0DghFyAXQiMATHgLumV-vjF
X-Proofpoint-GUID: pldvca1sB0DghFyAXQiMATHgLumV-vjF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5MSBTYWx0ZWRfX76j1uWyQ3+LR
 AK97k/KJQJC7hQQX1uKXLz1d9LLYp6fs6eb7MTV9k+GA0ogSwTLvcnk1t1LWc1dH0Hpz5w9eSRA
 xB1khdHD9uQ/V4remsTYbrfc/V5zl9sulkqIjOMpbFQzSwABBDA+HE1F9MD1LuUXxc0cRDvGwtc
 30rZ672LEfjTUew191Xueu+046WXe2Lt0FQPJUv+zBgGx6sO58HMe7FGP/LjX++ypC3CkTmM0va
 i09miHF0ZWg6pju+iCkFNI9NSAA0fFpbPCoX/AbZfOEe/io1bbNJpFmHbs6JoYSJkqQO25H5APh
 4Bp1RbkIU/FFn/ee3vzuniZMvqqVc/kSGSbEFrdlo8E4REJVQ6EtD/pbgi8N6Yrt9eHRk28VJuC
 IrQW8FH4jR2teUTNUMMWbsAYXnzmQvmTIWhlDOUtLU4pee02WgNCqphYXHHsHQUC9JoUHjhTKtV
 4bwIiZ9vWCllkpiA9bg==
X-Authority-Analysis: v=2.4 cv=e4GT2qp/ c=1 sm=1 tr=0 ts=6ad2aca6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=uxVkaJQCnwIzyWVbueAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5MSBTYWx0ZWRfX1S5ukrGP6BAg
 Q7SGzbDhfM+R+zjj/nZkQ0Hmk4FZ6W1roc/C1RRcMyy3OkaSFUfbZS6Uutk4KxQM2YEiHIOomsx
 2fz9lRwAxrCMVjl7XMF2JNM4jcDD6Os=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160091

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

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 70 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 13 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 4 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 4f2633bbb49f81f080ffbe91569d38e954ad15a1..d97fe50d48860b0f26b71d328a704f3804b1d93d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -163,6 +163,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return SLICE_MAX_BYTES;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
 		return SLICE_MAX_MB;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		return ROI_PARAMS;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		return MB_SIZE;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -314,6 +318,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
 	case SLICE_MAX_MB:
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
+	case ROI_PARAMS:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP;
+	case MB_SIZE:
+		return V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE;
 	default:
 		return 0;
 	}
@@ -340,6 +348,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
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
@@ -348,8 +364,53 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -374,7 +435,7 @@ int iris_ctrls_init(struct iris_inst *inst)
 		return ret;
 
 	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
-		struct v4l2_ctrl *ctrl;
+		struct v4l2_ctrl *ctrl = NULL;
 
 		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
 		if (!v4l2_id)
@@ -392,6 +453,13 @@ int iris_ctrls_init(struct iris_inst *inst)
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
index 79bbd06ef8d2be11582a6b81da3104b6273f7250..0f4c6f955f4f408c45c50796332b47c116f52982 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -1815,6 +1815,19 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_MULTI_SLICE_MB_COUNT,
 		.flags = CAP_FLAG_OUTPUT_PORT,
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
index 2b8b057d35a9bc4d611fc9251c95762316a21062..2394213d8272b53bf6a1cff9574dc93f6830fc8c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -135,6 +135,7 @@ enum hfi_flip {
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_ROI_INFO			0x03000173
 #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
 #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375abc6f803f98272619ecde8ea7873..72a7bd5a7570f53a73037d49736e95664af180a5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -211,6 +211,8 @@ enum platform_inst_fw_cap_type {
 	SLICE_MODE,
 	SLICE_MAX_BYTES,
 	SLICE_MAX_MB,
+	ROI_PARAMS,
+	MB_SIZE,
 	INST_FW_CAP_MAX,
 };
 
@@ -222,6 +224,7 @@ enum platform_inst_fw_cap_flags {
 	CAP_FLAG_CLIENT_SET		= BIT(4),
 	CAP_FLAG_BITMASK		= BIT(5),
 	CAP_FLAG_VOLATILE		= BIT(6),
+	CAP_FLAG_CUSTOM			= BIT(7),
 };
 
 struct platform_inst_fw_cap {
@@ -231,6 +234,8 @@ struct platform_inst_fw_cap {
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

