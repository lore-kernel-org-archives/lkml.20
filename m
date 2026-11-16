Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830801;
	b=ELcFXREMd37VR5ZiVcE8vxdoQLMeHoOW2bz5MdS5aR99rg4X1pZF0SHFUIHAJwVaQI5E
	 FyZhEthnC4NnDzaebB0sV9PVwdXtwxk2vb52CJG1x2+z/4FM8GGkUD++q0O3AKu784ufK
	 qMx5AYKKX6TegCBSJ5UkzsLRbEi4dHBgTxTlRg2ROh4Dvpbaw3xdcCHYpKi5tE2b0FYhl
	 mFGGNJxzgsvbEDnM0WvV7iUGEckKnVy5TXv9ciglAj9RCARAD5+wLOg4hGrgNqmty0T9Z
	 0799oBhs/lG+gqgxWCwYV4m+5GlLbauiQGY+4u4mMo2Fg/IPnft4aO+UAtDmBwk4M+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
	b=X3O9BJPe2tFWm89r+e269oYdncv2ESJXxwV6PFUjCJ6mpm+FU2JHrAWc1aHsjq9tWFOS
	 lymGSrjkAKheyxvnUfg/VdIelLY1vN2//kNhnzxFi6xRd6PpcM+RppV2AKZhO2VOFzAO7
	 mGyVPLSPQPdwrk/9v1sSaxcroRnXy7yQzPuw/sBeuTyptHq0CaCgsfqzsmok/YzszMLIL
	 Zt01iJiXsSbC7KQQZYSOqYDS7PU0E23G0Zi6NIWqTqiJjrT0GRElP9GtFK87XmVPBdLb8
	 yAE/VXpCjhEBSGhLSytEhBgB7XYVDwKszqj+Z+zVlQ/ck6okOY4PMjnQh3JJVjgCtVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DEbobxGC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gqOF2EXL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1E9606A887
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA1E9606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DEbobxGC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gqOF2EXL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC154f1483045
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ibqxhW40RmB
	jwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=; b=DEbobxGCOkZPluIAsqaon59Dm76
	pWtR7jWWe4usdOdXYgMda3SHHSMYKfff76hvjWq/vT0Tzv7PfA85dfi02SmFyaF8
	zjvlwXdEWRC8tzUTbYRxTJeII8yL5OdtOZPs2dFPXVndnnyQSzj7nkNjiFpZW90d
	UAwtM5vBr1WgqPgHRax4CQfgTIL/nsUhfVRGdJBICKjtzwLXhmINZEouPSa5ctUl
	JGL+xT1CxFko0rlOYAb1zeKz/oIta1yi2gnSxxk5Bii6tSgaw2GvLigXVCN0kSM3
	tYk+HcuW+hvOx0FF2oTDQo4tn4J2EalqZVJ2SafZ7gSZwM91JHTlO5Los2g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqgdtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:06:39 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so137664c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794830798; x=1795435598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=gqOF2EXLeivKZ9KInLuWojugS6GDiAtMWcuibs8xc2YEwCkQtrwDVlq2qdazjgVfM6
         rbiLOC9Zq26upobVz9JoAhIkHwWIgx7wFWQJdzdjoT5NrQeGCH5A7GQJGrAtW6dWFlxZ
         B448pdU7iTtPqjk4b4uT+MDdO/ESYmp9k693tBlMfY3MUHrQfyAnIT7ef5yRHsXOUKY5
         zjcyF7tcjtMCHidgiAm1hYpV4OKm+cGIOJ/W0KF71fDqqhMwD6gLMJ5+g5Uiatl5uuUv
         r1tEwzZCLYX6UZLjo8mWWq2OVJAxThq5ovJnJBTTatdwbbpgbcOXxDYYQH1mVxsTu19A
         F6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830798; x=1795435598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=eX4cna7R99On66MAZeeL90mAZjbgEdOSfzAXjVksS8oQPODfs6rz6Rf1+c/npksHMT
         ZblGl+Wy19eq3jJZlpv3M+i8bwNdiGAY14CrL+PijeIs3MD50kxZzAlE/FuSENC33iqr
         CPL7RjYdyry5TW9cDb5harQR2Rf1swe2PwVLXaygFmp4gecByZCJMWgRLDvh+Oslnpzm
         9EirZoRaqBW73MfimOvv5dufJq5xt80i06KmTW+bU8kJsByQDuGdjEFDzrzp8UVKcVUQ
         OL0FA/Th1fyAfi0xvAUS5cyBlbb0lVfrxRcYmT1hJTXV1pufeYHIXQOpUIACJ9YNY+Y7
         A64w==
