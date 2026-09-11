Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981D249B5A3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144903; cv=none; b=FMksuu9hLvPgasH9JwvlOwtulyc8uCvlrDvLFuHljn6wqRCoy30dN2K+u8uYcR7MFYgKAsaYtZDb4rl9Cd5a1ZAuiVfgJYte4+abK39FwiohrsZ7QMDMdYovXIh5ojRswcItAeBlutNfd5ntK+xCJCnQE/eoaAP5PGihkorg4UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144903; c=relaxed/simple;
	bh=/DJHFjQX9E7YuVUkj+y3FsDcwplriep3EvTUWoqaWbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXbH9jNGPWMh3gE3SXSCisHHeUEYiM4i3KsObSlDR3P/fmPr6NLLTfuKuPRiAtFsNFIXM6bD4N+abNrAG3A2YCPc1qLN8TjdWq8aR+9Nr3AlIb1Djg6rIG7NZzkX+6vNOfx1iLBXKLDV2ClXFQX3rTMxCnC65u3XEGMLTp5A3xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmbOaPCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMvqcfYw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmbOaPCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMvqcfYw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BG46Yb3427067
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJ/wgRkqUotp3CoWz8XocYAAOlaQBPuzP2rQrqZWNXo=; b=fmbOaPCDgaFwwrEe
	YIVcBl4z+htG/ehybcU1ys2n0LKPdZ2pAYoFfhI06gxr1l9+6oREU8XWyVjF7Kx2
	ZPuFZ9y0m2M8UUulRCPyfi5tsV6m+gkkm9Wgt8jW96DbyNuRrOFDpLfxzh91JGL3
	ioEax672Mio9phN8WmVk4s9aEU8g+w3yMAdMwhHtLdvj6mLGvEiTY4iEc2UC/hWr
	s3Xf+wSYN+A+p/kQ/xzADkCyOwS/Y8PToCZUmxmibsx9RmveZr6A42KEJAPeNh1T
	S5zliebF7JThqTVljdqLatvtUyhnJCAJMuJdd4FXs1qqQwr1E86aDTZYXs818qex
	5QQnZw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmmubr4sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:41:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedb8673ceso849168a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789144894; x=1789749694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJ/wgRkqUotp3CoWz8XocYAAOlaQBPuzP2rQrqZWNXo=;
        b=FMvqcfYwa/xw6qTzsCTvMID0PsN0bGheyFOpREox/V0syoMU20+KiNslFHKcUPWYN8
         sdpvPVjMkfnjn+4n5RHa5/P6OsTnIHMEfPUWIjlBKPcIXT7o1CoqhHJ68+zuWNfkg9HK
         eKY6GHU1L42vkWBG9/6RIP+0eUK1+cGrtyYIuO0nrzeS2Skyi6ixmh0sKLSrBB7S1cnT
         xJqZPMc+kRnLH/NE9UYrgt+153tTqPsr08UTzI9uz8OE7pWjopccjAA0jfHF34O5gN0a
         YlICCaL4ZgMsbgBSbJ16vDXIIWf8mrolc1jhpo/wj/aRaIkuoerecCIrPmezhULZaiDw
         rrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789144894; x=1789749694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJ/wgRkqUotp3CoWz8XocYAAOlaQBPuzP2rQrqZWNXo=;
        b=d4cGgLFXIvxqkwlwYbpzcfqrWKJNQlmPZcmRfeC6GwCoR93vjrFC0PQqFUocwCFjL4
         oYpBH9xuWK31vVSWSR81wZIfOKCY+RfDVOZ+j7q+vs/xD2x861wqtj1KWGQXADPCGptT
         yJDl4E2BfR4ptkWh79PypkL4pxAvrfm11R6j9fcN50Q9/ou/xvym9CdNydGqfLe1Hn7N
         6sN+PilvUx2lvoaTte62uMeEcUlTGKcxwDfqgJ8uf15bPbT+qs0ihPk/Y+bCW4dYUzI2
         mRvznyeQL1Z3+oPl7ZoqvU7GACHmsX4Xdj5/UcEbgQNSB/jG5rT8vBEtfHU9y4G3Z9g5
         AdiA==
X-Forwarded-Encrypted: i=1; AKwUvBzWqiOY+dhxfcrjUK3JAnwAk+A9w5pLDbB9hwoK9akdd8Td1RLwwvIGVZ3d1GOUK+iEjF1cnDWfIQpqrfU=@vger.kernel.org
X-Gm-Message-State: AFuF++naSWW1Du3zmzEU58lMhAOEj0I9zxX4lJ1/3AFNQ6lOhttawBXX
	7J4zq9mGFu5MmdRRiDXAvvq7Dnc+DWzmooeiyMJwBtpK0q88MAmFQoFqlRTO25Hearn0nuhi+ua
	Wpzr81PYClFIdw71V8iLDwCpapZve4WkiY1Mp0lPhQ2ymSDVk1dTQ1YXXBR+bzVr1ciA=
