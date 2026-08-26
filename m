Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE43F4101
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743951; cv=none; b=As14GdVDYRIPlA48AhZh398eb6jDZEOIy0DJnttKk5tX6ed7umVQIvZRQh95DKJIlc74JpRelWP5Q4FEFv15w6AbjUlrohRl1dUSeyLDmd6pZf6/tmaf595WMHUce6JKODW1mJyd/uoKluvvNNgaqWABMT+n2BS9HaTiINsVPXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743951; c=relaxed/simple;
	bh=6fZMUqee2aB+Vo0b0fpaMbB3v1+SLirfRFRS3G5lKL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KmdyOdRbYDZtUnkydAdt+5Z9UrzGugDdZldi+1C7ULtboM6qqBHyIIqX5x/u5M0iYnliz7h01v1XikwQa9I0nThK0Y/qrbfnzQIKVv7neeF3Dkn4ecotxiCeFUaLuqA4b+jIbltjEEThJ7khLO8Ht2seVPBqJwWDLWQQ1GjPn+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+LpHC6g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FgOeCkLg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+LpHC6g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FgOeCkLg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGxLd972341
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aT5qAljuV0+
	+vGL4T8UbtRBJmY87Vk58Su/AO6An0Bg=; b=k+LpHC6gezEQ+W1F7sHPLMI+S57
	fFyCl/hLL0vcjw8XdrdIAjLegHdN/0t6iWndSzoETpIsEsLnkTsYZrvnMF5Q08sw
	9Xnwnn3ECowMWAAoVG2DkO3E4Biq1efOTI1/JnFylUjGpFh9ZW5NUDDFDbwbKyfM
	Mekl4+2FkT2cv1dcxKoM4RL6516bowTXjEmUZjQHegVa9uT0SwfEchxhP5nRqCFf
	s3cfWpmU6rk6BCaftkvj28rY7swdRhHflVAjhks+Cx4l7WauNNaWeJBWrVPU50sA
	aqAbQTTugu1BCZP+jENHRhzE0s2/Uk6rCRoAOGiYV0mAULFw+pMf+ezF2Aw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghtdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:32:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso1771212a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743948; x=1788348748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aT5qAljuV0++vGL4T8UbtRBJmY87Vk58Su/AO6An0Bg=;
        b=FgOeCkLgA9mhfyAXJ155WzR2jyeOvI5Ci926qhlHgTI2GoB7N06Yq66E+vswe8Nvhf
         uCJou4hqJvMYrUl1cvwo1piRPhuhuDF1pHrSs2Bhrk8yApblAMDNSBU69pTXxl1h7DAe
         Gk8W66C8W8aMPgY8iYY+XYZFb/ymM7LjnCli31/2YqrL5kCEc+KglgIvGmJfMnVROZyL
         oFzoNuhd4xl/VbCpVWec3SSderROjV/w7Jh4hH1x1ZNLFKueIfia1t/+bkN8rI1diUpk
         ae546nU8MNruiV9WuEFVcddw8jLBayD2mYTvYHbq49DFbyc0I7vtovfXXsjbxH+E61HK
         6gHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743948; x=1788348748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aT5qAljuV0++vGL4T8UbtRBJmY87Vk58Su/AO6An0Bg=;
        b=ngV4ZxMyURplpKVelAMe4/ESYbSv7ur/sB4HWLbxTt6DJ+WVlMSo999HLoZWklYVUj
         PJw7Xv/o0WLRpK2PmQW2xzQ4FRl0utkEuyHpef0pYqk5l8G5K9o0qN9RD9tZMIPf38+p
         YG4ME5izjz+pS5NjxTBwtNuwxxyYLNdUceQSoW5yOzSvxmAEAtQOm280Afp8k7ibIOSN
         bKlU1R/sBVsWRUlSvevzRKH7T6ix2FwDir+sjZ+i15/a9wK1O9uvAaUXbvYH+CM9Akx5
         GPa5I20wUjY6r/+qvvhCSODvNcutGOKQ06hvW+WSFiR54at9MlKIY1ARzPOTCJ5b4bc7
         9fFA==
X-Forwarded-Encrypted: i=1; AHgh+RoszgTo70RtS+zKPx9ieBQnGyL9Nll2fYM5TJwd1jmoJ0aOxhXCmYqmS6DZmaYdfbbs8owBTt0c87ubvq0=@vger.kernel.org
X-Gm-Message-State: AFuF++ntNT+aVOs49BiNRxYW7bGl/oCGxxPeERuIXeECGXkNpdDI1bf1
	qFD3AaE+dECH3hSa2M+DVeB5Za0PXmsDIX6IZSnWzsftYP8UgE4ZPJI0u0CZWzZPuQwsUw7ZL86
	x0Z7kZOXRnkVy2hgYfjNHrbq2wocJ7CoNytvQHJP4Vk7ixUCNZl7ruiQdP9CuJvHMods=
X-Gm-Gg: AR+sD11FbgF/PG56ZILAN6/TxlIVJrlgpo6AcNgcQyuX1JvYekb3U/yveDPm7PgO/v8
	eVWRzcq2W6vwOIMczuym9KBLeyIkjleYCwwlBK03IL5quy6HEA1vCY2KWVkyxxUr1YB9rbdQWVr
	twxtF2/e58AYW02A1+RnLRnUJ2ldUjglmd+Qhs4zLOeEnEu4nV8Cfd1pzJod4W53MYsudrflSZ5
	tIVNii5ZNvGM1gyJ1u2gmFuL333qXw8rncslxFzF8AjCp53c8hq7F1KgqiVvcC/raZgdHiP2GM7
	MKGD6FpLn3DGqTpdu1wPMzK8eSTrV2ZaXjcUu04oe4r7Ljz8l9qw+fRaqhMRauU+Tn+/7GX1bog
	UC7urUhJl/wf4doVq229w8KeELCLC3wMUks4=
