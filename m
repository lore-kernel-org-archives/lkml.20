Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DBF480947
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791867340; cv=none; b=gMEbm+8cswqqNZ10qG7wyio6ejve7AapWITgdsb10byU1O4LC6emwzW+6LU1SWC4MsWWbQty9sFVxosBTM1k6weruvgXNV0JQ8Wvk9Yz4MUnzb1nne8T5CCu7hjQAoezOabC+Y82+CbCyittne7My7i85qERVZbp3EzvfEnJTA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791867340; c=relaxed/simple;
	bh=5dkfnnJD51SeeZaegEhThVSljf33cHQpicyTq/Loa1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+qBEAQtcndhmI8qnUI2jVBrZaMpmvO7+ic3hRTXWI5hQ4VcI0njnH77T2OWuT4T4N0Wk0l7FN8dtl4mVCkvNnwGcrdn7UVVKc+trPzzUyFv4q6IWm8rdq9i/S1sFXn/YUjs8XFeMbAPNioSvGbCgTOvqihePjnZUtc0+TRhMlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDUPIe8S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T5eyg2U3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDUPIe8S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T5eyg2U3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20nll988787
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5I98+ngzky6
	+nS7Fi6x4NgOpjxaLbFud5EFJpCmhE0Q=; b=jDUPIe8SBUcf09Lmim2C7NxL0NS
	rUm58lnbqbNj9JcvbQtqc2nGTYGpnWrRbIOdkPPUCAozxLU8Af5ExvaoQDU0+1UH
	AphMdBXZ3k/hU1iJoLtHIOdC6iQEFJ5JH7o7jT/LZZVefBeLHgt3lJKDYw45blLq
	IFk2xX1dkZtYT3i7cTsT4D0m7txjtf4KiEj05HpTUF+aQBD03gb4QXKq6wb/04WS
	YR8Of6vzncX1GYlgG2GP7TqNdNff0NoSq3//a7GFD8nD9/51Hm6jTOQE/L7rSjDV
	rkwm9URdYA+Fcmt5t3E9gGB/0K04zZDC41ZWLyO/e/r4T6knO9UYNfdpUxQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hc941y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:55:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8880b8aed53so93314b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791867338; x=1792472138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I98+ngzky6+nS7Fi6x4NgOpjxaLbFud5EFJpCmhE0Q=;
        b=T5eyg2U3jVIEjmJ3F4CmkBLOAesPY7JaNPtBXvre2qigzZzgsnG973orDzzWzwYRJ5
         6EaYRLZUOyT/RpgHNVvxhVvSyOkDMNx71rAGyDl7phKR231ahFUAxqNcVFI+OsCNq2PU
         D3uSQv1aIC8SIautvZgJZ028EkB4Et7ULKmKYH3CUfzg04PNzsUarxh5D7oBiQQT7RC7
         JQPFv/qQgiSl+YZV9T9ECw60bbgxB5UpsYFSkZQmkJZ8EPMoa/4a4J44iU4XGLhiXc8z
         AOXDT74OjMT0fmLpbPVMv5+vCErN4DOvx1XuJo56NLdrDxwWRFBp2xppVyh9Zw7xJQqR
         +gIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791867338; x=1792472138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5I98+ngzky6+nS7Fi6x4NgOpjxaLbFud5EFJpCmhE0Q=;
        b=rJhndEP1eyJLCRqwP6LfXRWRrTIyNhg5+O2hGhuBrsOyNozbygt5hg2a2Xw0DDk/br
         4HyMOKV/R7PN0Mi18Ch+rbq+9rUcLSmzEuHVVM3/6KtxH5tIspT1eEERxUXkj3200AB+
         3XLQtfPeG1Rds67C671QO7tjSDPTsL5VahiySHDipTpGKMtnzNwv3N4TGvGJ7xdRHYpq
         9xLWWyQOvBiW9KR3f38371+80R9EDJdEs1eSEdOTX6iXmVlQ5xyR4a2IwxrzvhfuDI4H
         kfbIttfK46S9c2HLTDqnFaEm4aqiTa3cfKptBed/6t+DxgSvioYtMY655nR2jfpnDEyh
         FOzg==
X-Forwarded-Encrypted: i=1; AKwUvBzTcLGo0YA6kHwkNZUM+LkKqEsIzcvSrzBxTUioy8LADnZha12CP3Z1BrD+QIc6E4528zkeGDKn7eGB/+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYITSyD6mmqRsVA56hBGBnhfQvqaCUTiAqadpxXRe9WgX/iqATuB
	oS0baWnYAHNuVjFDrA6OebsAaM4loCNtOUEBhqOUTgEpfvKnW6sNDZskXOx1d6olqqWnNQ+OJKi
	jExj/LMHum0zRvbTPLkElbMpCMvP+XyB2LTvCcNY5ixL0GQwgHGanfjBzxaG63ByW0kGkLpVkCh
	4=
