Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19304B2032
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444469; cv=none; b=bv6rNs70Rpv8JBUolTaj6NW9Twt0gmqdV1iSa8lYPBC4pLDkRvYHAAA0u8XBAwN/ETfFjiSIFq006gQE/u2Fk/lNG7OddJvVNOuNjVyqeERlr9BdWc2DBgDpvIxBd4eoh+Uk0la37k6lUntB6hrHoHNvNYbrIFiIFxmrsOb8A38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444469; c=relaxed/simple;
	bh=irQo3icUiia52VMaX/Rf+vvFkeel82rEo8nIJdwP4hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IVL1EXWAC8lo5Dh3pzX73BE//r6p0kn7zI1wOG8AH9QhCFf2VbL6IoC5RG8ebYJkxe7q8ut0qKXVm5bx535CyPrkLFD8sJ6B/NkMPjGojmR7oMZXHCKuiz7zzpZEzL2o0oRtJYbSNNuLmtVuoeri+6IRouMHQ+5wXDNG/46D+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAoduQ1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T11NKiTf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAoduQ1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T11NKiTf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DA61U1704805
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 14:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EZM+TFCkrxk
	33iVEdleTA4Oed2R+EN8/tz4eEc8QWcs=; b=gAoduQ1J9/mHcNCNK7RO9Q3PeYZ
	CWS+YSnZymXEKaz3IEa+O4yvHnm5BnPkoXYwiSefNBw09M87wXVSrCf3oIe7WAq/
	iBplD1whLDIz0bn8Xnu+YCtdOhzRDkJWH8LDnv8BTKfpvLDJx/JDvF9eEnaHjxBx
	fT/AxPY+8m9XqWAOOPW87OwmEF1ztYWQMo0Jn01x/FPlGtuhikB6mb2UVroYJUQM
	YDbkz69vtrmVEBcLZUVsnCIWICXYBBwT1F28k8c5MjmNG0PFFuRP9P2CVZlFUU65
	3zOCkLhBJqG+qJ9GjnIJSved5NJa7IBIxki2Bw95WGRAkRM+o45Oe6VxJrA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b189pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:07:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db050d469fso8231115ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788444454; x=1789049254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZM+TFCkrxk33iVEdleTA4Oed2R+EN8/tz4eEc8QWcs=;
        b=T11NKiTfWJHivq+ad4wTF/qBwzcka3plSteJ8RFQn57qXucNPHxxTKjxC8U6x8p24s
         FtgVtUIhQjHfIBNFafhnKf8r+jr9zgGW9Cq/TJlvNXA7SpgYemBDDMYAZCve6bzeEDsx
         2d6obp3gYVqr9swa8fxcPKQjQWXc/9FnKqUyjbBQ+GG+/g5JAGjwR+ikLgnlQuYH3lLj
         CPdywevfSu0IEKsZTlfzqfBOLfZaLXYzXxI+zQ+hTVZGaNbm3SPoW87gnCtN180vHI0m
         UGGh2k2AW5A00avsXJXR5CJTO/TQZgvzBKJjXxury6J4pzJs0on9717OuayMz1WTogAr
         uw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444454; x=1789049254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZM+TFCkrxk33iVEdleTA4Oed2R+EN8/tz4eEc8QWcs=;
        b=pwOr3JTs8cPk0wy1pcvcdv8gOdy8OFsStEy7n1N+QBVGOFQO/J678FYzNVFPo01AAt
         jsBCb8ab6MPE9jfjWPxhPIRPqQyBDtw1LZH5kT75B+k+ZWV+CHG8vU/HJ8fqzvispyvz
         nAgcdnW0ykpWvKxyEMVOin4E/3AwJmZs/OdinaQMGLCeLENj5zrg6xnfLV176VeBH8h8
         C0ZT1PHociJUKKzFJvha3CUfrWtGn5ecQzZ0DQMNSafxO52c/Zsp6u5N2dcMhjK8K4D2
         7xWnPOWLRzFOpmlLZHGLVRSJDItaFtqlwf/JybuYFEzY9jOiJ2arvisAv00YxeWuyGs4
         GnBw==
X-Forwarded-Encrypted: i=1; AKwUvBzZ+2H5mGsn0L4dG5NaDayHdqxu942dqopKLzaZGv3Sei7F8Rlft16CMuGlQ8grlGuo0loXWI+AVdSVpzw=@vger.kernel.org
X-Gm-Message-State: AFuF++mzJCvPtDRDfCzNc8KDfYOW8gzdTrs5vJNUu0KoLZNCXJRfo8M0
	e2iNWHgswvDUQzWjO1DKFW6Bi1F4B4XxpwwjDr476b/Oh8ivmpWMNyY4i40tY/YR/Zcwh1ThhAU
	1HVi6eKfQS01a80bLywbI/2mgceON2PIsTiUnBn52ZfQ4GBlez04gEeh7ROE7/hcUh3A=
