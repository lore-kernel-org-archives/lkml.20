Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956876;
	b=ZV47ec4yu1LfeDEO6ZxchnAqqPMCuwfeYYlgGgUQ13MtciHWKUPJJ1KY9P93I8JTwM8f
	 WYeIlOctZD7a3zFdfpEkg/d9eiq06FXJUE/T625f/KQTzLtJMpo2op3inqjKhHqEbOTJF
	 3ahCWh4eM7X1DVmn9P6wvN5Luf8zKOaCLE+G/MoDvdZBeIaJz7/dc4I8sx1d5XxY7Ach9
	 ff4aXA/65bJ1XXlq78iBB6LSb0yZS9WuJmnt64uShO1VLNVFG6h2LdzQf9O2ElzraEjWi
	 gFNmDnc+B/uZfcslfdU2/Ju65IW3WGAgt7jbkSWD4SA/IrYsliLqp/vg3L6QivGGV+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YcqFaFzb5BcQeJQBxyHIpDyUgxFseSvCMfSnsdJE/k8=;
	b=O1erXCnpIqcrdrv60ZCvp25hpJbhjrrDA3lkhcOe/3qRSjcFP0ZMA0kdGu5/sXaJDyIc
	 A+pOLh3OOHJmFam7k23XMRUlBrIBR/UGFKSJRHf7/XNZLsL/MgNKhdWwuJVZcvFFTXu7j
	 RFGR7S9+gXTCIMLskw24cibhiKCSeM+wRBwWYVpKTp0U7My7130BYiwECOrbPk9g4UhFw
	 3G+4155vshM1mCq/62Ex+lIVKjX1T23oBnCGMpJq2evXVc9JuXWt8Ujs16Ai/lW9AimN0
	 8O/eNre/FeAVXU9kKu+dQjlhAYq44vbpIoylnIb6Z+Y5GQPrkFAVOFfxjEkmnSyHjdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5jKQv5w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Eus8n/TD";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE512606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE512606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5jKQv5w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eus8n/TD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RBFc045292
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YcqFaFzb5BcQeJQBxyHIpDyUgxFseSvCMfSnsdJE/k8=; b=S5jKQv5wjEI9RFu8
	4Am1Xh6yYyokaaapKkQLe9kWP/BqJxXbtCAKJ83om9VGNF9pXmqEPys80GZnHwSR
	oBNR0OIWaUjuWslF4lpD8bHJGLO5YdGK6oncAbkE86HNb8IMWCb+q3dtAivJPMxk
	zsAtZScBFH2l6zJCzO8NcdKQxKja7UYHJI8frZcxIyIFj4dHxLCNxqQ4RIe35hXc
	luDWe7tdyaf6TsMNUjcTlXrpXOBXFe43op7GLoIiGxF0TqhRMmFfkJf6Ryc7hlWL
	8JQzPzH1WCxRlhfm5S7hVU1OkvLXCKTDgsxhLshyBlAMzxOKY24DPkSzgcO2qqHR
	E0Zqng==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9t437-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36cec75d8caso646152eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956873; x=1794561673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcqFaFzb5BcQeJQBxyHIpDyUgxFseSvCMfSnsdJE/k8=;
        b=Eus8n/TDvpEgPayLYKg4lwgCZlNQmx9xSJIarXS7PXx+sxa1/+3Tgz2qzh9eMpY39O
         rLNKYuph8v3Cq7xD+uX60WHm2WZ/mzp+uUdzEe5UqbPod+r2OHkqdP0a1liw9iM0qJ//
         rkmvAxjjvof7jys4DO0uYhvfwXcTdvaLAMy3hNu5KiCWxeEAeAjjgf79PRXGqlXDQrIe
         tGUZ0X6PGfcnWYCCKYZaHRL2rsby7hGLe2DqvXHWMqPAkvcZUS8vU+n02rw/GH4XjoCN
         Zn4WM3y9QTxEm+ecfAQAyBANz0RnqjebH6e0dUkL1Q5yUH/83JLVKdjjYjLCdcu4sba6
         2k+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956873; x=1794561673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YcqFaFzb5BcQeJQBxyHIpDyUgxFseSvCMfSnsdJE/k8=;
        b=1pLiXfu2Ud2qfomXteiOWMxObD0Y/DRRtsKlwkYgiBI8DV05JqamEFAIp+oLIBg2I8
         EDaYHf1HDi0KiMu74sEwy9KkJKcdDGT3Gt7dlYjVC3gzdUnYuKc8CNGFPObyxPp0eVva
         nKd9mNbyIxo8riQDCSA/XMbzurp7DUbS1fdsFaFm0CyYyqaldyX7d91XE8KR8pLxEJzJ
         wTNBbvETTjEc89CAuLvfEkSEmITXsyr4wFFTFwffx1Bt/nURy3/eDGE4SYOlr/HOa1qy
         a3ybvr7lh0bqqTqLtqdo4wUanl4nSFA6Y17iI9aEzLI1UNh9O3Q+H+pcTBSp/+GIbpxe
         zn2Q==
X-Forwarded-Encrypted: i=1; AL+hErE51ejPtohLIksajMfm7g/PORZ+3ar/aiBjgALVObSpMOtdGx+YhQujIN4wJB6YPOeIzqhruRyJZNLBguc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pPdMkmfHUJ9shTZZ7uJcwRIQi6IvOXuloxWVbVs1p9usYWrOe
	fBBIH3GIwYwH7j5tLScZQdIIR915CgMZQhWL+QXQsER97R8szlBM66S13iXk9h0MnA2yz0f/uJt
	lr+m93uotq3dj6D2QOhahMvmk6Kq6tlt8Uv3iWr1JKbMbLuO/mljzgLwLmo3HYpt+rvU=
