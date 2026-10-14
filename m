Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE7B474267
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960100; cv=none; b=Y+KEJ4extocIa61EvXld+XCZgM61YOQGAdqQoqY8cHjFJVVWa84ycDzkuV0HbguYvbHPzb8hyYPwTODgsFBC/EOaiJayHhljoFK1PY2nQmBR/tBPzh0ElGyqXdlTbTe6k/wnudxkQ/rP6yXLcao2uEkxC2JS6Qda6f+ZosBEGpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960100; c=relaxed/simple;
	bh=UPLDEhGsZ+ImAmbCIEYjQ9ozJiG8b0nbnadtWt0rEdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qj5a41LvS1/fTbaLFI+wNKhDoR3RPeypJSBu4x/sTlTwl3fyPn4l12xUYuCriXrYpr08Er4hCjuxYimiFRKFRwkR/i/5BAIoeDq6gsFdAokdz3cYkoqgwq+AvnmOjsYRYh5JbJrNO3iMt2fCu2E4o1JKU4walzZccsJUBwvkru4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i6nnJ8w5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ctjuVGP6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i6nnJ8w5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ctjuVGP6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E68Hrm2516039
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVmsV5cKqu8
	ks2c0/AsTLPpOJZJdTaEkBz+8f5CRv7k=; b=i6nnJ8w5ZH2XvkFBFNY6RcnQVuc
	rRBwN7MSQnz4JBhEk8mbmjfO4xrGj2XQH6OamEg4v2O8NaHpP4oIqhWbCGcf0rRv
	6oSG22f/g+BORNDJ0bAwXsI46bCosle3OgiITRmGYxNSxhB+ambcKxR/u5Rej2Ml
	CzQyyNZdhbOAhMQ/sRUMb3g6Oo+i7KuD873uJtfeQb9Eqb2RSLWAnkh+daT4haY5
	GPhfzwY6bWs4id5rGP/dIfoxUzJyzEfRpq77k0z8oGfEsAutB9GmMBKGDB5aS/V+
	nnkBVpOzNdh7n9+ivn/2mJcFZp/Cje/8xe1KONWcNny8Mm1Hjpg2xpfp+fQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4708456-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-868db1b2c64so2616726b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960097; x=1792564897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVmsV5cKqu8ks2c0/AsTLPpOJZJdTaEkBz+8f5CRv7k=;
        b=ctjuVGP6Rd0+rMLyNHoSECIt4gVv48flfzSjr9iYA5OddzHDGQ0rVH9eKqz3ZQGvQB
         kfi+LKpgOCgYlVHdyy1+w5xsFzoMVXwCsz30TcbOfCUzDVdDDkzxnX51Lpb7VFFi5l9k
         OJlkRtUc86+LZZkHjZZvTWJs2+K4InXAPVXOBszR47Uo9SX7m+OKbKDaCR4waLdbqNd1
         FmvUCSI07WifotxoUF/ddiMvk4I1QPKQo5esY1dpKaDlnkmWiN0Oe14rflJo1U+np54C
         buhOH8x/J2af/XAWE8q57V42A6DUP4vddOnrjjoZUHuoFX4qIkw0jEkOl3eCKNJpjt6o
         AM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960097; x=1792564897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVmsV5cKqu8ks2c0/AsTLPpOJZJdTaEkBz+8f5CRv7k=;
        b=DdMlHit+WgSm0vpFWRZh7wDjEOqyQGeC46U+UQrfWMYtoaTqik3m0Usa5eOMzzs8yI
         PGSbr0X+4Lbxn8+A5QDH3gbJsuQLsTrT/bYmY3n51PcgFAKuaFxfK5KbufRiwU6zSlhA
         egNcNPSfbAo38Ef3ocEuunpRs2MPtnIXz6u2aA48DrAURrqdhAyw2mH4K73+y/x55qL8
         iiqKziIvp8IPi8DYWnqcghK1Ame+3MBTECF7JW283QUuhw8FV9gyLYW3fQKNBE96P0jI
         S3zJRAmbAsH05i3jA+EPaYjG8oVeGaLJ/74sb557Ap4ZxWKDzLs5fElAiZlvmNfkGCWz
         WMwg==
