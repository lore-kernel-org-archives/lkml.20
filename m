Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6992C50B409
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061596; cv=none; b=t1v89ouofGBLqTH22zKp5kYA/9c6Jq0pqm6qaojP7N1f5wi6FWNd0W7Y4+kyfyhMG7xeKeG+/DE9j0jpr/LStXBiHrT3xqrPTEyZ/oYMp02nPWkjdr1jfLpKAujhVVbtpB05SChQyNat3ASf0BZjC5ri+gzoanRUJ9qNy6GxiLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061596; c=relaxed/simple;
	bh=000V5lMcD4Ndlo5z1oUB/zkm7N7Em3azSQ8nBd2ym0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jM//JREsmF+E7s67xpUK3uoWwvHqxO0JD+usYSV3nGMIgWKo+5fL36czgudUxlJbMgRwvCyMy07prHh3Najm8mBisi4ZxDX63SmLX9Z8hcuG0ORLsBB8WwcX0J3FdbozpfMMlt+GKVgyXuord7Eg0SG/Nb45h1xHOJo4y7WI0A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFBy6Y8H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/aLJ6Ko; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFBy6Y8H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/aLJ6Ko"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPebW4100219
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6QCJtIsktETKR1cxOBlz9o6O9JtKG14ErgJFsTgAtw=; b=pFBy6Y8Hy7dvS6FH
	16809D1ZxbDqNRTUsJCOVKHh/2mB/gGFi2n9cJqrbWVvzZGZuujfJIPX63FQVUed
	ys7PO3M0oTAQMroy/6RPuGEfDoa2tSFBKeTDKiPJZJWFcXSXYN6+P0tzi00Tvs1d
	S3rRGLUJ2SdojG/ovYoVCDJ2jWliF8E0NS0Q2gbhrJV2W6vVmGWmfILdUGPxJ5JK
	3vYKcqoax/b9TqReDhPQr8GjSbWv9gqZe8Yb8b3XlNJN/e/sxZdBJpFgfT3Du4Ug
	Y6pxSZQG38ypWUdQG8QUAiT0ddwcuaNYK+pnUTRuaa/xQwviEYySSg/WT0XBISMy
	/6etag==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r834x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:53:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so2457203a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061585; x=1792666385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6QCJtIsktETKR1cxOBlz9o6O9JtKG14ErgJFsTgAtw=;
        b=a/aLJ6KooQKsEpGdBWgOVkB7km+RKEoiFQ/yCNds5MPuHdnmQqjLqdSkEXf6jKjJ3l
         wOrMx+zRJeciEPoDmXdGcRExC2KuzKv3k2iw3UYTSWv3xNEtdvv1Z9lRtHDT5FsONdLB
         P1uIaeaRSdZNX5Ro78zZQAdAnUGBiqw4iHvSwLgYW7kMBOJvNgB6YLbA8dmYt736hGHA
         jJ+eoInJNO0DLGvXxa52rJJJHTuHKt8u9STbVWo4fdi14CrIgwC8jFiEwzMSEWxqygMo
         tMHlsRGXP1jmXKKWcEYa3u0DGgldoOVZU+cVN0e3WPifyAo8uTYE5zEKCTORgZ3cRy+6
         Tzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061585; x=1792666385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6QCJtIsktETKR1cxOBlz9o6O9JtKG14ErgJFsTgAtw=;
        b=HpRYVG1FyC+bedfhFo7YmpQfXsQbjVAVnvvoUkw5Aa14AuqZCho49Z2gz/fRFJJ9gV
         0vUtiYill8hAweVM7WdRLyDo64muMXqGXIybvQgSr2I5/XypsFycVJyhXVnU9YnjELS5
         eZu5nVBGIDMMu+7TZkHiDs7nqQLUgT2AJ669/ZtZzilX/RQy0+C4Xb9dyAiHaOp5NhUA
         4i0DA/wIkyTEmLJowBCIb+GjEs5vPxFXj88GRGX/Ca3hHZwVzx02JdlLoA93pUtXjTWE
         QTthg76llxY4lBpaqRAhg88wttlVbhlf+hXUWJzVzwLTqpg7lklg8tpThAeOs4H13Fnn
         FztA==
X-Forwarded-Encrypted: i=1; AKwUvBzSRyoRoh3MLBrtRpHlkVZgVXo17DY/m46QXMxAonaRRDu4AHE45Nws4S9LTgmnIaOSDWDvP+Lb69KxyF4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9ig7XNRgwQbJWNcuU4V/zjbdQjZIT2PYR0I8xafQliyXDWoBi
	IWJBObURn3X2aqWXRJrTv1x82HgWtu8PIbiV1u3cFQJu2H4rm/qYHUt4JjDSCbH5T1qZBPlXwce
	OLzDRLtIRI3SLsWT3RnJttr2cXFG+VmkNJjCr6RwF1fPf++e0/KhDkZnOaQaJ1aW3ZtI=
