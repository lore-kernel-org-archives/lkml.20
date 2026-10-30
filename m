Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341988;
	b=H9aabzN9S5C6/p7iZBIpfLNL76K8dLkQ7YbM9IOrK9+bmQXE7BqkvMj4V/0w2I747jrh
	 1JO+fT6PeQ6uOYh14zl3dLLxl+a6xSv5K63mZzuSn3s2O8fXNxUfTiEGzgDluZHw9PrHy
	 0lr+T4TnUyCPbhLx4o4HLoJf6hEa8gnRv6HZsOOZPOVIcUZobuBcRXdFWBjpZR6yzCO5a
	 2hyYlv51cY3W9XYoe34v06H2m/WI29Q7EQ0RbGeoz34X85zShvgDvl0ESNLIfSaYcXevQ
	 pz9e5YSj00HNFqYpvbw/nMEYU92DxG8BHy4DbEJQizvE1Y3MTCIGZgyUW0v2Iqegrog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0oQq7E/HlK1xfD+/GxiQFUGV1uHKRxtSFx3g3E4Dn2Y=;
	b=PQ8qp9BiCmYz0wY/KD7zJeAoZmIGq51NYKGIqSaGrHUJgUW4AoUZ9nq6B4/wBsz1GP0l
	 E0RrLmP5FrhpVdX52aHk8HdgYvmEGvKa4W2ReWtlptAMdK4/f2OiyURGPr7RoNShtWDzM
	 gIBIDLV852/MSsUyZJsst2/y6kPLU1hkkK8m+ZFobNVe/AGu39VUF/HRUV2cyhhZLe4cQ
	 1qumPAh676BHchG6Bigo6c7dytaXc2LYMw3cf2asIYzziqEi9yYYEOrf0sgXxEffzRy+l
	 TDlsYF0h46jBPueUAPc1iUhc8qWGcBMZLNTlZRq802unVmKrSeSP+wi1+Iq21eBMphg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nB7tOw03;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hglm3Bi0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A82606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A82606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nB7tOw03;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hglm3Bi0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F6UB2871097
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oQq7E/HlK1xfD+/GxiQFUGV1uHKRxtSFx3g3E4Dn2Y=; b=nB7tOw03jbJUjY0B
	PIjnIcDC81U64QKlHigNRvPInNEB7SwbA+2FrWr5V3Rgi9oAFn6EW1cm4wM63f8d
	iEBMVvIyDf1KEAPk2aKiK0oyqIvS0z/sl+2pmcxIUaV7ctyqPza+nK0VSb1EhlEP
	dPSzK9ZNK+YPksCBBorpO0iNBthYCGDCqoEtqvzahUt/ilE2bM7XH2D/b1W6RkW/
	mU7JSb5/gzJZJES1osI3YG4XvPz20FF1qdKM1ukvmrBXp74zQDkdiXBTFRQw2soE
	QTRZoQRZtPsA8MOsG3kyJTrob1nXAx1YvTKb51z1fq4otezkkqrTbRS329Ou7m1X
	HcNgMg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhk91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:33:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a190c53a3so653222eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341986; x=1793946786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oQq7E/HlK1xfD+/GxiQFUGV1uHKRxtSFx3g3E4Dn2Y=;
        b=Hglm3Bi0sFeuMznu29t0oH0O8Zl0PLm786SX9Yjfq4YtR/uyDXxvG2WcVuFKlLFI0X
         sM31sPB5D+soR6azHYSH97S8xfM/jwYhc9Bsd7PYj7B6AIMRR4ULoFQdyPJDUmZLd12C
         NwsXt+419my7mM1BSUHe02bcjEXWJRWHKymaILh4BVseTpSQbbpAL9c+3e8OPyvroO4w
         lYBIILF8b5qVw3Ap/R2/OxvW5xi2kTHu197ZKxyAidZvbYzGL77R++qSlFNykgBR4Nv+
         syZPGfRUdV/rBxxg7aaQTjhqzMee/87qHS2bV0YqKbFq+Mu4uBgC1fGlxo67NXuGAR1l
         eHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341986; x=1793946786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oQq7E/HlK1xfD+/GxiQFUGV1uHKRxtSFx3g3E4Dn2Y=;
        b=i1IhRSUK11f5HQ/X6peFlJksqozOU8P86EJAmQ10z9PwPBrJhuex5kGFzvoEvQxDGU
         RgnRvU9gEDAf1fCwt4hp9XqbUW3m1rJvYmyrnvaihmR7o7uP3OaO27avrj/3AIoRb3Qc
         n9PR1YHyQvZakMTeLfFBBjl+y4Ki066EhR9idzx7E9luW/LtAvnLTy0Vvq1ciNIPPwuL
         wkqGkF6qtb/MGYoL2GQtAITQ0m8i19J5nw7p6RAVhm2ZG0S3xH15wxPgPzanpt5J6ryM
         8lDRRxUz0d8VcAfvcFd9/+r4RS7zeJlkD6QFIVR4yt/HV44uUI3DN99pB+/eUSMxVtZz
         Jr5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzKttoVVqsHE8yWROOBAuP0oph8XE+48YHxjrx45PE/wexV68KLZIrXmg7o+Gpo30+bCHrck5PGLO16+pE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuks6UACFhFNXJXcFMDm5etk+kHy+CXagl28CDezrrpoztY5nO
	t3Nk58G4zURt58Pgx9iC9fGR6YncEbOeJoMV3qve6CJ1xhtXq3TWgYWvNWNFtBFQCAgwtJbpynb
	dyoy1itkR+uhsLDV78mEP10be3iyYpM3CEFYQfZTNKRKthdntH1dw62ro/0jtrhCUaiamDpc6st
	4=