X-Forwarded-Encrypted: i=1; AKwUvBz2LzKEiIa3ivnt1W3aJjGfScMqDvV1y8SpFxn6dyJNPeevedKd/g56ZW8apt5X7ypZs9tWi0IgwiPWdis=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKEKqFpRe3UxAhQJ3qtAIsnCtHUzjb+NsmGxP3dHmb9LE0wEdh
	1OqX1iUny86CjkoXyKJfQhBAAJVcrxrMPsgrCaw3S3/ti7CvGDba1GIcG9baOy1P21EiO1Yubwb
	l8rJRIwZpKFjhpB0f4jS27th5MUxQXD9VJENxiKzKIEII75qYdD7OOiCPl5fuWioCKZk=
X-Gm-Gg: AYBFou14EdGs3eXlGy3QJrRsrW+xXVh6zwjuPgth7rUxswPKpW1N5WoOhvichUYQZMH
	Uy+w6faEZbj6DnNBuG3JIEtYXx+InrNeStXF5H0rcjxT2Pk+qoVccVQeDrs4Xzu5DC/nyn8UZ3Q
	Ov4QtsR/2cDDNLAgUxpt/gf6F7QkLaXNj/yNbpxMx4CLrVJvOH3Y72DWyzBvfX0OMvUD1SVgLi+
	Aic3QbR34NmTJBsISkygRqHFNM2/xC0No7Tgw5+QaDNAlOyyHBiLuaBo6UQjfKuAPMdYn5atgOj
	Pa1o/4OJld+pnBK/jfloUSm5kC0O0AE7XPok3u9SJjMaKKFY6iTTuLpMLBdf/bBdK8LoWS8VVPk
	Hc5rS/qWNxhQlM+tUGgZJIGFzg+3U3Vcgxi5sXMltNwksYKfG//9pf4o8OTM=
X-Received: by 2002:a05:6a00:37c1:b0:880:849d:c07c with SMTP id d2e1a72fcca58-89c45375266mr3957153b3a.25.1791960096199;
        Tue, 13 Oct 2026 23:41:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:37c1:b0:880:849d:c07c with SMTP id d2e1a72fcca58-89c45375266mr3957135b3a.25.1791960095626;
        Tue, 13 Oct 2026 23:41:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:35 -0700 (PDT)
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
Subject: [PATCH v5 7/7] arm64: dts: qcom: Add initial support for Nord Ride Embedded board
Date: Wed, 14 Oct 2026 14:39:52 +0800
Message-ID: <20261014063953.549379-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfXy8aNgTsXai7v
 zceFjFCzXeyLHemGBFyVv3AikIoU7HWFWMNC7kWbpxXIEewoJPtzpzdNbndACPdZYk+P30NVS/z
 EDcwp4lrLwZX6AUoz2y29gXdD4PyMSZNmSWAOx0Rhk7mEbGc8PsdfGnC+r0hNGlTitkaSKNlJJO
 Nc4xVb4UK8Qe1piJ3KDJnZrk8a7sgen/GY7XfI7YEqiK9Da737yienQGbcwLfzIFtRa4q6tfNFA
 GPe5brggaxKJkBHm6wCMmxSYYVDtwgGmICD6QJzXw8Zoid++GFVxttiwqyqiQyhFMwFCCUHbMEG
 jkonj0qZa0ZDMdMAHG5GeTPcV4HKFZEQ85NYzWa436X2Z0q+Y1hYPew0zlktfSFxNToDO86flBq
 QBOJPHNFD3XpdQCKmJahR8I/964MJdslFF5XLypNWrcyQ+gXEBbt94ljCYe6qXCR6U3S0Lml97W
 RZKKMZRjBVmQDiJD7Wg==
X-Proofpoint-GUID: AfNASa2vvQ711afua4n6KyDpBb7E7FWV
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf2421 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=23L8-64gBmTLm0DN3gAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: AfNASa2vvQ711afua4n6KyDpBb7E7FWV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX5vUetKBN81mY
 lw1Cps9wKqb88VVanSkGBfKHQQjIbxtrW5eyCL9NHn5JsPGwubXDphwNSNXXdiJcATrThJXH+dz
 tDgQVTPrhIDJqQTOkGwcSNnjc/DXcrc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140026

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
index 88230c4e00ea..b77bbc5030d8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -174,6 +174,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
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

