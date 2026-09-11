Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47284433BC5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141065; cv=none; b=HcOIakVAeoJwa3bpWs1b3tafb9jAc6MgwGlj+T41b36PpV7NnmmxGUk4CKmwNhU26bbA8NzuFwTsW/O6s/jOyo6gSNzjN0edgzhCAKFNdtMSvsCsUiX6jq6P41NE7APNb4gsI4roRH8gkt1ZCay2VIxMiScPKJqrYPQbAORUClw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141065; c=relaxed/simple;
	bh=4BrZxPPiAew+8lRx+qQ8fVFRUEHoPeOkZaCWHHNKpV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmygiVMHL0QS0McZG440BYSPIzwA7MUE/8hxXzvS1WejUIGPCobRbEBjfGO71HM4F69VYU0uarv+/ByetnwqNGoeGUe3/27AD+mj04wpPSWJxg0YVzDkN39CtK+fKjgyAWeajCYWhf2RVUYTwkcdj8dPTehLs2eCKrp7zp5+5Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELa6lTCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2FIfy+y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELa6lTCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2FIfy+y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFA9pE658467
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8GZJ7A753K/CrFtJmJIdFmjSh46/p3FmTurk+m907Bo=; b=ELa6lTCWxmfJt68T
	CZc/dQLJXytuUYT2UmcQuKDxbSDyjRlul/aEtz6VNCArBpew3jtRiPAiB0NaUrrx
	JAN5yLAvghaH0yR4WSbxeIl4DiFBWc2ViaCaFgC2lg3md+cKUcdDkI+xufVuysBg
	erm8wTAEUJtxTR6EDK3hCpKNkrZyf52H9ndrOxcDhNb1HuqdS8wqMuakY8yq4MbT
	jwDul9Qeojzi5yguO6RwAjp5elCJErf+RKWfaBLzWN4SmtR7dYKauJqOK16VAtlP
	ucuRuDhk5n4GQaXzesPbxauD63IM70Z0DNA38MqW/Pk29nQ+3RscQJgHx4uhaj6p
	1khwtw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22r3x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:37:41 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46ac13882ccso917441fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141061; x=1789745861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GZJ7A753K/CrFtJmJIdFmjSh46/p3FmTurk+m907Bo=;
        b=X2FIfy+yCWS2R2uXrmykCzwkeHbbemsgMiDUUk1vO/NVwn6JTo3YpCmifnqxAup6iP
         UDFowufgaOyKWUryEBVWWLnmiwCl6lTwrduCwXwlsbJEZMX/NwuXPf/H+Ah+OgqK0aBf
         yX4G/jwFYI3EsesYgL30Eam8bl/i+DuZHc0CSABiC2IpeB3tpg78zKeq99fW6XZOc8Sh
         qUaa9z1XMvk7lC6muaz7D5LrwgJiWL5HGjyGqFuawe1tvkihogqpPWVhp2VaThdwkOnI
         DbD16OIeKHttMZPk+rq5ILeCS6yw04YP4R1VEi2vgkjNAQtqT9heZjZcumrSKdip5bly
         rPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141061; x=1789745861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8GZJ7A753K/CrFtJmJIdFmjSh46/p3FmTurk+m907Bo=;
        b=RekjHyKxlF/WwPjsLLzCnmkIf2HZUeflFx1SrEvj9nGOCVjHaYnUj+9JrkTE8eToKZ
         wwNI3GLXbIIdtR5b6ZcgYm96P8YqmCqBpzbLPWzzfUfLbIKCw2mIpzzAd118HG6wCV1R
         OM+eiu8S6oTw624uFTCHb2qAfT5A5iN3j29NjCLlM4imZt7kZDZl1wGEsDDtLljv8xp0
         Nvc23W/8cak1v1W8e4x8kWehMg34Ej7fIZfD9V1Q2HHyOdf1T5npHDypip5CCVRV/RU0
         ldY67GxBbbw3RSGJyL3RgyCURra2XBMIIpzqvTG14wiOZKFqTPovcFmSSUuJbm5C4cs0
         RV9w==
