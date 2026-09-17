Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F664B3366
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645316; cv=none; b=Nf+NBuARTPMokva13YCg4DFg2TeMT9Do8zKgBLu3cdmfX5EgmSNQkYVQwE7Qm1/9ZIne4n5EqejJ7VYZCOcy+5LF9RQQDwXRX+kcUtu4TWvgYiZWo8MHVTmgLJ9O1asjR9mipoWhPeTuNl3SHowE/cI8ecsm5kVcFAhgRLtTm0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645316; c=relaxed/simple;
	bh=TfAZkrQyH/2Nx/S5qf316QvGg3gZJpftAEMQtTUDcT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIf9Af56+edbFBKRZnkqwWS2YhW89Skksg534clcVaj9gfcBjWVJdzb24iGeCb9cWefbtuArXdyndR1Gv6YmUBdYgXoO90n+bs1Ra+0miNCv4R4dwbd1ZWg6/umGzOTjdCkdyBjsNKD5tvnbq8AM+VQhTcMsxafy0nV+glRiKhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bw3LXefj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PEPchHXP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bw3LXefj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PEPchHXP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZZ83612901
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJhXSOoOh7cjCe2q1aXhRqHQZa4x+8gunPH4pO3XSOI=; b=Bw3LXefjWBqcnrcC
	D1ryWwZ9+kGrz8mafCIOK+YwnK1cwyAm4rORW/j/ciFFCL6z/3PGqat/fkzJqEbF
	2pi9eKkfSbGDRNJSw+HXwkysURTY0qm5d+MIAPH8Kl64bfmyR42mYJBk1uB/J8En
	Lv5xysA7hn6OfVT6r6NuWURpvfwRb/5NsKxPWPCAyd9uta6Tm2tVTrPBBz9mdnki
	y8SrDuyD295mqGWbnsATCPiy542QhsIP1RVKONF74tFauP9WXB7cvdnS1EL98VsK
	QKRGWH2j6PKXCi7/DkKeLiaLpcwdD69yxk+AWDWurRu9yU36ctsm2dDBrh7Ft/H1
	UsvOJw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0rvw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:41:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-85f1f3620bcso742710b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645311; x=1790250111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJhXSOoOh7cjCe2q1aXhRqHQZa4x+8gunPH4pO3XSOI=;
        b=PEPchHXPrbk9JUFf69bxjft0aqNMUas9EiFWD1GkNNzPBOw7+tNT9H7U23eK4zH/DH
         2S1AdL8JHmKCYhELvInFI8IOdIwLdasg6Z5PG4W8J9NgvTcYZXAcidOWbbEGb0KdV/qr
         YAdiV40GBPXQUWFpXy5j2RL7QuZlxGq7lWUSQOdVfrHesAWFbgKtmZZk43hMEiFz6XaG
         /wpqzAT+nM4tHvSSyN1F0Acx8AQFlEpad4gmQkiBniH51cXXToN9/ynXmS2vlHi3SWU6
         9EJpGTFDbWv8OoQcAn+AFcA3coKoClHpBWnCJzUSyhC989XMeNvzHUngg2apGllksbFt
         gCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645311; x=1790250111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uJhXSOoOh7cjCe2q1aXhRqHQZa4x+8gunPH4pO3XSOI=;
        b=Ma+/HzcVbNCjN3n2eOi5Qr7ae0099k/tFthvXinHCYNzHZKkcTL34ueseWBRffMQfo
         ZfAMOc/4/cbfSInSIbSRB8RBUbB9aMqHh4TecMMZBTtzCnIBiVT3C64xyzioET9iVFQS
         g/ZqJO97NuE7He3uRZ0IPLPUkGGxXT9Pf2p3WtZCgf/2jPWgeTJx8VDpfFhluKuPbWae
         WmQykk+ptMwjGwhLYrZhCbFg3R74kBG0ESwLSU+CMQJckX8PaxMhwDuuahzQSerRDvcS
         fPw9YgIJAOuDL6oey/hFWH+S3uXxzB0JrYB6dP/iaWCTmDBPLFy9gqazpboRlhXFMdV4
         6eIw==
X-Forwarded-Encrypted: i=1; AKwUvBy89+PVKb7yzABLbU3Df0J4dOq6Xzx5zlowR/J9cDMOaCwP3TlzGM326tfZ4x01ZDW266tqMu3vLoDZCs4=@vger.kernel.org
X-Gm-Message-State: AFuF++m0Xin4Mwu+KVrNZJXjrfEsLjdY8/rH3t+bRNtbbQBosBQoSk83
	rIpzVyusb2IKn8HaD1S8LXDaPBsJQfc2y6SHp8oA38ZyJZkh7mkWXIDJjMWRjJx/oYSfG5j79+K
	Q1VMIN9ArpviO4DXuptdNJMj1ck0SCoyprDj+sQeh8WuVlHMR+XOPNk6JkTNnpFI7WuY=
