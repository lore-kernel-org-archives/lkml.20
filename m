Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A213B8D40
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428109; cv=none; b=N8VZ0SBRI4ZreM85wneCCmx1DusWSiZBaXJ8EqqciFRA/FKrZkvKOWSGPTKa4qLeGAtzOEC5UD+gRuUz5lRGiTSqZG0B6P3iJiMqv0j8jQgKHiTyZrzV7U8aSsT4DxTWcYtwZWHz8fx5NDCKSwiGFXnmXA+xdJO5SFCGCYWYPXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428109; c=relaxed/simple;
	bh=PZoMF8gWJCSH77YTSwfWuV+8y9UuZEH/lx9+Q8vWLBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYy9JAsBexDtib5XtHSgt7UzzJCeJePhVQMXXCtiCOklZjj6DSd8dlUqH0uf9fypYKJEe0HqVk7H3Oeu+Nlwthy7Xl75tNrr1pDh6m9LDCe1zLvv/ZP75C7sEncQTs7Nr8oVQrA/7bodAotrFUjxUFkooBclAHumMce6bTFgwok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1uQ1AmK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c4IOJ7zF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1uQ1AmK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c4IOJ7zF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QAo2Hv184441
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MA1d+PoQ5SjxL2ektTDtKFc48tzaXNE538IYG5SBxHg=; b=b1uQ1AmKmgzjxGmR
	ajn1dYJ8yvYNdGU3HlCadcKZcBMOfqxoZ2Ay/yiHQ5LdqIsu1+eySATZKjQukayz
	I0t4cU36q/BPSMvQLL/7vuxRr1NYVjVwA1AslXE8SuXxEH1dzZdLkzURsAUZWnTm
	hfsJ1iAehh73sykojjYc0c4PAMkpKiCmLEhUsVk6zj4xfsUCcPn0IoYbomc0S/3a
	0lawrlV7hoEwz/Eqhs3Yb8fWFO6VPltxy2hresaYuNocQB9pbXAMfqMQoPCGvoTY
	iwO7XgDvP8Ky51fSQHnXROgSvrtW8v7wk4p1E1OCw7DyzGS2Yizw6qaz/fHHgoR3
	lX1tqQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx5mw8xy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:08:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3282d5302ffso2516718eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790428106; x=1791032906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MA1d+PoQ5SjxL2ektTDtKFc48tzaXNE538IYG5SBxHg=;
        b=c4IOJ7zFlS7QxW5G8bfnWy4fsWdszwKEJrF9mbjFFZVBgUr8VaMqWF6KSffN/x5JQk
         LKb4tGgKU0P/1b2JfjEghjbmifA7fFk60+Ci7qSUYx3kyBUsK8rTory2cLv7qjhKPn7M
         MvANc+fzcT+X6azdwLUHOnGLziHE5Wp57AjWwPWQ9fRDu0JZLjGJIJYvKtbvBrJB1EBg
         HRip/SwZmBWufv/PZHu9tL37TxjV/vfdjU1ESFuqy5nH/CfgRalnjOWu9O//NpYxvTRT
         pwa+yldp82Atmx1jgFiX/zxpDkH4cqXqnK/CkZq2S4gn/yWoQp/ne/m1u8Oh5ucwR8MH
         lMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790428106; x=1791032906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MA1d+PoQ5SjxL2ektTDtKFc48tzaXNE538IYG5SBxHg=;
        b=A1euXJf+Xg7I5hPJbSwjSj/7MWq8KWTQ/cbLRxrPd1madABYKO781Mz2EicT7I8GG5
         e+fO6OV5ccHIjLFkRJc54gICJjdPyt3YMg12iPD2m7xtKjPpgCTHeIDphkiVmOS1LFRW
         clEzWaUD7VyzDI19uF3E1v9JbupD+nYwCOvm8WNj4homDh8g1lkQqBLHubxmQ8WMhKnn
         i16x9WXLGe28rK4jpq3itTrt1vSbhkdjHOQpHzwRbQruU8FLakES4BY5J5TUb+8ZVsYT
         Z9HLjZUyFSw5wlxDKSvExrp2kpMcdJp3jPiSHlJ2YRzOR4GYfQ9JOYtrmPqEqmPMnhoP
         CvDw==
X-Forwarded-Encrypted: i=1; AKwUvBx2VMwrtv+4qJbqzVTW5iA2I8ivqFMfcG/iR7cF18O6iYTQA5rpHeZ+2DylkeTU2fGASFexsu967i4bwsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvte+DwxpFvCSU0TDcTLTQhhXPv8eMr8nySXz4Q8TBC+yk/RmM
	xgduK7BUoCdxts1/WjeAPXuyzS5MgW7JVZ/vjUsRho92FlI2hsJ96yTx8+mdjbd3ljzaypTOUWn
	eAFp5RGnufNRRR23rOLldk2TN56zkdtSDSZzzFk/JPnVlsfHkHBg4wCvHBp+yj9yDE1Y=
