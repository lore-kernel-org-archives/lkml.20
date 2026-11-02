Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604734;
	b=dltBrz4DE5Zjr67XauVtzOe7lQWv1WwblQONVO0lgCiluvRkzYjQijPkYXmSgeIkO04u
	 A66XtFwI1cdAhgfCNC1igDjapH/datEavKeTvCpxBGrXDJKdrSez48SOOL1BBn6oMDkAx
	 sqaYLx/7mUYvUj0A1io4yIw45MlfvtxGzlJjAD2sb0zoIqjVzgjq39JMdmJ/UxOBo6ZUx
	 waNiQJ6/1Y/vlPkuwLxBBuaPw2J3P4prPn3A5uHsOgCu1Jyxb3N+NFC8RIm+RenNtdK9r
	 yL1YW+awJh+3rmGQkls2DfpfVnT3cC9HD9jpnGFIcaD2dUb/X2isLLm42/TqETsj9Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604734;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
	b=YjcKCKuAHD0kQYlQJ304fxJ3J08SQ4WgfMQTktngW0ttAio29k64fQNumjNca6snu0ef
	 ZauZRLN4HeWA3ydtZZbQ4fuXRarWWYxx8RVvKdv9SP/yUtTqsiEch0yPfpXoercafuSzw
	 2d2NNWcSM3qWkyIs0+43aGjrnbWYiWqoIoSyr8tXlwlbWpb+wuY6aFJKzCz/zNo9t/1h4
	 fgTAKpCh1wKAsayoH03F1OkAUuEMOlaffqaFjA+LdYmhsPGZOu8tG+yW24Hj4pJkX/TSo
	 baQ7BqOrQdPlSoAnxv1BdmFsE7sZWH0KLlLxxpVo01D6hxrJMZa1lDz1opVXt3PEPdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlZcZHBn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nn4kyz2D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAEF606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAAEF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlZcZHBn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nn4kyz2D
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24w5n31262130
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 07:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=; b=JlZcZHBnYVF9GeA2
	8p1OtVdC9+8fuWyNSfFzTA3ncvHWrtZ0zIFm6DuhxWD1w6mfws+bVF7hp4Ufc4Dc
	rTypKhBbdBadyXrLdrU1/q8MJ3EuTT1qTdudmHnQAsA6YcMO1yy/HI+uLj9IEMDN
	QAZurUkLd1OrqR3NfdWEExNGY13FBQ6MWUl7+DJi8Ba5Th6Ct80N6OR6z8XOlSFj
	qCm5SG/GGDMJew8AQ12QAyRmOB4X5VPIGun/KkXGDCfsMVawr3CEvNrxUoVnBxGc
	7712yvVHFeZ5bUL3d3zXx0HspBMtDlGlF/Cxy/oibzNX0eeTZ8YxUbOd7LHUGRD7
	gSgC7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4ggbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:32:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eb361b86dcso16295215ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604732; x=1794209532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=Nn4kyz2DCWuXB/c582IydAPYwMBnmrDmmYf0Ceg9wtJ94pdv7Wbxqi6ZzlyZmMHBBc
         9MF9eMIEuuBr7gBe8/G+bX7A2L3F9FuADOCCJdiLytcqnEdu381ekKlSyScufEn9VmFd
         0OH8+vV3UhHS+SqskkdfXv2Wba30Ou2+u5inpMoqkuqC91/432U6d4w0XXjbUkfsj3Ob
         RpopuCBPxrBsv5fDpLd2YzXtKVDBpV2zsFVQ64F3Dwg+O0oPolrBSkVclEGCQufinLIp
         B6EcUPbLnWbOTDlfnLdQRclDM7SIrkw0D2TTrOUy1P3qligfheTQcQrwtX2EC7vKY361
         f7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604732; x=1794209532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=FtBcdXGpKbR+8nJgk9uah13Qhhu/Fl08a+f9g9r1aAVvrl04ji4/2c2meL5j8vuoCG
         t1BXPi0dnfGVkKND+Ka4VgSjhgWnu+2ORpI4W7yQpKhW/wqjnt0oDp83lyEgQYW5I7Sx
         udDY5F+Onc2POT9yQp7Cli5UXs01pQfBiKDvsYH7KjdNj3YLnk1QZFw72gOFZ+sCY4+Y
         jygL+5V+XrvBoQT56dXv7k0c+4JhjiLT02Sw8OCheg3YoIT70XnwD+SWAVW2O0wE2wJ5
         4JZ+HNJt78Ydv//nRjW2vFmqRDJJkheC401pQmqF5c+g2auy1ExGPChDVn+gveiqIog1
         Kixg==
