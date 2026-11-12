Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458203;
	b=G4igeoUEVa3M/JTfExGRah6LiB1jCdUhXJ95+2jVoZtzORwLW7VCSbAKeXsGpayyZZ6v
	 KiIgVbnez1XxK+w6LxQXfO0n+ELvgY21QHDc2/n3u+6QLpFfbSMMuFSsdg691/+eMWaqh
	 IPgZBJhhMCbqBsVlvp2fcPUmf04bHlV1BgeKt/RHuoFc7+M8ecG9lG5i0JK0D93jRl2SB
	 NbPhqe3IRFrbFCrv3FUNVvbzZiW0gi3mdtkeLvmCY9fR4ymKPiO6dwc9o/BDMqdzVi0NZ
	 +zHcctlea9lWFRdu/wG89DM6esLacdLJJ+i0r9iFxdpsOyhpqTBzbBN+zT4U5ApGhMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JWCmOpxpplATYJ2MkPLVAT615DmxtQ01VpFIS4sOd2U=;
	b=N0OHStdXMFp1FlDekfSfD9UsVyjezKy6i3HxjwNusGtyw0ybqCjSQSgR74mWi8dVF4Q9
	 LSaWATqq7ImXSlTTAV4ykDQXOhJAvgEEDuFRN978VPunx7vrRd1A7cJBVN5/0lNVEfOb+
	 L0dN14265nPlaHr8Iz8E0hacVb1ZAXGojBEf4yb9e4gIOzx90XxgUVOh1SIu556unyoGM
	 Vc5paJZaNoAn0hjEZdkDohxt6pJjCnqbY5aL0Xpesqc9BYIC8NMuUGUeeK8FaEhE6kF6a
	 VI18oOSdQXOTBRcsTmZLnz6/EL9zs28R1V8Uc6TLA0moM4FW2iDFqfHQW0DEN/erQ9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DxZWFwkb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f3kg+pUD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C5C606B7F2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C5C606B7F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DxZWFwkb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f3kg+pUD
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2a0I5597692
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JWCmOpxpplATYJ2MkPLVAT615DmxtQ01VpFIS4sOd2U=; b=DxZWFwkbWLNRO9aD
	rAOa4f68bwdvWURteuMnNRsKfT3NvXfz0fM9rdwmtnQ1UOoB6nvjJfQL9KxoVb+0
	ACuMN7joL3hsDFIvCn20OJ2UEfw5HqsxscPX6tOhIha6/P6g21Clidai9aLYqdka
	zDAOO2Hb6Wuh0SRKBkbf2+YDu8CqLUAfxe8CLvxm/xPFzWQrHW7v4xsGUY6SpQQG
	ZPH8v6kM4mcHPAOUKf3+Vw9J+QH6nSbS6CR4NMlwKt34Lp8Zy2gjMhuQnxerJ8yD
	D/kyqTzdSJOjDx7Mo+DV15OmF7Rbg4MQc+0+NwU1EQUGl7ZYarG5IhhdQ735VCtu
	jV6z5Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1530yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1327559eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458200; x=1795063000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWCmOpxpplATYJ2MkPLVAT615DmxtQ01VpFIS4sOd2U=;
        b=f3kg+pUDW+TioK4kf4KqbdPTeQw90j61rtyH30q0avsh6oPfIB8xKuMkcrCZ0B29NF
         UFw+ooowj114nKEn76w9jluX3aNgDpyAaCkenZjBktnMPQ3KehygGWidN6eSg+Dr5YDI
         LqkOgfk0hPHzz+pzd5sGhDso1DJORCB23n9TmJLCpoQLhxzEtgYtlL98wWTeCRg5d3zf
         p0TVRQ/N7ZeJzy2nZY0JKD++r4dgktA32MkLXkYzcz/kV5X6GthgT8uratFBvEpdJHCD
         Voc9tiWTzu/PrM2GS3TCufRxI5Zfa9xvaFAgQYD8/t58ZfgR4ROV/RYP9CprJdKUya79
         3fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458200; x=1795063000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWCmOpxpplATYJ2MkPLVAT615DmxtQ01VpFIS4sOd2U=;
        b=AuJ488irSN7rBT7HxM3+0lvjrWBMabZGNKmheOCxDPCfCtehjTfNNLCj71Tv3eV8Ch
         YjTaCE8/btUY0cuXeD44IWTwME4eofob5jikgDyjQvEqRbVuaCMpp/mumvb0hR7C/Otd
         lTlCiD6sD04tzQfehth8k4wbwA1RtVWSIkftXpZNVttJtkVBbQQWuJVTAs4f0LO46ijS
         rNpcYvrRN8YK5Ez0q9Cd+/tkUbR6RwQklTN6/mGdRBNrp2hYh9JET5kAZ3Bfc22DbV2D
         foU48YCCsAwk7nAKDVdIJWREGv5ZFMEjsicDDlp40f2aY7DFPvr2qj0YehA+EsZNKWc1
         gPdg==
