Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812943;
	b=01A/5LYx70QgKshbxfJXORYRv9SbYQ/hlXYB196Ven2E6U4QIotjTsBvuio7xS8wP2rP
	 SQAlMzKPI5af7qry4Dlc5nx5CkmQGKsPOnLZgZzUFuFEb3e9wng1O8F0isdfr/uycx0ig
	 iOqPnW1/pR4b289moQRLnJ08JDNrp0NSjAWHAy9hwTJXiUrD1+SNXWQzPSOzL8id2G1lR
	 Ox3zp+LTmNniOUz33mYznRit31hHIcPrZGYODjtwY5wzNoKKDur7Q/TArHyR8loBV1t4E
	 GRPFxs0c1O+6Or45O3XPz7CJbEvDL0Vs2kZSfaGBxSBsRHZoy5iQ3ja9iAFssGyqAGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9WdwW0PxcdlHIuh6wsyIMEhMeQ2NP8tLx3e3xYrc0iQ=;
	b=dKKaIRjpNQx7yPNusb5vPlx5oObmZOL4t66vZDDWGnywRe04Ah67CPxsCuAta+3lK6c8
	 itYiTLqt4cjnmIraawk6K1SuKv2yZXdPm0ujnpk6NLqggkVQCCxTt/up7DVUQ+scmDli6
	 TEWIgPcvPxoqWSd7DcucDgatFQ40cVh5GRI8t9tF1xIuNBf5bHeSB6hHsYTJsgb9UiNYT
	 mFc8LV1xNoVFnpS4d5B/88zjW898cVkKgYrfbDc6r4CVnRUfKz2tEOj3OmTG2k9lwu7L1
	 MkBtn9m4KHyDDRZRQkubgocUBp8rY9tokZoWtNurvmORwzXQADjnD0ifdWF2kzrKb6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZH8MeQs9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=edWR+TJ7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4609606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4609606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZH8MeQs9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=edWR+TJ7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Lb523839140
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9WdwW0PxcdlHIuh6wsyIMEhMeQ2NP8tLx3e3xYrc0iQ=; b=ZH8MeQs97Jn+Nz7j
	oQXiHB4IkGURaQ8uD+A1xpdIhyqr3dFJIZKT4L7kqlPig5xoeR6JA0r/asWKYhJB
	D5jFdJuSbWoN15p31ZxK6Ssl/n1l9zmxe4JOXL34RTNZit1nGG1bzZG0xRSRpGYa
	7Bh/vGGSPgv/8OqLb7eluzdXznsvZ0FDTfaGMPczh/zTq7mmNidU/xrcNYzmjVFc
	ghixAsQypLshPo03XZNCxZsdlOqq6TI3kqTH87dUI+FgxB6gUMvCEF8eJS8owS1P
	CHwMQMF2wJDd/cAmu5BXC6IAuv/xvbMNpDN1U3/jnJlvjQaZqq+Ji6kl0sgf9a2y
	yv72GA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhn76d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:09:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed00709df0so29111735ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812941; x=1795417741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WdwW0PxcdlHIuh6wsyIMEhMeQ2NP8tLx3e3xYrc0iQ=;
        b=edWR+TJ7BkxF99l6V7m24S/Y5lqvWA+S6/1v8YrYnBqvwHOVRr9bd2S54ESoceHamS
         CB5r8ZBXTSJwuvzRm8JY4MP7ySwOdOU0ud9S5bB269YVyokgSvLBU4EA11lvMIClzjKk
         vBZ4Q/aMEXqG9JLkX2WDzJoBu2g9t0ieOrsE5yTXc0dJ+XE62ippT+LxWcJ1ron20JgN
         YdV0QznlbpOHVXEYcBD6Ki/g1TYL7J1XgiIikDtpD+BAjlHLqLUPTuIPBZ92j6m2P00s
         b7HAW+AxFaGNQ135E4femHepm1lM2GWn0/fQEahJy6Ogho897Vew3ch6iTNkTlRYpJUy
         z+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812941; x=1795417741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9WdwW0PxcdlHIuh6wsyIMEhMeQ2NP8tLx3e3xYrc0iQ=;
        b=q/bd4I3SNKsm/qOyBzPEZer8T7jxwxK8wp8VnC9B17PyI/01+bj90eBPIGG4mOwcPR
         yVYE+TH/ZerbZanRhvKq/WGc+hfSPD78UpBi5QBZYEq7jYCSWTDRUrGEwsVLHV0IYdHW
         XIIddZONIXCCQSnRSAMkltzehiae6+f5cApGgLQmM5VADt6Ikoof2PSsz0v+5D6DQi3p
         U7ZWn0H/7BYtAZciPg4Sqx0N2hG09l7ilBI83xNnPJMPFvsdqBupFTh7bX4VTRF0zFlW
         waOaUEFLwNUiI+nON5T3Rm8rjmld6nzp+tTIbhsCzjIfFbvAyJJALdfLt3ll483PgiSb
         ZZBw==
