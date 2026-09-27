Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398023B71A0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790481483; cv=none; b=SdvSs6IS48Wm6JZQk/uoDT4CCq2sbyzEPJUDlwcQECTkqpDdX/5EsZxGbb1tZ0YSRx1Xw3Bf/iSQmnUbd4nM+mc6XzbqXCch/4owHYrGTYgKVtCdbULXkZOhTSdMRj2lfTeAjS75gKCmS0wYNtSmrjqjvnsuV5k0qw+Xv8Z90Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790481483; c=relaxed/simple;
	bh=UrImss/0s3Im5iAoMpmNgljXh64SAUmehShhnYmzlrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sntb1kXeB7MJuKiItnDci5sz1QAWqx9XAkLjwMoBrB5C+aIVbTqGSQyLfW5+6U1eOJ0u9b7tWI5dZrKwuZl1EUJ4hQnoTxU0SMYdokD/IkvssRFCYkxSEnkbhqqWATzfIhBhGI4vD1BetlcwQpQPkiIT4NlDISjqHSgtjT4gQqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/4k1vqZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6ShGrVe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/4k1vqZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6ShGrVe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QHFmVM3201316
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2sDSbAsRdNZssTiR3hqtgGFrh0wvLomEofKBkSHxZGU=; b=Y/4k1vqZt96WHXyv
	SmWs6b7QyKb4LEc3isIzrgEhOSbyasn3vOlstgX5c30ZwF2eVr/Tzh5JENY5Fbbg
	StfCVwqH5iAYnhley4PEqn1izfmYa3D+VlgSbBWgjS84R/gX85I9jfotPoMPe/v5
	x8idt4/ofxnnbhnTSAOE/MweX4a+iBhGd2wd/Gttxvv2VEFCJNUGavGoioYwwgIn
	6Ykn2eaB71OoJo9/O8DUcqQbfYfgZuzKD8RCiRpGFw6LUrwY4Ab2wOFakE5ENmWr
	EiEIEnc9cVMjaygXtXV6yJrwuRu0v8iZMJ9Xdx3aA72EscpelQyr0bW2j8sRMRTg
	HqDBww==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jt3x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:58:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-333543ac378so2624414eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 20:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790481481; x=1791086281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2sDSbAsRdNZssTiR3hqtgGFrh0wvLomEofKBkSHxZGU=;
        b=c6ShGrVeUEyK3J4/bi6hqJwab57srZWN47uPKM0v1Scj1+1BTyasm5LiCJcqL3JRGU
         8m+CfTY1mtXW48OxpcQj0Jnt9qIZH6infLb56qSgfb5sbL59kXw1MNX69kIglNb9771b
         fxFFfG5F7+Wc9tznLmQhOf0RWUvx52HltArRMydkiuWUIHuzhXLg6HhkHTvrqhUjQZg4
         m8gxBjeouvw26OYp3VaRVxuUvfmxEUpmVUDXs0uVjeiMMVZ4hSsZyIPYLsWI3w5HBsBC
         KIe1VikYlrVeCTYaJ3hwgyKyw9TW2JMrmEKGM7ZctULpYC7anqiiSmehcMCpaBRWXYwp
         gqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790481481; x=1791086281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2sDSbAsRdNZssTiR3hqtgGFrh0wvLomEofKBkSHxZGU=;
        b=Gqnl5nhWLqWChnpDM75xPmzEZMRWZ7WADYXCeP/EbW78Jw7oancW+Zl2SA7YQJmnd6
         qbc23b2s4avovexxOaOZxPLj1A+zTcqFgrSyfN3DV5DWyMmozz6PmR4KeyRNUoLVA8xu
         G9F4mvk2ehqH5fwMuoPGUunIU/ERuCPykxzNZEjjECJ1Xc8g11K8vNjuqPeXR3MsRVqZ
         ojV1tvPGCU18uKekM+ljDfpqOC6OUyFHhZxZde5pAP039sCMfTpfPkdLj6l4pWvkqFa7
         B1qP/KY3SAvEuVMoq2fmKkNe1kcMEmLPZlLmsUGeJNELnSjyLd+eqJA0F/87m0yhdiKF
         BApw==
