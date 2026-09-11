Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF50D3B774B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119599; cv=none; b=TvqrIHGMhK4TU2gaULPd0iXuU2t+L2s870YIzkyl4BNYSjJELyjI97S6W4NYFoBd6fFpV1rPf1w9jycn2d6L9QuZQpO1+IEIkvlYVQNWwWDQLR+WpUscvW2izr3joJDNFZwTyK1ujYBJ7ytQIZTCsTpEU+C9fj7dtGJPsoNLsfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119599; c=relaxed/simple;
	bh=gVsc4EX3g976l61WXoGHwaKYrNYxgo9+0NqY8yWbank=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IAvmtG9vSkrIAaeftZFP4NQ31W6XI3yLro4xtqFfxjmw/GKAlyLj1vc8xkTczd8ePYh7SnDf32c2UA2Ovx8fxsoAs14cXkufPRBdyeusKPxAR82nsXNb8FSt/j4lq6yIYbkPJKxiQicYV3d/ANln3D1Skr6pfpzWzf/+gLcAU6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXdahWgp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q65K866N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXdahWgp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q65K866N"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7keWv3463811
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AKL6j8PRO5h
	5MRlvCyl1G2jlToiBQtuz/ByuicbxCcA=; b=SXdahWgpkGK7EDO4nCSfJyFf4Km
	f0bzP+fxqjRl4uu9nG6ir2g5FORWBMhv9iZC/p95KkkuvFjzaA6Jyke2lemLhahD
	TvTW+hi/sKuA3JmWi6oRU5vKjO9F5OE7z+7uF8DSKBOZf3Mif6UpGGhMrHRjoFEj
	hPrYj7DZVcSoXk22n1fa3xbUupMaCU5IjRIbpp4g3O74wfBt6Rx4dwDJTs7kBaYy
	ACckMbNZwaG3BCVAlu7nBuzp0aSeFQKf+pzqUJQJ2L6Q54rLxjfsl51gIFkXQImK
	2T3Ctpy9wIgnyph43Gd/ihyjVbqSKrjGame4hzyeu6x38WbRWX3g4PlhC6Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdr904n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:39:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so763304a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789119593; x=1789724393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKL6j8PRO5h5MRlvCyl1G2jlToiBQtuz/ByuicbxCcA=;
        b=Q65K866NrrqLUVoGLVUmGIdVPSLKlQGvDqgP9HVq/UuTtv+NQLLCc1Rkq1SyHSQG44
         k1nOv7jdQv7UbJAPrXuxhXsrSxECWnk5m+NKrCjVYAF1oKsb4AvHEvsbEQggXS5KJZ5z
         FEyyPIhGcH7Z8Tb/klKdpbA7g7BMsJaiaNQOOZPpSNKfIuT5dDNYrd5qVY+GoakIHtBb
         8DYb4Ndv5vLFRTYSycRkUHtvfszYUGqauGBHvhBKIAO/BXozJesakuylpM8s7Vz4EYJB
         QKTDWchUtQF/mlYI8XlaqnRfrEOdg3JXKQyyN1xWklKw1ZljkKf8jYmpZtf06vwJqakU
         WwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789119593; x=1789724393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AKL6j8PRO5h5MRlvCyl1G2jlToiBQtuz/ByuicbxCcA=;
        b=gkM4XKNHrFnWI6kLUNWYuYlB9ZbFLVHxuWhbrTDK225pebBeXONwOJ4HsyPDHQVUGD
         EZxzDp/QGwOC+TO7nbf2aJ5w92m5B7hBCwYR454Sspf9zaiD+ySD3/EfdfqywfVPC8OU
         25zXV9I7002E56YmFMVlm0gexAualjlyqyveqqKuRXj17vaGQEOyL/RgiMZM2tYy4kyG
         yPzuxvZWfxJHe9IFQr+72GtEvNSmg9fWR7OXL532TTQlpVez7oXStwr5IU7voZYm6sUq
         NXvAmMxsxdtwN+1oM6ugpyOQ5zGeIOnp84GNr/cSRtc0lGz6dwmd55n+vi0yKkvF8Lj6
         EM5w==
X-Forwarded-Encrypted: i=1; AKwUvByvFLVAko3sY/XuOw19AU/gFGqI0WbEwyrMcljOPNdzP7U+LYNpBjyqxPpKefCFD4n6KD3ALQc+rQWcU0E=@vger.kernel.org
X-Gm-Message-State: AFuF++mmJERAPYLHGyd5ZM31AxYCzQFSxsaKFqlB8Cn0tRwTz1s4J37D
	WFZKDikGpRzcjJ+B/iDncPl7UKuE0bc2C2SinWu4piuXLSkwG9V1i4WkdilqPB5STF+ZRHjRNxB
	KNgeK6eyev63uTkooIGmGziyegbAGROz57I4LdBgP1/W0ULLcT6xNLNzjGSqyrtpySlo=
