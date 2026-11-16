Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809662;
	b=lqC6an5TRwrJYov6Pj0xrfXpn4OLnFuHdGg4IfjmPAFb3F/6wN81U28in7y3DfFDYx3e
	 shw6A+JHvI/2WVry1umarqbBhqK0hZTJ3H4HvPMAUObV2AUvEucesB50jytN8gtuneN1C
	 xWrE9KqGsoq2Rbk4ic+iyGKqI8tKPctaiuFEKZ0ZOfZ+sGYYqeKacDm4U5qBi96Af3PFK
	 6VoJjn7NgJa/phNoYrnoiDhuYj1ER2uWkIKYygUm5fURjjcM6NdFRh2FXGM6Rtg+Y/67Q
	 adRhJcs8nX4dRgr60DcWRwrk+7iqprrTvQDNtPGa3RCuElnwcLj9+wkHunuWKs1bm8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809662;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
	b=eHOfuNDKi78S7dB9AJrSuC4YWJVVkuFe9Szlw72vSlJ+aXrzM1t4xN/faa5cFuBLg3I7
	 WmjC2LmE/VWGMtZm6M988mDcqiMwaU7ijA3ip3NrWJEgPuaT8Ro9xOgZTerlaWIi5BjOG
	 TLpnWQbjPkAkRSevNCH3jTTEOf5jttX5e1kMX+KJhxjH7HnnlBxs5b1XJogMU1UvDhJD5
	 Vj4ngL+QyacVTawNtrL64L/EjwCkuingGIpy9LQtvqu7b87PmRE84DvBPN1C0dUxerVWj
	 wEdvOVXQ8l5Atdpgri+1BIm3QWVEF16Z5vPZRKIs4X8RIbKBTfL0JEHPo88lY8ySi6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0wVNYO6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RL6SSi/A";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7DC606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7DC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0wVNYO6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL6SSi/A
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Lq1h323198
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=J0wVNYO6ILmcjvju
	7iC3wjRXx6HXaui59q8Puaam3pkqhlEF5zwa5AYDOyjyCEiFGLlhKrl9HPdz/iFG
	kj/H+ckuLBaeLmhWksYH010OK0UJ7u2wUEZ5d6C5WdJf9HK4Eu0pdioDPtJA1Yyg
	V+FZXJMssVqyRtmwoRH1YW8UR1yKiJ9ybXB8A4ZBMhNU94Zkv91mjF8W8PJjSWN5
	ylkrwYCcgr4gMA/H/CvIp+KGgDhWbeehIOpS76RBGPXpSB7B1n5ddo/K2XLgAY8i
	yO51/Ip2KLSNgj+BdAORyUMWLJE2+LSnlrNK53OidUYcNqFLzJXzPlD3/cJcrkJS
	fZvsJQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx55wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:14:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18741aaf8so4942135a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809659; x=1795414459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=RL6SSi/A2+TFzFy6N+ysBZg+J/XtOZFAoJksroGz9lXNIItVylW/0G0C/KMZvO1YGc
         4gvyio2fOU0kCF+ADt5H1fDsJiwy18U/Duaw4RAk8iXv38uOyCWT32IAhfXSDrGvZzcJ
         T8eatCQgDTOcXAPJTtpjZZNC1OoUsY1qMFDFmW1TEzd+DPnqHm/Byu2WZFuVNPCTqFer
         77nWCQRbETDiaFvgyC/JUea0ZWhdThS5j+tpo7Y3sJwIC7U0gcz8zQOZXP5Z8sQqJvdp
         yKZL2qzSoJhoYIgmf5dfMCtZJwFDCyu1pLNsx8nVRioh2RvbXazFC6H8G1JAnahk7fcx
         v/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809659; x=1795414459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=yvH4A1vUIPP1/wY/Z8zuBntYmkVjkzyIo9kLnFiKVOSE/vZ3oeyRt4lko8H3fJDBQG
         w+TUCH9vluVBhoJDalKeLDD6moQ8IpKcJg+z1KxnTnxl+m1uvPM6j5KSFIxlss7EqYsI
         r5CvnKfLPU4CAgexUwYMmwGQs8xPhPHzJ3/HUmFIpvwmtftaZISVfpmZLf3xqNdsrypZ
         g28wnue37awXABPbKfBZuFcnLWL9CB2tLHK+QUWc4JhtoG8/78n+bo+u0mAp3F1WU6Z9
         9dy3Wkhlr6v3fG4IxXy6PYVPPN9LE4ZpqoDM2wnkY+cJWqMWx6Is9ht3cSRmAivh1x+y
         79Wg==
