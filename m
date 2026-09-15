Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA5F4A6CD3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473836; cv=none; b=HmExpea3LGKvl0LIJKTekLEE6+46TTP7z9EyoJrRkPXO5pu0LlSXPQ8pq+x/0gqv1HOxAbn2t4eXZ46PISrP9Ln0IVtmZ3cUgsaw3XJSZOLsKcmSZbsWk3XbiLrMIpGH+tUbcbXUFemmzMtbyV688AMczyIW+gzuypsAg/1ioqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473836; c=relaxed/simple;
	bh=cF/tteW0eU8xOM/G7daXCnX6payuvN+Gkw1/l5R6EHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sOoGFivpWzJvSsgxrdJ8I/py9sOFK1Eb3n9He6gdDm27MGQhl3DFSDSRHIHue3qQCogNPWEgg/hwvnZPGpXUIxN6QmswrTceks0EoWL2JlA9skdqZ/8MSPg0zlRNm/DUdQjrvJ4inbtIOVyFlAxu8vhqKGN/rKTRuBN7NIIe7BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X45WL5aM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMqGBRdN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X45WL5aM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMqGBRdN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h3Je3415738
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SUFG71AsT3ScptdxEEeprApDzMF1sR+8VaN2gUUPdDw=; b=X45WL5aM0gwnk3HZ
	TfpulLx/OuZUi8h+9aeH6BGJeAPnqk6bmNL1W3gj5Eb9ZSoRiuD3ngUQvXCZBFJK
	IE7rD9F2c/nrgnKnoOLS+LBJ0GDwdXpwRcLsl/g+S86mAdtZUGHlVG2vlDOT0dMp
	2eqIzI3NbXQB5vohhKuw16SPrBIYhBT+cQWeWAy8/1jlP8G2JyNgc7BVslrXiidl
	H6zzQ/RcblRXAg1MI2vPXKOiiGj4djlnJJ0UWi1QwrF+1Ac86tu5mPvkMt+0j/RH
	XC32GAwV8huYhpLX16dz8QhG4hZ+9wEeqqu0bOCedvp4Fix+RgicRDJ2Ws4KlXge
	bhYpAQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc0qt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:03:53 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c851df59edso1665072e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789473833; x=1790078633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SUFG71AsT3ScptdxEEeprApDzMF1sR+8VaN2gUUPdDw=;
        b=MMqGBRdNI7mmq6gZNdnA+qHKjhq/8H6UBD+haS1MVOywtxDHtldammvFQeBxSb4q2v
         j5F3TA2upt8BodcmQcfn4o/Y0Be/SNc+X78T73eqUPS5HsI4A+PYF7SVW3BntMTaiBdS
         +p0EBLl/aYFglpWM9WTD78rbZtm380T5lQbySe0GAnh0fH9Hr4NFzrnMhQlD3/eKh3HU
         K+DHtdsY2TREi1Sui01VCeZRuLJ+o42z4GE1ptLlJVmvtMTXrRbtlVnbWA/hpCoR1//c
         r435/Dn7BOu/Z5Q3EFbgfjAV24YPdtkz/JJbgPua/iunkTkLFQ8WswDsIPyUyeYRuMUD
         nk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473833; x=1790078633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUFG71AsT3ScptdxEEeprApDzMF1sR+8VaN2gUUPdDw=;
        b=0sOljHZOVlYCUsJM+xlyKEme0PihdDw3aDVk5WVcu38JtJcLV4RgQx14juZI2uCXOB
         jbh+dKBkRuhnAxl05m65BAv/hf51Ypl3DxOAzq5imiQiMLqLpPEHMAS1/VoKxOPGUl+M
         3TmbkzFmJ5ad8ooT9HcOM/waOT6Yy98M9CXX/dfAzzKJTL0qUiug86XSpEdqorRU9x9B
         x96vL+3kVCGX5wE5JcX2ZraimyRgEwovEGK0CytYJN4Pbj3vnet5en8loNgWdvPkn8I/
         RtqmlYPBQ6JOz1B2lrhxnJxGvjso1eVZO33TxxJBFaFjz/9I5w9OgN/sHVonPgYgYy1O
         Mgpg==
X-Forwarded-Encrypted: i=1; AKwUvBwEsbAX1OeEdcYDNjX8fOrLwNi+xc564B1axCpK7LmThn+8vwRh7HaXiDewQV+ZZ2tKpq8n5jiNh8rkPIE=@vger.kernel.org
X-Gm-Message-State: AFuF++mZagFSRf242xCUiJJRd4UB3QKwN+relTrzkmTcqjLBxQGdE2yi
	Wk6I2gjN4fPh1dQV6LY1S+XNYHlBU1ZB+UyPgdATfGXyglizr69j1hysuvOxkv2xJNNjEDL60sy
	XnkM8t7ZL4Feth169VnPTaQ+aNyg3gLz/BuhjG8pJ/SmQgb+3bRh50hKSvcODPQAHUEc=
