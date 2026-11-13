Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569364;
	b=cHowSfr482qD4pqPAV1dZhHXkrd6AJpCXEolXREA1OUIPXQwxkc8d9dIHorWKhal+69u
	 FSQNid9L7pTCHzpPndK57GMpMgd0MJ2dZizcxDn93lWhwsgJ3MAbIIDzi/RxlRHhEBbIl
	 klzTvmqtth8F8YC9WT4yFoTzlpjgS5MraBebqXrgLKTc5I7pKGN3SrTkOSC66Ee71PGYd
	 quWwud4R6hkxCIQvkxkLDQKMpw3F5F0olABybYzwwv8eiFUHoQ6XO8mGPllCT201XO8+Y
	 k6ZQY38gnWjr/W03VKkfi9Tw9MnAS0bBBiV7BZikmctRfg5r+tt2tXwbjkKHJL/zv/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RCvpv5YaqF+Npl1mrskG5QZPIJE1GQ7WlRgyrH6kqiI=;
	b=4EhimLlFnkwNPeBApUm1BUHPTziZr0uo4gQXfXGTKDwrZkvozsnKvjCipJAZRXQWzwr+
	 F6owdjGJQhuMzVdow9rsGxV82FKcDD5S+CH1LXpXSkGepZ5uCkB9cInMpKq469SLG7Dph
	 PMziyYjZ+6CwWagrXbU0uKR9HjqM/F+x3aVFz6X0oas2Hzpa+E+wCs4mKVB2CNai8MWCj
	 HpLt/bJH6BX4rjZhnK6h7yRcHCVfSgibxuXLRlaW/d2cvzazanPnBD5xfjy7NNxjl9PTC
	 2GQwUkxVsUroTGtOn+1uv2IGffelOQS+5dwvQK+tkWvAVcMLUqxZLNEyuI0FuJe36+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C6M8kISj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MksEs1ti;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF9760A2620
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF9760A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C6M8kISj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MksEs1ti
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADA4xu21161438
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RCvpv5YaqF+Npl1mrskG5QZPIJE1GQ7WlRgyrH6kqiI=; b=C6M8kISjQwkAlogk
	cddclH4ieplwa0EkoS24t2Ve1sKNXJMPjQIUStuLHSxUprKxVzHyXpB+Mwl9FDDi
	PbgPXlQxacs3RHd37Oj+HSGTl4nzEI5uwERlhXPwy9WvI0ndQstw6CotQbHDvi42
	SW2kZphiWcFZ4nsDg5TO0kyev21kTOeYcpaNIXuTOyFT7f9A2mpMyQ+/4JrM/jNI
	Q4eZYDukIbNmeaPnGhIs86NUBhuLDdFlhKEtUOhT5+VWKntY0S66dhG5txzuA9Wn
	ImYM3mZoy6DTROaAY3YDACYQPsqaWP/J3kbPFWh7u5s5Duzn64ekBdtLUWzkII3o
	IeUxKg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g207vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:29:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1074306eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794569362; x=1795174162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCvpv5YaqF+Npl1mrskG5QZPIJE1GQ7WlRgyrH6kqiI=;
        b=MksEs1tiEAXQ2x2xjEYUyawvK4J5IyK9C7V/GOiJX2sM4YYyuAD5hqEZqvXkDXPitl
         djRrTePX3QLYCmsTZjf6zkzBF6FBJDM4uSRjkKQmbu9atzY7M5+8gedNeYQvIQW4juoE
         N5qtD1wR5lbwuqQnTQP+zJJMtVlEmd9pItvq7Um+4CuBben3x0nToq+Ibc4KMMqDqRkj
         MLdtxXmgOA7rz21VqStAp1EngJZUwyBxN+wOTA+0lwB4rfFTQ5l67zWL/9r8nZxFCPL4
         bAfIZjLFi6TiZFQI6OTzgWs9RQG50ew/tEClQ8/AudgHq8LEf21YWtDTAKIvWCuBE2CR
         KKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569362; x=1795174162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCvpv5YaqF+Npl1mrskG5QZPIJE1GQ7WlRgyrH6kqiI=;
        b=vgs1gX0tcuKIFUGbAI70DZhGoLkilWJ9WNulhQ3p5wHoyJkHKNDo5+ib/xrdDoVFPb
         NDCUiD05x3x6vvD1NLvQHHMnggDfd5HMybfv29Ttap4Fx2b+4ejCEM6ApMUhP2tBAtzj
         UoPkCYXpxRNqyojg2SYl4HFEkNCKRnbtS6idYfYoXSbbKQr2SnelrERo+QJlOsiMtInx
         sUHdytzz9N0X6bnPMFCi3Mv3bwjsJF/3ja0axdLQrCK9B8IUXMOcfrYvvbBDbl+qcHgo
         +PoHbZeyG67HPLwj66GT041vKB2u1HLwqVSULs6rfN6iLjKZo1lMwztzjauJxIWvUINg
         Je2w==
