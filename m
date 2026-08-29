Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1B7367B99
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032391; cv=none; b=JZRBFspDID1atgQa7QkMD/3Q7vDdpZuhN5YNITG3WJtBnkjsNDqxFFF8b9JjhUK2rmfBZwfTREcYwHqs54IJne8iX+eFZ6uAACrpfe8IIN2i8CHX1NqrpIrDpWMAP3XCZvw46ZuzqJk/8R2olDu3kZvkz44vLncxr03r7IHnwQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032391; c=relaxed/simple;
	bh=Bg2i0c/hAjhdv9OIKOQ6pDZgOaY5zMut7G6FhJaYG68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sZxfs6eSHVOjtNEz85p+3UoF5yoM4WXhfaanSjd+zB1dkV3qrbsit1hqMEcmlBhu6eGsWF3AyVMuM7J0zQ1j8WlPhrsJlev2sXoEL/Xsuw7qIdQdDtyImmDehJ5y/ZOaLrGjxqdaDxCnZB7YhU4T4ZOuyZ5X56aVtMkYnkOR+PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnBp7+tS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ea1+129X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnBp7+tS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ea1+129X"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGwv2i2300909
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aIEddcMaVEtvM/kP0tRNHftSi/RKbVZ0ZEL
	nu5QLbhs=; b=CnBp7+tSe/UvqzdYeytpsNJFAF8gsSVg2Bc30CaibssYfzFsAln
	xC22heBRDcILnMbF18KgxN9bAadR58xegwUoA7FixVCY+zChKiQ/4+hvxL9VchIb
	hJuFxYo46GwLP+xnAFpPo8ADVobkOSOrz8H09mGhzfAwHo86eiex0LQqNyTLIsEc
	JnKP+rsin1wkgjCuFnYBwXjR1RxvC8MzoAxh/MlN/dT/YRzryhICy9au7/7iLtuJ
	MqfL211WQMetqbQ3Sdc44HH2tkMJHfO+1xeKiEURgaLdaUHDD/70WP7Lpau1bKWc
	XP9ZVeGGtGg56u7hqfWG8mRcylvtPQDEgKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqfb1pbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:39:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso20099211cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032388; x=1788637188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aIEddcMaVEtvM/kP0tRNHftSi/RKbVZ0ZELnu5QLbhs=;
        b=Ea1+129X/3sGcfxPqBn9NFss3y3zHhfJvY3qBCIs7GTpU/ZYlw4GpD3vNAboeN0NYn
         QdV2NUwg0VfVqfEd8CzTPxe34XrvfXU7OKCNw+eIQVpLNlLjx/CPofMQTx27rXkpNK9Q
         kljP49EObcLhDOZev3s0GAKJUBnRxoW+srmUOLCRnwNnvhHSYnsdkCOSlZVTtZs80j6F
         zWYsox1p63ixOpoDaxJU4ZYxGRZlKKyI3LedjyTEYJ6ww9hmcSGba2NHFNuP7QvmED0i
         QPzf6G7/0a4Ad6CnFzucSq5gZJ6mu/SBg/BQ/9Jf7+DH1M6Vldv8MMJCmm7Sqm7STTG2
         /VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032388; x=1788637188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIEddcMaVEtvM/kP0tRNHftSi/RKbVZ0ZELnu5QLbhs=;
        b=V0nR/QccP53qi/SH070K9cVmZSqh3ySXyE9igZ9NoDn+KUsBnNaMwB0ffIjBnr033c
         Y8Y3nnbVu+ifrJ18jm31l+CQusy5+YtxmnNPAepL2Uvtf1GpJiq616ERygOtTaa90uTZ
         Tpklk9JmhAPKbC2G51D0l/ryQ5W7mthoOB3jnqIEASlxAtS9VORvQafKwkii576k279q
         oeEmQfF2SmvWO0t2c8TszKNHS9i+vL/ukfXS6GbNfqUS1PNXnx1SJwBO3ojh9YLkVD77
         1fOxxBEEzcTeELxzRnRLfZN4uS0Oa6vvy6n4znsZ2A5Vtd0kBCxjiLmatN040iIJ7T/U
         xj4A==
