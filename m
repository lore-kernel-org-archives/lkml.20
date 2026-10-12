Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D8C344D83
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810928; cv=none; b=RIip1xcNRGnCff2lGgVMD8m1cfhjTEgPJ2i1wm+14zgSfvBSBLld6makYU9EY9G+gqkWTyNup5O093YitnbWJa2iEX+yZZbe6qS9vqYUAvh/YQGC+D18BRpCeioZ77t/u9UV0keM8vW4sJ81IbkJRQwO0xazEQidNa6QAGcO9cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810928; c=relaxed/simple;
	bh=su74ccP+uXxdAjl3dhGSD9/wQo+gkwv7Rh3GXHEmMXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LM18oeNisGzxaW40qRUc71tcH1MviLabR3RKFSoIZj8EE5Zlb4Z0nB/qLEtZuPPz5erhD5J+qmvFueHloUsGTZ84wodM+q8AL2AySJs+kmV3C8eoghB/sP3S9XfDF2XCj9Ujc4zCa8EcBlBPSsV5nAJTaZoRJGggGF8Qfceu9a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmYB1NDb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTnN4Ble; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmYB1NDb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTnN4Ble"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxuEe1404984
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QRAYqG0i66uB7ffqoKD10fYJ6TRuxmjLOOA
	z85hufJo=; b=hmYB1NDbTgBs7lfeyxvzeQE1WC+2AeMurFQ/O4CZZ9acByW3aa6
	9ieuQyIySJqsokDaZoTte/oYcoHRjIjnDknWjWP4jZRpq6S07dpygJ8NxHdz7TrL
	awwGi37lEh/GGK8BqP7iGMI1T9Kys305jpz9QL66ZxeokT00rzBwYqf5MVx6YjpM
	imZz/YX8TR9yTyzufzVd5lYF/Ck//6jHcd74g3j+2DUkAwv+m+fFecVJ1YmqzfWv
	t036rg/lSM26lvquoCcWsgcLFfBPYhR0rWcu2hcxdcU5IJtB8QRqqY862QcS88Tb
	CeE+kJ/jP8/WrZYxX/Et21Xmu5ekC3YIN6w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7ks7k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:15:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510d0baf63so5337615eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791810925; x=1792415725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QRAYqG0i66uB7ffqoKD10fYJ6TRuxmjLOOAz85hufJo=;
        b=eTnN4BlekqTgShemX7C7g3ws32I4/TQX6WZZiaZEm5MzFyaBGXQPef6GE69RBmQAYV
         NDT+S8Y02ec6lkj/Yex1861DHO+WznyIj64rpAYsZeOp0k7dLOnBmQsLZKTL02EAndCJ
         DnU+gkKjtLB1wsohrwsbV2a9zWpVilfCtzmjvNHdeeGnTvwbvvBk3U7Il974iDRkzqq3
         7We6iRR6/TUhKJgsU6c2Gwbmy2rShN2s9B85HY/uHSrkkzo22jKcwOisw1FzrJ938c/F
         vZRDDM+H61piPBX1MXGINYYgQEjSzDAsou5Cdg+HCaWVYKj2ii+SHPp6bTzXMLCP/cCL
         DyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810925; x=1792415725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRAYqG0i66uB7ffqoKD10fYJ6TRuxmjLOOAz85hufJo=;
        b=cu561JxcNyte2GdN/PtAwsxmCXKqsw/fOMUZNBpACrTM2xEF1XUL7r7UdW3HGV+TE0
         CnjRelh42MfRg2hv1HjfhGArzt4ulvR56n1cM0ug/87NdWgeyf1z55Ch0D3oBa70g/24
         ZftrhSgZyfQ7nvOVLqlyX/KkdDb3kU4rSg/a+WwrlrhbI+FxhCvAOq+vM7TIOqEpKCiV
         0LwiBxCgXTtH/d5G6geFepyTcKigFQ4ew2eTxc4U6bvimQXE98mTDNQXtYPM3zKP4/KQ
         G8hK7QCP0+VYkeK3MAZFwvnMH+a3YorJOOKfLwVcLqrBNfDMKJgJ/4MAcs7p1YH7eGAi
         jzGQ==
