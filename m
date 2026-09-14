Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82E33DED9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355695; cv=none; b=Upm/gi+OwDzc1of8MqHR+FbNZhPCCRmgAh4hE3iVoaXnaeo++xrCXF8IforS9HlZniYmCGUa9Pw2lwG7tFhVFa8Pz5deaBMQyJUK0nkoHBRB18rlcpXMkdDcGAQXO7PzwjlI7nh0syZTw8nI+d/JmWpqZeuvpuK5ughlAoR6K1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355695; c=relaxed/simple;
	bh=0AAdQ9JL9bWgavQjOUsB7fcGWQ9AvwZzi/Iow6JyqsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tO3ZVbA//SrIiB+f1eo4ao03NAeAg92RlP3lehi5SdDKQMeflXxCKueptCUAXu+8ysDs/2FZ0uFQENHVp8l4caH87tqVAeF7U8WUBcTuntbte3lUxskIOTEWA9YICqKLRlCFNN2FIBxny/++u6UAygyU+evLpxPpvK13CFfuu88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJL3M4hN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L83Dcjez; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJL3M4hN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L83Dcjez"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eSSP2742902
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Faq5eimPC5R
	zqsoT9xoKDwR9GXEq1+62Ln1f38sMtmM=; b=NJL3M4hN0JG9eOVr3OQ+bL919mK
	HBkQyHcHa+6vAvj6oUjladpLpEZvstSvTFX0pi+chOTZ58RK1sxXeQjB5KrtjC7t
	9v5f2LM6mDHJn5fmXRoNw9jhx8uqWUSmW6rqYSKF6wVhN72yFPVnscAbBprx0RGx
	JEnXhU0X4dHx44XCn7P4dbLFERIlx5sEAKJsE81xzDWe4bosqYNJWBgT3V1FXpH2
	ltglwsMT56CdQg5AAwaMsVn01EG2ZVlFzLFdF7Sog5skRRIlNKSW/eyNQCog4fhi
	ikG4qwMi82aUAGd8VuMrw6VDml2d2bCKHqikfRdZS9yxqveoCntxEoqAGTA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018mppt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:14:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc489e7a701so4027990a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789355680; x=1789960480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Faq5eimPC5RzqsoT9xoKDwR9GXEq1+62Ln1f38sMtmM=;
        b=L83DcjezBZ/ojZ0V5cI+eGyilf24n7G0A1VXrC+l28ngNeC7NYwJ9tE9awmLmUnXhD
         Lj1y0YrI5ge9EHiXbsgMtEgJO5DBm+dF4OIq+8XHQawy+CLdO/80VQDRQkJC6rQnsRbu
         rBN2nJfa+mLLeoxRAsMTmac3ym1gnvL0rJ7m6QcPVCydX8PT8ztewGaua38Qhj9MbwUj
         IVenIph4GHoOS+dfQjJNAo4d2u+RRSgLqeOiva8b5akC6IVQxMzPq1vYMgKPduxfRjDT
         vmY3x7KycRySkHmZe2fCw77Jp9x6LFI/YLIsdzVXdxNq/WNCBKsnEwEFUzoMvGm/Zx2Y
         7dEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355680; x=1789960480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Faq5eimPC5RzqsoT9xoKDwR9GXEq1+62Ln1f38sMtmM=;
        b=jR2GW21R86tzBnr74vm3c9S+6vpiWgtcyS/Wewc9pJVApIUZ2pgTb2WPxlCEbEjjAL
         /LzP402aFkLq8w49VCvcfU8foyCCjdC+KvSDpi8AOeaoZUTyvmtBOuMc+2Ro/gZu/MJX
         gd4iIdR1oCVyZm31p9dovQOuS68gKOMMMTb8axHwJ7KZmGmshAcUDS4D5x9DT3CkgABj
         xz8pt7zLnl7wiHs16HKh+vm2DOcgYBPrNYVOo4cuaIF8uaeYF7/wccohpH12w9WbmrJd
         uwgO354230GAjOeWkNvIavVDr9y6r1oWP4LyVT+1HujtO1L13FQ6IQlVA2MNcxrIbayC
         MNfg==
