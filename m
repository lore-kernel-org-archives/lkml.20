Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829765;
	b=eReJXKHXY0USgIEuifTGZ6QfdwFUx5l8X6ibZ0U1iwqGeulOCcQ2HGon/pCrKZNuHnxJ
	 O7DFRkZiHemyxL5v608w+C6UXw1qFsB8QTz7r9YId7F4pOn8qgLszMEv6XW0X+B7iewgT
	 B/3Nv43k6BBFo3TONOmb4IHvaNBiU5seEUJYDvxzrwf1I0hSxVecH9WqAe9ixH3yzefn+
	 6UA3GumiYbc54JWrld44Wj/4eQ6S2rvNhXtdZmANjBJYJXcvgKxIcVuh0mYCrqtnEGgWH
	 fGwt06KMhECqWy09dnC8ledpYTiSs/ASpSntfhQ+4usm3xmGfSb+q5N1W3bItkwcNFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
	b=WeQ5/RHavy2HtqlHgGk5/RscZMNy7CTnXT2wc0iy95WzYqJbWAO0/HN/Om9o01lHtZyn
	 hmmZBDqBL2uaxJyqWZWxYg3A2+bso+I0K8/o9hDYNjv/5KrtxGMAHl/oRGIxBNxFgHI7O
	 UX9PzuDlzjviOauNVosOwA+9ejhxSQx1k0zsz0I4yzZimUJcN/L1yEwdnb85WsZszSxJL
	 x7FwrI029DI1l4pBa8NSNwG6WjHqXi4pJIpwFYWuC5N+rQ1ebR888QFn9cd4tG+NpSGnp
	 EMiQJxKyEhpeT4FYdL8cl05p6o7sQxWNtn/WYbEmIRxdEXzF6J9DJ2thupnBvBuwcRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jFaLEiLM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReeRdIxW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C3B606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30C3B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jFaLEiLM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReeRdIxW
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLPZV3685186
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ibqxhW40RmB
	jwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=; b=jFaLEiLMC8vWMriw71pNEsMdwI6
	cYqSJLISN+Y0TLPvXJ7vQElyBXrGyBX34tyHaEb8J3GPnTD3WmX+j5byxT9thTMP
	KV/K4T7RW/YNL1gAIwRTEKPNmiT5GCMvLZtFInoqjRFWc8JuXx4VxnY/hcsfCeTU
	d/ZxtYpwjc4VjBx3uDBvZWgvps+f9DRJIT+WUzZjtEIagsEQKE+0TMTIrxELYT3b
	X+z28Y0EpbOJpjjWkYZtb/Z+xKDO4vYGal4FtH0w+sWPL6vHOrwc8r1G9XeHrBok
	khpIjW7xTZGdcRGcIz07n8aNW/vjBagdD1Kg2Tvd9N75UD51cAOuTK63xLA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ggg9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:49:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so3609695eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794829763; x=1795434563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=ReeRdIxWWwvADvkNtdIOLMoL3SIwzEga0Kzxl7+C5Svl5RN2+LRuZR/m4bLek5zYQs
         snMMtpz2XWRbxQ3nxFemg6qhZQIfZ3t/+txX8wLsWkasXYUHID7+C0lBL+cOYh8xXrx7
         skIPVqO34V+KR2CE6sBx357LYfUj0ojNjDYThIzAOBXF3jQQP4Q8LWAIMAkK+GCfxEAK
         43hiQxPnlqnhuE38KJKofFdu5FXmpuB3A7evn6+tZbte9CL8ONfOYqbtW7UGBl8jZPSK
         vRVq0G5fCc3fpNF7YxnPYZJoHan8yXzYHKosAnvq/YHEGVLTA/jP/cErfMdhGdi5owlN
         bVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829763; x=1795434563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=RocwyfJOfar2X7af4yq5g5wVf1JIFSNRW+LfSBiEXG3YM/Ryk8RO07HitZ8Mo+xunT
         FF3WMFe2+pbPQ2zXaXHOvpPTscdjbUMzAzVyQLsLg37ZNDpkt9pvqLSP8gl5Ugo8PNbz
         SNEMHLy/JPgZu+pUuBPW2t6yCxafNN36q9iCb7Mt72QCrlBlDHcwrZ+7Dn2OGvy9y6s7
         2TsXR1mhgZFLnwzuy5g1TQD+P3I5jYCz3lGNrs0KqlRCaXJlCOCU/DdGcHcuvqai/Ank
         +NgtKq7yrYWYZSQmUJ6OWmU85nme3XDM/y/JgQdEqdKtpHcacSvOiyXOIuSLMaQ1b8Wj
         DtKg==
