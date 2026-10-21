Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592558;
	b=ELDwMESCA9Yx8DobOBL1fFomqtMc8PWQxXoB4f99PCCV9A4XHCtJc4HMI21PVnRzDADa
	 SjMel3ByYIIlRLxnhll4uLX43jpv+RFdAsTfwMBOJaS+iU63B8VQ419fH1J0s53btgolf
	 LZaxlaZQqQHuJ8coEmMWXEhcZlofCnye5WF/Rr6Mncmsi7k7cJcL7J5RQghDrILTN8EK4
	 ol9jWB7yHZBs3KZE85RknEQPsRisolzXqnDG/R+2ytC5kJ8Wq6dVdUyDCA6lyvczVtCh/
	 MDy2pqz+cmcoEbhYoWOFxdEGwOiyGgdFvPolXmCcEEL4Os0p3gQwNQ6NBkkLRq3S/cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=;
	b=ougqKW/6X6Vpej6orMJ8+8I/rhS2MhpCj3B3NmpwFeSFemX6SlhNbOcxg0CPRRWKliGC
	 UN/srr4loV7WCyzwsC0EJNkMmuDq9FfYOdLhJaAyUuPZDL3oDfRsoWZZa2CQkPDC3SS6L
	 ZrTmb59JhB9X3PkNg6ZoogyWO0BUYowsj8tMwBY6UJD1AnXG2OZzkpYK3066yTNQzmAVU
	 QkxZFX912V9oAjiN5H3LmaWdXK3Z70MxyOm8YImBpobjG0UW8u3p43GPvUaz77qUlADaL
	 barNpJE/KE6da2tRa8WUWdHlKtB9h5R94gqWh5RVb05JNHqeJLw83qzo1gXQjs6y0sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSUC5IQ2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="U/KaGafu";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5094606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5094606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSUC5IQ2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U/KaGafu
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFDqG516117
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=; b=lSUC5IQ2YWyvtHIT
	YVR47W/kO13pl5c7HMug+QaPEmjZPBsqjoO7eEl7mq+QBdURRHpGljlE6ShDKSGE
	HPqnjJ/4qSZwFO8f+JR9eSYG2bPPjSMfrUXLVEWlw8nWfgu1nzFZ2i5H3bsFXFzd
	AlA4MEKQg/dUuR3dQEOS/GfKtyG4hTFpMK5588sJtPgHa1Hb7D+h1SVgmcE+e58F
	RU7xQ9AEtSEcL/0ityWBSOR6v2m7nJhqFnd4zgZpw3U2U5efOjaXp7R7wSRUsLk2
	BphhloqLznPNTx0DvdsUv7H5Fk81J9r4oUBusNPEXnWMCxuk2R5NSmcWrgDYgE2+
	9fhXXw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vr8f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36660d874a1so85395eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592555; x=1793197355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=;
        b=U/KaGafuj4foA5WyC7Jc/ZA6KZoZQ7Q2pZXJhMmtulMqMyGYr/WrBnyqoH5E39bQ2Z
         YBvqoh7Wdph8kaHDTEtKopa4uW9HdEt/GRkeQdwp8AOovF5vMCMoJfVOjiOI7rSlB+Mh
         603CsPgDGYYhtgUKIG/QbjL2CaHkfpy5q5nAhgZwUj/FYcqA8Zo9iixfZ+WWupAI8oX+
         Jr7nKM5PNRq7ALcsiDSoRxKIJlf6uatxQtY7jmlr9JHNM7edMDxUghs7VjmhemokXTsZ
         35BpejADss7ABOi8XREdIJbwTF39BMjAZ6Sp4oyFlRDxnuM6I9blVlne8muWEVvRBgeS
         tRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592555; x=1793197355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=;
        b=IPWzo1/t/bT4uvs2kHrmbtbpHCNH/Nky8dhF1I/kMyzJA2meZmESZUT4hK87yHaIyS
         8luFHUH1Eb+3IZZC2w9KzkvRTdGyPzSl+OOk/G8bXCYvpx/5YVVorV33ynEgiWN2Lxbj
         T5MGJK8aKX2tGxCHTQKHHNEfFhWnEYBPqKto94TpCGNufQtD5hzJ3kr+KUHA6NtbPPZI
         TW/lS3zOG7QGmna9CdZ8Cjcsb1eV4XceADm6rCpC86gSCO3lsA0OjlBi1BdJst8HRsVF
         hDK918xO310XPDaxp20OhMtxg007/Q6ifW1HjdOhBmpspz6i2qXJIfzGaAhYXHle7eCX
         wLEA==
X-Forwarded-Encrypted: i=1; AKwUvBzQTcGS4vC6hVZGt6vkzhkCz8vahUDFc0eMWDQaW+p5mc3y1mxuNMmURvrNMue4gBOlx8mHSxlqz4ORixk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB8Vr4wBOgjqQ0saHtC7AhtVuGK52zyKrnEx9vAfbkqDIOa6dg
	feNFNEDmlVMoq1uU3PQQu6QH3TNCGY9ieSBphTR9u1f95CJw1nU8IDTaw+fiLqTHHI0ZQx/f7Br
	9nFBwvD19BOhodWarAr6jFkfb5KulwXKYi7RVNOUF3b3dNKrAXtx70hZtLo3+GKhMXMo=
