Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7AE401A14
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243116; cv=none; b=J/lIs35IE0GyXMlfQF+Km7F9V0ZhPtAIynN05pHYsyD6m/z/hfTTMegwfJH0KeM4/WFE6sw63m/dQSL41xhUdONhu4UCn9AyGjG3PQn/AeRSQ3HLfDjIlSX9RKJRBDSx9ry6Bp2Nfe1iMDhqcHzrhWseiix3xSAhAAtlnk7SDzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243116; c=relaxed/simple;
	bh=B8adGb62mFEykDEZtmq1HeqsuhcAcPwEsLw9I4djGzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Baa9g78lG8Sfs6um5ZC7EcsZCB/aEOo8aebCMnEqFUpD9p95uhGw4N+7+8cgq4p8ttOjz0A/pazDMgCC2Y6QdKPNUsPAHSYXROfX1nOuWm0qwUnw6/5XsEN/3jZoMS8nOk5aNRGPlnuudQlRmdcXeT31CKVv7KbWfYC36lAqJuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=goks4mov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kV8os9pH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="goks4mov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kV8os9pH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PqZE2775655
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J/79Kk4C5UbIDKqD7ckWE4dOuSTVQY56ZWq
	Q41O7b04=; b=goks4mov8gaST1pXM1/a3X80PcYPdCdy+bdsfg+J8oXLsli4qIY
	66jFWnFnUalZt51tLpW0RxTGc43G6vpMPntU9HS/ymiUUsfpq4BN+kZLxQJZWfW1
	i/X0XiwCoemHmJ0DfPxB4u68mKQhm4iXtaYuAO/ypMyS9mKiWo3kAY6ld40AuPc9
	ha95YhPYKd0VLjzOY9i10/esu4Y/gw/76tLUVTVklUM6Pw6wKab97oMs+ir+1Hml
	6gltB95l7O7qibmUeiy8st2lhKLWcuSuX9c5Lwo6FctmqUdp16B2EMVRxdN/pGrC
	O7CMHpVBolchRhzWxKCZrDjM2fVZ1h9dYQQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxvd6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:45:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2782042eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790243099; x=1790847899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/79Kk4C5UbIDKqD7ckWE4dOuSTVQY56ZWqQ41O7b04=;
        b=kV8os9pHwB4XO5K5or6dmd2ISxzVB0eHLj0VyKd6t4ttwXwseuoheOYVh9qCOYQhLr
         LW1T3HvkW1boY7HDnDEf0Locnv/BT0pKTspM9SZlS+sS2aHewB3AWtvtX6vGZGnyn8Xx
         PM4k0uFjIIoedhGJIieznSfdtyCEA/JDALAGvN4QTbnxgPk5eTMFfqmVoCBrEj3akqR+
         g2FjtdpN17TgdA02YXBaQop3YLBwcswFRfuHScnOp5Dp91hLyMETWghomS+P0rBnZQoZ
         m83UwABugvPy1oHpEKKJsa8AkrQ4UuLAMr+7FPwE7mCBW/OBc1vsnGvcR0aJDWW12tzB
         ElaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243099; x=1790847899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/79Kk4C5UbIDKqD7ckWE4dOuSTVQY56ZWqQ41O7b04=;
        b=BXKTxEzSrZdMdsPgWMTpT87dwuZurh3Xw4KpBW9K57j4t5GPhCEgTVRfM7GxT1pw+H
         7Zm/0gr2yNxQJoyZBXHKgaoRcydz6SsgP3pEgL/j+ACKm0GyZmj16yZ/zI9a8vBKyulh
         7RzEKW6i7dLjogqHtc8IfwOC5fYWlfs0t/MtU4byiNmoXdra6gWYCZ3BRVxjQjgxJZoY
         TGi+9YN7lMVE5owT8wYevHFS/hfdweADPahOFbJHgAKlv1cYc7idxL40tyMNpx8arGcI
         x7P72ZCg1mU65zVwEVVHwkN+11ONcRA1SDd1yQzZeL09Oqk+O4Q9ewa/giSFTC0fCAmR
         WY1g==
