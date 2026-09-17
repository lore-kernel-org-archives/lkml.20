Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9993E4DD3D7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645296; cv=none; b=WpCLTnxvd+gpm46kknyDDc6Zg930u+zTa9UXtjEI9fEEW8/eXZrEB98hVIWG0ywdL0Rp8wX8dOb7wJBRosDOxYApiDiVf9BIpGiThImofIVSBQP7x2ZT4XjoV2MWD42yYphMv41OfzRD3gP5qjREgD7LhQ8w46B05ZKHxaEbhT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645296; c=relaxed/simple;
	bh=0clhG3sjpOKi9CnPJRlWEs4VtjCAuoD5Rqe1Oj+QesU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qGeDyRuaoiJppi2ycxNwdZfvYDDVSaZkyCrFTdsPo7hxTJTbZdRC3SA5TRXCy7V0SzqZ7+kEA43cjX9s7Ms4WoWkC5PAxFRzwWdv2Q07z/Ql/IJ9FVtnH5bIlYweof3Evrwvh9GNIZI9zQ+VVMTD/1AYC5hooWxt72BM+voaGUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARZCI5J/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1SGkmzP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARZCI5J/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1SGkmzP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zo9V1698625
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtpZ1UwOnwR1wfa+XkNK9I5ShlxLooktMu/pyV8I2Bk=; b=ARZCI5J/a+gpzY5l
	CVUpQRr/eJFIOCADPVqyFTyP8roAC0T1nhsPpBNm8Y8/15WnVnypgqvtLVtzpBSn
	LoG+ViR2uuk/uQU0gefp7nAGqdPyq2dCNHXI2eM3BGfqil0DLR2bt3c9cI3kGyLo
	M57Vy5vLz6ir/+k26ZvpeWn2DZ6T0EsXBpL5zk7SkL9HMOluwiJnBQynmL+Aou7v
	9NCs7DlE59T2TyMhnDmft5Fo1VmDfRs0BCIPcZ3NvAVNivq2s8k1/SHQPg1TrN6e
	OPm7qI0C75pxKOKBZxOT5dNBDl5WRjf0Uyh5ZXWDWddTVYrazl1aNgG29r+/akFc
	70y3hg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxaycb3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:41:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86261e66700so795186b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645287; x=1790250087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NtpZ1UwOnwR1wfa+XkNK9I5ShlxLooktMu/pyV8I2Bk=;
        b=g1SGkmzPY6kRRtukhtTMHr02zPKVZc1PTD4xCjFZUlBTOSWVpShqMXsgGO6jnXSxb2
         yQW2/9O8D/CLs8cqdz3ngsLH1uzkvcsHAQkKVexS3eFmmVzXyoxiuvVtEoe3fvsRdxIZ
         Z2iiqfvsTb1x5WLS62aVgcHQ1xAfVb6e9IBuElj6lzi82CBE++7o19cB6ISCUIymSiPu
         HtFP40XyzI2Rnw9Ytj5QsWK+k7pKggOL2r3q6ObA+xZmJjCdVjgI6bgWsvj7j023g/ak
         x72HtUwmJr7z72kKXbM+M3BT2N/Egvgs1M4VtBp9WFpSGsvj0Og0K4HHibBAVX994fur
         dBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645287; x=1790250087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtpZ1UwOnwR1wfa+XkNK9I5ShlxLooktMu/pyV8I2Bk=;
        b=Fg9aKo1ywpnGytOIaSX8DL+qWZWihD78xAr4zMJqfBhTccnlGf0XnwmLrQOah1Qu4s
         k/5D3QvNWFTD8EvzwFTckmP6frfBzwpgjAZy6EVmkLgWyrXBfphHtJA+4Mj6cYsy0KWk
         qqRqhv0mxa3T8aW1lKOOWZOZAu6cSOe3ivlwsYbLZts67lonn25G5dY2UUGU8hckKm4j
         GXeRlBdDI4aX/1EBU0RIk27uYg4Jl6mNLxbe/a26jZHm6GYNHPEpUD95vKb/4IZs2NdS
         F0FMIXxULDsy7k8DhX3CsxLkLFE+wXrBmyodRwdxX8BAMAwoCtcmY+Du5e7qmcldH2YI
         XFOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzX2qpLlEnYUBJXlQOm0FACJzbyuLWrlb1Jq79xbph1O0VwHZnXUsPyWflclVJiz5TPltmJ2AwuVD/bAQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++nuU/NpQy60m1pgQi9P0exUp3HNhcB+461rVbHwpeVc94oIfLHv
	ccyC8q2zb+I6F5fFE2i2E9c/KZspl3KKhlQAWb11KK37OPG4PqNbuVMfPqqFkXoVKtByePWy8k+
	qLhYlA6a9iy40SUQ5/EYF4EZKNh/4UK7/J/onkhknqB0NpsNb+XEMHuwYdqsqRHqzdrY=
