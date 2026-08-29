Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1041F347520
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032349; cv=none; b=lPSHBItqpW/41Uqf4uOyJZep7OKOVLf7xT2EWQJ/lfv1fzKBCwuFjXy7/FAhtl3a0oy7xBdXpvjfzUpdqTZ20qTcz3xyUX1ia+2eUEGEY1/YT6dkNrBDV1ZWOrmpTkYKEX+qkRqqz/WRa3Q8uzLYaA6laRBve8+2jyoto5XQJvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032349; c=relaxed/simple;
	bh=+QF5aey9Yc0AZelafCPHXHVwrdosC923drKIebFNQ2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l7rREr5t1QXZL2GSP8tta2OTJGw1nsu+PmeLaNXFi0qjf4OdsjQVWIVETk8s9ciz/GiZwMJfJ15MShx8X9OCSgkIZRIhEbGt+/3Igi4HCevMVW8nxXm016ByGVO4ATvqO6udReUkWmrqUAxjxgnIeL1OIASTf//vmYLmJHhXtBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXRzXzOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLQleUI3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXRzXzOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLQleUI3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGxmZk2457883
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MXeAryZW3xPGLtYXy8CAVnHkvUiYSgcLyOW
	SZ3+p2GE=; b=fXRzXzObo2iWNNkgymod+XykpeH1YZRQ1D3iqtqVS/2K6ckttSP
	oggx5SHqPi9lhKT5EMoPnFAJueWQ7nurlVkdcEWKrJo7rGAo7tB/KKN/9JjYcRYY
	NP7QM7ZGHUMPtL8S0Kiy9WtQcX07wnVCqwnNKIdmWj6nwvQZtnuB7Mzi4AYNVejg
	PIjAHIaad+fwCUXRic3GoK+Ro07uVNE5xgnwYFEPHWRTis5h7tt4QmabJi8NrNwu
	gERNs5Mnae1MKKuOntfdC650I9eggNnHBnByVBeGJ5VrqfVPt+jkJ9qBmcPyy3T/
	J29X+NLtSkdU78OLwuAUqQ/PEQn2J5wLiXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhw9nwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:39:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52faa0dd18bso60298461cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032345; x=1788637145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXeAryZW3xPGLtYXy8CAVnHkvUiYSgcLyOWSZ3+p2GE=;
        b=SLQleUI3yXwWNodfbmhpT+LkGjj5kQ/PvJ0BusiF2TawUVdIc+z+UdokDjYPk8Q+cY
         ehfyxIpM1gJ+jC20P6WgGfTWpD3Ocp5XrgmXSuyIfQoGFZNhlxgMUwukGFdMrAOQwAX0
         PrFyZqSmSQSWZfmY/155c8JZ0TtkICePssre74p29xsKZuY5fZwXAXf+PjXzhgKtP2t/
         tn1Uej2jtmbV/p2RkXJfXSxnaX/qlTWcYm9atxFMkgtE7B/b8TBdK1xhkGYq+l0tSqVA
         UCFr9k6DkJE6KjZUNhTJP38ah7ex4aqFE7lZR3QR0WLTgXcgg6Eh65kP1KdsRHkMQELl
         9GUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032345; x=1788637145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXeAryZW3xPGLtYXy8CAVnHkvUiYSgcLyOWSZ3+p2GE=;
        b=sEWbi7CyuF8K6MSKEHr0V2sLLq3Kv0GxCjGoN+ZJqyVRJJ+S/myv1R7HbWYdEDRJ2g
         o5p7MpVzwgbs83weeA0NT74ceW88KolV+RsIXhrCNcdUGKQchUjyVBRZhTXZmsi0ZBDv
         udXDjgPfafHuAlj0Ljt9Ap6TbOn1yPiWuyuPxoKCskaNjyDC9AuKn4sDOnqFnCQTctDi
         LdOwUkbr07uldRoUiPFeNX27e4n3wFTWe8T+c4D9b1psKBrYtUWepWcE9+3wxuYdD5mE
         bJX+BXZGtN/82dpF512HQnaOIl+Woc/vZcIKYCN+xs1/giAL60NMDFHneYlmdsAmOyLc
         69IA==