X-Forwarded-Encrypted: i=1; AKwUvBwyRrGLsY9FJX6xb7ezaMzj4s4hUno/jdFWxT6aRjRgby+rX4OppFRvXDgLcmlHDNO3BQEvIByvfaErgwc=@vger.kernel.org
X-Gm-Message-State: AFuF++nRnQVrJGcQTkE234l3eyMkoF0HfwnqmgvchItn2eHFexr9ddDT
	DO/rAR39HllOq9ce/6A7rVr8RZrCh2a9OGdiDoQtZYUHJUW+8kiqFULGdLD+e1oyN/oayifRwrQ
	gHUrR8/3u7Tx7wlHyRKPpCWlFfBtsonWAyGRsRUiQgLFKT0yfIhsfr+M4g5BdlCDtWpc=
X-Gm-Gg: AYBFou2CoQIakG07OKq7DHd+G3x38lIUZ/t5YRakGYXgW24D62jyXx0VlvuqxJw6WP/
	CRkCIVRKSd72EVtg+HSfV5OjI3XeIBC7+aVW7l4vP0BjaUm5azOsm2ZT0Ja7z2OmiAjmBtjZ8XN
	GzNg2SY+PDa+s4SJ09uLZSTwkocGkdSmNDZWn9i1lcHOLykXbaWSINfe4tqaLLjT+vXqskQfLF2
	j6gx3EcDX/A5IrSeBRZ5QGBLhSwC5PXS2gGb1dOtqgUgfws9N6S1y5u8L/JJLmLYF+pmaikua3p
	A9j5O2md+XJ7ltBDGdARlR//kMIiqoxON/+enyi8UfHXD4Wu7GpqtCVgwpXqBcRmiGMiJpSibJM
	l2FqUjPmDFKXSW01jq0LLPiFvKLTBXqgbUdj6uoFKweq3Xz9MopvbhYj+Qlc=
X-Received: by 2002:a05:693c:240a:b0:315:afc1:72db with SMTP id 5a478bee46e88-33ffe955a25mr1406544eec.9.1790243099171;
        Thu, 24 Sep 2026 02:44:59 -0700 (PDT)
X-Received: by 2002:a05:693c:240a:b0:315:afc1:72db with SMTP id 5a478bee46e88-33ffe955a25mr1406513eec.9.1790243098521;
        Thu, 24 Sep 2026 02:44:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96946d0csm13654309eec.21.2026.09.24.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:44:58 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: nord: Add more clock controller nodes
Date: Thu, 24 Sep 2026 17:44:48 +0800
Message-ID: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -NdPDnIEr-6fT1I-XrXCaZUAEPXMsufm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX0k8Oqlf1yeUJ
 +k+qRaHtPW4FHo6c/07BSj+gT6+TW76cBnR0z2FQxVxzZhW2gQKG4azxDMOJKEoQpIU2fyU6yJj
 vvFpufXdwNY9GW+Rb6TK0m0+uytzug4h19d52YDQ0nLrjTpJ0T9eb8yDoAoTZQf2wUJfUNoBNI+
 2dS8SdCJvcFUTkK6OY568n+HIEZfiw81gn4L6qTzB2tFBzVJ4xEuqrBjIANe6Zjv3NBtL2sJgFi
 fEuF9EupjYrZ/o1kOKZQeILZQUiZdZZTILcsX+RqRX7pyw+TY8naX2q74/PIU08wWlznUtBmeDV
 3/BfETg2+iT5sHdj62QK2oxTrWOVgcV6FPQ+2SwK6tvgz9XwKuQFRRBLyqc43MibdCyix1opMhT
 n8OFVr7Qs37qdUn+AAanMxH7f+STEYBxplMGjDFUwjaswW+Aim8jiLfTZJjLrfw5kyQ1lcxBfNw
 thDrhV8t6PNTu/+sU6A==
