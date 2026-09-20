Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E483E6392
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894187; cv=none; b=Jwx7/U8WXS5Hy+KlwUZqRM2KmsAmnSniFBmnuvhIrBmmPmPPjoAHcSwD0x6UuSNPGsd+31YC75GIuLoHvievl++ZjDeSTxw53EgckmN2YHtidVTp+U6UHL7yrXXJuKBqmeH5Mdsi7mivmOCDOZ0qr46Ck4wiDSQqbY3tUpEFUaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894187; c=relaxed/simple;
	bh=AgQRkLJO4k+HJrIKzD1WhBrOV5XSgAlN+E+6RdeK66U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQ04+xsckOoewea6XpJ8nruSmZXpwwiqsF7kgqpqy0BoikfAN34xjiZn6xGhwvpLHjLkGZ351bCUw/C+KY3st+e8E1i2F1jpOX+pJWzVGf87NTJPUofDe5E2I9+8rJM9IQ4s2lNmhsearvoc7iUGDlof3dmCvjJx0+ZUAmUpZF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Op3vqoHW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdylD/fI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Op3vqoHW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdylD/fI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VSCN1175323
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4tmbmrJQ83X
	34mygkeNJrYofmEPcKWblUdbA2u4Y8KQ=; b=Op3vqoHWaaWGGYqdfjGSWndheqG
	tQJ/23eiwjAphEBELDvTY/rRX3RKxw9nIxvnM/7WxIzDSduRfIaLFMp4B7ZH0LDu
	z0/QxrWGthVhXHZ0vhynquQTPgC7LvKzsbkvgeo1YiA8a3XKf22nf+CVjOiLp2Qx
	TOZ1loyUZgfMOj77YEMlY9XJPbtZzozaiEe0XQRuV7YXcTpIbulx+MtYj6sJR4V3
	0o6GEFp66yydcbZl18BwqYSWu+QARS8+adbvfEeSizkWB/B4iXIm1z7f6Kz6D5Lk
	aFGK/KhvhCFoaLcDnw29uIBIygyWdTIK55QGaPdgFbfpUvitSn/Vb4oqCcw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9tfhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:49:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so2616979a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789894184; x=1790498984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tmbmrJQ83X34mygkeNJrYofmEPcKWblUdbA2u4Y8KQ=;
        b=jdylD/fIimcvpmBV7LSxUeXy5fSwH3kohMnWSnxhw4VGyv5vEXgei0Ll0GXGcmSP3r
         6VpaQknK+fVvAdTZTw+SopOMuCV/OSoHdqCThuiCZCdqwPmz2zzdv3zd2/bV3hikBedA
         is6c74gVir/VPci31/VllxJ4WDgw9adhZSXSnAGvNt50vg5dO5P2sjiz2rVeqQ6iuS1Q
         thKvEmL/O3VAf9PLg1dKbgpe49Uhv5Yy61ft4NYLAAR2Tajs5rJyGOIEG85vCaC39+JL
         VZ0KMEGXxfUOB1hZLWCuzn4h284eXBjSunSYCMSFClRBOnxi0RfQS5GYlFplfGVK/b9Y
         ET2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894184; x=1790498984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tmbmrJQ83X34mygkeNJrYofmEPcKWblUdbA2u4Y8KQ=;
        b=R5nP3yiF+x3F7Jy+1QYtA0dmrj4EFkj+1tsIIHOBAjnN1K95oXs+Q1on7kqCOrD2f/
         OHkoeaWpesO6X0KL2Hvv5y4T/WzvBHrPqj5q2CuoeDBPKTZJAbs3KQnPzXwCVIO71DjP
         y+BcAtxFSUGf41+KdW+j052e/nIzH30+IA0Zf4Syjzw0lOeAL3zD4mv1FRkZ0akOgJs7
         j6ZOb2AeG3bAeE9mhG59pYLSjFaGFwwzgHuscZXTDB7u5laZD9PlAGZdMpXNZFboU1y+
         deBArnIfvUvKFkF0fCFmOyh2W0FcJokEJ7l7BqdsCYlCeKxsO+uAQIgkDsITyg99Gtp5
         IBuw==
