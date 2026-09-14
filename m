Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC92D3403F5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355699; cv=none; b=ErvGMMOnpiPBEJHiL2d8UcyIfSOlTuRZtPVFZ4yVvUJlRD15ZeaIqQH9b6usyRfhNexpsuwMuWyQTvhlZkOFCtKqQXInerimwyx1K9NclvkFcTodFWLgYSmRFiUknKrXaYOKoIzoIZkIUQfJZXGDqP9FsjOz/V7ihyvuSxrCwMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355699; c=relaxed/simple;
	bh=WRGcjaRZYS9OoWgf49R5ngkI4jnm1va5arqFOgxQXSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghFMuIy73yoKhUgp8HYuQya0xWdNBdTDKAg/D2qWvI9Zaa9EeSH4TkmjPRywW6Jn3k9sx8WbUGFYZ/GcXrrIYzXL46PcATYXZsd1fukMBAJO+cDGtDPFBTjKKe4F2hLPHkVQ7kNe+Cw5/aDxeRb/Nhf8WaWx56rTxROF5Mw4A9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QB0Xg4Vg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVgS2LMf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QB0Xg4Vg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVgS2LMf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2eZls404295
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gD0SZqaHIpj
	MyWHLSquSM/8YirH+boG8QSwXHsg/hIc=; b=QB0Xg4VgR7g7dOVSKbY/gCGZ8Nj
	B4ugs/eC/tax+5rZUbV0jMMBJhuLK1zwNBC8lkVTKCmezv/cQulNYdbV7Ti/5j4p
	kXvHfy4UkpWKKlHny6dIlE5fK+/mnfS68YAKc3CINNdfo13IODpkYc3vXLbWSSNJ
	+aM+plqLWBjN92e5sFtEHNpJE788ovQvn0A+7/vD1BhaNMuR/pHjxFgXuNOTU0rp
	fM2Ov6CBE0bZ/l6gjXjXBSJqxIagqAw14TJ4VGIku3KEB5wqLba4b8UY03Crd71X
	guXkWydVrGzHpdUm0QlVlP9NiCjgJ0gtT2o32Lwr6sgakAiTXJRg9CRnVmA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cmtde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:14:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so3512003a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789355688; x=1789960488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gD0SZqaHIpjMyWHLSquSM/8YirH+boG8QSwXHsg/hIc=;
        b=FVgS2LMfUqOEcrOSOG0+aBs6V0ypX19t0txh4PKB+eDd9KQx6sbPpG6IHutEPdjsUV
         QGm6d0iB5MFzwTCDhGNG9giIW5dzFBGx8uzEM3j6HYaZDxxO4p1z/vboHsHWQ5Hv+L6+
         s17i+6wptUhTKGCZCHDS1MQEZqIA6L/34v5Na3Y+NxDvnTysHCKAB2KJLGynfLSEIZqa
         nngDVYALdrJ/q6l82+WS42cOe1u5ssNt4x5DIwwRlHsy6xkfkmcKIbW8fcM3vewKQUT/
         Njbo8MoHWWEyLciu/UT1StX3nICMF+AJLxSb/34kSuQ7GlwqMVfesjpceaeP6ZBimT+O
         bdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355688; x=1789960488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gD0SZqaHIpjMyWHLSquSM/8YirH+boG8QSwXHsg/hIc=;
        b=BXDBS3fTheA3sRJLLhCUM0GigJU7iVhuTGifQwTElO5RBGZqh3pGWpvqHsQBx5H4m7
         NVprEXh/HtCNSmvgBKW/WSyqTAuB8fkMsZi/iM/0zK3Pkvqr9sx8YhMQ4tIv1yUKEkxx
         YHByhfHy7U5+ZzkKo06ixkrd6aQIJi9J26ctySSs7Mf3MukthJsPKJyPdrjxV4Fe0Ipg
         dTGx+ItYPnNR5rGF5QGGSyHQqDEGma1dXM4vUmS+DpjSVxbhBKOozKj051fx9DemSM1S
         R/BLli8tvUaobus+zjTo5S3VBgbByPZyx7jXEJmQfI6VaBFg6vtp0p7Q/8qBg/EpUN4w
         gHGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxp3jNyeBbUcZ8jfKSc4saULsZ9jJxKf8pd92UdvJX1b4pPxpH6gQlCRiz7f6dq9WFjjuag5JmNIRb8Nsw=@vger.kernel.org
