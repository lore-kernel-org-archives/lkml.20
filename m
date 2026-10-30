Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353248;
	b=qb2Ng/inTXK+7PNlA7N4BSeuPy2rwF8H4wy1MO4TF8edg42LcnUYTyOwrvVCNrF1Vkls
	 GjCsPW30G2R05LWGDw9wROETnbLn88YhlAyF3CjZxPykyRvJ02rti8U+cVaQyiR3vdHkU
	 CJf9wWZeO/a0QzLs3/+Ly9149YF5KvuDzWdA+cuyEqTgCZ285B+ybj/zOvMXiQWemi7Ak
	 P7Gkz+IPcmvqWCTC5MK81Jf9y8naEVXGxwzVErob8JB6whrltEQFndvrouDadxP9lswaH
	 Du2M2ieCHkLCmPvbzjp/nVLg4QuMdAFMx0ujcqScm3eKm/tlwrCFdOdgfiKVskAbwmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=;
	b=nIcHLRKpfZf6KLdozoRrxpsJD20Kcye5jXBdScYQ3wyfTnIDZHn//GpZx4qmdsrVA609
	 5xiY7+Dck0/zYS2OIcw2vLrdYdlRqMETQsFrK5b7oIwDbxsnw/rGpu8z8Z7+gMVa8pwYn
	 KzZmO3Nn46WF6irvgz+GjNdYHFwONEYmZZOBOiQtp5RgK1o9njef/wl2SlUaN8naMsgZ8
	 DvwL8XXDxSO9/3kVus44rnZpYGOZ2MB1/N5AFgylTWRO7IstovAAFzdS6EJHVXdbX1Az4
	 BHXUN4OZ8wMfyJfmpSl4Gp/yum03Tg2Nfx2G7SvauAf7I1i41dwVTtNzQDIV/pwXbRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3rgTHgn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ow3G3RKQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FEA606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6FEA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3rgTHgn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ow3G3RKQ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8Es5R3737729
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=; b=F3rgTHgni0gIhpe4
	f1Q0Zr0u9Nj4IUpUrGQrjOVgtwU2dLrDdLFzNhCfik+ko7FZFKRQgHgY/d1bkF+Z
	qKn0Rh3oKBt6j2bP8blcF6gG74MktCoIdOofa8KZGStz0TtHXa3r77hktP9Kzahl
	Qa3hVANHwEJD8FSJUUrBOAmQ14IeZxo24o1XNOpTcqV0z1xsYcA/FAFOI+LOHJ9D
	8GHsHgclT/XvHh4zYCOFeP/tna80QVcweSsH1yQJkrFU5RwV5X6sJbKgjaCyGafK
	Ybzssa/SNwR1TPaAOtH0fFGDrQ5Bz3B+268EpFgkunI9WkqoKJfpUqJRNHBuunp6
	ft6L+A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75278t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so997194eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353246; x=1793958046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=;
        b=Ow3G3RKQhGYaki2dHl05cntsV/0OPoJdHkjF2rjm2Ihkl9NrrylZxVyWe2EhLsviQH
         8AIsaPOxJRNWDOM9fcj4+Awo4FlubNYSaJoQ8UFGaiWvU/LgZzXugDC2FGdEblDYxt4D
         uT3wV6mAQ4f4EhX3lC95hUQWp9Jl4/JoH3XpQCBKs10tPlLtCeBjLLBMSCKgEX61Bj5Z
         JQgxaDw3ktTr9Ys118hZSyZZuFnFI+S+xchyFfztLj9nRGoUX2a1szIjqkKTmFL24z8e
         8mf+kHl83CPmTk3lt7tX72f9JXM6ajN1epb01VXasnuCtRTlw2MyNM4Bq1vKoP8RGi4n
         ALlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353246; x=1793958046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+AlhbsiipjnSlMaVx4SPUj+XkfQvKsmpXV5X6+9gns=;
        b=TBT5nTNCECrcF7Ip88WMCBmIK7xFCRbjH0pu6Ty7MFaQu7G9DoCOX6y/iLEVYLATAP
         fBkAYcT2zNElPjtEbobc2TbVlRuD4X2RJlcQbKWlCRII55TG29LGXTkH3ZjK86FNVV5Q
         LYprHgVoGwTHGiw+0PBeUHhU2/2BWYnLmV1La+v7JO0VgJ/SjqucErNZowwYw8UrrL7J
         CE7GAoMXYhhrfegNOFdbRLEO4UsxADsS3lMg4+1kXqqGR8VrPNZra8UqB7ENrEt1uBA0
         XP1XaIvAX5N3E6zd5rDxV14C18dTTOtUxF9JV1kS4p0h/KzyOA5r+eIO3spkiwSfGVnc
         +N3g==
