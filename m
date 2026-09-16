Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1848368D65
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574167; cv=none; b=tkcebBf8Ga1jlckO5EjjDB+yGApAiFDOzzLnEGcE+lCD2sjUJJ2aboKcoOxl8mE9qTeGCjsZQY3UyJuh3WE6CvQ1bP3QqL9IGoSRDHtGM/Ut0iZf/dskckPPB2+H88mpDS8UfKt9J05zLz5E9lANQeTxMoZXhgs7P85QtztJ/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574167; c=relaxed/simple;
	bh=1L+CGmF+jh1dVDPMtm6ap+Rk+9/ahUtbAdogoIAgS5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTXv8DUiv9+HLHYl0B9Mt0QYsPlJDQ62p58SADnsw+DacHkZu3JmuxOqwxVecN8IVEmihcVUa47OIjsMi7Hs3rybPZTRLZgJ4hDZU7HZ/r7I/DyPU2GseBHPZ9t0Xm71sXrkMp2Nvfwfgrks02iOYzk6gQaS3PAneeI6iMfQo5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuXQjadV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8lN5IQQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuXQjadV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8lN5IQQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeFv13233104
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NNmVp1b+0xC4UWGutgIpijbh8RUmcwgCzdiLIlZM8Lk=; b=MuXQjadValdyuRzE
	WBXhiBoZXZhiUuNXVRsyBoEf4lzo23+v4fwB0nfq3Uz3J29NPX8TKlLeTHGRb8uX
	uhAgP2TZeMk6v+SqMTt5Gq8mhY3SRuFBnR4YYgEaihd3ngFXb1qNuB8kXz6tsRRg
	RNvjyrBd+GiAH169xyNKAw3IPFqpV5avHi3Y+aAuG7H/uRqPm1s/DR5hVZmBtZaI
	u1+4NV5egnfUrZzfK39qNnusMjV/NtPI43xp2/3TSzatQSYzo46BH3J+zeLiFHKE
	1Iw4MsQJwjdiGNDiJPVvN8jGeyo9Hw8eTWqHugcg3z2F8VvYEgpxYvuA/QD5S6C4
	xIwL8Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywc3he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:55:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93903622880so445103385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789574152; x=1790178952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNmVp1b+0xC4UWGutgIpijbh8RUmcwgCzdiLIlZM8Lk=;
        b=U8lN5IQQM5IU2pWfpW/rmbabPelTRZPFOEGduFOM87naCKBVcuqFFjZYxzoNEHnVPZ
         Q6amxSfYMgLKgy8E5hSmn98uTGmQwZ3O1f7Mk6JY/huPS8kO3wYoI5LLgElVZLg8dDPN
         bBucnF/vnBGe6TXJscEVsKDMrXo+BrHcmzTHIVS6cCbpZ6EitnB6jGaKxipklrYBIJ0e
         qkEznxrxknZlB9PprNi9Y6aJeM30aRBjBnoEsZnlSP/954IOucK+n8G+ZOMC9IeruNrK
         TXBAuRGkQ5FI159S+iPZEv23yp2hfZ+EY0xoGT7bWcw8baXkLDKjMXYretyN2+1GU5X5
         Tecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574152; x=1790178952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNmVp1b+0xC4UWGutgIpijbh8RUmcwgCzdiLIlZM8Lk=;
        b=Y1oDwkRwyVwn9486BYV9+STOoWqwVjHj2RfwaXko88k0aSyHkAi4vx2c79uvux3s9c
         8LMkeXF/WSehuYYq2H9ic0YbwHvtgy18qJ87eJub4BwcjbT0xDj/889d3FGu345wzR2j
         +8irJYoVYzI89PkgTfZeobez4/Fkq82asryL9RxGnp8YA0y+q7EvUhB5r0fNaM00EQZf
         bxN3ARB+Y0zwuM41sDfygDxPBHWhb3QuN1xR1Kf6FtbxJixIwskADAmzwySrAnH3YVqJ
         802F1muVw+025gO73WBaVS3ebAHJ2IJoMT5Y1dAkasgHVATWcGsKIxNuTIZxQmsJO8ho
         0RyQ==
X-Forwarded-Encrypted: i=1; AKwUvByNNvRB01zamqV3tbLsMsQXX3wBbo+nbnLiP785Rh5CG+l2tE8zldC18vzdvkKU+a/zaU+WVn8gu7Mk8OA=@vger.kernel.org
X-Gm-Message-State: AFuF++lwustXMkXVo7nla+pBBPGJsJOCQQc3VvCXUsv1l1L0GTYJZICY
	4rgeppAMojV5+SHvU53KJOh11Cvja9Z//hknp/Lp9xwl4L0S31pT4GV4jF8HXEHkr/mDxEneKJq
	JYjE5LJa2UNYokdRrkl+Z4l2a7508JHalcZioheiizFtdLIPLhK3sbiFS/p/y2W7hTU0=
X-Gm-Gg: AYBFou0QEypEPxBGoCV4J+Ra9rIIuexO89QdNWTMw+inBRTcFKvDh6O0CoYSR8yM58z
	+c6iFnv8tGW/QQGajBs+CNe6GCikJiyqhqkO46roH564RGzeXHmvcs5jUa50HHETZk2M52diwHI
	uwhqvXbYDDmp624MBXKxwZDW38kRNfjZUTeDzEG1vpCB+m/ehyHNd9gIQDXk4U/RjOhslyYTfTT
	F5HyhD6w+6OOqKZT4ssOnhGvxknFszJjeENgoBk81MBgcsdAaLYRTVHzTKtmJFGRb1j633IYGTW
	oLC92uR1ONwzkNetedZzUPqt8QQ+pWVkGX8hETxLyWA0HNY58SsJpJEW1VyA/T8ddkc7M4pAPip
	6YDngnpEB7MsslaKEGybeGQZL/CM=