X-Gm-Gg: AYBFou1943eXdgCzyK0fcxJG8wkmxQUVFhIoOrIG90VzL9T0okeSh5rNd3QeQj7gne2
	2eGvvrHuaAP5ScrI9WbgfNk1iQf6hFd7QSO59MCnHFbn8t8ThNXM6G8klKEwlT4RRH+SOrXNgVN
	T0g1NdjBwQSugqJcuCS3oRn5/Zkxs63hKSV2YH92Njbrq9mHb7RG+/ZF/NqDem8sEEkJoGTXhv2
	W8RsQQ1HayaIeaRQg7vaizkIws/j7hcpmosVKwCOSCGwhbpDi7vTpyZsx03jtwAfva2Pa1a7O8v
	EoDYX3ZxEN9DuTSl9+izsvLNgfR9x3Ref/pMWKduZ37CUv+H7FF7qwsANzNMi2ZFBKEB/NmDawp
	er5ihjhbGVpPjbmmC3bRg7NfGLTt7QxI=
X-Received: by 2002:a05:7300:e785:b0:33b:ecf4:7f80 with SMTP id 5a478bee46e88-3427334b05amr3561951eec.22.1790428105446;
        Sat, 26 Sep 2026 06:08:25 -0700 (PDT)
X-Received: by 2002:a05:7300:e785:b0:33b:ecf4:7f80 with SMTP id 5a478bee46e88-3427334b05amr3561918eec.22.1790428104866;
        Sat, 26 Sep 2026 06:08:24 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341460f5166sm15356614eec.29.2026.09.26.06.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:08:23 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 18:38:07 +0530
Subject: [PATCH v2 2/2] media: iris: add support for vbv delay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-iris_vbv_delay-v2-2-83dd80765dee@oss.qualcomm.com>
References: <20260926-iris_vbv_delay-v2-0-83dd80765dee@oss.qualcomm.com>
In-Reply-To: <20260926-iris_vbv_delay-v2-0-83dd80765dee@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790428092; l=6268;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=PZoMF8gWJCSH77YTSwfWuV+8y9UuZEH/lx9+Q8vWLBw=;
 b=wu1XcoYmusK004t5XPwehLOQfy3oXLBgeSFdCoSM/xhpd6bxYlNYy8qtOEdQ81uVs5G20fiVL
 WAoWdvxi3DBDRwkDSchZ/TnhY1upX/UeGc6hwwj8aCZ0QWAi7LlJvTg
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-GUID: L8YgbpK7sWjueqBmLp64FFiF7pJm5mrL
X-Authority-Analysis: v=2.4 cv=QvPLTlyd c=1 sm=1 tr=0 ts=6ab7c3ca cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LxCXOOee5f-Gq9OeXmIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: L8YgbpK7sWjueqBmLp64FFiF7pJm5mrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfXx83ZZp/WOEqQ
 D/v1J9vWq5+sKDRsO3ToD7DvwP/zQ3kF6H12apyIbJjiQifsR7lpH0KUnVY+JYywRR9w+g2Nfbf
 CKobh9oXLsETXluzbBMNqWB4Ws/Vjlk7iV6O4+WbgV8jiTrbRzB4aQUTzZKZZMUX6x88ROBDx6D
 Fsc2b34+lQTBvcOxvP2ROLjesPcSmNlyayiyWt7udOdDHQdPyqH1uPFswGDzCFt+dIbbW7uNeSt
 PMLUbvLva/uiA0JcIAEjxAb42Gx0Q5Nyg233OqoFmbgBn1uszof96V59EkPqm6+HVBsB4M6wbmy
 Ex7Hqebl9PAHSDWORi6KCcRWbn9SHffjo06qUQLeRykggf7ONPnDc7hQ60JxDStNVSqw1zwQWB3
 EZTnLZ2rgZmpKfbK7pQo5lwscfXy1gdZfta006ZqxddM1hk9t5Thmw+XVbelWlBfdjxhhBqmEqB
 xsfaGLbgFyoa0prKpiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA1MiBTYWx0ZWRfX3tCs9UsOx2db
 QAkmH8Qs/h4nmoxbiuBy13Ko9MpnKx6shtjKbga+pH9nOFWO13u1Glz0hKeS/BAYoNQk0uVkj6C
 PsLlSdlrW9wUJwywPGSRWLSKXEoJX64=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260052

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
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 36 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 12 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 5 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 33114d80aa68..53d8b1ba15fe 100644
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
@@ -541,8 +545,18 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
 int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
-	u32 work_route = inst->fw_caps[PIPE].value;
+	u32 work_route = inst->fw_caps[PIPE].max;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 vbv_delay;
+
+	if (inst->domain == ENCODER &&
+	    (inst->hfi_rc_type == HFI_RC_CBR_VFR || inst->hfi_rc_type == HFI_RC_CBR_CFR)) {
+		vbv_delay = inst->fw_caps[VBV_DELAY].value;
+		if (vbv_delay >= 34 && vbv_delay <= 100)
+			work_route = 1;
+	}
+
+	inst->fw_caps[PIPE].value = work_route;
 
 	return hfi_ops->session_set_property(inst, hfi_id,
 					     HFI_HOST_FLAGS_NONE,
@@ -1487,6 +1501,26 @@ int iris_set_layer_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_typ
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

