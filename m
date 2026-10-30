Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353233;
	b=hoc8DXVGd7iB+onX0OKrEaur9+o1sEjdpzx/Qc8j4eR54lZ1Niw+kZwA3Gh+f1ASjIEt
	 zE+n/Dz6Z/gLMNSoiDMTvWxLuu1wuedGqweUvzD3D9yCmDbQNtv+ww1cDP7+RMK4l84TJ
	 4CF9Geq2uQzbHz5mVlkHgjVOUr/nGxt51rij9JQ3Um3H9gdqomPqXD3MiqYyNOACEfm0R
	 LlWYv2918qJ5uOhybQWz3tWkRqFOOeuTmS9m7XkL2/ZF9MZNzXoqAhCMPgAx97ubrquov
	 6AFpRVbaT1zYtjpfbiZx6B9Fl2Sz981MEy4KzxwkaXCcJOIpV3BOI/Ng9aoVF47RCOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353233;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
	b=HC5WD6R9s4jaav5lsUWIGsbaz34+RXVcBT5eJ7xu4NuJSEu6cgAhVQ7NK5dGEou7huvs
	 1zXqjAuC+04xTLSwP1W8wi5j1OhuhNG36677oisEHX6XVIHyWu1ikRhmjX7NJ2myaGeJR
	 5qEq4PjNgvDQ8iL+JB1dFM3FBzp7lVTlSgBN7hCYnpQ0AOWXBKVIclN+zpp/2KfdRmJRg
	 +k+Kh8SfUhBjmN+ABvxbD/p4utm14njNo0IjKvpxD9RAYuKb4gn1zNVg7wncUASLQ0Ef5
	 we8M013fpNNWlUEInmR4dFi7GRnY8fcnlwTzSOEgASlX6Sk1YUguxMrINvA33uyq6pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPnwdUPT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PRxBWYQj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8CD606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8CD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPnwdUPT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PRxBWYQj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F3Zl2134526
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=; b=TPnwdUPTvrSZyHe4
	9qe2B/zst3/agevRcobSHi9mbKstLgy/smELrXCEhA7l1GfegGfdZXFV17VtLM4X
	h0Lzv39Frgi/TbaeDSjl1Ne0uN8dteoox6BrXLMZR2UA6jRZjDrA4jTmxyjotZhh
	X0/Lv6XC0Y0Fkhp6KJ0pBWQgk7pulxHj6v7iepQbQOMC2bEC3wJUniYDlhQxNABN
	iihdzzdAqRsw4iq96STv4sTuFCIy1lYkFsIdbMxXdLlPERtjYc/ObOfRc2+ACy2U
	9rlXUYsr31Ffz07heODAcm6Gjtai7XxJsutxc6lYl633OgjJgUXjytX0sOgDIJC7
	ag27KQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj8p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:32 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so682311c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353231; x=1793958031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=PRxBWYQjh6E5AGiNZhJBjFpVKdBxb9aCP4i+7gU83q2VGnU07+bW3H5HB1x5AtOYaJ
         Xy+kBO32gMulSzMFJdcWz5IzR46fXXcpusDgAsHsCEgeIPg7ARt/3IJEZsOz/VV8RGWp
         IIRbX/ZJEpKhqm13Fa68Z97if731osBEiOWOp+BUYRaM1I1dtRivl89bu8so3zFTqtri
         +jBDtMyCK9q/w67LvNWOV5IPNS3bjX/Es6LyOCi/rxX5h78EqDfEpepbJwjh3nuDzr4E
         JyMtttVkhvDCco1xDFLgpVN6O0LrCoJztzppnpCtkHcmX0JFeOM2ABJ4BoxQ0g0FRAFH
         165Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353231; x=1793958031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=FOyRL71jZvArAlHLi8u6U4+v+OZnbzD2U7dc5YNtMGxviB94oFzJztP4aKSbnpBCwy
         L1UlPme23FEH78r/Mvdgvznxx77zwFdVSwcf1JQW32R4Wp3YIzIRVfOPxf3mbdwfY9n7
         Jq2UAYJUkuu5ZIGqVGvCe0GJ6Krvub47t6V/XijN0eWrjM0dxRvsK5RENwFte3AtBUfR
         9XXJyX9QVBpNPPW/qZ8CtPg+xF5fHm3dSjNyUe01FTbGz1Mi+qDoI7j1u6MsLffhdp15
         UnZ2lR1zgIewE/S069I+91REe/TdLzCs8LyImoDHxDM5orC5lETFFNhjoRZgsIhaEa4F
         eqMA==
