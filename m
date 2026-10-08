Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04374756CE
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450889; cv=none; b=keuBWzFUzQ6tp2zObf0hzI7j7WL0sC2Q2ir4wYbzU5sQjLRzVD24brmwxwgjon2IDf0rdtOrfDRB9xRQJiqN2vtzVErm7naGx8F15YXOzWAGGYLWysQCvdAEFAAtY5cVZjCVRQ0aNzpeMXSWzEjFHBK8yQiYiCWb7cnLT3935+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450889; c=relaxed/simple;
	bh=1mgdYgt7QC2kZEatBd4vUeOou2ZuWuJuLtpi58h5hOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CakgvSyce+WH/+AWuHFz1mrHzTbgCYYH2/2BAjpViNDB32nYwqqyZ/4Rtr8xfKO74LISPfG/OKUyoO6r7WIOVYpJFCqmnlTRkwhZZee+jYomje6lNwkeBbXm4F4WOBAB0XhzV8qzI70BOcE679iLSsstJsPxYCS8MUx4ysRUBFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RaWt6KcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCAzkj6P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RaWt6KcE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCAzkj6P"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K0dL3190609
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	083Snwut7Mw8qpTtzKOn+XObDazien3KXA4k/wAuIPI=; b=RaWt6KcElPfNNlbe
	FjTrHYzztz33Onfo+w15wC8EcZv4UnLRvnItGcsFGtY/wCxLDk9iAyOU38Aiv1Cg
	nReaFBpfRjMSygaIfHIJd87QeBfsASlHPfzUn5g7CstrktIq9dOjo6jyLBiIcmJf
	pBLTqCJq37dtn18pJg4+4dGhPnK0unTGRk6TZPM2jaXQQR/KqNlp+1ovpP6d7PW1
	RZyskZTV4yXmW1ZivAl6y7SgwaM5PHKYQDdyN2m/ivEcnDLXxzoPBFn90jooQvs7
	zL/FBd7Ap7lZCK4yT4R2oqa0sSMboaoL1b5rHQQMmlmpYo2qKGLa8jnyDz7e/bI5
	GmeY6A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6a4je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:14:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so6873372eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450877; x=1792055677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=083Snwut7Mw8qpTtzKOn+XObDazien3KXA4k/wAuIPI=;
        b=SCAzkj6P2KGJaQ9IFaoQBlXzweoT0FzlixEHdnqxrYkI11ZSe28fgi68JWwJPS5SkF
         F8kXhP+4C/77C+ybkNKN8BMrxIKOO5B6iSrFkDUzVMGRoKfZfD5nMAI3mWhFuz1EYWhh
         XTgSspgaCPEdpb+EgD/uUvgU+Jp75Womrgt5ZAg6pR7iPpbeTw17bXw0FFN0IlHIqpXE
         1DZHn+GeZQfws5+m+nQKOvNSAoOo/gUe+P5sEVS4AoQQ9pQHJrJBwdjYGD+NMADk6e8X
         Ue9ER8IwPqpJPBUAnSgACj1meMgU14+Urb6vjKfRzbLiShohcqMdbc+KnULrlOo1VXLs
         Kxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450877; x=1792055677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=083Snwut7Mw8qpTtzKOn+XObDazien3KXA4k/wAuIPI=;
        b=XkkSAbnARrGCTLRYl5G8vhEFLtCIxWpB2nNnVyj9gsJZTR/WjSrzKN5jVqYI/Q02yR
         XuEZP2y5niuAbWQkIWSZK6rdAF24qOfp8GIWbZYLb3IIFR3TI80Zg6jE55FW0+xYRZKv
         PrNuG8nWcxA1iUDyQxvZuN6IcaigREmsjRVcPzzQHLSEkxosMKleZWajtsuDUPttbu/5
         K6+yXoYICFWx1zpn97F+0RPrIuJdEe+2dqDJIZdnpK4iwHFQqbmE685PDPbtLwD7qrfl
         kmLO5u06r1bZLCs44YjOr5uJUXWExIzAFccYtTLhjLu5rKss2kTcJzF8imx5ASX2Hlb/
         P13A==
X-Forwarded-Encrypted: i=1; AKwUvBwfesJ0ecup/zcElhgjVIFJTBeHv34vgSXdAfpJAwmTB4DzvDrtnrTMZAr5Ud8FqFZ2vrU9ckNNwC8/Bi0=@vger.kernel.org
X-Gm-Message-State: AFuF++kqGM7vNGtrRDQmqCbVO05PWqLWvTvF/6R/DhA+uBWBMDwHPrEf
	ZI8JtTfLwGtmuZIQbc2srwfqnA8LIg+pNiD+47MsZro999vHaS5I5q+ANYhyoNFOa5ZblSigxJ2
	g8mBwQFuOfKvoBE4c4upjrtixSr4BHY8c8fO1rm484Z50nBZLZQlr5HfIQAS5bDpe3Cg=
