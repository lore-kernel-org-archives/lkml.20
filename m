Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604745;
	b=wB7kwTHzTyC+y3gYthOR2NDoIlqFj8Oxh9joFcN6WpeEy2UaKdgZm366l9FpVHaeFWxy
	 i6OUKgwu/sn2gGQuzNlSC+t0wDvfPtMcWZ9xA2e3qolZrGA83mA25Eupfq+hljf0vakBd
	 rUn76qxEc1riUF5KLjZpi+LMdHZt2pouchaqdKuwh/AI6xnC7HbKEPBXvWZOEj3CkxDLd
	 sXTjR4v1jKNQtpd2L6jz06L1lFdOGAgYaicvdtqPC/YSvOF95eDcEgeNDtCB0XJR05zg5
	 hnLO2be+ixiy9FMFk1ec6zWHjbjTigVnQOJD4oNh/myaOpThZYZEPHUW4gNFluJvP/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=td8wCtjvvOgkdY5q5Oj/grYDPcEyOg2GuFVcRDBK+gQ=;
	b=Vy9118a5IwOoqh/Z37vATB6P9Gw5pAmlToiQKxrsIwEwTybrcrzkd9Ks6NxhyqOS48ty
	 iLBmYouGDKmb7+CXArziFALkTpTriFk3Xb6UgjkDe7I1v/blRJn32FmQAmq3rjw+O04G8
	 c04qfxMpmyboEBFkFkkJ/j4HVYwRn0g4SsRMd7NgHURa+JGz0hQDwaPs6piRGTBg+mJkH
	 rzks8RjfSPXdGAmB+HS8ASAjitPavdslNoUCRbxoKplDZEebLZFchbc6UY0pMTsvR92Jl
	 gt+XE9b7554rlymhmxsjtXwnSnzRDBlnMawNQcTQ5qFxiy34MgDpVW5HvB//0cV0Skg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4TJtXi2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gB8G4xKL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F14606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F14606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z4TJtXi2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gB8G4xKL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24DEmk2433263
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 07:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	td8wCtjvvOgkdY5q5Oj/grYDPcEyOg2GuFVcRDBK+gQ=; b=Z4TJtXi23fB3mtOk
	EVaMT2OaMZOxoSqT5wwqRZQ9dYwFU7o2BhrqfD7axTCMHk3H/FIpaBXRqwGpDy97
	l7GAJdfLNkjaRrfQdqHqLZxQ5AwQQE+rYsaL7gmYAyrdgWzWhRoh5YJOkoUlypce
	SdOzgMCpvdx2FlTgJB6X7afDxo+act7VhTb8Ko7TzhuuCODd5ywADc16rRcQuvg4
	K9Ogg0D6K0ZpjrY4SNNJ/zwJlNX71PgFD7KLmUB/SZKRrPT00CIaD7l3LbOTuwxo
	i2PArnDaSdU2JlD9lfV8GSNG3CcSwP/64uCJMEe4K6hhnbr35tsfzknEhUiwuNL8
	OPWU+Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka60mam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:32:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eb361b86dcso16297375ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604743; x=1794209543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=td8wCtjvvOgkdY5q5Oj/grYDPcEyOg2GuFVcRDBK+gQ=;
        b=gB8G4xKLZGhnUKud3H7HmtzRUb3nkW+9o0E6RzgmLYRh+FwEfwFD34eifyPiJWbfNb
         ISKBewZpOrPnDCBMorYjCywcYhSLH0Tu+4CZmprt08DgYiP7BPqp2XKu/CU1zxaDVd0e
         Oueh9nSbAUIFHeSrJW4zNQw1+4XBNDj45Ev76FZ9XU4tGap5NRCvHkaXzofL2JluSOIQ
         ujXUCS+4GCFO47lov12qfPZ4PGAfU7K9pfYfYXD88hSTbq4Z8x7AwOytWgnXjpUwzrY+
         g49gJ2nGZIkCO7vtX0XrQt2s38dokn6nbE1bhRTD1gBgb/vYwtg9oxOl7T78LYmAWJlO
         EOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604743; x=1794209543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=td8wCtjvvOgkdY5q5Oj/grYDPcEyOg2GuFVcRDBK+gQ=;
        b=OwN0Hwi0+h5Q2VhiZWKcQpJ6rYUfnI6aSiSpqTbHPx8scLLKkEVaMvYYBz1BWaAA6x
         1BrxxP2leW7jlpkp7qy3TCNZVoOZ8gj78GggTJMEBhgAJFYj+Wt1dkvnfLNcp0CnDGzd
         LhpmkRPkK1PxjbdgB5/IltYcUsyDJe2ptWhjjApRnehwywrUyRIpA72izrSmSsLNaUpK
         q1AM/W2fRO1NVta18Bk+BZjY+7+hPMOjpfghYat+z8kD2Q4CrWRJYN+ZeMPKab2L9rIJ
         Jq0XdYOt1Qpo92qxM3jtg3QCDtxfGxepYIZ+8Y8YfGCMghdgegp1/5Ixc1a6SXNbBCR1
         ldiw==