X-Forwarded-Encrypted: i=1; AKwUvByRtABOjmRXyVC11V7NmBof9C99tJXn3wKFSvOJ1gSPiXQkcuoeD1qZR2byGhHGnyYLBKlbucynlTqOrZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLS1rMv0EsNHo2wFAlGcrih/FpMtZ7GdF4KWxr4lq3M106DiCxx
	xvRgO/xLLp6Sgo0Gq3bf1VF5LxjSlWzpNoJC6HwN5Pi0/32TCJKn5AUHn9PexpA/H2z/LW6iRcO
	oxnHDM7Q0UsTbg8CQqo0fTCCv3IO0leFwfDD5A0qINQBy9LRh3eOO4bv1JlzlnaGo78s=
X-Gm-Gg: AYBFou1KcQYsq8GrkvOm+nWJ+llcjVsedl5xH25SZjfnSkHUDDQaTIWV50vaSOjJw20
	TrCJeflaVRQ56lf8/ruXahS0wRgAtIq2R3wKgWJOsWAI+A9Y+TixbfE17jfPIUreFDN52AeGm0t
	kEyn53QZ5lBiW0hCGa2LldiefoBHcCpc/0UkXaPHpOX29r9i5IiDPTUr23qf82Y1/D1WjkbxhLi
	JURrPv074CFM3ATNsCvlbS2jfNZDtRfu+jrMsktBByxRKbdjpPjADGnZKIae3X6E3YgvJcMJk48
	gdikI7IKk8z1c+77VQNW+tPvYE2U5gAkKG1SNITLCesCRYWGdPwb8EC0WxIA+ifq1UiFxhd5yee
	caFSMX0VFoaY7/GZMSzCxcPDzHEYG1g==
X-Received: by 2002:a05:7300:4fa5:b0:33b:d8b2:8fba with SMTP id 5a478bee46e88-342700bdd29mr4312359eec.7.1790481480545;
        Sat, 26 Sep 2026 20:58:00 -0700 (PDT)
X-Received: by 2002:a05:7300:4fa5:b0:33b:d8b2:8fba with SMTP id 5a478bee46e88-342700bdd29mr4312323eec.7.1790481479195;
        Sat, 26 Sep 2026 20:57:59 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341460f5166sm19618127eec.29.2026.09.26.20.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 20:57:58 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 09:27:46 +0530
Subject: [PATCH v4 2/2] media: iris: add support for vbv delay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-iris_vbv_delay-v4-2-8ee2b7462e68@oss.qualcomm.com>
References: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
In-Reply-To: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790481468; l=6307;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=UrImss/0s3Im5iAoMpmNgljXh64SAUmehShhnYmzlrM=;
 b=jwHPO3DnuAyAKWnMh9sSQtLnHC40mJrzTU+Ph7AHkq929tzrc2BBtlEJgyQX9r8GAPvjsY7zG
 mYsxx49CYpBBmpE3SrMNxjRuI7Zyz+tCqW9ksVRsAkZkZX8wCbOFZj4
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAxNSBTYWx0ZWRfX9SoYszcAosFl
 lOj6nsX0IUFMiKUbMKAeINQSy+Fa2+B8K3vROBKxc2eozOPXKJFUwmQBvq4wtFdooecYVJtQFRm
 FQm1fZhr3vEt0hombbC5+94volS1Geg=
X-Proofpoint-GUID: tczPgVusitXJFr_ZdI_VG0uULDXVN5Ze
X-Proofpoint-ORIG-GUID: tczPgVusitXJFr_ZdI_VG0uULDXVN5Ze
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6ab89449 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LxCXOOee5f-Gq9OeXmIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAxNSBTYWx0ZWRfX57i6LTnaVf32
 oMVOm+bqbzkxop+01wWATxEmPOj7XkDfAgkp5GrCwXL87xJCYsmZV/0TpIGrZgNCIXWF30UD+AC
 g2MgAe8rnRw2dNbRj7vHqEpkFd+vjSRqWNj9khUJgUJGrhs8d77mzO1hFWtf2k5R6ng6xZgxMzY
 08oyxmQZECZKFsFYzYB09SAv27rlOEutdC0RXSgo1APZZL/EKCv8t/G15uhBeTb5JTG9RAVWv7o
 FRoSUKHny+kvzxkNYG3TWOqj2x2HIKMNYuDraX3IeiVJaGGdQS1V+R9FlA6i0WCsSar1eJn5iwe
 pFbXA9+qGvOU6maR1fMV6EKpiQhgyH75omtI9SWdt745Iv1vBRNVO2yTOvx/YHcg2Z9U2T9/B5x
 WR1Xn04N/kseP5Rg7HhGSJ0bYz3zFQVgvTeubR+9n9Vk/+jCbNHo2mpNoPhUE7doYwa5vRwgbYU
 Q/N6hmgPBH3pWgVnkbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270015

