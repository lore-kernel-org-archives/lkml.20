Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81E34AB1BF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401508; cv=none; b=Vl4HrddIIg60soy3mpRvlEQxiJOgd9U/KI3y7qQE5LGUg34XYkHI64c+/Jdfpnf4rJvUuJjZ+J3/KOCHtEaVW92OgY83j7mWZ2B04RrtpR/nQe4P7qYvqBXjXsQR1nYTbyBPmY2PsW0LBl8XHm72ahub3+0uTR7F7x2LkSvKraw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401508; c=relaxed/simple;
	bh=ffdUmazRmnbQUYHjZ3YiRi8BEB3dTacKxLJuTOmn74c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sk+t8ebuUjUzJXywihlHLfBHLF1dNqfaJGCkZZP7jO+2IfNuh2Nf5E44U4XMhHHbPR+3j2Ca1yDuLuI+vd7uESOyl/IK+rtQS9q4i02bRwWiIj9Txm2GTgJl1HWYqpX7iYzRfNnPuItciaGpWUjMT3qm1CeWCn5UMoLTuCSOvxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pKLoIyTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FILYJEbQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pKLoIyTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FILYJEbQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P7fZ2236099
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K376JCBPPpExergHdNw6KKrQNhPCM09DnaYfZQIhYvA=; b=pKLoIyTk/umZQZ+7
	RmB5AVwwWDcBvv9IZKGE36TT7fL/Uz4mRdbLJ4LYlPA9/sLK7zz31oNNGdqlbwbS
	8hn5Qifi2CUmQlOcadrpTkQJtyVIcaYh83q+k5F5Vj0zJ7JNisSrPgF/lvka/Lhg
	q88/BObyTBsaEMWdLxqFQ6CYtE1zL6BnhBP9JER3UpXdy2hcZYjIo/X4b9CRZ/sE
	D8h1ZEnW8KOJD6V+OCo1birV4jLrM5jdBsFpyqeM0qFinGn8oy3tbHQegjz6y2bZ
	j+V7luYnypbvZahRlaG1B/To3Q15QMZyg7fBF+2MzgQZ2EEFnGrCywyYntrCzSdr
	SuUHOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x8bxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ca9b53afaso675465285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401504; x=1793006304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K376JCBPPpExergHdNw6KKrQNhPCM09DnaYfZQIhYvA=;
        b=FILYJEbQML29n/ETsEP0Kz7H8ar2wFIMgTPbQPnid8w1XehIJT+ExGM0KB4xcS/QgJ
         RK+eInWoFN0AMCuDPcK3Fl6ZcktUrAOCao2iDtb/sTFG6sRMwjzYPBlk1RdazfDjyGfA
         EyZH/+iIk/9N+AmK3KUO1KEK1xiPd0zelT8BSDhonB1mddFq1y0h9ZaHTENqpSci0wF6
         vXyMF1LOVvhN7388h6kGSjHZPcqYakHTGePX7am90Y1BgAOh+78g7gsGcJTYIkqkBRWk
         RxbbDWZief+bcmPfVnA6CuA1+73Ldc52PCnrWvMkZqdj5E8wg51CzTseSGlRgtJc9cUr
         lmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401504; x=1793006304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K376JCBPPpExergHdNw6KKrQNhPCM09DnaYfZQIhYvA=;
        b=P4VPPCiofOmGz+LLBLCCeML5/oPexMfEU2jeIz0tMX3pbfh1VTXt/nR4zutbhitwzp
         OHyNpRmSooCCWfts8uOQb9Z8vtLfh7gUCKbOPu8V6UoS10NP1GLDJw7auHxtyAiP6CUS
         gkGmczsfqI0qbLT7IneesPuGsyxZSg+nvOHFbbDBDzG/KvzN34x8uNLTUOe22/YYImgh
         iKcISWg7WfGeuJRE7mtzrr4/rXTMuXVqWYqhPWCtik/UqWKVI/AmChp0lY3HnfoiPu0V
         gq5/U1msDIUONVKx+UTIaOvIDx9ZTxrwD68keOge8NBAHoZpMxzj/n97RdcZrybN2d8V
         dIgA==
X-Forwarded-Encrypted: i=1; AKwUvBzHADsgGk1IKWuBn7X4rwebklwPpYWjkUYPG/2B9c+XlOp6+cnOxjjfSuyomw37sC55tQCYycyDPcyJl4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH7LZIKIUZ3rDwizt3nvnAhRM07eBbHembbC+f853/IOAmZ88B
	2mK7W3Edcjrup/e/8aGDuHoSF/HdGgBaEX6G/GoeV8W5vkOf7eTMloHsX11PBFHWSmui3cEtzxc
	bWViggNjzWbGEcLFc5WcC4t3IKE93Y1STH3vURT9jwp/U7f3lyM6RDNEtqrytsbGwHqg=
