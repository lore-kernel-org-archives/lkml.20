Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155F1476060
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146635; cv=none; b=MDylZurSMzmm0/+P71MfBE3zxYdKBFk7IiNC9JzGa0okqG4JY1jdXLwAoKSdgPJoGXyjoRRqBnjP6iGafzvm6mw54wyrX1LeonpEiaYP1fucU+EqSiXgVehzyBpMqPR/HwSkYuMlFVVQINVRdW0ltxv8LOVngxUCvWLOwW0EmwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146635; c=relaxed/simple;
	bh=si8QSJxibLkoMYhbUqb6F1+7r4KuaoDTBhnfzOqCBps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KaS1aC+hT9j86IkyaAYVQM/yre58jT+nHvjr48P+AE8vZrQEG1RIESOuP8QoEn4oPHcIFetA6ASHOLiT8PqxMNfe6m8DcTlQIYyem4FFOQgmmgaJE8ydVJkL6d3KtZQWgYRD0yG+nCHmJ2NGA4VYTCONmTtgfBF+Je8nWE8HHTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRc5ri28; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEfB0kyE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRc5ri28";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEfB0kyE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAC4c1946429
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/7bD1HrVAtwty8rnLXjEndNniosGGkCaE/lAYisayJM=; b=gRc5ri28QoWQQJGu
	ou0Y/npPfpQTeBbuMs46kePtu+6oXXal8wdXsnSLgTMukJPW6NdbglBNu8z+IGrQ
	LI7SzKXmxyPbb4vqlPq02HktKFhXfmDWojsp2eueub0QYbYpYtQe+3uBnaLm8048
	5VUIzYdCHxEnrq02EEgvXPZo3RzWGNlGc/LF739/sEpV66MQgw0ZsxtM2S5GM9QK
	IBhyY0Httf+nWA/VdqFRj7jZnGb7/frEjVd/XCBrcqFlzF7G9PU28F45i7PjPBwL
	pWB6PeBj4rWaMUppZdWjZL55z8Bc8N7M9PhozJPfAZcT8iPSrh/dscbR81j+NGkQ
	DwS98g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yrh7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:30:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso4320368a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146631; x=1792751431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7bD1HrVAtwty8rnLXjEndNniosGGkCaE/lAYisayJM=;
        b=KEfB0kyEpxDlYkAkkaFGnMWWRodV4p+VhIwiJH56u+azG73mb1mvh9+g2FgBy+eP9U
         qPtMyEhS7HF8sZTXpuKzsGuKnQkUtLNf3TUTlB4FHOiPnuzqrlk5jSV/0Xw0Nz97Iznp
         f67qwvNbPH6OzUb+CK716MWJ7g5PtDMnPCjkou6PITKdtmhlrhZr0u06htAa7ezqAyaJ
         Yk72VeoypGbvqmycwLwZXE7aZleTt82XCPiqAsMGPWsnkLG/nH4B37FlMKLOeWERUFf5
         38mI+7lOQq2gXgVWAcgiTujHq/5SDBhu4Tqdqt9QVGXZ1wnLbQ2ZCXi5eTWV4x5t4Xjt
         PkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146631; x=1792751431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/7bD1HrVAtwty8rnLXjEndNniosGGkCaE/lAYisayJM=;
        b=WOqsXcbXOj9MM5LS5nVqPGv+Dhy6Oih29+7ddU+tKRBMv+vNmQUmg/X2o2ZKmFr1G/
         JWVnyom5WV9YTJ2Ka/a27PeqINxAxAty5X5QNU9xTil7NFYZvl6bBdnPttqYy40eBR2S
         /KhDiDQ/SGBEN2+EJYgetQs2dXTXM/4UKqrPm8NhVbRGL+T1HLvlIfV9AeC9GtVALu30
         bdVpXMs0LAFlHBv+UItVmIpzL9sWpHVTZJIPird1awbTSU0SfR3Ce6yAdoYFsQGQ6NrE
         3foUGs6uSl+qjr5Pai4IUswOLM6YIl4oYZbX4uMKkqWE5yqTwTFEoSgyZLxUo6RKgCaa
         0Shg==
X-Forwarded-Encrypted: i=1; AKwUvByImRk7plafi5WLtnz4L66zG+znCZLcgCItFvSlwGbDPLFXsbvffgqhb6gMiEIjZpM164QK9yLTVIDRRYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXxD9hPuRyZgN4X//0diOMyqabmh3XnsKr1PwsfkxBXEEvIgN+
	dIHay6EWfeKEH44yz+QarJAjwP9mhjy8/2GrJKltOsceL0DSqpHuE3eraXuyq6vdXhIqaB4HeIC
	HrpHtoE5t7/tlfox4cFM4VjksGOvUmkLcMpp28v/5msEleuvIEIGUJj5bcbcmeHuWsHs3kM8Knk
	8=
