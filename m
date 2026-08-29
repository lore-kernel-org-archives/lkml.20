Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497DF38D6BD
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030500; cv=none; b=hy6JuRG2ie/6pgvONwWPhtpHz8cLYfU/5dDCTtB96d16J37PlnXe1aZhVcWL7uU3bOW5iZXM1p++fSPaVws2SW35elV3YL83++BvrBuMaeh5BqWn8eSYE5aSd1V/eg55EBNODYoEdN4tZqZfzRKWDWL6VStG2rw8v+i9oQh4Eic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030500; c=relaxed/simple;
	bh=wE1gd60LE2bVrhq+QZ9GZhx/4TODGoWByX8OmTWi94I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WjleTcgHxdr405yb75y7UadQF3WmkumS/N0Kx33WfrJ/lL4YdnFfM6vPl3D1uxZlNvi8yN90IGZQE+FuXvVkYWJczSsaa9V8c26g15pAnsc8fQOQ7aIcS6GREu/Z/hf5wgfeW7To/cSzn9otH39/CUFvQ0oB4zJB0HpSDtwuRWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5RiXzBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXNS8bYX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5RiXzBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXNS8bYX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx2Pb2421088
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+f2ykS1t3hJd9UUUffHPFYJeKpvi/yoZobwb5rQNo3c=; b=f5RiXzBR15gNMeHq
	uW3wTCxRYTVJGoYtZvK0uvDv94UkO+AHfpwTxAHQGpr4rhitr059P05l8ZvK54dg
	Ls0L67c3fBwTKlZZt4HfVFapXA2EiEHSAZGHoLxRnSmNiFMUv0N0gqh6pB5L6Ls1
	eNDasrC8Wk6TF9p1mkIJhNozs+0julAcTMEWR4W2DJXsHvlFOAHHUpD+ZeK3UFnY
	BjO7Lklb5AioiFgfQ0KJOqOv/HbXPD/jG7+h5pmUsd9MZN0mdm930+Z2ERcp6BVk
	lrAHA9hNfGzrF992hJoeOOb5gZRNZCaWtG1OelMd3cK/LcilaNn63OqIaxlj8vsb
	89JUYg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2hjy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:08:17 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66c70d28b78so4633010d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788030496; x=1788635296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f2ykS1t3hJd9UUUffHPFYJeKpvi/yoZobwb5rQNo3c=;
        b=NXNS8bYXXJyRtkpALebJyI7RghptmvjpWkqajTkHK4eoVy84PhljxdId96m1w+tUNY
         iO4VV/lROZ5fO7vo9xuY3MTbmLdttFWvkTkmdzMMzvuQne8R9avJaVL5qbInjAc8JBL6
         sxhkzwr60p/B303buekxOsn17L/YysiWWusblIbeslJ3u/6+bBS2fOwkwXvXgQdzonEd
         SRwFE0LYNjMmfUPBY2k30pja2n0nqFb+GY6chxjq+g/htzbN0F1hZ/PMDtDnfDncXMMY
         eDOrOKUa/8Gp6N8ImdDwAZjVLuiWV7EAF2vM93COvy9Hwf3N+VJ7gcQADwXVfRxA2Tdz
         cTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030496; x=1788635296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f2ykS1t3hJd9UUUffHPFYJeKpvi/yoZobwb5rQNo3c=;
        b=PWjntWMJAeyZBW+TsUP9t3+vnt9spCFtUxBiaggOrydSodYsQhZQAvAx00wcFTsZuS
         Yo+9B5C1u8ZivOXGTIlmN7bU3dVHnuuibR/YcALy1/3sHSxxxq6l4JuyC2Uo1e4S0OiO
         nh90kwc0JtEvt3RUzIKS0JzjAMJXcvRvHNdS2WbQw7QOG6xQamdj9j0k8ryEVi/6pWv4
         aAnrp5TNRAbjaOXPrPS3S4AaQWHvqdauous+s8qDDcYhpyCkY4cCh17hKS9jjyzZt/xP
         frKaCBEf7gi/pfjVfqdEMfKqMUaNLohgwLgbt/RuSU+9RV5YN0TK/jpWQ29GuldqkOSH
         HDDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzz0yb8A4PLAKf3hnbBM6VX/WucOR6yVvllRf1gWUSDRYAlrjdKeD+0ASZk/pH9QhOiIt7mKwHmXdy1roM=@vger.kernel.org
X-Gm-Message-State: AFuF++n5c+F0rri9qwW1vz1DLhVvR956DASdcl+bWPjK4qSdKB+yBXZg
	8z6lLR8/oTLehu/aPNR5fdiCaa6Z4t6yMa+MOb/m3DaULu546aUnXGBJXTP/rLiYT+BO1yLqmY8
	gNYYoVOYVGKjP3dYdzMsQF0c08gn1GkU3Wm9nH5r3u0/711bFLXhxCcgVcTXiBZ6aXRM=
