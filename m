Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592571;
	b=dvy1QBkRlpMVdHQ7MCglpF7l1ufCJUdJd9clGkMKHSidYCRZDb6UeMKBgTvtgHxwyQiG
	 mrb23aLt4hXBSXVJQsy5o1XwU0AiS1R4e0McnAEfW5NGF1BwypXuZeuvv37rQ+rRM6FyZ
	 q+zBvwl0cyQZE/fp9GEqwl1eKVu9B7xhCzFEVl0JUdzcLd88z2H/ACJyjCpThJZgQ99Tv
	 JS1gWSH6a50prTYJYzrER2AvFE5GHaB0/wjtte1oJrYLfxFFpLWDAOVo9RXmpbfDqriw9
	 Wo9HGZ9tLBJq7Shm7ffXcPQGBbPySRRFo2fJXKopf8Xa/csloP5MxP7/TZ5TlNQ42Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592571;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=;
	b=d98QvJf4DBdVjeWQsn6di16/dlZTzkbyIpXvfZoFM3hbTObIVEgu2ma72TzUKG/PZjML
	 pGs7IHDi4gabtDsOY8Yj3GU9R4BqmONejNYgylg5EPYw2rU48zqhnt9zBOfok1nYXZO4p
	 dKqRCIKIWRNd4pWSEwDJFmcHWjFHkaNS0trGvK8NzX6speKp/wJVwhcEUQ3KF0HH0YNyH
	 AkbLP2RGtJRWNHfSw7L3BXvuuUQRMeYRwfPFz+9U4iUHufczHZRfUFeSj8HP59dSa2xOU
	 eHgjamjwOyx5EYxC8TuolxZPVg/pIpXF/5bS6nrN+hppls/E1CX+/bxyKWRtAIP+nOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcxVNumr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WAwM/NVl";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6945606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6945606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcxVNumr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAwM/NVl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFEZP1313900
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=; b=UcxVNumrX63VcLiC
	v4I6Gdy54rqPExcF/+P2rr40vXKgHoHwH+xmr1n/2jHcXwfTSCi+Um7TxqgEo0Yl
	qtV3RP00iXn8xvph2GkaeDh3jvmbwfbl4p0ntJZZumQi5modkAwWAFEFF0sNjoT6
	zxyUvVCisUMCRAlW4ReFtKPI6Ked/vwDIFS2oesQFO0VCBHJgZ9ctjsKHceKixkJ
	k7bwAWgV9bmyoMmJrI39Rn1SNY+jOYUckRiH47vn5ns2g7UWWJTEwxB3lWB4tPhd
	HZq88JpxhBhJmnfeELD1NmfYbkjU+E9Zfrs03VWvT0684WB5Ozy+MDyxjlKhHkNJ
	Yziudg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03jym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c58d35c0aso111141eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592568; x=1793197368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=;
        b=WAwM/NVlGmKTi6WNdMLAl+GV3IqeoGl7JtFD41RP2T4fBSuWk89kmnM3fIic0TUNam
         Qfv/iFp9/kPBXn+EON9altFzZDMxwFMrSxDVR4HbiENTRrLbLejG/G8UcyNkjocuL73D
         yN+OIS7xR2odcZyHNUZdUUACgxagRCOaB90xiQzXqOK7Y4IYvFicxddy/blvwaZW+v6s
         kl7TR9KAmNHYupdzxRdB1060y07TAnWoQrIZRa6VK+S0IMvVPKWifN6UeP6MGPLrPUso
         4FYS+Adu56MrmgFBvbbS5cilJD61dRgj49hDe8H0FGlIMDshP3SWYIybnIeCffn/fNyo
         nLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592568; x=1793197368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=;
        b=Qvy1Q4OQUStAjGwNR7s+3GI2p4WZqceod/Sx7fWAaQTGIRcmIM8lbI+y08goSYc6xD
         9WnkR5jfNsEXSikAj3bGhH+oxq/cS6ym31wVQWs+qekA4kvbED0xqzSVE/sR1tgTJrAh
         6hApcHyrhk00pAcZj1bo4TLIy0UiVnD3CS61CDitYmq0y5McbsvPd4VMf8bEhyhxkigu
         owG9SpD+4efVvj5Qs6X30nT1F7CAA8Zv7ZTAMvSWvMSDcS2wpgK/UTpG7dC3N0pd5lG3
         hPpw5QTPV/H/xVphyWQ5VZCMuYp96N9wbvrmhIwIWIWfi91eV0mIG0g2znbImQF/DwyR
         VcSA==
X-Forwarded-Encrypted: i=1; AKwUvBxh56JaIOht9coYXHqopOD4K9qhhXMwyAQQDDOqW8QBeAk1RDOovlWXT42zFRe2oaOHGlPT1Ybkr8uWPvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyVGI9sVuFyAH0cYLiFfig7MPnsin3DiW7I1nor8vVwUqmy9Nn
	JzN0kpMnR/baCXoc4qkBip3ZEpGHUGWj8US/er0uzVLjYjkkoIPFqg0LqlH4k7kYZx+xDGuvn1h
	+KkOAELs87AU3uL/HiAwyWdEdQbbJcy4l0iBQmkcsH89Vkm7iAWLiYDnrTf+F9BaDKQ5qcTxp27
	s=
