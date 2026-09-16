Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560ED4B0E58
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578408; cv=none; b=VCYEGygwij+HTtu8nI5pq/N0Qj2fECrfP0LpGye+Rw90grp+1HB7LjXa7u6MLcCOr4ADXBHX/e/SB93hpTUUoonyjo29dWBseDAkecir4hC+OS2Qo+ntfh9yUR8PWko9SE+W7aVIs6R7XZqgOtSesA7JJ/MI5OxCaPd5melt1Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578408; c=relaxed/simple;
	bh=Mb0mdeCwrCx7WfqFx2rqbE8d06K2O6jx/ez8mp0KsHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rSbi/79AxEGbdPgYpPkr21Y1vWKJd8O1h8BN7x41UA6+09IIzU9j1pKk+tTfQxL/W//vzs1fqx4opTLjdKxNYoIu6lqmwKusj9WDdsUUpqjNgLIzSQgpWhQPPQPqxl0HvLGzcAgBpLVvNgzTQvlGofz+J7u37rbnnqPVyhq/ZDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHrxDMR1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2+7OUHm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHrxDMR1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d2+7OUHm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeEBf3107066
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NFZ1EfK0FGBQAwVJnJygf04anMhlc164E2iaPiL0Oo0=; b=fHrxDMR18j0kIC7Y
	BYZtPmWNEtnUzyF/47E922k9i0vtA8tg13H34QFZ62KC+Nc59DyjN8oZ1pbaD3fg
	C3GDRZ0Hqflegju2bYgp+C2hGiD4oIm5tqOEIxaqIbP6DuSTHOlwMwarYbCJZM/l
	+FTi5GDSeKD2/netj9zdqd6So0pbAPrbdJA1RAXIhoEidWK5Dw0btpsRBABluMZr
	ON06HV3tDW/a/KSaS6WjKBtSQ87DpSHVsNZjeI5SEI7aLUeZ76J5FmdMWsZn9H8i
	a+NwGPpNzz+8AC/XmVPgNX69rBnZ/LKlfxXPEkatKb08gvLWi9o2iY6/F4FXcTKw
	yCSRzg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2s399-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:06:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c98e907506so1947551e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789578386; x=1790183186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFZ1EfK0FGBQAwVJnJygf04anMhlc164E2iaPiL0Oo0=;
        b=d2+7OUHmNBZ8zA3knN0jWouvtc7jommSjzocqvjjD55e7RwPG7S43e+E9KBoEZ1s1N
         rsNZdmPBUO0QPhQe9vdDdilrMxKfQmLyurU7z4FEqLTBTFQ/6lFfNm/XJhMqGb7UYHE+
         LCv1ze5HvuLGipqmt+X9X6HqZ/c/KZEupM0qHZwhwCMTJdPcALxzjeuEtKrx8/WwqtNd
         n7ExD9SJ9Bs4uROIeOTJWH7Q83JY1ASs7acMqDousGuBPpZrCvSANF7BXiRriQy0Fb87
         vP7ZcAQJtqVbzElmcgdATk15wb5ujCfvqVj7Diy5uM06jvvRNF6KR2NkkxFT4h39t/Uj
         9fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578386; x=1790183186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFZ1EfK0FGBQAwVJnJygf04anMhlc164E2iaPiL0Oo0=;
        b=jP5xajCx6M+EdHMXjUr91pj5ulkJ310QK0Gt20wIUQlOgr3tnDIpn0M2+ptMprXOb+
         XmVJkASXxFUUynNZ+/IkE/ijWC9Glo5851S4XlmAeaQN33sODktCz2yKj93FhdCuS1ye
         En3KlSfD0kxzKb5m+kjiA1uCcznEg0EesQM2VwHmVVWafgviBwkkYJpGuSK9t5h+c2Nb
         AB0LjDpun/JAZqlqzKG+DwlWzurPcyImlUnLV0oFGqXx/ve/J5NYfyFuusTkFKBW813O
         n0EmVOIIMuegcpjqHqlrkY3PzaMjBezHLKws5NKI3TeBBNxzBsn03bKhltT1C60IhDAE
         lklA==