X-Forwarded-Encrypted: i=1; AKwUvBzHXhrV6SPUEUrjcKmYO4gL1hDPWy8Nl7OAyaiMyCkSUWh5FogJhSGqyMMdNK9T7ltabxsjj39Y0GHOtWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bfnK1PnAgZqpHPvq4njtK0PsIZ1RUp5qVIOWLl65PXONVPiI+
	cFMI9KM62+BHMDYnmwuzijUPc4f9RjaO6sZic3BMhVWYtIfkamqFZtWPfKqIs2DLaTn39NHQeqr
	B/bjV+Qnu+Vi5+hjKhzOTm2ubDiTqNpJmkQupELIg3p2WqPn2hg0JigFLPWbR2jvcdDU=
X-Gm-Gg: AYBFou1upcNhQBuQd44S7k161Has3QGVwmDQ7APaBfJVxnEil9qtvrGxmjC/2cyW4pE
	uR8F0GEi38bO65c93fb4qlhGqYWPnDX+omDQL+Ju01B8ddeoCCJ1RgGb3e9YBjIQ0EqUgd70LOd
	q1ndb6vbQUivN+KKM6m50O/0YF8ThPf/owQocNH2rYNCOKXacbgrl6OfjB7AXj/34NfvR84M1Wz
	PKpLKKdXrKlgfu8T6BFRSXxms/MkYugYikQ2Byr+qTwI+gE8Lq3HOuNcjKi4nvWMQbnsnrqtb50
	HcEWul6KGMTTeNnwcbdtGUferoCJSiQ+URptee7aPrHk8k5Pcr4Pq9o6ddwoO2O/8jp33BZG8/6
	D/y8pdr5niOuTZjQlTMw1T7hm5g5mk6MLa5vm7JmW1siEyKFaiY6QgI6E+4LFUbPar7oD1UzEaZ
	/TqdRo
X-Received: by 2002:a17:902:d50a:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb3648bb2amr87352045ad.18.1793604732245;
        Sun, 01 Nov 2026 23:32:12 -0800 (PST)
X-Received: by 2002:a17:902:d50a:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb3648bb2amr87351735ad.18.1793604731764;
        Sun, 01 Nov 2026 23:32:11 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:11 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:34 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare
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
Message-Id: <20261102-lyra-display-upstream-post-v3-4-7f660c3b622c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3607;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ep0DWydVmKj6o+MB54eb4vl9AakC4YjRhLn758mEY0w=;
 b=VLid4p+cOMuzaN+XR84jqTFFsdpcmhmMe/PF5bm2EuqoYZ3OZao77ehvpHeGJotoRMaycLjTo
 DyfAp+WLPCqA73b8lRyA3GjCp0X33v2irTJrya/+e9XPvLcuHFzOS7D
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: UWpUunkKX4GoilB2OYUk5nqJ-74py-6D
X-Proofpoint-GUID: UWpUunkKX4GoilB2OYUk5nqJ-74py-6D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXw5cGA/V0xX36
 Os0F6B0gsmNgbFTQteyt2QPLV5ZjieIMbUECLZna9K/c8HwE8cOX45IIeZTxKE1/EI75AF5VjkT
 Bp51qcTfmdokk1El1T3BnjLaJFKi/OE=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae83c7c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CsxVdn2IL-oTZ3OAgFMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXyXvnzsEOa/18
 E5L8HjU3A0SDnwkmMPahRMKwR3j7RB1JI6f/TReBPItbjsc87yS4dDktFADIeQy9Z1F09ltH6Fm
 ZnekEGIyaaUNBacSEcMnb0aT05B8lhq9Yf+98Se/UHQrL1vdMgCY+waFVxSf46jnNWzX0+s0OGB
 i7ykspDlHZiADwbCp7FZCh5AtHi+5wrMY/oMr/b46k0WAjV+pVGEPOua0rONOHl+Ex7/5vZJztV
 7DLbgdLACSydt8GI74AUiFM3gVdX2oTzDyKsR3QzIiS3dfFZcPvnqna4GwV4mLXV/2qV5R3qN2Z
 WuFfu7J0RSccLF+xmBd0i748//4VpFj1ltJwUNejsp12LWD+6wzRjE5QjuM4zPjBHJG/hFJHZg7
 sHpW1/ZkQZzA3t+LPaUVucb4grFySNR0/1Ok/w2g+sHNUyEweFD2o4X5nqwR9SG8o3X/x8Ph361
 w0JrFpgEB9pKPIMf6/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

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