X-Gm-Gg: AYBFou09JW2B06cWxTMq4a/wsiTMJGBwC8dRzEl30Cs/+LPSayAdVEAVpewrGthnWDF
	knBF6fLPW9FYBvzO+0eXiLP8MJycphpowROLg8Hs5Gnd1osP3IEq14+knNSPdgd/qVFi6Au44E6
	RjCl9WQSfv+GzaX95M+H/8MoAprOTpEZk5NjmY/isgj9faeyA5neHqsf8yxJNAkUrWzuCIl+99I
	FfOWt6/Kja8s0OegGCFptbRtdpCTpOg2ECQKmIekvd+qrqH9Rg0l59kI5qSTSzie+yMTbK6/80v
	9ejnkXT5Bp1PXwoqGI1NHOBn1RZeJibgpUgJB8TxV7alPLoI84qqrerAIGffsDJO3sKyuGX4lJk
	hvaYurUGujtEQMarVCtJ+2hNQBHnO3YraITPg0QWEnxQE9VzC
X-Received: by 2002:a05:690e:4287:10b0:66a:b15b:2a91 with SMTP id 956f58d0204a3-66e4c73d66amr3879736d50.42.1788030496018;
        Sat, 29 Aug 2026 12:08:16 -0700 (PDT)
X-Received: by 2002:a05:690e:4287:10b0:66a:b15b:2a91 with SMTP id 956f58d0204a3-66e4c73d66amr3879723d50.42.1788030495404;
        Sat, 29 Aug 2026 12:08:15 -0700 (PDT)
