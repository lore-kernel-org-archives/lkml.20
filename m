Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002535;
	b=bRT6UQGoSz7F2yGa/bjEoHGLOdNZLcdHoN30YhgHLi6Lb7wjF6CI5wklMiBGoGQakYXI
	 nJ4wePZwDYlTqd2SamoaHhnTL7CW/QBgzjj8hmLIQV9tQD5H33o8kvZS/j2LTVa9tMcpl
	 I12NWniFpMgs/2peIwL6JzL9X0nTrAHTeMtQMa5Z73MZQeBmy3RXRBHQuuA177XPvXQ8Y
	 Tk3MgNOldP7batZJLWW0hLmxUuNUryBAOazkLkljrFwBvCIPFD0tq/5sq4u/mEDeQU6cz
	 nNAtXpxj2IueeyE36ecCked7ivfhR8BKd+T40fAe7GGCymWJErIRPJAimjO5Z3HtltQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=;
	b=uC0IQROGUmr17at7s4671zF7nJI2vuqm/GWbjolhW8+dEifCdsTJxG0+1L9TocXC5ltd
	 bqyBVpWNI4MHy1iOhtQWISV16QH5T7CkjaIz0Rl3iwU4NQPdpVCzF6J5XKeb11VQELymL
	 1yFv+GOCZoewm9OaEBcenWM19BugWiv8bx4iNnXwpviWkfMYBTHL6VBLDgD+LcDQYhVlL
	 0JUD8yQmCvVP2DoTIfRYdL9FRGUskWbi8d8zIFbT7faJbl2KxctkyXJxM2hwQtkF9Dupu
	 Vhfu/pH5NkAx2EmF8SRlgx6BhjLv8iVddgpHftq8SE9pyQeRlpeT1Pb9qGZnCX/acvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRXORdhC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TEu6U1YV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0C5606D816
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE0C5606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRXORdhC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TEu6U1YV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Ht0uN125565
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 22:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=; b=gRXORdhCts2i1YgX
	BQtNGID5Igg5gTtvX0XVrKRZQIRmVeLDKv0M7ra1pfag+ZrhU08+7rXvqeAAfpt+
	jrYjOJZlu+ioAUoMNxZXKFDnapmb4wPq8TuNeIyR87NDEaHdo8Yjbru1BuMM2cQa
	yhsdZX4REdlqlYRemVFVqvgJr5I2x5+YirfaBJ08vW5AN5DB025am4yJvkbvhQh1
	/ENs/w8ZYW/4s7/BpmCw+m2gdamyjpxAW8+9bNGoKJF2wBKOlbV0yaqsVKIS0QTG
	GQEsJpkqmX1R/zZSTFUXMPIHrC/nt+v0G8kp4h1q3vNt/J5TXMVyIsjtXYeDlhtV
	BOVjyQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsk48s22u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:02:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990835cec5aso99618241.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794002530; x=1794607330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=;
        b=TEu6U1YVFk7yFI0dOUjee7vBODW05BBZ5uwESeE3cqmOo1G6VqpRCo3nHslaPHVSzu
         Lc6Woa1Mk8QmWVbjEtcYylwWJEOTAY29L4Q6qhaCbT9W3xZt8x7SBk5oMXysz8zvnzTD
         HyLke0Ky7gGp7jswGUbAEVn6T4AZcda9mBUxj+gZG5K2cPDFmSaFYnGk/UPEZtfcCHle
         szsPaNnpOhIO7khWxstHubyGDltQbnHiMLYKNt/KwTtC1/BJ2ok+1BZ0ylOfTIOCDs0J
         IbN+5OYk/m1ojM5UT2xnC1W5g57GolRugQgpiVWedrCiqZvcnorBhCSjc7eTyPAblhah
         de0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002530; x=1794607330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=;
        b=wi1mX5GsRaRkrcbXW0CjhySrJn6DhV3kiZQGWDOA0GOWxfNCJRs/ROs3zG91RINveh
         kVQdG+4373Op6T7sizl9raU3lqPoR0D2aHDO8k13MHdpI3Gc5d1ui6C01Pmek7LD4HWU
         GAh/HKBzTpiKY+AcCsGQNW6mzjokhKX1k/5ux/6EfIyUsNDb64E6t45Tsqh2gGao7tsZ
         eYxRqwzVfp5tURuaIeR95ojJwCqvYXB7N9Gzjva6Qkcmaq2TcQHn4jz6P+8fbnCma6Kf
         iM8JqdxmVeJZFxdkW9Ar3/YnnleGCQS/Vgj5AIUtYTfJEhYst0TJPCARElXrk7txfy5/
         qtZA==
X-Forwarded-Encrypted: i=1; AL+hErG8ietqJIMKJvNW0RehVLLGe9YIxAZcRuDbMUst1HioNF2YPH82yhEUzhUqinWi+iEijMWP1WC1HVTQ2To=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1E+/V4AUKZ3RiaZIJJoctQ1+HJ0nbHqxFkxAcL1P5n+RShoEA
	6Eo67+QZ9pBYNI6W5pojUbSgkOYTBdQdY7SgBkBRYS9QIjX3s5lhJCp5c7YFLlXx0RgdfsmGLIC
	1QSzX+KuEsw1Rp0P14aPB2ZCxJCMeLf68e1ioLkaqTRFXmmrC8cVFpf6pdB+32OaM2og=