X-Gm-Gg: AYBFou19642hKwcedVzA2nXQwpr3j4Zn0TcvJKPmGOFbQ9PRkreT4Jtr/YwpSZ3fEvv
	GUl0yBxYLf+lHpy7UN/kl7nNhLJpsPXTezNGVbeWokmvL1tQ/XIjU0FR8l/V6V+/JKFtitO216T
	wmW9pTy+s8KiKrmRzQcZ7lCFCGxxyQTtqw5B6tewpiZ3f9WEGoFHxvS6Orn83CyPYG5fSKX08dO
	xQmACFDkVPDKfuMeVCVFG8lJPp7ftalFAxMApXvfg22Un6M74F9uiO4UT4j0wSvTk8wq2JfyfXe
	8n/W1KsZVtvEan31Z4qcfQ7/8sjnz6Gf26ozkFxWQD0f3rlD1AYejzb6DrETBwh00MsEWgEZ7LN
	I3wdFhRYqbv7grSaPMIs=
X-Received: by 2002:a17:90b:4a8b:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39d9bbc81cfmr7901205a91.2.1789144893989;
        Fri, 11 Sep 2026 09:41:33 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8b:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39d9bbc81cfmr7901144a91.2.1789144893468;
        Fri, 11 Sep 2026 09:41:33 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b2a8076sm1618171a91.1.2026.09.11.09.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:41:33 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:10:40 +0530
Subject: [PATCH v6 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-shikra_adc_support-v6-2-e4b2da5cd55c@oss.qualcomm.com>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789144881; l=1771;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=/DJHFjQX9E7YuVUkj+y3FsDcwplriep3EvTUWoqaWbs=;
 b=Qrxs91487o94JmLMMAyVYFbyGF4owhAvveBFVpmP8QjSXqbnrDvacg/vt23YbE+sNV2DLcB1c
 q5fvGQkY8wrAcycBo3v7VaAuBrpM8gLnxAsE36fasFKCPRPn8niJF/E
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: RmdXHZZSzSQlTWm8fZbtJg8BsH6DIk8l
X-Proofpoint-ORIG-GUID: RmdXHZZSzSQlTWm8fZbtJg8BsH6DIk8l
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6aa42f3e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1cSftZPrRki1B16PJQgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfX/yE/jtCn4mrt
 9jvWSZlEY2YzwIWxr4NoPRuVtYEg7KMTRPR79kai54+JIzRw3wJSBGslaWUECiQaN8ARv9NK6lf
 8Yi7jVjePjXfoTxuobU3fTM+ejCgi6JVOesvK2gxtRHyutKYUAinccfzbz9z31/hZCXnrs21Kf5
 fogaIvlW/WIN9FO689tnVBl8nIjCN6cI9BRCtFW9hWIi5Re47cBqQSVvcrlDL1irUs0PqDonPk2
 f1kEFNSMTZeAT/tidIqtc5grYakiKwyil4iIRycJuCS/sW1H8mkHQG7ayW/KfKXh5oWTpt7bb81
 q/K23MyHfG77jaPfVLaIu6kuOT/Mu8KsyB6ouCrbwCEz6TMk6m9hYWCU60edlExzIcP+UV7UPnV
 h1fxgLAPHN2N9Uzzk8aH0J0SigWwMbWKurqNOXEdwJd8aGPlaaqqv4PS50+aPtNP9pG3Ve5Hqq2
 WimWuMAkck8vZJXw7oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzMyBTYWx0ZWRfXyjlhuUMrHMQ2
 yXoBVJeHGoOw0yWDB/u6EFiVFx5Rofy1LxyWdJAflvICm9Ov6Lx48DM+YGCgLnEJwsgo3amuihT
 sMmVHfRWTK9CE+UFNbUg5I69OnZgUGQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110233

Add temperature alarm node along with thermal zone used
for PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8005.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
index 0f0ab2da8305..ce31a8545020 100644
--- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
@@ -4,6 +4,34 @@
 #include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
+/ {
+	thermal-zones {
+		pm8005-thermal {
+			thermal-sensors = <&pm8005_tz>;
+
+			trips {
+				pm8005_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm8005_trip2: trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pm8005_lsid0: pmic@4 {
 		compatible = "qcom,pm8005", "qcom,spmi-pmic";
@@ -11,6 +39,13 @@ pm8005_lsid0: pmic@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8005_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x4 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pm8005_gpios: gpio@c000 {
 			compatible = "qcom,pm8005-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;

-- 
2.43.0

