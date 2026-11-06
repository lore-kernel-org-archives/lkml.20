Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956888;
	b=rLqpe7v90t5meReuhgD5KuRb1MEZ4oF130VDeoPu/MKztHtkOV0IxFPugN9Llu+HKMeY
	 fec8W2dgpUApy1oVdCLq1lOx0yj5jyLo86Sbl4hrx1Plz0lClcvfJLqkvpfLmFt1iySMI
	 RJ0n++FVWgdKtGnqUC4Fxn3bqhvSK1RWYhV3ccOJaVE7+Ul3G/BR2GYxsnWV3ejl6lPJb
	 /ZxaF+2+sJNY5Bhz7/VRqzzmSuZYJWaeoEx29C8qIVGfr8+I6/sGJJVzMJvAv3GRxyC7F
	 1nqOvlEGzkYyxmCqvJpTXbNcIaSYQ9o6nHmfYTPpRuPrLuCbIs8gZ+WtpwX4QV4L+FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gnz+Fbs2F6L+oqYSlNlGR+m5SkZLxJWIxyPH3K2zf5M=;
	b=zkdwcKfYLUb9nNXfaliN+J/FKvqnvQP+x9Y8eJMAxbzG4oF5VG9VVTFdH6oAIfcVLOhf
	 kKkfvM5tUApVnFIeA74IuFxUjl0s4RZZKeYaOUVFpu9UvTG1ppyEHqiKieKNi1XAY7h9p
	 bF+z3pbH1VIvHPz7heP7KfE2Bdmq0nfp8UUHceptDfZbry/3Zh9Ca/0u+GhUfUzbRCWCF
	 Ek/uCs+HEFgt60kH9vwiw6C45gbGjEvOaL2sPZUkK29RTcsu/Zb3ZXhgy+LYY37KDQGR3
	 Grr7alUbWa/D22exLFvD4MYl4FOyQ4MLmf+ljDlKui/VMwvmIwV1bClUqXiIMewQQrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+RKZriT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRKoftLd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BBD606D812
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3BBD606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+RKZriT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRKoftLd
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RJhh1679455
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnz+Fbs2F6L+oqYSlNlGR+m5SkZLxJWIxyPH3K2zf5M=; b=F+RKZriTo0yBRXtv
	zui1Q4ia0oPbOLU7Xy9JPdG/vHnJDXI33uS5+BINIMMu/P1W8+30K+R72SFbqn1X
	/USq5Vqc58wECksW0HjU9yXlRhGCCUQFmg07rNigKFR0aIYsozmPsa4WpOtNOOYY
	uwSo3ux4SyuUp6PTANbcbanKVQkgcutvrsY++a+5MM8jbKDICJ5bbAeR+SA8IJrh
	Q9JuAcv6cNIaWDm6SzKPxcqyLOXXct/xy3Ky3H07yVKeKyrnic9z8GZta8y3/TcH
	MVysGgrhS5ULUV8faO+lRxK+S9niGwsNqhB6i4YkuZ7ZEoXqo5EW8vu+Vv2O+cSL
	eUtUMg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pca2pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:21:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso642850eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956886; x=1794561686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnz+Fbs2F6L+oqYSlNlGR+m5SkZLxJWIxyPH3K2zf5M=;
        b=WRKoftLdUIgZ1nF41SSYJ7pFOsFqZVlvLJirVOWMKd1convu7aJotPlK736RqTKuYM
         gqIdLBxkyvgvG54Iz1h5Qux56pXDaEJpFCdfyWwE1ph97QSQXMXTc4xLM1qBscm+Ud7q
         06xSR70ttwQiuB6XcVuBymEpArkskEc2LfhRmrSbmXIbj5f0Ux749rxAN/nj51IbUQwL
         78Chg8xbjaEnQwzVC2tR50n/R4Du9enrHdPyQlt7Ul2sZ42NXYN3nb7ondVPU+9r/k6I
         JJx/nLMEMQVNWcbDNDNwWQ59+VVEVszpt+sXE45VCBn6sQ0W7WM1NKg5V9AQ59FNlW8b
         D7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956886; x=1794561686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnz+Fbs2F6L+oqYSlNlGR+m5SkZLxJWIxyPH3K2zf5M=;
        b=N5T92WOLA22R0SuxclTCkycAi/gYvQb2sAz5iU7o8XS8FR1ARSJ0eg0Tq96VoBvN4w
         +2te5M7bd+cAyqbF8/7kv19UT9mP2iCTySw/HHjnImLZCeH2OM1wK1qjPWbjm6Y4TZCh
         Gyp4EtkHdPIwTQdjsiseQNYuqbUSPA22gXYytFjX06d2BeNeKSFnwdA6YCQE7M8qLKhk
         AiuGlMdrjylBO2IxWuQ0JGRSI/uc8KZC9kuJFvy/x18/RqEj4CqAA/VYNyda9IvUd9/u
         /6cGfmskWQ2trQN4lmF5G/MfVS8IU5vZpt/yquoFuhe7t/7fVO7REz0PlskZOkdsEr09
         GprQ==
