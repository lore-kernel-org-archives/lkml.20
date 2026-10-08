Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5B448D872
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450920; cv=none; b=A2GQEbywZoX5soUwMGO0LBmQHt6rEGYllvNAZfGEnh+o4CW4ySzbHTrbKYIwQnvM5h/Pb0zYnsZeI9wCc+VCzZ0O+PileDLyw0/881ZSFhqY0fTZ3h1I+Gvptx+FfaH2bJsVZ5Yvz/PiUHS9FxOrq7Wm1zTsKVkgm4yx9MbVRHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450920; c=relaxed/simple;
	bh=FkxXvNYxJ98mZBbmVM3KPngHjCom1UwkID4dXjt154s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/W8dBZB6PxQSNsJgb19Fwyz8i0/Y74FEjnLy5u9VLy7nkcf/ZALlCPHwwWLg6aayG2ExGwBAnIwcdC8DgchcyAc8kuUQVwVJrr5Zr0tKtkEOhehYWzbwbCKsqvSt1iZZ2jIHPlVx1t+YTq7BuTonM6hL6zGWhLw5jU94FSsuRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBHDZ6u4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hX0QBb7Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBHDZ6u4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hX0QBb7Z"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KJot3191143
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 09:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TT3PGl8LvF2JG0CTWFDVOG/zN355029NlSHfnwXBt8k=; b=SBHDZ6u4eqTPWi3c
	QUX5Ehc8uQ+B04Z4dfAyPxlYq+3MKwNriUDJM0ocXKmV77JYH1GUI6wPX0I/SWtw
	p7YBK2LZcbvxpPHUemxXxRgdLFmS+ivT9GpONLXDRMzNFLCmc+eHo3OGdoRQ148P
	EBqYS0yHoZI+ww2l48KPl6wEp+MYVhPIM9JlfoMHFNFhF++qHYzMmKWzKwKpA5tx
	venzWXEXmmHn9t5X0uMqM0QNMSjJiFVCmxM2cCRRPGyHmTwBDGnvQSFHwQK+V/uk
	G5K40Tockl4uCNIVA1ayfLjtrd3OiU6c8Zjm/oMblLKOWdQawvRXsceuJyJoqW73
	3ufzSg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6a4p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:15:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-352aa273625so222883eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450910; x=1792055710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT3PGl8LvF2JG0CTWFDVOG/zN355029NlSHfnwXBt8k=;
        b=hX0QBb7Zy8j2aB5EgIJuxHUvQ8MQO7/Ea06Uq7JBxU1EMDZXNdxta0iuyE1oaf1Q0W
         IFAhxtxfRxOsQDsILluckOKyGN45t5Y4rzsNqf7OfprpDHyfWVj9Jd3i9pfBd7HwssjA
         6Cz7OZMPytw2RppojdnSG9BKLMN/nL+egnHBXDDMcnW36hbpplqo0iLkv9biGqWmcPfV
         QkTQggWlsMFMiEqhcYBiMO3elQUrnRQrNrCbYB3SITNlJweVBlTLkAESw59NuKehlz1H
         C5fKHVhwWArC0JG5gKqCKnP5Mw8fJOrHO8u9KSYDMDVtpBay7YpAW0M+uY7m805pstkd
         afDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450910; x=1792055710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TT3PGl8LvF2JG0CTWFDVOG/zN355029NlSHfnwXBt8k=;
        b=s8I6dN3NRokRwpSLQU5g0cU1UMQ808IQdME38RrSJXTGCZknuOdW76RWOuxgdYxpgW
         ZwdM3tMdtEJOv4cnaoW1L6WPaKS1W1qy6vrAgL5njjTweyHDEthkETmmJrbJn7LFcOto
         /uj8Sijif4+8Sax809I0+jBD7sbdjyOtZdVU0j2tsyz83dIZGAtZb11rXAX/GcxKy4rs
         JeuATgkRiaUudNFhpWWr0T+daS4Y39EvEMdoDXW9Rz4zRTdaLDQhaF1WpsMF81Q3A7R4
         RFBmJKnNjW98tf4greHwsOg1qfoyXMKTry9t0bGpm19hljNsJ3JLA0+yslS/1orQGV4k
         3XHw==
X-Forwarded-Encrypted: i=1; AKwUvBxWk6BjkyG94RMYRKfrfMm0VYajMUlrzZtzAkyyhnfDcnBdQlghdFeXErWHfJAHlAxNbHnZ2zFtH1g3iJg=@vger.kernel.org
X-Gm-Message-State: AFuF++kzVL5+XnEu6AjhU6jasxBKK8HgJEK/jOo3aN++4KVUZfmVxECI
	tNru7MEnHxK/Zib6n2cEBsJYUDWgTW+udY8xOqImyS3YGsagFBjFU/ie705OeR74WLfeSLRN/N3
	d3gUpuwefz523ysUuA4REj9fLUFsa+xejySgy9JHT9jzRf9Gvj0xLx36Glh2kl0zT4F8=
