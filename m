Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828914;
	b=hoBzEdOQDKMIyCPhMu0pAnz+2aaRZpZbsQmxrwXRENqrhnFkmABsfPdYE/UID9kW+mFl
	 ZzWz3PW8SXrIqS/t8zi4E9KOlgxBZYbePmqDgK9XBDo01Bh3/kfTSHVw6P8BusmZbnus6
	 TwR6NZYxcl7OU+HFT8/AQq9MACLvBjYaoxujj5JEkM6pq2fgQLM4QFbjVfP/uUkzCJJ/6
	 s+dQlispXRcRFdI6W9m8DeZsM9DE+RLIfNFjwn3bwSbHXGhZNhr5zMiBjgg33Oso11NzK
	 zqAsSXLh65NuYGpEYCslpiqfUc934vT5KjIYgR4u/djCxXtIucEmstcPeuraVqXRkLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0thsqEQypwpZodKDEOlWAqW0XOK2Cxlrn9ugpmJDNRE=;
	b=cXzXW1HPqIran4nwHkILl15XVZzPc8MGaIkeeFpILe5TnDpVxbVlSRsBVpfIhvuG+5lw
	 fHwHyjhDPTmJgucCFbZcyA9bqdu29Ikd/kNt5gbLzRelLLaKvA9ZKCBEo3XL5t6RLDKnj
	 NNGNJYAhn2lhoJ5NmzpppiOx7L/qOlNgUGB8WCmqdGWQJIoN5NoM3WM9bpABZZJzHTgiK
	 I+TeIQ59XBYkuXa24nJqATFHWJUwOm0b/lucgLk4hcy0IRATLs0R/pAYVmPwBY76s7Pvq
	 CJfRm+oQCgjxE57JYrEi3Xfg+9RQvxxp4GBnYkuE2SMrzZOpc05lqvII9Jc8hUlKXlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RLoLN7+C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iw9mUbq0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EE9606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3EE9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RLoLN7+C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iw9mUbq0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLKOJ1397340
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0thsqEQypwpZodKDEOlWAqW0XOK2Cxlrn9ugpmJDNRE=; b=RLoLN7+CSSjkTb41
	0nhiV2uP3XWJk/IO8dNGDi4BmyHc8MpMtOMusspKeSY6o6ylIR8aII95t6axLaL6
	MGpnul0nv3A5oSSq77N2aA028kw1BOfW2zyELZrzmnyiU5blXhQJEy+b3Vu6sJEF
	lwR3Wv3mEi/WS56VoacbpqGAymUfTnYM8x5JJS7cRemHFQ8ITBjOTD/fi0gzPz6G
	nT87zg7uDygjiYAU5S8IxD1ZMH0ysTdGWWO132HDRNPjXdLYNK7LEvPF2H0PsxH5
	qMgurVTWIr1s1dLw4Itgrk30aH+dYRPN905dz16uYXogao+28W6qXgokXeO5JZti
	rpP6ug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqga38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:35:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaae8d29e0so43057195ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794828912; x=1795433712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0thsqEQypwpZodKDEOlWAqW0XOK2Cxlrn9ugpmJDNRE=;
        b=Iw9mUbq0zyYx/uBFeGRUpRU4EWvGgX6DKdhJ8ROfy4u2eV1qe4w1oEEffI/OunrjaU
         5/NTXgZPotaaqTbEme7OaXUjy6k50egtoXSKfnjZroPXv5kVnu84qssRa6UqNeLLKvfu
         omDCHeWr8HEV3FPtlxXHADfr2+ykUAGNFrRoA+kRcFF0D9qCfTriJzqcYDCRpLkYwDfk
         IAA8xJTW6w4eTZbfjRdRpM7hyZV4ITDd8eK4j1AdtRnFjuRrNMK7GrCFf3Zepcgi9p2q
         TfDUT80Yp4bPTsNvwYI918pICONMTWrx6ZLFL2x2H1+GXw5e6bpcYpRTk69kMg89JZtb
         by7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828912; x=1795433712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0thsqEQypwpZodKDEOlWAqW0XOK2Cxlrn9ugpmJDNRE=;
        b=iYqVP+7xLEhG71N3FnZWJktALpZdeJty4IbN8YA0YBKgpg987e1sVrhqABQSA4Xp89
         /ScHi23ruhX0LMNT+/GA9y5hgAS/SIAQSc1/X6MGVGHCVJyu7qoQKheu/TSy82cA7xEg
         X2rPtVeON0N9JmdtyLpF2BQMWUrySz9WKFYInR1s5dwVFWfgrdfidaIqz5U7V/2DAq/u
         N6Ukjcj8H1ZqWvoYsMHvjyDJNOUDCLyYlAKopL7Q2ZMM3Z+bz2x/FT4pYmN7zLIQnMVX
         NYvBjE1y7xGOz8yCvsn+92A+yIj9SG4kSeoyShF1Jyuvdy6RRkg3i0T6I14pQxIybpsT
         kp8w==