X-Received: by 2002:a17:90a:d2c7:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-3966d1f21d1mr14541163a91.7.1787743947668;
        Wed, 26 Aug 2026 04:32:27 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-3966d1f21d1mr14541058a91.7.1787743947177;
        Wed, 26 Aug 2026 04:32:27 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b3a49bsm7748929a91.6.2026.08.26.04.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:32:26 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH RESEND v1 2/2] arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay
Date: Wed, 26 Aug 2026 17:02:06 +0530
Message-Id: <20260826113206.488991-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
References: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IDbfmeWzHTCST2qNlvSiK5kSkgYkldyj
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ececc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=m25OAOzQKwXoSehIqtIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX+L9D2RcWGGDw
 Y+SCL4cO5HH9zjmynsuYCQNqDhfjtUd2mLx/F/SkcCvR+XuXVITDTH/eM3yl2QrnoQj8NCwseDd
 afrbj+nNrrznM8tgsYyDmSjr23rqWIM=
X-Proofpoint-ORIG-GUID: IDbfmeWzHTCST2qNlvSiK5kSkgYkldyj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX7ArldWdOHh4o
 Zr1AXoGmJ2GCcxNrEq/DhmmP+TUKr3tbBietnbVoRSZRH5v2Gbo97f/c5QmZykNYBKHJ/XL/t8T
 Cqy+7d0Tp1I3rKio3KErN1lcU63epd+p15QrpoJalHKp011WwTppFM5mJl1Hmwapys3oGbS3CcK
 auwuXfUSUoY3HJHZKD5+CS2QGMwZtLoKibzB031dU7gqXh6dWXIzyvlIROzt24ZVoZcFnvoTw/h
 dG2ws8F5KyU2APW0dvDTcIBlS3exJ1UZkyrozJfpe1/G4Wxej2UT1GIHexFpi2569JnW1m0yt7p
 grnaRh/Vb4+ldUMLJwm8ABDeINA8fjzV850Xc4UhXvJZ4P0at8zwJphZkyizzzbLPXiidxCcnT7
 lvZYMuXJil8jMPtiiG9z66JVoyAH6zgJNnhXLmn0qhk3C4rJjR/sh31x/iWdTp5SclFprqNJAzz
 nAd6KFYJ6wWFjRDXLQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260096

Enable the SDHCI controller for eMMC functionality on the lemans EVK
using a device tree overlay. Configure the corresponding addresse space
and resources for eMMC.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 10 ++-
 3 files changed, 74 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 67b768fa8063..2250e16e9366 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -46,6 +46,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
+lemans-evk-emmc-dtbs := lemans-evk.dtb lemans-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-emmc.dtb
+
 lemans-evk-sd-card-dtbs := lemans-evk.dtb lemans-evk-sd-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-sd-card.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
new file mode 100644
index 000000000000..52739d39a1ff
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+
+/ {
+	vmmc_sdc1: regulator-l8c {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-sdc1";
+
+		regulator-min-microvolt = <2960000>;
+		regulator-max-microvolt = <2960000>;
+	};
+
+	vqmmc_sdc1: regulator-s4a {
+		compatible = "regulator-fixed";
+		regulator-name = "vqmmc-sdc1";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+};
+
+&sdhc {
+	vmmc-supply = <&vmmc_sdc1>;
+	vqmmc-supply = <&vqmmc_sdc1>;
+
+	pinctrl-0 = <&sdc_default>, <&sdc_rclk>;
+	pinctrl-1 = <&sdc_sleep>, <&sdc_rclk_sleep>;
+
+	pinctrl-names = "default", "sleep";
+
+	supports-cqe;
+	non-removable;
+
+	qcom,dll-config = <0x000F64EC>;
+	max-frequency = <50000000>;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&tlmm {
+        sdc_rclk: sdc1-rclk-state {
+                pins = "sdc1_rclk";
+                bias-pull-down;
+        };
+
+        sdc_rclk_sleep: sdc1-rclk-sleep-state {
+                pins = "sdc1_rclk";
+                drive-strength = <2>;
+                bias-bus-hold;
+        };
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..99d21e3d7ab8 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4300,7 +4300,9 @@ apss_tpdm2_out: endpoint {
 
 		sdhc: mmc@87c4000 {
 			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
-			reg = <0x0 0x087c4000 0x0 0x1000>;
+			reg = <0x0 0x87C4000 0x0 0x1000>,
+			      <0x0 0x87C5000 0x0 0x1000>;
+			reg-names = "hc", "cqhci";
 
 			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
@@ -4308,9 +4310,11 @@ sdhc: mmc@87c4000 {
 					  "pwr_irq";
 
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
-				 <&gcc GCC_SDCC1_APPS_CLK>;
+				<&gcc GCC_SDCC1_APPS_CLK>,
+				<&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "iface",
-				      "core";
+				      "core",
+				      "xo";
 
 			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-- 
2.34.1