X-Forwarded-Encrypted: i=1; AHgh+RoQCaEWakrEyoZsvnbb1IY+oN1MImgU7GqldvxVmz0QYQKF3VGyZtNEYG70r6MjPN65XWFh8NGbJtnpXgw=@vger.kernel.org
X-Gm-Message-State: AFuF++mwyaQ4enlLzuRjBeCQ3cN8nXgPH5N0lAFC5Wi+eiyI5I4/JZba
	npbZSkz7gVmeON564CCkn1kWFkGAiK0ksnfPw8CO9Elc3ea3Ry2R68d0IwGhRE2CdbtCKtwPq9U
	9B++9DTnqEw9t3QhJWSZyFXCGIi7fYW1Nw9RCO2B+N7hY0YtTd2L7/ldF3m9/U0kJzBY=
X-Gm-Gg: AR+sD12b2PJ1xSLjHo2KGHgB5GmRXmEn0LHDMJRBtjYUJuJ6DtZaY/XGW3AkXGhk8AH
	y0KXh1/vT9qTGd6j1hCwijUp8EZmds1AmTpTI8eN761giuM2IKIVdGMlQkl/yAyDx22TNAFVfhX
	rzeC2Y95L5DaILh81qhAto3jT0xwYLvbQvNNwswOAsl975aeOX+UnrEihFI9Vd/cx/NwSzYWz+R
	oy6Pa/z7Hz1lE9MkgJhc2cxFgKgKXZBNRcUOMlBuo6M3vIGDiQpATARFUz2pFJcrtWWd9Rql4y4
	5aLwwPzsc4dLoshCUxixxf9DMRjdR4sLFRFERJzvl3ypsNvR+JxoBbs3fjUaF/ujRM63cOqRNBE
	HoBxWFn27eWo1DQk=
X-Received: by 2002:ac8:7e8f:0:b0:52e:3a38:8cb0 with SMTP id d75a77b69052e-52fb9425a08mr186481281cf.12.1788032345139;
        Sat, 29 Aug 2026 12:39:05 -0700 (PDT)
X-Received: by 2002:ac8:7e8f:0:b0:52e:3a38:8cb0 with SMTP id d75a77b69052e-52fb9425a08mr186480941cf.12.1788032344766;
        Sat, 29 Aug 2026 12:39:04 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cc9497b3esm108965195e9.5.2026.08.29.12.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: tegra: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:38:59 +0200
Message-ID: <20260829193858.107368-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4918; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+QF5aey9Yc0AZelafCPHXHVwrdosC923drKIebFNQ2o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzVSOuudJZ3KNB1HFKSvXNbucR47q5QYx+8Ah
 MS64e2IWsCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1UgAKCRDBN2bmhouD
 19HhD/9uor9tN+JTRQqcBo6JwJJVLK++mAQKipx9BbLBA1qkFh/rC70LeZwVqGtol8BJ14nfYFf
 GqNiw0tuwl3GjVzaTCi4rw2tyUIRGlIWSEeDLH67yywV4sm7WO92r5Hnr4pq/xeY8N0GsuFJ+uk
 xKJ4sigTJzYVydBVrwahoMky3wR5CYs1Dx6YAu+wcJ3FlUoATsKX0Xg6P5A2zdBM3iwZdaxivEV
 7lOcR6hOujho4ts8c+ScRofd5ctNY5jCEUUeJ1xq6GLVfhccJlJI2YXsNYzW2uqFmIa0811YKjt
 Dg3Rl4VGRPoSpo2jFP1NL8qdkQY6DjiVUiw4aVIjPUgjrRBBMOXblMkEoE8x0EOg5ncQIwNWYGi
 JMzQ4Ip0Sv/tZyHkxKiO3wFr0pF1rYjuE+K6lmkyWMphTovgK9NpEX0CA7vuTlCcwHJSdY754WY
 Ho/bhR+IVgt8Tqd2hyQRJug6cisINgN23jL8nGRt5R6fsr3eBYO8Rloo03zhXI6BsaMLoT6/tf1
 tOArz1GCOxpL0nWUovZwwB8XBJHDSaJH2lr1g2eP0+t4pP8iGKP4/8k0tDOQqRHrYfnA1jOdVwz
 UqT6ToHoDSBJR7yuoTa7mo1jIr5UN4JAzzdmmZwwM3VnjLnOz/dia8PLAw/N/gyTIPV3xh61cos VMrjcOF2be/YA7A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1eFk3JUPmR3UQQvqe2CoelLiLbeQyEZN