X-Forwarded-Encrypted: i=1; AL+hErEMB3yucHlLUpVq3O0439L/5kjd/Lx5P4BW39/u+1ZNSK1isKAYdUuUOp3NyqA+3Q/47nIvaJYACLCBq5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9H/4wTh2AyjhCjBUZCAbEKopoghMZfERYiwGhonKM02+UeVqp0
	6T9569TyUbC5XvoVzdBbZYLeAyFFtKboXnGzRGCRZ97ppe+N93v65I9mBihz8pfn5dfoanBATlH
	vpvHUG5xQ7aKAgZBQI4OWJ/lX6rs2XFqWQXujWq1IrheaB0ARV4Quq1dGoCes6PQvVxc=
X-Gm-Gg: AZFdTZfY4PXzkcll8FdEcbztCOgjsVFHwGZFqYxOKQkQaOwXX4yUDHVWYboe5aImVGQ
	aT/uw8oM9QBpG3clmZ05k0mohOnSUBB1Ib+SIiHAoLwmEXFglBFQ59j/kgCQddjGOPjQAP6Cew5
	EHgoWNGdv1QZyV+Z9ImTav9CRdFmmZULsErDJr0Tp48ZJbDgzlEbhoPCZj48gEhn/BsF90NjMTN
	mkM1CU1WoYamDeVkyNEt+VflxqkGqVD1zVHt4ifLahoXEkCpoqLkMkG/3VEIr3aj3fxAlnzRgJL
	oG4I01VSfbMte3gSGfrfneEUkPpRZubpAkvkAyQgYk4EstGDjM5fXSODRWpROlAihKAvnfhcQzC
	bt6qDgbHk57myg3NxcwZuvr7KEPEJFhiLpldH4p91tngEowb6kCFn8Gxxp42vFgMojlrCuMn0M+
	la
X-Received: by 2002:a17:90b:55cf:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b1b0a46728mr8948205a91.40.1794828911946;
        Mon, 16 Nov 2026 03:35:11 -0800 (PST)
X-Received: by 2002:a17:90b:55cf:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b1b0a46728mr8948162a91.40.1794828911429;
        Mon, 16 Nov 2026 03:35:11 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm21000719a91.13.2026.11.16.03.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:35:11 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:04:07 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: glymur-crd: Enable HDMI output
 via PS195
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
Message-Id: <20261116-mahua-hdmi-v2-4-0b5af6bf9e70@oss.qualcomm.com>
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
In-Reply-To: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794828874; l=5443;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=RcljMfYUbyalzdgq7MXeMZXwNq3xR/p30j1AzKNOXPc=;
 b=L4NiMBIz036/oqx54VL20OBls7Kj56F/K1Z1F5PhlaTNkQkWy4HMQKNTwTYE1kjzegmU4/zOG
 jBYPkaL1DKCDcTbHyWxKgUfISrJmFvXyb/WK2/pqW/J6LYT3gQhV0sG
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afaea70 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4OHBDxuNJHQT2aTpCosA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: L_vR8eAM2sNqgDjDjj2gX03FtAGgCT-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX02xmRCzSi91P
 3MgoxvIPgVohvW9r8G1ePe8zQWHbHuFdJbujWSb+R4C1ZWVgXw/wVS9S5c8rd6P1ZAByj7pfygM
 VNhtBeEaElB/hDKpcm9kFTK/6Fb3ke4ilLxZ7DF+ymbaBZpl4n4Vj7xCXkp+kZufOwmw8Fb+uId
 MeZPbe4OCWDX25lv/ZZdwEO8hs3yy8EgAwIgIHDlkIn5caW1dN7R9oUGaNezV6k7iaz9Oif1gNN
 gyoVNuExZ+001suVBPYMuGBJm9xqUK/JGVCVKvHKI/zoJ0GkLLPB8J5sJmpdC9so3syaU+c6TQt
 B39wR89PEvLMekmmZ1998sDKYh6h9FwctK1DaD7VkjTV2KfNfGzjlsmmSzjYod3MuzDhh7K6Jfw
 Jel0T98xzJLusnlJJA4fn1wiOS1hFKrfAR0qa6t/k95Ca7Hk/951ZgimdjdpDdBzn/XsFFNLqvr
 8EW3bu3kXZWDWPjp1AQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX0dnJReTrleek
 phS+j5xKCd+sbjQchMMFYoxN9SlrGwBso7PToeVpdWkNOIqGDUM4RadiwLGDg+KAIrU+lIVgkKZ
 XBr2CaIIs86uwecgTS89k0j6hN0OBZA=