X-Gm-Message-State: AFuF++nzN4Q+VbOVUFsdwj8QUskSK47cjLpX3zZc1YR4s4LzPD9dOBuQ
	K0/nCqxiOly++o17MHs0hZLywk0vhM8B8N0RFLXCqKRCrcKIFl/x6y+WVG6XeTbKnXoM7KMzL20
	HUZRZ5GECNLOOGlL+ZhQcXNc2zzy5zIkQNLMl/gpiww3LNt50PAuI/qU0CLAsWEfH40Q=
X-Gm-Gg: AYBFou1b/4IA+HY/Pr6CRPb+3gjQV3vQJEjZMQXpxIF0PZ7jTxQUgk29p8VZtpLB94O
	KCJkfwlYuMR1E3u44bVK9VF2JSmegMnEiny1fVaEhKr6zhc66I9GgrwAWiIjZVj97J9a+0OpA9e
	AGTIeWmEOrMuQMIuicfUKstrv9wVizIXXxocB2Tfrh3gn7ECpq09Fh3MYkm4kg9BdLX8ovJMeyj
	hkYisNWSAoZpL3uhZ/20NHoEnihDlxLGdhYYmsTV2DkbBpExvHfNqljB0jmrrsaqwgIbz1DTg+t
	KFPyZOW0W/ScdWk9sQzfGjeoqGduqxoP4H/cAmdB134FgBW4Wb4ldKY9gYkC7irTHlLNNI9ZJn4
	LF0WLBcCboOJ2zrRl9XddqEXw6H3CNBxHWNzb7ekjp5PTrVJdV48qxxQUEkik
X-Received: by 2002:a05:6a20:2450:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3db40529a0dmr1180534637.14.1789355688369;
        Sun, 13 Sep 2026 20:14:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:2450:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3db40529a0dmr1180483637.14.1789355687943;
        Sun, 13 Sep 2026 20:14:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm26714231eec.0.2026.09.13.20.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:14:47 -0700 (PDT)
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
Subject: [PATCH v15 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Mon, 14 Sep 2026 11:14:10 +0800
Message-ID: <20260914031412.140856-6-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfXxtfjlE1pH/71
 z/E5j1FTm6P9+yXRtsLTayfxl9aDMcf4cNouZ2nCE+NqIIrHWv/r0uhAcvTTV3imNO5wMdsCkTT
 cvLHHhGQpJ6NfopHIUZoIVs3t9CNUpirE3XT3Z7IZVz8XxMfGBvgLcKo7GnGfN2HrMy+oN40h4h
 ceRHp6WxfwHPqtVipZLrKvuu1RXsW2dLVHoZ/CYwgsYk+3/Ig4p+NmYjRoEi4OAsfYwtiZCk4xH
 pisPWOYZsBb2UYw6JPHJCQWBaVzKuiCb3EB2iFn2kk+lYqSTbT+WsJcznV2H1s98xjf4VMXoJ/S
 4MysketmXhneVa8d6L4N5ErYlT4MpdbERlUCq6sX32EdTAXcCK2kZ+JzW15U1BBA78gmPcEg/mN
 86KeMjj7c5Cvq/hVTDCcj6M5Y4WgOqMM7uSCYKKv0oA1PnoH9JDYmCFmX8XoidjDXaTwAph2cNr
 6bMDsdmgbrK2tw5xEjQ==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa766a9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=F1QlHIOeo1lq4PqRBw0A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX5pGfatKWjFIl
 zgX216HQFf8nzryC607nH6XhIHVnGbLnodWM16Ta/I4M4XPPYslCK+sHmu+/nv57srAmIhjbJt9
 ZY4g19lBi/8Mc/q6Ap/X56FOFron6Jk=
X-Proofpoint-GUID: MiukoZtydZPCIdBwYsKdsdhXuXPptnFW
X-Proofpoint-ORIG-GUID: MiukoZtydZPCIdBwYsKdsdhXuXPptnFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140043

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
index d6547fb18edf..a6b4f02bec6d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -166,6 +166,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-lilac.dtb
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

