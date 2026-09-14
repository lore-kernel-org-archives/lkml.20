Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67DD43E492
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382731; cv=none; b=OdA+kVa8E4kWjy/++TBaAbn4Ajp0NnBL8PXX7X+y02KgAI79bszav048XeqgRm7wxImL8MWta3BSMsya+fChIGs2SxsjKCeXG3RX2HAGtvAhtgN+9yRNUXPvgCH47VZnc4oHy7Bf5+RhX031CvptHj1HzjQSKZAhMVrW4tMgz08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382731; c=relaxed/simple;
	bh=cF/tteW0eU8xOM/G7daXCnX6payuvN+Gkw1/l5R6EHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iIyv+K5xam1TGRNqTI4dLRHYgizvXVVBE2xF86tekH1Bj8ArLB9kHmTIHzxnLUczvIrnLCwqkAzKJyIQe6llLGJhS6RtSDPYj6p/XCDAtGkQ/kEj3kNLkE0YmFuzBoAO3fcTNMH7uEdR49RtFnk3iPJx8U/j8j3+akPZVEqS9mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bis8a+WI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQSWunPp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bis8a+WI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQSWunPp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nnFI085548
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SUFG71AsT3ScptdxEEeprApDzMF1sR+8VaN2gUUPdDw=; b=bis8a+WITeIbiIvq
	9GLOZZA/Jn2/UnoaBEpLg7Gn6iFD8u55T/XiHMxcWT8g/Vk7qXHIacw3WaMMviYQ
	ikJWw2xyFBZhbCrhs5mKKP8I99Xe78kZkpKczpksTlp7uy5tjmpizkUc+wfo92Z3
	XXcCjErT78Qdg4v4yr3AJHPVny8LvavkXUcc9uAxoDgdisHHkzgNhi5HxHFFP+m3
	PwYSompE+RkKx/T/PlJr3qAFzvp61OiDsWE2040Hrl7gO5UyVeLXdhGS+1C87LZw
	Ko5ecUN7aDEo3GBpvWn+s0alAIbk9Cv8zGSopbzknLBRAXn2po2uuuarQ4ObQCNT
	qzQstw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9de6ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104ba8bf51so86603946d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382719; x=1789987519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SUFG71AsT3ScptdxEEeprApDzMF1sR+8VaN2gUUPdDw=;
        b=eQSWunPpK3QpO0kHU1hI+HnccpXZD2Wuw38NGdBHsLf9xtYSaIVAZHHp3g62WJyAsc
         7PZPYFR/jmtHn7TfsOVVjbVLD4VZ3YjOjd+X8FBXy8tq6hHZ8djeEPi4Ga729R+2r/wt
         3TTTWw3yCuxS7wAdNEQcyh60V3/j1I4qCXubx9bKBXKMmevjQ77+z26pq4DEU0NHvri8
         631OIubwzbJ4zNpWSabCfC1B0Xc094VSoKVu10WFHxh7oUXJcW0UgJpR4xoVoepUJJ64
         afrRxFINt8aI8GO6MM5Jc8McP77vTEl1wA84HzVcQmwLdm+GyU8VBSVFIy0kxLa+xNQg
         FuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382719; x=1789987519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUFG71AsT3ScptdxEEeprApDzMF1sR+8VaN2gUUPdDw=;
        b=ZxEWn0m6FYcNIE81LhhOB0T+HsUNI+XuMmuw+n1tJ/XlOnqoqjnvYw1UFr6TxvV2HV
         IVVW3HXkWm2a+/xsla/ag1Ob9RruWeCMjWkblaI6wy3jVPTUXu0W6SGbRgjEYiYktsCG
         vYdix1kJf1Fi3/h6jA2MkNu5NohkPWl07Pabq4MkYnZN0B62SVM4F8JO+RgpKTqo6dDH
         hhpMA4uv/jTAfbL5MKwsVNsrog9zzXu5YKgxQx6wyjhdUnWomgOookwPZyrMLSUqbsUJ
         Xm4n5EU+Hg0UyLnB1TThRSMkYC/SGD8+xQ76sBSD8Fabb1ggPKz/X3tXaJdWMHjjz+yJ
         YuWw==
X-Forwarded-Encrypted: i=1; AKwUvBzWo55fqwt42na75K92nmtAe/kXWcgTbulByp3wWneG3XkFBIzNjF05IAg1JffdLBiy+pD0M2ZAennONGY=@vger.kernel.org
X-Gm-Message-State: AFuF++lMIxyUTY02DBrNYswVGFr+qy1W43brKAXKMAF6JK6wVtaCdZ8n
	MJohPWCj6CDFri7Hr8+rV9jRuYYyOmdfckmyiX4ypXebFZesUO1SOVHDmo84ttRdFk73cVjwU51
	mZ12n/fIWnD1G50xGziti0sgD146DPQP3ee8EoD3gVWWv+v953elWqpnzh+IR1txCNEo=
