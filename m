Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AFB442388
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787550; cv=none; b=nfSC4zK3oPIP9jxmvewdDiktrtR/VjfZSAYuZrgBs8Euzp4bKMprb4ExBdnttftdbQmdwXAYiQQZyToHRahiGBS5+KCzWqP9siOtybDkTNNdtPTquE8rMfZeE6UnzKAvsHvX1gMoj9hyezO13dhXaYfTsYUquvgDvV8xPDFKEOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787550; c=relaxed/simple;
	bh=O/mwPTGxb7Z5iK0S3e13ry4ne/HCup9vhqrOmsfhbQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QyX8GbWLeB3O+Y6vjhheqkKozXlA9IGCBoDpZH2YuGNeIrGP/nbjsUWol8tccz2nvy/HU59Mgn1x2bcKWqZHMYIpXBWBp4oVXaS1Mh4GTEFAe71764Br2JP3NU4+fSxCvFV1xi7tU99EreKZ0jDKv9uJ4YfW+7OoTcr+sV04K2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ql0H7s88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PmMsMEla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ql0H7s88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PmMsMEla"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55uog4068709
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aB7HIxGBOwgAfi43a2agTiC1H63IqRhV4118dz4m73U=; b=Ql0H7s88wbD4ISAm
	+F3aY+cx3EwR4CqOeYlTjzNzPNGboKZfiu1t5HxMZ1IcaWqXtxkouhnIOqznGs9b
	esuFusMo6QWuTadAZysjGpuLwwNhFFEhlj51EtqYG7drOz8fwMqCRn5oSwEJ+q0W
	HlPf4imJ8Mox09FFptRr2XfZzX+Q9T2ahRxkoTTJp7p6Bqkv59JDqyF0/wt3Y1vt
	tzqpjZ+/zbjuaQBJoRbLj3hGjISmVqUFnrpzdcngN96wvAJ/f4xPc81mgPLdyclr
	PNu/VqhOuVBjk5SRpuS8PpsNLXmdNEjD6JC4gjE5vHOLle5k3ggEwXuJD4me53Dd
	Qa5m1Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjn6af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:45:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ccca9481fb6so856211a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787542; x=1792392342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aB7HIxGBOwgAfi43a2agTiC1H63IqRhV4118dz4m73U=;
        b=PmMsMElaKxflIrAWcKWT6hzoTJ/pOSflDshAxs1xgxc2dFMwukxDji08DXX4rNEkR1
         nin+ahiJ5xQSumS6jDV66OKgLoxd+QnKun5D7B3CBfBH6Gjafmla7Psx46i1HWMp3HdI
         ntSd7V5IRKeBOiJ+P+kRjLr8392KUhClMdO/OTNAM1WoceVJ37tzQle90zbw2uq9pqzX
         7ogQ8P87aYkS+bQYMUCCDEtaz3vP65NGhKUdKdLIuofY/fnyguEDV/a0iGhz1dm/LUH7
         R/b6WMRcmeb8NL2dA0LeUrb8WYAmQ+B273HzMubB5LCYCJRtU97+K1eZ2V7JtOhUToAp
         4D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787542; x=1792392342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aB7HIxGBOwgAfi43a2agTiC1H63IqRhV4118dz4m73U=;
        b=1qgeMVYyuaEQgvAAqVy8HKJDpyBOWHIrCXYQkw53i60lgFy1iPFCzPzrXZCuZ51OKV
         8f7TleEBCT7hzh26+pDgiabHsB/jCeXq/9DEfHjnYT7SBAwEDa9loRQXMzZbzhdtb1U5
         WCzLmqIM7ihzuwzEFO6YQw56XPLQOVlFC7wxgV8j6V7CcXKbE9IYpbequq3cfQjDoWES
         J3qRc4MtxQsCp+dUDRz/MQJt87XEgcySQD0RK4RVVcPc8EbG+i/h7UUm7IF/Utl1lVxm
         mDJON5Zj/FZnOo74bje3J9NYiO0dzOqIc76N+QWKGpUnbJTwk6wkGElxbJcn0whKDN2W
         VK+A==
X-Forwarded-Encrypted: i=1; AKwUvBz6nB86C/P7Rff2LHezYEKf1zgGkEIQkqJDi5j0I0G+hi3IjHKHfK+OfplAxJqTvWpNlQHdEZQOoq6/AJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNWC19nWwTS2ixaN18BNrZyp7aW1ydq/vXLriV7Xl7iPpqvd9m
	shSiyVitcSLddaly0+73ooqAhTyvUV893u0gQgvSioZspKeodsI9SSF3rpjkbIEw6NX0LqsHdpG
	E63S0iTW1JLLlk+Tal/8+WO7x+ORUeQoVRLaxSLgzQIwZ9DFJJ91rJd2ftUaTTHJ/xJQ=