X-Gm-Gg: AYBFou2V5trPfJRM62t/6Y5GO7muU6w0fhIKDEqP9mA4fyyCtJitYBXOatiGK7kcXIK
	U+jjXKEra8QqwyWF5wE+EfL1ibLmkUcI9V3lAiAlKDNl+aCE53OgvFZJJwNLVLuGuyJRYMgZa4B
	xfJ+XBqulXCDQdyRvdfVg/PQNWXEakt+rPV3bL7el9h8c8hMS5SIsnc/kkC3b/7ELSkdmCCJLLB
	nSiuWO8nXHTkKBeVmfwFgsIhrCcJaxfUeEBBLNS2fgOBrLOVOpgVeaCYRDwkoEuy2l3KFpnR2Wx
	FemyPIKUbphzGRrJhGcTBjmAnjMUiJTQ+Q/t8I28O/qqQBN44XqYNYSQ4PVBYETejyrIJ5aUnAZ
	kav6SjJzwvgBv0OymThqhpZQbfRDHX7z7C/sIxRMimD9X5dT2bBIyxV1La9Z3oUYbX0Ml5hemyp
	CXA1FgFpGb5y6a
X-Received: by 2002:a05:620a:1720:b0:93e:c12c:f147 with SMTP id af79cd13be357-93f29e23d16mr1191796285a.81.1792401503923;
        Mon, 19 Oct 2026 02:18:23 -0700 (PDT)
X-Received: by 2002:a05:620a:1720:b0:93e:c12c:f147 with SMTP id af79cd13be357-93f29e23d16mr1191792985a.81.1792401503401;
        Mon, 19 Oct 2026 02:18:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2e4e05c2sm15893441fa.25.2026.10.19.02.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:18:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:18:06 +0300
Subject: [PATCH v5 4/5] arm64: dts: qcom: add device tree for SDM845-HDK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sdm845-hdk-v5-4-4aa7e22cd0ed@oss.qualcomm.com>
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19887;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ffdUmazRmnbQUYHjZ3YiRi8BEB3dTacKxLJuTOmn74c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1eBRho+3/0lTICc0qWJm/vj+9JllMyQo6Syrg
 oeg9vbLw4WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatXgUQAKCRCLPIo+Aiko
 1eCRB/sGE2cY1qaBuyRe/3Ex/a3OmvTa/dJU8eXyk1hYQo0eDssB8+Tnbpy9y0MQvh8G9rOEw1J
 B9oRKM+jrwZkqAHuiiUQal/P3qyf5CQCFYEN3+UeDkqCDxY6mQCwtlxbz7tQA6QsjS1y09oKaHN
 72PhpsXuNI3ifPFUNCNQ9fS7+vMWeL6DZYUt1LKvi6NdCZsw1gpa2b2WNQB7Xy+0LrGGd7WpENs
 QyXSAmgHyUzpSJDUQ/05+5ArjutEh7CZPBrvpH6OhVTC+XMd+4S2g2PxPeTKZebSclhrBRwTARG
 z/h2bIyUnF4ARt5Am4nyBA+9awmEHLUe07oZNHqfNhRx8k2T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: kxKkNNUDSrObvVk3L8rOGmYVyLpyl5w2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfXxCXurdo2XPn6
 HK+HvV9wBgXfF9iAPRVOYZ8HA09NZzjHeStjOq4zYwRB3UjrqXo8y0fv+ozf1+XgI2hVnSJ2/DM
 YFl1MeAnDWliuDJuEJVi2EkIsYPHddE=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad5e061 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=omhDqDBcyg3i8pPndVAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kxKkNNUDSrObvVk3L8rOGmYVyLpyl5w2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfXyvyDzpkj/WNF
 uWuIJbKggr1+4A098jzKs2idFNRwp9RBHDujhlzoAT0CJTRzQuTwPOBiSd4KQs8C6YpqPcAYirj
 GHOD7q1Z+06bXCMjl83cLxNDqsFVynSMyUoZcUfO3Wu5oMnPWMahr0Vf1oeq/c2Gr9JKbWV+fRL
 9mVw3A9BTh4u+sT2rzI2zJd1hT2CCTcrKy5eQReLE8wqQ40K2htBNp4uETacrqOHmRCFt+KOZn0
 deI+8vGg9ucObxnFg3hHNdoXVaVQnmp5YeQ6QlPcL+pgt9JPC3u3QwUZ4tI1Nclp8X5gN3wrV5F
 uXzH6b2cn5WHM/KIXZk4HCtevA0Al6anNFy5inm4J08lmCGjKEqOoEdWi+HlZl2dIGrKomlFtUr
 NwyResN/IhKXeM3mnUpPoA20eKYH0T2AOb1/CU9PQBG3cmetTO8auqVZTNfQWwEHqnOE0/y+MPx
 HF+kI6WEPVAOCNEdYrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190036

