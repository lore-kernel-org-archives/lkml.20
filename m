Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11D723BD03
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224460; cv=none; b=gaXzpw3/joetWQoBUJfh1dUjmhhIQMXEzLEiUomhg7zw2JESSOU6+XTmW8iLYLvoddZzf1e0KaGegGgnlIp5xbgOYLR+gsJ3eW3kM8YGMRgVuKuYXR/8jRE/ha+vtit6V1xCPPGgeAQnfNyCiXFIz/lgxU+sA5mhofV7Fwk7xMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224460; c=relaxed/simple;
	bh=m+orVjbrYOPpnTMcocWp5XwWThJkf2QCkbTZFw2UstY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hTpmIv74PIlgrgvvg6NZgcpzdFAya5QLXmaz2KeeJCguxmdXPwEgapEe9e4jR1RNRLBhkEv7ALEYetRh/ZsVdS78PjkTcjXpZzCc57uhtAra96+aKj/oRx0QuadkZGr806y+Z28pu0v3PBZYKnmJd9uPvAJ+erJsecOKM5FUvPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RfP0Ipre; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acaNxStZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RfP0Ipre";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acaNxStZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdbLl2794368
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DX4wNWjesrloq9u2vm+bvbsCX/R2nLiI4EHDne68gKs=; b=RfP0Ipre5KZIIGme
	7aeeDu5OVJM3aRP+sHuk6E/7AjZyP1kOXPFv5baYv6kakb7yM3sRwwqzUErfkrce
	QcC1ykBxOKLLoimTLEqV6QpvJmBPf3E3HvD0dlBkYFZNINYj9lHN+v+YJW5k7LfT
	Gbk2RVnHsaSliDn4k77T0TxDAq6s5Vl8ruDX2dLZYawdNW+5d1nvpDDc1/4BHLGU
	q6EwObG/FajbtphUV65Git6T10XmbH7xSCsXtRMdQ+PfcBw+ve+wCHEdEZCeWcTk
	jRZYLjl8B+Dg+z6x7mlCYLn2yFFz0TMz5l4zk1gXm8n65/wNNgdGg4sHg4smfZ0r
	2fwGSg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd15ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:47:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so3939429a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789224457; x=1789829257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DX4wNWjesrloq9u2vm+bvbsCX/R2nLiI4EHDne68gKs=;
        b=acaNxStZjLkBXwC+1N3aHAJAFvsLwqU4G8gcEMKtm1jeDtE+C/ioQyny61X6ygCyvT
         w2H8HQ69cVR59btfLGngxNgfBlO17IJqVXRfnm+PBJcJ8HBNbdDh2ZPBK/apWnipZ34X
         93ImRaIr+ElICX78wjAqkBo7OXC2hdSy+xXZBUNraUUNfl+ZU5JeNWfY5r1/2WY9bqVG
         fiC3HFUZ/rGrZIk8rLsvXjkYcYsfzlNkNCTWzaKWOSBkX6tCNaKQ+d3FT01w4zgoEHYr
         6c2iCZJh39Hea2u7T4g2c3vaFghL0fVowtwV8h0d6nhsyQRymxWi/7l4pq92amzJO5w0
         uASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789224457; x=1789829257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DX4wNWjesrloq9u2vm+bvbsCX/R2nLiI4EHDne68gKs=;
        b=O3KbMsW1tALMNkeH2CfXN+ZH/0UziQ5x/MRtvfN8ndguHyBzBNXhDBx9M6Uv5tkPcC
         S2T+vDloQkHjAy8J++i3XqZG5FzVvVPIH5cwak1lSBAgAtLhJDboFJ7oYEuAitsi0iFj
         0xLxPIzVC8xAbbkAfvD8chY0KPAL6ooJFQJQGxRYwxxsTy0OcYHUhfpfH6+99NWBERRp
         2gJHsqqCrId3+HWmzrWDwq0moWwpxi0n7Y0ZPBOF69fV8ot5IKqW7Vzoy3w/vExZuxE3
         jyn5Mdla7VN6EZo+q9hYw9r8l1yyYt0EvLOWlzcXr7pwVHlWXeZGw87WgW6Nljj6+FbX
         HQcA==
X-Forwarded-Encrypted: i=1; AKwUvBwiUxZhtRvcOVwV8ln9ST5BmpOemBd5ubVe6yPCcM3Sf6focUbJuzmKiuOEmsx5lS9i85ZgGUiUKpLCBJo=@vger.kernel.org
X-Gm-Message-State: AFuF++kL9RwHCp7MSHML9zOiceO8rtkg2wTeYbjsLN8vlDwtSLIHZRDF
	LJf6KNlhGpHSQyDCTJUPTSGRUoBuQEQusR6hG3K33jwZNkl0KsojwMY7kF7j1zwTDsa7kp+M2EZ
	XSORmJJwrmeHo7rWsNko7HkRf6V2AyNAZdGmPDY0bR4HgShy7HcOazYnktnK8QeTf4zI=
