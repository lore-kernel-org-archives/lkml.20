Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DD848381C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450890; cv=none; b=B6tsBPoexwrYRJAfqFobWvSP4X8s7e2iYTtKSGK4pIgA0J5Xe96XcE6zYw2Tw75jQZlwG/714YPA3s/nx2VgdZJqvFR2xCh5tTUQKPweE/vqKFIDSiXV9/OU2jf3soRVWGvB6daabBSnBNrv6doxl+N2aw8qWTMCsYTIODmDI3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450890; c=relaxed/simple;
	bh=vrYb2t0m+G63nNvSenUd/NzCQrfLca1rtXAnnP4ag/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JaNLKg67fcGj7KCsWsQtaWp+KHYbwM07w03rCIZ8KNHOKHnbkRLyr9/0UhcJC/tVod8R3N/DRLNLdYea5qvNlap2H7tRhQj+2fXFzO/M8zk5m7QKnKA6KLxenA2gY0COf8pNB79yXUvK0TkzXiLHRGpNR5MMAxvzFZxXIIbTURc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHJNbYT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNtDE8ko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHJNbYT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNtDE8ko"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KXef1169984
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EFgeEVc36/9HsHj+IBx2w1oRupD1Wphz8jrH0qJ3tYA=; b=jHJNbYT3yiWWhmng
	IsDbt3FTdqE6YYZkMTkJWFa6TS/w5Qf4ivk7E24m9DYxIxf6ytnh0vhh9Hu6/NkO
	igPUaX8SejDaEHVTqs/GWgCHIA7GeHQQGm/ER8RUx9RpwMscc2NbTZc1evGZJUii
	CzQ216wbl66qruyPTzfXQFNoFMNkc4S8ggrWhyRmVFfdPbJ18nabb0JfL04a3WYk
	rlxDcaTicTmpuQQSmPqFY9tyEwfY6g6SY2TqFFgXgkzsENuRI0zLsdny8d5i2ScD
	MrJE2Skt0x7TDFIfphqVvHzctn2l0XlTVbnPRFmxxgK7Nx4I6ekCWciMPN7sWOCi
	PAoPbw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3a2wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:14:45 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14fed306427so16932174c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450885; x=1792055685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EFgeEVc36/9HsHj+IBx2w1oRupD1Wphz8jrH0qJ3tYA=;
        b=DNtDE8ko6JfzzzKtUQOMsv2YjAVwZ5I2/jYNvGJgqS3OllAjY+i7v5iK3XO37MkXeg
         DqL+6cPXKs4+PEuAT1H+AklDk7IAOVO/S3HTM2K0RR0F7+yIIaNys2Ns7I0z9QXgiMyR
         xOLX3TZwTerrwWpucf+72Bq1SI4DBR2Xx1TGXtmQeYEKMbtvTUR9YT7xt8hyKj4+sj0l
         YtzvfWmgfr18QaVwu4MkMIYyapLaiahCZjASniSBMR4oLi0Xz5+Kl9Sw3AjHZIIygD3c
         WnuHnHo2wlzBKd7GGs0195Qh/etp418Cwk9MTqzCGyQ5uwgTkYgGW1mirCcKHhuU6kGU
         tqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450885; x=1792055685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EFgeEVc36/9HsHj+IBx2w1oRupD1Wphz8jrH0qJ3tYA=;
        b=sjdYBVKQ2brJt06Od2KkQuGtDoVtp/MY0Q32Mrcr0x3zyF/uP1iLKOHxsLP1TasKBd
         FUtx0+WLaeEYHlcrf6Z+g8xAo0sqfXiyI9TcbdIgdSlE/vBu3o/eIE1/JUHZwWb0LcbC
         ZeauqJxV7CeornAfso1kIiL+ILLLQLcWHNJKoVllEXrCUfg3Vi5vymK5vftXu3spQ8D0
         sJwa8HkIAI3aHRWC2CPj5QTydBdxnkWJpU958asiVM10TJWLp+D4ywJH207J8Jm7Heey
         LfXhFpsvIjKAWDtX9U1TDYyprj3GT+NZoOEdRCpyfoIyv0AlEZY1vB0JsxZP53nBl+2b
         b1JA==
