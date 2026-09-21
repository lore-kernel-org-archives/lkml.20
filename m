Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8F34A9D44
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002039; cv=none; b=mXMKT8nkuPVxEyscG/McXOIYwl2NbgZ7u6wbKjbrDIw9RCiXdrh6EkOIK3MCDJjLqo6GDSBHLu1y0YPXPrwHdSCXtYJOTMtuVFoOeNVhH67TpLCU6dt4pc5K2VNf/jQ8OsEbv2AiwfeLqSw98yPAtWbqG9iXbGZoJXdfX3MRc2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002039; c=relaxed/simple;
	bh=2YBSOpUloJeOo0gUlMDWkHdVrud956EaBJk+8lTaslk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uf5Odf4+ztJfMmGBTYQXRaSOzXOB6EHgE25Gp37M09EnlMFcpNT1elxrYaixodC/F+wKv7dqNcorsGLxxIXNcUhnEUM//lQOQSABv7LpRL7iqZb6f/D3wJJsam9OSQGz2ru4n3CIPocm717tTvUWWpC44cSeI2VlfKLQac6EWmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBFGX2H6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPaSSlUU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBFGX2H6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPaSSlUU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGWjV2568117
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z9sZcBFSA9fJGluApKNyvWSkZPXaq5HebaoLOU6Deuc=; b=OBFGX2H6tXTKicib
	ZJz/KpTIIR91o/ROjWbNeZoX4lh0/vaTrrapFJRZsms7Pdp7ARghSZFujVt+UfZw
	MYXUtbmzy5EdOTiE0pzCi3IV4N3CXM5w/ztHA3ETZAeuCKNWGdLSIqDuV77l9TN+
	mqWa16BtvLZ2SgcaL0MzC/RKQA/e3gdLZGtBAY+3c0bqz/vVa69dMLHaRk/BM2zf
	Il1Kw0EYfF6yFFxENbrWSE+u4r3l3sLZcCQepCyhSxh2Pt/CmhwKbbqhxm0pKyPV
	EYcfNwaW7S4b9jcCetS0q2O2gXqh16O2UbRxfVasVyesmHMFOUSsmS8csaMmYyZj
	iclVlQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wtwd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:47:17 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c683ca769dso671556e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790002036; x=1790606836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9sZcBFSA9fJGluApKNyvWSkZPXaq5HebaoLOU6Deuc=;
        b=aPaSSlUU5Lz0jIN1YkIigj514PihFJ/Ko/3u5Kcpr45+ygkccRoCo1NKAwnSlQw8We
         0wduw0mJMFcWLoAquhgY9IOcVa6t3JetRYjZW2dA+b8qxcLUPtWWdGlo3FkKHpr1191K
         lYtRav2k6j5rQkIdaOWN8XXZNiqVOWzixO7rszsrGb8UodyBDT/MMXU0xmmkcqZvugTi
         sHoELN1weGoF6B5J/6794NcQjcqB0Xs2IY4KEz6xUGZZcTgW1bLKIy9DDwLJsjNelQz4
         Td0iI96Cltfq7XMBqoLIDA2BnPnIf+RmbsNBOcWbG1uqip1YcpnhhFnpnoSQ+G6ylLAx
         DVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002036; x=1790606836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9sZcBFSA9fJGluApKNyvWSkZPXaq5HebaoLOU6Deuc=;
        b=Ssu6ivLbi68HaYTkTQJmoYP/0riXXeob9Rmfmz7VRihsYXMxQYWPfPk5cQJAgL5EMJ
         L0bbNIHD5b9K5J1tXIZMbIjKZyl7PsfzIafQAx6allaCGX83kvnB92YpPu8Gob8K52vX
         5FaZU27Q9ANwqSjrwnFnb58h9AcIZOc5KI09a/UpNRHd45o/D2L0/hA27qDXgIP5kDbm
         r4CDMu1QWsmWXiJ/NXWoFYyb+/hAz7YEQRuab4kCxrbbPcLElHSpkPOHlkHQWP/dnCAG
         +c04t0CsQdaufannYAAZD1ovuxsFtmm8C85RvjgICG9sfQVDbNA5GyXJDt/KURIwWrYY
         YlmQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2N8DxFfBRWmD/maUIJcfOKJHQo5B/At/zgPumn6VtTMNTh5RD3Ec5AOYMHRO/uz0/UKSLoV1YiBPn3Gs=@vger.kernel.org
X-Gm-Message-State: AFuF++my0G/UYVwPJcDRfjamJKdkjY9GeNhCLtZ1fei8bhJRkG0S++qh
	82Nv9cZrwGRigwOme16duleWUKIWDhUwd+1wHRNmsKs28m1ev1sa6SxOwbifr0Nrb3n+vfLKP2P
	PvEOPMoyfwx0mso9HxLLAiguesZe2YiOSr9Z8jRVAW61nHq/mkIvH8T2X9v5HpXfDYAWrcpq7my
	8=
