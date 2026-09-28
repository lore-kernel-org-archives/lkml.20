Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC213376BF2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565634; cv=none; b=C5MWZ+EmyspJHTDoJaZaqwmd7qfnQXadAAGQzxW6/TiT7BXe464vlYY1RXPv38P/xoZp7klzYnfx/hcSpLJUIKBUP9yrWE5RzYpGVbo2Eap7l30ZOMA+yZmNUAkoxL/eKVptjovRLfoMM1bd3GnWpIs0gEq2U7svQ3Wz72tWcKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565634; c=relaxed/simple;
	bh=hC8FzslIGd72yLG0IEQV2VM9sWQTLpOjDDdY3z1PLo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eRr2s4PrTlU6bqyiy+RRijDUIo2YRGky+bnjzlPbSrN6WlkC3hLGY73UiNuFIEmiYjzH297I1/x2fqI+HZrGK4WAbR720mD7mV1RrbvK+OeSenioPQShbtRK5O1Xw5Le0xeeUkuz5w6A9tEi4WKsPPAtHyRBDPcpxIGwCrb1td4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mg3vf8UR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z33VsUXZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mg3vf8UR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z33VsUXZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S0S86l2169659
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxT1cOjfExoe4PpbLc3S9sWrF3y7yxA29DZ3xY68yiI=; b=mg3vf8URyZ7uuuYw
	tPXXNGkPN1yNeOTG5JJUOEFpxFALmIsmJ13Nh+d2ysltwZuRC6tWYzjJbQzuk3OU
	z79NoTnY5m0D7Dzpv5B0zjjg8tU/8me1YpOZ6exX2uRzKOU5Lc/ZOIgFu30+hTNj
	NuOGodUH3++GpvHNgJVoslgLdCAvqnkQ4yo/dHNKsVumeTN4jXx2F9KTkdHP42JA
	JrOzxAjVnNqvb2ysPTd6HGbwSGtOGcxNchLTlv41kyTjaSQHEij+yw2Wu3Qd8sWs
	SDU5RDPen2al18PsAEc2jLXdS/d5QdvXjPhc3R/S0cNpUfjYn7rHGRni5dUHF2gl
	Vhrc7A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx50scexs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:20:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4616151eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790565631; x=1791170431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxT1cOjfExoe4PpbLc3S9sWrF3y7yxA29DZ3xY68yiI=;
        b=Z33VsUXZNwHHxjyHj4TT5M7dAVqJ4fm7zFVA/6lX4wC9GPT8cCjOVdpXn3j+mNeHmp
         +KJyO4FjnVMjYj4SyQCGkIEHIAWTvhLt+fj5y6wyV6+Ls0RgffFkuOUD+pBH6JC2dvWA
         Gp+yg/v3zImwRa1JPgQrem1667dINS36TMLRGz2ol08AFy/lbTr9TPpp7e7uAXhEiJmN
         oLUgA5/cDJRQD9g2osAOK4ZJuSjLJdItqFBoI6Cf8YpxQ1D+peyGFete0HD/L7TWiIA2
         kLPfjGIk6fNmaOazgxNDxVuhFtiyEwsGtzrkwtIJOglc3hKID9/GJHP8qOpVy4fB/7eK
         0+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565631; x=1791170431;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxT1cOjfExoe4PpbLc3S9sWrF3y7yxA29DZ3xY68yiI=;
        b=GAU7yzATu5uCn/DMcZbDfHdw0aX9VeG2YwBU2OAHh2pIUjUHrunfi8cQs9oVLHTJU7
         mbx4HqI6HIgeQnJ40CZQa/0GqDUZHr4yQvVdqGRdO5L5CdWs1wVJzm5bWuz358bahy2H
         qijACNDT2HHx/aAbZKUiZWbVZAam3PXPf2qHjwzK2hCoBqPmBqJXyXge7WJQIauMSKOC
         mM2DTj2MeMxU3sJjPbngcXCY3TVBxHXiSonNfTnpt/XI/VhPpueBkE8fhCuUcYt1W6iW
         BpJNGbKfiPgduI8a4RJldWm1OpGQYL10j+CoLK0n2GlNothKBERUpfMG18jIDAE869BC
         9ecQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6vYVUGVe2vJYYWeL25kkyXMyjXWUhsqPqYcadWF6bVnbHLcXhtKiGuC5t/ZaR/dyX5/yLoRaXvuEQ4YE=@vger.kernel.org
X-Gm-Message-State: AFuF++lbzPxhW/SibcSMSp+8oEazeSZ5e7Uo3AOOpkq0jNSdSwIPbdhC
	vJljBy8qtpzISFR2XGkLRKC04boz/Sh0Zf0vI1eOL/5YAe5OuvTZg7MYYxIxpZx4octA+VLqVw3
	jAIdysXz+5N9P9ZdIpiURi1dgvisO7A3kLCMxk/rB3dkbM2cOX0ky4OY5A/nPYZ/dEN8=
X-Gm-Gg: AYBFou1a0If8AhJkxDw30x0yl0kGvpDLb4LTtzNbg1GZG5b6nRwbkXuowGMRmeZHsIN
	z2fpDH5/70hIDA2PVjt+dDdF56afS/qHIf6zN71O38d1BMtEEZQs+Lv7ML1fwiUZR1Jl4+IFm55
	B1CGT6ezCq79lfG3dFIknBkQrhJqq0tpnSBA1Y0oyi8mnBturmBiN25ldtr7+qLBSZ3aUG4XznK
	gT1Pcp/amNrWDG/KTcpLlF5Y+dUP3w9C5YzAiXvozDQvIr/N8Qyt8edLOn5U6rCIXYgn2s+stey
	QihO8T6lxy5fGNVQiTiOgieywayxHv6aPcuvR3GiiWnDuTbLAmMtea8YAgyLeLmUKYijGtaKLJ3
	ZDN6M5Q5ehzjNOlye5QFxJ/QV32cZucRgx3uzpsAOu3gumeklNqwX