X-Forwarded-Encrypted: i=1; AHgh+Rp1zfOkGNi+kMsK0EV+geWudV+8EoLb7VFqFyY5JWQ5Qev/xJqtR8WlYi63vFjISDWvOL+xbeckOEKcuCA=@vger.kernel.org
X-Gm-Message-State: AFuF++l8KFMLiV1eTEQzkUpyf/BwX9aqB+Ubn88Wrh6IgjwU2F9D47f+
	CDA8UoiSlWa5Of6TKdtKbL8Hn1OzQHYPZAODe5Zq6eXw6C0WjKqWjWrRTkok8apnu83YLC9slmc
	q2ysN8rJx9uR1i5q17YcnLVNOAX9Bs+MoNEeixEPk6nrCfpbbbxjusnZ/S5H2A7Czyi4=
X-Gm-Gg: AR+sD13Ifwve7azqt+BrSrnYveVnfVaGhOH9Y079xNDnS+dm9V87aVMP7vcLsy2ci5j
	Uy4NvQtB+TBrtEPizKgu1XFkyOAZBhr0ZNMht18CyKdRGMH3YsDohA8ox3oyDfW9G1q5TmMPmFi
	K1RTr17BYCj+r7DS8lE2mPdslpun2KbvoNfTiU1ToNvQytUXttKayNopzZA7Cvgr4Oi7cJhyxE8
	askipheMJN4Y5g/47gaOn8fQh1GsEAvgQctnD4o+qtQlQ0E6CzKzaljEAlt7ok9ib0d+9rpnIXw
	ccJ5U3MgSbyeMEMs3hqbjWesuBBKjTdX4hTRlMWZjtwhnnx/aKP5dB9kR/z7bHEPTwZT5FH3EvM
	nwND/Cr10lzg6Scs=
X-Received: by 2002:a05:622a:c17:b0:52e:f66:f1a4 with SMTP id d75a77b69052e-52fb96bb480mr178780671cf.38.1788032388491;
        Sat, 29 Aug 2026 12:39:48 -0700 (PDT)
X-Received: by 2002:a05:622a:c17:b0:52e:f66:f1a4 with SMTP id d75a77b69052e-52fb96bb480mr178780321cf.38.1788032388074;
        Sat, 29 Aug 2026 12:39:48 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm174807485e9.2.2026.08.29.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:39:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: amlogic: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:39:40 +0200
Message-ID: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2956; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Bg2i0c/hAjhdv9OIKOQ6pDZgOaY5zMut7G6FhJaYG68=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzV77bAJ3qccs3sw500Sm2xe0TUu8z8dDjiW9
 3F1wLWCHuKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1ewAKCRDBN2bmhouD
 10hpD/91mk7c+0AJooUZdmo355ku4hNXWU+jRxVsS0RNOaDWsP8SI9t7BbFTVkk6EROq0bP0iA9
 LH+T3U0CGceCSauGFZbhZX4kgJ/1951Kw09YgYsZFjlAN1rkAZB+wycblUaqRXPkXK3qLR6W2Pi
 GqQsNl3+4JvlH13PdLlWKfUv/3Xrzd0z3UqfI5TbIhAkoR7hWQiOvJ2c269lxpWyUeUFpBa5AqE
 XjWFUBZ+mUvX0ZhTwBNyn3dC19tDevCClfNZ/07gSF1URpp3IuQdA4hj2EksLXFmGR2+HSqNI1i
 m+eivVQYhEB81N673Hcr3/zwuzP0mCVSIRB7AgskTcIag4USB2nnSeyj3pV2ywk/WsbGazRV/4a
 JsXeO6WIps2gE0HK3PWnwo1gIj7WddjZtDhzrRo4VPyiVzWo0OzUAMLkv+r4cakh2XtQw1/ObaC
 ZUtRvl4YzmP0FXA9umY/tDfdpekvvzuAfwDwLCH8nNPCUyF4YxvpLLdzF6n/5VKqUe/8lhq6Hmy
 G2c3gcwlL8+9XhEw09xgGmF5uMvwS+j7qsFChYJkUISElgXnd3jvZPKcugMM9jIc031xSIINGu3
 hasmp1zT/gh2ApbVAOsw6PQcqAmiWJRkW0uPl7iWaCuXcaRK1ccOV7iM90AB3In0onZqcMhk1Y4 3rE1vEQdrLTmphg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX8ZijZNvQl4Pg
 SAmN0UhsdUb4yt6kwzIhzBrjNgRTEizbh1bGxJcZBm6DJoshE1kkFnaUUL+rH30YW7KTPP2W7p1
 elL8uc4XSPDPVHjEX/OMcGwGZNJmNMAfY09G4mGJz4ZHfrtUy4O/rnJgoueBM8ce9qmXY8Wzbqn
 eBNxKhkG+4dBrzEOLsObS90R/SVBB3kzcXz8qhuWPtN2dYDMbfg47TZzxW7KY/5Ro/wxhX2oI3x
 JLeKLVxMMeLP1Uyd+Q1aSfeKpRzlI9CP/JkpGoPqXHvtTrA3tmpQKcVKtLRX9ncdigZljnNUSrh
 A1F7j/VcnOCVuaj5qg3nvpBr4StANPW7bwG4k1hdxf4+pAWTHpfnNYRPNiPYGtzKPGyXDWbxeIj
 jjcb1stKCeUa0MGg++FxgihLQGIncNSmS5h9ue0yeeHYEB2AdvJ4G2ltxq32jAA3UoByyIf/3Up
 uv/igaEkDiNv5tloHIA==