X-Forwarded-Encrypted: i=1; AKwUvBwpZJY7W8DIvrL7FA+2Y3anKJJ+T1c/FYCs0iPDGKHDBNwm9Z7zCNNPR1B4SwwGy9+mRwYpYAJuybcuT6U=@vger.kernel.org
X-Gm-Message-State: AFuF++nh3cA4V5vRljiAehMOepABOZD7t3putbZeTacEwsKfDkTS42Ak
	srhXrtiKrzu8oF8XcOX/uB4TRu2t0dmbjZPHc7ilJVpoMqCNlgPvBPZ7rV106ejnd2bXWKgFzCD
	rVYZge+tEVY411oXNK9y9KuFCYeJ5WqQ3JJgT+aUqlVbPHfBqTZZC7mA+ZllKU+qYMQE=
X-Gm-Gg: AYBFou1y92qtMhFuKEh4K1nVZ6xZM3a9eF+NW5DI7kmgZK3WaRNAmnB2LgNbiL3uenY
	sIH9yl+QUP1Y5XfvH+a6plWD9YrhoZNDrje/8x6W6pavcvDvhbjadk3r2cXTvJsK4852M6U93uf
	KNLQKhzSInetP6kn20b0r/tNYmvMol5XMOlGspz5NkmQutsl8s7k2662Jv5aAiSaIIrF4NTqe5f
	u0Gl53JZUIE205lNopehol+7Tjso9UAKO84hHgmEwPuS4AXDX9DMedmeTTva/eWoefv8mbuNErX
	3wM/ERiSDoUeiTYKsQXEPNqs95DH5H1ZOmouMSNIGwwrSjuDj1vWDtB+gJJe0qB75A8ScUIYZRE
	OjM5D/a+58nP0+N9lsZBpHT9c5Ou9iDJ0G547z1PjHjYDUWratwE+gLLLDvedfgWV0NGEuYFs3E
	cdboaKCNL5PLAfOlx+Cj1oO6uThnof
X-Received: by 2002:a05:7022:3a81:b0:158:d432:c816 with SMTP id a92af1059eb24-16208fb3d7bmr6773247c88.34.1791450884665;
        Thu, 08 Oct 2026 02:14:44 -0700 (PDT)
X-Received: by 2002:a05:7022:3a81:b0:158:d432:c816 with SMTP id a92af1059eb24-16208fb3d7bmr6773209c88.34.1791450884045;
        Thu, 08 Oct 2026 02:14:44 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:23 +0530
Subject: [PATCH v6 03/11] arm64: dts: qcom: ipq5210: Introduce RDP504 NAND
 variant DT file
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-3-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Kr-U4jEQZX7tWi2Kl2BoBmLme6iq--tM
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac75f05 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=r5J3puGfL9QIZnCGJ14A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX3lU67Fw8QpJD
 tNCuaLwyOj7wY9PK98c1Yj67vmW+4tirBvnlUNog8q/fPR8qii+PGF+PYvhsa8neovJc3WOOLEJ
 dqqHqkaxgcdCgSMCjqsDoSbiABjAReU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX7QQd3Dwtvn9I
 jxpBShfxSDVgcmvzX8RVkzNqzY10fMDA3BaI4AJcCE40xd12+0sju99P0d47KjeHgEHlLSE5n04
 R++DHW4hr7AMy5JXMQRSw9YEK7XqIaObBu7jkHnktsCkM85vElSYIC9clLbjgeJk3kjHLK8vNq5
 k3X12UXidwcMZRz0aKcR8wmNAX/HbDboCWebpHlpdZEZurUeNi2inIxviDSeyKqNbKb6ENvswx5
 BneRuiOtmzUnKTOjYsWEnlt7CzwX9K2Tr/4YigpzgDuuUkrPYXrpw4NGp+JdfXTNtqwjXFeu/8x
 AfIdLE45SFzMk9l1z+XvB/dT+H1b96iNlEQsZup67VbTZ5R8aVD3dnRIGa1WuVsyzKL5lzF7++6
 3vgq//xrmnpUsWuSLXMuWXflB3/+PwoLiZOn0Gpm7eCsnDPscptHNNnO5/8KPvwqdZ32L+wufqY
 Y0qdA3Cy1dY5UMPB0Og==
X-Proofpoint-ORIG-GUID: Kr-U4jEQZX7tWi2Kl2BoBmLme6iq--tM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Add DT file for the NAND variant and include it in the Makefile.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  2 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts | 29 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..94ab6355176f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -32,7 +32,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb ipq5210-rdp504-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp442.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp468.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..8b7106cbd7c6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,29 @@
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
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};

-- 
2.34.1

