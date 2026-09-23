Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD85F3F4DC2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139512; cv=none; b=EIe82eGUhmg78PWCZ2RipET2JWn4PIJFmO7r8LqKELVXokCFDnKYHlNL3Ys25eCu65jpOnXoyQ2VGuZlOi1uBzsyUXAy+NB/4gJ3vJx2j0vSW2Yokj2ARNGyNNmzfu405P3Kp9VWSRWdO4zSYqE1cDKia7EmZinIYHV6K2hM7Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139512; c=relaxed/simple;
	bh=QqOCZ4UANNvHsyhOiWOL6rnrRj4uZgu6LeQYl7gibVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctM+iZjSzOdLav70+G9UTDvSj9UbOlPgOPZQSPK6Ey7s94Mpx4C6PHpd4hZviSISr64owcXnT1Lbf2dRMRCz7wO3j4s6r0Ax/KX3XoOt1OS/xafIdLe1bJZF+KhavWBSgbuzQswwgdmdsrAb9kVx9J4R/1b9SXni1Zu8O/C41w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DXYahJ0l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBdv/wBK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DXYahJ0l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBdv/wBK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iQJI2571418
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EHd2P9cWUvhze37CjDGU3L2BOGNEXwJl3rNmq74c3F8=; b=DXYahJ0l2Hg6a69F
	2zEWGrrAclr0wW7n42JSPe9jHalMww94TJpkgjcocSRy82+GdRQC+p76xmWsNazX
	+9yoRFhLBoR0lLphKaIARShtVT7CfircgFBs4iG96k/FKE6CmE4QWBTEXq64YjoZ
	TmAmLrRMk+Fmsqv6tFSJ0hWd/Ds+msdoaShzlf9fzoexCVzFoHaIUZkeK5AmxeWB
	K+E3iazp/mouKjPyb6bhpJJHzYTVV3JI7MHAAU2qYu2OcTB2LS71RwRTflTG2zhh
	Cu8v2TGyh8AVstEX2xKzeLl2Qhc9SZGmLoJyziuPuLx5GbUPo6oJm4VAbuzAkuGi
	S0LeGg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux862jdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:58:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33bee712354so615507eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790139500; x=1790744300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHd2P9cWUvhze37CjDGU3L2BOGNEXwJl3rNmq74c3F8=;
        b=BBdv/wBK4IDtbnb32bOzX08jXOtFDiUR09mwtm6NvMec0JoeLhT7JzAlhs+m0TWGSS
         tp7XSRl3pnS6DgscDpZQAj1hBtzOJNUxI9pTIkdkhfTYUqsj6uq+CwVs1f1ca5ZXiag0
         KJJfzV3+rb+14dZzyfalc4ewVD7WVZRR1r/18GeKXH9e6UVjsrlLzv7pbk3lHNfKwsqY
         R3HoiOPHD2vbJ6JYJeBZJE7PQ4xDYZvhS/9XIIOLN2L6fBrhY78bGhuOYZsgMaQ6SMfS
         yMPWfgcy+athhKGHtcY+UEwAOzFjlj9ohZ+JkeRavPCHUtc9nDbqXxhhMSQHdMkD9/KJ
         NpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139500; x=1790744300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHd2P9cWUvhze37CjDGU3L2BOGNEXwJl3rNmq74c3F8=;
        b=L34BLTmwdGt08bNyvTltBcX9AbhcVtEZE2iZCOMMD3g034AEKFP6EFqfgGEf3YCxEu
         dgef5+CJlGWr10OavrYC16Je2K/b2TCwAkMWlGmFdnIUr/TmTVB9B1dxSQQcaCuaqlUW
         LVf+jZUxjDJ6L8jG+stRfOGIknipTUgQDwztGLkDTlWohAC8uug1Di/5x+yZvWQPoz6B
         qwgMDiJAKoouu8GRpzE5Z1rMflA28jtvYR30kd4LOnJ24WIg8sB3EQpeQgfa5AK5S/t2
         AwsiffxSM8EAwP3+541O9jb2g+yMzG7NwPlwQ5x0UTQUFqEZMClPsAE6jm88JJOwZOfw
         9jsg==
X-Forwarded-Encrypted: i=1; AKwUvBw8d/bjUCDkNqmiarqpggb5/Qm8mwHymojSEUVnaErJra+S5NDnaUN1BwRxktL3OIx6T9KTv+ljg+LeAFA=@vger.kernel.org
X-Gm-Message-State: AFuF++lauqdnLs/ojeU5IVlGWL7PafdkFb1vC3YNN0f0V9kdrU1hCEXl
	Dwplg9K6n9wBT2qgNQNkj7ZQgf5JGrZ/GKwoJT38uDeHwmEcExCvIZtrnNXA8hkpHRKMWupk67w
	onE8nkShETVJ7UoX7DCjK1cT2dcEq+Ts/XHTJM9QHrUq0PD0C7JLLBr3N2IHhiSn93D0=
