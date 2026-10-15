Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267313DDDCB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792031919; cv=none; b=gynPyCBQ4Li0RzVTmISgpQm9EwGpdVFYy0cp0WUpsFHOtU5KVg/HF+I5eXxwQQQjoG+MobDmJQP7ULCyzsG/dqrpiNSpBaz6JRFo03Rr3FacE8DBbsJh7hq/AoU2e2zKFed25CrP+0XvrWgJTIb+zbYMySebaExkgRzMZ3Hb2YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792031919; c=relaxed/simple;
	bh=7yLDnmPQWLqADjZhqjpvZVRilqWeZx0iTioFJ/yFRFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBz5F1ekzCWEO4mW8MfpXwZ9cdsmksAp1oJMhoj2d3A//0uwBZX8AliAtVrwoVREhA0zmt1+V2qAe33u35Ru09m3d+o7J3DGuMe4GHV6MzMW0vbHY7bKuQWo/pFLI1kLNWeqiJ2LYWRFi9e5jti+9F0vxwqvONNormiFTpSsaFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnzXpH6I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DY6ti2JB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnzXpH6I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DY6ti2JB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F0Fuju1672304
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+0CDhvqyVCb
	B/q+z+roCVze+kZUI3DJgwmQW3ILLNmQ=; b=hnzXpH6IY3qpVFIQW9eU5s5pnxY
	awlTYScgy4LK5dM1RMQabZKmZaaP1Pa98gyrHpQzAtk2DvZpTMVVqezcox57e3pr
	xT9XG1S9lcWLS8k+dAYYKSDZT9+pADHC0RAZ9b6N1e69Jvo3VWeEzdYg9ddX07LS
	DVGgm3f6pGg1SNwIfGI9gayxxdHd1hSap7JvO/LU7+91bVnp885dV6wMXXbjtTLG
	AFdaPSftu39/XXUI6BMizymEe60lyLyIvVcfHz25SOQ+3xItlODTP4YuUfLRVRb7
	kII3mXS1JBxJM774BQ26b8M48JazMq0NcXjrLyYPxeT0n9ciQVmVu8tXopw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrha49m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so5187741eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792031907; x=1792636707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0CDhvqyVCbB/q+z+roCVze+kZUI3DJgwmQW3ILLNmQ=;
        b=DY6ti2JBZgWE8qSTE2qJPjlU/cP6H2HvgggyHmyh1gi6fFpaQ1ASazm23HnWAEIL6A
         3bD3Yj8+N90ffmH7GvXC/JSpaA1s715HNLvcgM9d3hBNEurC+Tg2amplernJRwAwfz2n
         PcZaR6HqmP0eosDX+XmP5RZiLpc+lyq2lz2/8Q/2HsHS5pEb0Kb6XO9MX57AcEzMEKLn
         e+B9t9B4VH29hnGZ0bWNXYB21A7oY/0U3lL0J/rT5jT0NDp3F4v43OAkIxxXW6iH1Yma
         QOzzWrsSetQrfYGhNT8Oj+uz/MZKsh0IQNoeNxvn8CIHrdSDzL2iMRtt+kysZRlWnih+
         ElRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792031907; x=1792636707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+0CDhvqyVCbB/q+z+roCVze+kZUI3DJgwmQW3ILLNmQ=;
        b=oogxYAPS+mZ9R+pmiM7NktN5icvot6sJ/EV282cJpCmbBVV5ZebnfvxvvahaOlKX3E
         lSZ47rkv7rsRvWsS2SF61vq155xh2qKJepuSEevrNUBpYWmKrCFa6E9eAtFyGbDGiZR4
         lRTGjR22KJwPv99zrP0N9gx1GSYA2ogujziVLX7IL5WionELN/lR5HSvEoAYshuaCYer
         /8nIOoazUisH0qyOJd0beTA6d9hpxlfojJGEg/8NkRbPBteHX3g+/9t9g0h6SAhC+jXN
         jDBE10pqYklmLVekXkEXv2KdPvhHLewC2Vw4qiH5lhPfsosdzXu0IAnyJKcpRD1Cm97+
         Og2w==
X-Forwarded-Encrypted: i=1; AKwUvBz2BW4PuC4zH0kgC0Yrn7JNHRJfdX04xxbyoow2AMlh9nHJBXS5lH2BsYW48UqmoJDYnPhNO3SUW7O5iYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKd4RKA1h1XU9qoSoBHXGHOjRrUHrauWrAUrmu16bCYVxS+zitx
	ZTD/HrBns7yZ4PY75Uu0/SA2u1ZRIvSpi+Joi7H10Mj5XS0LEsiAp+SEAbHtujwnHg/s2b9Nk0j
	RhmtKJZQdqx7vJItPq7rOwe/9wHJ4pcU3lqyv4kuT2YB1xwILRTWK657cQLC00q5RBtQ=