X-Gm-Gg: AYBFou1GF3FpRllDWFtCA0mIcVkhQ7Qbe2CiqJMrRL1RfrWQnIPOAavlf4HxF1K3rHw
	Xzg0ne3rVq5tcaLvEhKWMyrGRS15IIxh2AebtMgnnJYXSb/7nKgm1dL3J7RgqOAwRe8X6suKkMY
	dwQ4hSGlIjntA1R+JTR5xt4JpthK5Zc8rR9kRN+S1vT1iQeRKrR/46Q7dKIKVZUfE/dJybipvyz
	ly5hMrmIwvdY3E9pLBiKrqBjFEAPfDOm8IeRPrlO5kr07zYVM3JCHVP5j0OZTTDd5VJO4/qQo5e
	pK2CIHIDArUZziwK2kRELQB3/yYNckbfF+cOXo/D1TQX9pA96mVaAoPrQPSGWHsjWpv8VpAgaxN
	Cb0CGnZuR57H+6Wc3GwoCGwUz7YahhZJUvWQGlLVnvIUEFwYuoO227Xhb2KBd/DinboafBHlc3q
	L3H/LEUZzjmyAZhhBEDBhfyc3lroVzNbg/8Fheqg/JjkRCJFsmtew=
X-Received: by 2002:a05:7022:f519:b0:14b:edb2:c3bc with SMTP id a92af1059eb24-1909acc857bmr3804233c88.0.1792592567637;
        Wed, 21 Oct 2026 07:22:47 -0700 (PDT)
X-Received: by 2002:a05:7022:f519:b0:14b:edb2:c3bc with SMTP id a92af1059eb24-1909acc857bmr3804095c88.0.1792592566027;
        Wed, 21 Oct 2026 07:22:46 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:45 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:48 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: shikra-iqs-evk: Add RPi 7-inch DSI
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
Message-Id: <20261021-shikra_display_overlays-v1-5-adaea735999f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=4163;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=TpPaO2PqcD2nRBXi9HeZ1MgR6queUrnw4CleGf0Oa4U=;
 b=JCHF6IH0fOz/TzfRiTH479RpPk3hAQvJpaGk73C28IV6VwzvYMD4F0iGzghoRuJXrKX5SzHw1
 jCCG6ER6/eGA+iCgoLOSeE2JMpWHXtx/gDR8leyCFeMSnru8v8KLzbJ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8cab9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5MclNqnbmWmJdBvsS10A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX5sRLCDfPhFvY
 tSyIKlXuossskccrrSbsbFedOVYHngIq0Qtg1qQ2FovVxVhPIMj8Z2uNRHGbcF/hqfAlVH2Jw3J
 Lc9ZPLmg/T6ypykyp6lLF73diGeimzC0GsesYNj1tFxauMtU3kPvDRf0OR4cKmZ3jLggS3QsWvO
 V2MTM816tDWn1S0tPOzsUN1PaS+wVcahtRhRf3SM2C0T5sFhtEnZKv1pODfYNktOT9cL8sgslaj
 rBfpW+P8rjalftF5GAeH5+neklEr5CspOm3nmINscX3RWPsW6kTQROX4oowMdVfPc2i5zz7xlhN
 kltGNdQ/daf70ytCzvydfFH3UrzdKeU+d0LmImuRbQu7WUdgg9MysJ/dxMHSPAl4rZfBwDi/ZV6
 O/MyqPGpbJJ+mqcX5UOlTeIYpdWWCs0l52+hS7kvAl8Jr73UXQvV4v51NYArm4VKVQCelG6bISJ
 VEvdQWGU8z6qz6lIV8g==
X-Proofpoint-ORIG-GUID: VfVCM-Yg5bRXkdSEgZ48YAHzvg8CMGEw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXxc9rgeOZBHQr
 CoNp4IlTYPkNJhtvcx1sfcEjlG7X8QWdZny7966UJ3Sx9ja8KXvkaq6znKamYe5zQsNDHkSAeWK
 shC1xy6T8ihyR+rKZ/NJ4GRzyQP7p4I=
X-Proofpoint-GUID: VfVCM-Yg5bRXkdSEgZ48YAHzvg8CMGEw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected to DSI
22pin on the carrier card.
DSI0 from SOC is routed through MUX which can be selected by DIP switch
S1016.5 ON for enabling this 22-pin JDISP1 DSI0 connector.

Add the regulator and backlight controller at I2C4 address 0x45,
Goodix GT911 touch controller, panel power and reset control, and a
2-lane DSI connection.

Disable the default HDMI bridge and connector in favour of the RPi
DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso | 91 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 610fe640471b..6d64e7ce197e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -382,11 +382,13 @@ shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
 shikra-iqs-evk-lvds-auo,g133han01-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
+shikra-iqs-evk-raspberrypi-dsi-7inch-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-raspberrypi-dsi-7inch.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-raspberrypi-dsi-7inch.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..383dc5aadcfd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,91 @@
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
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK Raspberry Pi 7inch DSI Panel";
+
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
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
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
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_display>;
+		iovcc-supply = <&pm8150_s4>;
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
+	data-lanes = <0 1>;
+	remote-endpoint = <&panel_in>;
+};

-- 
2.34.1