X-Received: by 2002:a05:701b:4245:20b0:130:7246:10aa with SMTP id a92af1059eb24-146ce4915ffmr8009756c88.12.1790565629995;
        Sun, 27 Sep 2026 20:20:29 -0700 (PDT)
X-Received: by 2002:a05:701b:4245:20b0:130:7246:10aa with SMTP id a92af1059eb24-146ce4915ffmr8009716c88.12.1790565628775;
        Sun, 27 Sep 2026 20:20:28 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm21235372c88.4.2026.09.27.20.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:20:28 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v5 2/2] arm64: dts: qcom: Add Advantech SOM-DB5830
Date: Mon, 28 Sep 2026 11:18:49 +0800
Message-ID: <20260928-b4-hamoa-come-v5-v5-2-05940cdca85b@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
References: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfXyiNKbM3krVZI
 0nTXzN6tKNIS29h6YVVlBMniilo9JUXYgy3hduMCUpxBMpSiK9w9PGsOkbYCYlTtwrE1KaSzNZu
 J/bndGL0JTlurwPytLM4G3SOtL8ewBY=
X-Proofpoint-ORIG-GUID: NNQw8Un6ZRgHzOYPvx6qNnqYwShEQIE8
X-Authority-Analysis: v=2.4 cv=WuK+otfv c=1 sm=1 tr=0 ts=6ab9dcff cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=TJUqZQk6AAAA:8 a=EUspDBNiAAAA:8 a=8c9qzvNhB2lAFPWjGvoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Q0W1slMkcave-rSCEGgY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX03jtjHYLh4hn
 /79wmp4uz0beA5K6TDFjVOdIvHzEvMv4jcZ1WboWY4TmYdZPjh/8Cc47Pq4Wt0kWuSdXocS6Q1b
 tQq2OWyNlG8MZS1tHwEXUIezg6RQ3ru9EacASD33Y6/7QM+jJTqrWHWwKGiLuOHYg58orbJlHZH
 KNsfyjRmfa9fspfIirYHgJy4BAsNXvg7iSxuH0ApJSrgiPfZIKnTD1wM3rLHxBSMLr1mYLJzOmS
 xCz/RRsjh9Z3v47RWyjDUAvNBn1/sIuYpihaM6cTSIoi1ihfEQqqn/HBAvyWUDMsgbd75ySi+sV
 2nGQZAqS3Ae5VrJEmKtNTuewCGv/vLrLRSbCFBipSepIZBoim1A5n/0PzhVb2j7kEKe8eJAwh7D
 lieLsmqs6oVFEoX8f18M36ajurFIAc38fJ3X9YmrPcx5O0mvXfbiQOFuF1sQtgADVPeCNlIRD97
 llL0w8HOh1Tn85xwATA==
X-Proofpoint-GUID: NNQw8Un6ZRgHzOYPvx6qNnqYwShEQIE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

Add the initial device tree for the Advantech SOM-DB5830 platform based on
the Qualcomm X1E80100 SoC.

The platform consists of an Advantech SOM-6820 system-on-module (SoM)
mounted on an Advantech SOM-DB5830 carrier board. The SOM integrates an
IQ X7181 EVK SiP containing the Qualcomm X1E80100 SoC and its supporting
components.

Compared to the HAMOA IOT EVK, PCIe controllers 3, 5 and 6 are routed to
expansion slots, while PCIe controller 4 is connected to an ASM1164
SATA controller. The platform does not provide a USB Type-C connector.
The eUSB repeater (TUSB2E111YCGR) is configured through hardware strapping
pins and therefore requires no software control.

The initial device tree includes support for:
- UART
- Regulators
- USB
- PCIe
- Pinctrl
- ADSP, CDSP
- UFS
- Graphics
- Video

Regulators, pinctrl, graphics, video, ADSP and CDSP support are
inherited from the common hamoa-iot-som.dtsi description.

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi  |  54 ++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts | 119 ++++++++++++++++++++++++++
 3 files changed, 174 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index daf9e3f895b8..281cbe6c402b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -27,6 +27,7 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-som-db5830.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi b/arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi
new file mode 100644
index 000000000000..fec6c4d0b927
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SoM: https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
+ */
+
+#include "hamoa-iot-som.dtsi"
+
+/ {
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&usb_1_ss0 {
+	/delete-property/ usb-role-switch;
+	dr_mode = "peripheral";
+};
+
+&usb_1_ss1 {
+	/delete-property/ usb-role-switch;
+	dr_mode = "host";
+};
+
+&usb_1_ss2 {
+	/delete-property/ usb-role-switch;
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts b/arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts
new file mode 100644
index 000000000000..1697e908fc39
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SoM: https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
+ * carrier board: https://www.advantech.com.cn/zh-cn/products/1-fc23ff/som-db5830/mod_16b1a718-27d6-4a4c-8684-e8f2a8e9c57b
+ */
+
+/dts-v1/;
+
+#include "hamoa-som-6820.dtsi"
+
+/ {
+	model = "Advantech SOM-6820 on SOM-DB5830";
+	compatible = "advantech,som-db5830", "advantech,som-6820",
+		     "qcom,iq-x7181-evk-som", "qcom,x1e80100";
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &uart21;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
+&pcie5_port0 {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+};
+
+&pcie6a_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
+&thermal_zones {
+	gpuss-0-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-1-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-2-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-3-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-4-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-5-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-6-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-7-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+};
+
+&uart21 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};

-- 
2.43.0