X-Forwarded-Encrypted: i=1; AL+hErFfNPCIfsr7G5D3lw2JcF0hU8jYcElQWEiPxDcuUsDZH2i1KAV9ruG+/qdJ8vT/uS11brtyDhJHfDpviwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g2HdpBIuNmgpgqRNIUFhz0BzaIn8J1eVyWYjnsCPECzsoDN59
	LZlO8yzeE5W5hbU9BX+bBXId1fhWgNwcsTxOtb4JQ8dApMH1sIV+fDCJLejwkeTC3doUnubRVkw
	j1XGhrNQ7GNH/fS6SxM/Yjs6Jg+oa66D8ppMb8hIIOYj21DE2u7XlgfamTCEG/2e4cAY=
X-Gm-Gg: AYBFou0g+6xu32ZzF5vnQCF+XbLNnAdTquaOp64hdoflNACPNI8nxvyAsMP2YGTjiOh
	T41g65WlY3xuzlkrDUXwM+J4PHuBn5vO8A8hgbsFf4CtxYavrMzkiNGWGE1f1Usd3X54JpT8mqW
	02Abx9zW3TGtfIVXRYRESWEqpJUH0LiPJVaVzx/dyuMv1gSuoBqrPRF0A8mITEHFm0fHyeSfRlV
	zI/Cfr7IBTSuVXh73smo3gX5auSzyXgUfjh3c5QnSgYLt7tYVMzNMwxhnJyTnUQ91zFOuB7gpvC
	3UKYDdo9eJmdd603VRloPNUQLR681+UJvC6OM4GX1NZ+ZoscrBPk+8G2N6J9erS5qnoVBXYMJxb
	Q7vRz/1RfUfpE94J3YFRYBLJgglTHMQlI0R0eK9aJD7gedNn3C3TTb5+1zxmuw61sfP4fS8Eti7
	dH085kOa0loVhs3Y/XYZDv/+CNee+jPcpYk3ApgPa+G+xV7YpW5ORci4fO4DYSVfkt1M1tXXQuI
	vDcVps=
X-Received: by 2002:a05:7300:d211:b0:372:eab:d700 with SMTP id 5a478bee46e88-376831886c3mr4269075eec.1.1794458200226;
        Wed, 11 Nov 2026 20:36:40 -0800 (PST)
X-Received: by 2002:a05:7300:d211:b0:372:eab:d700 with SMTP id 5a478bee46e88-376831886c3mr4269049eec.1.1794458199626;
        Wed, 11 Nov 2026 20:36:39 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:38 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:22 +0530
Subject: [PATCH v9 03/11] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
 variant DT file
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
Message-Id: <20261112-08-dts-v9-3-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX12U5zyNsc3Gw
 2cRiCf0UiFcLEWkGD/paqzIfoqjBo7LY0Uabd05lXZmVPb1nDbAa/1RqrY8NTwrAuXJjJKIIZdb
 h5Ik/fWBFSq6/06fLopgu5eBLTa9Ifg=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af54259 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vH_i_heqKRWij10IjioA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: t0a2MTG0PzAG_YN93ccdz7bWpNLnDdaK
X-Proofpoint-ORIG-GUID: t0a2MTG0PzAG_YN93ccdz7bWpNLnDdaK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXxJpXdnMqO8Vy
 4DXplUNXz0ObHDr3jibS0U7fIYfei5B4xbcylI6N5JCdB0TSrKNqjEPM+Modcexj4O+x8gPsBxX
 8RczIhqtftBzaB/1nJ18ylZbZWq1IbP2pEo7ugPVNxnVHSWvkJhTNcL+Pwf17EJRQgnAq7heo22
 Lf2JMEd3HoFdGyPLMTlhnT1W4LDlRhUGnG5nQ/jyQu2pc8MfitDCC2siOMx3GBzPwbG+j9SCJSN
 siYUZdPMOydWrGLhB93B4vXPxIUTOQevCGh1Lx9F+0ZFznHABhCK2q3lTw/aMI6QLH7s/q1Q/aQ
 6zGZ/42TUQlJB5nF+m1lNjXqeupPtruWKTq0/Jds4up6n37cP969l+hqLIjGj702JZiYbUF63nP
 rnHk9N/Mti4O8MfI3D9x9WFfVtG4w6MuROM+ieK7uGFDE+flvsFP2TP3u0XnDzYKD/WmMr0aNnl
 oh6fQphEsAGa618vQ4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Add a DT file for the RDP504 NAND variant and include it in the Makefile.
Enable QPIC NAND for the variant, and enable quad mode for it.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                   |  2 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts    | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60a3..fcc94cbb3233 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -41,7 +41,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-som-db5830.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 6fb8666ffbfd..17daf277edbf 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -87,6 +87,8 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..1145fcf0a302
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (NAND)";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&qpic_nand {
+	status = "okay";
+};

-- 
2.34.1

