Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A093B4A5EC1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002037; cv=none; b=jBHT6pgzDQ8NCfZfRiPv1FRr3E5mHgZDnhinRAUzI6RkINeTzoBLHr2s6zoR0ChRbYYbB02NCs9Kts/wEOk0FtKHmdtxyJCmloN7+ZOw2/llZ1NKkTroEAVOKcHMLYguxYSUkQWPPnIkwvLxmL1TBOePDxFx3PdTID7hHGDCMxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002037; c=relaxed/simple;
	bh=55BCUBdpjTt4Pu4DifavT/3kB4yaJtykeAtNAaIzyw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VsmjAwM7z61vJEToCFVK6hdXY9fRxMV61diC8rQ3/DAmybBDoD15z4WYcDnsbFCecheWt80G40DisCIepfoRqK5AyIvUa1KGohe9D5wxJ3ze7GMS3mWUSYBZCyohAZTfJ0fqrhtLwEJydFd2NHKYXjMzhz1aEVllmDRwCIALJtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WwcqzfJF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayj1QXCI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WwcqzfJF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayj1QXCI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGbkA1891162
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GnIxoSLru4K1VMVUAYvaDV2N2ai1mZa6TrrHuICciMk=; b=WwcqzfJFODRHND83
	/MZ0iLrV5Sr1VgvuV8hje+6UBrBHUd2Vu1znnrkbCn4mT12eWLIXvRktTn06lyg+
	rMwzLq2B33q39pNMsuIdRUZMbYqIfGj9LzJBL3xn5Go/AX+7vBdPZUFZIt1L6qS+
	tGoFTt5iSBsSZnCLy/Uy5n5wLyagaNCtU/LldyV6AF2LWRA81xZn318Vb8Inn8Oj
	YW7jzu8okIQpH3yeKy0n0jVcHLfYtz4K/EytIZMnGPv3eZtglpK3bgt24XX37JOJ
	Qw842Eb1xxlDcabiQQ6tjsCF0bXYS9GabaoTV93ClSEVlmeLJu4Psx473cb7jDWG
	myPGIw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d1stw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:47:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c9c4d303caso1989931e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790002034; x=1790606834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnIxoSLru4K1VMVUAYvaDV2N2ai1mZa6TrrHuICciMk=;
        b=ayj1QXCIZZbywetaLlNyWer8BW48MQm791xCBkrtez1Mb6mMNT5opjSEDOC+A7Hxo6
         quY+7tL84HvymZPxA03thacq83BxJqcONg1FKZO6tUSCa8jv+2IRbRd4dRCZryz0+oIP
         gfDGqH3PxDM3xtEJn7sV5BM0lxCKFWoAsPR94gQpbKp2LjjjBblC51s1xgN71dX/Vm0m
         m1SE28wpvWAj0oaUKBihOc9fxd0D+p/0fwP7+D3ebLltgQV7wP/0QVHhbKxfV9o2pRgq
         rF8ygY7pBiravOS3eoJxml5RxhSaLaSQ44I665IxedgK3o+EnMUFVGklrF+P9gJbm95d
         3EWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002034; x=1790606834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnIxoSLru4K1VMVUAYvaDV2N2ai1mZa6TrrHuICciMk=;
        b=ZdtL3xFsQ8NitzXpzV5xEQC3c5JJr/c2yRckUvrhsC6kQ70fgg5oUVE/LtQ54OtnFe
         3xqfy+6WZ55sAfEb3QNaXW476VfZxEubH4CZJS5YuVTsHlMi5fjI4nDPO+YF1Ewe9qWM
         V8VXCIBgKXerf9e/kREsqslsMqc3id6emG8V5lhRjaqJQpo7a0na+sagM9gOEnZ+Odbu
         MAT30m9XoeJMqjfNydbJsCZfiMIRuDsUArhbz9tVnTrPOOfV+Pq3ESecz4URpfx515J9
         kdbiUY3cqTK18f6kgR18VExTiF0r0HqTYjTdBF7nndjezhHsnjn3pcvVMXphYpXRTQcC
         ToOw==
X-Forwarded-Encrypted: i=1; AKwUvBwtW1OrlU7CXhYPgGHjSupd2rmAIa7mNS2VOZxUaTo+d6p9fsgMnMLqGoRv2s6d4J2eI+GiECiNG2vOzcg=@vger.kernel.org
X-Gm-Message-State: AFuF++mRl5s6okJ3vdwMkyGdMPYvCtVFxZtG4qu35FDKMjvDQA3DpAQd
	zD7HxMQCOlcMO/BiefPa0AGdH5SHC6jep++Kxh6fpjMZqCqLkz3L/04xSSyz08jjJr+OpTxPrRs
	9uq4SKFnd+nmuZR5cPTcWQ0rxszmnP6PRbr0NrAA/AdvWAy+XZ6L9Wx8/vXEZGh0SNsr8cSQeE2
	E=
