Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592531;
	b=PZJbe6rColRVDwS+TLW+6GgRu97OYMtmLSCKg8fLc9GImc/zyghWHqYS/Bk+oyLERSl4
	 zBiDUz0GpPN3HDfweDQn82/tNV+woR5M+9gRpqIYMMg1R4aNcFMZHqTGp0CzzTohJKg9b
	 VfIqRwSHOz3pY1GDy4+krLYPapUafwJgMwTidZGb2+sNRdOCckjt7jkv4T6zrBdla1ALw
	 GDs4lEXnITQBX5xydIKHkRlvyy+Ym5xhhFZrXloVoXgby2YqPZPG2lt5NCqPnnB6U2bOu
	 4yQz93Iy1jy+FTSo8c6mJEOHK5XwDsnsZu+kCO5pg6nHSjXbQkd+Q3H8TorRllKXwqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=;
	b=oYIw4M28kq+zCk2PO7cTwfDJIr4n2jLAl6FLUfyq72LPiIH8iKF+hkiySXXq+96CHq4h
	 dK91Vio3bZe6wl2P1bMwcWMzLUKe6OG4PF/nPEf1pkRreXmwgZMcv1NffcnSOP4ylTF6x
	 7cFywGSGrPgV2u/URL4HlnnsqbZZSidNLRMaS4rHTR/+WF8NIJliM2i7T3gLHdqO8m5Tp
	 4e7zwWotaUq4lTmEFsvn9pRXvbXzrnxPwGVtCFbO1KQe5nVgOnula0R2XBQOzPc2GKqkQ
	 HI7BXnBxx+MKq98Icf6ES+dKLO7m9UtYW1O8x6TW/YkJH2vKJ2Yir2M93kHERx4IR5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzZVXZtl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="V//zCz1P";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F553606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F553606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzZVXZtl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V//zCz1P
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEGiYg3997240
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=; b=PzZVXZtl04DVgplZ
	kUqg5vamYY66wvnO9Br3zhrGL8JBMeOq1xXkW5fapBtOdLlmN2jS0RYLJRMcLFAc
	gihwnwVsWAX8mRlr/GkmxMvfzgBcvZYK9Gxggt3a/oOIci0gDcx6nyHHXJZAVqGV
	lMy56M5f6cpza4eYLl2rsD7oqBzEe8tk+KyRmw02iqbv+4DdKhoCPLyIc4jPbNjg
	eJMtZAoh9v48OdA8X7abIrvAiZz7+Gz9YLfBsjLRAJlYSC4W18G7apHC4TG2nRaI
	x5DO9pYU7GLRBNbvv4MprNE7+VaN5P+RyLHwJIzGdQuUNGbSggkilIT1Mee75M3l
	9JE4GA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q88k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-361c38aa269so91350eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592528; x=1793197328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=;
        b=V//zCz1PwVMo67ZDCPJFRiO8pN1/1edMhCrGseoPs+ZCA9Jrhk3+wx9bVKGi76Mekd
         9SSxgnhM0twtpPyfEoNkcU6y7icWpaqMdE9+ETVNlXQYGmpfsRACAUez8ligX5lUDtZB
         L/UoQmFOR3nq+LcfGjW7FHl0b2bno0uYIS5z3gVDus5UTq9nBRVdCmjaKrRqnDWPZE8a
         sne4qyYzUhzdnbUoTmosOwgr9zaRH/WK1Ons1IPRIal9LBhe2e19Vm2ilkXtCeppBqBK
         Ii5bU/6GLmi5NMgWT+vgPb7S5IOXfMJNeLxVwFbhRYkSv5SFGEy+pnjujT7/j9XI/Ica
         dYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592528; x=1793197328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=;
        b=S1krOg9dD1ykB4nmBKZIwqwvYMkZyJytTF9dF1sdeyc5xdzlwZiwCBmtle5B21FV2N
         v6+QBvpTvCJde/WQshe2LkPBgssL15DXtcceXuhBsqWU31TJwDS1gtusI1TOtrHFP1k+
         HlP6muff3uoFSRkBWmwknwTwEliwHnl4yOX5KPSu+5V5w0tfUNDWWAZr68FbR9OrNEQt
         /veMGBggIUn+hjt6e+a7ZDeaDkQ+XXfF4ibnNglzxmZGFp349NvIMaE9xxVWmtKvmTUy
         +2QLWmNRVfbXuua7QDMqQ0vNSCMzlXOJ9cpe6jiCc7u3vwurjae5MCW1rWDzD+Ievu8F
         ePEA==
X-Forwarded-Encrypted: i=1; AKwUvBw66lmHAEPAzaFD1JLRebzLoIcbbwipt84eWy1FaItS1d1yrD6+K1qHPyMgbwiymdbN5ygp1LclTXrbRRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdYrFbV3KV3sQu/S8Ga62lQwpnOxn2ONH8RDMagArEZa/grE7z
	DIj/r/q0L9WproKrCGavcMBRpwLCosxEaAfKk/uwZZwXFICR55GyUTfQ8oMXgnDgoC4CGH2ATCr
	05viBVXbsf021Lrgvc0P5HbjeKmH3EAoCzl0MgpITgNCGUbDK2/5oIa0vp9cq05BGn30=