Add the VBV_DELAY instance capability for the HFI Gen2 encoder,
exposed to userspace via V4L2_CID_MPEG_VIDEO_VBV_DELAY and mapped to
HFI_PROP_VBV_DELAY through a new iris_set_vbv_delay(). The property
is only meaningful for CBR rate-control modes.

Low VBV delay values (34-100 ms) require the encoder to run
with a single video pipe, so extend iris_set_pipe() to force
work_route to 1 whenever the configured VBV_DELAY falls in that
range.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 37 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 ++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 5 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 33114d80aa68..758c1e77de3f 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -154,6 +154,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return LAYER4_BITRATE_HEVC;
 	case V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR:
 		return LAYER5_BITRATE_HEVC;
+	case V4L2_CID_MPEG_VIDEO_VBV_DELAY:
+		return VBV_DELAY;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -297,6 +299,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L4_BR;
 	case LAYER5_BITRATE_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
+	case VBV_DELAY:
+		return V4L2_CID_MPEG_VIDEO_VBV_DELAY;
 	default:
 		return 0;
 	}
@@ -541,8 +545,19 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
-	u32 work_route = inst->fw_caps[PIPE].value;
+	u32 work_route = inst->fw_caps[PIPE].max;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 vbv_delay;
+
+	if (inst->domain == ENCODER &&
+	    inst->fw_caps[FRAME_RC_ENABLE].value &&
+	    inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) {
+		vbv_delay = inst->fw_caps[VBV_DELAY].value;
+		if (vbv_delay >= 34 && vbv_delay <= 100)
+			work_route = 1;
+	}
+
+	inst->fw_caps[PIPE].value = work_route;
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
@@ -1487,6 +1502,26 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
 					     &bitrate, sizeof(u32));
 }
 
+int iris_set_vbv_delay(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 rc_type = inst->hfi_rc_type;
+	u32 hfi_val;
+
+	if (rc_type != HFI_RC_CBR_VFR &&
+	    rc_type != HFI_RC_CBR_CFR)
+		return -EINVAL;
+
+	hfi_val = inst->fw_caps[cap_id].value;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3c462ec9190b..16939e31c784 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -47,6 +47,7 @@ int iris_set_layer_type(struct iris_inst *inst, enum platform_inst_fw_cap_type c
 int iris_set_layer_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_vbv_delay(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 45a418fde7e9..716947f256f1 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -944,7 +944,17 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_layer_bitrate,
-	}
+	},
+	{
+		.cap_id = VBV_DELAY,
+		.min = 34,
+		.max = 300,
+		.step_or_mask = 1,
+		.value = 300,
+		.hfi_id = HFI_PROP_VBV_DELAY,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_vbv_delay,
+	},
 };
 
 static const u32 sm8550_vdec_input_config_params_default[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 776b21cd11b2..19d04981cdb9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -127,6 +127,7 @@ enum hfi_flip {
 #define HFI_PROP_BUFFER_MARK			0x0300016c
 #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
 #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
+#define HFI_PROP_VBV_DELAY			0x03000176
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
 #define HFI_PROP_AV1_FILM_GRAIN_PRESENT	0x03000180
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..a533740ced7c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -183,6 +183,7 @@ enum platform_inst_fw_cap_type {
 	LAYER3_BITRATE_HEVC,
 	LAYER4_BITRATE_HEVC,
 	LAYER5_BITRATE_HEVC,
+	VBV_DELAY,
 	INST_FW_CAP_MAX,
 };
 

-- 
2.34.1