X-Proofpoint-GUID: -NdPDnIEr-6fT1I-XrXCaZUAEPXMsufm
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab4f11c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lLTCYSv0VJgAjLIAHVUA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX62zf6uuRZFs0
 ovO7w04EEMvNEDWET68M8slzZN/ahreUQgyZq60w2nwcDiNbgU1EAnHdEy3aO2XB/xI06+LOK0O
 Qo/2CFfmD3P+4le/0xL0QHTPThntRAM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240040

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the GPU, camera, video, and display clock controller nodes for
the Qualcomm Nord SoC, along with their required dt-bindings includes.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Drop dependency declaration as it's cleared
- Add Revewed-by tag from Bartosz
- Link to v1: https://lore.kernel.org/all/20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 108 ++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 568fe68cd185..1ab7d9bc3cfe 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -3,7 +3,11 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,glymur-videocc.h>
+#include <dt-bindings/clock/qcom,nord-camcc.h>
+#include <dt-bindings/clock/qcom,nord-dispcc.h>
 #include <dt-bindings/clock/qcom,nord-gcc.h>
+#include <dt-bindings/clock/qcom,nord-gpucc.h>
 #include <dt-bindings/clock/qcom,nord-negcc.h>
 #include <dt-bindings/clock/qcom,nord-nwgcc.h>
 #include <dt-bindings/clock/qcom,nord-segcc.h>
@@ -772,6 +776,17 @@ hscnoc: interconnect@2000000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	gpucc: clock-controller@3d90000 {
+		compatible = "qcom,nord-gpucc";
+		reg = <0x0 0x03d90000 0x0 0x9800>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>,
+			 <&nwgcc NW_GCC_GPU_GPLL0_CLK_SRC>,
+			 <&nwgcc NW_GCC_GPU_GPLL0_DIV_CLK_SRC>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
 	hpass_ag_noc: interconnect@5fc0000 {
 		compatible = "qcom,nord-hpass-ag-noc";
 		reg = <0x0  0x05fc0000 0x0 0x37080>;
@@ -814,6 +829,99 @@ nwgcc: clock-controller@8b00000 {
 		#power-domain-cells = <1>;
 	};
 
+	dispcc1: clock-controller@8d00000 {
+		compatible = "qcom,nord-dispcc1";
+		reg = <0x0 0x08d00000 0x0 0x20000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&bi_tcxo_ao_div2>,
+			 <&nwgcc NW_GCC_DISP_1_AHB_CLK>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>;
+		required-opps = <&rpmhpd_opp_min_svs>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	gpu2cc: clock-controller@9890000 {
+		compatible = "qcom,nord-gpu2cc";
+		reg = <0x0 0x09890000 0x0 0xa000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&negcc NE_GCC_GPU_2_GPLL0_CLK_SRC>,
+			 <&negcc NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	camcc: clock-controller@9ce0000 {
+		compatible = "qcom,nord-camcc";
+		reg = <0x0 0x09ce0000 0x0 0x20000>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>,
+				<&rpmhpd RPMHPD_MXC>;
+		required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+		clocks = <&nwgcc NW_GCC_CAMERA_AHB_CLK>,
+			 <&bi_tcxo_div2>,
+			 <&bi_tcxo_ao_div2>,
+			 <&sleep_clk>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	videocc: clock-controller@aaf0000 {
+		compatible = "qcom,nord-videocc";
+		reg = <0x0 0x0aaf0000 0x0 0x10000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&nwgcc NW_GCC_VIDEO_AHB_CLK>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>,
+				<&rpmhpd RPMHPD_MXC>;
+		required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	dispcc0: clock-controller@af00000 {
+		compatible = "qcom,nord-dispcc0";
+		reg = <0x0 0x0af00000 0x0 0x20000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&bi_tcxo_ao_div2>,
+			 <&nwgcc NW_GCC_DISP_0_AHB_CLK>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>;
+		required-opps = <&rpmhpd_opp_min_svs>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
 	tcsrcc: clock-controller@f1d9000 {
 		compatible = "qcom,nord-tcsrcc",
 			     "syscon";
-- 
2.43.0

