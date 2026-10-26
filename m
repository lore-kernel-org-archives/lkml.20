Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021129;
	b=rSP0Qw9faxg0LC3343i7TZIW9+jNZTWhZxbbev8GwZIv2VhlOPDOjFBxMvxZ2JKOHsF8
	 1csqf3/DNFDf4h4yTOR2DuuMOPis4xMDTlonrgiz1kzM01VkqCTbmm3i0e/N/P7WD4luA
	 6r+dcsRO80h3V0KVzEhVkjTxJ1i/RseWlTAe9imIrTR8DqA/Ma0dP5eS6qYuzBk1sbhMe
	 URIqYYlninEDOLc5k72mCVaQHTqJD+42Sot5mYQUka9V38qOKhbGAZGpPlcPF8PjycZj1
	 W+IdZQ9j3pWEDK6kTS0hW62VsifdB+TeiJyJ4XsxL+xYpsWwkGMoqrFzTWhJSKVooqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021129;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XZQMh6kGWThZgr9mi3PxIkM1ngjLILTbUb58xJC+eoU=;
	b=llVfKF2IUakfDqFpx6EpK5eWkpZBW9hSDPdU1hIkBQ6HjnV8ZlS5BMo3DV/VhipwbTu3
	 vqrzDdrlP45hHcDq2Y6seQMclx5VFLWACoqByFcpISuDmrM6dzZrLs7yYYi+HFmI4rpXI
	 2/FVZU403LuFkQ37aU3ErZVBY5XwOliX1I/AJF0OA+HaqspiW11ZaSPG3IDnBfks+dlEs
	 8iu2IYs8XA5a7Wd29dunCK2j7MKlGjLti/QJNm5i7cBgPu0i3WC8b92VEfN8B0MspSs1a
	 B72/HBvcRfyC/XRRSoUwtJMhvsvTBGxg841crx/7xcMrKwOI4JL/MaMUIzZ8h2ZyLVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1CHj191;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A54606A328;
	Mon, 26 Oct 2026 13:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A54606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a1CHj191
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtM3c2009907;
	Mon, 26 Oct 2026 13:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XZQMh6kGWTh
	Zgr9mi3PxIkM1ngjLILTbUb58xJC+eoU=; b=a1CHj191z4+/lGDjRCFBu/ovLbm
	43slDdQR4aNoR/OweU283kfyOKWhMXpFdNFgP3Mc573hB0xjOaj8IFuEZ54xDMYO
	OZo0zikRckFtf8Z42IFWBZJdIAeb9MZ72LrOOHg1Lti8TWnHS8Ymhr3Oy+gmevah
	Juj/0aAaarlHqvPKCltEUAXafIqYxH8aEvTqdhWiA+t+aCY91GreaGRHdjSvlKkC
	BzMsHxW+7Zt30PCT97cXnllbpxLafUz8aJTm6D2vroSR8y8Kf3gwsi1dw0n3ZrQb
	PbMz8VWeNKfyLOvZOIhOWzyAjF4fR+7dZ56zAM4rreedEFDo29Kuwu6ej9g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27xjdm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 13:25:26 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69QDPLLj1853299;
	Mon, 26 Oct 2026 13:25:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ks5-hyd.qualcomm.com [10.147.255.18])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69QDPLf01853289
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 13:25:21 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4763723)
	id 597B767B; Mon, 26 Oct 2026 18:55:20 +0530 (+0530)
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Karthik S <karthik.s@oss.qualcomm.com>,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>
Subject: [PATCH v2 1/3] arm64: dts: qcom: qcs6490-rb3gen2: kodiak: Enable secondary mi2s
Date: Mon, 26 Oct 2026 18:55:15 +0530
Message-Id: <20261026132517.1133138-2-karthik.s@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026132517.1133138-1-karthik.s@oss.qualcomm.com>
References: <20261026132517.1133138-1-karthik.s@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf54c6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=1frBiwT6tzY1ShJHO8MA:9
X-Proofpoint-ORIG-GUID: Ks65mme-bD2DKgM1ZDjpUpe14aZUbbUX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfX2Eiyx6A9BUSX
 3HuqHawdjbKsi+Y/p+4zAFVPcJbk8KcftNlIBV2C1cwqRHMaJYFVz2R4YuGwQ/ku6SSYJTEtcMb
 PnBHRZH8nzrk1LKEyyYaLTj9+reYjuo=
