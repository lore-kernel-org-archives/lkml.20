Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567333;
	b=wLv47Yw5Ejas7DyAej+o3kqtBfG0/pxFlbTAZs3gGXuIv1ev2433tHaHlLGXMHHe2C7h
	 ANC9w7rSuz1yuJWaGzJQoUrqkwTAc50LEsQT5hJZZaFYEP+JFF7pe2PSJRFjp6j+cdlXl
	 FcsyO7qUweO79M+D55sVGpn0NzbcNtIONMRNUpudOyPqO4CkF+PTiwoF/oMqTSggkOLFl
	 t7rTk1ijP85a1aFDcD8BxkHKN/ZR3MAVm/hwCIiaqPpTJpAcECwn0/M9EpbLbNItTIxoL
	 /PD9xYY+KfC2syxt5eZQDGAYWi5isMc76v9UCq1ImwEBTpAfxsQd3CbhPVEgjYE0QCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567333;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2qihCJVhgYIccTA/tWCrCECyowuwJnwCdzkaZ72SUSI=;
	b=4xbTQKbYgv+rIFWpFDoadHY+ZTDV8yx/ZCahCC4qLhWElN6D2QBcP6TewnWrzGvFbDST
	 jM74CWhaSQ85hLOQVuNm65f655o3W4TaHSIWxk5BrZKgD/a4p5wfn/Y4/RWKJ/8ItcTtP
	 4wSN6JjXbxxlUqFz6dGiHSiJGX+xGptCSe+ZrXe2Z6YmGovlrwqqcv/hwAtWv3jAYPV5Z
	 rWPVheQPBo6Zx8xahezCKSlV4+Ie0aoCn6rEGRFZ8xX8fFNTDSqCgV/Y8scX/a1wXN/dw
	 NX64kSeD2uswWs8UQckVxRuirROi1LBulgkaUC86WnTazqFxd66qIg07XFbl+JvYAqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hl9Js6zz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F11606C4F3;
	Fri, 13 Nov 2026 10:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F11606C4F3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hl9Js6zz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V63e3652849;
	Fri, 13 Nov 2026 10:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qihCJVhgYIccTA/tWCrCECyowuwJnwCdzkaZ72SUSI=; b=hl9Js6zzIJQKK5UR
	CTa1m7YCP22FsZI9MZfTj2wad9ZkXSHIkNwLN0SP4R9O4TiYf7UkTjhcMRJCcY/H
	5RSLBIAuOqMNTqCF/p1HP7xibHCms9VLFw1vxqQVVzO89L3PiESCNHHcd3Njcd9z
	kXLyqsBl1y3841OK3RosZ86XLEKiGk4VhFOpfCmrIpwgFYYe6qOJz+Q1NX3QiBZA
	YQpzGxWX5Ty1Zvwfe74lZXoud9vJ2hboff5dpH3/cnzz0WvAB79wFbYC5cuoAP8+
	NBHXIGaqW3q2fGvTucle9UI9ayYPKWcEw0SIY03nOuvjgW+9j50Fsbr0AlIxI9HS
	guzxjg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwan1d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:55:25 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADAtNT2290273;
	Fri, 13 Nov 2026 10:55:23 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6ADAtMFC290251
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:55:23 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id C5DCCA6E; Fri, 13 Nov 2026 16:25:21 +0530 (+0530)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:25:13 +0530
Subject: [PATCH 1/7] arm64: dts: qcom: lemans-draco-evk: Add LT9611UXD HDMI
 bridge support
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
Message-Id: <20261113-draco-evk-display-v1-1-28a19c6aea87@oss.qualcomm.com>
References: <20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com>
In-Reply-To: <20261113-draco-evk-display-v1-0-28a19c6aea87@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794567321; l=3884;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=ljmYMd5mPcBQ3Q1FGwCdwehx+ZIfurH61hl3GkgW6JA=;
 b=NbZfRt/II0rWTMxPFkPQifWo7EsnUE3mAeOBltZqQHzlV9mV9vOo8fct93vvs6lqaft1J0j91
 oZOS9yt1hUyBSmee/9aG/6AeORRJ21CQHku+QBxNuWPDUO1iBztq/MN
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6ec9e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=czZhHxNFSHm66oBphlcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: uqb2tJt3cTaALRUj-USMZwKpd2EnnLcM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MyBTYWx0ZWRfX3SvJXw07Z2t4
 SepS9AoJonJRgRWtujs/Rj011m8IPbr2+DYq/wA+rMee9/8qqHMCL3yTj0wI6v+YOrtDFDKpXjM
 UGRuka0WD7Es8gcMV3UevAjrJZA9NI/N/7srBoxeVbSQex0CZ8adKpT0C8/yKoUfFfAYk4/Iqze
 tFLxjvKxhFNhxGRDxNwhFodZlgYxw9pgd5qAwVPNflEonVjurLzcSEBYvUlsZ5lsAwTa2erJD+A
 EdZLX918Zf3E2Qwh8eD6MLd8dVcnw1wI8eBRrgb15oTNxllECu4dht2FBKXHcWSkMRS1Dcm6LOH
 XEAxjBkINQ6evgiRIpDI5FI1WX1RsMfauAhAHHtlLLGsT0UMiXtty5W57qkEwM0j2EPmha2tWoU
 qF9kYB0V++JF/RPUqaxPJqQJJlITeHzDkETgr6+jQ7S2+kfEzss1Z21ZDtp63BDeL4VC3SGhdeT
 coKq5LlRjtTHAmLmg2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MyBTYWx0ZWRfX3txpEzkK7p/t
 zoO5ssj3nIIE5/UHmTUDAxofu1lgVBwA5yky3ZrAiDKeUcPAOMejLw9h/5T+U+domlRwtpz3A5e
 H2633sT1/qopq9cSuvz6fZQ/SX77M+Q=