X-Gm-Gg: AYBFou1J1UC8IMXAy9PFYigb2IT4dV4hCVuQOkW9fzYg6zxFGI5BgGYmIm6greq5M5G
	bzx7RQDxfJF9w6UxwNy9bMutmuGso4wBH1CKQ4NkhBVJ3PGH6GPNwjQBVUDbMMRr0yT51IE8PAY
	lj59F8SYrFWsRJkCFMLA/LrC5RLHyXxoMWpcqPC532qpGyU5I4bgVZyq9KBBv/CL7xxvDZI3lrd
	VOXDLaV3CopynD3bPS3ceohLKEyHyXCMDzHIFGgQfsLpQZ+hSzfmgRMv9dgHeG3elSFkl1gIeRY
	B426IwmsTLi3h2YkbMeK5GjcCK1YoBaz9lnSdMeGXkS/LJrvp4t2HXD5C3Ae8bp4ULsAhwyuax4
	WFSJYANPexNzievkdwTjYVoBv8WIs+QoxDwqn6OX6kxciMwD7Pa1cSKyn7YAoDgLftyeHxjGPnw
	ogrhIC
X-Received: by 2002:a05:693c:69c2:b0:36a:37:1404 with SMTP id 5a478bee46e88-36a4241b6f3mr1873243eec.13.1793341985529;
        Thu, 29 Oct 2026 23:33:05 -0700 (PDT)
X-Received: by 2002:a05:693c:69c2:b0:36a:37:1404 with SMTP id 5a478bee46e88-36a4241b6f3mr1873218eec.13.1793341984724;
        Thu, 29 Oct 2026 23:33:04 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm4903419eec.15.2026.10.29.23.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:33:04 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:02:39 +0530
Subject: [PATCH v3 2/2] media: iris: add new rate control type MBR for
 encoder
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
Message-Id: <20261030-b4-add_sc7280_mbr-v3-2-8fadcc873953@oss.qualcomm.com>
References: <20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com>
In-Reply-To: <20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341973; l=10797;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=6UywQjKMpnSOqXW1OidOhzqobF+463dOCS0UZYWosJM=;
 b=VpzSL33d5hs8IQU9M5x/t55rNfoz1TQyXjMKuTZDGiCusbyooVYEyeu4Cd70xiN2Fc2xmLCXW
 4hPMjwuYJ10BHoAvfHHfOYszeL/Fub+cl3vSVByzHRsUuYrCsGJmp2W
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX96/tJkLZZXOz
 DEGrC/mQawDb0bOh1GVWwTbtyOfdASrDOjC5ECm9Vnd8HDDJSIA0VaH0+v1mAxwFzwwfAemQeJB
 RjeJWk3ZivIHcDiZvjhzBLdBTr4FxQbPTCyLLcwecltayiUnojm19lngDs/tRhT5J69sRM7rgs+
 4F8fkyga2KphjmG7UipqY+FOkAUmOCMuChVdCwN1Aa4l+msga2dVZGHN4bJtDOlzp4QLHocc2J7
 FFgZ44dDyPFfeEamU+WGZqR+Rfo0nwROSk1q5bV6ngVhZ7RAXN4tntX5L7wShiL3fK014nY1Do/
 g0G2L64fLcquV4OUJ3T/BDzda4Upff9FtLlWlrHAJinm/NaMS8QMwemx7UGE1R3qu3iWzpC4OK2
 crvrQUNCf6kc3IpUOvPBIOOnT68Tv1DJAzhrJ9cxfwJL8rvfs9wN1UMTmipfgWQZWO6lyco8UbM
 u0durt6CQ7trT520phQ==
