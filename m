Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CF145FFD3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775701; cv=none; b=TW2BwwW5Zx0uUk7WfP6oE4r5bwk9FllCJow9zbXzv8I8Vp/YHeVgXVixusMl79bHrOo3UL/f8UVHFY0M1F8dxIlUXm3vky8vBcPE2DysieuVMwZYE52p2wpa6ZWpaWv9sZUOUkvTZItLt7pES56FJcFXmSCacxItyu4gMC6Ohlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775701; c=relaxed/simple;
	bh=s1k+cVzV/j5wJ5Wmv4Oqij6z6aC6GduAUS9wamxgIFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nzbTtnwl0HKpcZjJhqdOv2cWAoDCDvI8tsj/210vsPM/3GvuknGMggzXziH0qiAjZuN8m1RfkG6Iy0hU17d/Pjh6Bf6Dn+fn9Ct93oOzvMtwtiDNW/Cnb1Ud/Z8nnB0kI/1GuDiOMz8xuS5jnsZx50EQgIQZ9rWFIXB+5s1yCyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxssk8rp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VeIsPoEQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxssk8rp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VeIsPoEQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879fuoq2502823
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9G8+F9aumExicZweaO3bpCAJNMdgB4eqTE+04M6kHoI=; b=mxssk8rpUCgMX0TQ
	XrwcUAwJJ+JNo1gHySj4JphyZAUO+ZjZTjyUlwpm0cg59bLCCHQs5uS1VI5RbJOR
	LUbO6zMSgSGuDp9SNUPLJtjhYom3nrrLYJh/rjgMLP9CT1nJNbZ2Hgd1My0B/5hB
	/x9FQSJMI5V9iTdjp7J51HpR7GOE4uKx0vDEwgMkjOJUulKMNHnuc14EPvdfeRP8
	VbgMuoGab5vH0lN8j6F4S8XB9bOUPxMw0D3nwGLSekhQa5p4GW/lDw9bvmD5Vayo
	yibHIz5mn3S6QJgpx+ddiYP2ZpCQVoVaqtsgNznZtI+Pf7MTl9LWM3Dyj4OyrIrM
	YRnqTg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty04ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:08:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso1871862a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775699; x=1789380499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9G8+F9aumExicZweaO3bpCAJNMdgB4eqTE+04M6kHoI=;
        b=VeIsPoEQjNkHDOWb1YGLUukhQvWCb6UARpeEbNjFy+Q78NQU821uHsw2TnkqtVVtZA
         62HNLhhhGZo55ykT09NkS9ysGdJ4J2iX9XCDxcGqvO0xyP92pDMqlYppdDN6H3XWT7q/
         EC/mZTwaqHnkR/K45rHS7JO3Y2RtE/r7PwglwECI8WEWM5KbSoYTRfXVbwI4c//+zdPl
         G8NN0HcUZT+7tVYEluE0ofwI9fQxJWGlCSC93NNrOnT77RCEXcQIgn60/rPWJs6ptOIq
         VGDUx/wG+qMf+fiDxqknx5C0MCifHKJdsDSckM+GrMsGw1vsf8SKY70DcynZqfMHFSsO
         uQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775699; x=1789380499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9G8+F9aumExicZweaO3bpCAJNMdgB4eqTE+04M6kHoI=;
        b=VWop3YECRZuvKPSGdc+xTPvYwirQ1WBdLrboG2T/ezS9BFRt41C5d6b80oqjX94qz1
         4BvLdXPwCuAVbnG5cMXyLuWUfbe+b8ZeaTF7MWTWLO20ervt5JccG/G3h0dovIP4gtgR
         5Fb05t++B7HZJYEZPXRuz9JkAXexrRs8lFK24wrAbBf0roKT59QB1Tx25p1zU5qReaXl
         Ec2MHgiznldB0zCzzzheOIXdSi+a1pMYYXyDv4SvKetiBYGqy1yTWEAPam30HSiykaC/
         D85MTFyK29qJaZaorctGl8U8bZJHT9AxbMYd+q2w/OSB6R1VsnWxOt0uAPJoc/mgs2qM
         ThkQ==