X-Gm-Gg: AYBFou0T3hzfwi87ZHE3vQTSDsgCD8fba/2nYCVLma2Ixm9R4rLmNnD1JhMk+hYy32S
	i4uDrt2yjlivPPDbtdmJB29fMW87nIeep/s2dAOlM05dHecnplxttJAN90VSy4ux+FYaWEUGc7J
	sUKh7VYi9sj6XjJVytCChzn1509RH5fIoBTVgYONuDWPDfcCcq6irzWQHjV+kLzqbL4+R4twnks
	pCFXajEiPwClWPOX4OrgbEF64dBO1MngFdFiP7Ct34RR+w3r1zHXwAUV2r7vjvRc3THkB336766
	SK9drNswyCU60bOcjd2OUWuy/1S26axcj+53Lc7aYLEhghYCI6lxJSnMHOasttv/tUIvoDNCU6E
	rcYZxYbu/NQDxQFTA+xN23WMOagA/aQ==
X-Received: by 2002:a05:6a00:6caa:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-87236ae8236mr13475376b3a.2.1789645287194;
        Thu, 17 Sep 2026 04:41:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:6caa:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-87236ae8236mr13475325b3a.2.1789645286774;
        Thu, 17 Sep 2026 04:41:26 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:25 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:01 +0530
Subject: [PATCH v8 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=2744;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=0clhG3sjpOKi9CnPJRlWEs4VtjCAuoD5Rqe1Oj+QesU=;
 b=q9ZHy4b/hYrpmM6KJAM4IBhaNiSsWe8M6eZGolV23XCjbGyp0nz+xSWis0QNMf1UJgu0D8lXM
 MQ8jU2CFlxkC1NckBKAvVifToy0pmJ8JzKI2Hb5OHXBs+1ml6iYZmfi
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX5xOzNHFrZXhi
 HZqEo0aCJ2gm1sVonvxlXyzSgDvG2GqNnpp1YtEpKrurui2wradu2lbJE92fpmM35KaSGTuydrO
 JHXVv1V/xCzykDbivRcj31EY/lMWWKUw/quB3ZJfSTAxC+yR/+DMKgpV7b4zRtsZw07iLzKHzWa
 u93CUV7K0u0aXMsqEzxUL0OgtZyAOW/0/DPKcLdoAHnjIINuAMi+6Aw8WsbOiDcBrzroIMMnj6O
 AeZ5bkmIbwoupVxcueN209mxGhaMpGDuYPwiA00R6k2Ln8BRjVCF9V1C40C6k/a2pCbt29eAbn7
 GmtG6IzJ3Do/jgDYB20CosN9/3dgDhAIzv/Avrvo8SrZ9JvVMsJ3thTrzHqqXcc84Cl246n80SJ
 AiSa5kryTqRXFieW3B6K6TCi02EhsorP3HBqVI3aXrmDehgIGqWPVTx+AQKire7+bOfjQ6vFalR
 LZcRR8QW8HwBa0EOE8Q==
X-Proofpoint-GUID: uAQD7b78xaVzh6Kn9m5ZpZ5W775RGSuU
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aabd1e8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uAQD7b78xaVzh6Kn9m5ZpZ5W775RGSuU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfXzc+3yZ/0SCfK
 C4/3fzEy4AJfJxbysGh+JyRqFanY6spEoTcnXWsPvwRgSZLmg9pKRnhvTIvYCQ5bIGOI208kkqi
 tjk6Plrt5vS97jutgGx5YGJImlolkAk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170162

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index faa1f02c01957b8ed86b5e8fc659c856d574a8ee..5f64b4e50967d61846b7b0c565380a58e4ba3210 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -892,6 +892,38 @@ qup_uart9_default: qup-uart9-default-state {
 				bias-disable;
 			};
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -2077,6 +2109,43 @@ port@1 {
 			};
 		};
 
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

