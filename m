Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458199;
	b=nF7te7T9O5wwwxxVPO8mCGn1DD36J2fXch5B/pnTwzbz84NV/VYsraol/OUqWQW3Q7KF
	 z098neI5CJBXryZ2nW7SDF8ASxuahi7Ecxmku4XCs5JM77xShDIijHBAqpXYI839GYSi1
	 t0HRb9OP1YbkPjve08MWmrGURQOS+dogt+Lgeu9/9KldeHCduKpxqCVMW8irU/TrVQOLV
	 GtJWTGEUG8kRxUnnAIcZTilLz+KfhlZW+iVC8T9bI2BHRCFfjHrEsNH+g/B1TQx9B3oMw
	 vEkgC+jSuCsAJt5j0b8LzxoyjBHUI/8ngiAXzuo6Ya8pDx1OCf+6O4So+1NaD3AG6qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H0eWptuviHTuVUkbdwUfGOyXMlnjmZQuyeI/I1/RaXo=;
	b=zGIj0PqN3+i+mbWR1k3vSdbiezMoVB0FvtpVFFq9RMiSY7hNnDWIBSTa8clAA04FgGeP
	 nDzOIhKMQMxk1q/ixS5KAciFTSH/Q328DGJhLIwyvg0ytXNm26CY843BUCr3zDv+/hLNV
	 a2c2L6ewVMv9jHX1Lm/E86ydCRRrBtcSEuFw4xXlzGN0wbkegMfPsfCNh+r1q0KwpkbTd
	 j9EFvAXlO0Y8f8CRMngE9Lu4zXev9zCxiX4fhDPCz9p3xBHyh/W9CxvCaQIg1w+W9xc+K
	 gFhNLbL+PAln/vsVS6Ubz6ZOAkaQzeAeIoczdVxL0Fm9CQ+PNDR/bey2JZS+/53gACA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1p18bIZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQ8T2PXb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0C6606B68A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F0C6606B68A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1p18bIZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQ8T2PXb
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZVEb597313
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0eWptuviHTuVUkbdwUfGOyXMlnjmZQuyeI/I1/RaXo=; b=e1p18bIZXnvfBQgK
	KvqaXZNmW3YA/3qFkBJ8cC6ZaJ+OROf165TNNZ2riXUu4Q7EjyeTJNSgWXG5a15U
	NWgVK8pkLZWFKCA4rHj3cE6kHmdoicdv+Sg9e3xV2GSp5rPGbLzHhzPemm5ve3Ew
	f4merjafJ4XjVq+3u2O1iiBfpYfQDFvoaaguRTJnQpSX0QhA/BFy6AsAkEXksJQ4
	/IZrRoO8vlwUpuNTpeRzgr7LIUbR/7eGFmvK43EzqAebTQmlC3uwkC9vYc3aePb2
	Is9lS+YbUOKMmA11ECjTXqZ+F0g43F8TyyOE7FK2MgvqDOFXlk0SSbrb0tk8kyYI
	AWOUaw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1530yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:37 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1327415eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458197; x=1795062997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0eWptuviHTuVUkbdwUfGOyXMlnjmZQuyeI/I1/RaXo=;
        b=gQ8T2PXb2HtqvOBJ7mJ1ztuyzH5o4xoEcAD9OVIDIZApVBoVNEU5SHSI3XKbjYY9Ts
         BiPDH8T4WwoGxG95e8MCIiwx9DvP8LLtunXjHOiCIRMNOxQy82kzPdDo8YVgLXc/e2hp
         Abu39LgCjDKWvcDD9dLjnWm9Y/D8GzMn+3Y1MWqhoKLURQBn82powW60P9HRta/tsjjn
         AgM0K1kTCWd08vB72ZBk089O/0OL6TEJM3c5eYuLwDs/WjgiWyzd6rNIx6wy46zvth79
         /NAOLHpP56YEDbH4eSu3f6zMwuUdbsuFs2NCF1Z1nVE9+Qp3CxU0cB0sdnlu9W9PPUxP
         5dQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458197; x=1795062997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0eWptuviHTuVUkbdwUfGOyXMlnjmZQuyeI/I1/RaXo=;
        b=ehMuKm40nGH9MGdW2FCQWTNBi209T1dNaQHTvTE20iNMiiosOMNGCy2UOZVnvDT6Uk
         LlRxtXSkiCHs3p2CiGiPN5+oqKtcL+mu7jf/BkUOhQ4AqbtM+eRhs1W41nSYTV/2e6mu
         eliDhGfZzzq82tmXxU04EF6Ne6MMIxtnFzT2NYFhQLy4IeLaVJYBTiVizIlcxhWQ2YU7
         bpzhtiifNKtf+ecqnQ1XwrBa7l27WI9qKbhBnMIdWeMy63+l1WXf6He/yK/AUvcWIrRq
         nbVvqGR/GFyyf2RPxZh696N08Z7MH9dosDJxwSGlbpZmUcqawbAQCVQrmYt003RgZHFY
         pJAQ==
X-Forwarded-Encrypted: i=1; AL+hErF6sL3dmwMBANwY6zV2XCuGRVB4hjKRqF04itqHeuywWtopJTLYqXRc/aDxBO+gTDkl88M/bJiI5R75ikU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ciCZlnH9K7YIfb8iW9uDbHHPMo+ZireuHkRm8uPSG3ALC/9Nh
	b+eTkV7M19Br1lSNvbbNghDilSbzuyGVsr6z2TLE4zj4BLktrdHoK3hSdgqtvN4izwvehl3S0YJ
	Z5veNJnOsmga6eg9S6KELj6nV7wRxHafmMRiPS7i5xLM6ym3dv/US6a/Jbf/+ug6vwZg=