X-Gm-Gg: AYBFou3iBfEXuIWv8+1/YD17BCXRY5RLTvJh1sj5NB5xxLSUXNPtEH89KP4EjCLQyaH
	6E/HQQ0ckapbjs8lfemx2jEHfiNFQoMtLSlpNRUT3N4GC73LnJ7MBaorXOM9V5sYqLSenjWUT8A
	pagbcZes6kSDPuM7t8n2u+AxPHnVSuIwa7d9jo+Zoteli36qe8Jmnc2REzkhXIH0c4iAkUEYysC
	g7dcOG+VEf2XXKE7iXyLMQOqYEI3VqjJAxreXpkxlco7gTcbU5uLoYwGlrdtN0rZwNCGWYC+dRK
	Ec2058YZqVbG7STGrl6mcVjIPoafdeJZYpzhJFUGpJIjhSwMOJEJkHg4HMZ0dVw+I1Pekh3dZMk
	qZIVfOce+kF+1oJCyHq0iVZaLYvr23veYi/jGrYQJUu49hiz9lEdb4LM80/xGd7VBhtIjiSVu18
	KSAiiiXFLR+4Opz6XVrFGWWSJPELU9
X-Received: by 2002:a05:7022:296:10b0:15b:afce:62c2 with SMTP id a92af1059eb24-16208248873mr5423225c88.41.1791450908886;
        Thu, 08 Oct 2026 02:15:08 -0700 (PDT)
X-Received: by 2002:a05:7022:296:10b0:15b:afce:62c2 with SMTP id a92af1059eb24-16208248873mr5423181c88.41.1791450908234;
        Thu, 08 Oct 2026 02:15:08 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:15:07 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:29 +0530
Subject: [PATCH v6 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-9-f9c4ec8664d8@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: i9JrgM9Nx7ksTffRMvTnErUl5nU0wtTu
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac75f1f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GftUwNuSPIKaBOPN2qUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: i9JrgM9Nx7ksTffRMvTnErUl5nU0wtTu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX0A3NAN6vFQxS
 r6lQVMkM8mDxac8U8qRddaeRyU431Xd+IglfwK3/R+1zm3+WKm/8qCRmssk+6oGOYe+2NC5xYYl
 qUxNGHqRCRwpWZILW9GIGs/OGt43/DSvoo/Y4d1UqlltEJBDsD4XzMswQWh45Oh4wVqsNORJjQz
 UbjqC2pnqV5PLilCN3A43Y0QwpfEeQNdmnvRZhPYpyEI5c93ryxOnGItFzc/eS7zq6Evu3NFYZx
 dP8JL0YQFb/F5+55EIrBIvvwACaOoGVO3mBDdbuEweCBDxMpd/pa/hLomLZZT24U1vMAJ9GRGoa
 L/ikTtO5w0qIjaBs1NvU2+pAfNg6GN0kTuJZE/qZAx8HTnd1//hMmkPoR4AjuD9L/1+jf8e7b0J
 aUp7XAczTt2upsSGwgnISloqGvQChSycQsl1hjqMt0ft4w8ZJO0Oc2htYnviF2JxXkuqNJgdEyT
 DfZFEiMAx2GufB8Vufw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfXzYW/4qqngmk3
 PUi4oVk1+UDD8YN25ShiO6LTGL1YOpm9bqwiwm8l9gjVXOLrRGEK3A1lZWhr5qvXhKRKQb97rij
 YHqmxjftLY9drkDMa7PfCbf9pBVpcnA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080036

Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
the required pin configuration on RDP504.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 23 ++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 42 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index eceb6e0ca6fe..40926d1598e0 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -59,6 +59,13 @@ vreg_misc_0p925: regulator-usb-0p925 {
 	};
 };
 
+&i2c0 {
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -195,6 +202,22 @@ clock-pins {
 		};
 	};
 
+	qup_i2c0_default: qup-i2c0-default-state {
+		qup-i2c0-scl-pins {
+			pins = "gpio20";
+			function = "qup_se2";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		qup-i2c0-sda-pins {
+			pins = "gpio21";
+			function = "qup_se2";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 6440853da8c3..50ce79219fe2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -427,6 +427,48 @@ uart1: serial@1a84000 {
 
 				status = "disabled";
 			};
+
+			i2c0: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				assigned-clock-rates = <32000000>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a8c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				assigned-clock-rates = <32000000>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@1a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a94000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				assigned-clock-rates = <32000000>;
+				status = "disabled";
+			};
 		};
 
 		sdhc: mmc@7804000 {

-- 
2.34.1