X-Forwarded-Encrypted: i=1; AKwUvBxpvwaSc+bT08zOTjqMsuejG23mZt3TEE6JKo81kx0NXSjkCFApfuS6vDgtdQpj5fIzTvZPcHzJG4KDtXg=@vger.kernel.org
X-Gm-Message-State: AFuF++nHm45i84GGJEZfcf/hg2/JHxubj1EhC1krRqp0dviKejJOqgkh
	QGzsbuD3dZwMz9shq1ANCOlHmEuKuEG9YGj+Zei6mWEnpka6I838GJjgn/Jt+1gsoiyjCOkHbYe
	j/8PZkMrFoEVF+T8JbzyEhfdvGk/CRSpdl8NsViT/hStt6MgTIVaI7qpUArqsKbRCZN8=
X-Gm-Gg: AYBFou2FxHegRzqEYt0/sL1RxfLAWtClLoFkUnORXu2cOiN9dwjFxn6ryA53UJBXTKk
	92Bdfj6MOfmg2Q3GsOG2J/TyXKJedeSdqOSXMa5l9/Bw9SAlTmMCsL1JH0vsD2psq91Cn0KcbUY
	sptSVCc7qmiXMCcx7pOnYv8En8TrM0YaQ9qFCGa5qPiqzT8YYlBwY0k12yi7sT2K84IlDy9ZxoE
	cGOiTMxfiKd1GqhKAGKVarurVAMQI63KV0EQgfV8UXakVrt5ODAH2kbuDSdOs05czCTr0JnbRmd
	oypsuoVuAAYuvwmHfJHHEMd4otKi/ZnJYOblVbaCpRfwN61I3LpYP+oroS76dhiGTcD9XHIvN/P
	y3ZxZUHTD3808bl9m5K7xzD4=
X-Received: by 2002:a05:6122:2217:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c9a5728439mr241121e0c.7.1789578385985;
        Wed, 16 Sep 2026 10:06:25 -0700 (PDT)
X-Received: by 2002:a05:6122:2217:b0:5c7:c898:9817 with SMTP id 71dfb90a1353d-5c9a5728439mr241069e0c.7.1789578385558;
        Wed, 16 Sep 2026 10:06:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf344bfsm7951293f8f.27.2026.09.16.10.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:06:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 19:06:17 +0200
Subject: [PATCH v2 1/2] arm64: dts: exynos5433: Re-order nodes to match
 coding style
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-1-8e9d534ba5b8@oss.qualcomm.com>
References: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
In-Reply-To: <20260916-b4-dts-samsung-cleanup-strict-continued-v2-0-8e9d534ba5b8@oss.qualcomm.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@axis.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mb0mdeCwrCx7WfqFx2rqbE8d06K2O6jx/ez8mp0KsHg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqsyLcKHB6+j9cfCHubyy5MmbU0+MO+g05wW8w
 KwhXWJdrcmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqrMiwAKCRDBN2bmhouD
 13OhD/9nFYey08IdmZUVW+F0VbO+X63egt/e/h75gvixeDLQCp3Fk4sZBc7rCiImDgoXYxZ44vp
 s+7XtIuusJP+CsCBpnjn1Hqx0B3qIbwXReE1RSHzlz2OILWmT3Ml3ppq/dkKpoc4F4X8sPTIzON
 C5G4CpeJDCOORTNhlwEA0xnA5aSdtj+1CWF9hcbKCLn6HE4gH0FRFv71Tvt5LzQzuIVb321f0qB
 9v9/ng0awnhoQuCC5zHgB0Fc5X2ew2D6tCmtQWY5DxXtGYBOIGfGILd3xI6A5RGzSCwzGzwJTcC
 I5tu3y/DmmqMnxfkTnmJVaZC6GfBv8f0Am7OjLgwalwH5/TWpbLco5YYflmNnOx6ss+3FMPlPjL
 cdRsOLLg7Qohm7jvxBpYB3sbhvn8SsiPc3W0r25txM9ZP5vZEdpWOCjCojQgSb7VhfVubA+SifW
 xiMTMtkg+tx/y4Z4Ksbog8XPvcD3+YhxkpSCif87lChPun59nFKNg69IXqQ7n9BMXT7A0wQjrH8
 ncgD5ktoYqHlrOfVD3YmUBY6SnZ6GZirJrcQtvQWlKgiMn7S44gS5u4csOc4ljC6XsUKAcbjoke
 GDWtHsRuG+CdofeTD2VISMX2B0qKzq9GS7htKYJaEqoIu061IglA0AIpN5fQOzVPtYkKcQb17sX
 pXzULo61XpIEL4A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIzNCBTYWx0ZWRfX+vkbo+wo++/c
 bLP9jUS5UaDrgBZxlaGwWJFiZ3ChiTN44gnV3xiydux3gnyh5EvtfD+PH8ex5ddSF4IQuimpvoF
 xHoDQ2K7lz+jwsPN/5U8a8wQpuTQJqk=