X-Gm-Message-State: APuU4Z/qvmq8v58XfmxD1LkVlTL69bGoxHzPBvDqZ2u5IaE/3CZAmlxV
	0L2DUlyCryXhAtHTULupyrchQM344aFEaohvkZY6b6izEBOwaYZbHA5p19YFLadQ427wkoF4giV
	ppOeuw00NPgjwyGa+TgF5aDYwQ9GSk42gdXkPeHTUc56+TGsAggedC5TpqiE7aWoSd6k=
X-Gm-Gg: AZFdTZcVCLuxsDLmmb8BZY/qGxAQJLamwa604N2OsTZ9k6Ia/+fjQ1qS/9BowQGYOat
	J5aqfENVurBchUh1pkV2ZgmDF6Jew36+FnGNJiy0GF0O5UE8HAV/MyZUO62nHRWNwQPLMtWoOEZ
	D6zkCn7bUPPqa7sfRqoPXfZeJ+Gd6kHbd1Wmyd9uuMiasFM+Q0VKm4k32BPhFTEJdIpiK9CWFaG
	/W1rYz1z1V78mjgT3swhcgMsYVSRx1LJqtAmbNkAPmwphRN6A3ph4CiVdhkdT4YehQbAVew0AdX
	FFEhBT1aCD/XjPhPU8FPawV6RNdzbNMb0sFwHmVoabygxMRJ2NljrX9ZDjhmXI6h6uDvtVCPS+0
	bYMnK2J2RQuZQvkkJ1R5Oxjm4AfNvDX5Wkjk5NtIIKpTBkpYG5A4QBMq5gBTWjJG+cTK+Nsaj8x
	YC
X-Received: by 2002:a05:693c:2804:b0:37b:7bba:8199 with SMTP id 5a478bee46e88-37b7bba83dbmr5244729eec.6.1794829763143;
        Mon, 16 Nov 2026 03:49:23 -0800 (PST)
X-Received: by 2002:a05:693c:2804:b0:37b:7bba:8199 with SMTP id 5a478bee46e88-37b7bba83dbmr5244704eec.6.1794829762580;
        Mon, 16 Nov 2026 03:49:22 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm33802844eec.10.2026.11.16.03.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:49:22 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 17:16:41 +0530
Message-ID: <20261116114908.1701258-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
References: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX8lcg4QfbX4TC
 js0xhHIVJbVBEGnpj7O8kBsYqijSt7pKsbvhjBaUe28H+laB+BYWnoZe3bvEiqq4PjL1reshFGo
 izuOFq5DuOi1iG66LtgvnGQQFtIL42OW2sot/kYlWzmvmVtnQpcfjNtN5fgw3LV3CRVDReRBaxT
 MEY+m34fzhrRKBfbS5QmxyMp7STM6MW+kfKEIW5Gt9YAn4Rbwu336BwzxrZa7abmPHcsA1oNjDB
 ZhOWwKp5ahoZe5kSBvL04cGQnFHkRGieRW734bsxqM9EjgoBZjjmjOjpVpDLw7E9+7QTsV6uXmx
 v6IjtwuQZpQHHceWg4RFeBX7QdIJG6EMMU6e3D3nxYkvECH8vdLiHWKfbinUzfiPMrh98dcL2Nf
 UwJ/S4a9u2lTsmITM0Kh3UN9Uutl0WiGmy/+lulxaVHYpGp1QuCxOezQ2IwgXxBMWiYgJbTFg3B
 RcK6b6tew8xfTqfBGjQ==
