Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604729;
	b=vIicTx8LWZ6/HmpYLJHozqgi9arFHu0R7SFGnUQEr2/VntESRnfEtZAUkqX3ZCcanf7s
	 CkfO2ZM4oE1CmSWF5ha8zffdj3G0JGNPDdjdej0aCFKfUuE2zdhhIhOEl1xowkdWng/jK
	 d3LJIaaXmZjtHslbj2vqPJkObLimK6P5OcpzQGkkuZNyDX4mh1+lvy6YUsnrk4Wai+kKW
	 BBCZOnII+zinrkOUCVamLsyQ0BWOph1cfjOUPnfQ8dByiyG9hftnjmjz68rZoQJzGRTX3
	 kEb6Y79t4tbIiJRDnfAphGRrwBvpKptfkJ2x5PjGVU/WLLzeKvuLu94vDiTWfHXJVyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604729;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
	b=MOPB88kBiEpISefYd2RiIjsoVprRAPLBO+oRdAxZwpuUBEL1YeIQ35ypCisymusM0vcs
	 UpUKSHPZYiqG4zmZ5cgqZKeV0Wszj85UB/tnU6d7WbyXDiIda3BpOsCsk+jVlm8DMc48W
	 M5/F8O+59Zi2K7g3/bPeo2DyJ/Mh1tVbkVsBlNLLrE658P789UEJ/jF4JboI9WUXUdMjr
	 JP5mq2Yp07qZZ7qxGdrRRLTnZOMPcr+ZmFniGYJIEsxxnA+KH5YKjSs1ynQd1p9QVllr4
	 H49bF1JkzMq9eyb0P4LzeT3MAtI/j1kILUf3gssI4QIWwRZFE+aXv4RTftZtdgfi6Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l53BqFl+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VuylNs/y";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AAC606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7AAC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l53BqFl+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VuylNs/y
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vIGS3324658
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 07:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=; b=l53BqFl+lxJcsyoF
	jER9sTiiLtaCN0XwOhqhX+YSnU1hrgMdnhbgWnIBdjAYr9TvLIQtGe8PrVcdRbJp
	0B+WC9SIIq9jUodFBCfuTeOSiN+iH3m5UhklrCtK8IWvAHlIWzag8aqxgy6nWYWk
	nb3o4WPuvDmmuYePTbFTG0VguZFgI9WgzIkjdv3C0NmnmXr8gj/luc+9iUTfBzzf
	+0epvmRw67QXa8SAjbJ40kyVNaO/KW8YJQCV47vhPTlwOIUkS7IqdYaT2Mhvmcdx
	60wlRE44kc982fB35fCNUyP41q2u3M30cGbIrr9kglYtoP++iRQsYNwzwQe/JUGq
	49F2KQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6nu48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:32:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaae8d29e0so25040945ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604727; x=1794209527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=VuylNs/ycqW8ZwtLrDLEB/XSdVDEXJjf+bsSccXVkSxJR/yl1bBpw0EG3EvQs0BXjV
         DbLwqnNNhw3qRn/3i5ZzivpUNvODtJhhC+3ciHvwlb7dyrCe3lj7VqaW02icvlpPI/L5
         DFmQcQu1/yNLfeP4tfLG5UJ+l1al23/pQooZk2nDQzdHQ/fZIRD0LGQjV+iDkB3o4Xv9
         iVMpX7lwpg19LDI+XmfEB5KYj93S287EfL6xLkizAajTNOfBWAfRmUtWHjw47NMyxJ1b
         FTn2UBS7FTGhI+x8b+mzwtxcJ4WyVMZEetYz9l7btl46rieYguEAmyeFXpjIIohlVDWA
         O6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604727; x=1794209527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=K+9I4gelVV+KLPia6xTV9UHL2dsYq3Rrco9BQXqRplkmKHQyh1hmcgpZdJX+WXuaW4
         J5HrqGTDWaxCK0dzTey7ffqDGbkW5eB4qvcm+Nj7NNgDlT5ji5L/Lzp+Ztp74O0xRr3p
         Cd8NMEfatW/kvdzgKyuWlSHuuoN+8E8iG4m4iyR3OzvvT46tnQhB0wOiTlxfF1VXx4Sw
         MatVjTgeUGzujkvrZJRZtJEHuEROjeVrVGy34MeIDfzJxQUuMlzATSh2xIC73YEXihLN
         RqFGsMpdDjLqdvW6Y7oRxSslNBIrrm1uUVGxhNvGY+5Oie8HWP++Z+cdZuTM2MfXNU02
         SPFw==