X-Gm-Gg: AYBFou1Gwe5ZcK/g/Wu5O+szO+B9N3nNlTiyxMHXg6u0edKmkgHLLlpxLQJSyAVwIv5
	7sPLfab05+e6GOrJcaq39DfaQZeE//YyMTnIv2tKwsxqLf0QTQ1Z6Kc594dpNXb0g2Yvp8/R4fx
	+0Mm19nGu69MjUYYx3UtGaNo4ywntCzNHh37VycHqLaBl03BLQzuAmOv5e0UU2fA5xN4n6HQX68
	HQADv6XioXseLvPfDZUieeYnI+YJXXhuK6T2S+239zTFzvjfyO6XVvsXYSR1+KRK1F6lux7jvBx
	bRlJP1jDvpE1Q1wrY7t896edRzP4gDoKJ4uc+l9EAOtXa0cc4BINsvNs/otao/JufdP7lAYWP0Y
	OUfMA/EXGoq39mt6p+dYof5/ImkamJLVXtMryJ/dVWdMOpvS8jEu2wGS8t58=
X-Received: by 2002:a05:7022:ea48:10b0:17f:7280:1332 with SMTP id a92af1059eb24-17f728014b2mr2812339c88.40.1792031907342;
        Wed, 14 Oct 2026 19:38:27 -0700 (PDT)
X-Received: by 2002:a05:7022:ea48:10b0:17f:7280:1332 with SMTP id a92af1059eb24-17f728014b2mr2812282c88.40.1792031906536;
        Wed, 14 Oct 2026 19:38:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm51217017c88.15.2026.10.14.19.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:38:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support
Date: Thu, 15 Oct 2026 10:37:11 +0800
Message-ID: <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dDnK_VQEKhxdZPASxy2pgbLDg5UOo8oD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX1EmQ2xn1+PNG
 zsWOqwD0bySG7JZ8BAxuh7w1Ciu3CCFu5jWbXFvjWxPAAFiFCFkE3v/jqwZQa/CVpLcZZKRMM+/
 fm9mgRMWo/ubDpAFLt6pN2I9LuV/x9U=
X-Proofpoint-GUID: dDnK_VQEKhxdZPASxy2pgbLDg5UOo8oD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxMCBTYWx0ZWRfX0nDdd1d1H0WB
 e2C2KnJSAPVmAcE7UGRlnjtH2JQ1xiYI37eFgctMs3Sxi4L6TIkLVBomz3hfqp9tLqqimFfC8FQ
 +3WVcY0ynujMw9hU97WDFvVrvGEPHoq110LptHK/w99/V7x4wUmHXthzazL/oYwRu8GLbXSrPFl
 NhLfLR62lSq0WZN16QCLkE0Oqlpns53zx2nEf9bLiz8RijbhZ3opTnayB8+ulz9+D/yGBfGMhJm
 hXVM+kemKXBeeJr5QvW/coNxZsk2ZNblZAIUj6tcpaFf3hPbopEalWrns9QoqwCgl9CqinWT0Gy
 TR9kTJ4gsl19DIZxfZqNkWpIclzjzrLaLKPQdiS32g0V0nYof1TmGhE1f5kRuMfTm6jXaNLoabb
 dXmVBWoT06p5QyoYeVca0X4LGOf+XXkeNajWApFVYuJD+YPzx3WyMfCCFmqi/TK300sfQGrPPgi
 ArQtJ45ab+mDzHXHV4g==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad03ca4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=MNDMu2h6GyehcEZcpm4A:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150010

From: Nikunj Kela <quic_nkela@quicinc.com>

Add initial device tree support for the Lemans SA8255P Ride board. Enable
UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
zones for PMM8654AU sensors, and SCMI protocol nodes.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/lemans-sa8255p-ride.dts     | 222 ++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..c2d2dc1019c8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -63,6 +63,7 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-sa8255p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
new file mode 100644
index 000000000000..4273f47c3dff
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "lemans-gearvm.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8255P Ride";
+	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
+
+	aliases {
+		serial0 = &uart10;
+		serial1 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	thermal-zones {
+		pmm8654au_0_thermal: pm8255-0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 0>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_1_thermal: pm8255-1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 1>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_2_thermal: pm8255-2-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 2>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_3_thermal: pm8255-3-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 3>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&gpll0_board_clk {
+	clock-frequency = <300000000>;
+};
+
+&pcie0_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
+		    &pcie0_ep_wake_default>;
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+};
+
+&pcie1_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_ep_clkreq_default &pcie1_ep_perst_default
+		    &pcie1_ep_wake_default>;
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi4 {
+	status = "okay";
+};
+
+&scmi5 {
+	status = "okay";
+};
+
+&scmi6 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi15 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart10 {
+	status = "okay";
+};
+
+&tlmm {
+	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
+		pins = "gpio1";
+		function = "pcie0_clkreq";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie0_ep_perst_default: pcie0-ep-perst-default-state {
+		pins = "gpio2";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
+	};
+
+	pcie0_ep_wake_default: pcie0-ep-wake-default-state {
+		pins = "gpio0";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie1_ep_clkreq_default: pcie1-ep-clkreq-default-state {
+		pins = "gpio3";
+		function = "pcie1_clkreq";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie1_ep_perst_default: pcie1-ep-perst-default-state {
+		pins = "gpio4";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	pcie1_ep_wake_default: pcie1-ep-wake-default-state {
+		pins = "gpio5";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&ufs_mem_hc {
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};
-- 
2.43.0

