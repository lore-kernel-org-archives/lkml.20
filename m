Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D444145D1BD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775690; cv=none; b=TZdw6CXufVxKCGl8PJmB/Qf4Spyk/5iDtOVu1F1tvEyGyJBkLKzyGd0vL7lshFkl+JrquGgWE2vCkOvI7J1jNfvcYxUl2OSjwO/sgMzGi/Wsw444vJ/9CYUb3hczz2zrrtY3/2JXLIEAuTrlV+TojkKydLBNOIIau7r1OxxfwWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775690; c=relaxed/simple;
	bh=XUtqXwyAv7y+q7jdJ2N1lPBjojXnko8HRmMf0Xs+VqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=liVfixMdVvUWh2s64bvvsP9ZcmxzpN2R9WcyFq8S1MhiIhQZBcEFsGwXgKRAlZAi/WdV/Pbf1qv0XDdKGFr1iKedIp0Yy/FOy42unb38RBWdMc9Gmse0JV09N1hviqpd9qYgGR6zhh4L+twygEA9SRbc7r2v5n94hMPP0W5Im6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ac0o53Mp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3G/MJRY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ac0o53Mp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3G/MJRY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bTsf3713177
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FL0MVUWBY1Gls3buauXsjpNLqJ6uT7ZgJugOpqe6pJg=; b=Ac0o53MpSM+cDuaV
	/Vm9u0nnJm22aA1dT1nSVVSjmUrtCxY1cJNZVIKrxXjI7qK7gTl9U77zDKX88Jmf
	NwsVM+kevX5qHKbCMgjzVe6iV1x+5W5oFHsCcnoxddJVXwbXnRFl1seEwQw9tJVO
	MUlGGvfNzpTv14gp8R+JaDphSAOZx11ST0XhswSrI7G+yqBGH8ALzkepGOmxV0y9
	+Ez7FBkhxiBpaRiMqpcd3lMIj7Zk2eclfykctOH7yVGKjvnCQ0dWrlMTwRGsI7OH
	D+IdYZgvJGxpehP1fFz4gu4gAvKOKr3TfXpH2naDZ0WDQ+i9zuwuqFOBoLGnV+7J
	PuAfLw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1g8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:08:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so4552949a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775686; x=1789380486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FL0MVUWBY1Gls3buauXsjpNLqJ6uT7ZgJugOpqe6pJg=;
        b=T3G/MJRYTNlmyMcaskeOvlR4oLSTosDKiqdwplQvRzkNp5cvED+8iRJNRY70NxeP46
         vK9Nk2ioEEWZwCwZvtgU9Qq6Mi4yYUtx//xrjBMrnOrPkDVyEN+Vw7aatgc0Me5OCwZa
         fOQLu6rsAv0tMtiD1QZ2G4oR9x7W0JIjSNLC1kdjUIWjpjNdTufM9H+UIoIVoFDHZUhV
         IzZIc8+ax9If3RSYw7Ji+lLpe2FOVBUHirfpkJJOnm2zkAb/xeyUAH5Bmw5Q7ZR3kcKL
         oyZ2RRwUkVDEEuRrkJ3+D/6wR6DKI4wVwTYuqwDuI37P73O8Xd2cEJOmSseqbQ23ThQF
         jxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775686; x=1789380486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FL0MVUWBY1Gls3buauXsjpNLqJ6uT7ZgJugOpqe6pJg=;
        b=IyzsuKZ+/G02z6y6uz5KdXI+wAtsIuAO+roYEojjnXLEiPHiv1NTriv/xetpHfm+hO
         CQq3iLL9EntxjPzak6lllP9pU28iT1JWkKD/qvox43/7QnRKAwhHz7UBMiWUZhXhxZNa
         b+kSKi7nic0uRc5ncGoR6wvqKM1kGay7V5jV8ZRShOe+MgO4v9dxSMTim72PliAmXVdS
         ikphezYal8wNoZThv4VWQE5vQja95Dkcf3cicSNjJcGU7izQN7cSbl5irRIcU/7f5VYU
         l+fJLrT5rtinayDLeBKxUahUNXcq9JyLauksi3mj7qnxtnnPQvu07mx5fipgCdyxPz9U
         Z8dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHJqAEl3+gKQS01ZCumksDIXTu1RkjRN0IZ19rYo5K3wOF3UVvVpFYGplqSpu9JueWDazTj/er7YEMB1o=@vger.kernel.org
