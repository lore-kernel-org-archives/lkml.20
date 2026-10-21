Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595877;
	b=ZhRb8iRdHp3Dsi7ynlSk9ghEsQT/EUZHT2mZDXxyxk8bxhlmemw58GO8bqFNhoymalbH
	 dH9FJkD90s1RAp/bMUC4dxc0DKPEkG7hTeDPHQeFMSnO7KC/N4ZXYsqUEuxL9q8kJeU2p
	 5ObKhAp8o6SwJSzUht6C1/q405a6PFtiNyAD4WR9sNkllRe5MSlXOuZIXVSt9wuIf3P4k
	 QvbYZdXPa2i7DHIINTQc6oV+Kr5wji01w+l9Fe51TTT6uHeqIFepxf097GxSLjxftS482
	 Oz3qIwY9lD8wsK8W+yC/iNAOT9vrbVAF7v1jlaOG70FzaIT9rHmu0e3CcDdFgI6NOsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M7giEH12KEq5TYG1CwffV+pNP+0+B1pDDeisStQqBfI=;
	b=hsmJ6ZaUk4TH9KnYrMOOyNUrNVc9Yoy4kCAq9HhzHh8gM8r8GYpnYR2GKIDoccexrhhn
	 2+6nIPgoumgBO2Ad1NrPUXCF4gkGCJSb3L/R6akyH8izVpGrwv6Lb2hZ5YoXkDwEnusJw
	 FdDRGCDMGNIGb02l/6y1sUrnwyYf7we00Q2ZNALg4bhc08D8USag4j29kSNiXejDtaIRM
	 Z0qrn812j8Cq1WqGYPYYuTK423RCWN9kvNlaPHOQGnC+upBKeDVdk8BDBBkMcL05G+7dX
	 1skXsNNUprk9v+VrscfhalqrU7F8rQxAfevtGROusimMFXh7mJ/yauH4yWBpuQAxrGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pCFuecFO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcOxtmX6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B7B60A2603
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B7B60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pCFuecFO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcOxtmX6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF6n8823481
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7giEH12KEq5TYG1CwffV+pNP+0+B1pDDeisStQqBfI=; b=pCFuecFOB6cOvb0l
	vSC7Wk/vuvDYPbCiEMk8Z76nj441539lls1RhJcSc/TpLciS9tD/CoFf1wVks/A/
	UHgQ81Hjmhbe9KZQGWQPhBxZwMhCMC4QIuz8RRCwimalJK/tnSfMD9/BkH4v1cNI
	62zTr53kZLZbo5YkN6aksevEeowdaxnLjDoYV1h76BlE3Q2Q/U+H3HS+w8LiRXza
	VNzAab6oTjLCfj+7GPLtE6wUDV2GCD9I4Med+3MIwZRtbeOadvyDegRJ8AEn1W2w
	Gr8Wczky2jTp6M6Yk/TxMCzDg68ILfP6nQkVXhcOpT2h5dkMsmJu8dvR05OrijbB
	I28Tgw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r3qpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:17:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso1332509eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595873; x=1793200673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7giEH12KEq5TYG1CwffV+pNP+0+B1pDDeisStQqBfI=;
        b=CcOxtmX6tFNAs+ItudzXG0l0k9R12aWdmtXpN41c9XRZ7EHVJXugynr6DU5uQress7
         9xj0+sPOgMsmN8oDChkl6H81olPdEqdL2tQNuQlt0zKQeyWaMOv/aObbSKG34FOAwnc6
         KpZFh1avpyXq8cD5QHEyNwdfVgrjiCfr8zb9e/C5BH2dEus1u7wHINyDP0XPg+h0d1Sn
         m7dTdGZYv+nAANy+ERYSNBP9tgjHM2PIIsGI7xIc/8i3zXeQl/Oj2YIA8CBXxLYp0vX2
         p7CCTAa0aEBGPKGzyb1rjrg6okDEjOr/gBSJ61dQwT847YDcE49TAeJUrQYzz0q4ns+g
         v7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595873; x=1793200673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7giEH12KEq5TYG1CwffV+pNP+0+B1pDDeisStQqBfI=;
        b=kLySihkK2fdlG82SKG9ktBvyjaAMH9VtzsOQtvaxrRyHTGfCw9OLXJ8MxpsxLXshn9
         3ubBnLe76vh6VHJiF3dBL8RAfQcFG/VGyD2Y/XTPqthL6g6PMK/XiOCvTQpdAEeW+aMh
         2jLcZM7BufSP+WxI7K1fLdXpp5dO6zEsqSyOHlu0I362KM2tD2RXbhUrWFyQWsit7Djy
         QfJlCAzRb8fi9cBRwhhWLD54sQL1tdmMnhyOAI7B8mD3IJ7BS5c0/fZTcA+rMuAX8F1z
         nh705c/hS+nAqpmzEkbexbAetS/1aGsEPFTV9f+7FrtAnm0H8B9UaHWYLqkN5qszMkNQ
         pfHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn8/Vo4VQVPzmW6ztEJjDQ48kS4lqPUmo/a1+zwbvGOyo4dBlAa3DpWjYvAbwGxj+xOAZndY/MbGdv6kE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKro8rYlGJaMzzfOWli9UChsHLLsoKeCR46Uq9i31AhnJ+mfTiJ
	fMfVIU89+NeNekj70daSk22oerYCAyC/OAQVCqM8woI05AJlC8eItTV1IXWQG+NHUrSuKtQAuEt
	5t7ww3q0cfEEHPzS4BD1roRapC0cdcv8TwOLqDezZKabOH/NoO/SZTQ450fzABEYMOwUcPGpXfT
	w=
