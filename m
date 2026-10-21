Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592559;
	b=kdzVOiGNvBzJcom+ywyPDtbj6/xqQmDH6nLYGxDtaEmiiwHvGhBtekBoJgSljOlFe8JG
	 6gzeyBObsbHfYeVHNRi9UUwhlvzeyy1guHK3Y5YWXj1u1PCdo3/qsApXq1aYQyiMYOtea
	 BgEKNiPII+ZQTSZPL/YV1YZNG/EgpOcAU2MwQKmMvPg/aGudWNkEIRr/ePfnmAKj+YOjS
	 LrtSV1zgc8rFydsCNmTnRxrKyOIjFKmwxfhqHsToiXH4D1FQCdotlifkX7SgyRieiGdBx
	 fEtbV9ENCym3ERlfBU/YEnRDaD3Zn1WmLhfKZf5LufQusXNXgrvbEvMwX97YBxFyC+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592559;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e3dL9uTkc6EWmdkUwWGzaHGP3/aR2VFgtn/iK0yNyYs=;
	b=rhHW6sA8KfMEc+PT0+J2fsm3N7QqfCZ8kxnUPbzs/+BbUqxZI7Be+mgDabmKCVbvLYMW
	 oqSz6eZwoNMyhwON+mGFZjZae3OwfwcBJV5Uzyu63g1f1//rOd8lrhyAlFVR78hnvky4I
	 52hG3nejk5aDH2VwtQRmVcDNuKQLlq4GvgrxtOneH5DhjqY6IILDsBYq/BxgxsjrWNeT8
	 a3foOwG69wTbsjG3gaosFq9iwrQcwyx4074ls/TXYapNsizvsiXVcMAy51gfcoDtWdbKn
	 pxWr7BQcEfduRO0DlX3SniXuK9TxeleAGdC4n9a6SyqQiauUxk4mc+/0nZWE+Y24cog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHtg4h9j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+k3EKQo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54874606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54874606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHtg4h9j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+k3EKQo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF7Oo1389740
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3dL9uTkc6EWmdkUwWGzaHGP3/aR2VFgtn/iK0yNyYs=; b=aHtg4h9jPUy85u47
	Mz5ILS1BosjBZbw0KYqZ1opBPpkpdYX848GwIxikzS+GZzprJsP1IaqN+TPN230B
	/vKMeeWfLee7k13RtJJtuEoiyzJPYwfiYqvTE8d/CEAZ2giu36ttkB1Dd1uTuOkh
	sRvJbKvTvIwOw0XXAaGiGPlcECRetB1hMBNtnSBtnNpUVDcvM5XQjZL/KUt7SYn1
	NsP1W6a6KyPDl1aWofKXsQ4d+bBkXFMo0mywhOX63DufvgRTN/Jmpd8e6T8SyyzR
	iboBlwFqdEOXS/U5EXJO2rl/cl4dCYKj4lHFEreHNsEeaNcpRvWyr85/bEXYIn8f
	u9ztIQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajmadt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:22:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35935fae332so78444eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592555; x=1793197355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3dL9uTkc6EWmdkUwWGzaHGP3/aR2VFgtn/iK0yNyYs=;
        b=A+k3EKQo7Sz/B+Qg1tmT0tzksU37oabWlKPuGSgAYRGLSYMwTImvkpj8NzfpGFw2EY
         RZWOLVFpALbNejgK4tTruOArrzMrZR1RY3fAWtO8pKXEvzn7azxPlClDT93dc45/33BU
         I4hYaxTQSGRAGyILKu566qEx4XMjNgfJPlEpvtpqptaalOt+UiksqhfLZIU3omyI5ve5
         Ch9anYp4PlaP86BesH69DV67h7G/Q1MHUzkCHgRvGUSc+TGe6HTNzPm8BORvVBMKPfwB
         vFQiwz8FViruZIl5oJKpvbJ+bLDZCJfnW4LyJoc9S16Z7VEBYZeZa/9wVoZyLZA6PqM8
         zJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592555; x=1793197355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3dL9uTkc6EWmdkUwWGzaHGP3/aR2VFgtn/iK0yNyYs=;
        b=OQPNXgjKrsbHICB0dNVgJasb0r0veG+3PN/ndyY/3HDdq9oTr1TqIkeTmRuPw/Ex7F
         to20M4UNlRgbZrSc0AEIT5kpuYIWjkJ7G9PU0/8MlR3HImnYrMNZG/vcv7Mx4roq4Y4T
         tRKUowEKZ6QXPC9wOhtb3HwKwypJpGUMu5CBeNL0hoFMlT1IQhnbJdMYK1v6ImX7YhoE
         mzPVv9GF+ORKndXWVtGV7/LUp24+M9tisO4RmQLk7cS/GKtfIPgS050QFL8zNENHoXFo
         U3wpp3kYUofxRiNOfR5On9gPp4TDXEcOm+AMPmzEM8bgH7N3/nI7g7ptZm9rPKXbSj/N
         dYBg==
X-Forwarded-Encrypted: i=1; AKwUvBwlVHZaoANhVo8JUPFvFUnFTZOcyHILGYQfO+p9xYMJhXNXKPfg9r924lnVJq70gQ39UGTk1dpVsxSEtDs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaiFjbTW3igRdZ0xxnUXp8aKEGKtneEBMcFdur0rmlTH1z2i8k
	cWcqKlqiWGlk6Lk08kTl/0zgEk5S8GeCmfn4y4w1N97dCyIDSu8SHh9YQcEUKIxu3/5dVUvw//G
	zrSFQ1v0YSwT2C4ajRGWub1KBgtUjDgUKzx6ETGNRMk+iEaM10ibaaTCajRg2E9yqz58=