X-Gm-Gg: AYBFou10NB9/K/H6NHZMrBBW5XxqqU3osVs3YuBvbMgrWaDB6D3dF6muV8FcIFRW+WC
	cko7oFDZVliSAQktEWHjOmenBVjXEVKveHYb9S5qy6RVh9EAzyAMOxzjoKQZTEMjbnAtMbaqY7n
	ZpZjiThQ9VcyfCziG16oRqxH+TkGBkFIs5L+UzDacwl2twcg4xpy9+m0lSguHi/dXt9tG2Pt2dV
	T9dAkiDzL5LNfE/q5eDEiWa/S2KC3C6eQU5ivwJg5OHNEMWGhmFnaL41X2TV2QmriOCFaHDI6IQ
	iT2bp85HDwcDazjpIqVE/Fp7GeGeMLX+WJ3iAfDDXoy8K6SGt/kH2P2fWD4q8Nbuo2rabtFPx1Q
	wg+EN28ux/F82hr6umuKg3cUJnYJAJViufg7ncwSWpfGL7fWe3fyQqS+7W+l6MqAW+GcoUKJfmv
	QAQBr8RX8RHG+NBNTRpQ6szfbAZslCRPYZA2Hdj0BS0ej/5YVKyaftA8vssV+p0dKfhLH3CQffW
	2lEbTk=
X-Received: by 2002:a05:7301:678c:b0:36d:394d:e696 with SMTP id 5a478bee46e88-37685e6c8b8mr6973024eec.29.1794458196115;
        Wed, 11 Nov 2026 20:36:36 -0800 (PST)
X-Received: by 2002:a05:7301:678c:b0:36d:394d:e696 with SMTP id 5a478bee46e88-37685e6c8b8mr6972983eec.29.1794458195368;
        Wed, 11 Nov 2026 20:36:35 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:34 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:21 +0530
Subject: [PATCH v9 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
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
Message-Id: <20261112-08-dts-v9-2-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXwAvEf7kDivdi
 zRVM88N3/I7BN+Ez/366pz3pfQyoraGY0uT6/D8SD9Ci6DkwPDrP5TVr9RWhwbLKIiJxX8HpY+X
 6ntwFll29F4OtJWKoukYmsQQlUYETw0=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af54255 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sBhH8NEu279NYU_71NoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: fQHmgOUvBWsR9YlEVNarK7tDE_9aakVm
X-Proofpoint-ORIG-GUID: fQHmgOUvBWsR9YlEVNarK7tDE_9aakVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX67wMsROojj6C
 uc1+awVyaaxWoYoca8Aqo4XYm5g5exsqivGmB3JXF9d+gP4MJsf2hRvG30qD/In3WaiMtYYHfhP
 4bv1MLSGXtl+Qp1F0a2LkxNWwZVlILcqs5GuTjGSPhRY1E5kqvmr/ntInDqE12ieVcQmULEltuG
 ThC0uBOPV11iU1cl6ijCQBhZq3CnzKrVrofrxfQVXn+RYi0DXmxc2H9wwUywU7YYu0NvBuvIGU0
 i1rB2tSAwjX67EiYCdRlkOdQa3qWdmmBfz9y6TTCIDODqXkCgCHHzraltpaohM8mJ0f+ca1oZL+
 pS+A01ww9vkpSlAbmTn8Bj9vw937yQyHEl2zFYRNATxO2M8eHAt4TqQEj8vUNarv5ybRz6IFfx7
 9zHCXQRJUsaFhmrfiuXApXMtLnKr1RwoI/ROXFl6qiGPtAT5E4Nbw4+1rbDqugPHefnWBENIPDW
 BsyN9WRTSjY8hA40+Fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
and include it in variant specific DTS file.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 225 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  79 +-------
 2 files changed, 227 insertions(+), 77 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
new file mode 100644
index 000000000000..6fb8666ffbfd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -0,0 +1,225 @@
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
+/*
+ * The bootstrap pins for the board select the XO clock frequency that
+ * supports 48 MHz, 96 MHz or 192 MHz. This setting automatically
+ * enables the right dividers, to ensure the reference clock output
+ * from WiFi to the CMN PLL is 48 MHz.
+ */
+&ref_48mhz_clk {
+	clock-div = <1>;
+	clock-mult = <1>;
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
+/*
+ * The frequency of xo_board is fixed to 24 MHz, which is routed
+ * from WiFi output clock 48 MHz divided by 2.
+ */
+&xo_board {
+	clock-div = <2>;
+	clock-mult = <1>;
+};
+
+&xo_clk {
+	clock-frequency = <48000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 519307c6b61e..43cdb981a4ba 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -5,30 +5,11 @@
 
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
-};
-
-/*
- * The bootstrap pins for the board select the XO clock frequency that
- * supports 48 MHz, 96 MHz or 192 MHz. This setting automatically
- * enables the right dividers, to ensure the reference clock output
- * from WiFi to the CMN PLL is 48 MHz.
- */
-&ref_48mhz_clk {
-	clock-div = <1>;
-	clock-mult = <1>;
 };
 
 &sdhc {
@@ -41,59 +22,3 @@ &sdhc {
 
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
-/*
- * The frequency of xo_board is fixed to 24 MHz, which is routed
- * from WiFi output clock 48 MHz divided by 2.
- */
-&xo_board {
-	clock-div = <2>;
-	clock-mult = <1>;
-};
-
-&xo_clk {
-	clock-frequency = <48000000>;
-};

-- 
2.34.1