X-Gm-Gg: AYBFou2JSn+QAGbPo9TbUheQxgV6iUOwwxXnagRQ632EHesReqz2Zw7jP0sUMuICMEe
	ym770HfEG6hs7QpgzRYugZLBS2dt9s9LGdD/q9sOTBpWolGa8ze+n4l+cxpgnk1jqMly+EsUSif
	Fx2Mhnq7ojNBXG6Ml9RDjFG/ovJ1xo9tOe7qfAwTJScS33eiI4IW0vU9Db8BjMIaZ5ilVihK2Zy
	I2Zg9pOTV9xb0AXQw7R5HMjAD/p2zwtKDvR5tOkb+kaEF6A9MfBLMhoks19USp/O6z9e+kB7c9W
	mkfOcNhDhw0kJZu0R1eIeiTfrUqwBE8Zcg3+hQYtW3DeSWzHFOBvHoqxceh+VAhiJyckws3C9iQ
	oYYT22cTJrAvUiMi/gW+9qHKCKfZgh1sO0M5X047wCjoYYA8U60v3VWiV8vgFHv4pPYAdm1Ecmh
	tQrkN+D9czUdgUgrfoMTU0z1AnYC4S
X-Received: by 2002:a05:701b:290a:b0:14a:a6dc:9ca6 with SMTP id a92af1059eb24-161fdbeb66dmr5864520c88.3.1791450876989;
        Thu, 08 Oct 2026 02:14:36 -0700 (PDT)
X-Received: by 2002:a05:701b:290a:b0:14a:a6dc:9ca6 with SMTP id a92af1059eb24-161fdbeb66dmr5864472c88.3.1791450876100;
        Thu, 08 Oct 2026 02:14:36 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:35 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:21 +0530
Subject: [PATCH v6 01/11] arm64: dts: qcom: ipq5210: Add nodes for multiple
 peripherals
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-1-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 7xwhG7Zp4XcFAZkIHG_B0DEYx6VcV1Fl
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac75efe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=L-oS5-zLtgPf8eA3vCsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 7xwhG7Zp4XcFAZkIHG_B0DEYx6VcV1Fl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX4Xe97PqFA6pi
 VawTgorYvbOgmgW+WUwNVP/pgLijd69g+x/FvSFkY6FNkkEGtRCfT0+9Qq7IFkH3m0iHeN1IErG
 EzYHMdtbqg9hJ/7L809gtnt9TJ8KzpstmKSHDVnlBSDisNQTjpyRyo+tjGS9zupTxox4NTW4ytz
 BQwsl+BtOUTT2ENhbAT39rNDfM0ZASEcLA1D4CpZYwAIrO7a6nhyPulTATogxQ8j5JwG/Q5XZSl
 GCK+SVvqy8JQU0Z/Eg2c/BgrZ9zUFUbc1uaPlYsVWCxo158CEUfLbtJEWTy27mbyoXXk/C4oYHk
 +Fa7CrC+yAH88vwRI+kAlPgPcS+exV+VzWbN7A3wMrOwZOV7zl8m8LKbXcEz7/6jfLLQRN8P4NQ
 JS5cnM1xjxbwIgKEukmXBHQjCzKh+4vU+/Ul3zjV/MFyCPkQMCyW+4wK3dlTCyDXT9xyEJ2S+YZ
 HpHg/SgwqE65fM0YYcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX5Vjm7XpPocPb
 R7InSzohs3fzQk10kDlzJ9Yi+BrDlJYQ8pCJN6m18AlbOJEeV4vzpuDm5CpxNH57N7S9fqcCgtz
 JYMVFx1ITYVj8k6kP9kk4LUMGui9keU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080036

Describe common IPQ5210 SoC peripherals in the base DTSI so board DTS files
can enable the hardware they use.

Add nodes for USB, PCIe, QPIC NAND/BAM, QFPROM, TSENS and thermal zones.
Also describe the CPU OPP table and CPU cooling cells needed for CPU
frequency scaling and thermal throttling.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 605 +++++++++++++++++++++++++++++++++-
 1 file changed, 599 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 20e8b240642c..161b5bb5a7f7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -4,8 +4,11 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,apss-ipq.h>
 #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/interconnect/qcom,ipq5210.h>
 #include <dt-bindings/reset/qcom,ipq5210-gcc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	#address-cells = <2>;