X-Forwarded-Encrypted: i=1; AKwUvBzu33ayBNcp5xNmVn8Phqfc/VuDB6PwBI+PkgN/2EH2CH5yXLhLsvJfog2h96x5oScrToZNX3Rc+LrqcAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yEtwvYcUJcBSER7w8q0f0xSLfYolO/tWUq6gJX8W2FR2f8B6A
	B6IbnTvS8sd3EHUUSYg9ZiXP4h3Rgz3swsqE+OBigAE9g+mG0hSkVAMcpfEWpp9uv2FpE0fdpww
	rXXSM+5bEAf8/q3KUahVLGU9c8nD29ZNsOD357x/syvvA1XAVVDf85DEUpq9g3G9Cgxs=
X-Gm-Gg: AYBFou06ciPYTjCiFn11tRT/rbqSXGWPTtSYWOY4bbUsaqYtxy2bFYwy9kGq1W0hUtm
	XWtaF8+/tQGnACH5WMCRrwa4MLYqBFk89Ht3pqOCVtRQYlk8Rmq1OrD/HyKIy4FRLtkzmexiMEl
	l1iv7W9oZOx9VKdSW4SvbhuHg5XdNSgVxboTswmv/q9WmnLGqK8a4Oe/xUcrsehVbxPuTfaF+59
	T1fZFUHX10hSKFUK+uNZm8+JCFZ9Jv7R4M9k1bXVIUUT5ASLBPgycwMQ58UitNsfbhUOL2cT1U/
	zTutOjxFI9cpnaV1A1n/I2mB7qtCVNvTUH/n3IXmrToa1ibYlpqZzjSYqIACmM9HHqDXszm7DBi
	Ql/P82aOsVROA0Zrxsb/ivm21IRLcSO5fTamm6O1w7DXKnAIKoLvwzq37d/0wdIoRSPSQByu00o
	aCRt/e
X-Received: by 2002:a17:903:244a:b0:2e9:3dd2:a90c with SMTP id d9443c01a7336-2eb3648bec8mr81415235ad.20.1793604742420;
        Sun, 01 Nov 2026 23:32:22 -0800 (PST)
