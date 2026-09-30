Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C024C4F54
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766957; cv=none; b=jwEJ6vTCMx01G2Zdp/hDgpqA3/duZafa1Z6zwA9c90ZdHihKd5BF95eM3GhbkbQZnaYCf37a58m9AIl/T9+2cRYu28jfOeyNc3D6uyBkp0MuaD14uj4/8QZjqiuGZgq7MvrwAK9/OH6yrlH1Hd6IyVk4fhmDScFwTaKJW3m+fkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766957; c=relaxed/simple;
	bh=x8IEnQl485EogjcmyDG7U6n+sy9pYcoHothjXs4F5Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cwh/fDoVcjcTiAK6VMlr3iRi7MZijR8R9RMQCZKBru34MPSTqvLSh1XtAZJD0rkpvplkbr11NXSQGAszTc98PFRXW13UoxEyNiNxIPhbo3qDtJgeHSryvxfOmHJ/h79o88OKz8gUGiOstVPyr08pB2iKOWdFK1ZwPBWS4b+/dLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmPRiNWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IHN69w+h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmPRiNWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IHN69w+h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8XH93796762
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12A7q0L32pVII7SZL99NVfbFOmX/lvOwPvysaSrL+QI=; b=LmPRiNWZ5aURHu+R
	i1cpDcKs8Y+rPMuRU9eLC56fU0u4AsnK05M5oY5YdB2bYz9u7XZk6AmdgcwHbR5j
	pjcFhrKfXQUkb1wT7kAbG9R4XHMwzmy8sxkW1e1rDtu7MshI+Cn2vn5xjDg/yp/p
	kTb9RyYQhfnJ/4gDSsUeobTmpLw1FIGQ1crsLAABRnSWEh3ggCD9nl0/LHUBenSx
	2Rr73SY7+LjRbPIu84ZSltcjXQWGwuNMyTn9m6GtgL5vt9L1gAof/STx1YAT7feU
	5iwXlvAnUwb99TQNVRtLyfKMjfmvrmO0+N6X8Lh30hokh94OLiPK7DJm/hj7cwix
	bum+5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3k355-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:15:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e2d3a3ff86so17986195ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766953; x=1791371753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12A7q0L32pVII7SZL99NVfbFOmX/lvOwPvysaSrL+QI=;
        b=IHN69w+htC4r6U7N3BPwRA1E4t0SUaIJ9TP86yQjcKezCkk3U/nN5fsyqxREj7+1/1
         X9mjZKziRiG3xEWkM8H1lW/wycY5kDaUqzsRlp8pzILsMePVATC4z9J3HOFOXu93lBvW
         9/t4nQh/yGWMfGHyl2p92vaZZ9F9zAhfGK8+6HqYq6Zon7vZXwsKRK4wAIByH5u5nNdj
         q39IxChClB4nUeDi46ViPHs9vlVCoy7a7UiYls3L9hgpg5qYqsHP1k9WWXTlYrVrNGoy
         mgw6ALtozzv8CRgEUmdarl53gbzhLF2zHuTBHSbSZlWmV9SRfupRtmMcsD6OVrOX3WTo
         xYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766953; x=1791371753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12A7q0L32pVII7SZL99NVfbFOmX/lvOwPvysaSrL+QI=;
        b=GHMCIieaBYDJRdxBF4wesGfqBEnH8Ft6oY4XBeSksw0wxwzFs5e4yydIA5TFwjtGPd
         vc8ei0yGfETCroy262rakqGrcAJN9GLYU12407Xp77xNZkgMZDITMgk1ye0uSWkzccCU
         nf/h5lTxH27tojl8/zWRnVtQYEmNQj+cE2Zr19OFZcxMGr/PVfhLXd4i28hIcDd4uPWa
         LrluJ3A479v0HT8hqBfNwJc0DD8zhBUeLDTgJZt8zppJbeE6ZNDmYI0bLs0pFccQwoEz
         SUzsqP/U/gSER0WcderL+e6y2a8TcupLJxi2Xl7TjJ2jt3TSWzEt2r+AQd7mxjA3ERC7
         RrTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHfK13iHpf6y91Y1PIjjhlkwz+0pbjWpPXUbGUsyhBpEWeNEHtQzCWhZd79k4wjwbp1oglrZ8beQgNWWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI6tOyS7X+hahhn5I/7+9W0OqaezISooz2ULX6YRxwpYgVpSaX
	mzu+mCoD3jYZH2LjgrH9n3NnR3FK98CbHBJCvVrA65VaCMOwAeoXBnWzL3bBiNiSDW3bCfyNgwy
	YtTWW3VHCYRAA/8kllqRVsTOfNYTKMmwu7XD0Y2A6P/cpn1q0rm6YbV5tkEoR9GuLlts=