X-Forwarded-Encrypted: i=1; AKwUvBzAPXwjjqOtI/6dySfI6q2CjPotI5KUoR4GxzQWM6wj9vdvrK8OZSCXDDInhZ7A10zIoA5Lx1ESAbiD90Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nznr2lZwvurQrqS4RQDkvIqBa6cNN+7iFXHN6HX9XSDExCc86D
	jTnPGLtSgyFAISaLmpaErn+doLEkh4y0kPzfF8P3GJUuG+YOCHxqqVH/jsFYlb8RzWbHuGEwO6p
	jk8coUSvDUujaQ1qkkBoEk/9y01i+atZ/yBOpT6oOvT9YwGOrj+WbhP6n0lvIic32tKg=
X-Gm-Gg: AYBFou28QbgSy3p9xe0g1hiyM+8t9t9tF3RMOxmT+4sYhF2a4d7iEeUFkq9PrO405Ax
	sZ5VutAKSd1o+tM2b0KWjj+BV/s1NNNtV9e1dgXTXNyvxcX7YgGc+j21g9F9mb/PcZFnE87u8dP
	B6LY8FFDD5X9GSmPjVSZqjKqlxQNnHxRKpQ417Las6RNDCZlQdwzffR3IxYVv9EwoDgI9Ae7Eb4
	lOBJrF6mWjkyRkEfvt5uufrWZKjDYpSyW4kilEns3gcy5ZqbPXfMm7hanAnaMzFVegBiQZcrLn8
	JVoPnDQzUuYthwdeeTPoDXmkSIb1tr7HN3jtl9A8wS9RzMDkf+tABqy4nKHMeTDQ3m60BOvbZK0
	3mKyAqJfz0xoSc6Py/YxeXmAI1b2EaD6n1skowTDvG3iOhqsAFGS2f+xwCj3D
X-Received: by 2002:a05:6a21:1518:b0:3d0:88f5:f806 with SMTP id adf61e73a8af0-3db40521dc6mr1185633637.15.1789355679478;
        Sun, 13 Sep 2026 20:14:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:1518:b0:3d0:88f5:f806 with SMTP id adf61e73a8af0-3db40521dc6mr1185545637.15.1789355678772;
        Sun, 13 Sep 2026 20:14:38 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm26714231eec.0.2026.09.13.20.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:14:38 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v15 3/6] arm64: dts: qcom: Add device tree for Nord Embedded variant
Date: Mon, 14 Sep 2026 11:14:08 +0800
Message-ID: <20260914031412.140856-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
References: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa766a0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dZ0VCFyakWNQtIhzOf8A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX81MzzgH/9pP5
 IrQEdYVBhV3zf1+m2a8bVsz7XPB+LSr5iQSPnh1X256IvHuZ9G1hHEVAo6LTf5/tVmYD6M3eBDz
 YZGDTNjwk6qtVbrdLQsmOHo2lc3wWjQ=
X-Proofpoint-GUID: qZhpMfYHXNxPyaVIPVZ4U1kDrSnBN8TU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX/E/Dh+aqd7Nx
 vywbnxn6IiMHKZdO672fjIbZHsUhwOLm3/REmUIhjquzv5/ocaNWRph90JyDHeBPSoAgReZyYHV
 sV2Wa1NAa5vZsoP9ALfk0E1UmtScs3+OUtmWDzgbE+5dt2CYGi8bZjUp1sRw4++eC6HmTAKhgyf
 QQoxdqMuj9mibYNYG4PILoNKv2BbmpJyjTcPHk9Ci8JvoD8P3rIWrGgnuRe4lcTNE0Bsd/G6a7S
 UCQiraa8k6H9OBJjqpeMzk++3BiisAuIVUZl6I2X8G+DRVPguHifyrzQKOQPsVTl9Ri4iTJawex
 Xk8wwgD9pGtCiMPN4gdGUmu4Qw11BSQFxzK5qMT3/xDn0qrHxT5kVW4RR357c9xqWTNCmHR7VI8
 14j3vk3+3E3l+QO+VdI+BQDTSPfkGzJWuKfMB6epeihOHDJdwGPSsmyJqJjcGcZqiHpKLcSuR8x
 Q4uiY9e46lGaMTAb9pA==
X-Proofpoint-ORIG-GUID: qZhpMfYHXNxPyaVIPVZ4U1kDrSnBN8TU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140043

