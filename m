Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E49F3E411B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697255; cv=none; b=HIwzCnW+iwk+C9ynmbEwt7vTm3YuJVlxZzqCvEoNHewEPopDih7MqzDOYjef/g9WxMKN4OTLbbUVuOGhLJNbM9G+JAnLns2hhGvPG0A55dgmq7QnjLg0kHJOZlwR5Od/4muC2pEyv3nDKXONkrYzZBN8Dq0ylE72VV14NqAPgLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697255; c=relaxed/simple;
	bh=wOmFd7W2vRTdzZ2ydyzkw0eEoQmWrPxB/ynjKrpgmgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtazCXQCrxzrA0+/VGzKt+arUPGnvWlFBwK+io2c8Epa/vRRDxtfGK9olD60wuVK/+GVPDLKpt+eCbaofDrudUQtttWquWRRJQgyNdmkqiE3Xr/MQoJ4tqHonqQmnz9CcvEwCnXiXA+HjPWU3VvHPZXKgG0pFJACdtfnA66fjOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7X0HRm2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GsZTnqWx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y7X0HRm2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GsZTnqWx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqhvV858080
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9UcaikwJkED
	ZnN7uE4pzvFN1hFVsiJ8ctP2nYV2nqAU=; b=Y7X0HRm2smFcEINpOxNiVXKD/FP
	pFENDBItheF53d/r4lL7VvNm3LszESCxkw6hAUY7bAklWGiP0cGdqzCkpC6kM4Kf
	QpEFOKhIIbTNR4gLTyWLv28MW0HIRgjoEgMYwcs1mWmQ8j1xtMBozyEEa95lGqlt
	PMRFnMagsJi+NKFwgClE+CGEwSCJHGunVwuNN3IPi59ovgUsQMcUgj/DwCjZNQqP
	tzM/kSIxCo52Z0D/ZNL/qm4ZDYOqB1V1EcYfBDJ3XoaBYrq45r6lHvfjstFedgXY
	YOrgIzGKizS0LmdgOhDIuTjabyslJ69qSgAvh/rUh1GV0lQQDaL687kv0Mw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0javp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:54:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso1286836eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697251; x=1791302051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UcaikwJkEDZnN7uE4pzvFN1hFVsiJ8ctP2nYV2nqAU=;
        b=GsZTnqWxsE7qPKYKIbV2dzszbNyknEDsxIc6F8pQQFSOEN2nzg24Ialib4f9AWf1X8
         Mqf+8LTIntSNsG442Nr2aBhgdnaPgaI9iwoiN/amhaFi3x7trsx6qzhpud8wbw6uZqoI
         Z9jc5YZgCzQdLpHYZM/U6JwV637e2nHI15XVX+3gsenqWnpvvcBeD5psxHWCQt4/fFwy
         EXHMr14ZiR0zUBP6v6sQJFPc6PPTGKFQ1dc8VhauCJ3Q4g6qBvl7+4asUs7TiQ/DdYdK
         wryvSc9VmHFntnzZ2V35JGId97YHowz3pZyjRoyxCR5c+Nlm1OZfjfYlTqZ3MRRBMFnB
         D6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697251; x=1791302051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9UcaikwJkEDZnN7uE4pzvFN1hFVsiJ8ctP2nYV2nqAU=;
        b=BjrEDtoh11xSKNPpBVXnQQCqv8HZw7HgRTtMq83Fy1vsBrnyP9OfbC0jwG1LE4Nl5K
         GcBQCfo1ulqUBl8wVXFJFIHKsvGcOBbJy17t1f8QYkCiCYmdy+XkjT0WuOHoA5jsF6iR
         JNSMGPzboBBFqZeDYFt0jnIuAIQmG/Dcvirn23AqwnYp/sdmJ3oqW8ThVdGUTudzaPL3
         7Ot/d61fyxxK5P1/RsAGOF1hhk9QfVMaFt1vnwgArwuGZbTj1IBxGVf4wIyIEiP/1JfP
         2KDyOynQicOdqx9yte06vCWaTC6KUfBQdjC0+MZY2TngNQQV62qKgPCbGd38N8lLixwv
         /rkg==