X-Gm-Gg: AYBFou0xSpLTtxygZsdAhITtNfCxCiiERiiSLq3YBl+mBmENB4WmJItzAokcOvtvCHA
	cHvDzj0+3j5ZNQ/wdDSR2c2lH7G1IWfueVdqhfKtny7DfAhJbJgFm0+XJA+w76imRkOpPXfBREI
	DoDWumoV4pO+ey969hADoZr41ofE1kvNtd4kirS02PghofA6jIqOJ62tWrajtiXLueIRvzy3j11
	drLxkJxLuIn4lTWe0E/1fQaOob6QeNzylGuzIrmj/5S56Wxpmz85fzEppQrGoQOOJE7Dk97BJbY
	ms0TGfJn73VZLgCHc9xJhODZz2W4SB90iHOaN5jOgthr0wvwWYMWG1C4RVu6NA2tuBRdwrvyQDl
	ESPTwLmm/MI6zlLo3Y5s0pwiVzVs=
X-Received: by 2002:a17:903:2b04:b0:2dd:2b8:7198 with SMTP id d9443c01a7336-2e2e49962aemr9452555ad.6.1790766953440;
        Wed, 30 Sep 2026 04:15:53 -0700 (PDT)
X-Received: by 2002:a17:903:2b04:b0:2dd:2b8:7198 with SMTP id d9443c01a7336-2e2e49962aemr9452315ad.6.1790766952973;
        Wed, 30 Sep 2026 04:15:52 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c1b136sm5505465ad.71.2026.09.30.04.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:15:45 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:45:12 +0530
Subject: [PATCH v5 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-shikra-dt-changes-v5-2-8eaf658a0e38@oss.qualcomm.com>
References: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
In-Reply-To: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790766920; l=3209;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=bbXmK13aKPaq6iFS3DzUTlaOBfnJxVDmlcIoL7Ekra8=;
 b=O9+WOcdWLRVX4XZodTNdSVJ0xgBEm8CTVEHlv/tRw1G3Qd9S3hP6LUVU/m278zH9nRtImnPIz
 SutKLpfLqdGC0msbLDQ8npgqEnkCNvPNZNY7duowYbge5ot8MeH65nE
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: 5oHXM5ZtMJMMAtcJoBtuzMPpPAb9jD40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX3ddjmz0ldBOm
 ltL1A0vhrb0Du2KxpyvVJKg5w53QYwpqsJmb3H10PLjqa2WtPLHKNCE2XT7dDkxMDoN4Lr0jf2m
 8Y3icrRH1NpT2xactBd4bVa1A4YjayV32NsXfZoFEOlVB13F6JoWKf/1ajhrXdA9lc4yrXZRS3Y
 ISmiWLGYMaa6lMHTEbEdf9P+S01Gv3/tUf4gWvRXBqKfSd4X1x2+LAZ/AZhekxpz7jJ0Us0b1tq
 HeSpL638BuD/QbJbvTr+89ApmHZ5FioMBoUbcW0u3WWlDwWmC8O/IuElbGbeaW2//Z25yDwrceU
 qUnL+zshER6iQRfAEIk+FFcMDGxTFDHV7ddxEmnYT8hf5BCfD4ZMAODIDPzhbSM5YcXpKSnaqEv
 NW0hllsdGyJeexru+oFwpJTQbMv+mGUNkA8icOcWtKyJ/bpYYB8lP75FtWbbfW/03Jb16p596Qr
 MWASumdnK6q0MuWHRCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfXzCOwY4dTz7t+
 wpQb4ib4gNerUjlrp9mpDaDmhNBCHB9+4fRnYjej4hHzXCGEP/qmJQ+DIAYGlcGtbDv5yaKD53z
 60/HSaCOnuDgSOTGhnkCprdEgAVlJ/4=
X-Proofpoint-GUID: 5oHXM5ZtMJMMAtcJoBtuzMPpPAb9jD40
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abcef6a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yejcvWCcBpXp99Qhm6kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
board and add the DLC0697 MIPI DSI display panel node.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 110 ++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 7a2f3e1518fd..5e49a5c71a77 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,86 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_disp_n: regulator-vreg-disp-n {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_n";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_disp_p: regulator-vreg-disp-p {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_p";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_wled: regulator-wled {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wled";
+		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&vreg_disp_p>;
+		avee-supply = <&vreg_disp_n>;
+		wled-supply = <&vreg_wled>;
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
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm4125_l5 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &remoteproc_cdsp {
@@ -89,3 +169,33 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
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
+
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