X-Gm-Gg: AYBFou0SwVi5ya9C4XqyPz/6IFxvVAeQtQFnyEEWpC07sgkeg7I8Vuw9ZmwbsWUczKx
	G2uxTx6Bktf1clnPj0g9aYqb8WjU6LaNOwqu2qVcEIORfkB3Y2skDhAlk48/P+vvnIPWvMZ2u9Q
	3doyOIKiYD2HTJd7MjcdNG2xG8CAk+OxohjkbvoeSeiXmOUcT4DoLhA+u+htW99P1EPTl/nplUn
	Eom54C7xhS6N5olmspaUEl4jcc8krr+fz/eiNzn7I+jKU3ktR/ME/P8w7BRBEEMapzov/lrb0o9
	Yt/rHrfsHWGhHIlKxgTXx5uISmz6N8V8WQ/fUgp/+Z49mh9VGJ7xXkadv4wDoLnAlNT4/EwbJWp
	pnKEIkOWgnCY7r5gaGmfGkbqswsY=
X-Received: by 2002:a05:6122:208d:b0:5c9:a60d:327b with SMTP id 71dfb90a1353d-5c9b59cc72dmr2473902e0c.15.1790002035679;
        Mon, 21 Sep 2026 07:47:15 -0700 (PDT)
X-Received: by 2002:a05:6122:208d:b0:5c9:a60d:327b with SMTP id 71dfb90a1353d-5c9b59cc72dmr2473825e0c.15.1790002035071;
        Mon, 21 Sep 2026 07:47:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm24992091f8f.14.2026.09.21.07.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:47:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:46:59 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: nord: wire up GPI DMA for QUP
 I2C/SPI engines
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-nord-gpi-dts-v2-2-4f297c983b94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10183;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2YBSOpUloJeOo0gUlMDWkHdVrud956EaBJk+8lTaslk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsUNqBDtkh+aPan/fAhpBUraJsorQ32MZ5Wq8J
 6brKpGXl8yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarFDagAKCRAFnS7L/zaE
 w3oED/0eikUokifi441RScvfrNfTZbddU+WXnUgw0hHdNFiKz/fYoEF+sTEVSPxLQ4xZS+23quR
 0Svhl0Hee3MGSZNmjYF2bWhk5heviG+KukiDYHc5jXvH07n77h5l28zVmfB5m3sZCDDJr6mT/MB
 1hMwAZD1tMeF5N61nQ3P9VyEkHjcpWvSBY6+vj172rn6o35v46X59ATyuMyJN47S+SmjeqC4caC
 AVVfAso0ORDfMP1XAHEzQZUXpnwNwutkfQjbb1VSXY7tgl8ft/LUjaOSf5ZUmO0Dc6y5fF1Toj5
 us1n94+rsgFVTldfaiFdR162XbFwK0xbDMHTGAitk6ML7oxRebQ1bPZZn+9sBFpnwBl3niM2KPy
 x4+hCWnmaiuwigdlGDzdjxqDP0x0j3/DfajFu9/aImu8Hik+SZCVasbd/KjHgpGNK1ID7x+fn71
 pesbe+VdH/ae/rxHCRiArLfNyqFUCpyzuot8u0A48vC635DE7cAu2Fvd4N1hYAEWiuPnHA755Rn
 UOFdtNGW+iJAD0TlsIC++2HBxXdtow3LFMqrfkda7igApQrBycHf2qRbGP9jy4LsMP/0iHQH+Kg
 l45p7mxX6KJhezSKJ+CqyJebqSlbRs74IaK76F+VyfjBmRJHmsSzPVmHqyaUMxTBIs0dLnUAfI7
 Peni39abFow98fw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxNSBTYWx0ZWRfX5q3slyv8rwKQ
 T0l9BmC/mHgFZYgTN8c6KjCPRDhC2fMai4y5m3gzP3rdtOEo3cViF65aTSI1wG6+vIfoPmlv6XF
 6uEqQFs1MjPjeYZBBokl1+UFCWLry77M3d20T2nku9XalrIoFTNO22iWCPSQAnM0IvVrQu859eI
 ikITgxlCNWnf86WVjfREzMIzMzV0SfkgKrwMwuhiDFBM2SbYycJkfT1SWd72vhUAXzn38cJ9L93
 GZMWOnsU3EQOJihbWifLCrwzfSpnqBhosjesDOEX0dGpagFgLJ7WIEUkLQ6RJNMuky+VWis31Cg
 SfdbyW3t36OekEETzdlpagLLVR66gYSYd0le7hTPxyBoP59Lp8A9ix3f3XG85WZZiyu2eUcm/Xs
 17Ha05G1dkiuT2/1XzjZAClHWRXb6Kze+fpEwMPj8KpW1hJWfJsUsGLFEAvpEQNJuol2R74h58C
 rim4MLWrVpApbIhgA+w==