Add device tree for the Qualcomm / Lantronix SDM845 HDK. It is the
development platform using the modem-less (SDA845) SoC, optional onboard
DSI panel and a rich set of connectors.

Working:
- HDMI display
- uSD, UFS, USB
- DSPs, WiFi, BT
- Buttons, LEDs

Not working or not tested:
- DisplayPort - TCPM not supported for this PMIC
- WiGig - requires power sequencing driver, doesn't work with the
  current in-kernel driver
- Audio
- FingerPrint
- USIM

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile       |   1 +
 arch/arm64/boot/dts/qcom/sdm845-hdk.dts | 826 ++++++++++++++++++++++++++++++++
 2 files changed, 827 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..5be99934cf9f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -355,6 +355,7 @@ sdm845-db845c-navigation-mezzanine-dtbs	:= sdm845-db845c.dtb sdm845-db845c-navig
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-crosshatch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-hdk.dts b/arch/arm64/boot/dts/qcom/sdm845-hdk.dts
new file mode 100644
index 000000000000..dcd678333fb6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-hdk.dts
@@ -0,0 +1,826 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sdm845.dtsi"
+#include "pm8005.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SDM845 HDK";
+	compatible = "qcom,sdm845-hdk", "qcom,sdm845";
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &uart9;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		pinctrl-0 = <&home_pin_a>, <&vol_up_pin_a>;
+		pinctrl-names = "default";
+
+		key-home {
+			label = "Home";
+			linux,code = <KEY_HOMEPAGE>;
+			gpios = <&pm8998_gpios 5 GPIO_ACTIVE_LOW>;
+		};
+
+		key-vol-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
+	/*
+	 * Apparently RPMh does not provide support for PM8998 S4 and S6
+	 * because they are always-on; model them as fixed regulators.
+	 */
+	vreg_s4a_1p8: regulator-pm8998-smps4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s4a_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+	};
+
+	vreg_s6a_0p8: regulator-pm8998-smps6 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s6a_0p8";
+
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <800000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+	};
+
+	vreg_sys_bob_3p3: regulator-sys-bob {
+		compatible = "regulator-fixed";
+		regulator-name = "sys_bob";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		/*
+		 * SYS_BOB is powered on by vph_pwr and enabled by S4A_1P8.
+		 * This is the least awkward way to describe it.
+		 */
+		vin-supply = <&vreg_s4a_1p8>;
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+};
+
+&adsp_pas {
+	firmware-name = "qcom/sdm845/adsp.mbn";
+
+	status = "okay";
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8998-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-s11-supply = <&vph_pwr>;
+		vdd-s12-supply = <&vph_pwr>;
+		vdd-s13-supply = <&vph_pwr>;
+		vdd-l1-l27-supply = <&vreg_s7a_1p025>;
+		vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
+		vdd-l3-l11-supply = <&vreg_s7a_1p025>;
+		vdd-l4-l5-supply = <&vreg_s7a_1p025>;
+		vdd-l6-supply = <&vph_pwr>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
+		vdd-l9-supply = <&vreg_bob>;
+		vdd-l10-l23-l25-supply = <&vreg_bob>;
+		vdd-l13-l19-l21-supply = <&vreg_bob>;
+		vdd-l16-l28-supply = <&vreg_bob>;
+		vdd-l18-l22-supply = <&vreg_bob>;
+		vdd-l20-l24-supply = <&vreg_bob>;
+		vdd-l26-supply = <&vreg_s3a_1p35>;
+		vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
+
+		vreg_s2a_1p125: smps2 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		vreg_s3a_1p35: smps3 {
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		vreg_s5a_2p04: smps5 {
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_s7a_1p025: smps7 {
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1028000>;
+		};
+
+		vreg_l1a_0p88: ldo1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a_1p2: ldo2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l3a_1p0: ldo3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a_0p8: ldo5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_1p85: ldo6 {
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <1856000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a_1p2: ldo8 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1248000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a_1p8: ldo9 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a_1p8: ldo10 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11a_1p0: ldo11 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1048000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_2p95: ldo13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a_2p7: ldo16 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_1p3: ldo17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_2p7: ldo18 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19a_3p0: ldo19 {
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20a_2p95: ldo20 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21a_2p95: ldo21 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22a_2p85: ldo22 {
+			regulator-min-microvolt = <2864000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l23a_3p3: ldo23 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l24a_3p075: ldo24 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l25a_3p3: ldo25 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l26a_1p2: ldo26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l28a_3p0: ldo28 {
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_lvs1a_1p8: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_lvs2a_1p8: lvs2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmi8998-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-bypass;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8005-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		vreg_s3c_0p6: smps3 {
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <600000>;
+		};
+	};
+};
+
+&cluster_sleep_0 {
+	/* default, 0x4100c244, kills the board */
+	arm,psci-suspend-param = <0x41008244>;
+};
+
+&cdsp_pas {
+	firmware-name = "qcom/sdm845/cdsp.mbn";
+
+	status = "okay";
+};
+
+&gcc {
+	protected-clocks = <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_LPASS_Q6_AXI_CLK>,
+			   <GCC_LPASS_SWAY_CLK>;
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sdm845/a630_zap.mbn";
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	lt9611_codec: hdmi-bridge@3b {
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+		#sound-dai-cells = <1>;
+
+		interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s4a_1p8>;
+		vcc-supply = <&vreg_sys_bob_3p3>;
+
+		pinctrl-0 = <&lt9611_irq_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt9611_b: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l26a_1p2>;
+
+	qcom,dual-dsi-mode;
+	qcom,master-dsi;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_s6a_0p8>;
+
+	status = "okay";
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l26a_1p2>;
+
+	qcom,dual-dsi-mode;
+
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+	status = "okay";
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&lt9611_b>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_s6a_0p8>;
+
+	status = "okay";
+};
+
+&mss_pil {
+	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
+
+	status = "okay";
+};
+
+&pcie0 {
+	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1a_0p88>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l1a_0p88>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+
+	status = "okay";
+};
+
+&pm8998_gpios {
+	home_pin_a: home-active-state {
+		pins = "gpio5";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+
+	vol_up_pin_a: vol-up-active-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+};
+
+&pm8998_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pmi8998_lpg {
+	status = "okay";
+
+	qcom,power-source = <1>;
+
+	led@3 {
+		reg = <3>;
+		color = <LED_COLOR_ID_BLUE>;
+		function = LED_FUNCTION_BLUETOOTH;
+		linux,default-trigger = "bluetooth-power";
+	};
+
+	led@4 {
+		reg = <4>;
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_HEARTBEAT;
+		linux,default-trigger = "heartbeat";
+		function-enumerator = <2>;
+	};
+
+	led@5 {
+		reg = <5>;
+		color = <LED_COLOR_ID_RED>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <1>;
+	};
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vreg_l13a_2p95>;
+
+	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
+	bus-width = <4>;
+
+	status = "okay";
+};
+
+&slpi_pas {
+	firmware-name = "qcom/sdm845/Qualcomm/SDM845-HDK/slpi.mbn";
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, /* SPI (eSE - embedded Secure Element) */
+			       <81 4>; /* SPI (fingerprint reader) */
+
+	pcie0_default_state: pcie0-default-state {
+		clkreq-pins {
+			pins = "gpio36";
+			function = "pci_e0";
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio35";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio37";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		clkreq-pins {
+			pins = "gpio103";
+			function = "pci_e1";
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio102";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio104";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio113";
+		function = "gpio";
+		bias-disable;
+	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio126";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	sdc2_default_state: sdc2-default-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+
+			/*
+			 * It seems that mmc_test reports errors if drive
+			 * strength is not 16 on clk, cmd, and data pins.
+			 */
+			drive-strength = <16>;
+		};
+
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+	};
+};
+
+&uart6 {
+	pinctrl-0 = <&qup_uart6_4pin>;
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&uart9 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <800000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p88>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	/* Until PMI8998 supports OTG */
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdd-supply = <&vreg_l1a_0p88>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1a_0p88>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+
+	status = "okay";
+};
+
+/* HS only */
+&usb_2 {
+	qcom,select-utmi-as-pipe-clk;
+
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	maximum-speed = "high-speed";
+	phys = <&usb_2_hsphy>;
+	phy-names = "usb2-phy";
+
+	dr_mode = "host";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l1a_0p88>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_22_8_MA>;
+
+	status = "okay";
+};
+
+&venus {
+	firmware-name = "qcom/venus-5.2/venus.mbn";
+
+	status = "okay";
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
+
+	qcom,snoc-host-cap-8bit-quirk;
+	qcom,calibration-variant = "Qualcomm_sdm845hdk";
+
+	status = "okay";
+};
+
+/* PINCTRL - additions to nodes defined in sdm845.dtsi */
+&qup_uart9_rx {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
+&qup_uart9_tx {
+	drive-strength = <2>;
+	bias-disable;
+};

-- 
2.47.3

