Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956879;
	b=kI/pM5Ivte81P1EbMdULX1njC1AYZB7DPvh3ltMxroUrxlqYyLz08X8YpOC8HehZECGu
	 5+7yZ7xEt0erZJwo4SXusQuG0FYPwy5JBrAFRjz4VDeRz6rvlaa+DA20jdWm7Fy5RaJz9
	 WvBV01EMXY/x6NUNz8fsl50xPeDS+mL6cbMRODGQuZv9hp8iIByEq2x9yHlfE4JeBAKm3
	 wObksWQNBsuTa3y3Pu8b+o3E7JrTAGN8TQpxe0/D2hCbKF2wbHFWYJYENdn3oSGF+tBfc
	 GYGL7bh34ERtzH/mFFOyXBsmFsFxl1Ai1U2ZtIAMuaA6+ln5bRLN/wR8BjHC/YMCy+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HNUw5+OSh8HvBn9lrlY7AxflSA67dtDxm+JpiDlH8Q0=;
	b=P+pjbzWI3u84P6Scd7XsRJO9dk9iGpSTJ3H80w5DpQVS8ICpydTMg6JPWtxxVa716ji3
	 y8cMmP3pWTqOaDX3hHEdb7sv+WofYvpr3mg/Dei067fZzeG3hBdMGtFLs6LbxebUeT8kQ
	 VL5dyB6C8Nceq+OM8t72qWmfgJsBDVbLxuMCp5gtUx+xb3PiO3NxcL+QYoKMGbiiimui2
	 UeX1dnD8FaiQ7RNnOJyWuiUGJQ6Uw55ja7Z3bMm9ORK27c3Lig/waVZX54vC3IXI2Nf7d
	 GOqOpsRJIbPBosYoMhIs5fa5Ki8Fj5O57HWqhZ17yFNOrOiRzAPwU7DXgJsQ/y0YqcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TcSkQNAp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AbXhqm7a;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A232606D828
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A232606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TcSkQNAp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AbXhqm7a
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RIXd1679452
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNUw5+OSh8HvBn9lrlY7AxflSA67dtDxm+JpiDlH8Q0=; b=TcSkQNApwJR+WG/l
	9CuNxW28z2A0FkwNUk+FYUmbQ+IUm2a5iuSQ28zSQ5apVB9q1PR8dM7Ubd4/l444
	xQy49T+U4+283OtVY/JBn/bNaVLFCHrzX2FS6e+gArTsHCUnNbqw8Ijuh+WW3Zmc
	0TqKxcJD8KbGpXmx+pgOflhSloYHCrEjAobV/k4zh/2GVE9jcJ/WTJ34q7eDSR77
	TnxcrMPt6wlQWG1Evx5mnhsOFGfWdXX5VyU3boBnhOpR2Q+uKtlMUOgv2t+xwkU0
	EbeHqW0eFfvClaO4k/pM3qIOBo/JaZ65YM+VrmS5Zz7IHpDXxYZKi4NCVihQnSnT
	uteiBw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pca2nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso692072eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956878; x=1794561678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNUw5+OSh8HvBn9lrlY7AxflSA67dtDxm+JpiDlH8Q0=;
        b=AbXhqm7auSxBkK/uir1TkQF7CjLgKeVLtHUNZ+sRP3+AX4P3WozWc7Cm3hWU95afob
         1Hck/F6wMORRcqasa53Wf18v+FgFjRNm8FbaBQB9YkwIxiDszIxECcbuheN9zL38Dfbe
         vExYJLN+xV/aBEBuAPdvFNIfb3+FeZQSU2Xp8QE7q8Hhn0couvtrnwAFl9EX/p5pqPie
         D/ulObuGsVUg0hLAYQRQS8mNFUx5UIXI4ARKZCslC0+Ycc9YMREDRm3BV/ctblQDa9G+
         Z92GCpfcUFWGgG6ZwYawf0M0Z8KHt3Q/ujrmVymSrDD5SKsk8VWH/dzVGqX3jDogcqy5
         cWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956878; x=1794561678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNUw5+OSh8HvBn9lrlY7AxflSA67dtDxm+JpiDlH8Q0=;
        b=uWVYFJe9dqCPL2sCEZ5k2OXxLLaYTETWc+ArzjRTdh8GBymZt93qI0vGy3fR19fOiu
         eaVFvysjHRBwaaS445SK8NdCY162TK+O8ySN8uOMaFl5ofXh2J1hWiQYGTUUDGyzfUgC
         wpVJ6AeTKSXGCWgTH6crNgrdYvkL3mIDC47JUkmstdifcXPYBc7N8sv/mjCvUq8dZT11
         XSZXBGqGs+xD6jzcsSjzTVC+RPu9EIq9lcNMaP8v0mq6T7CtS42+1uhYZ9zQpf40Jv55
         owkV2tjk0KWJHVcK7elF4uMdVRkr36FiyiJLTjj0EnYVIiE56GU5yU3uzJBp/noNvSyP
         E5YQ==