X-Gm-Gg: AYBFou2S2w/q79pgw87tjZoo7RSp8bWz2pHbn24ja0ERPaZyTvAuvRbS4A//Zb4UNwB
	x3d0AAb+7bciSEbNQXdjrx/F/hItbeQz+9ZC2PArFrG2RY7lvpIYaQg4bHUIzQo3faWvkf0+5hS
	HlkGKQe2BTPKYl+BhMB8XYRN4JUfmxGifTWZsb8+16frTEUsP0EZvOjf6QKRihO5j0G3OjNI+xY
	T6xjopM6lMU3K6GzzmpECqtaEZOjVXvIY4EeDkaqj7qbNvQypyFw0g2YRu1NoOfY+QjhkhXJ8Zv
	WuOgqXSTgOBBthJK+zzcvf8+cAwRNbRH733xqgU6Pz/boN4fIxWTwf+RT6ZJmQFzqn9pYNrCpzB
	b9620p3QZ1Rixt3evc+4+ICkvPq7lHGZJG4WthUg9fUMhE/fkSo/mlmQnJCb4afh8pcrhKvSYhR
	XWJOJtPm1vvRWT74MK5JWHZk1MU6JwrDweZB3bE0A3xYxXV9IFzX+K8T+eV+quB6d8+9w96JwJs
	nEoSA==
X-Received: by 2002:a05:7300:841c:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-36de743530bmr6566559eec.23.1793956873210;
        Fri, 06 Nov 2026 01:21:13 -0800 (PST)
X-Received: by 2002:a05:7300:841c:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-36de743530bmr6566516eec.23.1793956872547;
        Fri, 06 Nov 2026 01:21:12 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:12 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:50 +0530
Subject: [PATCH v8 01/11] arm64: dts: qcom: ipq5210: Add nodes for multiple
 peripherals
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
Message-Id: <20261106-08-dts-v8-1-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXxui+6w84Y4ge
 rMbthtR3GGZAGa9pift07SEJVIATWaMg/MuwcMLRle4tYO2dbivXYAQxru1DTCr3MwEBPHoAbAM
 JEzBSvLH7/GACUp9L6AZnVkfNRKp578=
X-Proofpoint-GUID: cHcXRGjYC7FsZzjnwlBCeoZp_T-83h-W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXxH4NcNqkVGyo
 yj5Ho6KyHYfUYwgh6C6FnMO3QRZWAxaazaaIJCyIsabr3KdmWjZrNgVNL8CfaOtxGAqo6P/i4nX
 DYqusOnvEKLuFLqx15uiWUDy4GVdMp1VKKMa/3ZkDhAfh0DwwkfcvK8BG4g1WxuXJf2VqDCMQxl
 OAlxQCYEga1UdMcwDIXlV6Ne2bshMUTvEzFk677gNIjlUAwLhRSzFR5uBKSVkJ9wTyBlV7TnIm0
 Knzgf85rQ6wcghGiTNW5v6nJKzkwIbB/UDWx4ZSvA+Qnpx5usDKsMAkn4cqKj3JA1AZdHQ9BvNn
 lgZD3HeKu30guB9z7jCWIHZpk7XTsLRzqmfbvoagR0S4MLgq1K6Lf7TPlTnZ4GiP7hlPQbuTkPt
 awfSGkNRL1tyk2MLuY8/iHzBlNURI2QHiO2ERP+v96gMyKgFGBw2/ZBury6+okdrJa/XKn27Ux/
 ++GPy9Add6ZDNHwSGIg==
X-Proofpoint-ORIG-GUID: cHcXRGjYC7FsZzjnwlBCeoZp_T-83h-W
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed9c0a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=L-oS5-zLtgPf8eA3vCsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Describe common IPQ5210 SoC peripherals in the base DTSI so board DTS files
can enable the hardware they use.

Add nodes for USB, PCIe, QPIC NAND/BAM, QFPROM, TSENS and thermal zones.
Also describe the CPU OPP table and CPU cooling cells needed for CPU
frequency scaling and thermal throttling.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 606 +++++++++++++++++++++++++++++++++-
 1 file changed, 600 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 20e8b240642c..81af32af4047 100644
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
@@ -205,6 +418,88 @@ sdhc: mmc@7804000 {
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
+
+			status = "okay";
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
@@ -244,6 +539,24 @@ watchdog@b017000 {
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
@@ -307,6 +620,287 @@ frame@b128000 {
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
+				 <0x02000000 0x0 0x50300000 0x0 0x50300000 0x0 0x0fd00000>;
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
+				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0x0fd00000>;
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
+					temperature = <120000>;
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
+					temperature = <120000>;
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
+					temperature = <120000>;
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
+					temperature = <115000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+
+				cpu0_thermal_alert: cpu-passive {
+					temperature = <100000>;
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
+					temperature = <115000>;
+					hysteresis = <9000>;
+					type = "critical";
+				};
+
+				cpu-passive {
+					temperature = <100000>;
+					hysteresis = <9000>;
+					type = "passive";
+				};
+			};
+		};
 	};
 
 	timer {

-- 
2.34.1

