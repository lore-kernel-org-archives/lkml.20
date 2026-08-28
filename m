Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3418F39A071
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889066; cv=none; b=SWXlIyf5reogeVjWMmxnMNWccHh3RjSuNfCF6eqHd4TIjt4+XAKAjdB+JWyjZBuYhNf8uUdDLYbhVJeKX4HHHU7wwLfLk9UmBwCkWq5ZMZzGM277JUsB8KbUJx5bTlYoEXpXfJ74/wwOoAaGfyTpbU3if2SWxul/iq7bZ3oeHwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889066; c=relaxed/simple;
	bh=Z4z5fKFl6RgkdY4UK3MsK8CgkpI2A/IXfHSxNjbFO3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUjwRILA1n1FUMzYbDVN4F1OGScQt2pHVlM3GearBkU4+qHAYoV1HZlNv7qXCvjNDloAQxzaWaZCgltYgqEmlSXWp5T5Q1w3HWjhNBu5rlOxlU7i4/+SKWTB2C1TVrdebpHpyIMUKOr2W8Ro3A9ymaGG33GpKDKsQeyIn2VQCvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leV6/+1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jaBgP/J6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leV6/+1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jaBgP/J6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3JL7P1675524
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bQp3zee51kf
	Us/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=; b=leV6/+1oxpMpIWpntqk6DVxmWGU
	SgsVM16qXhGLMtHj8eBZhv4hJQU2IX4otOcejWhlAKKg94f+IBruJchWjgl9PDqG
	ZTzbKGI7eHUNxXrU5CswYu1lW9GsZ3x5cBMJBrt1nvoZ7hZrL7yCCJCtT0g417zV
	Uu0nd5ynUKKYJu+fevzHHJKS7rnuh6HDVzFo4edac46HYHFPLp06t4RxUYC+4Ulk
	V0RyffiRlAA7Kt1kCqt/m0BKTBpTZU3HKchw7lbqRnqnnKAhRFJyr7ZC/h2S6AtW
	RIixcmz2k5QOYPGC4DSMX/XYrOLOk+8TFE+DlaPm4Nl6ItPM5AimV/Ucp/A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v3865u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:50:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so7572525ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787889059; x=1788493859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQp3zee51kfUs/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=;
        b=jaBgP/J6RYfCicwYSWEVDxsr06i+7/kOoROgqJaVi87JDqGUqa8n6w/oRDJ7jXup6H
         zN0iVuJGCqO993pW0ltvo680DfUOfETWwTykxbUW5kdEov2yfyYaIvgwQxjx/WJ9uTfH
         1smLSeCP6qeBLS1yISKU/eX4SwqKoAg8Iohk1H2SAnMV65Qet8Yu4tbWTrmAmYL/Ho/f
         HHn8Io92Lr/eTaabk2QiQ8q6pGCT6lPKzZA/k/Qvuf0oECZo5RZX2nD1YPQhJXCAtsrd
         ZsAgBnF0c/2WMyz40PPG/PwMMF6GgqmiGAb6aShmmtg6L7HPzL+g/4H4Z1p9gQaKj81V
         N//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889059; x=1788493859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQp3zee51kfUs/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=;
        b=jOAr608r+U27FMH2WuIa6aOlOUMS9q4/YBBA9k1HMdmV4U9TeDD/VD5dFvtl1CkUrV
         pg4ZNZESKbAFveX4hyuy3Qd207gw2ifowwKNF2lL+e5oBDDTwzfw85jJfEuvk2e7WubL
         iLcuvT6MC8aDWdoAAq2xMWyTv0IRcVeqFYMZznxacXHXGikDn0by+WJeuUOdf2YXF7BS
         4XQk4ygzFsRTWlhSA8PUrZ5LWiAnOvmgdc2rbwztxljMLJ9W38TVos2hUlMaUCqXhyG8
         nMXeWsPxXj2AEY/x9iXQnw4SqPFQoMP9CWeeLk9lvpEmkRWjF/qOe2XUrvLOdKH3CiAK
         gZUg==
