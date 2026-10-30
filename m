Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353238;
	b=isDg+RVc97fnakEvYnpG1hG49C+yTEZd1CtYCxilA19dvYSV44BASuMBedMvNwYFyICC
	 kUvKNHwLuMxn9zKhzzN/E6IjYz7wbqJdwVjAObhdrs3ZlukfdXkeLPqUbpy5dY5SptLED
	 2fKXeoymQUh8X5QiuJcf21FDdsC/oAigW+K44MAnS3+RE9TCJBrhNIZ1ZwOgpFb3eh3ir
	 14u/1r4PV32YBnyulwz4iW+uWqZnD2n9FRTrEZnvWU8EQMQV4+jqVPH5VhXl8FQ6XVbsV
	 ajeOCRUUrnJ73o2uBWPrrlsxXCLJpUjg5pRa6L2qs6IRmwpy/V2c2C6etQLa4MUML6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353238;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
	b=hXL03puBH7fjLDz3C3+ggVXMTJ5tjKQYXvummtHUIyB41L57yByPwx+etPprAKffxbjR
	 HxSPvp/F1nv8BUI4VpiJjh/yDV6GjxO2BEz1qmuTHLOj6vhoSBJ9VEpU41S7Tkv3UCli7
	 OjzgRSzNNjuA3/JgQC4zmqapcCRXHukJSnncVkKDV5Arr5+4YCfBnMa/VXDyKX4GqiU2l
	 aBpdYdVIH7n0Dx/4YkPlJSHBXg2RHV2IDKVc/mYRMbVgDISeQiGzlMheyhwqxgpAJVsHt
	 cFoA+qii8d0arQTx8pGN2OYfI5sT2KiDgIZSKtjisfaMt7xDOW/QA7XPMiRHvvcZ2Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JgCi4c+l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hQBXPHEF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EBB606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9EBB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JgCi4c+l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hQBXPHEF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FG423709611
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=; b=JgCi4c+lCujG10/2
	/wblWEv7Hpb9yxZohCorfY68XaIr+Sj1bFbHb2tBFrY4LQSLN+DdSJO79aXubwTR
	GJGlCJvfTzhqLStBtGGUEZ2TXqzsKHV5LXqZDu8NSsoVY/Jai7w1v1IibTHPvrdD
	nYrQysBaPlyS5Ai26ggYqZzRn3nW44P2kMN40l7oS2VxuMJIGrRb7OmER09rVUzE
	uzLZFsNAIbFOlxvWqE2RvUYm/deAJ6/aWE/WrsfdI8WPiZ/DznwM+hP0QkUUpRHS
	w7UEcvkTOvWYVTaDcVX7dLwOt3wu22YBai4486FWa5LTGJOfHZR5HRpRKSWlpolo
	kWqAug==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rjb8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:37 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so1774127c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353236; x=1793958036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=hQBXPHEFGPbc2+pQRerfaLDmyxcvN0L/xBskW/B189o/v0Puz60LCVaoRu4sNWGKGv
         BJxiNOkRIgey5dlAZCJsJy8R+mUgOk4c1x+OlWa2XSrCkV3Uq4vbyMYpaFWZlTLAxg3O
         7kQLUTUvA5+y+vKYQESielk9ePqWi4/MyTYfIMweKNaTRyP/at9RuE4DCFTTL6+aL9qX
         4JRMqtC2Xypy8DWDbHq24MVApPve1GNgnAQxxHYYF0YQ6zeKgMjnN13s9G0vRPzDy9b7
         Dn0SjprS82pva7kuDAhzNRhWAiwY96jDjcSI79+STOB7mWlW5r39AHymQB8Qwny92siw
         AD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353236; x=1793958036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=l/SnhNALiJMgiPbVjf7kPp1CbGIIpD4GsUw9FBdfZ0CwRqKnyX5svoYzntiqQZwd09
         7VQcGXHft8kkAFpP5lwUUYJuAiuwctee8IfwuuVvbM+92Orr3NIC9zOvv6FCdSZqKRFK
         puLBPlYEhWALUhEkJO/aT+RBeFu80MCAJFQmaFVv4u3RCplPkBURR8OLjuBjzjomBY9G
         bOqMe0u9kPEdppCj+lJgFvWZaykMKfd7XzknWU1M3TwNvdB/aMWOFWdShsxSptIZkQOD
         OLdCVJ+FO7sOOBnofedAMx0mq2LiGDU9t9u0ZqPN2fnobWvXIPxkGzoOjXDrxyRb19Nl
         oMeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoBoYL1+/hPrv4ON+w6nYOI96STHe0J5VgpohcEV8GuRocDZZWDN54YjzW6qpJ0Ggz+Xnd6PlKsmdpbhY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZnpjPtADYTWoF63sciDHKg4Lz80NADXejMS89HHQmHGI2cZ6x
	WH8s7GoUjRke3NAAAmuODRKv5K+iTRvfC96wG9fpuSK4lGCNTellcBUZdLVAlF9OYvZw3pAfIMR
	GY3ey+SIdyFxx69h7DxxUvaZCoFM8I7JDSrOVZU4dMg36beHvs+4SUuDpimfyKtlXlE8=