X-Forwarded-Encrypted: i=1; AKwUvBzg/z0Shxu8KjbeAb413r0kqtbZxyWTnJGT3F6kP9pPp84+BPoiax4Xjh/QYcQ8R2Kub6BTqb1E6xIFF8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1m0y48XpnheJfcOZl1XWMTkXFclXEkVl5EgcYDj7oTWgNyuiI
	Lec9jjbBriDaX8Du5kk0KdtRrd72zeLn595cxSHHTyM0cQzmvMS4a9CIDsMjzZNEDnETuvzAQvD
	aRBLYerxH7lYUgcbJKiIdJdGlhQ2eY+IiuqOVJstoVgxHO1xxS2F6b8Qdu8wxXdrPYlo=
X-Gm-Gg: AYBFou2MADSIQL+hIbC2rQUc3lugvKt9q0xnheIuVuzbzwMMiniLoXVYLL6At8VrCKW
	2MIMYrUzD1sifq6WJ+AlswFtzeDBxoBAQ/Q2mNGTqFGuNPUlZCyuyLf6Zpst29CuoBHLTrKI4Pr
	PgI0UaPTIUL6DnFikr8hAXDmiD1uFS4/IQIcB5DjRJEtztxNNNeGKPhi5+/M/5hFZVVFsiy/kt3
	M4fMPjRSlf5YuVX4+MtqqBxPsSe/bEleyRQL17VvQHWv48bHp88oMhj/AP0kP1VeQ/8VoBkqa3S
	6UqM54seAdxnCrHq6ls7VptI3SNnJKoTwpKYZj/qNMCmi5qcUN2yBH3HDrRHHrqAWgteouxdbMR
	0mcSH4XTF5CtyU/7gc7U56WhyqJYySksB0rBh7TYvPsi5kYKrgtypFb3bCL/Gt6o+0gvn/8xxve
	etC4J0
X-Received: by 2002:a05:701b:4283:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1ac5cb1a303mr2508153c88.15.1793353246027;
        Fri, 30 Oct 2026 02:40:46 -0700 (PDT)
X-Received: by 2002:a05:701b:4283:10b0:166:f097:6f12 with SMTP id a92af1059eb24-1ac5cb1a303mr2508124c88.15.1793353245491;
        Fri, 30 Oct 2026 02:40:45 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:45 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:10:10 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
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
Message-Id: <20261030-lyra-display-upstream-post-v2-6-906302159392@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=5139;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=CQGqhSxfLwiW9diGzvVCOt4ve1m0nZXLdRNBE6mgRxI=;
 b=n2ECvROy1GlU4o3TO7BU0WasQyEsMLsenhHIyPK6/66gfTnqxgh8lHELbxYQsRNXvUjhxCNBV
 r44LnuA86GYALZdnxupCxmCpuAZZ5gJpJ5KpNKOkxNvC4j8DSfkICpS
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: dxvKTRn8pTRN0xcSSKy520wIMB7Kux39
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXwna5ZHjkOSHf
 nbOxa3dv1FREI3urLq1cszT5/hLQV/iDNCY0O1+FrBXKMR6Xb/M5mdSvdnW/kM/Uau4L7NO2cfo
 qIFQY6KzpoTLMZ8BvvRsi6rYvOoXy/gnYtRUT4+edY1aJ+VpUktyXdK4HPqwv0krZxx3/tMFisL
 abPNBBeX8uobnhGvFbOq5WEIESdbrxxo+ZOnb6+Ul+CQbtax+aEbAXyS9f7m3qTzBY7xNAcwVYB
 zv6J335eCA9ZZ3uHlZgyPmyvRDu5nQYBBzzNfoEiqiIvSy0FCqzEXiaPcTcseBN7wTm/uy0M5n1
 6PnHGxoJGBuhnyOvjgktUQg635WC7cdcNr8uNNae9zCbCnINi62tUT72XHz3BdnF14cInDkJwQS
 aIGCtdoik7u0qV1nbKUA1PAn10EpCz5P4jOIimLRoXlCWYeBXNWOY24tzkEV+LJavDR4OPWQC8m
 +cIOUUI2T0EoxWxAzqg==
X-Proofpoint-ORIG-GUID: dxvKTRn8pTRN0xcSSKy520wIMB7Kux39
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXzrP1x2CXPlPC
 Vonjr/8F2WxIfir9O1by9ZF5S6Ko9dRQ20I2EdSy9cbnU3Hny8YJBHwOdnIw32V+WpfnwOpGtTM
 CfnSXygnsfBWDsXZC1gPLA/4nO4Wo8U=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae4661f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IIR7FofeaqIF4eDoK2QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

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
index eeb8e903b03b..e5c2ea9e1e07 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		i2c2 = &i2c2;
+		i2c5 = &i2c5;
 	};
 
 	dp0-connector {

-- 
2.55.0

