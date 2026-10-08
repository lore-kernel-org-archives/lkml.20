Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295948164A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450888; cv=none; b=YB2lSIiUaiv/sBc7C9RyAAN/7Di2FBXizLsGE/Wwv8SMOIwh/CiyuIGMilJkD5BDDyx8kNp4iIF6gBhVOe0grPVwigkqiSBXW/M0vYkqnhDw4xz5s45WTuI1Lrj9FuoruPa59U+KbEuxgeWrg2Qx2bjcsQhGNNKo+JFdi7RCRLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450888; c=relaxed/simple;
	bh=VJkOMgSvENtsVUuoX10x2tl2qZs36xWv5Kq9wNEnqig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uwvq30w+EyNTTdFL92tGfmouO1RvmJAfRrXx0zIoFzWig4SAgdV7VfHItmb8tNsa5MdCByKVHYfx72qqi+YfMmlZ8Ksm0jpy/9Ep8VmvEophmvYu1wwsEFFBWJFeJNHMrZtuSskOYZGfAxzwwGMiolu+wXnLqeQo256m3zfAEms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAW6tgRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gw24P/7w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAW6tgRf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gw24P/7w"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KMmJ3307810
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrOrjwOiQxRx2keZSTxuc1gBVtJzKWyzLp+jbXaNpOk=; b=dAW6tgRfLgMbi2Fc
	dVZaVXDz4TvYGXZ/qrMRoiuTrVRd3eSgG3XmaCo+ycgcMxf8siPXYMxRuOjGmz6Y
	NgFPmOlNZKx6lJmqdEIqpD+Pj6O6Mxna38q2LZQ8Wy3s03JwHoKBFuijP4eCKhtV
	fE5JqB1nGe4duCJwE+UqBSoVAj5NNZ+Rm4towOSRZkNjHcx4FAbvd0gxEgDsK+o9
	3r9u4XM3bVNNserCj6ZGx4cY3RzUoIGkRuplStfNrWxBjBKPnGakDXAOzAp8k/DN
	Io2ujZGZJCxRh3dLtdBumnzrYW/cwZaSvmbxI309RWcvLkVqUHAEymKuSKDFSoJv
	T9osXw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg9p8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:14:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d49d8dee1so5344844eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450881; x=1792055681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrOrjwOiQxRx2keZSTxuc1gBVtJzKWyzLp+jbXaNpOk=;
        b=Gw24P/7wWZOYFRDJrqAt/u+2QUbiQS4/BzfIoDnoOQIdRTHwRX293b67WiiqUmrhYu
         C8obHG1UI5ShsAxofIr12sdRMt1w5YHwnCAK/9GUeFDSeiPJifGlNAAvizxM7siAYcLK
         5/j6EjoSvpGBcGzvR39JNYrFjCWao2mvYci9oSCveNyAOhAH8R7P0+D06DkzEoKrRIkR
         HLBRtMWAAFL1gm1ZMwCnde/lCVpB2HLs8/dfchDrjr45xeGeHBTFlYFALtkajSoc01mc
         2mX7IbLjATJ3dmqityPuKrTFQoy8OmOwlWINN+uu223x73FhXn7GoRHnW//EH6uJCQ+A
         z2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450881; x=1792055681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrOrjwOiQxRx2keZSTxuc1gBVtJzKWyzLp+jbXaNpOk=;
        b=gHqoJmuv/0iPBAiHaxvdY3qMGlGMcaVZHvnRz0G3AcJjB5wapjtt+rJs/Lff6z9xoQ
         R44DDzv6ROBCsVYGaxxdK15LdX6fHksVbfeFjE+3vfYPEjlJWqQYuVWcS2wlx713psw2
         v4hr7n+Flsv+owgZQQ2BufqqbjXNf7ogmnValxfHJq89erVHbUx4PZ9SoeMQpqLXTGvM
         rZ+772/eaYHVqDkXaY5g80bHcLITvJo1eFCjS6EmYOwmr/SExsw9CwhOi32qEh2UD97l
         wYsccL063qPUOOgcnKPTgnS11d0c2IqfEzEjG9v8YqReM+xlpzWNGp+dA0pMRZTnKAhn
         VTpg==
X-Forwarded-Encrypted: i=1; AKwUvBzy6lXjbQOdtKPGgMr81QYT6oFtfNjx0I1hhsGP93wRYlAwtvwt1EDjJ6gJzNCofB3EurHA1xXNCdYTDJ4=@vger.kernel.org
X-Gm-Message-State: AFuF++meagpVi5dWWj6mGUe0K+dxRBMIBxxl/tJ1/aNUApdqTv+G1D6I
	JIktPweEmK5HMmxmMh80BQyRzQWAFpGn/9LL7s+QMNLLv8OFupZIHwoXSGnUw+8Jz5fuq2mLz8x
	Z3Qu8ZtvIPbtRxALqd9TDOA9Ejc5s2+ozakA0XOY2umg1eHbfjVm/Af9TvVaS1Xuh5qc=