X-Gm-Gg: AYBFou3ApAXvPqu0FztSCa/9en2CzmCeZDFRbo9iCKgq/9mTcFFAqu8quxB1e8sh+K9
	aySGg9o8aB4fJE9R/gOv71RRG8CkolIL0NMlUI4H9qKyjXPBs3pdKOGiPWwYYl9COu9xYk6DLw7
	X2F8ddT2qdruj4NI2ncZHRqjwJMeqoi2sVkcytsaV9tqhgESulKtnasgHO6Pd5rPmwrtoP/uBPc
	RkzhDz26qIeQDIfBGN8jAmBA20KA5mGF6hFATPNfMAcmeSbT8hdqD3AF7DY2lIuUQG7Dd/rGnIT
	kh+m+zW5DcyvMaxRTDuY+ngA5kqjlxn3ZtGMzmf1KVk3Go28WxLDUTGHu4gLv+Vb5KBXsCCEJs0
	lc0JAKlA=
X-Received: by 2002:a05:6122:1b82:b0:5bd:81fc:ebe9 with SMTP id 71dfb90a1353d-5c9818bcb92mr8388416e0c.0.1789473832667;
        Tue, 15 Sep 2026 05:03:52 -0700 (PDT)
X-Received: by 2002:a05:6122:1b82:b0:5bd:81fc:ebe9 with SMTP id 71dfb90a1353d-5c9818bcb92mr8388315e0c.0.1789473832163;
        Tue, 15 Sep 2026 05:03:52 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee5csm34247401f8f.20.2026.09.15.05.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:03:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:03:30 +0300
Subject: [PATCH v2 4/5] arm64: dts: qcom: eliza: Add CQS SoM UFS variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-dts-qcom-eliza-add-ufs-variant-v2-4-86d72a2a8f47@oss.qualcomm.com>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
In-Reply-To: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=11702;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=cF/tteW0eU8xOM/G7daXCnX6payuvN+Gkw1/l5R6EHk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqTQZOeNqx0LMOUsPhw/Orj1BFCsQXUWbXPiVy
 8oBJy32MKWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqk0GQAKCRAbX0TJAJUV
 Vvj7D/4uglDNi68WTJhk4gWjFDkImu2A2V/BTeSiIS/BX8h5HLtUn9Y+CKWfoA77tb29X2FPCkh
 K1jONSuVqTLgBmYN4CYZUsMTANS1zSw39HfTZNsW0s0tloEzFH5NdrT6lAqjolb4GxeABKUYQaw
 fkQNz0+dK2I7klQ0iUu64q9WmRQWnP4wKpOJYL1EqqVCNqywbkI6EywzoyBuJjkvuO/udYyStY5
 U15Ql4Ij39+X0td4m8NLk2LXIz3w5//sN8/9CUdaxP7COaIj7QGgtwuuWJ1OUlm/39tMAKRNyMw
 SO9LZdhMJLmIX/PjGopI8C1NpV1tJQ4Pth5KttFQ1IVHzMJEu7Za1VjutHoI4kk0rLdMJqDFjug
 shsq4YfadatwWjNPtZtE7VZHC9dxmrmMqFg0zr+gPnGgrAVwipU2Og1sRMGKKlDHdA1yDlU6qUb
 M00XMFIZqH02+7/UM/ET4SpueKV4d4CJhPigV0IMe4IN9/cl7hL6RfzoqJbiG+NnTCn8I2a9pgq
 aTYm3YYgVa7xY8D0RIiq6lb/D0ir7INcvNqJgbGjmU5PMiSPTMwvdyZBU0Ix0wA/ITebC68D1HN
 MWGmDwnNtFDoosSsWEbx9HrolBhOInOTuPG3nUTiiXmIyYTI/76W0nzpZ8n/ullSR/EKs6VfhSG
 a1qVP4EmTM2G7rg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: yoJStR2DRnSZ6TeiT1W9GmtIAvR6EUTL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfX4pOv2y7a4ETu
 cPpoM/JCM09hAjHthX7QYkQFlNNuzEqbjnlg4St0sraPOyv3dpoZuK1QzJOWJTAG+iu2G+xcO0v
 KsilxAWRogVaReXuyEHcIprnc4m+KEc=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa9342a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-rIHGyhvbnQuOfFkfywA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NCBTYWx0ZWRfXxoQ5DtgdZYtz
 exkb5XO5r3axzBd1hqaqxQaaimwSv5t2j+ovda24SYpnGly1vMfqZfsuRIYK2KdLpqxI6b63nYn
 7zYEzNBFxxDAL/I4Fd6c/9A2NtW1hGlqbYzTYoagoiSHqUbLpqnk9VyxJJG6t63vJ2CkC4PHLa9
 52W5OaFuzdEi/uYWA7cVAEsK/RkvuOBrRKXUOPQt+1XUlN8NpMGHx/APUUnjsgFvNYQ+KqaXBGq
 1WSD128l9jXYuvGVrhufRM1zCBFgurxcVugaLpGS0cF7zOyvKoz9S01m3lJ5MUUy+TjGJbb1oKq
 RtDhUs/bdFiIhrnAR8xjrlSQcwf+9hmuGvImF6g4mbBfCAnwNuxiXGCmmx9ucuagLIhwugYBRX3
 ZWq51QlSOvTgKqtVGBweMdG14XPs8OpF705G6Sb4bygB/KxKLCa0O8F5hO73ES/jr4pQavNC6PE
 o9YrBvptKZfSvIv1X4g==