X-Forwarded-Encrypted: i=1; AL+hErGjXB647kgkKyzaD2Me2zYXlyNEWlkr+wjrQbLakd3YdZEAnR8WHm0jRINU7xpGI6aaGmvOjEupZPmhbdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8esL4RGcu9sePOMq6qV4iXBCyJdAcBUSfb5KnytMOQDsJxhGoc
	2JMgm98OXd3ZuUyO+Qzmgtd4c0Q1HPCD0Yl/IPOFlSRv5CvdSMfwLPNYphBPjoSJcZ4R6UBNOES
	R2+tJHyPwPWqrubAny3M1bc5Yipp0e4Ih7aFHF4tLJxJuW78KSZicgVdiJled6UIksnw=
X-Gm-Gg: AYBFou1SzxIoF0WQhZxwxY/vJYk2zJGfMRJSHJ59DUNdKta6sw1hQeDuczmunfVV8xx
	Nv39X5z4pNTa5Hb5nEgqDdCXYXKR2uaUgteyq7/6Y6qxkX9waTkIfvUPJPogl4OAxGXdR1gYBTj
	VC3JnyzN3Ls9oLS758RvuOALaBVsra/8jp/UN8MRSwd6jNlEb4g9LFPBTfZQvn6uhTr49tx6ycr
	PTGNnAptu/xHQiD/N1ermQegCMkAB78InR4Cq0Zjo6d1D4e9LdaZeEswYHoTjKgNq0TRWsABDgv
	FQjvTQ4x1qdsSfTQVMASBFF59QdkyLLHcvxZKbOIziiucYN5cbpaDKa4i/YY3ALpYHtPox01DIZ
	bpskz5HlqVDdke1g/6NEfoN32CJn3TXYb5EyImkzfzWlTS4ByQ6ThjWFPMkc65xqFsCkDFQ06WE
	Ock7t61qIY2g==
X-Received: by 2002:a05:693c:831c:b0:376:c352:2fcb with SMTP id 5a478bee46e88-37966e3ad42mr1803213eec.9.1794569362137;
        Fri, 13 Nov 2026 03:29:22 -0800 (PST)