X-Forwarded-Encrypted: i=1; AKwUvByw06Q4lDhAboK2vIKJ21WlsmK1/Gd62/qdz22kfabWif3OPeWw94IUxeHf2DAWuoelsVeCiBw6HyK8Wo4=@vger.kernel.org
X-Gm-Message-State: AFuF++n/0s2CKjGmk19m7qGwtcd0r0daOn92Ufc7rxk/teAugusT0vAh
	ZDvYphG+mYTJrtxqCLWVHdlTnN7VKXDeKTh2iMJNyZNRu/E1QbvBJFR0YtfImw2ceEKfF13s7Zs
	wL2bi+zGL+mOKH/7qH+bE1Qvp6+hK+xz1qWIsUV0/QXW7NCnm84lU4KI4UQyothaEuwk=
X-Gm-Gg: AYBFou03N/P06lWBxBAqENRgWSmSHgdjgfN20S7hFaUCllLuWtrEcyJ83S4XpwyNlw8
	2HForOcZeO5psNi3GgeAHmIWC+9YvJaSfj5ZhSFrzuMbyOzkxcuHOWiuY1rbBX6xNC9AGJFbTua
	fRmdUv3oM3FHp85QJAH2UK60NTSuC48w4aoMG6jUX0O96YEJUojBKXcT7TyUTthsY3krdf5zfJj
	4aqxAE4hQHwK7MRTkhEYC/ojW4CS5mmwXI+6CEOEWOc34zTIBTY0X2o/ICre4fiG87LQn4tqp0Q
	0zw/hY2sLf/fyF8fElzs/9OFb8bRcIl+1VCAdtqae+s8Lghjb0U0ZD5478qy4gXkmcEOvqIUP9P
	klW7lX7txc1yr0aY1xb5WQIHFnH4saiBb6y4MCQKaIEQQ9CauirjAOV4QVkU=
X-Received: by 2002:a05:701b:428f:10b0:148:4522:5607 with SMTP id a92af1059eb24-14b2e0569bcmr3439637c88.12.1790697250809;
        Tue, 29 Sep 2026 08:54:10 -0700 (PDT)
X-Received: by 2002:a05:701b:428f:10b0:148:4522:5607 with SMTP id a92af1059eb24-14b2e0569bcmr3439578c88.12.1790697249961;
        Tue, 29 Sep 2026 08:54:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:54:09 -0700 (PDT)
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 7/7] arm64: dts: qcom: Add initial support for Nord Ride Embedded board
Date: Tue, 29 Sep 2026 23:51:52 +0800
Message-ID: <20260929155152.1898666-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX+Tt/6OMKCmks
 YXvYFNOM0rJFX7s4e0FpysRsh2bDVGcZYKxrArpeuisUTGSeEreECI1vE15w1OWoiUQ5dv6yzMk
 UlxvDaiPkXwnitEr7+Q2XyVL70JO7/8=
X-Proofpoint-ORIG-GUID: kAx3-B6Le74Qp49rNTVprTiAIugazlZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX0E5Gmx3QH5xf
 yM4vHTiF37zssRczLz8DJyt/rXVWM/UrOQsDQRTU15B5aS8Vjt77i5HiKVcjEo/8RtWygLrnA06
 90YP6762Gsa9A95OA4UmjMxtQ7ZAkrGRX+zIcv+F0hie2TUx+zzaAAhko5wmMqGmCD/xGUW3/t6
 /vz4qwV3kEYqQ3DgkIfM/4jddDrdjbYK/xRVyIF9HyUyXj6OYobPqoo+8uXxhye3bzTmaavkjNO
 yijPcLWkxW6JqBszrn11YTEqm4OEO0Eun5LzyvEqUUwEMUWVT8t3LMR3e+ogG1uFnup0Qwd7v/j
 Kug10Ke8Cx18MrWJ4bzxAVX4pdOanZhNiDnS0Rpxyk7OSieQFDBPYk2Ahb8E1JFQK4eFuGpJIw5
 g1l1Ez3NhJL4aE6GScG1FFYOEomRDZ9aMlVrWfhNwE7bbY/3iJduEH33J8UTSnCR0Hp6vw+CTJd
 1VUAAgXBL19rMVfn8Ng==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abbdf24 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=23L8-64gBmTLm0DN3gAA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: kAx3-B6Le74Qp49rNTVprTiAIugazlZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290063

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the initial device tree for the Nord Ride Embedded board, the
non-SCMI variant of the SA8797P automotive Ride board.

Enable the debug UART, UFS storage, the ADSP and CDSP remote processors,
and describe the board regulators supplied by the on-board PMICs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/nord-ride-embedded.dts      | 442 ++++++++++++++++++
 2 files changed, 443 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4e714251d5e6..36bb7e059fbf 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -170,6 +170,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride-embedded.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-rrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