X-Forwarded-Encrypted: i=1; AKwUvBx8DzQJeQpiWsqrYjMVLvZjU++Dz8UUKXtZ2ogR3gn5RaoiwdoAa913hW59ITh87ZTCc1YSQ/sCDLDDoT8=@vger.kernel.org
X-Gm-Message-State: AFuF++k75p8CMMunH2AjCbT4AtouisR/BnvhtxbmGhLU4bcSvzE8Cfwz
	/QugW5rRuR1Vf1aE/Y6Xf0Kdo31FN7QWnbKfQnFgvKZr/1sIW1TwiWU17fCtc838D1OZfwxjdjk
	um3MkBn8RHiY9xTmtmDoHZ8vjWnC1PJn8VcSlz3vzHt6BONgt1UwqxHX9vxCByC0xYMo=
X-Gm-Gg: AYBFou3Uimay2brpLicYaaQlfj/4UfCTjYx6phy0HG6PoHel5rakWVVAWj9npOIyIGm
	fJvyguiFCrYfZnCNEwBgOKOtGF41uAUd2kEQRhJNOzsribVgvyOwbfwAC+AfDT9dgBl4grR1DNS
	RiVC8kWhIjinvouV3yPNiM+81uXF6opkyixdozjAa7yu+0EEivtGs7ZEOIHAAzoUfDRYHmfeVHB
	apSc9gpGu6bS85qZSP89TVJCBopNyRwpP5vsnl6KMDn2cF0uN1xGP5bClsxWY/3RWD3u52mueB6
	uCajOQqxNx0MHlLI9uDgEvBwO8wU0QF8kKA031FBq0b31D+sTr2GoIjV7P4S6jU21jeHYZUyPqV
	2RRGAO0pIXDTCFWa8G5/PX1lG1ZwcGkYhCK4fO7V3+HsM5FRAFeV89qur8+rt
X-Received: by 2002:a17:90b:4cc1:b0:3a0:3d1c:2dc6 with SMTP id 98e67ed59e1d1-3a03d1c38ecmr911555a91.66.1789894183379;
        Sun, 20 Sep 2026 01:49:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc1:b0:3a0:3d1c:2dc6 with SMTP id 98e67ed59e1d1-3a03d1c38ecmr911530a91.66.1789894182752;
        Sun, 20 Sep 2026 01:49:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm11180808eec.14.2026.09.20.01.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:49:42 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/6] arm64: dts: qcom: nord: Add support for ADSP and CDSPs
Date: Sun, 20 Sep 2026 16:49:15 +0800
Message-ID: <20260920084920.2201418-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: e0Ut7cec3kRMaljZh_1nB5GBdLy4TyD-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX+Gw+HiyUYacj
 ZbsO3FHlvPN0jqrBVsf9CL+wVqQiBWtrPfqDJly5Lz7ltJYkxb0aI1rLmhDOas8XX9pz8ObYaHL
 gQBiKhYJALY5vDRXyB2tLWnpBu434y1TVIRK7ZX+IdXHg/GCwMML6eu513X2oTSj5ud4I0apiZn
 yqNxN/wOecfZZESfFRoBNTwse0O1Doqq30IctT8micfZTzKdQi1nRqfmYsYdV/BOQfL2tHpzX6G
 qbxiSeNH7YYBlQ1r8LhVwEigoqOZTf5J1tir7iBrRQoKjiNroQOAKEyjTeO6D7Kcx2Nbn8O4tSS
 MCLHQiXwqFj8y/jIRaiRdd/5FVQhZDGFIVGLXWIibpgkOUWdMxdGI5bSMONYY3j3cdXWOc+SJDA
 c8nSfOlxWaEZnKTLSLsDYJ/9dir9/w2CLq8ylOW6zfQq5LX/QvFQoGJUD1UPkVVOTY2h8hk+3+Q
 zzw8u+IZwsBZ8QW0sMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX7gvAZY4maI5Q
 nvKZYQcYh/oogkx5wIK4cd+19qWPSQa31UPKVET8kar3Xzr4d78nzphzg8zATOG4/lOfObmyhpZ
 +Neh8W+SVN4xmDik3j0M4FJ1ChQFjq0=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aaf9e28 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VXXG8FULNQTABRvIdlgA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: e0Ut7cec3kRMaljZh_1nB5GBdLy4TyD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200126

Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
on Nord SoC.