X-Gm-Gg: AYBFou3Ahos5eiOZzvlQQvpcnlrillJHIG22BPqqAJ3/+AsqlGCYDDyo9VhHwFirnKp
	ZeVNvSy7msKk2Ud26F4udHRCoFjLK9ZedUm+tonxa794oCffwk8fk/+mXuvDtKEgeuJmlqfyjz9
	/clt/gWo9LLmhKNIqjymqwwnmNRNyjlrMEUgGRS25i2eAkYjb1z1hcDx4XJaLo9LlzDcwSCXr1W
	WTLn/yOobbGnsvU09+vffViQdOHF3dB0yIs7HuM1+ImjuDWe4B6qenCghu6ho0+bxFmd5C1QCbw
	fP6HaR4dUouswBFRMQXCeP5p6kAY+cZlKEj2+eDK892eOppxTY7wegYjagcegbMCYctBU6fomaP
	baSfYrNzoA8dhUwMdRveefI+45qJ5H40FgmGIaZRHKjwDaPT3a4QmoAUERe/h
X-Received: by 2002:a17:90b:3cc7:b0:398:b1b8:4719 with SMTP id 98e67ed59e1d1-39b0881dca0mr6763944a91.29.1788444454093;
        Thu, 03 Sep 2026 07:07:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc7:b0:398:b1b8:4719 with SMTP id 98e67ed59e1d1-39b0881dca0mr6763799a91.29.1788444453469;
        Thu, 03 Sep 2026 07:07:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431994fdd7sm6809098c88.10.2026.09.03.07.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:07:33 -0700 (PDT)
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v14 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Thu,  3 Sep 2026 22:06:16 +0800
Message-ID: <20260903140617.441111-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
References: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lCs_guaWmtMeXk0YHnHgYShvyZveic-U
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfXwIfQskeqvijR
 /lLlAsnKMw8Da+k043rfH1+3tOVVeUijNlRUd6A8YvxqSDpgTtKMh9UhO3cWsAfILW2yfaHCRJ1
 LNnaTtJZjoJbDAdK2r7tdXWkL9CeL38=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfX0vu2ry5sK9lI
 XUOgwxhhGD2Okwtko/squNvR4klDyQARho2ZLRvY+F+9EqsVOE9sjyh+YIFIsQo7zCwuv7Lm2z8
 mKaBB8KobwtgzYEegrD1Kc5AtEdf1gBHu9SP9+EisLTi7E5NKEiWwG5jhP3re1CqkgLEU4OqW6g
 WDERKmvPirkmNsqtcEo+Kh+yriN5lDNCr3uffidBE3FLzjMsC23n+MOelIXZIBBiWziRRt8zDxx
 McEQvweEWJmRiunSHAkbGJ2KGxVn/wPBw2TOtP9XsMSbYs6GDf6pdgfAoVaaPhE4yswBkzqUJtN
 3URkumLyTTQaNeK9vlHpW/k6YlnLxHyxacQn5O8y1KWi/8eoSSTqOvEoYJh+5SyiDoBiC3UhsBp
 KrSegyvbFkACuAAHQBJeMVrfQCnCc0gi/tcxDssFXRx7x5QN6ctPCjvKuxcc7XFUgLSN9AwvbFH
 q1YxXSV4S990HxhK6Xg==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a997f26 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=F1QlHIOeo1lq4PqRBw0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: lCs_guaWmtMeXk0YHnHgYShvyZveic-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030123

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add initial device tree for the Qualcomm SA8797P Ride reference board,
which is built on Nord GearVM variant.

 - Configure UART15 as the primary console and UART4 as the secondary
   serial port
 - Enable UFS storage support
 - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
   all sourced from SCMI sensor protocol on channel 23

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Yadu M G <yadu.mg@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |   1 +
 arch/arm64/boot/dts/qcom/nord-ride.dts | 254 +++++++++++++++++++++++++
 2 files changed, 255 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..d05920a0d5eb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -160,6 +160,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-lilac.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
 purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/nord-ride.dts b/arch/arm64/boot/dts/qcom/nord-ride.dts
new file mode 100644
index 000000000000..1af4117d24d7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ride.dts
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "nord-gearvm.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8797P Ride";
+	compatible = "qcom,sa8797p-ride", "qcom,nord";
+
+	aliases {
+		i2c18 = &i2c18;
+		serial0 = &uart15;
+		serial1 = &uart4;
+		spi16 = &spi16;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+};
+
+&i2c18 {
+	status = "okay";
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi9 {
+	status = "okay";
+};
+
+&scmi10 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&spi16 {
+	status = "okay";
+};
+
+&thermal_zones {
+	pmic_kobra_thermal: pmic-a-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 3>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_0_thermal: pmic-e-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 4>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_1_thermal: pmic-f-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 5>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_2_thermal: pmic-g-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 6>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_3_thermal: pmic-h-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 7>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_4_thermal: pmic-i-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 8>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_5_thermal: pmic-j-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 9>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_6_thermal: pmic-k-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 10>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_7_thermal: pmic-l-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 11>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_ufs_thermal: ufs-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 0>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_kai_sdram0_thermal: sdram0-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 1>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_kai_sdram1_thermal: sdram1-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 2>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+};
-- 
2.43.0