X-Gm-Gg: AYBFou30OfPkq+zHFiXSNDVFTTgQeb5k1CgnW+r0DoVSeRmpQLgM2fqwy9d3+7Nn5+a
	U7uyaC3H6LSv38TDQIVCSDLLFZxmJ+oPJFFjoGcSMKYWaZGF7o6ga0R1hQx9euIQCIZr9KhxpJP
	/pRtSNJiXYzIgMVidqEwhSO3ebblLg/OL9akyOUCthzYoiLhonmI2bnSBlgonTNnjtECV+bXqGX
	R5ZSeD9JjZHyLVmKvctF3WsmAKJ6KwN9eW2UT88xLp7/4liKHsfDgKrziB68gDHW8vUU52zJ92C
	xSQpfRg4tqP5YMXQAnJ9EE72H94rft2+EPTuNYAEoWxGSFyHbiQ2t9KrKotUW3o9l+qJLvVVc9C
	Of5rBInLpWWaxf4NcoYlUBVG86u0MKdU+yzDFKcn1sHvQfIZhoX3s52/GLEnGqJxMXZTFKeRYL9
	781MLwITDr6RqTJvM9d3lRiQK6+psK
X-Received: by 2002:a05:701b:2096:20b0:166:9e0d:3b50 with SMTP id a92af1059eb24-1669e0d3b70mr1388365c88.42.1791450880683;
        Thu, 08 Oct 2026 02:14:40 -0700 (PDT)
X-Received: by 2002:a05:701b:2096:20b0:166:9e0d:3b50 with SMTP id a92af1059eb24-1669e0d3b70mr1388349c88.42.1791450880031;
        Thu, 08 Oct 2026 02:14:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:39 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:22 +0530
Subject: [PATCH v6 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-2-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: sbpk1vwrWrCkQDYh7BugFfus6yBc7duF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX6YRvF+6x6AJS
 eq59DfC77oe9jaIHMpWH2SsfOL8QzeYUGu55kNFYW7rquxOD0e8j4oP0Qq06e8gyzgblsJsmFuu
 V2ReLkH2OAgwJ6skIg0BH4jUUHM9Mtw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX01Rqnnbe8Uen
 jXHBLpcDPJfpiAknyAohhOkF45sFNeOLAJjJuKXFtGfekZ+84YjMklmJiWkPw4rpGC3CWMF+y1Y
 N1g+NfHIwIhbFIULOGZz+UBKu+u2xWbDraijygdXTHM0WFfxK0v3jVZCm+d5db9MFx3vYd5Ddez
 WDkM0nL0YtliTxGwsOkn1s6CdHX/Hz9iezxiOmuo7WPTTGQQwq8HKAZQKmHQfYEUX2IwLi4rbrl
 myzCaahei/quDQQ9G6eIdjrz5ZGqVnPz4eYaEr0YRQwN5pPqpLzrjgBosHMeTl31njhpWW6T+fJ
 x9JUA8Ue6QnMCAr/uiuYoDbkyk+hofLwEG5hGx24BwNJssYOJoBXxR5GYxPni+dC3eIC3x2koqC
 E/vEMner4c4l+9SRrHVyyYytuwjfvz5104UQ+SycGfrJ8Mh3+j05DD3kaVseLmoyM/Agg4qA+lp
 N8YmdWsfZPjHr1Z52ZQ==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac75f01 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sBhH8NEu279NYU_71NoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: sbpk1vwrWrCkQDYh7BugFfus6yBc7duF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
and include it in variant specific DTS file.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  14 +-
 3 files changed, 218 insertions(+), 71 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
new file mode 100644
index 000000000000..30c8560822b5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -0,0 +1,209 @@
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
+&qpic_bam {
+	status = "okay";
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
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 161b5bb5a7f7..3183182d1cc7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -823,7 +823,7 @@ ethphy-thermal {
 
 			trips {
 				ethphy-critical {
-					temperature = <125000>;
+					temperature = <120000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
@@ -835,7 +835,7 @@ pon-uniphy-thermal {
 
 			trips {
 				pon-uniphy-critical {
-					temperature = <125000>;
+					temperature = <120000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
@@ -847,7 +847,7 @@ nss-top-thermal {
 
 			trips {
 				nss-top-critical {
-					temperature = <125000>;
+					temperature = <120000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
@@ -859,13 +859,13 @@ cpu0-thermal {
 
 			trips {
 				cpu-critical {
-					temperature = <120000>;
+					temperature = <115000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
 
 				cpu0_thermal_alert: cpu-passive {
-					temperature = <110000>;
+					temperature = <100000>;
 					hysteresis = <9000>;
 					type = "passive";
 				};
@@ -888,13 +888,13 @@ cpu1-thermal {
 
 			trips {
 				cpu-critical {
-					temperature = <120000>;
+					temperature = <115000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
 
 				cpu-passive {
-					temperature = <110000>;
+					temperature = <100000>;
 					hysteresis = <9000>;
 					type = "passive";
 				};

-- 
2.34.1