X-Proofpoint-ORIG-GUID: UQIAFVNf2gq5suYqBDKwh50s9wm_iVJ4
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae43a22 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_slUeuvS8-LuMMZgc54A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX25nTau3OoruE
 d4ucVVZIIXd2Wmrv3/NRKAv7+Q9KByQkY+q1BGI5Q1v1WlfIANA2rZ25USQI2e4RPe3CnaBi/nx
 vIbJ7JKTqZLl1Ihl/4bdEu1CEzc3Rk0=
X-Proofpoint-GUID: UQIAFVNf2gq5suYqBDKwh50s9wm_iVJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

Add support for the MBR rate-control mode on the encoder.
MBR has no corresponding V4L2-spec definition, it is exposed as a
Qualcomm IRIS vendor-specific control rather than a generic
bitrate-mode value.

Add a new boolean control, V4L2_CID_QCOM_MBR_RATE_CONTROL, based on
V4L2_CID_USER_QCOM_IRIS_BASE, to enable it. When set, the driver
programs the firmware with the MBR rate-control mode, taking priority
over V4L2_CID_MPEG_VIDEO_BITRATE_MODE when both are client-set.

MBR is currently supported only on sc7280. Rather than duplicating
the encoder capability table per platform, add a mbr_rc_supported
flag to struct iris_platform_data, and merge in a small
platform-specific capability table containing only the MBR cap for
platforms that support it.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 101 +++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   4 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   1 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
 7 files changed, 94 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 4f2633bbb49f..626239952b96 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -163,6 +163,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return SLICE_MAX_BYTES;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
 		return SLICE_MAX_MB;
+	case V4L2_CID_QCOM_MBR_RATE_CONTROL:
+		return MBR_RATE_CONTROL;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -314,6 +316,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
 	case SLICE_MAX_MB:
 		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
+	case MBR_RATE_CONTROL:
+		return V4L2_CID_QCOM_MBR_RATE_CONTROL;
 	default:
 		return 0;
 	}
@@ -352,6 +356,17 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 	.s_ctrl = iris_op_s_ctrl,
 };
 
+static const struct v4l2_ctrl_config iris_mbr_rate_control_ctrl_config = {
+	.ops = &iris_ctrl_ops,
+	.id = V4L2_CID_QCOM_MBR_RATE_CONTROL,
+	.name = "MBR Rate Control",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.min = 0,
+	.max = 1,
+	.step = 1,
+	.def = 0,
+};
+
 int iris_ctrls_init(struct iris_inst *inst)
 {
 	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
@@ -385,7 +400,11 @@ int iris_ctrls_init(struct iris_inst *inst)
 			goto error;
 		}
 
-		if (cap[idx].flags & CAP_FLAG_MENU) {
+		if (v4l2_id == V4L2_CID_QCOM_MBR_RATE_CONTROL) {
+			ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
+						    &iris_mbr_rate_control_ctrl_config,
+						    NULL);
+		} else if (cap[idx].flags & CAP_FLAG_MENU) {
 			ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler,
 						      &iris_ctrl_ops,
 						      v4l2_id,
@@ -428,6 +447,38 @@ int iris_ctrls_init(struct iris_inst *inst)
 	return ret;
 }
 
+static const struct platform_inst_fw_cap inst_fw_cap_sc7280_only_enc[] = {
+	{
+		.cap_id = MBR_RATE_CONTROL,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+};
+
+static void iris_copy_enc_caps(struct iris_core *core, const struct platform_inst_fw_cap *caps,
+			       u32 num_cap)
+{
+	u32 i, cap_id;
+
+	for (i = 0; i < num_cap; i++) {
+		cap_id = caps[i].cap_id;
+		if (!iris_valid_cap_id(cap_id))
+			continue;
+
+		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
+		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
+		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
+		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
+		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
+		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
+		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
+		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
+	}
+}
+
 void iris_session_init_caps(struct iris_core *core)
 {
 	const struct platform_inst_fw_cap *caps;
@@ -461,23 +512,12 @@ void iris_session_init_caps(struct iris_core *core)
 		}
 	}
 
-	caps = core->iris_firmware_data->inst_fw_caps_enc;
-	num_cap = core->iris_firmware_data->inst_fw_caps_enc_size;
+	iris_copy_enc_caps(core, core->iris_firmware_data->inst_fw_caps_enc,
+			   core->iris_firmware_data->inst_fw_caps_enc_size);
 
