Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F183EC82E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106872; cv=none; b=nkRRUiAZFaIH3KSQ0jGliArVuUprmjIkMwnxJnL6omtOM/c0Z3bdm4UDP4U+g6psz69O+SmTNxdre3oOjbU5LSwH9niYRc9Ac22xm3Uw95A9DWWrpnazlLrgl/YgLkv3u8zk6FqpDJ2uq/cv2jLjpjRXnkMK4mWUgDUKeadV7Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106872; c=relaxed/simple;
	bh=zNaTzQ45QCKD6bWD0K+HfKnebkoA/A9iSYC6z1a2LtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cH8UsKzz4iMIRgCbuJhIW9yHlC+tcg4rYd/em36WLRO74vXohzMiv+0XZBU8nLDs9txD/K6u+fwy/qZE4VaKqgB/OF4ixBQz/5NmviCguJLl2LrXyB5ScE6bKGnLtslNPNioslqMe+sIRai0n/V34jocrc2c50PEuiWcnKhm2D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYplHSvx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3Wh9VyH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYplHSvx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3Wh9VyH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vQLr2422300
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fm++pxDqL3aZSOs8GsRafGg2fgoFosuU+f1X9SfDKGI=; b=LYplHSvx+OdcTDtg
	HhfXGswxwu2fXYkCAVSDxIeLcWMwh6s4V+84gMm+fqYTGOzmNb/cKt74B2KV4T01
	DxGx1vFe/XcjClnZe9kANZI8YJBWJHtvr6ZQltyYt4ba2WBTO5huwzCe/krhap/X
	1tbnAVK5Tnxmisxkrt6kAeavvVAwd5IYAnAF0Gzx1Hkf/HPc7JsK6OixDIUpcvRJ
	civ/7OaXwb+gWmBH9cAdHVdq3VTCJfiMgS3KmBvUpHNJAO72aCj2Kvbomjs5dcWR
	sco6c7ZHVGqkcEI1tWI5YbVAn6lgkc78b6yRSWXkAnOKBpvE7XWZvuZcYtCmSmRe
	AazWDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729h2w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:07:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so765874a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789106869; x=1789711669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fm++pxDqL3aZSOs8GsRafGg2fgoFosuU+f1X9SfDKGI=;
        b=N3Wh9VyHBIzvA083PKcyC2h2LEOUSNk9eZlp3UJ26BRjVlM9DxICiKRbUm6MyLpuwG
         CorvEt+geO0v1HSq2pSG8b3+4X33S5wTYXK8wblgEUeBUlZZp7tpuK/VZZrDoXzr+2ql
         yAKfaL/R6e+Q3T0fsgJJKzoS00G05NwnDRCtx4E/lD+QWi0CL11wHZvGmW1mTfMQPUor
         8wc3IuAGg6JyKFu3OnBRa38QPxBu9aAXQkPX74Oq1DVjX6aE5Yf9Z1Hd3pevOlFM+f4p
         fhdpnwLQKCRbEMyxi5So6SOjMNyWC9qjw+imqa79ox/AAWzTmXhoxT7gIb0Z4EiBeTom
         /FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789106869; x=1789711669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fm++pxDqL3aZSOs8GsRafGg2fgoFosuU+f1X9SfDKGI=;
        b=EEoYdwl/vywvB4lb0FEMYxZsSq8ji2CWqbYMyFJddA+/qaYK2R4tW3HDDdE/thWhOH
         AwYEfkniQ+x3EpMz+vHY1NiItZDNJXkKxbeBMSwYnbSRj8FZvzUG+bp7drxuaDb5qL3e
         ippGHiGs0S5y6kb3Bkev7rYNa66ovbF+Z8XrbXGKJBs8kf/AK64PO8MrU86lUaWhGsg7
         AuW5oehzXCTn3kAKIYSZ2n5inDKK6WtOvTkS7ZFafRdJz/XmT0WUcM7pPo9IMJYy3bdd
         TKzzZwMFt+Q99T1RCkCvP3fveOlDuXRFLfn81gPDKdlpEH0gmg+XtIlewcqypSZdwF7q
         MuwA==