X-Proofpoint-ORIG-GUID: 1eFk3JUPmR3UQQvqe2CoelLiLbeQyEZN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX9cuDn0ryMcQ4
 vn9MtyhvyV+tQNFW1pA58U4baWTOkqapWzxpAZM2PuviRS0JOmDT2+A9OXUTYajcPMZG0hPvNTl
 C1K4idws3vaXCed641+8Ull6ra4cgLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX3WW8d6IyFikA
 IX77Usodd1soCCVjgfJbkBi07BhAfvoBn82gR6v1BIwsnoHJA/6lB1JSjzJMKXxEe0Zi3/6nQwi
 I7DexBK545wxroqh2LRDJxKMG2thuh9+VIByRJgf3Ugwi+FlMesjwun9mXfPkXP3+R/ZPIhfjKG
 FXw18KYN1Y1G4OF4c3rlX37rE8TJh+0py0c3U4K/zmBiL2bmQzwZVQwBjrlQgcRyNhAq0s9IBHN
 iujyKbVAXf0aCoMBIvEkJMGBULrj/4X/VCD4QV65SGsQaHfp6JpeuyQBSzgE/uMKe520mNJDnLS
 ku7JIG2zSwfny8ZIKaGwjca8CTy1mWRevsuQgkUGl+RI7ljGInL8KZOyvEfKFYvKKW9jQXazVNR
 Mm3CTjLi74aoJmgM6t+28qT7uyVooofp3uWRm5SIH2WohdS9d8FQU+9qleaGAtgLCszicIl+PK+
 amBYNTfdhnat87ni3bw==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a933559 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MMfNdgY-GmuYLy5ODHIA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi |  4 ++--
 arch/arm64/boot/dts/nvidia/tegra186.dtsi |  2 +-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 26 ++++++++++++------------
 arch/arm64/boot/dts/nvidia/tegra210.dtsi |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 26cd11a8a4a1..cac29a0b66a6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -644,7 +644,7 @@ hda@70030000 {
 		reg = <0x0 0x70030000 0x0 0x10000>;
 		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_HDA>,
-		         <&tegra_car TEGRA124_CLK_HDA2HDMI>,
+			 <&tegra_car TEGRA124_CLK_HDA2HDMI>,
 			 <&tegra_car TEGRA124_CLK_HDA2CODEC_2X>;
 		clock-names = "hda", "hda2hdmi", "hda2codec_2x";
 		resets = <&tegra_car 125>, /* hda */
@@ -872,7 +872,7 @@ soctherm: thermal-sensor@700e2000 {
 			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "thermal", "edp";
 		clocks = <&tegra_car TEGRA124_CLK_TSENSOR>,
-		         <&tegra_car TEGRA124_CLK_SOC_THERM>;
+			 <&tegra_car TEGRA124_CLK_SOC_THERM>;
 		clock-names = "tsensor", "soctherm";
 		resets = <&tegra_car 78>;
 		reset-names = "soctherm";
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 705af0373a09..a396b4b2dab7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1517,7 +1517,7 @@ host1x@13e00000 {
 		      <0x0 0x13e10000 0x0 0x10000>;
 		reg-names = "hypervisor", "vm";
 		interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
-		             <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "syncpt", "host1x";
 		clocks = <&bpmp TEGRA186_CLK_HOST1X>;
 		clock-names = "host1x";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 5e510f77b538..e1219c90dd8b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1360,17 +1360,17 @@ hsp_top0: hsp@3c00000 {
 			compatible = "nvidia,tegra194-hsp";
 			reg = <0x0 0x03c00000 0x0 0xa0000>;
 			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "doorbell", "shared0", "shared1", "shared2",
-			                  "shared3", "shared4", "shared5", "shared6",
-			                  "shared7";
+					  "shared3", "shared4", "shared5", "shared6",
+					  "shared7";
 			#mbox-cells = <2>;
 		};
 
@@ -1556,9 +1556,9 @@ hsp_aon: hsp@c150000 {
 			compatible = "nvidia,tegra194-hsp";
 			reg = <0x0 0x0c150000 0x0 0x90000>;
 			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
-			             <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
 			/*
 			 * Shared interrupt 0 is routed only to AON/SPE, so
 			 * we only have 4 shared interrupts for the CCPLEX.
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 5f5e5370d709..204f3bec77b7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1065,7 +1065,7 @@ hda@70030000 {
 		reg = <0x0 0x70030000 0x0 0x10000>;
 		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA210_CLK_HDA>,
-		         <&tegra_car TEGRA210_CLK_HDA2HDMI>,
+			 <&tegra_car TEGRA210_CLK_HDA2HDMI>,
 			 <&tegra_car TEGRA210_CLK_HDA2CODEC_2X>;
 		clock-names = "hda", "hda2hdmi", "hda2codec_2x";
 		resets = <&tegra_car 125>, /* hda */
-- 
2.53.0