X-Gm-Message-State: AFq9FYJQhUdSRrCKUo+P0DPkfJJ1e472ol69BPayVoYAZyqLGMcKmHSC
	4J9dsd9op+X0kWRSuzCT8G40HuRwQGcf0tc2K77zvfeQoqC/fnTSFX9VodypZW0kvb3SFIMFy+5
	fxjsugYWIl/tnAlcyFJNoAm9JbhxdDQ5Yo1zjclBxbwrvboFhng7lT0SM4n5LvTKwz1EfiX6I5M
	k=
X-Gm-Gg: AYBFou2q6RPGlNiQ+Vj8f+PUmWjeUwnMx4LYhb/xRzb5JUyIHn4IhiqvAP2Uu2vr2KM
	SWfNw5OruvdcVhz1jd0uMNVMARp0N39c1F+v6sHK58gYofTnRaGQi4Pn0exYw+P3y+hNFu7K/1K
	OqAZFv+Fwbs45EOexHfz+7kChWx6SDZyXJV4nBSK37nNeTIhAKV/McXLsNmG60oKVrR+Y5I7Ehh
	+O4QYEq/Y8ipZY4ji9FNzHPO6Qpkjr7fShqmC0cKXuLV3E4y6jLLOa4L2anVgvjosy57ABx6/+C
	lr32QC+H7WyZlIpxvevoiOLsTkEaAqYnH/nrSaF9wjwGEorRTJAMUMxcl1q+dpe9cvmvEqoW2UC
	Qlo80jP57ndiKIhnb9/CyMxKG9iVp
X-Received: by 2002:a05:693c:88c2:20b0:359:818a:df2d with SMTP id 5a478bee46e88-359818ae28amr6364732eec.31.1791810924956;
        Mon, 12 Oct 2026 06:15:24 -0700 (PDT)
X-Received: by 2002:a05:693c:88c2:20b0:359:818a:df2d with SMTP id 5a478bee46e88-359818ae28amr6364686eec.31.1791810924195;
        Mon, 12 Oct 2026 06:15:24 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm34718753eec.25.2026.10.12.06.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:15:23 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: talos-lyra-evk: Add CYPD6129 Type-C support
Date: Mon, 12 Oct 2026 18:41:13 +0530
Message-ID: <20261012131518.858396-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MiBTYWx0ZWRfX80eLFvk9LB59
 5PNzGmNiSJ84G3SpfxbRmDd+eC7/ztjp9Nxa9Slhy8Ca1tkzwvSfNjh2Gs6jl+qbxh5LUwJ9IZp
 4rnRtyzMbXk7+vFz607ye2G7R4sZzfFYs0FZZeiacbPOGy4jCRzDsr25Azv3QW5pYtsKzUF0YzD
 gMvLZA478PYvBRL3X+rk1D2YAlH15cuEyV1/ag7rCeJo6ODs2FO9ytCQTQabqIz9LRb++3oIM2Y
 Wxr3DvFGx5EYUeM85DsLe6Guwk9G6DIhInDMvs9Rzyk6Pd9NDkzUSOQb/wcn0PdLi0OMFVcj+Hd
 0WdV8HX2svAfEv4UvIhnmgi5z0xXFLsLN1E5HA5K1jrTNqh21Axsvu0jyPYx61+aItTQIuuiIox
 i5DkOiZFg5D89ST/r04DA9mxnXOnD65Hkf8IZBilLOvPALgLTjDlUF2o3k3ez1iSkvCSYMxqZag
 H4JI+PUIylOn/IaI3jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MiBTYWx0ZWRfX22YZGb6U3Onu
 715GJ5o4zsxnithIcsz/GRuQoUDOc3ml39IzcLnYKaYHDoKpR/8OGYMSogZPgOWlpmlfPM4PJKt
 t0l2oBF/52n8yzlcCiS4+KPYp2dsIdg=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accdd6e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=t8wMJAQEvqTMzIF6IPMA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: OW_OejmxjGL3-d1rhKBwxIqfPkbQDyIl
