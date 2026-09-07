Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE57C3FC5CD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762855; cv=none; b=PifRAGMRXmIaV7OEZsBDEdtFB0jBlqOvsGgdwFLPabhpel+0zzDJtWItjcosx749jW4xks4w3ZmGyYQPoZ4zmi63CA95mCptVY1vh15wBdsXdwv+UjhTVf8k8bYGPk3Dwn5fho1Aj7ZczmNGJ8g6ZyyxvKrJdG7AnAkcwACBcUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762855; c=relaxed/simple;
	bh=8N7TY4Wx00YA/qc/Yzv+tudh7jh85F9onYb97CA49Wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jg0aIL7wX90IBXqDgIjxpFDMwxGjQ561fHAoY4kPZqmlap/XpcCot1lBWqMdl40MhvxwIMiEn5E131XQbPjWsrDyTY3iDRw+jREL3cNkLQ18JhLDoVt6xtPopixvr3BQUH5bvGAU90wJDtpigFF8iFDb5ivYgwPaDuqV7veYWaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0M99GLf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wy6ufg8K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0M99GLf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wy6ufg8K"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lArU2916920
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 06:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=; b=T0M99GLf/XfQe6LT
	GBWp39Ka4yPQ8snHcuE8oVAitfCAaCzVhuxtcT3dylkbl0eaf8VQ1BOGohLVI3oq
	XJH4i26uxQPfN2zZ8ekMc0jrQ1yAfmbir9gasHQnXWJ+M29xNQ5MmptMVnIwjgfx
	GjWLMKDYzzswvmyKSHM3ccoNmN3+U7jbvncrxvhNq7I2RuNwOytclKPY8hqjiNeK
	e5IrSgkdy+C8L2MpOZvpq+1BfouCQZKVIrudYKtM9WW1wGUJ5Gz58AfrqI+HFhrt
	frUzbc+DGFcCvriREK1R0RfunUO8gq5euBxq3eXQL4DguWvyL73gAsdkGtpM8aZU
	Iq6lRA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj0gu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:34:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso5050389a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788762852; x=1789367652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=;
        b=Wy6ufg8K3LSUhgneB73+JvtznEI651QmZW+s5JeOClC130Ebi00MpAXwjCHEjnGTIS
         r5l6fDVXqpIenAm3b/61hvw9jqRWQ7naLOx2BnTrzNa87+I5rrfBXjyw8tfxl6R4nzk9
         BrY4dr/k7liaHbOqQKOXCHcVBgKs2HiYwfzcFwo8D2F0r2K5cATFBH4j5dT50X8vTOs8
         bRmCY4771+bPoSLdckQgWBc/5MM2fFo9Sql85N4F7kj+WUg+Cex4BH2Vw0ZcpPxao0MJ
         9AtMOaKwMPGFXC0662RyhWXHNAGT3AFtJQrOG5hSQnaY+JmYcajCsWhlYCkXPGPGpPSI
         x3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762852; x=1789367652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=;
        b=spAE9ZgPa39vr9ecBABiuJv3b/XcvIfwF5WUcpLiembm+9P24sA3/SO0FHEDP4dUyF
         XinAkpRz+JWop8GwHhRMKfdXZea2+iWgUIWCrHlJla21JmlRkc9M3xKLul9BNVhuTsUl
         kSs8ZKxG3e7MCIAJ399tnOIKivF/qRPmMyKgRl9aHf0hgvcSJWW6WGfLGtOl+7PeG1d4
         7EAe9KIp9Nt3k7aSWYlq0xyvGKZ7OC2HNO1z+ArP8PVb+tyNWQOm4kzbVaX5m3dqLeH7
         mv9q/PkElVmm1ElQBhJlBmPR9iewcIL5zOwbTvi6sJKxYQitb1Xp6Eb/hniKen5GxEfQ
         7D1g==
X-Forwarded-Encrypted: i=1; AKwUvBxm2KUhQXwUaatqbCUCqoUKFXI1QzMete744Id7z+JEMJ+HcJ8KczTRna6MOz/PWXyocg69AUpgmUQBrP0=@vger.kernel.org
X-Gm-Message-State: AFuF++nSU8A8eo7ZL/gT7Ikl3B7rGicdoB1a7HCHfVNzwWj7vU42lUCH
	zkulQtq1/cVnOoXwRpGFy7kfNLdNVHFXPLYh7iD/nq1jC/nlVuyLm7mGqkaFi9l6MiNrYmQTima
	S+oTMzjyIZq1+GGr1no9GMMYg0YaIh0/YFpOSYkXX2bxGJHYWRWdhWgB6ncgeSZbralI=