X-Received: by 2002:a17:903:244a:b0:2e9:3dd2:a90c with SMTP id d9443c01a7336-2eb3648bec8mr81414975ad.20.1793604741881;
        Sun, 01 Nov 2026 23:32:21 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:21 -0800 (PST)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:01:36 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
 LVDS panel overlay
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
Message-Id: <20261102-lyra-display-upstream-post-v3-6-7f660c3b622c@oss.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
In-Reply-To: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=5139;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ojiixm+Z7rL0jjhgkBVveTdyOydUNY4gQTixdiaiP3E=;
 b=Aix2nNQPOfy5ZeYn/EPBMR3K1vG0fC04lVEjLh5xv3AZ6891yFNM6j19Jj03hUY8JsznbDdLi
 oA9xEtsBL1FAGox1SKBORvO7M/9s0g14txBmfOw5DNwh8HIAx0297BY
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: wPVDW1tAo50_4nXBlc_bgC9Wu0eH5O5c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX4J7wZg0rInoH
 ts/vmvVMUCH1uQACO2kJ4PDEDPPEOSaczTW25KTdtDB1KsdaKI9ug0MAoB9z+zxejyfF8TfZW7a
 90WNlUP9cCe+idIHo+0L5FtqpO+mVEU=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae83c87 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IIR7FofeaqIF4eDoK2QA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX/Q7wn8pVYeIY
 9hav5RNO/NS7l8op0w/VZxnjoqKmIvNS442pFIwk2+79ganEnJKFeFcGSpvndtKkqzMH73/J7Jo
 vd2VLJQ15iO+bnEpUtJw+MGTRMNQcoF3uPLiBYCwnJvPRH9sdrDD+8/TnE86dKwD95WKEahtb3D
 wPBNkUyWHvuFAQd+SqtVlTIyezR5Y479KZ9J5gksqGvgIN+w2FOsO0kyWzZJ3U/TDPywdSusbHK
 J7p9w48KbbWH2qHSVtRB4ijgHZLWNPhxvsP0o5TLgB5p5pWq4BdM9MNINnuZ+UnhVGhlI6YbNB6
 HL7dtnDKY+Qfm/tyVXZzh4c93zAhFf8EbO38RpjQlAmNXWiM7Sb3NzXwwHH4vRmhg8ozfxQo40b
 s7bRgONeRYDfMmqHLmapdB292TFG0BpXIn2knAV1ixbSzLUuFbAvYSK/tVb57L39kyET+KaKDe0
 URNqtl6bclyZS5BswvA==
X-Proofpoint-GUID: wPVDW1tAo50_4nXBlc_bgC9Wu0eH5O5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020029

Add a DT overlay for Qualcomm Talos Lyra EVK, to enable LVDS interface
when LVDS daughter card is connected to DSI0_B2B on carrier card.

There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C5 with reset and interrupt connected to
GPIO61 and GPIO60. Backlight is driven by a generic clock-based PWM
using GCC_GP3 on TLMM GPIO59, with an additional backlight enable
GPIO on TLMM GPIO2.

Disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        |   1 +
 3 files changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b6a61339914d..012dee96f700 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -468,6 +468,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
+talos-lyra-evk-lvds-auo,g133han01-dtbs := \
+	talos-lyra-evk.dtb talos-lyra-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-lvds-auo,g133han01.dtbo
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..8c592e6317c3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-gcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	bklt_pwm: pwm {
+		compatible = "clk-pwm";
+		#pwm-cells = <2>;
+		assigned-clock-parents = <&rpmhcc RPMH_CXO_CLK>;
+		assigned-clocks = <&gcc GCC_GP3_CLK_SRC>;
+		clocks = <&gcc GCC_GP3_CLK>;
+		pinctrl-0 = <&bklt_pwm_default>;
+		pinctrl-names = "default";
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&bklt_pwm 0 100000>;
+		power-supply = <&vreg_disp_3p3>;
+		enable-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <128>;
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_disp_3p3>;
+		backlight = <&backlight>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* LVDS Channel A - odd pixels */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS Channel B - even pixels */
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				lvds_panel_out_b: endpoint {
+					remote-endpoint = <&sn65dsi84_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_s4a>;
+
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sn65dsi84_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				sn65dsi84_out_a: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&lvds_panel_out_a>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				sn65dsi84_out_b: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&lvds_panel_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&tlmm {
+	bklt_pwm_default: bklt-pwm-default-state {
+		pins = "gpio59";
+		function = "gcc_gp";
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+	data-lanes = <0 1 2 3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index 6a13f04a9055..69da5727df4d 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -14,6 +14,7 @@ / {
 
 	aliases {
 		i2c2 = &i2c2;
+		i2c5 = &i2c5;
 	};
 
 	dp0-connector {

-- 
2.55.0