X-Forwarded-Encrypted: i=1; AKwUvByeLoetQM1o6fpxRtjdp6swY6c+zdWE9+FrGm22oOoXklQStPk76RKKXME4ievay7AnfcP2ny7jucNEUNE=@vger.kernel.org
X-Gm-Message-State: AFuF++mPaMEKInLLGqpIDMKb7fHkKU+qrUYm3mGep2WFv2TGLhOlDuU7
	YPD+CDYtQuwop1yfZsgG3w04ul0tZT7uU7zDhNefvzFKsIg2aIhh4gYJB4YR/gtLNY3UKpxMO/v
	OrLBe8HDzaMjj+6/fuX6WQ/nqPsrdIzd0AZiAFiuTdfVAPANL0C9xyWHusH3WIwn9zKo=
X-Gm-Gg: AYBFou2cNjTbOcKzEqrEid0n8qlmSqC0hUxYDMYsc4rqfX3HhpYKVelMEzS7FG9RQpp
	KyYb4yb+fq/+5DG9o9PPnHGA2Yt2yGYp7TGrXrDj2x0vjQsWe1lf3jI5j9d/HfzlrcSF7MWDdKh
	VSL3x5WtyAOOxCyOniZr8R6FxIypz1tDOBVqxOp2VAZoXoGknaImR6topqTGuwm5hXPf+3WZ6FO
	dNnG9KOC+AdDk7UcVCUwwX6i3pHnv5SOc7Tn267GxOGBDque4KfITQShV8BDQVYdOhGNAvnp1jz
	++m5bERQweKU50zIckcpYGGT3I9HvnZQBq/nylCKAZGw0QTt14h8nAoUFIeurMM8uQo4SmIX8wo
	0P5Ld8cMgcrXAVLiS3ceywmJUkuoj7qk=
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr32826941a91.1.1788775698798;
        Mon, 07 Sep 2026 03:08:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr32826881a91.1.1788775698277;
        Mon, 07 Sep 2026 03:08:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:17 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:48 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: glymur-crd: Add ov08x40 RGB sensor
 on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-5-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=2342;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=s1k+cVzV/j5wJ5Wmv4Oqij6z6aC6GduAUS9wamxgIFc=;
 b=fLYaMBI5F8WLbKPlcwg0ELZOzXImpcc6S3hdsB4QofUNRF1ZjdlBZzFzF/Jq/WKlaSL+HBrUf
 gedWTwHWkezCHGr/VdZcbm/eyPrXjajXT4y7h8M8aN8UKQAYUEbJ0Yq
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9e8d13 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2OLIcDlHICjy9cVqpt0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: rtL4sMUqq-eJardhNefS6T9khRazMJES
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX7X4qfCApVRax
 EWxO2IrBvAkvlhm5NObNkURGIJblPGwYDvqKjVSxRJBefWPW8Xg+KK5ckZVhN1gFm0V7c+Zxb3I
 iWhhiKRk7wE1ZHEl64ehZgDj9NN1QJ0=
X-Proofpoint-GUID: rtL4sMUqq-eJardhNefS6T9khRazMJES
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfXzSzWoggSHWIw
 6L9Div1Q6mK4Tym0X9Y1T3mDaim1jGu0CNCvBqe1ELJJvwuwFxK+saEncYvCupDwFDlZkz4tro2
 7t5bg1JVuJaztN4HdZJB18VDA3G3DBwsg45yrz2fKAjXFb0lDOYyot0MEH8Dv17PaiLsUx6KWRE
 uA9ur4MHyOK4kkUrImvIW8WAa9u6XnRkY83KbCpRuBhFRn+ucD4DdN3SRim8NoDtSSVQ6FmO4Dc
 Qd15+P9pQBCiF2waRHHsjZK2ueKLgzAltUHmu7GejWS2fuIc9XxKJTPgaH/hEvWzjWpDdz2vvHg
 f7GF3dX0xlCoDh4kYf9y52p/qv+viI6mqQLyhH1Au6FWGp02tvvMX8+/cY/NIBvYu0bJKsozka2
 ji4u31FvqaQ9i1GHs0W+chs6BvRGDFlAokr5gJjU9EZo9f1XCB29c73gbSM++WvrcHuthTw4hcX
 iuyXEMCy4re+TVGyUag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

Define ov08x40 on cci1_i2c1. The RGB sensor is connected to
CSIPHY4 in four-lane mode.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 68a191890b7d875564080d9fccf85ae9451cf0d0..af65d739676743742c36ed07fc554cf34f34a36e 100644
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
 
@@ -1200,6 +1257,13 @@ wwan_reg_en: wwan-reg-en-state {
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