-	for (i = 0; i < num_cap; i++) {
-		cap_id = caps[i].cap_id;
-		if (!iris_valid_cap_id(cap_id))
-			continue;
-
-		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
-		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
-		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
-		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
-		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
-		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
-	}
+	if (core->iris_platform_data->mbr_rc_supported)
+		iris_copy_enc_caps(core, inst_fw_cap_sc7280_only_enc,
+				   ARRAY_SIZE(inst_fw_cap_sc7280_only_enc));
 }
 
 static u32 iris_get_port_info(struct iris_inst *inst,
@@ -777,6 +817,27 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
 				     &peak_bitrate, sizeof(u32));
 }
 
+static int iris_set_mbr_rate_control(struct iris_inst *inst, u32 rc_mode)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	u32 hfi_id = inst->fw_caps[BITRATE_MODE].hfi_id;
+
+	inst->hfi_rc_type = rc_mode;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, BITRATE_MODE),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &rc_mode, sizeof(u32));
+}
+
+static bool iris_mbr_rate_control_enabled(struct iris_inst *inst)
+{
+	/* MBR_RATE_CONTROL takes priority over BITRATE_MODE when both are client-set */
+	return (inst->fw_caps[MBR_RATE_CONTROL].flags & CAP_FLAG_CLIENT_SET) &&
+		inst->fw_caps[MBR_RATE_CONTROL].value;
+}
+
 int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
@@ -786,6 +847,9 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 rc_mode = 0;
 
+	if (iris_mbr_rate_control_enabled(inst))
+		return iris_set_mbr_rate_control(inst, HFI_RATE_CONTROL_MBR);
+
 	if (!frame_rc)
 		rc_mode = HFI_RATE_CONTROL_OFF;
 	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
@@ -813,6 +877,9 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	u32 rc_mode = 0;
 
+	if (iris_mbr_rate_control_enabled(inst))
+		return iris_set_mbr_rate_control(inst, HFI_RC_MBR);
+
 	if (!frame_rc)
 		rc_mode = HFI_RC_OFF;
 	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR)
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 08db80744420..a170ef33a0ac 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -6,8 +6,12 @@
 #ifndef __IRIS_CTRLS_H__
 #define __IRIS_CTRLS_H__
 
+#include <linux/videodev2.h>
+
 #include "iris_platform_common.h"
 
+#define V4L2_CID_QCOM_MBR_RATE_CONTROL (V4L2_CID_USER_QCOM_IRIS_BASE + 0)
+
 struct iris_core;
 struct iris_inst;
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 47e9147a9b6d..50d38fe89792 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -621,6 +621,7 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		case HFI_RATE_CONTROL_VBR_CFR:
 		case HFI_RATE_CONTROL_VBR_VFR:
 		case HFI_RATE_CONTROL_CQ:
+		case HFI_RATE_CONTROL_MBR:
 			break;
 		default:
 			return -EINVAL;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 6981e6e84fd8..33c238a1c9bb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -132,6 +132,7 @@
 #define HFI_RATE_CONTROL_VBR_CFR		0x1000003
 #define HFI_RATE_CONTROL_CBR_VFR		0x1000004
 #define HFI_RATE_CONTROL_CBR_CFR		0x1000005
+#define HFI_RATE_CONTROL_MBR			0x1000006
 #define HFI_RATE_CONTROL_CQ				0x1000008
 
 #define HFI_H264_ENTROPY_CAVLC			0x1
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 2b8b057d35a9..cac2f3225754 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -64,6 +64,7 @@ enum hfi_rate_control {
 	HFI_RC_OFF		= 0x00000003,
 	HFI_RC_CBR_VFR		= 0x00000004,
 	HFI_RC_LOSSLESS		= 0x00000005,
+	HFI_RC_MBR		= 0x00000006,
 };
 
 #define HFI_PROP_RATE_CONTROL			0x0300012a
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375..c150dbb559f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -211,6 +211,7 @@ enum platform_inst_fw_cap_type {
 	SLICE_MODE,
 	SLICE_MAX_BYTES,
 	SLICE_MAX_MB,
+	MBR_RATE_CONTROL,
 	INST_FW_CAP_MAX,
 };
 
@@ -348,6 +349,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	bool no_rpmh;
+	bool mbr_rc_supported;
 	u32 wd_intr_mask;
 	u32 icc_ib_multiplier;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index becbe3776544..35a5c42c6ab7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -132,6 +132,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.mbr_rc_supported = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.icc_ib_multiplier = 1,
 	.max_session_count = 16,

-- 
2.34.1

