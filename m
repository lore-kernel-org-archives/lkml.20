Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE8C43C045
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768862; cv=none; b=JlbO6pLJqZJ1hNxIIV+Hkhj5ASAkMjN76zqe+Bd3MI3QU2RX4ecu+ygmQrTOFZh1oKQNQlgo/DlG2OQNS+rMotX2mKUSZ4vMNsBTgy9YaZO9FtZKRiNjbLqUbENAHszGzHdeAOXqKX4pxifxKsgXCBrsYyliDO7rU6SY2tmS5lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768862; c=relaxed/simple;
	bh=9YSmccNbUMCCBO0gPcnFhs0JL6BQ7ZKinOfjmTBUCww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XDlA+urMiNOUWiO4lYsDh6kpjvZVeOZac5wfnH4fV6ewDQ7jgrEyyJ1cS/U9sVuU9FbtQxi6Zkt5WVTzA3+47gAqTAa1mJlO2iouf+isqJhL5QOWbao1D8R+SvrxT1w4b73nKa8y9yn8IbWTX7O8vaWFAhRdJOWjEGF6ex2H4vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPdRNTV+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F/wY/zKa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPdRNTV+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F/wY/zKa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777XMo2724165
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCLU3kxIzq8/MCTjl1p5xKWJJRKm1j+qJos/WCdQA8g=; b=lPdRNTV+dWlRj+5N
	PGrIJWBpuEKNamXlcieEIhfWBV3zGwuviEhN0QhTZY515MD8Fkbgdgz94dh5zDzL
	cRVJQrVWPKFtV/9ns9YnUropcpZ62zTNF7eyb4YglxEgErJ8xJSD5gEOPG/1Dkzn
	CZsQ0m6jfsF4sqpC854WExdy/AhkFipPF43se0zxUfZsgJ2mFGJI+n2rTJ0Z7Qko
	ud7NSNOeWluQftmVPXlB+N8SX8/4PQ2lh0NNRECUWhDX4jigcwDRbY7HzUU5vMkB
	zu5L1h4cjbwzOL2rdbGP5Wc35jUDtXLOaWUgaLGXu05lA+q2U1rVpzKDzIhn+Qtg
	xQLAEA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxksn2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:14:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39512608fb1so7485086a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768858; x=1789373658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCLU3kxIzq8/MCTjl1p5xKWJJRKm1j+qJos/WCdQA8g=;
        b=F/wY/zKaaJfxjAmpne2j0rzBB6gVlqc+bfVWyeWkHwYj2JdqvIUnQaeiOT6RMKCQSY
         On1MD3yscpsASOcnhAvloXE2Pn6Pezy4V7mUmgpCDLFe1EJXGs/4WVsYz3RkjvZps7vW
         nzv00ODx80zTjPnuh8PBMQFAAmKJzIeSkAjQh7uyoG5uHUTP0CjRuEpHzsaGgMqrvrKU
         +J6u0p6V0r0uSoQSsffTxy+44vltq56oSZRRm2JoXOT5N0af6/bmpCQf4hpTTcVyTD3b
         9APGLGoDNCmCnwhH4cdsIGFj1FwB7d8ChLd6YrwBYVt0nQQYI9n2k9YHUf6kOjjYUXMf
         dsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768858; x=1789373658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCLU3kxIzq8/MCTjl1p5xKWJJRKm1j+qJos/WCdQA8g=;
        b=nFEnyQ3vVIirHP7MtYJjA5SLwab7uFhSEQ74EyBEu4IVFkG3baHwALGqOoNuWYcMLH
         P6P+BI/xBwBeI73yoRrtTGE1SzzLc/O4uryAH0H9WztdBq2PVCY3nzzC4Bjtvf/cBlTT
         BiceZTOlyncY7ZhXdlm3/0rNRK6yhQnlazrIkq6alF8IebLm7vGOzWEvxVUei+gSY4Qu
         AlDzqRcRTdzB035zW6iSS0l7S/RFqOdBcNmHAhHfGJkDHHkLxKdEG5fdTsnzBn2Ua0Ai
         Pp7H5z0nYr22t9VR5qIYqEy2kvrCZyPe8SptfwI+kjsjmsjoYy5WLyKUMPw7iJ+v8a7l
         ViXw==
X-Forwarded-Encrypted: i=1; AKwUvByZe2Zcznx24VguVbvopAqJ1f8QFDn0UL0YbX+A1R1MrrPo/W69O2LTIHexub1hSWSTJ342kILXI3kL6B0=@vger.kernel.org
X-Gm-Message-State: AFuF++mRnkgbLc+qfNw+nJYr4aLLE+hwAb25UCw3X/Ah5oaWogYmt95T
	PinISjjoRUN66dAkyMCjo7TB9bXJdsqyJzyDRbSGOg1Lnt3iSGZb6kZbiBgxMzUQr99tOhTpXNg
	o4j6alS7d5YWiwaNkjTlarZAZaLfTnuyqV7rxaDmBTAyQE5ZAXPwfdzXPu1JYRyZPm8k=