X-Gm-Gg: AYBFou07s423w9YRxrBqXjps/Y9EBlQPrVpKbKIYrgJjpVOjaPBzBnW4F2EJvOluBuq
	jnORsOVp/1vUEUWm+O6gbbTCtBI/1X/Tfe9Eihy7ZzFjRMXx4wYYvrkqoeTtgrI3xPeqjx8w5Ax
	21KvXRpiqG8pxmX7Gmk+7K1WL/x0/yTQX5StHj6FZZKfdnV6NmQswFfl7HWZrfnzCv7ndp1tX2i
	KjaDZNJKHdyxwOwhBAdXnQTjiV20qmmCL8L6ss3cOQ0VnmF2Uh5sYzi7MmLmHBh0IvgaMaYk+sw
	Fn6V/bUFn5KxxmYIWValxjlIIo/gql8OmQSP79yeitwz2moMBKwD7b523KX81CfBw7uwG+IeFo7
	X7/0gdbty0BfJ5Ku4ITGmqmeb3lyFoenmMI48VuVmLGmr9ynNseU9mwrL/gWTcMmBQro/wnYCTw
	gXNNW1jc3WcRT/jqHVQM0062TmiMsk/pIvycpoz1eVqc20h3KJsTY=
X-Received: by 2002:a05:7301:1a18:b0:351:7883:bf47 with SMTP id 5a478bee46e88-367473c9a92mr4748597eec.0.1792592527520;
        Wed, 21 Oct 2026 07:22:07 -0700 (PDT)
X-Received: by 2002:a05:7301:1a18:b0:351:7883:bf47 with SMTP id 5a478bee46e88-367473c9a92mr4748548eec.0.1792592526795;
        Wed, 21 Oct 2026 07:22:06 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:06 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:44 +0530
Subject: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk: Add
 HDMI overlay
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
Message-Id: <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
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
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3537;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=/cz9M5Mfy75zJF1P+GNbj7Mi9SYwOuHONvPOWhiMRBE=;
 b=kwifF9WcjORAuMnoI9aoon6ipo8Iz1mgElJsn6gltsHFBKq1IQQpnKarDVFKjV7aqjIPiK01m
 T3LfXaU9EAeD/HbXA3oBnHSJGOae+cZ6wnqpUWFpsVgYmLR7l3qKguj
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX93vL42khmDsn
 0bY9S3KVRZPQQ+MLGP8b/if0sm8CgsPO3HGHl1pkDebRdWfITECt44pMKzG/NawBlj7ukDPuyDs
 ivtg/EaHl8VrBT33N0FCaZ/S8PXdMiA=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8ca91 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=U5hq_iVO10ORy946Z-kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: lcoyJ4qie9ZvH3Zcpr9PsX5kyIpia_Al
X-Proofpoint-ORIG-GUID: lcoyJ4qie9ZvH3Zcpr9PsX5kyIpia_Al
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX7tf79l74x+EF
 be7OUkOh7vSQ43RNMA2xLQvExbIKhwtiN9crYu8ROHn9LKMz3SsebBMWoqxjo1+pDbbVqhgllDe
 ZasyE+x7AzFV7YNA6Gk1GyEJTPBxS5C7/QN9kUYlaCqQnl5XUH3v6bpn/nOgPzDCSPKk7QOewWC
 dffZEm1JrdIPZmBH3GCt4ZcMGcIRtqEtbL2KNT3bU09dJJAKFFXnO8QHRP0KQlutCwFP5ZCLeQ8
 bIeYoWhe4B+3Phzm+Ofs9FDmylmZC5dDMYS9GBxEaa0VwP3PLSgovyxTNag+1AXuTXhXQnLHiPO
 ZqY0ZUK4cjXrcqvJJYGVaLp/TbrGBlPYyNwwFMtTwvfaNQWrpkvhYNEYz+NiGwRXSnLlyvnYjt3
 QUB6yC6ARP+GBheLqp0CpMTbgw0Ebj99m69SPCqrczr3JgKX7aDFO0xD0yj5lLb1UBqFNJJ1j1u
 TjmVjiaOUYjORynb4cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210057

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add a DT overlay for CQM and CQS, to enable HDMI output when LT9611UXD
DSI-to-HDMI daughter card connected to PDISP1 DSI0 on carrier card.
LT9611UXD is connected through I2C4, with reset and interrupt connected
to tlmm GPIO76 and GPIO85.

Disable the default DSI0 panel dt nodes and enable LT9611UXD
bridge for HDMI output.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso     | 90 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4e714251d5e6..c8907e77c893 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -377,6 +377,12 @@ shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-ca
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
+
+shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
+shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso
new file mode 100644
index 000000000000..a7b77114061a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso
@@ -0,0 +1,90 @@
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
+	model = "Qualcomm Technologies, Inc. Shikra CQM/S EVK HDMI";
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&lcd_bias>;
+		vdd-supply = <&pm4125_l15>;
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
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0 {
+	panel@0 {
+		status = "disabled";
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+};
+
+&tlmm {
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