This includes:
- SMEM memory reservation used by the inter-processor communication
  infrastructure
- IPCC mailbox controller for inter-processor signalling
- AOSS QMP node for load state power management
- SMP2P nodes providing stop control and fault/crash interrupt signals
- Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
  userspace offload

The embedded variant specific power domains, XO clock, and interconnect
paths are filled in nord-embedded.dtsi.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi |  63 ++
 arch/arm64/boot/dts/qcom/nord-ipcc.h        | 144 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 885 ++++++++++++++++++++
 3 files changed, 1092 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ipcc.h

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 568fe68cd185..c7ac2e66632e 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -363,6 +363,69 @@ &qupv3_2 {
 		      "s-ahb";
 };
 
+&remoteproc_adsp {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	interconnects = <&hpass_ag_noc MASTER_HPASS_PROC_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_MX>;
+	power-domain-names = "cx",
+			     "mx";
+};
+
+&remoteproc_cdsp0 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	interconnects = <&nsp_data_noc_0 MASTER_NSP0_PROC QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_NMXC>,
+			<&rpmhpd RPMHPD_NSP0>;
+	power-domain-names = "cx",
+			     "mx",
+			     "nsp";
+};
+
+&remoteproc_cdsp1 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	interconnects = <&nsp_data_noc_1 MASTER_NSP1_PROC QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_NMXC>,
+			<&rpmhpd RPMHPD_NSP1>;
+	power-domain-names = "cx",
+			     "mx",
+			     "nsp";
+};
+
+&remoteproc_cdsp2 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	interconnects = <&nsp_data_noc_2 MASTER_NSP2_PROC QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_NMXC>,
+			<&rpmhpd RPMHPD_NSP2>;
+	power-domain-names = "cx",
+			     "mx",
+			     "nsp";
+};
+
+&remoteproc_cdsp3 {
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	interconnects = <&nsp_data_noc_3 MASTER_NSP3_PROC QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_NMXC>,
+			<&rpmhpd RPMHPD_NSP3>;
+	power-domain-names = "cx",
+			     "mx",
+			     "nsp";
+};
+
 &spi0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord-ipcc.h b/arch/arm64/boot/dts/qcom/nord-ipcc.h
