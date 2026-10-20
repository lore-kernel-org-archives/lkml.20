Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792462179;
	b=AvbcfXN+v16L2514fcFCznnTNHyslwLb5aa+baziId9mxT7jMlnbwwAU7I/z25hGixbD
	 KHJNpURnQ8DUr5zHGvbC0lIe53MymExPH1uOBz7lXbATeDXWOuCFK0wyq4OsPeBdz28yg
	 hcbmhJxeLZH/+X2bZ/w6s+XuUROJb5KDUa8l+amI8UAkqGUmGI1ihe+0a6GqJhSg4rs9C
	 E9kY/zMnJefGwuI4Xli0z/b5d3l4xJAEEjno1/rl/MI9Id0aDlGSu+a18Nf+F2PkG4cIj
	 wiiFvJucxSM/ZV/MQbkacnrAqdFuq3/yX3w0wwLDkN+5DoyR6EAYWOpyySM7FX9X6dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xLCSD6k91Jgj6qimetuwC4JvfKiAzDx7Of9O5s9dvWs=;
	b=JoSGrOPZCbrqmtqGFPbUaXR/3kb9KkXpUY4GhnE4AfUdyEwHF6+qbPsDPREaILZVYJwC
	 Pqo8Nmgb4RnrTgMXDHqTVDARPoy4ZKkZ7g9chylG+xz1Dpoisg0ItzJK9waDvu+Er7l7M
	 +SzBsSnn7OKY6rauxOztJvg0F8Pl6rWfERWVdQtWg3nWUNk5hTLBxN1/GholuBl1KDSCX
	 rU2wHNBNE/b+8gco2qlsjoA1tpHt3fRbCf6AmWx16u0Ykp9VIffAu5TyKIYp5Sz0iQVx/
	 Rb2odVt5oEnG4cQfNTFRBx09FhtdfipjnPlqqot1DCF8CzMQfYb3nvTzdTsTl6YueXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V9xQvdNU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2XRwzP2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C2D606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C2D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V9xQvdNU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2XRwzP2
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K18efx734285
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xLCSD6k91Jg
	j6qimetuwC4JvfKiAzDx7Of9O5s9dvWs=; b=V9xQvdNUzt8OfaIBNDAfOa6yfyW
	39NdKz4ebA53VYHznFf94sHLB0JtYgu2yx8mG0qo1O0RRVI55rbHjFlU9hQt4XaQ
	nin9Lz6vwCt0dkngR4LeoWksugNO67omLIrhdvDheyPObW6ROwYVGvQ1XnNuxWK/
	Al7aP07/q3yB06LmsuCQuHuJxfU8Jhk6cQFUKMWg+SSCEl6hE3Cq+BMmco9VFDVJ
	GSW1UR95jWZ1VLMtgN+Fv/hm7LnHpAD7vG/UgbrzvF0sN4/B8kAqF4qbP9K2rFhV
	7ZSTNVbF8/f05oNLaie5f8kUNbgDxQIqdxPgovBPloLlQD9ZH1mxlz4WTqw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pgfy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:09:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac765fe43eso837979a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792462176; x=1793066976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xLCSD6k91Jgj6qimetuwC4JvfKiAzDx7Of9O5s9dvWs=;
        b=X2XRwzP2v1GuIhPxTvknuxk/+EAIvSMdQOGs4t4P+OjI6w/z8W1Y2j25KPiKNV3Ypm
         tqfLhQMEZqeTMtWJLYMW8huXUZUWYaOB1b+eVCflWIjiyLBk5XM6RthdDHITohH72H3O
         eDbWmxmol7ce3GqNDIccsxfu1vzwKKWUsKfWTnV+a7cd02NP+m7V4fuz8kD+MUbLqTOO
         xle77WqqvhXEwRgGeU0ZWWN9ebNGIQkw1izmPqsbwgxvKQzswESBkX5mN3G8O9442JUt
         ijgur7HpaKPaZ57Z1+Nb8sstiH3KgZr6bN0eat32TPkgyxGdmO9NPW9oHIjp8WSuY9Pz
         BGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462176; x=1793066976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xLCSD6k91Jgj6qimetuwC4JvfKiAzDx7Of9O5s9dvWs=;
        b=HYCVbl4XWdeBNhzMwhIfXu22tKjlU6B6ulk0RHSZloYUcF4PtjCt7wV4k5lAQTDDVS
         JGoanTA/9zdIymXRRIrXqUYxOT2ltoNnrgZTgmIXR5b8w9tlA3qQwhmjX8ZRZMjXjXF9
         S0WukhDmOLXZkDiV4pfPj0zDhrZQtZHdfu/52gZESXnwHtiBFkP4yc66dnTnMtR6hfSx
         0T0QLO0w72qjoCcx6l5DlYYJoDvO/JjDQydIX2+mXAVQIQZmgYi3g5Y95byIma3BHDDh
         fAW3KsvwEOAzmZsY1GWS/bqeZNA5CeR94Ixb8QNezgjy2Ik5SDDbuPO5RFNZlfWepllv
         7A/g==