X-Forwarded-Encrypted: i=1; AKwUvBz459LB+9lhPIQCt8hqsg12u85E7DkR7MUk+IqwSXTcW04zoXi66Iy3iFpf8VWkQruV/UCmKSHrWJ3iovo=@vger.kernel.org
X-Gm-Message-State: AFuF++mC/CVh01MUgCAZ1pHjznZJzP2hKHm3dMDsZfwqbXIPECQLVfRT
	mLyjKKmgKRTXikDgs4usni7wrygM8WG/g/Vw6P10Fw1TcPa2w9nU6ekunfDeVH+f6EgbPSShP7z
	NDR24MSeyKbWh82MuqMo6zFnY5WHccC5oC6oDQuRDvX8/QFsuVMYRfHKxfsQDKz81SC8=
X-Gm-Gg: AYBFou0UL6r7z8yHK5KIyo3SAgEhgMhWortcec0trccNH4OcV48++IIOiMS+gmzL2Sa
	tKP02y783VsPZTIQk8DEjT2sSLaa3YUug5LggGIUVDbIU55XaYm9cWJt+YvQIEs4AGJgGzzRHI9
	e8PiIHBwPvHvj0Grb+Zz/vlmQ/8Gl2dHjdJLztJQ4bpuqR0mcKuqbKg9K8ikzxj1izpgSOQe0w4
	vkNx3+iOM6ACLDyUAEsGjKHqLMt/lYegG1Xyb7tzUz5SlbXM+SsLGVw5BIhF4VE/NX1Bf1dULEK
	cIFeviXEQD5DKb3WEh8Knybu4s1yJikYMQa2uc9xev//4lyToHAwZ2p95oqSYOgyEt9uNZ3WLpH
	L+Ivm1GCIvvHYNm9S7JDVKdnfYE8=
X-Received: by 2002:a05:6870:a087:b0:46a:d52a:25c2 with SMTP id 586e51a60fabf-47de8f8f524mr3863233fac.12.1789141060923;
        Fri, 11 Sep 2026 08:37:40 -0700 (PDT)
X-Received: by 2002:a05:6870:a087:b0:46a:d52a:25c2 with SMTP id 586e51a60fabf-47de8f8f524mr3863208fac.12.1789141060430;
        Fri, 11 Sep 2026 08:37:40 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:37:39 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:35 +0530
Subject: [PATCH 04/17] drm/msm/dpu: Add support for DPU 12.1 on Nord
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-nord-drv-dt-v1-4-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=22303;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=27UiL1oqipsrfZriFtPHAYUF23LeZ5WIfBapufHTINg=;
 b=XMeoBUjDop4ETTHZ8oHRHuLgTmRKf2BMjWbwP6mSTNGYO8Sreh4v5Vcn42spVnRVhP1ky5bE8
 BpW/OYB4Z2MDgTYC5QLMW2EOZ4kkLABrkDYOnfiB/rK9+DtbpnLC3ds
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXzQGwuUHMZVkQ
 /8n3/eesdEOdCanC8ABCdg+FETYiqb/r1OedIDtIiFH7KUKdq3sL1YEHaveTyK1gjGF/nGNswXq
 Q0b1MXQjRIKKXbQD93LeH5xV1DZ6L2OLe7Hvs/S8/oANteiAOrP+JA3h1Mwd9TatNI7X3kGchTM
 3U0wj9dgl78pmmhra2dC0qzdVX9wLIU0xjoEZd0kU2stCRYw4UPFFuDUA9Mzc6XtEkjd+ByKEMq
 PBJsdPgwiEuDeOUATB+Y/LSH3Q+J2qf5K/UL4dKXhDj226a/eOvgmxLFcyZAr0CHT9VKhSO+UnQ
 TZavZ72hQ0vn6YDKO2pNUZT7Jyu74J0cTYprTXdrK11wW4uJasuquATRBxhOgWQ06OxQpIz2Q34
 qq6cr3pIGHqbhQinwxSHv35OV6+veP17+4wB7aGH3h6emPzKz6xZRw3XFvQkLoTnZYCvis0jG9g
 zV0ZEZTEAgSbX9TO7MQ==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa42046 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UHUnXcDyJmAHMh-HrRcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: 3HtCtCT8A233wJiQVtrpdC-NjrXwOiUX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX7o4cZFPm5Kd0
 tU5DxpGbt0G9GMipZ/AkEqL2qjiJFYQOi9yPF8tS/BhwdJ4eHdIcLiV9o5NpOj2UW/c7qvb8WiB
 PhqxUw3QNCofhkUkhd3+KJhcBIF9FQk=