X-Proofpoint-GUID: L_vR8eAM2sNqgDjDjj2gX03FtAGgCT-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160045

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Enable HDMI output on Glymur CoB/SiP, Mahua and Kalambo CRDs through
their shared glymur-crd.dtsi.

Describe the PS195 on i2c13 (qup1_se5, GPIO52=SDA GPIO53=SCL). The
PS195 GPIO11 is pulled high on this board, selecting I2C slave address
0x48. Add the three HDMI power supplies with their regulator-enable
GPIOs and pinctrl states.

Connect the four-lane DP2 path through the USB2 QMP combo PHY to the
PS195 DisplayPort input, and wire the PS195 HDMI output to the HDMI
connector. Add the GPIO126 HPD pinctrl state to glymur.dtsi.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 147 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     |   6 ++
 2 files changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2ec62423ad79..d875ed69460e 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -63,6 +63,17 @@ switch-lid {
 		};
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,glymur-pmic-glink",
 			     "qcom,pmic-glink";
@@ -142,6 +153,53 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-boot-on;
 	};
 
+	vreg_hdmi_0p95: regulator-hdmi-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_HDMI_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		gpio = <&tlmm 55 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <1000>;
+
+		pinctrl-0 = <&hdmi_0p95_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_hdmi_1p2: regulator-hdmi-1p2 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_HDMI_1P2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		vin-supply = <&vreg_l18b0>;
+
+		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <2000>;
+
+		pinctrl-0 = <&hdmi_1p2_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_hdmi_3p3: regulator-hdmi-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_HDMI_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 170 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <2000>;
+
+		pinctrl-0 = <&hdmi_3p3_reg_en>;
+		pinctrl-names = "default";
+	};
+
 	vreg_misc_3p3: regulator-misc-3p3 {
 		compatible = "regulator-fixed";
 
@@ -519,6 +577,40 @@ touchscreen@38 {
 	};
 };
 
+&i2c13 {
+	status = "okay";
+
+	hdmi-bridge@48 {
+		compatible = "parade,ps195";
+		reg = <0x48>;
+
+		vdd09-supply = <&vreg_hdmi_0p95>;
+		vdd12-supply = <&vreg_hdmi_1p2>;
+		vdd33-supply = <&vreg_hdmi_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&usb_2_qmpphy_out_dp>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
@@ -545,6 +637,17 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&mdss_dp2 {
+	pinctrl-0 = <&usb2_dp_hot_plug_detect>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp2_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 
@@ -826,6 +929,27 @@ ec_int_n_default: ec-int-n-state {
 		bias-disable;
 	};
 
+	hdmi_0p95_reg_en: hdmi-0p95-reg-en-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	hdmi_1p2_reg_en: hdmi-1p2-reg-en-state {
+		pins = "gpio54";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	hdmi_3p3_reg_en: hdmi-3p3-reg-en-state {
+		pins = "gpio170";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";
@@ -1035,6 +1159,29 @@ &usb_1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in1>;
 };
 
+&usb_2_qmpphy {
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_2_qmpphy_out_dp: endpoint@0 {
+				reg = <0>;
+
+				data-lanes = <3 2 1 0>;
+				remote-endpoint = <&hdmi_bridge_in>;
+			};
+		};
+	};
+};
+
 &usb_hs {
 	dr_mode = "host";
 
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..2d3f8fe2cf5d 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6793,6 +6793,12 @@ data-pins {
 					bias-pull-up;
 				};
 			};
+
+			usb2_dp_hot_plug_detect: usb2-dp-hot-plug-detect-state {
+				pins = "gpio126";
+				function = "usb2_dp";
+				bias-disable;
+			};
 		};
 
 		ctcu@10001000 {

-- 
2.34.1