@@ -28,36 +31,48 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
-		cpu@2 {
+		cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
-		cpu@3 {
+		cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
 			enable-method = "psci";
 			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+			clocks = <&apcs_glb APCS_ALIAS0_CORE_CLK>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		l2_0: l2-cache {
@@ -84,6 +99,40 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	cpu_opp_table: opp-table-cpu {
+		compatible = "operating-points-v2-kryo-cpu";
+		opp-shared;
+		nvmem-cells = <&cpu_speed_bin>;
+
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-supported-hw = <0x3>;
+			opp-microvolt = <850000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-supported-hw = <0x3>;
+			opp-microvolt = <850000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-supported-hw = <0x3>;
+			opp-microvolt = <850000>;
+			clock-latency-ns = <200000>;
+		};
+
+		opp-1416000000 {
+			opp-hz = /bits/ 64 <1416000000>;
+			opp-supported-hw = <0x1>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <200000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -130,6 +179,170 @@ soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		qusb_phy_0: phy@7b000 {
+			compatible = "qcom,ipq5210-qusb2-phy", "qcom,ipq6018-qusb2-phy";
+			reg = <0x0 0x0007b000 0x0 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "cfg_ahb",
+				      "ref";
+
+			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
+			status = "disabled";
+		};
+
+		ssphy_0: phy@7d000 {
+			compatible = "qcom,ipq5210-qmp-usb3-phy", "qcom,ipq9574-qmp-usb3-phy";
+			reg = <0x0 0x0007d000 0x0 0xa00>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB0_AUX_CLK>,
+				 <&xo_board>,
+				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB0_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+
+			resets = <&gcc GCC_USB0_PHY_BCR>,
+				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "usb0_pipe_clk";
+
+			status = "disabled";
+		};
+
+		pcie0_phy: phy@84000 {
+			compatible = "qcom,ipq5210-qmp-gen3x1-pcie-phy";
+			reg = <0x0 0x00084000 0x0 0x1000>;
+
+			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
+				 <&gcc GCC_PCIE0_AHB_CLK>,
+				 <&gcc GCC_PCIE0_PIPE_CLK>;
+			clock-names = "aux", "cfg_ahb", "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
+			assigned-clock-rates = <20000000>;
+
+			resets = <&gcc GCC_PCIE0_PHY_BCR>,
+				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
+			reset-names = "phy", "common";
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie0_pipe_clk";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@f4000 {
+			compatible = "qcom,ipq5210-qmp-gen3x2-pcie-phy",
+				     "qcom,ipq9574-qmp-gen3x2-pcie-phy";
+			reg = <0x0 0x000f4000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_PCIE1_AUX_CLK>,
+				 <&gcc GCC_PCIE1_AHB_CLK>,
+				 <&gcc GCC_PCIE1_PIPE_CLK>;
+			clock-names = "aux", "cfg_ahb", "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE1_AUX_CLK>;
+			assigned-clock-rates = <20000000>;
+
+			resets = <&gcc GCC_PCIE1_PHY_BCR>,
+				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
+			reset-names = "phy", "common";
+
+			#clock-cells = <0>;
+			clock-output-names = "pcie1_pipe_clk";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		efuse@a4000 {
+			compatible = "qcom,ipq5210-qfprom", "qcom,qfprom";
+			reg = <0x0 0x000a4000 0x0 0x741>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cpu_speed_bin: cpu-speed-bin@28 {
+				reg = <0x28 0x1>;
+				bits = <0 8>;
+			};
+
+			tsens_sens11_off: s11@3dd {
+				reg = <0x3dd 0x1>;
+				bits = <4 4>;
+			};
+
+			tsens_sens12_off: s12@3de {
+				reg = <0x3de 0x1>;
+				bits = <0 4>;
+			};
+
+			tsens_sens13_off: s13@3de {
+				reg = <0x3de 0x1>;
+				bits = <4 4>;
+			};
+
+			tsens_sens14_off: s14@3e5 {
+				reg = <0x3e5 0x2>;
+				bits = <7 4>;
+			};
+
+			tsens_sens15_off: s15@3e6 {
+				reg = <0x3e6 0x1>;
+				bits = <3 4>;
+			};
+
+			tsens_mode: mode@419 {
+				reg = <0x419 0x1>;
+				bits = <0 3>;
+			};
+
+			tsens_base0: base0@419 {
+				reg = <0x419 0x2>;
+				bits = <3 10>;
+			};
+
+			tsens_base1: base1@41a {
+				reg = <0x41a 0x2>;
+				bits = <5 10>;
+			};
+		};
+
+		tsens: thermal-sensor@4a9000 {
+			compatible = "qcom,ipq5210-tsens", "qcom,ipq5332-tsens";
+			reg = <0x0 0x004a9000 0x0 0x1000>,
+			      <0x0 0x004a8000 0x0 0x1000>;
+			nvmem-cells = <&tsens_mode>,
+				      <&tsens_base0>,
+				      <&tsens_base1>,
+				      <&tsens_sens11_off>,
+				      <&tsens_sens12_off>,
+				      <&tsens_sens13_off>,
+				      <&tsens_sens14_off>,
+				      <&tsens_sens15_off>;
+			nvmem-cell-names = "mode",
+					   "base0",
+					   "base1",
+					   "tsens_sens11_off",
+					   "tsens_sens12_off",
+					   "tsens_sens13_off",
+					   "tsens_sens14_off",
+					   "tsens_sens15_off";
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "combined";
+			#thermal-sensor-cells = <1>;
+			#qcom,sensors = <5>;
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;
@@ -146,8 +359,8 @@ gcc: clock-controller@1800000 {
 			reg = <0x0 0x01800000 0x0 0x40000>;
 			clocks = <&xo_board>,
 				 <&sleep_clk>,
-				 <0>,
-				 <0>,
+				 <&pcie0_phy>,
+				 <&pcie1_phy>,
 				 <0>,
 				 <0>;
 			#clock-cells = <1>;
@@ -205,6 +418,87 @@ sdhc: mmc@7804000 {
 			status = "disabled";
 		};
 
+		qpic_bam: dma-controller@7984000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0 0x07984000 0x0 0x1c000>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		qpic_nand: spi@79b0000 {
+			compatible = "qcom,ipq5210-snand", "qcom,ipq9574-snand";
+			reg = <0x0 0x079b0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&gcc GCC_QPIC_CLK>,
+				 <&gcc GCC_QPIC_AHB_CLK>,
+				 <&gcc GCC_QPIC_IO_MACRO_CLK>;
+			clock-names = "core",
+				      "aon",
+				      "iom";
+
+			dmas = <&qpic_bam 0>,
+			       <&qpic_bam 1>,
+			       <&qpic_bam 2>;
+			dma-names = "tx",
+				    "rx",
+				    "cmd";
+
+			status = "disabled";
+		};
+
+		usb3: usb@8a00000 {
+			compatible = "qcom,ipq5210-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x08a00000 0x0 0x200000>;
+
+			clocks = <&gcc GCC_CNOC_USB_CLK>,
+				 <&gcc GCC_USB0_MASTER_CLK>,
+				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB0_SLEEP_CLK>,
+				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB0_MASTER_CLK>,
+					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <200000000>,
+					       <24000000>;
+
+			interrupts-extended = <&intc GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			phys = <&qusb_phy_0>,
+			       <&ssphy_0>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			resets = <&gcc GCC_USB_BCR>;
+
+			tx-fifo-resize;
+			snps,is-utmi-l1-suspend;
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
@@ -244,6 +538,24 @@ watchdog@b017000 {
 			clocks = <&sleep_clk>;
 		};
 
+		apcs_glb: mailbox@b111000 {
+			compatible = "qcom,ipq5210-apcs-apps-global",
+				     "qcom,ipq6018-apcs-apps-global";
+			reg = <0x0 0x0b111000 0x0 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&a53pll>, <&xo_board>, <&gcc GPLL0>;
+			clock-names = "pll", "xo", "gpll0";
+			#mbox-cells = <1>;
+		};
+
+		a53pll: clock@b116000 {
+			compatible = "qcom,ipq5210-a53pll";
+			reg = <0x0 0x0b116000 0x0 0x1000>;
+			#clock-cells = <0>;
+			clocks = <&xo_board>;
+			clock-names = "xo";
+		};
+
 		timer@b120000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x0b120000 0x0 0x1000>;
@@ -307,6 +619,287 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		pcie1: pcie@50000000 {
+			compatible = "qcom,pcie-ipq5210", "qcom,pcie-ipq9574";
+			reg = <0x0 0x50000000 0x0 0xf1c>,
+			      <0x0 0x50000f20 0x0 0xa8>,
+			      <0x0 0x50001000 0x0 0x1000>,
+			      <0x0 0x000f0000 0x0 0x3000>,
+			      <0x0 0x50100000 0x0 0x1000>,
+			      <0x0 0x000f6000 0x0 0x1000>;
+			reg-names = "dbi",
+				    "elbi",
+				    "atu",
+				    "parf",
+				    "config",
+				    "mhi";
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			bus-range = <0x00 0xff>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x0 0x0 0x50200000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x0 0x0 0x50300000 0x0 0x0fd00000>;
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
+				 <&gcc GCC_PCIE1_AXI_S_CLK>,
+				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE1_RCHNG_CLK>,
+				 <&gcc GCC_PCIE1_AHB_CLK>,
+				 <&gcc GCC_PCIE1_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE1_PIPE_ARES>,
+				 <&gcc GCC_PCIE1_CORE_STICKY_RESET>,
+				 <&gcc GCC_PCIE1_AXI_S_STICKY_RESET>,
+				 <&gcc GCC_PCIE1_AXI_S_ARES>,
+				 <&gcc GCC_PCIE1_AXI_M_STICKY_RESET>,
+				 <&gcc GCC_PCIE1_AXI_M_ARES>,
+				 <&gcc GCC_PCIE1_AUX_ARES>,
+				 <&gcc GCC_PCIE1_AHB_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			interconnects = <&gcc MASTER_CNOC_PCIE1 &gcc SLAVE_CNOC_PCIE1>,
+					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie1_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie0: pcie@70000000 {
+			compatible = "qcom,pcie-ipq5210", "qcom,pcie-ipq9574";
+			reg = <0x0 0x70000000 0x0 0xf1c>,
+			      <0x0 0x70000f20 0x0 0xa8>,
+			      <0x0 0x70001000 0x0 0x1000>,
+			      <0x0 0x00080000 0x0 0x3000>,
+			      <0x0 0x70100000 0x0 0x1000>,
+			      <0x0 0x00086000 0x0 0x1000>;
+			reg-names = "dbi",
+				    "elbi",
+				    "atu",
+				    "parf",
+				    "config",
+				    "mhi";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			bus-range = <0x00 0xff>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x0 0x0 0x70200000 0x0 0x00100000>,
+				 <0x02000000 0x0 0x0 0x0 0x70300000 0x0 0x0fd00000>;
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			clocks = <&gcc GCC_PCIE0_AXI_M_CLK>,
+				 <&gcc GCC_PCIE0_AXI_S_CLK>,
+				 <&gcc GCC_PCIE0_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE0_RCHNG_CLK>,
+				 <&gcc GCC_PCIE0_AHB_CLK>,
+				 <&gcc GCC_PCIE0_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE0_PIPE_ARES>,
+				 <&gcc GCC_PCIE0_CORE_STICKY_RESET>,
+				 <&gcc GCC_PCIE0_AXI_S_STICKY_RESET>,
+				 <&gcc GCC_PCIE0_AXI_S_ARES>,
+				 <&gcc GCC_PCIE0_AXI_M_STICKY_RESET>,
+				 <&gcc GCC_PCIE0_AXI_M_ARES>,
+				 <&gcc GCC_PCIE0_AUX_ARES>,
+				 <&gcc GCC_PCIE0_AHB_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			interconnects = <&gcc MASTER_CNOC_PCIE0 &gcc SLAVE_CNOC_PCIE0>,
+					<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+
+			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie0_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+	};
+
+	thermal_zones: thermal-zones {
+		ethphy-thermal {
+			thermal-sensors = <&tsens 11>;
+
+			trips {
+				ethphy-critical {
+					temperature = <125000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+			};
+		};
+
+		pon-uniphy-thermal {
+			thermal-sensors = <&tsens 12>;
+
+			trips {
+				pon-uniphy-critical {
+					temperature = <125000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+			};
+		};
+
+		nss-top-thermal {
+			thermal-sensors = <&tsens 13>;
+
+			trips {
+				nss-top-critical {
+					temperature = <125000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu0-thermal {
+			thermal-sensors = <&tsens 14>;
+
+			trips {
+				cpu-critical {
+					temperature = <120000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+
+				cpu0_thermal_alert: cpu-passive {
+					temperature = <110000>;
+					hysteresis = <9000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_thermal_alert>;
+					/* Set maximum frequency as 816 MHz */
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu1-thermal {
+			thermal-sensors = <&tsens 15>;
+
+			trips {
+				cpu-critical {
+					temperature = <120000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+
+				cpu-passive {
+					temperature = <110000>;
+					hysteresis = <9000>;
+					type = "passive";
+				};
+			};
+		};
 	};
 
 	timer {

-- 
2.34.1

