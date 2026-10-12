Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E498C48A8BE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808187; cv=none; b=IBkAdO6R2flttLxLGHDS08Uy04IH0Tbrp85rCvNBEzfR7dzcVoqifznTBvHF+wwD83u0Mmhv3EdOzmAeSef//23T8TGtg6/7xn6ddbDIskoEc728Xx6N2lqhXbnk5mBxvh4YlE6qSDti63FLQbDhPk3Oc9FMiztucGUyXTk+++I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808187; c=relaxed/simple;
	bh=+hii5+Dl7zlOwgKn2KfFJIJ2jZ1j/vWBvRpoEY5SuxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E80U2TG/u/tsarx8sFt77vvqfCtiQJtmtaqjicOeF/in1QmpqGkJnHFjC+VpNjXsMaqddW6r+F47Xbkqso5wIUQ7qPM1G768AHoHAi9HCawPXYpZfpwGXJPcajqw3/0Hncwc5I/7mks6Vnw7C+w5yhpNcAx+hvMbehWN73LN7RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPFLSRYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0ambRMO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPFLSRYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0ambRMO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0FnQ1236317
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9pJICCJ1jf++M2QDSH+MG+d1zO5Y83scFcB
	BZmIu3a0=; b=CPFLSRYrDRpoOhDMB2JZ9hI4UdjpLCMnmXNyEZliuZHeUR8vGun
	H0CZjMr7M5GbBSsiWfM9T6cCJgOPY6kiw/N4HEnQ9HfT4K9SbxLsXqqqESfq09YM
	+y6Z5/vzeFZe4Kf3FdhpHrxd5QYBv0E2r1JejzhahASv0AMRLxEeaEkaZsUPp6Di
	xJD4Ja7gdRvKl4GxHSILMeJz8MoaGYp/OkYDPpCcS0wMF4GSXJX2kHef8yt17h/w
	tjcSe1/l8o583jRnqb2tao3Y87nrjY1EcbSlA+dXJdYdxty+mY3CQjOQM+JWQ7af
	TBibMaEyVV5vzt7jSw0t3034VXsfIk5yejA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6djxp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:29:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6b8a88b88so4455445ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808184; x=1792412984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9pJICCJ1jf++M2QDSH+MG+d1zO5Y83scFcBBZmIu3a0=;
        b=I0ambRMOXUhUhGoYZnYkUHyE8gNJU3u7jsHsF3FGACMwozNsTzoq6+t/z0rx0Jrkdb
         GFRNaYb0hIe+h4NONglADzhJEX5MkN7KNpkHYKmVmp348KpQqhPAaKYO6JTgM81Ccenc
         e4CLT/V1eAyvmrdPwqFlphAZEZC29c0RKRBxWJBBpKHJWK5vrXeK6qUaQC/lgJQhqo8i
         aMPXuk4YkGdgLVTLqGI5DKhQK/tYIPY+lXNpn5YTxvQ1NJSUzgGhCjo5NZH9833borhb
         lan83KrOzl2f30S1Xb1JraMrgXXxLA3mWl8p146D8lf5S5ZhIUYa0UasrTcpoP1Q5W2i
         HokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808184; x=1792412984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pJICCJ1jf++M2QDSH+MG+d1zO5Y83scFcBBZmIu3a0=;
        b=14Z2SPc5xQScl3i8WsLrRYKkkbFR48pHbnurDL4a5/v5Otu+er7KzxGse9eGYyp6a3
         RfAxcgEm0jD1Dkj+cyjBhkdwFXfK1OIkCCIT83hxbP9gKuB1XwVL0JFq2CUNNJzOK2aY
         t+IJFOJhbIJXIXO327cKvf4LP2ip4c80SyVSruOFg+n4Mq3+qgm2GgoWugOffqJAVzHI
         eUUXYFmmCfEgXOMgQJ40zZf9YjJ4IRBBfEKKmXPqAVDhLza5ZS0AEW/Can3iFzuXeTqF
         Uxu+RaoB3H13uzCcZ+CRb7JdtfYwqwkk8UzpUQnDQFSeIU3QrCo1QZ2c3qQKtutN223B
         YtnA==
X-Forwarded-Encrypted: i=1; AKwUvBwnCluV7GeEXA379FQLGucu0logWPvAkhNiym3r5y7Le2NjXODBTJ2BJry6i7JuwRyStwqxTwWlTakRGf0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNOkCkqMCxoxm6dPUU2oi2X+ox+8Q1j9PuuAJ9I8w4UQgpxGoI
	oSjlubxvYE1qmuK+9YXfXnH22k4nsYfGLZeBkdV2ps69mz9sZrfu1/De+yGJH0KixA68u/2D/mf
	qV3SZAcOUPuCoAhpMMW25TIp/xV4R1Vcm/pv/qnlTCZpdw5s1Ev/9lNWxXrT7UnPLLL4=