X-Proofpoint-ORIG-GUID: 3Xvg640Yvac_09feOSMwIVqvzxtEh8GP
X-Proofpoint-GUID: 3Xvg640Yvac_09feOSMwIVqvzxtEh8GP
X-Authority-Analysis: v=2.4 cv=Q77iJY2a c=1 sm=1 tr=0 ts=6a933585 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2LxfJNKA3dIR6THBljEA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX74AEamieV3Ia
 mGHwmObVHEkrQFwjme0XyX1BeyTWgsH4pywSoafD3jW1Y6aej5ynIGerkml4GliaqA7XOQtzJho
 zXj9oHdV0IGrxwofsXogszz6VYMeOSU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                 | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index cac73c59a94f..348baa4e6d84 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -608,7 +608,7 @@ &periphs_pinctrl {
 	keypad_gpio_pins: keypad-gpio-state {
 		mux {
 			groups = "GPIOX_0", "GPIOX_1", "GPIOX_2", "GPIOX_3",
-			         "GPIOX_4", "GPIOX_5", "GPIOX_6", "GPIOX_7",
+				 "GPIOX_4", "GPIOX_5", "GPIOX_6", "GPIOX_7",
 				 "GPIOX_8", "GPIOX_9", "GPIOX_10", "GPIOX_11",
 				 "GPIOX_12", "GPIOX_13", "GPIOX_14",  "GPIOX_15",
 				 "GPIOX_16", "GPIOX_17", "GPIOX_18",  "GPIOX_19";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 5d9ddb814164..e353f0ed2b49 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -70,7 +70,7 @@ vddio_tf: regulator-vddio-tf {
 		gpios-states = <0>;
 
 		states = <3300000 0>,
-		         <1800000 1>;
+			 <1800000 1>;
 
 		regulator-settling-time-up-us = <100>;
 		regulator-settling-time-down-us = <5000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..5c2fe9dc4f80 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -781,7 +781,7 @@ &pwrc {
 		      "dvin", "rdma", "venci", "vencp",
 		      "vdac", "vdi6", "vencl", "vid_lock";
 	clocks = <&clkc CLKID_VPU>,
-	         <&clkc CLKID_VAPB>;
+		 <&clkc CLKID_VAPB>;
 	clock-names = "vpu", "vapb";
 	/*
 	 * VPU clocking is provided by two identical clock paths
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..f257fe3860f7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -851,7 +851,7 @@ &pwrc {
 		      "dvin", "rdma", "venci", "vencp",
 		      "vdac", "vdi6", "vencl", "vid_lock";
 	clocks = <&clkc CLKID_VPU>,
-	         <&clkc CLKID_VAPB>;
+		 <&clkc CLKID_VAPB>;
 	clock-names = "vpu", "vapb";
 	/*
 	 * VPU clocking is provided by two identical clock paths
-- 
2.53.0

