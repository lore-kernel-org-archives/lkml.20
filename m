Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595873;
	b=dQnYydtSaWtFpIvOWlNQ1oN1YqGQc8cb7fCj72+HbvxLZu8YzM4PrPt2Si+CzHR5nOSL
	 Iug9mVuF4WUnDxzbxtElwfDQlgZacpjOf1Hn5FbMNQRVNDnM1JWbGB9oznsJ7aiJmd2aR
	 nFPLMmGxbp+lJbT8/tIWWqVms/Ctk94IdIyz9IxODAHZsGKPhg7tAlEV9iFl0TK9+9fY3
	 HY0H16vEsIgzrsQqWwnl1tpRFiVUVYkLZaM9eA2CG3S/ofW9ckucUoW2EDrk5xLoweVNl
	 1EcoJk9eugrOOiGKoqqyjChtES9VhfCv7u5mhDL3XjajKqp87ggiCuIHDoG2HofARIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f8mvLjpFiKhwACxuZd2mTQLn0cM29FEZO9k1hGlfJGs=;
	b=ggVWoNQWqHN3MxcQU59rGopHqlwf+BJtKtbGELin4n7X4WfpgIcKLYzBUHrjtTNOboNc
	 nZv9NaumvDifBGgui+FMFkpSUn45tVbwJCkvxvX6fqqs9AxkLWLWgKzeKSVdC24sQhi5A
	 zr5CR3uV2iQF7zRpI/hukgbJ/awMqF2mfSiSG0kMNRpRjHEHGkWoamYo6Q2FuzpAA1ELP
	 QrJLqZf5sAABP1BnNBi66FQokFcYc3zDADkDJ9IjuKsRmRE01hSZhuwYDVSX57woA3hDE
	 DhoivAbJkXM2Wg3tUyeEq7wEJE06ylTdb/1aqyWW1ujxdrr8XvZwg5pMztIWnUX6XZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWXF9kr8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nvk2RYK8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953A6606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 953A6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWXF9kr8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nvk2RYK8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF7E31389747
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8mvLjpFiKhwACxuZd2mTQLn0cM29FEZO9k1hGlfJGs=; b=nWXF9kr8oA+yTivr
	ma2U2CZJpKddsci5ooepMzRHyby+gr/A1tOBKAnuLnS/9Vtt/Z43ngxytZyD/K7x
	Kvv9kHFlpLAFmxweu5Twoe8MOWBjYJB913Js4l5yLp82+Hy7qM1Q/BtiqvEupAMP
	C3dY2rSZ99ieoXIFfHvEfLjRQxfSSZ5Ube+2YzJmj+R55zi+CnN6Jj8pE4oo6rRJ
	b+rP5AjEvEnlq4/Oa9Ttms1BNHdZKnoAawvcNMHOfgDnXviq/y2N6FbwY2yNnzOk
	iqsfm12Dsp+l2WxvtW5hr6NVp1JR2bvSJFLY5T8O5t29UYcvk28R5fg4tVOre24E
	cfCUxA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajmkqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:17:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c902e0da2so2538971eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595868; x=1793200668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8mvLjpFiKhwACxuZd2mTQLn0cM29FEZO9k1hGlfJGs=;
        b=Nvk2RYK8JrFUSivVekM4IHwNpXrvae9I4hRpIcqhy70N7C6bA7vqnhcJS9eBXGavKp
         hrAw2J20IX6tMS894h1J2ext7uJPRLd38tpVl8WCALuTZvSFxlX+W9lyHBgwXMAIN4bH
         sU72+Cp7B7TByBFb3gjzizK1L/kRDOpKt2xBp8FC4tStPmNfpYJIxIuhp5YkOzK+xLYB
         6z1BxSW8W7COiyS2vi09q4s4XgDHceNhoJVzIr01wlV8OpJl8F9QI7Q/KEbS8F9Jb9tg
         uFkuIqh0eYBgRYyhlL/iQ9tmV+se8CGQYxUnsU1TqVloNBvcBbYMeZ2qwsaSIkuDjG80
         x0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595868; x=1793200668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8mvLjpFiKhwACxuZd2mTQLn0cM29FEZO9k1hGlfJGs=;
        b=JFTPr4j7w93aXuq/h/AsJYslbk97uycUwo7128Pr5qgFHc/4AOGmIutrfGNHTeQPdl
         yt2ZPjaunLTxtJ9+aTlnyO7Lqo5lnp7+7V6O51fdGJTaJhuTJ4kQZZPdPxVi7koX22dT
         XLT9XqJAfFU1WL7d67oGj7VXLCW+zFk3QNv1hPkpCRYqrUkyy47jfJINLu4KecmeKGPV
         IwMRTOE4bAxpWaoHAd9N7VhDbyHuFUj+gMNhPEi0HYJBgd+SqQAFP6SIPYJy55XNNZ73
         oXQDCJGpBnzZfKuU/YCxKeB5YqW7ReoTokinyXezhruMLDJ9pjPm4bvMgmQyhAqnQucK
         Ql2A==