X-Proofpoint-ORIG-GUID: OW_OejmxjGL3-d1rhKBwxIqfPkbQDyIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120052

Add support for the Cypress CYPD6129 dual Type-C PD controller on the
Talos Lyra EVK.

Enable the controller on I2C5 at address 0x40, configure its GPIO86
interrupt and wakeup support, and describe both USB Type-C connectors.
Connect the connectors to USB1 and USB2 through USB role-switch
remote-endpoint links.

Configure both USB controllers in OTG mode with usb-role-switch support
so that the CYPD6129 controller can manage their USB data roles.

USB1 is routed to the daughter-card board-to-board connector. Add a
fixed USB1 VBUS regulator controlled by PM8150 GPIO10 to provide and
control VBUS for the USB port on the daughter card. Configure the
corresponding PM8150 GPIO pinctrl state and keep the regulator enabled
for the board configuration.

Add the TLMM GPIO64 VBUS boost enable as a GPIO hog. This enables the
5 V boost converter required to generate the VBUS supply for the USB
daughter-card connector. The boost converter output is set to 5 V by
the feedback network consisting of R2403 and R2401:

    VOUT = 0.6 * (1 + R2403 / R2401)
         = 0.6 * (1 + 75K / 10K)
         = 5 V

The changes also add the I2C5 alias, CYPD6129 pinctrl configuration,
wakeup-source properties, USB endpoint connections, and the required
VBUS power-control GPIO descriptions.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 119 +++++++++++++++++++-
 1 file changed, 117 insertions(+), 2 deletions(-)
---
base-commit: b7e62b4d28bc0d2f16f03904616da78e4478aa88
change-id: 20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59
base commit link: https://lore.kernel.org/all/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com/

Link to Driver and DT-Binding change: https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/
---

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index cfb563658fe0..2cd5a2562f3e 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -11,6 +11,10 @@ / {
 	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
+	aliases {
+		i2c5 = &i2c5;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -25,6 +29,16 @@ dp0_connector_in: endpoint {
 		};
 	};
 
+	regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB1_VBUS";
+		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb1_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
 };
 
 &i2c5 {
@@ -59,6 +73,68 @@ expander3: gpio@3c {
 		#gpio-cells = <2>;
 		gpio-controller;
 	};
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <86 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "okay";
+
+		/*
+		 * connector@0 is the USB0 Type-C port with SuperSpeed support,
+		 * routed to usb_1. connector@1 is the USB1 Type-C port with
+		 * USB 2.0 HS-only support, routed to usb_2.
+		 */
+		ccg_typec_con0: connector@0 {
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
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		ccg_typec_con1: connector@1 {
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
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &mdss {
@@ -74,6 +150,15 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&pm8150_gpios {
+	usb1_en: usb1-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -94,10 +179,33 @@ tpm@0 {
 	};
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio86";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	vbus_boost_5v: vbus-boost-5v-hog {
+		gpio-hog;
+		gpios = <64 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "vbus-boost-5v";
+	};
+};
+
 &usb_1 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
 
 	status = "okay";
+
+	port {
+		usb_1_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port_0_hs>;
+		};
+	};
 };
 
 &usb_1_hsphy {
@@ -109,9 +217,16 @@ &usb_1_hsphy {
 };
 
 &usb_2 {
-	dr_mode = "host";
+	dr_mode = "otg";
+	usb-role-switch;
 
 	status = "okay";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port_1_hs>;
+		};
+	};
 };
 
 &usb_2_hsphy {
-- 
2.43.0