new file mode 100644
index 000000000000..49635695f832
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "nord-embedded.dtsi"
+#include "pmau0102-nord.dtsi"
+#include "pmm8650au-nord.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8797P Ride";
+	compatible = "qcom,sa8797p-ride-embedded", "qcom,nord";
+
+	aliases {
+		serial0 = &uart15;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board: xo-board-clk {
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
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+};
+
+&apps_rsc {
+	/* PMIC A - Kobra_MM (PMM8650AU) - SID 0x0, Bus E0 */
+	regulators-0 {
+		compatible = "qcom,pmm8654au-rpmh-regulators";
+		qcom,pmic-id = "A_E0";
+
+		vreg_l4a_1p2: ldo4 {
+			regulator-name = "vreg_l4a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_1p2: ldo6 {
+			regulator-name = "vreg_l6a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p2: ldo7 {
+			regulator-name = "vreg_l7a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a_1p8: ldo8 {
+			regulator-name = "vreg_l8a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s1a_vdd2h_l: smps1 {
+			regulator-name = "vreg_s1a_vdd2h_l";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s3a_1p8: smps3 {
+			regulator-name = "vreg_s3a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s5a_mv: smps5 {
+			regulator-name = "vreg_s5a_mv";
+			regulator-min-microvolt = <1328000>;
+			regulator-max-microvolt = <1370000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s6a_vddq_l: smps6 {
+			regulator-name = "vreg_s6a_vddq_l";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC E - Kai_MV - SID 0x4, Bus E0 */
+	regulators-1 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "E_E0";
+
+		vreg_l1e_0p9: ldo1 {
+			regulator-name = "vreg_l1e_0p9";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2e_0p9: ldo2 {
+			regulator-name = "vreg_l2e_0p9";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e_1p8: ldo3 {
+			regulator-name = "vreg_l3e_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC F - Kai_MV - SID 0x5, Bus E0 */
+	regulators-2 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_l1f_vdd2l: ldo1 {
+			regulator-name = "vreg_l1f_vdd2l";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_vdd1: ldo3 {
+			regulator-name = "vreg_l3f_vdd1";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7f_lv_sub: smps7 {
+			regulator-name = "vreg_s7f_lv_sub";
+			regulator-min-microvolt = <1036000>;
+			regulator-max-microvolt = <1136000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_s8f_vddq_h: smps8 {
+			regulator-name = "vreg_s8f_vddq_h";
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <570000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC G - Kai_MV - SID 0x6, Bus E0 */
+	regulators-3 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "G_E0";
+
+		vreg_l2g_0p7: ldo2 {
+			regulator-name = "vreg_l2g_0p7";
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <752000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5g_vdd2h_h: smps5 {
+			regulator-name = "vreg_s5g_vdd2h_h";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1150000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+
+	/* PMIC H - Kai_MV - SID 0x7, Bus E0 */
+	regulators-4 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "H_E0";
+
+		vreg_l1h_0p9: ldo1 {
+			regulator-name = "vreg_l1h_0p9";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2h_1p2: ldo2 {
+			regulator-name = "vreg_l2h_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC I - Kai_MV - SID 0x8, Bus E0 */
+	regulators-5 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "I_E0";
+
+		vreg_l1i_0p9: ldo1 {
+			regulator-name = "vreg_l1i_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_1p2: ldo2 {
+			regulator-name = "vreg_l2i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_2p5: ldo3 {
+			regulator-name = "vreg_l3i_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC K - Kai_MV - SID 0xA, Bus E0 */
+	regulators-6 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "K_E0";
+
+		vreg_l1k_vdd2l: ldo1 {
+			regulator-name = "vreg_l1k_vdd2l";
+			regulator-min-microvolt = <904000>;
+			regulator-max-microvolt = <904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k_0p9: ldo2 {
+			regulator-name = "vreg_l2k_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k_vdd1: ldo3 {
+			regulator-name = "vreg_l3k_vdd1";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	/* PMIC L - Kai_MV - SID 0xB, Bus E0 */
+	regulators-7 {
+		compatible = "qcom,pmau0102-rpmh-regulators";
+		qcom,pmic-id = "L_E0";
+
+		vreg_l3l_1p8: ldo3 {
+			regulator-name = "vreg_l3l_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&qupv3_0 {
+	firmware-name = "qcom/nord/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_1 {
+	firmware-name = "qcom/nord/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_2 {
+	firmware-name = "qcom/nord/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&uart15 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l3i_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1i_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
-- 
2.43.0

