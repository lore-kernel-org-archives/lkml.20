Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8096E51815C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061576; cv=none; b=dWGEsay8tJQUZ/LJ0Ut9pQbIaqub6gw6LK6u3V6uJZdnBsQimWt+X/cGEYfty9kpqNPThkHLKr9SDXZFmKKXC4NMdSVdCiBuVdroihPDiCXYiQFB2oC4+FSmmj0WPdoOkto1ZQ2dwWyS2U3WjOl5lti3f+wLcXquc1fPdKxg9iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061576; c=relaxed/simple;
	bh=IFYJFv/BVGKeNkstw3qZT7Nr2PwNdhpO42sK5UPt5u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Elxwl5pDnGw2Z2E9JndUXtD0OjnOFWMskdQh7GkE4addUQz1t5f+4IYP60sREsueBRuqsbJ2mdDwTzcSMAgTmrsVxK12d6svJe4qpKDlo3W3+waO77e+wWd6f2VenhXJVXQDVMv/LlW7VVuSZ/u67EgiH1qCJPHv4UwX1SlhLnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUZX+ulH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAZFK2gz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUZX+ulH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAZFK2gz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jWYj2416945
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31+p/gT2WzggyyNQ+FcFlFemDslH2J5Ks/352HC2d/A=; b=OUZX+ulHRo+3a9SE
	a0OVkHRMKs/wVVuYbWpTV1MxXv/gJzeNOag1y01ZltPz+ht9qR30iLSBH8iezLpz
	Gqy5KkdOgfRMRbTbAjaY1nBQRxZeUqPknardRBpkF8GSlJ91kfMWyq5m8b4muVzk
	Dzuj354/yOF90Na01sSRtlDk30HR5Lp7affnhH0QW72VBJDomNn7KPtx+BKriOkA
	nJQEHlOaGry7TDgHH8G3Y3qs3Mfk7Vs7+fnZMMz9Y9rclS1CoSmDNjSlaK/MBjlB
	+/NXx/4yj9L5iQ8ihM90afkz1xYXzc5PdYxQRd+N3/ZqIfy7qyVUr9zD64kAftVV
	X34EFw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhhpwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:52:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e941532594so16722325ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061569; x=1792666369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31+p/gT2WzggyyNQ+FcFlFemDslH2J5Ks/352HC2d/A=;
        b=AAZFK2gzpnav4X58RZmePcBreM7LIoSbrlqxziDUkspMkoEvOzw5NtK0/30kbPUpMI
         J7k5ksXwDtx1o88NLFjSoQN03Hsm8PU5LBUTZGsoYOzEh4EQw3EgjEIXbrd7WvvZyH4E
         U1UNAZKW7ArMWM3VaPz1HUrLoDE4Xz+W1FURjMsujnT77GHXZ2dJHLeJRPciQkFaukVa
         V8ToFcGeqh3fDhLUrqYgD72znaLc6/jVwmrdULj5mCC/gUsiqTiPbH0FyKXXDoTIL2zA
         Z5Vi3u6evn3kDZ7MoyfiITs3aE1SgTbfjUeHonjUyVzbVW7d4MtkSZooSwwAULNPRKMo
         jxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061569; x=1792666369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31+p/gT2WzggyyNQ+FcFlFemDslH2J5Ks/352HC2d/A=;
        b=FSQTx83bJtklexrmYol3ifdrYaDsgv2+6TXvgv022Ch0XfSdl9NYYTxdtNKZaUY7aZ
         JjmP3MG65f6Ylf/Ii8JX+ck9p5MkbMu/8qIBTMRnSmRX5uEM+3Jifk2yizcucJkfQ4xB
         7s952uzu4ILCkipCfr21KGIdyKTov/BLJxhhUvxYz3UdeUNVvJmmoYhnk+eIJZPI62aH
         D+Cgq6983yCvP3779hGaTSxXFbq5gr4V/Kr+CBGtrGmPP3pp/lCKP4FXJ7FSW/4toxXh
         F9ly3FnFTtPHtyVcz2+JDKT54gISraRzJ6l831s/gDlYZulaXwbX0UIHrAZncmnIsnKv
         ReJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwXjzCsnkq3yvaniD15ZXraqVZlxTF76Ddg/WB3GbUv2XSITRKJ3g6LckWZ1Dye6J+yemuBz6AzzeCxvY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvBbc7x5fG4Vz+TWrEFUXIpPWJ5dPsCQQ0JoHSaky+hd87dVlw
	qugfytPtC6btZrhXLZ0QkGjRkNtEL7AzEc/TeA0Hedn2Xw09Oie7qgh1HnBsUJW/8qAuxSoCSjf
	4tEb8z949YqhK+y0UYt6xp8cGEl5gwzcBZiGkwKJT+ODU0oV61hnTeecOczWr/4vfEwc=