X-Received: by 2002:a05:693c:831c:b0:376:c352:2fcb with SMTP id 5a478bee46e88-37966e3ad42mr1803180eec.9.1794569361459;
        Fri, 13 Nov 2026 03:29:21 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm7342924eec.2.2026.11.13.03.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:29:21 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:58:59 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board
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
Message-Id: <20261113-lemans-draco-final-changes-bringup-v2-3-3ae8cd1c9932@oss.qualcomm.com>
References: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
In-Reply-To: <20261113-lemans-draco-final-changes-bringup-v2-0-3ae8cd1c9932@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794569340; l=12774;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=7y64cdEYKQy2mYPSHOH50YFpiSFiyNQPbYBPGJRn9/8=;
 b=krmWmHHoL6I0b02BrMHeh+bYf/Au56wN8ztIuLVfhen+G8dm48qfaDQ9Rez+8imSniHHVY3G5
 Browzrn26SfCasRj3K2cVWXrl2VhemKLu+ABJihWs0zpqEZvNzMPk62
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfX76Kb06QHGxbB
 161BELt13G/rOuwGlNQ5HpudZ8jINbVhpiE6Ce8NvFYjDh4ropHv2hcdG7Xg6ITlPEDtoyuuewM
 jmeAV4RzylCnIBIF/Xer1p8T7+cExDnDY0Q7kgA2oCfw3p3DSBrN4W/OrBQ+PyrjSWA54b9FWHD
 MCAr737ZICUwyYvLcbGd8NCmtqP0YgFr1fmwwziVzExPZ9bUGv0JAJCAfT79/x7vznbx7zyceex
 v+ISD4dRCa46Dvxj0fY1XKFy0ZodeY/xvbvC4qM7DJqtqHObigvetjpKQ291bZlT/nd4AoQixBz
 ZR3Ao06G3Z5Ltb2v6VmGOtLns2+vo/ycF9jnrO17obuorYjhUBEK/ZXqcgGeiFPRYJRsHVx1FsE
 EQdZgcoB94gaf49OIAWbq7WQ5ul0WlLySUt8fIzo9U3WYBp8Narpv1WSpWARTg2nxEmofcrRLLf
 u+gNBHq1gAjwg0Xm8Iw==
X-Proofpoint-ORIG-GUID: 2ri0TIAE3h1OGvAtBTSRxswkd-3OcSvk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0NSBTYWx0ZWRfX4qTbCKskFVqc
 xF5Wyqj5pP1x6LYRpn9XIwzviurji6SiVwawIxSocna+Gq2choM3UmFXmsvqoFhwxRXSnKYecOd
 /1ekGY/XvYHAY2tyPu+di897e+/tSBU=
X-Proofpoint-GUID: 2ri0TIAE3h1OGvAtBTSRxswkd-3OcSvk
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af6f493 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=56b0w_5mWSKF6VX4WC4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130045

Add the device tree for the LeMans Draco EVK platform which combines
the LeMans Draco EVK SoM and Draco carrier board.

This device tree adds board-specific peripheral configuration on top
of the SoM, including:

- I2C GPIO expanders (TCA6416/PCA9534) on i2c2 and i2c18
- EEPROM with MAC address nvmem layout on i2c18
- Native DisplayPort output (DP0-DP3)
- Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
- ST33HTPM TPM over SPI16
- AMC6821 fan controller on i2c4

Co-developed-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Co-developed-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
Signed-off-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
Co-developed-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
Signed-off-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   5 +
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 543 ++++++++++++++++++++++++++
 2 files changed, 548 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4e714251d5e6..f1713d53af5f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -50,6 +50,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk.dtb
+
+lemans-draco-evk-el2-dtbs := lemans-draco-evk.dtb lemans-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-draco-evk-el2.dtb
 
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
 lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
