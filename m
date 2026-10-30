Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353222;
	b=d25BWeRZmVDcXpJ1FDlqppkru/w/B+5SGerTtAcidyRG+sPhPHOY7lI6A9QYq8v2UiZL
	 pZSUgfQlfaYBajsKk3v09i2aG09J5UlHt62+U7xEubU6yadBC6p7n1LwoxF2Zn58w6v4v
	 6xE1ISNFvexLBai9lB+LNmmIbHlVSgCw+luCZy5ob5OsmcabDJItwjuekvsmHIow74b3T
	 9yfkiWJrJdxFt4rtSr9IRjh1BYJcZ37/7HvAursqNm7X4CcrzI+tX8q1P0zgM6gTOkY7t
	 QUxMNPolSs41ZtStFlNx5+/gNTDxqmb9+Actloqj4X5qnpFAYX0acU3Oy1t1Hpa3e8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=;
	b=KWgL9YZ//U134RJ1c1mj2R4R4+iEOkzzvTAHlJBbHWRAekye9v5ijL44zWQTf2M17/Rb
	 1vCN/keI//PWOf/Yd6x3XE8nCV/XUhm1mEXGauYfVMfUGP+nlOsvw0bHzMQsI6aaYQ6Jg
	 XfMudGRQR9HOg8rLeOoNhVDC+BTbRqxD7PcLfspKGL3aNnjrCDaQ7HDWw3b2jWy0OvLj+
	 76oihaSeGucP1LAL00F3ASjWOoF0YuZdp1yZcViVoVxWaeHnzoKze0WNFa8pD7qn1nS7E
	 pVW6J1Qj2ufuiPyhcylI9BAoVxKQje2rCW1PM0mGA02hFn3vl8h+6sRcpmc3FQLcapQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moD8h8Tp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NSV8YMPD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB5A60A2616
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB5A60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moD8h8Tp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NSV8YMPD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F11r2682389
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=; b=moD8h8TpD3TQxju8
	t0/NdMyCXjS269zF8q7cAPEVOTitV7YmjuqFbm/i6w8lGxOSf0mg5nyGTz+o5Lir
	lW7zcY43NirFfRjFOOJIwi5cKas2IXdvRaDA9Ko/EZ0fNr3qgYXGsq2pNqFCGPfU
	fixSIdIqlgo/qekekjfGynaX2BOV39/h8nV2HLZhwtfMJFL/hgx8QlAPgm8uxn83
	mVy/4BYS8h/Fd/sz9Li3QW7R6UgI9J1N6cT7DUKcIZeCXiaV87YfzljR37oA6NSB
	ZG9Mp64b2Fq+HvpvP4MhA3rUNqEwxTQPzFLH/UmsEv86w14+Vvs8c+LDt4rUTKDl
	emgfug==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj9e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:21 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so1639690c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353221; x=1793958021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=;
        b=NSV8YMPD8r+9ZF9CrOZOmnqik9khtV5XcPm3ihNxJqQJdI+idaT5SXfZXySDMwcCnD
         4x+hGV85bm86HvAIAS060xeyO8imUQZzpPPhx6x1YFidcsFPl/nH7c/bM5rWXeqpW6og
         dCVkQINI7PERNTaypU2OxJGsHMVBZb/eO/PWGy8aSjTGMFioqTUIUtOoDj/YZGGqPp0F
         rZk6bIWInOfAq716eOp+hRHAFp2CvRxZ1SUEa4OpORo0dEDXaFEtV5rJG6HaKado3uYU
         xWXFGnds+OXtk7nxSE6bPav8U5w/VMKGLAkPRDOeNZOlQvPOoNpLvy1r/uvp1OcinDja
         a62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353221; x=1793958021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=;
        b=SZ6j5jDlGE8d0N+Ryjoq1Tkqk90zcQ4Nh6LAsJOXO7CssC5hbMJHs54vHOjYFm3CoL
         HElT03R2soSpsp8onBtrUirgCnp4E1m2IsvboVVhtlRojX30P0SU6FiRTUq7MBAzpJdo
         mpUhsxYIzc3dWnHDgsExvzGgPP4abBGfxmJ38FwJ/D/c7/rQhl0j0/fCnixZ5JXIW6dM
         zWnxzVinxgVpW5ULz0AFhhWCvtuNki1pFYYF2/98GlotIeQqsbyrY+2pf0YDv+fBGgMI
         Szcu3L9TxAaWkjfyWj4qg6WqUhGhcU+/ES7tOiW6agGlL7ovwZjk5KPxHA7NXwR22ekT
         Wcvw==
X-Forwarded-Encrypted: i=1; AKwUvBwsB74odl26lflAyAJOmp90djUrBc0GLk3fOiSS7lxA77u1X0TiR9BeM5jnZG79S5vDs1HWT7AJvEahbWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtLrYJs4RcQ1Nyt248WlR0W2S89+idj3Pk8/5x0gS5u4vfa39Q
	Z4GfrW6MKxUrOsRC2XNYvTHCwxSYWOwO8NWFMTDrUVJuI5jyh7IMRR1+60f/1FoNcHF0Q8Zlgy/
	YC2URKp9kblTYEtpIyKqE42QzcpaYSH4p+FTzfp9CZzKnhSij8zzdeRpUgRWADCb1L+A=