X-Forwarded-Encrypted: i=1; AKwUvBwee/Hbl1/8UpCLXuOAJRKdi30/lTf0G832eGxBZv5W3HjvzCOWSHQJD9q/L8dcoUkYAYX9nprX0yhfhio=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mtZSuBuqp29pXBfhJsX2Js1OQCfgl1V+dlMfg6VTbowVJdv6N
	G8YQkchKe8AL3qxH5r3LnKjBV48u8LL6Ee0RoR56o4C1ioYmj8T4kONmV6a+ksAtX1Zfg8DU4T3
	78tw+nS9LcrokW0RWrXqxspSsHdALfQ61Us+usKhrsKcS4/Y9BPNNe2fTxbCXKoy0jOo=
X-Gm-Gg: AYBFou0KJ1P3KKxv9XLgZ5O0dr3HxqvZjB3eqIbURHNnNnkDe+zcJQZcmf2DhuLAOSN
	deZPP54aHwi/JTPzsjm7UEQs1IHbldz3W9vzoKZFRjW71tkraEHmne+TOPIvF0xzmqWKiZM3c20
	WvQvR1vjeRpb6JMrmE6VbRHrzwED6WKVqs0t0jzbUIBXi94fyDMYr+Cdg7oFuBQJWuJ5QeBkm5E
	DzQ1ZEHf4Ju57Q2etctQfn7lNWv2ngvLXtUuFo0hnr4hyq14oRd/UO3C3uZnZBkPLdRcMCtCQaQ
	oAXrZXKVSrNE9oTm6pbR19fSTa7odM/dg/BZt2le3QwerVi2gs8xFz+NhwQyOvZ3H9uuSlRxa6G
	Il7AMnhuwBFTjqe8bCWPlmyguhMCfG+M56YtFcFMPmn4pV5ydlaswRYKSGDthAWZ9kBLExYiZ9J
	p4Ib2C
X-Received: by 2002:a17:902:dac2:b0:2e2:c84b:43e9 with SMTP id d9443c01a7336-2eb363965ccmr87850625ad.1.1793604726617;
        Sun, 01 Nov 2026 23:32:06 -0800 (PST)
X-Received: by 2002:a17:902:dac2:b0:2e2:c84b:43e9 with SMTP id d9443c01a7336-2eb363965ccmr87850375ad.1.1793604726101;
        Sun, 01 Nov 2026 23:32:06 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:05 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:33 +0530
Subject: [PATCH v3 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch
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
Message-Id: <20261102-lyra-display-upstream-post-v3-3-7f660c3b622c@oss.qualcomm.com>
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
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3988;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=khjAi2jQy1zq3snDT67UsqjsppVgIl1f7iUfWMD5fRY=;
 b=z4D5+XRjcELJZGY+Tqzuj93wKZjqBIYMC2aKMBQZ4dkyAeU26xSv+XfULfNgUug7LIVchm0GE
 6UF1aEhqUCvANDiY8kVUmIm5XAwGt1lJnoUvEi5JxJp/9MEECXUk1ni
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: ADbhapjKk3jz5NQbbdGa_GBPF9A9h2hJ
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae83c77 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jdnGpsxoh38fhdhdbFoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ADbhapjKk3jz5NQbbdGa_GBPF9A9h2hJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX+vJzJfvIjcWH
 iepkQdyT9ctWv0o4CL1uVGoHNOpQP0poBKBnDyx9kDkdAjtzpXliPDKbfhAgNUnD5+V6RTabVBL
 thX9XNNOHueCTcqVjPLDIiJdk9vvTSo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX8q8qCpgMuIuK
 toGiC/5zWwCRR4HekfvmW+xO+8V/YF2d2gIlJpLzuyXCv3XFGeXAtNM1UntAo15FkovvmWWxdDS
 rApxIc4YU1R7S3CW4onurhjwo3wRRd6xCks/3iO8fZPVhdzSzY2YPE3xwIq46X8PzniS9VQIFw7
 KMmweUjIVsMYsGxTDSZ5Mk6a/yKB1VRc6ioKDFSbjmOXtrMQ5hBJNAN6gCCa+Tjn9wmPBZCLvBG
 1jUwvF7RGgJQs8w2++9OKe4TTtjTRQbuWF3vN8EiDaf3to0divD2Mpe/oAACUDS2hiADTNZmdie
 serWQCDYvPY06/QTwzCO4J6eNA/lyQRJfJi6lM5jw89aSFlHfgprjDLH2YG0gwSy9UdOds9awgi
 xnM18Vb08Zw1xHqlCFhWX0YMV2jNvat8h6w5T0J0grHIxrWEi38xHsU0BYciON5sahSluQ2x/VE
 Cz5fSoSCFfaJoc26mVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

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

