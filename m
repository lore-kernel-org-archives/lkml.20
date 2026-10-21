Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592580;
	b=JRj0dFa8CPKKJyL/62vUaFI7bIlD4KIsUVIfAcSqoPT6wb19CjYXR6Os3hTCpioWGgqi
	 l5v8NU//MgrXP07CtyEghWyqCNWu0UWTqB+1k82fotvQ83foPK8O4ttzYE/WynJni5fYP
	 7mYSkeQdBCYy8ZlPUlq4lXQ9Kap5hlQjscPnEZOjxSgA/5bSDglulklderLw55r6rIfiY
	 Wu4CV16Yyc0hXzcsTmfB5JgMWgdYtpuIGy+I7GUFRvcKDuRQvyGRhovHiQst999lixXeK
	 huowneLrH2pJjLuwgh0Dj+nIoxHYf6M5wz0gUMEskpnHfLVaWlweQ00jIAdDARET6eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PhU2gllAfWGF/TwnX0sK3IcbsZoD1YNF/SKwStBqd+k=;
	b=ZZbPN+mziaSzRjF5MPuyGERv4DLzt6SA5Qxl75jHuA40GiDEY4w7tEz4dAKacXFeseuc
	 OlkjpZlnszyoN9mOQcw4v6tdR7kFe0qhCjYSmK+8ybZf1BWaFgIa5un2Rg0bESzJKmvo5
	 4zGV6DNQLHWEZOXsdQF+YZNJ09vcnDTjtWvU86AMX8/cLWtawm9zI1kQxYfFNr83tlUcs
	 AXunmAl9+zkU3aV5XvVB7P4G9HybqtqS4TKbYV9OPTENCEI2GpEHtxutoZYt5wFNshULk
	 BDBdU9wAl7aVIyYqmgecItvKomSGSWGapk/QMjKJ6B3UZjy4hDvFYKBs5iz9pjI6MjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvGsiVpK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cOI+JHqM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0A060A3823
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC0A060A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvGsiVpK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cOI+JHqM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFL8D3560450
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhU2gllAfWGF/TwnX0sK3IcbsZoD1YNF/SKwStBqd+k=; b=UvGsiVpKDkcm10qz
	U4bRC9zRp05bOWOYEbTOs8DnVk0RSsBKSwZn05DT/AkZ8UADVuoUOJhKav12MgOq
	lfsZ98959ZLhgyOqm806rGvj/RGinHWiVqLqZ6sBaQdcAxkKoHwtrFHMz/Z+uuxO
	VuXYvH75KDK8/sK3tgsiiv+tHz+yeB9W63rw7iJWdBA8BJL8pdbVPdk90YR+VRzQ
	mY1/zTIu58nnWJK1Xr6ZhRp2pZPejlIOqqqBwmH9V/G9s1MsBrAoer89zlZunqqi
	jIoqmfcMZ9V37nALgs2zFSgg3Awp4WzE9rqJxP0HB3vhA1y99ShIKVjiJzDwnk5J
	lq8kTQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy79gbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c58d35c0aso111187eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592578; x=1793197378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhU2gllAfWGF/TwnX0sK3IcbsZoD1YNF/SKwStBqd+k=;
        b=cOI+JHqM18ORSBwD4eyCpKJUIOf2t+h7kN03NQ21nvVL8fDpx4VD5t6Yn5xtHLvyHp
         N6XSNISBqwbcjqa8WZlLok6y0+my4TEF3jTJzYIay1J0UgwjAakHwOEVGMdPoj6lLilf
         jZqS6+MZ2HVuMkhrNg0BLas51dqUi8FM9balO/pMpYO9G68121CrijO2Jssqu6EMquOW
         n55NFoZPU0iGmHxYHW8YlYoegishmO6gTod3TrMbG8t/ihobUsrKYfNxjfFGlQnz/cST
         qBedeQmRoDW6PJ4EGGUAZSl3ht7S/H9EKW5E98QAxH+kBDKiU4h+vlavH81UgxU/BnbU
         A1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592578; x=1793197378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhU2gllAfWGF/TwnX0sK3IcbsZoD1YNF/SKwStBqd+k=;
        b=Olb+7rLV9aZ0bzF+9X//4yhC+7OdR8JHcUi59G0EbVNJJvrMnB1kejWhVkZF/U19Hg
         aIthP6IIFdgfDiXS3yfQzRwDzfd8ZY9+lzbVsXZbf/1K3I4kCS/Y0WqRnLH5xLD5C5oy
         OcecmeooUWFg9YLemGHybkCs56FtqsNkcayurzNzQrizfcPotzseUjNWzmKSGAxseL1Q
         P3F3koF1x8ff2PeJkmub4PfgysxDnqWCfaJKROjOdsSd4ZuMiwbn6JROOJvAOLb7VBbN
         FJ3wSjEL+eMKa3LTKIq01i0aWbDOeTD+sNc66FTJ3VR1sqmVvzfPLh+64DeRNwPcPI78
         seXg==
X-Forwarded-Encrypted: i=1; AKwUvByoooBwWabx+fCVmViimGu3McAbQDkuqAETnu3XAMToPd4GEwrMAdd7B9HSB1ThbXxnTg64LbwFP7ZWfwc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqkuxuD81rE8ufxTstgZehfY7nViyYs2UkCLAzQjKW66ORf3pX
	Npsd70v4vcX7F5V3HQuFF/1WwgNx6kuDu+d1zAkSsjFlgBAg/5rDO7EysuVhDF7Y/Bt27YfsWMu
	323g05qCRyjKAy0004PDrPkdNm2lRsFaQcM0RsKNrtphDuzsLoprwA0frpepuP+N5Q5U=
