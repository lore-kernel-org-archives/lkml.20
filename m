Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458222;
	b=ZXeDd0nNnvL35VXRKkhPx6jDOhr7N+s9ZEJo/KBQ8w18VwAWHfiJwzSvK2PYv9kBg804
	 AKukkIbVZ07lU9eanTpPubuHhiUQWMdNoB1tsrOkAguyzvHcjhR8VXiybfXRLZ9n7R9Bs
	 bQgp6n6V5Bicm7TnJNAEd5fHMSDz/4ktLzGtDcuO/Np3Ql1iWbodd2c/D97uSm46nk7WF
	 6IK9OK5/QXNMUryoXzqznw3FqWn8Mzs3cgJhatnIBl11veZTUzYqLx2sbzZKafcVXn4dP
	 xmch/ed23E1Y5gvlpD5jiA5O8tRidZrrhnCIn+Dv4UHp+HMUy2RCrPEmwFCebP6eB1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Tg8j1xRa3B5jKF/z/asR4+mf9XmaFFqaFZTk8DOwBCg=;
	b=fQTA6RkD+ddoEqx4QmRvd3a2uOr702/dmlt6G/ND6XNKfYV1Es1wa9fc9WiwV62YONRL
	 Q1XgViqohSE8Uaib3P6F11DoDbNvyKgEdalxa3zGkYefH135rKKMsSNLbYyflzU+eMTrl
	 1I7Ddzwlw83QKTUbLyGxufPzoEUV96mLRaTlc2UX1e/zL8WOKwBDQuuCVbTK4D89N0zI1
	 DLqMs4CNRZC/J1paBSGPui2065HIXV2QrCH+5IZIJHJbb23AiE9YS49W3NPY3Cv5MYGlw
	 y3xhkM0JR0aVcgtbalTyX6oXkfyZiiAo1tVGt9ENW69kN1OkDPvJokiFMKadSbQ+4dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DwNYLkRl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BscJYipT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E6260A3823
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E6260A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DwNYLkRl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BscJYipT
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZWu22514130
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tg8j1xRa3B5jKF/z/asR4+mf9XmaFFqaFZTk8DOwBCg=; b=DwNYLkRlsh9N6pXg
	03ewC+yVYp4GxaDSNQKotyQKHLw1ua553XqXCPv0VOFi1D4LI4RmOStx3bmtzTOO
	AjsjG9pEgPMn7LAuaq82A4n6f/1SGI6EouWF7/F/oHWXODUP1rHumCPpU1kfYDzY
	d2oKOy6V5UTs6W6ISrJqC5cIJXvkZvWCTRV3Uzx/i+tJvSdBE5ZPvMiXJbhLPVYm
	hvKT+TcH/G4+8G6RGnkvJLmYTKj0/Tf+o5k8RWijWQwZDAsPHmojWWHLyx9hXSRb
	twbb5CFW4qcHZ0x2A93Ci20fh8KIX1wHdXo6bWSsDqZKceTj7xzYHghOakLC3pxB
	Zx5lSg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1swj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so7639685eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458220; x=1795063020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tg8j1xRa3B5jKF/z/asR4+mf9XmaFFqaFZTk8DOwBCg=;
        b=BscJYipTG+/tYjY/U7CFwXAm6C8ZE0yX4EqxKj3hYbDIdyBGeX4t1tru1TgBEf1lFr
         wDJNvfnmsRXuikV4/XtgGHYbAtDZ0wC4GNuFM8BpsvP3NuYJcmWqjwH9y1fMtWFmVknU
         GUvjHI2Nne6smtdjp9YrsWMqdgVa57oPZWE7Q7hOfpbfWbWT2NxSeBQQBiyYvaP/2qUx
         c8s7phplMCEDLMCmj2UwXGvDDPjqQ3fKb2wfslRXTZ/f4kr9AzXza35GpYUHZm5xk43i
         Hiz+EKFtV2yJi+DdlRTbpYEEQQvkCG45wGAcT7MSnn3gLgGgdBTjgBKFgpAbXlmOd7kq
         2lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458220; x=1795063020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tg8j1xRa3B5jKF/z/asR4+mf9XmaFFqaFZTk8DOwBCg=;
        b=Ruws3IhOeGjYqcchPsNZ36E/Npm0z/RVTiyY5VdDkju+tLo6CiEpMrYV0fSKJE1Ctq
         6Ph5iEt3zUC+oZU33MYA5tYuZK34UiuqXNkC9zqXsdqbaGw66YKkPEZlvrBwkUQvG3el
         3T+mPg0zFD1rzIvlcDTm5oXpVrVWBBvFpedXLDL5zmPGOa3mHT6t99nakwk5UaZTLEXR
         8y7cJ3ZLKE0/Lvd46vZLXZpcMTYPmPs9dxqQZQd5FeG6Z2zWKS3u15jwSH5ReqvKe8CH
         YJMNetq0Rd6eVqXIkq+4Olo5G2Zrr16+vc3h0mtqx3AZ2wNn7vZDp+NPEnD4xB7UFcrd
         PWMA==