X-Gm-Gg: AYBFou0kTtYGmQImrkmIVej7hTx4HwoAVdsFI/eaJlUp/1eZLR/lRoaQnGmmuXgDHMh
	LeohvKgl43M/87zwIw1lWx0ZmKtef3gD8Y80igaZQFiMrwQ14KFAEA1SHBF/lv/44796ecVklBO
	MV5URJRyPAJb44/hxZr/4O9NnigHmJ0r+8lCY+3X3R8RQSa9c9qmUfroezwr+NsCYFXCRpMv8St
	m1lHtHATGXV8Hx49BnAG32pCL3vtwLXYAwE610ZYexboagzTxRcPHcKfj0trTN4R3q1KB8WeI3h
	NioTmuB9BWDQ5/J+z+Ed3Hbu5lgPTKB14UWBsq130DvfPHTOg29Q3BEiaCnNWepkg2DZZRE5vl7
	+i61gev83IFmiKAq6Ncqay5EOOm4QBWDxVj6j
X-Received: by 2002:a17:90a:dfcd:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39b84cce5a8mr368792a91.14.1788762851494;
        Sun, 06 Sep 2026 23:34:11 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39b84cce5a8mr368708a91.14.1788762851034;
        Sun, 06 Sep 2026 23:34:11 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm2440549eec.14.2026.09.06.23.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:10 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:03:53 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788762840; l=3148;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=8N7TY4Wx00YA/qc/Yzv+tudh7jh85F9onYb97CA49Wg=;
 b=G7W8n/gqGUYM6VYeoFH5gl8G9XCPhuP8IzLkJj543T04lV4BW2rrUIVQdyBAfSkG8Q7WLGnY0
 Bi4dMbeXCxEBr1zkZg2WLV65vntK2SOczXvRxl84nbjQ5O8ptlpo6l5
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX02Uo5tdUEuXY
 zBq0W+1lbJAVALI7EheGUK6DazHOiE7d1A0sO2EescwTjdBzC2PG9easg1Iu9yFmyYsZw+sNXM7
 nsvJecugC9fY+sDZQvv0AnX+gBOVzrthHbXStqrsRbt+NfzcQ1i6+SgCjJt6rPamns65vbnb7Xc
 6b7k8aCGBNbxS7OfLBV8oeXyvaQpW3RTTTC6Bu1ZHzkB0IxVL/ky3wedyvHJXZnSfU0xOfSzaKV
 8IKi/DAzWRteozNreLRjbBmzMtvAONE9doS6em1Dbs/meYxkyCJ8p2g3q6AFyNfv60V8IsyM3P6
 Z5FQspTjpbOEDP94yDrCofsnpTS2gd9DLTyYd1Tiojn8hRnS2lkw+l+xR7bpLjIOGKZiTnY2gsP
 /n77vp7l7mIiSTXXiA7lHRhsQZ3K2Et5cVCpjtPp+FXunbrJYczcOHIbWb9VoM5FJRGfiw02bSV
 u8yiGtMDKRTJoG5A/dQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX+IH1E5cGiliH
 1r262oHflrPIX64Rc3gzMKRYVfFn9p5IBkQjjjPSE/e4DV4u+srnJ1BtyjzcTbx/R4lhyAOaADx
 hLDVhm6vDkKm32XNq0akIPsPzNxioCQ=
X-Proofpoint-ORIG-GUID: MLzlskLzdXH_T4rJ14cYyhp8ZDAssyGn
X-Proofpoint-GUID: MLzlskLzdXH_T4rJ14cYyhp8ZDAssyGn
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e5ae4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eOe13yjVLI-PHPVp4M4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070068

Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
I2C8.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..38554195fc98 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -71,6 +71,8 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+monaco-evk-raspberrypi-dsi-7inch-dtbs	:= monaco-evk.dtb monaco-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..f27b5a4a6093
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,82 @@
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
+		power-supply = <&reg_dsi_touch>;
+		pwms = <&reg_backlight 0 50000 0>;
+	};
+
+	reg_dsi_touch: regulator-touch {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		gpio = <&expander3 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&i2c8 {
+	qcom,load-firmware;
+	qcom,xfer-mode = <1>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	reg_backlight: reg_backlight@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+
+		vcc-supply = <&reg_dsi_touch>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch";
+		reg = <0>;
+
+		reset-gpios = <&reg_backlight 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_dsi_touch>;
+		iovcc-supply = <&reg_dsi_touch>;
+		backlight = <&display_bl>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};

-- 
2.34.1