X-Gm-Gg: AYBFou1SQby98G64Bi2rlocjon502iLacNY0gAZX5Kp07ivDqCLHudAt4kDmctYqb10
	RpNq2VC9LGibgpfXeVKF0swXu+jOjB+O+XSRZWjBzhrVNhI06avAnn2fwNLUThykfW++t4mtaEm
	QGKOXft12Bu4/1P3gA1MNqOb9y5UgeLv823w3NFt5QScMmr/G1XaDADWtCBtjbpe500upp/G4+E
	+fgPSpzJpj8oLk68UG/q5ImUT2aWarud01oCbypynfg0OXQQEVs4KPHE1ctS4NRpmDbvs5Jotb5
	rv7MPQbT/L8Ij/qbvyFxdEtUAiftFVRosQt/ezR2xEEUtijeW6CnL7rXDOx8ZlAao6hTBF3NpVq
	+rHugL8Zd
X-Received: by 2002:a05:620a:6489:b0:939:5c62:fddd with SMTP id af79cd13be357-93a297f203amr259288485a.19.1789382718432;
        Mon, 14 Sep 2026 03:45:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6489:b0:939:5c62:fddd with SMTP id af79cd13be357-93a297f203amr259233585a.19.1789382713232;
        Mon, 14 Sep 2026 03:45:13 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm26335926f8f.15.2026.09.14.03.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:44:51 +0300
Subject: [PATCH 4/5] arm64: dts: qcom: eliza: Add CQS SoM UFS variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dts-qcom-eliza-add-ufs-variant-v1-4-78b3249eae61@oss.qualcomm.com>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=11702;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=cF/tteW0eU8xOM/G7daXCnX6payuvN+Gkw1/l5R6EHk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp9AtOzeJY4sxUQEHbFK0RYSlcCZwd8UEhE7Zg
 OH9YpVoGlSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfQLQAKCRAbX0TJAJUV
 ViPvD/4qD9iXRDnYeqSFxeEM8ZO+v2PQ5ZiTJS6XKtHZ6Mpmi5SyFtFQO907dGPgUHC12kECFgS
 wVLEXXcN850fEsORHzjt5Nmh2owl6zPZra4hKUoIfw0M1h4AYF7CV5E8+dZK9VMfH6SK/dZglmK
 f2M7TCcws0tpe6d5hG6TRDMdpILp10pMM0yZyfBbgtGAhdJAHrs3jWjETRsRLcadsRDAvEkykb4
 m7PDLV2afB7W6/HJzryy2X48yCYdoC43Z766384BauSggk4sP1yCDwsgLZutAL6SHAQtCoEs6bq
 x7SG1Be36hcnHYqaQVhCbQesRB52pXeB49vF29Iao5WgK3QQETl9M1Wmsk34etGspPJX4hzJTMR
 ikWPlYH149Ym7dn110M3X+ZNeKH6sFZsigfIcT0B3VMOhGLx7klqpl4l60HS93YfhzeV9idSjOK
 +kwhVrkNid+0M1QSvW3Yp46jJXxeSeGiQ3FbjctLwvDWQ5TxCD/mNlcy0fv6Xvb8//K84qonxx8
 jHxiDuLZx/AvAJYSzsb6yqYOFmcMgvmM2RYhEzLJ8qMbDNelWFAF6vxnVb7O1brLv/G9VUatmiF
 IedR6PDkvLDaLyz85PQ+Yy923VOJljJUgG0gHX0j9D9jD9f0phH0opwh7LzS+5OizXdrnAf0yr2
 Fs7SnnUGSu2sTbQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX7pc/fk9yYloB
 TYvhNES0eujtAAUFyD4rVM/QFWVlQUb0BDA4rbGTGnYUEwFkM1kZWBEVgt4dSj1d2McASjScCc8
 Bzs8+jcSYYwP37WSp8HdD42uW0vfjUDNylLz5yJKLnA6idJkOiv6aQd/H7tXqMktZgPuk33gB0m
 D+N9EwTSw0wMMAzITB5L85bnJNLKMoAN+YECM0JFsPqEBw3TKzDXf68/idhKfJbfGA4+cPUfGTq
 eORfbb8N2kvo3ol259FwX0Nw06vfOKWJ78iawhPzfYw7mPpC1Th32HcB3yYcwOIczgywcQwvR7x
 sY/BJQ61MQosUps4lMu7Pa/8p9jNgQCxld18J33ZOv92YvzH1tpv4xu30XRXmpW3jQEusBdz4vf
 0EW3/QAOsGg7ke9nEtNQtuNvEQJzWPE6RilOEtcnuha141mc2WXUcuyBeur7mFf8alKEnPUM0TA
 oEbC+BGICl072/hA/RA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX9ZPuNXtddIkU
 IAFprJSikNZjWWDHPvw+/caAsn21SGZNfMRc4fzlrP5Zel09YQuBymjwBDS0LRk2MYf6rcRyoZN
 4vS9Wu7nrUhMXUImjc87nWuTPf593kA=