X-Gm-Message-State: AFuF++nYmoYoMHIUnf+uBIrflldiOoNw7wu9n1JRRs3cy722p3RxNHQg
	TudlY2GV1P3Y9JTBF+d3cUg1qaMcHXSc7X/Lcj1VFQd6PKkbkPKnlwmPKImDmZM16owt9bIZ/jG
	UcpUo5XxgSYDD++f+kfVd+KKA2OeyAyk0A7LtE0heTZn+8fRkIXVvR0VFjP/BTN7/fSM=
X-Gm-Gg: AYBFou1pW1sN+Ixa1gUWOvy4U5U+Vfr4+tqTaRXe1on4c4Squ5ZykGkrZStJ69zE38+
	we5ksh2UUyUU9UHVGe7cC6UAgkOOEFlC2fDXGs4BjPKtOwk/1n5e6+8YZYm/xM/tSfQKEQqksgY
	OsyiijSw9/xcoSskUEt2sKAMb9HLu2ZQR/9/qo4l/WxdR9/uLwS3K8ivrvf9QH53jOVBnJEtxeE
	IgZCqz31P69lBXbLY0XxBiRBukl0oPIQ5TVKYE0yfkElSRKg1JaLsasDOIDlxn/eTW+MRBYrUrn
	wqkSu/fLgy0Ac0psjQlT970IIxLXJClFb6LK65SssbKA271nO9qkydsUi+TcSlpRhpw7rXW94xH
	4ajpzeNjEcCJ7JbgwneUSVQUhEaeZgsc=
X-Received: by 2002:a17:90b:5705:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39b2617ed3bmr36834200a91.8.1788775685749;
        Mon, 07 Sep 2026 03:08:05 -0700 (PDT)
X-Received: by 2002:a17:90b:5705:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39b2617ed3bmr36834112a91.8.1788775685270;
        Mon, 07 Sep 2026 03:08:05 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:04 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:45 +0530
Subject: [PATCH 2/6] arm64: dts: qcom: glymur: Add CCI definitions for
 Glymur
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-2-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=5356;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=XUtqXwyAv7y+q7jdJ2N1lPBjojXnko8HRmMf0Xs+VqU=;
 b=ybMq2fFnkl9fEfJREjUGfIkUsY3hJR7LXF5HPhr9gSyo8Cwja0+R5ySGo0scViKoYPV5KlAuL
 1aPfEzuQbj2AZm46AEdxJ6YudrohBkQ+hM1BF9Tpv1oefKg6uAmrGQN
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfXzOjbOKkVtyGA
 XE2CHN0zSZr6zI2OQQwcbla5lJZXX//mg3xmDNUSY8ySvY3CozE53iHhFwhuV/l+iYLnzH0ZMfH
 0InSYB0zYTe5nMxI9IVXjXxzgsYKUPjQc8DSm+f/OXzVHn2lE1/O0WogQOrzUUElLdWKVKN6Slx
 8OEmVA26iCq6sCFeRmo8szMkj9qbUOZzUkYy7dkCBACZPEkHe2ayGYoE9pLukYrfxQbDLkfkNon
 ZimHcJ1tA9/aUo++lhkaQjI31fSsu+suZSQFT60B0tcKXGrPukemZpfw/YqNsRFwBcUla2AA9nb
 xNCin8vERUOoE69h7mPxTeBxCd8CSceJ6yHsDSuf+rLMcF9CvL/8JOdyTCcbOvWOd3m/uEaf1Yd
 mR8J6k9xEweNI6P6C6MGW6RcfLegIGgnqxFJtLp1sV1gjdhkJ0sD0VhU1Bpoy3IQmI/BtR+4kD/
 2z8dT3RgQDqnLsSyMVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX5L53BxRRd52r
 2frBkaB+u//hjitJnio1FQaL8t0P5pohU/PNzegUnuuBWDTz9sarOy7RcWL5MZrI5V4RfTfFZhP
 8PuJrjxNCv6C7YZKBAWfevLuEldInaA=
X-Proofpoint-ORIG-GUID: pBFaTnaHuxI6Vlzz1CaIZTnKY9hlRz8T
X-Proofpoint-GUID: pBFaTnaHuxI6Vlzz1CaIZTnKY9hlRz8T
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e8d06 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=A0RmKLMI9YBSO-DC9s0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

Qualcomm Glymur SoC has two Camera Control Interface (CCI)
controllers. Each controller contains two I2C hosts.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 202 +++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index c463cde46cc41acd7b8091616657bf49b38b7f9f..4c48df593d1834a6ee7d97c9981965f557cad16c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -1886,6 +1886,80 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
 			};
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
 
@@ -7015,6 +7089,134 @@ rx-pins {
 					bias-disable;
 				};
 			};
+
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
 		};
 
 		ctcu@10001000 {

-- 
2.34.1