new file mode 100644
index 000000000000..6dfbc8e2d8ff
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
@@ -0,0 +1,543 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include "lemans-draco-som.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Lemans Draco EVK";
+	compatible = "qcom,lemans-draco-evk", "qcom,lemans-draco-som",
+		     "qcom,qcs9100", "qcom,sa8775p";
+	chassis-type = "embedded";
+
+	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ethernet1;
+	};
+
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		dp-pwr-supply = <&vreg_dp0_pwr>;
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp0_out>;
+			};
+		};
+	};
+
+	dp1-connector {
+		compatible = "dp-connector";
+		label = "DP1";
+		type = "full-size";
+
+		dp-pwr-supply = <&vreg_dp1_pwr>;
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&mdss0_dp1_out>;
+			};
+		};
+	};
+
+	dp2-connector {
+		compatible = "dp-connector";
+		label = "DP2";
+		type = "full-size";
+
+		dp-pwr-supply = <&vreg_dp2_pwr>;
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp0_out>;
+			};
+		};
+	};
+
+	dp3-connector {
+		compatible = "dp-connector";
+		label = "DP3";
+		type = "full-size";
+
+		dp-pwr-supply = <&vreg_dp3_pwr>;
+
+		port {
+			dp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp1_out>;
+			};
+		};
+	};
+
+	vreg_dp0_pwr: regulator-dp0-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_DP0_PWR_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&expander1 7 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_dp1_pwr: regulator-dp1-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_DP1_PWR_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&expander1 8 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_dp2_pwr: regulator-dp2-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_DP2_PWR_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&expander1 9 GPIO_ACTIVE_HIGH>;
+	};
+
+	vreg_dp3_pwr: regulator-dp3-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_DP3_PWR_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&expander1 10 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&ethernet0 {
+	phy-handle = <&hsgmii_phy0>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	nvmem-cells = <&mac_addr0>;
+	nvmem-cell-names = "mac-address";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: ethernet-phy@1c {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x1c>;
+			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&ethernet1 {
+	phy-handle = <&hsgmii_phy1>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet1_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+
+	nvmem-cells = <&mac_addr1>;
+	nvmem-cell-names = "mac-address";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy1: ethernet-phy@1c {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x1c>;
+			reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup1: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup1: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "ti,tca6416";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@22 {
+		compatible = "ti,tca6416";
+		reg = <0x22>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@23 {
+		compatible = "ti,tca6416";
+		reg = <0x23>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander4: gpio@38 {
+		compatible = "nxp,pca9534";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	fan_controller: fan@1a {
+		compatible = "ti,amc6821";
+		reg = <0x1a>;
+		#pwm-cells = <2>;
+
+		fan {
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
+	};
+};
+
+&i2c18 {
+	status = "okay";
+
+	expander5: gpio@3c {
+		compatible = "nxp,pca9534";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	eeprom@50 {
+		compatible = "giantec,gt24c256c", "atmel,24c256";
+		reg = <0x50>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			mac_addr0: mac-addr@0 {
+				reg = <0x0 0x6>;
+			};
+
+			mac_addr1: mac-addr@6 {
+				reg = <0x6 0x6>;
+			};
+		};
+	};
+};
+
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	pinctrl-0 = <&dp0_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss0_dp0_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&mdss0_dp1 {
+	pinctrl-0 = <&dp1_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss0_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&dp1_connector_in>;
+};
+
+&mdss0_dp1_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&mdss1 {
+	status = "okay";
+};
+
+&mdss1_dp0 {
+	pinctrl-0 = <&dp2_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss1_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&dp2_connector_in>;
+};
+
+&mdss1_dp0_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&mdss1_dp1 {
+	pinctrl-0 = <&dp3_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss1_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&dp3_connector_in>;
+};
+
+&mdss1_dp1_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&qup_i2c4_default {
+	drive-strength = <6>;
+	bias-pull-up;
+};
+
+&serdes0 {
+	phy-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&serdes1 {
+	phy-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&spi16 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&tlmm {
+
+	dp2_hot_plug_det: dp2-hot-plug-det-state {
+		pins = "gpio104";
+		function = "edp2_hot";
+		bias-disable;
+	};
+
+	dp3_hot_plug_det: dp3-hot-plug-det-state {
+		pins = "gpio103";
+		function = "edp3_hot";
+		bias-disable;
+	};
+
+	ethernet0_default: ethernet0-default-state {
+		ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	ethernet1_default: ethernet1-default-state {
+		ethernet1-mdc-pins {
+			pins = "gpio20";
+			function = "emac1_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet1-mdio-pins {
+			pins = "gpio21";
+			function = "emac1_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+};

-- 
2.43.0