X-Proofpoint-GUID: JBUVs-nQG3oRc8ZqcFTRDRlNSwjUIoma
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7d03f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-rIHGyhvbnQuOfFkfywA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: JBUVs-nQG3oRc8ZqcFTRDRlNSwjUIoma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140154

Add a new dtsi for the Eliza CQS SoM UFS variant.
This SoM only comes with UFS installed.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi | 421 ++++++++++++++++++++++++
 1 file changed, 421 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi
new file mode 100644
index 000000000000..cf1cd97065b4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "eliza.dtsi"
+#include "pm7550ba-eliza.dtsi"
+#include "pm7550-eliza.dtsi"
+#include "pm8550vs-d-eliza.dtsi"
+#include "pm8550vs-g-eliza.dtsi"
+#include "pmr735d-eliza.dtsi"
+#include "pmk8550-eliza.dtsi"
+
+/ {
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7550-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3b>;
+		vdd-l2-l3-supply = <&vreg_s3b>;
+		vdd-l4-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-supply = <&vreg_s1b>;
+		vdd-l8-supply = <&vreg_s1b>;
+		vdd-l9-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s1b>;
+		vdd-l12-l14-supply = <&vreg_bob>;
+		vdd-l13-l16-supply = <&vreg_bob>;
+		vdd-l15-l17-l18-l19-l20-l21-l22-l23-supply = <&vreg_bob>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "b";
+
+		vreg_s1b: smps1 {
+			regulator-name = "vreg_s1b";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2b: smps2 {
+			regulator-name = "vreg_s2b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3b: smps3 {
+			regulator-name = "vreg_s3b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4b: smps4 {
+			regulator-name = "vreg_s4b";
+			regulator-min-microvolt = <2156000>;
+			regulator-max-microvolt = <2400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-name = "vreg_l2b";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-name = "vreg_l3b";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b: ldo4 {
+			regulator-name = "vreg_l4b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-name = "vreg_l6b";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b: ldo7 {
+			regulator-name = "vreg_l7b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b: ldo8 {
+			regulator-name = "vreg_l8b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b: ldo9 {
+			regulator-name = "vreg_l9b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b: ldo10 {
+			regulator-name = "vreg_l10b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b: ldo11 {
+			regulator-name = "vreg_l11b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b: ldo12 {
+			regulator-name = "vreg_l12b";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b: ldo13 {
+			regulator-name = "vreg_l13b";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b: ldo14 {
+			regulator-name = "vreg_l14b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b: ldo15 {
+			regulator-name = "vreg_l15b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b: ldo16 {
+			regulator-name = "vreg_l16b";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b: ldo17 {
+			regulator-name = "vreg_l17b";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b: ldo18 {
+			regulator-name = "vreg_l18b";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19b: ldo19 {
+			regulator-name = "vreg_l19b";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20b: ldo20 {
+			regulator-name = "vreg_l20b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21b: ldo21 {
+			regulator-name = "vreg_l21b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22b: ldo22 {
+			regulator-name = "vreg_l22b";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l23b: ldo23 {
+			regulator-name = "vreg_l23b";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1b>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d: ldo1 {
+			regulator-name = "vreg_l1d";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s2b>;
+		vdd-l3-supply = <&vreg_s2b>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g: ldo1 {
+			regulator-name = "vreg_l1g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g: ldo3 {
+			regulator-name = "vreg_l3g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+
+		vdd-l1-l2-l5-supply = <&vreg_s3b>;
+		vdd-l3-l4-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s1b>;
+		vdd-l7-supply = <&vreg_s3b>;
+
+		qcom,pmic-id = "k";
+
+		vreg_l1k: ldo1 {
+			regulator-name = "vreg_l1k";
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k: ldo2 {
+			regulator-name = "vreg_l2k";
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <969000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k: ldo3 {
+			regulator-name = "vreg_l3k";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k: ldo4 {
+			regulator-name = "vreg_l4k";
+			regulator-min-microvolt = <960000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k: ldo5 {
+			regulator-name = "vreg_l5k";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <931000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k: ldo6 {
+			regulator-name = "vreg_l6k";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k: ldo7 {
+			regulator-name = "vreg_l7k";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen71700_zap.mbn";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
+			       <111 2>,  /* WCN UART1 */
+			       <118 1>;  /* NFC Secure I/O */
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l12b>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1d>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l6b>;
+	vdda-pll-supply = <&vreg_l4b>;
+
+	status = "okay";
+};

-- 
2.54.0

