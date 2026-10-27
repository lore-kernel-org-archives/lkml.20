Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101879;
	b=DBnm3juvG/8wxAI9iGUvYEXJfsxu1WxnhhuO+fAkuXJViN8AY9V2WW3ohOIcu5IhGCTA
	 MNieCTeAeN/HX8h7h2gZVRETPysWbexzjZl3Ds+JrXKWnLZTJ94a27ko5gqxYHXXRxF4s
	 8vxhtsIUjwFa+8/BU0dmi36muW9bQvSO8HUJHTJIYYcmzQFfrNr3Xw9QdLpAMVw7FzThp
	 /bIiftc1ZaJtBkcOcJ/6Dsd3bbiItOeoXNtcE0L+ze0XrpDJSv4pxNP+DNuXiPwvozlUU
	 6LYRL+wKY3d5e8wiBXovN4V1PMJNNgtARPEnCwFmSnJmEs0yVgiRoHtGOmNkq1gNSpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Reinject:X-QCInternal:
	 X-QCInternal:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F/mWK//sMGFsmSsEUJ200vCzHTJ/nzoybM/vJ3RQJuQ=;
	b=xxmUeYnottKEomzJpqFyWVTaEWQV8YtPhPtn9mTlXw4ZF8Xe7h0xJZTrpSQqujxG8iFT
	 AzN8n1nC3gxmyObzEgiYPMx+vxQer3uM1GDbKKpEQGJ0UwSPu5RPX7fszL9dwsNa6Eoy7
	 ZIlF8ERFDf43UxcNrNhAc+JumdMYqcFlNlhdLNAI36eYhWgGGhl2reVm7LXhHiAkcD0qC
	 6bFXTj2SgARy0+8o83Z3QIk6dP7rcoCdgyRo634GE1xKzZMQBq56WovaRajag4Vf0TN+m
	 Z4SDtqlSaL9c5Y7QGvQOHG5V78Ir1GF9847//Nes8DxRDBrVLzi8YY5PqcWscqnVi0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ir2Yu0N0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B78B606A32C;
	Tue, 27 Oct 2026 11:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B78B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ir2Yu0N0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeKVU1427437;
	Tue, 27 Oct 2026 11:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F/mWK//sMGFsmSsEUJ200vCzHTJ/nzoybM/
	vJ3RQJuQ=; b=ir2Yu0N0kTKGEBP0WKBzw3hdzPf/B1/e/coo+oI3u+2ljG9i/Bl
	ibWbOw6eta3gL9hWgIvMX7zp3fsGVgM6lk/VF/rOmB3bZVrsK9pVMw9MhKjriwZy
	K3XyYFwQbnuI+iRxyhixd2c7MnOhqgqOZKMNWrcQeuLP4qtJ4AuitWPhgL8z7JzL
	O2Exm//w0lG0BUOF001i/EEV/ToOlvORsMZP4Y20nfUwSX+v0Yn9ajrwOLcIUGPu
	Iwks/MpBe4lyatA/4jsHOXPNMi2in+sa/iM9EekXgwZidXZi1kd64yLIquExfqMf
	AI566feZ2MEiYOluDdtmhp74E8NTcC4SItA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbdvr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 11:51:16 +0000 (GMT)
Received: from pps.filterd (nalasppmta03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69RBpGLZ1386854;
	Tue, 27 Oct 2026 11:51:16 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-kumaranu-lv.qualcomm.com [10.81.89.194])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 69RBpFp71386832
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Oct 2026 11:51:15 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4187942)
	id 9E452A97; Tue, 27 Oct 2026 04:51:15 -0700 (PDT)
From: Kumar Anurag <kumar.singh@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_mohanull@quicinc.com, quic_hbandi@quicinc.com,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: Add dmic45 support to rb3gen2 vision mezzanine overlay
Date: Tue, 27 Oct 2026 04:51:15 -0700
Message-Id: <20261027115115.1822423-1-kumar.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX3kg6ZOgrQRSz
 1rZanyCcU9g94Ddxn+U9DQs2gHqend/5ucmWgajgVfIa+80NtmygWjbFp8OkErO/j6nOp/4f3Ec
 Nq49FoHB3txKIUKrkAK84cMQtV9JcDQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX5ijrR/TuoDPt
 dH5MMTYcPlpHYX9KSmJwzlY37oUh5rlOutN/xzoT6mdFKThMLo+6bPYgwof6ciUqmhqzxZuNioY
 RoMYNvBEvH8XhIrJUSgIpHA2BQNXPcabl9yqyMr9Dl6YIQjznsd0vyDRFavv1bhL9Cg24xU5GQ1
 xizYkdbOWUAoGLbncjByJRWXcAoMHZHyfjKGh50dKBWHXl3lVE317zLJkQ9Nlg9FmeWnBFC4Kh+
 qN/FtMGsCP9to+dO+w5VrRY1B3PYhctBiVKvDE/TQPr3SY0SnxJYi3FuSkTfJxsEk00+W5VyTMK
 FNBFQ0Fqw5tgGNoSI+xmGCohPKI/nmuXRF3WJmOE/vK3z9KL+t324Lg06u0ah76p5qrxVy5+h1q
 63sJdiIbJGGC0RfD6cEDnqcmFuGIuQzARRaL9fSgD+kCrXNDtUYC5rXxKjK3WYLh+Zz7SSBhvuJ
 zRvnXu8UEX0Eyav0SsA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae09034 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=rPWhUXy31NhIqF_oE8AA:9
X-Proofpoint-ORIG-GUID: Cgt7Qflgps84_PNOrDXpS7tt-pqMxJOJ
X-Proofpoint-GUID: Cgt7Qflgps84_PNOrDXpS7tt-pqMxJOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

Add pinctrl states and VA macro routing for two additional digital
microphones (DMIC4/DMIC5) that are present on the vision mezzanine
add-on board, mirroring the dmic01/dmic23 pattern already used for
the on-board microphones.

Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
---
 .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
index aceafea45343..0a4e6080a2b2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
@@ -80,3 +80,42 @@ cam_mclk3_suspend: cam-mclk3-suspend-state {
 		bias-pull-down;
 	};
 };
+
+&lpass_tlmm {
+	lpass_dmic45_clk: dmic45-clk-state {
+		pins = "gpio12";
+		function = "dmic3_clk";
+	};
+
+	lpass_dmic45_data: dmic45-data-state {
+		pins = "gpio13";
+		function = "dmic3_data";
+	};
+};
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
+
+&lpass_dmic45_clk {
+	drive-strength = <8>;
+	bias-disable;
+};
+
+&lpass_dmic45_data {
+	bias-pull-down;
+};
-- 
2.34.1