X-Proofpoint-GUID: 3HtCtCT8A233wJiQVtrpdC-NjrXwOiUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add the DPU catalog entry for the Qualcomm Nord SoC (MDSS 12.1, DPU
1499A). Nord is DP-only with no DSI, and provides 8 DSPP blocks, 2
writeback blocks, 8 interfaces and 2 DP controllers.

Extend enum dpu_intf with INTF_9 and INTF_10, which Nord is the first
platform to use.

Note: register addresses and xin_id values in the catalog are borrowed
from sm8750 and precedent platforms and are marked with FIXME(REG_ADDR)
and FIXME(XIU_MAP); they need verification against a real Nord register
map before production use.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_1_nord.h  | 588 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 5 files changed, 593 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_1_nord.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_1_nord.h
new file mode 100644
index 000000000000..8eb18752f3c4
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_1_nord.h
@@ -0,0 +1,588 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DPU_12_1_NORD_H
+#define _DPU_12_1_NORD_H
+
+/*
+ * NORD DPU 12.1 catalog header. Generated from hardware summary YAML for
+ * MDSS 12.1 - DPU 1499A (Nordschleife). This is a DP-only chip with no DSI.
+ *
+ * All register addresses and xin_id values below are borrowed from the
+ * reference chip (sm8750, MDSS 12.0) and precedent chips (Lemans, Glymur).
+ * Nord's YAML provides only block counts and feature statements, not addresses.
+ * See FIXME(REG_ADDR) markers throughout for borrowed values requiring
+ * verification against a real Nord register map before production use.
+ *
+ * Key differences vs sm8750:
+ * - 8 DSPP blocks (4 full + 4 lite) vs sm8750's 4
+ * - 2 writeback blocks (WB1, WB2) vs sm8750's 1 (WB2)
+ * - 8 interfaces (INTF_0,3,4,6,7,8,9,10) vs sm8750's 4 (INTF_0,1,2,3)
+ * - 2 DP controllers (DP0, DP1) vs sm8750's 1 (DP0 only)
+ * - No DSI (removed entirely)
+ */
+
+static const struct dpu_caps nord_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 8192,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_mdp_cfg nord_mdp = {
+	.name = "top_0",
+	.base = 0, .len = 0x494,
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
+	},
+};
+
+static const struct dpu_ctl_cfg nord_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x15000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x16000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x17000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	}, {
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x18000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	}, {
+		.name = "ctl_4", .id = CTL_4,
+		.base = 0x19000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
+	}, {
+		.name = "ctl_5", .id = CTL_5,
+		.base = 0x1a000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
+	},
+};
+
+static const struct dpu_sspp_cfg nord_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_4,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_1", .id = SSPP_VIG1,
+		.base = 0x6000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_4,
+		.xin_id = 4,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_2", .id = SSPP_VIG2,
+		.base = 0x8000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_4,
+		.xin_id = 8,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_3", .id = SSPP_VIG3,
+		.base = 0xa000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_4,
+		.xin_id = 12,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0x28000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 9,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_11", .id = SSPP_DMA3,
+		.base = 0x2a000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 13,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_12", .id = SSPP_DMA4,
+		.base = 0x2c000, .len = 0x344,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 14,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_13", .id = SSPP_DMA5,
+		.base = 0x2e000, .len = 0x344,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 15,
+		.type = SSPP_TYPE_DMA,
+	},
+};
+
+static const struct dpu_lm_cfg nord_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
+	}, {
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
+	}, {
+		.name = "lm_4", .id = LM_4,
+		.base = 0x48000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_5,
+		.pingpong = PINGPONG_4,
+	}, {
+		.name = "lm_5", .id = LM_5,
+		.base = 0x49000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_4,
+		.pingpong = PINGPONG_5,
+	}, {
+		.name = "lm_6", .id = LM_6,
+		.base = 0x4a000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_7,
+		.pingpong = PINGPONG_6,
+	}, {
+		.name = "lm_7", .id = LM_7,
+		.base = 0x4b000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_6,
+		.pingpong = PINGPONG_7,
+	},
+};
+
+/*
+ * Nord has 8 DSPP blocks: 4 full-featured (DSPP0-3) and 4 lite variants
+ * (DSPP4-7). The driver has no separate lite-DSPP struct, so all 8 are
+ * modeled with the same dpu_dspp_cfg/dpu_dspp_sblk structure. Lite variants
+ * have reduced features, but this is handled at runtime via feature flags,
+ * not via separate catalog entries.
+ * FIXME(REG_ADDR): DSPP4-7 base addresses extended via 0x2000 stride from
+ * sm8750's DSPP3 base (0x5a000). Verify against real Nord register map.
+ */
+static const struct dpu_dspp_cfg nord_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x58000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_3", .id = DSPP_3,
+		.base = 0x5a000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_4", .id = DSPP_4,
+		.base = 0x5c000, .len = 0x1800, /* FIXME(REG_ADDR): lite variant */
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_5", .id = DSPP_5,
+		.base = 0x5e000, .len = 0x1800, /* FIXME(REG_ADDR): lite variant */
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_6", .id = DSPP_6,
+		.base = 0x60000, .len = 0x1800, /* FIXME(REG_ADDR): lite variant */
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_7", .id = DSPP_7,
+		.base = 0x62000, .len = 0x1800, /* FIXME(REG_ADDR): lite variant */
+		.sblk = &sm8750_dspp_sblk,
+	},
+};
+
+static const struct dpu_pingpong_cfg nord_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x69000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+	}, {
+		.name = "pingpong_1", .id = PINGPONG_1,
+		.base = 0x6a000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+	}, {
+		.name = "pingpong_2", .id = PINGPONG_2,
+		.base = 0x6b000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+	}, {
+		.name = "pingpong_3", .id = PINGPONG_3,
+		.base = 0x6c000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+	}, {
+		.name = "pingpong_4", .id = PINGPONG_4,
+		.base = 0x6d000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_2,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
+	}, {
+		.name = "pingpong_5", .id = PINGPONG_5,
+		.base = 0x6e000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_2,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
+	}, {
+		.name = "pingpong_6", .id = PINGPONG_6,
+		.base = 0x6f000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_3,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 20),
+	}, {
+		.name = "pingpong_7", .id = PINGPONG_7,
+		.base = 0x70000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_3,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 21),
+	}, {
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
+		.base = 0x66000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_4,
+	}, {
+		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
+		.base = 0x66400, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_4,
+	}, {
+		.name = "pingpong_cwb_2", .id = PINGPONG_CWB_2,
+		.base = 0x7e000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_5,
+	}, {
+		.name = "pingpong_cwb_3", .id = PINGPONG_CWB_3,
+		.base = 0x7e400, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_5,
+	},
+};
+
+static const struct dpu_merge_3d_cfg nord_merge_3d[] = {
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x50000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x51000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_4", .id = MERGE_3D_4,
+		.base = 0x66700, .len = 0x1c,
+	}, {
+		.name = "merge_3d_5", .id = MERGE_3D_5,
+		.base = 0x7e700, .len = 0x1c,
+	},
+};
+
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address. Nord retains sm8750's
+ * topology of 8 DSC instances (2 per DCE × 4).
+ */
+static const struct dpu_dsc_cfg nord_dsc[] = {
+	{
+		.name = "dce_0_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_0_1", .id = DSC_1,
+		.base = 0x80000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_1_0", .id = DSC_2,
+		.base = 0x81000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_1_1", .id = DSC_3,
+		.base = 0x81000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_2_0", .id = DSC_4,
+		.base = 0x82000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_2_1", .id = DSC_5,
+		.base = 0x82000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_3_0", .id = DSC_6,
+		.base = 0x83000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_3_1", .id = DSC_7,
+		.base = 0x83000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_1,
+	},
+};
+
+/*
+ * Nord has 2 writeback blocks: WB2 (matches sm8750) and WB1 (new).
+ * WB1 base and xin_id are inferred via stride from existing WB pattern.
+ * FIXME(REG_ADDR): WB1 base address inferred as 0x65000 - 0x2c8 stride.
+ * FIXME(XIU_MAP): WB1 xin_id set to 7; verify against real hardware map.
+ */
+static const struct dpu_wb_cfg nord_wb[] = {
+	{
+		.name = "wb_1", .id = WB_1,
+		.base = 0x64800, .len = 0x2c8, /* FIXME(REG_ADDR): inferred */
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
+		.xin_id = 7, /* FIXME(XIU_MAP): inferred */
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 3),
+	}, {
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
+		.xin_id = 6,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
+static const struct dpu_cwb_cfg nord_cwb[] = {
+	{
+		.name = "cwb_0", .id = CWB_0,
+		.base = 0x66200, .len = 0x20,
+	},
+	{
+		.name = "cwb_1", .id = CWB_1,
+		.base = 0x66600, .len = 0x20,
+	},
+	{
+		.name = "cwb_2", .id = CWB_2,
+		.base = 0x7e200, .len = 0x20,
+	},
+	{
+		.name = "cwb_3", .id = CWB_3,
+		.base = 0x7e600, .len = 0x20,
+	},
+};
+
+/*
+ * Nord has 8 active interfaces (INTF_0,3,4,6,7,8,9,10) with no DSI.
+ * DP0 connects to INTF_0, INTF_3, INTF_6, INTF_7 (4 ports for MST).
+ * DP1 connects to INTF_4, INTF_8, INTF_9, INTF_10 (4 ports for MST).
+ * Interfaces 1, 2, 5 are skipped (removed from sm8750).
+ * All interface base addresses extend the stride from sm8750.
+ * FIXME(REG_ADDR): INTF_4,6,7,8,9,10 addresses inferred via 0x1000 stride.
+ */
+static const struct dpu_intf_cfg nord_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x4bc,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x4bc,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+	}, {
+		.name = "intf_4", .id = INTF_4,
+		.base = 0x38000, .len = 0x4bc, /* FIXME(REG_ADDR): new, stride +0x1000 */
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
+	}, {
+		.name = "intf_6", .id = INTF_6,
+		.base = 0x3a000, .len = 0x4bc, /* FIXME(REG_ADDR): new, stride +0x3000 */
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* second pair for DP0 MST */
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 22),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 23),
+	}, {
+		.name = "intf_7", .id = INTF_7,
+		.base = 0x3b000, .len = 0x4bc, /* FIXME(REG_ADDR): new, stride +0x4000 */
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,	/* third pair for DP0 MST */
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 0),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 1),
+	}, {
+		.name = "intf_8", .id = INTF_8,
+		.base = 0x3c000, .len = 0x4bc, /* FIXME(REG_ADDR): new, stride +0x5000 */
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,	/* second pair for DP1 MST */
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 2),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 3),
+	}, {
+		.name = "intf_9", .id = INTF_9,
+		.base = 0x3d000, .len = 0x4bc, /* FIXME(REG_ADDR): new, stride +0x6000 */
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,	/* third pair for DP1 MST */
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 4),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 5),
+	}, {
+		.name = "intf_10", .id = INTF_10,
+		.base = 0x3e000, .len = 0x4bc, /* FIXME(REG_ADDR): new, stride +0x7000 */
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,	/* fourth pair for DP1 MST */
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 6),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 7),
+	},
+};
+
+static const struct dpu_perf_cfg nord_perf_data = {
+	.max_bw_low = 18900000,
+	.max_bw_high = 28500000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 800000,
+	.min_prefill_lines = 35,
+	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
+	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_version nord_mdss_ver = {
+	.core_major_ver = 12,
+	.core_minor_ver = 1,
+};
+
+const struct dpu_mdss_cfg dpu_nord_cfg = {
+	.mdss_ver = &nord_mdss_ver,
+	.caps = &nord_dpu_caps,
+	.mdp = &nord_mdp,
+	.cdm = &dpu_cdm_5_x,
+	.ctl_count = ARRAY_SIZE(nord_ctl),
+	.ctl = nord_ctl,
+	.sspp_count = ARRAY_SIZE(nord_sspp),
+	.sspp = nord_sspp,
+	.mixer_count = ARRAY_SIZE(nord_lm),
+	.mixer = nord_lm,
+	.dspp_count = ARRAY_SIZE(nord_dspp),
+	.dspp = nord_dspp,
+	.pingpong_count = ARRAY_SIZE(nord_pp),
+	.pingpong = nord_pp,
+	.dsc_count = ARRAY_SIZE(nord_dsc),
+	.dsc = nord_dsc,
+	.merge_3d_count = ARRAY_SIZE(nord_merge_3d),
+	.merge_3d = nord_merge_3d,
+	.wb_count = ARRAY_SIZE(nord_wb),
+	.wb = nord_wb,
+	.cwb_count = ARRAY_SIZE(nord_cwb),
+	.cwb = nord_cwb,
+	.intf_count = ARRAY_SIZE(nord_intf),
+	.intf = nord_intf,
+	.vbif = &sm8650_vbif,
+	.perf = &nord_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 9a993cdfab85..63f3029d09fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -796,6 +796,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 #include "catalog/dpu_10_2_milos.h"
 
 #include "catalog/dpu_12_0_sm8750.h"
+#include "catalog/dpu_12_1_nord.h"
 #include "catalog/dpu_12_2_glymur.h"
 #include "catalog/dpu_12_4_eliza.h"
 #include "catalog/dpu_13_0_kaanapali.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index f45faf87333e..bfbc8207ad9a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -772,6 +772,7 @@ extern const struct dpu_mdss_cfg dpu_msm8937_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8953_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8996_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
+extern const struct dpu_mdss_cfg dpu_nord_cfg;
 extern const struct dpu_mdss_cfg dpu_sar2130p_cfg;
 extern const struct dpu_mdss_cfg dpu_sdm630_cfg;
 extern const struct dpu_mdss_cfg dpu_sdm660_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 0e65bf5ddc4a..7eccb4d2c65e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -226,6 +226,8 @@ enum dpu_intf {
 	INTF_6,
 	INTF_7,
 	INTF_8,
+	INTF_9,
+	INTF_10,
 	INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..a91d4a1af94e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1489,6 +1489,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,msm8953-mdp5", .data = &dpu_msm8953_cfg, },
 	{ .compatible = "qcom,msm8996-mdp5", .data = &dpu_msm8996_cfg, },
 	{ .compatible = "qcom,msm8998-dpu", .data = &dpu_msm8998_cfg, },
+	{ .compatible = "qcom,nord-dpu", .data = &dpu_nord_cfg, },
 	{ .compatible = "qcom,qcm2290-dpu", .data = &dpu_qcm2290_cfg, },
 	{ .compatible = "qcom,sa8775p-dpu", .data = &dpu_sa8775p_cfg, },
 	{ .compatible = "qcom,sar2130p-dpu", .data = &dpu_sar2130p_cfg, },

-- 
2.34.1

