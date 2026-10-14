Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6DB3F0A8C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994822; cv=none; b=c704NpDNB/Ly0CPmwrN+o56fEEdZeO9x4iqm+sEtCQS95o7HTRLlpzXSjbkBpsuVIksyspIKOVOZc7GqG83Xm6w8UP808C7oV00DVBdMwerq+R8ReFEfQKhId5O4/xCrVj8SLV5YcTLgpd/UlOb6I8q36afVMr7+fpYT4XxAElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994822; c=relaxed/simple;
	bh=fiG9JOwZ9RgoyoDyD6yndaiq97l2KW6CcMhSb/W8evw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbN7FgIaLj5EIfDlxe46Zbm8Z9QtrwK53Ioz3Y+HaijYfhSm4VRRSWv3QDVbk3hiRl1d/I6CXyrQ7DZPrm8U6qZupjvrutd2rw+5o98iNSEtz12U3z3QXwTOk9k8U2u39TnestGzYv1ILcvzrB9je9IYux2egyYvPLuXbeja0M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LoJ0DLHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKdx6OtW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LoJ0DLHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKdx6OtW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEaiWv500409
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YvA5VN9F1N6zF9xJ2DQD0VDFC0d4+++etjYaQC8uc3Y=; b=LoJ0DLHx+hzj50SW
	Mz+/y+fdRXGzkQVhoaK1cTkTFZR3onkq6dlJbo8VSkdfi1YMC/XFTW16aq7BnyCc
	S6mlzMXTKwf0vDlN14S5C2OllMLnValya98x4hg1WoIiViQiHGEA4u5ecRFpO/4y
	cj2yjNXsPItG/Z4EM97wJX5rkc0rJXRGO75dhPQ6/c+VudXaxtrrWk++GaSkj9xw
	DHvF04ABxhZ0sA5njSLGldxdQl32G11mc3fRXG3BGDge5XeHMhekvvhho3z+HDxf
	pwbA591ik/XpDkgRBlgrCUjfHyjVEJhw2cvfqVABQ4uZrdbHYL2gKH7kykGpEVVu
	jFxECQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf0r89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:20:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a109c937so7721106d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994818; x=1792599618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YvA5VN9F1N6zF9xJ2DQD0VDFC0d4+++etjYaQC8uc3Y=;
        b=KKdx6OtWqxOa8wrmDWGSPxcWJ5OMTtHYX6xvZF/cYSzHx93+tEQ/DV8nakUm9Eg4m/
         milIvQ9iMxNqCjt/02auaUgQmbSOD6AyBU8ko5sxaFhqMefvzj1O8vE6N7iUKUXXsOT2
         9rkhbO6M0xoIYjxfJvGbxA/Z+yYajf7MhBzowXmsOfLseP8MdFRo6RwPE9LJJIeFGaWr
         PzMm6+N+qUjMrWlvkaMLXN5hB1WaRMBX7fuQu5yP8N3ztjTkJFqvFmBhztJsxjmFTQPa
         DVqKPdlS0ZhmhFlZyWUttdRxOJA/4jHITsKDlHXEdPyAWP/FHXL9pifSug5AKA5DiOuq
         lb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994818; x=1792599618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvA5VN9F1N6zF9xJ2DQD0VDFC0d4+++etjYaQC8uc3Y=;
        b=dgtWK+gIe4c2oG0NJdKqJy33iOUSgO8LsgCn0zTFTHnuQkbTaVhIFMnMLHNZ1iDBuy
         s//qsMkHKdXzC0ktJqTXBAtvhHM5xQnschkKXfX/QrpZssDCfuLDo8dYvCS+0aazcsgq
         4EyhEMkuzvriQnMG33Lb1UegDhVEFXuHJcu9REzdcIrQ5HeFvrnp8PjBHNgxxeWpShKZ
         vXw6kwamX2VZ7oO6+v/p5QxO87vL0SIGGmRYaoVNSiOVxug+rKEvkHRAGKnSmz7IeitH
         fh2LoppnOw848fTiJrymbnXhQUoVBKY0znYp5OX4b+aM7m8CgzaAZCDcL7anS2cADkP8
         bSdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKnss1yvdCQBZ3eK3gP/0nkShmQ9389eVyu8qghblCjllMKow3EdGWg2a8gpERwTYOHtXYGEY77r9tH9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWIXh4LnJ76/HP5n5sh5h3bo/u+1OD2BZHopn0MoRDMYEiYyrP
	K1sQUKf7FfxlAM0pRb1JICiViU5ctfjs8C42PP4o2T6FSBNn+t7fVilIX8ggi+OA6FAr68xtil9
	2jBW4vYENtiYVXyh0o2pKJXIqvtmg4m4Yg84usXd4iNdmrlbvtF4+1OV0dV6cWyPbizk=
X-Gm-Gg: AYBFou03eCndqNt0IbS9ToA6stUS0ZbGl1f7Vn9rVNWrJqct/GVeBO6aaH1GybA9dE8
	VeCx83C7YF9Soin6Ic8lgwlufanaVvAbqQ+mxUKnkQQ7w2UQorDrHdWFOba0QfJcR4YNzBfvYlt
	I5stw5YJwrxXTBbelZkWeezPyFBV6PQwkd8mndXN91TcmfzC7NZnx/JCoodQ//JQH23gk40XJpf
	GnJPT/IlEVybNt7MblCD9/nDqBsXl1U47Cj0A7++SETwBfEw89kbC/VWEvAs1V25U+leSNOFB9d
	XDMcc8u5PJoCdX9E0H9KTqGqlMHRdegUnCy3cFWtUJ8xFfhmdc0Esg7ANK4DIe+KuOwn7qJsXmK
	VMBEtuu99+HRghHQA7GYwZ6/QLOBJGG9c7U/2rCJ1wz9KnWhd+n/tm0wIe61RCVa0uR3pt/RdUK
	Js0TzQLs3+9qyh