X-Forwarded-Encrypted: i=1; AKwUvBzriAIvxo+rHrTXlYZG+hDztz4kTUQkcWFAd9SKe9sz11mrJHfEDdn0YqXrPebzZjbpLLsKncNvPM50OXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVFevCipx1Gqenn4NX2MqeR/cSCEllcS0wLHDWiAepRcGrRQoI
	R+16pf6/tzaVpuvdmlSXIfxWj2R1BGilGdYDj9qNGp+97L/0xk8HofG5XGAqp+ANbESnaUFMPOg
	fkbWbLZweMPo7j0LITZdjN5MnKQdP3ZWpmWGQzElcHdtVIm7uvXkZ/iUB4WmnJvWxZw4=
X-Gm-Gg: AYBFou23MJQ+CJMRfNO+CA6V2xxcNcb8v1yQZ+SkH6Dn3AuxLqtDeJwZ9kGKHwTAOxb
	2TpMQUORw4WZS9zBnHEpEI0mAv4Uouf8/xovb4X2Ju4rPihp8Q+M7KMYwUqOABtz30eVVKhnALq
	g+VeYRI4ropsAQ/gwPK+uyMAWtXU40cpg8WLAbi0pRxRi2LtxwRALw/CGdihkY8Jcva7Bxj3pvo
	5z3RT0iLREtbis9CRcEOhovpjwwzQTwrZISoBvgPiaYXDSo2FbO9Vp9ljRyr3PGXYvNg/+D/EpL
	tJKXKRmY+OQVTKAbs34ToEliyGTVsCQxbfvvFqGWVWsiMSWocDvCjGSv+RpoYrdz6YRldQYo8ae
	lYUDw0E1qKHDutxBcHqDnYg+uECW5BDEulZGmmhtfL3jG5jI0qQLaFkylvZopusGKAP3gwfcgEG
	7KUh0/
X-Received: by 2002:a05:7022:258f:b0:165:dd90:1f54 with SMTP id a92af1059eb24-1ac5eea0384mr2993451c88.47.1793353231124;
        Fri, 30 Oct 2026 02:40:31 -0700 (PDT)
X-Received: by 2002:a05:7022:258f:b0:165:dd90:1f54 with SMTP id a92af1059eb24-1ac5eea0384mr2993413c88.47.1793353230555;
        Fri, 30 Oct 2026 02:40:30 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:30 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:07 +0530
Subject: [PATCH v2 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch
 DSI panel overlay
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
Message-Id: <20261030-lyra-display-upstream-post-v2-3-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
In-Reply-To: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
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
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3988;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=khjAi2jQy1zq3snDT67UsqjsppVgIl1f7iUfWMD5fRY=;
 b=oPaCnw0FIwZwEoCmzsTOlsyiG+jqTmyH7lvMOWP7uVaFkpjeLV+4JWfJKIViZaugdrPrOdn+G
 Xxh6RS0ooMmBJj95c7hfY61ibdfjBlbReSgMcwYX3RS0FOifWgJ+OSe
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX3r6wH9km4wJb
 CkeI7anGI7P24angsdylyWaKUA8MDl3AeIc9csXSOm/vW7IppBgmtKuwi+mxWjnMCF24nwjuP5W
 i6kgmy0lFikavW8FwwoULdDRKX++Z4jNGOPsuYR9ur8DECi1IjIwlBa9S2gpNWcQ+oTR4Np4hmI
 K8G6wFnKubI5kDqKpWF34w+lXsOj3KvZZqsX02jD3xeIHQFGAmzRnQrHgT0BlJ2fA5KflV/I6Fs
 /rKFtvPT7NOEczg7x3hSHP6oSLZ/EiFVWetO6iZLdn/Ctr/XXvOZzTATJZbMsXJMikc7OXBp/5D
 9jJetUHJjp2+7KZiKaXARYCg6b3V98Vn/tIM1qjgjcCc6jS1AjlYTvLOuVhpJTcWQG9QmizRRbx
 vkdn6XP2LerhCBD36d3yTMvX14I8OvrSpz/kw2HScNYxYoTXOfQBbVZVmyXnCq+lk+d0sERJ7DU
 Bujuzi93PIUoo8KxEsQ==
X-Proofpoint-GUID: THMUbSbM_YW6as63RMG4eDRtr4HJHMKo
X-Proofpoint-ORIG-GUID: THMUbSbM_YW6as63RMG4eDRtr4HJHMKo
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae46610 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jdnGpsxoh38fhdhdbFoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX15Kz3CXui8Mr
 MYuvX7dzzNJajq3J45tEvaKemtf3gYamfTGXldzQetBBBvDlUGBxBnm9ceZikGC5diKkZmIiNDa
 skFYfXQvRShLEXLU3LXNuD3ViTLGdwM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038

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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso | 88 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 709a96ece14e..298054f47046 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -480,6 +480,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
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
index 000000000000..6dafdbb87d3d
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
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
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

