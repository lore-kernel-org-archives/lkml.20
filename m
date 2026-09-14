Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3834266B8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379684; cv=none; b=PTRd+wiiRyvls0WPSq0tOWPLxzHXw+G4ytqDg7SzUlfixKqTyEgJ3I5+q4qnBVxeDbPMRlcflXGrSpOPls0nwLIu2Fxw9R5csP2mqoEOyEKCxzdQQDOa3/3/nNa3LOi+XzYd9UxA4PO/LdbOCcMiilh5D2gliP1V/jisRiSAaqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379684; c=relaxed/simple;
	bh=kqjXL0izQ8VvgX01VJKYIwgp2NT0UsTtyXJEAWGbUkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pRy4nMTobpYjPXaHIE6+gCHrDYevM+Oi5PFOPMCPnYj/uL3utAUMPgjp5TlxVPQxAmszPpGR9m+j5D55C1Sl14HqeNI3Isl+G/YdWzPUKc/kS02UuP/SF7TMLXzWZaKG+y7cC2XKTlHGjYGm8e/zaQL8whmT+xjD/CBVxhjAfaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ge3q5jCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXqWs/vv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ge3q5jCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXqWs/vv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nkT51086523
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBc1rez6FTVnKmfCDZ0DhHQ0xyRgQ7qyunCJVGgXX2M=; b=Ge3q5jCL6/ZhqGgZ
	R5z5RSCYmZkkBN/rZCCBRfQrAev6YexJidez2+xJltzCxJ6qmYA3J/dM+nQnFdfE
	W9SGP8NuP5zV5MFNvAwRnCTf3B1hEWsOelU1iuWa1rh+UoRRYAJ8V4xum+KoHJgB
	T/4b1iq+QqNciMVuZgvOROcQVvp3Z0u7hu3u3kWtORkcjHIM5P9FpHNvYhYYH3ZO
	iYzsy9uIkosEeLwszWVs4fZ5JYMUD2WsjPQrpRVi54orFLdaKFd8jvNYJwS3LjAi
	UNGZAuXvmCS6NG51QwrR704flxQbYyZXV5eoBfLPLjAO8c8Drg2A3LYU0tPExJJz
	fdq9YQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09vc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so5568715a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789379681; x=1789984481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBc1rez6FTVnKmfCDZ0DhHQ0xyRgQ7qyunCJVGgXX2M=;
        b=ZXqWs/vvsRnbMyeyNzP8OFTDyIXvp6fBh1RIKavrRBBT2sd/PKcRk684++iw4gBG/+
         GVvJV+7MzYFaa8mfRSjVNK4/j9GMOtaLDJVtW9IKgQjF1/mJbr7AahHY6oqpa+jAW7Tl
         mN6p2iRVsQ1v3IUQNSHF3brp6e29wR0hcyiPlpCNS6ru1d3qVydjvwrt4B1l804z28s8
         TgQ3sv7WnRSt5pHPWCHRnZSP8R8umoH3WT0RRwjy27lHu6++vieYITTH9O+A7Tu1sSEG
         UfX20iumi3FbIvORfItucE/Q4FFRxD3/kjvLTgby/VWe0TQKjubxX5WrYkSv6juHaTqZ
         s35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379681; x=1789984481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBc1rez6FTVnKmfCDZ0DhHQ0xyRgQ7qyunCJVGgXX2M=;
        b=efUD53ZAKyTPqJx8+4jUMp+FPPgmsJabnan3Rp4HnL2pss3KoblHh11iKXVNmeFqOG
         cCWLa6cRbLG/fX1irQRSez4xrF4zQqTXcGdRlFJPhI8NcuqX/kCgRdMnKpnvAFE3SAJJ
         iZN6LQsaPAHytYw9w/b5VWqwf0hnkLOgTs3RnPV275ZUh8JQVyoeP0BdYMa6zQQHut1M
         eLcQ+bx/Fl2PtJcC75CZK2J+w61b/UHgbYJOe63PwSQxQUmPzRrKRSH0NE60BumL0YpW
         k2BPkkkKTE/EJ2u6IVAR4UqUFF24CxaKzia5yDNPGrIVUw1LDDUIhOwo6n0k31p2a7pV
         Vx7w==
X-Forwarded-Encrypted: i=1; AKwUvByPLhnIoSLgeQ17rXbT907vCrxsjUxq3GuChs3/JFmrYrX28HwbwYkASh3wKZw54M7z4CL6cW85bJBX+fA=@vger.kernel.org
X-Gm-Message-State: AFuF++m/dRE8XItP2FIWQ4fxxWulbpYgGYmfatVpcUlR5GDZ4rihvPX/
	1GusO/iDeVJVOlo3Vb+IMgcTaiuGrrCj58VFxkLx3ImizEmZLV0s8pPQ4OUrDItXHJWIUoRHnMl
	bIpp+SO6WwariMhp45z/H8E6UaGLiPTiJwUypsynpID6ArRBXrUS4xPtSkwLlvGO9uWg=
X-Gm-Gg: AYBFou2KlfYs1rR+j3xy0hnhAmoCUuSRrQ0Tkh/plCXL0W+dLNaem3fcP3m/Y2S6n6q
	5Wg/cVkaZu6vlYlN+aE0FBvauRXLOj7T60hDxOdg1O1pMEBfEqg+/A6LIsl7jOr0nOzW9tjwdwG
	3Kya1KLWb6/hbhauKuXiYf10WmD9dIL9xx90IVxILf0u8KAKd8gejxl6sfB3s6S3Q6tiwatMBOr
	Q9IS2V580geIu9XiyBh40eAxHmBl2T+3QP1f2bMopuWU1vWFnI85XtIY9i93G5Q5Wl8nU8sFOIH
	UxYvCP+3KZ5ECD8feefE2MkTUvpP/ZoU7Xzl/EiU2FKNuMvgcoGbVwD2LMkG0oDJsZaQnNhJqUS
	n6zgI9LIqJ7e+qfJyo/s53/sZFEkQ2ykMQOoSr464T6k5AsyCiC0ybJA7PZzsvup+1w/RnC3grf
	I=