X-Gm-Gg: AYBFou0KaHOdJCzVVDUkRpPoqN6NqpH7pWTtpXFSBkuPNeIF1fEZ7wXhII4HcrArZeK
	DUWSSD2K6ZvEN61taZmsiMhjzOYWqz2k3LdrxT3Vg4tfSIfq3500K31ZGYEQKH8uVptBplmPNhI
	XW/LOMS6OOBthB/xw/dNfzg7gpQZqg8YCsz1n0yL6NFBIuLHiNk+jEKe98ylCB0nILie3mFJg6q
	8r8R144ZpF70RwcU7fThKtFlN20LFPTsShxlEuT8XAzX3dwFuV4TbpjWbQgc03UNxShTaYM964n
	QRz6whzNkl48u0kgLxdADMQDYo8pg+J76PDQV/9Oz+wfidUPaUcQUifejJbWJVs9Y0cDxtyzAB9
	dghdrsV21hVqR4nCgo2eQLIqcFHrqig==
X-Received: by 2002:a17:903:1205:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2e95b4ed9acmr15403225ad.51.1792061568928;
        Thu, 15 Oct 2026 03:52:48 -0700 (PDT)
X-Received: by 2002:a17:903:1205:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2e95b4ed9acmr15402975ad.51.1792061568456;
        Thu, 15 Oct 2026 03:52:48 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:52:46 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:27 +0530
Subject: [PATCH v2 2/6] arm64: dts: qcom: glymur: Add CCI definitions for
 Glymur
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-2-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061550; l=5464;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=IFYJFv/BVGKeNkstw3qZT7Nr2PwNdhpO42sK5UPt5u4=;
 b=zX/3bBWSdGzEYnyf620J3D78ZxK0L8RtCzil7OAEL8wMFJboP8r5kcjgBaiC8MkbO2qodRs0R
 81vzB1xTRi5BxR/c+xMfgwiOehxslQ79I56+k1B8Fa/ylmfzhxcwemf
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX0kfaewpBpriN
 1r5EqM6NO6imZA+dXL/OEXyRdYyDboaLQNiNRXXQ4LkkP3xq8Gq0jD8Yk2dWtX8W+N8kkQCPTgZ
 FavC2jfj3HkhkEyAnm/6WnANPqUcxKZMjdi6BIaleIkTFJgQnxkah9Zswzj50dyoMpSgzSUXk4g
 /M9563Xmvx8kfgATw/RYgYAI5sjQntHO1jFM7g3J/qhEiTCGMp5O5AoAqcAN2PrqR6rZEptxCVS
 ZUl0YGGJDqy8WrGDXt2Tq7eHTM9XL41+WpqUVTOAtE+HZjzYdQbtwPanhrErkzj1uZfQS8JraEo
 nQo4W1WHWng4ZHhg10aDiu+uc4Osx4J5aWtTh93XVAUG4o4PwGVDZ7DZacDoGFDJ6rlwKjYMY+a
 cYKKtNOsAOKQauFY6XoDQ5I/dmQJlMlGTLwMgDr5QrKKT33JZzZm9l9Zkk0cpKmkUzR3WAyI50g
 rJ660/XlzbQJWShzTSw==
X-Proofpoint-GUID: MOJ0GO-wQxfFgz4aRkHhAPqTuYXBIuY4
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0b081 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IhPOVdJj7MU1JEBa9wsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX1ipMNQInsyZh
 T1Y8BauaNzzTs1g4ahgRAc01Fgh3bsA9g79Z4OBmPu27bMJbwa8ADvXX6Cab58lcgcnQqP5+L8N
 BFV1mh2mZUqjxsMuc59RZ+u3Raf2KJE=
X-Proofpoint-ORIG-GUID: MOJ0GO-wQxfFgz4aRkHhAPqTuYXBIuY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

Qualcomm Glymur SoC has two Camera Control Interface (CCI)
controllers. Each controller contains two I2C hosts.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 202 +++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 7609c15ba8a51b8c9b6e06a48410df1128316358..fce3651c47f403e01ffc2a44d6d04a4abba1f310 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5408,6 +5408,80 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			status = "disabled";
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,glymur-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac15000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 456 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_0_default>, <&cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep>, <&cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,glymur-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac16000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 859 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_0_default>, <&cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep>, <&cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb6000 {
 			compatible = "qcom,glymur-camss";
 
@@ -7074,6 +7148,134 @@ rx-pins {
 				};
 			};
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio101";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio102";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio101";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio102";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio103";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio104";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio103";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio104";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio105";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio106";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio105";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio106";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio235";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio236";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio235";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio236";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			sdc2_default_state: sdc2-default-state {
 				clk-pins {
 					pins = "sdc2_clk";

-- 
2.34.1