X-Gm-Gg: AYBFou1dRk1l+tOk6DMRFTXowWSCXM9hPnKr99oJTzcudxxKHqHMZ+TAPiC96aa1uBv
	cAgVb8B/bzNasT3jP2TBBo0bCWYc9DzRryyvTifpQ8umRcAcB0X0qYpKqGj9bnhjh0PBHvC6Ulg
	8iP5r2x6WkKKssrDEqkvE6NfCuWLPAYTKObj61tFHJ2ZUsdgNhk78RDyyASCFMPL/yt6W1r7cK2
	ErRzjWuWhEZA6l6YhJCbyxdkodCCN7SkYW+X4+9Hg+EkURuNm/Q2lWL3d39tp/Aze7eo1NM00sF
	k6u+Mf7K8dBMtZzfF9zTv/tTfuFIwER+6mkwR+3JE/AArnkCxoh6QIY4tgVeYf7JI3eaool/wgp
	kXu3WqT0eymIZI0++8pjI2wEEc1UyzeUgEaQ=
X-Received: by 2002:a05:6a21:b82:b0:3d0:cc29:ff63 with SMTP id adf61e73a8af0-3daed342f1cmr6326292637.12.1789119593457;
        Fri, 11 Sep 2026 02:39:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:b82:b0:3d0:cc29:ff63 with SMTP id adf61e73a8af0-3daed342f1cmr6326223637.12.1789119592830;
        Fri, 11 Sep 2026 02:39:52 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm5549984eec.24.2026.09.11.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:39:52 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: Add SD Card support for Shikra SoC
Date: Fri, 11 Sep 2026 15:09:31 +0530
Message-Id: <20260911093932.2376058-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
References: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hsZndTXVNnRWQMHtpZYOR39hKtt00nGv
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa3cc6a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=O3sVVsl8B5GRNrJjVWYA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: hsZndTXVNnRWQMHtpZYOR39hKtt00nGv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEzNCBTYWx0ZWRfX7c9/OLO1A7FP
 TEVzucliKxZuiJuuAWEjYBkSRss9DDJ7/YCwZqUBKFPPwrHVlT9dIjUPkbMdn9qWDIM6xNF1jAb
 nukBedziZn6S9FyFU9X7k9MwELM0sq4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEzNCBTYWx0ZWRfX00GS1npp58W8
 rypm1xFJ31RE/q3jMBaoiobdo8KIMMeEUFZmLXL1qntYSy5eirBHe067p5S04Ovvgu9qY/ZOt+F
 Bd12qPncs5yGJjk3pNbgewypbmusOJRIt5Us5aBOwO/wj+2+UE3xdcFJRMhDb35b2cy0iG168dn
 gEezdYC6dgUgEW4rRb1/kPNBLu7t3ZespY7uhXCCCBTzd+cjDSOKX1RV+4cB4q9jcI0p6H7vong
 T9Vks6WqREDxhkik92iWgNQV0uxeZd19NrlKRrazjUY6R9nlRjWmAkUXNl2qb9VAUmj00g065fA
 HCSWeJ4a0EPqu6alwHxQFaxQHhHtoZir3ZnroQfUv2igKuEm2SuAvwdfuFp+O6JzPiE2zbmA+XF
 eLXStv17k9GnKPdnDboDJSimZ5Dt37DEFofSWKwk1XkpkgCdh475d/CkFgJGXejXE+td/1u5F9r
 fXtohkuy0wsA/uQBb8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110134

Add support for SD card on Shikra SoC and enable the required pinctrl
configurations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 97 ++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 1395c182a2b1..4963c818a7ae 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -942,6 +942,53 @@ rclk-pins {
 					bias-bus-hold;
 				};
 			};
+
+			sdc2_default: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <14>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <14>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <14>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_card_det_n: sd-card-det-n-state {
+				pins = "gpio89";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 		};
 
 		pmu@c91000 {
@@ -1330,6 +1377,56 @@ sdhc_ice: crypto@4748000 {
 			power-domains = <&rpmpd RPMHPD_CX>;
 		};
 
+		sdhc_2: mmc@4784000 {
+			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x04784000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			bus-width = <4>;
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x0a0 0x0>;
+
+			interconnects = <&system_noc MASTER_SDCC_2 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_SDCC_2 RPM_ACTIVE_TAG>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table-2 {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+			};
+		};
+
 		gpi_dma0: dma-controller@4a00000 {
 			compatible = "qcom,shikra-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x04a00000 0x0 0x60000>;
-- 
2.34.1