X-Forwarded-Encrypted: i=1; AKwUvBwdDHOpbNvSAswzjgpPdQ9cyQAPVWYc4kq40V5hUgObysWS6uMQUPzkU6Y9OhNvrRbe2NWR7ZMmeXvJjKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuLnH9gERhJ+GUWoQQkW5hKrDHjjkLEcJc10bP+8F1NoMNg4wR
	lRwMgwp1haHsxkKV9/fqPHDIXGz7U93GkttWmeynoI0QaH6iRqWot/kJIPO8QbDZOFV7/y7vXxQ
	8+LBZuvdDtvAEpB6VLpQMFxmPkkKeDoN+a+5bdcudccCW5uTYuZU2Clun3+M7VoZKg9E=
X-Gm-Gg: AYBFou3Wm+MKEWnlHs521eMDwZzeV9pv+geMjLHwHwJw/I3K1Q/bKeiHhp10JOKGUAl
	YqDiDBzpISI4HpuhMu4WBl2BJS4ECbc8EQJKSEpePO2SbK4FjrBn/Y2d/FpCVGUcpoxjUr7LRpt
	Js6TG3hdYDojD7FtjJXdqgftoXQ8LJJQn0H4NFJOm2U2pySBi+JX3rynqivF0laiGiVAndO9mxl
	7FCrn4GC0foMpJs/GmQzZOJsjAuqgtVAdDeD0JcWeyP32ifyTKkdDNTHW8A9hJf4y1hmY4UHQdp
	pOAqblWXygC5sFGFEjA/cUYkYSlMY4rRveh+rpslo+RrIU7P4mZ4epTkVWYVXdmLc69UM7OmOYX
	Beh/5JTUTeaXlgcX1d4aLTdq0xVPN
X-Received: by 2002:a17:90b:28c8:b0:3ac:77a2:18b1 with SMTP id 98e67ed59e1d1-3aceefbae48mr13645646a91.5.1792462175828;
        Mon, 19 Oct 2026 19:09:35 -0700 (PDT)
X-Received: by 2002:a17:90b:28c8:b0:3ac:77a2:18b1 with SMTP id 98e67ed59e1d1-3aceefbae48mr13645625a91.5.1792462175410;
        Mon, 19 Oct 2026 19:09:35 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60102ebdsm1668101a91.1.2026.10.19.19.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:09:34 -0700 (PDT)
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
Subject: [PATCH v3] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay
Date: Tue, 20 Oct 2026 10:09:25 +0800
Message-ID: <20261020020925.3915548-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
References: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad6cd60 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=PXjJdcURLqaX-Ux2mcsA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: XUUpgxZkiL87QBCaJ_6DMVXPF969Fly7
X-Proofpoint-GUID: XUUpgxZkiL87QBCaJ_6DMVXPF969Fly7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAwOCBTYWx0ZWRfXzELvGvtydAif
 NQ+RUKKfNqJvJLwOq6QKanQhoHRQhf2gRP1kFmjPoEy2hozHqb4/TPYgvIwz4jXBoqwmhmhUUSE
 rQ1WZKaY7tMmHIjW+yueuCoD+jCRXgeuHkhMupIxCWnEuUyETDM/YGVLm+JbRkJQZquzTye7731
 ieSrBkw5s7JVtKFEtU7im0LzDRD2Bad3KUC7OJbJ8kctB1wsLd4dUTHhNFUHHG429cRID0JQnpm
 scFWZp3cihVQNwqwrpAEMW8c4OpLWQ00DlC9M68cfzlNhuh3nI6ai+G0XQL0HdkcC6e5NPsSNgm
 Ty7BuScXXwMwycwTthY1lJiKjGAQhapwDPpGNzA47KUENjoGOkz9eaAF3U5wvMg9yptGq5rPFCG
 M1W712lYQLRu2J70AnAeSryjLTPap87aUUTyZEzWDswXUSChdfm7ejpKUP3hfiy/8aW4045exIY
 YBxDTnHNGAv5+3CscyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAwOCBTYWx0ZWRfXyU1pIdL7dogu
 bAPtLk672TLz8fT+0lw5aUmiiDc4RFcfI2B5Rv5ADvLSE2ZPI6+uCLcMKHCb4eTTTRV3kYddjx8
 v/MCfMz+rdN09u/5VVidBsXKifAqqZw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200008

Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on the Qualcomm
Shikra IQS EVK.

The M.2 variant uses the external module connected through the Key-E
connector instead of the onboard WCN3988 devices. Disable the onboard
Wi-Fi and Bluetooth nodes when the overlay is selected so the device tree
matches the hardware variant and does not probe the unavailable onboard
connectivity path.

Describe the PCIe and UART connections through the M.2 connector, the
3.3 V supply, the W_DISABLE signals and the PCIe reset signal.

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

Changes in v3:
- Drop the unused reg override from the disabled TC9563 node.

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 105 +++++++++++++++++
 2 files changed, 106 insertions(+)
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
@@ -0,0 +1,105 @@
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