X-Forwarded-Encrypted: i=1; AL+hErEzebdVOQUOeea8+PhbgKOuiHOSgGPiD8IeZMXM1oZhV4majVJkkU/kO8MvQWJYImSF2kTYZdWleWy3eys=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W6MmSlpKJuTJuvPDpl9PsIjoGau4WnvAcJGfuKyiOd1XlxkMZ
	Q+q3qZrvuXT5UfxHUonC9DGJV0EcnrMbcH/5IRtD0sCjZcfbX75ug6l8TGNMX06sNbJxrxsJH9e
	Oyv2Q/T1uPHi7d4RXND8txzoRTL+RnQjeNt72N+vGsduMWyMf0jriLtfBx4B0VK181VE=
X-Gm-Gg: AYBFou3CHqb2VYT3IIdDWfPw0p2ReyXNtuAEiekj9miEbxDme18FAR4ytD1hrxcbgX+
	2CmeR4TE8NoAfHh9Np2zJNmKVPKhxp1hdFk8u5kNPoovms0z2GesqmOpEfKdhaBAxQ9v7SeCpZW
	5oVLcxSol1l0Th8Ie6PKWmzd8RuCBvDKzUDWGzmy+14/tKTce1KNVQlWW7qaNwIS+VtV1BrW6uI
	mHxrrq9RmMnPPhNH6WQ4PGbRECMueHhTbmd3f2rwgYfdfWW7XgJoVp6wLbhePFmePjFI9Iymafd
	jGeDsyziGOZv9yUnc2Eqs/W/OMplhbzVrUkDvVJRv6ZmvvnWQsaZ9uLXKHG64uPXqdAV/lr9qR2
	KY6uIZRKEaJehOZRRdL2uETjjW4/Xhpk7VNNRWfaFFs9bxPPr4bYmrlbe+RO7z3VSkDBcnnU9iX
	OIzOZZGocavWpyDP46asHYjTTmWOEYIdIvsepJCVzDLdSwtZHZNhn0uAPwLq7EvtqSSZSVmcOFU
	Is0GA==
X-Received: by 2002:a05:7301:160a:b0:36e:c07a:426f with SMTP id 5a478bee46e88-36f772f59f5mr2121410eec.39.1793956886352;
        Fri, 06 Nov 2026 01:21:26 -0800 (PST)
X-Received: by 2002:a05:7301:160a:b0:36e:c07a:426f with SMTP id 5a478bee46e88-36f772f59f5mr2121384eec.39.1793956885880;
        Fri, 06 Nov 2026 01:21:25 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:24 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:53 +0530
Subject: [PATCH v8 04/11] arm64: dts: qcom: ipq5210: Add support for WPS
 button
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
Message-Id: <20261106-08-dts-v8-4-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: gd7BityOdKuHQawubdieGbF4kIn72EDP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX2AySScHjoGAU
 d4yOCnhIwasZQzt0drJ5xMrWy0RCw2MG0O+4mCsHNCoKDhaXId9WgCMxc+wvkPHfdbJHLyw0GnB
 b2NP/T0BHlA8+fpq925hvvW+MKoSgL3zRAtSR6KPcCxnCmOjjnB2D7gZ6/AuDd+ViwY3/gHke26
 b2LbssMR+GoU/9QdtuAQe2V36ntSuemhqKvWx3d+gJTzZBsFj8C31IeZd2VX9ZSvs5f8UHCFGT5
 3DLybwPI8huZlwi8qs8wXcWYnJFNIbQN9ybvYDtKqVw1spGl+UCoJtOA+6Nm+vJifxgUqQ5kML0
 q/0xP95U0qXcL5ECOCUH4AEapVQPOvDF0DoN/tjHT7h/6sXqphsbeDoIRuYcESt1TodULY9/YO+
 S/T05JmD4nAfFMz0i2Kt4QDnqg6Y2GhHZe1u/0HvrpFeHzuD5Wol1K+wbs4FLiCwc+/JGqtmq/H
 bzXLfndow6gwNq6JBLA==
X-Proofpoint-GUID: gd7BityOdKuHQawubdieGbF4kIn72EDP
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed9c17 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nVy4eOtUigsjo0hPaBgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX69i6zmltNZut
 PMnOj9AaTkIdZFPZBKtmDOLvhkwUFYTH+pan0g37jQg/tykekLzRHGDXHIh40LE5v0v1AH4u+Ki
 3BfdM40sDnWJi7luFW02tI1KO9lNVEU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add GPIO related nodes to enable WPS (Wi-Fi Protected Setup) in IPQ5210
based RDPs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index cb0adca9a151..422e2766478a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -17,6 +18,19 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "WPS";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 25 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -121,6 +135,13 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		pins = "gpio29";
 		function = "gpio";

-- 
2.34.1

