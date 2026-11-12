Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474156;
	b=VT05OT9mDhwAPqpwtyw3T9HiLPeZJlt5D25gq9FvhvGy/skoVznEdjddC9RlYtT0pIhn
	 ZQR8avg60jIYpZOdbSVXOpOZHMioXZ5WFgAMBVre1UbfXt9GuzLaqsWWI4yUFdxWfNJtC
	 LJjsfznrJmzPW1fJS082UY1Fxz8hNKINpX9domPHGKUtVRxzRXgOpshzVvwTSrKvlBAjD
	 zmRST/2dXfXXQAreC3xQ8caYov+yDSf7ZrKC+vuMmELGjHf90Pg5UhNThPzvL8TfzKEjG
	 9uW/fBlaEZjsAqf2YAghNhkRmdJd9AjGTHJmW1899h7jK19b8FM0py6NhyoU7wuMZAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WZOjYaEo0Xhkb1NPLiB1aUDQ3jjc+rhCfDB38OU6Bew=;
	b=ZJFjDbgsvMzb7bpMlVd7AFJkh2s5IA2CQCqxb+Xs9Pj6y2TiAL2rE3/WWQ0S+K7ZU0UN
	 MccGjpK+zdjCQvn5BuLtr3xGj5q0ABi6nerxs/WXPUBg8BmG/fUBWrQTz7UiysaDjvyi6
	 8qN9SmAiQO7JtXIKWIJmSDDqz3rOmmMfFJg7d3BmO+4P0WTKhDGdoBDREtm2dA4b4ZHno
	 kJDSQxVFyfMz/IQclXB+/5TAdIZ6CwLpUOPCr9Aezm9F6txN7U9lQ49eIdZv9G6fGiw1c
	 L2S4Lm/vCfvzRWTPK+mUGb0VxxQwB+ikX0Imovy7p8jsbvR0YSIOctO4n7StYeXIP7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ly4RwH/g";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B92606A323;
	Thu, 12 Nov 2026 09:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B92606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ly4RwH/g
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8w4AE4149412;
	Thu, 12 Nov 2026 09:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WZOjYaEo0Xh
	kb1NPLiB1aUDQ3jjc+rhCfDB38OU6Bew=; b=Ly4RwH/g8ipLSE2Y8H4PV2sIrqo
	M4+od3llhNO/SymrsBRliHX1PVpLEqUekPKdbUs4XUoUsTLOZQNP4kR4QPDHofgT
	J2MjINHY5W3axaRSxzk8PObX9kCzGgGKzgYlJdgZiWp84yBblq1EKr1esTKtQY5J
	0wQcMkVc4y3PamTzdp+1vcRYytgsSGeTk5UwZPo7GRGgAM4NEUE56THxPcLS2nFS
	QclxN9i1umJ4q7qcET3gbfG204XcEjjmKV7JDOLeS8ehEGaENF0kUspTPnGY0k84
	q72Cc432VH1c4Zu8kDkjG2EcSQJSDip6n/Qlmy50D686AlgQEnrKgq4TN9w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62nvf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 09:02:33 +0000 (GMT)
Received: from pps.filterd (nalasppmta02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8x5Xb4155259;
	Thu, 12 Nov 2026 09:02:32 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-kumaranu-lv.qualcomm.com [10.81.89.194])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AC92Vtl4163788
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 09:02:32 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4187942)
	id CF8D3AA8; Thu, 12 Nov 2026 01:02:31 -0800 (PST)