X-Forwarded-Encrypted: i=1; AL+hErFrKipYA2OapWudbEeBHDGu1gAu+AQZlUW258GjBNJkARVFLjYWLQX++u9cs01mBXeVs0XOfJjxCIuQqRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nmmQBivL/K+l94kZTsMNheppKnUL0GEB8Le4wMUxzbFx3wwYF
	W57wh4LNg3sjM0zAVvR3cSXsb43E4xFnA5s7CcWoEDTVrFTm1qgNF05ftIKPF7aPFNvBGnLVrLj
	sG/xZuWt1VHdoDSW6cOIK1i2bV1ZxevxK7F8Rw9HHuYp965oMV8l16W3CMXl8QlhqqeY=
X-Gm-Gg: AZFdTZckoE/U7q1ILbvsY6QNR/IfKOY9CkAf3K34Fe5PA43193YaG/6QMCMOCulHJpJ
	+2pq5G9WfBFVeMVSDufkcOSKLigoR1jiY13NOgLWz5D1ILgXssVPnZ9VaXAg/lRePmAVePzl2SR
	uhjagp7VO3wT48oTROR6QvkwCKy5KdsmVsmCaCEN4aVwYJKB8YAlUVB78TYMVc91lMWwFfMJ4gY
	KjOd4FHSm4IWABH88o5cpMoiDAEPvi1Z4+VGY605BmGXqnwTf97UIUCwbky/GZk1tFCgstlci2i
	SgsFGTLS5fbBq3DnVRIed4rrEC52lHaESCXFOys9XX9spdeDD21ss+TISTxMTJqod4gcgskXUN1
	SgIcjwqatGHvcaIEs2bLYfY4haV38IahR1mjAy1l3mMggRbMksLc1o9FVA2x9Zb42Qvi4
X-Received: by 2002:a17:90b:4a05:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3b1b0cdb2efmr8498349a91.46.1794809658926;
        Sun, 15 Nov 2026 22:14:18 -0800 (PST)
X-Received: by 2002:a17:90b:4a05:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3b1b0cdb2efmr8498331a91.46.1794809658504;
        Sun, 15 Nov 2026 22:14:18 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:18 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:24 +0530
Subject: [PATCH v5 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
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
Message-Id: <20261116-pm8010_i2c_support-v5-6-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=rCBCJHon6H5ChuYqrvX1bQDSdX9GNWCh1H5WAFECl0RDZXP0CgRQUQ3kkFoyEGLLRo39/+QWn
 KsXwZ/an8HNDeRcgdRxSxyYX4yUXP8fcAu4l+ns60d2na82HAeTEBUH
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfXxdOi2T/enktr
 0j6rcaqlQYQlmsFL9U7Ezny+zW8Efw9sU6gnpYU8ffhT/7wWiXTz5hTl2EBSt2J51cWnK+hWdnW
 gPgn5XNLKH69GABZjqDQJqjn4vkh+0ATLbN1sAGNiG8lWokE8S5fqJUnT7LVDU2g+4HBG/Jit+w
 d8owPWoQBsDiSYCokBGUjpYDSSJ2dQo/Z40CWd1XJ/2Sp6m2F2f2cooIlUwQu5W+LnbGCorRtnV
 OYTwGf86QI9CcqpSqA2db+ooT2zsLaThxeJBcM+Yxrz0N1rSwbJV0EaXeJDZYqIR4P44ARghEKp
 l3Rs9ysBXLer+ZrjCACJeNGihGlKTtpa0gOG8YvHUOw0E4n05s/GJp5b5eohbT76A/Uhostjn97
 G3DK9gPcN2uCaxpmrtlZm4xGDP0oESrkJayxaYXb/lw+TCVQ1A3GkYNazEEvQCYd1KcheebO1ny
 V/NlZCnpn1mJKqyXz3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX1rl67Zl3b4EF
 vHfMZhoBTUQAsL7IFhEtGcuQF5YtXv9zEgNZiZFwWVOXPUbFlb9z4cL8GAnz7ORE5G1ZCC5FFhe
 WOWwPssiaVU4Q8/k0PFKioAKnNodrQY=
X-Proofpoint-ORIG-GUID: WPQK0OgXwy4oEX9jpMpJ-LjRukfWAfsD
X-Proofpoint-GUID: WPQK0OgXwy4oEX9jpMpJ-LjRukfWAfsD
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afa9f3c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