X-Forwarded-Encrypted: i=1; AKwUvBwcBRl9LLuNCELd83d81CrNZC4Y4wOZcy+15TlzCjvIYFeO1tGwrgCEJynhKs5xcC/CnJJu2LpnsHV9zXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRV+fcnT3MH7izZFCOZOEAirXuUbMa35bajSjO1Ouq9czBu0z7
	g0mwxSfeZMjXm9YbsQefCj3BYmGE3l+LepkWRs4MjkUqjdqjjHCBp0n2Ob09dpUmbz0bEz4uhM+
	fdOffmiWiTZjWGSxAUYE9Jm6gsEBnTfW1AP4bmZExIS6b2wHVfqWgbDed076UT6EcKwzEXJ1h8m
	E=
X-Gm-Gg: AYBFou2/hm8elxNuXSwIE343OmisQ9MxmSKlofO72FPbsA0uoMSuegyYtTBJdXnPw3h
	m5hBj4egfO8AiuuhknMfpcDXcTa/kWXYMLC2bf9JN1syVfSCg/cXowM+2rRI73s/AoPk9WJg5ts
	J7Be8VrbSkw9sTvmflyhPKZ4v85emfja0p/MjLBfhnalmDTl4kQ58+bzkZhr/P0rPGWkelR6P98
	DBhjjppqrUEcHyNLKXoUnzLW54uCt/A3Feb2whelVpMsJy6bfWVTH/oXaYnZrIDwe6Q51XtuBm2
	jtdHpB3eKON4T7MhPPWULX/Qf2ZdWfdD5NrSI50VpKNH9epL53S0+Ecc0sV4JuW4NVqplpOeBvl
	UJ/fccKrrnupkg4zS0r9uDglQ1X6KIfn7
X-Received: by 2002:a05:701b:4584:b0:16f:1e21:7006 with SMTP id a92af1059eb24-18db7b92510mr5455195c88.1.1792595867751;
        Wed, 21 Oct 2026 08:17:47 -0700 (PDT)
X-Received: by 2002:a05:701b:4584:b0:16f:1e21:7006 with SMTP id a92af1059eb24-18db7b92510mr5455159c88.1.1792595867028;
        Wed, 21 Oct 2026 08:17:47 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:46 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:26 +0530
Subject: [PATCH 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
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
Message-Id: <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
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
        venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3288;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ZudYNg8CD4HxKYEgSogCRb90bBVYSkxfqgXqPZwCo5M=;
 b=bsghKEbvyz7ciKB69n4zn4S3dYWFuw4gUQpzl2GH+AeVLRoGDiifcMZtjAVE8Z7A0J8EQ0JHs
 sh4OP5cl7HHAHznOX7sc3a+KBwY14XiLtyzfBGmdIhmougfgMgvhWsk
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX9qksqheOC7Sk
 S5PLhz2W7/2iKOVCI4XiQeNu41eP7lkanI+PbpS1M9w9A88IytgXMQdm/RaMN4lUoWC7MNkyrp5
 FTPSgJKgsk73p3Qbcb+FvKWseD0Lx/BQAOlUsaxuU/BJ68maHygrB+nQAfJUBs2QvWpnCD5JxCZ
 XtzTCxZdHEt6jWTVNGDlURODvU8jc4xQlSkm46+omgxYy9wcXJ3HrScSx4nubc0dQgkSj81VsPV
 vuqP+v34JpTbE4wnRsnt5BoFH1t5HT3ufUXNtrwu6yn1R5UvyiHiJGC77W9y+lTOt5OP9gHNdxP
 +z/CI7bJbw5GuzRqhiLSsPsYwjpdJV9/087YR8Q/JELNJoVXpkQ7pOs+zYdYPdPtcZqKVvd9Dk0
 WHf6YFctryw7U8+uF+mLT/3HDLqjyKQzztB/ph5TNRqeEZ51RmHcBk2mR+NH0uoad97HxeGEXPr
 yGs1OvA51nEbMBJpQ6g==
X-Proofpoint-GUID: IguWEbJS0NSJOjlyQUPa1KI3hO1qj1gk
X-Proofpoint-ORIG-GUID: IguWEbJS0NSJOjlyQUPa1KI3hO1qj1gk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX0l7nPTp199Yx
 KZ0R5CIyepFPonnUUo7k6kxKWCZxRwqmnQ6Xx1Vh0iYVfP8B+KL8tt5b7XGTiZTjirf5bK9aoTe
 ZigPxHdK4TakzC16BbeCzKnH06zVOeo=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8d79f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5_l1GLVmkw0F_C9TNj4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay for Talos Lyra EVK, to enable DLC0697 panel when
DLC daughter card connected to DSI0_B2B on carrier card.

Configure DLC0697 reset GPIO, supplies, pinctrl states and GPIO
backlight controlled through TLMM GPIO 2.

Disable the default HDMI bridge and connector in favour of the DSI
panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
 .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      | 78 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4f8ca3112fed..5248b6be68f5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -476,6 +476,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
+
+talos-lyra-evk-dlc0697-dtbs := talos-lyra-evk.dtb talos-lyra-evk-dlc0697.dtbo
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtb
+dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
new file mode 100644
index 000000000000..e50bf69c7b37
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-dlc0697.dtso
@@ -0,0 +1,78 @@
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
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
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
+
+		reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+
+		vddi-supply = <&vreg_s4a>;
+		avdd-supply = <&vreg_disp_3p3>;
+		avee-supply = <&vreg_disp_3p3>;
+
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
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio98";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio118";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio118";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.55.0

