Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440163803F9
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790442605; cv=none; b=pKLr2nawiW9gcLGrBia/HQWME37B5vabnqUoJeGVW9ikwo+5M4QK6f+DSsarNtYRLviWcSwxJp8bxojjSF89d5vTb1Hje00hqxINTmSbO2/3DG8oMlvHMU9xM+SJcP8xN/fmObVa2t/juszaelI6YKrw5J7wvrPIMUeD5cvFbVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790442605; c=relaxed/simple;
	bh=LrdXHFJqyUNm+G2gfbAXDOKiuPKuxYq/976bs4bpRKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IowNopM+2Ws9KlFQC826w4a1+tG0pbq6P5iiBsO9BkEVNwzjqbvMQxztWDW+UR9bw8dzFaV1W9siP+yHidnx169sKLBS0aY+XWvNGQ54qVP+G/PiWJM/XeJ/Y9wrlqhZL2iSSMmg/+BGAV1P0zu4RzkmQ/KatQ0XxXO1YA6N2HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHSM3aRS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RARs5cQh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHSM3aRS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RARs5cQh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxQGb3167930
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+xNBwq6y/fX9g9QKY3W4mheJRwsVjSOY7iRDZdcBco=; b=BHSM3aRSMLfMsAF6
	a7hLa/9D0bzMRJbEZEeNRuQmNVFKOUvVAxSsBG6FRSBDJwk435X4Q7I7nsbkL009
	2rRo5IIYChEcHzG7S5lZVOLAf0m2IykUDxoDE/CbblPAYwl848QUXV90AxwLxvbF
	vmIzYqADU6mDTjleHFsS2sJuIkJ9ELgBJ3B2XAXX4XaLzbWPs0Yxg6yElnVgUW8/
	E63NWSjcupXAcjBAVXs8nyKih6+84rf9qAD4r/s3Na/xX3buOuFWbe99BwxtK7W1
	MTGaYyIBNVcLUe0+lnyciXPcldHbh1pruq5Rbi7X0g9S+fECecKDHPEKaqXrrZty
	e4Z1Mg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77js86t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:10:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso3036102eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790442602; x=1791047402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+xNBwq6y/fX9g9QKY3W4mheJRwsVjSOY7iRDZdcBco=;
        b=RARs5cQh3s7pPuhBMYkFClc6cDmij7HlfTaucdKm0aCSUJDVSIKDBW6bBR68qKcipS
         jZjkuG1cS6BUCrI8mL0SGYKyvv/hkeZFWfWM0fmSFSQrF216z3crYqGg0E+6+nZ2RLYT
         VKos5e/JMTl9ij76fDb8V1n0k4uPkiND19Yus/uZBbG6C4vBuDClm/6Jefm+zsroa88U
         DueGH3nxgtr5TIodX3tyNQc8MSgQq06rdJLNLTKnsZGCiaTXUjnpGQ1lqucZttf7pgNr
         /cg1UR/px/dC4vnGwkErVhKTTXubpW/UdpwABRj+rKPGEGEat5LzBu7/yGQp7r0xZa2f
         yv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790442602; x=1791047402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+xNBwq6y/fX9g9QKY3W4mheJRwsVjSOY7iRDZdcBco=;
        b=lCrOj7Vuz2HzY61pxCc6ONti29LY7Fi90coQFrsNgc762ZEtlIK1kbTNkHE/beQwgJ
         P9TZorRzESYjt97Y3IdYyxdiWnU7uteX6Aa2e7shIeANaafsRkuBqIFh0AqFlBZpMwir
         bJnC/nUbiDF04kcVoebPLVTxLI8vBW0IspvSRg/v/wjJrHnSkETiI81a6mQF6HQjSF/o
         09tXybmA7b+Z89LyJ8Iu48vBq7MNlIP4+Y2AJ+WTtC6c2HIznrgiXIFj9BTAz2dVmng4
         RDEbyws52JDV0AVc9ju0x7ybAm57+QIhqSQvm+AuVF8CUf1KuSMFiDI7auKs1A6spVPO
         rSjg==
X-Forwarded-Encrypted: i=1; AKwUvBxPmHJwNbcvTFrSedBfyQty1hciFG/M2RESA3QjOo4T0tVfLfJcqFPNH/vp+1ZKLkuUitqkFOc2Wm4edhc=@vger.kernel.org
X-Gm-Message-State: AFq9FYICwsV3cALmSt6fGqUmhXma3hI0BUru6Twu/BTzTKpDD9zFulx3
	qa/SWkBeNH9kYIxQ7ZkwdSNslCp+0PvQzzw2+Fd66Oht7nmF0+JsvNOG7Xi9/SG0K9G12FZEPzQ
	IuOrVuf2xIsXDLhi2N+pbst+uIISyTVTNN6K7TFJTGhI+83XTVIrqYfV0HTQQzPYvQ6k=