X-Forwarded-Encrypted: i=1; AL+hErF0ux6eqaUBL/ue9dK4jEfbk1YTAfGjbo0HM8DViCLEPv49gkX/RUaZuw8d1qkiN3hgALNThuEI2tokLAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yqez5H33cZ6Jc0KqNAKqL1TDMmCxKF6zsVnrkbaaQOF4sWB1w
	FV8rT/L7BP9YXG8zOtDf0bviVYswfdrWU4Vi3RwPnSkvnXxyzOnZogStK5/2CtDK/5lIRt0qHm9
	wNmim2z5zLU2ddQk8G+bin5PQ/r41plE6mE7cLgHPbzLAHQyS1G1YRJWaKXvYz5vr2yc=
X-Gm-Gg: AZFdTZcsD3+FH8I/XjXs+s4+3MRYpE2gn/aqZ8LbMzioYaoYEeXOh4emk4jdcfwYAtC
	5JAcl9u2xvJ6sUtj89CWZ0ZMB7TLkUiJbgZAVgbU3Z6KGHo51dRVxo1U1pLVNtxecPtTV4SZrNp
	O7XyrFaEuCLedExO0oFiEkQ+HfQUQWGauk6uGS8FV2e2uaHwB/4JsLIQdDzvz+6BWnA32w4rs/1
	aes/cOaGote5ZMLRXCfymYN5VQotR/RgkY9XeC++1AWCUQvoJP3vUEyg7N2wtJ8Z8D2441crr9v
	tvWUAhU3EzUSdeA21uVgQtMs3Se/MMI88HMFhEGLc1TNS/iNPltllJmIGZTNM4d4tLCUzTiRE0X
	4Ot/uWGd1BMKUbYhwI+Gf9FgPrERYJ+G9I2gjncpGgg8Eqf0mbc9susepxonZHdaQfAtbfgaE7Q
	==
X-Received: by 2002:a17:90b:184d:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b1b0a0e8dcmr8498748a91.11.1794812941446;
        Sun, 15 Nov 2026 23:09:01 -0800 (PST)
