Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472471;
	b=tsnQmRWbRj9b1DQK4fVp5gBNJQRFK4ZUHuZ/R3HvrxHzkrSq7kXanh0IQe1F95qOK6Ow
	 9XKHQsU1ocRSEhBQDsntdQpKNv/DnvCMvKnGPlzcMYZ1ojNWbr2oPtYHOCeXdpWcHtu4s
	 4b4b+c/iN33BFmgLsn7PaXCrjMFPQgdUShLE1kWUQCsw/r5RLmA3JVLR65pEyFyV5UwKu
	 MPICo77BmFm1LcGvLpkz3QSwwin0r8A3CDu/EL4xX6+H401jt/muBF+T9zEnelrT5oAna
	 ++NZd6VaVen9Lgo/YNERzePAZXyHlLu/kVlDi5zhliv+2N3HF/bdVfAxZb6NmSSSrUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+dBN3BYwT/AwSZO/OKO1mYAzM//vF7IgnIsQ77JDC1g=;
	b=mIeho84qyGCDIlVhqmDVGO+PTyBL/1t8J0/dufGadOyZ9sglfe6doUnIjBX3UExX9Wjh
	 V8YCrk2UIAdXvQc6shGBK8D4r3OcsW3zPIB51Q9XYNxlBJ9wmudDcFE3mKbQfw46v6kQp
	 AMHViiietUYfV8a5QUY2gtXm22q/tvLK2BNCHvHh0vpMl/knhNh3dWBm6zoSDMnJxl4sz
	 Dm6kuxUPaKxsqCwYdKsf34CdzGLpNRqG6i8Ve/4E+IpkceiYm0UfLHG2nGlNsP6FFE0ef
	 LeUphIyMNvWqxqMG8PK6W2qYJsz4d12X8F1hRJBLEjIuxCATm1KA/XB+z4XI7N9IF5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QGZQS42u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXC5bd2W;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5B6606B261
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED5B6606B261
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QGZQS42u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXC5bd2W
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZQ8P4092474
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+dBN3BYwT/A
	wSZO/OKO1mYAzM//vF7IgnIsQ77JDC1g=; b=QGZQS42uWHioF6dGt1+XkHDpseT
	lJX98lsKWrgr4tRp4jzfobSkUtRQRtBnCTStpXVYFJkRkIiJBsnJSTnCcS8Ag724
	unc48SkCGDnJAam4phJFC+PmrMbPCe9tVHwDhL7nSyCK0DSOmoynMCdNt1eq6DCV
	yY9neCiO98h0waKcQ6FSLMedBElpGHyj2BFtQFviySvoMdAB1UbTaaWZJBSlgmBo
	XECUZLAS3bD50xW5/zJTjFm/29jeHHkJaVHn3VUxqEZX999yuQSL5anjFIBGfc91
	nLQx8QNtQ4w9GOYkeIZT1msDOLYOjFzy8E4H/ZpxDKMEMG9Xhx7T2uxpXmA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hych-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:34:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc50d537cd7so158530a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472470; x=1795077270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dBN3BYwT/AwSZO/OKO1mYAzM//vF7IgnIsQ77JDC1g=;
        b=SXC5bd2WPN2pFaISLwpgmtaHPS19RxnAlj5oO2g8YiuN5VBcnpRC9caAJQizBUiLMX
         QosuKg+2cGh8j7+TKSgGAjpSnklhCmMJZqFyzmvtR3dFKpa/VNHop8vMYK88V4hvTVFN
         iqsXOdK23AU1c+XE9EjjL7HsEXygBQxEkwsIl5zIp9IUzb9Inl75slgn/xvdmrGDTy8/
         /U8WEsiI63jaqMYK2bNy1yXWuI2o7yxINr4YZulXFDz2kLEFNXez6g07Ai6xnNXkVEEb
         XKHKUlp2uGtZsn8DGVb9qxmbg9LALEVaPIKfksJ2JiV0xL2WF78bO6XajqAnLWTUXNty
         EPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472470; x=1795077270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dBN3BYwT/AwSZO/OKO1mYAzM//vF7IgnIsQ77JDC1g=;
        b=OPoj5JqzqOnMUqDo+tFw4dSad+Qc9b/DXMEqBB3FaqszLO7n8vBnPcRURGcsczIzVF
         iyFTu9PagUGZXBhKSe8HyMP6yqQnRTv3ELvBWDsHMwQSGZeiTMlBe/pL5BwmHLWMPzOP
         3ZiIjbeGQL6qNseBeVr/OjftTYEw2nIoVpWuq7mmSNDON7BlBnw34TAmj261aPpywRog
         eha5CP+utAOnrz98erKTsBEydMt+DL82QYZbRcTSGfn1pllXU6NXPFzAnZxznjeQ8Kcp
         xuNbuIS5GJNDG9RiXhKHf0Xqg0V/g2hCzQdO31KSMrj525jkbypaWlJhY2FiIuMAcFHl
         wg5A==
X-Forwarded-Encrypted: i=1; AL+hErF1vlOaExbyXpt4Oi8ZL9NtKKO/ZiU4s+97UUsUxLbcLiUcTJ58r3dhjtdc51/R03FA0BMAgUHK050YRWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8smL/HEJY6dOzNffsCduWHNAsx4g3aE0dzWmsipif1hUXPR9k6
	b/mhcA7DCd/npgExcZeUFhYH1oe7NfhltkAT8aJtbbLjzD/1CnsgoWLxL6NaTsSWXDiabM8uou0
	DqUbpZSM/c/fPcQe8ka+9RYKdKEocyIg8K+LKkwzpBH123pVj590FJ1Gf132MvUhhW04=