X-Gm-Gg: AYBFou3WS+Etie0E99p1wyTo8oHKweCIS0xrToQROf9lXPuXxQrSboZVIHvEEAUxqSC
	A+B7zN3o98xnGyXg047FB2ad5F65mizh2AEHnjnD9xlVgmL68jY0tZ0eOuiC2/JIr1dioYJ2Iwx
	0OXqGVFIaLXtMQMplQJXWJAsecT5rNTpEZPxy2lvlhBw52uCMpO+hrOvb1nQOmQ2ssYXHFLBZLe
	wHvlj0VRd4OBRm0q2RDqAt0/znIx8As+y3CbO7VHBCi5beYIUrxVNgJgr6PqbY7KgdFC/ccY0jT
	qIrAghV0OxBHR2G21L2PGM3ecjKDrq2f+LKuAXZZKXbFmayZYVxZmmASYZHUAMuRLz9Y3cVkRRi
	rPxXCpuRl4cnXYP3IDhyEF4I8bpY37qpqWy3j4Qk8QtZqx5WRtA/COMSPFg==
X-Received: by 2002:a67:e710:0:b0:7b4:9eba:69dd with SMTP id ada2fe7eead31-7d2bd9eabb1mr67597137.45.1794002529851;
        Fri, 06 Nov 2026 14:02:09 -0800 (PST)
X-Received: by 2002:a67:e710:0:b0:7b4:9eba:69dd with SMTP id ada2fe7eead31-7d2bd9eabb1mr67580137.45.1794002529113;
        Fri, 06 Nov 2026 14:02:09 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm5812437f8f.47.2026.11.06.14.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:02:07 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 00:01:54 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
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
Message-Id: <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
In-Reply-To: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZRuR8urqXbfjmra9eBgfstiezyG+KjQ2tGTK5mUoxrM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7k5XbGwrmbI6wXy3YshymRedfydChFZSrqa+O
 P3Of+nDj5uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau5OVwAKCRAbX0TJAJUV
 VhLaD/9rRE42Aw46TEo2LJbXjS8hQEuDsJvU3vGP0AKO/sLeAUmka11W8I6erRPVEu08NvT5XP9
 jpkulFzIFVDdW+65cOeLZAXuXrUaMt0Ihl4L1f5pQDEdaPx1v39it3OHz3fPjkBPxTQSsDR2HW2
 uw4ATXd1i0ab5jNfhZxWjAjzA57Fkl9H9m738j0mRenQCpPCHwRCOQ2B73dpSzkL2zSa9ftyBN4
 ydN5MP5BznIUX7TeCiYO+vruhy8W905D3TFwNbic2j+8AtBFixT3K+0bmRnn4v5Vm9pYIH8fviE
 vvzlzpJ/fjJknvuT9pLqDKJi2AienX2/GX8fb2QTAfBv0+94Ho3Z5RHftXBn5eM6G4sWgXBFv+g
 xyWLichrTYZEypvOwuXA2OLa4f6FZeyDtabRuK3dQoExFhQjKkAD4Muoyl8zjJJHpZ7PvJ7vNsw
 GoUvi/AdErciNIRqgTJ18FBmpFJmcAO9ma8b+xZjHae/U7azv2pkMdm1G1a7s+mVF6WFrfuiX63
 EfjnVlkz7i7z4YE5cNYsWshyz7cRPHmE32gtJ2r7Vny8D6xJJo2tLaGsTkD6aWfNSqN8O2AdDBV
 WnLn2Ti31CliaO5fr4G717TXzmMfm9fSb/Ht2b7xK3RcqFg5dTFcs/XS3hLZgHgWOtgBfkUwqkT
 j3bjyD9eeA9jDXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfXw76yufgRH4cK
 Lopvyygn5T0J9pe1luv2rkIdGhXvSPc6ZViTBXpHJrdASo/9UlboyU7sb6ToiLWID4lRDE+Fy+k
 0gvXUbCm0CGC4CXgoM4TxufjVzU1kCJCcCxRq7Yc+LXAdXXrex/kIy17NvmE+Y6eoh2NvAGDvyF
 syTXkUSNVwz8ev7DIlgUhBUy+A2MlSTTg8CzSsMiQAOdRSKk90qmcBLwWqL1p+fMSOGkITJiXrQ
 ZrXsZnjq2WWYgcGKU8uYekS+mnizV+1ublo848QTIS4mUIAmqEk5kKXlhZdk+dNP39HzIsOKefY
 qHqYxKHs2WhmZz3upctcaZZXGAv1qSy1L2J/nSkoMKBglYmLSsdm6pV3hqHjkI4IfBRgoDO69I2
 yi4wFbB2CTt2IDz0KKoaWgRjEE7ldrjYgPBBav2joo8zFanmi8QXSbwjrGt4P5ar8lkvckBwzYK
 9oqdTOMrnVIzNQ2oqgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX84BC/KdyN/2U
 crAnPvvN8O+PqahJRD5CroC8JDw1j2TLhIRHskZdjfDCHFte2Nv1a6/7nFwuytFJoc/Mymp+Cnx
 QuZmfSEh3flp8RQ2Rtmre1iuzrkGnsk=
X-Proofpoint-ORIG-GUID: 31RpADRw5nqUGqgc4Fd0vEvmuhE1WUOp
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6aee4e62 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-ko0rdnKxUD0urDMsK4A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 31RpADRw5nqUGqgc4Fd0vEvmuhE1WUOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060087

The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
GPIO 66, as on the Gen 6, but the firmware describes it as edge
triggered, active low. Using a level trigger makes the handler fire
continuously while the EC holds the line low, with no event pending.

This provides the EC hotkeys, LEDs and keyboard backlight.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..05814dc8d905 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -735,6 +735,24 @@ ptn3222_fpr: redriver@4f {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@28 {
+		compatible = "lenovo,thinkpad-t14s-gen7-ec";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
@@ -987,6 +1005,12 @@ &tlmm {
 			       <44 4>,  /* TPM */
 			       <139 1>; /* TZ trigger */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";
 		function = "gpio";

-- 
2.54.0