X-Forwarded-Encrypted: i=1; AKwUvBzQVrmkQL2frmoj13Doarqz8nwwHI5YFu2PLYr20jtq4yWzVbtv/a72jMndoY8y6Ml1rNkIFqh2lbi2Yco=@vger.kernel.org
X-Gm-Message-State: AFuF++kKyU3CnvQNDUxkFImhQ4T2U1PI8UCtfwU2ZuJZzOZQuYaE4ay+
	f/u0vdg8XuOuarwa+auZUwsAiB5MEC6oOH/dcLYEggCFXFfOOLIwjPHdR0RzSZ+TPMJ12+M27iy
	MnnvRQVgYObKAHSzjbcby5YliY6ZUj7mttJAnAfcOLaZSQSUjCkuX9//Gv0dux3qmsqo=
X-Gm-Gg: AYBFou0xgXlCQyb++/HIZLdC9/3eCbid6kSprB5vC7/x+dv7Ys0MNlfMGJi0ANkkXfi
	kf7VZ8XrgY0+KfKugZqcyuZ+rs6WIKdfI2dAH12t6/P9q27r1FUguBojRZSabUuXy7tUKREbsF1
	f111d7jm/aY21jmqv42stcGkm2XaK83Br8AaGTphBUyhnOzKIJ1xoGqUeWUy7/avl5SqQozyuoa
	NvXLhzb1BbE/VyIVj9l2v7FLHkBW1C4FkVzJdXrLig1RprPO+UoWPm+YDMODBoWwK+AybD8RS5X
	z0xTW1ecBwgKi/h62my0nOWFR+LyABfwPhkQJO2IeGXCOjdfV1AQ5Thj+naj77cN3gjPnM1CQLb
	iwjEhcp3kM7RuDQQ=
X-Received: by 2002:a17:90b:4b82:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39d9bbd881fmr4497102a91.4.1789106868979;
        Thu, 10 Sep 2026 23:07:48 -0700 (PDT)
X-Received: by 2002:a17:90b:4b82:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39d9bbd881fmr4496999a91.4.1789106868238;
        Thu, 10 Sep 2026 23:07:48 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm2989933eec.30.2026.09.10.23.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:07:47 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 11:37:19 +0530
Subject: [PATCH v8 2/3] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-usb-shikra-v7-v8-2-851ee4bc0eec@oss.qualcomm.com>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
In-Reply-To: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789106853; l=7639;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1I3yzTLyS1HTTBLxG374MHa0PF3cx6CrfViJFAX9gDw=;
 b=zT85E8se5evT+CoxdrYHkIxIP/jGJcmgrD794EDdXmyO/GbjdDlqK5HsRjU6XV9LxhF0CeJNr
 Feh6JuVIwvjDSPjLN5UZxVzF3T6OcNX/O4un9bCOlleJYqbVpihV02y
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4MyBTYWx0ZWRfXzTK8Me9QYXRE
 gTS+hJy8QvvLsng2ZFbqXOCRPIisN2bfPj1oAwTHeXVWLx2jIZVCRPcHKJZeEeezT+PCbeUo5yS
 7AhBL3XLECoNRLGujcAe7/Gy/RueKfs=