X-Received: by 2002:a17:90b:184d:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b1b0a0e8dcmr8498723a91.11.1794812940978;
        Sun, 15 Nov 2026 23:09:00 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm8658667a91.0.2026.11.15.23.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:09:00 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 12:29:50 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: add Shikra PWM controller
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
Message-Id: <20261116-pwm_qcom_shikra-v1-3-67ee4553adc5@oss.qualcomm.com>
References: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: hmAaGLLCZldsWYknjOziaZMocxi9FK5k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX5xctiJS011vm
 i8A0ug39kHjYG3WiYb/AgW2gnry0k6FRJN4VmyTEhcAlsiEJ1LHXdKTsfXNkTGvUU6XHezgQo5m
 P1wOkayXgUJG9LSgSHBiW+asvPsMSPA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyOCBTYWx0ZWRfX2PGHhE9kkLHY
 25wdkCugUAhrSHpNKhUHm+Vbj9C6r++jNJo5IPmQTN4EyRulDuYz9Cg7n3O0MQz+Yu/MLNwHv6d
 fPJ9BJOHDaHYHVAtN+bWNCZnunecQUyb3LuNoJ/rNd2uCJKDQJfo7SghnosEcQ4WzcgU5eWEZPY
 2UX7uZ1RA/uRS3BwiDZQiXcYxvDkzfGmTUKenYVNMYCb580FR/GANWww1t1bNEEuhkZjLR6a5xh
 T9CkO7h0wd2/X2gbjew3KABXC0BnBqmZqz1LR6vYchlEgWP0H99WbFOL/YCPfB08MXI0ADOKpNV
 Mm40ahHvdGCsUSnduD5wgPMJYDqehiy/1d6UAATSgBFh1E/D2chWF/odvoLDzfeL1h7VvUivnFP
 TUuE0jlQd8pBwkg8BcQ31lgH+iL81ULF4zy9F9IJiaAm5AxrBatmLHgXnKSHBLANa4Vj/+U5wgo
 lVFYYVFhvZdqLQb2bDg==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afaac0e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jcq69FRwgK9YgyupxYoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: hmAaGLLCZldsWYknjOziaZMocxi9FK5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160028

Add the PWM controller node with its AHB and core clocks and the ten
PWM frame child nodes to the Shikra SoC DTSI. Assign the shared PWM
core clock a rate of 9.6MHz.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582c643f97e2b0725eb88a9f262d83c..d8a3de38382bdb00684acd709f4d34136792771c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1303,6 +1303,69 @@ sram@4690000 {
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 
+		pwm: pwm@4700000 {
+			compatible = "qcom,shikra-pwm";
+			reg = <0x0 0x04700000 0x0 0x10>;
+			clocks = <&gcc GCC_PDM_AHB_CLK>, <&gcc GCC_PWM0_XO512_CLK>;
+			clock-names = "ahb", "core";
+			assigned-clocks = <&gcc GCC_PWM0_XO512_CLK>;
+			assigned-clock-rates = <9600000>;
+			#pwm-cells = <3>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			pwm@4701000 {
+				reg = <0x0 0x04701000 0x0 0x1c>;
+				qcom,frame-index = <0>;
+			};
+
+			pwm@4702000 {
+				reg = <0x0 0x04702000 0x0 0x1c>;
+				qcom,frame-index = <1>;
+			};
+
+			pwm@4703000 {
+				reg = <0x0 0x04703000 0x0 0x1c>;
+				qcom,frame-index = <2>;
+			};
+
+			pwm@4704000 {
+				reg = <0x0 0x04704000 0x0 0x1c>;
+				qcom,frame-index = <3>;
+			};
+
+			pwm@4705000 {
+				reg = <0x0 0x04705000 0x0 0x1c>;
+				qcom,frame-index = <4>;
+			};
+
+			pwm@4706000 {
+				reg = <0x0 0x04706000 0x0 0x1c>;
+				qcom,frame-index = <5>;
+			};
+
+			pwm@4707000 {
+				reg = <0x0 0x04707000 0x0 0x1c>;
+				qcom,frame-index = <6>;
+			};
+
+			pwm@4708000 {
+				reg = <0x0 0x04708000 0x0 0x1c>;
+				qcom,frame-index = <7>;
+			};
+
+			pwm@4709000 {
+				reg = <0x0 0x04709000 0x0 0x1c>;
+				qcom,frame-index = <8>;
+			};
+
+			pwm@470a000 {
+				reg = <0x0 0x0470a000 0x0 0x1c>;
+				qcom,frame-index = <9>;
+			};
+		};
+
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
 

-- 
2.34.1