X-Proofpoint-GUID: uqb2tJt3cTaALRUj-USMZwKpd2EnnLcM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130043

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge on the base
board DT to provide HDMI output via the LT9611UXD daughter card.

LT9611UXD is connected through I2C mux channel 0 on i2c1, with reset
and interrupt on GPIO39 and GPIO97 respectively, powered by fixed
regulators on expander2. DIP Switch SW2.4 need to be ON for this to
work.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 118 ++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
index 5238157ad002..89beed7de36b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
@@ -16,6 +16,7 @@ / {
 	aliases {
 		ethernet0 = &ethernet0;
 		ethernet1 = &ethernet1;
+		i2c1 = &i2c1;
 	};
 
 	dp0-connector {
@@ -74,6 +75,34 @@ dp3_connector_in: endpoint {
 		};
 	};
 
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
+	vreg_bridge_1p2: regulator-bridge-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bridge_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vreg_bridge_3p3>;
+	};
+
+	vreg_bridge_3p3: regulator-bridge-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bridge_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander2 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	vreg_dp0_pwr: regulator-dp0-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_DP0_PWR_3P3";
@@ -115,6 +144,63 @@ vreg_dp3_pwr: regulator-dp3-pwr {
 	};
 };
 
+&i2c1 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		vdd-supply = <&vreg_s4a>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_bridge: hdmi-bridge@41 {
+				compatible = "lontium,lt9611uxd";
+				reg = <0x41>;
+
+				interrupts-extended = <&tlmm 97 IRQ_TYPE_EDGE_FALLING>;
+				reset-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+
+				vcc-supply = <&vreg_bridge_3p3>;
+				vdd-supply = <&vreg_bridge_1p2>;
+
+				pinctrl-0 = <&bridge_rst_pin &bridge_irq_pin>;
+				pinctrl-names = "default";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						hdmi_bridge_in0: endpoint {
+							remote-endpoint = <&mdss0_dsi0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						hdmi_bridge_in1: endpoint {
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+						hdmi_bridge_out: endpoint {
+							remote-endpoint = <&hdmi_connector_out>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
 &i2c2 {
 	status = "okay";
 
@@ -156,6 +242,21 @@ expander4: gpio@38 {
 
 &tlmm {
 
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio97";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	dp2_hot_plug_det: dp2-hot-plug-det-state {
 		pins = "gpio104";
 		function = "edp2_hot";
@@ -308,6 +409,23 @@ &mdss0_dp1_phy {
 	status = "okay";
 };
 
+&mdss0_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&mdss0_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&hdmi_bridge_in0>;
+};
+
+&mdss0_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &mdss1 {
 	status = "okay";
 };

-- 
2.34.1