X-Gm-Gg: AYBFou2+OeZVqjp5poOvt1SZgCDYw2gbgzSeE7EMdtoGoDnBzvk49umPbeNPEYoZP29
	EO3tJ1X5erPcjZslZbdj+5HNX6FbH1mV41nluYWydX4h+ao6X+Q2/9HGGnBoZdHn7jG3GJfTBGc
	HBoveYyORD6AkRJRXMVCF9Dcgl201y5ScF73qBidySKcn+T/0PKmC1XLSwm3w01Iw50AHuWmfye
	nW2NSeTmmmN6gtUd0we8Ll1Ep05UvYFyIm32RvkSrVYAwmma2Kd1lNRaWLsX/GMTAYHXK6tukaz
	hUcEI1XoREyrx8uBeY/fim6PYfNtK3a30uoVRCtszUEXnobkiaYHHyoMmSGnXEZKZG+yZSs5hNk
	+GVGhNqJz7FKIWuUFGqnN43txcbVY0dZ1DKrCrmywH6ObrXq/acBkb3hoAQIRpPn7Xq0DBiuV0i
	HJyJ8BrD2EF7cI0TNfw68Spq5weIBRZIQoVwee9VkkPTAkhhpDZfo=
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id 5a478bee46e88-3674c43a7dfmr5185391eec.2.1792592554348;
        Wed, 21 Oct 2026 07:22:34 -0700 (PDT)
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id 5a478bee46e88-3674c43a7dfmr5185334eec.2.1792592553669;
        Wed, 21 Oct 2026 07:22:33 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:32 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:46 +0530
Subject: [PATCH 3/7] arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01
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
Message-Id: <20261021-shikra_display_overlays-v1-3-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
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
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=4686;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=3QYmG8M/g7dpE66TWx0XSm8iu75RDCnzid41xacPU4s=;
 b=H3V/NOZ0N8Lj6BAB5JnGYIlkC5Wu4KDFgF744Z5TfTNoS0XYZi1tgn35KnMw8WlLb/uzo8h+8
 t331C5SfVmTC6r6LFlKRWf11kUNa2U6heea1agf6eDC40U7nacEqGz3
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: 0BrY5pCRfNnqvnrq1DtrhViY8BRrKPIJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXzYYebHbQ8qFk
 6LSVrn8rYgMbF81tQFg4WRKy7g+WvrCcDBhP61QTCfwj2ZBO1wfKuOYFPCsVMiOayiRpusgy0Vs
 +PLBlVtxV2pXyXHXpwkIifKxL3KNgcs=
X-Proofpoint-GUID: 0BrY5pCRfNnqvnrq1DtrhViY8BRrKPIJ
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8caac cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZKKiMLYMdhZ7-3cI3QcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX4ksa/n4knBNb
 4jXRc0m/23d4QG+i2UMDmmwA7Ctuftu8OnPVbJfx0EHb9nY0mMdYdRU+ZpvZMVgNhDgQnQcflNv
 IeE3wmOoVwEXkhHfUoZgr6ybGLq4vx6F5oQwi9SS8UkVx5kin9AXOShnEKoRQQM6T95/sMcQ/CY
 9ClkIVAq2c5wXPay2cuG8Pm4Hq7Fk5aW3qhQefj+DTbws+S+OvNel5OYCMSnsW0dPMHNY9Yy4DD
 pvgaCapQlPiRVM0+ae1QmuBFLTYuNuQKJGh7NZjRs7VOXllKk3njxsc0tV4/chpfgKTqQhZfdgC
 TOLHHQ0Bn5yk7r8J90MKXawy5Vh1KB3+YyBIPc1cTwpNNG7eEW91PuWnrXPyMm7ldNzl1e9L5IP
 HZECd53jhh/HDFnwifTXJ9wyXTL8T7QQ4dEI0MdlPW0GEm+P/jUf8qA8Y655s1AtEIqdyBJltqz
 nCpUPuoCNLAdYB9yjpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>

Add a DT overlay for IQS, to enable LVDS interface when LVDS daughter card
is connected to PDISP1 DSI0 on carrier card.
There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C3 with reset and interrupt connected to tlmm GPIO76
and GPIO85.
Backlight is connected to gpio87 with pdm_pwm functionality. Currently this
is not supported in linux-next yet, so pull the gpio high.
Enable support for AUO G133HAN01 LVDS panel connected to this daughter card
and disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso    | 127 +++++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0c5a7b7f694b..610fe640471b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -381,10 +381,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
+shikra-iqs-evk-lvds-auo,g133han01-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..80b9dcc92061
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
+		default-on;
+		pinctrl-0 = <&backlight_pwm>;
+		pinctrl-names = "default";
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_lvds_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
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
+
+	vreg_bridge_1p8: regulator-bridge-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bridge_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vreg_lvds_3p3: regulator-lvds-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_lvds_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_bridge_1p8>;
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
+					remote-endpoint = <&lvds_panel_out_a>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				sn65dsi84_out_b: endpoint {
+					remote-endpoint = <&lvds_panel_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+};
+
+&tlmm {
+	backlight_pwm: backlight-pwm-state {
+		pins = "gpio87";
+		function = "gpio";
+		bias-pull-up;
+	};
+};

-- 
2.34.1