X-Gm-Gg: AYBFou3qez6F/yMRBaydhZjTEaiTeWZsVa62HtAM3kKSAjLxL4KDpViu+fiQwK7sPYF
	GYaJHP9AojafAA+KyCMTaW1FveJgFqKBTutI69yMQjDWxiBQc6AgUJfVBMRyqR2EugarHePNKZu
	n6EtKdFDOH78Kjch/hfvW7O/D/tvOSys/1d7zY5lyCdf8+G7l5amSTFtWw7GBjS+rLsVmskFkr4
	iANbqXw/ctrslHS4w3739wKSgSlfnhbH2k7VzA7OaE2Pmixa7iwBmcsS80ISxL4A9xvQZLeot5M
	m34CIP57iobkASh8HL1OVS+6pU1lqIsg/ppqeH6K24qmwlt0gkOVCSHHwzyG5AB4aglYV8lxJQE
	pWjVulqx/uD8Z/twShdPvp55o/E7niQ==
X-Received: by 2002:a05:6a21:9185:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3dd7256f000mr5385396637.7.1789645310622;
        Thu, 17 Sep 2026 04:41:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:9185:b0:3da:3401:c13b with SMTP id adf61e73a8af0-3dd7256f000mr5385340637.7.1789645310168;
        Thu, 17 Sep 2026 04:41:50 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:49 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:04 +0530
Subject: [PATCH v8 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay for Shikra
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=3663;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=TfAZkrQyH/2Nx/S5qf316QvGg3gZJpftAEMQtTUDcT0=;
 b=WQuOMChYboYzEnDWR8vQ0V5Mji2g2iiMArZvPnPifQnM8Pl/TdWMIoI2xXqDjPWAWlMMlS+RH
 fJwv+ka64QVAKicEOjKcPDbcpJwRImTlYzMaz9iNMcEJWYxz5p1+tVN
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: bRU-CJW6IWHqdPTsyeeL24uAYNONMIue
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX+ETSmUv/MxNN
 OcyJ4pM+DeRAE+z4HnKNEIH/BH3hMUTSh9J5hahAlU8HPvM1pFv7vByaXYwZJJ2G6YW48Cjxb0B
 D2V9Kd2IZnnxmDshEEoHXLfKm51r7OE=
X-Proofpoint-GUID: bRU-CJW6IWHqdPTsyeeL24uAYNONMIue
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabd1ff cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OGCdAuOInqFJiNoUztwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX4FY85mSHNgQ/
 wAoaCUEOHDeJ+YIzzUrBlkwk8ydOzIiz2ZX5SwP/RO2p3FmaMLOyfiWMnTiL0Xv7J2gjRHqsWG2
 Pl4R+ikdAb2tNlhpnuI8N6tyfWCU69eRmH8LGJAB6lpqivwD/8SqFGqrsx9JdGkelX4fTZwCFMM
 ZdRD+f7y/i4QZzvMfEHuoUEX8xBuD28jGglqmyk7WlEs90BdcaLEMpPVnsjjms/E9cMWamQPyUC
 iWy3p1FkTEAjnDJvPgss6OQzQlsGVcvqShPDdD9IRYJOghYPIBGkL9cAlfAsdYl0AjDJrqhJ7WC
 2giW/MpxoIN1KR8srR/KudJYPnrZcnIE1wFHNX37khGHBHMftonq+Fgozy0259rlM6WxYfxIrO7
 SEECsBwfKqCLs8rqmXRtcBT9BZT3b0DrLraTo2bsgI67qqRVZ6Q0Dm2MnhYLzw686WHrr+uXFvY
 O37/89ui2TNvMVVRMmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170162

Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
different CSIPHY and sensor supply rails compared to the retail boards
(CQM and CQS) which use PM4125.

Add a dedicated overlay for optional IMX577 integration via CSIPHY1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 79 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 02f340aaa2ca542d0d175ff965198b29ac48772f..c59f0e2231b57b1dd1975c189820cd703d4d5d48 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -363,9 +363,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
 
 shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
 shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
+shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..d8c968a918c67cdebc0e7c6fc14ef820c97ecb75
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
@@ -0,0 +1,79 @@
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
+	vdd-csiphy-1p2-supply = <&pm8150_l11>;
+	vdd-csiphy-1p8-supply = <&pm8150_l12>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
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
+		dovdd-supply = <&pm8150_l15>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
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