X-Received: by 2002:a05:620a:3711:b0:939:c7dc:8712 with SMTP id af79cd13be357-93bc62a44d2mr17522285a.15.1789574152279;
        Wed, 16 Sep 2026 08:55:52 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:939:c7dc:8712 with SMTP id af79cd13be357-93bc62a44d2mr17515685a.15.1789574151692;
        Wed, 16 Sep 2026 08:55:51 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm765525e9.6.2026.09.16.08.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:55:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:55:38 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: nord: add GPI DMA controller nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-nord-gpi-dts-v1-1-073e3f9c19d0@oss.qualcomm.com>
References: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
In-Reply-To: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3902;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1L+CGmF+jh1dVDPMtm6ap+Rk+9/ahUtbAdogoIAgS5Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqqrwAK0iRViuzdsunA6M2XquWPRUXZrBXG8tHT
 6fzYfDA/E2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqq8AAAKCRAFnS7L/zaE
 w5FoEACh3qPoUeLM1NFIEmSJaIF7ACDuo1DaNUerxCj0bRaKVgLtouXP6hzckdT92mPuILN31rc
 WlaagiXrpBNc3PbjpruJWKaWzZ+XbkWU6hx92cCt9UysmKQlE4hbiwtJzD3Wrp1R/UGh9aFHbil
 sUZZNuxdAGzqgxRIw8Is4Pzr5fd8NJN/H14W8GKf7DFklySUTsBKUVVmrFPAe44kim2gCumsfI5
 5okTcfRhskL5Q/MGhLHY6Vxva5fprvqxkGMf28/PZfH+ZjjTgHtaI744UKLChFytARG5rAge1Ik
 Eg7Dk4rgzvP0xgBFbD4xMqF55xA9vhe6MFFtXp2Zx2kIZpB9athawzQ1ppabWIMrXc+Ul5bg9ey
 e01Eun1cNwsL8+f6/IyzKiwcxCs1EzBUjAEQvzbC7iWDK419HCwAifz8oxjdB7oUEOoC0DS6bLR
 V8gmd8tLPjW1aX7MQimB/wEhDDUe0O1HhIjYM2DV119K9rRau0aI+L592u5pS5gwzPnQUijDf8l
 qPz1v0+IlIBntL1DgToe95BjV59+GCDUZ9V508ezbo07OrdvQpAtJL2kF7eBMy/gAIubnKCIomC
 PWLX6P5GVuv8u1SmzscUv4FLgfYqF3TXCfXDcAqvu4YNy449JYrM1JuSod6JAlY9Nu1bIbjKtSo
 /E8kybkh5Yvrm/g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: u5xU-PknIOyIq1aK0sj-HnLCiIMSn3Ai
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaabc09 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5TetioHNO0Q85TPnjQEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxNyBTYWx0ZWRfX03YtsRaxtND/
 lo05+5ISavAr9L+0cKMMGzHePXD6fZaEglFqy8kVss2H8V2Qpmgl5J5eVQRGVekljsz34/pcsg1
 i+c65qGzBjTlpJu+E8aC7dQ+x+nLk860ceQT2vd0EtlB/zGt4ZVH7GuGQIGaL37Odc4+3iRiO3d
 EVj5ggAu0NwyWAoXrehyUD8MBQpn88RosPc8RJBD/oPgvGgaOdkIh7irm2WJnFtYjip64K3zO05
 l0mj9v4aSW8Hd0EAKKUYbYWNenkijDbt4HzsGuBWOgAZXV17x44jgD1wBKaEAxseZPcGIEidu8b
 nZ4ZStQLHrq0GjuQ5eIHLmtLoL1wAsvUr8PqQ9MrySLkHTmcauGhN9HKsICYDkk9yK9RMJNdf1H
 rhKZVKiVpidqB1t/I+NV81I9b69IHGe4b1xr+OQLx9uPb12kpIQWM2xTzlzOOjtSRRmTPxqWIJN
 UMq0wLPRqtHMKm9uXNA==
X-Proofpoint-ORIG-GUID: u5xU-PknIOyIq1aK0sj-HnLCiIMSn3Ai
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxNyBTYWx0ZWRfXxj8AB63ez8c+
 +w9+UTkmlcWQ16ljAWXfk8YacmUpppL6iB2k9mhf1pai2r+371KaWIayTV/10rEJ0h2sdWCb6gl
 KEYWiK7Q3lQgGY5troyQ8qVLY6wLjlg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160217

Add GPI DMA controller nodes for all three QUPv3 engines.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 67 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 22c026c32fb5..870033a106db 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
@@ -1062,6 +1063,28 @@ soc: soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		gpi_dma2: dma-controller@800000 {
+			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00800000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu_0 0x15b6 0x0>;
+			status = "disabled";
+		};
+
 		qupv3_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x2000>;
@@ -1260,6 +1283,28 @@ uart20: serial@898000 {
 			};
 		};
 
+		gpi_dma0: dma-controller@900000 {
+			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00900000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu_2 0x1016 0x0>;
+			status = "disabled";
+		};
+
 		qupv3_0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x009c0000 0x0 0x2000>;
@@ -1431,6 +1476,28 @@ uart5: serial@994000 {
 			};
 		};
 
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,nord-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00a00000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu_2 0x1056 0x0>;
+			status = "disabled";
+		};
+
 		qupv3_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x00ac0000 0x0 0x2000>;

-- 
2.47.3