X-Proofpoint-GUID: It9mvbQbd-LLYI0lyOchgfkgIg4CnwCQ
X-Proofpoint-ORIG-GUID: It9mvbQbd-LLYI0lyOchgfkgIg4CnwCQ
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afaedc4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=1-dFLm9VQVe0kl0r4fgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX1uTUweW4uNxW
 i93wHGU24/BWEgfKmIq8jHt74c+pMr9S57maUxARCuCIIOh0S3e1/z8FiGXZoe759XgTF3cRHlE
 aCSvQdTanqtXu5ZVY5hYFf2FGIbg+Pw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160046

From: Akash Kumar <akakum@qti.qualcomm.com>

Add the CYPD6129 UCSI PD controller (typec@40) on i2c5 with its two
USB-C connectors, and route their HS/SS endpoints to usb_1/usb_2's
dwc3 controllers and the USB QMP PHY. The PD controller, its GPIO86
interrupt line, and the PM8150 GPIO10 VBUS-enable control are on the
SoC/SoM card, so they are added to talos-lyra-evk-som.dtsi.

connector@1 additionally routes its SBU lines through a GPIO-controlled
SBU mux (onnn,fsusb43l10x) selected by expander0, since connector@1's
physical Type-C port carries SuperSpeed and SBU while connector@0's
port is USB-HS-only by hardware design. The SBU mux and its GPIO
expanders live on the carrier board, so they are added to
talos-lyra-evk.dts along with the TLMM GPIO64 VBUS boost enable fixed
regulator that supplies the USB daughter-card connector's VBUS.

Switch usb_1/usb_2 to dr_mode = "otg" with usb-role-switch so role
switching is driven by the PD controller, and add the supporting
USB1_VBUS regulator and pinctrl entries needed by this routing.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 2 files changed, 152 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
index 7d9a08471906..ed3a369dac02 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -31,6 +31,16 @@ xo_board_clk: xo-board-clk {
 			#clock-cells = <0>;
 		};
 	};
+
+	regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB1_VBUS";
+		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb1_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -179,6 +189,87 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs615/a612_zap.mbn";
 };
 
+&i2c5 {
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 86 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ccg_typec_con1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ccg_typec_con1_sbu: endpoint {
+						remote-endpoint = <&sbu_mux_in>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm8150_gpios {
+	usb1_en: usb1-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -229,6 +320,15 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio86";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
@@ -250,6 +350,14 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
@@ -258,6 +366,15 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+/* HS only */
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_0_hs>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
@@ -279,3 +396,7 @@ &usb_qmpphy_2 {
 
 	status = "okay";
 };
+
+&usb_qmpphy_out {
+	remote-endpoint = <&ccg_typec_con1_ss>;
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index d4468e609911..020ce7db4241 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -22,6 +23,30 @@ dp0_connector_in: endpoint {
 			};
 		};
 	};
+
+	regulator-vbus-boost-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_vbus_boost_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vbus_boost_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	sbu-mux {
+		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
+		select-gpios = <&expander0 12 GPIO_ACTIVE_LOW>;
+		orientation-switch;
+
+		port {
+			sbu_mux_in: endpoint {
+				remote-endpoint = <&ccg_typec_con1_sbu>;
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -100,16 +125,11 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 		function = "dp_hot";
 		bias-disable;
 	};
-};
 
-&usb_1 {
-	dr_mode = "peripheral";
-
-	status = "okay";
-};
-
-&usb_2 {
-	dr_mode = "host";
-
-	status = "okay";
+	vbus_boost_en: vbus-boost-en-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
-- 
2.43.0