X-Proofpoint-GUID: ndzmiTuzPLLTiwdG59xSQkqys2eJYNdw
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaacc92 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=4tTdy-R9G4y-is6xSP4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ndzmiTuzPLLTiwdG59xSQkqys2eJYNdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIzNCBTYWx0ZWRfX7Z/lcjiYwji0
 1juodrPW40HTN3GUqlRyKkl6Q7DSuibnjt1/99Ivgj+dUQCVgcAvnscaZH35VjBHH0aE7+yFJm9
 NdEAi17TpfKyyplH4ByQ7XX4WcxExZGrHqjMlJe0+URpIpGgbLcwtMxIrPfqF6prgxvteH6Uuyo
 wdmR9DiqXV5qrEstLKFY+jludXa3e23+OsPQvSIGMMOo6Spcy3wh/pmMx8z+rRXGsl5JpNDv+iy
 lWo+hE2OuJj80TZJxkFiuj9137cqY4z4W5dQiit/yoXf0aXO2+6eC2yM59tQ+rXjxdeLpynhqRa
 pa9gRAGjNR+XWEb3CwJgcwsC5ubSlc0lrSv19WcTPuNGkGY3B/ekVq/Zo0eE/VoBafAtDH9+yKz
 Pdl0eQ0cPoL9Esu1u8nCLT0XkKuak0AABrlnMRjSeX2ZBfuTdzlIDO5fl+0BxR22cf/T2gnzaXH
 dY0KW92/5mnk+41JhQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160234

Re-order a few nodes to match coding style - ordering by the name, as
pointed out by dt-check-style, e.g.:

  gs101.dtsi:476: [child-name-order] child node 'ect' out of name order
  gs101.dtsi:479: [child-name-order] child node 'clock-1' out of name order

While moving the lines, move also linux,code to the end to follow convention.

This is not complete re-ordering of all nodes and children of "soc" node
are left as is.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 0ad02a098765..a85afdde9c41 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -56,6 +56,13 @@ memory@20000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
+		homepage-key {
+			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
+			label = "homepage key";
+			debounce-interval = <10>;
+			linux,code = <KEY_MENU>;
+		};
+
 		power-key {
 			gpios = <&gpa2 7 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
@@ -76,13 +83,6 @@ volume-down-key {
 			label = "volume-down key";
 			debounce-interval = <10>;
 		};
-
-		homepage-key {
-			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_MENU>;
-			label = "homepage key";
-			debounce-interval = <10>;
-		};
 	};
 
 	i2c_max98504: i2c-13 {
@@ -103,13 +103,6 @@ max98504: amplifier@31 {
 		};
 	};
 
-	vph_pwr_regulator: regulator-vph-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "VPH_PWR";
-		regulator-min-microvolt = <4200000>;
-		regulator-max-microvolt = <4200000>;
-	};
-
 	irda_regulator: regulator-irda {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -117,6 +110,13 @@ irda_regulator: regulator-irda {
 		regulator-name = "irda_regulator";
 	};
 
+	vph_pwr_regulator: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "VPH_PWR";
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+	};
+
 	sound {
 		compatible = "samsung,tm2-audio";
 		audio-codec = <&wm5110>, <&hdmi>;

-- 
2.53.0