Received: from agents-mac-mini.lan ([2600:1700:b450:a0df:44f5:f599:5679:b5a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ecf1f6fsm3013945d50.13.2026.08.29.12.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:08:14 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 12:08:09 -0700
Subject: [PATCH v5 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-glymur-send-v5-2-a11bdf6a4b66@oss.qualcomm.com>
References: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
In-Reply-To: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: lZ6Q4P3hkNSua72-Vz5_HnkXN_Z2-_N7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX8rJnxu8mhH2c
 2MuH5Qz6/p18QnNkOTai3wuZxzvS7DC5zwpYhTL0re8F0xELcPEB0r5sG5m4zA1aX9G2UUBn8P8
 PCsTJTgti3827YPLaGLzKPrIsG0ekcQPKhTo9giejeRriXlH8lD7Ez1aX8g2uVMmmn7LGZvsoMG
 WTvc2YS37hmBsCyFjnRN7iHBz8AXNvt2fCvfMNsgiUqBqyl6Ci40BEfR1SVGW+Jpy8mv0MIgcc+
 hq/7N17XEsJR/IFedqOkd3DsHhPucGMksznq2Nbds4ES6hy6ePIMLyq3JjupWor/N98sSlmlb4S
 oX1AlnI1qmsGE3tRcnElC5+ydSn2K/JUXAqwgxncR2seaKbnFADcVmkiOBl5E7+83QUl+08DAAN
 pHDnBzRaK52DJ2ZDPnvSv4nHJpjEhsKMY0Djb+8mST9iCrDDYGjL1Ve365dGKzveUgwvGRHUKWU
 eKu2FuaN6/Gs8tz2Weg==
X-Proofpoint-GUID: lZ6Q4P3hkNSua72-Vz5_HnkXN_Z2-_N7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfXxbi4FYCq0XLr
 gmLsgIYwarbsY0a0asZXEKj6xtMnANKqhhMdI/wCkR9+q6AJxbaV51B2Y6rwUGd7FRINdMKUDh0
 HgwaBICXqeQb3qYu6nS4Nwu7WbakGQQ=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a932e21 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=fcvyo_hH4XkQQty26NwA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290165

Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
(product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.

Enabled by this device tree:

  - internal eDP panel (samsung,atna33xc20)
  - 2x USB Type-C with DisplayPort alt-mode and USB
  - chassis USB-A host port (usb_mp multiport controller)
  - internal eUSB2 host with the Elan fingerprint reader
  - NVMe SSD on PCIe5
  - Wi-Fi and Bluetooth
  - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
  - Adreno GPU and GMU (Freedreno GL on Mesa)
  - audio playback and capture
  - real-time clock
  - compute DSP (cDSP)

The DisplayPort outputs need the Glymur DP PHY series at runtime. This
device tree builds without it.

The chassis HDMI jack is removed in v5. It is driven from the usb_2
combo PHY as a DisplayPort-only instance, and that path does not come up on
Glymur. The same failure was reported against the already-merged Asus
Zenbook A16 (UX3607OA), which describes its usb_2 combo PHY the same way. A
fix is in progress but not yet available.

Assisted-by: Claude:claude-opus-4-8
Assisted-by: Claude:claude-opus-5
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts    | 940 +++++++++++++++++++++
 2 files changed, 941 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..146955de4606 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
new file mode 100644
index 000000000000..096d40e49210
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
@@ -0,0 +1,940 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "glymur.dtsi"
+
+#include "pmcx0102.dtsi"
+#include "pmh0101.dtsi"
+#include "pmh0110-glymur.dtsi"
+#include "pmh0104-glymur.dtsi"
+#include "pmk8850.dtsi"
+#include "smb2370.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+/ {
+	model = "HP EliteBook X G2q 14 AI";
+	compatible = "hp,elitebook-x-g2q", "qcom,glymur";
+
+	aliases {
+		i2c0 = &i2c0;
+		i2c8 = &i2c8;
+
+		serial0 = &uart21;
+		serial1 = &uart14;
+	};
+
+	clocks {
+		xo_board: xo-board {
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
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&lid_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			label = "lid";
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Left side port */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		/* Right side port */
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_wcn_0p95: regulator-wcn-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "GLYMUR-HP-EliteBook-X-G2q";
+
+		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
+				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_woofer>, <&left_tweeter>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&right_woofer>, <&right_tweeter>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_e0_1p8>;
+		vddaon-supply = <&vreg_l15b_e0_1p8>;
+		vdddig-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmh0101-rpmh-regulators";
+		qcom,pmic-id = "B_E0";
+
+		vreg_l1b_e0_1p8: ldo1 {
+			regulator-name = "vreg_l1b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_e0_3p1: ldo7 {
+			regulator-name = "vreg_l7b_e0_3p1";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_e0_1p8: ldo15 {
+			regulator-name = "vreg_l15b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_e0_1p2: ldo18 {
+			regulator-name = "vreg_l18b_e0_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmcx0102-rpmh-regulators";
+		qcom,pmic-id = "C_E1";
+
+		vreg_l1c_e1_0p91: ldo1 {
+			regulator-name = "vreg_l1c_e1_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_l2f_e0_0p94: ldo2 {
+			regulator-name = "vreg_l2f_e0_0p94";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_e0_0p91: ldo3 {
+			regulator-name = "vreg_l3f_e0_0p91";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E1";
+
+		vreg_l1f_e1_0p88: ldo1 {
+			regulator-name = "vreg_l1f_e1_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_e1_0p88: ldo2 {
+			regulator-name = "vreg_l2f_e1_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4f_e1_1p2: ldo4 {
+			regulator-name = "vreg_l4f_e1_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "H_E0";
+
+		vreg_l1h_e0_0p94: ldo1 {
+			regulator-name = "vreg_l1h_e0_0p94";
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <936000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2h_e0_0p88: ldo2 {
+			regulator-name = "vreg_l2h_e0_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4h_e0_1p2: ldo4 {
+			regulator-name = "vreg_l4h_e0_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gmu {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <200>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&lpass_vamacro {
+	vdd-micb-supply = <&vreg_l1b_e0_1p8>;
+
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "samsung,atna33xc20";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l2f_e1_0p88>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+
+	status = "okay";
+};
+
+&pcie4 {
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p91>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+
+	status = "okay";
+};
+
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pcie5 {
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	pinctrl-0 = <&pcie5_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie5_phy {
+	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&pcie5_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&pmh0101_gpios {
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio14";
+		function = "normal";
+		bias-disable;
+	};
+};
+
+&pmk8850_rtc {
+	qcom,no-alarm;
+	qcom,uefi-rtc-info;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/hp/elitebook-x-g2q/qcadsp8480.mbn",
+			"qcom/glymur/hp/elitebook-x-g2q/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/hp/elitebook-x-g2q/qccdsp8480.mbn",
+			"qcom/glymur/hp/elitebook-x-g2q/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_soccp {
+	firmware-name = "qcom/glymur/hp/elitebook-x-g2q/soccp.mbn",
+			"qcom/glymur/hp/elitebook-x-g2q/soccp_dtb.mbn";
+};
+
+&smb2370_j_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_3p1>;
+};
+
+&smb2370_k_e2_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_e0_1p8>;
+	vdd3-supply = <&vreg_l7b_e0_3p1>;
+};
+
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, left woofer */
+	left_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, left tweeter */
+	left_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	/* WSA8845, right woofer */
+	right_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, right tweeter */
+	right_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p88>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p88>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p88>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p88>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p91>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p91>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p88>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p94>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p88>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p2>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
+			       <10 2>, /* OOB UART */
+			       <44 4>, /* Security SPI (TPM) */
+			       <65 1>; /* EC reset */
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		pins = "gpio51";
+		function = "gpio";
+		bias-disable;
+	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	lid_default: lid-default-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie5_default: pcie5-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie5_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p91>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l3f_e0_0p91>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	refgen-supply = <&vreg_l2f_e0_0p94>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l3f_e0_0p91>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1h_e0_0p94>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	refgen-supply = <&vreg_l2f_e0_0p94>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+/* Internal USB2 host for the Elan fingerprint reader (usb 04f3:0ca8). */
+&usb_hs {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_hs_phy {
+	vdd-supply = <&vreg_l2h_e0_0p88>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+/* Multiport host: port 0 = chassis USB-A, port 1 = internal USB HID. */
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2h_e0_0p88>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2h_e0_0p88>;
+	vdda12-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l2h_e0_0p88>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	refgen-supply = <&vreg_l4f_e1_1p2>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l2h_e0_0p88>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	refgen-supply = <&vreg_l4f_e1_1p2>;
+
+	status = "okay";
+};

-- 
2.50.1