From: Kumar Anurag <kumar.singh@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_mohanull@quicinc.com, quic_hbandi@quicinc.com,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: Add dmic45 support to rb3gen2 vision mezzanine overlay
Date: Thu, 12 Nov 2026 01:02:31 -0800
Message-Id: <20261112090231.134176-1-kumar.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027115115.1822423-1-kumar.singh@oss.qualcomm.com>
References: <20261027115115.1822423-1-kumar.singh@oss.qualcomm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: x7CrkuploINEDWH4Jq6YM8HIHrPVVJP1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX0Azb4Z+P0TcO
 mrMoKPrnsRagcKxRDvd/c3w55jDzljbCb0KpYf1lB1w+LY7MBgrC6QDXWBipkhhiiiW60x39cb+
 OY7ZcIQhAzFRMP+/lsWwvaIN/nvIxfMblVg2SHCMv4XJcYk+hjvyctgOJQR0oT2UqsVq50pNnja
 RgE+VzbJX5ZsYSKrHMIyaOSrG/mnroohXyTXg2jiO8deXTAA+z62wCptY3vwQbZbnNFOjYLGXVm
 ryg+5jc34fxrdB9NnGMzVNe3KE3p/EJ/NdPpPSugB1UHZcc7aGZsNwul9FGCtEpqUmUOMY1IftP
 iEoQzShLtdWIQNsVPvzxLSvZPfwkB3J8tnG6mGrhmbOTg2FNEL9PQu8WhTXikGxeTSi2/fECiup
 pPed2lYxHhimhdUebVkz2GQdYSjpJXXX0lRJmeRwKqNCkWrOtp+5lHBONjl6Etag1UdjenMRLZ3
 Pm7eTzROshceyj4cj+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfXyKkyaHQxElOg
 PlTOuJqJa1O1P+JcR9K1ccwqQ9NMOOfQggXYhelAV9EMOQqm1hhS9w9ed7DUafcO32e8VS1pI7F
 Hx5tDYCHFmJIvmzvppD6mIj5vEjuQ6k=
X-Proofpoint-GUID: x7CrkuploINEDWH4Jq6YM8HIHrPVVJP1
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af580a9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Q2MlFL10D3EfIEKmRpMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120035

Add pinctrl states and VA macro routing for two additional digital
microphones (DMIC4/DMIC5) that are present on the vision mezzanine
add-on board, mirroring the dmic01/dmic23 pattern already used for
the on-board microphones.

Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
---
Changes in v2:
- Move the dmic45 pinctrl states into kodiak.dtsi instead of the
  mezzanine overlay, since gpio12/gpio13 belong to the SoC's
  lpass_tlmm block, mirroring the existing dmic01/dmic23 definitions
  (Konrad).
- Link to v1: https://lore.kernel.org/r/20261027115115.1822423-1-kumar.singh@oss.qualcomm.com

 arch/arm64/boot/dts/qcom/kodiak.dtsi           | 14 ++++++++++++++
 .../qcom/qcs6490-rb3gen2-vision-mezzanine.dtso | 18 ++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..87a67eed84d7 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3060,6 +3060,20 @@ lpass_dmic23_data: dmic23-data-state {
 				bias-pull-down;
 			};
 
+			lpass_dmic45_clk: dmic45-clk-state {
+				pins = "gpio12";
+				function = "dmic3_clk";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			lpass_dmic45_data: dmic45-data-state {
+				pins = "gpio13";
+				function = "dmic3_data";
+				drive-strength = <8>;
+				bias-pull-down;
+			};
+
 			lpass_i2s1_active: i2s1-active-state {
 				clk-pins {
 					pins = "gpio6";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
index aceafea45343..11c68f3120df 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
@@ -80,3 +80,21 @@ cam_mclk3_suspend: cam-mclk3-suspend-state {
 		bias-pull-down;
 	};
 };
+
+&lpass_va_macro {
+	pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>,
+		    <&lpass_dmic23_clk>, <&lpass_dmic23_data>,
+		    <&lpass_dmic45_clk>, <&lpass_dmic45_data>;
+	pinctrl-names = "default";
+};
+
+&sound {
+	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+			"SpkrRight IN", "WSA_SPK2 OUT",
+			"VA DMIC0", "vdd-micb",
+			"VA DMIC1", "vdd-micb",
+			"VA DMIC2", "vdd-micb",
+			"VA DMIC3", "vdd-micb",
+			"VA DMIC4", "vdd-micb",
+			"VA DMIC5", "vdd-micb";
+};
-- 
2.34.1