X-Forwarded-Encrypted: i=1; AL+hErGWkuVBT2wT1JeoyE/WXkU8Aw8VgXqP28qUi+CDxpIrmoIO9R51iOcPKalAM9T7KZrAtbHuEtDiHRQu6ek=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FDE9A5Uhzm+KUG0DyAEuPCEOtThBvOBY4iDqIBws2hv3l+SvE
	lQbJ1A1g2oZU+gLUFMqgyEvVmR/uuDWooZxETu4Dfj96DQvmMXtzlozbnpM5U5BBDAZA5BEtEkT
	xzDNYtg8F8EWNMugYwcgisJOSeh4rX4mB9WgL7ZrokzZyouheF25wC8KLVKjJMSrKveQ=
X-Gm-Gg: AYBFou2Y9NBwV75IYoS0CNgN4tvMEZuCXmFURoFTyhbeqCopeljKPgSzm2AxXhmEl+w
	X/TN1RnHCa7BLZTYDoGNmK6sz98Ib8tulFQ1Frpqb6oMKHzCkUBk8Jab8pBwxW4h/3q7ikakYn5
	rV87rI4T/VqRUA6/EWrFdSuEqcgh3bOI6fAnUenAuwBIjkvKNND111nYBu2wtzjXzOMtwecuNhk
	jDrdRFudEMLNZ6Uga7wHMCAYzfgaBguNA1/ZbW7tScygVIxY6IxJd8na1bOQIA+WWlAeoz7Oqx3
	xy9VU/pNdsTbV1qJEVghzmbFa2sBCNF0etol+t6TOtRcSld4nb/Qa6F+PsffmM6rOasDu8YtVpK
	HVK8cG+QHbmqFd68S8hZEF/2FHNNUrAUpCCQlUEosnfc70akMZf8Z3P99u9o8xYVqz8WyVOBZzW
	0sS0RhBSGfZr0VA4/q87mKm/Bu53qsig3v2gBovQJ8ZrxhvlnapVGeG2m+3VxO01V7Uj0ZEReHD
	QzXtg==
X-Received: by 2002:a05:7300:f3c9:b0:365:d42a:f415 with SMTP id 5a478bee46e88-36f7494d0bbmr2469701eec.12.1793956877726;
        Fri, 06 Nov 2026 01:21:17 -0800 (PST)
X-Received: by 2002:a05:7300:f3c9:b0:365:d42a:f415 with SMTP id 5a478bee46e88-36f7494d0bbmr2469649eec.12.1793956876861;
        Fri, 06 Nov 2026 01:21:16 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:16 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:51 +0530