X-Gm-Gg: AYBFou3kON2AP11HYvTGhV9QWx4ONmJq8+rrNRwDQEBueHh671XHemWoAnggy8E1/V2
	Ua9CZnBrqd9U7IfMgJWie4hXo+RSVBzfjHgu4L3sW5HPir1aAHtICkMtmZQygzzZ+ti5Ysmb9Vf
	PmE43QUO9krKc4Hl0uaqz0KG0LXz+pRsCJ9eADRzH6WkEb2OLudBgQy4Q5uk/V6QN7517NPytct
	htyhyq+/UYGehEe2p2y71Us2PlInK22OzDzi0+jEHF51ubW/zsWclTIzXycGHgeXKBdr7ECUI+c
	kdQpgZ7sL0XbNM+e/wgx4rlOm+g+GpCw0jTxls3OlIaZFZ2/jAAqTNo4j1jvA1wE8QSXrUbZvMu
	86aOsmHogFIoqG+lYMAK5ihoxsw/NywoZYAIMC0UAeI7u707voSnWcxlMgvtUGli2kDz18NwrT+
	M/5A==
X-Received: by 2002:a17:903:3bd0:b0:2ed:203e:864e with SMTP id d9443c01a7336-2edd7451addmr81294805ad.1.1794472469511;
        Thu, 12 Nov 2026 00:34:29 -0800 (PST)
X-Received: by 2002:a17:903:3bd0:b0:2ed:203e:864e with SMTP id d9443c01a7336-2edd7451addmr81294505ad.1.1794472469056;
        Thu, 12 Nov 2026 00:34:29 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm29351705ad.13.2026.11.12.00.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:34:28 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v5 4/4] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay
Date: Thu, 12 Nov 2026 16:33:55 +0800
Message-ID: <20261112083355.3884737-5-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
References: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX07JuwtZnJYGD
 rNKCMYlCdbUffMkv20/zqk4mdvMx4DbU/0pKO3pL8zwMuDXK/5r47zs6W0IkQH564bVE+G9I+DF
 FK1YvM3zUezx6wqRzFsnIGHMsr/FPGA=
X-Proofpoint-GUID: 6JbTcicxM6d3YwRumNquMs8Dt-IRDg3u
X-Proofpoint-ORIG-GUID: 6JbTcicxM6d3YwRumNquMs8Dt-IRDg3u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXz+n00SdBM9R9
 Fwk1WmFi1FGIJMqp4zDyidAlmq6hdqy0psdNaN9ymCi2VD/jO81seVVdswm+a0Sg2BAkWT6U/1v
 BCs5Wli6ZcH4LX7EPqQlF2Rq/iYbCoUA+uY4Zt8Y/qgHgvNKwukoaz5XKJn04Lh33gQ4k/bQwvA
 yTrXV7/9XtZxvPla9N/Slx6HqqImPviz/WJMq60lw07kg4IGLlrzQY0aIj+Jj7urUftWXoRLcc0
 oiXbliohJiAb/AKyEDXqxeiDGFMxNtxc1J1jTEYyN7km9jnFmzGtjnP48xE95N7Pu52yAavQRry
 7WBouNmvvoDPqBR1TzSaCgUAsO5W2XZGIAyTHImhdrPO3l9XYaeel1/mBMo5h5lRyASOLx8kXc3
 ILY0Waz1lte2HAo8O2913GfTqhpucngYP7CRSIuttAKX8REW2n5XkY73MzezjuUBAX8rZRyoU5W
 +de0mhbaZ2jcu1TErUQ==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af57a16 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fwK-b8I7k3kQTYbNoNcA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the
Qualcomm Shikra IQS EVK.

The Shikra product design supports either the onboard Apache WCN3988
path or the M.2 HSP Cologne path at a time. The overlay describes the
board after hardware rework selects the M.2 path. Disable the inherited
onboard Wi-Fi and Bluetooth nodes when this overlay is selected.

Describe the PCIe and UART connections through the M.2 connector, the
3.3 V supply, the W_DISABLE signals and the PCIe reset signal.

The series has been validated on Shikra hardware.

Link: https://lore.kernel.org/r/20261102045815.2938940-1-linghui.wu@oss.qualcomm.com
Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 122 ++++++++++++++++++
 2 files changed, 124 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..037dbe8a39ce 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -410,10 +410,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-m2-wifi-bt-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-m2-wifi-bt.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
new file mode 100644
index 000000000000..ef0f197a53f8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
@@ -0,0 +1,122 @@
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
+		gpio = <&expander3 6 GPIO_ACTIVE_HIGH>;
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
+&pcie {
+	iommu-map = <0x0 &apps_smmu 0x0800 0x0 0x1>,
+		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
+	pinctrl-0 = <&pcie_default_state>;
+	pinctrl-names = "default";
+	vddpe-3v3-supply = <&m2_keye_3p3>;
+	wake-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&pcie_phy {
+	vdda-phy-supply = <&pm8150_l12>;
+	vdda-pll-supply = <&pm8150_l9>;
+
+	status = "okay";
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
+&tlmm {
+	pcie_default_state: pcie-default-state {
+		clkreq-pins {
+			pins = "gpio117";
+			function = "pcie0_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio119";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&wifi {
+	status = "disabled";
+};
-- 
2.43.0