X-Gm-Gg: AYBFou0IwnSbfv2S6754wc4wBhSkCvV1uFlncuCafYEw+XZ3RBJSOe36dxPZxBjkdeb
	vPAHr7FGp/DPl5O1iZFJYxkDFSr3pO16qQpJF1LFYCY8sDBDa98pmSF7Stu90pJ7qgrvEqO9UV7
	/N1ryyBSBDw8+ku95QbuFsbdwDV6DiV8Lffrv4CLwx4r2K0NpWAAz4zSJKBEkzBqk1m8+g+cVMG
	Lg4XzczZkQrcXVti6KhBkevjjmj/ryO/hHJzh5SMubzrxx/8A2H21RWmD/l6PwN4nLBQQJu0HYH
	g2FEiL9klP9oveT1PvkBNaCGSSBUsRLIHuKHop1CiBKhWOorKza3DB3xx33ZrCl9R9b+2lb0aOB
	rtG1KNxBYTholFY7IVX328WJNhGqqv2TYge8Req6alRKJeT4M13kAwozWTXYVzKVAQ8nYCg9jBl
	JlUUnNZ6U1Jh5HfI5hBgrue3Uci8Z7fJaAkV/JlPFLHhfScpwEfDo=
X-Received: by 2002:a05:693c:42d6:b0:368:5521:612f with SMTP id 5a478bee46e88-3685522022emr645176eec.0.1792592578382;
        Wed, 21 Oct 2026 07:22:58 -0700 (PDT)
X-Received: by 2002:a05:693c:42d6:b0:368:5521:612f with SMTP id 5a478bee46e88-3685522022emr645109eec.0.1792592577677;
        Wed, 21 Oct 2026 07:22:57 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:57 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:50 +0530
Subject: [PATCH 7/7] arm64: dts: qcom: shikra-iqs-evk: Add Waveshare 8-inch
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
Message-Id: <20261021-shikra_display_overlays-v1-7-adaea735999f@oss.qualcomm.com>
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
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3852;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=UtMVjHRombnci1ObQ7ST3ZaP9JWmZT8/3KRuats5gMA=;
 b=C6gZaY6cbD4x+C+mcjef+RVS4qVqqHkTqnGC6IOb/LFg2ed19PeZybw3NdlOh9qE9frNR0fDn
 20+NX8Q02+JDOX6QlaGXswMEKYWt4atEbMfIh1kXi/ljtid0ZtcWwTQ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 0oKlefB3haiQPFdYMCe2M0z0lZ0QMkrk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX2Y0XpTeAF31h
 AbIlXbWRwNNcLwn+kKi0L2A6Y6ZNIKn8y5JcP10go+vN/2jrzcYqPykMFo5UIAkCAcHnzfcK2ZE
 sjg2/NSfQm9VydZMBcuoUH0r6Qm2UCUN45GvXz6sJKaOpsGCyD5x07bpySWXyB9sDXXnlJ+fHL2
 wAXkPWL2YX80wlsWxH5rV6GUbWDkuWJzjlItEjgttEbnBJw2IZY0xshnp/QISngqcgWG59GvLHe
 6VEzO2xLT6XTo8/EkAbjyI4wu2o4cCL0LMj1sw2zofbmvTdt9Cbd422HRFUzV2LZnN6a6/q3r5G
 iUCGTnH4fIbh2OKvgT8AVA0bnZI0Q2mOfEskUC5+cnJkaqPfo4N+ZNmt1Nc1UJFlXHjNxy1vy5N
 F4Dg4YthB+jhfZrPEQHoh6FFvKIPAG10bBBsA2bn4zMESHvEqsd8YH0z8TEHnW6dxGSIhIJ0psI
 dkpTdo9orcIxEgJZvIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX2pBOXwQ9tQVQ
 irKpVi3KPCRqAFeLvz3LtGWZtk9lLWCtNg3K1/T3UfkiZua13+wk/wEC/z3+TwWHR7iPAolD05y
 akw0IKm1pw5vpI/RY+Ud3YLnATQrV60=
X-Proofpoint-ORIG-GUID: 0oKlefB3haiQPFdYMCe2M0z0lZ0QMkrk
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8cac3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qEeDTSk_RORxmtoI1doA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to DSI
22pin on the carrier card.
DSI0 from SOC is routed through MUX which can be selected by DIP switch
S1016.5 ON, for enabling this 22-pin JDISP1 DSI0 connector.

Add the JD9365DA-H3 panel, GPIO expander at I2C4 address 0x45 for
panel power, reset and backlight, and the Goodix GT9271 touch
controller.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso   | 77 ++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6d64e7ce197e..2d25e3cc81f4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -383,12 +383,14 @@ shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
 shikra-iqs-evk-lvds-auo,g133han01-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
 shikra-iqs-evk-raspberrypi-dsi-7inch-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-raspberrypi-dsi-7inch.dtbo
+shikra-iqs-evk-waveshare-dsi-8inch-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-waveshare-dsi-8inch.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-waveshare-dsi-8inch.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..d0aa115681ff
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK Waveshare 8inch DSI Panel";
+
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
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
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
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
+};

-- 
2.34.1