X-Gm-Gg: AYBFou2vemehaTiyHgCxNu3iCv6qOoCOHBgQ3mRIFGntECDpwXJeUS/42rRzfcp7+Ni
	71xe2o+67tNo4QVKIIvtXnMVzQ8/mbvegQBffWeTOx3nSRSE/UV1Nt5F33iDXbisaN8GEXqKNOk
	0kZnyykQUBdrYKPvHrC1CuVo4UqVofyT7TTsFkKad4Zh3f+AXhPEDJ/2/HSjHBENspsPYgaCI3k
	H0BM0Gwez9dQUoZZcSnzZa+vw0vMFsNv7CX10VJOBcMSsDgDL1JwXAsNts0MxHXOQN53L7Kj38L
	2dV4x0lMlz90U7rRe4LbPRYLQg+vDuTU16iKzm58AHIj4yTGKikW1kAfWwdYsaOog9MgocYrmLZ
	isaKovxHDSUo5OfbvvfcUodS0f9KfzQ==
X-Received: by 2002:a05:693c:41c1:10b0:339:7f8c:7f9d with SMTP id 5a478bee46e88-33e8d8d21d5mr1625646eec.28.1790139499453;
        Tue, 22 Sep 2026 21:58:19 -0700 (PDT)
X-Received: by 2002:a05:693c:41c1:10b0:339:7f8c:7f9d with SMTP id 5a478bee46e88-33e8d8d21d5mr1625617eec.28.1790139498947;
        Tue, 22 Sep 2026 21:58:18 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm3168907eec.26.2026.09.22.21.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:58:18 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:27:31 +0530
Subject: [PATCH v9 4/5] arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera:
 Add DT overlay for Shikra
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-shikra-camss-review-v9-4-09f5fbea1309@oss.qualcomm.com>
References: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
In-Reply-To: <20260923-shikra-camss-review-v9-0-09f5fbea1309@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790139451; l=3710;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=QqOCZ4UANNvHsyhOiWOL6rnrRj4uZgu6LeQYl7gibVE=;
 b=pIzV70UO2zPoKcDhrQ6FQbygzEHdlH1iw245DkaluIP89rCOLf883v9OozqlaODuL8Pf9KxCr
 lHSKKmoXfa7BSy+pOkUAIuuBrzT0xAyJKA3SpitFDKQ+vkWf19V+2t/
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: ziKFwGmiMao7So-gO67fJmWMtRtbN5zT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX0zufBnDfw6bQ
 Iid8X+ivpbjgLby7UyKK7l1FjGgKBvlIYTlUJTfuTwpGX4O1/WxGf8vPrT88QEBrnn1cZO5Qg86
 qkWVScbXEqvmABgKUYs1W0d7w0OkNiI=
X-Proofpoint-ORIG-GUID: ziKFwGmiMao7So-gO67fJmWMtRtbN5zT
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab35c6c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX00bcPNZ0wmYk
 fGECA4QyT79imgDuAqyE2lKqyVUxLka2auFcGDJcahXnvEilmErSvEl5d85Ehq+Mc/McJdo/qfH
 y5iqSgcKZPXTSd4CkpVhhXU7H10z5vO72k0OZyumWEhuoa8wFmdE8PWOr8MwT/U/OiaMl8F23vJ
 M9wc7TpulK+eaXTiIAPsG09Ej9NKv8M0erbHTEeel9FOG7Z9Bm78lAx11hY5xpFdJEr0jG342vS
 Xg128nu87ObZ/M8Lg9m+9NE/wauHwqDAYHwyhxb4UBU2GzZdA758cOojTliH9hIWw7ijc0jtTa5
 V1WvUWr9h+ZK+Tk7yf+V5t0iAu41q4LQWzCUdu4cN+whCqcSEuAynWVys8UdSP2xQd5eROIsppZ
 SKEixobnXp6PdLbAiMtby89uJpUm7uGH+XvrMRLePOm3Xcvsa77abXwVc5hOFT4oYtPhett1ael
 wlaz+FsFXzwb2MmQkYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019

Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
and identical camera supply rails. The only difference between them
is the integrated modem on CQM, which does not affect camera hardware.

Add a shared overlay for optional IMX577 integration via CSIPHY1,
used by both CQM and CQS EVK boards.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso | 72 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index efd7bc724ee15d3cc3fe391cc93da334e116df86..c049c3b0637f306c242eb42bc3cc11a333ae012f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -363,6 +363,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+
+shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..791589bc7642ea9edb1b2058bacbd519a1aaf2af
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&camss_csiphy1_port {
+	camss_csiphy1_inep: endpoint {
+		data-lanes = <0 1 2 3>;
+		remote-endpoint = <&imx577_ep1>;
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		/*
+		 * avdd and dvdd are supplied by on-board regulators on the
+		 * IMX577 module from the connector's 3.3 V rail; they are
+		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
+		 * level-shifter that translates CCI I2C and reset lines
+		 * between the SoC and the connector.
+		 */
+		dovdd-supply = <&pm4125_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&camss_csiphy1_inep>;
+			};
+		};
+	};
+};
+
+&tlmm {
+	cam1_reset_default: cam1-reset-default-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