X-Proofpoint-ORIG-GUID: -DYxfc2bARSUxqNubwVWE2d8QjGOOZ7X
X-Proofpoint-GUID: -DYxfc2bARSUxqNubwVWE2d8QjGOOZ7X
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab14375 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=A0ElxUCGbprSqmrbtIUA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxNSBTYWx0ZWRfX5c6pESgVIoCW
 ArXhqU99ssjJyZTwEjfRYEhZHCcIhXNSnYFioTwDzrX1wLm9D/Oxc+l43Kyp4zDyO8Uw0Kj9xvw
 oYShlZtH6Cgt49na3WylRQYj2+MhjE4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210215

Add DMA phandles to I2C and SPI QUPv3 serial engine nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 124 +++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 9f4e0e1498c329eb7134fbc725f1dc05ffb1677d..906e4e67f03c70965bd2c588f740dd86f0b8b798 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -945,6 +945,10 @@ i2c14: i2c@880000 {
 				reg = <0x0 0x00880000 0x0 0x4000>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -972,6 +976,10 @@ i2c15: i2c@884000 {
 				reg = <0x0 0x00884000 0x0 0x4000>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -999,6 +1007,10 @@ i2c16: i2c@888000 {
 				reg = <0x0 0x00888000 0x0 0x4000>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1026,6 +1038,10 @@ i2c17: i2c@88c000 {
 				reg = <0x0 0x0088c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1053,6 +1069,10 @@ i2c18: i2c@890000 {
 				reg = <0x0 0x00890000 0x0 0x4000>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1080,6 +1100,10 @@ i2c19: i2c@894000 {
 				reg = <0x0 0x00894000 0x0 0x4000>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1107,6 +1131,10 @@ i2c20: i2c@898000 {
 				reg = <0x0 0x00898000 0x0 0x4000>;
 				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1118,6 +1146,10 @@ spi20: spi@898000 {
 				reg = <0x0 0x00898000 0x0 0x4000>;
 				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1165,6 +1197,10 @@ i2c0: i2c@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1184,6 +1220,10 @@ uart0: serial@980000 {
 				reg = <0x0 0x00980000 0x0 0x4000>;
 				interrupts = <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1192,6 +1232,10 @@ i2c1: i2c@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1211,6 +1255,10 @@ uart1: serial@984000 {
 				reg = <0x0 0x00984000 0x0 0x4000>;
 				interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1219,6 +1267,10 @@ i2c2: i2c@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1238,6 +1290,10 @@ uart2: serial@988000 {
 				reg = <0x0 0x00988000 0x0 0x4000>;
 				interrupts = <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1246,6 +1302,10 @@ i2c3: i2c@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1265,6 +1325,10 @@ uart3: serial@98c000 {
 				reg = <0x0 0x0098c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1273,6 +1337,10 @@ i2c4: i2c@990000 {
 				reg = <0x0 0x00990000 0x0 0x4000>;
 				interrupts = <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1300,6 +1368,10 @@ i2c5: i2c@994000 {
 				reg = <0x0 0x00994000 0x0 0x4000>;
 				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1311,6 +1383,10 @@ spi5: spi@994000 {
 				reg = <0x0 0x00994000 0x0 0x4000>;
 				interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1358,6 +1434,10 @@ i2c7: i2c@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1377,6 +1457,10 @@ uart7: serial@a80000 {
 				reg = <0x0 0x00a80000 0x0 0x4000>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1385,6 +1469,10 @@ i2c8: i2c@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1404,6 +1492,10 @@ uart8: serial@a84000 {
 				reg = <0x0 0x00a84000 0x0 0x4000>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1412,6 +1504,10 @@ i2c9: i2c@a88000 {
 				reg = <0x0 0x00a88000 0x0 0x4000>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1431,6 +1527,10 @@ i2c10: i2c@a8c000 {
 				reg = <0x0 0x00a8c000 0x0 0x4000>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1450,6 +1550,10 @@ i2c11: i2c@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1469,6 +1573,10 @@ uart11: serial@a90000 {
 				reg = <0x0 0x00a90000 0x0 0x4000>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1477,6 +1585,10 @@ i2c12: i2c@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1496,6 +1608,10 @@ uart12: serial@a94000 {
 				reg = <0x0 0x00a94000 0x0 0x4000>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 
@@ -1504,6 +1620,10 @@ i2c13: i2c@a98000 {
 				reg = <0x0 0x00a98000 0x0 0x4000>;
 				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
+
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -1515,6 +1635,10 @@ spi13: spi@a98000 {
 				reg = <0x0 0x00a98000 0x0 0x4000>;
 				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
 
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
+
 				status = "disabled";
 			};
 

-- 
2.47.3