X-Gm-Gg: AYBFou0o1rYbpj15O5t+XOHoyqgFkC3HDmpespydDiWG9Vkgl6kspLFxI5LtAhrmeWZ
	/Z1hm2Ol49JIbRzL/aSKv+mT8zlbXjR+4vHfN3D8SwNze5VRvL8TVODZrirG1YCjL2CSXdLc60Y
	awsuWFd4EA39+XrZ2Q52RClF/UcbEwcH+7vCJqctqhPDY8J1Unm4J0vClVaC6UhRRW0WTZRqXfQ
	Pfx8el+lVmqSvqU9Irse0WzGcI6S9wlMQZ/wt0jQNuOy/IF/bocDBJelszEdyyWmQWgO2VoUvR8
	Ix32XUQC6G8SkZqttgbIUqa/0l712cpfn16fl7972Y06n+Xu+aaYf3HihJLMJly8EbVkYLrJ/ZF
	PXebqhqz/udKAHHnPRSJFY1SrxpFFtw==
X-Received: by 2002:a05:7301:618c:10b0:341:33a0:2930 with SMTP id 5a478bee46e88-34272b4861dmr3321248eec.29.1790442601705;
        Sat, 26 Sep 2026 10:10:01 -0700 (PDT)
X-Received: by 2002:a05:7301:618c:10b0:341:33a0:2930 with SMTP id 5a478bee46e88-34272b4861dmr3321223eec.29.1790442601011;
        Sat, 26 Sep 2026 10:10:01 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343539989casm7382231eec.14.2026.09.26.10.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 10:10:00 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 22:39:42 +0530
Subject: [PATCH v3 2/2] media: iris: add support for vbv delay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-iris_vbv_delay-v3-2-d6894f117be5@oss.qualcomm.com>
References: <20260926-iris_vbv_delay-v3-0-d6894f117be5@oss.qualcomm.com>
In-Reply-To: <20260926-iris_vbv_delay-v3-0-d6894f117be5@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790442590; l=6261;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=LrdXHFJqyUNm+G2gfbAXDOKiuPKuxYq/976bs4bpRKg=;
 b=GNaUAQSV/3OCZoGto//MLR81vvhbginZLSQ1aJj70FSWNCUVbpcpomYBAU8q9GrgIvBMHL6pU
 o2Ivp5HTiFWD0QJO+/zEX0pZ92UmN+TDnY+boWSOgUaAQ262Ti0B/gz
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDA2OCBTYWx0ZWRfX1T+dNeyrln30
 hnWeRx8FijdxqsjqwAA1Ufd1Uvf8OcNJ/ogvakY6uvFeaYhtHmVv6H3e9Ah4GcSVL72dKhAfxkT
 ChwTIETpYdFFWLUm+IV6JubHNQnd1Yg=
X-Proofpoint-GUID: D34v-MLiUu4in9p-dqw5D8DjwpTF_Gvw
X-Proofpoint-ORIG-GUID: D34v-MLiUu4in9p-dqw5D8DjwpTF_Gvw
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6ab7fc6a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LxCXOOee5f-Gq9OeXmIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDA2OCBTYWx0ZWRfX2rlHoeXCrRJK
 o+B0TOAm+rteqoPpGVQF/e/RWLSQCTIq4SP1KAm9pYzd8AunMK5jLqYd+uyJwJK7QIt7wSrxc0c
 h/dqJTNojpgiGYPBbkye3jwkukchYp1IljiCslmwzujZio5k2b88gzF8n0ursjh189MreUpex6S
 XtkmiJ2H5/28bceCUlba4SxDQKn8mSb96/EusK806i2fVs5QcB6vd3HeUuKMvGA5RpihtBKwD8Z
 2tEEV7+a7p8HxHbwa5909EnOxSPs9pngIKo2IGATP834p+NfEUUI/ODC3NjOBXKNTkwEqkx6SMg
 Tm3Fxi8wjziIJIGTUZVNTsJC7+7mwtEZBSGr4FR51gne5PdPN3d1J8AqGhHCKVIHOwY7xSkwNOt
 V/cu9aURj0CfKXl706UL6KRld6DmD+RebK9MIYig8cEPhf/keBFPO3Xb0ldBp3mzwlwubtXhsN0
 sdfn+9x4Hfw1puS3LVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260068

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
index 33114d80aa68..de216661a477 100644
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
+	    inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) {
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