X-Gm-Gg: AYBFou0/329vSiaqIiJbANt/MM6aU8Bzw1jTuuZIH0i5Abo/wE8IlRd2+Dxj0Apd6fc
	kiYcI5f7ixHa0TLekzCm7llTroad/ClvgHUv1ucuxJfnW7hg/eSs+q1mewlT7Qr6euV+EbTr5VH
	foH50wrUn8y42jPi9D64V0C3AbJfmU4u/1ePoyfgyqw8dYFK0Slusb40jYS1A48x4JERgusVbqG
	6KpxpkWfoRFzvABVmxbeVqxQ808UUEseljgJ044kCMQh8/Jyq//+OHR3SEDs+GvVG6J9NEdoW9J
	Vbr6DrjyHBvGGmYA/Xkc5BqMgKPwr23EkAw/1p4qT0lMX/G7e/uOkVmL75ncmtQWcEwFbM3kM28
	USZmhvtEnmRZzHUPcMbJjO/KTapFX+qoNwU81Vb6LTkrCSRIXfPbrPOjxH/Lk9/E=
X-Received: by 2002:a17:90b:1f91:b0:3ac:53e0:4ed5 with SMTP id 98e67ed59e1d1-3ac53e0532fmr7851708a91.39.1792146630944;
        Fri, 16 Oct 2026 03:30:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1f91:b0:3ac:53e0:4ed5 with SMTP id 98e67ed59e1d1-3ac53e0532fmr7851695a91.39.1792146630491;
        Fri, 16 Oct 2026 03:30:30 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd403c212sm961696a91.4.2026.10.16.03.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:30:30 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 03:30:23 -0700
Subject: [PATCH v9 2/2] arm64: dts: qcom: Add Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-kalambo-crd-v9-2-11e6a40b68e2@oss.qualcomm.com>
References: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
In-Reply-To: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792146626; l=2954;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=si8QSJxibLkoMYhbUqb6F1+7r4KuaoDTBhnfzOqCBps=;
 b=Vt0UJNTTtQe85tZr9sbs0fxOqexR0jhjI5S+HZ/kepOTJPF3A+xA8d6O3q/8AG1eU4fhNRtMU
 yRVslD4hHQ/BR0bmVIjLDMqvonD41DzxXqjrU2/KJ96wYXWdx0x7lAa
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: fuZjT_4e38275j79Zwjx6Snyzx-AC_wE
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1fcc8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mCez9LKK-YWkVuwSxDUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfXxrI6vu997dlS
 3d3w7do7dar7muHNzIeAJVgv0ZfrWqPnkEg+OZItt1jgQBz6M40tZh0FECmsDGCfM6suhTFfjvZ
 de17KJ7KPG09QKvmr2C5hjCVdSaU7t8=
X-Proofpoint-GUID: fuZjT_4e38275j79Zwjx6Snyzx-AC_wE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX2d4PyQ8XF2eA
 JrkS2Gh+1EBVWo4Kpi7/yiNwHSFPV1fBMt/yRYU95abNmgLCowxfyCKSat5XGYCG+PGrfjUKV8L
 WiJOHK5GhtiF/U5jKm8gXqMXpzoj5txrdGStMi/TLq726VO9Dxolh2SygVOenjy3V5AMMTNSjKm
 To8QPWtfCmEq29tzPrsOjZAyy1Bp0E2Yj9pATf2RfIwm+RzmwtbH9Xk9If2mGmcZ7NJoSpAdia4
 8O/UC9mpt3Tfx4eDsgU3u0jU3xLemesPfHKDkUOufqfNM0DYUlRdPNiGjRdQ4i0Ijmm4PcVcBM+
 9EFFp8k5PrJTOixA8URxyO/gH/F4IvSd9acGGwxlh6fMVD/5PoDTDlBVvfx4uLOwWKA5p4wZaPE
 Ms2Flcao0BIPu1sLqzkmLqVaOp7PQkSZHIpK4VQU7pm1nXlPa2/YlQ5nIPn+3LvQB3Ckjc8CTNO
 DBr/XCLhmML/YbY+g5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
common CRD board description and drops the PMIC nodes not present on this
design.

Kalambo uses the same QREF topology as Mahua through the qcom,mahua-tcsr
compatible TCSR block. Connect the QREF and refgen supply inputs to the
corresponding CRD LDOs so that the reference clocks for the PCIe and USB
PHYs can operate.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile        |  1 +
 arch/arm64/boot/dts/qcom/kalambo-crd.dts | 37 ++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..b7f1e543a248 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -50,6 +50,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
new file mode 100644
index 000000000000..9149cf6ad94b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "kalambo.dtsi"
+#include "glymur-crd.dtsi"
+
+/delete-node/ &pmcx0102_d_e0;
+/delete-node/ &pmcx0102_d0_thermal;
+/delete-node/ &pmh0104_i_e0;
+/delete-node/ &pmh0104_i0_thermal;
+/delete-node/ &pmh0104_j_e0;
+/delete-node/ &pmh0104_j0_thermal;
+
+/ {
+	model = "Qualcomm Technologies, Inc. Kalambo CRD";
+	compatible = "qcom,kalambo-crd", "qcom,kalambo";
+};
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1