X-Forwarded-Encrypted: i=1; AHgh+RphrZxICreZXbyXuyyJvDvC0830UDbjr0/Wy4881QrkjRo/L5R2w0W0+tb1ABcyobQfr4YTMe9mJbzy4qg=@vger.kernel.org
X-Gm-Message-State: AFuF++lgHpkB/8nRKXqUWDSK+ADfY2tRVILIoHBmZT7yvihpzbqeSeFP
	TjPgXXGWwD8Vfoe4n1Ta0A0aKEjebo5GTBYP9JzLuH4KswT491FJZtHYTvx531aUUay7q6VStyA
	1Q5M/hItUoBPZeqbK/3318KxKAy+A4R646E9Tg9hSPK1vZpFZV2xaxcwMtDj7o1uN/Eo=
X-Gm-Gg: AR+sD13xTPxho2Cn0rRHZWVn4TxZmy8EjYAhyAC/pkNCgZQpDFlaTn2ry52xLJPb5Id
	/xRZSARlSUIIRoTU6/7SFtU7nFM92mPeL9F/ru8Prznr3JE3yvSsmwskcc6TH6rQy8sYGJegOlO
	ZvXLY6TrbJAPPACgcui/roKwGpnmVRNc5vrTr5P8MpoBADNTGuoRF8rADqLEkZSMrM0aiLzyR9Z
	lfeTbQIZA+4ohBH9spKxv1iMUV0SXm3lU8usnZX3h6c54MY0QSjHVoqcCyJB3GDloegH3pvcTJk
	fXVs/qglbZVDut9K+hq1WKpX7pVFqmYMYgQRx2++w+ZcHR26cQumFMTcP0xGOfLpf+ytT9c5Wnk
	PWOkgArNs9TFVxDMcnolnYEHlfK89UhFx4VoW1tH1H55/08b6/YEB3ASvn5gu
X-Received: by 2002:a17:903:1b68:b0:2d6:e074:9cad with SMTP id d9443c01a7336-2d74dc2e8f5mr79395785ad.6.1787889058985;
        Thu, 27 Aug 2026 20:50:58 -0700 (PDT)
X-Received: by 2002:a17:903:1b68:b0:2d6:e074:9cad with SMTP id d9443c01a7336-2d74dc2e8f5mr79394675ad.6.1787889058540;
        Thu, 27 Aug 2026 20:50:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm1133357eec.22.2026.08.27.20.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:58 -0700 (PDT)
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
Subject: [PATCH v13 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Fri, 28 Aug 2026 11:49:57 +0800
Message-ID: <20260828034958.3165-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX2cck4d6d7QQV
 HG4pMX04rtvyEWR0Gl4cMxOLOK2UjaG1y0ENf7kMW9rdcsxi23bZN5zp4YxPlNsLnuWA5RdA8xf
 l4D4VDAEFFvpgFmJXRyPoOU3AVn59Rj3yXaZ71jB2JfMMdvwIjT5vh1rD5OetgkP3u+xE5bTbHc
 IBMlRJaq8+rO6Q8xQWvP48OrsK8T5wI3a1WjmXyWsFkuRlR8Oi8PuhH3gfoYoEc2lzvattj1mTd
 xKmKQ3fBoeNy1KZJwJZac3qBRhXqiHv9gRhCI4DM30VVuQKi4gvhKh9SB1RU7vUdaCFspJPDSFU
 yk1nvkJk7vR2gYfY36H4Y8OU67IuTqm98BHHqZqAKqNnsPkYK30z5z+66qHLywP18LQDgBPO65U
 O6fckRE8MI63ZYMcYIMPoi2ihVYLqlWimnhhUkK0J8+NUyybdsXXzW7/wApp5HmgELcwSS1Ztnb
 8IGBPY1P+rIeMKWZgrg==
X-Proofpoint-ORIG-GUID: w5ZuFXC5dCv2pQvDzQVmZ49xQyM9xz0C
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX+KbIwXfwxIAC
 BZM/wlYCXzjm3lhCbblEycxFn0wpBHYEBEOdaD3oT//iXZmc4pmUienI0LJE/+iIhGRrfFrtd7u
 6Sm4Q8qvH5wyz/noIIFXvEmfIN0XmwI=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a9105a3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2Hjw6vQzkyH4OD-tzjAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: w5ZuFXC5dCv2pQvDzQVmZ49xQyM9xz0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280029

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