X-Forwarded-Encrypted: i=1; AL+hErGfrRpw1IofGOD58MI/PtL425W5WY9Jx3PxR9C8AhYrMTUBL4Y0ArQIxuWEL4WOpyHOhzChrPaH+6DO/LA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lFxiDt36ZxGZCccnKoHu/Q7TlerkgSBzctehrzu9Y13Vw/Xv2
	0VEhO48Fxm0GJBgLT2nOVL2ZnglXj67dqs0KwEGacSe/OLsoWPQEhZOAwru7iE0F93DR4NE7ooj
	yBTQIjpwwcIUQVYMeKFjZJhXAk+gao8d0Rdf+uzXFq8uR/8KXivyf+fkX0yXDo+zAUWg=
X-Gm-Gg: AYBFou1lWAkF4baqcPyoJd5viqgQ3Vngpb50jSlSviHtzG7cB+B6w65yUfm0xIdhEkq
	kQmu3bg0+cUTIB8Ye6R1hzL25SujEqyCkVMKRGRw3QsStAq+4W71POULmJOyEE+id+fTcvOjAYz
	AIzDMOT1MP+bxPYN4V4SUczbKRBEsBpUeO4Vy0rpJ4Mo80Nr8TuYkFu6e3blJykBpi5ykxtzEHD
	uug+rxwW1cNNMvL6dljRXsVKwukORVqsa45BsnF7ZX1l27va35a/YN7uMzNgV8z8e4OwZwpVbSC
	7JVBvYUEDJerQFlalIkOr1N/P13ytJ8bKtt7sgAGuVaxyFHOqaUpp31adurlRNrtWpbmfdHxFDo
	CWmWRIQTEHLpX1tAicI5KUuaAOU3yXJoKdHqobDgO1dsN0XOCkKdZy3R8Miy8g1Gi3MYrLQMc0c
	+MHyVa7KO6sGHEEyRI8Vob+swWjgKfrO8FR2TGv9Lg63JF5zEuEm+hnXY5dCDylDZ9CaUpKEtoj
	QyE5ik=
X-Received: by 2002:a05:7300:f54a:b0:375:894f:2524 with SMTP id 5a478bee46e88-3768579df96mr4642375eec.12.1794458220310;
        Wed, 11 Nov 2026 20:37:00 -0800 (PST)
X-Received: by 2002:a05:7300:f54a:b0:375:894f:2524 with SMTP id 5a478bee46e88-3768579df96mr4642361eec.12.1794458219611;
        Wed, 11 Nov 2026 20:36:59 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:59 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:27 +0530
Subject: [PATCH v9 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
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
Message-Id: <20261112-08-dts-v9-8-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5426d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: VJaLeQE9UJhVorT3d5SDxqsuXcZcXPYO
X-Proofpoint-ORIG-GUID: VJaLeQE9UJhVorT3d5SDxqsuXcZcXPYO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX1iO/mytC1ou3
 dShw9vKWBRAsDkSQM7aW+4mwg2RsuHmDrfykOEoC1D4WWzdIV67liuHIp9ZtfU+YS2/nJy4BaxZ
 rhhV4j89RHrGCSJtBwGpNwge3DuhRSZr5oX2WxBotZS/M2kFwa1SHdunNczx9WfoLC2I47IMHhs
 /9pXIfKuRRA6no0lPXPFo5zrsgyAgL1ItJQUPmSFNKn16Qkkue6QuBvn0J6nkup0J6ftBE9vAEc
 8pPOo2do92lmIIYr2rcUvl40IPUKfY6CJOd26RLDBvDck+EzJMu0PnMDTDoF+raIVceJktq8AMl
 JeBy/UV0ZstAKdnjnolYyV19RAPWKBLEHDaz5PdlzIhLcQ8kxl1hNsYLmDXF7fCXmqPSV+BptVI
 8ftkSbgzW2jfXQHFPyZS2S29jvU4muWKN0/BN5lhPHlT1XyZKgMUeY3gUBZx+HY73hXY1M1xtTa
 /2Iig8LXfcUeVPF8UCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX65vDHlHpDshn
 ig8ISTKPZ64Vv+lF5waY5ri5a4x55KQ+a112ehEo9qVAB5MasMeAH+is93NAu4vw2rre3QATnQ3
 n3f674fjXxbtcde6HLGqJlxrD3btEvg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Describe and enable the PWM block on IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi               | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 02fb76283f7f..87a7e625a2a4 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -89,6 +89,11 @@ &pcie1_port0 {
 	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
 };
 
+&pwm {
+	pinctrl-0 = <&pwm_default_state>;
+	pinctrl-names = "default";
+};
+
 &qpic_nand {
 	pinctrl-0 = <&qpic_snand_default_state>;
 	pinctrl-names = "default";
@@ -167,6 +172,13 @@ pcie0_default_state: pcie0-default-state {
 		bias-pull-down;
 	};
 
+	pwm_default_state: pwm-default-state {
+		pins = "gpio11";
+		function = "pwm0";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
 	qpic_snand_default_state: qpic-snand-default-state {
 		data-pins {
 			pins = "gpio0", "gpio1", "gpio2", "gpio3";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index aa1045f20ed2..4cb9f399d480 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -431,6 +431,16 @@ tcsr: syscon@1937000 {
 			reg = <0x0 0x01937000 0x0 0x2b000>;
 		};
 
+		pwm: pwm@1941010 {
+			compatible = "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
+			reg = <0x0 0x01941010 0x0 0x20>;
+			clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clock-rates = <100000000>;
+			#pwm-cells = <3>;
+			status = "okay";
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