X-Gm-Gg: AYBFou3VHYlfQNKV1FuoNAKmYil5HmMKGuAg2B+RHh5afna4WFr0etcY4rreaTsro7X
	zwvwMlVXueHJ1LaRjZHqf8Fu4S6qYztodFKmNi4M2R79weCDAoQIqT8+8HbCJ6b3g+Q3ltD4D6D
	qgpTUMy+evWVHvsEoYJ+LzAvaYfA6JQkVszIClzs558PzncAe/ZbdzlU+Hgd+OeE15ANuBSAsmC
	jESw74heWgK8kbgxIDxGXdTfhz+0XsgReQs6/2O899JuvJcpOJHY7iURsFA4JfFvGOVqNrj0QwL
	4QQKxv7TwVCtDbKZIGJBnGdYppC/hFnMDqdEXJZ1GqJANO99ws9Ay2uMIlB2WnR7q3ukBrIEqR8
	+ZZwdlRfvVsIK1rA=
X-Received: by 2002:a17:90a:e7cb:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39d9b960826mr6552986a91.0.1789224457438;
        Sat, 12 Sep 2026 07:47:37 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cb:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39d9b960826mr6552933a91.0.1789224457001;
        Sat, 12 Sep 2026 07:47:37 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm14344833eec.26.2026.09.12.07.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:47:36 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 20:17:03 +0530
Subject: [PATCH v9 3/3] arm64: dts: qcom: shikra: Enable USB controllers
 and primary Type-C support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-usb-shikra-v7-v9-3-c7b507a0ec27@oss.qualcomm.com>
References: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
In-Reply-To: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789224435; l=5483;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3uKBvxyWjcwLrJKwPEarFukDhI+wcZDsP0yuO/Zjgfg=;
 b=1L20gFn0OLBfREYmcfO91jX5AoZ5j7dpOO6zxQRefVYkXYhGqE9RV6hneWi2795T5fTG/Mxui
 e51uemnd1xCD776BwCjNfD1KDs+WoB55t7wxVtqPYMbV4fmUE3c1HIJ
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa5660a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1_fiUyOONLQHFIvD_h0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfX3QNBEl16pXxE
 C3RXLzo69ehDRYQUFewFJnVxue9iZhPModfrpjnLbTgWyWd4XwgG5bdP/aXlSNlrqn/TESw46IN
 rPzIwz15eZMywv3Y65iSZnOA7MFdwBbZO7zmW34p+J503CxLelZGIKm6qfc3+HXFVlhANUHMwXo
 kkAWoMUI0pPITK+CxUliRA4yi2R/24u678XpacrJMVN6Bes0IotgV7GhBY0hHGCpzXsFZuYFqAK
 tOePZHavmqvzslPJrIHXU5Fb5MCoHKKCXMEwNMPzVWnkMWwW9zHcz/4rAL4FxZ4b1KPa9Je4pMe
 hRaub5OK2XcI4l3O4uWnW6N3wso1wW1n6kPSmZPJmakGjKfyKQMotf3ABhjgBkQv5jjCSYo+GIR
 y6K4xLVsOgC+FV5RJmgw1RVdm+2jtVJm9eedYG/8K2FaNQ5ujcA+Qp37vRLjud6YWzyrSfdNjMu
 LuomXgYYUWS8xrDCiNA==
X-Proofpoint-ORIG-GUID: tg4HCCQVPGqF5V38JPDO1FlIfv0muZXo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfXze44tXMBZOZv
 M766MMnD6hwofXpR3hOWUwE8/OUSXs9kD49xqkwjM/fQcql2qW4P7SI2EbCSDEofCFeuB9wyf91
 Qs9SLkvXVSqyl2FaIG2YotiNjOtwuF0=
X-Proofpoint-GUID: tg4HCCQVPGqF5V38JPDO1FlIfv0muZXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120213

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Enable USB controller nodes across Shikra platform device trees and add
primary Type-C controller wiring for CQM/CQS variants.

- Enable USB controller blocks for shikra-cqm-evk, shikra-cqs-evk
  and shikra-iqs-evk
- Add Type-C support on the primary controller for CQM/CQS boards,
  including role-switch and connector integration

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 43 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 41 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 43 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi     | 12 ++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  | 23 +++++++++++++++
 5 files changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..2d26435b257a 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -57,3 +65,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index fde7fc035bf5..541ba278bb2e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -85,6 +85,47 @@ &pm4125_resin {
 	status = "okay";
 };
 
+&pm4125_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		vbus-supply = <&pm4125_vbus>;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm4125_hs_in: endpoint {
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pm4125_ss_in: endpoint {
+				};
+			};
+		};
+	};
+};
+
+&pm4125_vbus {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+
+	status = "okay";
+};
+
 &pm8005_regulators {
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..fcafd8aa6384 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -57,3 +65,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 4b9452d9e93f..7cdbd257e9c9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -20,3 +20,15 @@ &qupv3_0 {
 &uart0 {
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..779b9582c011 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -57,3 +57,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};

-- 
2.34.1