X-Proofpoint-GUID: Ks65mme-bD2DKgM1ZDjpUpe14aZUbbUX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfX29aFd3ybZQ6r
 iGZ8JaGhYazTy8WgXZjcVSlHEJ1QbxM+Cbwe4XCfnY1+OYxrTNIfaNxIVjeQ+kRmi/NsalMGzJg
 H7Cp7yNJZ1ufANQkNQ3LDdPr4qcqRjAYifqDNnvgN3YZlz1e1REP/oG5Yd/YgM3uIJKOmH7yOkZ
 qayUNf5FIFmZ+79ZjCQEtPQSIPxPq0HTfn6Mj36ge3ktZG6+3B+pgH7IB9UwAsHkLesGdTEdteA
 6Cy5No/tUSv28ulm0Lenuy1b/snEXvnl7ZJwOvyyfs+crCjMlwLjNBBXSLD/XQ9buAU6muu3kY2
 PRmlw7vrIZbzwggfLYoTUhPZ3P8A8QT/39M+8B1zCkdO3VCYss2xMMzbHq6ebK9a1poMsY4MEek
 Ts+MOLBh0IOVDgdOhe8ZXgnYhxBb4Fy4vwNeBekTjTHvCXjjbdtzPpfNPOt845tjA/+fyRXvyZS
 mzJ7N/IB2ZVJETg3jiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260053

Enable secondary mi2s to support HDMI audio.

Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         |  5 ++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 52 ++++++++++++++++++--
 2 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..ea17d8b0ac89 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -6683,6 +6683,11 @@ mi2s1_ws: mi2s1-ws-state {
 				function = "mi2s1_ws";
 			};
 
+			mi2s1_mclk: mi2s1-mclk-state {
+				pins = "gpio105";
+				function = "sec_mi2s";
+			};
+
 			sdc1_clk: sdc1-clk-state {
 				pins = "sdc1_clk";
 			};
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a21..cd3b065a2049 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1186,6 +1186,9 @@ &sound {
 	compatible = "qcom,qcs6490-rb3gen2-sndcard";
 	model = "QCS6490-RB3Gen2";
 
+	pinctrl-0 = <&mi2s1_data0>, <&mi2s1_mclk>, <&mi2s1_sclk>, <&mi2s1_ws>;
+	pinctrl-names = "default";
+
 	audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
 			"SpkrRight IN", "WSA_SPK2 OUT",
 			"VA DMIC0", "vdd-micb",
@@ -1193,16 +1196,15 @@ &sound {
 			"VA DMIC2", "vdd-micb",
 			"VA DMIC3", "vdd-micb";
 
-	wsa-dai-link {
-		link-name = "WSA Playback";
+	mi2s1-playback-dai-link {
+		link-name = "Secondary MI2S Playback";
 
 		codec {
-			sound-dai = <&left_spkr>, <&right_spkr>,
-				    <&swr2 0>, <&lpass_wsa_macro 0>;
+			sound-dai = <&lt9611_codec 0>;
 		};
 
 		cpu {
-			sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			sound-dai = <&q6apmbedai SECONDARY_MI2S_RX>;
 		};
 
 		platform {
@@ -1225,6 +1227,23 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	wsa-dai-link {
+		link-name = "WSA Playback";
+
+		codec {
+			sound-dai = <&left_spkr>, <&right_spkr>,
+				    <&swr2 0>, <&lpass_wsa_macro 0>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &spi3 {
@@ -1564,3 +1583,26 @@ &lpass_audiocc {
 	compatible = "qcom,qcm6490-lpassaudiocc";
 	/delete-property/ power-domains;
 };
+
+&mi2s1_data0 {
+	drive-strength = <8>;
+	bias-disable;
+};
+
+&mi2s1_mclk {
+	drive-strength = <8>;
+	bias-disable;
+	output-high;
+};
+
+&mi2s1_sclk {
+	drive-strength = <8>;
+	bias-disable;
+	output-high;
+};
+
+&mi2s1_ws {
+	drive-strength = <8>;
+	bias-disable;
+	output-high;
+};
-- 
2.34.1