X-Gm-Gg: AYBFou3Qny7ApD4v0PtcyGZgbr86rm3RJrWFmmgNc1YtPABPIrGLCvPipVscLMx/iZ6
	vkeo39IbjEhhtjcfFiq+ndLetno5OMpDwa5Wm0kvXzfrjWS9aBy9R/BnFeyn7VZHn6+XrqdoOiP
	dwp9YCxPY27iAbKVocDYdyNyyHnce2/T6O7QCeH88SRi5y7hHVHyQKiFoAeuQCIsTcbfaj5ZKeG
	1lRYW4/W73UWsXvk3dpceObAu+SLaCmGzBo05fx1TzxYJKcB5c7SW5rByGbeFZ2I3dDRbmJjdbs
	5nDrrNptsZBIHOGT/xw/liln16kBQVra2HthA6lTvkNOtFbA4NDvDyvWr4y8rlnEwl4bs/FoD5f
	FxfICIEcOnXmtHJLLkHePPu+oxDw=
X-Received: by 2002:a05:6122:d89:b0:5c9:a60c:2735 with SMTP id 71dfb90a1353d-5c9b598e3c8mr5157161e0c.13.1790002033592;
        Mon, 21 Sep 2026 07:47:13 -0700 (PDT)
X-Received: by 2002:a05:6122:d89:b0:5c9:a60c:2735 with SMTP id 71dfb90a1353d-5c9b598e3c8mr5157130e0c.13.1790002033132;
        Mon, 21 Sep 2026 07:47:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm24992091f8f.14.2026.09.21.07.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:47:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:46:58 +0200
Subject: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
In-Reply-To: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3880;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=55BCUBdpjTt4Pu4DifavT/3kB4yaJtykeAtNAaIzyw0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsUNpHj9C8nCmp0E7vvStBdCnH4BCjNqVuWs+6
 IjITR9k9uWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarFDaQAKCRAFnS7L/zaE
 w1R2D/4yjLsyv9ZR98Phr2cOAJg5zPJU2W+kr5ovXdfyG0EnpttroRI8EnuxMXlbmjOFMCt4pkg
 Y4hvGN3/hRZ5TlDTLC267ni1RCc9gl9vcBjq1Gk1SwrCHD/7MdZg9Ag5YLQQUjnoq/CVkyLtF6P
 bWGN2ed9sWn4liitauNiZXA1kbtkxygOUqwWKP9O8W94qElCpuPopEcIWUMNZjQODS57+8Bg+OR
 XVrPJdqFBpz1TNm4zh5nS/1ROK3E50/zCloxnslrfMQutSvxUbiGe3NEmkl5sJE5uzlhURITQMn
 z2WEOMh8a2DBbWvZqVvhNdyamJ5nxiT60n4NUHB60IJXakwsGjEqm8WcRxvPNpVqBMKHHo8oQpw
 qIN20ctIclo0eznqNwS1B/Yaw+etAt7WvvRib5L/+37ORb1xhGiRonDA0HT95nIbaGZnPfnA/Hn
 RMn5qNBMmiVpSVGs/opuPdUNK1nAjFzGFzMNFBXyHps+RNcnzvhmafGHn5z/jQzKCAlfd+TeGcj
 RbpNWQWdOSlmlHvlqb/a53ejOP4jMgMajG3XZmQKHIA2KhlfeXMnOUECNfvPWTERTjsMH2X8UYZ
 34/4bktWqNMXSsLSno5EEFmTFjBCbHXg7xsCzD+tBlY9jZGIymiI+10gU+3CzJykr9+XHd28YOC
 mwFPcKHv+sWNT6w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: x42WmECyTSuE8H95llaMmp6v6DCH4PXz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxNSBTYWx0ZWRfXyAg5DfRiuXH0
 FUTqN5sySvAlT0vHEYtgviyH3cK/x5+N0GpsqRvIiZW1FaPC1C+e4Yu7R8uEUFEu3DHlVzKxlFC
 zSwncXwrWpCYF3+gDixMFfI3q03iKbU=
X-Proofpoint-GUID: x42WmECyTSuE8H95llaMmp6v6DCH4PXz
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab14372 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5TetioHNO0Q85TPnjQEA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxNSBTYWx0ZWRfX7M5IvaFBUD6B
 m/6nFxXrmLaw+YQ7wKxKRN8dBk7rbVPio7AJ5XDP+RfpEfUxb6dgiB8A+gLLKi8FVqVIjM3cd1D
 OGjsn7N80m0Byi6IwEcVH424xTWx9e0YKK7ENUDvDhnAn37cHt6+YKrM+Js6HXdDpmtntvIUaXU
 tP1qdUChAyrVcytKLy3hZfVG5sMKFeYtavY0ot6Ijhx0Gt1IzXqPNTPGrZYJ+F0Avj/PE67OfAP
 AYx8XrUSd23mPaO8GWDoxw198Zr+gJyJpf2eLGKPFVyefh1iTHSPaUvoDDTD8VbgIVRoIQSoCqi
 d+jhr/97g42qxxxYXb00Xs1CBOvn6BhN5dYwxeaepNH+p1VUuIHVeQ6gyFENxvdRJsbIOCnG/jO
 rIV2Vhp9Ropt3AjHUiKGIxc/+o+saxH7qAQs5JtJPX/FX6fMgAlu28Yjz/vHeQ3zXOxhQWFizii
 LQuqyTVSNMZ4nvNjmrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210215

Add GPI DMA controller nodes for all three QUPv3 engines.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 67 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c3087a168416ac56c60655bd13b124b..9f4e0e1498c329eb7134fbc725f1dc05ffb1677d 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
@@ -909,6 +910,28 @@ soc: soc@0 {
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
@@ -1107,6 +1130,28 @@ uart20: serial@898000 {
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
@@ -1278,6 +1323,28 @@ uart5: serial@994000 {
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