X-Proofpoint-GUID: yoJStR2DRnSZ6TeiT1W9GmtIAvR6EUTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150174

Add a new dtsi for the Eliza CQS SoM UFS variant.
This SoM only comes with UFS installed.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi | 421 ++++++++++++++++++++++++
 1 file changed, 421 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi
new file mode 100644
index 000000000000..cf1cd97065b4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som-ufs.dtsi
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "eliza.dtsi"
+#include "pm7550ba-eliza.dtsi"
+#include "pm7550-eliza.dtsi"
+#include "pm8550vs-d-eliza.dtsi"
+#include "pm8550vs-g-eliza.dtsi"
+#include "pmr735d-eliza.dtsi"
+#include "pmk8550-eliza.dtsi"
+
+/ {
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7550-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s3b>;
+		vdd-l2-l3-supply = <&vreg_s3b>;
+		vdd-l4-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-supply = <&vreg_s1b>;
+		vdd-l8-supply = <&vreg_s1b>;
+		vdd-l9-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s1b>;
+		vdd-l12-l14-supply = <&vreg_bob>;
+		vdd-l13-l16-supply = <&vreg_bob>;
+		vdd-l15-l17-l18-l19-l20-l21-l22-l23-supply = <&vreg_bob>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		qcom,pmic-id = "b";
+
+		vreg_s1b: smps1 {
+			regulator-name = "vreg_s1b";
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2b: smps2 {
+			regulator-name = "vreg_s2b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s3b: smps3 {
+			regulator-name = "vreg_s3b";
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <2744000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4b: smps4 {
+			regulator-name = "vreg_s4b";
+			regulator-min-microvolt = <2156000>;
+			regulator-max-microvolt = <2400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b: ldo2 {
+			regulator-name = "vreg_l2b";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b: ldo3 {
+			regulator-name = "vreg_l3b";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b: ldo4 {
+			regulator-name = "vreg_l4b";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b: ldo6 {
+			regulator-name = "vreg_l6b";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b: ldo7 {
+			regulator-name = "vreg_l7b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b: ldo8 {
+			regulator-name = "vreg_l8b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b: ldo9 {
+			regulator-name = "vreg_l9b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b: ldo10 {
+			regulator-name = "vreg_l10b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b: ldo11 {
+			regulator-name = "vreg_l11b";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b: ldo12 {
+			regulator-name = "vreg_l12b";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b: ldo13 {
+			regulator-name = "vreg_l13b";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b: ldo14 {
+			regulator-name = "vreg_l14b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b: ldo15 {
+			regulator-name = "vreg_l15b";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b: ldo16 {
+			regulator-name = "vreg_l16b";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b: ldo17 {
+			regulator-name = "vreg_l17b";
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b: ldo18 {
+			regulator-name = "vreg_l18b";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19b: ldo19 {
+			regulator-name = "vreg_l19b";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20b: ldo20 {
+			regulator-name = "vreg_l20b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21b: ldo21 {
+			regulator-name = "vreg_l21b";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22b: ldo22 {
+			regulator-name = "vreg_l22b";
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l23b: ldo23 {
+			regulator-name = "vreg_l23b";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s1b>;
+
+		qcom,pmic-id = "d";
+
+		vreg_l1d: ldo1 {
+			regulator-name = "vreg_l1d";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+
+		vdd-l1-supply = <&vreg_s2b>;
+		vdd-l3-supply = <&vreg_s2b>;
+
+		qcom,pmic-id = "g";
+
+		vreg_l1g: ldo1 {
+			regulator-name = "vreg_l1g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3g: ldo3 {
+			regulator-name = "vreg_l3g";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmr735d-rpmh-regulators";
+
+		vdd-l1-l2-l5-supply = <&vreg_s3b>;
+		vdd-l3-l4-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s1b>;
+		vdd-l7-supply = <&vreg_s3b>;
+
+		qcom,pmic-id = "k";
+
+		vreg_l1k: ldo1 {
+			regulator-name = "vreg_l1k";
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2k: ldo2 {
+			regulator-name = "vreg_l2k";
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <969000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3k: ldo3 {
+			regulator-name = "vreg_l3k";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4k: ldo4 {
+			regulator-name = "vreg_l4k";
+			regulator-min-microvolt = <960000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5k: ldo5 {
+			regulator-name = "vreg_l5k";
+			regulator-min-microvolt = <866000>;
+			regulator-max-microvolt = <931000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6k: ldo6 {
+			regulator-name = "vreg_l6k";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7k: ldo7 {
+			regulator-name = "vreg_l7k";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/eliza/gen71700_zap.mbn";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/eliza/adsp.mbn",
+			"qcom/eliza/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
+			       <111 2>,  /* WCN UART1 */
+			       <118 1>;  /* NFC Secure I/O */
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l12b>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1d>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l6b>;
+	vdda-pll-supply = <&vreg_l4b>;
+
+	status = "okay";
+};

-- 
2.54.0