X-Gm-Gg: AYBFou1WLd3KzyGqpc+mExar0QZoPBVlFRALrtNPYdQjTw/k5Gj43rayFu2ckDdngS7
	+5qEWRbXhmYvPprkUIMcu9Mt+iMRuCzRxljXGp/Kf0FbXGeRQRAK8BDICyzFs1xwpUMHEDQcxA0
	MgxHkz7Pe6ErfNDtd/GuYPkbmE8QX+/cUL2niS+IQZBlVTgco7UvkQHY4rpToQSsNmfkpt7uk9c
	z9OUKmG9QAt4pC/aH+9BBqP84wxCyGXX3qAQpA201JbF3lgjVxXK7FJDM5R0zgGxcm3eOe1K9ts
	4LZGfjUmAAyybqWWa6QeemR18xJEl98rk6bxIVHUzTqJXqc4Aj75558smNIjATaork5+TPZA+l1
	0Blf3vhwssHF0oDSxug8wiVBwBc9dog==
X-Received: by 2002:a17:902:ecd1:b0:2e5:a355:56d8 with SMTP id d9443c01a7336-2e842e1555dmr163912265ad.42.1792061584950;
        Thu, 15 Oct 2026 03:53:04 -0700 (PDT)
X-Received: by 2002:a17:902:ecd1:b0:2e5:a355:56d8 with SMTP id d9443c01a7336-2e842e1555dmr163912065ad.42.1792061584436;
        Thu, 15 Oct 2026 03:53:04 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:53:04 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:30 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: glymur-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-5-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061551; l=2395;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=000V5lMcD4Ndlo5z1oUB/zkm7N7Em3azSQ8nBd2ym0I=;
 b=N8CxhnDkAvv82a8xekWzV8p66UkOiwjtobj92EnWroX+dXeoJuGXimg/8/kQpGcFk5GCfJ1vT
 cwfNdUcCaeTA9EUkFJEOJMvJMyyCnlkrM8yLY077kJSVuWCDbFxKxo4
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX0q7w5JT4qTI3
 STgmFN7HDccIjPpwPqykQtIQ9sNrANQc1vuz4Dq9iEzv7wP8cP7rrvKcLbp1apFXe6EhSN2aYUk
 zAbM3LBwUvfllTOSmLWkWuTbKdHJ64E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXwCLIrmcteGx2
 nHEIG7+7U+DJi/5wi4u4CoCZ6UBgdOu/PNZclDhvfl7BvrDwlCgzWYUcrKzRnauy6PGX7bu4B8c
 0MiD9wDGd4pbapp3YFuI+vAWIP5hw5MybWWlCKKdbCdnATFhsr2zhp6+uxFSkY7o/W7rGlPWrP0
 YKKmQVYdRaQ7dXYKAnWx3Yezs4RvTtPiNIsE7hAWej0xfgZOz8yEE5RRpH0jui/QKqJx9fT5gLK
 xZbdvC8DuRyP8wN9bCl6D9iasd9pADduJqkt8H+HRM5waOxBFthmhJIy54jgmuZ1aTvfEUmi4/D
 QmhtlrYILhEph7TriOtbSS9brcyYAcdyninQdWbPzEDC3rXFNCoMj87pG/A019OOOp0PDifvoEo
 nCwqPA1obbyYtV0+/Z+BJHAdN500nszrQQ63hSc3ffFEGTo/OtFRMhehs7bqRxYT2SeHWFL5j2H
 grLXe2m0XC+Pd1wDiew==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0b091 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2OLIcDlHICjy9cVqpt0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: eqiU72Gl6TypGbec1CWhQnEjqItV8R59
X-Proofpoint-ORIG-GUID: eqiU72Gl6TypGbec1CWhQnEjqItV8R59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

Define ov08x40 on cci1_i2c1. The RGB sensor is connected to
CSIPHY4 in four-lane mode.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index ebc8da58a79ed6a77916c70c7fd93ab06e185644..1e3ed597c1294272a53c4a6ecd67da0aa6dba528 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -11,6 +11,7 @@
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
 #include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
@@ -589,6 +590,62 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy4_inep {
+	data-lanes = <1 2 3 4>;
+};
+
+&cci1 {
+	pinctrl-0 = <&cci1_1_default>;
+	pinctrl-1 = <&cci1_1_sleep>;
+
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov08x40";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 239 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk4_default &cam_reset4_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		avdd-supply = <&vreg_l7p>;
+		dovdd-supply = <&vreg_l4p>;
+		dvdd-supply = <&vreg_l4p>;
+
+		port {
+			ov08x40_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&csiphy4_in_ep {
+	bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+	clock-lanes = <0>;
+	data-lanes = <1 2 3 4>;
+	remote-endpoint = <&ov08x40_out_ep>;
+};
+
 &i2c9 {
 	clock-frequency = <400000>;
 
@@ -1229,6 +1286,13 @@ wwan_reg_en: wwan-reg-en-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	cam_reset4_default: cam-reset4-default-state {
+		pins = "gpio239";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &uart14 {

-- 
2.34.1