X-Gm-Gg: AYBFou3meEyn63gF9be+tejCBjagni1qaB9577k9YoE7aCGB/YDQtC0SlBadilcpGqU
	oBAmSoskb23eMTE/HzdnBroK7NsRQ3Ed0dXGHKBPuQTKrHyw2MeYd02lh733X/DZUq+4yM09Q0l
	QhdEqrBY2CH9BEdeeP5kJjKwaII7NBB+S0yYOXzmkHOs9C28JByjn6ydeSbgmGB6fXbLrOcaVPf
	nURGbkqBdoaSGYI6g+ZpyyehQPd48dNGFvDvMlhRuSZhV2QrS/sm4pPX7fr8Zcs0fiCfqZUmY1/
	G3F3HNHYq0NIPmoBxQCjm6PtKcpSxTMOUmZ1EmDMVbYpfRVe2wnvPjhIsoXwrfLUnD3oAE9SEaz
	iRGEMr4WV8QJo6XxuRV3AXmiJHhw6TAt6665RmrTdoibM+uGC25bk1BHht9of6H4w5LHU5Q1EQf
	x1xuiZwpxnk8KY/7l598849VBovUEm/zpcBDHfN7q9wPMuiAncPXY=
X-Received: by 2002:a05:701b:4301:b0:190:e602:c769 with SMTP id a92af1059eb24-190e602c831mr3705970c88.1.1792592555074;
        Wed, 21 Oct 2026 07:22:35 -0700 (PDT)
X-Received: by 2002:a05:701b:4301:b0:190:e602:c769 with SMTP id a92af1059eb24-190e602c831mr3703951c88.1.1792592532053;
        Wed, 21 Oct 2026 07:22:12 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:11 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:51:45 +0530
Subject: [PATCH 2/7] arm64: dts: qcom: shikra-iqs-evk: Add DLC0697 panel
 overlay
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
Message-Id: <20261021-shikra_display_overlays-v1-2-adaea735999f@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3273;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=1SdHP9LACk0zrDPfvaQwBE6ZycQteOiJa836MOYqgp0=;
 b=I4yujSDJotRgm+XlQ0DTv2AC5PGAmrmvjGab61NjGbGkJKrrIzD8JOlrVeoR1yQNj3qUQtwzd
 0+7enpsLH3VDLkmY1Ald/kXDlrFtl4hpiMJ3r5rFY57KPmt5oNphk7M
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX8qAEbirvFHNb
 I2lPybhGcMjUM/vkOX1ETw7C+ZG3Z2pSGhDeHMHEcxwjeUtdd9yUJIR9GadGqzDeTo6YoCGaamS
 MNF2ZqASqKkTXBXiO0w5W18bDV7YDy/YoufB3NocIKl7eDo7rmFQzp0Qc06m0JueebECJDXXiGo
 FX8HHNCd798lwkKxKh0hMmf7/eZxvtFaQ9RLGRZ9/p4IDOsdIulgg+T+tTWOh/hc5NzD9/S/YUj
 pPISbNbDxnnuUlhzmpRhNZ/F7cW9mNiTtm6f8sAlUWoNhTyuvUcEki9QK+lJNqj9vDD/PmCYzBa
 Wcp1VLV1AFUrApYrpAtPCkBzhVlrizTZbfHNQwbjX9jDilNtbrJHnAFTc06D24eD+r8r6wmtKCj
 WKcD+EIH3eTALAk2vcKvaLCfDpz5ittOBgm9V8yAJziAEe4F1Cd0cdwVjAt7mwHH7p0LQy5ZoSR
 ANLVgwW3M6FF7Tx6/0g==
X-Proofpoint-GUID: CQnsFYpu0Og8ApNbfBQ9_0g7hff8X_fM
X-Proofpoint-ORIG-GUID: CQnsFYpu0Og8ApNbfBQ9_0g7hff8X_fM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX+Z+JheTR5ok0
 qSEdeqlMdNxS6ciYChpxhJZIs776UDBM3coWtK4Y4ewLKRBxxUM/iN/VboAs0xwPZJJdUx69o2Z
 bJUhggNZr/8m0gbM0+pLQbsv/W1uePs=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8caae cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=P5YriGW4VMDCbuAXzasA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

Add a DT overlay for IQS, to enable DLC0697 panel when DLC daughter card
connected to PDISP1 DSI0 on carrier card.
Configure DLC0697 reset GPIO, supplies, pinctrl states and GPIO backlight
controlled through PM8150 GPIO 1.

Disable the default HDMI bridge and connector in favour of the DSI
panel.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso    | 78 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index c8907e77c893..0c5a7b7f694b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -380,9 +380,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 
 shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
+shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso
new file mode 100644
index 000000000000..2542abe59d34
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-dlc-panel.dtso
@@ -0,0 +1,78 @@
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
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK DLC Panel";
+
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
+		default-on;
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
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+		backlight = <&backlight>;
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		vddi-supply = <&pm8150_l15>;
+		avdd-supply = <&vreg_disp_3p3>;
+		avee-supply = <&vreg_disp_3p3>;
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
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
+
+&tlmm {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.34.1