X-Received: by 2002:a17:90a:2cc6:b0:39d:ee20:1e3b with SMTP id 98e67ed59e1d1-39dee202434mr2052692a91.23.1789379681326;
        Mon, 14 Sep 2026 02:54:41 -0700 (PDT)
X-Received: by 2002:a17:90a:2cc6:b0:39d:ee20:1e3b with SMTP id 98e67ed59e1d1-39dee202434mr2052659a91.23.1789379680914;
        Mon, 14 Sep 2026 02:54:40 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm20664313a91.1.2026.09.14.02.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:54:40 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:54:24 +0800
Subject: [PATCH 2/4] media: iris: Add support for Eliza
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_eliza-v1-2-e8ccd9b8cf7a@oss.qualcomm.com>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789379665; l=4797;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=kqjXL0izQ8VvgX01VJKYIwgp2NT0UsTtyXJEAWGbUkc=;
 b=T0MewPDIrY0a8eUo71HUa5OzAwTIL7sV3swqhfSz8Bzy57bMBt4kh5jveS2uBXQiV5kwYjrb2
 +bcfp0PV2GaCkct+dZYGNdgmJ23Tt15VScxfzOUWCF3bW0HOzSRYY82
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfX+XUQWoxWmAQA
 bf7gG7VEawsFP0usN6oLV2KbjPkSwUMgzsQLEpcCOKZ+vQixRcAm83qqR0x5MyJOpNLajhLFgRp
 yQT+M8tknoK16tonq1RNFDD48wAdjAM=
X-Proofpoint-GUID: WNM5njAlPtP9VC70ynrN8SAk8u8EbzM4
X-Proofpoint-ORIG-GUID: WNM5njAlPtP9VC70ynrN8SAk8u8EbzM4
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7c462 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=keAPckw3ocdkVcR2fkAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfX/A9zqHwY/LS0
 uNZusxnPW3udTM/Ng//vHya6VvoIxOfBV0TAMUnK2GIVSqd6WBI+Ubjc2WvgS2ZhXqhcFaeN5KG
 J3/pA4hoxJqSQVOQazO11nxXjkcSV8kXrUiZZLLO6jqxZIgdc8Df+A+dhOfTG84YYnUFJ7D0PM8
 LDqqVJL8TxFWev4LMxzcZaWZUyiAmkUpVKGih9DdeqtF0+uRBWQmKFW9RHpmcTDb5GmJdc0lrAz
 iuNowed3y/TDvg5jR4e/NU5PMODhMnlUKPmJruAt5iT7Tr8z+J4Uw0y9WolPwAdAR+FWr16dQwD
 6s65ypbnhSa5m6XfIOHjPgZtlttxIwt+6ydS3AocAllCWWB/+j7uEyztiyt+EWBLAavC059Pwvw
 9dutUjpNnDKng0V94BaQ0sXBt9qcVj+aYRdvd7R6A2iT74KvHA2Pe2ZFB4Wnh35zQ3gMkfdJPbI
 PN1ugjI7q1/MqgthkCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140141

Add support for the Eliza Iris video codec. Eliza uses the VPU3.3 hardware
with a dedicated vpu33_p2_s7 firmware variant and SM8650-compatible
clock/reset tables. Key differences from SM8550:

- firmware_desc_gen2: vpu33_p2_s7 (SM8550 uses vpu30_p4)
- vpu_ops: iris_vpu33_ops
- clk_rst_tbl: sm8650_clk_reset_table
- controller_rst_tbl: sm8650_controller_reset_table
- inst_caps: platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 3 files changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9748095091461ba13443c63955a42906fa4f050c..69c239c60b9d763e5e2fd0c16de0e95482414b58 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -54,6 +54,7 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 extern const struct iris_firmware_data iris_hfi_milos_data;
 
+extern const struct iris_platform_data eliza_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb35cef91ba4d0608bd1eb58ba7194..4c6d565bfa6c7e176aa41aabf27ade8c95be2fa7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -42,6 +42,12 @@ static const struct iris_firmware_desc iris_vpu33_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu33_p2_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu33_p2_s7.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
@@ -85,6 +91,45 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
 	},
 };
 
+/*
+ * Shares most of SM8550 data except:
+ * - firmware_desc_gen2 to iris_vpu33_p2_s7_gen2_desc
+ * - vpu_ops to iris_vpu33_ops
+ * - clk_rst_tbl to sm8650_clk_reset_table
+ * - controller_rst_tbl to sm8650_controller_reset_table
+ * - inst_caps to platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)
+ */
+const struct iris_platform_data eliza_data = {
+	.firmware_desc_gen2 = &iris_vpu33_p2_s7_gen2_desc,
+	.vpu_ops = &iris_vpu33_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = sm8650_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
+	.controller_rst_tbl = sm8650_controller_reset_table,
+	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_qcs8300,
+	.tz_cp_config_data = tz_cp_config_vpu3,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_4K * 2,
+	.max_core_mbps = NUM_MBS_4K * 60,
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4bdb078d83b5c331869dab2409bc4d10ab302737..9e601ee802097ec31531fcae85d0b17a7944686d 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -427,6 +427,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,eliza-iris",
+		.data = &eliza_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.43.0