X-Gm-Gg: AYBFou2E0r9qIz486vbFB6lDsh0V9NunDraKKU42sP/AjskRiCoWUgxtOcxB85lA5W1
	ftx5kPjZAvLRut/ci8VJ4EZOdtk4x/3zAhuCdnkd+ezfpFVjHLknsp/pYdyE+inJwBklMhq/P1T
	OjOhnEFAxMxfJCU9A3LAkhytgyX5AhPwWxUlOub/yK8xqq54QWU8V2rWP9pj9P1+J2eWWx6+EJv
	jrMOw7G5j11axnEcmwtML8X8G831l4+W17+b+PcYzbyawwO8wFsatpTXAb5h9K1fYvE2UU5YiLA
	jPz8UsIBvwAicgTWmyot3GRzwoCXqtKy7eqQxKzdt3dUsThNAifQQjklxxT9qmdCjOIY7yEke8F
	bzN7thSZJSfh5aMrKVArau9O34HXU
X-Received: by 2002:a17:903:22ce:b0:2e5:e361:5560 with SMTP id d9443c01a7336-2e842719490mr127967645ad.0.1791808183603;
        Mon, 12 Oct 2026 05:29:43 -0700 (PDT)
X-Received: by 2002:a17:903:22ce:b0:2e5:e361:5560 with SMTP id d9443c01a7336-2e842719490mr127967295ad.0.1791808183110;
        Mon, 12 Oct 2026 05:29:43 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e1c89sm41761785ad.75.2026.10.12.05.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:29:42 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay
Date: Mon, 12 Oct 2026 20:29:34 +0800
Message-ID: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX16ZOY53MD+B2
 8rdcjxNa9PU0INE4m2Xx3r6bJCu+CIQhE4aoT27Z8zyGap9EsTMfnVXn59dApSOTbLkm8nssa2d
 ZPk5iYR2mQwbbItVbdyI0YpSi9EVkFtiun4RieVRIGDzdH1vO8OaTlx5PQD/pMu2AfAIFdgEu6O
 4RGMIREE8QP+W7PI1CAwxEvpXxfMX095aEz/+rPzmAYwhirssEnTYTZHr4rzgkWVzMnBMR6Bx25
 cXbF/mmVF9Q4cFX+ZTGVw0ldBFhjLPOm6VzhiZIYkqAWE419xEzHxOGzMQ6s4AdExhvEKLnG7Ml
 co3wPOgSbtvife+2aSQ/z/rgtwkGrZo4Apc61RHdzlHMACLfq6CqLe7FJYQM5AUa8ibFfzLoijk
 s/8uBbx5Wie1jmZ4x3XCT//yATRW1TS4o6RzLn3OH3c5trJjjC/7gZ70CZHWx9h6HlxZqQQZLE5
 8E5q7zOmaOrQhDpJNDQ==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accd2b8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=HwT7i5cL4_BIIXZyjbQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: sGodzCbEoqTh8jTZL4cxEOCChTR7OUsC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfXw/50MeDjrMJa
 pStRGAgIHvKHWPefnk/y/ZGFmnYusEvmjjOrYzCA6lgJtXOc/f1q3QFz8TxrrapttO1EZl0BOIR
 457FmqsUCTKGRDrIMYgOtVtnHX1F0bw=
X-Proofpoint-ORIG-GUID: sGodzCbEoqTh8jTZL4cxEOCChTR7OUsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on Qualcomm
Shikra IQS EVK.

Describe the PCIe and UART connections through the M.2 connector, the
3.3 V supply, the W_DISABLE signals and the PCIe reset signal. Disable
the onboard Wi-Fi and Bluetooth nodes when the overlay is selected.

The Wi-Fi PCIe path was tested on a Shikra IQS EVK with a QCC2072
module. The overlay was applied, the link trained at Gen2 x1 and the
endpoint enumerated. Bluetooth UART and HCI runtime validation is
pending.

Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 107 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..799faa32e2d9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -339,6 +339,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
new file mode 100644
index 000000000000..3264c0add67b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	m2_keye_3p3: regulator-m2-keye-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P3_KEYE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&qps_gpio_expander 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		startup-delay-us = <100000>;
+	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&m2_keye_3p3>;
+		w-disable1-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 60 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie_port0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart8_ep>;
+				};
+			};
+		};
+	};
+};
+
+&{/wcn3988-pmu} {
+	status = "disabled";
+};
+
+&i2c3 {
+	qps_gpio_expander: gpio@3c {
+		compatible = "nxp,pca9534";
+		reg = <0x3c>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&pcie {
+	iommu-map = <0x0 &apps_smmu 0x0800 0x0 0x1>,
+		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
+	vddpe-3v3-supply = <&m2_keye_3p3>;
+};
+
+&pcie_port0 {
+	compatible = "pciclass,0604";
+	reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
+&tc9563 {
+	reg = <0x1ff00 0x0 0x0 0x0 0x0>;
+	status = "disabled";
+};
+
+&uart8 {
+	bluetooth {
+		status = "disabled";
+	};
+
+	port {
+		uart8_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&wifi {
+	status = "disabled";
+};
-- 
2.43.0