X-Gm-Gg: AYBFou082Hq5nzRZgl05mreBr0Dw+FsklNwjJSI/f3haTTzJ6sExcYxWCWEKfqIbh7p
	9BMfLJxRI4k+gLpLaDk8+jKI2OCWOOxMi7xdnVmQvbNPGYfjdPvUd5PeYsYNzZwaHVh3PJS9ABG
	ncf37iOIIAzCMrgW0P1nyj0MIZrqBcXjtucloNKB2ueLVVba1JGqVVO5cXr6yJGKF03pD2rCCkn
	lLRGy+bELb17VfZ3hFmNz8WZrCR0M6coQzrXm+enUSgjQSawdfbrvjJrs9dOPXrxwNMSqncp8nr
	L70yQ0bc/SPCFskXLhbxIOLgChN8sF+TueyejPZSO6sizYR0N4yDtuGWN9GJc6gGwckCD9eh/5O
	nzMz3YYRe/yNmFV9RN9lCE1m5jSlY64wyK8Qd1qrGNTe2JIkqMeXgZOOWzU6A04Y8mY/ZRUtkiE
	Yxe5xl
X-Received: by 2002:a05:7022:1181:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1ac5bbb4870mr2248812c88.8.1793353236471;
        Fri, 30 Oct 2026 02:40:36 -0700 (PDT)
X-Received: by 2002:a05:7022:1181:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1ac5bbb4870mr2248785c88.8.1793353235780;
        Fri, 30 Oct 2026 02:40:35 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:35 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:08 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare
 8-inch DSI panel overlay
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
Message-Id: <20261030-lyra-display-upstream-post-v2-4-906302159392@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3607;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ep0DWydVmKj6o+MB54eb4vl9AakC4YjRhLn758mEY0w=;
 b=wYTMEsgUVYO0whhO2gojRLKPeuIrfFxFXHSVh20w30m9pH52rzlRdjc7korVVTHAdaNMpAonk
 55mKCoygj7CDuxvIdmAw7kxTfwVShzIEMmwQG0AKVnURR9zzKoNQrWE
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: zQbpRtXL0V-SFad2fdiutrPWiF3SZC-k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX6tQitV0Yu2mS
 j7xkcYtf0elICc9V0CrdwrMgDKOPKchSEy1IowSanXPAFwoIj9bfcmTHjMIKFxrdir2T6vR3VzI
 fz18/bYT03HDe+fiP6HVKaQO0VQMwWE=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae46615 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=CsxVdn2IL-oTZ3OAgFMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXyS23VXLLfvXm
 3zZ3xWSZIiMUPNs6UgiGy2gbUHcUYJA/G+u88ZinvGPOxkdC7uRxQdtYLv6YS9OTQaSGWKQktNQ
 MQDBNUSNX14hrzATa+fSt0CLSSl5hYP7KIsF6FaUhX9d0zjOasnQnzK6rEFuzu3QhtHxIITbrz0
 MUNW3tJplfuAxWhGY052/dPir/4aOxIe8V9OPFeMpaVC5tEjDhVOGlpl/hvrdd4Ck+jorw1X3xY
 jpkKP0vZR/ixtLnQ0MLxNzjr4P8bGdaw57M24WONv8W3/4RHRrU4YLzBZxEl+kJsraGMniPBo4i
 ZsWC4zkMblgGB8Z+qzeCcdoYHVltrRTlxarhfAFsHjfxjB5UsL3WJm7Xvu8UvNW2udANs4td4ZL
 k0gm+7Vy4dE3e1GyeqgQBWvU+VZBIZOTjSgYxxNzUwOt/JDLUdDFFSTXli7sRQC/mo9+07Q4myG
 N3XT58OoBab9X0s6z5Q==
X-Proofpoint-GUID: zQbpRtXL0V-SFad2fdiutrPWiF3SZC-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON, for enabling this 22pin connector.

Add the JD9365DA-H3 panel, GPIO expander at I2C2 address 0x45 for
panel power, reset and backlight, and the Goodix GT9271 touch
controller.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   | 75 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 298054f47046..b6a61339914d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -485,6 +485,11 @@ talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
         talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+
+talos-lyra-evk-waveshare-dsi-8inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..e9a8fdf0c179
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,75 @@
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
+&i2c2 {
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
+
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
2.55.0