X-Received: by 2002:a05:620a:4714:b0:939:ff11:5328 with SMTP id af79cd13be357-93ebd211034mr2620943585a.24.1791994817474;
        Wed, 14 Oct 2026 09:20:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4714:b0:939:ff11:5328 with SMTP id af79cd13be357-93ebd211034mr2620936885a.24.1791994816864;
        Wed, 14 Oct 2026 09:20:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d7d0f6sm740187e87.38.2026.10.14.09.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:19:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 19:19:20 +0300
Subject: [PATCH v2 5/5] arm64: dts: qcom: sdm845-hdk: add display card
 overlay
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sdm845-hdk-v2-5-6d0b4b42f267@oss.qualcomm.com>
References: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
In-Reply-To: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3759;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fiG9JOwZ9RgoyoDyD6yndaiq97l2KW6CcMhSb/W8evw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqz6uIKiPcnuT84rLen1AukFunySURVM0g03Lh1
 21lVTg/aQ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCas+riAAKCRCLPIo+Aiko
 1XhoB/9pOmvOIaU1s0UmuN4LFEoRFcc6VK4R6vVfvDVOnjFiZkVFdV+RE8eVTfFJT1Ah996kYXj
 ckn1icJBgL1uw5U4+95RDZu8T/ukocAdgHJbUST8ZI5wfcdu3h/TGmEeRLPNvgBUq4a3yJp2mdH
 AL/21pc4fJCMNq7IcSmrdZ9GNrkB6w60UAERE5BDY+/aEQDPhBmISsoA2czMwcyVCAoDBAQws8E
 NL4oWqdPfwMHTdIxCT2wOR4RAkgBUIZHZsaGbj2MffARKX0Vy1KL8HUmmikZypFZzl+86OQ0DuM
 1j/hGjWGE0xvnPnfCu2iPizghyiKHhlOo9cSS4kXet714zeA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfXwMGG/cRg68ym
 0ZbcG/356F97NS6FXGKZ/Pt4wt5yQ2cNGJ5SaZUBfib6OhHAGGo/Vr+GFIKb2qCzC7TQMse06xi
 fzJyjxLZx+LDsrcTUCanR/ppFuMqiUNg9QptXZi5RHCIXUmJ/ENcQyV0XtILLQMY6VgLTfl9KMr
 ssQxn1Oqlw3eBwiFcNKCOgmH1AOe130dJ2OIWG0Ofzg8o4ndE0c5H87gp74cDZhWbhzVuZEKn3I
 kh2Q6y4te4aaIQSVrE4GACziT3fSxp2meuCAqEqgrY26jAvJAO1wuV1Av+iGb6Gcj48f28X0Piq
 OTHBe5ZWiA5uKCz3CxeOXGPfTD/HetJ04P56zvl+UKHsv/6eq2KJaz8x6DuzceeXs8x3mLzhtQG
 T3VV/Ih8fwOxRh2+CIuFJYQMQmJaVF6draGtLPUZVPseQ5f9ite5iyeSgwwjhymZ0202RRtLd8u
 l+VQfFHVfHfBp0UhaTw==
X-Proofpoint-GUID: MjY8SQWDBaDJyqQv1Bd1PjTD-0jEMEOK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfX0WnrlipL3IfT
 XHqQNXFPdDOp77pN8cA/4FujSf/sznObdFw/h4r1MhSSlyPg5X2RUkE82RGgWAx+9QDR/9JXutY
 2syZhGwMmiZI5rJ989YrjRYqPwTRBZY=
X-Proofpoint-ORIG-GUID: MjY8SQWDBaDJyqQv1Bd1PjTD-0jEMEOK
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acfabc2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FFXsBguXHA8yshPlDHEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140065

The SDM845 HDK can be fitted with the same display card as the SM8150
HDK, carrying a Truly NT36850 WQHD dual-DSI panel. Here it is powered
by the PMI8998 LAB/IBB and WLED, and it is mutually exclusive with the
on-board LT9611 HDMI bridge.

The configuration follows the vendor kernel, with the bias rails at the
5.5 V default of the LCD mode and the mode select line driven low for
the dual port mode.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../boot/dts/qcom/sdm845-hdk-display-card.dtso     | 109 +++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5be99934cf9f..85d06a950b4a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -356,6 +356,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-crosshatch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-hdk.dtb
+
+sdm845-hdk-display-card-dtbs	:= sdm845-hdk.dtb sdm845-hdk-display-card.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-hdk-display-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso b/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso
new file mode 100644
index 000000000000..1022ab096170
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Display Card kit overlay.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/dts-v1/;
+/plugin/;
+
+/* Disable HDMI bridge related nodes (mutually exclusive with the display card) */
+&lt9611_codec {
+	status = "disabled";
+};
+
+&ibb {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&lab {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "truly,wqhd60-nt36850";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l14a_1p8>;
+		avdd-supply = <&lab>;
+		avee-supply = <&ibb>;
+
+		backlight = <&pmi8998_wled>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				panel0_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				panel1_in: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&panel1_in>;
+};
+
+&pmi8998_wled {
+	qcom,num-strings = <2>;
+	qcom,external-pfet;
+
+	status = "okay";
+};
+
+&tlmm {
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.47.3