X-Forwarded-Encrypted: i=1; AL+hErFzi+sq+7qgl12ry8hTSQTRfw3fk8h0CUnsB2kVcdoFKFL3A18SRyoN5JBm2MFsllC2SIiRRi0JaJ+KhWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IaT8n89Zgl84OJ2R6QG0LPPPBblzr3idx83WMoq1SH8mjOXH1
	NnOsefVm6jxi9Y/kFbQaGlaj57uQ8IpLRzB7b9l4qPxwJO+YUmBWDTtVO4tUjG/yepbMaz9YRn7
	Ww51QZauD630t4l/35edCuTXEg9EgXvk8BGWEaEGhL8jtICt5z0JlJ0B8TiI66clIVsY=
X-Gm-Gg: AYBFou0CwhVFVB2GA9BpNAKvdWiGV3UXZ12Gvwm/94B7536uTuqAvxUmLQY20IfRGNQ
	IUkwlv0e00kVxQMvNg8WgmI/RniFX9yu0OkzTxTpZfIRHR1dhQ5pGoURTZL7G/Y+vU8+mSvCrSp
	LBmpHPM/Sq8ZbxN3m9iPfSxNdImFY6KXIUUntVFbARfTGV7up8lRKzn/NbUntue88zHLcW3MHDI
	30FEe0kciyES1OJNxCrWC/Ec2IMk2nAEqz8VR0k/J9xvGsq02GM3SI0jGDy05+tE6d0zoiyOlWP
	w5SORxzS67ZFMPunO52+3VbdNo9HV8zw4VKr9wSfVae50gU4h1Ij3L0d6SbymM7pTQqmXAU8yGy
	N0QpzKE7vYgre5/5gZZ+/lhlyqAV6Q2gb4cgFk0gUqnY5uLNs43usHFx1CxsCWAeqx2Jy3RW8ds
	7lWg==
X-Received: by 2002:a05:7022:3c81:b0:187:c940:21b9 with SMTP id a92af1059eb24-1b5031217d2mr8629516c88.30.1794830798210;
        Mon, 16 Nov 2026 04:06:38 -0800 (PST)
X-Received: by 2002:a05:7022:3c81:b0:187:c940:21b9 with SMTP id a92af1059eb24-1b5031217d2mr8629483c88.30.1794830797574;
        Mon, 16 Nov 2026 04:06:37 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm36961530c88.5.2026.11.16.04.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:06:37 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 17:36:23 +0530
Message-ID: <20261116120623.1726089-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
References: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afaf1cf cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1-dFLm9VQVe0kl0r4fgA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: XJqOpIxsXUNYlmRy00kicuKDkPHvcZ-5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfXzuyhO5OU+G59
 l6p8D/QpOBNqq61Qs2M5RFtiE5DDe+wKXotVshc/pT+mayB5lw9K5TFCSxiHyaciPPLnpseYHNp
 Frck3ScsgklYN8knC+X+YbVzAIIZyYkLklZhm7bAkoqN5yzXHBlftAwT4C9X/TtPunSP2TWRWJE
 b+WQHNqZolaKhALJYRUBVjeZr8E/Fhb/SrmVrPYzlxYWXcWXreQoLm1UkjkUlDX20JA1HVLRVcz
 AaJzHf6jzRXgeXJHwZO7M7Ylk4ZiUMI4NQWQQjmaz9yi8VcDEtTSFD1kBLjHppl+JmW+iFyDQNm
 R88i6V4s/ZJ2KRsYBjFceSwrnIHq35fF4gBhZtwBiEmbPnHY2hb7WDfaVPr4dD9Jz/aPYER5uQw
 WkfX6cjYb0VN9XyQyOcOlLFtO3nMuAarkIqXDjKeiwg8o+p0OiJSGA5cfKcOjPeOowi3Ao/NvIn
 /4T3SlU5H/dYULpLd8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX7sk01xKetEU4
 y2Fuya41MNyAcJD37O/lbEVhEdbW2Q5U2kgwugJzLIrmssUBNfFrYyWgFzwTY6h2EjRtAzouVGZ
 bX6L1tby7hS1PkcXZRho2xICPKrN31Y=
X-Proofpoint-GUID: XJqOpIxsXUNYlmRy00kicuKDkPHvcZ-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160048

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