Unlike the GearVM variant, Nord Embedded variant has platform resources
(clocks, regulators, powerdomains, pins, etc.) directly controlled by
the operating system. Add a separate dtsi file extending the existing
top-level nord.dtsi with nodes representing these peripherals as well as
describing how they are wired up with the already defined components.

Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 1820 +++++++++++++++++++
 1 file changed, 1820 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
new file mode 100644
index 000000000000..568fe68cd185
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -0,0 +1,1820 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/clock/qcom,nord-gcc.h>
+#include <dt-bindings/clock/qcom,nord-negcc.h>
+#include <dt-bindings/clock/qcom,nord-nwgcc.h>
+#include <dt-bindings/clock/qcom,nord-segcc.h>
+#include <dt-bindings/clock/qcom,nord-tcsrcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,nord-rpmh.h>
+#include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/soc/qcom,rpmh-rsc.h>
+
+#include "nord.dtsi"
+
+/ {
+	clk_virt: interconnect-clk-virt {
+		compatible = "qcom,nord-clk-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	mc_virt: interconnect-mc-virt {
+		compatible = "qcom,nord-mc-virt";
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+};
+
+&crypto {
+	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "memory";
+
+	status = "okay";
+};
+
+&i2c0 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+};
+
+&i2c1 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c1_default>;
+	pinctrl-names = "default";
+};
+
+&i2c2 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c2_default>;
+	pinctrl-names = "default";
+};
+
+&i2c3 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c3_default>;
+	pinctrl-names = "default";
+};
+
+&i2c4 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c4_default>;
+	pinctrl-names = "default";
+};
+
+&i2c5 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c5_default>;
+	pinctrl-names = "default";
+};
+
+&i2c7 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c7_default>;
+	pinctrl-names = "default";
+};
+
+&i2c8 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c8_default>;
+	pinctrl-names = "default";
+};
+
+&i2c9 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c9_default>;
+	pinctrl-names = "default";
+};
+
+&i2c10 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c10_default>;
+	pinctrl-names = "default";
+};
+
+&i2c11 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c11_default>;
+	pinctrl-names = "default";
+};
+
+&i2c12 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c12_default>;
+	pinctrl-names = "default";
+};
+
+&i2c13 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c13_default>;
+	pinctrl-names = "default";
+};
+
+&i2c14 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c14_default>;
+	pinctrl-names = "default";
+};
+
+&i2c16 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c16_default>;
+	pinctrl-names = "default";
+};
+
+&i2c17 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c17_default>;
+	pinctrl-names = "default";
+};
+
+&i2c18 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c18_default>;
+	pinctrl-names = "default";
+};
+
+&i2c19 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c19_default>;
+	pinctrl-names = "default";
+};
+
+&i2c20 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_i2c20_default>;
+	pinctrl-names = "default";
+};
+
+&qupv3_0 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_M_AHB_CLK>,
+		 <&segcc SE_GCC_QUPV3_WRAP0_S_AHB_CLK>;
+	clock-names = "m-ahb",
+		      "s-ahb";
+};
+
+&qupv3_1 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_M_AHB_CLK>,
+		 <&segcc SE_GCC_QUPV3_WRAP1_S_AHB_CLK>;
+	clock-names = "m-ahb",
+		      "s-ahb";
+};
+
+&qupv3_2 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_M_AHB_CLK>,
+		 <&negcc NE_GCC_QUPV3_WRAP2_S_AHB_CLK>;
+	clock-names = "m-ahb",
+		      "s-ahb";
+};
+
+&spi0 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi0_default>;
+	pinctrl-names = "default";
+};
+
+&spi1 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi1_default>;
+	pinctrl-names = "default";
+};
+
+&spi2 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi2_default>;
+	pinctrl-names = "default";
+};
+
+&spi3 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi3_default>;
+	pinctrl-names = "default";
+};
+
+&spi4 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi4_default>;
+	pinctrl-names = "default";
+};
+
+&spi5 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi5_default>;
+	pinctrl-names = "default";
+};
+
+&spi7 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi7_default>;
+	pinctrl-names = "default";
+};
+
+&spi8 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi8_default>;
+	pinctrl-names = "default";
+};
+
+&spi11 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi11_default>;
+	pinctrl-names = "default";
+};
+
+&spi12 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi12_default>;
+	pinctrl-names = "default";
+};
+
+&spi13 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre2_noc_tile MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi13_default>;
+	pinctrl-names = "default";
+};
+
+&spi14 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi14_default>;
+	pinctrl-names = "default";
+};
+
+&spi16 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi16_default>;
+	pinctrl-names = "default";
+};
+
+&spi17 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi17_default>;
+	pinctrl-names = "default";
+};
+
+&spi18 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi18_default>;
+	pinctrl-names = "default";
+};
+
+&spi19 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi19_default>;
+	pinctrl-names = "default";
+};
+
+&spi20 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+			<&aggre1_noc_tile MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config",
+			     "qup-memory";
+	pinctrl-0 = <&qup_spi20_default>;
+	pinctrl-names = "default";
+};
+
+&soc {
+	gcc: clock-controller@100000 {
+		compatible = "qcom,nord-gcc";
+		reg = <0x0 0x00100000 0x0 0x1f4200>;
+		clocks = <&bi_tcxo_div2>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	cnoc_main: interconnect@1500000 {
+		compatible = "qcom,nord-cnoc-main";
+		reg = <0x0 0x01500000 0x0 0x1d200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	config_noc: interconnect@1600000 {
+		compatible = "qcom,nord-cnoc-cfg";
+		reg = <0x0 0x01600000 0x0 0xd200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	system_noc: interconnect@1680000 {
+		compatible = "qcom,nord-system-noc";
+		reg = <0x0 0x01680000 0x0 0x1c080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	aggre2_noc_tile: interconnect@16c0000 {
+		compatible = "qcom,nord-aggre2-noc-tile";
+		reg = <0x0 0x016c0000 0x0 0x1b400>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	aggre1_noc: interconnect@16e0000 {
+		compatible = "qcom,nord-aggre1-noc";
+		reg = <0x0 0x016e0000 0x0 0x1c400>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	aggre2_noc: interconnect@1700000 {
+		compatible = "qcom,nord-aggre2-noc";
+		reg = <0x0 0x01700000 0x0 0x1b400>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+		clocks = <&rpmhcc RPMH_IPA_CLK>;
+	};
+
+	aggre1_noc_tile: interconnect@1720000 {
+		compatible = "qcom,nord-aggre1-noc-tile";
+		reg = <0x0 0x01720000 0x0 0x23400>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+		clocks = <&negcc NE_GCC_AGGRE_NOC_USB2_AXI_CLK>,
+			 <&negcc NE_GCC_AGGRE_NOC_USB3_PRIM_AXI_CLK>,
+			 <&negcc NE_GCC_AGGRE_NOC_USB3_SEC_AXI_CLK>,
+			 <&negcc NE_GCC_AGGRE_NOC_UFS_PHY_AXI_CLK>;
+	};
+
+	mmss_noc: interconnect@1780000 {
+		compatible = "qcom,nord-mmss-noc";
+		reg = <0x0 0x01780000 0x0 0x72800>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	pcie_cfg: interconnect@1ba0000 {
+		compatible = "qcom,nord-pcie-cfg";
+		reg = <0x0 0x01ba0000 0x0 0x7200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	pcie_data_outbound: interconnect@1bc0000 {
+		compatible = "qcom,nord-pcie-data-outbound";
+		reg = <0x0 0x01bc0000 0x0 0x17000>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	pcie_data_inbound: interconnect@1c00000 {
+		compatible = "qcom,nord-pcie-data-inbound";
+		reg = <0x0 0x01c00000 0x0 0x4b080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	ufs_mem_phy: phy@1d40000 {
+		compatible = "qcom,nord-qmp-ufs-phy",
+			     "qcom,sm8650-qmp-ufs-phy";
+		reg = <0x0 0x01d40000 0x0 0x2000>;
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>,
+			 <&negcc NE_GCC_UFS_PHY_PHY_AUX_CLK>,
+			 <&tcsrcc TCSR_UFS_CLKREF_EN>;
+		clock-names = "ref",
+			      "ref_aux",
+			      "qref";
+
+		resets = <&ufs_mem_hc 0>;
+		reset-names = "ufsphy";
+
+		power-domains = <&negcc NE_GCC_UFS_MEM_PHY_GDSC>;
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+
+	ice: crypto@1d48000 {
+		compatible = "qcom,nord-inline-crypto-engine",
+			     "qcom,inline-crypto-engine";
+		reg = <0x0 0x01d48000 0x0 0x18000>;
+		clocks = <&negcc NE_GCC_UFS_PHY_ICE_CORE_CLK>,
+			 <&negcc NE_GCC_UFS_PHY_AHB_CLK>;
+		clock-names = "core",
+			      "iface";
+		power-domains = <&negcc NE_GCC_UFS_PHY_GDSC>;
+	};
+
+	hscnoc: interconnect@2000000 {
+		compatible = "qcom,nord-hscnoc";
+		reg = <0x0 0x02000000 0x0 0xb22000>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	hpass_ag_noc: interconnect@5fc0000 {
+		compatible = "qcom,nord-hpass-ag-noc";
+		reg = <0x0  0x05fc0000 0x0 0x37080>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	negcc: clock-controller@8900000 {
+		compatible = "qcom,nord-negcc";
+		reg = <0x0 0x08900000 0x0 0xf4200>;
+		clocks = <&bi_tcxo_div2>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	segcc: clock-controller@8a00000 {
+		compatible = "qcom,nord-segcc";
+		reg = <0x0 0x08a00000 0x0 0xf4200>;
+		clocks = <&bi_tcxo_div2>,
+			 <&sleep_clk>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	nwgcc: clock-controller@8b00000 {
+		compatible = "qcom,nord-nwgcc";
+		reg = <0x0 0x08b00000 0x0 0xf4200>;
+		clocks = <&bi_tcxo_div2>,
+			 <&sleep_clk>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	tcsrcc: clock-controller@f1d9000 {
+		compatible = "qcom,nord-tcsrcc",
+			     "syscon";
+		reg = <0x0 0x0f1d9000 0x0 0xf00c>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+
+	apps_rsc: rsc@18900000 {
+		compatible = "qcom,rpmh-rsc";
+		reg = <0x0 0x18900000 0x0 0x10000>,
+		      <0x0 0x18910000 0x0 0x10000>,
+		      <0x0 0x18920000 0x0 0x10000>;
+		reg-names = "drv-0",
+			    "drv-1",
+			    "drv-2";
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+		qcom,tcs-offset = <0xd00>;
+		qcom,drv-id = <2>;
+		qcom,tcs-config = <ACTIVE_TCS 3>,
+				  <SLEEP_TCS 2>,
+				  <WAKE_TCS 2>,
+				  <CONTROL_TCS 0>;
+		label = "apps_rsc";
+		power-domains = <&system_pd>;
+
+		apps_bcm_voter: bcm-voter {
+			compatible = "qcom,bcm-voter";
+		};
+
+		rpmhcc: clock-controller {
+			compatible = "qcom,nord-rpmh-clk";
+			clocks = <&xo_board>;
+			clock-names = "xo";
+			#clock-cells = <1>;
+		};
+
+		rpmhpd: power-controller {
+			compatible = "qcom,nord-rpmhpd";
+			#power-domain-cells = <1>;
+			operating-points-v2 = <&rpmhpd_opp_table>;
+
+			rpmhpd_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				rpmhpd_opp_ret: opp-0 {
+					opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+				};
+
+				rpmhpd_opp_min_svs: opp-1 {
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+
+				rpmhpd_opp_low_svs: opp-2 {
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				rpmhpd_opp_svs: opp-3 {
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				rpmhpd_opp_svs_l1: opp-4 {
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				rpmhpd_opp_nom: opp-5 {
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+
+				rpmhpd_opp_nom_l1: opp-6 {
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+				};
+
+				rpmhpd_opp_nom_l2: opp-7 {
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+				};
+
+				rpmhpd_opp_turbo: opp-8 {
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+				};
+
+				rpmhpd_opp_turbo_l1: opp-9 {
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+				};
+			};
+		};
+	};
+
+	nsp_data_noc_0: interconnect@1f200000 {
+		compatible = "qcom,nord-nsp-data-noc-0";
+		reg = <0x0 0x1f200000 0x0 0x2a200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	nsp_data_noc_1: interconnect@1f600000 {
+		compatible = "qcom,nord-nsp-data-noc-1";
+		reg = <0x0 0x1f600000 0x0 0x2a200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	nsp_data_noc_2: interconnect@1fa00000 {
+		compatible = "qcom,nord-nsp-data-noc-2";
+		reg = <0x0 0x1fa00000 0x0 0x2a200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	nsp_data_noc_3: interconnect@1fe00000 {
+		compatible = "qcom,nord-nsp-data-noc-3";
+		reg = <0x0 0x1fe00000 0x0 0x2a200>;
+		#interconnect-cells = <2>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+};
+
+&tlmm {
+	qup_i2c0_default: qup-i2c0-default-state {
+		pins = "gpio111", "gpio112";
+		function = "qup0_se0";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c1_default: qup-i2c1-default-state {
+		pins = "gpio111", "gpio112";
+		function = "qup0_se1";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c2_default: qup-i2c2-default-state {
+		pins = "gpio113", "gpio114";
+		function = "qup0_se2";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c3_default: qup-i2c3-default-state {
+		pins = "gpio115", "gpio116";
+		function = "qup0_se3";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c4_default: qup-i2c4-default-state {
+		pins = "gpio117", "gpio118";
+		function = "qup0_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c5_default: qup-i2c5-default-state {
+		pins = "gpio121", "gpio122";
+		function = "qup0_se5";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c7_default: qup-i2c7-default-state {
+		pins = "gpio123", "gpio124";
+		function = "qup1_se0";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c8_default: qup-i2c8-default-state {
+		pins = "gpio125", "gpio126";
+		function = "qup1_se1";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c9_default: qup-i2c9-default-state {
+		pins = "gpio127", "gpio128";
+		function = "qup1_se2_01";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c10_default: qup-i2c10-default-state {
+		pins = "gpio129", "gpio130";
+		function = "qup1_se3_01";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c11_default: qup-i2c11-default-state {
+		pins = "gpio131", "gpio132";
+		function = "qup1_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c12_default: qup-i2c12-default-state {
+		pins = "gpio133", "gpio134";
+		function = "qup1_se5";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c13_default: qup-i2c13-default-state {
+		pins = "gpio137", "gpio138";
+		function = "qup1_se6";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c14_default: qup-i2c14-default-state {
+		pins = "gpio139", "gpio140";
+		function = "qup2_se0";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c16_default: qup-i2c16-default-state {
+		pins = "gpio145", "gpio146";
+		function = "qup2_se2";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c17_default: qup-i2c17-default-state {
+		pins = "gpio150", "gpio151";
+		function = "qup2_se3";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c18_default: qup-i2c18-default-state {
+		pins = "gpio154", "gpio155";
+		function = "qup2_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c19_default: qup-i2c19-default-state {
+		pins = "gpio156", "gpio157";
+		function = "qup2_se5";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_i2c20_default: qup-i2c20-default-state {
+		pins = "gpio158", "gpio159";
+		function = "qup2_se6";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	qup_spi0_default: qup-spi0-default-state {
+		data-pins {
+			pins = "gpio109", "gpio111", "gpio112";
+			function = "qup0_se0";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio110";
+			function = "qup0_se0";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi1_default: qup-spi1-default-state {
+		data-pins {
+			pins = "gpio109", "gpio111", "gpio112";
+			function = "qup0_se1";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio110";
+			function = "qup0_se1";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi2_default: qup-spi2-default-state {
+		data-pins {
+			pins = "gpio113", "gpio114", "gpio115";
+			function = "qup0_se2";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio116";
+			function = "qup0_se2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi3_default: qup-spi3-default-state {
+		data-pins {
+			pins = "gpio113", "gpio115", "gpio116";
+			function = "qup0_se3";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio114";
+			function = "qup0_se3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi4_default: qup-spi4-default-state {
+		data-pins {
+			pins = "gpio117", "gpio118", "gpio119";
+			function = "qup0_se4";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio120";
+			function = "qup0_se4";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi5_default: qup-spi5-default-state {
+		data-pins {
+			pins = "gpio109", "gpio121", "gpio122";
+			function = "qup0_se5";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio110";
+			function = "qup0_se5";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi7_default: qup-spi7-default-state {
+		data-pins {
+			pins = "gpio123", "gpio124", "gpio125";
+			function = "qup1_se0";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio126";
+			function = "qup1_se0";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi8_default: qup-spi8-default-state {
+		data-pins {
+			pins = "gpio123", "gpio125", "gpio126";
+			function = "qup1_se1";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio124";
+			function = "qup1_se1";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi11_default: qup-spi11-default-state {
+		data-pins {
+			pins = "gpio131", "gpio132", "gpio137";
+			function = "qup1_se4";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio138";
+			function = "qup1_se4";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi12_default: qup-spi12-default-state {
+		data-pins {
+			pins = "gpio133", "gpio134", "gpio135";
+			function = "qup1_se5";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio136";
+			function = "qup1_se5";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi13_default: qup-spi13-default-state {
+		data-pins {
+			pins = "gpio131", "gpio137", "gpio138";
+			function = "qup1_se6";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio132";
+			function = "qup1_se6";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi14_default: qup-spi14-default-state {
+		data-pins {
+			pins = "gpio139", "gpio140", "gpio141";
+			function = "qup2_se0";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio142";
+			function = "qup2_se0";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi16_default: qup-spi16-default-state {
+		data-pins {
+			pins = "gpio145", "gpio146", "gpio147";
+			function = "qup2_se2";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio148";
+			function = "qup2_se2";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi17_default: qup-spi17-default-state {
+		data-pins {
+			pins = "gpio150", "gpio151", "gpio152";
+			function = "qup2_se3";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio153";
+			function = "qup2_se3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi18_default: qup-spi18-default-state {
+		data-pins {
+			pins = "gpio143", "gpio154", "gpio155";
+			function = "qup2_se4";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio144";
+			function = "qup2_se4";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi19_default: qup-spi19-default-state {
+		data-pins {
+			pins = "gpio156", "gpio157", "gpio158";
+			function = "qup2_se5";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio159";
+			function = "qup2_se5";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_spi20_default: qup-spi20-default-state {
+		data-pins {
+			pins = "gpio156", "gpio158", "gpio159";
+			function = "qup2_se6";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio157";
+			function = "qup2_se6";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
+	qup_uart0_default: qup-uart0-default-state {
+		pins = "gpio109", "gpio110";
+		function = "qup0_se0";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart1_default: qup-uart1-default-state {
+		pins = "gpio109", "gpio110";
+		function = "qup0_se1";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart2_default: qup-uart2-default-state {
+		pins = "gpio115", "gpio116";
+		function = "qup0_se2";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart3_default: qup-uart3-default-state {
+		pins = "gpio113", "gpio114";
+		function = "qup0_se3";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart4_default: qup-uart4-default-state {
+		pins = "gpio119", "gpio120";
+		function = "qup0_se4";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart5_default: qup-uart5-default-state {
+		pins = "gpio109", "gpio110";
+		function = "qup0_se5";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart7_default: qup-uart7-default-state {
+		pins = "gpio125", "gpio126";
+		function = "qup1_se0";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart8_default: qup-uart8-default-state {
+		pins = "gpio123", "gpio124";
+		function = "qup1_se1";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart9_default: qup-uart9-default-state {
+		pins = "gpio127", "gpio128";
+		function = "qup1_se2_23";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart10_default: qup-uart10-default-state {
+		pins = "gpio129", "gpio130";
+		function = "qup1_se3_23";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart11_default: qup-uart11-default-state {
+		pins = "gpio137", "gpio138";
+		function = "qup1_se4";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart12_default: qup-uart12-default-state {
+		pins = "gpio135", "gpio136";
+		function = "qup1_se5";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart13_default: qup-uart13-default-state {
+		pins = "gpio131", "gpio132";
+		function = "qup1_se6";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart14_default: qup-uart14-default-state {
+		pins = "gpio141", "gpio142";
+		function = "qup2_se0";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart15_default: qup-uart15-default-state {
+		pins = "gpio143", "gpio144";
+		function = "qup2_se1";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart16_default: qup-uart16-default-state {
+		pins = "gpio147", "gpio148";
+		function = "qup2_se2";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart17_default: qup-uart17-default-state {
+		pins = "gpio150", "gpio151", "gpio152", "gpio153";
+		function = "qup2_se3";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart18_default: qup-uart18-default-state {
+		pins = "gpio143", "gpio144";
+		function = "qup2_se4";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart19_default: qup-uart19-default-state {
+		pins = "gpio158", "gpio159";
+		function = "qup2_se5";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	qup_uart20_default: qup-uart20-default-state {
+		pins = "gpio156", "gpio157";
+		function = "qup2_se6";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart0 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart0_default>;
+	pinctrl-names = "default";
+};
+
+&uart1 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart1_default>;
+	pinctrl-names = "default";
+};
+
+&uart2 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart2_default>;
+	pinctrl-names = "default";
+};
+
+&uart3 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart3_default>;
+	pinctrl-names = "default";
+};
+
+&uart4 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart4_default>;
+	pinctrl-names = "default";
+};
+
+&uart5 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart5_default>;
+	pinctrl-names = "default";
+};
+
+&uart7 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart7_default>;
+	pinctrl-names = "default";
+};
+
+&uart8 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart8_default>;
+	pinctrl-names = "default";
+};
+
+&uart9 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart9_default>;
+	pinctrl-names = "default";
+};
+
+&uart10 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart10_default>;
+	pinctrl-names = "default";
+};
+
+&uart11 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart11_default>;
+	pinctrl-names = "default";
+};
+
+&uart12 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart12_default>;
+	pinctrl-names = "default";
+};
+
+&uart13 {
+	clocks = <&segcc SE_GCC_QUPV3_WRAP1_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart13_default>;
+	pinctrl-names = "default";
+};
+
+&uart14 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S0_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart14_default>;
+	pinctrl-names = "default";
+};
+
+&uart15 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S1_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart15_default>;
+	pinctrl-names = "default";
+};
+
+&uart16 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S2_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart16_default>;
+	pinctrl-names = "default";
+};
+
+&uart17 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S3_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart17_default>;
+	pinctrl-names = "default";
+};
+
+&uart18 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S4_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart18_default>;
+	pinctrl-names = "default";
+};
+
+&uart19 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S5_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart19_default>;
+	pinctrl-names = "default";
+};
+
+&uart20 {
+	clocks = <&negcc NE_GCC_QUPV3_WRAP2_S6_CLK>;
+	clock-names = "se";
+	interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+			 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+			 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "qup-core",
+			     "qup-config";
+	pinctrl-0 = <&qup_uart20_default>;
+	pinctrl-names = "default";
+};
+
+&ufs_mem_hc {
+	clocks = <&negcc NE_GCC_UFS_PHY_AXI_CLK>,
+		 <&negcc NE_GCC_AGGRE_NOC_UFS_PHY_AXI_CLK>,
+		 <&negcc NE_GCC_UFS_PHY_AHB_CLK>,
+		 <&negcc NE_GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+		 <&tcsrcc TCSR_UFS_CLKREF_EN>,
+		 <&negcc NE_GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+		 <&negcc NE_GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+		 <&negcc NE_GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+	clock-names = "core_clk",
+		      "bus_aggr_clk",
+		      "iface_clk",
+		      "core_clk_unipro",
+		      "ref_clk",
+		      "tx_lane0_sync_clk",
+		      "rx_lane0_sync_clk",
+		      "rx_lane1_sync_clk";
+
+	resets = <&negcc NE_GCC_UFS_PHY_BCR>;
+	reset-names = "rst";
+
+	interconnects = <&aggre1_noc_tile MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+	interconnect-names = "ufs-ddr",
+			     "cpu-ufs";
+
+	phys = <&ufs_mem_phy>;
+	phy-names = "ufsphy";
+
+	power-domains = <&negcc NE_GCC_UFS_PHY_GDSC>;
+	operating-points-v2 = <&ufs_opp_table>;
+	required-opps = <&rpmhpd_opp_nom>;
+	qcom,ice = <&ice>;
+	#reset-cells = <1>;
+
+	ufs_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <100000000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-201500000 {
+			opp-hz = /bits/ 64 <201500000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <201500000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-403000000 {
+			opp-hz = /bits/ 64 <403000000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <403000000>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>,
+				 /bits/ 64 <0>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+};
-- 
2.43.0