X-Gm-Gg: AYBFou2ZSM8PyqDI4U7Bzu/nWKYwiRLphRj426LhvmmvL+PVmUpyP2ShtcecNmRLbEs
	UV+Tm0opjACTjtsxG/yGWU4Yb9MGGb6xht5w4l0C+X3jgrIzdTf/TCfxjbjNfol6tDG9yLPcOEy
	4Z48Anh0TNnPRog8TS33zUrJOSZ1TXGr42GuhR2Pi008lUtUhYFYOeG88gHDZ8Pu4hCFtoQ1cFp
	/+GtVHnbD99LmERZBL6J20/le9C7UlkrDQoZtR+qS6QIT8oLVw53Dhv1/wAryy87yCH77EqTRS2
	uSnzH3DLDqsroOg8Oc31KZkivlGyyfBZP4jwruTwfpWhx5Oxr4vYaHcH8v+6LasKI6r1C1tfKw8
	24T29SQKnDCE+Ol4dvUu1TXrnCoUB+fbV
X-Received: by 2002:a05:7301:6196:10b0:353:812a:f43b with SMTP id 5a478bee46e88-3674e164be7mr3408077eec.26.1792595873281;
        Wed, 21 Oct 2026 08:17:53 -0700 (PDT)
X-Received: by 2002:a05:7301:6196:10b0:353:812a:f43b with SMTP id 5a478bee46e88-3674e164be7mr3408050eec.26.1792595872699;
        Wed, 21 Oct 2026 08:17:52 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:52 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:27 +0530
Subject: [PATCH 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI
 panel overlay
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
Message-Id: <20261021-lyra-display-upstream-post-v1-3-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
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
        venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3917;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=gVQnglIBFyedTy+udwBpJ0Mhk/a9EY72RG42+aLXzgE=;
 b=+mKOq/xx1XOGyXNqxB0Bn5SlGA57RW67VnCvMltqD36O4+79V0TXGGskXbv7gPaLjv9K44uWx
 xYBlnHGAHG8BbpWbCS66UWanwVDAFvT+sfW/pAy/M18ikkQ+Iq+kM5i
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8d7a2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ebtc9FoxabyLX6FnRrwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Kt-TkdnWP0SbjITbmHvDX7y7T17y6ZTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX8U0ClZURUuM7
 2ZUCZU0AOr89yHFrx7TRrwrMt3vfywQcHFTkWHli2Vq7RE0b4enD8qK9zrgZF2U+5o5+Nn7R9PD
 C+alUa6AXv77LBCnfSxEnonLeEVGKrdojuSvvxLPF3Bpsfx79ZoVlsIj6KoS+nlVWAtusgm+jVR
 I3FExyOsIdHRTdznYmRRpgERE2P3X/qnQ+PytfjR5PCGwkldSiI0/D/ngw1NDs7lQ6sA4OwVkig
 6JCfvrIGfUaBm8wsOjM4WA/rvX+UulQzYgN9WCBiXxy62+en2acPbgxSlCS6/DO+IjVgPAgrohv
 5MyJUVHf3FlTMgGuY0FHH4T4hHiW1ag3uQvggjKJbdIJNwGM7Hb4itVJGurcb3/a0SvfNVFJaHa
 bQm3CrxwXqUeMLGmCoNdN1wz5anN7LOQpH72VQk02BpPnSDIt4c1UFsyFNNpBLHB8uQXXgDA8hY
 7jnVlrwZZ9Y7aO8eo8A==
X-Proofpoint-GUID: Kt-TkdnWP0SbjITbmHvDX7y7T17y6ZTz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXwZ8EW0+8NK1W
 nMVoCZYAbn2agFJPkZ5Nex6p4n1mo9HqDIvapBoGTfXatU6h10B+o972flpXxRuT6zbVFRX342I
 dnol6ZhzqQmmY948aDxKaElvhf9AvYo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected
to DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON for enabling this 22pin connector.

Add the regulator and backlight controller at I2C2 address 0x45,
Goodix GT911 touch controller, panel power and reset control, and
a 2-lane DSI connection.

Disable the default HDMI bridge and connector in favour of the RPi
DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso | 88 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5248b6be68f5..a2a2ffbbce3a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -480,6 +480,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
 talos-lyra-evk-dlc0697-dtbs := talos-lyra-evk.dtb talos-lyra-evk-dlc0697.dtbo
 dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtb
 dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtbo
+
+talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..cee602a78322
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_display>;
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_display: regulator-display {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		enable-active-high;
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
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mcu: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_dsi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch";
+		reg = <0>;
+
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_display>;
+		iovcc-supply = <&vreg_s4a>;
+		backlight = <&display_bl>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1>;
+};

-- 
2.55.0