X-Gm-Gg: AYBFou2zmDeztiBz8b81mtVhrS/1dGQUritvIjM91xEXG9uCKsBDzDX2eb/NTkpdKXQ
	fDkO8Y02z1Z43A4a1ZpQkbiToEwFrnzWPaxo2j1eCzLbYebtKoDX2V/QG4SmQoNH7Rcyz2nc2L0
	2B6ilFubVknN5fASrCPIJn0xy0sdxl2Q6PsI1GrX6y5cKGm2Bwr6gaju/VgAhDpSdMS5HM1bA7F
	vwIz/vjRPoO39OEdrLpJyTuTl9FoycJFIZSgbI7JYPrm9vbv5miM06gtiC/VoJRcUqwEm4GIMev
	BEBWeSUkwIAlSrdoiKGaNA+N8+S+O+erFKum/bN/oTfTuusRD+jcKXZytKmddVfBtK0LTh56BX2
	UL83H5h6vqZik5vDGPW2vZQZj6N3HlP8=
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr34120692a91.21.1788768857258;
        Mon, 07 Sep 2026 01:14:17 -0700 (PDT)
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr34120623a91.21.1788768856764;
        Mon, 07 Sep 2026 01:14:16 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21724220c88.6.2026.09.07.01.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:14:16 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:43:39 +0530
Subject: [PATCH v2 3/6] dt-bindings: mfd: pm8008: Add PM8010 I2C support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss-v2-3-75f7982dc983@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768826; l=1891;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=AoJ46bykjinzi5CHRfxJnkzB4gRLtxmI2zMTEfoIMCg=;
 b=L9u/5sqhOByy8TAubk9xjK7ku91RoQuKj7maUFkahZ+hPZWBHmj6uxWnCX4BR8irYpKvnI2tW
 7np6GjGCQ73ADe2IFtIdJHFBzQAKZKAxGYoUhcH5OYwQF8f3Sesrax6
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX9nLbnOqX7B+r
 K7+FaKiDeA7VIJ/rGHwMZDNVpBmTsdN3xZllyzEX+scQzAMn04MpWRMX1CMTyLsmXF1ybsO/wWq
 xavF+uiUjasl6GMjnRp1XS9313XTgpyOi0pryNLUr1ISibERLkNgRdMYr9do5uS7dUvZsVXI2mH
 UK6FW+ahgfe+UUEudVB9MO6m0+k1X+6FPdVE4Ua6HXyBTgSjnOKD35wLFI3AxSSqZGL1vyBL20O
 hGPn/uLuU+6Swf5bYY9gdSdPDD1oCThBDkhcWRuqTaFMEms4GXFiTgngTmxteN9bkpkK1HHk+gk
 Ti+WZTZKLnVeTxdKDEnRVpt+9r6EEcJL/AvLJToLJCVJ6CIPnWWpV9w0GOkudXmHgVux+gOHyIK
 tusQQEldDfVMocwyAuur166eD1e9m2eMjFjEuxFrTbnxTzuaY5UOCd3gis5DE1gQw112CT2f6LF
 DBQ+08qW5fUrGdLSXsg==
X-Proofpoint-GUID: US0Juz4jn9jtfpANOJue1d0b39HPfOj4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX79JW2HULiAwq
 KYsJmuLaMplHWW1y1DU3TmwrDYJCe+TpGqZlutPz4a4v1y3nmKOj4k1KZ4YMugXZCfUkGQfIc7a
 D84RSuz8Bt0bnCdFZD6ToBPsl1sTKgc=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9e725a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5mci5dHc59FVrb-tom8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: US0Juz4jn9jtfpANOJue1d0b39HPfOj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Some designs integrate the PM8008/PM8010 with the interrupt pin left
unconnected, deliberately. That compromises some functionality, but
the core function of programming the voltage regulators remains
available, so make interrupts (and the interrupt-controller
properties that depend on it) optional.

PM8010 can communicate over either SPMI or I2C, depending on whether
GPIO1 is pulled high or low. Since qcom,pm8010 is already used by the
SPMI PMIC bindings, whose properties are tailored to SPMI, add a
separate qcom,pm8010-i2c compatible for the I2C case.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1dc571af668c37655017cefe82e139..2f439ff9805d253bdd815bc85ac206ed1be964b6 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1
@@ -88,18 +90,14 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
   - vdd-l6-supply
   - vdd-l7-supply
-  - gpio-controller
-  - "#gpio-cells"
-  - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
-  - "#thermal-sensor-cells"
+
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
 
 additionalProperties: false
 

-- 
2.34.1