X-Gm-Gg: AYBFou3+X2oS2p5QuNtXfLEcHkum3KDX4eAWaqn7OsWRiDt9772lFH9DdKvXVjSUaSD
	0tHL3M321zP4QocWqZcVxEhFlPL4baMtt+f317AQSvVspEyDIyVwm5bGcEjVPTcs/NaDKRgBNl5
	AGF2uaEPTqgzyAjAXVAeR0m6cESGIYjHxjAz+GA5SoNImjdQQ303K44Rzn4w/wUdGI13QAkBbMM
	GpDyz9GoX13JSfjaAMvGNkuCKMmyGcHwIJF+1MD8HVTM8toi0h+2YVbl3EMjynOozHKwyx1J1zU
	vUxDsDs1Nzh9Q0y9uy1+oyqW3+dJTWWOcypdCMzHBl0XjXxyMVq36NYItgFF2NcMDOVtrFMJfQO
	2jgmbgYJ881XIrL/pfswcJHEw0q0oeMIJIQIArqa7VuyRIKKG1YGk4Ies6+YgnTfTJBvNkUZqSv
	PcF8SB
X-Received: by 2002:a05:701b:4244:10b0:188:ed6d:ebc9 with SMTP id a92af1059eb24-1ac5e6f5225mr2448087c88.38.1793353220759;
        Fri, 30 Oct 2026 02:40:20 -0700 (PDT)
X-Received: by 2002:a05:701b:4244:10b0:188:ed6d:ebc9 with SMTP id a92af1059eb24-1ac5e6f5225mr2448041c88.38.1793353220039;
        Fri, 30 Oct 2026 02:40:20 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:19 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:05 +0530
Subject: [PATCH v2 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD
 HDMI bridge support
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
Message-Id: <20261030-lyra-display-upstream-post-v2-1-906302159392@oss.qualcomm.com>
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
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3487;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=smMOiJGRXLe6vyzF3EXDVDCQHvPs18b0QYgi9/GYlL0=;
 b=NsXFVb5awnoQh4919cBqRkuvUzwXyUh7/DiD9hpttwt/QucRhVzzxzqb9/MFQvxT3gNhYtSIR
 r9B4uaQT7ClDVFBTwK3N5P1RMDGc+HDqM33y6HT7eIWZ31xs5l98VIZ
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: Ag0b3fyO74uObCT0wOB_pw442iLM3Z08
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae46605 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OCdZN1uXOpAY9Qk72D0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX1i9ux6IEq11Z
 0e9NZGWwhLDh3JjiHUFullGEfyNxRivaR/4W29zqSoKa25WOU1ZTQduhZHZ+JwJcvy3m2DfAnD0
 ll3089Hp2MDNDDkyeLQ6dldsMciSWNs1q84S6TUZZgpx26TYa8kma8x2+fQhh2r2G/L+Qo2ZDK9
 szILJQGVZGEhSZ3azlfcCX/34RIu2dBxmz8XRpP/kAAZ7vJGyifWU2gVCrLcdMysZiw24C/qG4f
 z2psJ1FuGYuDmNeHHcXh1MI8QDfXBwsBxnA//Ao17+YTZKJGm5+QfmA4ZQwZbiZPphJTT+eAUIF
 M3Cc23mv9O65F5Gjw0l0gOuxtpIFWxbkcdFmCUKHVLkUG/ZLK7T0rxlUl6NexkdEGrQLxP7rxsY
 LhV48GSdOsx/07o9YTW8wqKq/aRQHQLqbTN8D80/WDTTfSHBPVsFA+DbegPlfchgQXVzQu4XfkN
 3yWjPbc0QK3FcG6GkpA==
X-Proofpoint-ORIG-GUID: Ag0b3fyO74uObCT0wOB_pw442iLM3Z08
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXyLUsl4RPkOWh
 kUr8GQLGMVsO3R2axBqbGOi03SPYeWsZi9MW241aeT6DKVby576Yi6423fMpymbqaB0cbMIPbgc
 OMaH82wEeEDDVw8UiCFApzDgIduowxY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
default on the Talos Lyra EVK base board DT, to provide HDMI output
on the DSI0_B2B connector on the carrier card.

LT9611UXD is connected through I2C2, with reset and interrupt
connected to TLMM GPIO61 and GPIO60 respectively.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 105 ++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index d4468e609911..eeb8e903b03b 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,8 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -11,6 +13,10 @@ / {
 	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
+	aliases {
+		i2c2 = &i2c2;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -22,6 +28,65 @@ dp0_connector_in: endpoint {
 			};
 		};
 	};
+
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&vreg_s4a>;
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
 };
 
 &i2c5 {
@@ -74,6 +139,23 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l11a>;
+
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -113,3 +195,26 @@ &usb_2 {
 
 	status = "okay";
 };
+
+&tlmm {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio60";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};

-- 
2.55.0