new file mode 100644
index 000000000000..8bf9b0875b6d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ipcc.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_NORD_IPCC_H
+#define __DTS_NORD_IPCC_H
+
+/* Physical client IDs */
+#define IPCC_MPROC_AOP			0
+#define IPCC_MPROC_TZ			1
+#define IPCC_MPROC_ADSP0		2
+#define IPCC_MPROC_NSP0			3
+#define IPCC_MPROC_NSP1			4
+#define IPCC_MPROC_NSP2			5
+#define IPCC_MPROC_NSP3			6
+#define IPCC_MPROC_APSS_NS0		7
+#define IPCC_MPROC_APSS_NS1		8
+#define IPCC_MPROC_APSS_NS2		9
+#define IPCC_MPROC_APSS_NS3		10
+#define IPCC_MPROC_ADSP1		11
+#define IPCC_MPROC_ADSP2		12
+#define IPCC_MPROC_APSS_NS4		13
+#define IPCC_MPROC_SOCCP		15
+#define IPCC_MPROC_CPUCP		16
+#define IPCC_MPROC_A78CSS		17
+#define IPCC_MPROC_TMESS		18
+#define IPCC_MPROC_SAIL0		19
+#define IPCC_MPROC_SAIL1		20
+#define IPCC_MPROC_SAIL2		21
+#define IPCC_MPROC_SAIL3		22
+#define IPCC_MPROC_SAIL4		23
+#define IPCC_MPROC_SAIL5		24
+
+#define IPCC_COMPUTE_L0_ADSP0		0
+#define IPCC_COMPUTE_L0_NSP0		1
+#define IPCC_COMPUTE_L0_NSP1		2
+#define IPCC_COMPUTE_L0_NSP2		3
+#define IPCC_COMPUTE_L0_NSP3		4
+#define IPCC_COMPUTE_L0_APSS_NS0	5
+#define IPCC_COMPUTE_L0_GPU0		6
+#define IPCC_COMPUTE_L0_APSS_NS1	7
+#define IPCC_COMPUTE_L0_APSS_NS2	8
+#define IPCC_COMPUTE_L0_APSS_NS3	9
+#define IPCC_COMPUTE_L0_CVP		10
+#define IPCC_COMPUTE_L0_ICP0		11
+#define IPCC_COMPUTE_L0_ICP1		12
+#define IPCC_COMPUTE_L0_VPU		13
+#define IPCC_COMPUTE_L0_DPU0		14
+#define IPCC_COMPUTE_L0_DPU1		15
+#define IPCC_COMPUTE_L0_ADSP1		16
+#define IPCC_COMPUTE_L0_ADSP2		17
+#define IPCC_COMPUTE_L0_APSS_NS4	18
+#define IPCC_COMPUTE_L0_SOCCP		20
+#define IPCC_COMPUTE_L0_SAIL0		21
+#define IPCC_COMPUTE_L0_SAIL1		22
+#define IPCC_COMPUTE_L0_SAIL2		23
+#define IPCC_COMPUTE_L0_SAIL3		24
+#define IPCC_COMPUTE_L0_SAIL4		25
+#define IPCC_COMPUTE_L0_SAIL5		26
+#define IPCC_COMPUTE_L0_IPA		27
+#define IPCC_COMPUTE_L0_GPU1		28
+
+#define IPCC_COMPUTE_L1_ADSP0		0
+#define IPCC_COMPUTE_L1_NSP0		1
+#define IPCC_COMPUTE_L1_NSP1		2
+#define IPCC_COMPUTE_L1_NSP2		3
+#define IPCC_COMPUTE_L1_NSP3		4
+#define IPCC_COMPUTE_L1_APSS_NS0	5
+#define IPCC_COMPUTE_L1_GPU0		6
+#define IPCC_COMPUTE_L1_APSS_NS1	7
+#define IPCC_COMPUTE_L1_APSS_NS2	8
+#define IPCC_COMPUTE_L1_APSS_NS3	9
+#define IPCC_COMPUTE_L1_CVP		10
+#define IPCC_COMPUTE_L1_ICP0		11
+#define IPCC_COMPUTE_L1_ICP1		12
+#define IPCC_COMPUTE_L1_VPU		13
+#define IPCC_COMPUTE_L1_DPU0		14
+#define IPCC_COMPUTE_L1_DPU1		15
+#define IPCC_COMPUTE_L1_ADSP1		16
+#define IPCC_COMPUTE_L1_ADSP2		17
+#define IPCC_COMPUTE_L1_APSS_NS4	18
+#define IPCC_COMPUTE_L1_SOCCP		20
+#define IPCC_COMPUTE_L1_SAIL0		21
+#define IPCC_COMPUTE_L1_SAIL1		22
+#define IPCC_COMPUTE_L1_SAIL2		23
+#define IPCC_COMPUTE_L1_SAIL3		24
+#define IPCC_COMPUTE_L1_SAIL4		25
+#define IPCC_COMPUTE_L1_SAIL5		26
+#define IPCC_COMPUTE_L1_IPA		27
+#define IPCC_COMPUTE_L1_GPU1		28
+
+#define IPCC_PERIPH_ADSP0		0
+#define IPCC_PERIPH_NSP0		1
+#define IPCC_PERIPH_NSP1		2
+#define IPCC_PERIPH_NSP2		3
+#define IPCC_PERIPH_NSP3		4
+#define IPCC_PERIPH_APSS_NS0		5
+#define IPCC_PERIPH_PCIE0		6
+#define IPCC_PERIPH_PCIE1		7
+#define IPCC_PERIPH_APSS_NS1		8
+#define IPCC_PERIPH_APSS_NS2		9
+#define IPCC_PERIPH_APSS_NS3		10
+#define IPCC_PERIPH_ADSP1		11
+#define IPCC_PERIPH_ADSP2		12
+#define IPCC_PERIPH_APSS_NS4		13
+
+#define IPCC_FENCE_ADSP0		0
+#define IPCC_FENCE_NSP0			1
+#define IPCC_FENCE_NSP1			2
+#define IPCC_FENCE_NSP2			3
+#define IPCC_FENCE_NSP3			4
+#define IPCC_FENCE_APSS_NS0		5
+#define IPCC_FENCE_GPU0			6
+#define IPCC_FENCE_APSS_NS1		7
+#define IPCC_FENCE_APSS_NS2		8
+#define IPCC_FENCE_APSS_NS3		9
+#define IPCC_FENCE_CVP			10
+#define IPCC_FENCE_ICP0			11
+#define IPCC_FENCE_ICP1			12
+#define IPCC_FENCE_CAM_ENG0		13
+#define IPCC_FENCE_CAM_ENG1		14
+#define IPCC_FENCE_CAM_ENG2		15
+#define IPCC_FENCE_CAM_ENG3		16
+#define IPCC_FENCE_CAM_ENG4		17
+#define IPCC_FENCE_CAM_ENG5		18
+#define IPCC_FENCE_CAM_ENG6		19
+#define IPCC_FENCE_CAM_ENG7		20
+#define IPCC_FENCE_CAM_ENG8		21
+#define IPCC_FENCE_CAM_ENG9		22
+#define IPCC_FENCE_CAM_ENG10		23
+#define IPCC_FENCE_CAM_ENG11		24
+#define IPCC_FENCE_CAM_ENG12		25
+#define IPCC_FENCE_VPU			26
+#define IPCC_FENCE_DPU0			27
+#define IPCC_FENCE_DPU1			28
+#define IPCC_FENCE_ADSP1		29
+#define IPCC_FENCE_ADSP2		30
+#define IPCC_FENCE_APSS_NS4		31
+#define IPCC_FENCE_SOCCP		33
+#define IPCC_FENCE_IPA			34
+#define IPCC_FENCE_GPU1			35
+
+#endif
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c30..d413341eac41 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -4,6 +4,9 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
+
+#include "nord-ipcc.h"
 
 / {
 	interrupt-parent = <&intc>;
@@ -685,6 +688,13 @@ qdss_apps_mem: qdss-apps-region@87b00000 {
 			no-map;
 		};
 
+		smem_mem: smem@89b00000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x89b00000 0x0 0x400000>;
+			no-map;
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
 		global_sync_mem: global-sync-region@89f00000 {
 			reg = <0x0 0x89f00000 0x0 0x400000>;
 			no-map;
@@ -902,6 +912,117 @@ dump_mem: mem-dump-region {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_ADSP0
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_ADSP0
+				 IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <443>, <429>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp0 {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_NSP0
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_NSP0 IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <94>, <432>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp0_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp0_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp1 {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_NSP1
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_NSP1 IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <69>;
+
+		smp2p_cdsp1_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp1_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp2 {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_NSP2
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_NSP2 IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <133>;
+
+		smp2p_cdsp2_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp2_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp3 {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_NSP3
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_NSP3 IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <197>;
+
+		smp2p_cdsp3_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp3_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1518,6 +1639,104 @@ tcsr: syscon@1f60000 {
 			reg = <0x0 0x01f60000 0x0 0xa0000>;
 		};
 
+		remoteproc_adsp: remoteproc@4c00000 {
+			compatible = "qcom,nord-adsp-pas";
+			reg = <0x0 0x04c00000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			memory-region = <&hpass_dsp0_mem>,
+					<&hpass_dsp0_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_ADSP0
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_ADSP0
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <2>;
+				label = "adsp";
+
+				fastrpc {
+					compatible = "qcom,nord-fastrpc",
+						     "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					memory-region = <&hpass_rpc_remote_heap_mem>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu_0 0x09e3 0x0000>,
+							 <&apps_smmu_0 0x0a43 0x0020>,
+							 <&apps_smmu_0 0x0a63 0x0020>,
+							 <&apps_smmu_0 0x0a83 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu_0 0x09e4 0x0000>,
+							 <&apps_smmu_0 0x0a44 0x0020>,
+							 <&apps_smmu_0 0x0a64 0x0020>,
+							 <&apps_smmu_0 0x0a84 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu_0 0x09e5 0x0000>,
+							 <&apps_smmu_0 0x0a45 0x0020>,
+							 <&apps_smmu_0 0x0a65 0x0020>,
+							 <&apps_smmu_0 0x0a85 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu_0 0x09e6 0x0000>,
+							 <&apps_smmu_0 0x0a46 0x0020>,
+							 <&apps_smmu_0 0x0a66 0x0020>,
+							 <&apps_smmu_0 0x0a86 0x0000>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
+		ipcc0: mailbox@9007000 {
+			compatible = "qcom,nord-ipcc",
+				     "qcom,ipcc";
+			reg = <0x0 0x09007000 0x0 0x1000>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#mbox-cells = <2>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
@@ -1637,6 +1856,16 @@ tsens7: thermal-sensor@c233000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,nord-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0x0 0x0c300000 0x0 0x400>;
+			interrupts-extended = <&ipcc0 IPCC_MPROC_AOP
+						      IPCC_MPROC_SIGNAL_GLINK_QMP
+						      IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&ipcc0 IPCC_MPROC_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+			#clock-cells = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
@@ -2071,6 +2300,662 @@ watchdog@17826000 {
 			clocks = <&sleep_clk>;
 			interrupts = <GIC_ESPI 848 IRQ_TYPE_EDGE_RISING>;
 		};
+
+		remoteproc_cdsp0: remoteproc@1f300000 {
+			compatible = "qcom,nord-cdsp0-pas";
+			reg = <0x0 0x1f300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 499 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			memory-region = <&cdsp0_mem>,
+					<&q6_cdsp0_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp0_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_NSP0
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_NSP0
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,nord-fastrpc",
+						     "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu_2 0x0301 0x0040>,
+							 <&apps_smmu_2 0x0341 0x0040>,
+							 <&apps_smmu_2 0x0361 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu_2 0x0302 0x0040>,
+							 <&apps_smmu_2 0x0342 0x0040>,
+							 <&apps_smmu_2 0x0362 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu_2 0x0303 0x0040>,
+							 <&apps_smmu_2 0x0343 0x0040>,
+							 <&apps_smmu_2 0x0363 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu_2 0x0304 0x0040>,
+							 <&apps_smmu_2 0x0344 0x0040>,
+							 <&apps_smmu_2 0x0364 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu_2 0x0305 0x0000>,
+							 <&apps_smmu_2 0x0345 0x0020>,
+							 <&apps_smmu_2 0x0365 0x0020>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu_2 0x0306 0x0040>,
+							 <&apps_smmu_2 0x0346 0x0040>,
+							 <&apps_smmu_2 0x0366 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu_2 0x0307 0x0040>,
+							 <&apps_smmu_2 0x0347 0x0040>,
+							 <&apps_smmu_2 0x0367 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu_2 0x0308 0x0040>,
+							 <&apps_smmu_2 0x0348 0x0040>,
+							 <&apps_smmu_2 0x0368 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu_2 0x0309 0x0040>,
+							 <&apps_smmu_2 0x0349 0x0040>,
+							 <&apps_smmu_2 0x0369 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&apps_smmu_2 0x030a 0x0040>,
+							 <&apps_smmu_2 0x034a 0x0040>,
+							 <&apps_smmu_2 0x036a 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu_2 0x030b 0x0040>,
+							 <&apps_smmu_2 0x034b 0x0040>,
+							 <&apps_smmu_2 0x036b 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu_2 0x030c 0x0040>,
+							 <&apps_smmu_2 0x034c 0x0040>,
+							 <&apps_smmu_2 0x036c 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu_2 0x030d 0x0000>,
+							 <&apps_smmu_2 0x034d 0x0020>,
+							 <&apps_smmu_2 0x036d 0x0020>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
+		remoteproc_cdsp1: remoteproc@1f700000 {
+			compatible = "qcom,nord-cdsp1-pas";
+			reg = <0x0 0x1f700000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 500 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			memory-region = <&cdsp1_mem>,
+					<&q6_cdsp1_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp1_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_NSP1
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_NSP1
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <69>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,nord-fastrpc",
+						     "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp1";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu_2 0x0701 0x0040>,
+							 <&apps_smmu_2 0x0741 0x0040>,
+							 <&apps_smmu_2 0x0761 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu_2 0x0702 0x0040>,
+							 <&apps_smmu_2 0x0742 0x0040>,
+							 <&apps_smmu_2 0x0762 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu_2 0x0703 0x0040>,
+							 <&apps_smmu_2 0x0743 0x0040>,
+							 <&apps_smmu_2 0x0763 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu_2 0x0704 0x0040>,
+							 <&apps_smmu_2 0x0744 0x0040>,
+							 <&apps_smmu_2 0x0764 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu_2 0x0705 0x0000>,
+							 <&apps_smmu_2 0x0745 0x0020>,
+							 <&apps_smmu_2 0x0765 0x0020>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu_2 0x0706 0x0040>,
+							 <&apps_smmu_2 0x0746 0x0040>,
+							 <&apps_smmu_2 0x0766 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu_2 0x0707 0x0040>,
+							 <&apps_smmu_2 0x0747 0x0040>,
+							 <&apps_smmu_2 0x0767 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu_2 0x0708 0x0040>,
+							 <&apps_smmu_2 0x0748 0x0040>,
+							 <&apps_smmu_2 0x0768 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu_2 0x0709 0x0040>,
+							 <&apps_smmu_2 0x0749 0x0040>,
+							 <&apps_smmu_2 0x0769 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&apps_smmu_2 0x070a 0x0040>,
+							 <&apps_smmu_2 0x074a 0x0040>,
+							 <&apps_smmu_2 0x076a 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu_2 0x070b 0x0040>,
+							 <&apps_smmu_2 0x074b 0x0040>,
+							 <&apps_smmu_2 0x076b 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu_2 0x070c 0x0040>,
+							 <&apps_smmu_2 0x074c 0x0040>,
+							 <&apps_smmu_2 0x076c 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu_2 0x070d 0x0000>,
+							 <&apps_smmu_2 0x074d 0x0020>,
+							 <&apps_smmu_2 0x076d 0x0020>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
+		remoteproc_cdsp2: remoteproc@1fb00000 {
+			compatible = "qcom,nord-cdsp2-pas";
+			reg = <0x0 0x1fb00000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 501 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp2_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp2_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp2_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp2_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp2_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			memory-region = <&cdsp2_mem>,
+					<&q6_cdsp2_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp2_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_NSP2
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_NSP2
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <133>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,nord-fastrpc",
+						     "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp2";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu_2 0x0b01 0x0040>,
+							 <&apps_smmu_2 0x0b41 0x0040>,
+							 <&apps_smmu_2 0x0b61 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu_2 0x0b02 0x0040>,
+							 <&apps_smmu_2 0x0b42 0x0040>,
+							 <&apps_smmu_2 0x0b62 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu_2 0x0b03 0x0040>,
+							 <&apps_smmu_2 0x0b43 0x0040>,
+							 <&apps_smmu_2 0x0b63 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu_2 0x0b04 0x0040>,
+							 <&apps_smmu_2 0x0b44 0x0040>,
+							 <&apps_smmu_2 0x0b64 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu_2 0x0b05 0x0000>,
+							 <&apps_smmu_2 0x0b45 0x0020>,
+							 <&apps_smmu_2 0x0b65 0x0020>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu_2 0x0b06 0x0040>,
+							 <&apps_smmu_2 0x0b46 0x0040>,
+							 <&apps_smmu_2 0x0b66 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu_2 0x0b07 0x0040>,
+							 <&apps_smmu_2 0x0b47 0x0040>,
+							 <&apps_smmu_2 0x0b67 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu_2 0x0b08 0x0040>,
+							 <&apps_smmu_2 0x0b48 0x0040>,
+							 <&apps_smmu_2 0x0b68 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu_2 0x0b09 0x0040>,
+							 <&apps_smmu_2 0x0b49 0x0040>,
+							 <&apps_smmu_2 0x0b69 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&apps_smmu_2 0x0b0a 0x0040>,
+							 <&apps_smmu_2 0x0b4a 0x0040>,
+							 <&apps_smmu_2 0x0b6a 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu_2 0x0b0b 0x0040>,
+							 <&apps_smmu_2 0x0b4b 0x0040>,
+							 <&apps_smmu_2 0x0b6b 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu_2 0x0b0c 0x0040>,
+							 <&apps_smmu_2 0x0b4c 0x0040>,
+							 <&apps_smmu_2 0x0b6c 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu_2 0x0b0d 0x0000>,
+							 <&apps_smmu_2 0x0b4d 0x0020>,
+							 <&apps_smmu_2 0x0b6d 0x0020>;
+						dma-coherent;
+					};
+				};
+			};
+		};
+
+		remoteproc_cdsp3: remoteproc@1ff00000 {
+			compatible = "qcom,nord-cdsp3-pas";
+			reg = <0x0 0x1ff00000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 505 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp3_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp3_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp3_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp3_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp3_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			memory-region = <&cdsp3_mem>,
+					<&q6_cdsp3_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp3_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_NSP3
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_NSP3
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <197>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,nord-fastrpc",
+						     "qcom,kaanapali-fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp3";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu_2 0x0f01 0x0040>,
+							 <&apps_smmu_2 0x0f41 0x0040>,
+							 <&apps_smmu_2 0x0f61 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu_2 0x0f02 0x0040>,
+							 <&apps_smmu_2 0x0f42 0x0040>,
+							 <&apps_smmu_2 0x0f62 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu_2 0x0f03 0x0040>,
+							 <&apps_smmu_2 0x0f43 0x0040>,
+							 <&apps_smmu_2 0x0f63 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu_2 0x0f04 0x0040>,
+							 <&apps_smmu_2 0x0f44 0x0040>,
+							 <&apps_smmu_2 0x0f64 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu_2 0x0f05 0x0000>,
+							 <&apps_smmu_2 0x0f45 0x0020>,
+							 <&apps_smmu_2 0x0f65 0x0020>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu_2 0x0f06 0x0040>,
+							 <&apps_smmu_2 0x0f46 0x0040>,
+							 <&apps_smmu_2 0x0f66 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu_2 0x0f07 0x0040>,
+							 <&apps_smmu_2 0x0f47 0x0040>,
+							 <&apps_smmu_2 0x0f67 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu_2 0x0f08 0x0040>,
+							 <&apps_smmu_2 0x0f48 0x0040>,
+							 <&apps_smmu_2 0x0f68 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu_2 0x0f09 0x0040>,
+							 <&apps_smmu_2 0x0f49 0x0040>,
+							 <&apps_smmu_2 0x0f69 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@10 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <10>;
+						iommus = <&apps_smmu_2 0x0f0a 0x0040>,
+							 <&apps_smmu_2 0x0f4a 0x0040>,
+							 <&apps_smmu_2 0x0f6a 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@11 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <11>;
+						iommus = <&apps_smmu_2 0x0f0b 0x0040>,
+							 <&apps_smmu_2 0x0f4b 0x0040>,
+							 <&apps_smmu_2 0x0f6b 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu_2 0x0f0c 0x0040>,
+							 <&apps_smmu_2 0x0f4c 0x0040>,
+							 <&apps_smmu_2 0x0f6c 0x0000>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu_2 0x0f0d 0x0000>,
+							 <&apps_smmu_2 0x0f4d 0x0020>,
+							 <&apps_smmu_2 0x0f6d 0x0020>;
+						dma-coherent;
+					};
+				};
+			};
+		};
 	};
 
 	arch_timer: timer {
-- 
2.43.0