X-Gm-Gg: AYBFou0cuSY1EnSgKgo5SXdk07QikYkvodnzkpZhs8tx/3GxUwmmO7oxJcPB8rp6XDU
	4qpFVouZkmcM9xdXnxyDFlu2aZeKYbIuG9cxftlfDdGnpViDkeBFN78/OqHexQPlC/yt1JkBIer
	F2PNUtf0loMQv+nbnCK9+dImDIPnnX8cWatmWqWtOisNDboLHdjOdDEIv35t9+Z7VmwU9zDaxRO
	UlQsv2mkhDsBabxg/qUSHjQhWXk6c7IPPK04eeySC2XZFSHaFzBKUkBPmqs8B4siJhEg/ceL2pC
	aTjpY08HfQYFZ2IuYctw4+bMt06jgfX4dYrgGMgRdTA2yWJ1gur0E7xRMPGEjfX8XjlDfyLjZU8
	F4fwsOxk1HceaDidnfg5vJoBkCSGRAICDXyVuSMuTjSrPCLgwiOQ9LTSY4n1gKb4ywa5Knjd5NA
	kBJMcIdb5/gg==
X-Received: by 2002:a05:6a20:2d14:b0:3e1:5858:36c4 with SMTP id adf61e73a8af0-3e16be4eafbmr6675275637.34.1791787541901;
        Sun, 11 Oct 2026 23:45:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d14:b0:3e1:5858:36c4 with SMTP id adf61e73a8af0-3e16be4eafbmr6675260637.34.1791787541420;
        Sun, 11 Oct 2026 23:45:41 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:41 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:14 -0700
Subject: [PATCH v21 12/14] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-12-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX5TQcYy+iWpNb
 KubWGXfDqipkyPlkPBMb6ykmhutGUwSZHCMhB14LY+FhBGZ8VFn2gqCZ07CLZgNahrMq6BWnfXX
 ARkzIDdhd31kpq6cnilJXuM9IXv/XJ2jT2wxAsSi+yii9Whx3U28XRRSyF4PIqrJHTkktXUnc7k
 pCgvFdoZPuEhcIfefkj41O9sTddlW49r8ucFI0hc5uLI2cd7t0Y60GgejXRNKX0rqCVSK/xuXnH
 QDDuOxanJoVPAndMxPE65fVKjKBI7A2a8tOok0WO7x40e6u+RlbdfLhne974Iyb++9jBmcDKZpD
 oPHggtmzUjKWrahqxEjvXsb/5d/P46PTM69fokVm78QwIk9ba81xRIRmj+bYTbOkZxHrEyne1Ad
 aisasF4Ikwiphd2w2ibSc8WvosYMD3Wd+QJE/ZYuZcn/mKKFAoGtzTSN+kgXRGqN+edCLu2eGmj
 yQ4HynWE6CZrqwadP0A==
X-Proofpoint-ORIG-GUID: jt0oZV3SDSwPXBxsFCERbFVsMA5evWGK
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acc8216 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6uyy3mKblwRlHw_pSasA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jt0oZV3SDSwPXBxsFCERbFVsMA5evWGK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfXz6qOaT+HIkIK
 8DDuGTsSYponEug0NQ2cSLO1zvY4ArDFop50jxz3p6HvSzQKLIlDKT2ghRESeiaisbtvNQ2HBWH
 nTnTu9fCSxpn7ue9R5pmVojBVx5+gHk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120026

Add the three Camera Control Interface (CCI) controllers present on the
Kaanapali SoC. Each controller provides two I2C hosts used for camera
sensor control, so define the controller nodes and their pinctrl states.

The first bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio109
cci_i2c_scl0 = gpio110

cci_i2c_sda1 = gpio111
cci_i2c_scl1 = gpio112

The second bus has two CCI bus master pinouts:
cci_i2c_sda3 = gpio113
cci_i2c_scl3 = gpio114

cci_i2c_sda4 = gpio107
cci_i2c_scl4 = gpio160

The third bus has two CCI bus master pinouts:
cci_i2c_sda5 = gpio108
cci_i2c_scl5 = gpio149

cci_i2c_sda6 = gpio115
cci_i2c_scl6 = gpio116

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index fb282be07e07..62f02bff0227 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3749,6 +3749,117 @@ camss_csiphy5_in_port: port@5 {
 			};
 		};
 
+		cci0: cci@941b000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
+			pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@941c000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941c000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
+			pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@941d000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941d000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
+			pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		csiphy0: phy@9523000 {
 			compatible = "qcom,kaanapali-csi2-phy";
 			reg = <0x0 0x09523000 0x0 0x2000>;
@@ -4537,6 +4648,198 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci0_i2c0_default: cci0-i2c0-default-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c0_sleep: cci0-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c1_default: cci0-i2c1-default-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c1_sleep: cci0-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c0_default: cci1-i2c0-default-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c0_sleep: cci1-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c1_default: cci1-i2c1-default-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c1_sleep: cci1-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c0_default: cci2-i2c0-default-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c0_sleep: cci2-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c1_default: cci2-i2c1-default-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c1_sleep: cci2-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio66", "gpio67";

-- 
2.34.1