X-Gm-Gg: AYBFou1da6w9UzcI4WtPOz7d9uLpCHG1tNBmCLs6FfTD4eYAgY0mafEoHy+gD3OO7yn
	B8LA8yrnn88E+zPlGkXjpOdMlM8W4er6bMN/chX6Sh4PCwhYiISbgtKPV1tEKFpzsWd49uA94M4
	IUS6jSIr7a1vew02/UwZcitSs6tTsgTzOvtQSKQATzlBTWgXSqv1YBYYYPVcmhU/uc9Jtel4CHt
	snFPGRV6G8r7+IBFmlb1yi29eTF2D6B7a9JJS3MhjA3ALICobfW9waDojgqXRdes2ToyDRbvS2W
	kSErV43O6f1Z5d6hb9NIuWonQDFSPwjKB1P3/+lvabGNrV1hNXn7EkTT5xhsbDAN0sIq4N7zVex
	pxihTyS/+lXfIXzFb7uAqfHlnV7q9
X-Received: by 2002:a05:6a20:430e:b0:3de:7dd4:e32a with SMTP id adf61e73a8af0-3e16bdae01emr14421852637.2.1791867337394;
        Mon, 12 Oct 2026 21:55:37 -0700 (PDT)
X-Received: by 2002:a05:6a20:430e:b0:3de:7dd4:e32a with SMTP id adf61e73a8af0-3e16bdae01emr14421824637.2.1791867336842;
        Mon, 12 Oct 2026 21:55:36 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-899b738d03bsm2438382b3a.41.2026.10.12.21.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:55:36 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay
Date: Tue, 13 Oct 2026 12:55:27 +0800
Message-ID: <20261013045527.56941-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAxOSBTYWx0ZWRfX5bB1Y/5+C9B3
 YhtJxkHrdYOE2ORYw6dLoSTKn1U5hx0gnUeCN13KDzZz1NSw4Vkvqwio6hl2I5JbMyAj2uoL6N7
 K9Gl5CPfUSTLaM2+b7J7mBXYU7lrDPMDkl3sje0HpH3V43e7DW4f/ly5EAAmyxi0AV+Q1zrB7+Q
 K5S/TmP+7tZ+46AGYayJ2ABAyQy+r/dQ/Qs9xSJi7HfZTTIr47vhDa45RDznw+3H3ABud2/eawv
 1Cr0Yf7NmFPkY2xNq1rugXKmFfyBITblBAVRMycWS9cfUOl87Ln/hejUDGUwTvYurr+wqngiqZX
 bNbVE1QARbH2XIT0DkWb862P7vfEQuWvLtypv2cQ2wrfeD7iVvdMJacT6MymFMta8IGSOD+GSQT
 SM+5gb/JslbcmT1vG9PlIo6eZXoP4DQUX6+zYHBUYsxbn51WFwJGviuNBmDpfHzZCmhibi1Owyg
 a8dzEsIBhcX0on+Y2Cw==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acdb9ca cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=HwT7i5cL4_BIIXZyjbQA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: nK2nMWqRZr_wOCvl-GRvspjbrqroFD8q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAxOSBTYWx0ZWRfX2q+iG8t7rVUf
 SiBkznVTHRP83iiirGTwJRqinksjjal0PBtcAkil3DbCmjFQK6trjHWbHJzIsL0RW9FSPBFqSjc
 p3ghjJqtfidJIF1qp4DkJeFzhllyPJw=
X-Proofpoint-GUID: nK2nMWqRZr_wOCvl-GRvspjbrqroFD8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130019

Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on Qualcomm
Shikra IQS EVK.

Describe the PCIe and UART connections through the M.2 connector, the
3.3 V supply, the W_DISABLE signals and the PCIe reset signal. Disable
the onboard Wi-Fi and Bluetooth nodes when the overlay is selected.

The Wi-Fi PCIe path was tested on a Shikra IQS EVK with a QCC2072
module. The overlay was applied, the link trained at Gen2 x1 and the
endpoint enumerated. Bluetooth UART and HCI runtime validation is
pending.

Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
Changes in v2:
- Drop regulator-boot-on and startup-delay-us from the 3.3 V regulator.

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 106 ++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..799faa32e2d9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -339,6 +339,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
new file mode 100644
index 000000000000..9496c6558eef
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	m2_keye_3p3: regulator-m2-keye-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P3_KEYE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&qps_gpio_expander 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+
+		vpcie3v3-supply = <&m2_keye_3p3>;
+		w-disable1-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 60 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie_port0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart8_ep>;
+				};
+			};
+		};
+	};
+};
+
+&{/wcn3988-pmu} {
+	status = "disabled";
+};
+
+&i2c3 {
+	qps_gpio_expander: gpio@3c {
+		compatible = "nxp,pca9534";
+		reg = <0x3c>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&pcie {
+	iommu-map = <0x0 &apps_smmu 0x0800 0x0 0x1>,
+		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
+	vddpe-3v3-supply = <&m2_keye_3p3>;
+};
+
+&pcie_port0 {
+	compatible = "pciclass,0604";
+	reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
+&tc9563 {
+	reg = <0x1ff00 0x0 0x0 0x0 0x0>;
+	status = "disabled";
+};
+
+&uart8 {
+	bluetooth {
+		status = "disabled";
+	};
+
+	port {
+		uart8_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&wifi {
+	status = "disabled";
+};
-- 
2.43.0