Subject: [PATCH v8 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-08-dts-v8-2-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: QdE5PRj6CUcfsuFEg0K8V0YccnZ4l4XC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXwUrwkJdQVyWg
 Y0sQP3Rnx9fH1ddzsKDfVMelaVfCB/Uo0ZrMO7nqwOOKCiz0Ql+Di4yisS9IwEUjjBUmKK1S8KX
 QDsNsh580aTT0WL3PVeJiG1wzkEhtNzqyiIGRpa8Y5QxiY8j19wSkAgZgvs8kepbr69keftq1BU
 /PdbWK/x464BS/bFbLrZTT+z3S7YiHuo1Vz27YEn025/syWFsrsevzBR3Q+ZgF4lVrYjg2jQl7x
 N8JYbRAcL6KtaAHMr14qa4sSD2PvXE8Hs1xYuqQs43UEG6Xp+2U8IZiUNKxsbejWnRl9OIqNM49
 mrb4E8qrUy4mWt5E07kGObZcNi9Icm+hYNilxiSrPHdAXMgSVIL3aS66r/6G8Z8r43f9eCvsoMF
 kbKkKTc8pEldJT3iVbEhXjMJMlgEKMsjZxNXAifJWNbVpQrRONNMUhhYeNK1TesLPXbyap1hsjR
 1yCaRNrzd1sjg+2f0vA==
X-Proofpoint-GUID: QdE5PRj6CUcfsuFEg0K8V0YccnZ4l4XC
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed9c0e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=H1h1Rys4rTy22MHYZdwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX8pq4Hio93sDE
 n6qRtifsnsA04J0VzhTTEAzEQ7ujoM/ICSXuxjJCFnfIriLss80IsS1GSKEQRIyuwD5pk/L2lVX
 m/Afj5SJNHY62y5TGeS+iCBG3VuDCJ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
and include it in variant specific DTS file.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 205 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
 2 files changed, 207 insertions(+), 64 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
new file mode 100644
index 000000000000..36702bac331c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "ipq5210.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	vreg_misc_3p3: regulator-usb-3p3 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "usb_hs_vdda_3p3";
+	};
+
+	vreg_misc_1p8: regulator-usb-1p8 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdda_1p8_usb";
+	};
+
+	vreg_misc_0p925: regulator-usb-0p925 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <925000>;
+		regulator-max-microvolt = <925000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdd_core_usb";
+	};
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&qpic_nand {
+	pinctrl-0 = <&qpic_snand_default_state>;
+	pinctrl-names = "default";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+	};
+};
+
+&qusb_phy_0 {
+	vdd-supply = <&vreg_misc_0p925>;
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_misc_3p3>;
+
+	status = "okay";
+};
+
+&sdhc {
+	max-frequency = <192000000>;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	pinctrl-0 = <&sdhc_default_state>;
+	pinctrl-names = "default";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&ssphy_0 {
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-supply = <&vreg_misc_0p925>;
+
+	status = "okay";
+};
+
+&tlmm {
+	pcie1_default_state: pcie1-default-state {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	qpic_snand_default_state: qpic-snand-default-state {
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "qspi_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio4";
+			function = "qspi_cs_n";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		clock-pins {
+			pins = "gpio5";
+			function = "qspi_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
+	qup_uart1_default_state: qup-uart1-default-state {
+		pins = "gpio38", "gpio39";
+		function = "qup_se1";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	sdhc_default_state: sdhc-default-state {
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-0 = <&qup_uart1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usb3 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..e5f2f9217f3b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -5,75 +5,13 @@
 
 /dts-v1/;
 
-#include "ipq5210.dtsi"
+#include "ipq5210-rdp504-common.dtsi"
 
 / {
-	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (eMMC)";
 	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
-
-	aliases {
-		serial0 = &uart1;
-	};
-
-	chosen {
-		stdout-path = "serial0";
-	};
 };
 
 &sdhc {
-	max-frequency = <192000000>;
-	bus-width = <4>;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	pinctrl-0 = <&sdhc_default_state>;
-	pinctrl-names = "default";
-
 	status = "okay";
 };
-
-&sleep_clk {
-	clock-frequency = <32000>;
-};
-
-&tlmm {
-	qup_uart1_default_state: qup-uart1-default-state {
-		pins = "gpio38", "gpio39";
-		function = "qup_se1";
-		drive-strength = <6>;
-		bias-pull-down;
-	};
-
-	sdhc_default_state: sdhc-default-state {
-		clk-pins {
-			pins = "gpio5";
-			function = "sdc_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "gpio4";
-			function = "sdc_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "gpio0", "gpio1", "gpio2", "gpio3";
-			function = "sdc_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-};
-
-&uart1 {
-	pinctrl-0 = <&qup_uart1_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&xo_board {
-	clock-frequency = <24000000>;
-};

-- 
2.34.1