X-Proofpoint-GUID: I6RN7FFod_E6H42SQqVSArj9h8rUoEor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4MyBTYWx0ZWRfXwjbwK1Qe6XHH
 O8YHeV+UMKLOoDGyF82dhPLtt+eTiyhoR8e7AgXCzwdA6JkFiAGS0NLPAe5uzEnhnVNB79P65ku
 kHQLM8xzC4yTQ2C9k7F3gdXnMj+4YYUkNcJrcGuEvxRW2+gsXewWHXL4Vf6tqV5v5J8oEgYB+b/
 xeM9ExnmKnJvnD4CcOAh+g02v5yIgNo6+XlGszYsmWMMfOJS8hZGETVPv3C/AWrcnriKuc0Lko5
 rXlVBvECqf+/GMkJZQpPDta43mrKPL1awQ2QE450cJ88daNeEbSqDhzspsSv3P9AgHT1C7YxYPN
 sZLYIPwlV0tR90R4FmOWvo6tzFhvxTJDWhhLnLT7ls60Y0zIilwQCt5qwaz5IYKqn0zzrxMoHfV
 vn2rvTrxHvjmkCyGjO8hYxznjL37fTW/BKkzLVJtb2A2Msx+J/mW8yAbMk6eeWpadxZCIrfQSkm
 uFcESadz+jWFX6vLqog==
X-Proofpoint-ORIG-GUID: I6RN7FFod_E6H42SQqVSArj9h8rUoEor
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa39ab5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wA36ycbUlljGYm-j3gwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110083

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Add support for both USB controllers and their respective phys on Shikra.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 233 +++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 921ae2a5a3eb..1395c182a2b1 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -1019,6 +1020,85 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		usb_1_hsphy: phy@1613000 {
+			compatible = "qcom,shikra-qusb2-phy";
+			reg = <0x0 0x01613000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim_1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_qmpphy: phy@1615000 {
+			compatible = "qcom,shikra-qmp-usb3-dp-phy";
+			reg = <0x0 0x01615000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_EN>,
+				 <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>;
+			reset-names = "phy_phy",
+				      "dp_phy",
+				      "phy";
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+			orientation-switch;
+
+			qcom,tcsr-reg = <&tcsr_regs 0xb244 0xb248>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+
+		usb_2_hsphy: phy@1617000 {
+			compatible = "qcom,shikra-qusb2-phy";
+			reg = <0x0 0x01617000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim_2>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		system_noc: interconnect@1880000 {
 			compatible = "qcom,shikra-sys-noc";
 			reg = <0x0 0x01880000 0x0 0x6a080>;
@@ -1100,6 +1180,11 @@ qfprom: efuse@1b44000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			qusb2_hstx_trim_2: hstx-trim@25a {
+				reg = <0x25a 0x1>;
+				bits = <4 4>;
+			};
+
 			qusb2_hstx_trim_1: hstx-trim@25b {
 				reg = <0x25b 0x1>;
 				bits = <1 4>;
@@ -1977,6 +2062,154 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		usb_2: usb@4c00000 {
+			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x04c00000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_SLEEP_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+						  <&gcc GCC_USB20_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+
+			interrupts-extended = <&intc GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&mpm 59 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 58 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			iommus = <&apps_smmu 0x140 0x0>;
+
+			maximum-speed = "high-speed";
+
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+
+			power-domains = <&gcc GCC_USB20_GDSC>;
+
+			qcom,select-utmi-as-pipe-clk;
+			resets = <&gcc GCC_USB20_BCR>;
+
+			interconnects = <&system_noc MASTER_USB2_0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_USB2 RPM_ACTIVE_TAG>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
+
+			usb-role-switch;
+			wakeup-source;
+
+			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
+		};
+
+		usb_1: usb@4e00000 {
+			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x04e00000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+
+			interrupts-extended = <&intc GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&mpm 91 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 90 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu 0x120 0x0>;
+
+			phys = <&usb_1_hsphy>, <&usb_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			interconnects = <&system_noc MASTER_USB3 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_USB3 RPM_ACTIVE_TAG>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
+			snps,usb3_lpm_capable;
+			snps,parkmode-disable-ss-quirk;
+
+			usb-role-switch;
+
+			wakeup-source;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
 		gpu: gpu@5900000 {
 			compatible = "qcom,adreno-07000400", "qcom,adreno";
 			reg = <0x0 0x05900000 0x0 0x40000>,

-- 
2.34.1

